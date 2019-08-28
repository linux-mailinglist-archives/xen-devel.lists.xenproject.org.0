Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 184739F7F0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 03:39:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2msf-0004CR-UF; Wed, 28 Aug 2019 01:36:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2EEE=WY=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i2msd-0004CJ-F4
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 01:36:11 +0000
X-Inumbo-ID: 336503ee-c934-11e9-8980-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 336503ee-c934-11e9-8980-bc764e2007e4;
 Wed, 28 Aug 2019 01:36:07 +0000 (UTC)
Received: from DELL15.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:5d6f:c86d:6046:d5c9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id C8262200108;
 Wed, 28 Aug 2019 11:35:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1566956159; bh=1G3l5Ugej9beuoKq55UfKc4+vIVpGhaMWgLYY6T8/00=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=Bvgbb+Smp14CW4JcLtFIS0ql4/fDh15KJ2HmuJktx1GtxpIDWo12P2NQlsTwTOch1
 vjmkkQ+8NGmZORHx7xatCrt8HLRp2V10Rxi6LbFjDj++iHVUw5F74i+POTdy6LHPT7
 HuMPIyqT/yCvkJPQECTWgJWk/HT/vecAG5senU88=
Date: Wed, 28 Aug 2019 11:35:55 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Message-Id: <1566956155.3344.0@crc.id.au>
In-Reply-To: <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
 <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au>
X-Mailer: geary/3.32.2
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCB3YW50ZWQgdG8gZ2l2ZSB0aGlzIGEgcXVpY2sgZm9sbG93dXAuLi4gRGlkIHRoaXMgZW5k
IHVwIApwcm9ncmVzc2luZz8KCk9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDM6MzcgUE0sIFN0ZXZl
biBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4gd3JvdGU6Cj4gT24gMjAxOS0wOC0xNiAxNToyNSwg
U3RldmVuIEhhaWdoIHdyb3RlOgo+PiBPbiAyMDE5LTA4LTE2IDA1OjA1LCBZT1VORywgTUlDSEFF
TCBBLiB3cm90ZToKPj4+IE9uIFRodSwgMTUgQXVnIDIwMTksIFN0ZXZlbiBIYWlnaCB3cm90ZToK
Pj4+IAo+Pj4+IEhhdmluZyBhIGJpdCBvZiBhIGxvb2sgaGVyZS4uLi4KPj4+PiAKPj4+PiBNeSB0
ZXN0IHN5c3RlbSBncnViZW52IGZpbGUgaGFzOgo+Pj4+ICMgR1JVQiBFbnZpcm9ubWVudCBCbG9j
awo+Pj4+IHNhdmVkX2VudHJ5PTAKPj4+PiBrZXJuZWxvcHRzPXJvb3Q9VVVJRD01MzQ2YjRkOS04
ODVmLTQ2NzMtOGFmZi0wNGExNmJmMTk3MWEgcm8KPj4+PiByb290ZmxhZ3M9c3Vidm9sPXJvb3Qg
c2VsaW51eD0wIHJoZ2IgcXVpZXQKPj4+PiBib290X3N1Y2Nlc3M9MQo+Pj4+ICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
Pj4+IAo+Pj4gSSBoYXZlIGF0dGFjaGVkIGEgcmV2aXNpb24gb2YgdGhlIGZpcnN0IHBhdGNoIHdo
aWNoIHNob3VsZCBoYW5kbGUgYQo+Pj4gbnVtZXJpYyBzYXZlZF9lbnRyeS4KPj4gCj4+IEhpIE1p
Y2hhZWwsCj4+IAo+PiBJIHRyaWVkIHRoaXMgLSBhbmQgaXQgc3VjY2Vzc2Z1bGx5IHdvcmtzIGZv
ciBzeXN0ZW1zIHRoYXQgaGF2ZSAKPj4gf3NhdmVkX2VudHJ5PTAuCj4+IAo+PiBJIG5vdGljZWQg
dGhhdCBzdG9jayBpbnN0YWxscyBzdGlsbCBoYXZlIHByb2JsZW1zIHdpdGggdXBkYXRpbmcKPj4g
Z3J1YmVudiBmcm9tIG5ldyBrZXJuZWwgaW5zdGFsbHMuIEkgaGFkIHRvIG1hbnVhbGx5IHJlZ2Vu
ZXJhdGUKPj4gZ3J1Yi5jZmcgYWZ0ZXIgdXBncmFkaW5nIHRvIGtlcm5lbCA1LjIuOC4gZ3J1YmVu
diBkb2Vzbid0IHNlZW0gdG8gZ2V0Cj4+IGNoYW5nZWQgYXQgYWxsIHVubGVzcyB5b3UgbWFudWFs
bHkgdXNlICdncnViMi1zZXQtZGVmYXVsdCAwJwo+PiAKPj4gJCBycG0gLXFhIHwgZ3JlcCBrZXJu
ZWwgfCBzb3J0Cj4+IGtlcm5lbC01LjEuMTUtMzAwLmZjMzAueDg2XzY0Cj4+IGtlcm5lbC01LjIu
OC0yMDAuZmMzMC54ODZfNjQKPj4ga2VybmVsLWNvcmUtNS4xLjE1LTMwMC5mYzMwLng4Nl82NAo+
PiBrZXJuZWwtY29yZS01LjIuOC0yMDAuZmMzMC54ODZfNjQKPj4ga2VybmVsLWhlYWRlcnMtNS4y
LjgtMjAwLmZjMzAueDg2XzY0Cj4+IGtlcm5lbC1tb2R1bGVzLTUuMS4xNS0zMDAuZmMzMC54ODZf
NjQKPj4ga2VybmVsLW1vZHVsZXMtNS4yLjgtMjAwLmZjMzAueDg2XzY0Cj4+IAo+PiAkIHJwbSAt
cWEgfCBncmVwIGdydWIgfCBzb3J0Cj4+IGdydWIyLWNvbW1vbi0yLjAyLTgxLmZjMzAubm9hcmNo
Cj4+IGdydWIyLXBjLTIuMDItODEuZmMzMC54ODZfNjQKPj4gZ3J1YjItcGMtbW9kdWxlcy0yLjAy
LTgxLmZjMzAubm9hcmNoCj4+IGdydWIyLXRvb2xzLTIuMDItODEuZmMzMC54ODZfNjQKPj4gZ3J1
YjItdG9vbHMtZWZpLTIuMDItODEuZmMzMC54ODZfNjQKPj4gZ3J1YjItdG9vbHMtZXh0cmEtMi4w
Mi04MS5mYzMwLng4Nl82NAo+PiBncnViMi10b29scy1taW5pbWFsLTIuMDItODEuZmMzMC54ODZf
NjQKPj4gZ3J1YmJ5LTguNDAtMzEuZmMzMC54ODZfNjQKPj4gZ3J1YmJ5LWRlcHJlY2F0ZWQtOC40
MC0zMS5mYzMwLng4Nl82NAo+PiAKPj4gJCBjYXQgL2V0Yy9kZWZhdWx0L2dydWIKPj4gR1JVQl9U
SU1FT1VUPTEKPj4gR1JVQl9ERUZBVUxUPXNhdmVkCj4+IEdSVUJfRElTQUJMRV9TVUJNRU5VPXRy
dWUKPj4gR1JVQl9URVJNSU5BTF9PVVRQVVQ9ImNvbnNvbGUiCj4+IEdSVUJfQ01ETElORV9MSU5V
WD0iYXVkaXQ9MCBzZWxpbnV4PTAgY29uc29sZT1odmMwIgo+PiBHUlVCX0RJU0FCTEVfUkVDT1ZF
Ulk9InRydWUiCj4+IEdSVUJfRU5BQkxFX0JMU0NGRz1mYWxzZQo+PiAKPj4gSXQgc2VlbXMgd2Ug
c3RpbGwgaGF2ZSBpc3N1ZXMgd2l0aCB0aGlzIGNvbmZpZ3VyYXRpb24gLSBidXQgdGhpcyBpcyBh
Cj4+IEZlZG9yYSAzMCBwcm9ibGVtIC0gIG5vdCBYZW4uCj4gCj4gU29ycnksIGZvcmdvdCB0byBh
ZGQgdGhpcyBmb3IgdXNpbmcgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgCj4gc2F2ZWRfZW50cnk9MC4K
PiAKPiBUZXN0ZWQtYnk6IFN0ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4KPiAKPiBIYXZl
IG5vdCB0ZXN0ZWQgdXNpbmcgYSBzdHJpbmcgYXMgdGhlIGVudHJ5IC0gYXMgYWxsIG9mIG15IGlu
c3RhbGxzIAo+IHNlZW0gdG8gaGF2ZSBvdGhlciBwcm9ibGVtcyB3cnQgc2VtaS1yZWxhdGVkIGZl
ZG9yYSBpc3N1ZXMuCj4gCj4gLS0KPiBTdGV2ZW4gSGFpZ2gKPiAKPiA/IG5ldHdpekBjcmMuaWQu
YXUgICAgID8gaHR0cDovL3d3dy5jcmMuaWQuYXUKPiA/ICs2MSAoMykgOTAwMSA2MDkwICAgID8g
MDQxMiA5MzUgODk3CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
