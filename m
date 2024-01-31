Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E3843F95
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:43:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674020.1048679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9vt-0000wQ-A4; Wed, 31 Jan 2024 12:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674020.1048679; Wed, 31 Jan 2024 12:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9vt-0000uo-7C; Wed, 31 Jan 2024 12:43:13 +0000
Received: by outflank-mailman (input) for mailman id 674020;
 Wed, 31 Jan 2024 12:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX7o=JJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rV9vs-0000ui-1V
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:43:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49fa37ca-c036-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 13:43:10 +0100 (CET)
Received: from BLAPR03CA0086.namprd03.prod.outlook.com (2603:10b6:208:329::31)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.37; Wed, 31 Jan
 2024 12:43:06 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::67) by BLAPR03CA0086.outlook.office365.com
 (2603:10b6:208:329::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 12:43:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 12:43:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:43:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 04:43:04 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 06:43:02 -0600
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
X-Inumbo-ID: 49fa37ca-c036-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQdZsN5l6WlGx3lYVp7+JSppFP9W520946lPQ0Gwz72+eEOhg8xnlfjft/W0wW/XhaI4S6bU9H6wiSWH45kGBKd1XKzfNUHMalYhbTBpHyvm5VKkSpFASRPFTM4chEDtFK83wkxN4ndUCMCV1tCZMFeg0oCGZKKYcb49mdmGyddMni5KC9ry06FJanxS92JDsY3bfHfrjSBI2f2NLEnDK3mCxp86ervLXYXjeHLQTdRIWH86lgJnwZJCXe/lhv6NQQ5ql077A4mpfbuR2MXcvRKSDNmO2TkOrsdxdB18bPkdAzVTIzNycGoC+yZJiLdg/ae8ducVJx/LvR+wPlTslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAAwLouGsxv8hR1ylp4tn+X91JS9RJNCjxgIsTPoptE=;
 b=Ij2ZjxBxv2+r+g6G1W4CoEmUm0SCgCPvOEsJchNdyJVnKzqRSTafvRivegGJi3ImpT/p0wLT4waT9nlqBoDcwLGJkvi9EdhRt+HGm6yA5ARKhKt0SCF6WS6klLSfPdJzx30myHvJwRjBAOU3L1kWGnfzjr8mYm8ZEzE1iNFS7D/CLeBlXyGBOKC6QAeEllRKeT7pW9xBLgqLY3eJut/YK2jTmhwWXMlGEOqQ4yvuEE8BWve/cqog664c7zKLaYtyQPbcM1n/eMD/bBIxd8S1ShISoVsuNOztVD20HsbAGy1nwT51UZwGDmjwiGcFf0BIJwpj5l+TNFM8E9ai32Yn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAAwLouGsxv8hR1ylp4tn+X91JS9RJNCjxgIsTPoptE=;
 b=PK3N0UZOJwzy7yyP/uFEJGaVBdvMM2UQgh1HzMPQVbKQ1CpX6jd+ALAloWJkyoD13XUefgZ4gZN35MBV78or5X+bzlUiPTbfkiUdNlsoi9pj0y5Z4spAhi90cVbE5pNfskHrtbl3I2bHbCYi4BIRmolB1encjpyogR7GdAK1M9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <13858d36-a7e5-4c74-ac6a-859125b8e92e@amd.com>
Date: Wed, 31 Jan 2024 13:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-2-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240131121049.225044-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|CH2PR12MB4261:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e176b4d-04b9-4921-f943-08dc225a2b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tvxAU3UI/HBUFc2MdN4JW8afmcMew0522cIA+dhV22TbgrrK13wkdC9UrfctIcXRCkNaKNK8rBH95BD6ZlHT/AWMTWWPUtu6tDTgdsJIKRV3vqrH45NfHOvYtPZLmVKgSshzgrroi5aYbxQjg5WltoMjl8qiUdp9DDUovHnDngKsBluradSEPEgHUDuH6ZK3EHoO5iTUY97UsuPss7WSfzJCuLV1NjQJJND+ULqaimHFJyVqDzou8Lspsv4EJpXVH28GW7txFhi8ErGuG2/4mXDH2IwEeT0MVwi7cNnSDGbHrPmj5WZ946jgH01ZHPGUSE9H0r1WJJWGhu33HZ7R7siS4NBk0KeJff8eAbCsewmJUAys/4AsvVcWflD/RLrqa7NUhwQWwe7ed80kbJwcjRQ/W6WbHDj0KAz0T86ooTEsB2yenF9jsWlZrBBCEnFyEsO+47b4NNUQ68xYsOBsIPmZfnbibWlIX8Hk+CT5GCn8m8+l59gqkWl5YFJ/v0YK8ZtXqS2MjrGt0GfiOysNqIzGp4uvdV9jumomxoUYIxhfkk0qnpLKpaU+7BqxqYmTw+GYYMNik2izIQVCOxhW0HRJznArUd4Vb51q8D/eu4XuVjdyAtW1OwKT8ArfzE9QbFfO18fu7qAyuRXM7I1VgzpeGD7pNZ+FFpZwYa8Jr+NT+8Uz/xzKbpdIqCj+2UH6lkVKHImCnbjSpJj4E3OZxkXmAAvuqtFPM4yAB7UIhvvVWL19D/szymBRFFS8uLBhd6yaZ7ztv/Y++EHuZi9ZkgvnNFt1Pl1PMluMHzz7K4RBBGfbAk/9YPOHNFsvflWyjTbU30PuJKDKP/Qi/JUugK2G6FJNSV1lrXiru6ltxVA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(26005)(2616005)(83380400001)(336012)(426003)(478600001)(41300700001)(53546011)(8676002)(36756003)(8936002)(4326008)(356005)(44832011)(316002)(16576012)(54906003)(40460700003)(40480700001)(36860700001)(2906002)(31686004)(81166007)(70206006)(5660300002)(82740400003)(70586007)(47076005)(110136005)(31696002)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 12:43:04.7993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e176b4d-04b9-4921-f943-08dc225a2b47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261

Hi Ayan,

On 31/01/2024 13:10, Ayan Kumar Halder wrote:
> There can be situations when the registers cannot be emulated to their full
> functionality. This can be due to the complexity involved. In such cases, one
> can emulate those registers as RAZ/WI for example. We call them as partial
> emulation.
> 
> Some registers are non-optional and as such there is nothing preventing an OS
> from accessing them.
> Instead of injecting undefined exception (thus crashing a guest), one may want
> to prefer a partial emulation to let the guest running (in some cases accepting
> the fact that it might result in unwanted behavior).
> 
> A suitable example of this (as seen in subsequent patches) is emulation of
> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
> registers can be emulated as RAZ/WI and they can be enclosed within
> CONFIG_PARTIAL_EMULATION.
> 
> Further, "partial-emulation" command line option allows us to
> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
> enables support for partial emulation at compile time (i.e. adds code for
> partial emulation), this option may be enabled or disabled by Yocto or other
> build systems. However if the build system turns this option on, users
> can use scripts like Imagebuilder to generate uboot-script which will append
> "partial-emulation=false" to xen command line to turn off the partial
NIT: given that the option is false by default, it would make more sense to give example
with setting it to true to enable it.

> emulation. Thus, it helps to avoid rebuilding xen.
> 
> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
> This is done so that Xen supports partial emulation. However, customers are
> fully aware when they enable partial emulation. It's important to note that
> enabling such support might result in unwanted/non-spec compliant behavior.
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
> v3 :-
> 1. Defined a macro 'partial_emulation' to reduce if-defs.
> 2. Fixed style issues.
> 
>  docs/misc/xen-command-line.pandoc | 11 +++++++++++
>  xen/arch/arm/Kconfig              |  9 +++++++++
>  xen/arch/arm/include/asm/traps.h  |  6 ++++++
>  xen/arch/arm/traps.c              |  9 +++++++++
>  4 files changed, 35 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 8e65f8bd18..22c0d7c9f6 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1949,6 +1949,17 @@ This option is ignored in **pv-shim** mode.
>  
>  > Default: `on`
>  
> +### partial-emulation (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable partial emulation of system/coprocessor registers.
> +Only effective if CONFIG_PARTIAL_EMULATION is enabled.
> +
> +**WARNING: Enabling this option might result in unwanted/non-spec compliant
> +behavior.**
> +
>  ### pci
>      = List of [ serr=<bool>, perr=<bool> ]
>  
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 50e9bfae1a..8d8f668e7f 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -225,6 +225,15 @@ config STATIC_EVTCHN
>  	  This option enables establishing static event channel communication
>  	  between domains on a dom0less system (domU-domU as well as domU-dom0).
>  
> +config PARTIAL_EMULATION
> +	bool "Enable partial emulation of system/coprocessor registers"
> +	default y
> +	help
> +	  This option enables partial emulation of registers to prevent guests
> +	  crashing when accessing registers which are not optional but have not been
> +	  emulated to its complete functionality. Enabling this might result in
NIT: s/its/their

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


