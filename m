Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C7C3D574
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:25:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halQc-00043F-Ou; Tue, 11 Jun 2019 18:23:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Cq/=UK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1halQb-000432-20
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:23:25 +0000
X-Inumbo-ID: ff93cb68-8c75-11e9-b2e1-637aef64c57d
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff93cb68-8c75-11e9-b2e1-637aef64c57d;
 Tue, 11 Jun 2019 18:23:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCDE920866;
 Tue, 11 Jun 2019 18:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560277403;
 bh=8rTcK4hoGpSxWZg2da6NhWdHDcYIO4I+HnZEuzQ50J4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tEQkvYxpoASAZCuVpoh0eB+QRNMc2nGL9mVO9jqI2RH2mlNSmwD7euD6xupYKm4XE
 R4XriPVcu2qxWzdFa0sX9O6t3uck7+cI+S2eNvTf0eMg6uBa7sRjP44nMijjbJC27Y
 m6HPb6PrP9e39mLQ1iBszKU+/cR1GND3MpGQNDcM=
Date: Tue, 11 Jun 2019 11:23:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-3-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906111123070.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-3-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 02/12] xen/arm: mm: Rename
 create_xen_entries() to xen_pt_update()
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGNyZWF0ZV94ZW5fZW50
cmllcygpIGlzIGRvaW5nIG1vcmUgdGhhbiBjcmVhdGluZyBlbnRyaWVzLiBJdCBjYW4gYWxzbwo+
IG1vZGlmeSBhbmQgcmVtb3ZlIGVudHJpZXMuCj4gCj4gUmVuYW1lIHRoZSBmdW5jdGlvbiB0byBt
YWtlIGNsZWFyIHdoYXQgdGhlIGZ1bmN0aW9uIGlzIGFjdHVhbGx5IGRvaW5nLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpBY2tlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgICAgQ2hh
bmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4g
IHhlbi9hcmNoL2FybS9tbS5jIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4IGI0MDhkZTdjNzUu
LjM2ZTIyZmM5YWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiArKysgYi94ZW4v
YXJjaC9hcm0vbW0uYwo+IEBAIC05NzAsMTEgKzk3MCwxMSBAQCBlbnVtIHhlbm1hcF9vcGVyYXRp
b24gewo+ICAKPiAgc3RhdGljIERFRklORV9TUElOTE9DSyh4ZW5fcHRfbG9jayk7Cj4gIAo+IC1z
dGF0aWMgaW50IGNyZWF0ZV94ZW5fZW50cmllcyhlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlydCwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKPiArc3RhdGljIGludCB4ZW5fcHRfdXBk
YXRlKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdmlydCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1m
biwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZucywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKPiAgewo+ICAgICAg
aW50IHJjID0gMDsKPiAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9IHZpcnQsIGFkZHJfZW5kID0g
YWRkciArIG5yX21mbnMgKiBQQUdFX1NJWkU7Cj4gQEAgLTEwNjcsMjUgKzEwNjcsMjQgQEAgaW50
IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAo+ICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMsCj4gICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBmbGFncykKPiAgewo+IC0gICAgcmV0dXJuIGNyZWF0ZV94ZW5fZW50cmllcyhJTlNF
UlQsIHZpcnQsIG1mbiwgbnJfbWZucywgZmxhZ3MpOwo+ICsgICAgcmV0dXJuIHhlbl9wdF91cGRh
dGUoSU5TRVJULCB2aXJ0LCBtZm4sIG5yX21mbnMsIGZsYWdzKTsKPiAgfQo+ICAKPiAgaW50IHBv
cHVsYXRlX3B0X3JhbmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWduZWQgbG9uZyBucl9tZm5z
KQo+ICB7Cj4gLSAgICByZXR1cm4gY3JlYXRlX3hlbl9lbnRyaWVzKFJFU0VSVkUsIHZpcnQsIElO
VkFMSURfTUZOLCBucl9tZm5zLCAwKTsKPiArICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFU0VS
VkUsIHZpcnQsIElOVkFMSURfTUZOLCBucl9tZm5zLCAwKTsKPiAgfQo+ICAKPiAgaW50IGRlc3Ry
b3lfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgdiwgdW5zaWduZWQgbG9uZyBlKQo+ICB7Cj4g
ICAgICBBU1NFUlQodiA8PSBlKTsKPiAtICAgIHJldHVybiBjcmVhdGVfeGVuX2VudHJpZXMoUkVN
T1ZFLCB2LCBJTlZBTElEX01GTiwgKGUgLSB2KSA+PiBQQUdFX1NISUZULCAwKTsKPiArICAgIHJl
dHVybiB4ZW5fcHRfdXBkYXRlKFJFTU9WRSwgdiwgSU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFH
RV9TSElGVCwgMCk7Cj4gIH0KPiAgCj4gIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVk
IGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIHsKPiAgICAg
IEFTU0VSVChzIDw9IGUpOwo+IC0gICAgcmV0dXJuIGNyZWF0ZV94ZW5fZW50cmllcyhNT0RJRlks
IHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0VfU0hJRlQsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZsYWdzKTsKPiArICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKE1PRElG
WSwgcywgSU5WQUxJRF9NRk4sIChlIC0gcykgPj4gUEFHRV9TSElGVCwgZmxhZ3MpOwo+ICB9Cj4g
IAo+ICBlbnVtIG1nIHsgbWdfY2xlYXIsIG1nX3JvLCBtZ19ydywgbWdfcnggfTsKPiAtLSAKPiAy
LjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
