Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970D9C100C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 21:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832170.1247590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99Pq-0000rb-FE; Thu, 07 Nov 2024 20:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832170.1247590; Thu, 07 Nov 2024 20:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99Pq-0000pr-Bo; Thu, 07 Nov 2024 20:47:42 +0000
Received: by outflank-mailman (input) for mailman id 832170;
 Thu, 07 Nov 2024 20:47:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2I65=SC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t99Pp-0000pl-MF
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 20:47:41 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:2408::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ea36fe-9d49-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 21:47:33 +0100 (CET)
Received: from MN2PR18CA0003.namprd18.prod.outlook.com (2603:10b6:208:23c::8)
 by SA3PR12MB9179.namprd12.prod.outlook.com (2603:10b6:806:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 20:47:28 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::14) by MN2PR18CA0003.outlook.office365.com
 (2603:10b6:208:23c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 20:47:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 20:47:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 14:47:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 14:47:27 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 14:47:26 -0600
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
X-Inumbo-ID: 82ea36fe-9d49-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwODo6NjIyIiwiaGVsbyI6Ik5BTTA0LUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjgyZWEzNmZlLTlkNDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDEyNDUzLjc4MDIxMSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL7xJ1j4UIuiXAffdgs0tNb8WZe1e1KeQRo9jmK6ljS2UMTA6WHaac0QCkC5uJ1RAuRkRL0wxXpxcsWnpoUzDVMExC5Dcjvzq0UCwT48fexewRYBbq2sgSEEjB/SXo2Jg7/FINLkgtsAS60FhIo3uR0WsRIBLwgBGlk2pt9S5Om4fQn5qhNRycqSmmZ40p9Nj11GVZHZlD6loBF1l/qKFf/fH4nKCbUBnMUYTYVOLxRc+Q3lhi93/dLuCWywtWT+z47Mtat1QPe5XXhupauOWfUbMo/24DOQ1t2bVMs7505GKPLtgm2Qdqd5ASFUTW0AePWxZRgFKOiM4k3YFkiJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gp1VITgRuUgB5Q4DDZz/CZ+vfbhwymosWB1g6D1bi0=;
 b=pHmATzD20ZMp5ZdCcymgsxuQWcNwEC7dczEcu/HeYQAZzIZMb2drjXId9/sqFwwQunMLuSFJ8BfpOnpFqPZBXFPGYGItlTLffOmF4V8lD14wxR4uj6QczbIWvP0WO/MV1jbcOArpB9SMWjtG/+75/RbacMi02O/Bwr6EDAQgfznRUGHucnv08jGH2Cnoejg0WXq5YZ4zElMee//K0IukXABjJAoIiFqIO+5p7JDBP1+xJEOYb+lZ2HjHJys6XQUkZiEiGz7b6nJ5Zd/o9aF8IP8YqwgjlMEagnUDwlrn9Lf/2oN1uTN26MrnskLUo9qxSLonKIPxjxfTkgFGyqkVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gp1VITgRuUgB5Q4DDZz/CZ+vfbhwymosWB1g6D1bi0=;
 b=uAZ2svh0m8NLxbDfXOMTynxJWWLrvsdbMjZ2KpfhbUQYimUpz5N1cHuKxdQr5pozDR++GKB8a76r05Gx8TuYjzDwdTeAjrG16aSbJU+aF6wWhaTqrROnOUeA8jZpkGo+wEu1Q7mcvzhFO9CWzbLhtTif5X8gvtJliIJgjuttin4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bd4fa542-7e05-463d-99d7-b5c57781a56e@amd.com>
Date: Thu, 7 Nov 2024 15:47:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] x86/boot: add start and size fields to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-10-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241102172551.17233-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|SA3PR12MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 101c83f4-d6a5-4765-253d-08dcff6d647a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0V5c1g5Q25yQTNvUnI1RzVGTlFZYjhJQ3l1UTcwQkN2R0l0SGJxZHdkZmRm?=
 =?utf-8?B?RUZPTlZHelRNNGVSa2drZHc0c3BIMUVqY0V2TlVlcEVkaFh5YmpRNVhhR2Mw?=
 =?utf-8?B?VytXdllxMUJmRnlUcUhDeHVzT0l1VjlYT2UySmdlR3ZkV0VmU3UxdUczdGdx?=
 =?utf-8?B?VTQ1cGZHRUNkdWVTcnlzNDBZcHhFaWFMa0VSWkdtK2VYd2d3MTJzdG55OWht?=
 =?utf-8?B?Ly9tbm0vOG1yMzdBOUdYZVE0cno1VUVNTUJ1UDJqWXdZWUVQUzdySXNpc0Vm?=
 =?utf-8?B?T3o3UHNMbmdzWW9vVVJGdDN5cndObzJQMmQ2WCtYaWNheTgzZWxyVVNrZTc4?=
 =?utf-8?B?TnpqK2RVY2dSZGRIejVTRUhKZHVvYXRlNC9iY2lxRDNwUXp0eFVJUk9EWUNh?=
 =?utf-8?B?dTdlSUgzeW9NT2NLeG5yc3RmMmsySUhKR2RJQURPRGxGUlV5Umx6Q1ZDYlRy?=
 =?utf-8?B?ZXo5U1ZRT1d3bGQvRFdISndUQzNNbzUrRDhEcEhla0t0QkdoNlArWEZwRHVJ?=
 =?utf-8?B?U2JWZmoxelhEVzd6QUkxcVIxSTBsMkJxbmpvcXU1dDJrU1ZERWlaR0EvYUlu?=
 =?utf-8?B?bWZaOGdNYm5OYTdyUGRlWm1vbkxTbkRrSnhScFJWY3hFdkEyUjBNVlRheW5P?=
 =?utf-8?B?aXJXRGVUdThKRjljeVZKbjlLR0tyN0RTdnhmWWcxWGhZdUJNbkZjbHNtY1hv?=
 =?utf-8?B?cEcrbGttdWJDMTZQaE1JRWRVdlE4bklwaWczaEhZL2FSMU93UmV4V0Rhb2w1?=
 =?utf-8?B?VXBzdEFPN0d0Tkw0TjlsK2NNY3NmM2NmZ2FZcVdZU3FJa0cxNE9HcENFL212?=
 =?utf-8?B?VU9HVDBQNXVtTDVBYXFNU0dpekNIaUMvMnZGdkt3MkJyOW9lQzhYNGl0WSth?=
 =?utf-8?B?ZEFDbUNBcU1WT0FPenBDd0U4dHo4WG16L3U1QkhuVnk3RHRJa040RDkyS0Zm?=
 =?utf-8?B?NmFyQXRoT3FidVY3QWVMWDhKOFZWUkg2bHNoeEVESkVCSnNPVUE1SFJBQVlt?=
 =?utf-8?B?WDlVQ284RTNoc1FpNjRubW02QzUxd2Q1ZHRoMS9UZzMzTFBveFhtT3JUUk4x?=
 =?utf-8?B?emY4OTRpc0k5eE1McE1MRU5KelZ4YnFLUG5va3BtSlpNVFRzRUVLdnR2QWR3?=
 =?utf-8?B?K1liMGY3SlcrWXd4K2M5T1V2ZDlEZVBlbGFXdXNuNU9VaTRCemNscExhaTNq?=
 =?utf-8?B?WWRTYUw1eFAvQ1RmdEJ0THhpMWF0VVozekRRT00yK0VKM0hGNXZJRmNYMTR3?=
 =?utf-8?B?OThZMGFLWWFKZVJocHlkKzFYUzI3a0NYRFoyWFVkN2NnQ3R0a0lvSGgxczNL?=
 =?utf-8?B?QnVkK0ovcjhnT2p6cmFia2NneDN5Zm1RN043SzdFRGo0K2NIdUtxWWs0eTIy?=
 =?utf-8?B?d3RRc3k2NHl1ejlkVmVna2YvdVVlaWhIUlZlRDNZaG1MamQ1QmwrLy83SG5j?=
 =?utf-8?B?aXhmR3BNLzdoempxbjM4azRoQ1U3dTBNcU9ZMFpPdEpoOFNMQ08vUWFzckNH?=
 =?utf-8?B?WGtSYzZjakJRM1JCRy9FajhzN2RJdFhiMzN2dXNZTDk5LzZYam03YTF6UU12?=
 =?utf-8?B?d1g4aWw2MjRGeWJMa1ZhVU5mL3A4KzdwTG9COGhMb094Vis4ZHpmYjV2U09w?=
 =?utf-8?B?RUkwR1JKMzNwV1RGUER6ZVMra09PNjBhL3NTZGVaODJ4MEx3dHNwWDFXQjR6?=
 =?utf-8?B?Lzg5YnN0SUlNdnVvOW1kT1J1Mm1hamQ0VEI3ekdEQ1VkOE1kSmxydWlRRVVW?=
 =?utf-8?B?NkhQSDJHNFh6SFpsb2FQaStRaGpWWWxlS0V2L1lHSW9NNHFJY3c3dHZCeTJF?=
 =?utf-8?B?T0JNWjZmZHVPdC9SL0ZiL20xV1duS1VGZCtpVDhZYlFOd0wrZDV4c25kQ2hk?=
 =?utf-8?B?bXpYSm1LTDBVTit1dThqY0VxZXJzb0hiQlVmcFh1My9ERGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:47:28.1387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 101c83f4-d6a5-4765-253d-08dcff6d647a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9179

On 2024-11-02 13:25, Daniel P. Smith wrote:
> Introduce the start and size fields to struct boot_module and
> assigns their value during boot_info construction. All uses of module_t to get
> the address and size of a module are replaced with start and size.
> 
> The EFI entry point is a special case, as the EFI file loading boot service may
> load a file beyond the 4G barrier. As a result, to make the address fit in the
> 32bit integer used by the MB1 module_t structure, the frame number is stored in
> mod_start and size in mod_end. Until the EFI entry point is enlightened to work
> with boot_info and boot_module, multiboot_fill_boot_info will handle the
> alternate values in mod_start and mod_end when EFI is detected.
> 
> A result of the switch to start/size removes all uses of the mod field in
> struct boot_modules, along with the uses of bootstra_map() and release_module()
> functions. With all usage gone, they all are dropped here.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> --
> Changes since v7:
> - add the start/size change to bootstrap_map_bm()
> - convert all BM start/size when introduced, consolidates:
>      x86/boot: populate boot module for xen entry
>      x86/boot: transition relocation calculations to struct boot_module
> - consolidates all the removal commits
> 
> Changes since v6:
> - put the efi conversion for mod_start and mod_end back along with check
> - dropped unnecessary cast
> - updated the population of start and size fields to take into account efi
> 
> Changes since v5:
> - switched EFI population of mod_start/mod_end to addresses
> 
> a#    edit 336ac1fc0019 x86/boot: introduce boot domain
> ---

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d9785acf89b6..18b93d6a272a 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -313,13 +313,29 @@ static struct boot_info *__init multiboot_fill_boot_info(
>        */
>       for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
>       {
> -        bi->mods[i].mod = &mods[i];
> -
>           bi->mods[i].cmdline_pa = mods[i].string;
> +
> +        if ( !efi_enabled(EFI_LOADER) )
> +        {
> +            /*
> +             * The EFI loader gives us modules which are already frame/size.
> +             * Switch back to address/size.
> +             */

This comment...

> +            bi->mods[i].start = mods[i].mod_start;
> +            bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
> +        }
> +        else
> +        {
> +            /*
> +             * PVH and BIOS loaders give us modules which are start/end.
> +             * Switch to address/size.
> +             */

And this comment are reversed?  But I would just use positive logic:

if ( efi_enabled(EFI_LOADER) )
    /* EFI case */
else
    /* non-EFI */

> +            bi->mods[i].start = pfn_to_paddr(mods[i].mod_start);
> +            bi->mods[i].size = mods[i].mod_end;
> +        }
>       }
>   
>       /* Variable 'i' should be one entry past the last module. */
> -    bi->mods[i].mod = &mods[bi->nr_modules];
>       bi->mods[i].type = BOOTMOD_XEN;
>   
>       return bi;
> @@ -335,8 +351,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>   
>       for ( nr = i = 0; i < bi->nr_modules; ++i )
>       {
> -        unsigned long start = bi->mods[i].mod->mod_start;
> -        unsigned long end   = start + PFN_UP(bi->mods[i].mod->mod_end);
> +        unsigned long start = bi->mods[i].start;

This should be paddr_to_pfn(bi->mods[i].start)?

> +        unsigned long end   = start + PFN_UP(bi->mods[i].size);
>   
>           if ( end > node_start && node_end > start )
>               nr += min(node_end, end) - max(node_start, start);

> @@ -1745,13 +1733,11 @@ void asmlinkage __init noreturn __start_xen(void)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        const struct boot_module *bm = &bi->mods[i];
> +        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>   
> -        set_pdx_range(bm->mod->mod_start,
> -                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
> -        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod->mod_start),
> -                         _mfn(bm->mod->mod_start),
> -                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
> +        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));

This is fine today since s (.start) is checked for page alignment.  The 
other option would be `paddr_to_pfn(s + l) + 1`, but I'm not sure that 
is an improvement.

You don't have to change anything.  Just noting something I noticed.

Regards,
Jason

> +        map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
> +                         PFN_UP(l), PAGE_HYPERVISOR);
>       }
>   
>   #ifdef CONFIG_KEXEC

