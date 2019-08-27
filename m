Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287889E60E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 12:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2YyG-0006zp-Bc; Tue, 27 Aug 2019 10:45:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssFz=WX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2YyE-0006zg-Ce
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 10:45:02 +0000
X-Inumbo-ID: b86be148-c8b7-11e9-951b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b86be148-c8b7-11e9-951b-bc764e2007e4;
 Tue, 27 Aug 2019 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566902702;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hCMyGruw79DAMj+3THwsLWnxVZ5ETJyYOHpHeugs/BU=;
 b=A0flrYR2/iD56W2gBliaikcBhxZqnPZf685GXWgdAqtu+Bc+3BJBXOAn
 p8lRhut+Imlj31Z+D5mETxOr4yXy+ww9iPKQQiJX47TZzUDwM6fjGpOQ1
 EHyW1RBQSrLADiWcZoNAZpm6wyYOi5L0qyOaOcora/HrgMv3Pzb2Z4YuF o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y3gghKbOq5e7qAFVMYaFZ2hZXdph8/3MKwv2eHCoVdxVsMNNv4MN3XFpEb8Jx4zfhlInwnYDf4
 ENN5A3pfxehZyjgF+//r3w1cmywKi2lyf0y5hxafOgwn6ve2gbWCevVu1zStkeusMHUdUnKhfw
 Ia6uMuN/9xpEhQ78tFbdYuZMCNCyKeFQpCLvvjHC25Dxs2Nl9CZYo05M8pv6qEF92HU9KoWDjQ
 yhZQUoGZUHejt0JoYOryL3vFoc7xY77QZlch/+FP4B5OkVPpBkGjbc5+P+KgGzeJj82d8VUrr9
 hSA=
X-SBRS: 2.7
X-MesageID: 4766237
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,436,1559534400"; 
   d="scan'208";a="4766237"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3f30c73d-94a7-f9ca-5914-0400f1f98cc3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fc5f0b03-2e69-8fa9-289f-50e8abb57210@citrix.com>
Date: Tue, 27 Aug 2019 11:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3f30c73d-94a7-f9ca-5914-0400f1f98cc3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/6] x86emul: generalize wbinvd() hook
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
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMDcvMjAxOSAxMjo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGhvb2sgaXMgYWxy
ZWFkeSBpbiB1c2UgZm9yIG90aGVyIHB1cnBvc2VzLCBhbmQgZW11bGF0aW5nIGUuZy4KPiBDTEZM
VVNIIGJ5IGlzc3VpbmcgV0JJTlZEIGlzLCB3ZWxsLCBub3QgdmVyeSBuaWNlLiBSZW5hbWUgdGhl
IGhvb2sgYW5kCj4gYWRkIHBhcmFtZXRlcnMuIFVzZSBsaWdodGVyIHdlaWdodCBmbHVzaGluZyBp
bnNucyB3aGVuIHBvc3NpYmxlIGluCj4gaHZtZW11bF9jYWNoZV9vcCgpLgo+Cj4gaHZtZW11bF9j
YWNoZV9vcCgpIHRyZWF0aW5nIHg4NmVtdWxfaW52ZCB0aGUgc2FtZSBhcyB4ODZlbXVsX3diaW52
ZCBpcwo+IHRvIHJldGFpbiBvcmlnaW5hbCBiZWhhdmlvciwgYnV0IEknbSBub3Qgc3VyZSB0aGlz
IGlzIHdoYXQgd2Ugd2FudCBpbgo+IHRoZSBsb25nIHJ1bi4KClRoZXJlIGlzIG5vIHVzZSBmb3Ig
SU5WRCBpbiBhIFZNLCBhcyBpdCBpcyBuZXZlciBydW5uaW5nIHdpdGggdGhlIG1lbW9yeQpjb250
cm9sbGVycyB5ZXQtdG8tYmUgY29uZmlndXJlZC7CoCBUaGUgb25seSBwbGFjZSBpdCBtYXkgYmUg
Zm91bmQgaXMgYXQKdGhlIHJlc2V0IHZlY3RvciBmb3IgYSBmaXJtd2FyZSB3aGljaCBkb2Vzbid0
IHN0YXJ0IGluIGEKdmlydHVhbGlzYXRpb24tYXdhcmUgd2F5LgoKR2l2ZW4gaG93IGJpZyBhIGhh
bW1lciBXQklOVkQgaXMsIEkgcmVja29uIHdlIHNob3VsZCBqdXN0IG5vcCBpdCBvdXQuCgo+Cj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+IC0tLQo+IHYy
OiBVc2UgY2FjaGVfb3AoKSBhcyBob29rIG5hbWUuIENvbnZlcnQgbWFjcm9zIHRvIGlubGluZSBm
dW5jdGlvbnMgaW4KPiAgICAgIHN5c3RlbS5oLiBSZS1iYXNlLgo+IC0tLQo+IEkgd2FzIHVuc3Vy
ZSBhYm91dCBQUkVGRVRDSCogYW5kIENMREVNT1RFIC0gYm90aCBhcmUgY2FjaGUgbWFuYWdlbWVu
dAo+IGluc25zIHRvbywgYnV0IHRoZSBlbXVsYXRvciBjdXJyZW50bHkgdHJlYXRzIHRoZW0gYXMg
YSBOT1Agd2l0aG91dAo+IGludm9raW5nIGFueSBob29rcy4KClRoZXkgYXJlIGp1c3QgaGludHMu
wqAgTm90aGluZyBhcmNoaXRlY3R1cmFsbHkgbWF5IGRlcGVuZCBvbiB0aGVtIGhhdmluZwphbnkg
ZWZmZWN0LsKgIENMREVNT1RFIGluIHBhcnRpY3VsYXIgaXMgZm9yIHJlZHVjaW5nIGNhY2hlIGNv
aGVyZW5jeQpvdmVyaGVhZCBvbiBhIHByb2R1Y2VyL2NvbnN1bWVyIHNldHVwLCBidXQgYW55IHBv
dGVudGlhbCBvcHRpbWlzYXRpb24gaXMKZHdhcmZlZCBieSB0aGUgVk1FeGl0LgoKPiBJIHdhcyBh
bHNvIHVuY2VydGFpbiBhYm91dCB0aGUgbmV3IGNhY2hlX2ZsdXNoX3Blcm1pdHRlZCgpIGluc3Rh
bmNlIC0KPiBnZW5lcmFsbHkgSSB0aGluayBpdCB3b3VsZG4ndCBiZSB0b28gYmFkIGlmIHdlIGFs
bG93ZWQgbGluZSBmbHVzaGVzIGluCj4gYWxsIGNhc2VzLCBpbiB3aGljaCBjYXNlIHRoZSBjaGVj
a3MgaW4gdGhlIC0+d2JpbnZkX2ludGVyY2VwdCgpIGhhbmRsZXJzCj4gd291bGQgc3VmZmljZSAo
YXMgdGhleSBkaWQgdW50aWwgbm93KS4KClRoaXMgaXMgYSBtb3JlIGdlbmVyYWwgaXNzdWUgd2hp
Y2ggd2UgbmVlZCB0byBhZGRyZXNzLsKgIFRvIHN1cHBvcnQKZW5jcnlwdGVkIG1lbW9yeSBpbiBW
TSdzLCB3ZSBtdXN0IGd1YXJhbnRlZSB0aGF0IFdDIG1hcHBpbmdzIHdoaWNoIHRoZQpndWVzdCBj
cmVhdGVzIGFyZSByZWFsbHkgV0MsIHdoaWNoIG1lYW5zIHdlIG11c3Qgbm90IHVzZSBJUEFUIG9y
IHBsYXkKYW55ICJmYWxsIGJhY2sgdG8gV0IiIGdhbWVzLgoKRnVydGhlcm1vcmUsIEFNRCdzIGVu
Y3J5cHQtaW4tcGxhY2UgYWxnb3JpdGhtIHJlcXVpcmVzIHRoZSBndWVzdCB0byBiZQphYmxlIHRv
IHVzZSBXQklOVkQuCgpGaXhpbmcgdGhpcyBwcm9wZXJseSB3aWxsIGJlIGEgZ29vZCB0aGluZywg
YW5kIHdpbGwgZml4IHRoZSBmYWN0IHRoYXQgYXQKdGhlIG1vbWVudCwgYW55IHRpbWUgeW91IGdp
dmUgYSBQQ0kgZGV2aWNlIHRvIGEgZ3Vlc3QsIGl0cyBibGsvbmV0IHBlcmYKYmVjb21lcyBnbGFj
aWFsLCBkdWUgdG8gaGF2aW5nIHRoZSBncmFudCB0YWJsZSBiZWluZyB1bmNhY2hlZC4KCj4gKwo+
ICsgICAgICAgIGlmICggaHZtZW11bF9jdHh0LT5zZWdfcmVnW3g4Nl9zZWdfc3NdLmRwbCA9PSAz
ICkKPiArICAgICAgICAgICAgcGZlYyB8PSBQRkVDX3VzZXJfbW9kZTsKCkFzIGEgbm90ZSwgdGhp
cyBpcyBmaW5lIGhlcmUsIGJ1dCB0aGlzIHdob2xlIHN5c3RlbSBvZiBjaG9vc2luZyBwZmVjCm5l
ZWRzIHRvIGJlIGFkanVzdGVkIHdoZW4gd2UgYWRkIHN1cHBvcnQgZm9yIFdSVVNTLCB3aGljaCBp
cyBhIENQTDAKaW5zdHJ1Y3Rpb24gdGhhdCBleGVjdXRlZCBhcyBhIHVzZXIgbW9kZSB3cml0ZSwg
Zm9yIGFkanVzdGluZyB0aGUgdXNlcgpzaGFkb3cgc3RhY2suCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
