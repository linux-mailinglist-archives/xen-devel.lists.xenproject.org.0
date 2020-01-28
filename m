Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A416314BC7D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:00:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSIj-0005jB-QI; Tue, 28 Jan 2020 14:57:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwSIi-0005j6-Ud
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:57:12 +0000
X-Inumbo-ID: 7645e228-41de-11ea-8704-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7645e228-41de-11ea-8704-12813bfff9fa;
 Tue, 28 Jan 2020 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580223431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m6tshoao3V2nKqDTvgQxpcQeCYcQ5Nwcf0U1gfOMbNY=;
 b=g1UovKByArxeYoyHxIJg0OPkuSgOCq/5WDWqAzH6LBKCJWfnJX0F88rQ
 cvX0n0ZxabZ0KeM4170pcT3Xc+H1dAp1DYUz0Tk3Ggh0FMLoW2yF9xLfS
 gYDqg21GntmpRo5yHIdGC7CYoz4fZS60/a8s8PUlaGzRfwf55PBKDIEap g=;
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
IronPort-SDR: kpzMhjQL3VmJEeSRH7laJFxEkgfNoh0kw+yvx7ZjBCok5hIauLKtGNjieuR3O6QOEYtuFRi6bD
 DMyWAHnyw7imLf14tTFEb2fEkc9s8gcaCEGRFZA6/sApy061N2fxTCndjk8d+dCy07BZa/tHqN
 tX2JsnwiLGf1H2gOwfhDtbRPGd/F8GQYrHav42y+BVF+vhJrj0pwREV5k4I5II1I+r3sO4Hq4O
 ODOrDPl7sGMPt5bI5pyIJGVXyKUUBy0sSoEfOzq3C74IV6hx4BLv4gKelzswECh0IOTwlll+hX
 RN4=
X-SBRS: 2.7
X-MesageID: 11992275
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11992275"
Date: Tue, 28 Jan 2020 15:57:04 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200128145704.GQ57924@desktop-tdan49n.eng.citrite.net>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200128141736.223qryuo3p2ss4ma@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128141736.223qryuo3p2ss4ma@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDI6MTc6MzZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAwNzoxMToxNVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gWy4uLl0KPiA+ICAKPiA+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
Kl9faW5pdCB4Z19wcm9iZSh2b2lkKQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAu
YyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+ID4gaW5kZXggNjVlYjdjYmRhOC4uOWJjOTI1NjE2YSAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2
L3NtcC5jCj4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4gICNpbmNsdWRlIDx4ZW4vcGVyZmMuaD4K
PiA+ICAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9jdXJyZW50
Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ID4gICNpbmNsdWRlIDxhc20vc21wLmg+
Cj4gPiAgI2luY2x1ZGUgPGFzbS9tYzE0NjgxOHJ0Yy5oPgo+ID4gICNpbmNsdWRlIDxhc20vZmx1
c2h0bGIuaD4KPiA+IEBAIC0yNTYsNiArMjU3LDE2IEBAIHZvaWQgZmx1c2hfYXJlYV9tYXNrKGNv
bnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykK
PiA+ICAgICAgaWYgKCAoZmxhZ3MgJiB+RkxVU0hfT1JERVJfTUFTSykgJiYKPiA+ICAgICAgICAg
ICAhY3B1bWFza19zdWJzZXQobWFzaywgY3B1bWFza19vZihjcHUpKSApCj4gPiAgICAgIHsKPiA+
ICsgICAgICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICYmCj4gPiArICAgICAgICAgICAgICEo
ZmxhZ3MgJiB+KEZMVVNIX1RMQiB8IEZMVVNIX1RMQl9HTE9CQUwgfCBGTFVTSF9WQV9WQUxJRCB8
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spKSAmJgo+ID4g
KyAgICAgICAgICAgICAhaHlwZXJ2aXNvcl9mbHVzaF90bGIobWFzaywgdmEsIGZsYWdzICYgRkxV
U0hfT1JERVJfTUFTSykgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIGlmICggdGxi
X2Nsa19lbmFibGVkICkKPiA+ICsgICAgICAgICAgICAgICAgdGxiX2Nsa19lbmFibGVkID0gZmFs
c2U7Cj4gCj4gWW91IG1heSBkZWxldGUgdGhlIGlmIGhlcmUgdG8gbWFrZSB0aGUgZ2VuZXJhdGVk
IG1hY2hpbmUgY29kZSBzaG9ydGVyLgoKSG0sIGJ1dCB0bGJfY2xrX2VuYWJsZWQgaXMgbWFya2Vk
IGFzIHJlYWRfbW9zdGx5LCB3aGljaCB3b24ndCBiZSB0cnVlCnRoZW4sIGFuZCB3b3VsZCBsaWtl
bHkgaGF2ZSBhIHBlcmZvcm1hbmNlIGltcGFjdC4KCj4gT09JIHdoeSBpc24ndCB0bGJfY2xrX2Vu
YWJsZWQgc2V0IHRvIGZhbHNlIHdoZW4gWGVuIGRldGVybWluZXMgdG8gdXNlIEwwCj4gYXNzaXN0
ZWQgZmx1c2g/CgpMMCBhc3Npc3RlZCBmbHVzaCBjYW4gZmFpbCAoaWU6IHJldHVybiBhbiBlcnJv
ciksIGFuZCBpbiB0aGF0IGNhc2UgWGVuCndvdWxkIGJlIGJldHRlciB0byBjb250aW51ZSB1c2lu
ZyB0aGUgdGltZXN0YW1wZWQgdGxiLCBhcyBpdCBjb3VsZAphdm9pZCBzb21lIGZsdXNoZXMuCgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
