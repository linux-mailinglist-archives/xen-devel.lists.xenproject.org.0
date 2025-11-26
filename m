Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2FC8B7B6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 19:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173341.1498394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOKbY-0002jC-IH; Wed, 26 Nov 2025 18:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173341.1498394; Wed, 26 Nov 2025 18:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOKbY-0002h9-FZ; Wed, 26 Nov 2025 18:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1173341;
 Wed, 26 Nov 2025 18:51:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOKbX-0002h3-Je
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 18:51:03 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8c12747-caf8-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 19:50:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5941.namprd03.prod.outlook.com (2603:10b6:510:34::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 18:50:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 18:50:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d8c12747-caf8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgbGdcdptSvpWIzgrTauoS8nPP+kKFxko1aoJ/oAzXv1UxeXr7exCjKiY3vX7XSruKuwxEvAhmph77GDK37bZYzEG/8P85b54tw41NnUFCM/nZ3F3uRe9pPNSuJahkoRj5EG7jawFeYwauEmQ5qvZ/J1xDXBXepCpTm6yiN+N75gLe9n10beLxL8IagVNAkgXygM2yrW21KB9OUpSL5sKABdpPfOYMwoGzx1jB/zeRrl8hMGUyiw80tfuM22GD3NIzHj9feZPWss0aiKMKSNc+oEfQrcBxNCxrnCc57DUwHUg1B30fj2uO9nVdxGBtQk/HGmpqjuDPa+bJd6Q1ztpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoRvJbywSJgXWI4WwvVAoe68OPTq7IFqIhXXUwEwflk=;
 b=HVH1XIXkAB6Brf5DDDmGA8Ay1ECwBP3nH9OuIoa4nY3Gnm31P8Ld1OFhMyG5UxyF9DhOw0bjSgv2bfzW6j1BhE5il+plf6tXG/cAiWJWsgKsSrywtzP+QllUjZL/jKLJbg+Q3QiM58B5pLQf/+3OpbTzfXyR7QY5bBn2Snf7YuGw+GuiTDaydgTqtiTBaPWRPYmxow7JJAJANbbiJY/qjt0Wfl8Byp1ieD8ynGolQSA96qnOR0Bog+Yscrp+AWtwgs8sd2lcv8W8QhzkgJyHl2OTTE3KHwXKhpx8V/h6kuikUl2p8FiLaPu/slyUf2HRpwRv6av++x4L8txl2kywSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoRvJbywSJgXWI4WwvVAoe68OPTq7IFqIhXXUwEwflk=;
 b=T2til7J+tQNsiEH3hLUDBqc0DqQ8a0yiYiNtlKePAw8uik2fY7WhOE2sPSCQsojzX27aF21aM6X8gnBBR231okzB9mNA6pYQewlpy889Amiq5FhO8ztitBr5QW4McexvLFwGztyrPkmMMk51e5VyHX9uV8IWUBBLAO/A+eUIyUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0b20af96-bfef-43b1-a22a-db85a18b849d@citrix.com>
Date: Wed, 26 Nov 2025 18:50:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] VMX: support MSR-IMM
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <1404b901-0821-4e8d-82c7-1eebd8ed4daa@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1404b901-0821-4e8d-82c7-1eebd8ed4daa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 996d1224-226e-4f13-a7b1-08de2d1cbb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzQwUWoyRzlOR2NVc1Rvd29nL3RORlhZM3VzQXBxNitzMkNIZ2ZoUFNUcHpX?=
 =?utf-8?B?OFhTSWdZdVc4dG9leFhTZkRPWnc5bVc5T1orWDZxdTRsZHNVM01WZTJCYjJo?=
 =?utf-8?B?YVArZDNReDEyZHR6bmdMVjI2aVFQUVJPRzBFb1Q5b0RFR0J2NEJmckMrUnh4?=
 =?utf-8?B?ek5OWEt3TlBXM0JobEUvbzhjYUgwZ0g5UWJJdHBsbVZPaXV1WDFwWHlhZlpE?=
 =?utf-8?B?SEdiNFFCbXh4Qk5ucGtmelVzZWk2VjlSZHhJcUJ2NjBvMm1kekh2UThqNW1Y?=
 =?utf-8?B?c3JLbUk5aHRkNTVIVjhrRTh5QUhIaVRaM29CcWs2Wk9ZbDlpdEJ6VjBtVVVr?=
 =?utf-8?B?Q2VSWHBrc2NqMDdWOU9Zc3RnWmIrN1YxTVRPMHg1RkJPOEh1WEVLeUdhY3U4?=
 =?utf-8?B?ZkJDYnorSXB0cy9WWUVsWEkrOUdpNmtvY2lIcGowanFPQXBTd05DcTIvQ2k5?=
 =?utf-8?B?SDBPWllmKysxNVZkTG1EdXZMR1g4RjFQSjl2QWtzbEo5ckFqZGVPRHJBOTJi?=
 =?utf-8?B?YmltNS9QZkNCc3JHV2tvYXM5QjRJSG0wVmFXd1BFNVJ2WkhnOUI3eEJsM3A1?=
 =?utf-8?B?NkNNWVhKSDMzbm40OVUwRGxYME9lWU1oanVoMnBKNFRtYlBMQjRPTitvWHpn?=
 =?utf-8?B?MzV1NERMa0NtOHcvTUUxWmFaMVhSZWtic0ZYRTVBTEdSL0pNN2xYTmhVUU5x?=
 =?utf-8?B?blc4SnFIVnZ0TlNHRTEwSU5QSVFhZWR6QVFadFhVZndjSWVXK2drTXZnNEJl?=
 =?utf-8?B?ZlBJeU9OUEpLTmhoNlIydW5Sa0U4T3ZBamp6S1pzNysxODl1Y3c4TVZTcGx6?=
 =?utf-8?B?UHVwbmx3YnRBMTJjc1RBVHE0cDNOdGFpelIvSGgyMjNmcWlIUlBVdzFQNURV?=
 =?utf-8?B?V1RsY1VqbGZWYlpZcWJ4My9CVW1rc1Q2NHllWUYxcGFFbDV1NzJjYnUzbnRN?=
 =?utf-8?B?YXdIWFZWbGJJRmpCekFuM3JwYjVZZVZoU3RmcGZPL2hLYXBXYXd6ME9LZlh4?=
 =?utf-8?B?K1MvZDBqUTdWVTBRS2lPQW5CTVJrSWhicjlCMnBNdWsxM0x0aUJDblFPWmRy?=
 =?utf-8?B?dVNJbUdTRHhtV2hVdS9QTGhLb2IrTkpGMjRaY0Mza0dSMWxtYTlPZWJCOVcr?=
 =?utf-8?B?Zlp1cjkvcWRTS1hWdkZJUGNER2hFRHE2L3MvbVZ6enJEUWYvdnE5bVhXU1JO?=
 =?utf-8?B?YXEvZ0F1c1pPNS85YzQxc2FNRFcxQkdiaE1IalF5aUFzQ09nZDU3UnVLWjhF?=
 =?utf-8?B?VUtiMFF0QjA5SkpacFlTOG9zbHhma0pGRlM4MFBJSWZwMWd5eW1wSnFHRktI?=
 =?utf-8?B?aUxUckZEQ2oxTE9iSlF1NHBQWERTd3A3dUY4WkxmL2lrS01kZW5XQVFmN1Ir?=
 =?utf-8?B?TUppNGl6NTJDNWwyeTE5RnNKSGFwWWY3VzNmbFBVK3p6S2t1ZElQZTdZblNU?=
 =?utf-8?B?WmpkcVJIeituS2RjRFREMjRFK2Zodzl1bE9hNU8yYzhycWVMUHFoRHBsWEl4?=
 =?utf-8?B?d1dkalA1aWtkUTRwYmUzcXlaYXBib1RzQ0JybG9hQ0t1TkpObnhXMGFobVhn?=
 =?utf-8?B?d0dya0oxZWVnSFZxWWsyRStoTlYxNEl0TmlwN2xpQnVlY0paeERpd0FGL1lm?=
 =?utf-8?B?cUc4dGVBN29wS29yTUpuZ2lGaHJCbHowa3lSTFhFSDNaVGYvWXowTGlVTjhN?=
 =?utf-8?B?K2FqQ0xPQmxPU01IZTlzY2ZYcCttUzhvR3V1U2laVmRYc1U0MzBYT2QyNzVh?=
 =?utf-8?B?L1Q3Vm1hL3VYb2JrcVozMUdKSW9na2hLV1BjZllYOUQ0M3pjZ0h0RmFjUTVh?=
 =?utf-8?B?dk80N3pUVnowOU4wZmg3ZjZEVysrdVdlZXdscWlDVWszazlLR3pDNVBhKy9Y?=
 =?utf-8?B?K0svVzYra3NwemZobzJDNVk1VGk0bnowQlJnd1BrN0l1MWROWHRrQ1Nob1hL?=
 =?utf-8?Q?4d1x/ng3dW3jq7RuRHReRqnCqtstk+cX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzBDMG92Qzcrc3VhUlZBd1MySXJHWUZaYm9GL1A1b0swVWphU2FsM1FtNE8z?=
 =?utf-8?B?UzBDTmpId0NENU5VT1c0cHlscktLWXl2Z0svRVpWWU92aDNxTXZleE9OMmo3?=
 =?utf-8?B?WmUxMUo2NzZSQmh6S2g4ZmVVdG5HY2ZOZHV5UVNROG9kQVJVK1dkZmdHSWd2?=
 =?utf-8?B?MjJVcTZ3d3pVMnNBTUhNR2xxeVkvcmhyUzJNVDR2Uk5xL0dibFlhMEs4RXdM?=
 =?utf-8?B?enV1Tm5KQlhlUGxOVnZLQUlxdGNpV3NaZEJzZjdDN2Z5T3NpWE5sbWM2S2JF?=
 =?utf-8?B?dy9xV3BnWnZ1NTBORjJlV0ladmg4YWsvU3pJb3hVZ3JPR3F6bGxOT1o2VWVQ?=
 =?utf-8?B?RndGN3ZEL0tPSWEvcjYxUGQ4K1RGcThiUldncDBxeW1IcDZmOHA5MTk3ZG15?=
 =?utf-8?B?Ykk3L3VqKzFtSTBCOGVJWEVHandDc2FVSEpnMDdDbXlVRlJGRHpmWHpJSjR3?=
 =?utf-8?B?ckJFd3E1L282ZW5udzBWdW9telBxV2FGUnVYaXJRUGtXUmQwTjlGS3ByZVZj?=
 =?utf-8?B?dEM3d1N6ZkRVU3FEZDUvMFJRanhKTG4yS01oVFhoQml4TjZmVVB6Y2pTSXRG?=
 =?utf-8?B?QUptYlhpN0lIckVEb3dybW0rOVlSaG02Y2hmNDZ5bjQ3WnUxdFoxVU5nSWlR?=
 =?utf-8?B?SFRNM1RHMjBRblJSZy9JTnUzeTZVajhVV0QxR1FoZmZBSDNLMEJVWmxjMnBq?=
 =?utf-8?B?UTBnbVQvQllhckdocW9rdFA5ZkVNTm1ETXlJOGFndll4aUJLci90WVRiUGFu?=
 =?utf-8?B?UmZaQnB5bERMYWcrM011NlFlZ0h1RDhTVTZGSmFlVkhaalRmZGdnT3Z3T3BX?=
 =?utf-8?B?YXRJNEs4dmJoaHU4M25RZ2FqQmxJbUNNT3BPS21hb240cnl0STZTTHJsKzFJ?=
 =?utf-8?B?TU1MYlhrbjFwbXRSNzNPMHZhNUlQQk14UGw1aXU2OUJGSS94THErZ09WeEtO?=
 =?utf-8?B?K3d0ejBjSDUrSSs2QXNKZlZoK0RyZE1mN0xwZU5tbk82U0x0Z3VIR1RmeTlw?=
 =?utf-8?B?YjlPdWZmYnZhL0JKZlRMVTQwcnlqL1F2eGgvblF6Z24wazhRM1lscEswemt3?=
 =?utf-8?B?NjBaZ1lwbFlmZ1ZFeWJxbVFPZG12a1hqOStzZW50bEJ2eUlLaXB5MmRQZDZq?=
 =?utf-8?B?QWVaNVIvMEg2eU1KZWU0eVpldEM3ZFV4clRNSTF6SUhuSkNtTXNMMklpL2NL?=
 =?utf-8?B?OE51WStmSE5mTDhndVMzeGZzNEJDZ2FOR3V5T3NkQzc2aWlBMjAwTjRSZFMr?=
 =?utf-8?B?cmxSU28wZE1WYktkd09seWEzTFpuM3h4QzN1MXZib1orNkg5RUJIZkNuaVEv?=
 =?utf-8?B?Z0pFM0lRQW9KMGZuY29nZDZRY0h3QjNPaEJMaTBWNEpZMXBVZWRhQm9lYkpj?=
 =?utf-8?B?OTRLczhQcDJlZmhFaldKaVdEd3hqdi9tcWhYZ01uVlZWeFE4R3N2NDg5WHI4?=
 =?utf-8?B?ZHBhR3JMZ3F3TEJqdElvNWpIMHZjQlpvSHk1NHVBV09uTlRWVERpUmpVR3hs?=
 =?utf-8?B?YWJ0SkhsSGJ5ejIyQW8xREhGcTlKcHBBS05QWXN4VlV2WTljTWx6Zm8yNkd1?=
 =?utf-8?B?WjVxRnFySVE0dHJyU3o2ZEVxdzFmTFRoaUhpVE1USkdST2l5Qjd0ZVNVSXdF?=
 =?utf-8?B?N1dHdkVMRUppSTVGQjZCendmcHNDeXRDUzB4WXNjaUhjNnRxMGcxTGo2aGJM?=
 =?utf-8?B?TWkzUGVVaDQ4ZnZjWTJJNnlVdE5oNDNzRStMVzNVMjNPNzd3TXlEeVBhdDR0?=
 =?utf-8?B?ZW5lSURONTJ5QklubUIrMGRGMW5URHp6K3UweUxZVTJIejcxZCs2bGZicnN2?=
 =?utf-8?B?TFd6eEN4cXJYbE56TlVlSG1zREY1UDBFalFYbHArc05JdjFuT1dmd0pKSzZp?=
 =?utf-8?B?TlBWRk5rbmZXeHZRa0Z6cFhDS2tmc1NOdHA3bHdFM2RJdGNFWUV2Q3ltdWxQ?=
 =?utf-8?B?MDdzVkE5YTVkRzdSRHB3T09oUTdSNjNuQUJiVE1KU043NEJuN3FpZmU2NjN4?=
 =?utf-8?B?VldodGpESUdVU0JEQ0E4K0dYY2VSZFlTaEtvbXdtVEc2Q01GUno3cjZESTJp?=
 =?utf-8?B?YldWU1Fiamxobk9zdloraG0xWjhtRXR2R1E3OXRzc1BtQVlpUjN6R2xnV1hJ?=
 =?utf-8?B?aVU2NndFK0M3bUNZeTVSYzk4aW9HeTV6aG1wYmp1aXV3bFM0U2Ryekcwazl4?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996d1224-226e-4f13-a7b1-08de2d1cbb0f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:50:55.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWRnzkf/1cHKkHgAWceC2MPgPyTL79DlbPzLunODwdEU0L85Ct4aHNiZmfsJuEYisggPpLSejp9mmGJQcVKk/7B/YUjXXlikAMdYl9nVkLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5941

On 24/11/2025 3:00 pm, Jan Beulich wrote:
> Hook up the new VM exit codes and handle guest uses of the insns.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v9: New.
> ---
> The lack of an enable bit is concerning; at least for the nested case
> that's a security issue afaict (when L0 isn't aware of the insns, or more
> specifically the exit codes).

This is why we need support statements of new CPUs.

Intel say that unknown VMExits turning into #UD is the expected course
of action.  That covers all of these cases which don't have an explicit
enable.

This is better than our current behaviour, which is non-architectural
for supervisor code and practically the most unhelpful course of action
going.

Obviously, logic turning on a new feature is expected to handle all the
VMExit cases it can produce.

The corollary for nested virt is that L0 must never make a Virtual
VMExit with case that isn't enabled.  Combined with #UD in the unknown
case, that covers things reasonably well.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -453,7 +453,7 @@ void domain_cpu_policy_changed(struct do
>      }
>  
>      /* Nested doesn't have the necessary processing, yet. */
> -    if ( nestedhvm_enabled(d) && p->feat.user_msr )
> +    if ( nestedhvm_enabled(d) && (p->feat.user_msr || p->feat.msr_imm) )
>          return /* -EINVAL */;

What processing is missing?  (Aside from correcting the unknown case.)

>  
>      for_each_vcpu ( d, v )
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4762,6 +4762,7 @@ void asmlinkage vmx_vmexit_handler(struc
>          break;
>  
>      case EXIT_REASON_URDMSR:
> +    case EXIT_REASON_RDMSR_IMM:

Instructions which aren't enumerated in CPUID have reserved behaviour.

The exit handler needs to check cp->feat.msr_imm and inject #UD.

It's not perfect; un-intercepted MSRs will happen to execute correctly
on capable hardware, but most MSRs are not intercepted and it's far
closer to adequate behaviour than omitting the #UD check.

~Andrew

