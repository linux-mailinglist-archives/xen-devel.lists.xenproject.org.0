Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F45E807
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 17:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hihMC-0001vw-Up; Wed, 03 Jul 2019 15:39:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hihMB-0001vr-QA
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 15:39:39 +0000
X-Inumbo-ID: c3359004-9da8-11e9-abb1-a7c92a5f7b95
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3359004-9da8-11e9-abb1-a7c92a5f7b95;
 Wed, 03 Jul 2019 15:39:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wOBaryHsArl9/uQCQpRqgoSzDAYDXODNKDSifotw388CuQdcEAVd/1EAXu8UxGcGTStZ91HaF4
 hy2ML29QPPLnHwwbLi58RekzOe9on+D4ZCj6kfVsYkfSGVxQ590bbzbYftd7qUUrU5i/FAU1cD
 hpMHl6gW4qeurViF2GG6r9l3S6Bq1P8ZmHe2buDMy3skm6XgILobh9wu51JPyThm+3dSVRqlLc
 Lv2CwVcBPmoGEFARikLDxA43o+Cbv9XA6qbajyonTYQyNq449BrI6H8jsXsJ81QydvaHL1+uhP
 WEc=
X-SBRS: 2.7
X-MesageID: 2550188
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2550188"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE90950200007800230069@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2527ed0d-8372-faa3-a620-b98a57d2cf84@citrix.com>
Date: Wed, 3 Jul 2019 16:39:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5CDE90950200007800230069@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 01/15] x86/IRQ: deal with
 move-in-progress state in fixup_irqs()
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDUvMjAxOSAxMTo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGZsYWcgYmVpbmcg
c2V0IG1heSBwcmV2ZW50IGFmZmluaXR5IGNoYW5nZXMsIGFzIHRoZXNlIG9mdGVuIGltcGx5Cj4g
YXNzaWdubWVudCBvZiBhIG5ldyB2ZWN0b3IuIFdoZW4gdGhlcmUncyBubyBwb3NzaWJsZSBkZXN0
aW5hdGlvbiBsZWZ0Cj4gZm9yIHRoZSBJUlEsIHRoZSBjbGVhcmluZyBvZiB0aGUgZmxhZyBuZWVk
cyB0byBoYXBwZW4gcmlnaHQgZnJvbQo+IGZpeHVwX2lycXMoKS4KPgo+IEFkZGl0aW9uYWxseSBf
YXNzaWduX2lycV92ZWN0b3IoKSBuZWVkcyB0byBhdm9pZCBzZXR0aW5nIHRoZSBmbGFnIHdoZW4K
PiB0aGVyZSdzIG5vIG9ubGluZSBDUFUgbGVmdCBpbiB3aGF0IGdldHMgcHV0IGludG8gLT5hcmNo
Lm9sZF9jcHVfbWFzay4KPiBUaGUgb2xkIHZlY3RvciBjYW4gYmUgcmVsZWFzZWQgcmlnaHQgYXdh
eSBpbiB0aGlzIGNhc2UuCgpUaGlzIHN1Z2dlc3RzIHRoYXQgaXQgaXMgYSBidWdmaXgsIGJ1dCBp
dCBpc24ndCBjbGVhciB3aGF0IGhhcHBlbnMgd2hlbgp0aGluZ3MgZ28gd3JvbmcuCgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0yNDE4
LDE1ICsyNDYyLDE4IEBAIHZvaWQgZml4dXBfaXJxcyhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGIK
PiAgICAgICAgICBpZiAoIGRlc2MtPmhhbmRsZXItPmVuYWJsZSApCj4gICAgICAgICAgICAgIGRl
c2MtPmhhbmRsZXItPmVuYWJsZShkZXNjKTsKPiAgCj4gKyAgICAgICAgY3B1bWFza19jb3B5KCZh
ZmZpbml0eSwgZGVzYy0+YWZmaW5pdHkpOwo+ICsKPiAgICAgICAgICBzcGluX3VubG9jaygmZGVz
Yy0+bG9jayk7Cj4gIAo+ICAgICAgICAgIGlmICggIXZlcmJvc2UgKQo+ICAgICAgICAgICAgICBj
b250aW51ZTsKPiAgCj4gLSAgICAgICAgaWYgKCBicmVha19hZmZpbml0eSAmJiBzZXRfYWZmaW5p
dHkgKQo+IC0gICAgICAgICAgICBwcmludGsoIkJyb2tlIGFmZmluaXR5IGZvciBpcnEgJWlcbiIs
IGlycSk7Cj4gLSAgICAgICAgZWxzZSBpZiAoICFzZXRfYWZmaW5pdHkgKQo+IC0gICAgICAgICAg
ICBwcmludGsoIkNhbm5vdCBzZXQgYWZmaW5pdHkgZm9yIGlycSAlaVxuIiwgaXJxKTsKPiArICAg
ICAgICBpZiAoICFzZXRfYWZmaW5pdHkgKQo+ICsgICAgICAgICAgICBwcmludGsoIkNhbm5vdCBz
ZXQgYWZmaW5pdHkgZm9yIElSUSV1XG4iLCBpcnEpOwo+ICsgICAgICAgIGVsc2UgaWYgKCBicmVh
a19hZmZpbml0eSApCj4gKyAgICAgICAgICAgIHByaW50aygiQnJva2UgYWZmaW5pdHkgZm9yIElS
USV1LCBuZXc6ICUqcGJcbiIsCj4gKyAgICAgICAgICAgICAgICAgICBpcnEsIG5yX2NwdV9pZHMs
ICZhZmZpbml0eSk7CgpXaGlsZSBJIGNlcnRhaW5seSBwcmVmZXIgdGhpcyB2ZXJzaW9uLCBJIHNo
b3VsZCBwb2ludCBvdXQgdGhhdCB5b3UKcmVmdXNlZCB0byBhY2NlcHQgbXkgcGF0Y2hlcyBsaWtl
IHRoaXMsIGFuZCBmb3IgY29uc2lzdGVuY3kgd2l0aCB0aGUKcmVzdCBvZiB0aGUgY29kZWJhc2Us
IHlvdSBzaG91bGQgYmUgdXNpbmcgY3B1bWFza19iaXRzKCkuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
