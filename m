Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422BAA31431
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 19:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885852.1295650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thv93-0004KD-Mu; Tue, 11 Feb 2025 18:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885852.1295650; Tue, 11 Feb 2025 18:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thv93-0004IP-Jm; Tue, 11 Feb 2025 18:38:05 +0000
Received: by outflank-mailman (input) for mailman id 885852;
 Tue, 11 Feb 2025 18:38:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thv92-0004IJ-KD
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 18:38:04 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53361fdc-e8a7-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 19:38:03 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2fa40c0bab2so6828225a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 10:38:03 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa099f4bf1sm10999255a91.9.2025.02.11.10.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 10:38:01 -0800 (PST)
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
X-Inumbo-ID: 53361fdc-e8a7-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739299082; x=1739903882; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JHsbAvrpjejqDtQheCRzxAlFcPE22F80Ch4cpW21vw=;
        b=rN/3nHsf/Jg7RlAmPMv+nitzzgngfa27Ggg8OttZ9lJgBvWIPcuyCffPFESD36W7PY
         szxWQyP2HZkdDeJfbbWNYe53xg7AaUzRgwcPhrLie54NQIg3riBH9myU4fNRaqpRUZmE
         3Yk5658xRZT8zrfHr4bShtOBYnCDGeFjH3zZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299082; x=1739903882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JHsbAvrpjejqDtQheCRzxAlFcPE22F80Ch4cpW21vw=;
        b=j04Hj6GaqkvuK35rR9qz0SnydBH+qKPiC6jXE5+1Y8YypD1fvHP5GEvnpp6KMeUfXd
         Vngf1xptyrNdZ1y6MmCBP87o6VqyuDPxGti/VNNA+Z5fSQMOysaXGbzsaFjpQA7W3EfZ
         3EaZruDDI4SUb1AMs6JE2Fn6SQGM3HWqQksNy8nLjqqJAS+k/kjfZkweuLdz4zv65o7w
         C/3GjtMe/xyx3CGL5NdeVy9TajMAHQBU5QC9CNbVAQ58QBCEZvJnarVDpZyZWBi9kYtO
         opsqDvvpsRBsUi0QpP+UvBmZnhPGNpUcv+al5vs8zlC8RqKDJJlqCnDUEGRgnpcRbMpx
         racA==
X-Gm-Message-State: AOJu0YxKfRg1AMarusPd7mG1Kmt/NNsQWZiHB71KVgN0NYp7TgBUSd/m
	XM26ouehwDJrkUOdlY7lou69h4VTgsdqqHP7QgO0M0aHCXskgK4APDsQFVE+94Q=
X-Gm-Gg: ASbGnctJK916xR4K1vXvC7GPWiui6KhRQigqu64PZbyNLCPGa3RKGmtSncGGYfC+1CU
	Z+KEqGUde9qfRYh6pzdpWX0QN3KiKPGhYJJfa/1uo3SRbVS5XqNwGmWsg3XpdY3hXPh+W7pes50
	SVEs2EwAFyxG+80Lt5Hdz+WCAOLXHDjzgxq8uwL1VAYTLQjp+9u5OQMbeZ5U6dnwiYUBVxrNFR0
	LeoU8+9VwyOCMkmqX3nwxUkJRqIoSe0RiP6+KFcLNUaMM1FM/QcgF76R/eU+4k/UXmKvwXFjkRR
	KzU1o8JZarQCaF18Cs9STvg2uQ==
X-Google-Smtp-Source: AGHT+IG56Y9s9qk4vteAkYckp9cvU83hnegV1pdtWA5AesDIT9Vwy9oKtiS+r7Crkv4BaDtI+UsVKA==
X-Received: by 2002:a17:90b:2dc8:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fbf5bb1d1bmr211424a91.7.1739299081830;
        Tue, 11 Feb 2025 10:38:01 -0800 (PST)
Date: Tue, 11 Feb 2025 19:37:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH RFC DO-NOT-APPLY] x86/IRQ: don't pass offline CPU(s) to
 on_selected_cpus()
Message-ID: <Z6uZBATkX72AeDfU@macbook.local>
References: <0396a0fa-e318-493a-9858-30f63304cc99@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0396a0fa-e318-493a-9858-30f63304cc99@suse.com>

On Tue, Feb 11, 2025 at 10:38:41AM +0100, Jan Beulich wrote:
> on_selected_cpus() asserts that it's only passed online CPUs. Between
> __cpu_disable() removing a CPU from the online map and fixup_eoi()
> cleaning up for the CPU being offlined there's a window, though, where
> the CPU in question can still appear in an action's cpu_eoi_map. Remove
> offline CPUs, as they're (supposed to be) taken care of by fixup_eoi().
> 
> Move the entire tail of desc_guest_eoi() into a new helper, thus
> streamlining processinf also for other call sites when the sole
               ^ processing

> remaining CPU is the local one. Move and split the assertion, to be a
> functionally equivalent replacement for the earlier BUG_ON() in
> __pirq_guest_unbind(). Note that we can't use scratch_cpumask there, in
> particular in the context of a timer handler and with data held there
> needing to stay intact across process_pending_softirqs().

I would probably add the crash backtrace to the commit message.

> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While this builds okay, for now I didn't even consider testing it: Both
> aspects below (plus the ugly locking arrangement) speak against dealing
> with the issue this way, imo. Cc-ing REST rather than just x86 for this
> reason.

Indeed, the locking is specially problematic here, both for being
ugly, and because I assume EOI is a hot path.

> RFC: Don't we need {get,put}_cpu_maps() around quite a few more uses of
>      cpu_online_map (e.g. _clear_irq_vector() when called from
>      destroy_irq(), or about every caller of smp_call_function())?

Indeed, that's my understanding also.  Quite a lot of users of
cpu_online_mask likely requires wrapping around {get,put}_cpu_maps()
calls, otherwise they very likely incur in TOCTOU races.

>      Roger
>      suggests using stop-machine context for CPU {on,off}lining, but I
>      seem to vaguely recall that there was a reason not to do so at
>      least for the offlining part.

I would have to explore this more thoroughly, it does seems feasible
on first sight, but devil (and bugs) is in the details.

I don't think we want to go to the lengths of what you do below for
quite a lot of users of cpu_online_mask.

> 
> RFC: I doubt process_pending_softirqs() is okay to use from a timer
>      handler. (Callers of, in particular, {desc,pirq}_guest_eoi() would
>      also need checking for process_pending_softirqs() to be okay to use
>      in their contexts.)

Yeah, I would be worry of doing softirq processing from this context,
the more that (even if not the common case) I would be afraid of the
unbounded latency that process_pending_softirqs() could introduce.

> 
> --- unstable.orig/xen/arch/x86/irq.c	2021-04-08 11:10:47.000000000 +0200
> +++ unstable/xen/arch/x86/irq.c	2025-02-11 09:54:38.532567287 +0100
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <xen/init.h>
> +#include <xen/cpu.h>
>  #include <xen/delay.h>
>  #include <xen/errno.h>
>  #include <xen/event.h>
> @@ -1183,7 +1184,7 @@ static inline void clear_pirq_eoi(struct
>      }
>  }
>  
> -static void cf_check set_eoi_ready(void *data);
> +static bool invoke_set_eoi_ready(struct irq_desc *desc, bool wait);
>  
>  static void cf_check irq_guest_eoi_timer_fn(void *data)
>  {
> @@ -1224,18 +1225,13 @@ static void cf_check irq_guest_eoi_timer
>  
>      switch ( action->ack_type )
>      {
> -        cpumask_t *cpu_eoi_map;
> -
>      case ACKTYPE_UNMASK:
>          if ( desc->handler->end )
>              desc->handler->end(desc, 0);
>          break;
>  
>      case ACKTYPE_EOI:
> -        cpu_eoi_map = this_cpu(scratch_cpumask);
> -        cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
> -        spin_unlock_irq(&desc->lock);
> -        on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
> +        invoke_set_eoi_ready(desc, false);
>          return;
>      }
>  
> @@ -1468,6 +1464,49 @@ static void cf_check set_eoi_ready(void
>      flush_ready_eoi();
>  }
>  
> +/*
> + * Locking is somewhat special here: In all cases the function is invoked with
> + * desc's lock held.  When @wait is true, the function tries to avoid unlocking.
> + * It always returns whether the lock is still held.
> + */
> +static bool invoke_set_eoi_ready(struct irq_desc *desc, bool wait)
> +{
> +    const irq_guest_action_t *action = guest_action(desc);
> +    cpumask_t cpu_eoi_map;
> +
> +    cpumask_copy(&cpu_eoi_map, action->cpu_eoi_map);
> +
> +    if ( __cpumask_test_and_clear_cpu(smp_processor_id(), &cpu_eoi_map) )
> +    {
> +        ASSERT(action->ack_type == ACKTYPE_EOI);
> +        __set_eoi_ready(desc);
> +        spin_unlock(&desc->lock);
> +        flush_ready_eoi();
> +        local_irq_enable();
> +    }
> +    else if ( wait && cpumask_empty(&cpu_eoi_map) )
> +        return true;
> +    else
> +    {
> +        ASSERT(action->ack_type == ACKTYPE_EOI);
> +        spin_unlock_irq(&desc->lock);
> +    }
> +
> +    if ( cpumask_empty(&cpu_eoi_map) )
> +        return false;
> +
> +    while ( !get_cpu_maps() )
> +        process_pending_softirqs();
> +
> +    cpumask_and(&cpu_eoi_map, &cpu_eoi_map, &cpu_online_map);
> +    if ( !cpumask_empty(&cpu_eoi_map) )
> +        on_selected_cpus(&cpu_eoi_map, set_eoi_ready, desc, wait);
> +
> +    put_cpu_maps();
> +
> +    return false;
> +}
> +
>  void pirq_guest_eoi(struct pirq *pirq)

Possibly for pirq_guest_eoi() when called from the PHYSDEVOP_eoi
hypercall we should propagate whether the EOI has been performed, and
otherwise use an hypercall continuation to retry?

As said above however, this approach is so ugly, and we would require
similar adjustments in other places that also use cpu_online_maks that
I would only consider going this route as last resort.

Thanks, Roger.

