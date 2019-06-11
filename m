Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD93D5A4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haldr-0005JU-2W; Tue, 11 Jun 2019 18:37:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1haldp-0005JP-1i
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:37:05 +0000
X-Inumbo-ID: e809ba95-8c77-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e809ba95-8c77-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:37:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC3112173E;
 Tue, 11 Jun 2019 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560278223;
 bh=3GPPWiz6Mno5Qx1O90TlnTYiDBAbNwVwvxmnjPnzCy8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Pbi5cms+/0xPf3Yu8WNvteobBASU628ti9yeOI9HrvHPUUOkB3wIX37Swia9jMTHJ
 SXhnqqApJO1wPRFXz+9eNV5eTiBzE9tS8Kvy1fUmOqCzu0lyEhjqEJQQmhwJ7HmUOA
 DLgMCGObQJq2pxTPwhfvTEkvhEZvXOm4WSUZMFe8=
Date: Tue, 11 Jun 2019 11:37:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-5-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-5-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 04/12] xen/arm: mm: Only
 increment mfn when valid in xen_pt_update
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
IE1GTiB3aWxsIGJlIGluY3JlbWVudGVkIGV2ZW4gaWYgaXQgaXMgaW52YWxpZC4gVGhpcyB3aWxs
Cj4gcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0IGl0ZXJhdGlvbi4K
PiAKPiBXaGlsZSB0aGlzIGlzIG5vdCBhIG1ham9yIHByb2JsZW0gdG9kYXksIHRoaXMgd2lsbCBi
ZSBpbiB0aGUgZnV0dXJlIGlmCj4gdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZOIGF0IGV2
ZXJ5IGl0ZXJhdGlvbi4KPiAKPiBTdWNoIGJlaGF2aW9yIGlzIHByZXZlbnRlZCBieSBhdm9pZGlu
ZyB0byBpbmNyZW1lbnQgYW4gaW52YWxpZCBNRk4uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNv
diA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoK
PiAgICAgICAgIC0gTW92ZSB0aGUgcGF0Y2ggZWFybGllciBvbiBpbiB0aGUgc2VyaWVzCj4gICAg
ICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vbW0u
YyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9t
bS5jCj4gaW5kZXggZjk1NmFhNjM5OS4uOWRlMmExMTUwZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC9hcm0vbW0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTEwNTEsMTEgKzEwNTEs
MTQgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwK
PiAgCj4gICAgICBzcGluX2xvY2soJnhlbl9wdF9sb2NrKTsKPiAgCj4gLSAgICBmb3IoOyBhZGRy
IDwgYWRkcl9lbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCBtZm4gPSBtZm5fYWRkKG1mbiwgMSkpCj4g
KyAgICBmb3IoIDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSApCj4gICAgICB7
Cj4gICAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5KG9wLCBhZGRyLCBtZm4sIGZsYWdz
KTsKPiAgICAgICAgICBpZiAoIHJjICkKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAg
ICAgIGlmICggIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCj4gKyAgICAgICAgICAgIG1mbiA9
IG1mbl9hZGQobWZuLCAxKTsKPiAgICAgIH0KClRoaXMgaXMgT0sgYnV0IGdvdCBtZSB0aGlua2lu
Zzogc2hvdWxkIHdlIGJlIHVwZGF0aW5nIHRoZSBtZm4gaW4gbWZuX2FkZAppZiB0aGUgbWZuIGlz
IElOVkFMSUQ/IFRoZSBtZm5fZXEobWZuLCBJTlZBTElEX01GTikgY291bGQgbGl2ZSBpbnNpZGUK
dGhlIHN0YXRpYyBpbmxpbmUgbWZuX3QgbWZuX2FkZCBmdW5jdGlvbi4gV2hhdCBkbyB5b3UgdGhp
bms/IEkgZG9uJ3QKdGhpbmsgdGhlcmUgYXJlIGFueSB2YWxpZCBzY2VuYXJpb3Mgd2hlcmUgd2Ug
d2FudCB0byBpbmNyZW1lbnQKSU5WQUxJRF9NRk4uLi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
