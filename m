Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B0C9036
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiiY-0003UM-Oy; Wed, 02 Oct 2019 17:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFiiX-0003U6-Kp
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:47:13 +0000
X-Inumbo-ID: aa4535c8-e53c-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id aa4535c8-e53c-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 17:47:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B78841000;
 Wed,  2 Oct 2019 10:47:12 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA033F706;
 Wed,  2 Oct 2019 10:47:11 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190921100836.21396-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d1fd0a4a-f238-f833-c1d5-3f490eaaebc4@arm.com>
Date: Wed, 2 Oct 2019 18:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921100836.21396-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot
 pagetables before bringing-up each secondary CPU
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VudGxlIHBpbmcuCgpPbiA5LzIxLzE5IDExOjA4IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
QXQgdGhlIG1vbWVudCwgYm9vdCBwYWdldGFibGVzIGFyZSBvbmx5IGNsZWFyZWQgb25jZSBhdCBi
b290LiBUaGlzIG1lYW5zCj4gd2hlbiBib290aW5nIENQVTIgKGFuZCBvbndhcmRzKSB0aGVuIGJv
b3QgcGFnZXRhYmxlcyB3aWxsIG5vdCBiZQo+IGNsZWFyZWQuCj4gCj4gVG8ga2VlcCB0aGUgaW50
ZXJmYWNlIGV4YWN0bHkgdGhlIHNhbWUgZm9yIGFsbCBzZWNvbmRhcnkgQ1BVLCB0aGUgYm9vdAo+
IHBhZ2V0YWJsZXMgYXJlIG5vdyBjbGVhcmVkIGJlZm9yZSBicmluZ2luZy11cCBlYWNoIHNlY29u
ZGFyeSBDUFUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9tbS5jIHwgMjcgKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9h
cm0vbW0uYwo+IGluZGV4IDExMjlkYzI4YzguLmUxNGVlNzZmZjggMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC03MDQsOCArNzA0
LDIwIEBAIHZvaWQgX19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3Bo
eXNfb2Zmc2V0KQo+ICAgCj4gICAgICAgc3dpdGNoX3R0YnIodHRicik7Cj4gICAKPiAtICAgIC8q
IENsZWFyIHRoZSBjb3B5IG9mIHRoZSBib290IHBhZ2V0YWJsZXMuIEVhY2ggc2Vjb25kYXJ5IENQ
VQo+IC0gICAgICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUgaGVhZC5TKSAqLwo+ICsgICAg
eGVuX3B0X2VuZm9yY2Vfd254KCk7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX0FSTV8zMgo+ICsgICAg
cGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkgPSBjcHUwX3BndGFibGU7Cj4gKyAgICBwZXJfY3B1KHhl
bl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7Cj4gKyNlbmRpZgo+ICt9Cj4gKwo+ICtzdGF0aWMg
dm9pZCBjbGVhcl9ib290X3BhZ2V0YWJsZXModm9pZCkKPiArewo+ICsgICAgLyoKPiArICAgICAq
IENsZWFyIHRoZSBjb3B5IG9mIHRoZSBib290IHBhZ2V0YWJsZXMuIEVhY2ggc2Vjb25kYXJ5IENQ
VQo+ICsgICAgICogcmVidWlsZHMgdGhlc2UgaXRzZWxmIChzZWUgaGVhZC5TKQo+ICsgICAgICov
Cj4gICAgICAgY2xlYXJfdGFibGUoYm9vdF9wZ3RhYmxlKTsKPiAgICNpZmRlZiBDT05GSUdfQVJN
XzY0Cj4gICAgICAgY2xlYXJfdGFibGUoYm9vdF9maXJzdCk7Cj4gQEAgLTcxMywxOCArNzI1LDEz
IEBAIHZvaWQgX19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNf
b2Zmc2V0KQo+ICAgI2VuZGlmCj4gICAgICAgY2xlYXJfdGFibGUoYm9vdF9zZWNvbmQpOwo+ICAg
ICAgIGNsZWFyX3RhYmxlKGJvb3RfdGhpcmQpOwo+IC0KPiAtICAgIHhlbl9wdF9lbmZvcmNlX3du
eCgpOwo+IC0KPiAtI2lmZGVmIENPTkZJR19BUk1fMzIKPiAtICAgIHBlcl9jcHUoeGVuX3BndGFi
bGUsIDApID0gY3B1MF9wZ3RhYmxlOwo+IC0gICAgcGVyX2NwdSh4ZW5fZG9tbWFwLCAwKSA9IGNw
dTBfZG9tbWFwOwo+IC0jZW5kaWYKPiAgIH0KPiAgIAo+ICAgI2lmZGVmIENPTkZJR19BUk1fNjQK
PiAgIGludCBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzKGludCBjcHUpCj4gICB7Cj4gKyAgICBj
bGVhcl9ib290X3BhZ2V0YWJsZXMoKTsKPiArCj4gICAgICAgLyogU2V0IGluaXRfdHRiciBmb3Ig
dGhpcyBDUFUgY29taW5nIHVwLiBBbGwgQ1B1cyBzaGFyZSBhIHNpbmdsZSBzZXRvZgo+ICAgICAg
ICAqIHBhZ2V0YWJsZXMsIGJ1dCByZXdyaXRlIGl0IGVhY2ggdGltZSBmb3IgY29uc2lzdGVuY3kg
d2l0aCAzMiBiaXQuICovCj4gICAgICAgaW5pdF90dGJyID0gKHVpbnRwdHJfdCkgeGVuX3BndGFi
bGUgKyBwaHlzX29mZnNldDsKPiBAQCAtNzY3LDYgKzc3NCw4IEBAIGludCBpbml0X3NlY29uZGFy
eV9wYWdldGFibGVzKGludCBjcHUpCj4gICAgICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgY3B1KSA9
IGZpcnN0Owo+ICAgICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwgY3B1KSA9IGRvbWhlYXA7Cj4gICAK
PiArICAgIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpOwo+ICsKPiAgICAgICAvKiBTZXQgaW5pdF90
dGJyIGZvciB0aGlzIENQVSBjb21pbmcgdXAgKi8KPiAgICAgICBpbml0X3R0YnIgPSBfX3BhKGZp
cnN0KTsKPiAgICAgICBjbGVhbl9kY2FjaGUoaW5pdF90dGJyKTsKPiAKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
