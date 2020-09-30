Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782227EA0F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702.2335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcIm-0003FK-7Y; Wed, 30 Sep 2020 13:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702.2335; Wed, 30 Sep 2020 13:37:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcIm-0003Ev-3y; Wed, 30 Sep 2020 13:37:48 +0000
Received: by outflank-mailman (input) for mailman id 702;
 Wed, 30 Sep 2020 13:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNcIk-0003Eq-Ha
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:37:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a006ce8-f93a-4b09-ae0a-3cefba96b341;
 Wed, 30 Sep 2020 13:37:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNcIk-0003Eq-Ha
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:37:46 +0000
X-Inumbo-ID: 9a006ce8-f93a-4b09-ae0a-3cefba96b341
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9a006ce8-f93a-4b09-ae0a-3cefba96b341;
	Wed, 30 Sep 2020 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cyTvl5ldiSnN+gN28qEzuLzCTaUkUk85y/7B95FFLHs=;
  b=K2d6fVRnMNyKf6cUnnQ1R+8D0yZpxLfifsRJO9TZo2S2J3LXKRCWSAM4
   mY4rBdov8UDrfeG6/whVOF1VSV07Lfqaz/j5NYmY2I2Xq1g5BIXNvymda
   wZIV3tuQOTDZJ/sYmRtkR7k6K8fTv5S2nIBWfHmpWR6S+ycmgFdNz8RJo
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ixUls68JGhoNUtaPiIRj2/4L4Avcov5zXXV8obKeUyg5oIteJKs1JeULEPike4RVwN05oDVI4p
 l0OYNg7GietgEZLdhbTkyZVtF2OBEk30YX0kExYBb0vv9U/owE2ko9d9BuONLrUVEaRtqp1sCj
 gVmRceBj4StEwAe30Y2m1T4TafDqN5I2VREX5rjVlFBlWU7BaGJFd9K+eqdQFBEXqjgN263h1B
 kClomS4UG1fXmLDOB42NBT4yPu0VIDv6nkgWINqv7AXzY6JQAeVzY4goc7PrauSFFiZd76ZdMu
 0u8=
X-SBRS: None
X-MesageID: 28299606
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28299606"
Date: Wed, 30 Sep 2020 15:37:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
	'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
Subject: Re: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
Message-ID: <20200930133736.GW19254@Air-de-Roger>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-5-roger.pau@citrix.com>
 <006f01d69720$e14a7830$a3df6890$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <006f01d69720$e14a7830$a3df6890$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 12:57:31PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 30 September 2020 11:41
> > To: xen-devel@lists.xenproject.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> > <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Subject: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
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
> >  xen/drivers/passthrough/io.c |  2 +-
> >  xen/include/asm-x86/hvm/io.h |  2 +-
> >  4 files changed, 24 insertions(+), 18 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 38c62a02e6..8a18b33428 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
> >      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> >          vioapic_update_EOI(vector);
> > 
> > -    hvm_dpci_msi_eoi(vector);
> > -
> >      spin_lock_irqsave(&vlapic->callback_lock, flags);
> >      callback = vlapic->callbacks[index].callback;
> >      vlapic->callbacks[index].callback = NULL;
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
> 
> Stray blank line
> 
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
> 
> I think there are more efficiencies possible here. E.g. if is_hardware_domain(d) is true then hvm_dpci_msi_eoi() will do nothing, so no point in setting up the callback in that case.

No, I don't think that's true, hvm_dpci_msi_eoi will execute the call
to pt_pirq_iterate and _hvm_dpci_msi_eoi for the hardware domain,
because MSI vectors need to be acked from the physical lapic even in
the hardware domain case. This was fixed by commit 7b653a245ff.

Thanks, Roger.

