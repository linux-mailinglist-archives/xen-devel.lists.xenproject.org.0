Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4449E5C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 12:38:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBT1-0004hn-3p; Tue, 18 Jun 2019 10:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Le+r=UR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdBT0-0004hi-6M
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 10:35:54 +0000
X-Inumbo-ID: d77c061a-91b4-11e9-9607-5f721f9216ce
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d77c061a-91b4-11e9-9607-5f721f9216ce;
 Tue, 18 Jun 2019 10:35:51 +0000 (UTC)
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
IronPort-SDR: eIVh9Pox7KtD0UGPmTEIaHWMhU166RSZwypPM3cNsoKevj7r1htgMeAE8YF0HoMkZIUvfvZc5w
 erxxCIQWwNTc6UNsYvi966HjCBJgARApxbHzJC4iSGocI4zoAv6CxKJehbvleXTTquRAoqaVe3
 QmD9T9dbDcIiDpqfmqS18YeSINGAawDgdpLHO7JtjQia6znR83nkYQIlIbo5w/XW3pJ1B3ltIZ
 8qgnel+70xmPAz6LJXC5X71r0MOk+d8mF0di5xgz7g2BP5Ptrg2ZjLUQh81efhhto/41OnnQAi
 8L8=
X-SBRS: 2.7
X-MesageID: 1863235
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,388,1557201600"; 
   d="scan'208";a="1863235"
To: Jan Beulich <JBeulich@suse.com>
References: <1560800999-11592-1-git-send-email-andrew.cooper3@citrix.com>
 <5D08BE0B0200007800239323@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7c3041a1-bd4b-5140-4ce7-471fc81a94a6@citrix.com>
Date: Tue, 18 Jun 2019 11:35:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D08BE0B0200007800239323@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/clear_page: Update clear_page_sse2()
 after dropping 32bit Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDYvMjAxOSAxMTozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTcuMDYuMTkg
YXQgMjE6NDksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhpcyBjb2Rl
IHdhcyBuZXZlciB1cGRhdGVkIHdoZW4gdGhlIDMyYml0IGJ1aWxkIG9mIFhlbiB3YXMgZHJvcHBl
ZC4KPj4KPj4gICogRXhwYW5kIHRoZSBub3ctcmVkdW5kYW50IHB0cl9yZWcgbWFjcm8uCj4+ICAq
IFRoZSBudW1iZXIgb2YgaXRlcmF0aW9ucyBpbiB0aGUgbG9vcCBjYW4gYmUgaGFsZmVkIGJ5IHVz
aW5nIDY0Yml0IHdyaXRlcywKPj4gICAgd2l0aG91dCBjb25zdW1pbmcgYW55IGV4dHJhIGV4ZWN1
dGlvbiByZXNvdXJjZSBpbiB0aGUgcGlwZWxpbmUuICBBZGp1c3QgYWxsCj4+ICAgIG51bWJlcnMv
b2Zmc2V0cyBhcHByb3ByaWF0ZWx5Lgo+PiAgKiBSZXBsYWNlIGRlYyB3aXRoIHN1YiB0byBhdm9p
ZCBhIGVmbGFncyBzdGFsbCwgYW5kIHBvc2l0aW9uIGl0IHRvIGJlCj4+ICAgIG1hY3JvLWZ1c2Vk
IHdpdGggdGhlIHJlbGF0ZWQgam1wLgo+PiAgKiBXaXRoIG5vIG5lZWQgdG8gcHJlc2VydmUgZWZs
YWdzIGFjcm9zcyB0aGUgYm9keSBvZiB0aGUgbG9vcCwgcmVwbGFjZSBsZWEKPj4gICAgd2l0aCBh
ZGQgd2hpY2ggaGFzIDEvMydyZCB0aGUgbGF0ZW5jeSBvbiBiYXNpY2FsbHkgYWxsIDY0Yml0IGhh
cmR3YXJlLgo+Pgo+PiBBIHF1aWNrIHVzZXJzcGFjZSBwZXJmIHRlc3Qgb24gbXkgSGFzd2VsbCBk
ZXYgYm94IGluZGljYXRlcyB0aGF0IHRoZSBvbGQKPj4gdmVyc2lvbiB0YWtlcyB+MTM4NSBjeWNs
ZXMgb24gYXZlcmFnZSAoaWdub3Jpbmcgb3V0bGllcnMpLCBhbmQgdGhlIG5ldyB2ZXJzaW9uCj4+
IHRha2VzIH4xMDYwIGN5bGVzLCBvciBhYm91dCA3NyUgb2YgdGhlIHRpbWUuCj4+Cj4+IFJlcG9y
dGVkLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IEFzc3Vt
aW5nIHlvdSB3YW50IHRoaXMgdG8gZ28gaW4gZGVzcGl0ZSB5b3VyIFJFUCBTVE9TUSByZW1hcmsK
PiBsYXRlciBvbiwKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IHdpdGggb25lIHJlbWFyazoKPgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvY2xlYXJfcGFnZS5T
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jbGVhcl9wYWdlLlMKPj4gQEAgLTIsMTggKzIsMTYgQEAK
Pj4gIAo+PiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4+ICAKPj4gLSNkZWZpbmUgcHRyX3JlZyAl
cmRpCj4+IC0KPj4gIEVOVFJZKGNsZWFyX3BhZ2Vfc3NlMikKPj4gLSAgICAgICAgbW92ICAgICAk
UEFHRV9TSVpFLzE2LCAlZWN4Cj4+ICsgICAgICAgIG1vdiAgICAgJFBBR0VfU0laRS8zMiwgJWVj
eAo+PiAgICAgICAgICB4b3IgICAgICVlYXgsJWVheAo+PiAgCj4+IC0wOiAgICAgIGRlYyAgICAg
JWVjeAo+PiAtICAgICAgICBtb3ZudGkgICVlYXgsIChwdHJfcmVnKQo+PiAtICAgICAgICBtb3Zu
dGkgICVlYXgsIDQocHRyX3JlZykKPj4gLSAgICAgICAgbW92bnRpICAlZWF4LCA4KHB0cl9yZWcp
Cj4+IC0gICAgICAgIG1vdm50aSAgJWVheCwgMTIocHRyX3JlZykKPj4gLSAgICAgICAgbGVhICAg
ICAxNihwdHJfcmVnKSwgcHRyX3JlZwo+PiArMDogICAgICBtb3ZudGkgICVyYXgsICAwKCVyZGkp
Cj4gQ291bGQgSSB0YWxrIHlvdSBpbnRvIGxlYXZpbmcgb3V0IHRoaXMgMD8gUmF0aGVyIG9sZCBn
YXMgYWN0dWFsbHkgZW1pdHMKPiBhbiA4LWJpdCBkaXNwbGFjZW1lbnQgd2hlbiBpdCdzIHNwZWxs
ZWQgbGlrZSB0aGlzLgoKT2ggb2suwqAgSSdsbCBzdGlsbCBhbGlnbiB0aGUgKCVyZGkpIHRob3Vn
aCB0byBtYWtlIHRoZSBjb2x1bW4gZWFzaWVyIHRvCnJlYWQuCgpJJ2xsIHB1dCB0aGlzIGluIG5v
dywgYW5kIHNlZSBpZiBJIGNhbiBmaW5kIHNvbWUgdGltZSBiZWZvcmUgNC4xMyBzaGlwcwp0byBt
YWtlIHNvbWUgYWx0ZXJuYXRpdmVzLWJhc2VkIGJldHRlciBvcHRpb25zLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
