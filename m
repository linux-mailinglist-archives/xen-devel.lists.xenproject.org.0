Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A34EA281
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 18:26:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPrgp-0008Nk-Kc; Wed, 30 Oct 2019 17:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZpR=YX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iPrgo-0008Nf-2B
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 17:23:22 +0000
X-Inumbo-ID: f7513b57-fb39-11e9-9533-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7513b57-fb39-11e9-9533-12813bfff9fa;
 Wed, 30 Oct 2019 17:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572456200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MdQqqUn0FJ6Ysyf8aSbqNRCNBKcsOHEJF+4rCFVfY+4=;
 b=N3664xo281aJU8HCEEwZI7hvJ4J8VP7272CVNKEeFQhSHWYJQwfhlB8z
 aougO/9R7iiNTholC5KxkaRgE+v+pYjvwiW7RF/v2Rn/tSXWXDNHyHji4
 YQh2gsxPJX/0Lw/u0Bv782HN1B7zqLEFCwKFiYdZhEBFuv3xEkiYMpHFv A=;
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
IronPort-SDR: 5n1V3vDYKIeFA6a98D65OICEdquh66ePCprWsdrLd2roJftLcilSFyFGa/pmhY1pKm00ZGHIlq
 5wneiAIYD7eAMrzPe6y7K9jAYoEsfi8Qk+nC3IapPQ1frCbZ+VIFON0OXdtE4/m+i4cDiIHmh9
 MB8pleoUMDqcZB9tQPeOA+j9/ivPQMcyZS8hlI5SXB/yWWjMnRJv/7DhJNe8nFGmpW7yXPUBpe
 e5ML+pe420hk/5kOdZ6Dbk+7MGjjtCUOMYMr+bPUfm9b8iVWv9xBSlN16Tjb1Zhv0y/rpk3Pi6
 SeU=
X-SBRS: 2.7
X-MesageID: 7961437
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="7961437"
Date: Wed, 30 Oct 2019 18:23:13 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20191030172313.GX17494@Air-de-Roger>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDk6Mzg6MTZBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBPbiAxMC8zMC8xOSAxOjI0IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gQ2FuIHlv
dSB0cnkgdG8gYWRkIHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0Y2ggb24gdG9wIG9mIHRoZSBleGlz
dGluZwo+ID4gb25lIGFuZCByZXBvcnQgdGhlIG91dHB1dCB0aGF0IHlvdSBnZXQgb24gdGhlIFhl
biBjb25zb2xlPwo+IAo+IEFwcGxpZWQgZGVidWcgcGF0Y2ggYW5kIHJ1biB0aGUgdGVzdCBhZ2Fp
biwgbm90IG9mIGFueSBsb2cgcHJpbnRlZCwKPiBhdHRhY2hlZCBYZW4gbG9nIG9uIHNlcmlhbCBj
b25zb2xlLCBzZWVtcyBwaV91cGRhdGVfaXJ0ZSgpIG5vdCBiZWVuCj4gY2FsbGVkIGZvciBpb21t
dV9pbnRwb3N0IHdhcyBmYWxzZS4KCkkgaGF2ZSB0byBhZG1pdCBJJ20gbG9zdCBhdCB0aGlzIHBv
aW50LiBEb2VzIGl0IG1lYW4gdGhlIG9yaWdpbmFsCmlzc3VlIGhhZCBub3RoaW5nIHRvIGRvIHdp
dGggcG9zdGVkIGludGVycnVwdHM/CgpXaGVyZSB5b3UgYm9vdGluZyB1c2luZyBpb21tdT1pbnRw
b3N0IGluIHlvdXIgcHJldmlvdXMgdGVzdHM/IE5vdGUKdGhhdCBwb3N0ZWQgaW50ZXJydXB0cyBp
cyBub3QgZW5hYmxlZCBieSBkZWZhdWx0IGFjY29yZGluZyB0byB0aGUKY29tbWFuZCBsaW5lIGRv
Y3VtZW50YXRpb24uCgpDYW4geW91IGNvbmZpcm0gd2hldGhlciB5b3UgYWxzbyBzZWUgd2VpcmQg
YmVoYXZpb3Igd2l0aG91dCB1c2luZwpwb3N0ZWQgaW50ZXJydXB0cywgYW5kIGNhbiB5b3UgdHVy
biBwb3N0ZWQgaW50ZXJydXB0cyBvbiBhbmQgZ2l2ZSB0aGUKcGF0Y2ggYSB0cnk/CgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
