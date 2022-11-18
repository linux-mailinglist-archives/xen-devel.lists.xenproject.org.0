Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6E62F53D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445714.701029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0iT-0007lD-IZ; Fri, 18 Nov 2022 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445714.701029; Fri, 18 Nov 2022 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0iT-0007iY-Ft; Fri, 18 Nov 2022 12:43:33 +0000
Received: by outflank-mailman (input) for mailman id 445714;
 Fri, 18 Nov 2022 12:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ow0iR-0007iS-P3
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:43:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c226f3-673e-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 13:43:30 +0100 (CET)
Received: from DM6PR02CA0114.namprd02.prod.outlook.com (2603:10b6:5:1b4::16)
 by IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 12:43:25 +0000
Received: from DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::89) by DM6PR02CA0114.outlook.office365.com
 (2603:10b6:5:1b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 12:43:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT092.mail.protection.outlook.com (10.13.173.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 12:43:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 06:43:12 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 06:43:10 -0600
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
X-Inumbo-ID: 99c226f3-673e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA84QPDRhFSb8ZplyooW0/i0LVGjAiKfwgd5wMtkMOmojQzcf1zYJXl3nsCDK3/v3DdC9G4hRMRrVvzs02ApsYtgQ2GYcOS5MUmIqkuWffyXLe6kzmNOj5yNgI8G5TjDCBFFD8M6pEck9KCxxKfnBfMNHFykEH8b4Z3sIZ76WZkyJut4tTrM3MWPM+zM0KOz49Tf2cnHTe1t4kQBRDJYitiN/hoomi9yBulBwTscd8RMJ/3/+Sq1kRdHZit8CB0hLDROt4VMV/lz56C+U66e9/Zr2LjMEicVuEXKYRS239LxwGeqnkhrgMrsK12n2TGu9nI2JweVvh7ZtwwH6MO4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9rSvhOcXJ6YHnpdkdwryOWPpoPQgOUUVm9FL/XaUVI=;
 b=mX5IAfMxXmGLsxFTpidGJ/GFJuOKXCgS4cizkJ+AugqSQwkswliU4BTDbqnCwvjEu3Q86aWcWWB6NwWFnsRilB4PAlPnDYy0tT5X+ZLxncgyxP8iM8enRjYDlGODDakkfAHhmeVREtx3Dju9pwpfLUtYs69ocHgEzz3cO5hKSRvNqY8+44PjF8CFyH8Zpc5+ptkIEp8bHT+RmEAIZ/yPkwkToRBCRdhlmypypto6GtHm7jPa9W4Ehp83UtSL8q0ShBA8BjapuNJnb5UnP6j0YiZcS4gR/YH4oVR9Zhh2ys0MwsSP2XolGMhh5Sk2GvdPrsY1NXj+O4ZtbCU814KtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9rSvhOcXJ6YHnpdkdwryOWPpoPQgOUUVm9FL/XaUVI=;
 b=D1V03QuRbQDCGyexMNPx+1dT7GOcsrZGIrCBM6mT90bGOnC18TYfjZfDEJ561OTFFQVHGNrwIQz/adK2Jtgo+DZyFDTtW7uMyLJ/bj+owk4T/ilMJgYQP1dVWpu4rcomHNxUsNf3PhBKTiU4SfFCCVqg4hMoEARBgzzaV0LSLj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c9c61a75-ad03-472e-bb9c-b68d8442e085@amd.com>
Date: Fri, 18 Nov 2022 13:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 09/12] xen/Arm: GICv3: Define remaining GIC registers for
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-10-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT092:EE_|IA1PR12MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e00f03-55ee-44b5-e478-08dac9627c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U07NjOx9YP6c+l/iZKPQCmfemTDelcMEDU11w0NWxmDT/532KOM8N9i62/e+CeZjRFPZswxyTcOwLqgNHli8GfTvTzdul1i9oN4bT9yGL2IXPWuB9CDbW54/nYoXO/H7nsOVgNavZBHciRZ4cJ1aUGqA9LiY74EYBRHy9KFSmAeTHQL8llJXAsd6BqxPa619bty9yBluJU3q850h/tDqd2UJVWnEZklyArybiOyuvwCU+PX6oPEK+/EP6qVDeJZmgq+soTjNSc3lo2+qVo19/3Aa+rJ2DybDqm8QXLOfqdvTwpoEPUOxqswZ8w5cMekzc7izktD8Pht2vhKzOdsrThiAcYsa79fP1riSjuM6MOGWqsB/T4PrfSS+Vsk53WJFkK64G5qWXIA58970POwwCKxTHsyaolef3wbWbr1GoWv0SUVRfpO2wD4xE09Cb9dSIJCHKZw07SF2V8P5wJqcSrk092BoOxHSzDhs1kWC5CYFYJYlYGp1UGiTVxR9SpgjelHkKak3pJYkFQUy6uDN8YN+lf9/OuZQZW1POaUKUKVgkeQpJTOLiKPVCaUmQNn5O44OkovM20Wyjox+w6oe/R8ogRg00iPXD6F497imbRFGCFLrFFj6evzXYXLrMfpsWHCeyC/7UgXxBIl0t86dYEvxRfZN6fqw1MdGZEkqB1zIFu2j+8FY1+LX0lQ5n8VO7E1O+UXdHaL40tOcHxB9KBkjXFG2KDDqGUEXlO08JH1R35EkejsLk8V1MzWZJAsyiMnLUp4ebEDLMLE8YkMyEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(54906003)(110136005)(31686004)(53546011)(44832011)(26005)(316002)(478600001)(70586007)(8676002)(4326008)(41300700001)(2616005)(70206006)(186003)(47076005)(8936002)(336012)(426003)(2906002)(5660300002)(83380400001)(36860700001)(86362001)(36756003)(31696002)(40480700001)(82310400005)(16576012)(40460700003)(356005)(82740400003)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:43:25.0500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e00f03-55ee-44b5-e478-08dac9627c08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7591

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> Define missing assembly aliases for GIC registers on arm32, taking the ones
> defined already for arm64 as a base. Aliases are defined according to the
> GIC Architecture Specification ARM IHI 0069H.
> 
> Defined the following registers:-
> 1. Interrupt Controller Interrupt Priority Mask Register
> 2. Interrupt Controller System Register Enable register
> 3. Interrupt Controller Deactivate Interrupt Register
> 4. Interrupt Controller End Of Interrupt Register 1
> 5. Interrupt Controller Interrupt Acknowledge Register 1
> 6. Interrupt Controller Binary Point Register 1
> 7. Interrupt Controller Control Register
> 8. Interrupt Controller Interrupt Group 1 Enable register
> 9. Interrupt Controller Maintenance Interrupt State Register
> 10. Interrupt Controller End of Interrupt Status Register
> 11. Interrupt Controller Empty List Register Status Register
> 12. Interrupt Controller Virtual Machine Control Register
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Moved coproc regs definition to asm/cpregs.h
> 
> v2 - 1. Defined register alias.
> 2. Style issues.
> 3. Defined ELSR, MISR, EISR to make it consistent with AArch64.
> 
>  xen/arch/arm/include/asm/cpregs.h | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 5331ec3448..0fc606fe99 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -161,6 +161,7 @@
>  #define DACR            p15,0,c3,c0,0   /* Domain Access Control Register */
>  
>  /* CP15 CR4: */
> +#define ICC_PMR         p15,0,c4,c6,0   /* Interrupt Priority Mask Register */
>  
>  /* CP15 CR5: Fault Status Registers */
>  #define DFSR            p15,0,c5,c0,0   /* Data Fault Status Register */
> @@ -254,6 +255,8 @@
>  
>  /* CP15 CR12:  */
>  #define ICC_SGI1R       p15,0,c12       /* Interrupt Controller SGI Group 1 */
> +#define ICC_DIR         p15,0,c12,c11,1 /* Interrupt Controller Deactivate Interrupt Register */
> +#define ICC_SRE_L1      p15,0,c12,c12,5 /* Interrupt Controller System Register Enable register */
There is no such register. It should be ICC_SRE.
Also it looks like these are not placed in the correct order. ICC_SRE with its assembly alias should be placed...

>  #define ICC_ASGI1R      p15,1,c12       /* Interrupt Controller Alias SGI Group 1 Register */
>  #define ICC_SGI0R       p15,2,c12       /* Interrupt Controller SGI Group 0 */
>  #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
> @@ -279,6 +282,19 @@
>  #define ICH_AP1R2       __AP1Rx(2)
>  #define ICH_AP1R3       __AP1Rx(3)
>  
> +#define ICC_IAR1        p15,0,c12,c12,0  /* Interrupt Controller Interrupt Acknowledge Register 1 */
> +#define ICC_EOIR1       p15,0,c12,c12,1  /* Interrupt Controller End Of Interrupt Register 1 */
> +#define ICC_BPR1        p15,0,c12,c12,3  /* Interrupt Controller Binary Point Register 1 */
> +#define ICC_CTLR        p15,0,c12,c12,4  /* Interrupt Controller Control Register */
here...
> +#define ICC_IGRPEN1     p15,0,c12,c12,7  /* Interrupt Controller Interrupt Group 1 Enable register */
> +#define ICC_SRE         p15,4,c12,c9,5   /* Interrupt Controller Hyp System Register Enable register */
This one should be ICC_HSRE.

> +#define ICH_HCR         p15,4,c12,c11,0  /* Interrupt Controller Hyp Control Register */
> +#define ICH_VTR         p15,4,c12,c11,1  /* Interrupt Controller VGIC Type Register */
> +#define ICH_MISR        p15,4,c12,c11,2  /* Interrupt Controller Maintenance Interrupt State Register */
> +#define ICH_EISR        p15,4,c12,c11,3  /* Interrupt Controller End of Interrupt Status Register */
> +#define ICH_ELRSR       p15,4,c12,c11,5  /* Interrupt Controller Empty List Register Status Register */
> +#define ICH_VMCR        p15,4,c12,c11,7  /* Interrupt Controller Virtual Machine Control Register */
> +
>  /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
>  #define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
>  #define __LR0(x)                  ___CP32(p15, 4, c12, c12, x)
> @@ -380,6 +396,15 @@
>  #define HCR_EL2                 HCR
>  #define HPFAR_EL2               HPFAR
>  #define HSTR_EL2                HSTR
> +#define ICC_BPR1_EL1            ICC_BPR1
> +#define ICC_CTLR_EL1            ICC_CTLR
> +#define ICC_DIR_EL1             ICC_DIR
> +#define ICC_EOIR1_EL1           ICC_EOIR1
> +#define ICC_IGRPEN1_EL1         ICC_IGRPEN1
> +#define ICC_PMR_EL1             ICC_PMR
> +#define ICC_SGI1R_EL1           ICC_SGI1R
> +#define ICC_SRE_EL1             ICC_SRE_L1
This should be:
#define ICC_SRE_EL1 ICC_SRE

> +#define ICC_SRE_EL2             ICC_SRE
This should be:
#define ICC_SRE_EL2 ICC_HSRE

>  #define ICH_AP0R0_EL2           ICH_AP0R0
>  #define ICH_AP0R1_EL2           ICH_AP0R1
>  #define ICH_AP0R2_EL2           ICH_AP0R2
> @@ -388,6 +413,10 @@
>  #define ICH_AP1R1_EL2           ICH_AP1R1
>  #define ICH_AP1R2_EL2           ICH_AP1R2
>  #define ICH_AP1R3_EL2           ICH_AP1R3
> +#define ICH_EISR_EL2            ICH_EISR
> +#define ICH_ELRSR_EL2           ICH_ELRSR
> +#define ICH_HCR_EL2             ICH_HCR
> +#define ICC_IAR1_EL1            ICC_IAR1
>  #define ICH_LR0_EL2             ICH_LR0
>  #define ICH_LR1_EL2             ICH_LR1
>  #define ICH_LR2_EL2             ICH_LR2
> @@ -420,6 +449,9 @@
>  #define ICH_LRC13_EL2           ICH_LRC13
>  #define ICH_LRC14_EL2           ICH_LRC14
>  #define ICH_LRC15_EL2           ICH_LRC15
> +#define ICH_MISR_EL2            ICH_MISR
> +#define ICH_VMCR_EL2            ICH_VMCR
> +#define ICH_VTR_EL2             ICH_VTR
>  #define ID_AFR0_EL1             ID_AFR0
>  #define ID_DFR0_EL1             ID_DFR0
>  #define ID_DFR1_EL1             ID_DFR1

~Michal

