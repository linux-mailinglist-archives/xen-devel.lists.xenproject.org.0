Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C563C33D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:58:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449466.706227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p023I-0002Gt-Lj; Tue, 29 Nov 2022 14:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449466.706227; Tue, 29 Nov 2022 14:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p023I-0002EO-Im; Tue, 29 Nov 2022 14:57:40 +0000
Received: by outflank-mailman (input) for mailman id 449466;
 Tue, 29 Nov 2022 14:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBYr=35=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p023G-0002EH-FU
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:57:38 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ef19ea-6ff6-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 15:57:36 +0100 (CET)
Received: from BN0PR04CA0193.namprd04.prod.outlook.com (2603:10b6:408:e9::18)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 14:57:31 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::5c) by BN0PR04CA0193.outlook.office365.com
 (2603:10b6:408:e9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Tue, 29 Nov 2022 14:57:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Tue, 29 Nov 2022 14:57:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 08:57:31 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 29 Nov 2022 08:57:29 -0600
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
X-Inumbo-ID: 28ef19ea-6ff6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct89+vPn8YHn/Z+rysW82mxplGST0r1QHX8DeCE+1P5aQizUM1GycXrx6JQXiBaAqVVk4KxsYHz4/ludiPEDG2R7/ozmYChYbhC/BskPUlufQvOmIudVZYg/nBVKpFij+YGYIRsOB9nOqm3olLG2Pr5qTFhwS0x+GZcWf6CIpSClYeosgBxhlUVmPMEG97d2UY3vn5mNM3gXt58sMRxA5JcY3/mtOim+t0afoFGQlonOwVyNiR8iw+eG1PlNzFH2o0RLZWj7POh6G8KMxAYrD5JOtlWyvckcQsJroYzCyL8pAIG8FJZXfBMl90qch2J/Tr6+YVd2T1/9LWJVFzUV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQkHAGdo28qgEpOGbopxtEjLtVwwj8O3SB9N5LuZrpg=;
 b=m0CbcmdZwmnvWfi4E5TzEnFT4zTyQpvHacANu/uNtLykikwN9IzoIy9JDkmh0mv8NW9hv+sI4/lN+CMMpk0DO7U30ySIcfj2/5LOJvmG8fwShqu8nNOTUbL0nkWjfC6ifr0MGF0UKy4yUPafnbJCgN74jhmkvnMppjzWpwsePUN47nEXpuf1xztjYXTMue9XIwgLhh1ujGJnNArsDo8rWZWrHNpS679MM63No6KRdON6ufqGzVgzmLlfw9pzLw9q6GMbifB2SCARPlbeQHZQinR/DKvXKETSeHdrJ72bYxWyJ3R4qDYCAB1a0kV5GV5FLdoweKZs0vFRLoKlHsWb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQkHAGdo28qgEpOGbopxtEjLtVwwj8O3SB9N5LuZrpg=;
 b=Be0Ya+3yoWD4pE4krUC7gG9PnLj+OGgma2HOTwmRXxCxZqGtim33ndRPzxlHOeVj/b2qO7JRr2lYBcidOD4h+EBSsEt7stkD7gVfDkj8eh0IXIvxzOGpqSH8c0qRjS8N8HvcjmamKUVD7kyHrdlCG0yLjxQOs1w5O4TmBvrapro=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4009fec8-4bd7-afe5-49d5-89deb4d132c4@amd.com>
Date: Tue, 29 Nov 2022 15:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v4 09/11] xen/Arm: GICv3: Define remaining GIC registers for
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-10-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221128155649.31386-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT030:EE_|BL1PR12MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aab5040-9e98-4972-9a51-08dad21a0aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YzKh/weJG0LhS8sdujZy5PQWwG1gyH264kILu4gBvcIIn1naX6zE18/88lrbgA4lbbYYnVEA11gqc597i0e5CCLM1s25Hc/udn6ZQJj5zGa4IU0JUuWA6z/CL6i0i3IY70ZGT3E4CcV1TpWnBVB+Fyo6ILUuv8W97WEXNEU3ia57QIxX76I4cvHisraBt/vI00CWdK71wZh6Y5P529EWfDNYa+5KwOPUvEMWNZlpT7SETmli3DAFEPU5KqHI41IVFf08OMTOSsFgl/3lCPfGk/gbzEAlIpY4c2naNrAmHA6Sbs2oWg6LEvGSdzvhOf3SGDfizgv2vf2gkHHGvqKCQD9u+ytpTEsCCarsX6qtwl06N/sec/pFrcScsA9O+4cX5FFbBrUPG79Emd3QSXDxsPhjQLa3Tl0THckj3uTXh3bJ5KAAYxaxNsOwtmY5/ZvstJ4JJAvK4MJZZqdNbfzpqx+fJg/IPxIPiOGuyoEg8nD2ux30aoIsOMTdWBZ5KPGDjDWn3ITeHzP/E8s1lukcW+nQoGxRrgOUY4ykw9HAdvqdkl8U5TjFYvARYqGrdSNbpCpjFb9fpShEKTPNNjvBoAV+2X9khxTYa6mGRb/1im9XjUOQC7kB6TbpmcT4NS3juANIqPuCg0eLX/NiZ2bKhNCs9i7J4KkWbPVUEosBbEqLHAxaWZvGNTOq9uKR+6wfWj6mLHvxkqalEq1WT7PF3xlQI7c/tHOvXuYS9lU6xz6m73JEneufSB1dIgRZ8Qh3DkeKQ45HkVemHTTkuKb/nQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(44832011)(31686004)(4326008)(8676002)(8936002)(41300700001)(110136005)(40460700003)(81166007)(356005)(54906003)(2906002)(70586007)(70206006)(16576012)(316002)(478600001)(36756003)(336012)(86362001)(31696002)(53546011)(26005)(186003)(2616005)(36860700001)(83380400001)(82310400005)(426003)(82740400003)(47076005)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:57:31.5288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aab5040-9e98-4972-9a51-08dad21a0aa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349

Hi Ayan,

On 28/11/2022 16:56, Ayan Kumar Halder wrote:
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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
with one remark...

> ---
> 
> Changes from :-
> v1 - 1. Moved coproc regs definition to asm/cpregs.h
> 
> v2 - 1. Defined register alias.
> 2. Style issues.
> 3. Defined ELSR, MISR, EISR to make it consistent with AArch64.
> 
> v3 - 1. Rectified some of the register names.
>  
>  xen/arch/arm/include/asm/cpregs.h | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 53142fc2b2..8f4d097a15 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -163,6 +163,7 @@
>  #define DACR            p15,0,c3,c0,0   /* Domain Access Control Register */
>  
>  /* CP15 CR4: */
> +#define ICC_PMR         p15,0,c4,c6,0   /* Interrupt Priority Mask Register */
>  
>  /* CP15 CR5: Fault Status Registers */
>  #define DFSR            p15,0,c5,c0,0   /* Data Fault Status Register */
> @@ -256,6 +257,7 @@
>  
>  /* CP15 CR12:  */
>  #define ICC_SGI1R       p15,0,c12       /* Interrupt Controller SGI Group 1 */
> +#define ICC_DIR         p15,0,c12,c11,1 /* Interrupt Controller Deactivate Interrupt Register */
Shouldn't ICC_DIR be placed after VBAR?

>  #define ICC_ASGI1R      p15,1,c12       /* Interrupt Controller Alias SGI Group 1 Register */
>  #define ICC_SGI0R       p15,2,c12       /* Interrupt Controller SGI Group 0 */
>  #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
> @@ -281,6 +283,20 @@
>  #define ICH_AP1R2       __AP1Rx(2)
>  #define ICH_AP1R3       __AP1Rx(3)
>  
> +#define ICC_IAR1        p15,0,c12,c12,0  /* Interrupt Controller Interrupt Acknowledge Register 1 */
> +#define ICC_EOIR1       p15,0,c12,c12,1  /* Interrupt Controller End Of Interrupt Register 1 */
> +#define ICC_BPR1        p15,0,c12,c12,3  /* Interrupt Controller Binary Point Register 1 */
> +#define ICC_CTLR        p15,0,c12,c12,4  /* Interrupt Controller Control Register */
> +#define ICC_SRE         p15,0,c12,c12,5  /* Interrupt Controller System Register Enable register */
> +#define ICC_IGRPEN1     p15,0,c12,c12,7  /* Interrupt Controller Interrupt Group 1 Enable register */
> +#define ICC_HSRE        p15,4,c12,c9,5   /* Interrupt Controller Hyp System Register Enable register */
> +#define ICH_HCR         p15,4,c12,c11,0  /* Interrupt Controller Hyp Control Register */
> +#define ICH_VTR         p15,4,c12,c11,1  /* Interrupt Controller VGIC Type Register */
> +#define ICH_MISR        p15,4,c12,c11,2  /* Interrupt Controller Maintenance Interrupt State Register */
> +#define ICH_EISR        p15,4,c12,c11,3  /* Interrupt Controller End of Interrupt Status Register */
> +#define ICH_ELRSR       p15,4,c12,c11,5  /* Interrupt Controller Empty List Register Status Register */
> +#define ICH_VMCR        p15,4,c12,c11,7  /* Interrupt Controller Virtual Machine Control Register */
> +
>  /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
>  #define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
>  #define __LR8(x)        ___CP32(p15, 4, c12, c13, x)
> @@ -381,6 +397,15 @@
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
> +#define ICC_SRE_EL1             ICC_SRE
> +#define ICC_SRE_EL2             ICC_HSRE
>  #define ICH_AP0R0_EL2           ICH_AP0R0
>  #define ICH_AP0R1_EL2           ICH_AP0R1
>  #define ICH_AP0R2_EL2           ICH_AP0R2
> @@ -389,6 +414,10 @@
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
> @@ -421,6 +450,9 @@
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

