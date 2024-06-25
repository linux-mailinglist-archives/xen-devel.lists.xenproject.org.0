Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E5915B47
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747091.1154395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuUw-0005R3-Kw; Tue, 25 Jun 2024 00:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747091.1154395; Tue, 25 Jun 2024 00:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuUw-0005Ns-HW; Tue, 25 Jun 2024 00:57:26 +0000
Received: by outflank-mailman (input) for mailman id 747091;
 Tue, 25 Jun 2024 00:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuUv-0005Nl-Ne
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:57:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e19ab8c7-328d-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:57:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 20AF96035D;
 Tue, 25 Jun 2024 00:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156AAC2BBFC;
 Tue, 25 Jun 2024 00:57:20 +0000 (UTC)
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
X-Inumbo-ID: e19ab8c7-328d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277041;
	bh=pW78CccedCZsn3F7jeWfItOZHI7pswqs8KkCf56uIvY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FZEIo7tHozttVO9hNhHuEswSH46JM3wPdowfuyN6ULa89HG0QB0bR6ou1hGK+u+9L
	 JwmCyYwmvBTSsddT8qDIQcqtqkpettNF25k/DQMG8bitIwO7czH3ArPhF6sJggqmM3
	 2Vgurr1zCaEGG+cmLrybMf8CuDYuuCxzsdxsbWSjSyb1pw5ql3c8y+/1dNRnUYSnvD
	 RUaAQBzvZkXERWybVgOZQnxPaDCVgDFgkCViX2h+Q0Kr39nh2Jw6JxwhFOm3AkS7es
	 Fn9d7h+pfVpGpXJrqjGjwYVpB+wOWaaKYRM+DEYyrVV8u8sGDMlta8JqiyT1+SM0Tv
	 gR6dq123E+FMw==
Date: Mon, 24 Jun 2024 17:57:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 07/13] x86/hvm: address violations of MISRA C Rule
 16.3
In-Reply-To: <a20efca7042ea8f351516ea521edccd89b475929.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241755480.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <a20efca7042ea8f351516ea521edccd89b475929.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> MISRA C Rule 16.3 states that "An unconditional `break' statement shall
> terminate every switch-clause".
> 
> Add pseudo keyword fallthrough or missing break statement
> to address violations of the rule.
> 
> As a defensive measure, return -EOPNOTSUPP in case an unreachable
> return statement is reached.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
> - replace hypened fallthrough with the pseudo keyword.
> ---
>  xen/arch/x86/hvm/emulate.c   | 9 ++++++---
>  xen/arch/x86/hvm/hvm.c       | 6 ++++++
>  xen/arch/x86/hvm/hypercall.c | 1 +
>  xen/arch/x86/hvm/irq.c       | 1 +
>  4 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index 02e378365b..859c21a5ab 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -339,7 +339,7 @@ static int hvmemul_do_io(
>      }
>      case X86EMUL_UNIMPLEMENTED:
>          ASSERT_UNREACHABLE();
> -        /* Fall-through */
> +        fallthrough;
>      default:
>          BUG();
>      }
> @@ -2674,6 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;

same here


>      }
>  
>      if ( hvmemul_ctxt->ctxt.retire.singlestep )
> @@ -2764,6 +2765,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>          /* fallthrough */
>      default:
>          hvm_emulate_writeback(&ctxt);
> +        break;
>      }
>  
>      return rc;
> @@ -2799,10 +2801,11 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>          memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
>                 hvio->mmio_insn_bytes);
>      }
> -    /* Fall-through */
> +    fallthrough;
>      default:
>          ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
>          rc = hvm_emulate_one(&ctx, VIO_no_completion);
> +        break;
>      }
>  
>      switch ( rc )
> @@ -2818,7 +2821,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>      case X86EMUL_UNIMPLEMENTED:
>          if ( hvm_monitor_emul_unimplemented() )
>              return;
> -        /* fall-through */
> +        fallthrough;
>      case X86EMUL_UNHANDLEABLE:
>          hvm_dump_emulation_state(XENLOG_G_DEBUG, "Mem event", &ctx, rc);
>          hvm_inject_hw_exception(trapnr, errcode);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 7f4b627b1f..c263e562ff 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4919,6 +4919,8 @@ static int do_altp2m_op(
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        rc = -EOPNOTSUPP;
> +        break;

same here


>      }
>  
>   out:
> @@ -5020,6 +5022,8 @@ static int compat_altp2m_op(
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        rc = -EOPNOTSUPP;
> +        break;

same here


>      }
>  
>      return rc;
> @@ -5283,6 +5287,8 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
>           * %cs and %tr are unconditionally present.  SVM ignores these present
>           * bits and will happily run without them set.
>           */
> +        fallthrough;
> +
>      case x86_seg_cs:
>          reg->p = 1;
>          break;
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 7fb3136f0c..2271afe02a 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -111,6 +111,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>      case 8:
>          eax = regs->rax;
>          /* Fallthrough to permission check. */
> +        fallthrough;
>      case 4:
>      case 2:
>          if ( currd->arch.monitor.guest_request_userspace_enabled &&
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 210cebb0e6..1eab44defc 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -282,6 +282,7 @@ static void hvm_set_callback_irq_level(struct vcpu *v)
>              __hvm_pci_intx_assert(d, pdev, pintx);
>          else
>              __hvm_pci_intx_deassert(d, pdev, pintx);
> +        break;
>      default:
>          break;
>      }
> -- 
> 2.34.1
> 
> 

