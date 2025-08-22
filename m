Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA2B310C6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 09:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089630.1447140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMUr-0001Gt-Pa; Fri, 22 Aug 2025 07:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089630.1447140; Fri, 22 Aug 2025 07:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMUr-0001FB-MZ; Fri, 22 Aug 2025 07:47:37 +0000
Received: by outflank-mailman (input) for mailman id 1089630;
 Fri, 22 Aug 2025 07:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1upMUq-0001F5-Kv
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 07:47:36 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2408::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 445786d5-7f2c-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 09:47:35 +0200 (CEST)
Received: from DS7P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::15) by
 CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.16; Fri, 22 Aug 2025 07:47:32 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::f1) by DS7P220CA0047.outlook.office365.com
 (2603:10b6:8:224::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 07:47:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 07:47:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 02:47:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 22 Aug
 2025 00:47:58 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 02:47:29 -0500
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
X-Inumbo-ID: 445786d5-7f2c-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGKfeidWxaZJfXzX75eBtp+cIuEjfDr8Rfdd8633AfTfMTsYq6J4c4MaEa60XJuRDVi6IUsAABc0zf+oww5485xwbLD8WFNejMWxu/ftvFM7lxQkPGYhd1Qelk62XE0uzGli6JvPyzEOUVG8gigps9guH74H+Cx+h99iMfuGNTGN+VANcSfwwc/unPlfhK67cptmNUuCJo4BP2myTzVAf1LSnN4ytxE6v6oEv+qgIOvb38i2CZ8G1wAuL96P2NUScly8NUUKV3pWPJj3mRxDR8mPz+9kWInGZGXYZ2ppap1we+QIwm42mExV0wcILzudJxGxCvXTYmF+JQkz2rs4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaGsodyd+rPnzhpCwn8BggOXWRB4D29uFUSSXKjobT8=;
 b=VwHksSdXudnHTeNJP18WGxCTOndWxcxglIukMPxtfrqblv/6iDQ2kbadOagphaXBr1i47to8a2SOTZ6/U1Ih9m4TzhMNzPheu7p3MXFNduBTzzbWQk0x6s0b2EX0vWJRVClRyb4HLG6eCBLjgQowdepXIxlZrZyDS3bjpNq772Vl6HFcUVnpCMT+o4y8xMRt6OY+uI79NwEtn/2ULSVMvIx2kQSNM4nN3/9B9P+6HxhG2Gw1DdaFun3/8/V+lUbOeqp/M/j4fabrYfc+Z40n/7Nzh3Gl0mV/xIWNic/7D8YQoFKASDn4hZtBgDaifz3bBSMo7/sh3IVGrMDBeND/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaGsodyd+rPnzhpCwn8BggOXWRB4D29uFUSSXKjobT8=;
 b=A9Ab1MDRhmGeIF/Z1M18GiiaFwX5Jo8w41XSR3uRIEBa2+I/k5D7UR6OahSXcTtvOuo5LdMveT6bxuWEzI4zRu1uickHmDfgTiaTo/+CbypGJ7b/2MDrPQBIv2R+6y7ArqIRkJmtVGRuz/8wEE12skFLa+SI3hx8Dgmlk4iEBVI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7b0d40b6-667b-4bce-89b9-397a647b48f2@amd.com>
Date: Fri, 22 Aug 2025 09:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm/mpu: Implement ioremap_attr for MPU
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <ad8cc76fb027efa52e0eb51f6ba7a918fad0ae52.1753864612.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ad8cc76fb027efa52e0eb51f6ba7a918fad0ae52.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b8189a-0fff-4829-afb4-08dde150269c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V200TThRNWxuMVVQM01qLzhBRVdYbVhydWtYTmUrdVRDeCtaaktXVWdLdkd0?=
 =?utf-8?B?TUgvY0hLU3RYc3RlZk5GcWJHT3h5aVhLSzhWOS9vUTEvSGFpNS95V3RxTTJU?=
 =?utf-8?B?Y09uajRxeDUyVmhkREJQUGRpSWVZN2pYeTNxRzBFbGt2MTlNem4rSVFYaThP?=
 =?utf-8?B?VFhhZTVxOEpHV0N0VUJnSlhhOEQ1MHVjUjlzMXhza2VsQ0tjS2hOOHZwL0Rq?=
 =?utf-8?B?ZE5HakQ5RW5ldWNsTVFDamJkNEdaZGpDdmlRSnY3SDNMT1p2Y3JaUDJWdE5o?=
 =?utf-8?B?THlGaW4xak00L09uYzVLeDhUdVhLWlA3UERlcVptaXdVVUErLzUrSXk2UWla?=
 =?utf-8?B?am9Yelk2ME82d3RwdkZ3UmJtbzdvcnJIVmRxOG91UDdOR1RjQkxnQy9GRFFp?=
 =?utf-8?B?OXRUYzlzZ0xPcnY1d0VhNFBHeWJQdnlVbVVBc0xqSzVCRGZMcVo4SzBnRnlJ?=
 =?utf-8?B?Tk1iNjBQMENSK2VHc2RiaU9LMDVVd3NuUGZaVjBpNUgzODczcGZVQ25xekxK?=
 =?utf-8?B?aXp2eFUwb3d1UC93LytQdm9Fb3VHZ0RKdkpKU1UvM2ZodnVWSC9DRDduRTN6?=
 =?utf-8?B?OXpZSkRlY2p5ejNMbXJ6MXhONFYwS3NHcG1JdVVUMHlmdG1lNFhzT0M5cWRT?=
 =?utf-8?B?OFhYZ1QycTlQNUtKeGM1SEdUclh0UEV3U0tWcjg1bjlxQWFzekhRclhQdC9W?=
 =?utf-8?B?bUdlTkQ0dU1vMW9FYSsrUnFRZEpERThTODNDWDVpTUV3dy9BK01iaTVPWDYv?=
 =?utf-8?B?UVpTVGY3c1lZUzIyazdhM2oyL0xiL2swUEhiMWpmZHNjaG9vOEd6YzVSMjBp?=
 =?utf-8?B?N0RlZ1BvSEdJNWo2R0trQ0ZySldOanFyVEg2N0U0KzlaazBlak5iNFlaMlNJ?=
 =?utf-8?B?amg2MHNSRTQwL05OMnQxMGx0ZTFBNDhIZ2hlMVZuSzRlbVl5dEd1VUZvVHMz?=
 =?utf-8?B?V1o2ZGdjVGYxd1JLRHhoeVNyc01VR3FlU2pZNittSEh3TS91SVFwN05ZN3Jk?=
 =?utf-8?B?WCtMTjJhM0M2bUc3N3ptT3NTSmVlQnpJV0t3Qi82NTBFZHBab1pvMlpHN2Ey?=
 =?utf-8?B?amEvbFV3dlhPdFNhSjdoVTNzU0g1MUEwcFlnK1dDSGxpdVhFL3llUXcxSkk0?=
 =?utf-8?B?WnlBbWxSanVBbEhFZkpsK3lZRWJtY29lbi9KeDUyOGF5enlCVVBqNlZBZHdz?=
 =?utf-8?B?aUljWEk2OVFZeTlPSlJYdy9CaDhKVDAxMlBNKzhGZTdKeWxGdE5maWU4M1VN?=
 =?utf-8?B?THo4UTZNa1M3dXRUQ3hNYmw5eFBoNjc2Z2RsNFRNTHJRWUUyNXhZSEZZbTZL?=
 =?utf-8?B?VWxJNG5Ocjk1Mzl0dksxVjc1RldpN1FhMGxYdmRYdUtVMXU1MFJsWWlodTV5?=
 =?utf-8?B?R0dUZGFhdlF2cXFlRE82NWxJbkd2WEdxZU9hSWdHZndISzYvNUp6TG1UNndI?=
 =?utf-8?B?ZVIxZDBOSlFUQmdJTzlDQ256b2VEeSt5TzFaZWxxNGpNL2F3a1NidUcxeERO?=
 =?utf-8?B?TUFpM2pjTkEzdjdiemJGN3FoZlZhS2t1M1dKSEYwRk1BdWpIUVFuRDVNVzMx?=
 =?utf-8?B?c09sc1pDcnpWdkduUG53NnBVeUtNTnVtNXlxbHVWODBVdnpoazVyU2pkUWNt?=
 =?utf-8?B?NnhKNHJuQnFVbFB3MS9LMXlQT2gxdTFLaWFWWmdxR05RNTU3bVM4Um1nL3ZI?=
 =?utf-8?B?SnVrNlNJdHR1RWs5NjVIZWJwVnVDamRFbFZOeEJ4SVZZM1lRQThCZStuRlVF?=
 =?utf-8?B?a3FjZUN3R0pxNlROR1dnZTNRL0FxcHhjWi8zTlJxcjh5bTBLUkVtMDcvdDdV?=
 =?utf-8?B?WE1kendOeTZua2xKVi94UkhjQTFEZTNGbFc4eThPNVlVTVpzcFQvWXpLRU5C?=
 =?utf-8?B?VytBMmh1a3FhOTFHV1B4bHREYmM2ZXQ3ZitJVmIyYXBxY3pkcHJYbm50dnhV?=
 =?utf-8?B?ZTc4bGZ4MmtXQ29pWGxZdlhTVENXS2k1MFh6d01pRVFKdXlSMGtMRVl1cWRh?=
 =?utf-8?B?NXlNS2wvWWkzempsbmY2aTczMmZZcEptNGtpSzN5WW16aEIwaVBVd3h4VkY5?=
 =?utf-8?Q?j1wh8l?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:47:31.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b8189a-0fff-4829-afb4-08dde150269c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066



On 30/07/2025 10:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Introduce helpers (un)map_mm_range() in order to allow the temporary
> mapping of a range of memory, and use these to implement the function
> `ioremap_attr` for MPU systems.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>  xen/arch/arm/include/asm/mpu/mm.h |  22 +++++
>  xen/arch/arm/mpu/mm.c             | 150 ++++++++++++++++++++++++++++--
>  2 files changed, 163 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 56ca411af4..177550f5bd 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -106,6 +106,28 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
>   */
>  pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>  
> +/*
> + * Maps a temporary range of memory with attributes `flags`; if the range is
Why do you always mention 'temporary' in the context of these functions? What
prevents us from using them to map a region for a longer period of time?
Also, temporary range is a bit confusing term and should better be replaced with
'Maps temporarily a range of memory ...'

> + * already mapped with the same attributes, including an inclusive match, the
> + * existing mapping is returned. This API is intended for mappings that exist
What are the use cases you want to cover to try to map the same range with the
same attributes more than once (without unmapping in the meantime)?

> + * transiently for a short period between calls to this function and
> + * `unmap_mm_range`.
> + *
> + * @param start     Base address of the range to map (inclusive).
> + * @param end       Limit address of the range to map (exclusive).
> + * @param flags     Flags for the memory range to map.
> + * @return          Pointer to start of region on success, NULL on error.
> + */
> +void *map_mm_range(paddr_t start, paddr_t end, unsigned int flags);
So far, all the MPU related functions use [base, limit) instead of [start, end).
Do we see the benefit of diverging here?

~Michal



