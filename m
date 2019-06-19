Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D59C4BC3D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:03:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdc5O-0008S4-SA; Wed, 19 Jun 2019 15:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdc5N-0008Ry-SK
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:01:17 +0000
X-Inumbo-ID: 15403662-92a3-11e9-92c9-3b91fcc6e3d0
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15403662-92a3-11e9-92c9-3b91fcc6e3d0;
 Wed, 19 Jun 2019 15:01:15 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2ACCSKFnD0WWc68SRbaEMePg5HxjobdHeyBN590HbF+XhoyDjd1OS0IuwaShW3bp7RwgVFnXMz
 Qdv76Qgv6LudAKjHIO6UauXgPRGvQ0YCp7GXpDmgPmLs1L3dS6vC1T/Z7lroEAy9/YTW82CiCV
 /GGoPB4vxghP5ETK0qgo5IPEPrJWa0KAVjyPOEDK0h8FoMuVShEzmwIMXphyWWg+nzqIWckg7b
 1DPJxBwAPaEZa/duuU7OyiI2ZhkheaftotiOCCXpYOT4fet5haVnbBe+lCPjEJMFTOBAr3ewZ4
 8Io=
X-SBRS: 2.7
X-MesageID: 1949323
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1949323"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B86D9020000780021F2C1@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <90fef86b-68bb-8116-6be4-6778ffe0a366@citrix.com>
Date: Wed, 19 Jun 2019 16:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5C8B86D9020000780021F2C1@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 43/50] x86emul: support AVX512_VNNI insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDMvMjAxOSAxMTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEvdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgKPiArKysgYi90b29scy90ZXN0cy94ODZfZW11
bGF0b3IveDg2LWVtdWxhdGUuaAo+IEBAIC0xNDQsNiArMTQ0LDcgQEAgc3RhdGljIGlubGluZSBi
b29sIHhjcjBfbWFzayh1aW50NjRfdCBtYQo+ICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEydmwgIChj
cC5mZWF0LmF2eDUxMnZsICYmIHhjcjBfbWFzaygweGU2KSkKPiAgI2RlZmluZSBjcHVfaGFzX2F2
eDUxMl92Ym1pIChjcC5mZWF0LmF2eDUxMl92Ym1pICYmIHhjcjBfbWFzaygweGU2KSkKPiAgI2Rl
ZmluZSBjcHVfaGFzX2F2eDUxMl92Ym1pMiAoY3AuZmVhdC5hdng1MTJfdmJtaTIgJiYgeGNyMF9t
YXNrKDB4ZTYpKQo+ICsjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyX3ZubmkgKGNwLmZlYXQuYXZ4NTEy
X3ZubmkgJiYgeGNyMF9tYXNrKDB4ZTYpKQo+ICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyX2JpdGFs
ZyAoY3AuZmVhdC5hdng1MTJfYml0YWxnICYmIHhjcjBfbWFzaygweGU2KSkKPiAgI2RlZmluZSBj
cHVfaGFzX2F2eDUxMl92cG9wY250ZHEgKGNwLmZlYXQuYXZ4NTEyX3Zwb3BjbnRkcSAmJiB4Y3Iw
X21hc2soMHhlNikpCj4gICNkZWZpbmUgY3B1X2hhc19hdng1MTJfNHZubml3IChjcC5mZWF0LmF2
eDUxMl80dm5uaXcgJiYgeGNyMF9tYXNrKDB4ZTYpKQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZf
ZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4
Nl9lbXVsYXRlLmMKPiBAQCAtNDc5LDcgKzQ3OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXh0
MGYzOF90YWJsZSB7Cj4gICAgICBbMHg0ZF0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3NjYWxhcl92
ZXh3LCAuZDhzID0gZDhzX2RxIH0sCj4gICAgICBbMHg0ZV0gPSB7IC5zaW1kX3NpemUgPSBzaW1k
X3BhY2tlZF9mcCwgLnR3b19vcCA9IDEsIC5kOHMgPSBkOHNfdmwgfSwKPiAgICAgIFsweDRmXSA9
IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX3ZleHcsIC5kOHMgPSBkOHNfZHEgfSwKPiAtICAg
IFsweDUyIC4uLiAweDUzXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfMTI4LCAuZDhzID0gNCB9LAo+
ICsgICAgWzB4NTAgLi4uIDB4NTNdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAu
ZDhzID0gZDhzX3ZsIH0sCgpIYW5nIG9uIC0gaXMgdGhlIHByZXZpb3VzIHBhdGNoIGNvcnJlY3Q/
wqAgU2hvdWxkbid0IGl0IGhhdmUKc2ltZF9wYWNrZWRfaW50L2Q4c192bCBmcm9tIHRoZSBnZXRn
bz8KCj4gICAgICBbMHg1NCAuLi4gMHg1NV0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9p
bnQsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX3ZsIH0sCj4gICAgICBbMHg1OF0gPSB7IC5zaW1k
X3NpemUgPSBzaW1kX290aGVyLCAudHdvX29wID0gMSwgLmQ4cyA9IDIgfSwKPiAgICAgIFsweDU5
XSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfb3RoZXIsIC50d29fb3AgPSAxLCAuZDhzID0gMyB9LAo+
IEBAIC0xOTIyLDYgKzE5MjIsNyBAQCBzdGF0aWMgYm9vbCB2Y3B1X2hhcygKPiAgI2RlZmluZSB2
Y3B1X2hhc19hdng1MTJ2bCgpICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVCWCwgMzEsIGN0eHQs
IG9wcykKPiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfdmJtaSgpIHZjcHVfaGFzKCAgICAgICAg
IDcsIEVDWCwgIDEsIGN0eHQsIG9wcykKPiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfdmJtaTIo
KSB2Y3B1X2hhcyggICAgICAgIDcsIEVDWCwgIDYsIGN0eHQsIG9wcykKPiArI2RlZmluZSB2Y3B1
X2hhc19hdng1MTJfdm5uaSgpIHZjcHVfaGFzKCAgICAgICAgIDcsIEVDWCwgMTEsIGN0eHQsIG9w
cykKPiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfYml0YWxnKCkgdmNwdV9oYXMoICAgICAgIDcs
IEVDWCwgMTIsIGN0eHQsIG9wcykKPiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfdnBvcGNudGRx
KCkgdmNwdV9oYXMoICAgIDcsIEVDWCwgMTQsIGN0eHQsIG9wcykKPiAgI2RlZmluZSB2Y3B1X2hh
c19yZHBpZCgpICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVDWCwgMjIsIGN0eHQsIG9wcykK
PiBAQCAtMzIxMSw2ICszMjEyLDggQEAgeDg2X2RlY29kZSgKPiAgCj4gICAgICAgICAgICAgICAg
ICBzd2l0Y2ggKCBiICkKPiAgICAgICAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIC8q
IHZwNGRwd3NzZHssc30gbmVlZCBzcGVjaWFsIGNhc2luZyAqLwoKU3BlY2lhbCBjYXNlcyBzaG91
bGQgYmUgZGlzY3Vzc2VkLgoKfkFuZHJldwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
