Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D3803049
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646789.1009325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6F1-0004K0-OF; Mon, 04 Dec 2023 10:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646789.1009325; Mon, 04 Dec 2023 10:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6F1-0004IM-L2; Mon, 04 Dec 2023 10:31:55 +0000
Received: by outflank-mailman (input) for mailman id 646789;
 Mon, 04 Dec 2023 10:31:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rA6F0-0004IG-QE
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:31:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rA6Ew-0007NF-EX; Mon, 04 Dec 2023 10:31:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rA6Ew-00048u-5a; Mon, 04 Dec 2023 10:31:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=4RdpTsqHGFFuyHBjzvnx2fGQAhTh7bUYJAnUCw+aLD4=; b=19Z6c36mYRZefsECBPDv5pyr33
	nSss1tXG1HIp5UWSajIf51q6SGEBNfsUFCJGYX9MGsbSlG9LJcSSvBbCVb9f4z44NyGZAoVWnOdx+
	EK4R/XJ9tEU42wfhdDfSCms4QuLlh2eRsqmPTXTMSXvVsBO6diRbKbnz6rGzg4vJaQ40=;
Message-ID: <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
Date: Mon, 4 Dec 2023 10:31:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 stefano.stabellini@amd.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 01/12/2023 18:50, Ayan Kumar Halder wrote:
> Currently if user enables HVC_DCC config option in Linux, it invokes
> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
> an undefined exception to the guest. And Linux crashes.

I am missing some data points here to be able to say whether I would be 
ok with emulating the registers. So some questions:
   * As you wrote below, HVC_DCC will return -ENODEV after this 
emulation. So may I ask what's the use case to enable it? (e.g. is there 
a distro turning this on?)
  * Linux is writing to the registers unconditionally, but is the spec 
mandating the implementation of the registers? (I couldn't find either way)
  * When was this check introduced in Linux? Did it ever changed?

> 
> We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
> is emulated as TXfull | RXfull.

Skimming through the Arm Arm, I see that TXfull and Rxfull indicates 
that both buffers are full but it doesn't explicitly say this means the 
feature is not available.

I understand this is what Linux checks, but if we want to partially 
emulate the registers in Xen, then I'd like us to make sure this is 
backed by the Arm Arm rather than based on Linux implementation (which 
can change at any point).

> Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
> Also D17.3.7 DBGDTRRX_EL0,
> " If RXfull is set to 1, return the last value written to DTRRX."
> 
> Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
> before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
> hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
> the guest to be aborted.

See above, what guarantees us that Linux will not change this behavior 
in the future?

> 
> We also emulate DBGDTRTX_EL0 as RAZ/WI.
> 
> We have added emulation for AArch32 variant of these registers as well.
> Also, we have added handle_read_val_wi() to emulate DBGDSCREXT register
> to return a specific value (ie TXfull | RXfull) and ignore any writes
> to this register.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

We usually expect the first Signed-off-by to also be the author. So 
should Michal be the author of this patch?

> ---
>   xen/arch/arm/arm64/vsysreg.c         | 21 ++++++++++++++----
>   xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>   xen/arch/arm/include/asm/cpregs.h    |  2 ++
>   xen/arch/arm/include/asm/traps.h     |  4 ++++
>   xen/arch/arm/traps.c                 | 18 +++++++++++++++
>   xen/arch/arm/vcpreg.c                | 33 +++++++++++++++++++++-------
>   6 files changed, 69 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..5082dfb02e 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>        *
>        * Unhandled:
>        *    MDCCINT_EL1
> -     *    DBGDTR_EL0
> -     *    DBGDTRRX_EL0
> -     *    DBGDTRTX_EL0
>        *    OSDTRRX_EL1
>        *    OSDTRTX_EL1
>        *    OSECCR_EL1
> @@ -172,11 +169,27 @@ void do_sysreg(struct cpu_user_regs *regs,
>       case HSR_SYSREG_MDSCR_EL1:
>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>       case HSR_SYSREG_MDCCSR_EL0:
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
>           /*
>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>            * register as RAZ/WI above. So RO at both EL0 and EL1.
>            */
> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
> +                                  guest_reg_value);
> +    }
> +    case HSR_SYSREG_DBGDTR_EL0:
> +    /* DBGDTR[TR]X_EL0 share the same encoding */
> +    case HSR_SYSREG_DBGDTRTX_EL0:
> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>       HSR_SYSREG_DBG_CASES(DBGBVR):
>       HSR_SYSREG_DBG_CASES(DBGBCR):
>       HSR_SYSREG_DBG_CASES(DBGWVR):
> diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
> index e691d41c17..1495ccddea 100644
> --- a/xen/arch/arm/include/asm/arm64/hsr.h
> +++ b/xen/arch/arm/include/asm/arm64/hsr.h
> @@ -47,6 +47,9 @@
>   #define HSR_SYSREG_OSDLR_EL1      HSR_SYSREG(2,0,c1,c3,4)
>   #define HSR_SYSREG_DBGPRCR_EL1    HSR_SYSREG(2,0,c1,c4,4)
>   #define HSR_SYSREG_MDCCSR_EL0     HSR_SYSREG(2,3,c0,c1,0)
> +#define HSR_SYSREG_DBGDTR_EL0     HSR_SYSREG(2,3,c0,c4,0)
> +#define HSR_SYSREG_DBGDTRTX_EL0   HSR_SYSREG(2,3,c0,c5,0)
> +#define HSR_SYSREG_DBGDTRRX_EL0   HSR_SYSREG(2,3,c0,c5,0)
>   
>   #define HSR_SYSREG_DBGBVRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,4)
>   #define HSR_SYSREG_DBGBCRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,5)
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6b083de204..aec9e8f329 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -75,6 +75,8 @@
>   #define DBGDIDR         p14,0,c0,c0,0   /* Debug ID Register */
>   #define DBGDSCRINT      p14,0,c0,c1,0   /* Debug Status and Control Internal */
>   #define DBGDSCREXT      p14,0,c0,c2,2   /* Debug Status and Control External */
> +#define DBGDTRRXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Receive */
> +#define DBGDTRTXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Transmit */
>   #define DBGVCR          p14,0,c0,c7,0   /* Vector Catch */
>   #define DBGBVR0         p14,0,c0,c0,4   /* Breakpoint Value 0 */
>   #define DBGBCR0         p14,0,c0,c0,5   /* Breakpoint Control 0 */
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 883dae368e..a2692722d5 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -56,6 +56,10 @@ void handle_ro_raz(struct cpu_user_regs *regs, int regidx, bool read,
>   void handle_ro_read_val(struct cpu_user_regs *regs, int regidx, bool read,
>                           const union hsr hsr, int min_el, register_t val);
>   
> +/* Read only as value provided with 'val' argument, write ignore */
> +void handle_read_val_wi(struct cpu_user_regs *regs, int regidx,
> +                        const union hsr hsr, int min_el, register_t val);
> +
>   /* Co-processor registers emulation (see arch/arm/vcpreg.c). */
>   void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr);
>   void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 3784e8276e..f5ab555b19 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1676,6 +1676,24 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
>       advance_pc(regs, hsr);
>   }
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
>   /* Read only as read as zero */
>   void handle_ro_raz(struct cpu_user_regs *regs,
>                      int regidx,
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 39aeda9dab..3f1276f96e 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -548,20 +548,37 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>           break;
>       }
>   
> -    case HSR_CPREG32(DBGDSCRINT):
> +    case HSR_CPREG32(DBGDSCREXT):
> +    {
>           /*
> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
> -         * is set to 0, which we emulated below.
> +         * Bit 29: TX full, bit 30: RX full
> +         * Given that we emulate DCC registers as RAZ/WI, doing the same for
> +         * DBGDSCRint would cause a guest to continue using the DCC despite no
> +         * real effect. Setting the TX/RX status bits should result in a probe
> +         * fail (based on Linux behavior).
If you want to mention Linux then you need to be a bit more specific 
because Linux can change at any point. So you at least want to specify 
the Linux version and place in the code.

So this doesn't get stale as soon as the HVC_DCC driver changes.

>            */
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
>           /*
> -         * Implement debug status and control register as RAZ/WI.
> -         * The OS won't use Hardware debug if MDBGen not set.
> +         * Bit 29: TX full, bit 30: RX full
> +         * Given that we emulate DCC registers as RAZ/WI, doing the same for
> +         * DBGDSCRint would cause a guest to continue using the DCC despite no
> +         * real effect. Setting the TX/RX status bits should result in a probe
> +         * fail (based on Linux behavior).
>            */
> -        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
> +        register_t guest_reg_value = (1U << 29) | (1U << 30);
> +
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>   
> +    case HSR_CPREG32(DBGDTRTXINT):
>       case HSR_CPREG32(DBGVCR):
>       case HSR_CPREG32(DBGBVR0):
>       case HSR_CPREG32(DBGBCR0):

Cheers,

-- 
Julien Grall

