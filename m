Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFF3D571
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:24:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halOL-0003ub-OV; Tue, 11 Jun 2019 18:21:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1halOK-0003uT-C2
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:21:04 +0000
X-Inumbo-ID: aba73572-8c75-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aba73572-8c75-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:21:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9230920866;
 Tue, 11 Jun 2019 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560277262;
 bh=SiMXj5T+B/NVmycTD2GnyHbwQySmDe90LxXSmjB6tJU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xlY4VomsRigT/RmP5Z/cF+6Y6dvETJWsxHA42yCZyXqsxie9+wZn/F+zQNDQh4Dj9
 zwE9gM2XsU3O6p/TIbDjzlGIxaevvFFTnw+MZRxY908RSghx5rWiaoavbCYgWtHxnF
 ZdKqYIXrNC85aSOW/dlOzdnoQ04WQ/jDEVG4kCAM=
Date: Tue, 11 Jun 2019 11:21:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906111120290.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 01/12] xen/arm: lpae: Add a
 macro to generate offsets from an address
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZXJlIGFyZSBmZXcg
cGxhY2VzIHJlcXVpcmluZyB0byBnZW5lcmF0ZSBvZmZzZXRzIGZyb20gYW4gYWRkcmVzcy4KPiBS
YXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeXdoZXJlLCB3ZSBjYW4gaW50cm9kdWNlIGEgbWFj
cm8gdG8gZG8gdGhlCj4gam9iIGZvciB1cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAg
ICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3Ay
bS5jICAgICAgICAgfCAyMyArKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9h
c20tYXJtL2xwYWUuaCB8ICA5ICsrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBpbmRleCA5MmMyNDEzZjIwLi4wNmZhMzQyYThm
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9w
Mm0uYwo+IEBAIC0zNjgsMTIgKzM2OCw3IEBAIG1mbl90IHAybV9nZXRfZW50cnkoc3RydWN0IHAy
bV9kb21haW4gKnAybSwgZ2ZuX3QgZ2ZuLAo+ICAgICAgcDJtX3R5cGVfdCBfdDsKPiAgCj4gICAg
ICAvKiBDb252ZW5pZW5jZSBhbGlhc2VzICovCgpJIGRvbid0IGtub3cgaWYgeW91IHdhbnQgdG8g
a2VlcCB0aGlzIGNvbW1lbnQsIHdlIGNvdWxkIGdldCByaWQgb2YgaXQuCkVpdGhlciB3YXk6CgpB
Y2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4g
LSAgICBjb25zdCB1bnNpZ25lZCBpbnQgb2Zmc2V0c1s0XSA9IHsKPiAtICAgICAgICB6ZXJvZXRo
X3RhYmxlX29mZnNldChhZGRyKSwKPiAtICAgICAgICBmaXJzdF90YWJsZV9vZmZzZXQoYWRkciks
Cj4gLSAgICAgICAgc2Vjb25kX3RhYmxlX29mZnNldChhZGRyKSwKPiAtICAgICAgICB0aGlyZF90
YWJsZV9vZmZzZXQoYWRkcikKPiAtICAgIH07Cj4gKyAgICBERUNMQVJFX09GRlNFVFMob2Zmc2V0
cywgYWRkcik7Cj4gIAo+ICAgICAgQVNTRVJUKHAybV9pc19sb2NrZWQocDJtKSk7Cj4gICAgICBC
VUlMRF9CVUdfT04oVEhJUkRfTUFTSyAhPSBQQUdFX01BU0spOwo+IEBAIC04ODgsNyArODgzLDYg
QEAgc3RhdGljIGludCBfX3AybV9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCB0LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwMm1fYWNjZXNzX3QgYSkKPiAgewo+IC0gICAgcGFkZHJfdCBhZGRyID0g
Z2ZuX3RvX2dhZGRyKHNnZm4pOwo+ICAgICAgdW5zaWduZWQgaW50IGxldmVsID0gMDsKPiAgICAg
IHVuc2lnbmVkIGludCB0YXJnZXQgPSAzIC0gKHBhZ2Vfb3JkZXIgLyBMUEFFX1NISUZUKTsKPiAg
ICAgIGxwYWVfdCAqZW50cnksICp0YWJsZSwgb3JpZ19wdGU7Cj4gQEAgLTg5NywxMiArODkxLDcg
QEAgc3RhdGljIGludCBfX3AybV9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwKPiAg
ICAgIGJvb2wgcmVtb3ZpbmdfbWFwcGluZyA9IG1mbl9lcShzbWZuLCBJTlZBTElEX01GTik7Cj4g
IAo+ICAgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLwo+IC0gICAgY29uc3QgdW5zaWduZWQg
aW50IG9mZnNldHNbNF0gPSB7Cj4gLSAgICAgICAgemVyb2V0aF90YWJsZV9vZmZzZXQoYWRkciks
Cj4gLSAgICAgICAgZmlyc3RfdGFibGVfb2Zmc2V0KGFkZHIpLAo+IC0gICAgICAgIHNlY29uZF90
YWJsZV9vZmZzZXQoYWRkciksCj4gLSAgICAgICAgdGhpcmRfdGFibGVfb2Zmc2V0KGFkZHIpCj4g
LSAgICB9Owo+ICsgICAgREVDTEFSRV9PRkZTRVRTKG9mZnNldHMsIGdmbl90b19nYWRkcihzZ2Zu
KSk7Cj4gIAo+ICAgICAgQVNTRVJUKHAybV9pc193cml0ZV9sb2NrZWQocDJtKSk7Cj4gIAo+IEBA
IC0xMTk5LDE1ICsxMTg4LDkgQEAgYm9vbCBwMm1fcmVzb2x2ZV90cmFuc2xhdGlvbl9mYXVsdChz
dHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4pCj4gICAgICB1bnNpZ25lZCBpbnQgbGV2ZWwgPSAw
Owo+ICAgICAgYm9vbCByZXNvbHZlZCA9IGZhbHNlOwo+ICAgICAgbHBhZV90IGVudHJ5LCAqdGFi
bGU7Cj4gLSAgICBwYWRkcl90IGFkZHIgPSBnZm5fdG9fZ2FkZHIoZ2ZuKTsKPiAgCj4gICAgICAv
KiBDb252ZW5pZW5jZSBhbGlhc2VzICovCj4gLSAgICBjb25zdCB1bnNpZ25lZCBpbnQgb2Zmc2V0
c1s0XSA9IHsKPiAtICAgICAgICB6ZXJvZXRoX3RhYmxlX29mZnNldChhZGRyKSwKPiAtICAgICAg
ICBmaXJzdF90YWJsZV9vZmZzZXQoYWRkciksCj4gLSAgICAgICAgc2Vjb25kX3RhYmxlX29mZnNl
dChhZGRyKSwKPiAtICAgICAgICB0aGlyZF90YWJsZV9vZmZzZXQoYWRkcikKPiAtICAgIH07Cj4g
KyAgICBERUNMQVJFX09GRlNFVFMob2Zmc2V0cywgZ2ZuX3RvX2dhZGRyKGdmbikpOwo+ICAKPiAg
ICAgIHAybV93cml0ZV9sb2NrKHAybSk7Cj4gIAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2xwYWUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCj4gaW5kZXggNTQ1YjBj
OGYyNC4uYzIyNzgwZjhmMyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2xwYWUu
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oCj4gQEAgLTIxOCw2ICsyMTgsMTUg
QEAgVEFCTEVfT0ZGU0VUX0hFTFBFUlMoNjQpOwo+ICAjdW5kZWYgVEFCTEVfT0ZGU0VUCj4gICN1
bmRlZiBUQUJMRV9PRkZTRVRfSEVMUEVSUwo+ICAKPiArLyogR2VuZXJhdGUgYW4gYXJyYXkgQHZh
ciBjb250YWluaW5nIHRoZSBvZmZzZXQgZm9yIGVhY2ggbGV2ZWwgZnJvbSBAYWRkciAqLwo+ICsj
ZGVmaW5lIERFQ0xBUkVfT0ZGU0VUUyh2YXIsIGFkZHIpICAgICAgICAgIFwKPiArICAgIGNvbnN0
IHVuc2lnbmVkIGludCB2YXJbNF0gPSB7ICAgICAgICAgICBcCj4gKyAgICAgICAgemVyb2V0aF90
YWJsZV9vZmZzZXQoYWRkciksICAgICAgICAgXAo+ICsgICAgICAgIGZpcnN0X3RhYmxlX29mZnNl
dChhZGRyKSwgICAgICAgICAgIFwKPiArICAgICAgICBzZWNvbmRfdGFibGVfb2Zmc2V0KGFkZHIp
LCAgICAgICAgICBcCj4gKyAgICAgICAgdGhpcmRfdGFibGVfb2Zmc2V0KGFkZHIpICAgICAgICAg
ICAgXAo+ICsgICAgfQo+ICsKPiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ICAKPiAgLyoK
PiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
