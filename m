Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2460164E57
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 20:04:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4UbZ-0001qk-3m; Wed, 19 Feb 2020 19:01:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8+/=4H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j4UbX-0001q0-K8
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 19:01:51 +0000
X-Inumbo-ID: 4898ca34-534a-11ea-ade5-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4898ca34-534a-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582138911;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ivEuuwTcv/P7XlIxlizbbZfI3kkGxfqh2HyEgqKG01I=;
 b=Y5ETjMQXdagNeEopRzAesRAaQGEJlPGVzyFiruHCmjV5zk51lGuRv8dV
 ZgAJ6XcxSWWB3g5ddV3E6n+lGXmmQrcAvgYEdei11nrz4YF0NTlRDsDfv
 xgudyEx4o0rwKGs8tKSa5KvkbsW6E4rkdpWdurz3xlfwuldhdLRHk7izG 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xJj5jg/TEhkmTiiQobTPpFzaALuHa+2SHCV2w4qheHtcNMxolFk5EXWGWVl/5Lpwm/7uQ5852k
 ciz9RnZ3f9uqUZOBKepXThdFu5H67q/P+1+7l4hpwXkFHFuLSLfXu+panNt1rIQd5tHfLG2y3M
 Wrpz+9GZ5fnWr0PPNlSF8MPbVf9P5Wm33SIlFogJvi6f4A2ASWSHzgMrd2uOhI45TKpkqJbsfZ
 o8+vN9N7IyqdqjYtvrnI0rShQo+a0JGCSeaLuexdwYARTpbGRZDC76FaKazgubiVDjgIApGp69
 oTI=
X-SBRS: 2.7
X-MesageID: 12694823
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="12694823"
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20200210184549.28707-1-andrew.cooper3@citrix.com>
 <76a0538a-f4e5-65ba-4dc7-aa4fe5a4fe6f@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4e0bd8ce-5f51-ce1c-2429-348507a86edb@citrix.com>
Date: Wed, 19 Feb 2020 19:01:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <76a0538a-f4e5-65ba-4dc7-aa4fe5a4fe6f@xen.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/arm: Restrict access to most HVM_PARAM's
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDIvMjAyMCAxNTo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2h2bS5jIGIveGVuL2FyY2gvYXJtL2h2bS5jCj4+IGluZGV4IDc2YjI3Yzkx
NjguLjE0NDZkNDAxMGMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9odm0uYwo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vaHZtLmMKPj4gQEAgLTMxLDYgKzMxLDYwIEBACj4+IMKgIMKgICNpbmNs
dWRlIDxhc20vaHlwZXJjYWxsLmg+Cj4+IMKgICtzdGF0aWMgaW50IGh2bV9hbGxvd19zZXRfcGFy
YW0oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQKPj4gaW50IHBhcmFtKQo+PiArewo+
Cj4gU2hvdWxkIHdlIG1vdmUgdGhlIFhTTSBjaGVjayBoZXJlIHRvbz8gVGhpcyBpcyBub3QgdG9v
IGltcG9ydGFudCB0aG91Z2guCgpDdXJyZW50bHkgdGhlcmUgaXMgYSBzaW5nbGUgWFNNIGNhbGws
IGJlZm9yZSB0aGUgZ2V0L3NldCBzcGxpdC7CoCBNb3ZpbmcKaXQgaW4gaGVyZSB3b3VsZCBjcmVh
dGUgdHdvLgoKaS5lLiB0aGUgY3VycmVudCB3YXkgY29tcGlsZXMgc21hbGxlciBhbmQgd2lsbCBy
dW4gKGZyYWN0aW9uYWxseSkgZmFzdGVyLgoKPgo+PiArwqDCoMKgIHN3aXRjaCAoIHBhcmFtICkK
Pj4gK8KgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IFRoZSBmb2xsb3dpbmcgcGFyYW1ldGVycyBhcmUgaW50ZW5kZWQgZm9yIHRvb2xzdGFjayB1c2Fn
ZQo+PiBvbmx5Lgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFRoZXkgbWF5IG5vdCBiZSBzZXQgYnkg
dGhlIGRvbWFpbi4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKgo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IFRoZSB7U1RPUkUsQ09OU09MRX1fRVZUQ0hOIHZhbHVlcyB3aWxsIG5lZWQgdG8gYmVjb21lCj4+
IHJlYWQvd3JpdGUgaWYKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBhIG5ldyBBQkkgaGFzbid0IGFw
cGVhcmVkIGJ5IHRoZSB0aW1lIG1pZ3JhdGlvbiBzdXBwb3J0Cj4+IGlzIGFkZGVkLgo+Cj4gVGhl
IGNvbW1lbnQgc3VnZ2VzdHMge1NUT1JFLCBDT05TT0xFfV9FVlRDSE4gdmFsdWVzIHNob3VsZCBu
b3QgYmUKPiByZWFkL3dyaXRlLiBCdXQgeW91IGltcGxlbWVudCB0aGVtIGFzIHJlYWQvd3JpdGUu
IElzIGl0IGludGVuZGVkPwoKSXQgaXMgY3VycmVudGx5IHJlYWQvd3JpdGUgb25seSB0byAhU0VM
RiAoaS5lLiBvbmx5IHRoZSB0b29sc3RhY2sgb3IKcWVtdSBzdHViKS4KCklmIGl0IG5lZWRzIHRv
IGNoYW5nZSBpbiB0aGUgZnV0dXJlLCBpdCBuZWVkcyB0byBiZWNvbWUgYSBzZXBhcmF0ZSBibG9j
awppbiB0aGUgc3dpdGNoIHN0YXRlbWVudCB3aGljaCByZXR1cm5zIDAgc3RyYWlnaHQgYXdheS4K
CldvdWxkICJyZWFkL3dyaXRlIHRvIHRoZSBndWVzdCBpZiIgYmUgY2xlYXJlciBpbiB0aGUgY29t
bWVudD8KCj4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBjYXNlIEhWTV9QQVJB
TV9DQUxMQkFDS19JUlE6Cj4+ICvCoMKgwqAgY2FzZSBIVk1fUEFSQU1fU1RPUkVfUEZOOgo+PiAr
wqDCoMKgIGNhc2UgSFZNX1BBUkFNX1NUT1JFX0VWVENITjoKPj4gK8KgwqDCoCBjYXNlIEhWTV9Q
QVJBTV9DT05TT0xFX1BGTjoKPj4gK8KgwqDCoCBjYXNlIEhWTV9QQVJBTV9DT05TT0xFX0VWVENI
TjoKPj4gK8KgwqDCoCBjYXNlIEhWTV9QQVJBTV9QQUdJTkdfUklOR19QRk46Cj4+ICvCoMKgwqAg
Y2FzZSBIVk1fUEFSQU1fTU9OSVRPUl9SSU5HX1BGTjoKPj4gK8KgwqDCoCBjYXNlIEhWTV9QQVJB
TV9TSEFSSU5HX1JJTkdfUEZOOgo+Cj4gSSB3b3VsZCBkcm9wIEhWTV9QQVJBTV9QQUdJTkdfUklO
R19QRk4gYW5kIEhWTV9QQVJBTV9TSEFSSU5HX1JJTkdfUEZOCj4gYXMgdGhleSBhcmUgbm90IHVz
ZWQgYnkgQXJtIGFuZCBBRkFJQ1QgdGhlIHRvb2xzdGFjayB3aWxsIG5vdCBzZXQgdGhlbS4KCkV2
ZW4gYmV0dGVyLgoKPgo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGQgPT0gY3VycmVudC0+ZG9t
YWluID8gLUVQRVJNIDogMDsKPj4gKwo+Cj4gTG9va2luZyBhdCB0aGUgbGlzdCBvZiBIVk0gcGFy
YW0sIEkgdGhpbmsgeW91IGZvcmdvdCB0byBhZGQKPiBIVk1fUEFSQU1fVk1fR0VORVJBVElPTl9J
RF9BRERSLgoKSXQgaXMgYSB3aW5kb3dzIHNwZWNpZmljIHRoaW5nLsKgIFRoZSBzcGVjIGRhdGVz
IGZyb20gYSBwcmUtQVJNIHRpbWUsIGFuZAp3aGlsZSB0aGVyZSBpcyBub3RoaW5nIG9idmlvdXNs
eSB4ODYtb25seSwgaXQgZG9lcyBkZXBlbmQgb24gdGhlIEFNTAoodmlhIHRoZSBEU0RUIG9yIGFu
IFNTRFQpLgoKRWl0aGVyIHdheSwgaXRzIG9ubHkgcmVsZXZhbnQgZm9yIG1pZ3JhdGlvbiBhbmQv
b3IgcmV2ZXJ0LXRvLXNuYXBzaG90LApzbyBpcyBvZiBubyB1c2UgdG8gWGVuIG9uIEFSTSBhdCB0
aGlzIHBvaW50IGluIHRpbWUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
