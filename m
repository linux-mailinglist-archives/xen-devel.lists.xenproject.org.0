Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193007CE8A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 22:30:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsvC9-00038H-Li; Wed, 31 Jul 2019 20:27:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNV9=V4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsvC8-00038C-6G
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 20:27:32 +0000
X-Inumbo-ID: 9f3984dc-b3d1-11e9-b009-33a72c3c8e42
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f3984dc-b3d1-11e9-b009-33a72c3c8e42;
 Wed, 31 Jul 2019 20:27:31 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7F022064A;
 Wed, 31 Jul 2019 20:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564604850;
 bh=7gZCirC4qD/ZJbPx2JpD65BRc8obfVGgnHfgcNpUXf8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xeA4UaWZc9i7swx/SviAQWVqgfV7WHNbspa4Zu8l6GcXjo7OUy3nbW3kVN42SMVl5
 Vhvw6hUPN3h6ryPKB1H5rigkyfjtsh61Rdv2spD0XCkZz11FRFkDEkupO9PvNFrNtr
 ylqxP3sLJJHGTPljt+qkhEjEZLBnbSI7CtUKE+Go=
Date: Wed, 31 Jul 2019 13:27:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <a74d6b3c-4a9a-8006-fdc3-d3a7c0edb8d3@arm.com>
Message-ID: <alpine.DEB.2.21.1907311325580.22968@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-34-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301421030.28600@sstabellini-ThinkPad-T480s>
 <a74d6b3c-4a9a-8006-fdc3-d3a7c0edb8d3@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 33/35] xen/arm32: head: Rework and
 document launch()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDMwLzA3LzIwMTkg
MjI6MjEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIE1vbiwgMjIgSnVsIDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+PiBCb290IENQVSBhbmQgc2Vjb25kYXJ5IENQVXMgd2ls
bCB1c2UgZGlmZmVyZW50IGVudHJ5IHBvaW50IHRvIEMgY29kZS4gQXQKPiA+PiB0aGUgbW9tZW50
LCB0aGUgZGVjaXNpb24gb24gd2hpY2ggZW50cnkgdG8gdXNlIGlzIHRha2VuIHdpdGhpbiBsYXVu
Y2goKS4KPiA+Pgo+ID4+IEluIG9yZGVyIHRvIGF2b2lkIHVzaW5nIGNvbmRpdGlvbmFsIGluc3Ry
dWN0aW9uIGFuZCBtYWtlIHRoZSBjYWxsCj4gPj4gY2xlYXJlciwgbGF1bmNoKCkgaXMgcmV3b3Jr
ZWQgdG8gdGFrZSBpbiBwYXJhbWV0ZXJzIHRoZSBlbnRyeSBwb2ludCBhbmQgaXRzCj4gPj4gYXJn
dW1lbnRzLgo+ID4+Cj4gPj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBt
YWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCj4gPj4gZnVuY3Rpb24uCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4+Cj4g
Pj4gLS0tCj4gPj4gICAgICBDaGFuZ2VzIGluIHYyOgo+ID4+ICAgICAgICAgIC0gUGF0Y2ggYWRk
ZWQKPiA+PiAtLS0KPiA+PiAgIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAzNCArKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiA+PiBpbmRl
eCBlMGY4YzJlMGNiLi42ZDU1YTIxMTlhIDEwMDY0NAo+ID4+IC0tLSBhL3hlbi9hcmNoL2FybS9h
cm0zMi9oZWFkLlMKPiA+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gPj4gQEAg
LTE3MCw2ICsxNzAsMTEgQEAgcHJpbWFyeV9zd2l0Y2hlZDoKPiA+PiAgICAgICAgICAgLyogVXNl
IGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8KPiA+PiAgICAgICAgICAg
bW92X3cgcjExLCBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+ID4+ICAgI2VuZGlmCj4gPj4g
KyAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ID4+ICsgICAgICAgIC8qIFNldHVwIHRo
ZSBhcmd1bWVudHMgZm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBDIHdvcmxkICovCj4gPj4gKyAg
ICAgICAgbW92ICAgcjAsIHIxMCAgICAgICAgICAgICAgICAvKiByMCA6PSBQaHlzaWNhbCBvZmZz
ZXQgKi8KPiA+PiArICAgICAgICBtb3YgICByMSwgcjggICAgICAgICAgICAgICAgIC8qIHIxIDo9
IHBhZGRyKEZEVCkgKi8KPiA+PiArICAgICAgICBsZHIgICByMiwgPXN0YXJ0X3hlbgo+ID4+ICAg
ICAgICAgICBiICAgICBsYXVuY2gKPiA+PiAgIEVORFBST0Moc3RhcnQpCj4gPj4gICAKPiA+PiBA
QCAtMjM0LDYgKzIzOSw5IEBAIHNlY29uZGFyeV9zd2l0Y2hlZDoKPiA+PiAgICAgICAgICAgLyog
VXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8KPiA+PiAgICAgICAg
ICAgbW92X3cgcjExLCBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+ID4+ICAgI2VuZGlmCj4g
Pj4gKyAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ID4+ICsgICAgICAgIC8qIEp1bXAg
dG8gQyB3b3JsZCAqLwo+ID4+ICsgICAgICAgIGxkciAgIHIyLCA9c3RhcnRfc2Vjb25kYXJ5Cj4g
Pj4gICAgICAgICAgIGIgICAgIGxhdW5jaAo+ID4+ICAgRU5EUFJPQyhpbml0X3NlY29uZGFyeSkK
PiA+PiAgIAo+ID4+IEBAIC01NzgsMTkgKzU4NiwyNSBAQCBzZXR1cF9maXhtYXA6Cj4gPj4gICAg
ICAgICAgIG1vdiAgIHBjLCBscgo+ID4+ICAgRU5EUFJPQyhzZXR1cF9maXhtYXApCj4gPj4gICAK
PiA+PiArLyoKPiA+PiArICogU2V0dXAgdGhlIGluaXRpYWwgc3RhY2sgYW5kIGp1bXAgdG8gdGhl
IEMgd29ybGQKPiA+PiArICoKPiA+PiArICogSW5wdXRzOgo+ID4+ICsgKiAgIHIwIDogQXJndW1l
bnQgMCBvZiB0aGUgQyBmdW5jdGlvbiB0byBjYWxsCj4gPj4gKyAqICAgcjEgOiBBcmd1bWVudCAx
IG9mIHRoZSBDIGZ1bmN0aW9uIHRvIGNhbGwKPiA+PiArICogICByMiA6IEMgZW50cnkgcG9pbnQK
PiA+PiArICoKPiA+PiArICogQ2xvYmJlcnMgcjMKPiA+PiArICovCj4gPj4gICBsYXVuY2g6Cj4g
Pj4gLSAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ID4+IC0KPiA+PiAtICAgICAgICBs
ZHIgICByMCwgPWluaXRfZGF0YQo+ID4+IC0gICAgICAgIGFkZCAgIHIwLCAjSU5JVElORk9fc3Rh
Y2sgICAgLyogRmluZCB0aGUgYm9vdC10aW1lIHN0YWNrICovCj4gPj4gLSAgICAgICAgbGRyICAg
c3AsIFtyMF0KPiA+PiArICAgICAgICBsZHIgICByMywgPWluaXRfZGF0YQo+ID4+ICsgICAgICAg
IGFkZCAgIHIzLCAjSU5JVElORk9fc3RhY2sgICAgLyogRmluZCB0aGUgYm9vdC10aW1lIHN0YWNr
ICovCj4gPj4gKyAgICAgICAgbGRyICAgc3AsIFtyM10KPiA+PiAgICAgICAgICAgYWRkICAgc3As
ICNTVEFDS19TSVpFICAgICAgICAvKiAod2hpY2ggZ3Jvd3MgZG93biBmcm9tIHRoZSB0b3ApLiAq
Lwo+ID4+ICAgICAgICAgICBzdWIgICBzcCwgI0NQVUlORk9fc2l6ZW9mICAgIC8qIE1ha2Ugcm9v
bSBmb3IgQ1BVIHNhdmUgcmVjb3JkICovCj4gPj4gLSAgICAgICAgdGVxICAgcjEyLCAjMAo+ID4+
IC0gICAgICAgIG1vdmVxIHIwLCByMTAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdzOiAt
IHBoeXNfb2Zmc2V0ICovCj4gPj4gLSAgICAgICAgbW92ZXEgcjEsIHI4ICAgICAgICAgICAgICAg
ICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3MgKi8KPiA+PiAtICAgICAgICBiZXEgICBz
dGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBD
ICovCj4gPj4gLSAgICAgICAgYiAgICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAvKiAodG8gdGhl
IGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAqLwo+ID4+ICsKPiA+PiArICAgICAgICAvKiBKdW1w
IHRvIEMgd29ybGQgKi8KPiA+PiArICAgICAgIGJ4ICAgIHIyCj4gPiAKPiA+IFdoeSBieD8KPiBU
aGUgb25seSB0d28gb3RoZXIgcG9zc2libGUgaW5zdHJ1Y3Rpb25zIHdvdWxkIGJlOgo+ICAgICAx
KSBibHggcjI6IHdlIGRvbid0IG5lZWQgdG8gc2F2ZSB0aGUgcmV0dXJuIGFkZHJlc3MKPiAgICAg
MikgbW92IHBjLCByMjogVGhlIEFybSBBcm0gcmVjb21tZW5kcyB0byB1c2UgYngvYmx4IGluc3Rl
YWQgb2YgdGhpcy4KPiAKPiBTbyBieCBzZWVtcyB0aGUgYmVzdCBmaXQuIEFueSBvdGhlciBzdWdn
ZXN0aW9uPwo+IAo+IEFsc28sIEkgd291bGQgcHJvYmFibHkgcmVwbGFjZSBhbGwgdGhlICJtb3Yg
cGMsIGxyIiBJIGFkZGVkIHdpdGggImJ4IGxyIi4KClRoZXJlIGlzIHJlYWxseSBubyBhbHRlcm5h
dGl2ZSB0byBieC4gSSBmb3Jnb3QgdGhhdCAiYiIgZG9lc24ndCBzdXBwb3J0CmEgcmVnaXN0ZXIg
YXMgYW4gb3BlcmFuZC4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
