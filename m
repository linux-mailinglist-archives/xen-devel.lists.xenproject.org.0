Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33173AFD9F7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037332.1410001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFu7-0007au-U8; Tue, 08 Jul 2025 21:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037332.1410001; Tue, 08 Jul 2025 21:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFu7-0007YK-Pw; Tue, 08 Jul 2025 21:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1037332;
 Tue, 08 Jul 2025 21:31:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFu5-0007OX-Sx
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:31:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:200a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9084b2c-5c42-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 23:31:03 +0200 (CEST)
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Tue, 8 Jul 2025 21:30:59 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::7e) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:30:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:30:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:30:56 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:30:56 -0500
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
X-Inumbo-ID: d9084b2c-5c42-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYCFCUNYQN4/d7fWP2CKTkHXzfJk9qcoHTtWlVyHMhkKsgHh7jTE4LzB4GVtWV4Wkq2wZ/Uvvi7JxgiDzL9pWEtN9KgKvp9IyKQvOrLyjhicpjegzqVXkkCjONNhC8y8bhCOt4/PFe+aTYn8jGe9N11WI0XmD98HVCflyATL436s3ezInTMt77OqfGaNaxWNjUPMf7iAdzasTQNMNvPg7QmuE7pjGSJg27qb3Oo3hnMrMwWgA6rdIogIzAYAbQJTG5Jvzt9WeJW/2tKObpdnSVSp1a9/mT0BZ7SntO/sKQng0PcrE70Xs1enihu7R9JRMcqLeTQESfUZwpg5Euz1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhrM9xyZkxXtlA3D2N1Ki8GEgNtjIzZuNnU8e8f2vkg=;
 b=CNC2HXl1etVyesPMsm6lxIVDtkAJbdkzoG7H8b9RkpgOtMn0PbhzI7ErEbe5sOSVXl4sQ77b9Crje9682pq/WxoK9ENdYqrS7KLlgC58xAJmYxgmIMGNW0oOHA/x5ZJaakxAYyRT3p89/COr4hSKhH4+gCfwdhbSL4Ptbh/m7H6giRhGr+RB5BN1btlHidirHNENEL9dSjCZd2veh0am5ygQaoyKGLbf+09aJTIawIgwLGePAWFq2/SrbSv1lJl8NO4U3PrQEqP13Gvekqvar9uZJLiGQ9Vqe2RLvQGgJbi9rJAFIUN1qCZdzM0ClrMmroK+Z2npqgoL9u6tfWcY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhrM9xyZkxXtlA3D2N1Ki8GEgNtjIzZuNnU8e8f2vkg=;
 b=JfZU8mgsHWOXhq6eMDrMeXN6/HhshLiaydir4Q5kyjw0wXDUtXDHFf7AZCy+AItsgIDOHgxzYdSbdaZ3kokBs8ygjOJeGtVrco0G+KmANQcpMNZpCp8+GLV+c+iH6nKTnoIetmGvD4c6wkQdM8zbXpRIbCEhoNbnoFxHKrxUUig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6f05b130-53c7-4276-9276-a4e8ff681dc4@amd.com>
Date: Tue, 8 Jul 2025 17:13:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 06/19] mm: don't add module pages to free memory
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-7-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-7-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ddd5972-ea40-43bb-eb9f-08ddbe66bad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckkvclNDQWZ1NzhBOUFsbDlOdjAyZGZXeFZ2K2UwV2Y5MjdSQXVBb2I5MjMr?=
 =?utf-8?B?ek54Q0s3WnhZTkVtamIzL2JqZ1VnbmRndldFQ1RuRjd0UGZSb052Wk1KcU1k?=
 =?utf-8?B?ODBaNXE2bXhQbnN5V1ZCZnAxUFRUdHBsVnBqdlRtU1pqemxvc2dIWUNoTlpY?=
 =?utf-8?B?S0dPcGp0aXlnN0NxQ2FISzBFZ0UrbE9jMVVPeHNEa0loK095Sjd6TGJRYzh5?=
 =?utf-8?B?cWdLam9adll1UThTUHlZWUd0bEh6Lzl3SU13UFhSRnJiRlg3bW41VWtKcG4r?=
 =?utf-8?B?M3VTVUZhYVR4N0laYmxidE9vTjVBejFIMWpFYU13R0d2NE1vd1lCWnN4S0Mz?=
 =?utf-8?B?VVFYdVZobWN6Wi9MT0xLL2NTckdMMGk0UzR1ejRzUm1kY3RkL1pGaVpJdCtI?=
 =?utf-8?B?Q1Z0N3Y3eEJ5cVg0WHViaGt4cDFTN0J1alVQNDY3ZE9JdlZ6VzhDVGxzOXIy?=
 =?utf-8?B?ZVJDQnFVUCt2bVVUdUV1RDkrbVhiM1pVc29VSUFweG5iYkRCMWVQdHkwOEpL?=
 =?utf-8?B?Sys2clJLQVBuNU5qczhSNHhzY2U2OVJsdHg5Nll0WnAyV2VoeVdOWVA0c3Nr?=
 =?utf-8?B?N0JEaXBCZTRFaWxHSi9DT1V0VXBRRENsWFBwVFJNbmJYVTI0ME9LY0RjTkdH?=
 =?utf-8?B?MFFtTjB4bGpuOUYwWGFJbHcvMDNnT0hxS1U1MGJYdTNJR3BnaVVmb2ZQRC9u?=
 =?utf-8?B?RmZxWnlmdExRSldvWndyYlZWazZiQjVkVzQxM3FpRFZCelhJdVVPYzFpTVFQ?=
 =?utf-8?B?T1IzTzI4YnpsN01EdWRQa0gzYng2LytvOGwxRFNlL0pkOGVOQmNTcEIwVisx?=
 =?utf-8?B?em4vTnE0ajduc0ZSdjhCQi9wbVFVaFlTL0xFaUdVOUJrY3VRaWhVdmYrVEhM?=
 =?utf-8?B?UTBZN3U3T2xFTVVHdGd1Rm5mMFhjNCtueWIrdjU5K05Kd291Y1o3VksyNUVi?=
 =?utf-8?B?YnJnVkZWV1pZQUNMY1grT1ZubWFKekFudmdGNlMrQXZrZ3QyckEwSTlINWlv?=
 =?utf-8?B?Q0lDVGJmTHRqOW1TR1RKRVR3cCs3Rk8ySGFLM0J3Tm5MNmRBS2kxd1NwOGV1?=
 =?utf-8?B?MVAxaG5BUyttTkh4cnBZd250R3FZSGZCM1gwNEc2cTY3VHV2Zy9wSys4TE9n?=
 =?utf-8?B?TVk1a0lXSWEzS2FpQjJ0bGJweGRMSys2UHZBQWRLOU80YWpwUzE1ang4dXJT?=
 =?utf-8?B?dUw0dCt2WnNka1B6cTN4RGtkcEU2WXJON09uK29sVUJYUWtXZ1g2T0t5Ym02?=
 =?utf-8?B?VVhRbHNCNTVLV01JaWFVK29iK0tCem1aL1l2b1p0VVBHQW9Xd1BGV2hWR0Nt?=
 =?utf-8?B?MkRibFZiWXI2WTlFbFhRYWNpTThjSmdqV0JtOXFqdkR1TVNCdFd4OGlNZ3NY?=
 =?utf-8?B?TEJXZ0o0TkxrT0R1bFM0YU5nbkV5ZVJNdjQ3WXdnaHVFWDNCUW11a3FDNnU2?=
 =?utf-8?B?aDk1SS8wMWE0UEJVVmUrb3QrbkQ4S1VVVFIxMURMbHVSZ2lldG1kSkU2c09i?=
 =?utf-8?B?bG00TjFtKytNSGZmWTd4dnViZlQrSjhxcmV4YWFjTXp0Zi9BbzJycVpkVSt3?=
 =?utf-8?B?TjVSVHE1Vjh2cVF1cnBOd0tLdzNrQkZ3RHNFeVhpaFF2WUR2WTZRMVVTRHFY?=
 =?utf-8?B?WFVGSlhPWFozemZBbjFMNkFpSUhHdVlsZTZmS3RUd3FPMzZadkowNmRMNWtL?=
 =?utf-8?B?UlZjZWFTSUg5QWZ2QXZ1dVkrdnZCLytsbThBUnlMQlFVaWZqTUlTYlNEQ0F6?=
 =?utf-8?B?dEE5MGE2R2FJMmRBNnNic0dZajdwWWNnODVZUnRFUnRON3hERjUwNiswRXhM?=
 =?utf-8?B?MWFrS09rekJYNnJHUXk1d25PNTE5ZlNvbnJoTkU3Z2hwZ0xJTElIWmNkYlJP?=
 =?utf-8?B?b3NGa2g2dFVqSlZUOGw5QSthL1kvQkFRVms5THV3blN0eDV0NVl6bmpLVy9C?=
 =?utf-8?B?MkZOcW0yd3EzZytFenMrMThOS1libDliVElybGlFVFNSMklzY3c4ZWN1alVQ?=
 =?utf-8?B?Mzdrc2ZUbitubGxoOEEvTlJzZi84NlBJcHh2RTZnNHhaNG8vRkJrd3F6TEhC?=
 =?utf-8?Q?iy/Rux?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:30:58.5911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddd5972-ea40-43bb-eb9f-08ddbe66bad2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347

On 2025-07-02 04:12, Juergen Gross wrote:
> When initializing the memory allocator, don't add memory pages of
> modules and the initial boot info structure to the free memory.
> 
> This is relevant only when running in PVH mode, as in PV mode only
> memory above the initial page tables is added to free memory, and the
> module and start_info pages are below the page tables.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   arch/x86/mm.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   include/mm.h  |  1 +
>   mm.c          | 21 +++++++++++++-
>   3 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index 26ede6f4..7c3c83be 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -78,6 +78,10 @@ void arch_mm_preinit(void *p)
>       last_free_pfn = si->nr_pages;
>       balloon_set_nr_pages(last_free_pfn, last_free_pfn);
>   }
> +
> +void check_memory_range(unsigned long *from, unsigned long *to)
> +{
> +}
>   #else
>   #include <mini-os/desc.h>
>   user_desc gdt[NR_GDT_ENTRIES] =
> @@ -125,6 +129,78 @@ void arch_mm_preinit(void *p)
>       last_free_pfn = e820_get_maxpfn(pages);
>       balloon_set_nr_pages(pages, last_free_pfn);
>   }
> +
> +static void check_memory_range_conflict(unsigned long *from, unsigned long *to,
> +                                        unsigned long chk, unsigned long sz)
> +{
> +    unsigned long chk_end = chk + sz;
> +
> +    if ( *to <= chk || *from >= chk_end )
> +        return;
> +
> +    if ( chk <= *from )
> +        *from = (chk_end >= *to) ? *to : chk_end;
> +    else
> +        *to = chk;
> +}
> +
> +/* Reserved memory ranges not added to free memory. */
> +#define MAX_RSV_RANGES  1
> +static struct {
> +    unsigned long start;
> +    unsigned long size;
> +} reserved_range[MAX_RSV_RANGES];
> +
> +void check_memory_range(unsigned long *from, unsigned long *to)
> +{
> +    unsigned int m;
> +    struct hvm_modlist_entry *mod;
> +
> +    for ( m = 0; m < MAX_RSV_RANGES && reserved_range[m].size; m++ )
> +        check_memory_range_conflict(from, to, reserved_range[m].start,
> +                                    reserved_range[m].size);
> +
> +    mod = (struct hvm_modlist_entry *)(unsigned long)
> +          hvm_start_info_ptr->modlist_paddr;
> +    for ( m = 0; m < hvm_start_info_ptr->nr_modules; m++ )
> +        check_memory_range_conflict(from, to, mod[m].paddr, mod[m].size);
> +}
> +
> +#define max(a, b) ((a) < (b) ? (b) : (a))
> +
> +static void pvh_reserve_start_info(unsigned long *start_pfn)
> +{
> +    unsigned long end = 0;
> +    unsigned long start = (unsigned long)hvm_start_info_ptr;
> +    unsigned long end_pfn;
> +    unsigned int m;
> +    struct hvm_modlist_entry *mod;
> +    char *cmdline;
> +
> +    mod = (void *)(unsigned long)hvm_start_info_ptr->modlist_paddr;
> +
> +    end = max(end, start + sizeof(struct hvm_start_info));
> +    end = max(end, hvm_start_info_ptr->modlist_paddr +
> +              hvm_start_info_ptr->nr_modules *
> +              sizeof(struct hvm_modlist_entry));
> +    for ( m = 0; m < hvm_start_info_ptr->nr_modules; m++ )
> +    {
> +        cmdline = (char *)(unsigned long)mod[m].cmdline_paddr;
> +        if ( cmdline )
> +            end = max(end, (unsigned long)cmdline + strlen(cmdline) + 1);
> +    }
> +    cmdline = (char *)(unsigned long)hvm_start_info_ptr->cmdline_paddr;
> +    if ( cmdline )
> +        end = max(end, (unsigned long)cmdline + strlen(cmdline) + 1);
> +    if ( hvm_start_info_ptr->version >= 1 )
> +        end = max(end, hvm_start_info_ptr->memmap_paddr +
> +                  hvm_start_info_ptr->memmap_entries *
> +                  sizeof(struct hvm_memmap_table_entry));
> +
> +    end_pfn = PFN_UP(end);
> +    if ( end_pfn > *start_pfn )
> +        *start_pfn = end_pfn;
> +}
>   #endif
>   
>   static const struct {
> @@ -888,6 +964,10 @@ void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p)
>       if ( max_pfn >= MAX_MEM_SIZE / PAGE_SIZE )
>           max_pfn = MAX_MEM_SIZE / PAGE_SIZE - 1;
>   
> +#ifndef CONFIG_PARAVIRT
> +    pvh_reserve_start_info(&start_pfn);
> +#endif
> +
>       printk("  start_pfn: %lx\n", start_pfn);
>       printk("    max_pfn: %lx\n", max_pfn);
>   
> diff --git a/include/mm.h b/include/mm.h
> index 1dc89ddb..995e9862 100644
> --- a/include/mm.h
> +++ b/include/mm.h
> @@ -74,6 +74,7 @@ static __inline__ int get_order(unsigned long size)
>   
>   void arch_init_demand_mapping_area(void);
>   void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p);
> +void check_memory_range(unsigned long *from, unsigned long *to);
>   
>   unsigned long allocate_ondemand(unsigned long n, unsigned long alignment);
>   /* map f[i*stride]+i*increment for i in 0..n-1, aligned on alignment pages */
> diff --git a/mm.c b/mm.c
> index 858dc108..8c41d2f2 100644
> --- a/mm.c
> +++ b/mm.c
> @@ -185,6 +185,25 @@ static void add_memory_range(unsigned long r_min, unsigned long r_max)
>       }
>   }
>   
> +static void consider_memory_range(unsigned long r_min, unsigned long r_max,
> +                                  void (*func)(unsigned long, unsigned long))
> +{
> +    unsigned long from = r_min;
> +    unsigned long to = r_max;
> +
> +    while ( true )
> +    {
> +        check_memory_range(&from, &to);
> +        if ( from == to )
> +            return;
> +
> +        func(from, to);
> +
> +        from = to;
> +        to = r_max;
> +    }
> +}
> +
>   void iterate_memory_range(unsigned long min, unsigned long max,
>                             void (*func)(unsigned long, unsigned long))
>   {
> @@ -207,7 +226,7 @@ void iterate_memory_range(unsigned long min, unsigned long max,
>           if ( r_max > max )
>               r_max = max;
>   
> -        func(r_min, r_max);
> +        consider_memory_range(r_min, r_max, func);
>       }
>   }
>   


