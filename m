Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064C1ADC05
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 13:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPOzJ-0007o7-Rg; Fri, 17 Apr 2020 11:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u48u=6B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jPOzH-0007o2-U8
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 11:16:47 +0000
X-Inumbo-ID: ece88bfe-809c-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ece88bfe-809c-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587122207;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=djCXv7uCk7fv9Jjx0UeSVQ2MPe/pxjEJjsO5csnrEiA=;
 b=Lfdj7RvSDVh//3fwKCwRPjaJGj71q6WjA0itqkKgbyOB6w3n4WVFOQWh
 T1wbc5Mx/MbifqkaljblrsJoe3/ZaaT4dagnoCVP5MfGO5ntFjZBmJ3cZ
 kgckTParPqwcja3osP6MXfMK9FKBQ+KOSh6BDNGAKYhHzQAVp4tGfU2L6 U=;
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
IronPort-SDR: Cem/JgwjjFgPDmr4oDeCMYlVydC6h3Zfd4VaHW6bjc99xKtOEWO0W3niN3xtgn1O5HI+BMAEWU
 yHQjOFS7bFCS1IaWH97+JBRKeq+sX9weafjFVOlbDWRrQMHMaCFvayBv/ltNG505bW6y0B1nkI
 L/NOFL46LjXjcJfjsoF0DlFqANJFEKMH3vbwUgeKGFmcQr1NNNmc6r359BBh1hro+3QVb7PINB
 UKiYaVOZ35VsEjUkKRqIL9i5TtQqMiCGjCJtCwkCrR3YcyyJoWmjkAcYpwpU0pNq8zQzLpYqMb
 xdc=
X-SBRS: 2.7
X-MesageID: 16238159
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,394,1580792400"; d="scan'208";a="16238159"
Date: Fri, 17 Apr 2020 13:16:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/vtd: fix EPT page table sharing check
Message-ID: <20200417111637.GP28601@Air-de-Roger>
References: <20200417102650.20083-1-roger.pau@citrix.com>
 <c3589851-7084-e3a4-f776-6157bc4de762@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c3589851-7084-e3a4-f776-6157bc4de762@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 12:57:16PM +0200, Jan Beulich wrote:
> On 17.04.2020 12:26, Roger Pau Monne wrote:
> > The EPT page tables can be shared with the IOMMU as long as the page
> > sizes supported by EPT are also supported by the IOMMU.
> > 
> > Current code checks that both the IOMMU and EPT support the same page
> > sizes, but this is not strictly required, the IOMMU supporting more
> > page sizes than EPT is fine and shouldn't block page sharing.
> 
> Meaning the check isn't wrong, just too strict. Hence maybe
> "relax" instead of "fix" in the subject?
> 
> Also "... page table sharing."

Sure.

> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1914,8 +1914,10 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
> >      if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
> >          return 0;
> >  
> > -    return (ept_has_2mb(ept_cap) && opt_hap_2mb) == cap_sps_2mb(vtd_cap) &&
> > -           (ept_has_1gb(ept_cap) && opt_hap_1gb) == cap_sps_1gb(vtd_cap);
> > +    return ((ept_has_2mb(ept_cap) && opt_hap_2mb) ? cap_sps_2mb(vtd_cap)
> > +                                                  : true) &&
> > +           ((ept_has_1gb(ept_cap) && opt_hap_1gb) ? cap_sps_1gb(vtd_cap)
> > +                                                  : true);
> 
> I have to admit that I always find it odd to have "true" or "false"
> as the 2nd or 3rd operand of a ternary. How about simply changing
> == to <= in the original expression?

I find it weird to use <= to compare booleans, but I can change it.
Let me post a new version with the adjustments to the commit message
and this requested change.

Thanks, Roger.

