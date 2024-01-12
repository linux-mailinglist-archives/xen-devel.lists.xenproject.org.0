Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C182BC82
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 09:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666694.1037486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rODEG-0004Pj-4T; Fri, 12 Jan 2024 08:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666694.1037486; Fri, 12 Jan 2024 08:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rODEG-0004NY-0R; Fri, 12 Jan 2024 08:49:28 +0000
Received: by outflank-mailman (input) for mailman id 666694;
 Fri, 12 Jan 2024 08:49:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12w8=IW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rODEE-0004NS-Mu
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 08:49:26 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a626bcc-b127-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 09:49:22 +0100 (CET)
Received: from BYAPR02CA0047.namprd02.prod.outlook.com (2603:10b6:a03:54::24)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 08:49:15 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::4) by BYAPR02CA0047.outlook.office365.com
 (2603:10b6:a03:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23 via Frontend
 Transport; Fri, 12 Jan 2024 08:49:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 08:49:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 02:49:11 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 02:49:09 -0600
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
X-Inumbo-ID: 7a626bcc-b127-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njGeEZWdkTw2HYU77dSZphlbEph3Ju+SHOo2XfOhuht5+0Fj7NlqMLMgAcSo0zJ2klPVK0aGML6h+vNzL3qA7Wl02rKfPMk+kqiWoojlwM2fce+OBVHaptKEvzZkkKP9XiTu6XqVJE6vpE6iaCde9JpEc1d3ENfUq7BVF7u2OGu2P+83w9ww3W89u21tlZsZGfOhkIDT9VQmkD+dRpfObt7JHiqEQyuEcnkgrYTaSawhZeXemdK3FARurbLfWfrvU9KFVCUVISmuWtFYky3ae5yvZVMwzJA3bOm6MVPSxC/yYAS/6z/atoXLtFG83VCehqUx3NV7W7THQMgr0AIQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qI0GK4Xgwn25JQXWhy5sQ4nCzBAnAZMpgeAwk5pPqI=;
 b=Sf8i/fMasy+cuVZGCSYIQLajDQpqFvc44OIMGWFaa0LZMkRi01CqoVf6uJ3tVIduKJzGRk/kX86+E3uMg1WOhCfMIYyqBJI0ZEM5/4Qzn+Z/ROrv2ZQ5Fpu9PJfSaGq17Lja2r4a6AQkIE9uFdf1S0Vrbt17NjmVsH79MYOuSxqR4QPX2XYpt8gaBTrUAl1wNuM7+8Hy+flWfcm8DeHCaR0JmC1dfmZg6KIunsJMVQUBKMBavKZUVEFkNcuiyRJBU0rZQ/5mwDkYxeQsuzYq+B4eJcIGjyfijlMhCYs1QofjwPLBKb9rlHrAUBZOxR88hluYTQVldMKSV5i6qPIuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qI0GK4Xgwn25JQXWhy5sQ4nCzBAnAZMpgeAwk5pPqI=;
 b=aDwUGylOw+LUGOv6TNcWgV64ry9cMQzJFUfdnnBiW3UUmZNEg7kJL++5ohgmJS108pLOBoVM75x/8hilQbtNOM6rY5qYHoZfVH7xWviFXzzJONk3KBlioTN9HFEL9b3ZzCCLkWadDVHU7noqIVN3BCcc6sHNBdhBcZw67t+BGqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <58d2e455-2894-4b1f-948a-3b486bb84499@amd.com>
Date: Fri, 12 Jan 2024 09:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm32: head: Improve logging in head.S
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111183410.45566-1-julien@xen.org>
 <20240111183410.45566-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240111183410.45566-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cd047d-2ec8-4ee4-c450-08dc134b5abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IcOPoK0suv5SiGrgcgxTmxpxgKTnRDCr6hBre04EwrnCNDOwHpdNrLZHaZs4EjKbYnASMz/qLGIO58FlFRwM6g9Q7AhydJfe/rq9mu4jglQ0gi+0SxZR46HNZIcnOGIMPzHMuSYUlpuXh5P0ZmB8XSQzz2eI7rlgMUur4EEzm41o7AIUBj6y1fU382T+vK0cXJctlKsvlXMbAz6Mp1YIGXf8rTZgyb8XCagFLO58RgU4aJ/6MT+tFqNLH3PxobuaOnSxuA62jA+r6/G6HJpCgZCKoiBgLjuTigXCLmQaxQr5wYyEBy5asjuJmMI4vllVGIaRT+rpRS2mmGh02mWb2HP3CBv0vIOz9BQQzbgcNyZGgxoSqjKaBdiiIVGLUDhr3ED00Me4V67Upw241K4S3e6SydYC7ZC1Z6cy3SWu+/K/qrWfLGu3XRz/CEO6F1OAUPkooUeoK0po6NDIx0WPFShLbxuaLAQt1sPRZYqNron5wJ5Mi2/E+YNdrrxfgROuFg14JvfKHAFqpGpb7BI9PPVk+621Yaq1ZFNm10eQqg5aB1NHA8yIEEm6xadLqFeGgQHLz3CgO6ZVR/7bsx1cf0/zyVQx4vAEt+pRL7eCF6+wsM356v2C9WYS76vlp6E68VLj9Fm6xLCOjKRqSrwbJOgubzvimYsqfdfoVhdT5X7gD7jFg5wM5T2O16UHGbt60IZG8YvdWOa87KHFXXlirX+LJ1GgbS2pKdf2Af7nC8rowjJX7hGEOcld6DHkD2dTvw1Z0aCAsaSdVTPVjd9Y3Zh0m+yXnMGwnIya/lo/+fN705S1oo9LZYHktk+ASCLy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(31696002)(4326008)(44832011)(2906002)(110136005)(426003)(478600001)(82740400003)(54906003)(2616005)(70586007)(30864003)(83380400001)(36756003)(5660300002)(70206006)(47076005)(336012)(36860700001)(316002)(26005)(16576012)(53546011)(45080400002)(8936002)(86362001)(81166007)(41300700001)(356005)(40480700001)(8676002)(31686004)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:49:14.4247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cd047d-2ec8-4ee4-c450-08dc134b5abb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116

Hi Julien,

On 11/01/2024 19:34, Julien Grall wrote:
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
> For the temporary mapping, the fixmap is already linked in the temporary
> area (and so does the UART). So we just need to update the register
> storing the UART address (i.e. r11) to point to the UART temporary
> mapping.
> 
> Take the opportunity to introduce mov_w_on_cond in order to
> conditionally execute mov_w and avoid branches.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with some questions below:

> 
> ----
>     Changelog since v1:
>         - Rebase
>         - Move one hunk to the first patch to unbreak compilation
>         - Add more logging
>         - Remove duplicated entry
> ---
>  xen/arch/arm/arm32/head.S               |  9 ------
>  xen/arch/arm/arm32/mmu/head.S           | 39 +++++++++++++++++++++++++
>  xen/arch/arm/include/asm/arm32/macros.h | 33 +++++++++++++++------
>  xen/arch/arm/include/asm/asm_defns.h    |  6 ++--
>  xen/arch/arm/include/asm/early_printk.h |  3 ++
>  xen/arch/arm/include/asm/mmu/layout.h   |  4 +++
>  xen/arch/arm/mmu/setup.c                |  3 ++
>  xen/arch/arm/xen.lds.S                  |  1 +
>  8 files changed, 78 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 34ab14a9e228..99d7d4aa63d1 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -98,10 +98,6 @@ past_zImage:
>          b     enable_boot_cpu_mm
> 
>  primary_switched:
> -#ifdef CONFIG_EARLY_PRINTK
> -        /* Use a virtual address to access the UART. */
> -        mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> -#endif
>          bl    zero_bss
>          PRINT("- Ready -\r\n")
>          /* Setup the arguments for start_xen and jump to C world */
> @@ -142,12 +138,7 @@ GLOBAL(init_secondary)
> 
>          mov_w lr, secondary_switched
>          b     enable_secondary_cpu_mm
> -
>  secondary_switched:
> -#ifdef CONFIG_EARLY_PRINTK
> -        /* Use a virtual address to access the UART. */
> -        mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> -#endif
>          PRINT("- Ready -\r\n")
>          /* Jump to C world */
>          mov_w r2, start_secondary
> diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
> index a90799ad5451..f4abd690b612 100644
> --- a/xen/arch/arm/arm32/mmu/head.S
> +++ b/xen/arch/arm/arm32/mmu/head.S
> @@ -298,6 +298,21 @@ enable_mmu:
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
> +        mov_w_on_cond ne, r11, EARLY_UART_VIRTUAL_ADDRESS
> +#endif
> +        PRINT_ID("- Paging turned on -\r\n")
> +
>          /*
>           * The MMU is turned on and we are in the 1:1 mapping. Switch
>           * to the runtime mapping.
> @@ -307,6 +322,17 @@ enable_mmu:
>          b     switch_to_runtime_mapping
>  1:
>          mov   lr, r5                /* Restore LR */
> +
> +        /*
> +         * Now we are running at the runtime address. The UART can
> +         * be accessed using its runtime virtual address.
> +         */
> +#ifdef CONFIG_EARLY_PRINTK
> +        mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> +#endif
> +
> +        PRINT("- Switched to the runtime mapping -\r\n")
> +
>          /*
>           * At this point, either the 1:1 map or the temporary mapping
>           * will be present. The former may clash with other parts of the
> @@ -348,12 +374,14 @@ switch_to_runtime_mapping:
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
> @@ -364,6 +392,8 @@ switch_to_runtime_mapping:
> 
>          flush_xen_tlb_local r0
> 
> +        PRINT("- 1:1 mapping removed -\r\n")
Do I understand it right that we cannot call remove_identity_mapping due to adr_l/mov_w difference?

> +
>          /* Map boot_second into boot_pgtable */
>          mov_w r0, XEN_VIRT_START
>          create_table_entry boot_pgtable, boot_second, r0, 1
> @@ -376,7 +406,10 @@ switch_to_runtime_mapping:
>           */
>          isb
> 
> +        PRINT("- Runtime mapping mapped -\r\n")
>  ready_to_switch:
> +        PRINT_ID("- Jumping to runtime address -\r\n")
> +
>          mov   pc, lr
>  ENDPROC(switch_to_runtime_mapping)
> 
> @@ -404,6 +437,8 @@ ENTRY(enable_secondary_cpu_mm)
>          mov_w lr, 1f
>          b     enable_mmu
>  1:
> +        PRINT("- Switching to the runtime page-tables -\r\n")
> +
>          /*
>           * Non-boot CPUs need to move on to the proper pagetables, which were
>           * setup in prepare_secondary_mm.
> @@ -468,6 +503,8 @@ ENDPROC(enable_boot_cpu_mm)
>   * Clobbers r0 - r3
>   */
>  remove_identity_mapping:
> +        PRINT("- Removing the identity mapping -\r\n")
> +
>          /* r2:r3 := invalid page-table entry */
>          mov   r2, #0x0
>          mov   r3, #0x0
> @@ -488,6 +525,8 @@ ENDPROC(remove_identity_mapping)
>   * Clobbers r0 - r3
>   */
>  remove_temporary_mapping:
> +        PRINT("- Removing the temporary mapping -\r\n")
> +
>          /* r2:r3 := invalid page-table entry */
>          mov   r2, #0
>          mov   r3, #0
> diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
> index b84666c764d4..db681a7c7eaa 100644
> --- a/xen/arch/arm/include/asm/arm32/macros.h
> +++ b/xen/arch/arm/include/asm/arm32/macros.h
> @@ -9,9 +9,13 @@
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
> @@ -29,16 +33,26 @@
> 
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
> -        bl    asm_puts     ;\
> -        mov   lr, r3       ;\
> -        RODATA_STR(98, _s)
> +#define PRINT_SECT(section, string)         \
> +        mov   r3, lr                       ;\
> +        adr_l r0, 98f                      ;\
> +        bl    asm_puts                     ;\
> +        mov   lr, r3                       ;\
> +        RODATA_SECT(section, 98, string)
> +
> +#define PRINT(string) PRINT_SECT(.rodata.str, string)
> +#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
I know this is just a macro but does it make sense to have something MMU specific in common header?
I don't expect MPU to use it.

> 
>  /*
>   * Macro to print the value of register \rb
> @@ -54,6 +68,7 @@
> 
>  #else /* CONFIG_EARLY_PRINTK */
>  #define PRINT(s)
> +#define PRINT_ID(s)
> 
>  .macro print_reg rb
>  .endm
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
> index eac7eef885d6..a3b546465b5a 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -116,6 +116,10 @@
>        (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
> 
>  #define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
> +#define TEMPORARY_FIXMAP_VIRT_START TEMPORARY_AREA_ADDR(FIXMAP_VIRT_START)
> +
> +#define TEMPORARY_FIXMAP_ADDR(n)                    \
> +     (TEMPORARY_FIXMAP_VIRT_START + (n) * PAGE_SIZE)
NIT: this could fit in one line

> 
>  #else /* ARM_64 */
> 
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index d5264e51bc44..72725840b6b7 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -120,7 +120,10 @@ static void __init __maybe_unused build_assertions(void)
>  #ifdef CONFIG_ARM_32
>      CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
>      CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> +    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START,
> +                    TEMPORARY_FIXMAP_VIRT_START);
>      CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
> +    CHECK_SAME_SLOT(second, FIXMAP_VIRT_START, TEMPORARY_FIXMAP_VIRT_START);
>  #endif
> 
>  #undef CHECK_SAME_SLOT
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 59b80d122fd0..20598c6963ce 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -35,6 +35,7 @@ SECTIONS
>         _idmap_start = .;
>         *(.text.header)
>         *(.text.idmap)
> +       *(.rodata.idmap)
>         _idmap_end = .;
> 
>         *(.text.cold)
> --
> 2.40.1
> 

~Michal

