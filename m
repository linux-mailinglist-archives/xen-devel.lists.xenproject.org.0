Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703342D4E97
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48841.86409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8gO-00083I-Ip; Wed, 09 Dec 2020 23:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48841.86409; Wed, 09 Dec 2020 23:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8gO-00082t-Fg; Wed, 09 Dec 2020 23:15:40 +0000
Received: by outflank-mailman (input) for mailman id 48841;
 Wed, 09 Dec 2020 23:15:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn8gN-00082o-CD
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:15:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8gM-0004m9-CA; Wed, 09 Dec 2020 23:15:38 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8gL-0000zC-W0; Wed, 09 Dec 2020 23:15:38 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=OiKLK7GW6v2lqJO/UHJcHAkBq0gqz2zx7OfltBTnKB0=; b=i8itkNw1GslJERp4ClnloFN9ey
	3JwQSz4Bkq3UYY+SF25znwQj5zlHFZ5m+eBLZcPzjb+Jjm3jn+ZEZkFXzljvB/sguAU4WcNLyV98+
	vKlxkmRaT4eqghaZ3dzsKtQJsC0RXv0jdFn0s1YgmZCvGX0S15SzMhfUoxpKWbPqqniA=;
Subject: Re: [PATCH v3 6/7] xen/arm: Add CP10 exception support to handle MVFR
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <a72a378cd1d4e5c6670980cf4d201d457abe5abc.1607524536.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e06cde1e-2833-4335-9456-04aae3f6d287@xen.org>
Date: Wed, 9 Dec 2020 23:15:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a72a378cd1d4e5c6670980cf4d201d457abe5abc.1607524536.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 09/12/2020 16:30, Bertrand Marquis wrote:
> Add support for cp10 exceptions decoding to be able to emulate the
> values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
> This is required for aarch32 guests accessing MVFR registers using
> vmrs and vmsr instructions.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: Rebase
> Changes in V3:
>    Add case for MVFR2, fix typo VMFR <-> MVFR.
> 
> ---
>   xen/arch/arm/traps.c             |  5 ++++
>   xen/arch/arm/vcpreg.c            | 39 +++++++++++++++++++++++++++++++-
>   xen/include/asm-arm/perfc_defn.h |  1 +
>   xen/include/asm-arm/traps.h      |  1 +
>   4 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 22bd1bd4c6..28d9d64558 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
>           perfc_incr(trap_cp14_dbg);
>           do_cp14_dbg(regs, hsr);
>           break;
> +    case HSR_EC_CP10:
> +        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
> +        perfc_incr(trap_cp10);
> +        do_cp10(regs, hsr);
> +        break;
>       case HSR_EC_CP:
>           GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>           perfc_incr(trap_cp);
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index d371a1c38c..da4e22a467 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -319,7 +319,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
>       GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
>       GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
> -    /* MVFR registers are in cp10 no cp15 */
> +    /* MVFR registers are in cp10 not cp15 */

The code was originally added in the previous patch. Please either 
introduce the comment here or fold it in the previous patch.

>   
>       HSR_CPREG32_TID3_RESERVED_CASE:
>           /* Handle all reserved registers as RAZ */
> @@ -638,6 +638,43 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
>       inject_undef_exception(regs, hsr);
>   }
>   
> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
> +{
> +    const struct hsr_cp32 cp32 = hsr.cp32;
> +    int regidx = cp32.reg;
> +
> +    if ( !check_conditional_instr(regs, hsr) )
> +    {
> +        advance_pc(regs, hsr);
> +        return;
> +    }
> +
> +    switch ( hsr.bits & HSR_CP32_REGS_MASK )
> +    {
> +    /*
> +     * HSR.TID3 is trapping access to MVFR register used to identify the
> +     * VFP/Simd using VMRS/VMSR instructions.
> +     * Exception encoding is using MRC/MCR standard with the reg field in Crn
> +     * as are declared MVFR0 and MVFR1 in cpregs.h
> +     */
> +    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
> +    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
> +    GENERATE_TID3_INFO(MVFR2, mvfr, 2)
> +
> +    default:
> +        gdprintk(XENLOG_ERR,
> +                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
> +                 cp32.read ? "mrc" : "mcr",
> +                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
> +                 hsr.bits & HSR_CP32_REGS_MASK);
> +        inject_undef_exception(regs, hsr);
> +        return;
> +    }
> +
> +    advance_pc(regs, hsr);
> +}
> +
>   void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>   {
>       const struct hsr_cp cp = hsr.cp;
> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc_defn.h
> index 6a83185163..31f071222b 100644
> --- a/xen/include/asm-arm/perfc_defn.h
> +++ b/xen/include/asm-arm/perfc_defn.h
> @@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
>   PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
>   PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
>   PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
> +PERFCOUNTER(trap_cp10,     "trap: cp10 access")
>   PERFCOUNTER(trap_cp,       "trap: cp access")
>   PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
>   PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 997c37884e..c4a3d0fb1b 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
>   void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
>   void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
>   void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
>   void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
>   
>   /* SMCCC handling */
> 

-- 
Julien Grall

