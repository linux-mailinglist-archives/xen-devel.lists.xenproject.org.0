Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42079193BBF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:25:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOiV-00071w-6t; Thu, 26 Mar 2020 09:22:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHOiT-00071n-R9
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:22:21 +0000
X-Inumbo-ID: 4b78d11c-6f43-11ea-8783-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b78d11c-6f43-11ea-8783-12813bfff9fa;
 Thu, 26 Mar 2020 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585214541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p8sgprJDqKUklDw8JW3drdsx2PRBFIqaAi7+jRxIl0U=;
 b=dxSuP/UYhxyak9Y1qzqOY6qZodErGOu2BZF004pWSoO8+sVBvClKiGQH
 ONQBrNNzHNrgq3BO4Oz76TjMsJPrgXCbcW2LjDEqp8PKfdSmw/FtRu95k
 6byW0o7w1LQVeefhyup6Gyif15SWNHNeAan0JHTmZLFtH0sokWISgBZ/G U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: d923fPSjPf56WB7vzMrkBQ1b8o8s8L7NT1652GWvQdASu5u1KBri1fej36VEAAogb+E9dV+4aX
 TDJpKG/3tMrIW9drX9rx9xQ/+/XY5nrwT23LVveJYck+U4aGVXY8uHYB6XOwLe+kUHbMsLFRJn
 HeVymRO0gjwQxzTJMmPLPnC2BFaWdsSVqRUfwRQhGNVL8Xj7SUo0zRwhy2p4RL6/466aptXUTZ
 iYm8djxOF08tZqAir1cydsBb0KhUT4Gowc/GpBxY9zYwkYDhXHimbmigB0aAFhRTkt/2Wwax55
 dV4=
X-SBRS: 2.7
X-MesageID: 15078911
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,307,1580792400"; d="scan'208";a="15078911"
Date: Thu, 26 Mar 2020 10:22:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200326092213.GK28601@Air-de-Roger>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-5-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA7AD@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA7AD@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/nvmx: update exit bitmap when
 using virtual interrupt delivery
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

On Thu, Mar 26, 2020 at 03:17:59AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Wednesday, March 25, 2020 6:19 PM
> > 
> > Force an update of the EOI exit bitmap in nvmx_update_apicv, because
> > the one performed in vmx_intr_assist might not be reached if the
> > interrupt is intercepted by nvmx_intr_intercept returning true.
> > 
> > Extract the code to update the exit bitmap from vmx_intr_assist into a
> > helper and use it in nvmx_update_apicv.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Reword commit message.
> > ---
> >  xen/arch/x86/hvm/vmx/intr.c       | 21 +++++++++++++--------
> >  xen/arch/x86/hvm/vmx/vvmx.c       |  2 ++
> >  xen/include/asm-x86/hvm/vmx/vmx.h |  2 ++
> >  3 files changed, 17 insertions(+), 8 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> > index 49a1295f09..000e14af49 100644
> > --- a/xen/arch/x86/hvm/vmx/intr.c
> > +++ b/xen/arch/x86/hvm/vmx/intr.c
> > @@ -224,6 +224,18 @@ static int nvmx_intr_intercept(struct vcpu *v, struct
> > hvm_intack intack)
> >      return 0;
> >  }
> > 
> > +void vmx_sync_exit_bitmap(struct vcpu *v)
> > +{
> > +    const unsigned int n = ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap);
> > +    unsigned int i;
> > +
> > +    while ( (i = find_first_bit(&v->arch.hvm.vmx.eoi_exitmap_changed, n)) <
> > n )
> > +    {
> > +        clear_bit(i, &v->arch.hvm.vmx.eoi_exitmap_changed);
> > +        __vmwrite(EOI_EXIT_BITMAP(i), v->arch.hvm.vmx.eoi_exit_bitmap[i]);
> > +    }
> > +}
> > +
> >  void vmx_intr_assist(void)
> >  {
> >      struct hvm_intack intack;
> > @@ -318,7 +330,6 @@ void vmx_intr_assist(void)
> >                intack.source != hvm_intsrc_vector )
> >      {
> >          unsigned long status;
> > -        unsigned int i, n;
> > 
> >         /*
> >          * intack.vector is the highest priority vector. So we set eoi_exit_bitmap
> > @@ -379,13 +390,7 @@ void vmx_intr_assist(void)
> >                      intack.vector;
> >          __vmwrite(GUEST_INTR_STATUS, status);
> > 
> > -        n = ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap);
> > -        while ( (i = find_first_bit(&v->arch.hvm.vmx.eoi_exitmap_changed,
> > -                                    n)) < n )
> > -        {
> > -            clear_bit(i, &v->arch.hvm.vmx.eoi_exitmap_changed);
> > -            __vmwrite(EOI_EXIT_BITMAP(i), v->arch.hvm.vmx.eoi_exit_bitmap[i]);
> > -        }
> > +        vmx_sync_exit_bitmap(v);
> > 
> >          pt_intr_post(v, intack);
> >      }
> > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> > index 8431c912a1..845dd87f75 100644
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -1418,6 +1418,8 @@ static void nvmx_update_apicv(struct vcpu *v)
> >          status |= rvi & VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
> >          __vmwrite(GUEST_INTR_STATUS, status);
> >      }
> > +
> > +    vmx_sync_exit_bitmap(v);
> 
> Similarly, I'd like to do the sync within the conditional block, when intr
> status is actually changed. Otherwise, it becomes checking bitmap change
> in every vmentry when apicv is enabled.

No - it will only check the bitmap when there's a virtual vmexit
(which is where nvmx_update_apicv gets called), not on every vmentry.
I can try to do this conditionally on whether GUEST_INTR_STATUS is
actually changed.

Thanks, Roger.

