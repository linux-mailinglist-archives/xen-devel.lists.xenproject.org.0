Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE1164536
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:21:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4PG6-0005Qu-3k; Wed, 19 Feb 2020 13:19:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4PG4-0005Qp-5Q
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:19:20 +0000
X-Inumbo-ID: 6f050550-531a-11ea-bc8e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f050550-531a-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582118359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D2yK+xbaExG4pSowmprbSNiwbgjZsOBGhnSrHiWwCt8=;
 b=FJdDwTTdDTZ1J2ZoH9GtE8+TA8vqT88QBw3ZiWEThQN4xCoJYwM2Bv/I
 V6Hb3mqRlmXpJwuymmLfoNdqbN1enjQY4uCE3D3zaeVS02PNyrI8Frnsl
 yREcPoBVlOgQRo2DRc7l0AM8BqPh0bjOrLEMqnHtJCjlXfQcH0F0oQ7Vm o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hQyRIok5g9atPzSMKFpH6CWkVIiFv8jVHWiWVfqyycRfkksbdq9vc02bRvGNbN/nLZfU1Ghm4L
 TWAd3CAK/2Wz3Iaft6khWp9terfLVaBCSArJfSsbvMqDEKD2S3YzvXK8t0EQiBtAbcDviIGz5l
 VWhx27mnERnGLKTh+vLvLYzwII5xm+xXwq4h25J1R5noAmqquUsCE/RnpYjoZ+KwcAqJZiskAj
 w90TXzvA+586v/opSOHC/uFWPpx+C3coEIxSQQ9kkQwIk+gNnpfC1YxHG4rJZEmsavk9iki6Aw
 8oo=
X-SBRS: 2.7
X-MesageID: 12863229
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="12863229"
Date: Wed, 19 Feb 2020 14:19:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200219131908.GA4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <d1ab3bc4-5b9e-25c7-130d-c64e91f7705c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1ab3bc4-5b9e-25c7-130d-c64e91f7705c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDE6NTY6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gIHZv
aWQgX19pbml0IHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5i
KQo+ID4gIHsKPiA+IC0gICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2Nr
KSApCj4gPiArICAgIGlmICggIXdyaXRlX3RyeWxvY2soJmNwdV9hZGRfcmVtb3ZlX2xvY2spICkK
PiA+ICAgICAgICAgIEJVRygpOyAvKiBTaG91bGQgbmV2ZXIgZmFpbCBhcyB3ZSBhcmUgY2FsbGVk
IG9ubHkgZHVyaW5nIGJvb3QuICovCj4gPiAgICAgIG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCZj
cHVfY2hhaW4sIG5iKTsKPiA+IC0gICAgc3Bpbl91bmxvY2soJmNwdV9hZGRfcmVtb3ZlX2xvY2sp
Owo+ID4gKyAgICB3cml0ZV91bmxvY2soJmNwdV9hZGRfcmVtb3ZlX2xvY2spOwo+ID4gIH0KPiAK
PiBTbyB3aHkgYSB3cml0ZSBsb2NrIGhlcmU/Cgpub3RpZmllcl9jaGFpbl9yZWdpc3RlciBjYWxs
cyBjYW5ub3QgYmUgbWFkZSBpbiBwYXJhbGxlbCwgYXMgdGhleQptb2RpZnkgdGhlIHVuZGVybHlp
bmcgbm90aWZpZXIgbGlzdCB3aXRob3V0IHRha2luZyBhbnkgYWRkaXRpb25hbApsb2Nrcy4KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
