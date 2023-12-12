Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C180F7F7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 21:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653578.1019995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9Rr-0001ee-Tk; Tue, 12 Dec 2023 20:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653578.1019995; Tue, 12 Dec 2023 20:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9Rr-0001aD-Qh; Tue, 12 Dec 2023 20:33:47 +0000
Received: by outflank-mailman (input) for mailman id 653578;
 Tue, 12 Dec 2023 20:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lmm=HX=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rD9Rq-0001Zn-MI
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 20:33:46 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd7a46c9-992d-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 21:33:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 8D7C320159;
 Tue, 12 Dec 2023 21:33:42 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsiAfeAZfdcf; Tue, 12 Dec 2023 21:33:42 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7529220156;
 Tue, 12 Dec 2023 21:33:42 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rD9Rm-00000006PiE-0hH1; Tue, 12 Dec 2023 21:33:42 +0100
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
X-Inumbo-ID: bd7a46c9-992d-11ee-9b0f-b553b5be7939
Date: Tue, 12 Dec 2023 21:33:42 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/3] Mini-OS: cleanup hypervisor.c
Message-ID: <20231212203342.ky7hzaaj5gm7fydf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231211134827.7130-1-jgross@suse.com>
 <20231211134827.7130-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134827.7130-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 11 déc. 2023 14:48:27 +0100, a ecrit:
> Do the following cleanups in hypervisor.c:
> 
> - Let hypervisor.c conform to the coding style.
> - Drop the bogus "inline" attributes of exported functions.
> - Replace a always zero cpu variable with smp_processor_id() as
>   elsewhere in the code.
> - Replace "if () BUG()" with BUG_ON() in case the condition has no
>   side effects.
> - Drop the unused cpu parameter from the active_evtchns() macro.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  hypervisor.c | 62 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/hypervisor.c b/hypervisor.c
> index 6facce3e..ba535556 100644
> --- a/hypervisor.c
> +++ b/hypervisor.c
> @@ -1,27 +1,27 @@
>  /******************************************************************************
>   * hypervisor.c
> - * 
> + *
>   * Communication to/from hypervisor.
> - * 
> + *
>   * Copyright (c) 2002-2003, K A Fraser
>   * Copyright (c) 2005, Grzegorz Milos, gm281@cam.ac.uk,Intel Research Cambridge
> - * 
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to
>   * deal in the Software without restriction, including without limitation the
>   * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>   * sell copies of the Software, and to permit persons to whom the Software is
>   * furnished to do so, subject to the following conditions:
> - * 
> + *
>   * The above copyright notice and this permission notice shall be included in
>   * all copies or substantial portions of the Software.
> - * 
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
> - * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> @@ -33,9 +33,8 @@
>  
>  EXPORT_SYMBOL(hypercall_page);
>  
> -#define active_evtchns(cpu,sh,idx)              \
> -    ((sh)->evtchn_pending[idx] &                \
> -     ~(sh)->evtchn_mask[idx])
> +#define active_evtchns(sh, idx)                           \
> +    ((sh)->evtchn_pending[idx] & ~(sh)->evtchn_mask[idx])
>  
>  #ifndef CONFIG_PARAVIRT
>  extern shared_info_t shared_info;
> @@ -48,10 +47,10 @@ int hvm_get_parameter(int idx, uint64_t *value)
>      xhv.domid = DOMID_SELF;
>      xhv.index = idx;
>      ret = HYPERVISOR_hvm_op(HVMOP_get_param, &xhv);
> -    if ( ret < 0 )
> -        BUG();
> +    BUG_ON(ret < 0);
>  
>      *value = xhv.value;
> +
>      return ret;
>  }
>  
> @@ -62,6 +61,7 @@ int hvm_set_parameter(int idx, uint64_t value)
>      xhv.domid = DOMID_SELF;
>      xhv.index = idx;
>      xhv.value = value;
> +
>      return HYPERVISOR_hvm_op(HVMOP_set_param, &xhv);
>  }
>  
> @@ -87,18 +87,15 @@ void unmap_shared_info(void)
>      xrtp.gpfn = virt_to_pfn(&shared_info);
>      if ( HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &xrtp) != 0 )
>          BUG();
> -
> -    return;
>  }
>  #endif
>  
>  void do_hypervisor_callback(struct pt_regs *regs)
>  {
> -    unsigned long  l1, l2, l1i, l2i;
> -    unsigned int   port;
> -    int            cpu = 0;
> +    unsigned long l1, l2, l1i, l2i;
> +    unsigned int port;
>      shared_info_t *s = HYPERVISOR_shared_info;
> -    vcpu_info_t   *vcpu_info = &s->vcpu_info[cpu];
> +    vcpu_info_t *vcpu_info = &s->vcpu_info[smp_processor_id()];
>  
>      BUG_ON(!irqs_disabled());
>  
> @@ -113,13 +110,13 @@ void do_hypervisor_callback(struct pt_regs *regs)
>      {
>          l1i = __ffs(l1);
>          l1 &= ~(1UL << l1i);
> -        
> -        while ( (l2 = active_evtchns(cpu, s, l1i)) != 0 )
> +
> +        while ( (l2 = active_evtchns(s, l1i)) != 0 )
>          {
>              l2i = __ffs(l2);
>              l2 &= ~(1UL << l2i);
>  
> -            port = (l1i * (sizeof(unsigned long) * 8)) + l2i;
> +            port = l1i * sizeof(unsigned long) * 8 + l2i;
>              do_event(port, regs);
>          }
>      }
> @@ -134,7 +131,8 @@ void force_evtchn_callback(void)
>  
>      vcpu = &HYPERVISOR_shared_info->vcpu_info[smp_processor_id()];
>  
> -    while (vcpu->evtchn_upcall_pending) {
> +    while ( vcpu->evtchn_upcall_pending )
> +    {
>          do_hypervisor_callback(NULL);
>          barrier();
>      };
> @@ -142,14 +140,15 @@ void force_evtchn_callback(void)
>      local_irq_restore(flags);
>  }
>  
> -inline void mask_evtchn(uint32_t port)
> +void mask_evtchn(uint32_t port)
>  {
>      shared_info_t *s = HYPERVISOR_shared_info;
> +
>      synch_set_bit(port, &s->evtchn_mask[0]);
>  }
>  EXPORT_SYMBOL(mask_evtchn);
>  
> -inline void unmask_evtchn(uint32_t port)
> +void unmask_evtchn(uint32_t port)
>  {
>      shared_info_t *s = HYPERVISOR_shared_info;
>      vcpu_info_t *vcpu_info = &s->vcpu_info[smp_processor_id()];
> @@ -160,9 +159,9 @@ inline void unmask_evtchn(uint32_t port)
>       * The following is basically the equivalent of 'hw_resend_irq'. Just like
>       * a real IO-APIC we 'lose the interrupt edge' if the channel is masked.
>       */
> -    if (  synch_test_bit        (port,    &s->evtchn_pending[0]) && 
> +    if ( synch_test_bit(port, &s->evtchn_pending[0]) &&
>           !synch_test_and_set_bit(port / (sizeof(unsigned long) * 8),
> -              &vcpu_info->evtchn_pending_sel) )
> +                                 &vcpu_info->evtchn_pending_sel) )
>      {
>          vcpu_info->evtchn_upcall_pending = 1;
>          if ( !irqs_disabled() )
> @@ -171,9 +170,10 @@ inline void unmask_evtchn(uint32_t port)
>  }
>  EXPORT_SYMBOL(unmask_evtchn);
>  
> -inline void clear_evtchn(uint32_t port)
> +void clear_evtchn(uint32_t port)
>  {
>      shared_info_t *s = HYPERVISOR_shared_info;
> +
>      synch_clear_bit(port, &s->evtchn_pending[0]);
>  }
>  EXPORT_SYMBOL(clear_evtchn);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

