Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F9BD8B1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 09:03:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD1H3-00079v-GU; Wed, 25 Sep 2019 06:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD1H1-00079q-OF
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 06:59:39 +0000
X-Inumbo-ID: 09eb570e-df62-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 09eb570e-df62-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569394778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55e9+0CgOZ+C48CHGWgp68+9qzrDWwe7+RDKJ5m2sg0=;
 b=H5CVJGHybtvC/tLOCtV2ojZwWGWeGbBGqrx/NzEr/Nj9HDe7zvDrGgpD
 vUoOISImb4JEqsHf/NfKgiN1DpK0ljVievfYMQ0y+u6kE/l3bcmDhTE7A
 aLOIgrGGSbAnpfDrb951AkyEKR2Ugt6stscTerY+l5Mkhpw8iylbEsLZ6 U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T7zAr7tV282r9J2zCWG+3XLltu4Gu1nru8x63njVLpWeRL3PIglk2NkLU5Gf/qB/KZ0eajh9xx
 j0Ol3LpnmNJHW+PCltVIC3k0oleYxq/3nj7GF9Etr0sNJPxDt4byt5Rewcq+DX/n6Lx9fEKI2u
 2rnvNeNGGZVoOldmrsU3xIFgiO5FpTZ5WtFDE13xZ3wfWqeyONJ80OyzO870Zf0rK6raE6jHrm
 2XrxLtXDGDv1bD9t2y12nRD6A3pKkUad6ctz+jeqdpXx0ZrrIYIgw/cmbNjztutikn4lBYHgW+
 59A=
X-SBRS: 2.7
X-MesageID: 6366443
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6366443"
Date: Wed, 25 Sep 2019 08:59:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190925065926.olsfsyoun2wq3sxx@Air-de-Roger>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMTE6MjA6MDZBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBIaSEKPiAKPiBJJ20gYSBiaXQgYXQgYSBsb3NzIG9mIHdoYXQncyBoYXBwZW5p
bmcgaGVyZSwgYnV0IGl0IHNlZW1zIHRoYXQKPiB0aGUgbGF0ZXN0IFhlbiBmcm9tIG1hc3RlciBm
YWlscyB0byBib290IG9uIEhQIFByb0xpYW50IERMMjAKPiBHRU4xMCBzZXJ2ZXIgKHNhbWUgWGVu
IGJvb3RzIGZpbmUgb24gZXZlcnkgb3RoZXIgcGllY2Ugb2YKPiBoYXJkd2FyZSBpbiBteSBsYWIp
Lgo+IAo+IFRoZXJlIGFyZSBhYnNvbHV0ZWx5IG5vIHNpZ25zIG9mIHdoYXQncyBnb2luZyB3cm9u
ZyB3aXRoIGl0Lgo+IEl0IGp1c3Qgc3RvcHMgYXQKPiAKPiAoWEVOKSBIVk06IEFTSURzIGVuYWJs
ZWQuCj4gKFhFTikgSFZNOiBWTVggZW5hYmxlZAo+IChYRU4pIEhWTTogSGFyZHdhcmUgQXNzaXN0
ZWQgUGFnaW5nIChIQVApIGRldGVjdGVkCj4gKFhFTikgSFZNOiBIQVAgcGFnZSBzaXplczogNGti
LCAyTUIsIDFHQgo+IC4uLgo+IChYRU4pIEFkZGluZyBjcHUgMSB0byBydW5xdWV1ZSAwCj4gKFhF
TikgbXdhaXQtaWRsZTogbWF4IEMtc3RhdGUgY291bnQgb2YgOCByZWFjaGVkCj4gKFhFTikgQWRk
aW5nIGNwdSAyIHRvIHJ1bnF1ZXVlIDAKPiAoWEVOKSBtd2FpdC1pZGxlOiBtYXggQy1zdGF0ZSBj
b3VudCBvZiA4IHJlYWNoZWQKPiAKPiBJIGd1ZXNzIHRoZSBvbmx5IGNsdWUgaXMgdGhhdCB5b3Vy
IHR5cGljYWwgbGluZSBvZjoKPiAKPiAoWEVOKSBCcm91Z2h0IHVwIFggQ1BVcwo+IAo+IG5ldmVy
IGdldHMgcHJpbnRlZCAtLSBzbyBwZXJoYXBzIHRoZXJlJ3Mgc29tZXRoaW5nIHdvbmt5Cj4gZ29p
bmcgb24gd2l0aCBDUFUgaW5pdGlhbGl6YXRpb24uCj4gCj4gQW55IGFkdmljZSBvbiBob3cgdG8g
ZGlhZ25vc2UgdGhpcyBmdXJ0aGVyIHdpbGwgYmUgZ3JlYXRseSBhcHByZWNpYXRlZC4KCkNhbiB5
b3UgYXBwbHkgdGhlIGRlYnVnIHBhdGNoIGJlbG93IGFuZCB0cnkgYWdhaW4/ICh5b3Ugc2hvdWxk
IGdldAptb3JlIHZlcmJvc2Ugb3V0cHV0KQoKQSBiaXNlY3Rpb24gd291bGQgYWxzbyBiZSBoZWxw
ZnVsIGluIG9yZGVyIHRvIGlkZW50aWZ5IHRoZSBjb21taXQgdGhhdApicm9rZSBib290aW5nIG9u
IHRoaXMgaGFyZHdhcmUsIGlmIG9sZGVyIHZlcnNpb25zIG9mIFhlbiBkbyBib290IGZpbmUuCgpU
aGFua3MsIFJvZ2VyLgotLS04PC0tLQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9h
cGljLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2FwaWMuaAppbmRleCA0NzU5Mjc5ZWIyLi5iMzNm
Y2UxOThiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FwaWMuaAorKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2FwaWMuaApAQCAtNSw3ICs1LDcgQEAKICNpbmNsdWRlIDxhc20vZml4
bWFwLmg+CiAjaW5jbHVkZSA8YXNtL21zci5oPgogCi0jZGVmaW5lIERwcmludGsoeC4uLikgZG8g
e30gd2hpbGUgKDApCisjZGVmaW5lIERwcmludGsgcHJpbnRrCiAKIC8qCiAgKiBEZWJ1Z2dpbmcg
bWFjcm9zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
