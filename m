Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF8AFD954
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037274.1409922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFad-00022S-KG; Tue, 08 Jul 2025 21:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037274.1409922; Tue, 08 Jul 2025 21:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFad-00021I-Gd; Tue, 08 Jul 2025 21:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1037274;
 Tue, 08 Jul 2025 21:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xvV=ZV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uZFac-00021C-OW
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:10:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08f016bf-5c40-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 23:10:55 +0200 (CEST)
Received: from SA9PR13CA0152.namprd13.prod.outlook.com (2603:10b6:806:28::7)
 by SA1PR12MB8094.namprd12.prod.outlook.com (2603:10b6:806:336::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 21:10:52 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::9d) by SA9PR13CA0152.outlook.office365.com
 (2603:10b6:806:28::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.19 via Frontend Transport; Tue,
 8 Jul 2025 21:10:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 21:10:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:10:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:10:48 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:10:46 -0500
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
X-Inumbo-ID: 08f016bf-5c40-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdl+gzgzEj4aJbEYTzYbQGzWRZNheaUi4wXsOzn7gHkwOxQMLZTLobZ2aYcN8g6kqyivXC/W+m6SfvOUkH9xnTrAfXGEN8BiFhFgicsNxLAmwEop8AVOCu3lpAAf6qTH3nYGlqjbp+W5jo+f4O/mbIYiaWjJVUApgf4TbDrtkLWKM3fsIY3Xg81nEdmui0DXoO8caUtHW+oqyuVQ/fZ+HUkVB+MqMgEAjBwNg+Sgfaomr7pf1VfPZO5562mbLon07HgXTr10YSh7ezVSycJG/650ErtEowMR36gmCJ/iiXD3RDaC495V7D+NUgDPG+BbNtNyEtcimqUosy2m5EzwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTRMlXP2+VlazyO4oFEv2whmGPrbxpH+MGZd7bOfNEo=;
 b=FIl3ck6rNFHWfaN0SXlzg1YfutxyxcOBKSXn2dGMbISIfd3xSuH0i+2iIwW6C0hC6/vfg8+gRLWM9eNNnN4T3T180okbsQRaWoir5MHIS0v3JIdulqhKfqzHBWfWnl17vJsCcXnJYGfKfH98dF2TvD9HZ/wSIRrXrM+P5rVYUHQzz1lxiCoNQ9dger4vO77WZarTm/2jxmWknTxm8MUJUPcmsF3oxF18GF/ZELe0Wsli3F0HphdkWrYv6W+IW5D8oI4OlvZk6q7b5EaeycBWX9fJISeGI1GQNg5lBHNjLBT7xp6rrq5G9II8Bm8a9XkWG1u4/hQK5b/4pUSUnbPlzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTRMlXP2+VlazyO4oFEv2whmGPrbxpH+MGZd7bOfNEo=;
 b=jpuI32rTWddany/chZ4wYn8vOaoVo56tWr+U7iyLn6/fikcI3rrsa7YcijTUwbRf3lrFiY0IBM6/0envI+fawK6LKD3GEsLeSK1mXrK3cACk1+hVH3R8iA53GtFOm3Pzq5nw6adTHrD/yqTmPxVrB4dzrGhnbbIDbCJrKH6Z40A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <405399e5-b6a2-487d-9937-1ed5aaf0d957@amd.com>
Date: Tue, 8 Jul 2025 17:10:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains
 created via toolstack
To: Koichiro Den <den@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250705142703.2769819-6-den@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SA1PR12MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: faa86b5a-dea7-48ff-c123-08ddbe63e9b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTliNkgxdTlTcVM3NXZpMnhSNzFaZGpvOHJIUFMreHE5VVZzWktueWtmMmhY?=
 =?utf-8?B?cWJLL29waWZ5cjFNNlVWN0sxNDZlVU80N2Q2aE1YckliTTRHN2JXQXVscFRI?=
 =?utf-8?B?bTFRUzNRZVAzZW1QM1Y5cEhYcThXVVVrV2dKRDJ3cHlvZ2VQN01BU0NweE9M?=
 =?utf-8?B?eGVPM2dBVHlDb21EQTBzbWFiTU5YanJ1b1F5SU9JRGhFMVB1OHFKbUxkMkpQ?=
 =?utf-8?B?M1M5QXlTZDJ3L3ArUEFaYlZObkwrSXZVVzczZ05oSTc5RGJzaHdxUHMzUEQz?=
 =?utf-8?B?Q0oxN29hS3N2SFhLaTRRaERWRnhZN0JNdk45aFAvcllvRmhjNlZSQXVkdm5n?=
 =?utf-8?B?V2MvUWpGbVVOTXFadTdtTUpUZ2tMaEVjZ2FEKytYeGFGd0pEWkJKWFNQRkE4?=
 =?utf-8?B?bDNMeERBMVk0cEo1Sko2OXlwU2FHdkM5QUFBR3lMbHVQcjBIRllRb1VkMXN4?=
 =?utf-8?B?Zm5uNDhpcGl6VTdmcE9BVXZpQXBzam9BdkJadTBOQ3ZVNUZqZGg3MTU5Yk9u?=
 =?utf-8?B?djZFZ1dxQlZMZzA0WnlSU2pwaXZkaklxWENTZGZDNkhwOHNFbHl0M0IyRUsx?=
 =?utf-8?B?TUhoMWp2NmR4VVlVa0RWYVZGaUxQcDNMbXFqcXNvNDRyWkZRdzV1ZWN0dzNm?=
 =?utf-8?B?RDdPcjhFRDY0YWhMZm55UDJGY20wTkxqOTFEMmQzWlE1VzNQeGFVNm1XcHg3?=
 =?utf-8?B?S3B4eTVIM3I5L3hnOGpCNmN5YnB1ZGJIcisyUGl2YXRkQmtuNzdVb0tRN2lW?=
 =?utf-8?B?WTlKUnB5WVJOdzMvQXBzMDRWQXM2ZW1idGkvMm9veTVyaUNDa014dTBpN2Ix?=
 =?utf-8?B?NTlXWk4ySmwwMU1vR0xxU1hwTU9XWC9JdmxYRnZlbm9WZC91R1R4QmJPaHM2?=
 =?utf-8?B?YmErTmhQaVVENWdrRWdxN2Iyak9WeUdwTldyTTZzR3REK2ovR0UrbzcvdGJQ?=
 =?utf-8?B?NWl2YkNQUzd3UTVZT3I0T1VoU3lRZ29uS1NTcWtwQUJqaTZUejZld2VXcjFz?=
 =?utf-8?B?UUl0eUhpdkZZYVhtME1FSytPckJVMVdXYVdwd2hzVWs2MHphWXN5RXN5d1BC?=
 =?utf-8?B?VGFUTC9KWFBQcmwyVnlNZ1h4SExTenY0S3BiUGlJN1NrSXBvb0wrTFE1VDJx?=
 =?utf-8?B?WDNCUmJReGs2Q1UyRWwwRHRsVEZPa2xxdWlJWjhFK3VHL1AwS3NEbnp0Nkl6?=
 =?utf-8?B?ajdTdDNZeGRpdys5eU1wVGNkQWp3eUNUZ2Uzc0d1bDZocThyMTlBWUhjSy9p?=
 =?utf-8?B?bDl1YnNkeGR3aHdpV1NCWW5WZ2F2d09CNmhoK2ZmL3luL3hzaXVMaHliOW1U?=
 =?utf-8?B?Zm14YXpTSXNmTG5tNlNEamVrZmdxRnJQZ1gvbi9sZ2ZqcFRIQ2Z0VTBKZ0xt?=
 =?utf-8?B?QUZkY2NKSHlEcjNRMkZJTGFSRTlvQWQxRTB2R1cwREpnWkdzUllTZlBDT3NE?=
 =?utf-8?B?MEs1VGNCTERpSkVuNmtsSEttU1ZySUhZM0d2UlcwOXplTDlGSDZQUU1qZkEw?=
 =?utf-8?B?bWdKZGdzcDdPOUVZZys0ZUQ3MTZMOEpMMU0wc2h2U1dUdk1kUkQrWkpPUUtB?=
 =?utf-8?B?RUEwTGxJb0J1VjIwWVdHeTNmZ1lwOXYxTk5aVUtQUmRmRG9RWkJoSHVuWmdh?=
 =?utf-8?B?cnNaN3o4eHlXR1VVaFJrTnF5ZmFaUlRVYnVXb28zcEJ5MDVHbzAzcjE0Nk0w?=
 =?utf-8?B?N2J5M3E1c1FWVmFmUjJnd0VkNUFKSEQ2cmpvbWo1ZXg0MnZ6WEYyTnNiRkl6?=
 =?utf-8?B?dU95Nm01eSsrbUczTUhlclgrTi8wUGxXSEZaQkwvYk9SajZ5ZnBGVlkwNm84?=
 =?utf-8?B?N1FIRTdWRGFTc0gwS0JadXZmQlFNMTZBeWdhcGRmLzEycEVhcFJUd1drZlQx?=
 =?utf-8?B?NWdQK3RDNEdCTGpxQTRTaEdPU0RJMjJRWWphKzhMeVE4ckViaklJT1p3YXNP?=
 =?utf-8?B?Z3p6S0VPeW1Bb1JjRUY4eHlDbmRTa2N3V1BJQVVXSzR3RFdlRWgzNnJLVHBL?=
 =?utf-8?B?YVdXdUxOcXo1Rzhib2RVSHZVcytOVWZkSlpJSmtkSHBqNXV0MWVjalFHZGEz?=
 =?utf-8?Q?FaNL3O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:10:48.7848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa86b5a-dea7-48ff-c123-08ddbe63e9b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8094

On 7/5/25 10:27, Koichiro Den wrote:
> Implement ARM DEN 0057A PV time support for domains created via the
> toolstack, utilizing the newly introduced XENMAPSPACE_pv_time.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  tools/libs/light/libxl_arm.c | 185 ++++++++++++++++++++++++++++-------
>  xen/arch/arm/mm.c            |  14 +++
>  xen/include/public/memory.h  |   1 +
>  3 files changed, 167 insertions(+), 33 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 4a19a8d22bdf..33251520c07a 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -684,6 +684,40 @@ static int make_memory_nodes(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +static int make_resv_memory_node(libxl__gc *gc, void *fdt,
> +                                 const struct xc_dom_image *dom)
> +{
> +    int res;
> +
> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64"))
> +        /*
> +         * The stolen time shared memory region for ARM DEN 0057A is currently
> +         * the only user of /reserved-memory node when a domain is created via
> +         * the toolstack, and it requires both the hypervisor and the domain to
> +         * be AArch64.
> +         */
> +        return 0;
> +
> +    res = fdt_begin_node(fdt, "reserved-memory");
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", GUEST_ROOT_ADDRESS_CELLS);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", GUEST_ROOT_SIZE_CELLS);
> +    if (res) return res;
> +
> +    /* reg 0 is a placeholder for PV time region */
> +    res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +                                       GUEST_ROOT_SIZE_CELLS, 1);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>  static int make_gicv2_node(libxl__gc *gc, void *fdt,
>                             uint64_t gicd_base, uint64_t gicd_size,
>                             uint64_t gicc_base, uint64_t gicc_size)
> @@ -1352,6 +1386,7 @@ next_resize:
>          FDT( make_psci_node(gc, fdt) );
>  
>          FDT( make_memory_nodes(gc, fdt, dom) );
> +        FDT( make_resv_memory_node(gc, fdt, dom) );
>  
>          switch (info->arch_arm.gic_version) {
>          case LIBXL_GIC_VERSION_V2:
> @@ -1519,6 +1554,9 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
>  
>  #define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
>  
> +/* As per ARM DEN 0057A, stolen time memory regions are 64-byte aligned */
> +#define PV_REGIONS_PER_PAGE  (XC_PAGE_SIZE / 64)
> +
>  static int compare_iomem(const void *a, const void *b)
>  {
>      const libxl_iomem_range *x = a, *y = b;
> @@ -1530,24 +1568,92 @@ static int compare_iomem(const void *a, const void *b)
>      return 0;
>  }
>  
> -static int finalize_hypervisor_node(libxl__gc *gc,
> -                                    libxl_domain_build_info *b_info,
> -                                    struct xc_dom_image *dom)
> +static int get_pv_region(libxl_domain_build_info *b_info,
> +                         struct xc_dom_image *dom,
> +                         uint64_t *start, uint64_t end,
> +                         uint64_t *region_base, uint64_t *region_size)
> +{
> +    unsigned int npages = DIV_ROUNDUP(b_info->max_vcpus, PV_REGIONS_PER_PAGE);
> +    unsigned int len = npages * XC_PAGE_SIZE;
> +    uint32_t domid = dom->guest_domid;
> +    xc_interface *xch = dom->xch;
> +    unsigned long idx = 0;
> +    uint64_t size;
> +    int rc;
> +
> +    if (*start >= end)
> +        return -1;
> +    size = end - *start;
> +    if (size < len)
> +        return -1;
> +
> +    for (; npages; npages--, idx++) {
> +        rc = xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_pv_time, idx,
> +                                      (*start >> XC_PAGE_SHIFT) + idx);
> +        if (rc)
> +            return rc;
> +    }
> +
> +    region_base[0] = *start;
> +    region_size[0] = len;
> +    *start += len;
> +    return 0;
> +}
> +
> +static void get_ext_region(uint64_t start, uint64_t end, uint64_t *region_base,
> +                           uint64_t *region_size, unsigned int *nr_regions)
> +{
> +    uint64_t size;
> +
> +    start = ALIGN_UP_TO_2MB(start);
> +    if (start >= end)
> +        return;
> +
> +    size = end - start;
> +    if (size < EXT_REGION_MIN_SIZE)
> +        return;
> +
> +    region_base[*nr_regions] = start;
> +    region_size[*nr_regions] = size;
> +    (*nr_regions)++;
> +}
> +
> +static int finalize_extra_regions(libxl__gc *gc,
> +                                  libxl_domain_build_info *b_info,
> +                                  struct xc_dom_image *dom)
>  {
>      void *fdt = dom->devicetree_blob;
> -    uint64_t region_base[MAX_NR_EXT_REGIONS], region_size[MAX_NR_EXT_REGIONS];
> -    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +
> +    /* For extended regions */
> +    uint64_t ext_region_base[MAX_NR_EXT_REGIONS], ext_region_size[MAX_NR_EXT_REGIONS];
> +    uint32_t ext_regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>                    (MAX_NR_EXT_REGIONS + 1)];
> -    be32 *cells = &regs[0];
> +    be32 *ext_cells = &ext_regs[0];
> +    int hyp_offset;
> +
> +    /* For pv regions */
> +    uint64_t pv_region_base[1], pv_region_size[1];
> +    uint32_t pv_regs[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
> +    be32 *pv_cells = &pv_regs[0];
> +    int resv_offset;
> +
>      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>      const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>      unsigned int i, j, len, nr_regions = 0;
> +    bool pv_region_pending = true;
>      libxl_dominfo info;
> -    int offset, rc;
> +    int rc;
>  
> -    offset = fdt_path_offset(fdt, "/hypervisor");
> -    if (offset < 0)
> -        return offset;
> +    resv_offset = fdt_path_offset(fdt, "/reserved-memory");
> +    if (!strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> +        if (resv_offset < 0)
> +            return resv_offset;
> +    } else
> +        pv_region_pending = false;
> +
> +    hyp_offset = fdt_path_offset(fdt, "/hypervisor");
> +    if (hyp_offset < 0)
> +        return hyp_offset;
>  
>      rc = libxl_domain_info(CTX, &info, dom->guest_domid);
>      if (rc)
> @@ -1572,8 +1678,7 @@ static int finalize_hypervisor_node(libxl__gc *gc,
>          } unallocated;
>          uint64_t unallocated_size = 0;
>  
> -        unallocated.start = bankbase[i] +
> -            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
> +        unallocated.start = bankbase[i] + ((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
>  
>          unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
>          unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
> @@ -1581,7 +1686,7 @@ static int finalize_hypervisor_node(libxl__gc *gc,
>          if (unallocated.end >= unallocated.start)
>              unallocated_size = unallocated.end - unallocated.start + 1;
>  
> -        if (unallocated_size < EXT_REGION_MIN_SIZE)
> +        if (unallocated_size <= 0)
>              continue;
>  
>          /* Exclude iomem */
> @@ -1605,14 +1710,14 @@ static int finalize_hypervisor_node(libxl__gc *gc,
>                      if (unallocated.start > unallocated.end)
>                          break;
>                  } else {
> -                    uint64_t size = iomem.start - unallocated.start;
> -
> -                    if (size >= EXT_REGION_MIN_SIZE) {
> -                        region_base[nr_regions] = unallocated.start;
> -                        region_size[nr_regions] = size;
> -                        nr_regions++;
> +                    if (pv_region_pending) {
> +                        rc = get_pv_region(b_info, dom, &unallocated.start, iomem.start,
> +                                           pv_region_base, pv_region_size);
> +                        if (!rc)
> +                            pv_region_pending = false;
>                      }
> -
> +                    get_ext_region(unallocated.start, iomem.start, ext_region_base,
> +                                   ext_region_size, &nr_regions);
>                      unallocated.start = iomem.end + 1;
>  
>                      if (unallocated.start > unallocated.end)
> @@ -1624,38 +1729,52 @@ static int finalize_hypervisor_node(libxl__gc *gc,
>          if (unallocated.end >= unallocated.start
>              && nr_regions < MAX_NR_EXT_REGIONS)
>          {
> -            uint64_t size = unallocated.end - unallocated.start + 1;
> -
> -            if (size >= EXT_REGION_MIN_SIZE) {
> -                region_base[nr_regions] = unallocated.start;
> -                region_size[nr_regions] = size;
> -                nr_regions++;
> +            if (pv_region_pending) {
> +                rc = get_pv_region(b_info, dom, &unallocated.start, unallocated.end,
> +                                   pv_region_base, pv_region_size);
> +                if (!rc)
> +                    pv_region_pending = false;
>              }
> +            get_ext_region(unallocated.start, unallocated.end, ext_region_base,
> +                           ext_region_size, &nr_regions);
>          }
>      }
>  
> +    if (!strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> +        if (pv_region_pending) {
> +            LOG(ERROR, "The PV time region cannot be allocated, not enough space");
> +            return ERROR_FAIL;
> +        }
> +        set_range(&pv_cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                  pv_region_base[0], pv_region_size[0]);
> +        len = sizeof(pv_regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS);
> +        rc = fdt_setprop(fdt, resv_offset, "reg", pv_regs, len);

I can appreciate the effort that it took to get this working. However,
given the relatively small size of PV time region, is there a reason
that you chose to allocate it from unallocated guest RAM rather than
reserving a new region/space in xen/include/public/arch-arm.h? Doing so
may also simplify the dom0less case.

E.g.:

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a17474e..681e3d4778ba 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -466,6 +466,13 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
 #define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
 
+/* Current supported guest VCPUs */
+#define GUEST_MAX_VCPUS 128
+
+/* PV time region */
+#define GUEST_PVTIME_BASE xen_mk_ullong(0x37000000)
+#define GUEST_PVTIME_SIZE xen_mk_ullong(GUEST_MAX_VCPUS * 64)
+
 /*
  * 16MB == 4096 pages reserved for guest to use as a region to map its
  * grant table in.
@@ -501,9 +508,6 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
-/* Current supported guest VCPUs */
-#define GUEST_MAX_VCPUS 128
-
 /* Interrupts */
 
 #define GUEST_TIMER_VIRT_PPI    27


