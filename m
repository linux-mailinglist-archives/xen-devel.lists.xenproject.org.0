Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437AA331ED
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886795.1296400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKps-0002E1-7V; Wed, 12 Feb 2025 22:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886795.1296400; Wed, 12 Feb 2025 22:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKps-0002Bb-4U; Wed, 12 Feb 2025 22:04:00 +0000
Received: by outflank-mailman (input) for mailman id 886795;
 Wed, 12 Feb 2025 22:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiKpq-0002BT-RF
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:03:58 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40119d11-e98d-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 23:03:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A8369A41B59;
 Wed, 12 Feb 2025 22:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49F0C4CEDF;
 Wed, 12 Feb 2025 22:03:52 +0000 (UTC)
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
X-Inumbo-ID: 40119d11-e98d-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739397833;
	bh=XJDyledOL8qRMHNb5b1mBrmqAlv8PpYDVrrtfn7c+TM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cQ1ERLc/+FYxRUGFhA+/7QunlgKqqISMu56wx7yHNv/mXtycKMTIm/d7V3FxK5A4U
	 Am8hnwfOUZ5Ypxc5e/znt8GC9h0R6dbtDhwFo41ovS2cG00Gu6SinCb5hVRMHAxxnN
	 /pCTwK+u3eEjgT1UgUBbwcx9U4RQqTszew20w3yxGsqYLQ7cp2uwYcqao85S4af3ZM
	 TIM24M2Eyds2t2Ug1Dy3eSdNdSUmxvI9O1uahiaCmX3apX1JqcTJlBEcAynohb3cQe
	 G8xDy3EVONPufk+2i5dZiGWmcvYyNnCEGnrbU9a0U6wj55DVm/biiHiUR0mBZWflE2
	 nH/Uuw3D+21Kg==
Date: Wed, 12 Feb 2025 14:03:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arch: arm64: always set EL=1 when injecting undefined
 exception
In-Reply-To: <20250212144950.2818089-1-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2502121403410.619090@ubuntu-linux-20-04-desktop>
References: <20250212144950.2818089-1-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, Volodymyr Babchuk wrote:
> ARM Architecture Reference Manual states that EL field of ESR_EL1
> register should be 1 when EC is 0b000000 aka HSR_EC_UNKNOWN.
> 
> Section D24.2.40, page D24-7337 of ARM DDI 0487L:
> 
>   IL, bit [25]
>   Instruction Length for synchronous exceptions. Possible values of this bit are:
> 
>   [...]
> 
>   0b1 - 32-bit instruction trapped.
>   This value is also used when the exception is one of the following:
>   [...]
>    - An exception reported using EC value 0b000000.
> 
> To align code with the specification, set .len field to 1 in
> inject_undef64_exception() and remove unneeded second parameter.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/vsysreg.c           |  8 ++++----
>  xen/arch/arm/include/asm/arm64/traps.h |  2 +-
>  xen/arch/arm/include/asm/traps.h       |  2 +-
>  xen/arch/arm/p2m.c                     |  2 +-
>  xen/arch/arm/traps.c                   | 24 ++++++++++++------------
>  xen/arch/arm/vcpreg.c                  | 24 ++++++++++++------------
>  xen/arch/arm/vsmc.c                    |  6 ++----
>  7 files changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index c73b2c95ce..29622a8593 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -95,7 +95,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>       */
>      case HSR_SYSREG_ACTLR_EL1:
>          if ( regs_mode_is_user(regs) )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>          if ( hsr.sysreg.read )
>              set_user_reg(regs, regidx, v->arch.actlr);
>          break;
> @@ -267,7 +267,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>      case HSR_SYSREG_CNTP_TVAL_EL0:
>      case HSR_SYSREG_CNTP_CVAL_EL0:
>          if ( !vtimer_emulate(regs, hsr) )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>          break;
>  
>      /*
> @@ -280,7 +280,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>      case HSR_SYSREG_ICC_SGI0R_EL1:
>  
>          if ( !vgic_emulate(regs, hsr) )
> -            return inject_undef64_exception(regs, hsr.len);
> +            return inject_undef64_exception(regs);
>          break;
>  
>      /*
> @@ -440,7 +440,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>      gdprintk(XENLOG_ERR,
>               "unhandled 64-bit sysreg access %#"PRIregister"\n",
>               hsr.bits & HSR_SYSREG_REGS_MASK);
> -    inject_undef_exception(regs, hsr);
> +    inject_undef_exception(regs);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
> index a347cb13d6..3be2fa69ee 100644
> --- a/xen/arch/arm/include/asm/arm64/traps.h
> +++ b/xen/arch/arm/include/asm/arm64/traps.h
> @@ -1,7 +1,7 @@
>  #ifndef __ASM_ARM64_TRAPS__
>  #define __ASM_ARM64_TRAPS__
>  
> -void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
> +void inject_undef64_exception(struct cpu_user_regs *regs);
>  
>  void do_sysreg(struct cpu_user_regs *regs,
>                 const union hsr hsr);
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 9a60dbf70e..3b40afe262 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -44,7 +44,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr);
>  
>  void advance_pc(struct cpu_user_regs *regs, const union hsr hsr);
>  
> -void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hsr);
> +void inject_undef_exception(struct cpu_user_regs *regs);
>  
>  /* read as zero and write ignore */
>  void handle_raz_wi(struct cpu_user_regs *regs, int regidx, bool read,
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 65b70955e3..6196cad0d4 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -438,7 +438,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
>      {
>          gprintk(XENLOG_ERR,
>                  "The cache should be flushed by VA rather than by set/way.\n");
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>          return;
>      }
>  
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 737f4d65e3..5338d5c033 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -533,12 +533,12 @@ static vaddr_t exception_handler64(struct cpu_user_regs *regs, vaddr_t offset)
>  }
>  
>  /* Inject an undefined exception into a 64 bit guest */
> -void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len)
> +void inject_undef64_exception(struct cpu_user_regs *regs)
>  {
>      vaddr_t handler;
>      const union hsr esr = {
>          .iss = 0,
> -        .len = instr_len,
> +        .len = 1,
>          .ec = HSR_EC_UNKNOWN,
>      };
>  
> @@ -606,13 +606,13 @@ static void inject_iabt64_exception(struct cpu_user_regs *regs,
>  
>  #endif
>  
> -void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hsr)
> +void inject_undef_exception(struct cpu_user_regs *regs)
>  {
>          if ( is_32bit_domain(current->domain) )
>              inject_undef32_exception(regs);
>  #ifdef CONFIG_ARM_64
>          else
> -            inject_undef64_exception(regs, hsr.len);
> +            inject_undef64_exception(regs);
>  #endif
>  }
>  
> @@ -1418,7 +1418,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>      if ( hsr.iss != XEN_HYPERCALL_TAG )
>      {
>          gprintk(XENLOG_WARNING, "Invalid HVC imm 0x%x\n", hsr.iss);
> -        return inject_undef_exception(regs, hsr);
> +        return inject_undef_exception(regs);
>      }
>  
>      curr->hcall_preempted = false;
> @@ -1655,7 +1655,7 @@ void handle_raz_wi(struct cpu_user_regs *regs,
>      ASSERT((min_el == 0) || (min_el == 1));
>  
>      if ( min_el > 0 && regs_mode_is_user(regs) )
> -        return inject_undef_exception(regs, hsr);
> +        return inject_undef_exception(regs);
>  
>      if ( read )
>          set_user_reg(regs, regidx, 0);
> @@ -1674,10 +1674,10 @@ void handle_wo_wi(struct cpu_user_regs *regs,
>      ASSERT((min_el == 0) || (min_el == 1));
>  
>      if ( min_el > 0 && regs_mode_is_user(regs) )
> -        return inject_undef_exception(regs, hsr);
> +        return inject_undef_exception(regs);
>  
>      if ( read )
> -        return inject_undef_exception(regs, hsr);
> +        return inject_undef_exception(regs);
>      /* else: ignore */
>  
>      advance_pc(regs, hsr);
> @@ -1694,10 +1694,10 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
>      ASSERT((min_el == 0) || (min_el == 1));
>  
>      if ( min_el > 0 && regs_mode_is_user(regs) )
> -        return inject_undef_exception(regs, hsr);
> +        return inject_undef_exception(regs);
>  
>      if ( !read )
> -        return inject_undef_exception(regs, hsr);
> +        return inject_undef_exception(regs);
>  
>      set_user_reg(regs, regidx, val);
>  
> @@ -2147,7 +2147,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_regs *regs)
>      case HSR_EC_SVE:
>          GUEST_BUG_ON(regs_mode_is_32bit(regs));
>          gprintk(XENLOG_WARNING, "Domain tried to use SVE while not allowed\n");
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>          break;
>  #endif
>  
> @@ -2164,7 +2164,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_regs *regs)
>          gprintk(XENLOG_WARNING,
>                  "Unknown Guest Trap. HSR=%#"PRIregister" EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
>                  hsr.bits, hsr.ec, hsr.len, hsr.iss);
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>          break;
>      }
>  }
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 0b336875a4..a7f627bfe0 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -206,7 +206,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>      case HSR_CPREG32(CNTP_CTL):
>      case HSR_CPREG32(CNTP_TVAL):
>          if ( !vtimer_emulate(regs, hsr) )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>          break;
>  
>      /*
> @@ -217,7 +217,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       */
>      case HSR_CPREG32(ACTLR):
>          if ( regs_mode_is_user(regs) )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>          if ( cp32.read )
>              set_user_reg(regs, regidx, v->arch.actlr);
>          break;
> @@ -397,7 +397,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>                   cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
>          gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#"PRIregister"\n",
>                   hsr.bits & HSR_CP32_REGS_MASK);
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>          return;
>      }
>      advance_pc(regs, hsr);
> @@ -421,7 +421,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr)
>       */
>      case HSR_CPREG64(CNTP_CVAL):
>          if ( !vtimer_emulate(regs, hsr) )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>          break;
>  
>      /*
> @@ -433,7 +433,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr)
>      case HSR_CPREG64(ICC_ASGI1R):
>      case HSR_CPREG64(ICC_SGI0R):
>          if ( !vgic_emulate(regs, hsr) )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>          break;
>  
>      GENERATE_CASE(TTBR0, 64)
> @@ -467,7 +467,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr)
>              gdprintk(XENLOG_ERR,
>                       "unhandled 64-bit CP15 access %#"PRIregister"\n",
>                       hsr.bits & HSR_CP64_REGS_MASK);
> -            inject_undef_exception(regs, hsr);
> +            inject_undef_exception(regs);
>              return;
>          }
>      }
> @@ -532,7 +532,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>           * is set to 0, which we emulated below.
>           */
>          if ( !cp32.read )
> -            return inject_undef_exception(regs, hsr);
> +            return inject_undef_exception(regs);
>  
>          /* Implement the minimum requirements:
>           *  - Number of watchpoints: 1
> @@ -631,7 +631,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
>               cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
>      gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
>               hsr.bits & HSR_CP32_REGS_MASK);
> -    inject_undef_exception(regs, hsr);
> +    inject_undef_exception(regs);
>  }
>  
>  void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
> @@ -669,7 +669,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
>               cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
>      gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#"PRIregister"\n",
>               hsr.bits & HSR_CP64_REGS_MASK);
> -    inject_undef_exception(regs, hsr);
> +    inject_undef_exception(regs);
>  }
>  
>  void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
> @@ -698,7 +698,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
>      gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#"PRIregister"\n",
>               hsr.bits & HSR_CP64_REGS_MASK);
>  
> -    inject_undef_exception(regs, hsr);
> +    inject_undef_exception(regs);
>  }
>  
>  void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
> @@ -731,7 +731,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
>                   cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
>          gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#"PRIregister"\n",
>                   hsr.bits & HSR_CP32_REGS_MASK);
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>          return;
>      }
>      
> @@ -756,7 +756,7 @@ void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>  
>      ASSERT(!cp.tas); /* We don't trap SIMD instruction */
>      gdprintk(XENLOG_ERR, "unhandled CP%d access\n", cp.coproc);
> -    inject_undef_exception(regs, hsr);
> +    inject_undef_exception(regs);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 62d8117a12..e253865b6c 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -346,13 +346,11 @@ void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr)
>      if ( vsmccc_handle_call(regs) )
>          advance_pc(regs, hsr);
>      else
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>  }
>  
>  void do_trap_hvc_smccc(struct cpu_user_regs *regs)
>  {
> -    const union hsr hsr = { .bits = regs->hsr };
> -
>      /*
>       * vsmccc_handle_call() will return false if this call is not
>       * SMCCC compatible (e.g. immediate value != 0). As it is not
> @@ -360,7 +358,7 @@ void do_trap_hvc_smccc(struct cpu_user_regs *regs)
>       * ARM_SMCCC_ERR_UNKNOWN_FUNCTION.
>       */
>      if ( !vsmccc_handle_call(regs) )
> -        inject_undef_exception(regs, hsr);
> +        inject_undef_exception(regs);
>  }
>  
>  /*
> -- 
> 2.47.1
> 

