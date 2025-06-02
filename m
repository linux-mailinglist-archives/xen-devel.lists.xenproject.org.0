Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41484ACA9EE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002832.1382221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzbw-0004Dr-2h; Mon, 02 Jun 2025 07:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002832.1382221; Mon, 02 Jun 2025 07:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzbv-0004C2-Vo; Mon, 02 Jun 2025 07:29:31 +0000
Received: by outflank-mailman (input) for mailman id 1002832;
 Mon, 02 Jun 2025 07:29:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yeyf=YR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uLzbu-0004Bu-6q
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:29:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fef36d7-3f83-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 09:29:27 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 2 Jun
 2025 07:29:21 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 07:29:21 +0000
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
X-Inumbo-ID: 4fef36d7-3f83-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlhOVJ7dm2BBNPVKKZWxw3QdoPRRpRSOlF9BRqV2KYC87+TODvlFJqscLG+nNLZeCba2u1vL6hFMt7ms2aE3+XRm0QSTe39tKckawJfDBzfd9uTOFhQluOa79H5InO+MdLUWtBZHMObp+R+xTQMOjxChNqzMrWqGqP8rWaIFsFYm+JWHD/Azuz015wGzU8FO4N+C6kFZLmwG39tjcuNXXFK1omjrbLVkeQD3e4gDeEf8zB6gDp+Rbc/mJcBUC4JJXS/zKK6BlHhFdb3JXMtuMzujpuhcDAL3tUxaMXqy1Z9iBsTV1C8ornepMKvRuXn2dTE9bmbqtcCuM3GLIwZsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atjzhwzwO4A4IJOfKslccgDJ0UFxqYSHRSFWVkGHQtA=;
 b=qvHhWRMtFHROxh8GeqcaB0KLvHwIcjL/QQHA1wptSL069lA2efChrcHy5ylw+zuItSinfT1cJXS1sI0XkymThhZks562wWoi9ZqDuwYNk9ZWOiXy1JEJJSGWy31TLuwNsluZMpgv7Tpdk0DbrOxCtOHrdBtCvSDJvCbtU0P/U67yfkz6T1lzKhVZm3zDyQgQhjs97iKrYcSnlk4NVq5/2abGzrzGY96psP0EgH0shwogohGl6bbJXRBz/5S3UlsDt8aaxMjJ9cnMu+AL3GlMXYSEQQhhLsNWuaKWHef61yqQ3YEFmWgmB6Do67J+A7uYUx5hBXffQNmIuJRL8kZbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atjzhwzwO4A4IJOfKslccgDJ0UFxqYSHRSFWVkGHQtA=;
 b=E6Ko1w1cfoaaB+WVaiOT6ibWThEkEhvsH+lwsdqy6NJ6NXxZ6jCL0vhscxJy2xSjdtKFZiCZyBjNpNqShDgjjK1J19QgGXKfEUnflQSyUwdxnmkULATXlKF/44LCvdW/S602DwpLi5UMrT9xJcX8ygJ7otDIq9VRNE6+DpVTQlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9df7c8b2-0864-4d8e-8969-d876ae77c4cc@amd.com>
Date: Mon, 2 Jun 2025 09:29:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
To: dmkhn@proton.me, Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-13-agarciav@amd.com> <aDpO1vpKUqWSyBt1@kraken>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aDpO1vpKUqWSyBt1@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0157.eurprd09.prod.outlook.com
 (2603:10a6:800:120::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd7fab8-57ec-4523-f5cf-08dda1a730db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0RVdGwxOURUSStTd0UvUXNGRWNEdmI2aWRKQ1BTUlRTNFk1RWNWL1ZuUnor?=
 =?utf-8?B?RHk5UXdkaUpXWE45am1peEc4QnVEQllhRWRtTTJvV2dDa25kWUNod2ZpUi9O?=
 =?utf-8?B?UXp3UDRpYVVGQVBqeHR2VWxvbFREY08yNWI5TGF3U1JVbWRmL2tpVHJJWWsv?=
 =?utf-8?B?eE5FeHhkM2Z4RUtXMHBIMUhPWkIzVHR4MkoyamJqcjNRa2tjY1VvNDc2UmQ5?=
 =?utf-8?B?bXNmNzZDaEFIcXFNSGxQVmlkcmdSN011SXZJY1YvelNqZVlIMlR2RVZzMGp5?=
 =?utf-8?B?RTF4WW5pUXZHWDNHcmE2cjdtMlZlVUY4MVJmUHcvUjhXM0IwVnNkcVF6aEUz?=
 =?utf-8?B?Q2gwSXM1bDlyNHNLaUNVeUx0dWN0WTdvR1JaMEI2OHU2aVU3SklGdVJWWUkr?=
 =?utf-8?B?bnZLVno5bG9nN0lpbmdnYnNzY0gzaUxZeUZDZnNvaTMyUGJIQjZCdG8rMGNk?=
 =?utf-8?B?dEdzenFaaFZtbFNqSUtVSmM1aHpwanB5OXpvUkxjOXJ0VnJmRE90VUwxbDNi?=
 =?utf-8?B?dWZCdkNiRERTZXltWDUzamE3TlBiK0RlNVl5WjVLTExuajEwem9FdmwwNnRy?=
 =?utf-8?B?RkE5aVllNjZZTkx0OFRNaWlldjU4dUM1Mlo2dG8zR0lyTDQvd21ITVpuNGh3?=
 =?utf-8?B?aThvczVlejRoTGFZa2NyamtEVHdqL2FxQjliN3MxOUlmNjkzWnMxcjVYNWdR?=
 =?utf-8?B?RVFmNldpTGlQNHVUUHVmV2N5bU9peURSMWwyRWJNV2g5RDhSNFB3RFptV2VC?=
 =?utf-8?B?dnNkUkQ0SHU4R3g5ZmlHL0lYNWN1SUJHTEVYdmZqangyaCtQTEVOWTgzSFpN?=
 =?utf-8?B?Qjg2bTdHQXdZOTZXZUdzOVd4VHZYS0hKKzZnZTE2V1B3MVJBbVRibllPekdx?=
 =?utf-8?B?MlQ0b0oxZEhkRWZpRUpUYVhOanJTbm9uVW5PSHg0ODNIT0x3aUV1Tm5YeWgv?=
 =?utf-8?B?YWMwMU8zbGVXNWNIUUpVYi9GNzdQcko5eWZNYmFyRXN4UW5VdHZ1WkdWQXA3?=
 =?utf-8?B?MEZlQ0tuM2FQREhUMFl3SEJZK2h2K21hM3VUVmMwdWV0M1V4ajBSdEo2VmVp?=
 =?utf-8?B?d3lqWXExaGNuK2pzT2ZRdU1PcDFuZ3hSUHhrNUZ5S2ZDaFRrSUpLOFltWFYr?=
 =?utf-8?B?aXBLSFZtQkRWcGdFYU5VUzFUbmpqNHBIdXVzcmRBVWNHYnU5Vm5iRnNMSEVl?=
 =?utf-8?B?eUZ1L1UvbEVrZ0pLRFV0N1hGZXJPOTRvRUpySlpvcWVBandlZFRDaEhuVE9q?=
 =?utf-8?B?NjBsYVYwUnUyYS9UTmtkdE5seVlTRlRQY1UxYnlrSlJYQkRVcnhyZXNzRUFj?=
 =?utf-8?B?TWpmMFhSMFlsRnBHOHJuQ1hyR0JpUFd4dlZEYTdNZ2tlVjNjVnRSN2VSS1Bx?=
 =?utf-8?B?R1pWVTlmbEcxc2x3Rzkya3FKVWJzOUZsK2ZPTERCd3p6emVtWVg1OUY3Ym1E?=
 =?utf-8?B?NHByck9id295MTg3c3M0S3pkckowSTBXMnd1TjVKa0RPNC8xb2NPQ2Nzc0lH?=
 =?utf-8?B?WVREU1VNVG9nVUppMTJYTm84Qmk2V0JOeEtxaGVxaFIxYWhpNGhnRHNGcUY2?=
 =?utf-8?B?VlZYSnpxb1puV0FGL1lrQ2dYS1JCbmFZbGpTSThKNnpock52Q2xiZFNWR1Jj?=
 =?utf-8?B?aXpSVXphNVNXZzA0V2h0NHMwWGdadGVNWXZMVHp4ODFIUlZlRTlPMTAzeWU5?=
 =?utf-8?B?VkY2WWxNZWxsdEFZb2dQOVVVOGdCVVNuNWMwOE95bDF4cWZsWVpvNFNhY2dZ?=
 =?utf-8?B?T0UraE5ZaXp2UEpyd3MzSENxNmlYSndNY054R3NXZ0Jjb3lqWWtuYU5abkdZ?=
 =?utf-8?B?WU56ZVp4SXBlWGg1a21uRmZRck83bEwySG1ZUkxJRU5UeU1vUVRFdTRYQ09t?=
 =?utf-8?B?dVVYUDkzUDJHYUwzU29YS0NaaDdYV3BabUhlN09UdURQMjJsZTd5dVJlczdP?=
 =?utf-8?Q?YkP8AUTpnoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c003blE1ZFM5T05rT25vbDV4NUVBQjZwTzRCdDRkclZlWHBFUUZMQy95RS9F?=
 =?utf-8?B?Qko1YjAyYURqTW5XMHNpd0tPVzMrd3gwbTRtazNRUjU1ZFJZbnNZaGVpMit2?=
 =?utf-8?B?UDYrVW5KRWpSWEhod01BN0JqZWltNFVRemY0RkZidEVxNE9uRjl4NFJrZ01D?=
 =?utf-8?B?cStNM3RkQk9hSG9BYmlxcmdZc0pLcFZPTU1oakMwY2pWb0VrbXNLaWF4dGs0?=
 =?utf-8?B?c2tBbndhMERMYzRscTUrZ3U5bkxEcnZ3WHpNYmxKZXJmcTVoMHFZMVRtUWo5?=
 =?utf-8?B?ZDVzWno0RGVjZlcwYkxXQkR2NVU5KzdTQVNWT1Ixc2R0S2FGUmRBRXByVC9r?=
 =?utf-8?B?NkZJMmVwdkRtTDI3Z1dFNlVEc2dJamtGdVlOOGxzWEdNUEN5b3Y4ZWNOK0hW?=
 =?utf-8?B?UHNtenhZNWNZV3V2UHBmMlJNd28xRUdOK1hrankxQjJ2V0lnYjFsU28vOS9Q?=
 =?utf-8?B?QjRkdFNpNzk2U2krWlFnSU5SeGtlQlFvU0lXRFZsM1JlU0UybEhjemlpQVNE?=
 =?utf-8?B?N1o4MXBIZXFTYTIzbG1SWWFqODUvTjMzUEczQ2FmTjFQSElONjQrSU5KZjRu?=
 =?utf-8?B?cVJiZ3k0N1BGUVFPci9JRWl6aHdHcnRyaVhGeklST2VxVmQ5Rjd3ZG5kSmRK?=
 =?utf-8?B?UTRYS0dIbFZCS1FUcTRUKzltUS9lMlZKR0dqNlFmcHBkSEtJWXBYckR2WkZr?=
 =?utf-8?B?dmUrME1lSXR2Z2swUWN5Qnk4ZXNULzhzMXRkOFdYaXM4WGlxYllLL0RlV0hM?=
 =?utf-8?B?enZtQXNNSTRVQkpldGNCckxGa091ZDlHaWVqZnA3OTdKNEhXWm9EU2NEL0RS?=
 =?utf-8?B?dHFrVUdBNzByV2sycVJSdzlJbG1nRngrVGtCdWNUT3VKTWUxblJtM3FjYU1W?=
 =?utf-8?B?VFJKMEV1R0xHZXVnY2VpVmlnVkJremJyem11RWx0Qi9ZMVo1WEtZeXZDZGpi?=
 =?utf-8?B?NElTQU1lVGJVL3hsM1BRWlFXNlRmaGM1cU44aFU5UUFRSzAyNHlqUG8zWDFr?=
 =?utf-8?B?QVA4cVRJV0trY1Ztd1FaUkV3ekRRa3ZhZEVMRjdjMzFheXVRa2RLeEFyWmh4?=
 =?utf-8?B?WEtXMnBwT3U3ak5pNTRhVC9yVG9CaXp5TlNOWVZyMEJucXJnVWN6c0FpK2Jx?=
 =?utf-8?B?SUUybUNRQjd4Q0hCS1hkcWUwLzRtdVhwek9DckNxTDZOeEx5bFZUQVZhQkZC?=
 =?utf-8?B?dUg4MG9zNnd3UW1JVXFadlQ4TVVVSkQycXdzZVNsVHdzdzBzUmEvMWY5RWtC?=
 =?utf-8?B?b25FUzBWREFSUVBPb1d2elFabDdiQkhoZVpDS1B2VEE3NjhuM3Vlb1NmMHo5?=
 =?utf-8?B?TE53YnEzaEhDS0p5T0pXNjBLYkx6Si9RL21UMCtpcHBsWGtDRjRuOWhPU2Vt?=
 =?utf-8?B?YWVuUVMwZ0xsWlNpVmhac1FSajZGcWhZamxzcGRYNUl5TjNrYUFKTzJhZzNB?=
 =?utf-8?B?VlU5WWNBc01KSS9lZlNDQVBzV1F5NW85NkVldDE4KzFDTzZYTC9sOUhsZFBl?=
 =?utf-8?B?dURKUzdVWU16ZUVXQnhCNXZabTl0L0NJTFQwcE1ZZ0xIbHpOMm9rOTVHNEZU?=
 =?utf-8?B?ZVM4aVJnSENEZkN3QVRETzRIY0RYSm1iVUJZQWtlaEFzdVN1UTl3aUdVUFQz?=
 =?utf-8?B?VlVOL3FrU09sMklyQ2tuZTdqL3lSSkY5VmtyYnVjVEZnbFFPS0FXNFRRaE5X?=
 =?utf-8?B?VGNUWE5SUUlJVlRYK0pLaXVEWjZZK1FGazAxYStXVHZHTExhQ0RabnpCcUdz?=
 =?utf-8?B?bmVQb05aQkw0Y2EwWXY5TGM4MnBubTZYdzJUV3NTbS9FQVkvTFpYVW9CeENk?=
 =?utf-8?B?a014ZTZXTWtDSTdQWWJ4M1RSM0x3Y1dqNkFHcmtRUzZhNDgwQTk3elJXUTVK?=
 =?utf-8?B?VDl4bFE4TkVuUko4UGVER0JxQmx3UGVsL2Nxd3lGQkI1QXdZZ3ZHMjdpME5k?=
 =?utf-8?B?dXdUQ3RPODlLMmVsaVpXdnlZQUl5Wkl2NzBTZW1tZVU4TmdIN3RBc1ZRU1BF?=
 =?utf-8?B?bEVXYkJkK1hKQzRVOWtFZkpySlhHL1d2SEV6a3lXa3MxYkRCVk5hN0ZaUEpN?=
 =?utf-8?B?eEtNNm94SnRJNURPN0g1NW4xQ3MvakdodGI1QlYyQ3IyL2VISzNocXQ5YWU4?=
 =?utf-8?Q?FXIw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd7fab8-57ec-4523-f5cf-08dda1a730db
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 07:29:21.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb1cWfVgPJLKf2HQn+vgEKRiFyz4s+81BEMLCjxkctB42XHukEcAkja7qd7fB0SZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192



On 31/05/2025 02:35, dmkhn@proton.me wrote:
> On Fri, May 30, 2025 at 02:02:20PM +0200, Alejandro Vallejo wrote:
>> Part of an unpicking process to extract bootfdt contents independent of bootinfo
>> to a separate file for x86 to take.
>>
>> Move functions required for early FDT parsing from device_tree.h and arm's
>> setup.h onto bootfdt.h
>>
>> Declaration motion only. Not a functional change.
>>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/arm/include/asm/setup.h |  6 ----
>>  xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
>>  xen/include/xen/device_tree.h    | 34 +-----------------
>>  3 files changed, 63 insertions(+), 39 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 0f9e531a34..32308837a9 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -55,12 +55,6 @@ void setup_mm(void);
>>  extern uint32_t hyp_traps_vector[];
>>  void init_traps(void);
>>
>> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
>> -
>> -u32 device_tree_get_u32(const void *fdt, int node,
>> -                        const char *prop_name, u32 dflt);
>> -
>>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>                    struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>>
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index fa65e8fcf4..079259c719 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -2,6 +2,7 @@
>>  #ifndef XEN_BOOTFDT_H
>>  #define XEN_BOOTFDT_H
>>
>> +#include <xen/byteorder.h>
>>  #include <xen/types.h>
>>  #include <xen/kernel.h>
>>  #include <xen/macros.h>
>> @@ -16,8 +17,53 @@
>>  #define NR_MEM_BANKS 256
>>  #define NR_SHMEM_BANKS 32
>>
>> +/* Default #address and #size cells */
>> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>> +
>>  #define MAX_MODULES 32 /* Current maximum useful modules */
>>
>> +#define DEVICE_TREE_MAX_DEPTH 16
>> +
>> +/* Helper to read a big number; size is in cells (not bytes) */
>> +static inline u64 dt_read_number(const __be32 *cell, int size)
>> +{
>> +    u64 r = 0;
>> +
>> +    while ( size-- )
>> +        r = (r << 32) | be32_to_cpu(*(cell++));
>> +    return r;
>> +}
>> +
>> +static inline u64 dt_next_cell(int s, const __be32 **cellp)
>> +{
>> +    const __be32 *p = *cellp;
>> +
>> +    *cellp = p + s;
>> +    return dt_read_number(p, s);
>> +}
>> +
>> +typedef int (*device_tree_node_func)(const void *fdt,
>> +                                     int node, const char *name, int depth,
>> +                                     u32 address_cells, u32 size_cells,
>> +                                     void *data);
>> +
>> +/**
>> + * device_tree_for_each_node - iterate over all device tree sub-nodes
>> + * @fdt: flat device tree.
>> + * @node: parent node to start the search from
>> + * @func: function to call for each sub-node.
>> + * @data: data to pass to @func.
>> + *
>> + * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
>> + *
>> + * Returns 0 if all nodes were iterated over successfully.  If @func
>> + * returns a value different from 0, that value is returned immediately.
>> + */
>> +int device_tree_for_each_node(const void *fdt, int node,
>> +                              device_tree_node_func func,
>> +                              void *data);
>> +
>>  typedef enum {
>>      BOOTMOD_XEN,
>>      BOOTMOD_FDT,
>> @@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
>>      return banks;
>>  }
>>
>> +/*
>> + * Interpret the property `prop_name` of `node` as a u32.
>> + *
>> + * Returns the property value on success; otherwise returns `dflt`.
>> + */
>> +uint32_t device_tree_get_u32(const void *fdt, int node,
>> +                             const char *prop_name, uint32_t dflt);
> 
> Suggest using `dt_` prefix (or any other good prefix) for all functions
> in this header for consistency: e.g. there's dt_read_number() but also
> device_tree_get_u32().
Not really. AFAIR device_tree_ prefix is for functions operating on flattened DT
(usually calling libfdt functions inside) and dt_ otherwise. Let's not mix them.

~Michal


