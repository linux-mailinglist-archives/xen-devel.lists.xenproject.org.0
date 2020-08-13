Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEC2436EE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:50:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k68wJ-0001Lm-DM; Thu, 13 Aug 2020 08:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k68wI-0001Lh-BF
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:50:22 +0000
X-Inumbo-ID: 4bd48ad7-145d-4eae-9d4d-f6c190a76da5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bd48ad7-145d-4eae-9d4d-f6c190a76da5;
 Thu, 13 Aug 2020 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597308619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+ewbFVzXCY/jdMIxNTAVdRDKD2RrTHjc8jmctgiRh4Y=;
 b=BPbRLtiljVey/loOlpdfNxQLDjbavs8mcALYuQKlbD9oIiwb6vxYwtuu
 c1mxfKi+bwwWaP8qQmmhz3m5FbJI9tAXJVrAbohQvQL00dnVdAm6wCaWv
 CjjeaU7EFuUqAL+U8sj9/H74kw62mPIExWhyjB07TXqcYBgXHxaQibuWI k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pb/3sk9nuAYfhhHIsVtN5h9CSngbjDSR7jCr49XR300z0pPaJI8sNJ0GsUrnSLZtBKf5GyDoGq
 0KIZtDlHOLxK0yP1C7AHMj9UW7h35Xx+SXLHVaz6NF29wy6pvza2rUhMRDzXmstfZT2YgMX6mz
 1EKy/uHhK1Eyu+Ar4KFLf2fpJcfN9AV6SxsjnuACdj0anuMYLQ8I1UPgH4/YFBrSKZvE6O1LwO
 DQHL4cVqYtgM5cRfcG8ih43E6/SZ+iDROXOP/EsHo2+D2cHnlwDQW4UE4Dk24T+cRrDzsUkYeT
 3a8=
X-SBRS: 2.7
X-MesageID: 25351986
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="25351986"
Date: Thu, 13 Aug 2020 10:50:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
Subject: Re: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
Message-ID: <20200813085009.GD975@Air-de-Roger>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
 <004b01d6714a$782dbbb0$68893310$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004b01d6714a$782dbbb0$68893310$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Thu, Aug 13, 2020 at 09:19:30AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 12 August 2020 13:47
> > To: xen-devel@lists.xenproject.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> > <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Subject: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
> > 
> > Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> > and instead use the newly introduced EOI callback mechanism in order
> > to register a callback for MSI vectors injected from passed through
> > devices.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/vlapic.c    |  2 --
> >  xen/arch/x86/hvm/vmsi.c      | 36 ++++++++++++++++++++++--------------
> >  xen/drivers/passthrough/io.c |  4 +++-
> >  xen/include/asm-x86/hvm/io.h |  2 +-
> >  4 files changed, 26 insertions(+), 18 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 7369be468b..3b3b3d7621 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
> >      else if ( has_viridian_synic(d) )
> >          viridian_synic_ack_sint(v, vector);
> > 
> > -    hvm_dpci_msi_eoi(d, vector);
> > -
> >      spin_lock_irqsave(&vlapic->callback_lock, flags);
> >      callback = vlapic->callbacks[vector].callback;
> >      data = vlapic->callbacks[vector].data;
> > diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> > index 7ca19353ab..e192c4c6da 100644
> > --- a/xen/arch/x86/hvm/vmsi.c
> > +++ b/xen/arch/x86/hvm/vmsi.c
> > @@ -44,11 +44,9 @@
> >  #include <asm/event.h>
> >  #include <asm/io_apic.h>
> > 
> > -static void vmsi_inj_irq(
> > -    struct vlapic *target,
> > -    uint8_t vector,
> > -    uint8_t trig_mode,
> > -    uint8_t delivery_mode)
> > +static void vmsi_inj_irq(struct vlapic *target, uint8_t vector,
> > +                         uint8_t trig_mode, uint8_t delivery_mode,
> > +                         vlapic_eoi_callback_t *callback, void *data)
> >  {
> >      HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "vmsi_inj_irq: vec %02x trig %d dm %d\n",
> >                  vector, trig_mode, delivery_mode);
> > @@ -57,17 +55,17 @@ static void vmsi_inj_irq(
> >      {
> >      case dest_Fixed:
> >      case dest_LowestPrio:
> > -        vlapic_set_irq(target, vector, trig_mode);
> > +        vlapic_set_irq_callback(target, vector, trig_mode, callback, data);
> >          break;
> >      default:
> >          BUG();
> >      }
> >  }
> > 
> > -int vmsi_deliver(
> > -    struct domain *d, int vector,
> > -    uint8_t dest, uint8_t dest_mode,
> > -    uint8_t delivery_mode, uint8_t trig_mode)
> > +static int vmsi_deliver_callback(struct domain *d, int vector, uint8_t dest,
> > +                                 uint8_t dest_mode, uint8_t delivery_mode,
> > +                                 uint8_t trig_mode,
> > +                                 vlapic_eoi_callback_t *callback, void *data)
> >  {
> >      struct vlapic *target;
> >      struct vcpu *v;
> > @@ -78,7 +76,8 @@ int vmsi_deliver(
> >          target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
> >          if ( target != NULL )
> >          {
> > -            vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
> > +            vmsi_inj_irq(target, vector, trig_mode, delivery_mode, callback,
> > +                         data);
> >              break;
> >          }
> >          HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "null MSI round robin: vector=%02x\n",
> > @@ -89,8 +88,8 @@ int vmsi_deliver(
> >          for_each_vcpu ( d, v )
> >              if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
> >                                     0, dest, dest_mode) )
> > -                vmsi_inj_irq(vcpu_vlapic(v), vector,
> > -                             trig_mode, delivery_mode);
> > +                vmsi_inj_irq(vcpu_vlapic(v), vector, trig_mode, delivery_mode,
> > +                             callback, data);
> >          break;
> > 
> >      default:
> > @@ -103,6 +102,14 @@ int vmsi_deliver(
> >      return 0;
> >  }
> > 
> > +
> > +int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t dest_mode,
> > +                 uint8_t delivery_mode, uint8_t trig_mode)
> > +{
> > +    return vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode,
> > +                                 trig_mode, NULL, NULL);
> > +}
> > +
> >  void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
> >  {
> >      uint32_t flags = pirq_dpci->gmsi.gflags;
> > @@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
> > 
> >      ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
> > 
> > -    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
> > +    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
> > +                          hvm_dpci_msi_eoi, NULL);
> >  }
> > 
> >  /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
> > diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
> > index 6b1305a3e5..3793029b29 100644
> > --- a/xen/drivers/passthrough/io.c
> > +++ b/xen/drivers/passthrough/io.c
> > @@ -874,8 +874,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
> >      return 0;
> >  }
> > 
> > -void hvm_dpci_msi_eoi(struct domain *d, int vector)
> > +void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *data)
> >  {
> > +    struct domain *d = v->domain;
> > +
> 
> Could we actually drop the vcpu parameter here... i.e. is there any case where this code will be invoked with v != current?

viridian_synic_wrmsr seems to call vlapic_EOI_set without enforcing v
== current (as it seems to be fine being called from v != current as
long as it's not running).

There's also a call to vlapic_EOI_set in vlapic_has_pending_irq that
I'm not sure won't be called with v != current.

In a normal hardware architecture I would say the EOI can only be
performed from the same CPU, and hence v == current, on Xen however
I'm not sure if any of the assists that we provide would allow for the
EOI to be performed from a different vCPU. I can prepare a pre-patch
to change the functions called from vlapic_handle_EOI to not take a
domain or vcpu parameter.

Thanks, Roger.

