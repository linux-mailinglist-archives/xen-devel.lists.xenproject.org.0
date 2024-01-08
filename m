Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2A826854
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 07:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663195.1033030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMjbo-0003hm-4g; Mon, 08 Jan 2024 06:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663195.1033030; Mon, 08 Jan 2024 06:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMjbo-0003g3-1h; Mon, 08 Jan 2024 06:59:40 +0000
Received: by outflank-mailman (input) for mailman id 663195;
 Mon, 08 Jan 2024 06:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0y/=IS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rMjbl-0003fx-UX
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 06:59:37 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e88::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad3c777-adf3-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 07:59:35 +0100 (CET)
Received: from SA0PR11CA0097.namprd11.prod.outlook.com (2603:10b6:806:d1::12)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 06:59:31 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::3d) by SA0PR11CA0097.outlook.office365.com
 (2603:10b6:806:d1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 06:59:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.12 via Frontend Transport; Mon, 8 Jan 2024 06:59:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 8 Jan
 2024 00:59:30 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 8 Jan 2024 00:59:29 -0600
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
X-Inumbo-ID: 7ad3c777-adf3-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6O5ih3hTc8Zfb1+6ouhSU6xt4x8iIpaxRIJVmtH18Gl+WEZ1hCcwgZIHQYV75F3GJ7e5NA2NtlwgD+swh8QvrVaPTbk1pBsJo2p+RDrVl7mdOJOOFB5EmgKSOy8QoChxUsnD+LE22ZHuhHRmzC9VS2360Aiu0OlxPrKDCXEYYgXnO2AJdEqoj5omLPVuO26f9zEJdOwJkhXzTzWY/oSMpCVXiAZ4OvYjB3rk12EDB1kDMTSA0JFR161oBjTa1HlxWVwxGSaHRLEoj8QHuYv+1zWQaGIhcVj6nvUE/EyNkjZwyoDyNraiH4lxcGiiR7FIhoIqbQIeVDow9PnaVJ99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rajwxt7GjUZEjv59/gxjbv/KqtUjJWYAr3Kb9Y4lOsM=;
 b=JVDlyicRx/NYRrsbkNuK/x9+fvIWfnEB+ZYmfpnGctMEvWj77E1mr0ZC0KEGV6x0xPkheoWSIDtJW/pHly5ImSNxs8J3Q1tKkipkf4UeNPZW/nQeUFK59uAyhVnnTUoN5aOmHXEF2kM1MnhRdI0Xn88FkNVAqOwIFP5876veA9WVJ2n5VdYZuSzma7yAgOb+35bEpnIFAXsWqvk+cMdp1upl/z/u17MbSGp9zFM6BntgUIfA7gD3aResflIRkvxd3QyvTjLYW3zalC8wgL3mxlxSJTB/4ebVZOW2asO3Y/tsYHjAZSNOJnWwvXLvsvwOKT98FKdv9WrOD9GwfhL0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rajwxt7GjUZEjv59/gxjbv/KqtUjJWYAr3Kb9Y4lOsM=;
 b=NpV2c1fJaHluqkalWnOgwANq+mlSRI4o0gHnJuEebBO60K6Z8cPy/eq2uMvkl6ajS39025yWIQdQiBeuOuyThvZRby18qTF7DlxglSO7HEAKs0wmllEszrlCBgaUrsZttts191kvrzDBvzfnMRDUBJo9hybUhA9+NMm+teRrNlQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8da36c26-9e56-41df-8558-bd7f48274a37@amd.com>
Date: Mon, 8 Jan 2024 07:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN v3 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
 <20240105112156.154807-3-ayan.kumar.halder@amd.com>
Content-Language: en-US
In-Reply-To: <20240105112156.154807-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|BL1PR12MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: debd1e3c-8f25-4f04-b05b-08dc10175ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TnHq8Vfkg4Rj+ZnChuMZLZ1qzRl9NNEyB16g01i/PyrHiAFrp/3qeFOyLHWhLAESosNXw6MdIoJv/KztheLOtmGkHCAr8nSByGmHeXn2Vh86bDXA2ZtqdxlxFSt1BAi7ga5VcNqNCMPRXLJW8IzkVDnyzyIIbw68vU2y8L5ibOBkyY8ZJSy0BVinBv2Fs15K9AYwzme5Xb4ZFXVl7/lVMzL/eWm3MOjBcuwoH0pSzK+DeAbCW1ej6sRyVBKZUGJJ5ASujtZKyIoot1ShfskfuZiNqGHpY/d+rfiSModNS94Cs1fWnhxRp8MGRyXPeW7aqCpfFWTgPjqXUWAJKPSuqGq1N9kLhn1dbqYaTkqiAANMlJRDL5jajea11VEaKqYe7DhBPug4x76qe2Ouv/wttzr8htvPC60f7+vhl7AUa+7WMegEUyk0n5clGZag3SKHDFStcX8Hc50rja7AkouS/wiksVtL48Sn51PSpEzhWRWTlBE74tM6TR8u3hp4/VQk0F16nJmPDd6ilVhTW7Hmtk21weQeed6dilGCH0lxeD2NhnqYBVeAJiQs704I10qxFv/doatVnZZXm3tYftfxVY5MXUUiIaEQjhm7XckPl7n7Xy3boHjy5jryom2TnH7XUp8uLXm3vfJ/+Sqo0kduSOBwW2MgIx8SSiPceNgk+7PHqxcRLZuXw+648Vv3W0EcswZSVNKpgtpOLW/4mi2Eiaa/0mzkegc1ZapHUJQZZz2RxQasGvqCp9DHDeOS6SVY/bGK1AhQMvT9ljEtUS8PY8tmWEXIaqMxgkMVZLW/IvVOEbyL8gTu5F6QTseRKuf7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(316002)(36860700001)(16576012)(336012)(426003)(110136005)(54906003)(31686004)(8936002)(47076005)(8676002)(36756003)(31696002)(83380400001)(44832011)(4326008)(53546011)(40460700003)(40480700001)(70586007)(70206006)(2616005)(478600001)(26005)(2906002)(82740400003)(5660300002)(41300700001)(81166007)(86362001)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 06:59:30.7926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: debd1e3c-8f25-4f04-b05b-08dc10175ce4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112

Hi Ayan,

On 05/01/2024 12:21, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Currently if user enables HVC_DCC config option in Linux, it invokes access
> to debug data transfer registers (ie DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
> arm32). As these registers are not emulated, Xen injects an undefined
> exception to the VM and Linux (running as VM) crashes.
> 
> We wish to avoid this crash by adding a partial emulation of DBGDTRTX_EL0.
> MDCCSR_EL0 is emulated as TXfull.
> 
> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
> 
> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
> it returns -ENODEV. In this way, we are preventing the VM from accessing
> DBGDTRTX_EL0 register.
AFAIK, we are preventing the VM from making use of HVC DCC as a console.
DBGDTRTX_EL0 and MDCCSR_EL0 will be accessed at least once as part of hvc_dcc_check().

> 
> We also emulate DBGDTR[TR]X_EL0 as RAZ/WI.
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
> v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
> 2. Removed the "fail" label.
> 3. Fixed the commit message.
> 
>  xen/arch/arm/arm64/vsysreg.c         | 25 +++++++++++++++++++++----
>  xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..2f70eea2e5 100644
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
> @@ -172,11 +169,31 @@ void do_sysreg(struct cpu_user_regs *regs,
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
> +         * is full, we would hint the OS that the DCC is probably not working.
> +         *
> +         * Bit 29: TX full
> +         *
>           * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>           * register as RAZ/WI above. So RO at both EL0 and EL1.
>           */
> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
> +                                  1U << 29);
I would assume that if partial emulation is not enabled, we should stick to ro_raz
instead of emulating TX set.

> +    }
> +#ifdef CONFIG_PARTIAL_EMULATION
> +    case HSR_SYSREG_DBGDTR_EL0:
> +    /* DBGDTR[TR]X_EL0 share the same encoding */
> +    case HSR_SYSREG_DBGDTRTX_EL0:
> +        if ( opt_partial_emulation )
> +            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
This is incorrect. What will happen if CONFIG_PARTIAL_EMULATION=y and opt_partial_emulation=false ?
You would fall through to cases below and end up in RAZ/WI. Instead, you should jump to default case,
so that we would inject undefined exception.

> +#endif
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

~Michal

