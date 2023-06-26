Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7873DDF3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555459.867244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkd2-0002Gl-KR; Mon, 26 Jun 2023 11:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555459.867244; Mon, 26 Jun 2023 11:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkd2-0002Ey-FO; Mon, 26 Jun 2023 11:43:32 +0000
Received: by outflank-mailman (input) for mailman id 555459;
 Mon, 26 Jun 2023 11:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkd1-0002Es-Fz
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:43:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab1a9143-1416-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 13:43:29 +0200 (CEST)
Received: from BN9PR03CA0671.namprd03.prod.outlook.com (2603:10b6:408:10e::16)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 11:43:25 +0000
Received: from BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::db) by BN9PR03CA0671.outlook.office365.com
 (2603:10b6:408:10e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 11:43:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT074.mail.protection.outlook.com (10.13.176.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:43:24 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:43:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 26 Jun
 2023 04:43:23 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:43:21 -0500
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
X-Inumbo-ID: ab1a9143-1416-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giJwezzJHw6611jedAUUVKOLru7+6CzF4zmaJXz4BNFvEZeZrIhwG5jftykf+Ygnh2B201JdYUF+5qKjQFiRmTzPfz1M/wFgkL6540TnEC7RR5TNnJkHp2Q7R0sU2j0zt1Q76ExxrCHyzxEGEn7huCAGWLiZ18ejxNpjSvN+QYh5yetkqtCOZ5POop7pS2gQBiYGzBiONoFBYYuHLd+V4S5IdWrQEMzfdltiapPiSpf/9reptRAwLKdpjx6/XdaEEL97Ap6eFGIAo0D84fqXk11rosvKCBpg/fovvk9AnnTiRXUX8VZcW5jvl1VUIulDwjovmnlVPGkXyZ/8syfVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNUmSJMVKl0uSHP40181BLwYmBqK/2F05E/fv2k2LeM=;
 b=Ul5BzaYSBgHXOhc2F9hDg/qHG2m0Sh2zXOLI9xPJxl9K48Yro9jFcXKbTmHEVGLUgtHVZbr8IGW5x4fsFzqoFgdE7YOYgiICeKir6HQa6djR/DhqNncw6vWs/jZME2PwrH6VIByNvgKer2ciSNYDm5eQpiwsbyful/xhNc4VkosUWfU9v7GfLlvIz3I3q45Wu8r4yOjF03F9LG6wf5bOowitIXbPeoSp+GY21vfnOp+P1G/3YrZsFJsmu60K3cBArRwCnxp9N6eu5KmS2t407fElna9wxTiVTJvJ7m8qawp56+h8GjDgIA+3HQRIbwimOKNd8yHyFqocdFiMtn5f6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNUmSJMVKl0uSHP40181BLwYmBqK/2F05E/fv2k2LeM=;
 b=A0kHqPKUvLKkcvblBNS3lsSXb3ulG7bgUZWEqQ6Y9hiLuoyi+7D+EDZ7vlxWna/SZu+3K3YHN5jmTNlxz1dE9TBhNOUF/eaV3tVvRte7p7XraLnIsdJDAfIYpxxFprI9vztR/NunTJTw4TDCAok/DEmNFnFHz1ovatp8ZWDzxVo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <170a1f3c-526a-dfd9-0d87-101fb77f3415@amd.com>
Date: Mon, 26 Jun 2023 13:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/9] xen/arm: Rework the code mapping Xen to avoid relying
 on the size of Xen
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-6-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-6-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT074:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 47325097-960e-448e-6e81-08db763a8d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	94bem0Rvo6JtZjRqr+GDKOZpvDoP2lEFYzC4ZOT/0jS6u5feYLG0E8LMlc5YVMBu88hxI9R4t7KWc4PFDb2fJj2Y2R9T0hBy2AApq5TZgNyHczKUpSwBmomUhEf4Qor+L9mI45HD3WDDbLujmbeor+WwF1DzRenFxPK97HFNbmhtTjXz5kkWxyHrqpwhqoxgyRo6JAePMkAz9AhBGb2lnuN8JGRNbQUIpFJ1dp2qSJ1wYz3T8UslXoKYGPpi3EfcpHaWBda6Sg+aWQw5C1mhI5OGJAFJjBc4uDw4NaUuxpTlp0xpeA2WplvPtEp1DfiAGCx1M60l6+/D43eGFaVbUXwbnbKQQgZw90VEU1ghjwTFGu0UOD8HrPhiMVE/gUudUqxPJgGnD4ye5IfWzPgLw+Gpubf+zknzpYxIa86KeKBItMmaXPcLCIdqwvc+EDxql9X4KMkXfnsqZsRS9WRoTOfFJU1kihJoqEw+FQDeh0n/9qCKTE5+H+cGGZrIicOTvxl++GCCyXvbHR/f8gsMQL07HFN1VBr0CrqQ+EuPzR0evqn98ZnRpprXNXlZkjm5gLjFnXzM4Igo6IW3B6IUCLOD16JMHadVu7Lox0f6ZfWTa8bMkFt9tr1LnDcT+WLwi6Ho3yxKb4bxpPwV7eeDsnKtNvYqF9J73+kNcavrHDC4V9YDObO58Dgcn9BJg+dshSc5BRunCK4bWmph25b4zzM7YHOjP3TghBcaKL91sm1xQKY04PiDsw9vLRqZCtFFSK7bw5yhlcFvUg1f2hftzui1a0uEdcigQKwecZDSESBig5EPMzS7E0ElVHSYK4ib
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(31686004)(82310400005)(36860700001)(36756003)(40460700003)(70206006)(30864003)(5660300002)(44832011)(356005)(8936002)(8676002)(41300700001)(86362001)(81166007)(40480700001)(4326008)(316002)(70586007)(31696002)(82740400003)(47076005)(26005)(53546011)(2906002)(478600001)(186003)(2616005)(16576012)(426003)(54906003)(110136005)(336012)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:43:24.9302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47325097-960e-448e-6e81-08db763a8d0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the maximum size of Xen binary we can support is 2MB.
> This is what we reserved in the virtual address but also what all
> the code in Xen relies on as we only allocate one L3 page-table.
> 
> When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
> are enabled, the binary will be way over 2MB.
> 
> The code is now reworked so it doesn't realy on a specific size but
s/realy/rely

> will instead look at the reversed size and compute the number of
> page-table to allocate/map.
> 
> While at it, replace any reference to 4KB mappings with a more
> generic word because the page-size may change in the future.
> 
> Also fix the typo s/tlb/tbl/ in code move in arm32/head.S
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S         | 61 ++++++++++++++++++++++++-------
>  xen/arch/arm/arm64/head.S         | 51 +++++++++++++++++++++-----
>  xen/arch/arm/include/asm/config.h |  1 +
>  xen/arch/arm/include/asm/lpae.h   |  8 ++--
>  xen/arch/arm/mm.c                 | 24 +++++++-----
>  5 files changed, 108 insertions(+), 37 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 5e3692eb3abf..5448671de897 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -373,35 +373,55 @@ ENDPROC(cpu_init)
>  .endm
> 
>  /*
> - * Macro to create a page table entry in \ptbl to \tbl
> + * Macro to create a page table entry in \ptbl to \tbl (physical
> + * address)
>   *
>   * ptbl:    table symbol where the entry will be created
> - * tbl:     table symbol to point to
> + * tbl:     physical address of the table to point to
>   * virt:    virtual address
>   * lvl:     page-table level
>   *
>   * Preserves \virt
> - * Clobbers r1 - r4
> + * Clobbers \tbl, r1 - r3
>   *
>   * Also use r10 for the phys offset.
This no longer applies.

>   *
> - * Note that \virt should be in a register other than r1 - r4
> + * Note that \tbl and \virt should be in a register other than r1 - r3
>   */
> -.macro create_table_entry, ptbl, tbl, virt, lvl
> -        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
> -        lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
> -
> -        load_paddr r4, \tbl
> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
> +        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tbl */
> +        lsl   r1, r1, #3                /* r1 := slot offset in \tbl */
> 
>          movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
> -        orr   r2, r2, r4             /*           + \tlb paddr */
> +        orr   r2, r2, \tbl           /*           + \tbl paddr */
>          mov   r3, #0
> 
> -        adr_l r4, \ptbl
> +        adr_l \tbl, \ptbl            /* \tbl := (v,p)addr of \ptbl */
> 
> -        strd  r2, r3, [r4, r1]
> +        strd  r2, r3, [\tbl, r1]
>  .endm
> 
> +
> +/*
> + * Macro to create a page table entry in \ptbl to \tbl (symbol)
> + *
> + * ptbl:    table symbol where the entry will be created
> + * tbl:     table symbol to point to
> + * virt:    virtual address
> + * lvl:     page-table level
> + *
> + * Preserves \virt
> + * Clobbers r1 - r4
> + *
> + * Also use r10 for the phys offset.
> + *
> + * Note that \virt should be in a register other than r1 - r4
> + */
> +.macro create_table_entry, ptbl, tbl, virt, lvl
> +        load_paddr r4, \tbl
> +        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
> + .endm
> +
>  /*
>   * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
>   * level table (i.e page granularity) is supported.
> @@ -451,13 +471,26 @@ ENDPROC(cpu_init)
>   * Output:
>   *   r12: Was a temporary mapping created?
>   *
> - * Clobbers r0 - r4
> + * Clobbers r0 - r5
>   */
>  create_page_tables:
>          /* Prepare the page-tables for mapping Xen */
>          mov_w r0, XEN_VIRT_START
>          create_table_entry boot_pgtable, boot_second, r0, 1
> -        create_table_entry boot_second, boot_third, r0, 2
> +
> +        /*
> +         * We need to use a stash register because
> +         * create_table_entry_paddr() will clobber the register storing
> +         * the physical address of the table to point to.
> +         */
> +        load_paddr r5, boot_third
> +        mov_w r4, XEN_VIRT_START
Can you just reuse r0 that is already set to XEN_VIRT_START not to repeat this operation over and over again?

> +.rept XEN_NR_ENTRIES(2)
> +        mov   r0, r5                        /* r0 := paddr(l3 table) */
> +        create_table_entry_from_paddr boot_second, r0, r4, 2
> +        add   r4, r4, #XEN_PT_LEVEL_SIZE(2) /* r4 := Next vaddr */
> +        add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
> +.endr
> 
>          /*
>           * Find the size of Xen in pages and multiply by the size of a
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 66bc85d4c39e..c9e2e36506d9 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -490,6 +490,31 @@ ENDPROC(cpu_init)
>          ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
>  .endm
> 
> +/*
> + * Macro to create a page table entry in \ptbl to \tbl
> + * ptbl:    table symbol where the entry will be created
> + * tbl:     physical address of the table to point to
> + * virt:    virtual address
> + * lvl:     page-table level
> + * tmp1:    scratch register
> + * tmp2:    scratch register
> + *
> + * Preserves \virt
> + * Clobbers \tbl, \tmp1, \tmp2
> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl, tmp1, tmp2
> +        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
s/tlb/tbl

> +
> +        mov   \tmp2, #PT_PT                 /* \tmp2 := right for linear PT */
> +        orr   \tmp2, \tmp2, \tbl            /*          + \tlb */
s/tlb/tbl

> +
> +        adr_l \tbl, \ptbl                   /* \tlb := address(\ptbl) */
s/tlb/tbl

> +
> +        str   \tmp2, [\tbl, \tmp1, lsl #3]
> +.endm
> +
>  /*
>   * Macro to create a page table entry in \ptbl to \tbl
>   *
> @@ -509,15 +534,8 @@ ENDPROC(cpu_init)
>   * Note that all parameters using registers should be distinct.
>   */
>  .macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
> -        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
> -
> -        load_paddr \tmp2, \tbl
> -        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
> -        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
> -
> -        adr_l \tmp2, \ptbl
> -
> -        str   \tmp3, [\tmp2, \tmp1, lsl #3]
> +        load_paddr \tmp1, \tbl
> +        create_table_entry_from_paddr \ptbl, \tmp1, \virt, \lvl, \tmp2, \tmp3
>  .endm
> 
>  /*
> @@ -570,7 +588,20 @@ create_page_tables:
>          ldr   x0, =XEN_VIRT_START
>          create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
>          create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
> -        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
> +
> +        /*
> +         * We need to use a stash register because
> +         * create_table_entry_paddr() will clobber the register storing
> +         * the physical address of the table to point to.
> +         */
> +        load_paddr x4, boot_third
> +        ldr   x1, =XEN_VIRT_START
Can you just reuse x0 that is already set to XEN_VIRT_START not to repeat this operation over and over again?

> +.rept XEN_NR_ENTRIES(2)
> +        mov   x0, x4                            /* x0 := paddr(l3 table) */
> +        create_table_entry_from_paddr boot_second, x0, x1, 2, x2, x3
> +        add   x1, x1, #XEN_PT_LEVEL_SIZE(2)     /* x1 := Next vaddr */
> +        add   x4, x4, #PAGE_SIZE                /* x4 := Next table */
> +.endr
> 
>          /*
>           * Find the size of Xen in pages and multiply by the size of a
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index c969e6da589d..6d246ab23c48 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -125,6 +125,7 @@
>  #endif
> 
>  #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
> +#define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
> 
>  #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>  #define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 7d2f6fd1bd5a..93e824f01125 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -267,15 +267,17 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
> 
>  /*
>   * Macros to define page-tables:
> - *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
> + *  - DEFINE_BOOT_PAGE_TABLE{,S} are used to define page-table that are used
s/page-table/page-table(s)/ or maybe using the same comment as for runtime pgt macro

>   *  in assembly code before BSS is zeroed.
>   *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
>   *  page-tables to be used after BSS is zeroed (typically they are only used
>   *  in C).
>   */
> -#define DEFINE_BOOT_PAGE_TABLE(name)                                          \
> +#define DEFINE_BOOT_PAGE_TABLES(name, nr)                                     \
>  lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
> -    name[XEN_PT_LPAE_ENTRIES]
> +    name[XEN_PT_LPAE_ENTRIES * (nr)]
> +
> +#define DEFINE_BOOT_PAGE_TABLE(name) DEFINE_BOOT_PAGE_TABLES(name, 1)
> 
>  #define DEFINE_PAGE_TABLES(name, nr)                    \
>  lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index e460249736c3..2b2ff6015ebd 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -53,8 +53,8 @@ mm_printk(const char *fmt, ...) {}
>   * to the CPUs own pagetables.
>   *
>   * These pagetables have a very simple structure. They include:
> - *  - 2MB worth of 4K mappings of xen at XEN_VIRT_START, boot_first and
> - *    boot_second are used to populate the tables down to boot_third
> + *  - XEN_VIRT_SIZE worth of L3 mappings of xen at XEN_VIRT_START, boot_first
> + *    and boot_second are used to populate the tables down to boot_third
>   *    which contains the actual mapping.
>   *  - a 1:1 mapping of xen at its current physical address. This uses a
>   *    section mapping at whichever of boot_{pgtable,first,second}
> @@ -79,7 +79,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_first_id);
>  DEFINE_BOOT_PAGE_TABLE(boot_second_id);
>  DEFINE_BOOT_PAGE_TABLE(boot_third_id);
>  DEFINE_BOOT_PAGE_TABLE(boot_second);
> -DEFINE_BOOT_PAGE_TABLE(boot_third);
> +DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
> 
>  /* Main runtime page tables */
> 
> @@ -115,7 +115,7 @@ DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
>   * Third level page table used to map Xen itself with the XN bit set
>   * as appropriate.
>   */
> -static DEFINE_PAGE_TABLE(xen_xenmap);
> +static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
> 
>  /* Non-boot CPUs use this to find the correct pagetables. */
>  uint64_t init_ttbr;
> @@ -518,15 +518,15 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>      p[0].pt.table = 1;
>      p[0].pt.xn = 0;
> 
> -    /* Break up the Xen mapping into 4k pages and protect them separately. */
> -    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
> +    /* Break up the Xen mapping into pages and protect them separately. */
> +    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
>      {
>          vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
> 
>          if ( !is_kernel(va) )
>              break;
>          pte = pte_of_xenaddr(va);
> -        pte.pt.table = 1; /* 4k mappings always have this bit set */
> +        pte.pt.table = 1; /* third level mappings always have this bit set */
>          if ( is_kernel_text(va) || is_kernel_inittext(va) )
>          {
>              pte.pt.xn = 0;
> @@ -539,10 +539,14 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
> 
>      /* Initialise xen second level entries ... */
>      /* ... Xen's text etc */
> +    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
> +    {
> +        vaddr_t va = XEN_VIRT_START + i * XEN_PT_LEVEL_SIZE(2);
For consistency with the upper loop, maybe (i << XEN_PT_LEVEL_SHIFT(2)) ?

These are all just minor comments, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

