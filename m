Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455F84BDCC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 20:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677083.1053495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQkq-00047l-JF; Tue, 06 Feb 2024 19:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677083.1053495; Tue, 06 Feb 2024 19:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQkq-00044X-GQ; Tue, 06 Feb 2024 19:05:12 +0000
Received: by outflank-mailman (input) for mailman id 677083;
 Tue, 06 Feb 2024 19:05:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rXQkp-00044R-8r
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 19:05:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXQko-0001oy-QS; Tue, 06 Feb 2024 19:05:10 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXQko-000577-Jy; Tue, 06 Feb 2024 19:05:10 +0000
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
	bh=9/LqaCaGVK2AihcOmcNwgx4zFOFq/CqvfKVNCDwmvV4=; b=wWx9tn1XYqO1f78tWvd1u4lYRG
	M9DowVasE7ZNg1HttM0haZ7kRob44d4wySM73dosRjKYG0lrCiyBzkvXnSVIW6/RPUEsHaeZQuykI
	A61Q1HSnC0ikQh3H2uWym1IQXg4skN3CI6x+bgGPd03KVzAhBdf6eGd/SSWJ66jGEMRk=;
Message-ID: <0c4e4a40-7327-4377-bfdd-82e69bc838ae@xen.org>
Date: Tue, 6 Feb 2024 19:05:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 luca.fancellu@arm.com
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240131121049.225044-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 31/01/2024 12:10, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Currently, if user enables HVC_DCC config option in Linux, it invokes access
> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
> arm32). As these registers are not emulated, Xen injects an undefined
> exception to the guest and Linux crashes.
> 
> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
> 
> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
> 
> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
> and returns -ENODEV in case TXfull bit is still set after writing a test
> character. This way we prevent the guest from making use of HVC DCC as a
> console.
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
> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
> partial_emulation_enabled is true or not.
> 
> 2. If partial_emulation_enabled is false, then access to HSR_SYSREG_DBGDTR_EL0,
> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
> 
>   xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++++++++----
>   xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>   2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..94f0a6c384 100644
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
> @@ -173,10 +170,32 @@ void do_sysreg(struct cpu_user_regs *regs,
>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>       case HSR_SYSREG_MDCCSR_EL0:
>           /*
> +         * Xen doesn't expose a real (or emulated) Debug Communications Channel
> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
> +         * feature. So some domains may start to probe it. For instance, the
> +         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
> +         * will try to write some characters and check if the transmit buffer
> +         * has emptied.
> +         *
> +         * By setting TX status bit (only if partial emulation is enabled) to
> +         * indicate the transmit buffer is full, we would hint the OS that the
> +         * DCC is probably not working.
> +         *
> +         * Bit 29: TX full
> +         *
>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>            * register as RAZ/WI above. So RO at both EL0 and EL1.

The sentence "we emulate that register as ..." seems to be stale?

>            */
> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
> +                                  partial_emulation ? (1U << 29) : 0);
> +
> +    case HSR_SYSREG_DBGDTR_EL0:
> +    /* DBGDTR[TR]X_EL0 share the same encoding */
> +    case HSR_SYSREG_DBGDTRTX_EL0:
> +        if ( !partial_emulation )
> +            goto fail;
> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);

AFAICT, all the emulation helpers have an explanation why we are using 
them. But here this is not the case. Can you add one?

> +
>       HSR_SYSREG_DBG_CASES(DBGBVR):
>       HSR_SYSREG_DBG_CASES(DBGBCR):
>       HSR_SYSREG_DBG_CASES(DBGWVR):
> @@ -394,6 +413,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>        * And all other unknown registers.
>        */
>       default:
> + fail:

AFAICT, this would violate MISRA 15.3 [1]. We didn't seem to have yet 
(?) accepted the rule, but I don't see we would not given I feel this is 
similar to what Rule 16.2 is trying to prevent and we accepted it.

I think case, I move all the code within default outside. And then call 
"goto fail" from the default label.

>           {
>               const struct hsr_sysreg sysreg = hsr.sysreg;
>   
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

Cheers,

[1] 
https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_15_03.c
[2] 
https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_02.c

-- 
Julien Grall

