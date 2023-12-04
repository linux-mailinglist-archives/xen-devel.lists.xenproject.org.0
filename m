Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19457802D5F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646601.1009025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4TT-00007f-DR; Mon, 04 Dec 2023 08:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646601.1009025; Mon, 04 Dec 2023 08:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4TT-00005O-AO; Mon, 04 Dec 2023 08:38:43 +0000
Received: by outflank-mailman (input) for mailman id 646601;
 Mon, 04 Dec 2023 08:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IRNf=HP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rA4TR-0008VS-Pq
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:38:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84c76bd6-9280-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:38:38 +0100 (CET)
Received: from DM6PR02CA0044.namprd02.prod.outlook.com (2603:10b6:5:177::21)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 08:38:33 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::16) by DM6PR02CA0044.outlook.office365.com
 (2603:10b6:5:177::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 08:38:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 08:38:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 02:38:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 4 Dec
 2023 00:38:32 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 02:38:31 -0600
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
X-Inumbo-ID: 84c76bd6-9280-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaMGVX4ILagGL7bFgyTkqnj20to9j+EhPA/CBakRMSbEejKuAAuUjwvidEoPDrsgzfFzxwMLfkb640HP+UM7uawj01Evppd8PJ8BVCxVyZJLoxO+0wB5AVLSQdOZo85lgdZVTcxJ1Ik5/Ey4QoqZAAbPB9KrhENuOLopPvIkiP72cpLr+jv5Tv6l4xy5Ggr4QTlODwTxzv7/97OXuDz5y5KXXzkjwt9vHHi41Ac0WlCiXWir0XzcGZoE1Nb2q+PV4ZUHXkq3piaPZJjW+LKsfI9nKCvb9f/BVESLaqi/vqEiJ0VLz7f4/7S+JBM3ybrnc7DiL0rerIW1F43mgA9AcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlX6Yo3sUaCNRW5NRjFyl2rDQUzXKyjGDeUsaX4WQ18=;
 b=a0lG1PBceyYmLHTKiGm/5B26aqVrD/S0y7QL+rd4e9b69D02y3Uu7G7oD0VFc+wbuNQJZC+RWJSDIUGbVxBv8tQbh8V411EJ6ERlPQMCmZujJM563FEDkJJhl1qoiRfIMwwzDXQlAHxb+dLnyjttN+yhg5cyQMzlXlY970IxOtNF2rPNs2+OW+DE46qu33zd9TqmObXGrVHgc5iDTnWAeXRhNDw7A9NYVF7HQptYk307H+krELxTQPLYEcw66PMhJWcC0GWEdyZGT1jDEWuZzzwJBXOjgVVzY6kaotMaEsfP/8j75kBRYiOEKn56N8EU9E+nRCjWw9cYBVvVV92EXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlX6Yo3sUaCNRW5NRjFyl2rDQUzXKyjGDeUsaX4WQ18=;
 b=xom9gkCVZjIAx1Y5uBexXHcULMDwXgBjYcc9XU7oXHPpggL/kg+VXq2sFzDXVppv3v+2jzeNv3bsh8tFX0Q27r6Ss5oYcmgUnqZNY8tI7qB4oH+9YN7y+NdChZ0Tc6l06e4lobFyIdnjgbd1Pn7j9ngGNWvLMn8C5FJPDyIGNx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c7a5033d-78d9-49b4-9227-c9e43c2d5997@amd.com>
Date: Mon, 4 Dec 2023 09:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<stefano.stabellini@amd.com>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: d08b8532-4982-4d5f-42fc-08dbf4a4668a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vxhD2+pau8GdpqxQQ5ABMWEtpGvk1zPc5TA20HCROSzqbOy1sn3NMMiU490eJPJFh27cAGewQ5tNo4F6afrY1DKfJG0+3P1XWsRd59BKUoMfHpO5Xyw8oF2NMQhW56wZX9AcaUzXp1SvAALvcl59bmDlPxl2CzmxC86CJ/oQRRTL3jO9CON72I1YPKsCyvlR470qC91h+5SAu8YX9BRnxe1kuiaD30E2IhZBSPKFiDSUfpzioJnKkWgovqVfB762T1S1B3P1QesSJ68bZC+hwo6lZQT6owAHD9yWRbKr/rUotRxIm1htNQS+k4L40Ujxx77hH43aus+QnapOvacD9o14IYDbwzVoKU+DlqIru8545wmcsmYbyzzHGlsNqEX95lDfVK5sRadFVvz0aCiC6rWS1/qhW8slks5ncP1CV7yaWU29/35pGEOewAyecZVkVVcxveCc6sSCiN/DVjf96e7vizHgbh3f2h9Z0PhYgMCH8nTwQZzAW63stTh+4pV0WbPdqEExIP7KcgolBT20LIdidZR/O2wReJcjASZDWsQWxb5v6tVVZbEPT59awcWqoLZrWBa4ftCxOfz8QM4FElQZ5zmLB0DFMKIZk/T0Pw21TOwi8n+e49r+vK8Mn+yoWzggNY1cOdEW05iCoATlkfwHw5sRtURaGmPmL8BFiOzJBS5ShRn5qvL/OT30NB0t0GfoU15M7Sap4LHLTCIkdnKV/BvVp+3MIvuRRh7J88zrlbrskrEQksBpxnontO3SOcTcdg2N1ph2bcdGe2XjwOau7HXuLq7wOw2SSNwP39pXczS1W97W/GwHk1Yt53ys3N2Um3KtkByYLicFxgNerDYYEadW+a97egXyjVEq4adpNtBcdYZdYcnnNAm4KKzY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(376002)(396003)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(36840700001)(46966006)(70206006)(16576012)(70586007)(316002)(110136005)(40460700003)(2906002)(5660300002)(31696002)(41300700001)(86362001)(36756003)(4326008)(8936002)(8676002)(81166007)(356005)(82740400003)(44832011)(40480700001)(36860700001)(53546011)(426003)(336012)(83380400001)(47076005)(26005)(2616005)(31686004)(478600001)(36900700001)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:38:33.4114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d08b8532-4982-4d5f-42fc-08dbf4a4668a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289

Hi Ayan,

On 01/12/2023 19:50, Ayan Kumar Halder wrote:
> Currently if user enables HVC_DCC config option in Linux, it invokes
> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
> an undefined exception to the guest. And Linux crashes.
> 
> We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
> is emulated as TXfull | RXfull.
TX/RX are status bits of MDCCSR_EL0, not DBGDTR_EL0. This applies here and elsewhere.

> Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
> Also D17.3.7 DBGDTRRX_EL0,
> " If RXfull is set to 1, return the last value written to DTRRX."
> 
> Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
> before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
> hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
> the guest to be aborted.
> 
> We also emulate DBGDTRTX_EL0 as RAZ/WI.
> 
> We have added emulation for AArch32 variant of these registers as well.
> Also, we have added handle_read_val_wi() to emulate DBGDSCREXT register
Emulating DBGDSCREXT is not needed. See below.

> to return a specific value (ie TXfull | RXfull) and ignore any writes
> to this register.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  xen/arch/arm/arm64/vsysreg.c         | 21 ++++++++++++++----
>  xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>  xen/arch/arm/include/asm/cpregs.h    |  2 ++
>  xen/arch/arm/include/asm/traps.h     |  4 ++++
>  xen/arch/arm/traps.c                 | 18 +++++++++++++++
>  xen/arch/arm/vcpreg.c                | 33 +++++++++++++++++++++-------
>  6 files changed, 69 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..5082dfb02e 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>       *
>       * Unhandled:
>       *    MDCCINT_EL1
> -     *    DBGDTR_EL0
> -     *    DBGDTRRX_EL0
> -     *    DBGDTRTX_EL0
>       *    OSDTRRX_EL1
>       *    OSDTRTX_EL1
>       *    OSECCR_EL1
> @@ -172,11 +169,27 @@ void do_sysreg(struct cpu_user_regs *regs,
>      case HSR_SYSREG_MDSCR_EL1:
>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>      case HSR_SYSREG_MDCCSR_EL0:
> +    {
> +        /*
> +         * Bit 29: TX full, bit 30: RX full
> +         * Given that we emulate DCC registers as RAZ/WI, doing the same for
> +         * MDCCSR_EL0 would cause a guest to continue using the DCC despite no
> +         * real effect. Setting the TX/RX status bits should result in a probe
> +         * fail (based on Linux behavior).
> +         */
> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
> +
>          /*
>           * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>           * register as RAZ/WI above. So RO at both EL0 and EL1.
>           */
> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
> +                                  guest_reg_value);
> +    }
> +    case HSR_SYSREG_DBGDTR_EL0:
> +    /* DBGDTR[TR]X_EL0 share the same encoding */
> +    case HSR_SYSREG_DBGDTRTX_EL0:
> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>      HSR_SYSREG_DBG_CASES(DBGBVR):
>      HSR_SYSREG_DBG_CASES(DBGBCR):
>      HSR_SYSREG_DBG_CASES(DBGWVR):
> diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
> index e691d41c17..1495ccddea 100644
> --- a/xen/arch/arm/include/asm/arm64/hsr.h
> +++ b/xen/arch/arm/include/asm/arm64/hsr.h
> @@ -47,6 +47,9 @@
>  #define HSR_SYSREG_OSDLR_EL1      HSR_SYSREG(2,0,c1,c3,4)
>  #define HSR_SYSREG_DBGPRCR_EL1    HSR_SYSREG(2,0,c1,c4,4)
>  #define HSR_SYSREG_MDCCSR_EL0     HSR_SYSREG(2,3,c0,c1,0)
> +#define HSR_SYSREG_DBGDTR_EL0     HSR_SYSREG(2,3,c0,c4,0)
> +#define HSR_SYSREG_DBGDTRTX_EL0   HSR_SYSREG(2,3,c0,c5,0)
> +#define HSR_SYSREG_DBGDTRRX_EL0   HSR_SYSREG(2,3,c0,c5,0)
>  
>  #define HSR_SYSREG_DBGBVRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,4)
>  #define HSR_SYSREG_DBGBCRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,5)
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
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 883dae368e..a2692722d5 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -56,6 +56,10 @@ void handle_ro_raz(struct cpu_user_regs *regs, int regidx, bool read,
>  void handle_ro_read_val(struct cpu_user_regs *regs, int regidx, bool read,
>                          const union hsr hsr, int min_el, register_t val);
>  
> +/* Read only as value provided with 'val' argument, write ignore */
> +void handle_read_val_wi(struct cpu_user_regs *regs, int regidx,
> +                        const union hsr hsr, int min_el, register_t val);
> +
>  /* Co-processor registers emulation (see arch/arm/vcpreg.c). */
>  void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 3784e8276e..f5ab555b19 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1676,6 +1676,24 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
>      advance_pc(regs, hsr);
>  }
>  
> +/* Read as value provided with 'val' argument of this function, write ignore */
> +void handle_read_val_wi(struct cpu_user_regs *regs,
> +                        int regidx,
> +                        const union hsr hsr,
> +                        int min_el,
> +                        register_t val)
> +{
> +    ASSERT((min_el == 0) || (min_el == 1));
> +
> +    if ( min_el > 0 && regs_mode_is_user(regs) )
> +        return inject_undef_exception(regs, hsr);
> +
> +    set_user_reg(regs, regidx, val);
> +
> +    advance_pc(regs, hsr);
> +}
> +
> +
>  /* Read only as read as zero */
>  void handle_ro_raz(struct cpu_user_regs *regs,
>                     int regidx,
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 39aeda9dab..3f1276f96e 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -548,20 +548,37 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>          break;
>      }
>  
> -    case HSR_CPREG32(DBGDSCRINT):
> +    case HSR_CPREG32(DBGDSCREXT):
1) Why did you invert DBGDSCRINT with DBGDSCREXT? The former should appear first to keep the correct order.

2) Take a look at what I did for arm64. I emulated TX/RX only in MDCCSR_EL0 and not in MDSCR_EL1 (on arm32,
DBGDSCRINT, DBGDSCREXT respectively). This is because according to Arm ARM for MDSCR_EL1 TXfull/RXfull:
"When OSLSR_EL1.OSLK == 0, software must treat this bit as UNK/SBZP"
On arm64, we emulate OSLSR_EL1 as (1<<3) meaning OSLK is 0. UNK/SBZP means RAZ/WI. This implies that
the only way to access the TXfull/RXfull flags is through MDCCSR_EL0.

For arm32, we should do the same. Emulate only RINT and keep REXT as RAZ/WI. The only additional change would
be to emulate (at the moment it is unhandled) DBGOSLSR similar to what we do for arm64.

> +    {
>          /*
> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
> -         * is set to 0, which we emulated below.
> +         * Bit 29: TX full, bit 30: RX full
> +         * Given that we emulate DCC registers as RAZ/WI, doing the same for
> +         * DBGDSCRint would cause a guest to continue using the DCC despite no
> +         * real effect. Setting the TX/RX status bits should result in a probe
> +         * fail (based on Linux behavior).
>           */
> -        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
>  
> -    case HSR_CPREG32(DBGDSCREXT):
> +        return handle_read_val_wi(regs, regidx, hsr, 1,
> +                                  guest_reg_value);
> +    }
> +
> +    case HSR_CPREG32(DBGDSCRINT):
> +    {
>          /*
> -         * Implement debug status and control register as RAZ/WI.
> -         * The OS won't use Hardware debug if MDBGen not set.
> +         * Bit 29: TX full, bit 30: RX full
> +         * Given that we emulate DCC registers as RAZ/WI, doing the same for
> +         * DBGDSCRint would cause a guest to continue using the DCC despite no
> +         * real effect. Setting the TX/RX status bits should result in a probe
> +         * fail (based on Linux behavior).
>           */
> -        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
> +
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
> +                                  guest_reg_value);
DBGDSCRINT is accessible at EL0 if DBGDSCREXT.UDCCdis is 0 (we emulate REXT as RAZ). There is
even a comment about that which you removed (please restore). Therefore, the minimum EL passed
to handle_ro_read_val should be 0 not 1.

P.S. The current code is incorrect in this regard.

> +    }
>  
> +    case HSR_CPREG32(DBGDTRTXINT):
This would be incorrect. Adding TXINT here would result in calling handle_raz_wi with minimum EL == 1,
but TXINT can be accessed at EL0.

This should be:
    /* DBGDTR[TR]XINT share the same encoding */
    case HSR_CPREG32(DBGDTRTXINT):
        return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);

>      case HSR_CPREG32(DBGVCR):
>      case HSR_CPREG32(DBGBVR0):
>      case HSR_CPREG32(DBGBCR0):


~Michal

