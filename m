Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A676E8C9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576339.902350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXlQ-0002z0-Us; Thu, 03 Aug 2023 12:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576339.902350; Thu, 03 Aug 2023 12:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXlQ-0002vl-S6; Thu, 03 Aug 2023 12:49:12 +0000
Received: by outflank-mailman (input) for mailman id 576339;
 Thu, 03 Aug 2023 12:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRpN=DU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRXlP-0002vf-HP
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:49:11 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e83::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22141e1c-31fc-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 14:49:08 +0200 (CEST)
Received: from DS7P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::25) by
 IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Thu, 3 Aug
 2023 12:49:04 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::88) by DS7P222CA0022.outlook.office365.com
 (2603:10b6:8:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 12:49:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.42 via Frontend Transport; Thu, 3 Aug 2023 12:49:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 07:49:02 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 3 Aug 2023 07:49:00 -0500
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
X-Inumbo-ID: 22141e1c-31fc-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz2O3vqQ72xBoGzKBTXP9Dead3C3oLdQWU3CRHq4ConoE2mAuI+bBlYWKFHuu6MqRY5vtxpO8Y891LONnIUueCy8TZ2CbloXE46ZeL1x9zczIzuGNCS3gTCjy2VZ7nhqLNWWydhu/vnqMWzVDRR8U9ZXFAymkPnnVOf2pKQdDdvbGWqpPHKFik/w28omR58PUgfFrU/TaZZaJ4dBSVyUdQTjs7CSAY+4pZUvrYwSUnsnOl9fUZgcFcgbnyffoqg/ggQ2hZgt7EOTyjvLwJtxFgKBqBvv84Tp8lqrGwjrXJHz6NSYuLqfGid5GXday8n0NTbk3dRwI97K7i2abD33ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL21f752i8F569qjM8PulemcQ27LQAbMnO8ySg2E1cY=;
 b=B5rP02huDHr4vPEY+Gt/UEOB+Nn4B3gW6ApmpITp9apLJZUTO78ZiCw8T2K8lmda1gy5lAqLNbemt5zI7YKvR/EcuAPjQZXN5p11fhMpfdDvVLn7UtHun9WqtYekRuFGkOvb4Q1EyPhDf2GjkVoEDLoeU3o7cxFaMyWGp/AuRIw9MCYzxEsOwLYveDMgqregzvxDZ3C3Qs6+ulzJ6iT1fp9CIuxTLnVZvO6NLj32krT34xyJB2qWp3dnwVaz5KZy1boKE0VleHEQZWmeqArNVgbq8GVN83gzNH2Qv0xnI7jwL7JVKF2KWkSjmtJS+aVCxuT+NX4S5UvllLvM2hPNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xL21f752i8F569qjM8PulemcQ27LQAbMnO8ySg2E1cY=;
 b=Ff4P7vz3iTCSRidsjZHQVjZX/s5QSgtxGa9Wz8Fx2IWaeBlFmicbtUGekx4SzA8joRDW3zU9oM49ViwsT27yjHesnLTilik+NIRwGasRDrmOWraKQxVl6notHRBD7woH62ufD5JPrf1sXKb0EPX3/kLWSreNqaEPGv6/3x4AdeY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <476e5c13-2b4f-d115-7237-d5220ec13cf2@amd.com>
Date: Thu, 3 Aug 2023 14:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230803104438.24720-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d71292-398f-44b3-300e-08db94200457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GfWSKHmmrh6eg4W6l9lFVluydwox8GnESTJgZ1HjLgmLnatPg+FOwH+kpC9vx9t51slQrXyXp0D0DQoUhHPishKNam3fUXeYIfWBg0BW+JdBSTHfEl96Vd8H2XzWjJjQ3mv9tSTIKrl/xm1K6oqQG8x8YUHFNWTnNO5dM595wiDRalXyB/WuDi2EEnn+48GwJaALAsvTGX8RlN9ZLoxy5LX06FWyTrVa8XT4AvsKgY6BwwkqmpcLL4jnuHYr5g6OyRQa/lg/O4GEFupaQgbAM0AnX1Kc5W2iwVOtc7YdwAowQFf4F0FqL1eh0j7/bhxgOawNQD/hZr0IssICfKgfX+p5yv0oqo/NsTIR34IngS0BVBk0aUXFNdqQTs4PEgUUcZ33lpL1erJBeVIP3jFfXgsJEWg1ruldWmjev0TkqFv6pwf3wdGZw4kvfWIXuprRp3mjoHmKHE1sCB7Ae+SGm4wH7ZQt9Xco7VJ+eWp8NhwbhfDrciwtpXXQKEzybYRFyMOlfoiE01i8csR4CnomOKvHIr64oRbpddOFqwDcaaa7GvdND96VWIgHDnCbwCFYhUacm3XFD1Ppp5RHAJStxH1xFLOjPD0AXsONwLulns8W3DLKQ0KsOf4C17hLsGdVPB5YTIQNH5egIG21lVkMQGoRfTKkmyI2wZuGM1bg0BHVTsqRSYCTv2JAJU68uY0/YOGHyy77iOmtN3X4Bb4VJa8/wZUtSp1/Ld17s2FPBNgWC2Ue7+LAbac+aWDzbePd7mhhTzo/Xj9nDRNDdpfIJSQHFoHuqIU534bAZCLMCnRn121fx8zGkGhRNgg1t9vojt4cDRCgBgJ6wlkHA5j5Vg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(40480700001)(186003)(336012)(40460700003)(2616005)(36756003)(316002)(16576012)(81166007)(478600001)(86362001)(54906003)(110136005)(6666004)(70206006)(4326008)(31696002)(82740400003)(70586007)(356005)(53546011)(26005)(41300700001)(8936002)(8676002)(7416002)(426003)(47076005)(31686004)(83380400001)(44832011)(36860700001)(5660300002)(2906002)(2004002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 12:49:03.4963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d71292-398f-44b3-300e-08db94200457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407

Hi Daniel,

On 03/08/2023 12:44, Daniel P. Smith wrote:
> 
> 
> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
IIUC, you just try to untangle the code for fdt from dt (unflattened). CORE_DEVICE_TREE is
a bit ambiguous in my opinion, so maybe just CONFIG_FDT, especially since you use it to guard libfdt/?

> introduced for when the ability of parsing DTB files is needed by a capability
> such as hyperlaunch.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  MAINTAINERS                      |   8 +-
>  xen/arch/arm/bootfdt.c           | 141 +---------------------------
>  xen/arch/arm/domain_build.c      |   1 +
>  xen/arch/arm/include/asm/setup.h |   6 --
>  xen/common/Kconfig               |   4 +
>  xen/common/Makefile              |   3 +-
>  xen/common/fdt.c                 | 153 +++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h    |  50 +---------
>  xen/include/xen/fdt.h            |  79 ++++++++++++++++
>  9 files changed, 246 insertions(+), 199 deletions(-)
>  create mode 100644 xen/common/fdt.c
>  create mode 100644 xen/include/xen/fdt.h
> 
[...]

> diff --git a/xen/common/fdt.c b/xen/common/fdt.c
> new file mode 100644
> index 0000000000..8d7acaaa43
> --- /dev/null
> +++ b/xen/common/fdt.c
> @@ -0,0 +1,153 @@
> +/*
SPDX missing for a new file

> + * Flattened Device Tree
> + *
> + * Copyright (C) 2012-2014 Citrix Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#include <xen/fdt.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/types.h>
> +
> +bool __init device_tree_node_matches(
> +    const void *fdt, int node, const char *match)
FWICS, this code style (that you use for every function in this patch) is rather uncommon in Xen so maybe better to follow the generic style.
Also, this would avoid changing the style of functions/prototypes you move.

[...]

> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 1d79e23b28..82db38b140 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -14,13 +14,12 @@
>  #include <asm/device.h>
>  #include <public/xen.h>
>  #include <public/device_tree_defs.h>
> +#include <xen/fdt.h>
>  #include <xen/kernel.h>
>  #include <xen/string.h>
>  #include <xen/types.h>
>  #include <xen/list.h>
> 
> -#define DEVICE_TREE_MAX_DEPTH 16
> -
>  /*
>   * Struct used for matching a device
>   */
> @@ -159,17 +158,8 @@ struct dt_raw_irq {
>      u32 specifier[DT_MAX_IRQ_SPEC];
>  };
> 
> -typedef int (*device_tree_node_func)(const void *fdt,
> -                                     int node, const char *name, int depth,
> -                                     u32 address_cells, u32 size_cells,
> -                                     void *data);
> -
>  extern const void *device_tree_flattened;
> 
> -int device_tree_for_each_node(const void *fdt, int node,
> -                              device_tree_node_func func,
> -                              void *data);
> -
>  /**
>   * dt_unflatten_host_device_tree - Unflatten the host device tree
>   *
> @@ -214,14 +204,6 @@ extern const struct dt_device_node *dt_interrupt_controller;
>  struct dt_device_node *
>  dt_find_interrupt_controller(const struct dt_device_match *matches);
> 
> -#define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
> -#define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
> -#define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
> -
> -/* Default #address and #size cells */
> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> -
>  #define dt_for_each_property_node(dn, pp)                   \
>      for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
> 
> @@ -231,16 +213,6 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
>  #define dt_for_each_child_node(dt, dn)                      \
>      for ( dn = (dt)->child; (dn) != NULL; dn = (dn)->sibling )
> 
> -/* Helper to read a big number; size is in cells (not bytes) */
> -static inline u64 dt_read_number(const __be32 *cell, int size)
> -{
> -    u64 r = 0;
> -
> -    while ( size-- )
> -        r = (r << 32) | be32_to_cpu(*(cell++));
> -    return r;
> -}
> -
>  /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t) */
>  static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
Shouldn't this also go to fdt.h as it is just a wrapper for dt_read_number() you moved?

~Michal

