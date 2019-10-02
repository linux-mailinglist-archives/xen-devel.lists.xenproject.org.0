Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C088C8D98
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFh6G-00016Z-B3; Wed, 02 Oct 2019 16:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLuE=X3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFh6E-00016U-Ow
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 16:03:34 +0000
X-Inumbo-ID: 2f54104a-e52e-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 2f54104a-e52e-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570032214;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=eX2iwb7ymQkY8kDmFYg2DJKaA67pdByWIOepOAGXStY=;
 b=A6UMKdoemwainPHw3S15rNrobIEKWvzMKrPDuhpgyehPw8W58IkJGZsi
 BVJYJPfk3PEsUQTlR+yrpGVqEO4RhY1pwM4RNxl+LqugxLLG4aau2jkqd
 iXUb1WY6qLPDlTdLBdMs69Hg+VDxiDnzyZhk7bVpi0RwgGVRQvRyZTVBi 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZORheBSL5iw/3iuKa6Agx81xAdhIRtfLuaoBogYVCjA9m2B2gzdIScbMHcfeUO67s6c0KXeHPT
 FC02s5YDIbk+5lq5eYsmyhaJeoHodSs1z2mjkGvsfsQC14XtYNl071s6J11iWTwjj/KGr1wFaP
 6OtwXxOFF+ZLGmjlmdVOdyFcyC/6teAV/TM0oU75UmDSq+s2dwDzX3bvBjMOofdJPmP0TgBUde
 y0D6PJoqNPNQh76u6E6OoFI8EVZfpb3d8+Fib2RKWrjhwBRPbqrA5BNuQwfUze2Lo5HMB5ELW5
 MsQ=
X-SBRS: 2.7
X-MesageID: 6670142
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,249,1566878400"; 
   d="scan'208";a="6670142"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23956.51794.877621.167418@mariner.uk.xensource.com>
Date: Wed, 2 Oct 2019 17:03:30 +0100
To: Paul Durrant <pdurrant@gmail.com>
In-Reply-To: <CACCGGhAQURtCRt5Zn9a6uDvUDKdtAyV_pqv_HQ5CpZ20pBNf1A@mail.gmail.com>, 
 <23956.51705.860315.343098@mariner.uk.xensource.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
 <23956.51705.860315.343098@mariner.uk.xensource.com>
 <20191001091214.3287-1-paul.durrant@citrix.com>
 <23955.11471.728957.434428@mariner.uk.xensource.com>
 <045e191e8d1b4e9b9e131921dc865483@AMSPEX02CL03.citrite.net>
 <CACCGGhC78VVFo3XGOH0Xn32TRWjbqz7_npHjtLgWtP1A=YJdgg@mail.gmail.com>
 <23955.18786.606189.277746@mariner.uk.xensource.com>
 <CACCGGhAQURtCRt5Zn9a6uDvUDKdtAyV_pqv_HQ5CpZ20pBNf1A@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate
 default for passthrough... [and 1 more messages]
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSC1mb3ItNC4xMyB2MiAwLzJdIGxpYnhsOiBm
aXggYXNzZXJ0aW9uIGZhaWx1cmUiKToKPiBJIGFtIGNvbnRpbnVpbmcgdG8gbG9vayBhdCB0aGUg
ZGVmYXVsdGluZyBhbmQgY29uZmlnIG1hbmFnZW1lbnQgaGVyZQo+IHdpdGggYSB2aWV3IHRvIGdl
dHRpbmcgcmlkIG9mIHNvbWUgb2YgdGhlIGR1cGxpY2F0ZWQgY29kZSBhbmQgbW92aW5nCj4gaXQg
YWxsIGludG8gbGlieGwuCgpTcGVjaWZpY2FsbHksIFBhdWwgRHVycmFudCB3cml0ZXM6Cj4gT2su
IFNwZWNpZmljYWxseSBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkoKSBvbmx5IGhhcyBhY2Nlc3Mg
dG8gdGhlCj4gYnVpbGQgaW5mbywgYnV0IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZh
dWx0KCkgZG9lcyBub3QgaGF2ZQo+IGFjY2VzcyB0byB0aGUgY3JlYXRlIGluZm8sIHNvIGl0IGNh
bid0IGNob29zZSBhIHNlbnNpYmxlIGRlZmF1bHQuIFRvCj4gYXZvaWQgcmUtd3JpdGluZyBsb3Rz
IG9mIGNvZGUgSSB3ZW50IHdpdGggaGF2aW5nIHhsIGNhbHVsYXRlIGEKPiBkZWZhdWx0LiAoUHJp
b3IgdG8gbXkgcGF0Y2ggdGhlcmUgd2FzIG5vIGNhbGN1bGF0ZWQgb3ZlcmhlYWQgYW55d2F5IHNv
Cj4gYSBob3N0IHdpdGhvdXQgc2hhcmVkIEVQVCBhbmQgYXV0b2JhbGxvb25pbmcgb24gd2FzIGFs
cmVhZHkgcGxheWluZwo+IHJ1c3NpYW4gcm91bGV0dGUpLgoKU28gc29tZSByZXN0cnVjdHVyaW5n
IG1heSBiZSBuZWVkZWQuICBJJ2xsIHNlZSBob3cgaW52YXNpdmUgaXQgbG9va3MuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
