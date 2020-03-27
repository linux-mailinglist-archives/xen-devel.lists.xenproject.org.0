Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AE19546E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 10:51:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHlbn-0000Ri-Bh; Fri, 27 Mar 2020 09:48:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSB4=5M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHlbl-0000RL-Lt
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 09:48:57 +0000
X-Inumbo-ID: 29bfc346-7010-11ea-892a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29bfc346-7010-11ea-892a-12813bfff9fa;
 Fri, 27 Mar 2020 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585302531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gUVraujTVQdmu/8wBYpFOAhzkph5Dca+yuC2OcNo+YE=;
 b=eEgRIJy+/Q/gZteLDDG/9WHwgWfLUgCbToCga7koS67TFoFm93KNXQIl
 IsmgA5LEPkwZaR7NT/GMIC+hw7aIzvhSfRzo9/pAYNGzpRHWHZX2mdYi/
 V9eBP3FO07Wd1Tg5rHsi0PbmZ0aLYNJY5BkftpoXFytlZfQGe0qzEscv+ Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CIj6/dXFpMwDsoPc12/re041TdNckSpi8qrPAP1AiXH8VbcVe0MveforgGwcBmAfcyANK1KQxC
 9x689+5ugZBz1C0pTehcqZSI+9/l8JMA3i32scwprE4NMzKgk84bNjj5JcucJd7Y7YJyXNe1qz
 dIK9D5aOWwELJsacGkcGG9G1XGOZVgA5NjyQyfIAIzWHVhbZHL9gxM6CfSomObOAbGYNVhFWFx
 2+j1V8frw8possPTJK0ibEqIxCkIXjHV9WTAfBH3eLeL9A//n15gWFT3+lIhkqoHC7ch13gcdl
 zk4=
X-SBRS: 2.7
X-MesageID: 15397946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,311,1580792400"; d="scan'208";a="15397946"
Date: Fri, 27 Mar 2020 10:48:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200327094835.GM28601@Air-de-Roger>
References: <20200326152720.36970-1-roger.pau@citrix.com>
 <20200326152720.36970-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EC9E0@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EC9E0@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 3/4] x86/nvmx: split updating RVI from
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

On Fri, Mar 27, 2020 at 02:21:46AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Thursday, March 26, 2020 11:27 PM
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
> > When not using the Ack on exit feature preserve the previous vector in
> > SVI, so that it's not lost when RVI is updated to contain the pending
> > vector to inject.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>, with one small comment:
> 
> > ---
> > Changes since v2:
> >  - Return early if the exit reason != EXTERNAL_INTERRUPT.
> >  - Reduce the number of vmwrites by accumulating the changes to a
> >    local variable which is flushed at the end of the function.
> >  - Attempt to preserve the exiting SVI if Ack on exit is not enabled.
> > ---
> >  xen/arch/x86/hvm/vmx/vvmx.c | 33 ++++++++++++++++++++++++---------
> >  1 file changed, 24 insertions(+), 9 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> > index 1753005c91..39fb553590 100644
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -1384,28 +1384,43 @@ static void nvmx_update_apicv(struct vcpu *v)
> >      struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
> >      unsigned long reason = get_vvmcs(v, VM_EXIT_REASON);
> >      unsigned long intr_info = get_vvmcs(v, VM_EXIT_INTR_INFO);
> > +    unsigned long status;
> > +    int rvi;
> > 
> > -    if ( reason == EXIT_REASON_EXTERNAL_INTERRUPT &&
> > -         nvmx->intr.source == hvm_intsrc_lapic &&
> > +    if ( reason != EXIT_REASON_EXTERNAL_INTERRUPT )
> > +        return;
> 
> can we also exit if source is not lapic? as we discussed in another
> thread, the whole logic here is only for lapic not others...

Right, in any case the code below will only update GUEST_INTR_STATUS
(either SVI or RVI) for lapic interrupts, but returning early if the
source is not the lapic will do no harm AFAICT.

Will send v4 with this changed.

Thanks, Roger.

