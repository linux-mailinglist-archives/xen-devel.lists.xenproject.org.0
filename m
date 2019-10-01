Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B82AC34CF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 14:53:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFHcf-0000pS-Fe; Tue, 01 Oct 2019 12:51:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFHce-0000pL-55
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 12:51:20 +0000
X-Inumbo-ID: 29ac0ab0-e44a-11e9-8628-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 29ac0ab0-e44a-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569934279;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Hv6fDexgN5XCHkEJ+HcVRr5N+B9kLEPqkE4AIkxp0qY=;
 b=XP0oFdq8qwaBtSOFJ2riXOiQ7hCM6FMSkniOWm8hmqTjvdnwnOHw+Jzq
 QCyUOTj79wrHVSIF0967drbE1F3J55Cgkc79HsetYutNKUsJ4rdeE+pR3
 r5u10GyVsrYsKr/gLUeNBYfpR1CG9dnrNyCMw7XRdwlrbH5jTbjQ5N2dl I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YSnudxRoPLSpxzaPHbUpQSnX+PNCVng47cLB+z/p3PhIhgL8mJJapNAr7kxPdEPflSFefgyIHL
 gJ5QneEmxN36qYQHO6bGBaXMgBpBbMKonNOY8Pnw+wiCV+SfO1TK/NqN0Q+6IvML09wdH7AZ9E
 x37KwfRaA7DY9KtQMCO3ASpl38qpY4F+ga7hwYSDOk+4f31o/F5BY5EdXfZdhBx2OOQr33thfw
 gc8nD77uhY8/U+Kcr8ywVszvS9UUAeCUnfoudkY51HV0pb6+t/h+5WgQqtyG+BNT0NxavbseBB
 nlk=
X-SBRS: 2.7
X-MesageID: 6659360
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6659360"
To: Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d73687de-df73-2131-f8ca-4061dc6f0a24@citrix.com>
Date: Tue, 1 Oct 2019 13:51:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxMzoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDkuMjAxOSAy
MDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlIGNvZGUgZ2VuZXJhdGlvbiBmb3IgYmFy
cmllcl9ub3NwZWNfdHJ1ZSgpIGlzIG5vdCBjb3JyZWN0LiAgV2UgYXJlIHRha2luZyBhCj4+IHBl
cmYgaXQgZnJvbSB0aGUgYWRkZWQgZmVuY2VzLCBidXQgbm90IGdhaW5pbmcgYW55IHNwZWN1bGF0
aXZlIHNhZmV0eS4KPiBZb3Ugd2FudCB0byBiZSBtb3JlIHNwZWNpZmljIGhlcmUsIEkgdGhpbms6
IElTVFIgeW91IHNheWluZyB0aGF0IHRoZSBMRkVOQ0VzCj4gZ2V0IGluc2VydGVkIGF0IHRoZSB3
cm9uZyBwbGFjZS4KCkNvcnJlY3QuCgo+ICBJSVJDIHdlIHdhbnQgdGhlbSBvbiBlaXRoZXIgc2lk
ZSBvZiBhCj4gY29uZGl0aW9uYWwgYnJhbmNoLCBpLmUuIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBh
IGJyYW5jaCBpbnNuIGFzIHdlbGwgYXMgcmlnaHQKPiBhdCB0aGUgYnJhbmNoIHRhcmdldC4KClNw
ZWNpZmljYWxseSwgdGhleSBtdXN0IGJlIGF0IHRoZSBoZWFkIG9mIGJvdGggYmFzaWMgYmxvY2tz
IGZvbGxvd2luZwp0aGUgY29uZGl0aW9uYWwganVtcC4KCj4gSSd2ZSB0YWtlbiwgYXMgYSBzaW1w
bGUgZXhhbXBsZSwKPiBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2soKSwgYW5kIHRoaXMgbG9v
a3MgdG8gYmUgdGhlIHdheSBnY2M5IGhhcyBnZW5lcmF0ZWQKPiBjb2RlIChpbiBhIG5vbi1kZWJ1
ZyBidWlsZCkuIEhlbmNlIGVpdGhlciBJJ20gbWlzLXJlbWVtYmVyaW5nIHdoYXQgd2Ugd2FudAo+
IHRoaW5ncyB0byBsb29rIGxpa2UsIG9yIHRoZXJlJ3MgbW9yZSB0byBpdCB0aGFuIGNvZGUgZ2Vu
ZXJhdGlvbiBzaW1wbHkgYmVpbmcKPiAibm90IGNvcnJlY3QiLgoKVGhpcyBleGFtcGxlIGRlbW9u
c3RyYXRlcyB0aGUgcHJvYmxlbSwgYW5kIGFjdHVhbGx5IHRocm93cyBhIGZ1cnRoZXIKc3Bhbm5l
ciBpbiB0aGUgd29ya3Mgb2YgaG93IG1ha2UgdGhpcyBzYWZlLCB3aGljaCBoYWRuJ3Qgb2NjdXJy
ZWQgdG8gbWUKYmVmb3JlLgoKVGhlIGluc3RydWN0aW9uIHN0cmVhbSBmcm9tIGEgY2FsbGVyIG9m
IHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjaygpCndpbGwgbG9vayBzb21ldGhpbmcgbGlrZSB0
aGlzOgoKY2FsbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2sKwqDCoMKgIC4uLgrCoMKgwqAg
bGZlbmNlCsKgwqDCoCAuLi4KwqDCoMKgIHJldMKgwqDCoApjbXAgJDAsICVlYXgKam5lIC4uLgoK
V2hpY2ggaXMgdW5zYWZlLCBiZWNhdXNlIHRoZSBvbmx5IHNhZmUgd2F5IHRvIGFycmFuZ2UgdGhp
cyBjb2RlIHdvdWxkIGJlOgoKY2FsbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2sKwqDCoMKg
IC4uLgrCoMKgwqAgcmV0CmNtcCAkMCwgJWVheApqbmUgMWYKbGZlbmNlCi4uLgoxOiBsZmVuY2UK
Li4uCgpUaGVyZSBpcyBhYnNvbHV0ZWx5IG5vIHBvc3NpYmxlIHdheSBmb3IgaW5saW5lIGFzc2Vt
Ymx5IHRvIGJlIHVzZWQgdG8KcHJvcGFnYXRlIHRoaXMgc2FmZXR5IHByb3BlcnR5IGFjcm9zcyB0
cmFuc2xhdGlvbiB1bml0cy7CoCBUaGlzIGlzIGdvaW5nCnRvIGhhdmUgdG8gYmUgYW4gYXR0cmli
dXRlIG9mIHNvbWUgZm9ybSBvciBhbm90aGVyIGhhbmRsZWQgYnkgdGhlIGNvbXBpbGVyLgoKPgo+
PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCj4+
IEBAIC05Niw2ICs5NiwyMyBAQCBjb25maWcgU1BFQ1VMQVRJVkVfQVJSQVlfSEFSREVOCj4+ICAK
Pj4gIAkgIElmIHVuc3VyZSwgc2F5IFkuCj4+ICAKPj4gK2NvbmZpZyBTUEVDVUxBVElWRV9CUkFO
Q0hfSEFSREVOCj4+ICsJYm9vbCAiU3BlY3VsYXRpdmUgQnJhbmNoIEhhcmRlbmluZyIKPj4gKwlk
ZXBlbmRzIG9uIEJST0tFTgo+PiArICAgICAgICAtLS1oZWxwLS0tCj4+ICsJICBDb250ZW1wb3Jh
cnkgcHJvY2Vzc29ycyBtYXkgdXNlIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbiBhcyBhCj4+ICsJICBw
ZXJmb3JtYW5jZSBvcHRpbWlzYXRpb24sIGJ1dCB0aGlzIGNhbiBwb3RlbnRpYWxseSBiZSBhYnVz
ZWQgYnkgYW4KPj4gKwkgIGF0dGFja2VyIHRvIGxlYWsgZGF0YSB2aWEgc3BlY3VsYXRpdmUgc2lk
ZWNoYW5uZWxzLgo+PiArCj4+ICsJICBPbmUgc291cmNlIG9mIG1pc2JlaGF2aW91ciBpcyBieSBl
eGVjdXRpbmcgdGhlIHdyb25nIGJhc2ljIGJsb2NrCj4+ICsJICBmb2xsb3dpbmcgYSBjb25kaXRp
b25hbCBqdW1wLgo+PiArCj4+ICsJICBXaGVuIGVuYWJsZWQsIHNwZWNpZmljIGNvbmRpdGlvbnMg
d2hpY2ggaGF2ZSBiZWVuIGRlZW1lZCBsaWFibGUgdG8KPj4gKwkgIGJlIHNwZWN1bGF0aXZlbHkg
YWJ1c2VkIHdpbGwgYmUgaGFyZGVuZWQgdG8gYXZvaWQgZW50ZXJpbmcgdGhlIHdyb25nCj4+ICsJ
ICBiYXNpYyBibG9jay4KPj4gKwo+PiArCSAgISEhIFdBUk5JTkcgLSBUaGlzIGlzIGJyb2tlbiBh
bmQgZG9lc24ndCBnZW5lcmF0ZSBzYWZlIGNvZGUgISEhCj4gTm90IGJlaW5nIGEgbmF0aXZlIHNw
ZWFrZXIsIHRoaXMgcmVhZCB0byBtZSBhcyAiaXMgYnJva2VuIGluIGdlbmVyYWwiLAo+IHdoZXJl
YXMgdGhlIGJyb2tlbm5lc3MgaXMgdGhhdCBhY2NvcmRpbmcgdG8geW91ciBhbmFseXNpcyBzYWZl
IGNvZGUKPiBkb2VzIG5vdCByZXN1bHQuIFRoZXJlZm9yZSBob3cgYWJvdXQgIlRoaXMgaXMgYnJv
a2VuIGluIHRoYXQgaXQgZG9lc24ndAo+IGdlbmVyYXRlIHNhZmUgY29kZSI/CgpJIHdvdWxkbid0
IG5lY2Vzc2FyaWx5IGFncmVlIHdpdGggdGhlICJpbiBnZW5lcmFsIiBpbXBsaWNhdGlvbiwgYnV0
CmdpdmVuIHRoZSBsYWNrIG9mIGNsYXJpdHksIGEgYmV0dGVyIG9wdGlvbiB3b3VsZCBiZToKCiEh
ISBXQVJOSU5HIC0gVGhpcyBvcHRpb24gZG9lc24ndCB3b3JrIGFzIGludGVuZGVkLiBJdCBkb2Vz
IG5vdCBnZW5lcmF0ZQpzcGVjdWxhdGl2ZWx5IHNhZmUgY29kZSAhISEKCj4KPj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L25v
c3BlYy5oCj4+IEBAIC05LDggKzksOCBAQAo+PiAgLyogQWxsb3cgdG8gaW5zZXJ0IGEgcmVhZCBt
ZW1vcnkgYmFycmllciBpbnRvIGNvbmRpdGlvbmFscyAqLwo+PiAgc3RhdGljIGFsd2F5c19pbmxp
bmUgYm9vbCBiYXJyaWVyX25vc3BlY190cnVlKHZvaWQpCj4+ICB7Cj4+IC0jaWZkZWYgQ09ORklH
X0hWTQo+PiAtICAgIGFsdGVybmF0aXZlKCIiLCAibGZlbmNlIiwgWDg2X0ZFQVRVUkVfU0NfTDFU
Rl9WVUxOKTsKPj4gKyNpZmRlZiBDT05GSUdfU1BFQ1VMQVRJVkVfQlJBTkNIX0hBUkRFTgo+PiAr
ICAgIGFsdGVybmF0aXZlKCIiLCAibGZlbmNlIiwgWDg2X0ZFQVRVUkVfQUxXQVlTKTsKPiBXaHkg
YWx0ZXJuYXRpdmUoKSB0aGVuIGFuZCBub3QganVzdCBhc20oKT8KCk9rLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
