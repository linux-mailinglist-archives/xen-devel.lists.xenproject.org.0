Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34140AE85ED
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024961.1400718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQul-0003Lq-KA; Wed, 25 Jun 2025 14:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024961.1400718; Wed, 25 Jun 2025 14:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQul-0003JF-HN; Wed, 25 Jun 2025 14:15:51 +0000
Received: by outflank-mailman (input) for mailman id 1024961;
 Wed, 25 Jun 2025 14:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GTF=ZI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uUQuj-0003J6-KA
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:15:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2414::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2c2eab5-51ce-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:15:47 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Wed, 25 Jun 2025 14:15:42 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 14:15:42 +0000
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
X-Inumbo-ID: e2c2eab5-51ce-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/jtHwp2ltemq7fKVS9aCx3NakRwA8j/mAgTQQlRunvX41vX9eIS6JSQzYwyKkHTAfQo6EUgzKFY4lArKYMjYv+LU2eJRP13kmfnc6OeB39bpEC3/0PTCRyZ2A+VSlSaPDrkRzDWKLl7w2UD23XKv6HtFc3FGwejKCvJo0Cel6aA7DPQv4B9fOhlKqc2N+zz0L1QWR3VwqhPNykstv2X70UmTYn4j2cTm28pp2VXRw1jhD7yxg2qzcK1luEo/qbrt5H/Kj9ayguJUlr8QNNl1gt6QGvhtWrlRBLNEFPPNA7p4jLSASzKrpKOk9ZilJvsVN+30lD0DBqnr7LeFjLwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYgPdWRnj0mClzlnmlH/ZXSxxYpCMH3YEgd7+AiGMKI=;
 b=IggMYjkk7fRiKdeQ9IJZR/S6gclS1UrT+G/7VD5KB+IDsbW0JccFfwxOASmhyN/pfJhG6revEAYVnE03Xffm3g+ibrG1wtfb+VAkuaPiHOZtEfZEz3mhH5B34x7Gu+MOROw7pOh44jwpXwYig0TxlQyPS5eTf7/WS+bshRuUyC+LX2XFQbuC6i9DrrYbdguLCegfIbn7azkmyqhEkoAjnmzVK8tbgKxzbKrmg9uNrPjPWi4xfRZSBB7pXi49gYQFDE685JaIBvLp3CTK9JZM/ZqZc91rC/Jq43G/l+5988okQUZi6rbAOwFWzXpreLTISroGlC5hZDNEZKaEmsa5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYgPdWRnj0mClzlnmlH/ZXSxxYpCMH3YEgd7+AiGMKI=;
 b=n2xGXEO6xJUwTwApL5SxXMhTp8XzqyxD/B1A5akExb15zt/gj1z33sOSI+uxrgjqAxQH2FK3w72KLrpuuQlEEZQX4LFEwFdjlacY3BuZSzBrqp0i1NSfkTdCsgQic1ufJ0aKWX3ZnfxKzXuztI3icCJLPY1aTGbQqZCXGlhfXhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a9a3faf5-c7f4-4c4f-bdcf-4764c81ed720@amd.com>
Date: Wed, 25 Jun 2025 15:15:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <840ec219278c2fcb4f8592303eb671b5271b0a95.1750411205.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <840ec219278c2fcb4f8592303eb671b5271b0a95.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::10) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ff1683-6f25-4b09-56de-08ddb3f2c48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTdoa2dQOGVuRzZadWhVRzIrclZIOEVnc2QyTkY3VXRqSW9MUXM2L1ZzQjJo?=
 =?utf-8?B?Qzl5ak95UHhNTTd6TUx4UHpNQ3FmQlNiNnB6YmdmKzRUbko5NWYxNmdOU1hD?=
 =?utf-8?B?YTJZYVJMdGgzZGVSUm91YXVlbzNqK0R2bitDQ0JibHZ3TEIybmhHV2lSZ3JB?=
 =?utf-8?B?bEVHNENZY0lGU1BzQ2lKNzZUb3ZSaUhXT093WWlQTGh1UkNucmVzTDVneWhG?=
 =?utf-8?B?WXpmVGJSZWRVNXV1Zm1mV1JYT01NQmthZCtNLzJxQ0ZhUW0rRDNYUThJcENM?=
 =?utf-8?B?bXdPaXRITURuSkNTUEVYblN4MWVFU3dFZ29USlJxZDNLdDZrSWR1NEtHUjRr?=
 =?utf-8?B?dmZmMXdrL29HKzRSV2Vpalp0SCs3RlRzQndTZjlOWTdlNTlHWXQ2NlZGZU9N?=
 =?utf-8?B?dWFSZCtSd2dpcnVFRXRDdDdaWTNPWVlTeU5pbVhJSWxicDl3cUtzalc2TjVT?=
 =?utf-8?B?cmNJNzNUbk1OcUF5a3VVVGtJZmU0ZXlDR2NoWEp1NjQzY3l6bGZhVjdkanpu?=
 =?utf-8?B?MTJKNEVuTW1zQlVQWHl0NjQrSFV5NWpsSjNQUWxnUWprVE5sM3lpMExkY1Bw?=
 =?utf-8?B?VmplbDBsSTZZdXBFbGpHZ05pQ1hZOXcrMUFKQWgzbDBkWXVYVUVQME9aTTcw?=
 =?utf-8?B?LzZ4bXRoUmpkNFAxdUVMRnhBTExhdFZBa3lzYmt1MndNRGpJcGxBaU9qTCtZ?=
 =?utf-8?B?VnB0TkIxaXltdFVjcmJkeGh4dy9zemZXOTdFKzJDUkVPeXdEdWJyRllqM1BT?=
 =?utf-8?B?SW9CT0tLeXN3Mk41cDRwWnMxSGpUY1NGeGt3WGd6YW55STR2OW1LOGJxWlNG?=
 =?utf-8?B?QkF0T09tSWpUL2U3TkNFb0J4aUtFcDJtUFAxbVhObWNtUGthMXlhaDdnc0lX?=
 =?utf-8?B?ZWEybFlPZmJFMWwzQWNnSGNXdHlGNDVQNWsrSW90bTEwd09jWk5sdTBzTE53?=
 =?utf-8?B?a29DOHlwb2x3MDdTK3JwalBaUzFpYmFhR1VKNkZ1TnlLRHZyb05lYUNtK0RR?=
 =?utf-8?B?NElpblAzcHBxaVl2aXRSYXY5YTVnSWJLOXVsNmdNWU80OHlsc3NqRHNjb0lx?=
 =?utf-8?B?VEhyV29jZVVFaCtIa3IvNjlUYURWREdzcDNjVE5sSHRhQzBoblpzWUdNOUFR?=
 =?utf-8?B?cDQyZkxaRWV4NkhqTnRRUmdNS2VCSkJTWnNQblFtNUs0dC9jb1NHcURIYTR0?=
 =?utf-8?B?TVNubnBRTVJldEtXbjJOSklza3JVWlVJU2M5QVMvRURveEt2SnFJdTFPT0dL?=
 =?utf-8?B?UU1BV1d5b0lyRzNjWHdyYXd0YkhhQzhFemxxb0U1WWYyMzZVUE45Y01LV29l?=
 =?utf-8?B?a2NNenlhemdzbmxkMUV2OXhic2pMNkhJUjVFYmNKcjBmQndheGNmYWZiZ2hw?=
 =?utf-8?B?N2kyRGI2NnR4UDh3a2dxT1dTdFRta2t5bnY4S1JhRGhRMnVuRDE2cEFqM1hS?=
 =?utf-8?B?a3Fxb0R4TjZVNzQ0MEZWV1REc3hnUWpTZFl1YVNGaFh5Y2s1Z0FlUWJOcTVi?=
 =?utf-8?B?cC96OCtBeHRTNStuWDFXTlk1R3ZEdFdHYkhHZ2VFTVZMcktlM3V4Z0c0WnNK?=
 =?utf-8?B?cFdsb0RySFVYanlwaGhKOWVnbXVwbVAwZ1NHajVZN2pEdk1XMUluMUlXWVBZ?=
 =?utf-8?B?MUdZTSt2M01UM2VVaGMrV0VZVW55anVmeXlyRDdjL1dvdXduYVBWMlVsTFV5?=
 =?utf-8?B?RWcyb1pydVRGU0xETGp3U09WcmtVSU1KRkp2ZWN1K0lDZ0k2WExNZWl5T3Fp?=
 =?utf-8?B?dGVMZ2hlTFI2ODdrNk82N0tBaC9ud0wxUXM2YldNZVFRNDljOTlZUEJnb2dZ?=
 =?utf-8?B?ckZvUEs0U1N2ZEZmQUpqS0tJTU94dlkzTElyYzVJY0tkR2tQeDJVVG9XWHEv?=
 =?utf-8?B?clQ2RWxYcW1USGlOOUFibHBRZ0xScWphbmRJbnJrOXF4VCtwZE5pdGxjUVIy?=
 =?utf-8?Q?o8bSoTasp0M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckxwekg2SXc0Y1lJZDdyWUNOMVhYLzRmSUhkekdmdGUwcFpQaFI2b25rRFZI?=
 =?utf-8?B?RTRwRk5nSGNDdGFqcHJGYWJsdnIzQjdrS1FQcEZlZ1ErVjlGWHBDMjdodHNk?=
 =?utf-8?B?R09lUUdCMEhaNDF2enJmNWQ0VjgwbXEzcjNFSHRrQUthUG1CV3h5SUxQZWdZ?=
 =?utf-8?B?WFUzeWY2UFlMaW96dUtNME9MdGVYNVpmZjVNQnlCSDZSbEdLUTgyM0FsT0Zi?=
 =?utf-8?B?MXd0MFRIdm40Z1l3UXNHUXFnd1djeUlqUFVMT2dwWmdFVUJKYktGM0hWVzlu?=
 =?utf-8?B?SVdwUElNUDA1VUwzYlV5TEd2OVdGdS8zNndYeTBjMmdobzNNN3NwZEpwWWV6?=
 =?utf-8?B?N0FPOE9GZWNqcUpSWjhsQmVKU1J3THFDSm50ODJIa2FmTTM1UEx5TW9qc2tC?=
 =?utf-8?B?T3ozMnhTQnp3cXhJb2lncWdjU1FxajB4dDFiSlJwalE2TGloLzRjN3UwanB2?=
 =?utf-8?B?dStCQnd5STNyMlpWeGNIaGRpQXdEQk14OWY5bU1IUjVQZnRwYlpvWlltVHBs?=
 =?utf-8?B?U0NNTEVsSm5WM1FobG13TGtXUWVjelJxSm1yQy9mK0JTcCtDNXdwdERoNTlq?=
 =?utf-8?B?UkhmM3E1TUZnY1B4MXg5ZXBUMlhoOVBWNlp6OGtWS2JEa3k5dW9KR0RyMFJT?=
 =?utf-8?B?TG9wVmtMbHhBKzdXWkJjeWY1UWFWOUVDUmhNOXR3K0d0STBmRSs5c2xDbFdU?=
 =?utf-8?B?dkR3VUZQMmJpYnlkL043V3h3OTFGd3FiNlJBQkRaOTZPYlZVR0RHTWs3OTBR?=
 =?utf-8?B?RnRTUitYSFBiZzdrYjd5THc0d2xNRFFTd0FKbWxqMGxsWUoxaStrRzB3NWh0?=
 =?utf-8?B?MDExd2ViNkxSdU16YXhYamtIK2JMd0g2S1RZNHdYVzlvS0JpcXZQcjlHOXhG?=
 =?utf-8?B?SklBODFzSFhUWmFmQWJtektvcmxqNFpiKys0bEJGRVk4N3E0VVkxdTM2TkVo?=
 =?utf-8?B?blRud1N3aXZXa0NKUHRVbXNDYytkLzMyWkNtcFRMVmVGcnFNdmRvczlobjFU?=
 =?utf-8?B?VzhlcnRiU3VNaElyTGdkd1FLbG5mYjNVS1VBYUtGS0hhZXB5SUdvSDFEeVl5?=
 =?utf-8?B?WmVvdWdHcEpTUW4xL1dKalNHdU1sblduV0M3L2k1UUdDM01JTTZtM2t4VGtQ?=
 =?utf-8?B?YVdJdGtkUmZlZDc2Q3VINTFFVjhCWEZpMGdVQTk0eXpFQWJOak5VMlU1cnhn?=
 =?utf-8?B?ZllRdzV5ZTUxZ3I4ZzFzQ3Y0TXM0akpkV2dNWHR4VEp5QTFqU1VSRTRMWUZB?=
 =?utf-8?B?R2VQV2pKSlhXaHQzMkdPa1h6dGZ5RDFkZjRGRDc2b1hEa2FVNlpoMTYyQkdZ?=
 =?utf-8?B?dTBVa0JaaUpnZ2czdG5Hd0VCN3VYL3ZpUDF5dkptWERTOGJhazdMQllGK2hO?=
 =?utf-8?B?eVZGL21MWnl3Yk9HMFN6OUE3WEQzVkttMXMxNnhSZFRvS0xjQkRTVkhPd2dt?=
 =?utf-8?B?MlRidjdqb1BCUDRjMTdZZUdXMWgwMklxVnU3cXBGQWVDSXl2UWdCM25Ocy9i?=
 =?utf-8?B?TDkyNWtMOWtJLzZmMTVidjhKTUU1Mk0wZ3RuSmxxOS93SEVhZFVPUU1jWXVz?=
 =?utf-8?B?SjY1TGRRUkVVeEw1OFIyVTQ3VS8raE9GWWE2M01mK1FkS1p4ZG1OTXhmM1Z4?=
 =?utf-8?B?RFF2YVJRTTVpRDZyanh3WWxHaDNncnBqcW55NGxnNXNKd1oxMjBGSnBENWU1?=
 =?utf-8?B?MWo0SC9pc2NybGx4bXF6K0x6cm51cFJQcE40a0ZwQmdza1RmbVB3ZndJSWhK?=
 =?utf-8?B?RWxoUXl3QkJLOGp1ZmdmNFhEUTdHVzRBclFPSTREVHNoV1ZDdThmdkZMaVVK?=
 =?utf-8?B?TFJsMitXSERaSGVwWHNRTjdSM1B6VmhrcGFUb2hIOEIzTFl5dGxuTVlwYm04?=
 =?utf-8?B?T1RzRjg5YkEyVktid1UzQmJyVjlEYUtjNUlHUzBUcEdoenljUDdKOXBzaS8x?=
 =?utf-8?B?a1NYb2tTQlBJT251TUtZZzFrWlNWVFhxeHFMVlVKd1hrN1A3azZKWkRtU2tN?=
 =?utf-8?B?dUhqS1BKWTgyMUI1UnNEdCt6cUlTWlcrc0xtWTdIUVNtK1dZa21veU02YTRw?=
 =?utf-8?B?eXVnTWY3THNMd1RlNHFsNUhRRGlhNE1ZTFVseXFQeXkxV0dxUlg3RjV6WHZI?=
 =?utf-8?Q?ANCNNiwsKQJ+tXf9fC16qU4o5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ff1683-6f25-4b09-56de-08ddb3f2c48a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:15:42.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PeCl8+ITDqDQgRGmGTHTBi1F+DbNOmQJ0dM0YnCIS22FHHJmovN5ej2pwy25TogP1hZ8sehcbmI529kNec7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866

Hi Hari,

Some questions.

On 20/06/2025 10:49, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> Introduce map_pages_to_xen() that is implemented using a new helper,
> xen_mpumap_update(), which is responsible for updating Xen MPU memory
> mapping table(xen_mpumap), including creating a new entry, updating
> or destroying an existing one, it is equivalent to xen_pt_update in MMU.
>
> This commit only implements populating a new entry in Xen MPU memory mapping
> table(xen_mpumap).
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>   xen/arch/arm/include/asm/mpu/mm.h | 12 ++++
>   xen/arch/arm/mpu/mm.c             | 96 +++++++++++++++++++++++++++++++
>   2 files changed, 108 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index a0f0d86d4a..f0f41db210 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -64,6 +64,7 @@ static inline void context_sync_mpu(void)
>    * The following API requires context_sync_mpu() after being used to modify MPU
>    * regions:
>    *  - write_protection_region
> + *  - xen_mpumap_update
>    */
>
>   /* Reads the MPU region (into @pr_read) with index @sel from the HW */
> @@ -72,6 +73,17 @@ void read_protection_region(pr_t *pr_read, uint8_t sel);
>   /* Writes the MPU region (from @pr_write) with index @sel to the HW */
>   void write_protection_region(const pr_t *pr_write, uint8_t sel);
>
> +/*
> + * Maps an address range into the MPU data structure and updates the HW.
> + * Equivalent to xen_pt_update in an MMU system.
> + *
> + * @param base      Base address of the range to map (inclusive).
> + * @param limit     Limit address of the range to map (exclusive).
> + * @param flags     Flags for the memory range to map.
> + * @return          0 on success, negative on error.
> + */
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
> +
>   /*
>    * Creates a pr_t structure describing a protection region.
>    *
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 15197339b1..1de28d2120 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -6,6 +6,7 @@
>   #include <xen/lib.h>
>   #include <xen/mm.h>
>   #include <xen/sizes.h>
> +#include <xen/spinlock.h>
>   #include <xen/types.h>
>   #include <asm/mpu.h>
>   #include <asm/mpu/mm.h>
> @@ -41,6 +42,8 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>   /* EL2 Xen MPU memory region mapping table. */
>   pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
>
> +static DEFINE_SPINLOCK(xen_mpumap_lock);
> +
>   static void __init __maybe_unused build_assertions(void)
>   {
>       /*
> @@ -176,6 +179,99 @@ int mpumap_contain_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>       return MPUMAP_REGION_NOTFOUND;
>   }
>
> +/*
> + * Allocate a new free EL2 MPU memory region, based on bitmap xen_mpumap_mask.
> + * @param idx   Set to the index of the allocated EL2 MPU region on success.
> + * @return      0 on success, otherwise -ENOENT on failure.
> + */
> +static int xen_mpumap_alloc_entry(uint8_t *idx)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    *idx = find_first_zero_bit(xen_mpumap_mask, max_mpu_regions);
> +    if ( *idx == max_mpu_regions )
> +    {
> +        printk(XENLOG_ERR "mpu: EL2 MPU memory region mapping pool exhausted\n");
> +        return -ENOENT;
> +    }
> +
> +    set_bit(*idx, xen_mpumap_mask);
> +    return 0;
> +}
> +
> +/*
> + * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
> + * given memory range and flags, creating one if none exists.
> + *
> + * @param base  Base address (inclusive).
> + * @param limit Limit address (exclusive).
> + * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
> + * @return      0 on success, otherwise negative on error.
> + */
> +static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
> +                                   unsigned int flags)
> +{
> +    uint8_t idx;
> +    int rc;
> +
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    rc = mpumap_contain_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> +    if ( (rc < 0) || (rc > MPUMAP_REGION_NOTFOUND) )
if ( !(rc == MPUMAP_REGION_NOTFOUND) ) <<-- Does it read better ?
> +        return -EINVAL;
> +
> +    /* We are inserting a mapping => Create new region. */
> +    if ( flags & _PAGE_PRESENT )

Why do we need to check for this flag ? Or where have we set it.

If we have reached here, doesn't it mean that the region does not exist. 
So we need to create one.

> +    {
> +        rc = xen_mpumap_alloc_entry(&idx);
> +        if ( rc )
> +            return -ENOENT;
> +
> +        xen_mpumap[idx] = pr_of_addr(base, limit, flags);
> +
> +        write_protection_region(&xen_mpumap[idx], idx);
> +    }
> +
> +    return 0;
> +}
> +
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    int rc;
> +
> +    if ( flags_has_rwx(flags) )
> +    {
> +        region_printk("Mappings should not be both Writeable and Executable\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
> +    {
> +        region_printk("base address 0x%"PRIpaddr", or limit address 0x%"PRIpaddr" is not page aligned\n",
> +                      base, limit);
> +        return -EINVAL;
> +    }
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = xen_mpumap_update_entry(base, limit, flags);
> +
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return rc;
> +}
> +
> +int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    int rc = xen_mpumap_update(mfn_to_maddr(mfn),
> +                               mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
> +    if ( !rc )
> +        context_sync_mpu();
> +
> +    return rc;
> +}
> +
>   void __init setup_mm(void)
>   {
>       BUG_ON("unimplemented");

Rest look good to me.

- Ayan

> --
> 2.34.1
>
>

