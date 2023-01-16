Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53966B8DB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478407.741577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKdF-0004ae-E9; Mon, 16 Jan 2023 08:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478407.741577; Mon, 16 Jan 2023 08:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKdF-0004YX-BP; Mon, 16 Jan 2023 08:14:17 +0000
Received: by outflank-mailman (input) for mailman id 478407;
 Mon, 16 Jan 2023 08:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHKdD-0004YR-0w
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:14:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c10c80e6-9575-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 09:14:11 +0100 (CET)
Received: from MW4P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::13)
 by LV2PR12MB5870.namprd12.prod.outlook.com (2603:10b6:408:175::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 08:14:07 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::37) by MW4P223CA0008.outlook.office365.com
 (2603:10b6:303:80::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 08:14:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 08:14:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 02:14:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 00:14:04 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 02:14:03 -0600
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
X-Inumbo-ID: c10c80e6-9575-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWFwYen1VsWpp8Ae/LV62v3uha+72NylR4lGAOCTbtmUtxa2vq4oa2bLtmE0pVEfiVvNcJcxdE2DdXK/mwJUxA6GvZuugYiLwfl/PaG/qVktssnDHuW74qGVcGlCsZ0Ye3fMjV6VEsdREIyrqX77qy3oM8WpdaKUncCYxwh+Ucsgdw0IlJwkzJYhrUzhuSWNE6veW+j9Qt1l7V0fo1LLIWUGTELVBwPymHVltAuTaT6VarQQga16ocgL720J/aTyoYJsR9TDuKGFUF3VuZ4cXE/ZXXmntLcUb8OCptQBGZRPNhbVfmFUQjiP+fALzzAll8vdE/74SkIJUAg+YWcAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WS26hMjynQ4ex2a9mEUYqQR+rU3WgPHwzZZ3Rdo+0w=;
 b=df2oNJ8KoZgJNLhXhRYbu6rP5mCtbPSachgPfoR4EUK7gJt14UTnwpn5zJ3RcnM+apd9fNN/wNqVuM4E1HooyCkiqMHXq39lXa6O2XdDUNLFctZYyrUsCz4pWQyTeFDWBkK0mv6EXxwlePdFwmjOLx4fquQ1/XmCZmVABe6i/HBF2TS9kG1AATRTvvnI8OV3XiSwAkarLJW5ssGc8ZT1qGoeqyUayCcQty/SQ2/z6guPA18tVfzIT28Ueuict4KzlVtnYhWiM2SFHVNW1elUcfWMqjvpbMqZGS4OLYr1Qv9m7wa/FMjXfhjofKub1xDLyfKJdKGOXmb2p+zwVQbafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WS26hMjynQ4ex2a9mEUYqQR+rU3WgPHwzZZ3Rdo+0w=;
 b=II7kLOt+7g6v9vbrRiEFwe3JxaSh0o9Vq57ctRNfEDVABDfg3PVj/Ha7xdhyq5wG2lcD+hF76wfr99LMBPXd1pQj5gkpibnbt+ZnEo4HpOvftT4nSKHGV6pMrw2s2onjsyG6CcOq1mwf0vpYhaSOBjJJa9OLB/3djj481MsPYoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <36a8cb2d-0bea-cdc3-5311-c743f60763d5@amd.com>
Date: Mon, 16 Jan 2023 09:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 09/14] xen/arm32: head: Remove restriction where to
 load Xen
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-10-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-10-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT060:EE_|LV2PR12MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecb7f7e-e1e8-490e-ca75-08daf799a2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t4QAPDxdg+xankTgnbzbKaLZVRBvk+4wOLFyHcnYVo77aXUwp6rOSSYDSf9JSFbmE5sQ/qUNgpBf/Vo5Nbef1MufNnIUz6F6LXa2ploJAQiaCv8s0bjY5W4p53WAqmiT/8PVDv0ERTYwo43Pcs6OJC7XSLkaBDt8SPoJEGqhDZqQy/uB6jIZSwb4X2e2wEfTSXEOBcSRhgxNhxwtyZCWpkB/1wPOVvKo8Z8WjikV6nJK8F1DZ2d59QJknyxtaeiVHxD0uXfzFrKObRlvqJyqhy60CExoSYLmKxteTTtNFoJA7gnZ82g7vSPHffB21+jb507YTMU2XhAay4AbVCTbgzYJOfEIF4AnrloVDPTdNIIGy7Olt0bviX7WuUzt0mecwJEdYvHM+5ToOZcGIFsn56FVsaiL/dlaj6+wio2/jMgGh7W8tSc/9sgRm4Q+XmEp1FwX/CuX1BqZrwIH9+i5ByOOsv7HA/ATqxVXbwN6MkqEQmzHbNcGS2GnLXANbXTjUui4iRbG/eTIBcdTedvZX1DkmrW+tuuW7Ir3IZMSBtwfICzrxassIt4dFN/z3dYlkdo7dHnMhsXJ3Ul6BN9XnLeLD4teiwFXf3oSu2I2DPpNzfiDThPE8+EIs9R5nQxtj6TFRS0BIUaM5JZgOkQjzvOc7cmIoN3Um5LqluzEQJYZhOaTXUr/AJZkuJix8SNCj+W+lBYavHAAOKGeBkWY527+1+LDFOId+/dKrqn+glvFodBNikrTFzRt4mQ9ETMqPoyv/KW9zAdA3qfY1bbJ5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(53546011)(70586007)(70206006)(41300700001)(2616005)(426003)(47076005)(26005)(186003)(8676002)(4326008)(82310400005)(36756003)(31696002)(86362001)(40480700001)(83380400001)(336012)(36860700001)(5660300002)(82740400003)(8936002)(110136005)(478600001)(54906003)(316002)(16576012)(356005)(2906002)(44832011)(81166007)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:14:06.0686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecb7f7e-e1e8-490e-ca75-08daf799a2f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5870

Hi Julien,

On 13/01/2023 11:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, bootloaders can load Xen anywhere in memory but the
> region 2MB - 4MB. While I am not aware of any issue, we have no way
> to tell the bootloader to avoid that region.
> 
> In addition to that, in the future, Xen may grow over 2MB if we
> enable feature like UBSAN or GCOV. To avoid widening the restriction
> on the load address, it would be better to get rid of it.
> 
> When the identity mapping is clashing with the Xen runtime mapping,
> we need an extra indirection to be able to replace the identity
> mapping with the Xen runtime mapping.
> 
> Reserve a new memory region that will be used to temporarily map Xen.
> For convenience, the new area is re-using the same first slot as the
> domheap which is used for per-cpu temporary mapping after a CPU has
> booted.
> 
> Furthermore, directly map boot_second (which cover Xen and more)
> to the temporary area. This will avoid to allocate an extra page-table
> for the second-level and will helpful for follow-up patches (we will
> want to use the fixmap whilst in the temporary mapping).
> 
> Lastly, some part of the code now needs to know whether the temporary
> mapping was created. So reserve r12 to store this information.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ----
>     Changes in v4:
>         - Remove spurious newline
> 
>     Changes in v3:
>         - Remove the ASSERT() in init_domheap_mappings() because it was
>           bogus (secondary CPU root tables are initialized to the CPU0
>           root table so the entry will be valid). Also, it is not
>           related to this patch as the CPU0 root table are rebuilt
>           during boot. The ASSERT() will be re-introduced later.
> 
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/arm32/head.S         | 139 ++++++++++++++++++++++++++----
>  xen/arch/arm/include/asm/config.h |  14 +++
>  xen/arch/arm/mm.c                 |  14 +++
>  3 files changed, 152 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 67b910808b74..3800efb44169 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -35,6 +35,9 @@
>  #define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
>  #define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
> 
> +/* Offset between the early boot xen mapping and the runtime xen mapping */
> +#define XEN_TEMPORARY_OFFSET      (TEMPORARY_XEN_VIRT_START - XEN_VIRT_START)
> +
>  #if defined(CONFIG_EARLY_PRINTK) && defined(CONFIG_EARLY_PRINTK_INC)
>  #include CONFIG_EARLY_PRINTK_INC
>  #endif
> @@ -94,7 +97,7 @@
>   *   r9  - paddr(start)
>   *   r10 - phys offset
>   *   r11 - UART address
> - *   r12 -
> + *   r12 - Temporary mapping created
>   *   r13 - SP
>   *   r14 - LR
>   *   r15 - PC
> @@ -445,6 +448,9 @@ ENDPROC(cpu_init)
>   *   r9 : paddr(start)
>   *   r10: phys offset
>   *
> + * Output:
> + *   r12: Was a temporary mapping created?
> + *
>   * Clobbers r0 - r4, r6
>   *
>   * Register usage within this function:
> @@ -484,7 +490,11 @@ create_page_tables:
>          /*
>           * Setup the 1:1 mapping so we can turn the MMU on. Note that
>           * only the first page of Xen will be part of the 1:1 mapping.
> +         *
> +         * In all the cases, we will link boot_third_id. So create the
> +         * mapping in advance.
>           */
> +        create_mapping_entry boot_third_id, r9, r9
> 
>          /*
>           * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
> @@ -501,8 +511,7 @@ create_page_tables:
>          /*
>           * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
>           * 1:1 mapping will use its own set of page-tables from the
> -         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
> -         * it.
> +         * third level.
>           */
>          get_table_slot r1, r9, 2     /* r1 := second slot */
>          cmp   r1, #XEN_SECOND_SLOT
> @@ -513,13 +522,33 @@ create_page_tables:
>  link_from_second_id:
>          create_table_entry boot_second_id, boot_third_id, r9, 2
>  link_from_third_id:
> -        create_mapping_entry boot_third_id, r9, r9
> +        /* Good news, we are not clashing with Xen virtual mapping */
> +        mov   r12, #0                /* r12 := temporary mapping not created */
>          mov   pc, lr
> 
>  virtphys_clash:
> -        /* Identity map clashes with boot_third, which we cannot handle yet */
> -        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
> -        b     fail
> +        /*
> +         * The identity map clashes with boot_third. Link boot_first_id and
> +         * map Xen to a temporary mapping. See switch_to_runtime_mapping
> +         * for more details.
> +         */
> +        PRINT("- Virt and Phys addresses clash  -\r\n")
> +        PRINT("- Create temporary mapping -\r\n")
> +
> +        /*
> +         * This will override the link to boot_second in XEN_FIRST_SLOT.
> +         * The page-tables are not live yet. So no need to use
> +         * break-before-make.
> +         */
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
> +        create_table_entry boot_second_id, boot_third_id, r9, 2
> +
> +        /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
> +        mov_w r0, TEMPORARY_XEN_VIRT_START
> +        create_table_entry boot_pgtable, boot_second, r0, 1
> +
> +        mov   r12, #1                /* r12 := temporary mapping created */
> +        mov   pc, lr
>  ENDPROC(create_page_tables)
> 
>  /*
> @@ -528,9 +557,10 @@ ENDPROC(create_page_tables)
>   *
>   * Inputs:
>   *   r9 : paddr(start)
> + *  r12 : Was the temporary mapping created?
>   *   lr : Virtual address to return to
>   *
> - * Clobbers r0 - r3
> + * Clobbers r0 - r5
>   */
>  enable_mmu:
>          PRINT("- Turning on paging -\r\n")
> @@ -558,21 +588,79 @@ enable_mmu:
>           * The MMU is turned on and we are in the 1:1 mapping. Switch
>           * to the runtime mapping.
>           */
> -        mov_w r0, 1f
> -        mov   pc, r0
> +        mov   r5, lr                /* Save LR before overwritting it */
> +        mov_w lr, 1f                /* Virtual address in the runtime mapping */
> +        b     switch_to_runtime_mapping
>  1:
> +        mov   lr, r5                /* Restore LR */
>          /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> +         * At this point, either the 1:1 map or the temporary mapping
> +         * will be present. The former may clash with other parts of the
> +         * Xen virtual memory layout. As both of them are not used
> +         * anymore, remove them completely to avoid having to worry
> +         * about replacing existing mapping afterwards.
>           *
>           * On return this will jump to the virtual address requested by
>           * the caller.
>           */
> -        b     remove_identity_mapping
> +        teq   r12, #0
> +        beq   remove_identity_mapping
> +        b     remove_temporary_mapping
>  ENDPROC(enable_mmu)
> 
> +/*
> + * Switch to the runtime mapping. The logic depends on whether the
> + * runtime virtual region is clashing with the physical address
> + *
> + *  - If it is not clashing, we can directly jump to the address in
> + *    the runtime mapping.
> + *  - If it is clashing, create_page_tables() would have mapped Xen to
> + *    a temporary virtual address. We need to switch to the temporary
> + *    mapping so we can remove the identity mapping and map Xen at the
> + *    correct position.
> + *
> + * Inputs
> + *    r9: paddr(start)
> + *   r12: Was a temporary mapping created?
> + *    lr: Address in the runtime mapping to jump to
> + *
> + * Clobbers r0 - r4
> + */
> +switch_to_runtime_mapping:
> +        /*
> +         * Jump to the runtime mapping if the virt and phys are not
> +         * clashing
> +         */
> +        teq   r12, #0
> +        beq   ready_to_switch
> +
> +        /* We are still in the 1:1 mapping. Jump to the temporary Virtual address. */
> +        mov_w r0, 1f
> +        add   r0, r0, #XEN_TEMPORARY_OFFSET /* r0 := address in temporary mapping */
> +        mov   pc, r0
> +
> +1:
> +        /* Remove boot_second_id */
> +        mov   r2, #0
> +        mov   r3, #0
> +        adr_l r0, boot_pgtable
> +        get_table_slot r1, r9, 1            /* r1 := first slot */
> +        lsl   r1, r1, #3                    /* r1 := first slot offset */
> +        strd  r2, r3, [r0, r1]
> +
> +        flush_xen_tlb_local r0
> +
> +        /* Map boot_second into boot_pgtable */
> +        mov_w r0, XEN_VIRT_START
> +        create_table_entry boot_pgtable, boot_second, r0, 1
> +
> +        /* Ensure any page table updates are visible before continuing */
> +        dsb   nsh
> +
> +ready_to_switch:
> +        mov   pc, lr
> +ENDPROC(switch_to_runtime_mapping)
> +
>  /*
>   * Remove the 1:1 map from the page-tables. It is not easy to keep track
>   * where the 1:1 map was mapped, so we will look for the top-level entry
> @@ -618,6 +706,27 @@ identity_mapping_removed:
>          mov   pc, lr
>  ENDPROC(remove_identity_mapping)
> 
> +/*
> + * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
> + *
> + * Clobbers r0 - r1
> + */
> +remove_temporary_mapping:
> +        /* r2:r3 := invalid page-table entry */
> +        mov   r2, #0
> +        mov   r3, #0
> +
> +        adr_l r0, boot_pgtable
> +        mov_w r1, TEMPORARY_XEN_VIRT_START
> +        get_table_slot r1, r1, 1     /* r1 := first slot */
Can't we just use TEMPORARY_AREA_FIRST_SLOT?

> +        lsl   r1, r1, #3             /* r1 := first slot offset */
> +        strd  r2, r3, [r0, r1]
> +
> +        flush_xen_tlb_local r0
> +
> +        mov  pc, lr
> +ENDPROC(remove_temporary_mapping)
> +
>  /*
>   * Map the UART in the fixmap (when earlyprintk is used) and hook the
>   * fixmap table in the page tables.
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 87851e677701..6c1b762e976d 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -148,6 +148,20 @@
>  /* Number of domheap pagetable pages required at the second level (2MB mappings) */
>  #define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
> 
> +/*
> + * The temporary area is overlapping with the domheap area. This may
> + * be used to create an alias of the first slot containing Xen mappings
> + * when turning on/off the MMU.
> + */
> +#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
> +
> +/* Calculate the address in the temporary area */
> +#define TEMPORARY_AREA_ADDR(addr)                           \
> +     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
> +      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
XEN_PT_LEVEL_{MASK/SHIFT} should be used when we do not know the level upfront.
Otherwise, no need for opencoding and you should use FIRST_MASK and FIRST_SHIFT.

~Michal

