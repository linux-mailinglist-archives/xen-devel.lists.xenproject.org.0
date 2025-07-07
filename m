Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE76AFAD8E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 09:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035270.1407492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgZu-0003ew-O5; Mon, 07 Jul 2025 07:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035270.1407492; Mon, 07 Jul 2025 07:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgZu-0003cz-LF; Mon, 07 Jul 2025 07:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1035270;
 Mon, 07 Jul 2025 07:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C52b=ZU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uYgZt-0003ct-8O
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 07:47:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf63d53-5b06-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 09:47:51 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 07:47:45 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 07:47:44 +0000
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
X-Inumbo-ID: adf63d53-5b06-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrIrDlv3jvcHhGKjCI2ivAHKJbDq5ldY55WRCUJ6kgoi3NJmVum4H8GTeMvkTnkS8TfLBsDmpd47T2Ap5/lHkT8RqZf66tdFi273fXwmexwFuU9pLr9KFBfxc3wI7h7HGGyy4Zg+b7O5fCUfPpdG0j6rfXc+KIB75i9y4B4f1gvfVGsxBKa+XKQUQr4UR3y08tkvFkb9MA8vI/5pbyQFnG9Ufqu/JO+JpBKN66S00SzpN1mp5oQcv9VxoMQTXrlX74HhdfFmh3ACfB5bCK0LxXX9wjVCYJz/t6LE8Cx8Y7lEzlrpufKoPj5Jei+87GpQxDEgd83eyqbR+rpGkch+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/ma3ghPtFIuLAVgzvFQt0x9lIB8S9+o1bj/dktAF/I=;
 b=APM3fU7oGYfD1KstEpTvVmZFl3qXGRAusiIUhFn3TxW1jetTcWuFDzTB9jr6DX9QoK/Q5RwIAA/ZsdHQY0H/Nw1+yJD5veNVD1UIRbvxHJNw02+Ys8q7Ms9KrdoTEdYv/Ea4duFvAB1xiQwZzYa96R0uCxwwOEunvLssDYtByfCS9TM+nvDh6bNWhD139fxpLep1gbrqCllPJfCw/K/BCxVAxpQY84jy+E2hVV7EKzNToV7Aq/yrBiZ54Q5H2W7UehFzdmB83BDF4BEeSshS4vMDvgj++uQbBNaTJ0vFJe9qlhA33fCC0vIgTdXwPQZSZO2g0BXqILlhsE6XZe64kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/ma3ghPtFIuLAVgzvFQt0x9lIB8S9+o1bj/dktAF/I=;
 b=UT72gJgxrFTbrIA/Lj6NKlV0cDZGPP01kqD1g7NVQcuJf5L5QX7hybahgRSfKtmJEMAN0Jo8SnSoHLr5ifvHF+4KUxmVdaOosu9ge81LFKz7q5yk8l0PLaVvsS88K6zmNcEcZTDbZZGxJH02K9SxmmGpFuKs1R1Aby57CY3S+xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <81f08866-ed4a-4bfa-a643-b825db1949ab@amd.com>
Date: Mon, 7 Jul 2025 09:47:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] arm/mpu: Find MPU region by range
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <a78ce013dcf68a79955653751953e023af112849.1751464757.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a78ce013dcf68a79955653751953e023af112849.1751464757.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: f6288fd1-217e-4db4-83f6-08ddbd2a8f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0c4bW5QY1NrNnRPVHQ5ZzNLZEdSUVdFanBzV0VDczdFclFHVzBwOVVqU3Nw?=
 =?utf-8?B?enVtT3UwalUyTVJwbGlPTnV4ZVNRb05mTlA5NEdsdUlZUCtFZUpzWWxpNm9y?=
 =?utf-8?B?OFBjNEJBYjNmRnltdU9DWjE2ZFBXRnZSZVFrV1gzdnRFZ2hIRWdYb1JPWmRv?=
 =?utf-8?B?c2VaZ0ZjT3BKd0QrRW54RWZwaXdxZlVyemcrMVloOTVCVDMrc0hQV0tUSHh4?=
 =?utf-8?B?bDV4MkljWGNyTURZTlpNdWlmM2hZQ3FrNTlYamZWRE1uckQ1bFNIaVlkSmZk?=
 =?utf-8?B?a1BmOFRyTWhveFpIODhNeVVoaG9rUWtuTnMvcnU2V2dtZ3JDby9iSFFBeHZk?=
 =?utf-8?B?MGg4WXczTm0vdmVvYkNDN05yR2ZSaS9NOU4rbDVSaFBCd1hPZWpGSUxEeEh3?=
 =?utf-8?B?aGhzbEhMRkdLUGRiYVVGWjA2UC84djc5dDI0WjR3c2liOXRxVTNDL0kvU2g0?=
 =?utf-8?B?SzVIZWNBNzRvWlR1RzgwRFNteC9vaEpPckR5c0ZzNnZ1WkRham9qdmZOMmwx?=
 =?utf-8?B?V0g3S3pNQ1V0a094TitjM0pLMEdIVCswUlhZbE92OTkxK3hBc1JkWkVTZTJK?=
 =?utf-8?B?NVowY3ZHbkpFSE5OVnlaVjc4bUtFTlVDSjRnTFhtb1NZS1JHZ2Q4Uk5yejdS?=
 =?utf-8?B?Q1dHdi9pMWpQdjNzeWNrWnBLQy8wcklVVlFmdzgzazhnR2hqWllOanJHQXhZ?=
 =?utf-8?B?U2hyT3JBOTJYeXNnUjFlWFRZYVJyV05CYytKMDUrWUhjNEI0WjdpUE5Rakg5?=
 =?utf-8?B?Ynl0SVpmcDNrNVlWMjN1b25iekR0Z2MxeEFvT2w0ckwwTFlEeEJxQjJHMHZl?=
 =?utf-8?B?anlidGlYb0pqRldMbkpXdHVQVkdXcnNMamxrVFk0a280VXdnei9pZXhVZTNi?=
 =?utf-8?B?U1YxdHF0dlN6WjIyWG01N2p0ZnNUZFZ6eHdXdkhpOUNGa3ZiQzRobkZyZ0dJ?=
 =?utf-8?B?S08vL1lCZWxuVi9SZDY2dWRPc3liS2MwMjR5eUlWS25jaVh5bEhiTDhoTSt5?=
 =?utf-8?B?MGZOOTB6OUkvQjBvbU5iYTZDSE9TbFNiRExIT0V0cDc3ZWtPcCtOMXhtcGJx?=
 =?utf-8?B?MVNuQ3dpaHl1MGQ1ZkhuaE1MZ1U0TzRURXplZzhjSzVrRFA5NXJqakFPWmlq?=
 =?utf-8?B?eFBhUG1icWZGbkdQTzhGaTlwamcvMWFGNGFpbE5kcVJBdkpqbDZFU05IUHJP?=
 =?utf-8?B?MlhZVDRXb3Yyc2kxbnJyS2pRREQ2MWkyaEhPTFEyRktBcmlsaXR2NWR5WUVC?=
 =?utf-8?B?cFZDUUJkalBoSitUZkVEOGRiWWxVNEJ2d2hNL01kbmljQlZGZTAzcnduQWYy?=
 =?utf-8?B?STVvVU9xd0xpQlM1Zkl1Njh0MU9wUURvZFNNWGNlREdDZzRmQndIUFM0S044?=
 =?utf-8?B?bnJVc3Rsa3pMdXVqK2tuTUFrci8wUGdUUVhOSk5yRjBRaGhhN21mRFF4aXpa?=
 =?utf-8?B?NFNNK01DdXc3SGhVR1ZCeTl3QlBUZ2hQVFN2cVJkUUJMWkNDVlljaHhQWnBx?=
 =?utf-8?B?c2RDeEFma1FKQ0lEWTQrc1BWVStvdEcvOWM1SjFTUHBEY28rQXhNdkN4MHE5?=
 =?utf-8?B?M25GK0xZVjVackJRSE1SYm51OHM4dytST0tFMG5pK09kR1p2c09wNXVoOFdR?=
 =?utf-8?B?R1d3M3lmY3cwNmVWV0JhbEdpQlZkOUVpUGFkQS9icDY5RDJpRUYvVXlJTVFw?=
 =?utf-8?B?YTRhSnM3MDhsQzVzb0J0dExHSDBKT0Rsb0QyaGtWeXZDd09mc1l6aC9pUkZ2?=
 =?utf-8?B?aEJXRGhLMEd0Z3VXdTVwRlR5UWFRdW9xRTltSlJvY2o5SEVBejB3RkJUKzR3?=
 =?utf-8?B?TzFGYkhJWndUNVV1UmVic25kY2NSNmlvdC90ekxMZHU5MkVpb3hvZTllOEhG?=
 =?utf-8?B?Tko5c2VJemR3VUp1YitrL1VmWkFwMlpwT1FIVkNEVFN3dkhQMm5Vanh5d1NR?=
 =?utf-8?Q?txVjH5Xzydg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVsZms4NVVURGdVQkpsYkwzbUlKTUd1Mk00cE1xNnFoQTFBQXZRbTRZRnlQ?=
 =?utf-8?B?THYyeER2VXdwb0lnRm1QbnJ4OHZKYk9PMytLOUI2K2xZbFcyRGdEMnNScll4?=
 =?utf-8?B?SDNmRnRkSm9JTFVtOHAySExqRGRwd3pJNFBlN0l3ZHdmSjRmZnVpL1BpL28z?=
 =?utf-8?B?eHZaVXJYZUZvSW9kV0VPK3dWQVlFUlZUeFpZTURySjk5M013R1JSMXRHc05C?=
 =?utf-8?B?SEViRjB0SlUwYXFvZGpobzQza2VQZjNyeGsyTVBGd0hmaXpSUW9KREVmNm1K?=
 =?utf-8?B?RE1MUU5RaHF5dXFCb1pUd0VBekNXUkU1cVNUSU12b2RkNkZWRUdwS2ZLM2pa?=
 =?utf-8?B?L0dmSzMzTXRPS1JOMkx3SXVqRFYvRU1QY2VuVWVnTXQvdk42Y2FTalFPZDZF?=
 =?utf-8?B?NXZNQVhGbG4yRE9YeWhKL1hmVW15UTJzN21HUW5UQXBVSXRSbU1BKzZwSlU0?=
 =?utf-8?B?YU02a3A3OVUyeXR6dlJRSTZkNGxoWG56eDFoWHAzWUlpT1haRHQxbzdzMWFK?=
 =?utf-8?B?ZzIzUWpTQnd6YUZVWnpmOUQwUTFMRUtJLzNjbGxwbzhiMllTUjVCK1VRdGx1?=
 =?utf-8?B?VnB2Rkl5aFYyYWYrSDVwa0N1aThaUUp1N2tNZk0raytadTR2bnpvVkNFOGha?=
 =?utf-8?B?NkZsdWRYZUZlZFZpSHdYK1hJTWpxSkFJMmxuWVVlTDI0ekFKZDhOeWR4UC9V?=
 =?utf-8?B?V2lGekYxU0poWnpUUjQrVm1aS0dFZS9TdDRyMEZBbGZ1SjJSQlk5VFdkZXFN?=
 =?utf-8?B?dkQreXFwYW9KL3FQbVVVWUhmcHV2VmNRbis3cEUzTlgyb0NlWjlMUUFCM3hk?=
 =?utf-8?B?UVRIVjFpWXBMUG9wZ0lVdVhXVVFaUjlraWNaTktrcENzOXNreWJVdnI3STl2?=
 =?utf-8?B?ekludkJrV1hvSHdhbDg2cDhjeUszRi9FRW9wUmYrTE9GWC9NVm12MGpzU2Vu?=
 =?utf-8?B?TjdScU9mZVVRQWFlSUU4NGorN1NwYmUzUDhvaG1KNTVqSFVzemh4ZEJYcXd0?=
 =?utf-8?B?ZjRPUGQwQ2J2aXpjSWtIUUxkRGdoT3NTSFNWYlUrSGZ5ejR0MmF0NnZpcXVH?=
 =?utf-8?B?WXQ2QURLU1QyU280V1Q0dFg0U2xBNlcrZVdaVVJPbzI3ekNsSDlOSytTbjdu?=
 =?utf-8?B?bHg2Q1pzUDIxODlxMmQ0a3VoaWZnT1dCaGJuMWRqUVNHK2RrcG1PZzZ6eXhr?=
 =?utf-8?B?NHVTSzhBbkx3RjdpazBHYkN1bVQrWUN6T3FyYUozWU9iSHdUTzFFRWdqZjV2?=
 =?utf-8?B?bnFSS2tyMjZYaFh3UWwwNy9SamU3NjQwQkRlM3lkMkVFNkFyNjZJaE1wOStw?=
 =?utf-8?B?Z1JZWWxBb05yRzBpblFMREpNUm5MTWxRcS92OFh1Zk5MaWtnTitUN3lvT1k2?=
 =?utf-8?B?UmlwTTJtOWlDY1ROOGpKTTRGMUM2RWs2dkZDeURlcjBNa3pJUlMwbnNVREd3?=
 =?utf-8?B?SkJLT04vRktLWkxiYUp3NjBQa1Z5eHVsVGQyaC9kMk1vZjEwVnhlZzNwc2hl?=
 =?utf-8?B?M3A1aHFBa0lWWXY2WjhQN2JrY0o1Q3Q4THdYUHRBQXZtODl0M05SVGNoVk1C?=
 =?utf-8?B?RHV5UEdnTTE5MzF6VS9qMDBvMnVYVlNTRW1NQ0FDVGVBRE5GQ0Jva3lqcjBr?=
 =?utf-8?B?MkF6Q25wMVpzd2JjTWFlYWYzcldicVVZbVNNSTdnK1cyWldXSHNtMFVuQllr?=
 =?utf-8?B?bXcwK3VvbWsxQy9UY3VCeDZ0MGE3Yis2R1FZaVJ6NFQ4eFozQUQ2NUFRa3lr?=
 =?utf-8?B?ZTRXMGVCR0FSMEszMnpSb3ZibnJmdXdUQXNjRzJDQXFtL0QwRjBHd2xFdERa?=
 =?utf-8?B?bms2L3BSei9WWDV1UEpkUU5MSW5NVkJha0NRbUZQeVlYaFR5VVg2UFExMTVp?=
 =?utf-8?B?V0VobkxqYVpNdXl0OUhVbTBVZnBkeDNHMjlmZis5ZFRzcDAyb0xTNFhVclJQ?=
 =?utf-8?B?aGVLUWtGR0s5MmNOZ2ZPdGw0WVFGUnB1UHFoUmRmeGlyelBPNXcwTGppRitr?=
 =?utf-8?B?VndDY2tHSHJLL1JnWlp2SkFRVUlRTmdwQ2x0WjhLbnE0VGlXd0I0bVhSMDVl?=
 =?utf-8?B?b2ViZmN3ZFhLcXRFelZkazZSUHVuejc4MmZpdlliaDlHWW5QN1l1U0J3dU9V?=
 =?utf-8?Q?Ryoc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6288fd1-217e-4db4-83f6-08ddbd2a8f1f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 07:47:44.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQ4GgGxf23SnesmO1S2SUBzJOJXWjFQkKvu0pII98L4W9QHNspcE139eN5L2JCp/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275



On 02/07/2025 16:13, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement a function to find the index of a MPU region in the xen_mpumap
> MPU region array. This function will be used in future commits to
> implement creating and destroying MPU regions.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Update commit message
> - Remove internal _index variable
> - Simplify logic by disallowing NULL index parameter
> - Use normal printk
> - Reorder conditional checks
> - Update some comments
> ---
>  xen/arch/arm/include/asm/mpu/mm.h | 29 +++++++++++++++++
>  xen/arch/arm/mpu/mm.c             | 52 +++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index a7f970b465..81e47b9d0b 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -10,6 +10,13 @@
>  #include <asm/mm.h>
>  #include <asm/mpu.h>
>  
> +#define MPUMAP_REGION_OVERLAP      -1
> +#define MPUMAP_REGION_NOTFOUND      0
> +#define MPUMAP_REGION_FOUND         1
> +#define MPUMAP_REGION_INCLUSIVE     2
> +
> +#define INVALID_REGION_IDX     0xFFU
> +
>  extern struct page_info *frame_table;
>  
>  extern uint8_t max_mpu_regions;
> @@ -75,6 +82,28 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>   */
>  pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  
> +/*
> + * Checks whether a given memory range is present in the provided table of
> + * MPU protection regions.
> + *
> + * @param table         Array of pr_t protection regions.
> + * @param r_regions     Number of elements in `table`.
> + * @param base          Start of the memory region to be checked (inclusive).
> + * @param limit         End of the memory region to be checked (exclusive).
> + * @param index         Set to the index of the region if an exact or inclusive
> + *                      match is found, and INVALID_REGION otherwise.
> + * @return: Return code indicating the result of the search:
> + *          MPUMAP_REGION_NOTFOUND: no part of the range is present in `table`
> + *          MPUMAP_REGION_FOUND: found an exact match in `table`
> + *          MPUMAP_REGION_INCLUSIVE: found an inclusive match in `table`
> + *          MPUMAP_REGION_OVERLAP: found an overlap with a mapping in `table`
> + *
> + * Note: make sure that the range [`base`, `limit`) refers to the memory region
> + * inclusive of `base` and exclusive of `limit`.
> + */
> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                          paddr_t limit, uint8_t *index);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index ccfb37a67b..25e7f36c1e 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -110,6 +110,58 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>      return region;
>  }
>  
> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
> +                          paddr_t limit, uint8_t *index)
> +{
> +    ASSERT(index);
> +    *index = INVALID_REGION_IDX;
> +
> +    /* Convert [base, limit) to [base, limit - 1] for inclusive comparison */
> +    limit = limit - 1;
> +
> +    if ( limit < base )
> +    {
> +        printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
Given this message, what about region being empty i.e. limit == base? Is it
worth continuing the function?

> +               base, limit);
Here you print limit as inclusive but below as exclusive. Why the difference?

> +        return -EINVAL;
> +    }
> +
> +    for (uint8_t i = 0; i < nr_regions; i++ )
Space before ( and uint8_t.

~Michal


