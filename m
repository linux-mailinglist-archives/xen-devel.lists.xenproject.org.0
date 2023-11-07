Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69F7E3D49
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 13:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628796.980625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LAD-0004J4-To; Tue, 07 Nov 2023 12:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628796.980625; Tue, 07 Nov 2023 12:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LAD-0004GP-RF; Tue, 07 Nov 2023 12:26:37 +0000
Received: by outflank-mailman (input) for mailman id 628796;
 Tue, 07 Nov 2023 12:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjAr=GU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r0LAC-0004GJ-8B
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 12:26:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e236d30f-7d68-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 13:26:33 +0100 (CET)
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 12:26:27 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::8f) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 12:26:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 12:26:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 06:26:20 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 7 Nov 2023 06:26:18 -0600
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
X-Inumbo-ID: e236d30f-7d68-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzGqBu+BdRAtf89v3gOx2t+sIcgDe6SeCKzi5mkb2YiYN+dOm1gSa5IMKErDyFNdZ/goaZuMkHJWF2ungKLTgOR4qDvYP+g1Oo8QJvM776qmMVxHuRLBN8KkApxHiYDsm4FZ/hU6CGzCIgHuhU549kkPK2Gww0n9hzHSnXkt5uRzxPoffMih/2EXnRqoEP4i7oO/jLc3qVOK4jNrgrTtknofbn4PHnzSiDbiQ7mO5IjHtUSBAgac9GVV9gAvMuWiM1Crzq2fNbB+DxX7vT6Dc+0YFswf7AJjZCljgIX10wt9L3RtIfhxUHbhUwzIYHHNv0JRCt93i9dRqDL/kVxWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fycM6UXOGr/ZHZk7/mxuor+EWckGMDrxddCO3IDuaB0=;
 b=KAmTk7OPpZz7NH0T/37RpGZ6t9EBTJkjIv4FI2caoo4BDB1dlfBzjU1Ru3yyZnYFNgyiwvl3VUf5WokX3uO56NyeU1W/y02sxf+lIQsS2g1w7+zhn8x1uXmqP39HKYJUZ3PhSguLMABe0HGZwBlm5dEjzIeyEdvM3paa782XVR5+r+iYkkssPAc2Pc9/ZXp0p6UeneeOx6xlY/1ghutzFNzWB4PnvVhk7dCcgI6lpE+7k4ry7haFF1BZKKOosQh55BiIqB1F3qZ/lzOTWV87SkdYo4TgE/FxgrrsUnoCJwpmsI+N0jZET7w2Ljzu7LBJe61xcS+ujIkL5hm60AG4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fycM6UXOGr/ZHZk7/mxuor+EWckGMDrxddCO3IDuaB0=;
 b=kP2gDQUvU90ueeYyW8TWH461ka+cW+AOjak0vft+mPNDiYYHoGeFSWoiUYCtiWLVdxt8uLhdmO/0BdSlN5OSzLPxaUVU+IYzNr5FjgoNSZ1AfSXkGkOVea0RrePKXYLZrfJOC0y0ML+22uisT20uE+zLWICBvjV9I/7YbNZku+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6c433d05-24c0-4400-acb2-8dd9d6e7f69f@amd.com>
Date: Tue, 7 Nov 2023 13:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/arm32: head Split and move MMU-specific head.S
 to mmu/head.S
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>
References: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
 <20231107110217.1827379-3-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231107110217.1827379-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|CH3PR12MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d07e25-7e5d-4745-7aa9-08dbdf8cc35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GFaeDg2i/uf5VizRmLYbjMEJTXhkxDRvCj8Eb8G2qfGKkObTut8tFKJrxqYNIbhDdrR76Oj4W90PH2iN82cIhxjo5J9TnpX1BMwYtUsGWJkOzdLyH4VMu1WRxy7XdqbS2bTGYx6+kWmyNUA+k45kEm/6Qn1NZEDRpTudAfV64edT54iWTnDWjyxwS38b6xZ+JESlH9YjcomchKMJuf8oUumFn2B4YU1SJxu1UkFoJhV0Jee+AfwUZD43l0PXM++DnkU6dFlzgeVmlJIG4sZd4rMq317s4fZtIn/pYc94HhVzvVuofAeB/2OBD89xvZgHnhSPHLsDIIniulEUzd6Ady/J6nRFO568nqvC8X19Bqkkz+/K3oNKNz7WI8Bmj8rXAgq5u90SiP1BNku8R6KjE6x4S8tv3bcM98UOUmkgShbGSo5POI6AtnAQ6i1MZdHN94Y1s8CLkBmOIabrrYWaEg2yodayUXZ6YeOULd3jb+UCpZ+BgSs6mU4UHu5yAIjLufM1eZHps33yexfpvEhe/2JQbrWd4ljJ9aa3Je2bDCXqLsfIokMczTJnxJjqNEj5ZZeBVECPjdLywOZUu9REO4MUa7N8zhOMCWoB/lwREVwZdPbQO5SRLCVgvOemydcQNCMRvFzyZLnNoUUwg/LCt0ma3WOR3A8qetG8wCa7RJQ34VxN9LCHqDOIzdaXlorCgeCkTKQuK5K9bkgWFKVHm5uXJILcvl1duoHEYR1GabtqeYDyoLCjzptFvJxFEbSyx27pxqbRNIiwWvQytaWkXult8BFEWq/mlngsNj+T0EphzTwd6PcShPOTPsCbHRrVkCZhRZoNtOfTbuD0fiOt2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(186009)(82310400011)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(47076005)(478600001)(41300700001)(53546011)(2616005)(6666004)(316002)(336012)(426003)(4326008)(8676002)(8936002)(26005)(5660300002)(36860700001)(70586007)(110136005)(70206006)(16576012)(44832011)(54906003)(356005)(81166007)(2906002)(31686004)(86362001)(31696002)(82740400003)(40480700001)(36756003)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 12:26:26.7281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d07e25-7e5d-4745-7aa9-08dbdf8cc35d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547

Hi Ayan,

On 07/11/2023 12:02, Ayan Kumar Halder wrote:
> 
> 
> The MMU specific code in head.S will not be used on MPU systems.
> Instead of introducing more #ifdefs which will bring complexity
> to the code, move MMU related code to mmu/head.S and keep common
> code in head.S. Two notes while moving:
>  - As "fail" in original head.S is very simple and this name is too
>    easy to be conflicted, duplicate it in mmu/head.S instead of
>    exporting it.
>  - Realigned ".macro ret" so that the alignment matches to the other
>    macros.
>  - Rename puts to asm_puts, putn to asm_putn (this denotes that the
>    macros are used within the context of assembly only).
>  - Use ENTRY() for enable_secondary_cpu_mm, enable_boot_cpu_mm,
>    setup_fixmap, asm_puts, asm_putn  as they will be used externally.
> 
> Also move the assembly macros shared by head.S and mmu/head.S to
> macros.h.
> 
> This is based on 6734327d76be ("xen/arm64: Split and move MMU-specific head.S to mmu/head.S").
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
For now, I won't provide Rb given that the baseline is still under development and not very clear to me.

Just a few remarks:

[...]

> -
>  #ifdef CONFIG_EARLY_PRINTK
>  /*
>   * Initialize the UART. Should only be called on the boot CPU.
> @@ -912,14 +298,14 @@ ENDPROC(init_uart)
>   * r11: Early UART base address
You could follow the arm64 patch and add:
"Note: This function must be called from assembly."
to make the usage of this function clear.
Same for asm_putn.

>   * Clobbers r0-r1
>   */
> -puts:
> +ENTRY(asm_puts)
>          early_uart_ready r11, r1
>          ldrb  r1, [r0], #1           /* Load next char */
>          teq   r1, #0                 /* Exit on nul */
>          moveq pc, lr
>          early_uart_transmit r11, r1
> -        b puts
> -ENDPROC(puts)
> +        b asm_puts
> +ENDPROC(asm_puts)
> 
>  /*
>   * Print a 32-bit number in hex.  Specific to the PL011 UART.
The second sentence can be dropped. I don't see anything PL011 specific here.

> @@ -927,7 +313,7 @@ ENDPROC(puts)
>   * r11: Early UART base address
>   * Clobbers r0-r3
>   */
> -putn:
> +ENTRY(asm_putn)
>          adr_l r1, hex
>          mov   r3, #8
>  1:
> @@ -939,7 +325,7 @@ putn:
>          subs  r3, r3, #1
>          bne   1b
>          mov   pc, lr
> -ENDPROC(putn)
> +ENDPROC(asm_putn)
> 
>  RODATA_STR(hex, "0123456789abcdef")
> 
> @@ -947,8 +333,8 @@ RODATA_STR(hex, "0123456789abcdef")
> 
>  ENTRY(early_puts)
>  init_uart:
> -puts:
> -putn:   mov   pc, lr
> +asm_puts:
> +asm_putn:   mov   pc, lr
Both asm_puts and asm_putn are used only within #ifdef so you can drop the stubs

[...]

> diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
> index a4e20aa520..c6e390cc5f 100644
> --- a/xen/arch/arm/include/asm/arm32/macros.h
> +++ b/xen/arch/arm/include/asm/arm32/macros.h
> @@ -1,8 +1,62 @@
>  #ifndef __ASM_ARM_ARM32_MACROS_H
>  #define __ASM_ARM_ARM32_MACROS_H
> 
> -    .macro ret
> +.macro ret
>          mov     pc, lr
> -    .endm
> +.endm
> 
> +/*
> + * Move an immediate constant into a 32-bit register using movw/movt
> + * instructions.
> + */
> +.macro mov_w reg, word
> +        movw  \reg, #:lower16:\word
> +        movt  \reg, #:upper16:\word
> +.endm
> +
> +/*
> + * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
> + * within the range +/- 4GB of the PC.
> + *
> + * @dst: destination register
> + * @sym: name of the symbol
> + */
> +.macro adr_l, dst, sym
> +        mov_w \dst, \sym - .Lpc\@
> +        .set  .Lpc\@, .+ 8          /* PC bias */
> +        add   \dst, \dst, pc
> +.endm
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +/*
> + * Macro to print a string to the UART, if there is one.
> + *
> + * Clobbers r0 - r3
> + */
> +#define PRINT(_s)           \
> +        mov   r3, lr       ;\
> +        adr_l r0, 98f      ;\
> +        bl    puts         ;\
This should be a call to asm_puts

~Michal

