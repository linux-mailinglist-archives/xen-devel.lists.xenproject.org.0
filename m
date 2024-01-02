Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B4821824
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 08:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660544.1030029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKZe6-0000Eo-79; Tue, 02 Jan 2024 07:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660544.1030029; Tue, 02 Jan 2024 07:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKZe6-0000BO-34; Tue, 02 Jan 2024 07:57:06 +0000
Received: by outflank-mailman (input) for mailman id 660544;
 Tue, 02 Jan 2024 07:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30cU=IM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rKZe4-0000BH-CG
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 07:57:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82797e21-a944-11ee-98ee-6d05b1d4d9a1;
 Tue, 02 Jan 2024 08:57:02 +0100 (CET)
Received: from BYAPR08CA0060.namprd08.prod.outlook.com (2603:10b6:a03:117::37)
 by CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 07:56:57 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::28) by BYAPR08CA0060.outlook.office365.com
 (2603:10b6:a03:117::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Tue, 2 Jan 2024 07:56:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Tue, 2 Jan 2024 07:56:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 2 Jan
 2024 01:56:55 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 2 Jan 2024 01:56:54 -0600
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
X-Inumbo-ID: 82797e21-a944-11ee-98ee-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frr2Omk54ICTEFZh7diewfEbLAuA37uutmMMEB8rNbRp8uyrk+nSa7o75P8aEpoU9DifBTGY16laGAWNPdEGxPudEk/tTLovWn7mz5QZm7lIFz9ofwi6J7Zrlixln246n5NI6NYXhHXBvQTq6bD3O5yKvfZQP2FbjD/SwKAF+MkCyzoQJckGaPNecCVsFOVFgxcCp3wyTKXM0eoYze3x+Hyv0HFRvLpFhcBuPQiQ+itDLvfspqZPVoW78cA464kACFe8hxTfqk9+Zl+Uc0nQmS2unO29IwwqECMeDQpkMUfaLvl3/ERpDDem3jqhiqhnUkzDFJgTvCuwwWLuPPE8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOgcyxDXGUPIQ91SjdZyUHA7Xur2gDiNmkItHCNMXEU=;
 b=OM/8PnsZs7ZAQZDdw/m6Kst37I0FWqzdNNDMoc2UM9dMVrB4AuZvpYgFB96T7x9sN5oIJgyjWHCyHdXBGHAMI0BAf6Hq1x347q39Om8gAp6YGewieSGlrlbhEPvU9TGRZZq3U91A/7pk/NiloMV4AcmHNM/010zBcARKLeL8hSv0op0dStI0JJQq0JznXc+Z9P4Z72CKJRgnMcylwOwAs7OZd7fcQ6PxN++XzDnhwuceBMIaifOKz1bSbAQ+pZbSNdQ3SjFjcrPj20bh4xDmGXqltO32/qGqx40/yC8Tx3CXBJ27usplzSRigkZdJTM/wrJSQk/8fWoKmMFk7Q/hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOgcyxDXGUPIQ91SjdZyUHA7Xur2gDiNmkItHCNMXEU=;
 b=pD9RImWlDcnBHNBx0ksPS5Kvu9+7qN9FcJ9S1viE98Xk1ihTcahK8Vd6CdPS9YAMjnVAOHTf0KsiS5/qUnwV4QtHdNDaFGe1jQIMUkfv5xJM2N7PELaTjU2Bq2EP9OaDMziEZ6hN2wSu7698cD+/Yy48OOkwox0WM8cSimXYAJY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <39e7a217-b829-42e6-bfec-fb297a058521@amd.com>
Date: Tue, 2 Jan 2024 08:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
To: <julien@xen.org>, <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>,
	<stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>
References: <20231218203242.1393268-1-michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20231218203242.1393268-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: f94a56e9-fe88-449d-97d5-08dc0b68644a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bMd2dUjzNK6+SOIkDv5HybwPWldYBDvllcaT77G6yfX9eEX3/NsNdizBdOLvrNzI0zNIH41yXWj88Jw5VMUqOp7INWAF8QuJCxNVR2TXE+3Rg5h2F1IjBAfAPw+9crcFTIvkohDv7CHZZsRoQYijI3rOHP5MpzakCtGLoltTMt7YfEmfXa725Zj2WGCTx93tNKq8vresq6uUlpHThUzHBQ2Z/7UBaJC9Oc/NgsHgGcqSe8ycMHcxJOTlSp4fV94evXUSbu32FLPktQ/h9cgKcBNC3g7RRH6WfgrGB/FH/KD9Kg+MGVmj+RRa9TGTR0rie6rzwB91MI8l5g4SEv6NfoKqBWPuKGbjBbCww5tkKfhQMXTRCaN98Wz6815uR+0lN4vB1W4cvWOwm5iW7avfPF3wR5QeVjSf+1SIPUb9ZdnnnBxvjzkG5YxfQLtjyTSfX9zgFkUdkqx8oflkzJW2Ddwg09RPmTNemcbcKCMP6/jDdFfj185ddQ78PaoiZyRi37osf+nFmeKQVPftgbztGc+8pWAReLsIQbjTwaSxABVue47vrYGLLbVoqi1O5KUOWqafcM0ksAbnU/LRZD01WlLH6FAs6nunBBSix1kLaBDFhDIWkx/tixaqEnFveweGTwrE94qGcwV73ezsGIVI3Vo8wa4JbRSQ/Mkt6JzbR4lbTms/nDAQZV3gmgK4BtZHVE9EFNGkkkk9llrSbAMc3nqxAPHjtyGVAE5slrFzLhgKdWqKlTmMxTk12xdAYPTRPagqRvffGZxBr8ZqyMywDTIB55O86I8E6hFsYo9mpiXI5yW5vm2fk5j6qGuX3ZyczJbBf0bSwkzc0YC4L/4ypmI1GgwevBacvIRhp7m7a5A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(31686004)(36756003)(40480700001)(40460700003)(70206006)(53546011)(70586007)(86362001)(31696002)(426003)(336012)(83380400001)(41300700001)(82740400003)(81166007)(356005)(26005)(2616005)(47076005)(2906002)(4326008)(5660300002)(30864003)(6666004)(478600001)(6636002)(44832011)(36860700001)(110136005)(16576012)(316002)(8676002)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 07:56:56.5632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f94a56e9-fe88-449d-97d5-08dc0b68644a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936

Hi Ayan,

On 18/12/2023 21:32, michal.orzel@amd.com wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Currently if user enables HVC_DCC config option in Linux, it invokes
> access to debug data transfer registers (ie MDCCSR_EL0 on arm64,
you mention status reg on arm64 and TX reg on arm32.
Instead, it should be DBGDTRTX_EL0 on arm64.

> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
> an undefined exception to the guest. And Linux crashes.
no need for a full stop before And

> 
> We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
MDCCSR_EL0 (not DBGDTR_EL0)

> is emulated as TXfull.
> Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
NIT: best practice is to refer to the latest version of a doc (i.e. J.a)

> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
> 
> Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
MDCCSR_EL0 (not DBGDTR_EL0)

> before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
> hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
> the guest to be aborted.
> 
> We also emulate DBGDTRTX_EL0 as RAZ/WI.
s/DBGDTRTX_EL0/DBGDTR[TR]X_EL0/
> 
> We have added emulation for AArch32 variant of these registers as well.
> 
> Also in the case of AArch32, DBGOSLSR is emulated in the same way as
> its AArch64 variant (ie OSLSR_EL1). This is to ensure that
> DBGOSLSR.OSLK is 0, thus MDSCR_EL1.TXfull is treated as UNK/SBZP.
> Thus only MDCCSR_EL0 can be emulated (which is DBGDTRTXINT on arm32).
> So, DBGDTR[TR]XINT is emulated as RAZ/WI.

I can see in the code that you followed my suggestion to fix DBGDSCRINT,
so that it can be accessed at EL0 (because DBGDSCREXT is RAZ). However, you do not mention it anywhere.

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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
>  xen/arch/arm/arm64/vsysreg.c         | 26 +++++++++++++++----
>  xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>  xen/arch/arm/include/asm/cpregs.h    |  2 ++
>  xen/arch/arm/include/asm/traps.h     |  4 +++
>  xen/arch/arm/traps.c                 | 18 +++++++++++++
>  xen/arch/arm/vcpreg.c                | 38 +++++++++++++++++++++++-----
>  6 files changed, 79 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..ebeb83dd65 100644
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
> @@ -172,11 +169,29 @@ void do_sysreg(struct cpu_user_regs *regs,
>      case HSR_SYSREG_MDSCR_EL1:
>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>      case HSR_SYSREG_MDCCSR_EL0:
> +    {
>          /*
> +         * Xen doesn't expose a real (or emulated) Debug Communications Channel
> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
> +         * feature. So some domains may start to probe it. For instance, the
> +         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
> +         * will try to write some characters and check if the transmit buffer
> +         * has emptied. By setting TX status bit to indicate the transmit buffer
> +         * is full. This we would hint the OS that the DCC is probably not
... is full, we would hint...

> +         * working.
> +         *
> +         * Bit 29: TX full
> +         *
>           * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>           * register as RAZ/WI above. So RO at both EL0 and EL1.
>           */
> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
> +                                  1U << 29);
> +    }
> +    case HSR_SYSREG_DBGDTR_EL0:
> +    /* DBGDTR[TR]X_EL0 share the same encoding */
> +    case HSR_SYSREG_DBGDTRTX_EL0:
> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>      HSR_SYSREG_DBG_CASES(DBGBVR):
>      HSR_SYSREG_DBG_CASES(DBGBCR):
>      HSR_SYSREG_DBG_CASES(DBGWVR):
> @@ -393,7 +408,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>       *
>       * And all other unknown registers.
>       */
> -    default:
> +    default: goto fail;
> +    fail:
What is going on here? I see no use so please remove.

>          {
>              const struct hsr_sysreg sysreg = hsr.sysreg;
>  
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
Leftover change? Please remove this prototype.

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
Leftover change? Please remove this function.

> +
> +
>  /* Read only as read as zero */
>  void handle_ro_raz(struct cpu_user_regs *regs,
>                     int regidx,
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 39aeda9dab..5087125111 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -549,18 +549,41 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>      }
>  
Above DBGDIDR, there is a comment listing unhandled registers. It looks like you forgot to
update it.

>      case HSR_CPREG32(DBGDSCRINT):
> +    {
>          /*
> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
> -         * is set to 0, which we emulated below.
> +         * Xen doesn't expose a real (or emulated) Debug Communications Channel
> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
> +         * feature. So some domains may start to probe it. For instance, the
> +         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
> +         * will try to write some characters and check if the transmit buffer
> +         * has emptied. By setting TX status bit to indicate the transmit buffer
> +         * is full. This we would hint the OS that the DCC is probably not
> +         * working.
> +         *
> +         * Bit 29: TX full
> +         *
> +         * Accessible by EL0 if DBGDSCRext.UDCCdis is set to 0, which we emulate
> +         * as RAZ/WI in the next case.
>           */
> -        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
> +
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 0, 1 << 29);
Why not 1U << 29 like in AArch64 case?

> +    }
>  
>      case HSR_CPREG32(DBGDSCREXT):
I would keep the comment that was here about MDBGen.

> +        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
> +
> +    case HSR_CPREG32(DBGOSLSR):
> +         return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1, 1 << 3);
This should be moved between DBGOSLAR and DBGOSDLR. Also, you should update a comment
listing unhandled registers (above DBGOSLAR).

> +
Please add: /* DBGDTR[TR]XINT share the same encoding */
> +    case HSR_CPREG32(DBGDTRTXINT):
> +    {
>          /*
> -         * Implement debug status and control register as RAZ/WI.
> -         * The OS won't use Hardware debug if MDBGen not set.
> +         * As DBGDSCRINT is emulated which is architecturally mapped to AArch64
> +         * register MDCCSR_EL0. MDSCR_EL1 is not emulated. So DBGDTR[TR]XINT can
> +         * only be accessed as EL0 level.
>           */
I struggle to understand this comment. The minimum EL for DBGDTR[TR]XINT is 0, which means it can
be accessed at any level. I see no need for this comment (just like there is none for arm64).

> -        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
> +        return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
> +    }
>  
>      case HSR_CPREG32(DBGVCR):
>      case HSR_CPREG32(DBGBVR0):
> @@ -590,7 +613,8 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>       *
>       * And all other unknown registers.
>       */
> -    default:
> +    default: goto fail;
> +    fail:
same as before

>          gdprintk(XENLOG_ERR,
>                   "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
>                    cp32.read ? "mrc" : "mcr",


~Michal

