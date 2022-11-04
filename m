Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9B6193EB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 10:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437411.691766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtQF-0007dC-L5; Fri, 04 Nov 2022 09:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437411.691766; Fri, 04 Nov 2022 09:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtQF-0007aE-I4; Fri, 04 Nov 2022 09:55:35 +0000
Received: by outflank-mailman (input) for mailman id 437411;
 Fri, 04 Nov 2022 09:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Yn=3E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqtQE-0007Zp-2X
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 09:55:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a41a31-5c26-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 10:55:32 +0100 (CET)
Received: from MW4PR04CA0104.namprd04.prod.outlook.com (2603:10b6:303:83::19)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 09:55:29 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::e8) by MW4PR04CA0104.outlook.office365.com
 (2603:10b6:303:83::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 09:55:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 09:55:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 04:55:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 04:55:27 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 4 Nov 2022 04:55:25 -0500
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
X-Inumbo-ID: d1a41a31-5c26-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsE0fhk5LJUQ68ziXXwVXbnnXNDOEaDmBaZ/ZtpLGaLHZ1Wbx09t2w7l9vRo5Na76dxewilm/4qkNvkpBIT/DDYvreasz8IuHQhDnZOi+5CSdo9xBviiYRWwQIZ+A/Jl9q6vwRrAmH093jSvU8rFni850SDmvoa4v9keIegC0Lnl6QTJl9mcVseg7WgC0qjMOkNTd1B2mgrYm5jc1dFk73h+rvTkKqeD12Sl61UCpqAa4tBOUn7NLj5eJtszZgSw9bHk8s0UZSzxDi/YiErVjQmC3G+/X2eBx4S+8kP+FmCKK8FyC7pXHFiZsCj3MnRBZnVtfLQ3+rInU3rilTB4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMiYgNQoHDDCi76G1G6p2oh/+q8mXH1uYqpKiFOWwqU=;
 b=TBZJTYRiax+hE3C6IGCcMlJKTddJ9dY9yE62b6rePWMX6JqG1CURz+XEN0aMfGNEwRX230Nmj901FrHJi6wRRl08UQN0yM3tCGHN+v9US94IVbxw2F//wqd8V9UmvIzQW9Ua+qX70+oKg0t6rm7Ky64MA2bHjJRbh6MlVKYrQmxqBEWQUtPSUdR6xabMuxJA7to1ieAq8m5ofONfRJez6ooReL82V/OfZ4owyU5BOMpL4lSFIJSr3LNSDwADXFjWou1pslFPf0guZEzguXXHrSMwXYXv4WW2kI9jB2cI2WI9y4KE++4agBf5oAwdv5NXywQxHY1Ds5xrlge3Kz3g7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMiYgNQoHDDCi76G1G6p2oh/+q8mXH1uYqpKiFOWwqU=;
 b=Zpv65bGof7MChKfs1MaMiPCIBbldGqqQBbJ8E5swdDN8vta63EjuPM1h094nx0X3LnDCtYNeh9dbPrqSod++pd938PTDFAw9gY4ylfbnFberL6aV6ipsH3qCDoyAI4IfyRpTs3C9P4XhE3WM+r9Ac0kpDbgUaCKba5RK2KSJyFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <45df5e11-9697-96ca-3c89-39bdbba48637@amd.com>
Date: Fri, 4 Nov 2022 10:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-13-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-13-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT030:EE_|BL1PR12MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4038c3-d1a0-451e-a838-08dabe4ab3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WhTAtl+xUHMlFJgIZEAgt7tWT9rUmTKFx9bfrO6MK3Jt1ix1h1pbsSUL35n3gGDXUfYYeFplhrIfS5j6QXf+FM0ImYlZOCyIjBOdtb5L2L8QhESeA8wpL9B6o2ciczjLSl9f9vGFxCoqPAtL+2DXxMz8HZP2J389zScxME5HblcIurXWYAsCOE98cX+tjMoXuPaYbvcFA7SxR1yIQRwnZb0kEY4V1KMU/OP3+hf7pUhEmupY01N43skbIuOw3dbddOdYAvc/DZCmwpheoPFZ8yIG0FZ1SSpUfCr4gpnVzGPo92d1kQfhm6H4Vn5lMmTo/ivJ0ZSi+YGU8PUFljnU/SEkEj7gkXAa2ApZgbA3wKq3VO+XB2WtHsu1/dAFp+8jQim7RPeO3VGOKHAw+X3cZFOT12OzH9Q+gPzkGUZS4Ks7ZmP2pVRS824+gnJAr/2Eh4AiM0LkFFsQEfAVQP0Z8NjrAtu8dv3HYHvYrJWHVq2TWmdUxbhdT+2gKHv3NVI6Ji1S2n59F3vE2MY8SYjOzzZOsnaIiu+Xu31+c0/+8646sNnSo7Hij6Omj1cg5ansTWJUzu/88sxLl+mDBfyblC1Ds1X9N0ckVn1GhoE08oXeci6Fr1mmTaBN+3EFVwk3dMe3n3QjOEdHh7CRsW6MLBaN4/aRI+VZs0/zWQQeKAUJO52XB9W2ThnEIaeuMGNcoly0TJUgV3G2Yd7D7eM6DQYut3UFtHUIHC3NxZolnG7YNxijyD5axu7uCTFM/pZu+sBmRSrTOJeHvxjBcsDJyQ5ee7fuKxJ46BSelWyldvuUC+KE0nDWkL9YDSoTuXIYZZ1/hInf1mccJfKP172o7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(2906002)(478600001)(70586007)(70206006)(426003)(53546011)(83380400001)(47076005)(4326008)(8676002)(36756003)(40480700001)(36860700001)(316002)(54906003)(86362001)(31696002)(16576012)(110136005)(82310400005)(40460700003)(82740400003)(356005)(81166007)(26005)(41300700001)(2616005)(8936002)(31686004)(5660300002)(186003)(336012)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 09:55:28.1124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4038c3-d1a0-451e-a838-08dabe4ab3f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> Refer ARM DDI 0487G.b ID072021,
> D13.2.86 -
> ID_PFR1_EL1, AArch32 Processor Feature Register 1
> 
> GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32
> 
> One can now enable GICv3 on AArch32 systems. However, ITS is not supported.
> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> Updated SUPPORT.md.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changed from :-
> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
> 2. Updated SUPPORT.md.
> 
>  SUPPORT.md                            | 6 ++++++
>  xen/arch/arm/Kconfig                  | 4 ++--
>  xen/arch/arm/include/asm/cpufeature.h | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index cf2ddfacaf..0137855c66 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to support MSI.
> 
>      Status: Experimental
> 
> +### ARM/GICv3 + AArch32 ARM v8
> +
> +GICv3 is supported on AArch32 ARMv8 (besides AArch64)
Looking at the CONFIG_GICV3, it can be enabled on arm32, which at the moment
supports only ARMv7 (see __lookup_processor_type -> proc-v7.S).
What will prevent the user from enabling GICv3 for ARMv7 based CPU?

> +
> +    Status: Supported, not security supported
> +
>  ## Guest Type
> 
>  ### x86/PV
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847..7c3c6eb3bd 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -41,7 +41,7 @@ config ARM_EFI
> 
>  config GICV3
>         bool "GICv3 driver"
> -       depends on ARM_64 && !NEW_VGIC
> +       depends on !NEW_VGIC
>         default y
>         ---help---
> 
> @@ -50,7 +50,7 @@ config GICV3
> 
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
> -        depends on GICV3 && !NEW_VGIC
> +        depends on GICV3 && !NEW_VGIC && !ARM_32
> 
>  config HVM
>          def_bool y
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index c86a2e7f29..c62cf6293f 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -33,6 +33,7 @@
>  #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
> 
>  #ifdef CONFIG_ARM_32
> +#define cpu_has_gicv3     (boot_cpu_feature32(gic) >= 1)
What is the purpose of defining this macro if it is not used?

>  #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
>  /*
>   * On Armv7, the value 0 is used to indicate that PMUv2 is not
> --
> 2.17.1
> 
> 
~Michal

