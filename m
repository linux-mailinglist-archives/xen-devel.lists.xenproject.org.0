Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC37E3B12
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 12:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628786.980605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0KB4-0001F5-0J; Tue, 07 Nov 2023 11:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628786.980605; Tue, 07 Nov 2023 11:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0KB3-0001DO-Ta; Tue, 07 Nov 2023 11:23:25 +0000
Received: by outflank-mailman (input) for mailman id 628786;
 Tue, 07 Nov 2023 11:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjAr=GU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r0KB2-0001DI-Ju
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 11:23:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e89::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e5ef2fd-7d60-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 12:23:20 +0100 (CET)
Received: from PR3P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::33)
 by MW4PR12MB6922.namprd12.prod.outlook.com (2603:10b6:303:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 11:23:15 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10a6:102:52:cafe::8b) by PR3P189CA0028.outlook.office365.com
 (2603:10a6:102:52::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 11:23:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 11:23:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 05:23:04 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 7 Nov 2023 05:23:03 -0600
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
X-Inumbo-ID: 0e5ef2fd-7d60-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dw7RMFnokJLvxi5ZVH48c3OoCkI3kdCMW9tMsT0jsYe0+4chTGNWVsmehR89JZnX3fdB8s3Tlqe+tNhk+cP168IGFE54ny/1A/NKDtFnt+h4R+k3JNhS61NozMLj3yvSTmK/stibT7Fzmnxe5RYP2o+Asp3td8mzGtV+K1dI6u3Zl1o5tNSVPKoy8K8m+frNOol1W7nmu+PobB3LkzL+t3J/B+Wo7lmjyNpJMs4Gzt4deUuB4vyD8dWeQ7sTTFpVVlTWGLgk93ntPRTO6nyPD4iUcq0mifzWfexhz7RulXVOyQaJUTSVg3V/bW5vEwpSyetSlV4YGrBOR1csTlUoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNrheE4kU19TMy6VBAMQ89XMLkHLs6l0aDTyL0qHVPc=;
 b=cJ77S9BsL9KzF10ozi9qDwCoTlXcZby3E8FmTrG6XzBz1tqk+Djjper/6XGlX3cSOVmH2T/ALvj+oG5NAi9RYR4idNaI+Cb6d82rs72JfBHH06JkzUDIigR0kv/7PaRmZnKxQfMlraGzKQMM+4qqWs2agQ5g4XZYtPEqOJPJg+jOgpjf6BdTftvaapiqhatvzrWTZap7+z1sSDykkkbou24a6vHHSC4OZEdRJAAvQTDZJBWCl9O3GO2dCDpkRaTh9cixlJ6tLJsI4u65k22/BHviiokXrwU3XAH3+Vhyi4NV1YkrsmUMbaBN3ZxOsMWbf0L6FrvHahG+mqW/k4D9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNrheE4kU19TMy6VBAMQ89XMLkHLs6l0aDTyL0qHVPc=;
 b=uGvpDNAzXL3K05NwzwO/LTvPWDmTAtvADqpANZJtpQzC2+jv5/JRge6Po+yDCWK2xyG09AuqCwnrl7loFlZTIbLK+DmEjNwMI4qJ2pSg4zwbYt8o96/rfpzJnFfppls0YVmgzXwX1YZfD37ljGYMdjicdPskpS4v7cwAJu7JNEM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d5b28e95-d6f8-4ff8-93c0-6e2b79110a25@amd.com>
Date: Tue, 7 Nov 2023 12:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm32: head: Introduce
 enable_{boot,secondary}_cpu_mm()
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
References: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
 <20231107110217.1827379-2-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231107110217.1827379-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MW4PR12MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fde137-b1c6-4712-f33d-08dbdf83eef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yeofc5IWU/ERHcueJr0W5tPvo6PXhksqhwWf0N/6IJcnqgNV4fhjjPz+VoPcUlJ3LvZqO0FV7nyJmbpv7ULKO7cNZAkZcyyJ0jKiE2JgYpxb+eEL95fsORNvK3N7sdaAjPbAE1BDfCpCwkmOcEacCwfPSs2+P4gmbBJKzgp9Zf1YUe6H3QA6x5SMsje7ZMJtlxKg/+1t3Cvbnuzwv6P30TBoob/NQ/o/cZt8sfrSRJezSm2qqJbyVF9gCk6IwNV+JJa1WJ73v9KNtJV8mUu5xb+/NRv+WroKFoV8J92huxhaSOSCt8go/qnFf9+NQr7A2KH3beZfst1M1EPJyVw6SG6vmPjndTUjyYXcQGAe3IAWhzy56PR2lLyLZxPXa63LREs03AYhm5jcgVuBF6xOgtiXk39OxeFyfhO+x6RUC2vZQU6vvxcoxvsQFJjRy++x75kpJTvBxEaYVac9yYFHkLZwLSO1mBprFHT7M/VarnQqwYm1S8H+ao7/1qcU0hL5P36Jn355WVxx8+GDwXJKGz3uijpc9sIe5dE3UFjJJgwoKZke+mOLQfci/Io2eGc1YJm1h/DcWlYpvfZNLFJ3YpcUkJ6U/+r9TKwUTwopwNR4c8bF1bXDHOzsSJ9NLvcmHLvvP7ykzsBAs9NRSQjkFX7RK8Z2yA7pAHOl1KMt7D4xpu+pJex/kt0Y3RHu3spFv/7RwLR5sPlIrHUa3EnjF3XnOBPQtiVH5x6OiPO+tjVGBY3rIIvEwGy5mEe4DGHOISqjQ3mvQVCnRMJ58SxDgY/cg/APTfbtK7HCdYd5qA/c3D+Xl2hJQGC1n0p1D+Q/OWCE62oMeMMFDvLyiPespw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(478600001)(47076005)(83380400001)(426003)(336012)(26005)(2616005)(44832011)(36860700001)(8936002)(16576012)(2906002)(8676002)(316002)(4326008)(41300700001)(5660300002)(54906003)(110136005)(53546011)(70586007)(70206006)(36756003)(86362001)(31696002)(356005)(82740400003)(31686004)(81166007)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 11:23:14.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fde137-b1c6-4712-f33d-08dbdf83eef9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6922

Hi Ayan,

On 07/11/2023 12:02, Ayan Kumar Halder wrote:
> All the MMU related functionality have been clubbed together in
> enable_boot_cpu_mm() for booting primary cpu and enable_secondary_cpu_mm() for
> booting secondary cpus.
> This is done in preparation for moving the code related to MMU in MMU specific
> file and in order to support non MMU cpus in future.
> 
> This is based on d2f8df5b3ede ("xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()").
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> 
> Changes from :-
> 
> v1 - 1. Added a proper commit message.
> 2. Some style and other fixes suggested in v1. 
> 
> v2 - 1. Updated the comment on top of enable_boot_cpu_mm() and
> enable_secondary_cpu_mm() ie mentioned the input and output registers.
> 2. Updated the comment inside enable_boot_cpu_mm().
> 
>  xen/arch/arm/arm32/head.S | 102 ++++++++++++++++++++++++++++++--------
>  1 file changed, 80 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 2d7e690bf5..2204ea6dce 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -201,13 +201,11 @@ past_zImage:
>  
>          bl    check_cpu_mode
>          bl    cpu_init
> -        bl    create_page_tables
>  
> -        /* Address in the runtime mapping to jump to after the MMU is enabled */
>          mov_w lr, primary_switched
> -        b     enable_mmu
> +        b     enable_boot_cpu_mm
> +
>  primary_switched:
> -        bl    setup_fixmap
>  #ifdef CONFIG_EARLY_PRINTK
>          /* Use a virtual address to access the UART. */
>          mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> @@ -249,27 +247,11 @@ GLOBAL(init_secondary)
>  #endif
>          bl    check_cpu_mode
>          bl    cpu_init
> -        bl    create_page_tables
>  
> -        /* Address in the runtime mapping to jump to after the MMU is enabled */
>          mov_w lr, secondary_switched
> -        b     enable_mmu
> -secondary_switched:
> -        /*
> -         * Non-boot CPUs need to move on to the proper pagetables, which were
> -         * setup in prepare_secondary_mm.
> -         *
> -         * XXX: This is not compliant with the Arm Arm.
> -         */
> -        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
> -        ldrd  r4, r5, [r4]           /* Actual value */
> -        dsb
> -        mcrr  CP64(r4, r5, HTTBR)
> -        dsb
> -        isb
> -        flush_xen_tlb_local r0
> -        pt_enforce_wxn r0
> +        b     enable_secondary_cpu_mm
>  
> +secondary_switched:
>  #ifdef CONFIG_EARLY_PRINTK
>          /* Use a virtual address to access the UART. */
>          mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
> @@ -692,6 +674,82 @@ ready_to_switch:
>          mov   pc, lr
>  ENDPROC(switch_to_runtime_mapping)
>  
> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   r9 : paddr(start)
> + *   r10: phys offset
> + *   lr : Virtual address to return to.
> + *
> + * Output:
> + *   r12: Was a temporary mapping created?
> + *
> + * Clobbers r0 - r6
> + */
> +enable_secondary_cpu_mm:
> +        mov   r6, lr
> +
> +        bl    create_page_tables
> +
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, 1f
> +        b     enable_mmu
> +1:
> +        /*
> +         * Non-boot CPUs need to move on to the proper pagetables, which were
> +         * setup in prepare_secondary_mm.
> +         *
> +         * XXX: This is not compliant with the Arm Arm.
> +         */
> +        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
> +        ldrd  r4, r5, [r4]           /* Actual value */
> +        dsb
> +        mcrr  CP64(r4, r5, HTTBR)
> +        dsb
> +        isb
> +        flush_xen_tlb_local r0
> +        pt_enforce_wxn r0
> +
> +        /* Return to the virtual address requested by the caller. */
> +        mov   pc, r6
> +ENDPROC(enable_secondary_cpu_mm)
> +
> +/*
> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   r9 : paddr(start)
> + *   r10: phys offset
> + *   lr : Virtual address to return to.
> + *
> + * Output:
> + *   r12: Was a temporary mapping created?
> + *
> + * Clobbers r0 - r6
> + */
> +enable_boot_cpu_mm:
> +        mov   r6, lr
> +
> +        bl    create_page_tables
> +
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, 1f
> +        b     enable_mmu
> +1:
> +        /*
> +         * Prepare the fixmap. The function will return to the virtual address
> +         * requested by the caller.
> +         */
This comment should be above branch instruction and not here.

~Michal

