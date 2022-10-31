Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941A613CA2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 18:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433127.686029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opYyq-00036G-Pp; Mon, 31 Oct 2022 17:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433127.686029; Mon, 31 Oct 2022 17:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opYyq-00034U-Lm; Mon, 31 Oct 2022 17:53:48 +0000
Received: by outflank-mailman (input) for mailman id 433127;
 Mon, 31 Oct 2022 17:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oXMc=3A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1opYyp-00034O-Pq
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 17:53:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a6e2ad-5944-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 18:53:46 +0100 (CET)
Received: from DM6PR13CA0062.namprd13.prod.outlook.com (2603:10b6:5:134::39)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 31 Oct
 2022 17:53:42 +0000
Received: from DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::28) by DM6PR13CA0062.outlook.office365.com
 (2603:10b6:5:134::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.17 via Frontend
 Transport; Mon, 31 Oct 2022 17:53:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT095.mail.protection.outlook.com (10.13.172.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 17:53:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 12:53:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 12:53:41 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 31 Oct 2022 12:53:39 -0500
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
X-Inumbo-ID: f6a6e2ad-5944-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5W4YF8XpmelV2FPGxf3JsP/DZFwUamDOJsLcy6mwjZh3UxUc/JchJwVMb72V6SZRMpi6JeDs67wqYsinriGvkDQsC3dyp+eJ9Mb9r6ctOsD+myeP29qe3HLqJkgfnyXUCynCnHlDadlLAlQr/z3Dnm6sa9qLon/DfFYxtJbGvgIJJtk3CFam9zqiPeZWjlssiBsysgwWE7i0mDIvOAXlBXhGF35J4yc6fsOBKt3gyu0P1Okqd9Kmnfgh2pBOpzeA3uNw0gKYI2lnrmm2/MtyAf4Y4CT8GmkVQvrSuyDP3B+/MX8v91Sf1MbTo/LeewRPtCPg7wLCLMevq19ywZYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lI9apOohtOYRNkGrKmwMe+hAxa4ro9RQPnCUNlVOww=;
 b=fldVU1/8O0hh0+wo3mfCRS1yhmNdi0D1N92tm4JJ0gc0kh7hl8UjH5GUmoghW3k+gO+oa3Gok7SM65DW4ECXgyynXgRGDP4yBQNUxC+Cpv6BA3sF4gvHLf2EtDwhsVzq07nEUJfUbzGpLNaDNVxzvwxqjR3xkDoRhtWPXwC/99q54YF34FVyJkNZ03aqG81+IED+vX0ysPZGhhdbGqpLVFb4nMJBLssSGZn60+et+Hs3nIWMO8KHdNl//pHMHqtZP/iuomiL9UM4IOLkvQRC8x7U5Klv6iEUJ9Z+HX+Muf0yqeNK2V59jrD0R0aEnv602uj3K9LXuOVgHGJ4ZXeU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lI9apOohtOYRNkGrKmwMe+hAxa4ro9RQPnCUNlVOww=;
 b=PWle0RkC6wptcy0xwtxl7M6BxB0sLMnVlTxFlfiVV+KKSuCIfe3HwJARouH8FwP2ZN+jvWmJUbn6YuBrv0qhjD+SqtzjdVRVuvhpIxl/rA/Del7tb8DJUPWmLT7CJIit9vVCZYiHPSiiqaWLWj2KInJ37Y3C4cKKcS2kRsWTWGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4271ac3e-04bf-7bbb-2db9-3216ac19e778@amd.com>
Date: Mon, 31 Oct 2022 18:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-3-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT095:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b0290c-8584-4075-f5b3-08dabb68d911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gmjyEmvOxRGeUrZPLSqhDjFBeI0k6gmWEhTqdEF2g24bFlGaob7YJUrSvDDQpEs3ePE1sM1t6eE03hgQqLor4RfnRd74RC1b+jyApFQDPr0lFiPbpDksbGdQBCMvVkkC1+C9ArGc2KBc4QizI1h3kPi4vql4C5O3OHoBoKVF+vmgC81/tPDPpltUA5QMSA0YMP0kf2NUCes3gjzeL7EKWHHD2f0o5fJVEzwZdnbydtYOlvSRGQdUr/EN7mYUJT/6qniA6YnS+Xg9Bkj5zcQpderTuD1kqFmFQhqUqBqSqpGaZa2j/K5bwolvOo4pJoct2LN3CXu0hi1KBVIctAc+toXFYoewOp8RbI7hyCOS7wns7H62o0sch1s6HU/QhkgLaBnLCNthC3zwknFvNelkWKd6pHjXgsXawO5Aqhxu1oo8OZOuSknFbH4N55tFmP9vDy1Pzky0Tt/V2ZmFOj2P7/YnbsXtGNmY4TTx16jM2b8hQ4ueSdfkwTxsBkjV2Cqi9Kyfx98nfoeYClZsMZohLdIrDEXQzQytnaSnNnX1GM/ylyiDELRkkTSwKFq3yscDrFAOlPm8pBR7svWLoiAPQryAJOETPyBwBsDaWEY4Brl5zcR4t8B20iUVtjhD6ZVNN9x9+jQzhfMB85KsAqLUxPiJf1FvCgJ3Qfn/EevxxRDWdYwkBDbZ6HCvtOt3dtVmHHEqUKuX2/N0XWR9R5QFrZ6BpR1sgACvAHHI0D4sG9BgoJyB5LgP6yiaLnyohVX4MOsKqX53XmnBmHPO8Th5aPrjtWfgO4gl3awFCGdHfRytZnPXQuS4zEwd4xrHpPfRBQJu7C3SXQhV5B28bjsgckIHY3NRQjHmYIJlEx4/VeR2x221n7A3uNIgfeTqbqFY2JlDX/dIZtmgsxJzCxr9Xw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(70586007)(70206006)(40480700001)(966005)(54906003)(2616005)(356005)(8676002)(36860700001)(81166007)(110136005)(41300700001)(186003)(82740400003)(36756003)(478600001)(336012)(316002)(26005)(83380400001)(31696002)(426003)(4326008)(53546011)(16576012)(86362001)(40460700003)(47076005)(31686004)(2906002)(8936002)(82310400005)(44832011)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 17:53:41.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b0290c-8584-4075-f5b3-08dabb68d911
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
You should not split the link as it is becoming unusable in that form.

> include/asm/cputype.h#L14 , for the macros specific for arm64.
> 
> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
Same here.

> asm/cputype.h#L54  , for the macros specific for arm32.
> 
> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit.
> For 64 bit :-
> 
>  aff_lev3          aff_lev2 aff_lev1 aff_lev0
> |________|________|________|________|________|
> 40       32       24       16       8        0
> 
> For 32 bit :-
> 
>  aff_lev3 aff_lev2 aff_lev1 aff_lev0
> |________|________|________|________|
> 32       24       16       8        0
> 

Where did you get this info from?
FWICS by looking at ARM ARM DDI 0487I.a D17-6118,
"Aff3 is not supported in AArch32 state."


> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Rearranged the macro defines so that the common code (between arm32
> and arm64) is placed in "arm/include/asm/processor.h".
> 
>  xen/arch/arm/include/asm/arm32/processor.h | 5 +++++
>  xen/arch/arm/include/asm/arm64/processor.h | 8 ++++++++
>  xen/arch/arm/include/asm/processor.h       | 6 ------
>  3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
> index 4e679f3273..82aa7f8d9d 100644
> --- a/xen/arch/arm/include/asm/arm32/processor.h
> +++ b/xen/arch/arm/include/asm/arm32/processor.h
> @@ -56,6 +56,11 @@ struct cpu_user_regs
>      uint32_t pad1; /* Doubleword-align the user half of the frame */
>  };
> 
> +/*
> + * Macros to extract affinity level. Picked from kernel
> + */
No need for a multiline comment here and everywhere else.

> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * (level))
> +
>  #endif
> 
>  #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
> diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
> index c749f80ad9..295483a9dd 100644
> --- a/xen/arch/arm/include/asm/arm64/processor.h
> +++ b/xen/arch/arm/include/asm/arm64/processor.h
> @@ -84,6 +84,14 @@ struct cpu_user_regs
>      uint64_t sp_el1, elr_el1;
>  };
> 
> +/*
> + * Macros to extract affinity level. picked from kernel
> + */
> +#define MPIDR_LEVEL_BITS_SHIFT  3
> +
> +#define MPIDR_LEVEL_SHIFT(level) \
> +         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
> +
You should move these macros below __DECL_REG as they do not require having it defined.

>  #undef __DECL_REG
> 
>  #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 1dd81d7d52..ecfb62bbbe 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -122,13 +122,7 @@
>  /*
>   * Macros to extract affinity level. picked from kernel
>   */
> -
> -#define MPIDR_LEVEL_BITS_SHIFT  3
>  #define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
> -
> -#define MPIDR_LEVEL_SHIFT(level) \
> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
> -
>  #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>           (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
> 
> --
> 2.17.1
> 
> 

~Michal

