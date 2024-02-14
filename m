Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C196D8546EA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680356.1058492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCHH-0005Jh-Mm; Wed, 14 Feb 2024 10:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680356.1058492; Wed, 14 Feb 2024 10:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCHH-0005Hx-K9; Wed, 14 Feb 2024 10:14:07 +0000
Received: by outflank-mailman (input) for mailman id 680356;
 Wed, 14 Feb 2024 10:14:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kQr2=JX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1raCHG-0005Hp-7W
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:14:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c704ebb1-cb21-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 11:14:04 +0100 (CET)
Received: from BN1PR14CA0010.namprd14.prod.outlook.com (2603:10b6:408:e3::15)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 10:14:00 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::97) by BN1PR14CA0010.outlook.office365.com
 (2603:10b6:408:e3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 10:14:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 10:14:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 04:13:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 04:13:59 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 14 Feb 2024 04:13:57 -0600
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
X-Inumbo-ID: c704ebb1-cb21-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVHonfe+A5YykeHNuU40H2cRfbQMMvG0HCfx5CyOtd7pBH0K5gk7pwqWmxZAhBHwOuRV4gELHeecddi+6GQU6vLWnP8x/RcGUAi8a6G2OpbneZSKu+tOBE39iGNXcswfJudkPBZdM9JyIwm8r2zv9QUNlNSR6QUuxDwk7juWNU+SHTsIjljngPe9XmOkho0GA+QI850eMNphZE1ZgKXvmocnOf4WJEilvQfdshhS04YhcrSF/60YnupETTqBRm/iFUzcMA4GStr/UxI9hzTdia1Pe6YTC9XfcxNFRYLQqDvOunTtPLL7FfNWuYWltRCzyiYFrPkoTI54wF2Pu+LqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/xOuPKjtqCJRT1ppKqXNV5kBGA3BCkrVZqPvDGj4uM=;
 b=FnwbpKxeTUzxXzFjiJ2u9oCZtCm8YjYYRCcwzjIbNFrNISpmoqsvfAoxxzWmesLcym2BQxyWnQiuDAaUfF23sPy3prtC0vIA1mVx/NZTQ3f73rtfaWs2EiHydfNGbvlEVy1EbKI0xBgT8l40Zm6O5RXxVNC8vjsZlhkA6xUPXen9iUPlT476K/aqPOgg3YmgfbjMQdlhzRg4iBPeU6XRMqYdvyLF13+k/BuUSvIEDoATp36sbJ9/4nx6yFdy1iwWE9H3PaODfastu5YSRS/1dUk16U+FEYuDhcHkUulXhYaPnZiUdCADi7wDV2gyIhHsmoblomTSm9iEbvdsEdXCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/xOuPKjtqCJRT1ppKqXNV5kBGA3BCkrVZqPvDGj4uM=;
 b=tYAUOx3VRJVOsVJBPbwkXJmt+vhDel6Lo3BAz1E8arLgn/2ROqnTknCj5cTh6Obj7ycE+S+LFPdnZ7543g1OJiz30XqYaKuhsYZVckoQ1x0rF5diWL0JsRTcF7a78sw6b1rwhj0xIgIKWO9JlAhX2OHx7LV4lT4gFzmkEx6r1Cw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bb28c8a2-c2bd-4e1d-ad28-9bc632e3e474@amd.com>
Date: Wed, 14 Feb 2024 11:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] xen/arm: add initial support for LLC coloring on
 arm64
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-3-carlo.nonato@minervasys.tech>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240129171811.21382-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|IA1PR12MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: afa9ee0f-e569-47c7-50de-08dc2d45a9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IYiqGcde8qfU0YIGXKH8pqfV23ILvwvultsvGwyKha+tO+pUgjBuASYReDZ2o9YgLK6E75t8Dg9GferqWHyyDKLTppCnUJTOw/oMq2JvsWx/pzUW56oPH/c9i/7FT9X2ugbTYXqwE+tmQHan8j4pQRKGqd23aBzsRCGau0gdoiz6bkiq0be3MydXF+TfJ0W9QcLs9xIFV2vjvsAal4ue1xJcUj1vUTLK4gPFhK/fe7dcBeuKL8Tl9gsgwJPpKMV5W7XLn+O8rAeOQOfIrNdl6ku5o69g9+43lATYA+tM3aeH69rgLKbm+JJmcrpOVaDmjEfpP70nUxoWFHrBXtsyq55BLG8aPmMADobdKF3OMOpkAZsstIxWOd/pXgPmTyzIsYF9r+YqVe5Hb56KixD6vFFAJ6UPrdNcdHXW9KUoHNTfGT4XCVpvC4BBjMa7CSBUdA95Grp7kZ/uA3MrSK8V1M4l9hvJvSzSYRfN7FLsM6hteGwkrqWwG686UV5OVP8p/V0inGNauTDUAYWUOTmE4WssDcNejzQfilZ5FdyVKfGuTJNjEeH0gkOjNPfhGkX9PZyQloum35S3xT4g4a86DuvKbl96gSdP4xd3k2+B4s4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(31686004)(81166007)(82740400003)(356005)(83380400001)(31696002)(41300700001)(86362001)(70206006)(7416002)(5660300002)(70586007)(336012)(44832011)(54906003)(8936002)(8676002)(2906002)(426003)(4326008)(110136005)(26005)(316002)(16576012)(36756003)(2616005)(478600001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 10:14:00.1934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa9ee0f-e569-47c7-50de-08dc2d45a9ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615

Hi Carlo,

On 29/01/2024 18:17, Carlo Nonato wrote:
> 
> 
> LLC coloring needs to know the last level cache layout in order to make the
> best use of it. This can be probed by inspecting the CLIDR_EL1 register,
> so the Last Level is defined as the last level visible by this register.
> Note that this excludes system caches in some platforms.
> 
> Static memory allocation and cache coloring are incompatible because static
> memory can't be guaranteed to use only colors assigned to the domain.
> Panic during DomUs creation when both are enabled.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v6:
> - get_llc_way_size() now checks for at least separate I/D caches
> v5:
> - used - instead of _ for filenames
> - moved static-mem check in this patch
> - moved dom0 colors parsing in next patch
> - moved color allocation and configuration in next patch
> - moved check_colors() in next patch
> - colors are now printed in short form
> v4:
> - added "llc-coloring" cmdline option for the boot-time switch
> - dom0 colors are now checked during domain init as for any other domain
> - fixed processor.h masks bit width
> - check for overflow in parse_color_config()
> - check_colors() now checks also that colors are sorted and unique
> ---
>  docs/misc/cache-coloring.rst         | 11 ++++
>  xen/arch/arm/Kconfig                 |  1 +
>  xen/arch/arm/Makefile                |  1 +
>  xen/arch/arm/dom0less-build.c        |  6 +++
>  xen/arch/arm/include/asm/processor.h | 16 ++++++
>  xen/arch/arm/llc-coloring.c          | 75 ++++++++++++++++++++++++++++
>  xen/arch/arm/setup.c                 |  3 ++
>  7 files changed, 113 insertions(+)
>  create mode 100644 xen/arch/arm/llc-coloring.c
> 
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> index 9fe01e99e1..0535b5c656 100644
> --- a/docs/misc/cache-coloring.rst
> +++ b/docs/misc/cache-coloring.rst
> @@ -85,3 +85,14 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
>  +----------------------+-------------------------------+
>  | ``llc-way-size``     | set the LLC way size          |
>  +----------------------+-------------------------------+
> +
> +Known issues and limitations
> +****************************
> +
> +"xen,static-mem" isn't supported when coloring is enabled
> +#########################################################
> +
> +In the domain configuration, "xen,static-mem" allows memory to be statically
> +allocated to the domain. This isn't possible when LLC coloring is enabled,
> +because that memory can't be guaranteed to use only colors assigned to the
> +domain.
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 50e9bfae1a..55143f86a9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_64
>         depends on !ARM_32
>         select 64BIT
>         select HAS_FAST_MULTIPLY
> +       select HAS_LLC_COLORING
> 
>  config ARM
>         def_bool y
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 33c677672f..c9a1cd298d 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>  obj-y += irq.o
>  obj-y += kernel.init.o
>  obj-$(CONFIG_LIVEPATCH) += livepatch.o
> +obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-y += mem_access.o
>  obj-y += mm.o
>  obj-y += monitor.o
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..1142f7f74a 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -5,6 +5,7 @@
>  #include <xen/grant_table.h>
>  #include <xen/iocap.h>
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/sched.h>
>  #include <xen/serial.h>
>  #include <xen/sizes.h>
> @@ -879,7 +880,12 @@ void __init create_domUs(void)
>              panic("No more domain IDs available\n");
> 
>          if ( dt_find_property(node, "xen,static-mem", NULL) )
> +        {
> +            if ( llc_coloring_enabled )
> +                panic("LLC coloring and static memory are incompatible\n");
> +
>              flags |= CDF_staticmem;
> +        }
> 
>          if ( dt_property_read_bool(node, "direct-map") )
>          {
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 8e02410465..336933ee62 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -18,6 +18,22 @@
>  #define CTR_IDC_SHIFT       28
>  #define CTR_DIC_SHIFT       29
> 
> +/* CCSIDR Current Cache Size ID Register */
> +#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
Why ULL and not UL? ccsidr is of register_t type

> +#define CCSIDR_NUMSETS_SHIFT            13
> +#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, ULL)
> +#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
> +#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, ULL)
> +
> +/* CSSELR Cache Size Selection Register */
> +#define CSSELR_LEVEL_MASK  _AC(0x7, UL)
> +#define CSSELR_LEVEL_SHIFT 1
> +
> +/* CLIDR Cache Level ID Register */
> +#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
n should be within parentheses

> +#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
> +#define CLIDR_CTYPEn_LEVELS   7
> +
>  #define ICACHE_POLICY_VPIPT  0
>  #define ICACHE_POLICY_AIVIVT 1
>  #define ICACHE_POLICY_VIPT   2
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> new file mode 100644
> index 0000000000..eee1e80e2d
> --- /dev/null
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring support for ARM
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + */
> +#include <xen/llc-coloring.h>
> +#include <xen/types.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sysregs.h>
> +
> +/* Return the LLC way size by probing the hardware */
> +unsigned int __init get_llc_way_size(void)
> +{
> +    register_t ccsidr_el1;
> +    register_t clidr_el1 = READ_SYSREG(CLIDR_EL1);
> +    register_t csselr_el1 = READ_SYSREG(CSSELR_EL1);
> +    register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
> +    uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
> +    uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
> +    unsigned int n, line_size, num_sets;
> +
> +    for ( n = CLIDR_CTYPEn_LEVELS; n != 0; n-- )
> +    {
> +        uint8_t ctype_n = (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
> +                          CLIDR_CTYPEn_MASK;
> +
> +        /* At least separate I/D caches (see Arm ARM DDI 0487H.a D13.2.27) */
I'm a bit confused here given that this comment does not reflect the line below (also please refer to the latest spec).
Since 0b011 is "Separate instruction and data caches" you would break only for Unified cache.
That said, we care about last level cache that is visible to SW and I'm not aware of any Arm CPU where L2,L3 is not unified.

> +        if ( ctype_n > 0b011 )
> +            break;
> +    }
> +
> +    if ( n == 0 )
> +        return 0;
> +
> +    WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
> +
no need for this empty line

> +    isb();
> +
> +    ccsidr_el1 = READ_SYSREG(CCSIDR_EL1);
> +
> +    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
> +    line_size = 1U << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);
> +
> +    /* If FEAT_CCIDX is enabled, CCSIDR_EL1 has a different bit layout */
> +    if ( (id_aa64mmfr2_el1 >> ID_AA64MMFR2_CCIDX_SHIFT) & 0x7 )
> +    {
> +        ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX;
> +        ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK_FEAT_CCIDX;
> +    }
empty line here please

> +    /* Arm ARM: (Number of sets in cache) - 1 */
> +    num_sets = ((ccsidr_el1 >> ccsidr_numsets_shift) & ccsidr_numsets_mask) + 1;
> +
> +    printk(XENLOG_INFO "LLC found: L%u (line size: %u bytes, sets num: %u)\n",
> +           n, line_size, num_sets);
> +
> +    /* Restore value in CSSELR_EL1 */
> +    WRITE_SYSREG(csselr_el1, CSSELR_EL1);
> +    isb();
> +
> +    return line_size * num_sets;
> +}
> +
> +void __init arch_llc_coloring_init(void) {}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 59dd9bb25a..14cb023783 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -12,6 +12,7 @@
>  #include <xen/device_tree.h>
>  #include <xen/domain_page.h>
>  #include <xen/grant_table.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/types.h>
>  #include <xen/string.h>
>  #include <xen/serial.h>
> @@ -746,6 +747,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>      printk("Command line: %s\n", cmdline);
>      cmdline_parse(cmdline);
> 
> +    llc_coloring_init();
I think a check with llc_coloring_enabled is missing, given there is none in llc_coloring_init

~Michal


