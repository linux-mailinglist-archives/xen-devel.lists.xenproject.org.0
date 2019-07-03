Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E85E201
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicOt-0006dW-0B; Wed, 03 Jul 2019 10:22:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hicOq-0006dR-Sr
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:22:04 +0000
X-Inumbo-ID: 665147d1-9d7c-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 665147d1-9d7c-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 10:22:03 +0000 (UTC)
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
IronPort-SDR: TrTaSt3uZ1un644y/2kVhvSo1/dyvfeJHZTOyPpMmlD9xxUZ5TKxKm7M5Zn3e5e+iWhYTaXD26
 ca4fTh4sjEBqkaYSA1fKw28Af0LUAP1l44TYgY4Yo+MXh9Fl6TyL5aS57KbpVThIeGIhZpnZl8
 EEPHDVy4FpEtmVBfFWGHV4P87nlkGWo1jKy6pj7QFZJXwbT33cxUwaoQbDOHTw8p6UTmJ3BqgU
 dwxu4OlYSeWJvSQC221KuzkWCLmfCxuL7itJru7rdsT59EdnxAILWORMl4R/1vTflRfrWMVMrO
 15s=
X-SBRS: 2.7
X-MesageID: 2534133
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2534133"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
 <5D074BA30200007800238B6C@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <eb44801a-1081-858d-4853-6dc574e0c6d6@citrix.com>
Date: Wed, 3 Jul 2019 11:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D074BA30200007800238B6C@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/traps: widen condition for
 logging top-of-stack
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
Cc: WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDYvMjAxOSAwOToxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRGVzcGl0ZSAtZm5vLW9t
aXQtZnJhbWUtcG9pbnRlciB0aGUgY29tcGlsZXIgbWF5IG9taXQgdGhlIGZyYW1lIHBvaW50ZXIs
Cj4gb2Z0ZW4gZm9yIHJlbGF0aXZlbHkgc2ltcGxlIGxlYWYgZnVuY3Rpb25zLgoKQWN0dWFsbHks
IHRoZSBwcm9ibGVtIGlzIG1vcmUgd2lkZXNwcmVhZCB0aGFuIHRoaXMuwqAgRm9yIGV2ZXJ5IGZ1
bmN0aW9uLAp0aGVyZSBpcyBhIG5vbi16ZXJvIHF1YW50aXR5IG9mIHRpbWUgYmV0d2VlbiB0aGUg
ZnVuY3Rpb24gc3RhcnRpbmcgYW5kCnRoZSBmcmFtZSBwb2ludGVyIGJlaW5nIHNldCB1cC4KCkhv
d2V2ZXIsIGhhbGYgb2YgdGhpcyB0aW1lIGlzIHNwZW50IHdpdGggdGhlIG9sZCAlcmJwIG9uIHRo
ZSB0b3Agb2YgdGhlCnN0YWNrLCBzbyB3b24ndCBiZW5lZml0IGZyb20gdGhlc2UgY2hhbmdlcy4K
Cj4gKFRvIGdpdmUgYSBzcGVjaWZpYyBleGFtcGxlLAo+IHRoZSBjYXNlIEkndmUgcnVuIGludG8g
dGhpcyB3aXRoIGlzIF9wY2lfaGlkZV9kZXZpY2UoKSBhbmQgZ2NjIDguCj4gSW50ZXJlc3Rpbmds
eSB0aGUgZXZlbiBtb3JlIHNpbXBsZSBuZWlnaGJvcmluZyBpb21tdV9oYXNfZmVhdHVyZSgpIGRv
ZXMKPiBnZXQgYSBmcmFtZSBwb2ludGVyIHNldCB1cCwgYXJvdW5kIGp1c3QgYSBzaW5nbGUgaW5z
dHJ1Y3Rpb24uIEJ1dCB0aGlzCj4gbWF5IGJlIGEgcmVzdWx0IG9mIHRoZSBzaXplLW9mLWFzbSgp
IGVmZmVjdHMgZGlzY3Vzc2VkIGVsc2V3aGVyZS4pCj4KPiBMb2cgdGhlIHRvcC1vZi1zdGFjayB2
YWx1ZSBpZiBpdCBsb29rcyB2YWxpZCBfb3JfIGlmIFJJUCBsb29rcyBpbnZhbGlkLgoKVGhpcyBm
YXIsIEknbSBoYXBweSB3aXRoLgoKPiBBbHNvIGFubm90YXRlIG5vbi1mcmFtZS1wb2ludGVyLWJh
c2VkIHN0YWNrIHRyYWNlIGVudHJpZXMgd2l0aCBhCj4gcXVlc3Rpb24gbWFyaywgdG8gc2lnbmFs
IGNsZWFybHkgdGhhdCBhbnkgb25lIG9mIHRoZW0gbWF5IG5vdCBhY3R1YWxseQo+IGJlIHBhcnQg
b2YgdGhlIGNhbGwgc3RhY2suCgpJJ20gc3RpbGwgb3Bwb3NlZCB0byB0aGlzLsKgIFRoZSBpbnRy
b2R1Y3Rpb24gb2YgPyBkb2VzIG1vcmUgaGFybSB0aGFuCmdvb2QgSU1PLCBiZWNhdXNlIGl0IHNp
bXBseSBjYW4ndCBiZSB0cnVzdGVkLgoKU3RhY2sgdHJhY2VzIGFyZSBub3QgZ3VhcmFudGVlZC1h
Y2N1cmF0ZSwgZXZlbiB3aXRoIGZyYW1lIHBvaW50ZXJzCmVuYWJsZWQuwqAgVGhlIG9ubHkgdGhp
bmcgd2UgY2FuIHNheSBmb3IgY2VydGFpbiBpbiBhbnkgdHJhY2UgaXMgd2hlcmUKJXJpcCBwb2lu
dHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
