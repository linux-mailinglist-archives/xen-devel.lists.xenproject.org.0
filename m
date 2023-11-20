Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163967F0D12
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 08:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636458.991967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zAd-0006f5-52; Mon, 20 Nov 2023 07:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636458.991967; Mon, 20 Nov 2023 07:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zAd-0006bl-1v; Mon, 20 Nov 2023 07:58:15 +0000
Received: by outflank-mailman (input) for mailman id 636458;
 Mon, 20 Nov 2023 07:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3F/=HB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r4zAc-0006bc-C4
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 07:58:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d202c07-877a-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 08:58:12 +0100 (CET)
Received: from SN6PR04CA0104.namprd04.prod.outlook.com (2603:10b6:805:f2::45)
 by DS7PR12MB9043.namprd12.prod.outlook.com (2603:10b6:8:db::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.26; Mon, 20 Nov 2023 07:58:08 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:f2:cafe::88) by SN6PR04CA0104.outlook.office365.com
 (2603:10b6:805:f2::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 07:58:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 07:58:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 01:58:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 01:58:05 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 01:58:03 -0600
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
X-Inumbo-ID: 8d202c07-877a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbj7UXL755CoYwDLy0GZZnv9LdwJDMxgVLQOckEJ5VWF1l73ZSoOqq3MCSTrrjqEpf671mgFieTjHSLhSXPIfXwhs1sEL73f8g37LQjGYuHVMxC1w8+EHTlCYpViMJ608yIfLv/mcAEhkmKt4vDLHxirIcTTldgQylHKWipfHV6bLog6r9GoVJjUhwSFKD+MYR8zOSuZXGUf59YPMDkgaxjbxvOJCGWPo0wOJI+yOjJ4fKFzv3i8I4rV7CDnRpM7AGvs6DbjG6kU2fSKU/Q8yfjHudYaUwt0g1tUr40oZu6eyot5nDhcGliTwG0NGi+SwMzsRdPk1fDHBF+QZX9DDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvnnBIcGJMlVnNU94MsLDXFsQVOZRs1zLCCsa9ez5xE=;
 b=dtAWNzt0dSfxpVybsbx5S8SKuohPoQJBJbHHwOrAr5RCvMGjxz+GCWsZKHqgtyYcuSgT5R+T7fSW3Jk4dGLM8Egp+sy5adU3eojavJGmOMcf/05SZJ95u12zgoQkWNQO1/jbhRbX17yRRJkBVxL0Vd5GY865G22lWT6LumWVJxTQmC/RNRlvuHjhMqX1JUe91J1j05DAOWMOhmO8EIhhaWpjzAn5mPZHTjnvEeRNGplyvoRF/dai0tix7G9WBp050CI3tqroWesVTe4r9CSsptnjEjlH8tZYblfBT+5603bZVxG3mQSDHAI9MVXqFByBPb9bf3Ig1Otb48hI7nKAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvnnBIcGJMlVnNU94MsLDXFsQVOZRs1zLCCsa9ez5xE=;
 b=Jb/gAWEcjL2cKceg3uY3B7SOUtBc9EPNPnIg38ExLu+rQoihNPYvneqexOgMAauJcFQpx+YGaG58J0OBD28yYOxizM0P7XaW/Rhc0nnLzWuO08Ol/Kfz7nf3dFe2gqMTDsPKk4BY/BVWMHzKKZZWV8oNTEZQCsbCfEXC9weGIIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a021b2c6-82e9-4ad3-a137-e2b72a780f04@amd.com>
Date: Mon, 20 Nov 2023 08:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-6-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231114090356.875180-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DS7PR12MB9043:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8c6025-cc07-4568-bed4-08dbe99e6eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KzqCl2+OIR957wqefQz+KlmoIZG67iL9P9MlgYFn2HxR2Cg4nPRQHwlnCVHcn/gFkwLHDxMW5vBfv8WWglyxDCvM0xvCaUUbKT2JI/5oyUuhR5ogtOUmQlMNDDkG48VLhF40wX4vuzQZj2cKHXhV+f8ueyoeYHL9toKzvZ+RiyweVNgZ511bp/9GDvIj2jDYCxSLJZ3lUvafy8cs83Q+oko5vsdGMLGUwcHVtX7b5w9xY+LDIkcK6xOv0XBFOJGIKfvq9ZRPSngp99AOJhyO+Jw/o1zwe456ryGD4QLbG7sEUokb1ffgRA/TcHro6LSQSo7KOqFwYVpx+efLe6B59Z5Og2jWmV0z7JFnvoD+v2TTSR7KLPFEdja70vo6Wq37gr3cfeJ+uPezEgzgnfcvj7Oq6+AoFi7jimOMBpFqJqdbEt85DnkBKVMMOvqHZCtcuPRVQkKGFevlY5pkCbtVf/x2mGRTX7FkZB1sZ+qegtcGxUUiuR8dfT2lMy88ei9gLXZlMR98bf2fMP76lMN4xopTpngUETVB7rl6OESuvwzXM4mIgso1w7YMTAKz94oIHA9szmlAswaxHdlhg7q/V7ct6FWx2i6ncXyPDbBJDm6bKWaIQOTxPjQgJXgUSGZqX3H8Dz5l+pZjNTlgwH3a42Q5dlfnJ/cUxFsdypq00OqQaHXZ8B9b285skjP491zX6yheQ+j4zlRzJcdOjmGTaZsdIBLNKtbEtR+1Rm3IaWaFrE0g3FVQ2m8sDJQfLfOpg5OUqbtBhBe5roYO5/ZevG2ad03CN5cgUHuWrgvzm4ijY5tLzTfFXcjcd+7CuXwbpFbBKf5d1Qn2JX5GZQEKXAtkaTBnDWqwAGEfG03cOk2qr4+KerbGcv4A9lX8t0TY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(82310400011)(1800799012)(64100799003)(186009)(46966006)(40470700004)(36840700001)(7416002)(5660300002)(2906002)(316002)(8676002)(8936002)(16576012)(4326008)(41300700001)(70206006)(54906003)(70586007)(110136005)(26005)(478600001)(40480700001)(31686004)(44832011)(53546011)(2616005)(36756003)(31696002)(336012)(426003)(86362001)(83380400001)(82740400003)(40460700003)(81166007)(47076005)(356005)(36860700001)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 07:58:07.7742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8c6025-cc07-4568-bed4-08dbe99e6eef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9043

Hi Luca,

On 14/11/2023 10:03, Luca Fancellu wrote:
> 
> 
> Introduce a Kconfig for the dom0less feature, enabled by default,
> to be able to choose if the feature should be compiled or not.
> 
> Provide static inline stubs when the option is disabled for the
> functions externally visible.
> 
> Use the new Kconfig to remove dom0less DT binding from the efi-boot.h
> code when the Kconfig is not enabled, do the same for
> allocate_bank_memory inside domain_build.c that currently is used
> only by dom0less-build.c module, but it's kept there provisioning
> its usage by dom0 code.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v4:
>  - No changes
> Changes from v3:
>  - Update Kconfig
> Changes from v2:
>  - protect allocate_bank_memory with the new Kconfig
> ---
>  xen/arch/arm/Kconfig                      |  8 ++++++++
>  xen/arch/arm/Makefile                     |  2 +-
>  xen/arch/arm/domain_build.c               |  2 ++
>  xen/arch/arm/efi/efi-boot.h               |  4 ++++
>  xen/arch/arm/include/asm/dom0less-build.h | 12 ++++++++++++
>  xen/arch/arm/include/asm/domain_build.h   |  2 ++
>  xen/common/Kconfig                        |  2 +-
>  7 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 0045a3762d86..f321381a6e87 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -88,6 +88,14 @@ config GICV2
>           Driver for the ARM Generic Interrupt Controller v2.
>           If unsure, say Y
> 
> +config DOM0LESS_BOOT
> +       bool "Dom0less boot support" if EXPERT
> +       default y
> +       help
> +         Dom0less boot support enables Xen to create and start domU guests during
> +         Xen boot without the need of a control domain (Dom0), which could be
> +         present anyway.
> +
>  config GICV3
>         bool "GICv3 driver"
>         depends on !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 89ef0c9075b5..5daf8f10114d 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -15,7 +15,7 @@ obj-y += cpufeature.o
>  obj-y += decode.o
>  obj-y += device.o
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
> -obj-y += dom0less-build.init.o
> +obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
>  obj-y += domain.o
>  obj-y += domain_build.init.o
>  obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7eb766da9c63..df66fb88d8ec 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -416,6 +416,7 @@ static void __init allocate_memory_11(struct domain *d,
>      }
>  }
> 
> +#ifdef CONFIG_DOM0LESS_BOOT
>  bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
>                                   gfn_t sgfn, paddr_t tot_size)
>  {
> @@ -477,6 +478,7 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
> 
>      return true;
>  }
> +#endif
> 
>  /*
>   * When PCI passthrough is available we want to keep the
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 1c3640bb65fd..689dc016d081 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -802,6 +802,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>      return 1;
>  }
> 
> +#ifdef CONFIG_DOM0LESS_BOOT
>  /*
>   * This function checks for boot modules under the domU guest domain node
>   * in the DT.
> @@ -849,6 +850,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
> 
>      return mb_modules_found;
>  }
> +#endif
> 
>  /*
>   * This function checks for xen domain nodes under the /chosen node for possible
> @@ -876,6 +878,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>      {
>          int ret;
> 
> +#ifdef CONFIG_DOM0LESS_BOOT
>          if ( !fdt_node_check_compatible(fdt_efi, node, "xen,domain") )
>          {
>              /* Found a node with compatible xen,domain; handle this node. */
> @@ -884,6 +887,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>                  return ERROR_DT_MODULE_DOMU;
>          }
>          else
> +#endif
>          {
>              ret = handle_module_node(loaded_image, &dir_handle, node, addr_len,
>                                       size_len, false);
> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
> index c5625925d940..db2bf821e7aa 100644
> --- a/xen/arch/arm/include/asm/dom0less-build.h
> +++ b/xen/arch/arm/include/asm/dom0less-build.h
> @@ -3,9 +3,21 @@
>  #ifndef __ASM_DOM0LESS_BUILD_H_
>  #define __ASM_DOM0LESS_BUILD_H_
> 
> +#ifdef CONFIG_DOM0LESS_BOOT
> +
>  void create_domUs(void);
>  bool is_dom0less_mode(void);
> 
> +#else  /* !CONFIG_DOM0LESS_BOOT */
one space between #else and /*

> +
> +static inline void create_domUs(void) {}
> +static inline bool is_dom0less_mode(void)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_DOM0LESS_BOOT */
> +
>  #endif /* __ASM_DOM0LESS_BUILD_H_ */
> 
>  /*
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index da9e6025f37c..6df61fa1d587 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -6,8 +6,10 @@
> 
>  typedef __be32 gic_interrupt_t[3];
> 
> +#ifdef CONFIG_DOM0LESS_BOOT
AFAICT, guarding prototypes is not needed and we opt to avoid it. I'd remove it.

The remarks can be handled on commit (depending on the conflict with Henry's series)
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

