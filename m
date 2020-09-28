Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649227B235
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 18:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMwGf-0007pj-4W; Mon, 28 Sep 2020 16:44:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJ95=DF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kMwGd-0007pe-8K
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 16:44:47 +0000
X-Inumbo-ID: efedc8bd-d1f5-44ac-ad23-0553b313b2ea
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efedc8bd-d1f5-44ac-ad23-0553b313b2ea;
 Mon, 28 Sep 2020 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601311485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JY9Z2dHcuqcU9qQco4uleIAaclc1z8mGskHzyhoX9Iw=;
 b=as/t1fn7XLT/DELvvecF1rFRPcY16sT7Iu+dYEvC8YrVHZxEpJfr3yTh
 jKK7k7A+ZlfjD+dkyn+E9LBMeMI0EbZ2yLf7Bxbn4BI8uGA7l1xtafg14
 IcMAkS/oC7PfVAloJSWCJeCD4hq6lZJQy+zczjn+m6lIONa7LxfShtPEC 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KL0VG/9xUkfli9jlgo9AMzRulj24El2yFjWi2tfTTmF7za9agzXo1+m+deYsgbm8eQyXZ0YO2J
 hQZrHNSMdoY3xWE7mY5VzQBhfAjhptYi6fnW9rrgPUWd4lm6CIJhMJR4qhG+6TFyZHZ3+Z2epn
 Sy0IK8tFZPGkiY/mpQft/UNso4W6ZDrY7aZjqQuU1Zr3uG2G6xaFx9LMuHqMSJWGaUCW5HWV51
 SGvE1DkKWAFea5z6WauZY+aqZJuCbUDQd/8ye7CGKM+EJrjhm5+CR1TXbSqCJttF+e38UwafTG
 DSM=
X-SBRS: None
X-MesageID: 27871142
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="27871142"
Date: Mon, 28 Sep 2020 18:44:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 12/12] evtchn: convert domain event lock to an r/w one
Message-ID: <20200928164435.GP19254@Air-de-Roger>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <5fee2432-7b94-2f91-5f17-c9eb3ec9f126@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5fee2432-7b94-2f91-5f17-c9eb3ec9f126@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Mon, Sep 28, 2020 at 01:02:43PM +0200, Jan Beulich wrote:
> Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
> across pCPU-s) and the ones in EOI handling in PCI pass-through code,
> serializing perhaps an entire domain isn't helpful when no state (which
> isn't e.g. further protected by the per-channel lock) changes.
> 
> Unfortunately this implies dropping of lock profiling for this lock,
> until r/w locks may get enabled for such functionality.
> 
> While ->notify_vcpu_id is now meant to be consistently updated with the
> per-channel lock held for writing, an extension applies to ECS_PIRQ: The
> field is also guaranteed to not change with the per-domain event lock
> held. Therefore the unlink_pirq_port() call from evtchn_bind_vcpu() as
> well as the link_pirq_port() one from evtchn_bind_pirq() could in
> principle be moved out of the per-channel locked regions, but this
> further code churn didn't seem worth it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC:
> * In evtchn_bind_vcpu() the question is whether limiting the use of
>   write_lock() to just the ECS_PIRQ case is really worth it.

IMO I would just use use write_lock() at the top of the function in
place of the current spin_lock. The more fine grained change should be
done as a follow up patch if it's worth it. TBH event channels
shouldn't change vCPU that frequently that using a more fine grained
approach matters much.

> * In flask_get_peer_sid() the question is whether we wouldn't better
>   switch to using the per-channel lock.
>  
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -465,7 +465,7 @@ int msixtbl_pt_register(struct domain *d
>      int r = -EINVAL;
>  
>      ASSERT(pcidevs_locked());
> -    ASSERT(spin_is_locked(&d->event_lock));
> +    ASSERT(rw_is_write_locked(&d->event_lock));

FWIW, we could switch rw_is_write_locked to use
_is_write_locked_by_me (or introduce rw_is_write_locked_by_me, albeit
I think all users of rw_is_write_locked care about the lock being
taken by them).

> @@ -1098,7 +1108,7 @@ int evtchn_reset(struct domain *d, bool
>      if ( d != current->domain && !d->controller_pause_count )
>          return -EINVAL;
>  
> -    spin_lock(&d->event_lock);
> +    read_lock(&d->event_lock);
>  
>      /*
>       * If we are resuming, then start where we stopped. Otherwise, check
> @@ -1109,7 +1119,7 @@ int evtchn_reset(struct domain *d, bool
>      if ( i > d->next_evtchn )
>          d->next_evtchn = i;

Using the read lock to write to d->next_evtchn here...

>  
> -    spin_unlock(&d->event_lock);
> +    read_unlock(&d->event_lock);
>  
>      if ( !i )
>          return -EBUSY;
> @@ -1121,14 +1131,14 @@ int evtchn_reset(struct domain *d, bool
>          /* NB: Choice of frequency is arbitrary. */
>          if ( !(i & 0x3f) && hypercall_preempt_check() )
>          {
> -            spin_lock(&d->event_lock);
> +            write_lock(&d->event_lock);
>              d->next_evtchn = i;

... but the write lock here instead seems inconsistent.

> -            spin_unlock(&d->event_lock);
> +            write_unlock(&d->event_lock);
>              return -ERESTART;
>          }
>      }
>  
> -    spin_lock(&d->event_lock);
> +    write_lock(&d->event_lock);
>  
>      d->next_evtchn = 0;
>  
> @@ -1557,7 +1568,7 @@ static void domain_dump_evtchn_info(stru
>             "Polling vCPUs: {%*pbl}\n"
>             "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
>  
> -    spin_lock(&d->event_lock);
> +    read_lock(&d->event_lock);

Since this is a debug key, I would suggest using read_trylock in order
to prevent blocking if a CPU is stuck while holding the event_lock in
write mode.


> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -105,7 +105,7 @@ static void pt_pirq_softirq_reset(struct
>  {
>      struct domain *d = pirq_dpci->dom;
>  
> -    ASSERT(spin_is_locked(&d->event_lock));
> +    ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      switch ( cmpxchg(&pirq_dpci->state, 1 << STATE_SCHED, 0) )
>      {
> @@ -162,7 +162,7 @@ static void pt_irq_time_out(void *data)
>      const struct hvm_irq_dpci *dpci;
>      const struct dev_intx_gsi_link *digl;
>  
> -    spin_lock(&irq_map->dom->event_lock);
> +    read_lock(&irq_map->dom->event_lock);

Is it fine to use the lock in read mode here? It's likely to change
the flags by adding HVM_IRQ_DPCI_EOI_LATCH, and hence should use the
lock in write mode?

As I think that's the lock that's supposed to protect changes to the
flags field?

>  static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
> @@ -893,7 +893,7 @@ static void hvm_dirq_assist(struct domai
>          return;
>      }
>  
> -    spin_lock(&d->event_lock);
> +    read_lock(&d->event_lock);

It's also not clear to me that a read lock can be used here, since you
increase a couple of counters of hvm_pirq_dpci which doesn't seem to
be protected by any other lock?

>      if ( test_and_clear_bool(pirq_dpci->masked) )
>      {
>          struct pirq *pirq = dpci_pirq(pirq_dpci);
> @@ -947,7 +947,7 @@ static void hvm_dirq_assist(struct domai
>      }
>  
>   out:
> -    spin_unlock(&d->event_lock);
> +    read_unlock(&d->event_lock);
>  }
>  
>  static void hvm_pirq_eoi(struct pirq *pirq,
> @@ -1012,7 +1012,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
>  
>      if ( is_hardware_domain(d) )
>      {
> -        spin_lock(&d->event_lock);
> +        read_lock(&d->event_lock);
>          hvm_gsi_eoi(d, guest_gsi, ent);
>          goto unlock;
>      }
> @@ -1023,7 +1023,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
>          return;
>      }
>  
> -    spin_lock(&d->event_lock);
> +    read_lock(&d->event_lock);
>      hvm_irq_dpci = domain_get_irq_dpci(d);
>  
>      if ( !hvm_irq_dpci )
> @@ -1033,7 +1033,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
>          __hvm_dpci_eoi(d, girq, ent);

__hvm_dpci_eoi will call hvm_pirq_eoi and that seems to require a
write lock, as it modifies pirq_dpci.

>  
>  unlock:
> -    spin_unlock(&d->event_lock);
> +    read_unlock(&d->event_lock);
>  }
>  
>  /*
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -883,7 +883,7 @@ static int pci_clean_dpci_irqs(struct do
>      if ( !is_hvm_domain(d) )
>          return 0;
>  
> -    spin_lock(&d->event_lock);
> +    write_lock(&d->event_lock);
>      hvm_irq_dpci = domain_get_irq_dpci(d);
>      if ( hvm_irq_dpci != NULL )
>      {
> @@ -901,14 +901,14 @@ static int pci_clean_dpci_irqs(struct do
>              ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
>          if ( ret )
>          {
> -            spin_unlock(&d->event_lock);
> +            read_unlock(&d->event_lock);

This should be a write_unlock AFAICT.

>              return ret;
>          }
>  
>          hvm_domain_irq(d)->dpci = NULL;
>          free_hvm_irq_dpci(hvm_irq_dpci);
>      }
> -    spin_unlock(&d->event_lock);
> +    write_unlock(&d->event_lock);
>      return 0;
>  }
>  
> --- a/xen/drivers/passthrough/vtd/x86/hvm.c
> +++ b/xen/drivers/passthrough/vtd/x86/hvm.c
> @@ -54,7 +54,7 @@ void hvm_dpci_isairq_eoi(struct domain *
>      if ( !is_iommu_enabled(d) )
>          return;
>  
> -    spin_lock(&d->event_lock);
> +    read_lock(&d->event_lock);

I think this also needs to be a write lock, as you modify pirq_dpci
bits in _hvm_dpci_isairq_eoi.

>  
>      dpci = domain_get_irq_dpci(d);
>  
> @@ -63,5 +63,5 @@ void hvm_dpci_isairq_eoi(struct domain *
>          /* Multiple mirq may be mapped to one isa irq */
>          pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
>      }
> -    spin_unlock(&d->event_lock);
> +    read_unlock(&d->event_lock);
>  }
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -373,7 +373,7 @@ struct domain
>      unsigned int     xen_evtchns;
>      /* Port to resume from in evtchn_reset(), when in a continuation. */
>      unsigned int     next_evtchn;
> -    spinlock_t       event_lock;
> +    rwlock_t         event_lock;

It would be nice to add a comment regarding what fields does
event_lock protect. It's kind of a very generic lock name that I think
has been abused a bit.

Not that it needs to be done in that patch.

Thanks, Roger.

