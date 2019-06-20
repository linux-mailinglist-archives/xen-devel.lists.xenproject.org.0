Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059534D20A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 17:23:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdyrN-0005rn-Re; Thu, 20 Jun 2019 15:20:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uuy3=UT=linux.intel.com=alexander.h.duyck@srs-us1.protection.inumbo.net>)
 id 1hdyom-0005Fy-Hg
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 15:17:40 +0000
X-Inumbo-ID: 88a4b8b4-936e-11e9-be31-43d9ea18c2fc
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88a4b8b4-936e-11e9-be31-43d9ea18c2fc;
 Thu, 20 Jun 2019 15:17:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 08:17:35 -0700
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="154144455"
Received: from ahduyck-desk1.jf.intel.com ([10.7.198.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 08:17:35 -0700
Message-ID: <d11cf6a9ac9f2f21b6102464bf80925ada02bc78.camel@linux.intel.com>
From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2019 08:17:35 -0700
In-Reply-To: <20190620094015.21206-1-jgross@suse.com>
References: <20190620094015.21206-1-jgross@suse.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Jun 2019 15:20:20 +0000
Subject: Re: [Xen-devel] [PATCH RFC] mm: fix regression with deferred struct
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

T24gVGh1LCAyMDE5LTA2LTIwIGF0IDExOjQwICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
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
IHBhZ2UKPiBpbml0aWFsaXphdGlvbi4KPiAKPiBGaXhlczogMGU1NmFjYWU0YjRkZDRhOSAoIm1t
OiBpbml0aWFsaXplIE1BWF9PUkRFUl9OUl9QQUdFUyBhdCBhIHRpbWUgaW5zdGVhZCBvZiBkb2lu
ZyBsYXJnZXIgc2VjdGlvbnMiKQo+IC0tLQo+IFRoaXMgcGF0Y2ggbWFrZXMgbXkgc3lzdGVtIGJv
b3QgYWdhaW4gYXMgWGVuIGRvbTAsIGJ1dCBJJ20gbm90IHJlYWxseQo+IHN1cmUgaXQgaXMgdGhl
IGNvcnJlY3Qgd2F5IHRvIGRvIGl0LCBoZW5jZSB0aGUgUkZDLgo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgbW0vcGFnZV9hbGxvYy5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5kZXgg
ZDY2YmM4YWJlMGFmLi42ZWU3NTRiNWNkOTIgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5j
Cj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAgLTE4MjYsNyArMTgyNiw3IEBAIGRlZmVycmVk
X2dyb3dfem9uZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgaW50IG9yZGVyKQo+ICAJCQkJ
CQkgZmlyc3RfZGVmZXJyZWRfcGZuKSkgewo+ICAJCXBnZGF0LT5maXJzdF9kZWZlcnJlZF9wZm4g
PSBVTE9OR19NQVg7Cj4gIAkJcGdkYXRfcmVzaXplX3VubG9jayhwZ2RhdCwgJmZsYWdzKTsKPiAt
CQlyZXR1cm4gdHJ1ZTsKPiArCQlyZXR1cm4gZmFsc2U7Cj4gIAl9Cj4gIAo+ICAJLyoKClRoZSBv
bmUgY2hhbmdlIEkgbWlnaHQgbWFrZSB0byB0aGlzIHdvdWxkIGJlIHRvIGRvOgoJcmV0dXJuIGZp
cnN0X2RlZmVycmVkX3BmbiAhPSBVTE9OR19NQVg7CgpUaGF0IHdheSBpbiB0aGUgZXZlbnQgdGhl
IHByZXZpb3VzIGNhbGxlciBkaWQgZnJlZSB1cCB0aGUgbGFzdCBvZiB0aGUgCnBhZ2VzIGFuZCBl
bXB0eSB0aGUgem9uZSBqdXN0IGJlZm9yZSB3ZSBnb3QgaGVyZSB0aGVuIHdlIHdpbGwgdHJ5IG9u
ZSBtb3JlCnRpbWUuIE90aGVyd2lzZSBpZiBpdCB3YXMgYWxyZWFkeSBkb25lIGJlZm9yZSB3ZSBn
b3QgaGVyZSB3ZSBleGl0LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
