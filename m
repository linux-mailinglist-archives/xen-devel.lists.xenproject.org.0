Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A66B2F591
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088447.1446192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2n1-0005BI-E7; Thu, 21 Aug 2025 10:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088447.1446192; Thu, 21 Aug 2025 10:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2n1-00059B-AV; Thu, 21 Aug 2025 10:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1088447;
 Thu, 21 Aug 2025 10:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9ZH=3B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1up2n0-000595-Ka
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:45:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2406::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e10b5c22-7e7b-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 12:44:57 +0200 (CEST)
Received: from BYAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:c0::24)
 by MW4PR12MB6801.namprd12.prod.outlook.com (2603:10b6:303:1e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 21 Aug
 2025 10:44:52 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:c0:cafe::29) by BYAPR05CA0011.outlook.office365.com
 (2603:10b6:a03:c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Thu,
 21 Aug 2025 10:44:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 10:44:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 05:44:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 21 Aug
 2025 03:44:51 -0700
Received: from [10.71.193.195] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 05:44:50 -0500
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
X-Inumbo-ID: e10b5c22-7e7b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqsZD/cx8zq3AKD9p2ttV7vUNY+KwzDaIXl7vfat5NbcgI+z78lkva089dBbPmMm7qGhvvN8IbtpLAoMHBchz2lNuBK42Out0yatIykKldkKg9OZwBfVc7AFcOSO0YZp/98Iui9QDu/jKKPDIeTE1ghBiGb2wvnXb1Cc0fQqTZIVnrNreMntbftVpoKieYR7cTN6hGMbHMMEMq8BFcPa/tnjJSi94EOxmPiaoO5PYjgjVLMTdWODDSyOMAHr7EA1vJQqDgqsTro2NEJ+AL7DWB5GnsiePgPeXHWJ3ipNfJWlQKm/TpeRY2AOHe2gyoyuWsHASGi++lUy7Ou0nySxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVX7PgK0RRLc4eLIU8ow+X8k4uG2SZwxCU9rooQZTRg=;
 b=UryR/CUlSj/xR/vpcQlplPvKi2vmQlkWfrHvj16Goab2lK5TJwAu5xPblOzG4u5+aqfrtqu0spnGQ73YaCTbc4jTyqbAOdN6AipoGe/uUSXaYVKA5uXYWwaOUgYIGDxGnMbk2MxbmzmvQSAlrsbL7mLhFC6jcwfzgfb3G4611lIt/127xjM2NCCj5Ybe37I9QhZC8jCzO3CP0KPpvUGbvfeDWOFxNo9GIgcJdY70BpfAxOhVci5KxglUYaPxRy5SupajpPhzmlF3XwBebmiwwGxGpI538HUFHCoOvci+QNhQlUNvacs0gVBKOa1ko8hsWOUH9OyYj71bF0bxmk+5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVX7PgK0RRLc4eLIU8ow+X8k4uG2SZwxCU9rooQZTRg=;
 b=YfkqTZfCT4tnGgiordV9RRS2DRrCQ3DRiYEaS95Rt3zX/uwdQsDp7RhbBLfAFlsbbUmVR+w3h9nfo9yCrLZ9rjPZ1+Pt7pqfRxz8JAxBXQQiBE/+NOptVajdqy0y65DVEmDjJZA7bZVGAylD5VnVcK6IxJTX+N6i+npYVWjrTzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3feb63e6-e2a6-498b-bba6-5e46267f93dc@amd.com>
Date: Thu, 21 Aug 2025 12:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm/mpu: Implement setup_frametable_mappings for MPU
 systems
To: Hari Limaye <hari.limaye@arm.com>, <xen-devel@lists.xenproject.org>
CC: <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <f08c240934fc126b651096a315da84d2d8e15197.1753864612.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f08c240934fc126b651096a315da84d2d8e15197.1753864612.git.hari.limaye@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|MW4PR12MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d49384-5fae-493c-40bc-08dde09fc2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFc3UEFPQVpBbVpiSmlVM2dRNm9mdTNwTExVcXVFRktlVFVncVNCQ1VNRXph?=
 =?utf-8?B?ZlEzTk9uZVYxMWxHbVVHdWp0ekN6M0NuYmh0dkgwaXRyT3czMnMwVUo4ajVu?=
 =?utf-8?B?S0VrVlorak1sbnpnVWJkbkNKSzFNaE9BVU1uSGZqTExLOE41b2pNVG9OdVN6?=
 =?utf-8?B?QkM3QUdEM3Nia093SzQ1RHRraFQvdkphbkIvcFNYZDJBSFR5bTdseVZqTGVJ?=
 =?utf-8?B?VTVwOU8yalhXYVdBZHZoZ2N3VERHTGFBa1M0L2FBTnJ3Z3ZRMUd2N2dJNWZW?=
 =?utf-8?B?d3IwUVhVbFZxRjhQaXV5WnNzRndGSTlPK3FjT3lQZ01JZklSMnBYRGhXUnNu?=
 =?utf-8?B?dVdZNzFzU2lGNVJrZStkRVNRaXpZVkdqT0lGNFpIR29mK1A0Rml4cDVKek9s?=
 =?utf-8?B?S1ZQZC9JVkhzbFU0ekJURFU5OXBQbE1aZFRlMFNnMTE2cnFSOUFmUmY4ZmI3?=
 =?utf-8?B?RlAvS2lHbGdOaUV4bldoaE1hSks0NDRXWXo3WkZMTmlnMysyYjQ1U0JXaUtq?=
 =?utf-8?B?RHpPeWVIbE1GRjBWWUd0YWkwRXZ4TjdxeTQvK0FSejdEWGs2VWJZb0J5ZC9J?=
 =?utf-8?B?TjBDMFp6Q20vNE51ai90dHp5MjFtNkN4Q3FidEZKUU1RM3pTSWJFUmhKTVFh?=
 =?utf-8?B?RjdVbWpyTzNZblAyOGZmK1p2STN6N3VnMnJkRFVBdEg1MVo4M2QvSzJWaUZQ?=
 =?utf-8?B?R3dUSlRibGZJdngyK2pSOGZnRHI1UFg2T2xMQTJrYVFldGxuOHg2WExzQkZU?=
 =?utf-8?B?bGVWY2R2QjBsdnQ1dExDSDZrSUlTdnBxa0Uxbm8rL09lZVpjQnJiTlg2NGxV?=
 =?utf-8?B?cXpwQVJkbjJxM1NvSUg5M2x2T3pBZWFUNXFvSFJZTG1UZ04xMUR1VEZSL1NR?=
 =?utf-8?B?M3dvRHo1WUNBU2ZXTVV5SFRRNFZQOExOazNueUl4Ni8vRmdydW1xdklSbGZO?=
 =?utf-8?B?THIxZEVxRm51UVZweU1CekVjVWdUbHk0THYyK29nWVBiSHJlcGVuU05QNVcy?=
 =?utf-8?B?dnBaWjdTWG9FQkdEekJ4QlF1QUQ3dW1PcjhYVWQwVGNQbHhYaWZ0TThUcXEr?=
 =?utf-8?B?Q0FyZjMzWXlVWjZlakhycUdzdzRxYUlpZHF1cGxDMnpGWnArQURZVVdHMWlY?=
 =?utf-8?B?VVR5UjJaSGtMVGNxMVJXUjBPZnMvcExaQ01EUE1DTjRMdFZBa2tCK3FCV1ln?=
 =?utf-8?B?eTE1VVdVbmdGajlaV1hZeG1JQVNwbjh3MkdFdGsza0Y2UHFxcUZ0VUxnTk15?=
 =?utf-8?B?SS9NdWZJdXRjSFZPS3RtZWtuaWJuUklUVzlnUGlxVWVNakdMblFGdkV0Zjc2?=
 =?utf-8?B?SkliVUptVVErdmRvK042ZFhEeDVpbFNiditUSEs1b2c2d2dIczdXWEtDTDdi?=
 =?utf-8?B?UlJPZkJZWUFra2ZTby9DdFFIckhURWlkaFpkVjV0dGk4SlVSWmJueHVWRDBq?=
 =?utf-8?B?bElFVi9xK3QzMTZoWmcxRTNEQTQ2QVpOcndZdUVGVGphUWJuMTdsZHNDbyt6?=
 =?utf-8?B?MlZGU3VQcjh5UzlYRHBCc1FGb252bk9zYXJhUFBuRjNMM0s1dFRhclVTejB1?=
 =?utf-8?B?WHBndGxsTmZnWW1LWC9NYkhHSVVZMndBVmNkbHpsNFc1V1Ric0Z2M1N1N0pC?=
 =?utf-8?B?ZGl2ZGNBMEt3SVJwNTU4cVlqMjVOT1ZnNjNwNGFPZkppemRSaG9hbVZ4eUxy?=
 =?utf-8?B?V0pqNGM0SzNUS25ncEcrRlJEYUlGL2JPcDB6Q0g0cXQ0UC9VOE4zelpzWFo3?=
 =?utf-8?B?S3FpSGhOa3VDVnZnemgzM2w5S3FiY0xXWEVCVGZwWlovRUJXL1B3RGszVW10?=
 =?utf-8?B?ZlN5VHFabUZWRG9scGhGcjJHR29zRGtRSXNvQzdndnpBM3JYYjBCTS9OVGZL?=
 =?utf-8?B?bEM0czhuSW4wdkFOMnY4M2dnSkdGdGt4Q25kK2laN054M1NkZGtnZHlmSm1M?=
 =?utf-8?B?MFhrV2ZiejVCazZLYjRzb09zR1lidFVaN2wvRzkzU2J5NHl5Mlg5cVM3QzRV?=
 =?utf-8?B?WVBYanM0UG02MDAyZWFyZFFlc3p0ZXFPc1JWcGlnT0xiWUgxSk4rdy9VZGlG?=
 =?utf-8?Q?xezzYn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:44:52.7009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d49384-5fae-493c-40bc-08dde09fc2c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6801



On 30/07/2025 10:45, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement the MPU variant of `setup_frametable_mappings`. This function
> will be called by `setup_mm` when an implementation for MPU systems is
> added in a follow up commit.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>  xen/arch/arm/mpu/mm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index c6891607ec..6a16fa348d 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -168,6 +168,25 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>      return MPUMAP_REGION_NOTFOUND;
>  }
>  
> +/* Map a frame table to cover physical addresses ps through pe */
> +void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    mfn_t base_mfn;
> +    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
> +                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
Don't you need to make sure that ps is rounded up to page size and e rounded down?

> +    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
Why don't you need sanity checking with BUILD_BUG_ON to check frametable size?

> +
> +    frametable_base_pdx = paddr_to_pdx(ps);
> +    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
> +
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
> +    frame_table = (struct page_info *)mfn_to_virt(mfn_x(base_mfn));
> +
> +    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
> +    memset(&frame_table[nr_pdxs], -1,
> +           frametable_size - (nr_pdxs * sizeof(struct page_info)));
> +}
> +
>  /*
>   * Allocate an entry for a new EL2 MPU region in the bitmap xen_mpumap_mask.
>   * @param idx   Set to the index of the allocated EL2 MPU region on success.
Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



