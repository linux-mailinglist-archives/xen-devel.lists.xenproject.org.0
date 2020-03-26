Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D3193BB3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:22:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOfz-0005j8-B0; Thu, 26 Mar 2020 09:19:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHOfx-0005i3-2t
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:19:45 +0000
X-Inumbo-ID: ed6b86fa-6f42-11ea-877f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed6b86fa-6f42-11ea-877f-12813bfff9fa;
 Thu, 26 Mar 2020 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585214383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nucg+NHxKFG0O+ViY+sR+hpUiG7bBQ/ITfqPbwC4C78=;
 b=f73p6rVd9CJA+wI0CohHuWMm9/1ydVHa1FJfwrLiROJr41h5AvIJ5jRU
 XTdFi70Hr23aAC2V3eZ43aVz31MNmeUlKD/2T34heP+BTNX7ldGlauxg0
 vzy7ERv+VXJm53SKWRGEK9r+LohppUu40CiK3QB9NRNqRWJWswr84L5q6 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B7MBFFdJ5FUikBRMNsMmazPlTTGC/jnKrQhVnEMZhIkHM2bBYje8fO8w9cibMgOa5hC3rJ5khP
 +YLEm00KDTXXUvVPOZfNI/mBWNWtMjtpovO57PqW1NxMICOtmfyqMvSRHNJ8TYX+KZCxXu/d8A
 PrS1diGktSUlEDj78Js9h6Zhzvfm8Y6Mt2HcqfhzKDpEQbPWk9+Lj8KIG6/SZynH6kS4yNSH7y
 YkIQ8QbxehnjbmgJJ68zBg4hhOs5NNEdpG27B+rXt8Wai4LcvzBq+3aIQT0BKwU405g65GCoyp
 w2A=
X-SBRS: 2.7
X-MesageID: 14999728
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,307,1580792400"; d="scan'208";a="14999728"
Date: Thu, 26 Mar 2020 10:19:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200326091936.GJ28601@Air-de-Roger>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA780@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA780@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/4] x86/nvmx: split updating RVI from
 SVI in nvmx_update_apicv
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 03:13:56AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Wednesday, March 25, 2020 6:19 PM
> > 
> > Updating SVI is required when an interrupt has been injected using the
> > Ack on exit VMEXIT feature, so that the in service interrupt in the
> > GUEST_INTR_STATUS matches the vector that is signaled in
> > VM_EXIT_INTR_INFO.
> > 
> > Updating RVI however is not tied to the Ack on exit feature, as it
> > signals the next vector to be injected, and hence should always be
> > updated to the next pending vector, regardless of whether Ack on exit
> > is enabled.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/vmx/vvmx.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> > index 1753005c91..8431c912a1 100644
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -1384,26 +1384,38 @@ static void nvmx_update_apicv(struct vcpu *v)
> >      struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
> >      unsigned long reason = get_vvmcs(v, VM_EXIT_REASON);
> >      unsigned long intr_info = get_vvmcs(v, VM_EXIT_INTR_INFO);
> > +    int rvi;
> > 
> >      if ( reason == EXIT_REASON_EXTERNAL_INTERRUPT &&
> >           nvmx->intr.source == hvm_intsrc_lapic &&
> >           (intr_info & INTR_INFO_VALID_MASK) )
> >      {
> >          uint16_t status;
> > -        uint32_t rvi, ppr;
> > -        uint32_t vector = intr_info & 0xff;
> > +        uint32_t ppr;
> > +        unsigned int vector = intr_info & INTR_INFO_VECTOR_MASK;
> >          struct vlapic *vlapic = vcpu_vlapic(v);
> > 
> > +        /*
> > +         * Update SVI to record the currently in service interrupt that's
> > +         * signaled in EXIT_INTR_INFO.
> > +         */
> >          vlapic_ack_pending_irq(v, vector, 1);
> > 
> >          ppr = vlapic_set_ppr(vlapic);
> >          WARN_ON((ppr & 0xf0) != (vector & 0xf0));
> > 
> >          status = vector << VMX_GUEST_INTR_STATUS_SVI_OFFSET;
> > -        rvi = vlapic_has_pending_irq(v);
> > -        if ( rvi != -1 )
> > -            status |= rvi & VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
> > +        __vmwrite(GUEST_INTR_STATUS, status);
> > +    }
> > +
> > +    rvi = vlapic_has_pending_irq(v);
> > +    if ( rvi != -1 )
> > +    {
> > +        unsigned long status;
> > 
> > +        __vmread(GUEST_INTR_STATUS, &status);
> > +        status &= ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
> > +        status |= rvi & VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
> >          __vmwrite(GUEST_INTR_STATUS, status);
> >      }
> 
> I have two minor comments. First, original code requires only one
> __vmwrite but now needs two writes and one read for Ack-on-exit
> is set. Can we optimize to sustain the original behavior?

I think I can manage to do a single write by using a global status
variable initialized to 0 and only do the vmwrite if the value is != 0
by the end of the function.

> Second,
> although I didn't come up a case where always updating RVI (w/
> pending interrupt) may bring some bad effect, it is anyway safer
> to put the whole logic within the check of vmexit reason and intr 
> source.

I also considered this and decided there was no harm in always
updating RVI if there's a pending interrupt, it could even prevent a
future VMEXIT to update RVI AFAICT?

If you prefer I can return early from the function if reason !=
EXIT_REASON_EXTERNAL_INTERRUPT.

Thanks, Roger.

