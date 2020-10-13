Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA628D0A6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6262.16706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSLaW-0003p2-2w; Tue, 13 Oct 2020 14:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6262.16706; Tue, 13 Oct 2020 14:47:40 +0000
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
	id 1kSLaV-0003od-Vn; Tue, 13 Oct 2020 14:47:39 +0000
Received: by outflank-mailman (input) for mailman id 6262;
 Tue, 13 Oct 2020 14:47:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COa4=DU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kSLaU-0003oY-BJ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:47:38 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0f0d23f-4518-4c98-bd68-f2d6c5e8025c;
 Tue, 13 Oct 2020 14:47:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=COa4=DU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kSLaU-0003oY-BJ
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:47:38 +0000
X-Inumbo-ID: d0f0d23f-4518-4c98-bd68-f2d6c5e8025c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d0f0d23f-4518-4c98-bd68-f2d6c5e8025c;
	Tue, 13 Oct 2020 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602600456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=phnTqfecWLx/M2Er41CQxAFLuKwYNWrujpPQF3vL8JU=;
  b=X0/d7OajK1SUYHfdgYFETk92OPz49tVKyy4SfO07U1C3N2CvQlTpYLLa
   BOWFwa5KKMCUlphJdJ0Rc92vtq+sEAAKmf4Gm43QX8pvsUFhd0XzfDKrL
   I29YupDVbOdEjigkYo3SXfvaRO0m5mabtTcAMY4OmtMTfSvSJKWol+rLx
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 10Nz0ied6Tsvv3gXfKyE6uOmuHA9pU8PUa7lLNmsA/lsMeFrFlyveLmtpFKDybfox3wU/fg64x
 em/c3LWdVEaD8DS5MXakY2HAfEudsYHvFz208qyQORpaKc/ASbTPaa+/S+c2iozBMoAdh6gVC2
 hcVNBi6Ui2v7bTo+DjWBgCJJiMHBuqTQysHc0T4B50CMWP3CLCn2923h4+COSPLk2KNLAkbOVH
 ARBmESJUzrxa6gUhBhSXC+TT2WekIAOE3BLXObcxiI7T/vWUM+/I1IAAq9J9qW1df13OBJx52g
 zOs=
X-SBRS: 2.5
X-MesageID: 28875181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,371,1596513600"; 
   d="scan'208";a="28875181"
Date: Tue, 13 Oct 2020 16:47:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
Message-ID: <20201013144724.GR19254@Air-de-Roger>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-5-roger.pau@citrix.com>
 <785f80d6-3a0a-6a58-fd9a-05d8ff87f6fe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <785f80d6-3a0a-6a58-fd9a-05d8ff87f6fe@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 02, 2020 at 05:25:34PM +0200, Jan Beulich wrote:
> On 30.09.2020 12:41, Roger Pau Monne wrote:
> > Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> > and instead use the newly introduced EOI callback mechanism in order
> > to register a callback for MSI vectors injected from passed through
> > devices.
> 
> What I'm kind of missing here is a word on why this is an improvement:
> After all ...
> 
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
> >      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> >          vioapic_update_EOI(vector);
> >  
> > -    hvm_dpci_msi_eoi(vector);
> 
> ... you're exchanging this direct call for a more complex model with
> an indirect one (to the same function).

Sure. But this direct call will be made for each vlapic EOI, while my
added callback will only be executed if the vector was injected by
thee vmsi code, and hence will remove pointless calls to
hvm_dpci_msi_eoi.

It's IMO not feasible to be adding hardcoded calls to
vlapic_handle_EOI for each possible subsystem or emulated device that
wants to be notified of EOIs, hence we need some kind of generic
framework to achieve this.

> > @@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
> >  
> >      ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
> >  
> > -    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
> > +    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
> > +                          hvm_dpci_msi_eoi, NULL);
> >  }
> 
> While I agree with your reply to Paul regarding Dom0, I still think
> the entire if() in hvm_dpci_msi_eoi() should be converted into a
> conditional here. There's no point registering the callback if it's
> not going to do anything.
> 
> However, looking further, the "!hvm_domain_irq(d)->dpci &&
> !is_hardware_domain(d)" can be simply dropped altogether, right away.
> It's now fulfilled by the identical check at the top of
> hvm_dirq_assist(), thus guarding the sole call site of this function.
> 
> The !is_iommu_enabled(d) is slightly more involved to prove, but it
> should also be possible to simply drop. What might help here is a
> separate change to suppress opening of HVM_DPCI_SOFTIRQ when there's
> no IOMMU in the system, as then it becomes obvious that this part of
> the condition is guaranteed by hvm_do_IRQ_dpci(), being the only
> site where the softirq can get raised (apart from the softirq
> handler itself).
> 
> To sum up - the call above can probably stay as is, but the callback
> can be simplified as a result of the change.

Yes, I agree. Would you be fine with converting the check in the
callback into an assert, or would you rather have it removed
completely?

> > --- a/xen/drivers/passthrough/io.c
> > +++ b/xen/drivers/passthrough/io.c
> > @@ -874,7 +874,7 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
> >      return 0;
> >  }
> >  
> > -void hvm_dpci_msi_eoi(unsigned int vector)
> > +void hvm_dpci_msi_eoi(unsigned int vector, void *data)
> >  {
> >      struct domain *d = current->domain;
> 
> Instead of passing NULL for data and latching d from current, how
> about you make the registration pass d to more easily use here?

Yes, I think that's fine - we already have the domain pointer in
vmsi_deliver_callback so it could be passed as the callback private
data.

Thanks, Roger.

