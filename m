Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3E1FB67
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 22:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR0Gb-0003Z5-U5; Wed, 15 May 2019 20:12:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hR0Ga-0003Z0-AZ
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 20:12:44 +0000
X-Inumbo-ID: cb4a134d-774d-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb4a134d-774d-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 20:12:42 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 5L2FbwpxsvT5WzQL0xPWBPOtBoFzKDEp9qyM6f3jNrKAbtBsEW8bzXjciVSyiZ2ZnQzpJuVFsT
 Q8/e/Z8zxQbFiiZvByOp/+c6Z9ljJetrOl600axNZtU3rkduII8fk94oyenWMhY3WLNUlacIMC
 dlabUxOcG05zhM05znlW8O7VnPVZ9KR6GWsCf0fE/WpTdblPkSAtdYQiG6L5vO3LStsatZPyQP
 yqNae8OFhUHkL0LBmqpuQ6nqxw6ewXFWvOPiSOLBoQ3M8wsWBTD+zxYuup+Q1yRKMFGarFHkEr
 fbQ=
X-SBRS: 2.7
X-MesageID: 492467
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,473,1549947600"; 
   d="scan'208";a="492467"
To: Julien Grall <julien.grall@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
References: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <85205f11-1d5c-1f6d-e987-c238a025658e@citrix.com>
Date: Wed, 15 May 2019 21:12:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] struct vcpu_guest_core_reg stable ABI?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDUvMjAxOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIGFsbCwKPgo+IEl0
IGxvb2tzIGxpa2UgdGhlIHN0cnVjdHVyZXMgdmNwdV9ndWVzdF9jb3JlX3JlZ3MgYW5kCj4gdmNw
dV9ndWVzdF9jb250ZXh0IGRvZXMgbm90IGNvcnJlY3RseSByZWZsZWN0IHRoZSBBQXJjaDY0IHN0
YXRlLiBGb3IKPiBpbnN0YW5jZSwgYWxsIEFybTY0IHN5c3RlbSByZWdpc3RlcnMgKGUuZyBzY3Rs
ciwgY3Bzciwgc3Bzcl9lbDEpCj4gc2hvdWxkIGJlIDY0LWJpdCB3aWRlIG5vdCAzMi1iaXQgd2lk
ZS4KPgo+IE9uIEFSTXY4LjAsIHNvbWUgb2YgdGhlIHJlZ2lzdGVycyBoYXZlIG9ubHkgdGhlIGxv
dyAzMi1iaXQgZGVmaW5lZCwKPiB0aGUgcmVzdCBpcyBSRVMwLiBSRVMwIG9ubHkgbWVhbnMgdGhl
eSBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UsIGl0Cj4gZG9lcyBub3QgbWVhbiB0aGV5IGNh
biBiZSBpZ25vcmVkLiBOZXdlciByZXZpc2lvbiAoc3VjaCBhcwo+IEFSTXY4LjAtU1NCUykgYWN0
dWFsbHkgYmVnYW4gdG8gZGVmaW5lIGJpdCBpbiB0aGUgdG9wIDMyLWJpdC4KPgo+IFRoaXMgbWVh
bnMgdGhhdCB0aGUgc3RydWN0dXJlcyB2Y3B1X2d1ZXN0X2NvcmVfcmVncyBhbmQKPiB2Y3B1X2d1
ZXN0X2NvbnRleHQgd291bGQgbm90IGJlIGFibGUgdG8gc3RvcmUgdGhlIHRvcCAzMi1iaXQgYW5k
Cj4gdGhlcmVmb3JlIG1pc3JlcHJlc2VudGluZyB0aGUgaGFyZHdhcmUuCj4KPiBGcm9tIG15IHVu
ZGVyc3RhbmRpbmcsIHZjcHVfZ3Vlc3RfY29udGV4dCBpcyBkZWZpbmVkIGJldHdlZW4gdGhlIHRv
b2xzCj4gYW5kIFhlbi4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gbW9kaWZ5IGl0IHdpdGhv
dXQgY2FyaW5nIG9uCj4gYmFja3dhcmQgY29tcGF0aWJseS4KPgo+IEhvd2VydmVyLCBzdHJ1Y3Qg
dmNwdV9ndWVzdF9jb3JlX3JlZyBzZWVtcyB0byBiZSBvdXRzaWRlIG9mIHRoZQo+ICNpZmRlZi4g
U28gSSBhc3N1bWUgaXQgaXMgcGFydCBvZiB0aGUgc3RhYmxlIEFCSS4gQW0gSSBjb3JyZWN0Pwo+
Cj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gaG93IHRoaXMgY291bGQgc2FmZWx5IGJlIGV4
dGVuZGVkPwoKU3R1ZmYgbGlrZSB0aGlzIHNob3VsZCBuZXZlciBoYXZlIGJlZW4gaW4gdGhlIHB1
YmxpYyBBUEkgdG8gYmVnaW4gd2l0aC7CoAp4ODYgaGFzIHNvbWUgbmFzdHkgaXNzdWVzIHdoaWNo
IEkgaGF2ZSB5ZXQgdG8gZmluZCBhIGdvb2QtZW5vdWdoIHdheSB0byBmaXguCgpGb3IgQVJNLCBh
bmQgZnV0dXJlIGFyY2hpdGVjdHVyZXMsIEknZCB1c2UgdGhlIGZhY3QgdGhhdCB0aGVyZSBhcmUg
bm8Kbm9uLXRvb2xzIGludGVyZmFjZXMgd2hpY2ggdXNlIHRoaXMgc3RydWN0dXJlIHRvIGFsbG93
IHlvdXJzZWxmIHRoZQp3aWdnbGVyb29tIHRvIGRlY2xhcmUgaGlzdG9yeSBhIG1pc3Rha2UsIGFu
ZCBmaXggaXQgYnkgbWFraW5nIGl0IHRvb2xzLW9ubHkuCgpObyBwb2ludCBsdW1iZXJpbmcgeW91
cnNlbGYgd2l0aCBhIGJyb2tlIHN0cnVjdHVyZSBpbiB0aGUgQVBJIGlmIHlvdSBjYW4KYXZvaWQg
aXQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
