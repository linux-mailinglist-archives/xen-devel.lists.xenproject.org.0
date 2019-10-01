Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB758C394C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:40:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKDB-0000bS-46; Tue, 01 Oct 2019 15:37:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFKD9-0000bL-SN
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:37:11 +0000
X-Inumbo-ID: 552dd472-e461-11e9-9703-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 552dd472-e461-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569944230;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7iUp9m4AdOFjzpdnoPomDyK4KpxuASBt+7VSN8sZ7o0=;
 b=DlsNOw5fzdDhbaHxgm6ZnMhF4wzPH9TZzL8TCED+mDOeGdq5JpdU2X75
 Zo1myLCvidl5P640d0pevgXl0CbplhssNY/y9wiR9nYjOWyWLKzHrK4sS
 DXZtk+IuGS46w+sZ6l7wn0VqglVHg3c8Vh5M+KE2BzkSfcQtanptLVzYK w=;
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
IronPort-SDR: YZeUneov8tmgTPGhCXhPn3+JSQoIfNGKGVJ+X9MMUSQlwnZhIAk7RRq9APNxrVkaEgqI+PqAN2
 weYnNXB+28kAKUolj973twi3buM3Iz7knqC9G9dLGgAVxzyN89iIZRCdq/7mgDPZBq02INJSZO
 Teq3OvZWVmbX2XIUQ21/h1r1Noa5Y8xewIijQGf0TmGojt9YinxWqKbt1mHbvZl9Y1w98fL1+O
 bullXEK2RGuJgrpQ4GgZRgRVjiy7PQ4BMvxYmYhJki718KIMYb+I/pCwoRLLjlmA6//YPDsMrD
 hu0=
X-SBRS: 2.7
X-MesageID: 6610061
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6610061"
To: Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
 <d73687de-df73-2131-f8ca-4061dc6f0a24@citrix.com>
 <4410be2a-7061-e71d-0578-ebc48e506d7a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d7734a40-4ed7-6618-057f-c03e6ba074ff@citrix.com>
Date: Tue, 1 Oct 2019 16:37:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4410be2a-7061-e71d-0578-ebc48e506d7a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen
 Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxNTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTAuMjAxOSAx
NDo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMTAvMjAxOSAxMzoyMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAzMC4wOS4yMDE5IDIwOjI0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFRoZSBjb2RlIGdlbmVyYXRpb24gZm9yIGJhcnJpZXJfbm9zcGVjX3RydWUoKSBpcyBu
b3QgY29ycmVjdC4gIFdlIGFyZSB0YWtpbmcgYQo+Pj4+IHBlcmYgaXQgZnJvbSB0aGUgYWRkZWQg
ZmVuY2VzLCBidXQgbm90IGdhaW5pbmcgYW55IHNwZWN1bGF0aXZlIHNhZmV0eS4KPj4+IFlvdSB3
YW50IHRvIGJlIG1vcmUgc3BlY2lmaWMgaGVyZSwgSSB0aGluazogSVNUUiB5b3Ugc2F5aW5nIHRo
YXQgdGhlIExGRU5DRXMKPj4+IGdldCBpbnNlcnRlZCBhdCB0aGUgd3JvbmcgcGxhY2UuCj4+IENv
cnJlY3QuCj4+Cj4+PiAgSUlSQyB3ZSB3YW50IHRoZW0gb24gZWl0aGVyIHNpZGUgb2YgYQo+Pj4g
Y29uZGl0aW9uYWwgYnJhbmNoLCBpLmUuIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBhIGJyYW5jaCBp
bnNuIGFzIHdlbGwgYXMgcmlnaHQKPj4+IGF0IHRoZSBicmFuY2ggdGFyZ2V0Lgo+PiBTcGVjaWZp
Y2FsbHksIHRoZXkgbXVzdCBiZSBhdCB0aGUgaGVhZCBvZiBib3RoIGJhc2ljIGJsb2NrcyBmb2xs
b3dpbmcKPj4gdGhlIGNvbmRpdGlvbmFsIGp1bXAuCj4+Cj4+PiBJJ3ZlIHRha2VuLCBhcyBhIHNp
bXBsZSBleGFtcGxlLAo+Pj4gcDJtX21lbV9hY2Nlc3Nfc2FuaXR5X2NoZWNrKCksIGFuZCB0aGlz
IGxvb2tzIHRvIGJlIHRoZSB3YXkgZ2NjOSBoYXMgZ2VuZXJhdGVkCj4+PiBjb2RlIChpbiBhIG5v
bi1kZWJ1ZyBidWlsZCkuIEhlbmNlIGVpdGhlciBJJ20gbWlzLXJlbWVtYmVyaW5nIHdoYXQgd2Ug
d2FudAo+Pj4gdGhpbmdzIHRvIGxvb2sgbGlrZSwgb3IgdGhlcmUncyBtb3JlIHRvIGl0IHRoYW4g
Y29kZSBnZW5lcmF0aW9uIHNpbXBseSBiZWluZwo+Pj4gIm5vdCBjb3JyZWN0Ii4KPj4gVGhpcyBl
eGFtcGxlIGRlbW9uc3RyYXRlcyB0aGUgcHJvYmxlbSwgYW5kIGFjdHVhbGx5IHRocm93cyBhIGZ1
cnRoZXIKPj4gc3Bhbm5lciBpbiB0aGUgd29ya3Mgb2YgaG93IG1ha2UgdGhpcyBzYWZlLCB3aGlj
aCBoYWRuJ3Qgb2NjdXJyZWQgdG8gbWUKPj4gYmVmb3JlLgo+Pgo+PiBUaGUgaW5zdHJ1Y3Rpb24g
c3RyZWFtIGZyb20gYSBjYWxsZXIgb2YgcDJtX21lbV9hY2Nlc3Nfc2FuaXR5X2NoZWNrKCkKPj4g
d2lsbCBsb29rIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Cj4+IGNhbGwgcDJtX21lbV9hY2Nlc3Nf
c2FuaXR5X2NoZWNrCj4+IMKgwqDCoCAuLi4KPj4gwqDCoMKgIGxmZW5jZQo+PiDCoMKgwqAgLi4u
Cj4+IMKgwqDCoCByZXTCoMKgwqAKPj4gY21wICQwLCAlZWF4Cj4+IGpuZSAuLi4KPj4KPj4gV2hp
Y2ggaXMgdW5zYWZlLCBiZWNhdXNlIHRoZSBvbmx5IHNhZmUgd2F5IHRvIGFycmFuZ2UgdGhpcyBj
b2RlIHdvdWxkIGJlOgo+Pgo+PiBjYWxsIHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjawo+PiDC
oMKgwqAgLi4uCj4+IMKgwqDCoCByZXQKPj4gY21wICQwLCAlZWF4Cj4+IGpuZSAxZgo+PiBsZmVu
Y2UKPj4gLi4uCj4+IDE6IGxmZW5jZQo+PiAuLi4KPj4KPj4gVGhlcmUgaXMgYWJzb2x1dGVseSBu
byBwb3NzaWJsZSB3YXkgZm9yIGlubGluZSBhc3NlbWJseSB0byBiZSB1c2VkIHRvCj4+IHByb3Bh
Z2F0ZSB0aGlzIHNhZmV0eSBwcm9wZXJ0eSBhY3Jvc3MgdHJhbnNsYXRpb24gdW5pdHMuwqAgVGhp
cyBpcyBnb2luZwo+PiB0byBoYXZlIHRvIGJlIGFuIGF0dHJpYnV0ZSBvZiBzb21lIGZvcm0gb3Ig
YW5vdGhlciBoYW5kbGVkIGJ5IHRoZSBjb21waWxlci4KPiBCdXQgeW91IHJlYWxpemUgdGhhdCB0
aGlzIHBhcnRpY3VsYXIgZXhhbXBsZSBpcyBiYXNpY2FsbHkgYSBtb3JlCj4gY29tcGxleCBpc19Y
WVooKSBjaGVjaywgd2hpY2ggY291bGQgYmUgZGVhbHQgd2l0aCBieSBpbmxpbmluZyB0aGUKPiBm
dW5jdGlvbi4gT2YgY291cnNlIHRoZXJlIGFyZSBnb2luZyB0byBiZSBsYXJnZXIgZnVuY3Rpb25z
IHdoZXJlCj4gdGhlIHJlc3VsdCB3YW50cyB0byBiZSBndWFyZGVkIGxpa2UgeW91IHNheS4gQnV0
IGp1c3QgbGlrZSB0aGUKPiBhZGRpdGlvbiBvZiB0aGUgbm9zcGVjIG1hY3JvcyB0byB2YXJpb3Vz
IGlzX1hZWigpIGZ1bmN0aW9ucyBpcyBhCj4gbWFudWFsIG9wZXJhdGlvbiAoYXMgbG9uZyB0aGUg
Y29tcGlsZXIgZG9lc24ndCBoZWxwKSwgaXQgd291bGQgaW4KPiB0aGF0IGNhc2UgYmUgYSBtYXR0
ZXIgb2YgbGF0Y2hpbmcgdGhlIHJldHVybiB2YWx1ZSBpbnRvIGEgbG9jYWwKPiB2YXJpYWJsZSBh
bmQgdXNpbmcgYW4gYXBwcm9wcmlhdGUgZ3VhcmRpbmcgY29uc3RydWN0IHdoZW4KPiBldmFsdWF0
aW5nIGl0LgoKQW5kIHRoaXMgcmVhc29uaW5nIGRlbW9uc3RyYXRlcyB5ZXQgYW5vdGhlciBwcm9i
bGVtICh0aGlzIG9uZSB3YXMgcmFpc2VkCmF0IHRoZSBtZWV0aW5nIGluIENoaWNhZ28pLgoKZXZh
bHVhdGVfbm9zcGVjKCkgaXMgbm90IGEgdXNlZnVsIGNvbnN0cnVjdCBpZiBpdCBuZWVkcyBpbnNl
cnRpbmcgYXQKZXZlcnkgaGlnaGVyIGxldmVsIHByZWRpY2F0ZSB0byByZXN1bHQgaW4gc2FmZSBj
b2RlLsKgIFRoaXMgaXMKYm9hcmRlcmxpbmUtaW1wb3NzaWJsZSB0byByZXZpZXcgZm9yLCBhbmQg
ZXh0cmVtZWx5IGVhc3kgdG8gYnJlYWsKYWNjaWRlbnRhbGx5LgoKPgo+IFNvIEknbSBhZnJhaWQg
Zm9yIG5vdyBJIHN0aWxsIGNhbid0IGFncmVlIHdpdGggeW91ciAibm90IGNvcnJlY3QiCj4gYXNz
ZXNzbWVudCAtIHRoZSBnZW5lcmF0ZWQgY29kZSBpbiB0aGUgZXhhbXBsZSBsb29rcyBjb3JyZWN0
IHRvCj4gbWUsIGFuZCBpZiBmdXJ0aGVyIGd1YXJkaW5nIHdhcyBuZWVkZWQgaW4gdXNlcnMgb2Yg
dGhpcyBwYXJ0aWN1bGFyCj4gZnVuY3Rpb24sIGl0IHdvdWxkIGJlIHRob3NlIHVzZXJzIHdoaWNo
IHdvdWxkIG5lZWQgZnVydGhlcgo+IG1hc3NhZ2luZy4KClNhZmV0eSBhZ2FpbnN0IHNwZWN0cmUg
djEgaXMgbm90IGEgbWF0dGVyIG9mIG9waW5pb24uCgpUbyBwcm90ZWN0IGFnYWluc3Qgc3BlY3Vs
YXRpdmVseSBleGVjdXRpbmcgdGhlIHdyb25nIGJhc2ljIGJsb2NrLCB0aGUKcGlwZWxpbmUgbXVz
dCBleGVjdXRlIHRoZSBjb25kaXRpb25hbCBqdW1wIGZpcnN0LCAqdGhlbiogaGl0IGFuIGxmZW5j
ZQp0byBzZXJpYWxpc2UgdGhlIGluc3RydWN0aW9uIHN0cmVhbSBhbmQgcmV2ZWN0b3IgaW4gdGhl
IGNhc2Ugb2YKaW5jb3JyZWN0IHNwZWN1bGF0aW9uLgoKVGhlIG90aGVyIHdheSBhcm91bmQgaXMg
bm90IHNhZmUuwqAgU2VyaWFsaXNpbmcgdGhlIGluc3RydWN0aW9uIHN0cmVhbQpkb2Vzbid0IGRv
IGFueXRoaW5nIHRvIHByb3RlY3QgYWdhaW5zdCB0aGUgYXR0YWNrZXIgdGFraW5nIGNvbnRyb2wg
b2YgYQpsYXRlciBicmFuY2guCgpUaGUgYmlnZ2VyIHByb2JsZW0gaXMgdG8gZG8gd2l0aCBjbGFz
c2lmeWluZyB3aGF0IHdlIGFyZSBwcm90ZWN0aW5nCmFnYWluc3QuwqAgSW4gdGhlIGNhc2Ugb2Yg
aXNfY29udHJvbF9kb21haW4oKSwgaXQgaXMgYW55IGFjdGlvbiBiYXNlZCBvbgp0aGUgcmVzdWx0
IG9mIHRoZSBkZWNpc2lvbi7CoCBGb3IgaXNfe3B2LGh2bX1fZG9tYWluKCksIGlzIG9ubHkgKHRv
IGEKZmlyc3QgYXBwcm94aW1hdGlvbikgc3BlY3VsYXRpdmUgdHlwZSBjb25mdXNpb24gaW50byB0
aGUgcHYvaHZtIHVuaW9ucwood2hpY2ggaW4gcHJhY3RpY2UgZXh0ZW5kcyB0byBjYWxsaW5nIHB2
Xy9odm1fIGZ1bmN0aW9ucyBhcyB3ZWxsKS4KCkFzIGZvciB0aGUgcmVhbCBjb25jcmV0ZSBicmVh
a2FnZXMuwqAgSW4gYSBzdGFnaW5nIGJ1aWxkIHdpdGggR0NDIDYKCiQgb2JqZHVtcCAtZCB4ZW4t
c3ltcyB8IGdyZXAgJzxpc19odm1fZG9tYWluPjonIHwgd2MgLWwKMTgKJCBvYmpkdW1wIC1kIHhl
bi1zeW1zIHwgZ3JlcCAnPGlzX3B2X2RvbWFpbj46JyB8IHdjIC1sCjkKCkFsbCBvZiB3aGljaCBo
YXZlIHRoZSBsZmVuY2UgdG9vIGVhcmx5IHRvIHByb3RlY3QgYWdhaW5zdCBzcGVjdWxhdGl2ZQp0
eXBlIGNvbmZ1c2lvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
