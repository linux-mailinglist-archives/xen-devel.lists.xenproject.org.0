Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA580F7F2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 21:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653566.1019967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9PQ-0000Qe-76; Tue, 12 Dec 2023 20:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653566.1019967; Tue, 12 Dec 2023 20:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9PQ-0000NY-3h; Tue, 12 Dec 2023 20:31:16 +0000
Received: by outflank-mailman (input) for mailman id 653566;
 Tue, 12 Dec 2023 20:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lmm=HX=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rD9PP-0000Lg-8n
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 20:31:15 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6295bae3-992d-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 21:31:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E872820159;
 Tue, 12 Dec 2023 21:31:09 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_Ot7AJtn7ap; Tue, 12 Dec 2023 21:31:09 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id ADFB120156;
 Tue, 12 Dec 2023 21:31:09 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rD9PJ-00000006Ph6-1Mkl; Tue, 12 Dec 2023 21:31:09 +0100
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
X-Inumbo-ID: 6295bae3-992d-11ee-9b0f-b553b5be7939
Date: Tue, 12 Dec 2023 21:31:09 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/3] Mini-OS: call event handlers always with interrupts
 off
Message-ID: <20231212203109.6lrewvlvjgv5wuml@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231211134827.7130-1-jgross@suse.com>
 <20231211134827.7130-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134827.7130-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 11 déc. 2023 14:48:25 +0100, a ecrit:
> When unmasking an event channel the associated event handler can be
> called with interrupts enabled when not running as a PV guest.
> 
> This can result in hard to debug races in case e.g. a handler is
> registered for multiple events or when the handler is not using a lock
> as it assumes to have interrupts disabled.
> 
> Instead of using the PV interrupt disabling points just before calling
> the handler, do the disabling once at the very start of
> force_evtchn_callback().
> 
> Replace the evtchn_upcall_mask test in unmask_evtchn() with the more
> appropriate irqs_disabled() test.
> 
> As a precaution add a test to do_hypervisor_callback() that interrupts
> are really disabled and crash in case this is not true.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  hypervisor.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/hypervisor.c b/hypervisor.c
> index f2cbbc1c..5309daa3 100644
> --- a/hypervisor.c
> +++ b/hypervisor.c
> @@ -102,6 +102,8 @@ void do_hypervisor_callback(struct pt_regs *regs)
>      shared_info_t *s = HYPERVISOR_shared_info;
>      vcpu_info_t   *vcpu_info = &s->vcpu_info[cpu];
>  
> +    BUG_ON(!irqs_disabled());
> +
>      in_callback = 1;
>     
>      vcpu_info->evtchn_upcall_pending = 0;
> @@ -131,27 +133,19 @@ void do_hypervisor_callback(struct pt_regs *regs)
>  
>  void force_evtchn_callback(void)
>  {
> -#ifdef XEN_HAVE_PV_UPCALL_MASK
> -    int save;
> -#endif
>      vcpu_info_t *vcpu;
> +    unsigned long flags;
> +
> +    local_irq_save(flags);
> +
>      vcpu = &HYPERVISOR_shared_info->vcpu_info[smp_processor_id()];
> -#ifdef XEN_HAVE_PV_UPCALL_MASK
> -    save = vcpu->evtchn_upcall_mask;
> -#endif
>  
>      while (vcpu->evtchn_upcall_pending) {
> -#ifdef XEN_HAVE_PV_UPCALL_MASK
> -        vcpu->evtchn_upcall_mask = 1;
> -#endif
> -        barrier();
>          do_hypervisor_callback(NULL);
>          barrier();
> -#ifdef XEN_HAVE_PV_UPCALL_MASK
> -        vcpu->evtchn_upcall_mask = save;
> -        barrier();
> -#endif
>      };
> +
> +    local_irq_restore(flags);
>  }
>  
>  inline void mask_evtchn(uint32_t port)
> @@ -177,9 +171,7 @@ inline void unmask_evtchn(uint32_t port)
>                &vcpu_info->evtchn_pending_sel) )
>      {
>          vcpu_info->evtchn_upcall_pending = 1;
> -#ifdef XEN_HAVE_PV_UPCALL_MASK
> -        if ( !vcpu_info->evtchn_upcall_mask )
> -#endif
> +        if ( !irqs_disabled() )
>              force_evtchn_callback();
>      }
>  }
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

