Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458A075D7B3
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567733.887178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMz3X-0004ct-22; Fri, 21 Jul 2023 22:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567733.887178; Fri, 21 Jul 2023 22:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMz3W-0004aL-Ve; Fri, 21 Jul 2023 22:57:02 +0000
Received: by outflank-mailman (input) for mailman id 567733;
 Fri, 21 Jul 2023 22:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMz3W-0004aF-Ft
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:57:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6449279-2819-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 00:57:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1B7160E9D;
 Fri, 21 Jul 2023 22:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E09C433C9;
 Fri, 21 Jul 2023 22:56:57 +0000 (UTC)
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
X-Inumbo-ID: e6449279-2819-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689980219;
	bh=cODPKSnrGgWhxG3JOMp9/jCWaQjGjpn/HdrXhXLpGd8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h7Maiz3ihpz7Ltw1Q2w/2ysNEwj+t9AhofXPu21z8G376VoOlMVBrw8ucoLLzbHN4
	 /q4KhUW3B+fcZRJJMi9plAVIfx4wiGoFUrEC5+azAcUMAtpq4PnieYgZpFdcCrOV38
	 GWA6gJQFi7v/1Yodly90tXl0mwnihNcZDDp29e8INWggbyvpKB5Ps0z9Y9caPfHxuP
	 yxhYsk5VUAgNWPRMq8aFDbYXQ9mn8NpWNSTp92cR6MNLgQVekcupGZk7inA6ssugel
	 zuYMGCdB9R9MiVCGC7gL9SvgaFzImw5sc+bfXKkMLYLEG4idPbK5SXCEG34rUqU/0K
	 J8dI7VMMNp3tA==
Date: Fri, 21 Jul 2023 15:56:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/spinlock: mechanically rename parameter name
 'debug'
In-Reply-To: <78255b6c5caaaa02dad638c7d4102ea793a09b88.1689953306.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307211555510.3118466@ubuntu-linux-20-04-desktop>
References: <78255b6c5caaaa02dad638c7d4102ea793a09b88.1689953306.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jul 2023, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> To avoid any confusion resulting from the parameter 'debug'
> hiding the homonymous function declared at
> 'xen/arch/x86/include/asm/processor.h:428'
> the rename of parameters s/debug/dbg is performed.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> x86 maintainers CC'ed because the violation is caused by a declaration
> in an x86 file, but I reckon it would harm understandability if
> a function was renamed to 'dbg'
> ---
>  xen/common/spinlock.c      | 38 +++++++++++++++++++-------------------
>  xen/include/xen/spinlock.h |  6 +++---
>  2 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 7f453234a9..d8d2e6ad1a 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -78,7 +78,7 @@ static int __init cf_check lockdebug_init(void)
>  }
>  presmp_initcall(lockdebug_init);
>  
> -void check_lock(union lock_debug *debug, bool try)
> +void check_lock(union lock_debug *dbg, bool try)
>  {
>      bool irq_safe = !local_irq_is_enabled();
>      unsigned int cpu = smp_processor_id();
> @@ -118,12 +118,12 @@ void check_lock(union lock_debug *debug, bool try)
>      if ( try && irq_safe )
>          return;
>  
> -    if ( unlikely(debug->irq_safe != irq_safe) )
> +    if ( unlikely(dbg->irq_safe != irq_safe) )
>      {
>          union lock_debug seen, new = { 0 };
>  
>          new.irq_safe = irq_safe;
> -        seen.val = cmpxchg(&debug->val, LOCK_DEBUG_INITVAL, new.val);
> +        seen.val = cmpxchg(&dbg->val, LOCK_DEBUG_INITVAL, new.val);
>  
>          if ( !seen.unseen && seen.irq_safe == !irq_safe )
>          {
> @@ -137,14 +137,14 @@ void check_lock(union lock_debug *debug, bool try)
>          return;
>  
>      for ( i = 0; i < nr_taken; i++ )
> -        if ( taken[i] == debug )
> +        if ( taken[i] == dbg )
>          {
> -            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", debug);
> +            printk("CHECKLOCK FAILURE: lock at %p taken recursively\n", dbg);
>              BUG();
>          }
>  }
>  
> -static void check_barrier(union lock_debug *debug)
> +static void check_barrier(union lock_debug *dbg)
>  {
>      if ( unlikely(atomic_read(&spin_debug) <= 0) )
>          return;
> @@ -160,10 +160,10 @@ static void check_barrier(union lock_debug *debug)
>       * However, if we spin on an IRQ-unsafe lock with IRQs disabled then that
>       * is clearly wrong, for the same reason outlined in check_lock() above.
>       */
> -    BUG_ON(!local_irq_is_enabled() && !debug->irq_safe);
> +    BUG_ON(!local_irq_is_enabled() && !dbg->irq_safe);
>  }
>  
> -void lock_enter(const union lock_debug *debug)
> +void lock_enter(const union lock_debug *dbg)
>  {
>      unsigned int cpu = smp_processor_id();
>      const union lock_debug **taken = per_cpu(locks_taken, cpu);
> @@ -176,7 +176,7 @@ void lock_enter(const union lock_debug *debug)
>      local_irq_save(flags);
>  
>      if ( *nr_taken < lock_depth_size )
> -        taken[(*nr_taken)++] = debug;
> +        taken[(*nr_taken)++] = dbg;
>      else if ( !max_depth_reached )
>      {
>          max_depth_reached = true;
> @@ -187,7 +187,7 @@ void lock_enter(const union lock_debug *debug)
>      local_irq_restore(flags);
>  }
>  
> -void lock_exit(const union lock_debug *debug)
> +void lock_exit(const union lock_debug *dbg)
>  {
>      unsigned int cpu = smp_processor_id();
>      const union lock_debug **taken = per_cpu(locks_taken, cpu);
> @@ -202,7 +202,7 @@ void lock_exit(const union lock_debug *debug)
>  
>      for ( i = *nr_taken; i > 0; i-- )
>      {
> -        if ( taken[i - 1] == debug )
> +        if ( taken[i - 1] == dbg )
>          {
>              memmove(taken + i - 1, taken + i,
>                      (*nr_taken - i) * sizeof(*taken));
> @@ -217,28 +217,28 @@ void lock_exit(const union lock_debug *debug)
>  
>      if ( !max_depth_reached )
>      {
> -        printk("CHECKLOCK released lock at %p not recorded!\n", debug);
> +        printk("CHECKLOCK released lock at %p not recorded!\n", dbg);
>          WARN();
>      }
>  
>      local_irq_restore(flags);
>  }
>  
> -static void got_lock(union lock_debug *debug)
> +static void got_lock(union lock_debug *dbg)
>  {
> -    debug->cpu = smp_processor_id();
> +    dbg->cpu = smp_processor_id();
>  
> -    lock_enter(debug);
> +    lock_enter(dbg);
>  }
>  
> -static void rel_lock(union lock_debug *debug)
> +static void rel_lock(union lock_debug *dbg)
>  {
>      if ( atomic_read(&spin_debug) > 0 )
> -        BUG_ON(debug->cpu != smp_processor_id());
> +        BUG_ON(dbg->cpu != smp_processor_id());
>  
> -    lock_exit(debug);
> +    lock_exit(dbg);
>  
> -    debug->cpu = SPINLOCK_NO_CPU;
> +    dbg->cpu = SPINLOCK_NO_CPU;
>  }
>  
>  void spin_debug_enable(void)
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index 0a02a527dc..d303c56f8a 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -22,9 +22,9 @@ union lock_debug {
>      };
>  };
>  #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
> -void check_lock(union lock_debug *debug, bool try);
> -void lock_enter(const union lock_debug *debug);
> -void lock_exit(const union lock_debug *debug);
> +void check_lock(union lock_debug *dbg, bool try);
> +void lock_enter(const union lock_debug *dbg);
> +void lock_exit(const union lock_debug *dbg);
>  void spin_debug_enable(void);
>  void spin_debug_disable(void);
>  #else
> -- 
> 2.34.1
> 

