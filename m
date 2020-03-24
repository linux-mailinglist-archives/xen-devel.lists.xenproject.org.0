Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1C190C5F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:25:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGhdv-0007qh-Ms; Tue, 24 Mar 2020 11:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGhdu-0007qc-Bh
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:22:46 +0000
X-Inumbo-ID: c8620b0e-6dc1-11ea-83ce-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8620b0e-6dc1-11ea-83ce-12813bfff9fa;
 Tue, 24 Mar 2020 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585048965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lE7GbjGj826yvvn09ymuv4ExuEUKlUi0eHaO+o+tNdA=;
 b=ILJLsZ1qLux0Cmg37ZPFosKJpxpCIYjdOpnEH9/FTpRyuco7t2fGBPAa
 dl6RFsVYcoGQ1p+PcF3ChLH2pIu6J3RWqUujA53MKiZMWwmWfdYFm/2dU
 RLEOy9JBr7Zb6Qou6bxNVEowDv5FdMqxRznGJtT/flBQG4HrpfQpuBm69 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: liTknfcWH4DC4iRgGnkKInHuCdYSqT0Y6NN+jgQ0uSVqPrhuUoZQBxiW1tiN4tQLuD4RdlH89r
 e38q4CqdxwwsOGaxEloq9dHo7qeuU/ihR3MH//T+VltzC0XY0py65L6l6FBtp0hF1kijfWCGUX
 THfSqtICVl3LGEdvBPYJESuUCogPvALXIsVSUp17aAB2+jIhdeW6y5GZyXfky8URjVy89Itwl7
 fGedwfHgszBFP/YlGhd6fal9s2icoVvp17dvU4Eck0mIFcY/YlE3zSo/5ODpb20Lm5yTmQUf8S
 Mtw=
X-SBRS: 2.7
X-MesageID: 14739439
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14739439"
Date: Tue, 24 Mar 2020 12:22:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200324112237.GI24458@Air-de-Roger.citrite.net>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B44@SHSMSX104.ccr.corp.intel.com>
 <20200324095052.GF24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E604D@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E604D@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/3] x86/nvmx: clarify and fix usage of
 nvmx_update_apicv
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 10:11:15AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: Tuesday, March 24, 2020 5:51 PM
> > 
> > On Tue, Mar 24, 2020 at 06:03:28AM +0000, Tian, Kevin wrote:
> > > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > > Sent: Saturday, March 21, 2020 3:08 AM
> > > >
> > > > The current usage of nvmx_update_apicv is not clear: it is deeply
> > > > intertwined with the Ack interrupt on exit VMEXIT control.
> > > >
> > > > The code in nvmx_update_apicv should update the SVI (in service
> > interrupt)
> > > > field of the guest interrupt status only when the Ack interrupt on
> > > > exit is set, as it is used to record that the interrupt being
> > > > serviced is signaled in a vmcs field, and hence hasn't been injected
> > > > as on native. It's important to record the current in service
> > > > interrupt on the guest interrupt status field, or else further
> > > > interrupts won't respect the priority of the in service one.
> > > >
> > > > While clarifying the usage make sure that the SVI is only updated when
> > > > Ack on exit is set and the nested vmcs interrupt info field is valid. Or
> > > > else a guest not using the Ack on exit feature would loose interrupts as
> > > > they would be signaled as being in service on the guest interrupt
> > > > status field but won't actually be recorded on the interrupt info vmcs
> > > > field, neither injected in any other way.
> > >
> > > It is insufficient. You also need to update RVI to enable virtual injection
> > > when Ack on exit is cleared.
> > 
> > But RVI should be updated in vmx_intr_assist in that case, since
> > nvmx_intr_intercept shouldn't intercept the interrupt, as it should be
> > handled normally.
> 
> As we discussed before, vmx_intr_assist is invoked before nvmx_switch_guest.
> 
> It is incorrectly to update RVI at that time since it might be still vmcs02 being 
> active (if no pending softirq to make it invoked again).
> 
> Also nvmx_intr_intercept does intercept Ack-on-exit=0 case:
> 
>         if ( intack.source == hvm_intsrc_pic ||
>                  intack.source == hvm_intsrc_lapic )
>         {
>             vmx_inject_extint(intack.vector, intack.source);
> 
>             ctrl = get_vvmcs(v, VM_EXIT_CONTROLS);
>             if ( ctrl & VM_EXIT_ACK_INTR_ON_EXIT )
>             {
>                 /* for now, duplicate the ack path in vmx_intr_assist */
>                 hvm_vcpu_ack_pending_irq(v, intack);
>                 pt_intr_post(v, intack);
> 
>                 intack = hvm_vcpu_has_pending_irq(v);
>                 if ( unlikely(intack.source != hvm_intsrc_none) )
>                     vmx_enable_intr_window(v, intack);
>             }
>             else if ( !cpu_has_vmx_virtual_intr_delivery )
>                 vmx_enable_intr_window(v, intack);
> 
>             return 1; <<<<<<<<

Right, I always get confused by the switch happening in the vmentry
path.

That only happens when the vcpu is in nested mode
(nestedhvm_vcpu_in_guestmode == true). That would be the case before a
vmexit, at least for the first call to vmx_intr_assist if there are
pending softirqs.

Note that if there are pending softirqs the second time
nvmx_intr_intercept will return 0.

>         }
> 
> > 
> > > >
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > >  xen/arch/x86/hvm/vmx/vvmx.c | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c
> > b/xen/arch/x86/hvm/vmx/vvmx.c
> > > > index 1b8461ba30..180d01e385 100644
> > > > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > > > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > > > @@ -1383,7 +1383,7 @@ static void (struct vcpu *v)
> > > >  {
> > > >      struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
> > > >      unsigned long reason = get_vvmcs(v, VM_EXIT_REASON);
> > > > -    uint32_t intr_info = nvmx->intr.intr_info;
> > > > +    unsigned long intr_info = get_vvmcs(v, VM_EXIT_INTR_INFO);
> > >
> > > well, above reminds me an interesting question. Combining last and this
> > > patch, we'd see essentially that it goes back to the state before f96e1469
> > > (at least when Ack on exit is true).
> > 
> > Well, patch 1/3 is a revert of f96e1469, so just reverting f96e1469
> > gets us to that state.
> 
> you are right. I just wanted to point out that this patch alone doesn't
> do any real fix for ack-on-exit=1 case. It just makes sure that ack-on-exit=0
> is skipped from that function. So it won't be the one fixing your previous
> problem. 😊

Yes, that's correct.

> > 
> > This patch is an attempt to clarify that nvmx_update_apicv is closely
> > related to the Ack on exit feature, as it modifies SVI in order to
> > signal the vector currently being serviced by the EXIT_INTR_INFO vmcs
> > field. This was not obvious to me, as at first sight I assumed
> > nvmx_update_apicv was actually injecting that vector into the guest.
> > 
> > > iirc, that commit was introduced to enable
> > > nested x2apic with apicv, and your very first version even just removed
> > > the whole nvmx_update_apicv. Then now with the new reverted logic,
> > > are you still suffering x2apic problem? If not, does it imply the real fix
> > > is actually coming from patch 3/3 for eoi bitmap update?
> > 
> > Yes, patch 3/3 is the one that fixed the issue. Note however that
> > strangely enough removing the call to nvmx_update_apicv (as my first
> > attempt to solve the issue) did fix it on one of my boxes. It depends
> > a lot on the available vmx features AFAICT.
> 
> Did you confirm that with 3/3 alone can fix that issue? Just want to make
> sure the real gain of each patch, so we can reflect it in the commit msg
> in updated version.

Yes, the patch that actually fixes the issue in the box I've been
testing with is 3/3.

Xen will always use the Ack on exit feature, I currently have no way
to test whether not using Ack on exit works at all.

> > 
> > > >
> > > >      if ( reason == EXIT_REASON_EXTERNAL_INTERRUPT &&
> > > >           nvmx->intr.source == hvm_intsrc_lapic &&
> > > > @@ -1399,6 +1399,15 @@ static void nvmx_update_apicv(struct vcpu *v)
> > > >          ppr = vlapic_set_ppr(vlapic);
> > > >          WARN_ON((ppr & 0xf0) != (vector & 0xf0));
> > > >
> > > > +        /*
> > > > +         * SVI must be updated when the interrupt has been signaled using
> > the
> > > > +         * Ack on exit feature, or else the currently in-service interrupt
> > > > +         * won't be respected.
> > > > +         *
> > > > +         * Note that this is specific to the fact that when doing a VMEXIT an
> > > > +         * interrupt might get delivered using the interrupt info vmcs field
> > > > +         * instead of being injected normally.
> > > > +         */
> > >
> > > I'm not sure mentioning SVI specifically here is necessary, since all steps
> > > here are required - updating iir, isr, rvi, svi, ppr, etc. It is just an emulation
> > > of updating virtual APIC state as if a virtual interrupt delivery happens.
> > 
> > Hm, it was hard for me to figure out that SVI is modified here in
> > order to signal that the Ack on exit vector is currently in service,
> > as opposed to being injected using the virtual interrupt delivery
> > mechanism.
> > 
> > I just wanted to clarify that the purpose of this function is not to
> > inject the vector in intr_info, but rather to signal that such vector
> > has already been injected using a different mechanism.
> > 
> > I'm happy to reword this, but IMO it should be clear that the purpose
> > of the function is not so much to inject an interrupt, but to update
> > the virtual interrupt delivery field in order to signal that an
> > interrupt has been injected using a different mechanism.
> > 
> 
> reading it again I feel possibly fine to put the comment there. But
> I disagree the statement above. The purpose of this function is indeed 
> for injecting an interrupt. Both RVI and SVI are additional requirements 
> when virtual APIC page is in-use while virtual interrupt delivery is not 
> used, i.e. when ack-on-exit is set.

Right, so if I understand this correctly:

 - SVI: must be updated when Ack on exit is used, to signal the
   current in service interrupt which has been injected using a
   mechanism different than virtual interrupts.

 - RVI: should always be updated if there are pending interrupts to
   be delivered. Note that the interrupt signaled in the INTR_INFO
   field if Ack on exit is enabled is not considered pending anymore.

So I think RVI should always be updated, regardless of whether Ack on
exit is used or not. Do you agree?

Thanks, Roger.

