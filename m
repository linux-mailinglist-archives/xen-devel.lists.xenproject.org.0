Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5DFA34DCD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 19:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887937.1297365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tie55-0003rY-Sz; Thu, 13 Feb 2025 18:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887937.1297365; Thu, 13 Feb 2025 18:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tie55-0003pD-QF; Thu, 13 Feb 2025 18:36:59 +0000
Received: by outflank-mailman (input) for mailman id 887937;
 Thu, 13 Feb 2025 18:36:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tie54-0003p7-Db
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 18:36:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8058d832-ea39-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 19:36:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DE865C5619;
 Thu, 13 Feb 2025 18:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D20C4CEE7;
 Thu, 13 Feb 2025 18:36:53 +0000 (UTC)
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
X-Inumbo-ID: 8058d832-ea39-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471814;
	bh=Snzq+Su5PiVY6TVQKTGwA4OYuu/qp020uTmHoot8VSI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HNQKqHOll/jiElmV+TtnBIFcoOEEH3Zy3t8Et8CzkKP/OFfLKhDdaehGXaYDADDr+
	 gpdge2iCNZyGIQlPKN3lEH8CEsbKcjvZ0CN6lJVV0GgBQbS/L1a4zqjAWUh18T8FwU
	 3TElAm3V7YXylwQ35TQKIZ2ct78ClTOqZr9BpdwMe3cEX+27mYeS6g1qZXzt5mYvoM
	 5Wf1yxx8wb0dfbtmqNVni2B0ORcRHKaY/AzZg/o+GWj/3DXPwOAkoI1mPX+9yeSWZZ
	 PC7k+BBZcz08HFd+yGIR0q1BAIHakKmHHJ08xQAtas/XI5+qFI4BoOk2DgtO/cgEMJ
	 y3LZPC7xg3N4g==
Date: Thu, 13 Feb 2025 10:36:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/2] arch: arm64: always set IL=1 when injecting
 undefined exception
In-Reply-To: <20250213153748.2869989-2-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2502131036470.619090@ubuntu-linux-20-04-desktop>
References: <20250213153748.2869989-1-volodymyr_babchuk@epam.com> <20250213153748.2869989-2-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Volodymyr Babchuk wrote:
> ARM Architecture Reference Manual states that IL field of ESR_EL1
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
> 
> Changes in v2:
>  - Removed unused parameter from p2m_set_way_flush()
> ---
>  xen/arch/arm/arm64/vsysreg.c           | 10 +++++-----
>  xen/arch/arm/include/asm/arm64/traps.h |  2 +-
>  xen/arch/arm/include/asm/p2m.h         |  3 +--
>  xen/arch/arm/include/asm/traps.h       |  2 +-
>  xen/arch/arm/p2m.c                     |  5 ++---
>  xen/arch/arm/traps.c                   | 24 ++++++++++++------------
>  xen/arch/arm/vcpreg.c                  | 26 +++++++++++++-------------
>  xen/arch/arm/vsmc.c                    |  6 ++----
>  8 files changed, 37 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index c73b2c95ce..d14258290f 100644
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
> @@ -109,7 +109,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>      case HSR_SYSREG_DCCSW:
>      case HSR_SYSREG_DCCISW:
>          if ( !hsr.sysreg.read )
> -            p2m_set_way_flush(current, regs, hsr);
> +            p2m_set_way_flush(current, regs);
>          break;
>  
>      /*
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
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 4818dd4b6a..594dc40041 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -298,8 +298,7 @@ void p2m_domain_creation_finished(struct domain *d);
>   */
>  int p2m_cache_flush_range(struct domain *d, gfn_t *pstart, gfn_t end);
>  
> -void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
> -                       const union hsr hsr);
> +void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs);
>  
>  void p2m_toggle_cache(struct vcpu *v, bool was_enabled);
>  
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
> index 65b70955e3..ef8bd4b6ab 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -428,8 +428,7 @@ int p2m_cache_flush_range(struct domain *d, gfn_t *pstart, gfn_t end)
>   *
>   *  - Once the caches are enabled, we stop trapping VM ops.
>   */
> -void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
> -                       const union hsr hsr)
> +void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs)
>  {
>      /* This function can only work with the current vCPU. */
>      ASSERT(v == current);
> @@ -438,7 +437,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
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
> index 0b336875a4..e7c484f2c1 100644
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
> @@ -232,7 +232,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>      case HSR_CPREG32(DCCSW):
>      case HSR_CPREG32(DCCISW):
>          if ( !cp32.read )
> -            p2m_set_way_flush(current, regs, hsr);
> +            p2m_set_way_flush(current, regs);
>          break;
>  
>      /*
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

