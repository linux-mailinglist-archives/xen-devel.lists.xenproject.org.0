Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF67DC440F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 00:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFR0k-0004uy-HG; Tue, 01 Oct 2019 22:52:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFR0j-0004ut-9O
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 22:52:49 +0000
X-Inumbo-ID: 30a166cc-e49e-11e9-9709-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 30a166cc-e49e-11e9-9709-12813bfff9fa;
 Tue, 01 Oct 2019 22:52:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F929215EA;
 Tue,  1 Oct 2019 22:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569970368;
 bh=CAfGiiCfC8clskYSWQqP7RKbvSorFTAqO+g7kZedIaM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NyRIupCeja6bx+Q4YMwL31XU8VeSwY/18RFVcETKKyp7oxNT/MDr79Fa6rP0B6A48
 UJQanANRZpDu8XKu0KIRb+Fz0yysZ/yJpwI6tyFJGsvfUP48MAsaOfVHsBlpWu+v+n
 gP9Usus1xwCsQjscoKaGqttesxMegk6twkhmjjrU=
Date: Tue, 1 Oct 2019 15:52:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <4748bf97-3354-f4eb-5df3-e19b37d635e1@arm.com>
Message-ID: <alpine.DEB.2.21.1910011551350.2943@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011518240.2943@sstabellini-ThinkPad-T480s>
 <4748bf97-3354-f4eb-5df3-e19b37d635e1@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace
 use of ALTERNATIVE with alternative_if
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwMS8xMC8yMDE5IDIzOjE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBU
aHUsIDI2IFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPj4gVXNpbmcgYWx0ZXJuYXRp
dmVfaWYgbWFrZXMgdGhlIGNvZGUgYSBiaXQgbW9yZSBzdHJlYW1saW5lZC4KPiA+Pgo+ID4+IFRh
a2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVzZSB0aGUgbmV3IGF1dG8tbm9wIGluZnJhc3RydWN0dXJl
IHRvIGF2b2lkCj4gPj4gY291bnRpbmcgdGhlIG51bWJlciBvZiBub3AgaW4gdGhlIGVsc2UgcGFy
dCBmb3IgYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+Pgo+ID4+IC0tLQo+ID4+ICAgICAg
VGhpcyBpcyBwcmV0dHkgbXVjaCBhIG1hdHRlciBvZiB0YXN0ZSwgYnV0IGF0IGxlYXN0IGZvciBh
cm02NCB0aGlzCj4gPj4gICAgICBhbGxvd3MgdXMgdG8gdXNlIHRoZSBhdXRvLW5vcCBpbmZyYXN0
cnVjdHVyZS4gU28gdGhlIGFybTMyIGlzIG1vcmUKPiA+PiAgICAgIHRvIGtlZXAgaW5saW5lIHdp
dGggYXJtNjQuCj4gPj4gLS0tCj4gPj4gICB4ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUyB8IDkg
KysrKysrLS0tCj4gPj4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyB8IDggKysrKystLS0K
PiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
PiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUyBiL3hlbi9h
cmNoL2FybS9hcm0zMi9lbnRyeS5TCj4gPj4gaW5kZXggMGI0Y2QxOWFiZC4uMTQyOGNkMzU4MyAx
MDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvZW50cnkuUwo+ID4+ICsrKyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4gPj4gQEAgLTY1LDkgKzY1LDEyIEBAIHNhdmVfZ3Vl
c3RfcmVnczoKPiA+PiAgICAgICAgICAgICogSWYgdGhlIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9S
X0VOVFJZX0VYSVQgaGFzIGJlZW4gc2V0IGluIHRoZSBjcHUKPiA+PiAgICAgICAgICAgICogZmVh
dHVyZSwgdGhlIGNoZWNraW5nIG9mIHBlbmRpbmcgU0Vycm9ycyB3aWxsIGJlIHNraXBwZWQuCj4g
Pj4gICAgICAgICAgICAqLwo+ID4+IC0gICAgICAgIEFMVEVSTkFUSVZFKCJub3AiLAo+ID4+IC0g
ICAgICAgICAgICAgICAgICAgICJiIHNraXBfY2hlY2siLAo+ID4+IC0gICAgICAgICAgICAgICAg
ICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCj4gPj4gKyAgICAgICAgYWx0
ZXJuYXRpdmVfaWYgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVAo+ID4+ICsgICAg
ICAgIG5vcAo+ID4+ICsgICAgICAgIGFsdGVybmF0aXZlX2Vsc2UKPiA+PiArICAgICAgICBiICAg
c2tpcF9jaGVjawo+ID4+ICsgICAgICAgIGFsdGVybmF0aXZlX2VuZGlmCj4gPiAKPiA+IFRoaXMg
Y291bGQgYmUgd3JpdHRlbiBhczoKPiA+IAo+ID4gYWx0ZXJuYXRpdmVfaWZfbm90IFNLSVBfU1lO
Q0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKPiA+IGIgICBza2lwX2NoZWNrCj4gPiBhbHRlcm5h
dGl2ZV9lbHNlX25vcF9lbmRpZgo+IAo+IEFjdHVhbGx5IG15IGltcGxlbWVudGF0aW9uIGlzIHdy
b25nIDovLiBXZSB3YW50IHRvIHNraXAgdGhlIGNoZWNrIGlmIHRoZSAKPiBjYXAgaXMgc2V0LiBT
byB0aGlzIHNob3VsZCBiZToKPiAKPiBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpFX1NF
UlJPUl9FTlRSWV9FWElUCj4gYiAgICBza2lwX2NoZWNrCj4gYWx0ZXJuYXRpdmVfZWxzZV9ub3Bf
ZW5kaWYKCkFoLCB5ZXMgb2YgY291cnNlLCBsaWtlIHRoZSBuYW1lIHN1Z2dlc3RzCgoKPiA+IAo+
ID4+ICAgICAgICAgICAvKgo+ID4+ICAgICAgICAgICAgKiBTdGFydCB0byBjaGVjayBwZW5kaW5n
IHZpcnR1YWwgYWJvcnQgaW4gdGhlIGdhcCBvZiBHdWVzdCAtPiBIWVAKPiA+PiAgICAgICAgICAg
ICogd29ybGQgc3dpdGNoLgo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50
cnkuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCj4gPj4gaW5kZXggNDU4ZDEyZjE4OC4u
OTFjZjZlZTZmNCAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+
ID4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TCj4gPj4gQEAgLTE3MCw5ICsxNzAs
MTEgQEAKPiA+PiAgICAgICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2U0Vycm9yIHRvb2sgcGxh
Y2UsIHRoZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxsIGJlCj4gPj4gICAgICAgICAgICAqIHNraXBw
ZWQuIEV4aXQgQVNBUAo+ID4+ICAgICAgICAgICAgKi8KPiA+PiAtICAgICAgICBBTFRFUk5BVElW
RSgiYmwgY2hlY2tfcGVuZGluZ192c2Vycm9yOyBjYm56IHgwLCAxZiIsCj4gPj4gLSAgICAgICAg
ICAgICAgICAgICAgIm5vcDsgbm9wIiwKPiA+PiAtICAgICAgICAgICAgICAgICAgICBTS0lQX1NZ
TkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQo+ID4+ICsgICAgICAgIGFsdGVybmF0aXZlX2lm
IFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKPiAKPiBUaGlzIHdvdWxkIG5lZWQg
dG8gYmUgYWx0ZXJuYXRpdmVfaWZfbm90IGFzIHdhbnQgdG8gY2FsbCB0aGUgZnVuY3Rpb24gCj4g
d2hlbiB0aGUgY2FwIGlzIG5vdCBzZXQuCgpZZXAKCgo+ID4+ICsgICAgICAgIGJsICAgICAgY2hl
Y2tfcGVuZGluZ192c2Vycm9yCj4gPj4gKyAgICAgICAgY2JueiAgICB4MCwgMWYKPiA+PiArICAg
ICAgICBhbHRlcm5hdGl2ZV9lbHNlX25vcF9lbmRpZgo+ID4+ICsKPiA+PiAgICAgICAgICAgbW92
ICAgICB4MCwgc3AKPiA+PiAgICAgICAgICAgYmwgICAgICBlbnRlcl9oeXBlcnZpc29yX2Zyb21f
Z3Vlc3Rfbm9pcnEKPiA+PiAgICAgICAgICAgbXNyICAgICBkYWlmY2xyLCBcaWZsYWdzCj4gPj4g
LS0gCj4gPj4gMi4xMS4wCj4gPj4KPiAKPiBDaGVlZXJzLAo+IAo+IC0tIAo+IEp1bGllbiBHcmFs
bAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
