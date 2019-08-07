Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5984DF0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 15:53:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMKf-0006MZ-PI; Wed, 07 Aug 2019 13:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvMKe-0006MU-IM
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 13:50:24 +0000
X-Inumbo-ID: 4be79dac-b91a-11e9-a5d4-4f81a4c85277
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4be79dac-b91a-11e9-a5d4-4f81a4c85277;
 Wed, 07 Aug 2019 13:50:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LA360PoLk+g1zaHr/tyelouXOYBmrtecon/j0M79I1DhvI9mJp4IUn0MvAKRdPloQYP356uc36
 RCzmmqq53+UbMPjYmdGxZm8R0jkNsYW2B/mxA9MOMAGXahmBgPfewEGwn97Le5+yPBLDXo17s7
 yuysBBoYImsIzNltBuueYTahEmjRa5X/zb+0BKf+QPKvNx+hGSFQuL9cJOURrGDJnVbDXvCUiw
 scktKIFriAgsU+D1sgi6qilc95a7HTkBiIklmnXfcbqXMlmBHcKO00t+tRFc3vXHaxmD4xJmQO
 2TM=
X-SBRS: 2.7
X-MesageID: 4018009
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4018009"
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20190807132657.GA2852@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7a4d826a-99b3-9ab3-7820-4aa58be0df8c@citrix.com>
Date: Wed, 7 Aug 2019 14:50:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807132657.GA2852@mail-itl>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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

T24gMDcvMDgvMjAxOSAxNDoyNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IEhpLAo+Cj4gWGVuIDQuMTIgY3Jhc2hlcyB3aGVuIGJvb3Rpbmcgb24gVUVGSSAod2l0aCBtdWx0
aWJvb3QyKSB1bmxlc3MgSSBkaXNhYmxlCj4gcnVudGltZSBzZXJ2aWNlcy4gVGhlIGNyYXNoIGhh
cHBlbnMgc2hvcnRseSBhZnRlciBzdGFydGluZyBkb20wIGtlcm5lbC4KPiBVbmZvcnR1bmF0ZWx5
IEkgZG9uJ3QgaGF2ZSBzZXJpYWwgY29uc29sZSB0aGVyZSwgc28gdGhlIG9ubHkgbG9nIEkgaGF2
ZQo+IGlzIGEgcGhvdG8gb2YgVkdBIGNvbnNvbGUgKGF0dGFjaGVkKS4gQmVsb3cgSSByZXR5cGUg
cGFydCBvZiB0aGUgbWVzc2FnZToKPgo+IChYRU4pIC0tLS1bIFhlbi00LjEyLjAtMy5mYzI5ICB4
ODZfNjQgIGRlYnVnPW4gICBOb3QgdGFpbnRlZCBdLS0tLQo+IChYRU4pIENQVTogICAgMAo+IChY
RU4pIFJJUDogICAgZTAwODpbPDAwMDAwMDAwMDAwMDAwZjY+XSAwMDAwMDAwMDAwMDAwMGY2Cj4g
KFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMjg3ICAgQ09OVEVYVDogaHlwZXJ2aXNvciAoZDB2
MCkKPiAuLi4KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToKPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAw
MDAwZjY+XSAwMDAwMDAwMDAwMDAwMGY2Cj4gKFhFTikgICAgWzxmZmZmODJkMDgwMjZjNmFkPl0g
Zmx1c2h0bGIuYyNwcmVfZmx1c2grMHgzZC8weDgwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAg
ICAgIF0gZWZpX3J1bnRpbWVfY2FsbCsweDQ5My8weGJkMAo+IChYRU4pICAgIFsgICAgICAgICAg
ICAgICAgICBdIGVmaV9ydW50aW1lX2NhbGwrMHg0NDEvMHhiZDAKPiAoWEVOKSAgICBbICAgICAg
ICAgICAgICAgICAgXSB2Y3B1X3Jlc3RvcmVfZnB1X25vbmxhenkrMHhlNy8weDE4MAo+IChYRU4p
ICAgIFsgICAgICAgICAgICAgICAgICBdIGRvX3BsYXRmb3JtX29wKzAvMHgxODgwCj4gKFhFTikg
ICAgWyAgICAgICAgICAgICAgICAgIF0gZG9fcGxhdGZvcm1fb3ArMHhiOWMvMHgxODgwCj4gKFhF
TikgICAgWyAgICAgICAgICAgICAgICAgIF0gZG9fcGxhdGZvcm1fb3ArMHhiOWMvMHgxODgwCj4g
KFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gc2NoZWRfY3JlZGl0Mi5jI2NzY2hlZDJfc2No
ZWR1bGUrMHhjZDAvMHgxM2EwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJf
ZW50ZXIrMHhhZS8weDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGRvX3BsYXRm
b3JtX29wKzAvMHgxODgwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gcHZfaHlwZXJj
YWxsKzB4MTUyLzB4MjIwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50
ZXIrMHhhZS8weDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVy
KzB4YTIvMHgxMjAKPiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisw
eGFlLzB4MTIwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50ZXIrMHhh
Mi8weDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVyKzB4YWUv
MHgxMjAKPiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisweGEyLzB4
MTIwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50ZXIrMHhhZS8weDEy
MAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVyKzB4YTIvMHgxMjAK
PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisweGFlLzB4MTIwCj4g
KFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50ZXIrMHhhMi8weDEyMAo+IChY
RU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVyKzB4YWUvMHgxMjAKPiAoWEVO
KSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisweDEwYy8weDEyMAo+IChYRU4p
Cj4gKFhFTikKPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kgo+IChYRU4pIFBhbmljIG9uIENQVSAwOgo+IChYRU4pIEZBVEFMIFRSQVA6IHZlY3RvciA9IDAg
KGRpdmlkZSBlcnJvcikKPiAoWEVOKSBbZXJyb3JfY29kZT0wMDAwXQo+IChYRU4pICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4KPiBBbnkgaWRlYT8KClZlcnkgd2Vp
cmQuCgpZb3UgZ290IGEgI0RFIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIHVuZGVyICVyaXAgaXMg
YGRpdiAlYmhgLCBidXQKanVkZ2luZyBmcm9tIHRoZSBwaG90bywgdGhhdCBwYWdlIGlzIHBvaXNv
bmVkIGFueXdheS4KClRoZSBjaGFuY2VzIGFyZSB0aGF0IHNvbWV0aGluZyBqdW1wZWQgdG8gMCBh
bmQgaGFzIGV4ZWN1dGVkIGl0IHRoaXMgZmFyCnRocm91Z2ggdGhlIHBvaXNvbmVkIHBhZ2UgYmVm
b3JlIGFjdHVhbGx5IGZhdWx0aW5nLgoKQ2FuIHlvdSBkaXNhc3NlbWJsZSBwcmVfZmx1c2goKSA/
wqAgSSBkb24ndCBzZWUgYW55dGhpbmcgaW50ZXJlc3RpbmcgYXQKdGhlIEMgbGV2ZWwuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
