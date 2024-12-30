Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B8C9FE591
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 12:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863516.1274890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSDfe-0000gR-2Y; Mon, 30 Dec 2024 11:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863516.1274890; Mon, 30 Dec 2024 11:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSDfd-0000eB-Rs; Mon, 30 Dec 2024 11:10:49 +0000
Received: by outflank-mailman (input) for mailman id 863516;
 Mon, 30 Dec 2024 11:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sMIJ=TX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tSDfc-0000e5-8Y
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 11:10:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b64ba6c9-c69e-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 12:10:44 +0100 (CET)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 11:10:37 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%7]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 11:10:37 +0000
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
X-Inumbo-ID: b64ba6c9-c69e-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsq1FaqOgxoTzT0fDM/T3HCzu3uPtz2v5jRVVQTtSTV7K4oAt7dQKbGTwatugO2xJRqGYp+Ow+kZZIyiml+ujMXcanjjiayqDCWP6kYYaqP9Rd14VU8uMfiMUxTimLiwyIhdnn393XEbdZ8/jzr6t5zLoP0UEzcv1/+GCXHNBrd1wU6Ma0pTOMTDIYnnlHyrD6rHtvqwkq1t1C546sVhMlTCrqlC6GBcqUmdjUD7cGk9pwiPGbT1BEoPAEefsimVHHRKB+lmXsxIHlsjNb1qkc67f+hjFfZe/h8J7nkfRxrTnTT9t1mGloRDEZ+LDVL5CvMK611W9ZZA23llygq7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UVhejHqxEzhbFwNr0JP6tJ8LiLWKLfLpzm4C5uK/3k=;
 b=VVsuzcSOn93E+t/O1YphtkZJJMs9h0k9JJoEoBy1qjyHwzcPXfcK48mI05ap0CkyuyBKeUl4vinjEoayy/Jqt/VIccVrgEzfbY7e4swSnao570/CKymZm0/+K7B6Pgr0uVfsWPZiLFDfWm9UCFHz2WbxiD2P7buyMkKFrsjVBOXTfM6f0bPdkfpoztB5oxhYi6cYSmNgBESBSYg1LgTXPD4khH+O8x4KQc4MM9wGbWwKtp/kBtr1J213J1BF9JWtPZNp13VG7GleSrTMqfchIDoyNQPwPH02Lh+fLbXwuYQPz5fxkAp46L6gxC/MJP6/eeLTWC7c0CE+Z4+waHf46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UVhejHqxEzhbFwNr0JP6tJ8LiLWKLfLpzm4C5uK/3k=;
 b=wa7nXXzWm8dqSAyyo+wbY5o//swrX2NL6+zclMrSwVcTcJZVtlSwp0b4MtvnltyoVz4RDA7LiyjvA0zEDXau/hui6+EURcl8yEeWu15QZwM++a6+9kwNm7b4raZ/iev7FM2f1ChzAht37Ljl1ZmTYwl1X0Djnf5HegQ0Yo+kW8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <662dff5a-f494-4aaf-a2cd-5e95bf0e310b@amd.com>
Date: Mon, 30 Dec 2024 11:10:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] Add zstd compression support
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20241217211903.5945-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20241217211903.5945-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::27) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2ef07d-beac-4577-c731-08dd28c28de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajI3OVQvM3VING9oeGY4NGVxYlczcFFXcElWUEFZK1BncVZGR1hjcHFqV0ZW?=
 =?utf-8?B?ZlZ2ejNwcjR4Z3E0Uk5lUXAwcml6eUFSU05neVpHNVY1TFBRRDZJR2I4RDlh?=
 =?utf-8?B?ZDVhRFZwRGRVbUlRbDk3RC9HUHBCUUV5WU5hbTdST2VSdTJwb2tJWEtKNXY1?=
 =?utf-8?B?OG9MSzlidFphdFJKQUt1RmtYMEZYc0Yzd1RZM0hOdnhBRmw2Q0k2SFZwRjEr?=
 =?utf-8?B?S2c3aDhZeHNmcVBiSWtLM2ZzcmY3TXQ4NjZjQkdzaWtmNURRZXBVckJGNzN0?=
 =?utf-8?B?RW53cGVaV0JTVXpiK0hsWjVpaWxmdGlGVHpDSG1YdkthTkE0OHlPQlRvRXpv?=
 =?utf-8?B?WkJFVm9zT0JNQ29ZaGRHWlRGVDFHZWVNL0x3TXZWRUtpbFNYTVIxSmdaTGFQ?=
 =?utf-8?B?bkdXR3FQQkR6TkRPUFBjaDV5TG1WU2YxSXlsYXphaGZtRjRFUXVXR0Vvc0dG?=
 =?utf-8?B?cDlUeWtQa3VHajB4eVF4K3hteENHQlk5amExY3FhdTJLTldGckFhZGprclZa?=
 =?utf-8?B?M1Bmb3NacXZEdHJEaDQzOThhMnFGbGpXQkkwRlJtd3dCS1gyWUVoN3RRWW9B?=
 =?utf-8?B?TFV6UVNLYkZoK2dreGMyWkxZUTU1TUNOdGxyVFNYZzFxZlNNWXQvZGJydi9C?=
 =?utf-8?B?TU4yV2NHWk1lVDY5SWxiVHVmVG9ib3lIWGlzbGZUVTV1MUJQZk53RDZPT1Fv?=
 =?utf-8?B?VVhZVENNbDRrVllwQnJUd09vci8wUklNc3pkUXdxclIyV0VrYkt4Z0xsbkpM?=
 =?utf-8?B?OWpicnZlZlRYeHg4K0I2eG96WlhWS0dXczkrdVNucjJONE5lclV1cDlud2dG?=
 =?utf-8?B?UUtod2l2ZHBQTHBEK1ZxMWkzbTAxYkwwQW54ZG9mSHVDN1FqM1JYcHZwRExw?=
 =?utf-8?B?ZGdFZHA5UmVlMVdrUzBTYllBL3plV3BaeGIranREeGxqZkRwSHdsb1FYT3BK?=
 =?utf-8?B?c01kRzBnVjlyNTl1aGxaVEYxTzY1SFZadjlqV0ljdk5nbTJDMFZIREVKMHBH?=
 =?utf-8?B?TFJQVldOL0ZJaHhHdHVtb1FmajhNbXB5c3F1dE1TSUZQbUlkNTRKV1JNOWpC?=
 =?utf-8?B?NElKUjFYZXBtQjl0U094VEVNNjFidysvbDkyanFvSHBDSnZpNGVXNjZVdll2?=
 =?utf-8?B?K0FaSE9lN1dRejBLK0pMU0pDb1hQMzM0amdUVTRsWXBEQXR4TGUvMENURlli?=
 =?utf-8?B?TUJFOEFndmxnRW5MVndTYXo5QU9ScUp4K09qNUdaODRpYkJKRVpaMG1EdWJw?=
 =?utf-8?B?MmwrZHNVdlh4ajVGUENBTXQ5ZFkvQjVMMkM1L3RPR2d5aWtqNHE4ZlVJaU96?=
 =?utf-8?B?VkVVc3JSQTdwWEplNzloWmhMZE9OczF3V0lyaEFaTmlZRWc0S2IycGlkbkxC?=
 =?utf-8?B?cE5LM01lbCtoY1lGVG0ycjNFS1ZRYVg4NEVMRTNLSTNhd05vT3lLSWhod1Yy?=
 =?utf-8?B?Y0dQUWJQK2Y3OUxDVFVlM3U4dXFiOC9sM0xUaldBY2VKcStFMFdwakNaVFlB?=
 =?utf-8?B?RjJEaUozbUNUbGd1T1B4R0xZMFVrcXJpc0kvekpiTVpYUFpqcDFJUFZ5ZTdy?=
 =?utf-8?B?QkhKNWVPQjhKSWVQQTdZcndVQW5lczRzS2FrWHlUMEJzSlJRdTBDcnpnbmor?=
 =?utf-8?B?YXBPa1FKd3hSVFRZZUZCSm82YWtKNkhhMWlsOEtVbDNxVFMvSXZGMXdWa283?=
 =?utf-8?B?Yy9DQStjWU9TV0ltbUFFYVpuZjF2MStUenZPandQMjY1N1JCalpUN1l6SzRi?=
 =?utf-8?B?RWxwb0EvMWlCTkxwZHo1YS9VVFFEWEVIajVEVldQWGRjRWlBeXlxaUg2SmNM?=
 =?utf-8?B?bStqRVk3dWgrR3BFM0VvZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHBwbHdnZ2dIeGNZQVlxMnFuSGhtQ3M5M0oyeW01R2QycEc5QXRocW1sazVj?=
 =?utf-8?B?YjJRc2R5WTlDdjBxenhwekNPR21ualRNQlltZUZlSjJUR0lQYUdOZlpiSFJi?=
 =?utf-8?B?LzhLaWxKR2djeHJEQVRCdE9hNlFZajMvZHNRdzdYbU9FdDJSV1lWbWVRQ3o1?=
 =?utf-8?B?amo2UHBvVENJdzM0U2dUOUVSOXR6WWxZS2J0U3Z4OEJCVVBOSkcxRTBBcGk0?=
 =?utf-8?B?N2srcjJpa0ZTOUJqcXJ3NzRHamZuL3hOT29nL28xaFZ2bTNvNEsySzE4YTln?=
 =?utf-8?B?TzR3d3FUMkcxUGVHKzBJTkNCeUpNV3JKVENLZ2FGR2NIZGlrZ0xLMmR6Y2dX?=
 =?utf-8?B?K0FRY0hYUFVmYU9MeW9aK0txdE5GSmNqd2FWaDNmNWYzZkVPbHRkMi9iaExZ?=
 =?utf-8?B?SEVqOE5kblZZeDNxTXVmSUxUNUV5VWRzL3FaSHZRRGQxaEV1TEtTRHVlRFlW?=
 =?utf-8?B?QUwyUnFrR2dFUjhWejZ0WkFZMW5vaFV4WWJMRUdYeHg1ZHNJVTI0N0ZwbnJm?=
 =?utf-8?B?ZThVbHh1aktkc0FkQ0w3UWVmMEE2WkpCQmRISWxRc2N3NGhQM1cwcE5McGht?=
 =?utf-8?B?ZUNndVA5Q3lxV1VjQjU2ZGU0bngzcnQ3VHZVNytGUjVRMjhrd2FYeUtsbWR2?=
 =?utf-8?B?cGFDZ1NlT2pkaTltTFM3M1JvOGpDZEczelE5bm9vU3VhcTBhdDYydjdzMENK?=
 =?utf-8?B?ZVJwdGJsRGhPeEVFZXBTSWFaeFE5QllSTHlvVzJ6bGxJZ01nNFB3VGxhN1hK?=
 =?utf-8?B?U0xRcjdwVFVadG5GeXY2bHN1OVRwNVV5OWIwTEhHeDVaY2NveGwvRTh5WEly?=
 =?utf-8?B?UStoSDBrc09qOU9pL0lLZTVNWlFLZndBUXpxdWlwWnkxQlNlOHl4OWJjd2k1?=
 =?utf-8?B?UkVSeHJDS2pPK2RKZDh0S2E0ZU0zV080b3g5WXpqdS9pbnUyQ1MwY0RPSmlr?=
 =?utf-8?B?cjdTdlZIUlJSMU5YTis5NlE1ZTl1SkgxWEcyaFlFM0ZXWUoxamVjd1FZb3VU?=
 =?utf-8?B?SnpWbTVHSU44Lzl6QVB5WlBzZVAraXYrTVIzc29TVlAyMHBHaEVtcEZDTDBh?=
 =?utf-8?B?eWNZQW1IVVJMaVA2eHpmYUx3eUlBYW5lTDFoNTQwRHAyZW9PcW9ET1loeHNu?=
 =?utf-8?B?Ri9qMjRHR3dqeXAwZWtJU2lsTGhmeE9KOWx2b3hOZFRNa1hLbmRjTHRYQ3Bt?=
 =?utf-8?B?bDBIK3BIUEV2Y20yTi9DbytmVkJrMlNIeUdrT1hiN05JTlM5SUJmR015aThJ?=
 =?utf-8?B?YTd3MSs5d0ZLNGFBOXlGRlVqdG9OOFAvWGhKWFMvU3F3QzF2dDBaZERERjhL?=
 =?utf-8?B?VnE5YUdkSFV3SlAyOFpaWDY2RGVhVVlzbW1PeHlkWkFPNUh5K28zblo4Wk10?=
 =?utf-8?B?dHN0OWRpZTBJYk1aTEFNY3lybGVjRWJ6NS84RkkzTCtRVk52RVZ4YVVWbm9q?=
 =?utf-8?B?QTBDbnRnaFVuUWVzUkRyRGpDelNiWXR0K2xiYXAyTVF0aGttaWxKZ1V1c1hT?=
 =?utf-8?B?N1hsZlAzNVMvYWJQNFRoSjh6QjlFeHNDWXhvYVlxOUxXOHhKbnA1K0JlTmRt?=
 =?utf-8?B?ZnQrMzlLR2ltTmtjNzhxc1cyLzN3WFVNbGhQVThxaXNrS3NKZGZuWTk1YmFO?=
 =?utf-8?B?cWNkbzFpUkJJcDI1VTVxaDBUT1hWRWpmV1pURWttK3JGVFlEQmVuN2xyL1U4?=
 =?utf-8?B?OTFWQjJSZlhlVDJCWGFsMlU3bTNmR1p0MGV0ZzBNRHEyZW9pbkhJU1p2VnpQ?=
 =?utf-8?B?Yy9FN0NNcUd2WHlnVHdpT2t5QmRsZ3F3ZCswS0lPVEZCYmh4OFlkSmIwemw2?=
 =?utf-8?B?T2RZVEJ6NFFBc0F0VGRFR2p0Rm1WN2svNDZWL3VlNSs4TDg3M0VEbXRWTTJq?=
 =?utf-8?B?R0Ywa0hDMkNOem9OdVJYSXZqNU44Rzl3aHY2djVzV052WnBqbzU3NUdoNmgv?=
 =?utf-8?B?MktkVzZLVWF5UFZlVi9sd2R6cEMxallaQzU0NWk2dE50UDNiczFyQmd0SzJP?=
 =?utf-8?B?ZVdXNUpwQUZBaUQ3UlEzd1EzbXd4eGh2NTNsdnVJdkV5TU55YWxNWjNFZnk2?=
 =?utf-8?B?Y2QxbWpHRjdnT0xrZVlBSjF3V0tHai9VR2JQeS9hLzI1ZmFDcWtFb1dUeTZm?=
 =?utf-8?Q?GXd65jorKOu6ks3R2yoOEwyuT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2ef07d-beac-4577-c731-08dd28c28de2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 11:10:37.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5cd5QXQV+qRN0rdlJZ3cW+RIygAucctWcIIJ2ctpbCi9QC9ef10VW/Gn5T+yH4Tihsj98JxkofOZnU6QvgfIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

Hi Jason

On 17/12/2024 21:19, Jason Andryuk wrote:
> uboot-script-gen fails to process a zstd-compressed initramdisk, exiting
> with:
> Wrong file type initrd.img. It should be cpio archive, exiting.
>
> Extend the existing approach to also check zstd.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>   scripts/uboot-script-gen | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index fc63702..db2c011 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -567,6 +567,7 @@ function check_compressed_file_type()
>   {
>       local filename=$1
>       local type="$2"
> +    local file_type
>   
>       if [ ! -f $filename ]
>       then
> @@ -574,13 +575,17 @@ function check_compressed_file_type()
>           cleanup_and_return_err
>       fi
>   
> -    file -L $filename | grep "gzip compressed data" &> /dev/null
> -    if test $? == 0
> -    then
> +    file_type=$( file -L $filename )
> +    if echo "$file_type" | grep -q "gzip compressed data" ; then
>           local tmp=`mktemp`
>           tmp_files+=($tmp)
>           cat $filename | gunzip > $tmp
>           filename=$tmp
> +    elif echo "$file_type" | grep -q "Zstandard compressed data" ; then
> +        local tmp=`mktemp`
> +        tmp_files+=($tmp)
> +        zstdcat $filename > $tmp

I think you need to list zstd in |prog_req
|

|See 
https://gitlab.com/xen-project/imagebuilder/-/blob/master/scripts/uboot-script-gen?ref_type=heads#L5|

|Also you need to include this as a part of the dockerfiles like|

|https://gitlab.com/xen-project/xen/-/blob/staging/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile?ref_type=heads|

|https://gitlab.com/xen-project/xen/-/blob/staging/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile?ref_type=heads
|

> +        filename=$tmp
>       fi
>       check_file_type $filename "$type"
>   }
- Ayan

