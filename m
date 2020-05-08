Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23771CB242
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 16:49:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4J2-0005hs-80; Fri, 08 May 2020 14:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ij8=6W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jX4J0-0005hn-Kz
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 14:48:50 +0000
X-Inumbo-ID: 065aa9b1-913b-11ea-a00d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 065aa9b1-913b-11ea-a00d-12813bfff9fa;
 Fri, 08 May 2020 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588949329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BX34D3fECH+PeVZ3NA/2gZzeW1JvaHPOZiM4xbvXJLs=;
 b=UKytWx41y0tFDhLTlWhbhMXrgNMwJjLr6z7Sn5udMZWkrqL4jDfpc+XA
 OOKxP59C2w4cAElA/+YGy+pAs2W/M70EEmtBS/rFBa13Gtu75PQJavRre
 g3OyL1DNX43cmkpTXUDxuO4D4gMuZKtL5W+BNzatoA/LPCXIY5m1Xf7dx o=;
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
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: AsQAxb7mBQNkVZ6P+L/cIw5KMUL1iOUrtEZ5Y/K393oKqie/3UPYkSJGkLuCySREmmL5X9u82C
 OggPhWP+59iDd8mZ8akjXLZ/NEbJB5gv1iyJFEqAITtDSahMcJN7sksckfW8Ep4zI+fJgfMqD8
 /nFF3hWgOQjaX9fch8YcztZlBwmjMZWsoxIVv/s/oQAJpzHXmHkGbYpfcllLvaLHzANg+lz3Ca
 hpImTUlKen+XUni3KvK1FPh7JP2DYDCSzpL/+dc2vEZVpv2h8h4hiMYzcWBDig4BnNu/cMtoCk
 A5M=
X-SBRS: 2.7
X-MesageID: 17766602
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,367,1583211600"; d="scan'208";a="17766602"
Date: Fri, 8 May 2020 16:48:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
Message-ID: <20200508144820.GI1353@Air-de-Roger>
References: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
 <c8826959-8dbe-cc39-80b0-8ba03c6a6f30@citrix.com>
 <16ed4b91-fdb3-d2c5-9a3c-4aa7ff172b98@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <16ed4b91-fdb3-d2c5-9a3c-4aa7ff172b98@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 08, 2020 at 03:49:35PM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 08.05.2020 14:54, Andrew Cooper wrote:
> > On 08/05/2020 13:43, Jan Beulich wrote:
> >> The op has a register/unregister flag, and hence registration shouldn't
> >> happen unilaterally. Introduce unregister_vpci_mmcfg_handler() to handle
> >> this case.
> >>
> >> Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > I agree in principle that registration shouldn't be unilateral, but why
> > on earth does the API behave like that to begin with?
> > 
> > There is no provision to move or update MMCFG regions in any spec I'm
> > aware of, and hardware cannot in practice update memory routing like this.
> > 
> > Under what circumstances should we tolerate an unregister in the first
> > place?
> 
> Hot unplug of an entire segment, for example.

An OS could also rebalance the resources of a host bridge, according
to the PCI firmware spec, in which case _CBA should be re-evaluated.

I'm not sure whether rebalancing would work anyway, or if there even
are systems that support this and OSes that would attempt to do it,
but since we have the interface for this let's try to do something
sensible.

The other options is simply returning -EOPNOTSUPP. Iff the domain
doesn't try to access devices that would reside on the segment
hot-unplugged it shouldn't make much of a difference, rebalancing is
the case were Xen must support add/remove in order to re-place the
position of the ECAM areas.

Thanks, Roger.

