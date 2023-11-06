Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8E7E1A78
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 07:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627763.978604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qztOG-00087c-Jj; Mon, 06 Nov 2023 06:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627763.978604; Mon, 06 Nov 2023 06:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qztOG-00085o-Gw; Mon, 06 Nov 2023 06:47:16 +0000
Received: by outflank-mailman (input) for mailman id 627763;
 Mon, 06 Nov 2023 06:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bfeq=GT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qztOF-00085i-3t
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 06:47:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e103842-7c70-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 07:47:09 +0100 (CET)
Received: from PH8PR05CA0019.namprd05.prod.outlook.com (2603:10b6:510:2cc::25)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 06:47:05 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::b4) by PH8PR05CA0019.outlook.office365.com
 (2603:10b6:510:2cc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16 via Frontend
 Transport; Mon, 6 Nov 2023 06:47:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 06:47:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 00:47:03 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 6 Nov 2023 00:47:02 -0600
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
X-Inumbo-ID: 4e103842-7c70-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djIkxABigLQnj4s9KXhPntf4sWMLEZpz+wnj8wwdUKkYn2c+3TNf7bQzm7Ho3wj/vnwjH94ZbymsaTtrfrYo/2x+in2YVAhBzuIY3D/nA/AfR/d5dLBwhX174mai5GCFfkf+N0pd/vY2AzbHBPpikqF51Gqy4E8B14nPf3icIWIhmvt0u3AW6nZV9FOaRVfd5J3i1yNa+2cLlcyegEzH0P1RjiUErwynyTHFUfWyZqxnQRqBCXAElDhMAc64wV65qvdDSAAsSyZkCRCuoWaB+H1+30RwBabUOq7iqQ2BUOPZeKKoJXl9opxr27E79ZnIF1XcZ5Vw2MKswUFuFbUdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBOYLagDXaoSSRituXJjlZccbZdDxwf0TYkuUkHOfC8=;
 b=mlg9puw+1c6ACp/oCcpyKG5ymjcpZWFk4YYQLPjYcmgPpXbPGl+c9vplk+yWYfz3X3qgYLmusvEsWjd43wuXcGeuQh+v4+HaXVK4/xAs1vhLRDUXP0TUSewJnCtGQ78vSNSdLCzMt5eAD162oZAuNLqT56xQLo/0vr/j0Gn0nAupqUMODhGiEx4XIhHLpmf5YltMjftKgXuljESZobooTYNTf966qynmPr/fY33VaRIN404lAgcjzdlMx8aLNQDV1g/7vuacJwYLn+KwYaU/HzpEYslxkaJAe7EykkK7Z9hUd0ANkbvPqkCmv1hZ2YVaOlky1tg442x9VohO8efMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBOYLagDXaoSSRituXJjlZccbZdDxwf0TYkuUkHOfC8=;
 b=LPPA3MYXLYr32mb3v4bNxe7pw3F1m3m1oh2to52xsOZr70AzhsoFbY4tileo2qG1gCuMlfm4fOTYL3VZFpSh4azEPFnFBuWZHBmfEuzzhR0sdMPTBAJ1xf9rda7Dp9JNcJvSp4M6ORR24KUToZmj44ImlwRHENypw3hVxhoFhnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <98557d2a-234b-4031-a812-174c31892d52@amd.com>
Date: Mon, 6 Nov 2023 07:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm32: head: Introduce
 enable_{boot,secondary}_cpu_mm()
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>
References: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
 <20231103173436.3912488-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231103173436.3912488-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 98217d62-67f9-4368-2a88-08dbde943018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uAQ8/DzuqGo38aTogb9Yru597fH93dOPKbAfQ5niln5r2jm2uyQYgaHwg1QgBV4KQPzjs9+E9NSWhYLxY4xmRoA2j8tQOeCKP4rCtwQbhBAnTyhZKo9hpIDXp2B1aFJOAkKr6uCo0DvXE/GyYHb1cvXad2TZcFyELx0PHmI/84/1IRoN6CTvfy7KxFHAvQCwEmWmB5cnrpdEuBOt3vhJL/atxpTGUirHqDMHKN5gsfqeRhgjIGb3PDjg9NxjN6HNlm6s2kYqSy84TYt8QRlSRcm10/qxdySRUHbZO6fT3nRGF9FmK4y75XcbxuCHeWaLvcoUWuroBoBHk0yEUyGXVWkGct5BaCTKGd8Ct8Rsw8Fy05qUlP+Tp1f1KGA7PDCwhLHFHy9WDsiOR4b8EYv+PU35jyoaybMIo/7HGreiRLg7dFGUVEtWvWFzFco3iYU5ghi0ZpxpRjGNwPkbSE2uVesBPJ/A/LKX1S8j6/9bYowg24u7kgFFFtZms1TN7kEeIirzD6fUjMPeq6gQ9fiJzBgtnVKNCOrZYUqlpQ/U/iGkMGjkxGbmcgHXKyw/1iC5o6KbWDl+03xaN05keVYVcKaFM0thJogLoP4nT7kHBvisL6lyjeW32ELW5PsfoKW5uGJNQoYwzR0xzioLGoeLvrVwEwft8nnnG3oeelSwMXHZarIrP6FIZjW9UsnlNiWk7pRtUOBzTIx8frOWrPXLux7qtkK6wZaEgjOzI9EVr5xEhAy6KGPgdktY4o955BMI28R6yphRNTxdI2octzzO4ywxKmBuz4zg2VOPfz952FmxVXtOPqPfj8s0daT3p2hGkO34G1dsQ3fSz4Z7zMyuEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799009)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(36756003)(40480700001)(26005)(426003)(316002)(336012)(8676002)(4326008)(8936002)(83380400001)(110136005)(70206006)(54906003)(16576012)(70586007)(5660300002)(36860700001)(44832011)(41300700001)(47076005)(478600001)(2906002)(6666004)(53546011)(2616005)(31686004)(82740400003)(81166007)(31696002)(86362001)(356005)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 06:47:04.5692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98217d62-67f9-4368-2a88-08dbde943018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

Hi Ayan,

On 03/11/2023 18:34, Ayan Kumar Halder wrote:
> 
> 
> All the MMU related functionality have been clubbed together in
> enable_boot_cpu_mm() for booting primary cpu and enable_secondary_cpu_mm() for
> booting secondary cpus.
> This is done in preparation for moving the code related to MMU in MMU specific
> file and in order to support non MMU cpus in future.
> 
> This is based on d2f8df5b3ede commit.
NIT: when referencing other commits, use <12 digits> ("<commit_title>")

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> 
> v1 - 1. Added a proper commit message.
> 2. Some style and other fixes suggested in v1.
> 
>  xen/arch/arm/arm32/head.S | 89 +++++++++++++++++++++++++++++----------
>  1 file changed, 67 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 2d7e690bf5..7004443798 100644
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
> @@ -692,6 +674,69 @@ ready_to_switch:
>          mov   pc, lr
>  ENDPROC(switch_to_runtime_mapping)
> 
> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
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
> + *   lr : Virtual address to return to.
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
> +        /* Return to the virtual address requested by the caller. */
I find this comment a bit misleading as it reads as if this instruction was causing a return.

Apart from that, this change LGTM. Depending on the order of other arm32 head.S patches:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

