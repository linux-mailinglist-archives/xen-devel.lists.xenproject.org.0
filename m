Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259E844056
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 14:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674037.1048710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVATq-000288-CS; Wed, 31 Jan 2024 13:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674037.1048710; Wed, 31 Jan 2024 13:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVATq-00025H-7x; Wed, 31 Jan 2024 13:18:18 +0000
Received: by outflank-mailman (input) for mailman id 674037;
 Wed, 31 Jan 2024 13:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX7o=JJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rVATo-00025B-R5
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 13:18:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 301e485b-c03b-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 14:18:15 +0100 (CET)
Received: from MW4P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::20)
 by MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 13:18:07 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::55) by MW4P221CA0015.outlook.office365.com
 (2603:10b6:303:8b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 13:18:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 13:18:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 07:18:05 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 07:18:03 -0600
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
X-Inumbo-ID: 301e485b-c03b-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3x8H73TRcISdLm7Yj1R6uEtfLfveEOO0rSQ1XJJFU2xhGT5KEGYprLEYmDi9AROtj/e2QUfgSBGR7UhNoGJX0VL46QEtV7TK1NEiJBclmNL96wPz/uHLHpi+D+HUijeLYu0voJraFPaEegDHRIZRpKfVzw33WSwzvBiFuz/rsytnZvFLA1p0WBizDTpDdiGRBCtQvJ249b4Ob6PgASt3lh7/NKVwSgukBW4zRpF7OeJhZtvx4TGu6n7CKlA4zl6IxqGMcDHVAqK4a+X3Y4NAw6udey9ZF/vijwT2viIBcfXMP9pd5PR/9zQhdWRT+9tlr/vje7AZBjkydaFFXC8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gn+7AQhiApRSVpoA8alJnK3XeP5n2uTg0s2vjdv05E=;
 b=FdcrCaLLJGkC0ZJFydTl6G10xZR9rpS7kBQUb2lzye8snW01OdyPLmLIe4Jad7neTHBoJKyPgRlOg3I3jPHUZUqLs/AhJUODxIyKMpBugdliIzLRjE52JIu6rJBR3KiikGrw7TknR5wwtVnWay0/Q/Ll3Bv5WRutUsc8iVMfx1hd9UWM3eYZj8Hn7gP06Vfy/A6yxVD0WRViHjt6d3sOvS4OA1Nk0xRdEsFNS03QnHwHVZCnwc48uWxPF3fpgwY4MJ0rjuIpPgMt8jVJtDo28hixAzeNA05GzSrs/LOYGOg2/UVcEMz5z4YsBH5+gE6RPsj8EoDx8U4T9IbFZ6VMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gn+7AQhiApRSVpoA8alJnK3XeP5n2uTg0s2vjdv05E=;
 b=17GmjPzJ6p9MZ5afPFu+GkR7jDZKNheHp8UItQ3+0zZxxUxffiMFslnylWYr4misBhpOAnKh0JPRAEXu1b8SDS1sa4MZvprDtAjChLPLNLhUlHZllXbDz2CYshLGwfSB001FgZxwiQALGc/18FdDmJF+AkLYEbjbQM8urT3NcGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7149dce0-3247-493f-8544-6a24ffd212b9@amd.com>
Date: Wed, 31 Jan 2024 14:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-4-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240131121049.225044-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|MN0PR12MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: a7da42c4-7a99-4599-e637-08dc225f1087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KYtf2bpzxeM5o4EvjddMydPrjFET3yikK1ipIFrRQYLtx8NultUd9//TnD6D3KtC+4/c+DMHksxUZ7glRngPH3CMDdkYcYUcsGOv4Xa2hY6c4vwUHp3eewEBWATVBdaIooxvuDK2QbcpkckDt06/Vgd1doZDufRpe/Laez8RAvKludywqhcvnRPKnKeDUk/W0OTH4jt9KSUD4meWW/VK0LMjITI54bGQxwGEboVXek4H6qk+Go3ehDZpCav95J+bl1DT1U2MnGfr3BEZbW91+llGds0krkHzifDAkfPBQO2ngluxxIG9he/WwhGKbFu6bgHii8MrX/5KPik7EKGbUJiV+p3Pc9JGYfUk6/jpUgEKpZdPYCHQ0ser2SvL9ZXDxKO2FO3QPfvcLFzlfotDO+q+I2fdjmFR348EsMKPGLHbERBZExEN1KAWk1QpxPMwOtv+NAfGwaCH+vp1fb1oMzQldLL+kKdtSW0UUcvwex1FOzppML9M1lw53cviXn/ijjfvaZAjzhYpnJji+tPNGqmBvxjI4BUTpBuOdGaM+PPK7XbsPAtsnYLhuj5vu0htUrqW9Ik6/hxeEtj6TJW/vIryWmeFB07XguSX72O2iGYn59yHUvGykQ4d+ulI8VcbDjrLxpOHeNqtXI662TjntksaHNhXQbDKBwe2IcEG9lQ5rdTBs05cYMZT//En8oktr453+tNlcLvQDj+EumDzf8s2OOX3136JpxU6ziHO6QVTx8+IeWhay9HAOuWdim8kuhueC6fTM7kX9XKsA+3Gs28I2dO2c2IjOchpXBLXEWtH5RHNMriclClvlgUfrewD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(230273577357003)(230922051799003)(230173577357003)(186009)(1800799012)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(5660300002)(8676002)(4326008)(44832011)(8936002)(2906002)(31696002)(86362001)(110136005)(70586007)(70206006)(316002)(508600001)(83380400001)(36756003)(16576012)(47076005)(54906003)(36860700001)(356005)(81166007)(53546011)(6666004)(26005)(2616005)(426003)(336012)(31686004)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 13:18:07.2784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7da42c4-7a99-4599-e637-08dc225f1087
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004

Hi Ayan,

On 31/01/2024 13:10, Ayan Kumar Halder wrote:
> When user enables HVC_DCC config option in Linux, it invokes access to debug
> transfer register (i.e. DBGDTRTXINT). As this register is not emulated, Xen
> injects an undefined exception to the guest and Linux crashes.
> To prevent this crash, introduce a partial emulation of DBGDTRTXINT as RAZ/WI
> and TXfull should be set to 1. So that Linux will see that TXfull is set, and
> it will not access DBGDTRTXINT.
It will access it at least once to later check if TXfull is set.

> 
> As a pre-requisite, DBGOSLSR should be emulated in the same way as its AArch64
> variant (ie OSLSR_EL1).
> This is to ensure that DBGOSLSR.OSLK is 0, thus MDSCR_EL1.TXfull is treated
> as UNK/SBZP.
For that you could just emulate it as RAZ. Instead you also set OSLM[1]. So at least
I would make it clear that you do that for consistency.

> Only MDCCSR_EL0 can be emulated (which is DBGDSCRINT on arm32). DBGDSCRINT
I would write: This way, we only need to emulate DBGDSCRINT.

> can be accessed at EL0 as DBGDSCREXT is emulated as RAZ (as DBGOSLSR.OSLK
> == 0). So, we tool the opportunity to fix the minimum EL for DBGDSCRINT.
>  DBGDSCRINT.TXfull is set to 1.
I'm not sure why you are mixing AArch64 names with AArch32 ones. It reads a bit difficult.
Furthermore, fixing lowest EL deserves a separate section.
Also s/tool/took.

> 
> Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint
> "If TXfull is set to 1, set DTRTX to UNKNOWN".
> So, DBGDTR[TR]XINT is emulated as RAZ/WI.
> 
> Thus, any OS is expected to read DBGDSCRINT and check for TXfull before using
> DBGDTRTXINT.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from
> 
> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
> indication that the RX buffer is full and is waiting to be read.
> 
> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.
> 
> 3. Fixed the commit message and inline code comments.
> 
> v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
> 2. Fixed in line comments and style related issues.
> 3. Updated commit message to mention DBGDSCRINT handling.
> 
> v3 :- 1. The original emulation of DBGDSCRINT is retained when
> 'partial_emulation' is false.
> 
> 2. If 'partial_emulation' is false, then access to DBGDTRTXINT will
> lead to undefined exception.
> 
>  xen/arch/arm/include/asm/cpregs.h |  2 ++
>  xen/arch/arm/vcpreg.c             | 35 ++++++++++++++++++++++---------
>  2 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6b083de204..aec9e8f329 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -75,6 +75,8 @@
>  #define DBGDIDR         p14,0,c0,c0,0   /* Debug ID Register */
>  #define DBGDSCRINT      p14,0,c0,c1,0   /* Debug Status and Control Internal */
>  #define DBGDSCREXT      p14,0,c0,c2,2   /* Debug Status and Control External */
> +#define DBGDTRRXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Receive */
> +#define DBGDTRTXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Transmit */
>  #define DBGVCR          p14,0,c0,c7,0   /* Vector Catch */
>  #define DBGBVR0         p14,0,c0,c0,4   /* Breakpoint Value 0 */
>  #define DBGBCR0         p14,0,c0,c0,5   /* Breakpoint Control 0 */
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index a2d0500704..87df4bd238 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -493,11 +493,12 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>       * ARMv8 (DDI 0487A.d): D1-1509 Table D1-58
>       *
>       * Unhandled:
> -     *    DBGOSLSR
>       *    DBGPRCR
>       */
>      case HSR_CPREG32(DBGOSLAR):
>          return handle_wo_wi(regs, regidx, cp32.read, hsr, 1);
> +    case HSR_CPREG32(DBGOSLSR):
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1, 1U << 3);
>      case HSR_CPREG32(DBGOSDLR):
>          return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>  
> @@ -509,8 +510,6 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>       *
>       * Unhandled:
>       *    DBGDCCINT
> -     *    DBGDTRRXint
> -     *    DBGDTRTXint
>       *    DBGWFAR
>       *    DBGDTRTXext
>       *    DBGDTRRXext,
> @@ -550,10 +549,22 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>  
>      case HSR_CPREG32(DBGDSCRINT):
>          /*
> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
> -         * is set to 0, which we emulated below.
> +         * Xen doesn't expose a real (or emulated) Debug Communications
> +         * Channel (DCC) to a domain. Yet the Arm ARM implies this is not an
> +         * optional feature. So some domains may start to probe it. For
> +         * instance, the HVC_DCC driver in Linux (since f377775dc083 and at
> +         * least up to v6.7), will try to write some characters and check if
> +         * the transmit buffer has emptied. By setting TX status bit to
> +         * indicate the transmit buffer is full. This we would hint the OS
> +         * that the DCC is probably not working.
I'm a bit suprised that these messages differ. Why not to use the same text as arm64 but with
register names updated?

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

