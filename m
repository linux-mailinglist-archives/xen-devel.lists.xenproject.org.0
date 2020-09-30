Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E052E27E9EE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.694.2298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcAa-00025d-Kk; Wed, 30 Sep 2020 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694.2298; Wed, 30 Sep 2020 13:29:20 +0000
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
	id 1kNcAa-00025G-HR; Wed, 30 Sep 2020 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 694;
 Wed, 30 Sep 2020 13:29:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNcAZ-00025B-E2
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:29:19 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 357c92db-7d8f-4cc2-9d7e-70f83de32d88;
 Wed, 30 Sep 2020 13:29:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNcAZ-00025B-E2
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:29:19 +0000
X-Inumbo-ID: 357c92db-7d8f-4cc2-9d7e-70f83de32d88
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 357c92db-7d8f-4cc2-9d7e-70f83de32d88;
	Wed, 30 Sep 2020 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601472557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Pui1ya3ocIYQiDoC/SCEzc4H8WMkm3jjjetEv1UEHTY=;
  b=BCYMJ1nVLKtf113Pbtbk6h+hM7qz4UQyGCXeaU4ZVQUV8OLmpPOio5mL
   ZDFtgzg23Z2fXp9+KvJUQTsCHW5S1+UVUtV6PHZZ34RFDjw5UzppGFd8N
   eoukiaWzwrJVaLZzwbgBsyzU+jcVd8oytM4HFfWF4j9qJMY2ozTbewmot
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qzwufoAD+aa6mYASfpjKOX7e+FeieaECDQDzrXirLQvrgLDErVrL/2jZkQeHSUOm9JX5JySt+z
 Ou2f6m9O5XJY9tRnPiJ04h4AgoJhkcWFz6+cFVNhlHkVBLl3GUdrCiT1vWE7A8X49/lZzJfFQ8
 NfdbxQU1d2JbEGizyq765HaQWTygg2UEMlC6ufATzAfdrfYDQjkTSWznfv9O+Q+jWrbARtg/b7
 3VkH7KkXcXCBOiQTw/pfoD3imSlWQ8Lhv7SDe5w/qum50KvV83Vg7qLvp9D6uLSGkIMeVMfuJG
 J+k=
X-SBRS: None
X-MesageID: 28238038
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28238038"
Date: Wed, 30 Sep 2020 15:29:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
	'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>
Subject: Re: [PATCH v2 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
Message-ID: <20200930132908.GU19254@Air-de-Roger>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-6-roger.pau@citrix.com>
 <007501d69722$88272f80$98758e80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <007501d69722$88272f80$98758e80$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 01:09:21PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Roger Pau Monne
> > Sent: 30 September 2020 11:41
> > To: xen-devel@lists.xenproject.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> > <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> > Subject: [PATCH v2 05/11] x86/vioapic: switch to use the EOI callback mechanism
> > 
> > Switch the emulated IO-APIC code to use the local APIC EOI callback
> > mechanism. This allows to remove the last hardcoded callback from
> > vlapic_handle_EOI. Removing the hardcoded vIO-APIC callback also
> > allows to getting rid of setting the EOI exit bitmap based on the
> > triggering mode, as now all users that require an EOI action use the
> > newly introduced callback mechanism.
> > 
> > Move and rename the vioapic_update_EOI now that it can be made static.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Remove the triggering check in the update_eoi_exit_bitmap call.
> >  - Register the vlapic callbacks when loading the vIO-APIC state.
> >  - Reduce scope of ent.
> > ---
> >  xen/arch/x86/hvm/vioapic.c | 131 ++++++++++++++++++++++++-------------
> >  xen/arch/x86/hvm/vlapic.c  |   5 +-
> >  2 files changed, 86 insertions(+), 50 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> > index 752fc410db..dce98b1479 100644
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -375,6 +375,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
> >      .write = vioapic_write
> >  };
> > 
> > +static void eoi_callback(unsigned int vector, void *data)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> > +    unsigned int i;
> > +
> > +    ASSERT(has_vioapic(d));
> > +
> > +    spin_lock(&d->arch.hvm.irq_lock);
> > +
> > +    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> > +    {
> > +        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
> > +        unsigned int pin;
> > +
> > +        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
> > +        {
> > +            union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
> > +
> > +            if ( ent->fields.vector != vector )
> > +                continue;
> > +
> > +            ent->fields.remote_irr = 0;
> > +
> > +            if ( is_iommu_enabled(d) )
> > +            {
> > +                spin_unlock(&d->arch.hvm.irq_lock);
> > +                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
> > +                spin_lock(&d->arch.hvm.irq_lock);
> 
> Is this safe? If so, why lock around the whole loop in the first place?

It's my understanding that locking around the whole loop is mostly
done for convenience reasons, as vioapic entries cannot go away after
initialization.

The lock here is taken to assure consistency of the contents of
vioapic_redir_entry entry, so that other concurrent read/writes don't
change the entry while being processed here - but the entry can never
disappear under our feet.

Jan expressed similar concerns on the previous version, but I'm afraid
I didn't look much at whether hvm_dpci_eoi could be called with the
lock taken, or whether we could move the call of the EOI hooks out of
the locked region. I was mostly leaving this part for later, since
the series is already fairly long and this didn't seem critical.

Thanks, Roger.

