Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D235AD8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:05:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTi4-0000xK-0G; Wed, 05 Jun 2019 11:04:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYTi2-0000xE-4g
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:03:58 +0000
X-Inumbo-ID: 9ca4c2ee-8781-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9ca4c2ee-8781-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 11:03:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5DC4374;
 Wed,  5 Jun 2019 04:03:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E81B23F690;
 Wed,  5 Jun 2019 04:03:53 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-14-julien.grall@arm.com>
 <5CF7A1090200007800235782@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8270ed07-74af-aeb2-40c9-3d218d09d51d@arm.com>
Date: Wed, 5 Jun 2019 12:03:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF7A1090200007800235782@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKU29ycnksIEkgc2VlbSB0byBoYXZlIG1pc3NlZCB0aGUgY29tbWVudHMgb24gdGhp
cyBwYXRjaCB3aGlsZSByZXNwaW5uaW5nIHRoZSBzZXJpZXMuCgpJIHdpbGwgbG9vayBhdCBpdCBh
bmQgYWRkcmVzcyB0aGVtIGluIHY0LgoKQ2hlZXJzLAoKT24gMDUvMDYvMjAxOSAxMjowMSwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQgMTg6MDMsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+PiAr
KysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4gQEAgLTE4NCw3ICsxODQsOCBAQCB2
b2lkIHZjcHVfc2hvd19yZWdpc3RlcnMoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4+ICAgCj4+ICAg
dm9pZCBzaG93X3BhZ2Vfd2Fsayh1bnNpZ25lZCBsb25nIGFkZHIpCj4+ICAgewo+PiAtICAgIHVu
c2lnbmVkIGxvbmcgcGZuLCBtZm4gPSByZWFkX2NyMygpID4+IFBBR0VfU0hJRlQ7Cj4+ICsgICAg
dW5zaWduZWQgbG9uZyBwZm47Cj4+ICsgICAgbWZuX3QgbWZuID0gbWFkZHJfdG9fbWZuKHJlYWRf
Y3IzKCkpOwo+IAo+IFF1b3RpbmcgbXkgdjEgY29tbWVudDoKPiAKPiAiSSByZWFsaXplIHlvdSBz
aW1wbHkgdGFrZSB3aGF0IGhhcyBiZWVuIHRoZXJlIGFuZCB0cmFuc2Zvcm0gaXQsIGJ1dAo+ICAg
bWFkZHJfdG9fbWZuKCkgKG90aGVyIHRoYW4gc2hpZnRpbmcgYnkgUEFHRV9TSElGVCkgaXMgbm90
IHRydWx5Cj4gICBhcHBsaWNhYmxlIGhlcmU6IFdoYXQgdGhlIENSMyByZWdpc3RlciBob2xkcyBp
cyBub3QgYSBwaHlzaWNhbCBhZGRyZXNzLAo+ICAgYm90aCB0aGUgbG93IHR3ZWx2ZSBiaXRzIGFz
IHdlbGwgYXMgdGhlIGhpZ2ggdHdlbHZlIG9uZXMgaGF2ZSBkaWZmZXJlbnQKPiAgIG1lYW5pbmcu
IFRoZSBzaGlmdCBpcyBjb3JyZWN0IGN1cnJlbnRseSBiZWNhdXNlIHRoZSBoaWdoIG9uZXMgYXJl
Cj4gICAocmlnaHQgbm93KSB6ZXJvIG9uIHJlYWRzLiBQbGVhc2UgY29uc2lkZXIgQU5ELWluZyB3
aXRoCj4gICBYODZfQ1IzX0FERFJfTUFTSyAob3Iga2VlcGluZyB0aGUgc2hpZnQpLiIKPiAKPiBG
T0FEIGJ5ICJwbGVhc2UgY29uc2lkZXIiIEkgZG9uJ3QgbWVhbiAibGVhdmUgaXQgYXMgaXMgd2ls
bCBiZSBmaW5lIGFzCj4gd2VsbCIsIGJ1dCB0byBkbyBvbmUgb2YgdGhlIHR3byBwb3NzaWJsZSBj
aGFuZ2VzLCB3aXRoIGEgcHJlZmVyZW5jZQo+IHRvd2FyZHMgdGhlIEFORC1pbmcsIGFzIHRoYXQn
cyB0aGUgdWx0aW1hdGVseSBjb3JyZWN0IGFwcHJvYWNoLgo+IAo+PiAtLS0gYS94ZW4vY29tbW9u
L3BhZ2VfYWxsb2MuYwo+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiBAQCAtMTQx
Niw3ICsxNDE2LDcgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2VzKAo+PiAgIAo+PiAgICAg
ICAgICAgLyogVGhpcyBwYWdlIGlzIG5vdCBhIGd1ZXN0IGZyYW1lIGFueSBtb3JlLiAqLwo+PiAg
ICAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ldLCBOVUxMKTsgLyogc2V0X2dwZm5fZnJvbV9t
Zm4gc25vb3BzIHBnIG93bmVyICovCj4+IC0gICAgICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94
KG1mbikgKyBpLCBJTlZBTElEX00yUF9FTlRSWSk7Cj4+ICsgICAgICAgIHNldF9wZm5fZnJvbV9t
Zm4obWZuX2FkZChtZm4sICsgaSksIElOVkFMSURfTTJQX0VOVFJZKTsKPiAKPiBRdW90aW5nIG15
IHYxIGNvbW1lbnQgYWdhaW46ICJTdHJheSBsZWZ0b3ZlciArID8iCj4gCj4+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvbW0uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4g
QEAgLTQ5MiwyMiArNDkyLDI2IEBAIGV4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9t
X2lvLCAqZG9tX2NvdzsJLyogZm9yIHZtY29yZWluZm8gKi8KPj4gICAgKi8KPj4gICBleHRlcm4g
Ym9vbCBtYWNoaW5lX3RvX3BoeXNfbWFwcGluZ192YWxpZDsKPj4gICAKPj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBzZXRfZ3Bmbl9mcm9tX21mbih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9u
ZyBwZm4pCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3Bmbl9mcm9tX21mbihtZm5fdCBtZm4s
IHVuc2lnbmVkIGxvbmcgcGZuKQo+PiAgIHsKPj4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGFn
ZV9nZXRfb3duZXIobWZuX3RvX3BhZ2UoX21mbihtZm4pKSk7Cj4+ICsgICAgY29uc3QgdW5zaWdu
ZWQgbG9uZyBtZm5fID0gbWZuX3gobWZuKTsKPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGFn
ZV9nZXRfb3duZXIobWZuX3RvX3BhZ2UobWZuKSk7Cj4gCj4gY29uc3Q/IChPciBpcyB0aGlzIGEg
cGxhY2Ugd2hlcmUgSSd2ZSBzaW1pbGFybHkgYXNrZWQgb24gYW4gZWFybGllcgo+IHBhdGNoIGFs
cmVhZHk/KQo+IAo+IEJ0dywgdGhlIGNoZWFwZXIgKGluIHRlcm1zIG9mIGNvZGUgY2h1cm4pIGNo
YW5nZSBoZXJlIHdvdWxkIHNlZW0gdG8KPiBiZSB0byBuYW1lIHRoZSBmdW5jdGlvbiBwYXJhbWV0
ZXIgbWZuXywgYW5kIHRoZSBsb2NhbCB2YXJpYWJsZSBtZm4uCj4gVGhhdCdsbCBhbHNvIHJlZHVj
ZSB0aGUgbnVtYmVyIG9mIHVzZXMgb2YgdGhlIHVuZm9ydHVuYXRlIHRyYWlsaW5nLQo+IHVuZGVy
c2NvcmUtbmFtZS4KPiAKPiBKYW4KPiAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
