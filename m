Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDFA547CA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 11:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903320.1311227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8UO-0001Di-Cm; Thu, 06 Mar 2025 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903320.1311227; Thu, 06 Mar 2025 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8UO-0001AD-90; Thu, 06 Mar 2025 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 903320;
 Thu, 06 Mar 2025 10:30:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFz4=VZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tq8UM-0000oV-Nj
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 10:30:02 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2407::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4de8c0f-fa75-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 11:30:00 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 10:29:57 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 10:29:57 +0000
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
X-Inumbo-ID: f4de8c0f-fa75-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5y8DrVOR637UK1TdOYjL6YTUvoKURgChGwoS/0IUqasp+DGM+Xuc4npc7LNcBhMVu1mI+y9gAHLKsiorCoeVlaSBkwAUZNMbSjAOjWxqsZjfKUT4mIl9pnwK0AHQ8oqe5RByf6pHBqKm4gL2JxR8Fre/L5yQjIcvJwLU1Z0dnbOkjmJFL7/C8+bQJyLbxqGG+6B2Uhn3i0XqLu2I3jChrag5Pmfhz7D9mFShaQBSWflXBrXu1TzsVXStKp5H2t3993QIgDHP/GGitj0o5laWBZpLoYiATRVawh4Xixg6zemL5KuuIhIedJIFxqrephmRokYMaJnWD3ffl3w+11oNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXqfIDlKKtSbL6kyYsF97WaIRlFv2XaNGtqSIfIVvto=;
 b=EiyObHTJEJBueVeLTNtXIozaB7gUdlmS32n3YniOSRuyw44r3PFOqWYl+vb5QAob6T0uFLLKWoRWoyHtT9OSygC+lzy+hLjr2D/cGQspYSMHg+o9fSgg1SPviLlVSYt93s1zcU0g7ZOaNaE0wrSvPIEEwk5I4B1OhFcjuwyz9lx4ucgeHpnXOyzh9G0qBadL6AXLenYfLSSRe03QsK6hqABPt/AF4ZSWu0JlpQf+UvF/0bYxUpmUYhY4+5FZfUtwxuc4LtjYOqGU0aimjOaE7YKr/Fengxv+65qtjx06PL105RSrtyOrWSrmCAKvwaVuigDsYOVTg7p6FgkPvSZOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXqfIDlKKtSbL6kyYsF97WaIRlFv2XaNGtqSIfIVvto=;
 b=JecDU69jalfsp5873E8KZMWuxKBDGAlf1uLchr+9pT8yjCEWF8DLpatRVK8Ae3pVybZGCdQGoJ8x8GkoP1q3jhpMbb+EsirmrSZT8sLfJUgCjeMvx0JJD5e0OyHDoMGhAs4NOQ6ueoquWM997DDt1rCxUjY/W2a+Qy9tMlGS4wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dc076e36-f58b-43c9-b9ec-ea5d636a0efa@amd.com>
Date: Thu, 6 Mar 2025 11:29:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/init-dom0less: Fix cpus > 1 and xenstore entries
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250305215832.98162-1-jason.andryuk@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250305215832.98162-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 40336117-c44e-4906-afe6-08dd5c99d73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1R0bGcxSXhHUll1YnZrRmhvT1ZtTElOT2lORHFFMTg2NTFaTlVrMkpFNnJn?=
 =?utf-8?B?WXR6QnJadTVrYi9EZ0s4YnhIY0VNWmxaQTR3SFdtTWlJSk1nbkF4NVNhWCti?=
 =?utf-8?B?KzBmSEZFdnloaThmUHBOZU1FcFcwOVBRWDRXdHhYLzFUK2lQYlM1ait1NGF2?=
 =?utf-8?B?NjVDSU9ydjQ3OEdrUEZCZS9saDd2b0NyYjZvUkRzODVHalZ5a3FwVW10QVJ6?=
 =?utf-8?B?Z0l2cTVCcDU3bTMzL2VRTDdwMDJQNHVjbElGazQ1UlpJWXdhakphN0hYdnpK?=
 =?utf-8?B?UzVuV1lZazJNTlFYanJ0TjJPZm1QNENFQVFjNEJwWVREbEllSHlBem04Qmw5?=
 =?utf-8?B?V2NZdngrM0VGWmJZbmIySGI2dDVvcnJ0ZXpjVWlJb3ZHSFhNZ3AwNnJSNVJL?=
 =?utf-8?B?OWw5dVBSZ2MvNm4yYzZaTkN0Q2JjU2x0cElsazlmdG1ON2dYMnZXcWdCTTJx?=
 =?utf-8?B?VG93UTEvUzVLN3JtMWhjL3piWktvWk9uVmVyZjJzSFZhc2JIWDIzalU5WVFK?=
 =?utf-8?B?dytQdmFtd0IzWHdHaUx6aThCK0htUjc0Qi9wd1U1a3JFUmx4U1RHZlVmaDNp?=
 =?utf-8?B?WmxOUVhLWDROZ0NNV1dEYmxtZTgrck9NNHJwMEVsN3J4UENscDQ2aVhud1hq?=
 =?utf-8?B?N25uc25SZXRUU0swcU5RblppV2c4blpqOEQxUWJROGMvamdwVXV0UWp1M1hE?=
 =?utf-8?B?QWJWTFl2U3V1d0h5c3c2NFFoUTdSMTlnVHd1RWVyaEhpZ0J0K0hhWkxsbDJx?=
 =?utf-8?B?MHI4NjFLR0tlbjVEZTh3VXhFOHVJcy8wV1NvWlo2eTd2VjkrSEg0cEtBVG03?=
 =?utf-8?B?TnAyZXg0QWpBV0FIcjh6NVhmbzhMQ3NocUZSWHV1c1lBZHJ6RlhLaS9XNXh5?=
 =?utf-8?B?ZGpSQy9Ia2xwYlREWkNRMjZLKzdCOGxtVHFlSCs0alB5b3JKTmRrS0JoK3E5?=
 =?utf-8?B?bmxYL0FwRzVWenZ1b3dDV3M4NnRVWFFzQUJwYTd0ODBERWl3VDExYytSK1A5?=
 =?utf-8?B?THdyQmp0MzU2NGY3djBURTZZdUJBRU1CYldpZjNpbFB0anNiUUpVWVdsbmps?=
 =?utf-8?B?bEJsYWlQQ2kwZzJXTGRmazRTc2x0TlFxT0VycktNTGZxSi9aa3QwekZwRHBG?=
 =?utf-8?B?cjhMZ3dLclFrbFZha1g1VHRrNzYwUUptRVdrR2dWejFQbk1mQVVUN2tWeFBG?=
 =?utf-8?B?WjJxNitNRHdScThSQ1pDWXc1Q1NBVDJJQkExSW1YNDNMdkpKZjdsc0tzc3I0?=
 =?utf-8?B?NnlNRFZuN2QrdzJUSGozVnFQMGhDSHJKdnlSL2JFUzlFQ3BWRGljc29QamxW?=
 =?utf-8?B?VmI0cjZINUluczBydmt2eENQRWVMV2s0bGdhWCtPQTNpakE4QVZ6V2ppbG9q?=
 =?utf-8?B?cUlGak51MkhyclBobGwrTFhYM2hXODlYQ1RiUjlIaklxNUdEdzFNOHRNb3B0?=
 =?utf-8?B?VXFvL1Z6bG0wMGJOZEZCVXJFY1lIY3F2dXdmNjNMVmRtNStRUTQzZ1BEZ1Yr?=
 =?utf-8?B?K1JNN1p4em5HNyswOXE2VkIraktmT0hPUFVVYWFMdHUrSmxJUzFSanhnSFVx?=
 =?utf-8?B?VkhlbGdud3o0SWxiTVFXOGk2MyticDFCZXBoeUYwajdWY1BST2VhNEE3SnZQ?=
 =?utf-8?B?MzlmZzBCeC9uenozOVpuS2FnZS9CbTlDVVNQSjhxRWJWdG9EYkF4K1hSTFhL?=
 =?utf-8?B?YzJuRDlCdVVmNVh6OHlJTmVVNmNZcE4vYjBlU0w3NnhKeXhORjJidzBDaTkr?=
 =?utf-8?B?TUpwQVZkN2FJeXhRNXZPVU9IckdDb3IrbWpjeTNmck5aMDBpSEJyWExiR2d2?=
 =?utf-8?B?aUpRbXNNVkxNTnNJVnJ6ajhvek1KZmxsbDVLSFRPNUxBdVBZRFMzR0pENHVT?=
 =?utf-8?Q?jYYVK1gEgrdg1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVOQTEyUldXRGJmV00ycERvV3hFaEdXT0xncXgrK1h0MHhXYkRnMjZoOFpq?=
 =?utf-8?B?SFZmZ0pEU05oR1ZFYnYxNG9xWHoxRWJzdmtHbHlGcjYvMVRzUnRpdHE5aU5w?=
 =?utf-8?B?WWEwcnc5bkN4a0R1Y0hXN242emVldUlTemtHVmhGc1hhK3luUExDQ1BzV252?=
 =?utf-8?B?c1JCemVFSlNDU0QvNmYyR0tnVGltQmFTbEZRZjQ4SE16cTkvVkZMNkY0MjU3?=
 =?utf-8?B?Y1EvMFRvdDVUcE9tR1Nlb3FuM1Q4SHl5Q2pTeUJEcGZMQXE0V2ZFMjRtZ0pt?=
 =?utf-8?B?bTZaWmlCb2hKYnoxMTRJclMwMlNGMjk5Vk5PTCtUdmoxeFVFWkREYk1JTDRW?=
 =?utf-8?B?cTFNeFgzdTZGeVJRa2J1MS9EN1pJMVh5NzQwU1dQbGU0c2FJUnJXZnZRQXRw?=
 =?utf-8?B?OTk3cmFab0NmQ2oxREIvUlVoR3B0WVdhbEVMN0Z5eHZhWHJWMFZtQ2FPMlRt?=
 =?utf-8?B?ek84cnJpbndMc1lyV2JvWU9DckhmZFVsV05XZWpSUE5iaHAvVk5LRTY4b3hx?=
 =?utf-8?B?SytVd3A2UUNZZnpGbTVTUUFLY2wycUVZT1dBV2IxbUk1L2paTUM1Nm1SNXZu?=
 =?utf-8?B?WFAwMVJqQ0VvRmcxK3VDR2pZZklKWStTWS9FRkxUM2hteGhKNmlicFBKNWpW?=
 =?utf-8?B?L2o2L0JGK1JNeUIzeVUzd0hRcEttL1N5SCtFbWNhOS8zbEJoK0xPUkV1N2k2?=
 =?utf-8?B?LytrOXVmZ2Z3Z1creG1GNmRTbGNRSkxzUk1wY3FCK21na0VZc2N3aUxPNXll?=
 =?utf-8?B?cFpkY1ZDTWlRckJuSGlSMTcxdEw4eHk5ZzVKc0JOem1vYzYxTjJZTmlSSUZS?=
 =?utf-8?B?RVNxR21hQWFGTXgwZkcwc282UmVaUnJJTkhxNnpVTGRRUzIwMHRVK3VMUUJR?=
 =?utf-8?B?SkZKbjFkbGorVm9iZldDZHI4ejEzWWl6TWxDZkFSang4SmxXZmk0N3FuTUlm?=
 =?utf-8?B?UWU0OE81RjNjL1dyV3FkME9EejRuZDhZdERqdzBLODlNb0tvSExsSmtONEpO?=
 =?utf-8?B?QlprMmQvdWtZbnM2Vi9OM1ZqRW9WeVl6OU1SaXhLbWFQUklxRGx6S3JWc2VN?=
 =?utf-8?B?Nm5WalU5UXpPN2NCYmNGUHoxZU0yWHlFTTZ5NWIzbUhPT2IvWHdvei9wRHBU?=
 =?utf-8?B?QUVyZHViYmk4dVkyOUhVMDBKL1lxdnJHMy9wMXk0cFVpR05pZXFTUnBOajlS?=
 =?utf-8?B?Ums3YlhTbnlzaTdSdy9hYTdyb1J4VFBINCtMUHBvRDhVNHVCaDhTUjBubTN5?=
 =?utf-8?B?SEZxaVcwU1YrQm84Uk9TMHJNcmFVSTlpdE8zeTNmcS9wWW9PR2w1Wjk0cnBU?=
 =?utf-8?B?NHFCSHNOQWp4WlpxR1ozQTU0RWtKNGlCallvOENKR01Ta1BadkZuSUFBSlVn?=
 =?utf-8?B?am1xMDF6YVJWWDBmREpPUUhMb0xTU0lwTmZyc1B0a3BqRGNkaTJxYng4ZE5k?=
 =?utf-8?B?OHVLOGg0UEZIMnl6MDNqSTNRbEhiS2psQ2xBcE9ncGI3SWlYSmlBY0wrSlFM?=
 =?utf-8?B?RVRYY3pxekZXRys1UjlkUlZQa3VmeG53TExXemNuRkVielJqSWgwVlhNcDdq?=
 =?utf-8?B?OVRtL0pXWHl4SWYwb0x0TS9nWkpjZkx1Y0tla0cwZ0E2SnJwbU82MkJZTjlt?=
 =?utf-8?B?QTRnTUVYSk9LZEVNKzFFcG94MFY3N3AwVHF2UWk5ZTVxT0txTnp1VG00WFA1?=
 =?utf-8?B?empvRnBZRGU1SzJOTmFFYW5ZYjd6RjQ0MkluVVZQRXhHcjl0ekwvK2dsK2J4?=
 =?utf-8?B?c2kvME5TVkVBWEovOE8zWVY2cDBiRGxYZHRYaUxWYjI1L1pzSGE4ZkJJMWxB?=
 =?utf-8?B?OG5kQTB5RVBrNmVyTGs2QVJydDc4Q0wvNmtveGRteDNQNmIreDF2WTY1bFRJ?=
 =?utf-8?B?NWwxS1p1TGQ0R1FNeXBscFlMN3ZGUXNzQlVCZ0NFMU96dFlZRWVkZFlTU2Fr?=
 =?utf-8?B?YkpvNXhGOFl6MENKaHBwNVJvcnJVV2lvNWtJY2NKUVFnbGtwR0hOZFJONDZl?=
 =?utf-8?B?ZUd0MFRwNHRvOFVKM25xcVY0d3hYbHE3VzUxNm05UDNQb3BlVGxkWUhOck9k?=
 =?utf-8?B?enJXOEN0cUgwSnlpdVBzMHduQlRXandoOFk2WWY5SG91L0htTXd3Rno2MjFF?=
 =?utf-8?Q?Kh6s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40336117-c44e-4906-afe6-08dd5c99d73e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 10:29:56.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yAIehOnEfeA8OCPlk0yp0y1OsrGLo4djTMP9YJkmKPLi7wT/Dooz8klCfD4u5Yl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541



On 05/03/2025 22:58, Jason Andryuk wrote:
> 
> 
> The trailing / in the path is incorrect and generates an error when
> writing to xenstore:
> Checking domid: 1
> Init dom0less domain: 1
> init-dom0less: writing to xenstore: No error information
> 
> init-dom0less exits without finishing initialization.
> 
> vcpu_max_id is an inclusive value, so it should be included in the
> loop's range to include all vcpus.  Without this, no xenstore entries
> are created for a 1 vcpu domain.
> 
> Finally, use vcpu_online, the count of online vcpus, to determine online
> vs. offline.  info->cpupool is a cpupool id and not a bitmask.
> 
> Fixes: ec53e0c4ea ("tools: add example application to initialize dom0less PV drivers")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  tools/helpers/init-dom0less.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index 17579fe2e8..c569a890a0 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -182,13 +182,13 @@ retry_transaction:
>      if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
>      if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
>      if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
> -    for (i = 0; i < info->vcpu_max_id; i++) {
> -        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
> +    for (i = 0; i <= info->vcpu_max_id; i++) {
> +        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability", i);
Up until this point:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

That said...

>          if (rc < 0 || rc >= STR_MAX_LENGTH)
>              goto err;
>          rc = -EIO;
>          if (!do_xs_write_dom(xsh, t, domid, cpu_str,
> -                             (info->cpupool & (1 << i)) ? "online" : "offline"))
> +                             i < info->vcpu_online ? "online" : "offline"))
I struggle with this one. Let's say that a dom0less domU starts with 4 vCPUs and
later on (before executing init-dom0less from dom0), decides to kill it's 2nd
vCPU. So domU is running vCPU{0,2,3}. With your patch, after executing the
script, the 4th vCPU will have its availability set to offline and domU will get
notified to kill its 4th vCPU. That does not sound right...

~Michal


