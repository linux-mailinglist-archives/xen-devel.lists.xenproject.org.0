Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88D9F313E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 14:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858013.1270259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNApo-0003Mg-9n; Mon, 16 Dec 2024 13:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858013.1270259; Mon, 16 Dec 2024 13:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNApo-0003KF-6Y; Mon, 16 Dec 2024 13:08:28 +0000
Received: by outflank-mailman (input) for mailman id 858013;
 Mon, 16 Dec 2024 13:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/+0=TJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNApm-0003IY-PD
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 13:08:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2417::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d297eccf-bbae-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 14:08:21 +0100 (CET)
Received: from BN0PR08CA0005.namprd08.prod.outlook.com (2603:10b6:408:142::20)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 13:08:17 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::17) by BN0PR08CA0005.outlook.office365.com
 (2603:10b6:408:142::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Mon,
 16 Dec 2024 13:08:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 13:08:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 07:08:15 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 07:08:13 -0600
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
X-Inumbo-ID: d297eccf-bbae-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TshjHTNKH17CwxpCWl0hdMZrxz22K247PKv1akTw6sSr35NRCMWDFtp3csogENDnbaVsmedD/38F8f5OKnTEWoSTqT/lzZ2YSCjpbma87AcpKkqun2Fd27FIsmsd57g0m2qhLuhMJ2hA2Cj2vYksnmDkqudT0hwnMbWulINhZtlZcM9w19uDLAKKHj+zjx9rtpHHDFogFPRTSegf8kse0Tba/IfQi4yvV3Uy0dLAF5EUytvw6/FdLyUjS3rlfemNE5JF+lpePfdztwXwL9dP8jz6D4Jb/5ZHBsY9W3Rq/9kvxamBI1JBqQqeV44EVvpWVn/5LNbroRfebh15WLrXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW9Eczi97SpgvR7eCDs1FQ0fLj0o4WlujxzIJR3BSck=;
 b=ypSK1MvqXZ7u9lGPZ9a6RcotholWoC/MDNhjJIM7C4KsqlI99Y5KCx63hM8RqXXiqx3d3qzSt/eBGvU3ZlMDkisfxl1Td1U2Uz1Q0SjixpqxW8YpzY7eccA6FWk5Z2unvvvV/4paETVoBJbGZWN4JBPMfDtv+YlqrAt6ieYYCoGg+dognByPZkLH744z2ql6+lH8y7LxpOa2OqQ2Hv+I9bNLO7buAirwq7wwBIzX+ZalAvDNYg6QQsi3vGqs6Pcf0PajXWdpyXkh9OUwhqbSHZgoHosWwwBABYUB1GX6PZCBg3YfPZFe1SYPjb+ZwKKSHob3uT54NUlMNZEBkvB0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW9Eczi97SpgvR7eCDs1FQ0fLj0o4WlujxzIJR3BSck=;
 b=QHMfYFVjkybIJyXRZ6Da11jyRoyuepq9jPiYVAH/LSKj5AA5Etj3gq1DhTPOu+Lbxg39+oYQCfCkAP8wl4F3w+j9+D0SkFDTO2lePBeROqVRqR6HeqoaKDvAox15MyCEhRROIHQKT5P/TiOg21Rrh2fCk8dVTaxj3uMyRGBDqg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1ca9b698-4fb3-4756-a0af-f08582ad3023@amd.com>
Date: Mon, 16 Dec 2024 14:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/12] xen: add cache coloring allocator for domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-10-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241213162815.9196-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: baa11116-755b-45c4-2378-08dd1dd2b496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|7416014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDJrYnBUamsxWUJXak1TalNabVpZOHVhWmtYVzJyNHFKc0hJNkM1YTlsMm94?=
 =?utf-8?B?WXFyYlhmMmtDMVB5QTBWTHdIRnpSM1dSR0N5ck9IYnhRdUJDZGpGbTZLejR0?=
 =?utf-8?B?N2YzVmpUR2dSM1JDYWxpQVZuNU9BcnBBTHFnRVRSd251Sm9PeXhJU1VJU3Zn?=
 =?utf-8?B?WDdkZ0RST2FISVQ0SzNTQkNjdXFES3ovbC91MDRXZXZtUkVGVkt6UzJ4VWNu?=
 =?utf-8?B?Sk9rZDRKeEk2b24wZnpoTGpiMGlkNWlqcXJYVjl1Y3g4Sjlhb1Y3ak9RMFVI?=
 =?utf-8?B?eGpJYmF1VXF6WjJGUUxmTklHVUFhN3dYYkJRYXNKNXhCdDM5czViejAxeVdj?=
 =?utf-8?B?WWxWRTlXa1RRQllwRllLQ2hUQ1pHM0s1NnAxL2NIZXVnSU1ZM05HeHhOYUdp?=
 =?utf-8?B?aXpqQXd3WHpMNWxMdytXc3FCcHpHYUdlbXh4dVBiL0NxMEt6YnVIaE9TOHFT?=
 =?utf-8?B?Uzd4SUJac1dZaWYwbnpTR1RsN0JsVGRIVUxNOXc1dHFHVTgxSDJ6VWNKTmhk?=
 =?utf-8?B?NTMrUTVTNDUvM0JhdUdTeVcwdmMzT0phOCttWk9oOUtYbUZWeFMxL0dlMnZW?=
 =?utf-8?B?UzZ4Y0lzbm1HWWFHUmFpUXd0ZVJLTjFVNHllbHJIQ0VBNStjcTlKak9tby9y?=
 =?utf-8?B?WGpJdUtYMWxxd1V4djQ5RzdTb2hVRWRRK1FLZk9WWDhWcmxNRnVBeU9iTDBO?=
 =?utf-8?B?dHpNb2t4MCtWMmNoUmxEeThTdkJ4SVZORkhKZmFJZGFoMjZUN0IyNlA5L2hs?=
 =?utf-8?B?V211OW1jQU9adGlSN3J1QWl1Y0xveVpVQmJRR2tsRnYrQTFpWXh4L0N2RUxs?=
 =?utf-8?B?dG83YjlQcW80U1Y3TzJDVVFMYjRzcHM2M3NwU0JFM290UzhHKzByRkx4Snda?=
 =?utf-8?B?UkVCN00rYU8xTXJ4aTJEM0ZjajdTaUJNN3FJWWhEeWxVVFV0VWNzSCsvSlNE?=
 =?utf-8?B?UXlZZk5TeCtDWThBcjZaVThBR1c4UzVVM3pFcTJQcmNqeVNLeGlQb0IvQUtr?=
 =?utf-8?B?RnVmMm9Ea1JnNkVCS0Z2MklPNVZrN0h5cVhZRVpjamRVRVlYbExnNHpKYU5F?=
 =?utf-8?B?WjJIMSsvT1JhSmdteUhyaUsvZTU1VXEzeXdjVUc3Z1lDaXZnU0dnSlJaMjBL?=
 =?utf-8?B?NFhkTUpnUS9SaUdaRFFmMHBpRXJZcmJ6dCtRV1hEczY1YnNISUx3NWZBYXk3?=
 =?utf-8?B?em5FZDBabUE4VGNlZEpwUGdIU21JOEZOdXk0WE1zbjZTTnBGdVJaMkhVNHJN?=
 =?utf-8?B?Vk04RFg1ZE52bWgwZ3gzY2xEdFljemUrMmtwY2kvcklXWEV0SmtvMXU1WS94?=
 =?utf-8?B?VVJINHRnNEFPTHJFTG5IUHdXYzJKSkhoSmpYYkJNS052b0JLeXpkeUZrS2dF?=
 =?utf-8?B?bVpGbmhGV3NBT2dhK2ltZXppQ3NkYVNOVXZzd01NeDBXK0h4eUY1OUlna1Rh?=
 =?utf-8?B?ZU5JR2t0WWhRUGNvQ2ttUTR0WXhqMXptNnFVOXFLZWFuUGQ4MUxjVEtqQWxJ?=
 =?utf-8?B?QnFQRFhRc2VRWGhyUFJoQmpHSFhrWTJWTExncWFQYnN3N3ZDMnZ2YXBxYVpy?=
 =?utf-8?B?ZUJNRXJhYjNSV0RhSkFFWnBOTDV1KzZkQ0VFSVJCWkxGM1hLWnMwZW8rVC8r?=
 =?utf-8?B?SkpuekdYSENqNmc2MytmNkVPYmFhb3kwL3pQaUxCcWxQc1U3TEhyN0g5cURM?=
 =?utf-8?B?SWRCeGY5MExRTE9wZmtiVEpyWDVJaDVIR3JadnFSVmwxRW1ESEhjMG9XVisw?=
 =?utf-8?B?WnZEVzRQN2w3UFJJMUFGZlRtVDdqUjFxcDdUczZsajBIeDFUVlo4QjRzeWhj?=
 =?utf-8?B?MFBCdituN3BsSXdqTkh3REFTeGRjWFMzWVUyYXdDeDZlTDZ5aUVWeUxMNjg4?=
 =?utf-8?B?dThMTTlpYzNBTFJ0Y1p0NTVRd2pQbDFTbTdiejQ3U2YzbmtwYkU3OUpzNWhO?=
 =?utf-8?B?MlNQVTE1dUhZOVRrNEp0QjZiVTZYVzlEZ3EzMXVBMEd2T0lLdXlCMlZINVFE?=
 =?utf-8?Q?cwRgUy1BNEg6QWOLdVe3sZ7rKLXQrE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:08:16.5773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa11116-755b-45c4-2378-08dd1dd2b496
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044



On 13/12/2024 17:28, Carlo Nonato wrote:
> 
> 
> Add a new memory page allocator that implements the cache coloring mechanism.
> The allocation algorithm enforces equal frequency distribution of cache
> partitions, following the coloring configuration of a domain. This allows
> for an even utilization of cache sets for every domain.
> 
> Pages are stored in a color-indexed array of lists. Those lists are filled
> by a simple init function which computes the color of each page.
> When a domain requests a page, the allocator extracts the page from the list
> with the maximum number of free pages among those that the domain can access,
> given its coloring configuration.
> 
> The allocator can only handle requests of order-0 pages. This allows for
> easier implementation and since cache coloring targets only embedded systems,
> it's assumed not to be a major problem.
> 
> The buddy allocator must coexist with the colored one because the Xen heap
> isn't colored. For this reason a new Kconfig option and a command line
> parameter are added to let the user set the amount of memory reserved for
> the buddy allocator. Even when cache coloring is enabled, this memory
> isn't managed by the colored allocator.
> 
> Colored heap information is dumped in the dump_heap() debug-key function.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v12:
> - fixed #ifdef CONFIG_LLC_COLORING in init_color_heap_pages()
> v11:
> - CONFIG_BUDDY_ALLOCATOR_SIZE depends on CONFIG_LLC_COLORING
> - buddy_alloc_size is defined only if CONFIG_LLC_COLORING
> - buddy-alloc-size param is parsed only if CONFIG_LLC_COLORING
> v10:
> - stated explicit dependency on CONFIG_LLC_COLORING for buddy-alloc-size
> - fix for MISRA rule 20.7 parenthesis
> v9:
> - added ASSERT(order == 0) when freeing a colored page
> - moved buddy_alloc_size initialization logic in Kconfig
> v8:
> - requests that uses MEMF_* flags that can't be served are now going to fail
> - free_color_heap_page() is called directly from free_heap_pages()
> v7:
> - requests to alloc_color_heap_page() now fail if MEMF_bits is used
> v6:
> - colored allocator functions are now static
> v5:
> - Carlo Nonato as the new author
> - the colored allocator balances color usage for each domain and it searches
>   linearly only in the number of colors (FIXME removed)
> - addedd scrub functionality
> - removed stub functions (still requires some macro definition)
> - addr_to_color turned to mfn_to_color for easier operations
> - removed BUG_ON in init_color_heap_pages() in favor of panic()
> - only non empty page lists are logged in dump_color_heap()
> v4:
> - moved colored allocator code after buddy allocator because it now has
>   some dependencies on buddy functions
> - buddy_alloc_size is now used only by the colored allocator
> - fixed a bug that allowed the buddy to merge pages when they were colored
> - free_color_heap_page() now calls mark_page_free()
> - free_color_heap_page() uses of the frametable array for faster searches
> - added FIXME comment for the linear search in free_color_heap_page()
> - removed alloc_color_domheap_page() to let the colored allocator exploit
>   some more buddy allocator code
> - alloc_color_heap_page() now allocs min address pages first
> - reduced the mess in end_boot_allocator(): use the first loop for
>   init_color_heap_pages()
> - fixed page_list_add_prev() (list.h) since it was doing the opposite of
>   what it was supposed to do
> - fixed page_list_add_prev() (non list.h) to check also for next existence
> - removed unused page_list_add_next()
> - moved p2m code in another patch
> ---
>  docs/misc/cache-coloring.rst      |  37 ++++++
>  docs/misc/xen-command-line.pandoc |  14 +++
>  xen/arch/arm/include/asm/mm.h     |   5 +
[...]

> +#ifdef CONFIG_LLC_COLORING
> +/* Page is cache colored */
> +#define _PGC_colored      PG_shift(4)
NIT: do we really need to define it if it's not used? I don't like this concept but
I quickly checked new arches and they also copied some flags that are not used, so
maybe it's the proper way to go.

Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


