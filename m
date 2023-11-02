Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68257DEFD0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626826.977439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUrf-0006sY-GN; Thu, 02 Nov 2023 10:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626826.977439; Thu, 02 Nov 2023 10:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUrf-0006qa-DV; Thu, 02 Nov 2023 10:23:51 +0000
Received: by outflank-mailman (input) for mailman id 626826;
 Thu, 02 Nov 2023 10:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lpi=GP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qyUrd-0006qU-Mv
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:23:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e886be0b-7969-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 11:23:47 +0100 (CET)
Received: from MN2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:208:23e::7)
 by LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 10:23:44 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::bf) by MN2PR14CA0002.outlook.office365.com
 (2603:10b6:208:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Thu, 2 Nov 2023 10:23:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 10:23:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 05:23:43 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 05:23:41 -0500
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
X-Inumbo-ID: e886be0b-7969-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieWQxOcPoc9MWhYWJIAP7kEbgP+3tA9OiyNdqZg3CB5EwvfbEZMw8YQhsIYXgcWM9OLEge/E4DgS/9IjY73G99LiMe4g8tvxoFpTt+Is0bm/iBIptBH62Zw02Emlc3KvsASZ4C6dEf2comFx6PyVc4b2Vx9sUBGlHCc0tdcRLKaNgjToJDbbIdQYVyNDDcsEC0enwa2Gug7zOq3iE/pdKSCruvJJJokl4DK+zYyW4zLa77rDOcH/oVgDJNhCG3ibmR/8rsiGftgyRBqokDycGHCNYj1d+wDA0zFb3dIk8hBDJwfe0rGfZyeAg4bq89/F5lBE1Jq8rmmkjyRujfwW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGdyvwAmJSJb0TfGIYpLEwuMj+ZEB/r3ydoj9509cX8=;
 b=ClQgIYOMyqv36mgQCIelt7Jbf3LEWO7vcrya+yFoz9fiMef6WyRMhJuqnsuGjS+I6FrNr+t/KJil4thYO4d1U1z44/Jlg9Dg0nSwfDTbbRUcBdauV68aVXMKXi25HYzCRn8QDGokjrIpHlmPhCUI/v9uAEhbYMBy/37Ln7VZj85Lf+Z4IVzL3xG2FmB8Q73mLI7yASs6ipAw24eIPkUa7UIp3Wfb3n+c8UYnaabq07We9RiC5zyJ7hlwCalWAQZdaBfB+jwfyJNtOnIH9s9VAO3Wiy1v+iOXSwItne+wxrPuuddOgpiiYJfzCBwZdl+qinqgPJ76SvKB6+tPjg4UHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGdyvwAmJSJb0TfGIYpLEwuMj+ZEB/r3ydoj9509cX8=;
 b=K+mEjHxDL6oW007apfqLcXwMglpyVX9K62Ub6QxTjRvHZ1XN3JabiQ4Q1LqkmVthvj/3ZJablT47R4hdr/TEVflUKkL0skaPjMhwbF9+vvgxTvZBaJfUET8EeSkFi653oExczQfubxxhEYmnvd9Cbwne5MHqRjJfjiX2kMh3vyM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <58a2c0a3-8cb0-473d-a90a-21f8d27b9206@amd.com>
Date: Thu, 2 Nov 2023 11:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm32: head: Improve logging in head.S
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Henry.Wang@arm.com>, <ayan.kumar.halder@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20231101233011.83098-1-julien@xen.org>
 <20231101233011.83098-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231101233011.83098-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|LV3PR12MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fd7542-4f03-4a57-d746-08dbdb8dca9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bOzLeuJT8G0A+nqb/rflOvUOuSNr9XUIK6xS2u/Qb/XPMVmxdPEWJdbuznUeCVPt8RfgglEA+tMu17UeUikxC1kPYcg2i633mT3SNx5p8cDLh6iyUeQgJ80hrvDZCEj5OEemfXSvtpiba8/d+V9zyje6MUT0lgY3jOYG24IUbMdTUr3MqrzBv3tQ//ATjj+ldKHZ4gY99GVx1Dg3FBjSVFgEW9O7SsOSOg47aJvMEVw31olAm9nxtLfSOtEhxsB4R2ctYFpBe8dCVQ1751MNbMHVzkOhPDsXS/kAT5Emi8y4KV6OA3ndKn/qJqaDJRjuVtbiTEFkHns60KoLIDkNc7ZPG0DTxyyt6odgXDA94nnFkD5e7Nh8E0+uTdKYeFh+sGFJUIXfT4gSTbyp6c9g4G9snn8I0PZVJEirOpmJtVt0BLCQ6uhhHU4LB9ZNnRGKXGiK2bLcWxZuobVSa7igblIWyoYOCMPKiQ9iOnhnRLIpsA9qow2UsAKwZM+vR3PsiydJrIzo3Da6EL5zY/MMQV++39dT4nLssZC7hpzl5T3tOjFsGI3H6OyyKMMJpuwtKCZMQVHE9fS+Omr3OMxmCGZ0PO+qtq+TnJbBBMEn9lXq+hJj+xmqS/YPsnFuRhpynk7t2jCfnUyCfuxc92OZ0sIKYvZEFFnNFu4PvEwWXWqMIQeicfD3vCIm0MiWIA0b7Wj3VePJcjQESMgffz7IYAIIS9wKLzD1hWJkT+1Sh52xArhz5T8mbK8AGcy5DdRkrwe+QEbaokEJV8c3K1G1ZWSbvdg1yR4C3nXLwvJr7cF20v6K7NrqXwj1+s91lD9x
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(26005)(41300700001)(40460700003)(53546011)(2616005)(47076005)(81166007)(356005)(86362001)(31696002)(36756003)(82740400003)(36860700001)(83380400001)(426003)(336012)(110136005)(16576012)(8936002)(316002)(8676002)(54906003)(70586007)(5660300002)(70206006)(4326008)(2906002)(31686004)(44832011)(40480700001)(6666004)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 10:23:43.8867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fd7542-4f03-4a57-d746-08dbdb8dca9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9412

Hi Julien,

On 02/11/2023 00:30, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The sequence to enable the MMU on arm32 is quite complex as we may need
> to jump to a temporary mapping to map Xen.
> 
> Recently, we had one bug in the logic (see f5a49eb7f8b3 ("xen/arm32:
> head: Add mising isb in switch_to_runtime_mapping()") and it was
> a pain to debug because there are no logging.
> 
> In order to improve the logging in the MMU switch we need to add
> support for early printk while running on the identity mapping
> and also on the temporary mapping.
> 
> For the identity mapping, we have only the first page of Xen mapped.
> So all the strings should reside in the first page. For that purpose
> a new macro PRINT_ID is introduced.
> 
> For the temporary mapping, the fixmap is already linked the temporary
> area (and so does the UART). So we just need to update the register
> storing the UART address (i.e. r11) to point to the UART temporary
> mapping.
> 
> Take the opportunity to introduce mov_w_on_cond in order to
> conditionally execute mov_w and avoid branches.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S               | 68 ++++++++++++++++++++-----
>  xen/arch/arm/include/asm/asm_defns.h    |  6 ++-
>  xen/arch/arm/include/asm/early_printk.h |  3 ++
>  xen/arch/arm/include/asm/mmu/layout.h   |  4 ++
>  xen/arch/arm/mm.c                       |  5 ++
>  xen/arch/arm/xen.lds.S                  |  1 +
>  6 files changed, 71 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index fec2433e568f..bd61521a9dea 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -46,9 +46,13 @@
>   * Move an immediate constant into a 32-bit register using movw/movt
>   * instructions.
>   */
> +.macro mov_w_on_cond cond, reg, word
> +        movw\cond  \reg, #:lower16:\word
> +        movt\cond  \reg, #:upper16:\word
> +.endm
> +
>  .macro mov_w reg, word
> -        movw  \reg, #:lower16:\word
> -        movt  \reg, #:upper16:\word
> +        mov_w_on_cond al, \reg, \word
>  .endm
> 
>  /*
> @@ -104,16 +108,26 @@
>   */
>  #ifdef CONFIG_EARLY_PRINTK
>  /*
> - * Macro to print a string to the UART, if there is one.
> + * Macros to print a string to the UART, if there is one.
> + *
> + * There are multiple flavors:
> + *  - PRINT_SECT(section, string): The @string will be located in @section
> + *  - PRINT(): The string will be located in .rodata.str.
> + *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
> + *    only possible to have a limited amount of Xen. This will create
> + *    the string in .rodata.idmap which will always be mapped.
>   *
>   * Clobbers r0 - r3
>   */
> -#define PRINT(_s)           \
> -        mov   r3, lr       ;\
> -        adr_l r0, 98f      ;\
> -        bl    puts         ;\
> -        mov   lr, r3       ;\
> -        RODATA_STR(98, _s)
> +#define PRINT_SECT(section, string)         \
> +        mov   r3, lr                       ;\
> +        adr_l r0, 98f                      ;\
> +        bl    puts                         ;\
> +        mov   lr, r3                       ;\
> +        RODATA_SECT(section, 98, string)
> +
> +#define PRINT(string) PRINT_SECT(.rodata.str, string)
> +#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
> 
>  /*
>   * Macro to print the value of register \rb
> @@ -129,6 +143,7 @@
> 
>  #else /* CONFIG_EARLY_PRINTK */
>  #define PRINT(s)
> +#define PRINT_ID(s)
> 
>  .macro print_reg rb
>  .endm
> @@ -183,11 +198,6 @@ past_zImage:
>          bl    check_cpu_mode
>          bl    cpu_init
>          bl    create_page_tables
> -        /* Add the UART mapping if requested */
> -#ifdef CONFIG_EARLY_PRINTK
> -        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
> -        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
> -#endif
I think that patch no.1 should move the mapping into init_uart right away. This way
the issue I mentioned in that patch will be fixed and there will be no need to remove the code
introduced just before.

> 
>          /* Address in the runtime mapping to jump to after the MMU is enabled */
>          mov_w lr, primary_switched
> @@ -593,6 +603,21 @@ enable_mmu:
>          mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
>          isb                          /* Now, flush the icache */
> 
> +        /*
> +         * At this stage, the UART address will depend on whether the
> +         * temporary mapping was created or not.
> +         *
> +         * If it was, then the UART will be mapped in the temporary
> +         * area. Otherwise, it will be mapped at runtime virtual
> +         * mapping.
> +         */
> +#ifdef CONFIG_EARLY_PRINTK
> +        teq   r12, #1               /* Was the temporary mapping created? */
> +        mov_w_on_cond eq, r11, TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS
Shouldn't the clobber list be updated?

> +        mov_w_on_cond ne, r11, EARLY_UART_VIRTUAL_ADDRESS
> +#endif
> +        PRINT_ID("- Paging turned on -\r\n")
> +
>          /*
>           * The MMU is turned on and we are in the 1:1 mapping. Switch
>           * to the runtime mapping.
> @@ -643,12 +668,14 @@ switch_to_runtime_mapping:
>          teq   r12, #0
>          beq   ready_to_switch
> 
> +        PRINT_ID("- Switching to the temporary mapping -\r\n")
>          /* We are still in the 1:1 mapping. Jump to the temporary Virtual address. */
>          mov_w r0, 1f
>          add   r0, r0, #XEN_TEMPORARY_OFFSET /* r0 := address in temporary mapping */
>          mov   pc, r0
> 
>  1:
> +        PRINT("- Running on the temporary mapping  -\r\n")
>          /* Remove boot_second_id */
>          mov   r2, #0
>          mov   r3, #0
> @@ -659,6 +686,8 @@ switch_to_runtime_mapping:
> 
>          flush_xen_tlb_local r0
> 
> +        PRINT("- 1:1 mapping removed -\r\n")
> +
>          /* Map boot_second into boot_pgtable */
>          mov_w r0, XEN_VIRT_START
>          create_table_entry boot_pgtable, boot_second, r0, 1
> @@ -671,7 +700,10 @@ switch_to_runtime_mapping:
>           */
>          isb
> 
> +        PRINT("- Runtime mapping mapped -\r\n")
>  ready_to_switch:
> +        PRINT("- Jumping to runtime address -\r\n")
This is causing a boot hang in a configuration where there is no need for temporary mapping.
In that case, we are still in 1:1 map and should use PRINT_ID

> +
>          mov   pc, lr
>  ENDPROC(switch_to_runtime_mapping)
> 
> @@ -795,6 +827,14 @@ init_uart:
>          early_uart_init r11, r1, r2
>  #endif
>          PRINT("- UART enabled -\r\n")
> +
> +        /*
> +         * Add the UART mapping to the fixmap so the UART can be used
> +         * as the MMU is on.
> +         */
> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
Shouldn't the clobber list be updated to include r4?

> +
>          mov   pc, lr
>  ENDPROC(init_uart)
> 
> diff --git a/xen/arch/arm/include/asm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
> index 29a9dbb002fa..ec803c0a370c 100644
> --- a/xen/arch/arm/include/asm/asm_defns.h
> +++ b/xen/arch/arm/include/asm/asm_defns.h
> @@ -22,11 +22,13 @@
>  # error "unknown ARM variant"
>  #endif
> 
> -#define RODATA_STR(label, msg)                  \
> -.pushsection .rodata.str, "aMS", %progbits, 1 ; \
> +#define RODATA_SECT(section, label, msg)         \
> +.pushsection section, "aMS", %progbits, 1 ;     \
>  label:  .asciz msg;                             \
>  .popsection
> 
> +#define RODATA_STR(label, msg) RODATA_SECT(.rodata.str, label, msg)
> +
>  #define ASM_INT(label, val)                 \
>      .p2align 2;                             \
>  label: .long (val);                         \
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
> index c5149b2976da..c1e84f8b0009 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -19,6 +19,9 @@
>  #define EARLY_UART_VIRTUAL_ADDRESS \
>      (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
> 
> +#define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
> +    (TEMPORARY_FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
> +
>  #endif /* !CONFIG_EARLY_PRINTK */
> 
>  #endif
> diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
> index da6be276ac5f..68855c4f3184 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -113,6 +113,10 @@
>        (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
> 
>  #define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
> +#define TEMPORARY_FIXMAP_VIRT_START TEMPORARY_AREA_ADDR(FIXMAP_VIRT_START)
> +
> +#define TEMPORARY_FIXMAP_ADDR(n)                    \
> +     (TEMPORARY_FIXMAP_VIRT_START + (n) * PAGE_SIZE)
> 
>  #else /* ARM_64 */
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index c34cc94c907a..6ffa45c53be6 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -193,7 +193,12 @@ static void __init __maybe_unused build_assertions(void)
>  #ifdef CONFIG_ARM_32
>      CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
>      CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> +    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START,
> +                    TEMPORARY_FIXMAP_VIRT_START);
> +    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START,
> +                    TEMPORARY_FIXMAP_VIRT_START);
duplicated entry?

~Michal

