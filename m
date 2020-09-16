Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FABF26BFC7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIT8f-0002pk-Tm; Wed, 16 Sep 2020 08:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIT8e-0002aN-2I
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:50:04 +0000
X-Inumbo-ID: 327199ef-781d-440a-917a-80d7b31540dc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 327199ef-781d-440a-917a-80d7b31540dc;
 Wed, 16 Sep 2020 08:50:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFB03AC8B;
 Wed, 16 Sep 2020 08:50:16 +0000 (UTC)
Subject: Re: [PATCH V1 13/16] xen/ioreq: Make x86's invalidate qemu mapcache
 handling common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83dfb207-c191-8dad-1474-ce57b6d51102@suse.com>
Date: Wed, 16 Sep 2020 10:50:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-14-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1490,6 +1490,12 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>      /* Ensure the hypercall trap instruction is re-executed. */
>      if ( current->hcall_preempted )
>          regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +    if ( unlikely(current->domain->qemu_mapcache_invalidate) &&
> +         test_and_clear_bool(current->domain->qemu_mapcache_invalidate) )
> +        send_invalidate_req();
> +#endif
>  }

There's a lot of uses of "current" here now, and these don't look to
exactly be cheap on Arm either (they aren't on x86), so I wonder
whether this is the point where at least "current" wants latching
into a local variable here.

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -18,8 +18,10 @@
>   *
>   * Copyright (c) 2017 Citrix Systems Ltd.
>   */
> +
>  #include <xen/lib.h>
>  #include <xen/hypercall.h>
> +#include <xen/ioreq.h>
>  #include <xen/nospec.h>

While I don't care much about the presence of absence of the blank
line between head comment and #include-s, I don't see why you add
one here.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1651,6 +1651,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +#ifdef CONFIG_IOREQ_SERVER
> +    if ( op == XENMEM_decrease_reservation )
> +        curr_d->qemu_mapcache_invalidate = true;
> +#endif

I don't see why you put this right into decrease_reservation(). This
isn't just to avoid the extra conditional, but first and foremost to
avoid bypassing the earlier return from the function (in the case of
preemption). In the context of this I wonder whether the ordering of
operations in hvm_hypercall() is actually correct.

I'm also unconvinced curr_d is the right domain in all cases here;
while this may be a pre-existing issue in principle, I'm afraid it
gets more pronounced by the logic getting moved to common code.
Roger - thoughts either way with, in particular, PVH Dom0 in mind?

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -97,6 +97,8 @@ static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>             (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>  }
>  
> +void send_invalidate_req(void);

Perhaps rename to ioreq_send_invalidate(), ioreq_send_invalidate_req(),
or send_invalidate_ioreq() at this occasion?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -512,6 +512,8 @@ struct domain
>      /* Argo interdomain communication support */
>      struct argo_domain *argo;
>  #endif
> +
> +    bool_t qemu_mapcache_invalidate;

"bool" please.

Jan

