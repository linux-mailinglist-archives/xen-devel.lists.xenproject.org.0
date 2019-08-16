Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F328FA6A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 07:39:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyUvN-0001Ey-2I; Fri, 16 Aug 2019 05:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEcF=WM=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hyUvL-0001Eq-9g
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 05:37:15 +0000
X-Inumbo-ID: e564864c-bfe7-11e9-aee9-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e564864c-bfe7-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 05:37:13 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id E9E862000C2;
 Fri, 16 Aug 2019 15:37:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1565933833; bh=+ZA2CeWxwKzw+wpZBHLX774CwkjYgIwZcCIoT/zR0lU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=inD//FBwJPrez2E55zGH93iVavqdDpWtANiUyL2SjKgNQoh4Au303EQZVcDWfE6Ye
 O+T2UOoW5KdwQz623G0FcHXFY+MjT2+U7qxdsZFitaWvNMHpusloah3vMTyaVgRv3J
 3gUv5vn6nLKWre7toJHwuNEtt/kzjVUAuT5U4eX8=
MIME-Version: 1.0
Date: Fri, 16 Aug 2019 15:37:10 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au>
X-Sender: netwiz@crc.id.au
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

T24gMjAxOS0wOC0xNiAxNToyNSwgU3RldmVuIEhhaWdoIHdyb3RlOgo+IE9uIDIwMTktMDgtMTYg
MDU6MDUsIFlPVU5HLCBNSUNIQUVMIEEuIHdyb3RlOgo+PiBPbiBUaHUsIDE1IEF1ZyAyMDE5LCBT
dGV2ZW4gSGFpZ2ggd3JvdGU6Cj4+IAo+Pj4gSGF2aW5nIGEgYml0IG9mIGEgbG9vayBoZXJlLi4u
Lgo+Pj4gCj4+PiBNeSB0ZXN0IHN5c3RlbSBncnViZW52IGZpbGUgaGFzOgo+Pj4gIyBHUlVCIEVu
dmlyb25tZW50IEJsb2NrCj4+PiBzYXZlZF9lbnRyeT0wCj4+PiBrZXJuZWxvcHRzPXJvb3Q9VVVJ
RD01MzQ2YjRkOS04ODVmLTQ2NzMtOGFmZi0wNGExNmJmMTk3MWEgcm8KPj4+IHJvb3RmbGFncz1z
dWJ2b2w9cm9vdCBzZWxpbnV4PTAgcmhnYiBxdWlldAo+Pj4gYm9vdF9zdWNjZXNzPTEKPj4+ICMj
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
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPj4gCj4+IEkgaGF2ZSBhdHRhY2hlZCBhIHJldmlzaW9uIG9mIHRoZSBmaXJzdCBw
YXRjaCB3aGljaCBzaG91bGQgaGFuZGxlIGEKPj4gbnVtZXJpYyBzYXZlZF9lbnRyeS4KPiAKPiBI
aSBNaWNoYWVsLAo+IAo+IEkgdHJpZWQgdGhpcyAtIGFuZCBpdCBzdWNjZXNzZnVsbHkgd29ya3Mg
Zm9yIHN5c3RlbXMgdGhhdCBoYXZlIAo+IHNhdmVkX2VudHJ5PTAuCj4gCj4gSSBub3RpY2VkIHRo
YXQgc3RvY2sgaW5zdGFsbHMgc3RpbGwgaGF2ZSBwcm9ibGVtcyB3aXRoIHVwZGF0aW5nCj4gZ3J1
YmVudiBmcm9tIG5ldyBrZXJuZWwgaW5zdGFsbHMuIEkgaGFkIHRvIG1hbnVhbGx5IHJlZ2VuZXJh
dGUKPiBncnViLmNmZyBhZnRlciB1cGdyYWRpbmcgdG8ga2VybmVsIDUuMi44LiBncnViZW52IGRv
ZXNuJ3Qgc2VlbSB0byBnZXQKPiBjaGFuZ2VkIGF0IGFsbCB1bmxlc3MgeW91IG1hbnVhbGx5IHVz
ZSAnZ3J1YjItc2V0LWRlZmF1bHQgMCcKPiAKPiAkIHJwbSAtcWEgfCBncmVwIGtlcm5lbCB8IHNv
cnQKPiBrZXJuZWwtNS4xLjE1LTMwMC5mYzMwLng4Nl82NAo+IGtlcm5lbC01LjIuOC0yMDAuZmMz
MC54ODZfNjQKPiBrZXJuZWwtY29yZS01LjEuMTUtMzAwLmZjMzAueDg2XzY0Cj4ga2VybmVsLWNv
cmUtNS4yLjgtMjAwLmZjMzAueDg2XzY0Cj4ga2VybmVsLWhlYWRlcnMtNS4yLjgtMjAwLmZjMzAu
eDg2XzY0Cj4ga2VybmVsLW1vZHVsZXMtNS4xLjE1LTMwMC5mYzMwLng4Nl82NAo+IGtlcm5lbC1t
b2R1bGVzLTUuMi44LTIwMC5mYzMwLng4Nl82NAo+IAo+ICQgcnBtIC1xYSB8IGdyZXAgZ3J1YiB8
IHNvcnQKPiBncnViMi1jb21tb24tMi4wMi04MS5mYzMwLm5vYXJjaAo+IGdydWIyLXBjLTIuMDIt
ODEuZmMzMC54ODZfNjQKPiBncnViMi1wYy1tb2R1bGVzLTIuMDItODEuZmMzMC5ub2FyY2gKPiBn
cnViMi10b29scy0yLjAyLTgxLmZjMzAueDg2XzY0Cj4gZ3J1YjItdG9vbHMtZWZpLTIuMDItODEu
ZmMzMC54ODZfNjQKPiBncnViMi10b29scy1leHRyYS0yLjAyLTgxLmZjMzAueDg2XzY0Cj4gZ3J1
YjItdG9vbHMtbWluaW1hbC0yLjAyLTgxLmZjMzAueDg2XzY0Cj4gZ3J1YmJ5LTguNDAtMzEuZmMz
MC54ODZfNjQKPiBncnViYnktZGVwcmVjYXRlZC04LjQwLTMxLmZjMzAueDg2XzY0Cj4gCj4gJCBj
YXQgL2V0Yy9kZWZhdWx0L2dydWIKPiBHUlVCX1RJTUVPVVQ9MQo+IEdSVUJfREVGQVVMVD1zYXZl
ZAo+IEdSVUJfRElTQUJMRV9TVUJNRU5VPXRydWUKPiBHUlVCX1RFUk1JTkFMX09VVFBVVD0iY29u
c29sZSIKPiBHUlVCX0NNRExJTkVfTElOVVg9ImF1ZGl0PTAgc2VsaW51eD0wIGNvbnNvbGU9aHZj
MCIKPiBHUlVCX0RJU0FCTEVfUkVDT1ZFUlk9InRydWUiCj4gR1JVQl9FTkFCTEVfQkxTQ0ZHPWZh
bHNlCj4gCj4gSXQgc2VlbXMgd2Ugc3RpbGwgaGF2ZSBpc3N1ZXMgd2l0aCB0aGlzIGNvbmZpZ3Vy
YXRpb24gLSBidXQgdGhpcyBpcyBhCj4gRmVkb3JhIDMwIHByb2JsZW0gLSAgbm90IFhlbi4KClNv
cnJ5LCBmb3Jnb3QgdG8gYWRkIHRoaXMgZm9yIHVzaW5nIHRoZSBmdW5jdGlvbmFsaXR5IG9mIHNh
dmVkX2VudHJ5PTAuCgpUZXN0ZWQtYnk6IFN0ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4K
CkhhdmUgbm90IHRlc3RlZCB1c2luZyBhIHN0cmluZyBhcyB0aGUgZW50cnkgLSBhcyBhbGwgb2Yg
bXkgaW5zdGFsbHMgc2VlbSAKdG8gaGF2ZSBvdGhlciBwcm9ibGVtcyB3cnQgc2VtaS1yZWxhdGVk
IGZlZG9yYSBpc3N1ZXMuCgotLSAKU3RldmVuIEhhaWdoCgo/IG5ldHdpekBjcmMuaWQuYXUgICAg
ID8gaHR0cDovL3d3dy5jcmMuaWQuYXUKPyArNjEgKDMpIDkwMDEgNjA5MCAgICA/IDA0MTIgOTM1
IDg5NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
