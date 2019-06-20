Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F204D312
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 18:13:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdzeE-0002Ki-6U; Thu, 20 Jun 2019 16:10:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uuy3=UT=linux.intel.com=alexander.h.duyck@srs-us1.protection.inumbo.net>)
 id 1hdzeC-0002KY-0G
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 16:10:48 +0000
X-Inumbo-ID: f59d984f-9375-11e9-8980-bc764e045a96
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f59d984f-9375-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 16:10:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 09:10:45 -0700
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="150979509"
Received: from ahduyck-desk1.jf.intel.com ([10.7.198.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 09:10:44 -0700
Message-ID: <2299c1a5b8773c955e7d0c3803ad3fc6c83c127a.camel@linux.intel.com>
From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2019 09:10:44 -0700
In-Reply-To: <20190620160821.4210-1-jgross@suse.com>
References: <20190620160821.4210-1-jgross@suse.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] mm: fix regression with deferred struct
 page init
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA2LTIwIGF0IDE4OjA4ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
IENvbW1pdCAwZTU2YWNhZTRiNGRkNGE5ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BB
R0VTIGF0IGEgdGltZQo+IGluc3RlYWQgb2YgZG9pbmcgbGFyZ2VyIHNlY3Rpb25zIikgaXMgY2F1
c2luZyBhIHJlZ3Jlc3Npb24gb24gc29tZQo+IHN5c3RlbXMgd2hlbiB0aGUga2VybmVsIGlzIGJv
b3RlZCBhcyBYZW4gZG9tMC4KPiAKPiBUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5
IGJvb3QuCj4gCj4gUmVhc29uIGlzIGFuIGVuZGxlc3MgbG9vcCBpbiBnZXRfcGFnZV9mcm9tX2Zy
ZWVsaXN0KCkgaW4gY2FzZSB0aGUgZmlyc3QKPiB6b25lIGxvb2tlZCBhdCBoYXMgbm8gZnJlZSBt
ZW1vcnkuIGRlZmVycmVkX2dyb3dfem9uZSgpIGlzIGFsd2F5cwo+IHJldHVybmluZyB0cnVlIGR1
ZSB0byB0aGUgZm9sbG93aW5nIGNvZGUgc25pcHBsZXQ6Cj4gCj4gICAvKiBJZiB0aGUgem9uZSBp
cyBlbXB0eSBzb21lYm9keSBlbHNlIG1heSBoYXZlIGNsZWFyZWQgb3V0IHRoZSB6b25lICovCj4g
ICBpZiAoIWRlZmVycmVkX2luaXRfbWVtX3Bmbl9yYW5nZV9pbl96b25lKCZpLCB6b25lLCAmc3Bm
biwgJmVwZm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZp
cnN0X2RlZmVycmVkX3BmbikpIHsKPiAgICAgICAgICAgcGdkYXQtPmZpcnN0X2RlZmVycmVkX3Bm
biA9IFVMT05HX01BWDsKPiAgICAgICAgICAgcGdkYXRfcmVzaXplX3VubG9jayhwZ2RhdCwgJmZs
YWdzKTsKPiAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gICB9Cj4gCj4gVGhpcyBpbiB0dXJuIHJl
c3VsdHMgaW4gdGhlIGxvb3AgYXMgZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGlzCj4gYXNzdW1p
bmcgZm9yd2FyZCBwcm9ncmVzcyBjYW4gYmUgbWFkZSBieSBkb2luZyBzb21lIG1vcmUgc3RydWN0
IHBhZ2UKPiBpbml0aWFsaXphdGlvbi4KPiAKPiBDYzogQWxleGFuZGVyIER1eWNrIDxhbGV4YW5k
ZXIuaC5kdXlja0BsaW51eC5pbnRlbC5jb20+Cj4gRml4ZXM6IDBlNTZhY2FlNGI0ZGQ0YTkgKCJt
bTogaW5pdGlhbGl6ZSBNQVhfT1JERVJfTlJfUEFHRVMgYXQgYSB0aW1lIGluc3RlYWQgb2YgZG9p
bmcgbGFyZ2VyIHNlY3Rpb25zIikKPiBTdWdnZXN0ZWQtYnk6IEFsZXhhbmRlciBEdXljayA8YWxl
eGFuZGVyLmguZHV5Y2tAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbGV4YW5kZXIgRHV5Y2sgPGFsZXhh
bmRlci5oLmR1eWNrQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIG1tL3BhZ2VfYWxsb2MuYyB8
IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5k
ZXggZDY2YmM4YWJlMGFmLi44ZTNiYzk0OWViY2MgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxv
Yy5jCj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAgLTE4MjYsNyArMTgyNiw4IEBAIGRlZmVy
cmVkX2dyb3dfem9uZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgaW50IG9yZGVyKQo+ICAJ
CQkJCQkgZmlyc3RfZGVmZXJyZWRfcGZuKSkgewo+ICAJCXBnZGF0LT5maXJzdF9kZWZlcnJlZF9w
Zm4gPSBVTE9OR19NQVg7Cj4gIAkJcGdkYXRfcmVzaXplX3VubG9jayhwZ2RhdCwgJmZsYWdzKTsK
PiAtCQlyZXR1cm4gdHJ1ZTsKPiArCQkvKiBSZXRyeSBvbmx5IG9uY2UuICovCj4gKwkJcmV0dXJu
IGZpcnN0X2RlZmVycmVkX3BmbiAhPSBVTE9OR19NQVg7Cj4gIAl9Cj4gIAo+ICAJLyoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
