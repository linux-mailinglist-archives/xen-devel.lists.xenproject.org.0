Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F0431A9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 00:28:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbBgv-00050h-Ad; Wed, 12 Jun 2019 22:26:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbBgt-00050c-CB
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 22:25:59 +0000
X-Inumbo-ID: 0cd36590-8d61-11e9-9305-57ebfd6e25fe
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd36590-8d61-11e9-9305-57ebfd6e25fe;
 Wed, 12 Jun 2019 22:25:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55D3B208C2;
 Wed, 12 Jun 2019 22:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560378357;
 bh=ncJtwi71EOXQ17W9zI0zQQucGt7ntYA79YT78jA1Gy4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KqBQK6+qrjy15RW+2xwJXov9r6uuworvrZJz3aAAdrfoo6KHNzbbDYknYb6Vj9VzD
 /iV4u6LHZTgKNA1r8V/oiU6G1zF4JvxUPp7/J5AycYFok0Zd19hbSE0yu2xo0OvxRK
 vbe0stCOBV7uOTP+ke5C5PXdlzayg376Y0BnbdmQ=
Date: Wed, 12 Jun 2019 15:25:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-10-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906121523550.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-10-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 09/12] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgdGhl
IHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgM3JkIGxldmVsIHBhZ2UtdGFibGVzIGlzIG9idGFpbmVk
Cj4gdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBPbiBBcm0zMiwgbWZuX3RvX3ZpcnQgY2FuIG9u
bHkgd29yayBvbiB4ZW5oZWFwIHBhZ2UuIFdoaWxlIGluIHByYWN0aWNlCj4gYWxsIHRoZSBwYWdl
LXRhYmxlcyB1cGRhdGVkIHdpbGwgcmVzaWRlIGluIHhlbmhlYXAsIGluIHByYWN0aXZlIHRoZQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4g
aW4gdGhlb3J5ID8KCgo+IHBhZ2UtdGFibGVzIGNvdmVyaW5nIFhlbiBtZW1vcnkgKGUuZyB4ZW5f
bWFwcGluZykgaXMgcGFydCBvZiBYZW4gYmluYXJ5Lgo+IAo+IEZ1cnRoZXJtb3JlLCBhIGZvbGxv
dy11cCBjaGFuZ2Ugd2lsbCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCj4gd2FsayBh
bGwgdGhlIGxldmVscyBhbmQgdGhlcmVmb3JlIGJlIG1vcmUgZ2VuZXJpYy4gU29tZSBvZiB0aGUK
PiBwYWdlLXRhYmxlcyB3aWxsIGFsc28gcGFydCBvZiBYZW4gbWVtb3J5IGFuZCB0aGVyZWZvcmUg
d2lsbCBub3QgYmUKPiByZWFjaGFibGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBUaGUgZWFz
aWVzdCB3YXkgdG8gcmVhY2ggdGhvc2UgcGFnZXMgaXMgdG8gdXNlIHssIHVufW1hcF9kb21haW5f
cGFnZSgpLgo+IFdoaWxlIG9uIGFybTMyIHRoaXMgbWVhbnMgYW4gZXh0cmEgbWFwcGluZyBpbiB0
aGUgbm9ybWFsIGNhc2VzLCB0aGlzIGlzIG5vdAo+IHZlcnkgaW1wb3J0YW50IGFzIHhlbiBwYWdl
LXRhYmxlcyBhcmUgbm90IHVwZGF0ZWQgb2Z0ZW4uCj4gCj4gSW4gb3JkZXIgdG8gYWxsb3cgZnV0
dXJlIGNoYW5nZSBpbiB0aGUgd2F5IFhlbiBwYWdlLXRhYmxlcyBhcmUgbWFwcGVkLAo+IHR3byBu
ZXcgaGVscGVycyBhcmUgaW50cm9kdWNlZCB0byBtYXAvdW5tYXAgdGhlIHBhZ2UtdGFibGVzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cgphc2lk
ZSBmcm9tIHRoZSB0eXBvIGFib3ZlOgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+IAo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAg
ICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL21t
LmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4IDY1MWUyOTYwNDEuLmY1OTc5ZjU0
OWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0v
bW0uYwo+IEBAIC05NzQsNiArOTc0LDE2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJsZShs
cGFlX3QgKmVudHJ5KQo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBscGFlX3Qg
Knhlbl9tYXBfdGFibGUobWZuX3QgbWZuKQo+ICt7Cj4gKyAgICByZXR1cm4gbWFwX2RvbWFpbl9w
YWdlKG1mbik7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHhlbl91bm1hcF90YWJsZShjb25zdCBs
cGFlX3QgKnRhYmxlKQo+ICt7Cj4gKyAgICB1bm1hcF9kb21haW5fcGFnZSh0YWJsZSk7Cj4gK30K
PiArCj4gIC8qIFNhbml0eSBjaGVjayBvZiB0aGUgZW50cnkgKi8KPiAgc3RhdGljIGJvb2wgeGVu
X3B0X2NoZWNrX2VudHJ5KGxwYWVfdCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxh
Z3MpCj4gIHsKPiBAQCAtMTAzNiw2ICsxMDQ2LDcgQEAgc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNr
X2VudHJ5KGxwYWVfdCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIHN0
YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1m
biwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykK
PiAgewo+ICsgICAgaW50IHJjOwo+ICAgICAgbHBhZV90IHB0ZSwgKmVudHJ5Owo+ICAgICAgbHBh
ZV90ICp0aGlyZCA9IE5VTEw7Cj4gIAo+IEBAIC0xMDU0LDE1ICsxMDY1LDE3IEBAIHN0YXRpYyBp
bnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKPiAg
Cj4gICAgICBCVUdfT04oIWxwYWVfaXNfdmFsaWQoKmVudHJ5KSk7Cj4gIAo+IC0gICAgdGhpcmQg
PSBtZm5fdG9fdmlydChscGFlX2dldF9tZm4oKmVudHJ5KSk7Cj4gKyAgICB0aGlyZCA9IHhlbl9t
YXBfdGFibGUobHBhZV9nZXRfbWZuKCplbnRyeSkpOwo+ICAgICAgZW50cnkgPSAmdGhpcmRbdGhp
cmRfdGFibGVfb2Zmc2V0KGFkZHIpXTsKPiAgCj4gKyAgICByYyA9IC1FSU5WQUw7Cj4gICAgICBp
ZiAoICF4ZW5fcHRfY2hlY2tfZW50cnkoKmVudHJ5LCBtZm4sIGZsYWdzKSApCj4gLSAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgZ290byBvdXQ7Cj4gIAo+ICAgICAgLyogSWYgd2Ug
YXJlIG9ubHkgcG9wdWxhdGluZyBwYWdlLXRhYmxlLCB0aGVuIHdlIGFyZSBkb25lLiAqLwo+ICsg
ICAgcmMgPSAwOwo+ICAgICAgaWYgKCBmbGFncyAmIF9QQUdFX1BPUFVMQVRFICkKPiAtICAgICAg
ICByZXR1cm4gMDsKPiArICAgICAgICBnb3RvIG91dDsKPiAgCj4gICAgICAvKiBXZSBhcmUgcmVt
b3ZpbmcgdGhlIHBhZ2UgKi8KPiAgICAgIGlmICggIShmbGFncyAmIF9QQUdFX1BSRVNFTlQpICkK
PiBAQCAtMTA4Nyw3ICsxMTAwLDEyIEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeSh1
bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IG1mbiwKPiAgCj4gICAgICB3cml0ZV9wdGUoZW50cnks
IHB0ZSk7Cj4gIAo+IC0gICAgcmV0dXJuIDA7Cj4gKyAgICByYyA9IDA7Cj4gKwo+ICtvdXQ6Cj4g
KyAgICB4ZW5fdW5tYXBfdGFibGUodGhpcmQpOwo+ICsKPiArICAgIHJldHVybiByYzsKPiAgfQo+
ICAKPiAgc3RhdGljIERFRklORV9TUElOTE9DSyh4ZW5fcHRfbG9jayk7Cj4gLS0gCj4gMi4xMS4w
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
