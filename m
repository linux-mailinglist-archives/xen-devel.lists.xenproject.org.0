Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD3826852
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 07:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663191.1033019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMjYF-0002oQ-Lh; Mon, 08 Jan 2024 06:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663191.1033019; Mon, 08 Jan 2024 06:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMjYF-0002mr-Iu; Mon, 08 Jan 2024 06:55:59 +0000
Received: by outflank-mailman (input) for mailman id 663191;
 Mon, 08 Jan 2024 06:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0y/=IS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rMjYD-0002mf-I9
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 06:55:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f70ae90b-adf2-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 07:55:54 +0100 (CET)
Received: from DM6PR01CA0011.prod.exchangelabs.com (2603:10b6:5:296::16) by
 PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 06:55:49 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::f7) by DM6PR01CA0011.outlook.office365.com
 (2603:10b6:5:296::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 06:55:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.12 via Frontend Transport; Mon, 8 Jan 2024 06:55:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 8 Jan
 2024 00:55:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sun, 7 Jan
 2024 22:55:44 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 8 Jan 2024 00:55:42 -0600
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
X-Inumbo-ID: f70ae90b-adf2-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLBMS6OINOHw5UvDzeTvmwqOu1T5xlb7Pnn1aI8pXdVk96nGhmS3+5Alpb9rajD6EwJ3q67zxamz1lYUBlKO97tCc9Myah/bn0iMhcER6AKIHyHSDDTQDuM2ZwYXDUoaNuO1gzl0TBy7/PsgGw+SwtSbLejiAG/25VpZaszyo3FRE5P2hArOGMrDawFoZPGplvTj+iM3T9IgCAk712vpQK9TJ1jq75Jey4nErfcmSn1JyThz4fDit7xlXfXRSLLsSIECFBj7RZiHUo/OT5V70oBfj/bFoNG2w4vrk5XfVsx3AZXm7AWz8o39obhymYMx2WY4JYzjMSZuKX2AWEAgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ito+fMQdXvppjtF4LDjyidBsZ8XzFmIEPdsDl7nvnT8=;
 b=cD4aE4QDvSNbvimjW7tYe3pFKudHAT4c12KHbaiC9NnItasjYg80r5KNvstHIB1DoI08R8tcwiokatDCYGYR0CoGRLQK1Cjps5Uc8dhamxexcyXZEvZl52X2CuVDZf7kMYzemL05P+Uu/PcerBFvL3CJR985B2aTOwfLzr6TG4WyF6kQo7j4fmBzOCbh+wtMLdTmteUL1DvIadXpF1CV41mY69sCoinZYkDwG1KzNhc5HqBQp3uN+3DEUuY8Iqa7WJHT1CEgGeje44p3Sj0OCRkdnZP1WjN6ASLr01XiQJJHw+ALFZ6NKSUtuWj+lgK09MVVCxwaJOizNTp6/KJY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ito+fMQdXvppjtF4LDjyidBsZ8XzFmIEPdsDl7nvnT8=;
 b=Rhydw1C8umyJBvHZgLmusaGakivOSpqu7Xxc3v6ftj18HYzMXm5eUFEK5oCvQFK2CIwIJzIDfNe8aKYxUf6jOGRFM5p4Zfie0wM9sJUncSzEhOOnEy0ESTjwHMDB1YV7yNBg2//o7Hnj/Mm/jCT8u+mF1lrkas9+UENveqzCyQ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aec5bbae-072d-4da1-a97c-11fb3cf59bd2@amd.com>
Date: Mon, 8 Jan 2024 07:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN v3 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
 <20240105112156.154807-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
In-Reply-To: <20240105112156.154807-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f461d7-0c54-43f0-6f4f-08dc1016d85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JSXIhxzyOVST+5V21BmLrIHqDpJ4Xbg2cvGnVgoK+0D1r4XJuQ/Ry3TvOGTjKBUW7JKZqqoddC6p4CkA5ePbL6nT63i8mE4O/t384EFIUMskooiNrqt/6/zl3vOpND0uxFRDN3KrqXYIXGhFPIOGj2KN9jOconsRVHpe9P/PpIoxkTRLNfk8ivLsrdWOhlnr4kFpv3jQlH7zMeGl2aIkf+kRUbb+GEfeMExEhimC4iLim2zJtjYbzFSsbis9pZyE1KBrtcun3ZZWjjDZnlvLZaJeMhYTEXWfG+f+w3vDjC/OHPnqtU+WmTiRmlmIRxgwvSYftWxAf+al4wBkLz7aD6Zrzyf6+SmJ7fo9hRXP+MqZG55XWFkJzQzq9GnIqMrMI/ojwR5YFaVbdb1vmzn81eNBFZuWGSIUKxob+tBaFTto5sj1YKjcnjnDe9uvJYObz3CKOvJHARIFpmD7bcX1c3VEAxpRLTzmXn9o7mVmU9umU3VNd2/ATYK3O8PFNI3JVsO0aEymH5VOcYK2poMA5t5OPP+TqttB5cSYX5hVbSC+v9Zl1kgYrC1T2OFMlRvPNFbacOy9KBYN40Rehb/t1ElsN5y5VcwzlIs3blgza121jmkO6+MhNUL0rSugjs+4SPVCGVzx9WakmqBIU64rUxEYgNm3yMLZob2JVmn0wIXhbV3qieYw19bV0WdSVXeKLQVUvdv86iju3KfGH98KfuRhh7hVMSj3BttbIKmc6YLufiu34l6D89dteEZ+ZKt2bt2YYIOV2Jihtq6Cx6wAclLdF/c9uE9GC6rECIlEW696z5XUsZ18O/L3TiXvHT+Ay3BRLHqY6AuI9V7O2VQ3zUg42RtCq35lPCsBW9KtPh0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(83380400001)(40460700003)(336012)(26005)(47076005)(40480700001)(36860700001)(5660300002)(4326008)(426003)(53546011)(31686004)(2616005)(82740400003)(81166007)(356005)(31696002)(478600001)(16576012)(110136005)(54906003)(316002)(70586007)(70206006)(8936002)(8676002)(36756003)(44832011)(41300700001)(86362001)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 06:55:48.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f461d7-0c54-43f0-6f4f-08dc1016d85b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605

Hi Ayan,

On 05/01/2024 12:21, Ayan Kumar Halder wrote:
> 
> 
> There can be situations when the registers cannot be emulated to their full
> functionality. This can be due to the complexity involved. In such cases, one
> can emulate those registers as RAZ/WI. We call them as partial emulation.
I read this as if RAZ/WI was the only solution which is not true. I would add e.g.

> 
> A suitable example of this (as seen in subsequent patches) is emulation of
> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
> registers can be partially emulated as RAZ/WI and they can be enclosed
> within CONFIG_PARTIAL_EMULATION.
I think we are missing the purpose of this patch i.e. why we want to enable partial
emulation instead of default behavior which is injecting undefined exception.

> 
> Further, "partial-emulation" command line option enables us to
> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
> enables support for partial emulation at compile time (ie adds code for
> partial emulation), this option may be enabled or disabled by Yocto or other
> build systems. However if the build system turns this option on, customers
Users (in general) instead of customers?

> can use cripts like Imagebuilder to generate uboot-script which will append
s/cripts/scripts

> "partial-emulation=false" to xen command line to turn off the partial
> emulation. Thus, it helps to avoid rebuilding xen.
> 
> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
> This is done so that Xen supports partial emulation. However, customers are
> fully aware when they enable partial emulation.
It's important to note that enabling such support might result in unwanted/non-spec
compliant behavior.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1 :-
> 1. New patch introduced in v2.
> 
> v2 :-
> 1. Reordered the patches so that the config and command line option is
> introduced in the first patch.
> 
>  docs/misc/xen-command-line.pandoc | 7 +++++++
>  xen/arch/arm/Kconfig              | 8 ++++++++
>  xen/arch/arm/include/asm/regs.h   | 6 ++++++
>  xen/arch/arm/traps.c              | 3 +++
>  4 files changed, 24 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 8e65f8bd18..dd2a76fb19 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1949,6 +1949,13 @@ This option is ignored in **pv-shim** mode.
> 
>  > Default: `on`
> 
> +### partial-emulation (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable partial emulation of registers
Missing dot at the end of sentence.
Also, I would add a warning that enabling this option might result in unwanted behavior
and that it is only effective if CONFIG_PARTIAL_EMULATION is enabled.

> +
>  ### pci
>      = List of [ serr=<bool>, perr=<bool> ]
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 50e9bfae1a..8f25d9cba0 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -225,6 +225,14 @@ config STATIC_EVTCHN
>           This option enables establishing static event channel communication
>           between domains on a dom0less system (domU-domU as well as domU-dom0).
> 
> +config PARTIAL_EMULATION
> +    bool "Enable partial emulation for registers"
Shouldn't we be more specific and write system/coprocessor registers?

> +    default y
> +    help
> +      This option enabled partial emulation for registers to avoid guests
s/enabled/enables

> +      crashing when accessing registers which are not optional but has not been
> +      emulated to its complete functionality.
Ditto about the possible side effect.

Formatting is incorrect. bool, default, help should be indented by tab and help text
by tab and 2 spaces.

> +
>  endmenu
> 
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
> index f998aedff5..b71fa20f91 100644
> --- a/xen/arch/arm/include/asm/regs.h
> +++ b/xen/arch/arm/include/asm/regs.h
> @@ -13,6 +13,12 @@
> 
>  #define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == (m))
> 
> +/*
> + * opt_partial_emulation: If true, partial emulation for registers will be
> + * enabled.
> + */
Description would better suit at the definition.

> +extern bool opt_partial_emulation;
> +
Given that parameter definition is in traps.c, I would add declaration in traps.h.

>  static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>  {
>  #ifdef CONFIG_ARM_32
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 9c10e8f78c..d5fb9c1035 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -42,6 +42,9 @@
>  #include <asm/vgic.h>
>  #include <asm/vtimer.h>
> 
> +bool opt_partial_emulation = false;
> +boolean_param("partial-emulation", opt_partial_emulation);

Looking at other patches, the partial emulation code will most often be used as follows:
#ifdef CONFIG_PARTIAL_EMULATION
if ( opt_partial_emulation )
   ...
else
   ...
#endif

We could instead do:

#ifdef CONFIG_PARTIAL_EMULATION
#define partial_emulation_enabled opt_partial_emulation
#else
#define partial_emulation_enabled false
#endif

to reduce the number of checks and ifdefery (still could be used to compile out some code in rare cases).

> +
>  /* The base of the stack must always be double-word aligned, which means
>   * that both the kernel half of struct cpu_user_regs (which is pushed in
>   * entry.S) and struct cpu_info (which lives at the bottom of a Xen
> --
> 2.25.1
> 
> 

~Michal

