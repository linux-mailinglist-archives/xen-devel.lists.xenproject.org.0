Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE05AA0D2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:05:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5pWE-0006P7-Ho; Thu, 05 Sep 2019 11:01:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5pWC-0006P2-JY
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:01:36 +0000
X-Inumbo-ID: 86503238-cfcc-11e9-abc6-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86503238-cfcc-11e9-abc6-12813bfff9fa;
 Thu, 05 Sep 2019 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567681295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C9j/QgPLteMepUcUkAsefz2mZJPsSlngijVTTqlqX24=;
 b=MzqS4EqlS3wBvK9foP+UgCy7yic9x0/5WZSWamfqwwzbA5/oQrDUJ/no
 gbNxLxe0m/jhXL3DfBLWD5iPxIxh34alwGxHr6OqE18PTM+D8nb/h1pj5
 XCt8lzfYVsAM+ry6DUc7i65/6LLVydaoISEl8hrfCiLTxbWNQ77tl9Fdf Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sPH65pHwn+P0/HQjmGJhDsGndMiNcCy8tI2Yp80FqelFIOJWfynSl0JsCQco58JneXbJbskWeR
 lfJrK44UITP0/1cfbL6PiUJwa3F2nVPFZXtH1gS+yqve3pTnQt4aljzyg2sdVQiRrgKhb3Tz59
 irxubisuCtUKnWXc32+uLRPm7OclRQLF6ED3hlZ5F3NXUJ4N0EJ9HbUZA99OjQxCjug4YVNDlP
 NRyOAT/yOgE9nb52X+0C0zCwUB9tkrfVTNcEVy9mftl1MTog0GwTP/X30B++7oStNb0+Lw+mNU
 HRo=
X-SBRS: 2.7
X-MesageID: 5222829
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5222829"
Date: Thu, 5 Sep 2019 13:01:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
Message-ID: <20190905110127.t3y2lqxzvlhjgfhl@Air-de-Roger>
References: <20190905093416.2955-1-roger.pau@citrix.com>
 <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
 <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
 <C7E10C34-ABBE-4F86-8D5E-E112FDB52072@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C7E10C34-ABBE-4F86-8D5E-E112FDB52072@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTI6MzQ6MTFQTSArMDIwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiAKPiAKPiA+IE9uIFNlcCA1LCAyMDE5LCBhdCAxMTowMSBBTSwgUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAKPiA+IE9uIFRodSwgU2VwIDA1
LCAyMDE5IGF0IDExOjUyOjU5QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9uIDA1
LjA5LjIwMTkgMTE6MzQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4gQ3VycmVudCBsaWJ4
bCBjb2RlIHdpbGwgYWx3YXlzIGVuYWJsZSBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCks
Cj4gPj4+IGV4cGVjdGluZyB0aGF0IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sgdG8gc2hh
ZG93IGlmIEhBUCBpcyBub3QKPiA+Pj4gYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRvIHRo
ZSBkb21haW4gYnVpbGRlciB0aGF0J3Mgbm90IHRoZSBjYXNlCj4gPj4+IGFueSBsb25nZXIsIGFu
ZCB0aGUgaHlwZXJ2aXNvciB3aWxsIHJhaXNlIGFuIGVycm9yIGlmIEhBUCBpcyBub3QKPiA+Pj4g
YXZhaWxhYmxlIGluc3RlYWQgb2Ygc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4KPiA+
PiAKPiA+PiBXb3VsZCBpdCByZWFsbHkgYmUgbXVjaCBtb3JlIGludm9sdmVkIHRoYW4gdGhlIGNo
YW5nZSBoZXJlIHRvIHJlc3RvcmUKPiA+PiBzaWxlbnQgZGVmYXVsdGluZyB0byBzaGFkb3c/Cj4g
PiAKPiA+IEJ1dCB0aGF0IHdvdWxkIG1lYW4gdGhhdCBhIHVzZXIgaGF2aW5nIHNlbGVjdGVkIGhh
cD0xIG9uIHRoZSBjb25maWcKPiA+IGZpbGUgd291bGQgZ2V0IHNpbGVudGx5IGRlZmF1bHRlZCB0
byBzaGFkb3csIHdoaWNoIGlzIHdyb25nIElNTy4KPiAKPiBBdCB0aGUgbGlieGwgbGF5ZXIsIGFy
ZW7igJl0IHRoZSBvcHRpb25zIHRyaXN0YXRlPyAgSS5lLiwgdGhpcyB3b3VsZCBiZSDigJxoYXDi
gJ0sIOKAnHNoYWRvd+KAnSwgb3Ig4oCcbm90IHNwZWNpZmllZOKAnT8KPiAKPiBUaGUgdXNlciBu
ZWVkcyB0byBiZSBhYmxlIHRvIHNwZWNpZnkg4oCcYWx3YXlzIHVzZSBzaGFkb3figJ0sIOKAnGFs
d2F5cyB1c2UgSEFQ4oCdLCBvciDigJx1c2UgSEFQIGlmIGF2YWlsYWJsZSwgb3RoZXJ3aXNlIHVz
ZSBzaGFkb3figJ0uCgpUaGUgInVzZSBIQVAgaWYgYXZhaWxhYmxlLCBvdGhlcndpc2UgdXNlIHNo
YWRvdyIgaXMgY3VycmVudGx5IG9ubHkKcG9zc2libHkgZXhwcmVzc2VkIGJ5IG5vdCBzZXR0aW5n
IHRoZSBoYXAgb3B0aW9uIGluIHRoZSBjb25maWcgZmlsZS4KCj4gQXQgdGhlIG1vbWVudCwgbGVh
dmluZyBpdCBlbXB0eSBzaG91bGQgYmUg4oCcdXNlIEhBUCBpZiBhdmFpbGFibGUsIG90aGVyd2lz
ZSB1c2Ugc2hhZG934oCdOyBzbyDigJxoYXAgPSAx4oCdIHNob3VsZCBmYWlsIGlmIEhBUCBpcyBu
b3QgYXZhaWxhYmxlLgoKUmlnaHQsIHRoaXMgaXMgd2hhdCB0aGlzIHBhdGNoIGlzIHRyeWluZyB0
byBhY2NvbXBsaXNoLgoKSSBoYXZlIGEgdjIgc2VyaWVzIHdoaWNoIGZpbGxzIHRoZSBjYXBhYmls
aXRpZXMgZmllbGQgZm9yIEFSTSBhbmQgYWxzbwpyZXBvcnRzIHRoZSBoYXAgY2FwYWJpbGl0eSBp
biBgeGwgaW5mb2AuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
