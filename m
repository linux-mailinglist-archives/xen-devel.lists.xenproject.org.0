Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B262F241
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445534.700733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovyN2-0000k0-5J; Fri, 18 Nov 2022 10:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445534.700733; Fri, 18 Nov 2022 10:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovyN2-0000gg-1u; Fri, 18 Nov 2022 10:13:16 +0000
Received: by outflank-mailman (input) for mailman id 445534;
 Fri, 18 Nov 2022 10:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovyN0-0000ga-BC
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:13:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96739a35-6729-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 11:13:03 +0100 (CET)
Received: from DS7PR06CA0009.namprd06.prod.outlook.com (2603:10b6:8:2a::28) by
 CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Fri, 18 Nov 2022 10:13:08 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::cb) by DS7PR06CA0009.outlook.office365.com
 (2603:10b6:8:2a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 10:13:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:13:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 04:13:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 04:13:07 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 04:13:05 -0600
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
X-Inumbo-ID: 96739a35-6729-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0POlbBdLHSua6ADdJLVyrLI2lFzBzhArj4ZC0aYp5vQ9vJ8KFT+JYm/dBan/Bv1BviN+hztGjBQAAfCLOtVGRycuYOj0A8+hGOGsRrL56gAiSCItc+M2wwPg0aqU5RozEk3BzLikrkA3Ew/TM19pu8ad6F/dtIrVrqkikSB2eqzHzihqQqItVOEwh+T+KA5JxDCaMphqielq5d4k31CAsWdfCi5X0PpBfL6dnLmQe/+16XT4lWi9js8C5JYuitgkYIxhGA3X3TUee4jjAJuid1qjtZAi0TeQpaouBSwkLbg43a0OgFSq7GnO//y+4MMgt5GsqekiUfdWBnFJpN+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvkDk37POQCRMuwcqA2E8cEKwVKsCsBW7vme/lhT5hA=;
 b=Y2k+RRu29gFhIAUgfPajCcfbJY+Ij4ftEUjnL+borAJ4vcVC1tLUsU0GE1Tv2dpZBBE1SmEnxAKll5IWAHO0sg0tX07X+jhz6f6ePaOoK1OxarM0N+l+fTnHHfsx5e1ajRPKiH5cu35vpqW54lNoVfbv72AuTU7gdEUN4li4JGOP7o1fWHwIKKYtX7eefbAIHuTnmNW6kzUidhM5Go/9jvRYaR6+slqbJJdvRwUSNohayb7QTfUu3mKlAyNWO1RkOqNQaYD05y9+diH8ZC9vpiEyFXVDwa3mom781hQLVWjfdmGR5BTw1+dslkmRcpgIkY5YleW4Hbbm5hsodJI47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvkDk37POQCRMuwcqA2E8cEKwVKsCsBW7vme/lhT5hA=;
 b=p2HYL8SwXbtY3vclOEvuybeJ1QZtoh9vTKswncAc2pl+TmkhOp1qXS0MxXKzt8HRxrVQvAL0d0TYRG0Vf6P/I9X9WRnlq7ih6NMCn8TAMVMlBOlRQnYUkhx1tfL1CHiJScshHNiIuNuaxDe7l0JNablww78h23uBYcWa+XBQcxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2ff90b23-519d-7645-9140-9e150e985147@amd.com>
Date: Fri, 18 Nov 2022 11:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 07/12] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-8-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-8-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b86d56-4698-4559-c245-08dac94d7d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b2a/+VvaPqWLyKOOKzdtRPOiT+bx9AHUlOS+y9udL3eNRikLezjkAc1EpLkiVuVgDrdHKlTqCwYHzs+6KEkJ7oAbksFzpPgI2EuBv+0UW7QJ8C9wEMglViKui9KhQFQR/DWDnEWBH1Btpm01PAguFxi4MnYPUrNWtwgNKYCqa9DKQbM7qMyhP0fN6dzQDehDTxKvRPGHv/dZcMS3+EvCLgQKHDntnJwa5bhmRKNvvnxLH4GR3uxJ0y4WQuUEdL+aglCoj7Wbw+5W0md3EPSLX6Xa1OuRunC3P7KBDa9QSWMTsMJkbdeG2TQzJi/sXZyC4lIGBvvELz3Ix2ynX3He0HkWldLUiHlZva2nnlAGBNUb0Hp/riII4iLfddYdEmOo441YPu4CLzA9qsIzAs8SgRYHgGIfGLaiW7b1bNB6fn1S1IOV7W6+4tpihIaVHJrIPU0ySOaGWqVbtvdCSvYMU2PNcVHHzXVwWR0MXncQ0rcS/bXkp2mn5ky3ukYaWlC7BmgtW5UzbmgKiSmFntHvVrZKudOlDbw+QyvDDFdjC4QvBsH9e+pICUmk4WgE/2xdzSbtV0P15xhLSvlPBTmJjGKXsL7CstwoOFVUx1GII9l5Vr3ERBesublFO7jY/dTepdpecw5KfbM7iP8pQfxKhqndJ0JrxAfWt+aozaOP/CvTaJYxcCK/YA/k0AiNo9HimxTWOX03gu8nQV8vK0aL7woq9O1slitf3fLN08LDl11h8GqMz2QV4K9WM2F6EHr7zQl5ifjepS6qMKKyQRnXbA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(478600001)(31686004)(54906003)(41300700001)(70206006)(8676002)(4326008)(2906002)(26005)(70586007)(47076005)(110136005)(2616005)(83380400001)(44832011)(336012)(30864003)(5660300002)(8936002)(426003)(186003)(86362001)(31696002)(36860700001)(316002)(16576012)(356005)(82310400005)(53546011)(81166007)(40480700001)(36756003)(82740400003)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:13:08.2393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b86d56-4698-4559-c245-08dac94d7d98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers
> 
> AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
> mapped to AArch32 System register ICH_LR<n>[31:0].
> AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
> mapped to AArch32 System register ICH_LRC<n>[31:0].
> 
> Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for AArch32.
> For AArch32, the link register is stored as :-
> (((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2
> 
> Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
> AArch64.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Moved the coproc register definitions to asm/cpregs.h.
> 2. Use GENMASK(31, 0) to represent 0xFFFFFFFF
> 3. Use READ_CP32()/WRITE_CP32() instead of READ_SYSREG()/WRITE_SYSREG().
> 4. Multi-line macro definitions should be enclosed within ({ }).
> 
> v2 - 1. Use WRITE_SYSREG_LR(V, R) to make it consistent with before.
> 2. Defined the register alias.
> 3. Style issues.
> 
>  xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
>  xen/arch/arm/include/asm/arm32/sysregs.h |  19 ++++
>  xen/arch/arm/include/asm/arm64/sysregs.h |   4 +
>  xen/arch/arm/include/asm/cpregs.h        |  75 +++++++++++++
>  xen/arch/arm/include/asm/gic_v3_defs.h   |   6 +-
>  5 files changed, 167 insertions(+), 69 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 64a76307dd..4722bb4daf 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -73,37 +73,37 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>      switch ( gicv3_info.nr_lrs )
>      {
>      case 16:
> -        v->arch.gic.v3.lr[15] = READ_SYSREG(ICH_LR15_EL2);
> +        v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
>      case 15:
> -        v->arch.gic.v3.lr[14] = READ_SYSREG(ICH_LR14_EL2);
> +        v->arch.gic.v3.lr[14] = READ_SYSREG_LR(14);
>      case 14:
> -        v->arch.gic.v3.lr[13] = READ_SYSREG(ICH_LR13_EL2);
> +        v->arch.gic.v3.lr[13] = READ_SYSREG_LR(13);
>      case 13:
> -        v->arch.gic.v3.lr[12] = READ_SYSREG(ICH_LR12_EL2);
> +        v->arch.gic.v3.lr[12] = READ_SYSREG_LR(12);
>      case 12:
> -        v->arch.gic.v3.lr[11] = READ_SYSREG(ICH_LR11_EL2);
> +        v->arch.gic.v3.lr[11] = READ_SYSREG_LR(11);
>      case 11:
> -        v->arch.gic.v3.lr[10] = READ_SYSREG(ICH_LR10_EL2);
> +        v->arch.gic.v3.lr[10] = READ_SYSREG_LR(10);
>      case 10:
> -        v->arch.gic.v3.lr[9] = READ_SYSREG(ICH_LR9_EL2);
> +        v->arch.gic.v3.lr[9] = READ_SYSREG_LR(9);
>      case 9:
> -        v->arch.gic.v3.lr[8] = READ_SYSREG(ICH_LR8_EL2);
> +        v->arch.gic.v3.lr[8] = READ_SYSREG_LR(8);
>      case 8:
> -        v->arch.gic.v3.lr[7] = READ_SYSREG(ICH_LR7_EL2);
> +        v->arch.gic.v3.lr[7] = READ_SYSREG_LR(7);
>      case 7:
> -        v->arch.gic.v3.lr[6] = READ_SYSREG(ICH_LR6_EL2);
> +        v->arch.gic.v3.lr[6] = READ_SYSREG_LR(6);
>      case 6:
> -        v->arch.gic.v3.lr[5] = READ_SYSREG(ICH_LR5_EL2);
> +        v->arch.gic.v3.lr[5] = READ_SYSREG_LR(5);
>      case 5:
> -        v->arch.gic.v3.lr[4] = READ_SYSREG(ICH_LR4_EL2);
> +        v->arch.gic.v3.lr[4] = READ_SYSREG_LR(4);
>      case 4:
> -        v->arch.gic.v3.lr[3] = READ_SYSREG(ICH_LR3_EL2);
> +        v->arch.gic.v3.lr[3] = READ_SYSREG_LR(3);
>      case 3:
> -        v->arch.gic.v3.lr[2] = READ_SYSREG(ICH_LR2_EL2);
> +        v->arch.gic.v3.lr[2] = READ_SYSREG_LR(2);
>      case 2:
> -        v->arch.gic.v3.lr[1] = READ_SYSREG(ICH_LR1_EL2);
> +        v->arch.gic.v3.lr[1] = READ_SYSREG_LR(1);
>      case 1:
> -         v->arch.gic.v3.lr[0] = READ_SYSREG(ICH_LR0_EL2);
> +         v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
>           break;
>      default:
>           BUG();
> @@ -120,37 +120,37 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
>      switch ( gicv3_info.nr_lrs )
>      {
>      case 16:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[15], ICH_LR15_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>      case 15:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[14], ICH_LR14_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[14], 14);
>      case 14:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[13], ICH_LR13_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[13], 13);
>      case 13:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[12], ICH_LR12_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[12], 12);
>      case 12:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[11], ICH_LR11_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[11], 11);
>      case 11:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[10], ICH_LR10_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[10], 10);
>      case 10:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[9], ICH_LR9_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[9], 9);
>      case 9:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[8], ICH_LR8_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[8], 8);
>      case 8:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[7], ICH_LR7_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[7], 7);
>      case 7:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[6], ICH_LR6_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[6], 6);
>      case 6:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[5], ICH_LR5_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[5], 5);
>      case 5:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[4], ICH_LR4_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[4], 4);
>      case 4:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[3], ICH_LR3_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[3], 3);
>      case 3:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[2], ICH_LR2_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[2], 2);
>      case 2:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[1], ICH_LR1_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[1], 1);
>      case 1:
> -        WRITE_SYSREG(v->arch.gic.v3.lr[0], ICH_LR0_EL2);
> +        WRITE_SYSREG_LR(v->arch.gic.v3.lr[0], 0);
>          break;
>      default:
>           BUG();
> @@ -161,22 +161,22 @@ static uint64_t gicv3_ich_read_lr(int lr)
>  {
>      switch ( lr )
>      {
> -    case 0: return READ_SYSREG(ICH_LR0_EL2);
> -    case 1: return READ_SYSREG(ICH_LR1_EL2);
> -    case 2: return READ_SYSREG(ICH_LR2_EL2);
> -    case 3: return READ_SYSREG(ICH_LR3_EL2);
> -    case 4: return READ_SYSREG(ICH_LR4_EL2);
> -    case 5: return READ_SYSREG(ICH_LR5_EL2);
> -    case 6: return READ_SYSREG(ICH_LR6_EL2);
> -    case 7: return READ_SYSREG(ICH_LR7_EL2);
> -    case 8: return READ_SYSREG(ICH_LR8_EL2);
> -    case 9: return READ_SYSREG(ICH_LR9_EL2);
> -    case 10: return READ_SYSREG(ICH_LR10_EL2);
> -    case 11: return READ_SYSREG(ICH_LR11_EL2);
> -    case 12: return READ_SYSREG(ICH_LR12_EL2);
> -    case 13: return READ_SYSREG(ICH_LR13_EL2);
> -    case 14: return READ_SYSREG(ICH_LR14_EL2);
> -    case 15: return READ_SYSREG(ICH_LR15_EL2);
> +    case 0: return READ_SYSREG_LR(0);
> +    case 1: return READ_SYSREG_LR(1);
> +    case 2: return READ_SYSREG_LR(2);
> +    case 3: return READ_SYSREG_LR(3);
> +    case 4: return READ_SYSREG_LR(4);
> +    case 5: return READ_SYSREG_LR(5);
> +    case 6: return READ_SYSREG_LR(6);
> +    case 7: return READ_SYSREG_LR(7);
> +    case 8: return READ_SYSREG_LR(8);
> +    case 9: return READ_SYSREG_LR(9);
> +    case 10: return READ_SYSREG_LR(10);
> +    case 11: return READ_SYSREG_LR(11);
> +    case 12: return READ_SYSREG_LR(12);
> +    case 13: return READ_SYSREG_LR(13);
> +    case 14: return READ_SYSREG_LR(14);
> +    case 15: return READ_SYSREG_LR(15);
>      default:
>          BUG();
>      }
> @@ -187,52 +187,52 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
>      switch ( lr )
>      {
>      case 0:
> -        WRITE_SYSREG(val, ICH_LR0_EL2);
> +        WRITE_SYSREG_LR(val, 0);
>          break;
>      case 1:
> -        WRITE_SYSREG(val, ICH_LR1_EL2);
> +        WRITE_SYSREG_LR(val, 1);
>          break;
>      case 2:
> -        WRITE_SYSREG(val, ICH_LR2_EL2);
> +        WRITE_SYSREG_LR(val, 2);
>          break;
>      case 3:
> -        WRITE_SYSREG(val, ICH_LR3_EL2);
> +        WRITE_SYSREG_LR(val, 3);
>          break;
>      case 4:
> -        WRITE_SYSREG(val, ICH_LR4_EL2);
> +        WRITE_SYSREG_LR(val, 4);
>          break;
>      case 5:
> -        WRITE_SYSREG(val, ICH_LR5_EL2);
> +        WRITE_SYSREG_LR(val, 5);
>          break;
>      case 6:
> -        WRITE_SYSREG(val, ICH_LR6_EL2);
> +        WRITE_SYSREG_LR(val, 6);
>          break;
>      case 7:
> -        WRITE_SYSREG(val, ICH_LR7_EL2);
> +        WRITE_SYSREG_LR(val, 7);
>          break;
>      case 8:
> -        WRITE_SYSREG(val, ICH_LR8_EL2);
> +        WRITE_SYSREG_LR(val, 8);
>          break;
>      case 9:
> -        WRITE_SYSREG(val, ICH_LR9_EL2);
> +        WRITE_SYSREG_LR(val, 9);
>          break;
>      case 10:
> -        WRITE_SYSREG(val, ICH_LR10_EL2);
> +        WRITE_SYSREG_LR(val, 10);
>          break;
>      case 11:
> -        WRITE_SYSREG(val, ICH_LR11_EL2);
> +        WRITE_SYSREG_LR(val, 11);
>          break;
>      case 12:
> -        WRITE_SYSREG(val, ICH_LR12_EL2);
> +        WRITE_SYSREG_LR(val, 12);
>          break;
>      case 13:
> -        WRITE_SYSREG(val, ICH_LR13_EL2);
> +        WRITE_SYSREG_LR(val, 13);
>          break;
>      case 14:
> -        WRITE_SYSREG(val, ICH_LR14_EL2);
> +        WRITE_SYSREG_LR(val, 14);
>          break;
>      case 15:
> -        WRITE_SYSREG(val, ICH_LR15_EL2);
> +        WRITE_SYSREG_LR(val, 15);
>          break;
>      default:
>          return;
> @@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
>      if ( v == current )
>      {
>          for ( i = 0; i < gicv3_info.nr_lrs; i++ )
> -            printk("   HW_LR[%d]=%lx\n", i, gicv3_ich_read_lr(i));
> +            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
>      }
>      else
>      {
>          for ( i = 0; i < gicv3_info.nr_lrs; i++ )
> -            printk("   VCPU_LR[%d]=%lx\n", i, v->arch.gic.v3.lr[i]);
> +            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
>      }
>  }
>  
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 6841d5de43..31ad7eaefb 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -62,6 +62,25 @@
>  #define READ_SYSREG(R...)       READ_SYSREG32(R)
>  #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>  
> +/* Wrappers for accessing interrupt controller list registers. */
> +#define ICH_LR_REG(index)       ICH_LR ## index ## _EL2
> +#define ICH_LRC_REG(index)      ICH_LRC ## index ## _EL2
> +
> +#define READ_SYSREG_LR(index) ({                            \
> +    uint64_t _val;                                          \
> +    uint32_t _lrc = READ_CP32(ICH_LRC_REG(index));          \
> +    uint32_t _lr = READ_CP32(ICH_LR_REG(index));            \
> +                                                            \
> +    _val = ((uint64_t) _lrc << 32) | _lr;                   \
> +    _val;                                                   \
> +})
> +
> +#define WRITE_SYSREG_LR(V, index) ({                        \
Didn't we agree on using lower case version?
This upper case V looks a bit odd here...

> +    uint64_t _val = (V);                                    \
> +    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(index));   \
> +    WRITE_CP32(_val >> 32, ICH_LRC_REG(index));             \
> +})
> +
>  /* MVFR2 is not defined on ARMv7 */
>  #define MVFR2_MAYBE_UNDEFINED
>  
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 54670084c3..b72a6ea3b0 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -472,6 +472,10 @@
>  #define READ_SYSREG(name)     READ_SYSREG64(name)
>  #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
>  
> +/* Wrappers for accessing interrupt controller list registers. */
> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
> +#define WRITE_SYSREG_LR(V, index)  WRITE_SYSREG(V, ICH_LR_REG(index))
and here.

> +#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
Before you added a new code block there was an empty line here.
Could you please add it?
>  #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6daf2b1a30..242dabaea8 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -259,6 +259,49 @@
>  #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
>  #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
Here the value of HVBAR...

>  
> +/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
> +#define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
> +#define __LR0(x)                  ___CP32(p15, 4, c12, c12, x)
> +#define __LR8(x)                  ___CP32(p15, 4, c12, c13, x)
> +
> +#define ICH_LR0                   __LR0(0)
> +#define ICH_LR1                   __LR0(1)
> +#define ICH_LR2                   __LR0(2)
> +#define ICH_LR3                   __LR0(3)
> +#define ICH_LR4                   __LR0(4)
> +#define ICH_LR5                   __LR0(5)
> +#define ICH_LR6                   __LR0(6)
> +#define ICH_LR7                   __LR0(7)
> +#define ICH_LR8                   __LR8(0)
> +#define ICH_LR9                   __LR8(1)
> +#define ICH_LR10                  __LR8(2)
> +#define ICH_LR11                  __LR8(3)
> +#define ICH_LR12                  __LR8(4)
> +#define ICH_LR13                  __LR8(5)
> +#define ICH_LR14                  __LR8(6)
> +#define ICH_LR15                  __LR8(7)
> +
> +/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
> +#define __LRC0(x)                 ___CP32(p15, 4, c12, c14, x)
> +#define __LRC8(x)                 ___CP32(p15, 4, c12, c15, x)
> +
> +#define ICH_LRC0                  __LRC0(0)
> +#define ICH_LRC1                  __LRC0(1)
> +#define ICH_LRC2                  __LRC0(2)
> +#define ICH_LRC3                  __LRC0(3)
> +#define ICH_LRC4                  __LRC0(4)
> +#define ICH_LRC5                  __LRC0(5)
> +#define ICH_LRC6                  __LRC0(6)
> +#define ICH_LRC7                  __LRC0(7)
> +#define ICH_LRC8                  __LRC8(0)
> +#define ICH_LRC9                  __LRC8(1)
> +#define ICH_LRC10                 __LRC8(2)
> +#define ICH_LRC11                 __LRC8(3)
> +#define ICH_LRC12                 __LRC8(4)
> +#define ICH_LRC13                 __LRC8(5)
> +#define ICH_LRC14                 __LRC8(6)
> +#define ICH_LRC15                 __LRC8(7)
> +
>  /* CP15 CR13:  */
>  #define FCSEIDR         p15,0,c13,c0,0  /* FCSE Process ID Register */
is aligned to the value of FCSEIDR.
So I'm not sure why you cannot align your code block to it.
Generally a new code block can have its own alignement, but here you did insert
it into something aligned which no longer is after your change.

>  #define CONTEXTIDR      p15,0,c13,c0,1  /* Context ID Register */
> @@ -317,6 +360,38 @@
>  #define HCR_EL2                 HCR
>  #define HPFAR_EL2               HPFAR
>  #define HSTR_EL2                HSTR
> +#define ICH_LR0_EL2             ICH_LR0
> +#define ICH_LR1_EL2             ICH_LR1
> +#define ICH_LR2_EL2             ICH_LR2
> +#define ICH_LR3_EL2             ICH_LR3
> +#define ICH_LR4_EL2             ICH_LR4
> +#define ICH_LR5_EL2             ICH_LR5
> +#define ICH_LR6_EL2             ICH_LR6
> +#define ICH_LR7_EL2             ICH_LR7
> +#define ICH_LR8_EL2             ICH_LR8
> +#define ICH_LR9_EL2             ICH_LR9
> +#define ICH_LR10_EL2            ICH_LR10
> +#define ICH_LR11_EL2            ICH_LR11
> +#define ICH_LR12_EL2            ICH_LR12
> +#define ICH_LR13_EL2            ICH_LR13
> +#define ICH_LR14_EL2            ICH_LR14
> +#define ICH_LR15_EL2            ICH_LR15
> +#define ICH_LRC0_EL2            ICH_LRC0
> +#define ICH_LRC1_EL2            ICH_LRC1
> +#define ICH_LRC2_EL2            ICH_LRC2
> +#define ICH_LRC3_EL2            ICH_LRC3
> +#define ICH_LRC4_EL2            ICH_LRC4
> +#define ICH_LRC5_EL2            ICH_LRC5
> +#define ICH_LRC6_EL2            ICH_LRC6
> +#define ICH_LRC7_EL2            ICH_LRC7
> +#define ICH_LRC8_EL2            ICH_LRC8
> +#define ICH_LRC9_EL2            ICH_LRC9
> +#define ICH_LRC10_EL2           ICH_LRC10
> +#define ICH_LRC11_EL2           ICH_LRC11
> +#define ICH_LRC12_EL2           ICH_LRC12
> +#define ICH_LRC13_EL2           ICH_LRC13
> +#define ICH_LRC14_EL2           ICH_LRC14
> +#define ICH_LRC15_EL2           ICH_LRC15
>  #define ID_AFR0_EL1             ID_AFR0
>  #define ID_DFR0_EL1             ID_DFR0
>  #define ID_DFR1_EL1             ID_DFR1
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 48a1bc401e..743ebb20fd 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -185,9 +185,9 @@
>  #define ICH_LR_HW_SHIFT              61
>  #define ICH_LR_GRP_MASK              0x1
>  #define ICH_LR_GRP_SHIFT             60
> -#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
> -#define ICH_LR_GRP1                  (1UL<<60)
> -#define ICH_LR_HW                    (1UL<<61)
> +#define ICH_LR_MAINTENANCE_IRQ       (1ULL << 41)
> +#define ICH_LR_GRP1                  (1ULL << 60)
> +#define ICH_LR_HW                    (1ULL << 61)
>  
>  #define ICH_VTR_NRLRGS               0x3f
>  #define ICH_VTR_PRIBITS_MASK         0x7

~Michal

