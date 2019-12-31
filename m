Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420B12D717
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 09:31:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imCse-000723-S1; Tue, 31 Dec 2019 08:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OMsX=2V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1imCsd-00071y-DA
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 08:27:55 +0000
X-Inumbo-ID: 6be8eeee-2ba7-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6be8eeee-2ba7-11ea-b6f1-bc764e2007e4;
 Tue, 31 Dec 2019 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577780866;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=hZEa+S28RUl9h2CkLK2Kzfn+mGzkVSMrkL1PPRllMK4=;
 b=YQ14xeVP8lkFs5gdxkJYK0ZY1Jtfzdp5q1pdRV5BCFxDvSudVULIaD9E
 bp8KviRCv7pVsUk5zkfvIkdNjm9myRjwe7u6g/AawLt4ajqpuJRy4adbh
 /LjgybunMg27xfplFwhsT+jyZgE9+3Nox3bWd6s1mN8YqsWu6yvQJzL9X o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1zK+NDUMe2wi2C14QARq7omVfpSnAUBQQrawa/s5IjmePiioLRd5Xu60ilogYKtqIn32Zc+1Z9
 py3hDYj6qSdpWOi8DHrn/bD9oSodBUFHNfUlA35EdiS2SdWpeSRQRVj6xit0z98LyE+rDd7f75
 prJ7WA2acG3z52BCs/6IMJekWTRwGvCOLezgRhw+xOQyFBoESSTEKeaZJmRJk6SB1F/Y0MOEQ9
 Z6d/2K/ByOFNdleTJeWpeDC+HGVFBDRh6JF3Fo/bCLsY4gmlAKUXbQ3VeU2mEzZDav5BrwTNrr
 MhU=
X-SBRS: 2.7
X-MesageID: 10738341
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,378,1571716800"; d="scan'208";a="10738341"
To: Aaron Janse <aaron@ajanse.me>, <xen-devel@lists.xenproject.org>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
Date: Tue, 31 Dec 2019 08:27:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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

T24gMzEvMTIvMjAxOSAwNzo1MiwgQWFyb24gSmFuc2Ugd3JvdGU6Cj4gSGVsbG8gYWxsLAo+Cj4g
QWZ0ZXIgYXR0ZW1wdGluZyB0byBpbnN0YWxsIFF1YmVzT1Mgb24gYSBuZXcgbGFwdG9wLCBJJ3Zl
IHN0dW1ibGVkIHVwb24KPiBhIGdyb3VwIG9mIHBlb3BsZSB3aXRoIGFuIGFzc29ydG1lbnQgb2Yg
bGFwdG9wcyBidXQgYWxsIHRoZSBzYW1lCj4gcHJvYmxlbTogYSBYZW4gcGFuaWMgc3RhdGluZyAi
SU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29yayEiCj4KPiBNYW55IG9mIHVzIGFyZSBvbiBkaWZm
ZXJlbnQgc3RhZ2VzIG9mIGRlYnVnZ2luZyB0aGlzLCBzbyBJJ2xsIGNpdGUgYWxsCj4gb3VyIGVm
Zm9ydHMgaGVyZS4KPgoKPHNuaXA+Cgo+ICMgRXhjZXJwdHMgZnJvbSBib290IGxvZ3MKPgo+IFF1
YmVzIG9uIG15IFhQUyA3MzkwIDEzIgo+Cj4gICAgIChYRU4pIC4uVElNRVI6IHZlY3Rvcj0weEYw
IGFwaWMxPTAgcGluMT0yIGFwaWMyPS0xIHBpbjI9LTEKPiAgICAgKFhFTikgLi5NUC1CSU9TIGJ1
ZzogODI1NCB0aW1lciBub3QgY29ubmVjdGVkIHRvIElPLUFQSUMKPiAgICAgKFhFTikgLi4udHJ5
aW5nIHRvIHNldCB1cCB0aW1lciAoSVJRMCkgdGhyb3VnaCA4MjU5QSAsLCwKPiAgICAgKFhFTikg
Li4udHJ5aW5nIHRvIHNldCB1cCB0aW1lciBhcyBWaXJ0dWFsIFdpcmUgSVJRLi4uIGZhaWxlZC4K
PiAgICAgKFhFTikgLi4udHJ5aW5nIHRvIHNldCB1cCB0aW1lciBhcyBFeHRJTlQgSVJRLi4uc3B1
cmlvdXMgODI1OUEgaW50ZXJydXB0OiBJUlE3Lgo+ICAgICAoWEVOKSBDUFUwOiBubyBpcnEgaGFu
ZGxlciBmb3IgdmVjdG9yIGU3IChJUlEgLTgpCj4gICAgIChYRU4pIElSUTcgYT0wMDAxWzAwMDEs
MDAwMF0gdj02MFtmZmZmZmZmZl0gdD1JTy1BUElDLWVkZ2Ugcz0wMDAwMDAwMgo+ICAgICAoWEVO
KSAgZmFpbGVkIDooLgo+ICAgICAoWEVOKQo+ICAgICAoWEVOKSAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKPiAgICAgKFhFTikgUGFuaWMgb24gQ1BVIDA6Cj4gICAgIChY
RU4pIElPLUFQSUMgKyB0aW1lciBkb2Vzbid0IHdvcmshIEJvb3Qgd2l0aCBhcGljX3ZlcmJvc2l0
eT1kZWJ1ZyBhbmQgc2VuZCBhIHJlcG9ydC4gIFRoZW4gdHJ5IGJvb3Rpbmcgd2l0aCB0aGUgJ25v
YXBpYycgb3B0aW9uCj4gICAgIChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgoKSXMgdGhlcmUgYW55IGZ1bGwgYm9vdCBsb2cgaW4gdGhlIGJhZCBjYXNlP8KgIERl
YnVnZ2luZyB2aWEgZGl2aW5hdGlvbgppc24ndCBhbiBlZmZlY3RpdmUgd2F5IHRvIGdldCB0aGlu
Z3MgZG9uZS4KCihJcnJlc3BlY3RpdmUsIEknbSBwcmV0dHkgc3VyZSB0aGlzIGlzIGEgR3J1YjIr
RUZJIGlzc3VlIGZhaWxpbmcgdG8gcGFzcwp0aGUgQUNQSSB0YWJsZXMgdG8gWGVuLCBhbmQgdGhp
cyBldmVudHVhbCBwYW5pYyBpcyBqdXN0IGNhc2NhZGUgZmFsbG91dC4pCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
