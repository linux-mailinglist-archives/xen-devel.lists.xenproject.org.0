Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A616380F7F5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 21:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653572.1019981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9QR-00012E-HL; Tue, 12 Dec 2023 20:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653572.1019981; Tue, 12 Dec 2023 20:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9QR-000101-Di; Tue, 12 Dec 2023 20:32:19 +0000
Received: by outflank-mailman (input) for mailman id 653572;
 Tue, 12 Dec 2023 20:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lmm=HX=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rD9QQ-0000xX-B2
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 20:32:18 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88dd4b32-992d-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 21:32:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 4C01120159;
 Tue, 12 Dec 2023 21:32:14 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqn5twaUrOYB; Tue, 12 Dec 2023 21:32:14 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 3632720156;
 Tue, 12 Dec 2023 21:32:14 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rD9QL-00000006Phm-3nm2; Tue, 12 Dec 2023 21:32:13 +0100
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
X-Inumbo-ID: 88dd4b32-992d-11ee-9b0f-b553b5be7939
Date: Tue, 12 Dec 2023 21:32:13 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/3] Mini-OS: drop in_callback variable
Message-ID: <20231212203213.whjfj73mixapitrg@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231211134827.7130-1-jgross@suse.com>
 <20231211134827.7130-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134827.7130-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 11 déc. 2023 14:48:26 +0100, a ecrit:
> Now that do_hypervisor_callback() is always called with interrupts off
> the in_callback variable meant to handle recursive calls of
> do_hypervisor_callback() can be dropped.
> 
> As a precaution add a test to do_hypervisor_callback() that interrupts
> are really disabled and crash in case this is not true.

That paragraph was for the previous commit ;)

> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  hypervisor.c         |  6 ------
>  include/hypervisor.h |  2 --
>  sched.c              | 11 -----------
>  3 files changed, 19 deletions(-)
> 
> diff --git a/hypervisor.c b/hypervisor.c
> index 5309daa3..6facce3e 100644
> --- a/hypervisor.c
> +++ b/hypervisor.c
> @@ -37,8 +37,6 @@ EXPORT_SYMBOL(hypercall_page);
>      ((sh)->evtchn_pending[idx] &                \
>       ~(sh)->evtchn_mask[idx])
>  
> -int in_callback;
> -
>  #ifndef CONFIG_PARAVIRT
>  extern shared_info_t shared_info;
>  
> @@ -104,8 +102,6 @@ void do_hypervisor_callback(struct pt_regs *regs)
>  
>      BUG_ON(!irqs_disabled());
>  
> -    in_callback = 1;
> -   
>      vcpu_info->evtchn_upcall_pending = 0;
>      /* NB x86. No need for a barrier here -- XCHG is a barrier on x86. */
>  #if !defined(__i386__) && !defined(__x86_64__)
> @@ -127,8 +123,6 @@ void do_hypervisor_callback(struct pt_regs *regs)
>              do_event(port, regs);
>          }
>      }
> -
> -    in_callback = 0;
>  }
>  
>  void force_evtchn_callback(void)
> diff --git a/include/hypervisor.h b/include/hypervisor.h
> index 1d092719..b852a42a 100644
> --- a/include/hypervisor.h
> +++ b/include/hypervisor.h
> @@ -50,6 +50,4 @@ void mask_evtchn(uint32_t port);
>  void unmask_evtchn(uint32_t port);
>  void clear_evtchn(uint32_t port);
>  
> -extern int in_callback;
> -
>  #endif /* __HYPERVISOR_H__ */
> diff --git a/sched.c b/sched.c
> index e162cb60..3335efa0 100644
> --- a/sched.c
> +++ b/sched.c
> @@ -76,11 +76,6 @@ void schedule(void)
>      prev = current;
>      local_irq_save(flags); 
>  
> -    if (in_callback) {
> -        printk("Must not call schedule() from a callback\n");
> -        BUG();
> -    }
> -
>      do {
>          /* Examine all threads.
>             Find a runnable thread, but also wake up expired ones and find the
> @@ -151,15 +146,12 @@ struct thread* create_thread(char *name, void (*function)(void *), void *data)
>  EXPORT_SYMBOL(create_thread);
>  
>  #ifdef HAVE_LIBC
> -static struct _reent callback_reent;
>  struct _reent *__getreent(void)
>  {
>      struct _reent *_reent;
>  
>      if (!threads_started)
>          _reent = _impure_ptr;
> -    else if (in_callback)
> -        _reent = &callback_reent;
>      else
>          _reent = &get_current()->reent;
>  
> @@ -246,9 +238,6 @@ void init_sched(void)
>  {
>      printk("Initialising scheduler\n");
>  
> -#ifdef HAVE_LIBC
> -    _REENT_INIT_PTR((&callback_reent))
> -#endif
>      idle_thread = create_thread("Idle", idle_thread_fn, NULL);
>  }
>  
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

