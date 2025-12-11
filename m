Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4BCB6EB7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184533.1506946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlY3-0001ma-8U; Thu, 11 Dec 2025 18:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184533.1506946; Thu, 11 Dec 2025 18:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlY3-0001l9-5j; Thu, 11 Dec 2025 18:37:55 +0000
Received: by outflank-mailman (input) for mailman id 1184533;
 Thu, 11 Dec 2025 18:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3Jk=6R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vTlY1-0001l3-B0
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:37:53 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee3e966-d6c0-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:37:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6615743E10;
 Thu, 11 Dec 2025 18:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27845C4CEF7;
 Thu, 11 Dec 2025 18:37:48 +0000 (UTC)
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
X-Inumbo-ID: 7ee3e966-d6c0-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765478269;
	bh=miMLHBUuiuz/joNDWhtdCtxriZ+b8d1UpNxlY0I02T8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nRR9mvFXQ1rDsDqnG7gxkc5XTzXJ6UtqMoBrNpyHBvcQ02skZUWQOHdIaOQgWAihQ
	 bMiiXoT1qcrCzGNKpuq/iXaAycubXAPUQ80uN6iR6cmFwana6+vQFsbrqukwKT2/to
	 zETDWqhIJAJnBKZ0tvopGsAt1zdznGdb4MCYNpQ365iqgeyUoL5WGlPucnP5oUv1B7
	 Aep6H44QTneFuLDtXeyjSipZdv7YHDplXqCVTV/UFVaKJtwStrQyHXGLIZi0gBXyxL
	 v/tyH8SVYv1DmXvL1LNcF6igfep0r3gb4WkSZs/Srv5ZBrpL3ZX4ifwlf4f49D9l7M
	 bWp5E5JgXtz3w==
Date: Thu, 11 Dec 2025 10:37:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] xen/irq: Delete the pirq_cleanup_check() macro
In-Reply-To: <0959802e4fa73b848b2b9e47c57c6daf062e9630.1756149543.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2512111037070.17367@ubuntu-linux-20-04-desktop>
References: <0959802e4fa73b848b2b9e47c57c6daf062e9630.1756149543.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Aug 2025, Dmytro Prokopchuk1 wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> MISRA Rule 5.5 objects to a macro aliasing a function, which is what
> pirq_cleanup_check() does. The macro was originally intended to ensure
> the condition 'if (!pirq->evtchn)' is always checked before invoking
> the function, avoiding errors across call sites.
> 
> There are only a handful of users, so expand it inline to be plain
> regular C. Doing this shows one path now needing braces, and one path
> in 'evtchn_bind_pirq()' where the expanded form simplies back to no
> delta, as it follows an unconditional clear of 'info->evtchn'.
> 
> While this complies with MISRA, it shifts the responsibility to
> developers to check 'if (!pirq->evtchn)' at call sites.
> 
> No functional changes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes in v3:
> - added back wording from v1, originally written by Andrew.
> 
> Link to v2:
> https://patchew.org/Xen/ce37bdf7b5189d314c0f41628dbfb3281358bcf4.1755361782.git.dmytro._5Fprokopchuk1@epam.com/
> 
> Link to v1:
> https://patchew.org/Xen/20250729223110.3404441-1-andrew.cooper3@citrix.com/
> ---
>  xen/arch/x86/irq.c                | 11 +++++++----
>  xen/common/event_channel.c        |  5 ++++-
>  xen/drivers/passthrough/x86/hvm.c |  9 ++++++---
>  xen/include/xen/irq.h             |  3 ---
>  4 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 556134f85a..1ed85c0c11 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1325,7 +1325,8 @@ static void clear_domain_irq_pirq(struct domain *d, int irq, struct pirq *pirq)
>  static void cleanup_domain_irq_pirq(struct domain *d, int irq,
>                                      struct pirq *pirq)
>  {
> -    pirq_cleanup_check(pirq, d);
> +    if ( !pirq->evtchn )
> +        pirq_cleanup_check(pirq, d);
>      radix_tree_delete(&d->arch.irq_pirq, irq);
>  }
>  
> @@ -1383,7 +1384,7 @@ struct pirq *alloc_pirq_struct(struct domain *d)
>      return pirq;
>  }
>  
> -void (pirq_cleanup_check)(struct pirq *pirq, struct domain *d)
> +void pirq_cleanup_check(struct pirq *pirq, struct domain *d)
>  {
>      /*
>       * Check whether all fields have their default values, and delete
> @@ -2823,7 +2824,8 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
>                  radix_tree_int_to_ptr(pirq));
>              break;
>          default:
> -            pirq_cleanup_check(info, d);
> +            if ( !info->evtchn )
> +                pirq_cleanup_check(info, d);
>              return err;
>          }
>      }
> @@ -2858,7 +2860,8 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pirq)
>      if ( info )
>      {
>          info->arch.hvm.emuirq = IRQ_UNBOUND;
> -        pirq_cleanup_check(info, d);
> +        if ( !info->evtchn )
> +            pirq_cleanup_check(info, d);
>      }
>      if ( emuirq != IRQ_PT )
>          radix_tree_delete(&d->arch.hvm.emuirq_pirq, emuirq);
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 67700b050a..a3d18bc464 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -741,11 +741,14 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
>              if ( !is_hvm_domain(d1) ||
>                   domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
>                   unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
> +            {
>                  /*
>                   * The successful path of unmap_domain_pirq_emuirq() will have
>                   * called pirq_cleanup_check() already.
>                   */
> -                pirq_cleanup_check(pirq, d1);
> +                if ( !pirq->evtchn )
> +                    pirq_cleanup_check(pirq, d1);
> +            }
>          }
>          unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
>          break;
> diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
> index a2ca7e0e57..b73bb55055 100644
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -329,7 +329,8 @@ int pt_irq_create_bind(
>                  pirq_dpci->gmsi.gvec = 0;
>                  pirq_dpci->dom = NULL;
>                  pirq_dpci->flags = 0;
> -                pirq_cleanup_check(info, d);
> +                if ( !info->evtchn )
> +                    pirq_cleanup_check(info, d);
>                  write_unlock(&d->event_lock);
>                  return rc;
>              }
> @@ -536,7 +537,8 @@ int pt_irq_create_bind(
>                      hvm_irq_dpci->link_cnt[link]--;
>                  }
>                  pirq_dpci->flags = 0;
> -                pirq_cleanup_check(info, d);
> +                if ( !info->evtchn )
> +                    pirq_cleanup_check(info, d);
>                  write_unlock(&d->event_lock);
>                  xfree(girq);
>                  xfree(digl);
> @@ -693,7 +695,8 @@ int pt_irq_destroy_bind(
>           */
>          pt_pirq_softirq_reset(pirq_dpci);
>  
> -        pirq_cleanup_check(pirq, d);
> +        if ( !pirq->evtchn )
> +            pirq_cleanup_check(pirq, d);
>      }
>  
>      write_unlock(&d->event_lock);
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index 95034c0d6b..6071b00f62 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -185,9 +185,6 @@ extern struct pirq *pirq_get_info(struct domain *d, int pirq);
>  
>  void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
>  
> -#define pirq_cleanup_check(pirq, d) \
> -    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
> -
>  extern void pirq_guest_eoi(struct pirq *pirq);
>  extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
>  extern int pirq_guest_unmask(struct domain *d);
> -- 
> 2.43.0
> 

