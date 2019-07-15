Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20B690D5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:25:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1sA-00043o-1p; Mon, 15 Jul 2019 14:22:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hn1s9-00043j-3k
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:22:33 +0000
X-Inumbo-ID: f9fa6706-a70b-11e9-ad04-d757c95c78b3
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9fa6706-a70b-11e9-ad04-d757c95c78b3;
 Mon, 15 Jul 2019 14:22:29 +0000 (UTC)
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
IronPort-SDR: nK6+7CdJfEoOiHqIs9y7BgRfUJZlUvIW43sikK7wr1a5dTYohuRJS2gWJjPE51FFhIg/VhWuEu
 K2MN6+OOssKUF4wL0kWmT3bP5XmtJ80bGEOww156vSgfs8NDWC4JCdArOgmgbRd+iz0Nu8LGx8
 NFOFCKtsjFzxSSICYbYXn1C03CMu/589/fkeeiobciMqM5AUT+PdoA24b/aNtotF+r5pxWZuRS
 AATblliq6trbTPXtWlqQnbbtQEGYicyAzIRByJ28cEvWnVeuCgYN7ILtOHCm01AvdHLgXovcun
 Id0=
X-SBRS: 2.7
X-MesageID: 3001940
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3001940"
Date: Mon, 15 Jul 2019 16:22:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190715142219.m2t67v2dcyabqp2p@MacBook-Air-de-Roger.local>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-10-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704144233.27968-10-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDM6NDI6MDdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQUNQSSBUaW1lciBkb2VzIG5vdCB3b3JrIGluIGEgUFZIIGd1ZXN0LCBidXQgbG9j
YWwgQVBJQyB3b3JrcyBvbiBib3RoCgpUaGlzIGlzIG5vdCBhY2N1cmF0ZS4gSXQncyBub3QgdGhh
dCB0aGUgQUNQSSB0aW1lciBkb2Vzbid0IHdvcmssIGl0J3MKanVzdCB0aGF0IGl0J3Mgbm90IHBy
ZXNlbnQuIFRoZSBQTV9UTVJfQkxLIHNob3VsZCBiZSBzZXQgdG8gMCB0bwppbmRpY2F0ZSB0aGUg
bGFjayBvZiBQTSB0aW1lciBzdXBwb3J0LCBvciBlbHNlIHRoZXJlJ3Mgc29tZXRoaW5nCmJyb2tl
bi4KCj4gUFZIIGFuZCBIVk0uCj4gCj4gTm90ZSB0aGF0IHRoZSB1c2Ugb2YgU2VjUGVpRHhlVGlt
ZXJMaWJDcHUgbWlnaHQgYmUgYW4gaXNzdWUgd2l0aCBhCj4gZHJpdmVyIG9mIHR5cGUgRFhFX1JV
TlRJTUVfRFJJVkVSLiBJJ3ZlIGF0dGVtcHRkZSB0byBmaW5kIG91dCB3aGljaCBvZgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGF0dGVtcHRlZAo+IHRoZSBEWEVf
UlVOVElNRV9EUklWRVIgdXNlcyB0aGUgVGltZXJMaWIgYXQgcnVudGltZS4gSSd2ZSBkb25lIHRo
YXQgYnkKPiByZXBsYWNpbmcgdGhlIFRpbWVyTGliIGV2YWx1YXRpb24gaW4KPiBbTGlicmFyeUNs
YXNzZXMuY29tbW9uLkRYRV9SVU5USU1FX0RSSVZFUl0gYnkgYSBkaWZmZXJlbnQgb25lIGFuZAo+
IGNoZWNrIGV2ZXJ5IG1vZHVsZSB0aGF0IHVzZXMgaXQgKHdpdGggdGhlIC0tcmVwb3J0LWZpbGU9
cmVwb3J0IGJ1aWxkCiAgXiBjaGVja2luZwo+IG9wdGlvbikuCj4gCj4gUmVzZXRTeXN0ZW1SdW50
aW1lRHhlIGlzIGNhbGxpbmcgdGhlIFRpbWVyTGliIEFQSSBhdCBydW50aW1lIHRvIGRvIHRoZQo+
IG9wZXJhdGlvbiAiRWZpUmVzZXRDb2xkIiwgc28gdGhpcyBtYXkgbmV2ZXIgY29tcGxldGUgaWYg
dGhlIE9TIGhhdmUKPiBkaXNhYmxlZCB0aGUgTG9jYWwgQVBJQyBUaW1lci4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
