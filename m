Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD762F4A2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445674.700953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0SS-0001Vx-F4; Fri, 18 Nov 2022 12:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445674.700953; Fri, 18 Nov 2022 12:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0SS-0001TT-BF; Fri, 18 Nov 2022 12:27:00 +0000
Received: by outflank-mailman (input) for mailman id 445674;
 Fri, 18 Nov 2022 12:26:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ow0SR-0001TN-KR
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:26:59 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a8a663c-673c-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 13:26:57 +0100 (CET)
Received: from MW4PR04CA0134.namprd04.prod.outlook.com (2603:10b6:303:84::19)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 12:26:54 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::4b) by MW4PR04CA0134.outlook.office365.com
 (2603:10b6:303:84::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 12:26:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 12:26:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 06:26:51 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 06:26:50 -0600
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
X-Inumbo-ID: 4a8a663c-673c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiflTBViyqM7MYFr/uyW2XbypgNtVxMpDbZEQSkCxNIA+kIwsjPVGpB/RKrAUJSBwYgtMKYiPP0CDaqbttShUUebBByNjtb7QTwBtxHudoCPPkySbEHQlMC+ynQPJo7GGNeJ27PGlO0hG0EhWqSp/P6uzF9iKV93GApZvl/oNJiC//AjmAT0CVLUr/XynJELLMMsW+LbHJW7UIU/G4TLtRoLQdsfMnSSuwOiW3xlnW2nz9sD4cu+yuowGC9n6+ZNjI1j8/TYkkbP5IIF1sMdNiUDkXATv/FGXh6yrkKc78DB9pBLt/X8jcGSGoaXAHGOolS9gdw5/NucdQX3BiM5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f38sHVwwDBo2274oknHPzAXruJunsQYCI4+9TLMWY38=;
 b=igLrgvcBe9iB/A+9qniZtN1idUfrgVHuaGxqNBoJEjgFsC2/pN0tAyVlwErVp5Lx+TQk6M5guBe7LkvOf6PVBXqnWVepasZnHy5UYdRhe42aBX94bs/PYAkl9rLaBBYtCbcrIfpC+Z1wa5a5nXPs/mQh8yhflvF2Su45995nNQFknqlqHOapcfrf9HsJ5bW/+Ha9vWEURxPaImBtnpKB0ugq4SmdccHVsRyUCLybHHztBUZFSPuPvd5Mn0lyq+Jb6tgUmY+/Wm7+VXMkxuegPmJAnxHlrXgKSDX8kmPBy7nP/75nV4D0wyRYRlblTYoDCOSHs3BIBJFcOlpAVL4HoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f38sHVwwDBo2274oknHPzAXruJunsQYCI4+9TLMWY38=;
 b=DCjVqhwdPMif/abwTT5hVTvhOQQ/+HhsIKPNPOIKCiwSgkqjidx1a0MFjijcfBdG6B3YQLUO1F6HbFRM5bDAmx9f2q8IsBx6XWH/coLZyUoIiyjxn86sppr2kXnMxTW/4lSRgol/MQ79s0Oux4fqM3ipX8dflG9d7fVaoBCyrQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4c9d45a3-1bfc-3f4a-de37-2c3a894439f8@amd.com>
Date: Fri, 18 Nov 2022 13:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 08/12] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n>
 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-9-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 6152a1a9-0616-4924-9b1d-08dac9602d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kYM91TVkVZrg6dGMrM4n6ecmCgnYRC2fm0/gjjKe/CqOdZX6SsUMHVKgky4rBJ50oxecAEG7dmiUfTNkaWDHKp3DVj6Dw3w8VWB+jnuB4iS3DWivoSWOI+EjoTjDTq7/s7sMYrlby5rc8D6VoScZBDkE3Gpsv+/oCnqv63wYnKkFFFyxNHYOIzkHEp4Rzj7+xPZKrwaEAMIa8a9qPtQlV6iDZPqG3jzbv3FplHWZFjUnUAquKtQGVzHjV1bZLuHzcVJnFt16F8yvzQnR1JbCsg87xDhAUnjSnBwr8+DsEtjKV/gDzZXFliIj/UaytRrQsBnoQUA4hEEyW/dCfLmor+5ghPfFYGvhb6niYKngPIipYnX+RoTrAITXx25cQqdkEI0A+RLI7OCBpZWranFqhC619gqLlwYNSmlATtmhSAtraM3n3QXxCHBhk6rjbhQZJHFDbQlk8BbS9kbUCOt74SCoWKnZ/TDSabvKPGmLE42gMJ3enIwBK1oYgWsd5dVIVB6J+cSXuwgeIQ30N85eMBj2ov8TR79ufa7nJTFRYGohBOZbI/pe/Be0F/bnPcuBc6RLcaXjUdtz3i2MPehnerIPdqfyqEIz7ABfdZRPX0qJx9bldYLQ2o0FZW1X3qeIF4h9S9h6uGVgP3a7O64ypcTpm49ZbmiddPiIv1dhYF/FjZS8HWTToJdGzz0cpEbJgbyaYXvCG+rIfiaDhiNL00fZwX5YLl4VlaQ68+GVqk0Go+79ftAta80XsrY/GsQ/a3aVsqCFwu2tMmzCp6KnTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(81166007)(70586007)(356005)(82740400003)(2906002)(4326008)(8936002)(40480700001)(86362001)(36860700001)(31696002)(83380400001)(316002)(8676002)(426003)(54906003)(336012)(186003)(2616005)(36756003)(16576012)(47076005)(478600001)(5660300002)(110136005)(26005)(44832011)(41300700001)(82310400005)(40460700003)(53546011)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:26:53.4537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6152a1a9-0616-4924-9b1d-08dac9602d0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> Adapt save_aprn_regs()/restore_aprn_regs() for AArch32.
> 
> For which we have defined the following registers:-
> 1. Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
> 2. Interrupt Controller Hyp Active Priorities Group1 Registers 0-3
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Moved coproc register definition to asm/cpregs.h.
> 
> v2 - 1. Defined register alias.
> 2. Style issues.
> 3. Dropped R-b and Ack.
> 
>  xen/arch/arm/include/asm/cpregs.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 242dabaea8..5331ec3448 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -259,6 +259,26 @@
>  #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
>  #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
>  
> +/*
> + * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 0 Registers,
> + * n = 0 - 3
> + */
> +#define __AP0Rx(x)      ___CP32(p15, 4, c12, c8, x)
You are using a macro ___CP32 here but it is defined somewhere down the file.
So I think you need to make a change so that the definition appears before use.

> +#define ICH_AP0R0       __AP0Rx(0)
> +#define ICH_AP0R1       __AP0Rx(1)
> +#define ICH_AP0R2       __AP0Rx(2)
> +#define ICH_AP0R3       __AP0Rx(3)
> +
> +/*
> + * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 1 Registers,
> + * n = 0 - 3
> + */
> +#define __AP1Rx(x)      ___CP32(p15, 4, c12, c9, x)
> +#define ICH_AP1R0       __AP1Rx(0)
> +#define ICH_AP1R1       __AP1Rx(1)
> +#define ICH_AP1R2       __AP1Rx(2)
> +#define ICH_AP1R3       __AP1Rx(3)
> +
>  /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
>  #define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
>  #define __LR0(x)                  ___CP32(p15, 4, c12, c12, x)
> @@ -360,6 +380,14 @@
>  #define HCR_EL2                 HCR
>  #define HPFAR_EL2               HPFAR
>  #define HSTR_EL2                HSTR
> +#define ICH_AP0R0_EL2           ICH_AP0R0
> +#define ICH_AP0R1_EL2           ICH_AP0R1
> +#define ICH_AP0R2_EL2           ICH_AP0R2
> +#define ICH_AP0R3_EL2           ICH_AP0R3
> +#define ICH_AP1R0_EL2           ICH_AP1R0
> +#define ICH_AP1R1_EL2           ICH_AP1R1
> +#define ICH_AP1R2_EL2           ICH_AP1R2
> +#define ICH_AP1R3_EL2           ICH_AP1R3
>  #define ICH_LR0_EL2             ICH_LR0
>  #define ICH_LR1_EL2             ICH_LR1
>  #define ICH_LR2_EL2             ICH_LR2

~Michal

