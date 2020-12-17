Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC392DDBF2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56243.98354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2t9-0005iN-UO; Thu, 17 Dec 2020 23:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56243.98354; Thu, 17 Dec 2020 23:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2t9-0005hy-RO; Thu, 17 Dec 2020 23:40:51 +0000
Received: by outflank-mailman (input) for mailman id 56243;
 Thu, 17 Dec 2020 23:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2t8-0005ht-Eu
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:40:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86ba6404-e001-474e-91ca-abcd2191442c;
 Thu, 17 Dec 2020 23:40:49 +0000 (UTC)
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
X-Inumbo-ID: 86ba6404-e001-474e-91ca-abcd2191442c
Date: Thu, 17 Dec 2020 15:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608248449;
	bh=H0wdoo90Hf8bEXLVCXOxZPi1Uw1VvbJ0fo935w8qQIU=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Cj0Tt74ri2N+BGlbGkuZNqwoyNjewxPS9JRHhwVzmX6OXATcdIcT/GDzBbklYwqlV
	 uIzh8LzRio2C0HXWIUb/9BnQ+cvQo5qLBJ5nHKfs2u58UHiJQFAO7mN2h0hnzZJQxx
	 AV/PxucmC2G9t/s5g7jEZ0T++7VE/bURUZ4F752Yl9jzJ4HHCa3jHlM/g/hVRqdla7
	 XKXEgJ91uDiVrd0TKpqWMxLTYRghW0zACu9umpyDMa4X0RyjqiIyKUNUcrP2+Kaa4o
	 oitaXF5qHRdhq/BuArwHsMQeux29q1/Eac7fMsZ9xQUiUMe5MnSf1sHzk0f1CW9aD6
	 DKBo3OpG5yeRg==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 7/8] xen/arm: Add CP10 exception support to handle
 MVFR
In-Reply-To: <841e5cd22290158d9b0c5d6dedafd01ed9a3d0bc.1608214355.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012171539390.4040@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <841e5cd22290158d9b0c5d6dedafd01ed9a3d0bc.1608214355.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2020, Bertrand Marquis wrote:
> Add support for cp10 exceptions decoding to be able to emulate the
> values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
> This is required for aarch32 guests accessing MVFR registers using
> vmrs and vmsr instructions.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V2: Rebase
> Changes in V3:
>   Add case for MVFR2, fix typo VMFR <-> MVFR.
> Changes in V4:
>   Fix typo HSR -> HCR
>   Move no to not comment fix to previous patch
> 
> ---
>  xen/arch/arm/traps.c             |  5 +++++
>  xen/arch/arm/vcpreg.c            | 37 ++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/perfc_defn.h |  1 +
>  xen/include/asm-arm/traps.h      |  1 +
>  4 files changed, 44 insertions(+)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 22bd1bd4c6..28d9d64558 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
>          perfc_incr(trap_cp14_dbg);
>          do_cp14_dbg(regs, hsr);
>          break;
> +    case HSR_EC_CP10:
> +        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
> +        perfc_incr(trap_cp10);
> +        do_cp10(regs, hsr);
> +        break;
>      case HSR_EC_CP:
>          GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>          perfc_incr(trap_cp);
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 1fe07fe02a..cbad8f25a0 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -664,6 +664,43 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
>      inject_undef_exception(regs, hsr);
>  }
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
> +     * HCR.TID3 is trapping access to MVFR register used to identify the
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
>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>  {
>      const struct hsr_cp cp = hsr.cp;
> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc_defn.h
> index 6a83185163..31f071222b 100644
> --- a/xen/include/asm-arm/perfc_defn.h
> +++ b/xen/include/asm-arm/perfc_defn.h
> @@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
>  PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
>  PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
>  PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
> +PERFCOUNTER(trap_cp10,     "trap: cp10 access")
>  PERFCOUNTER(trap_cp,       "trap: cp access")
>  PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
>  PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 997c37884e..c4a3d0fb1b 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
>  
>  /* SMCCC handling */
> -- 
> 2.17.1
> 

