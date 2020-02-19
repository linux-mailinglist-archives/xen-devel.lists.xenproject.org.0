Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352171645D6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:41:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4PZS-0007P8-Pt; Wed, 19 Feb 2020 13:39:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pJwG=4H=ideasonboard.com=laurent.pinchart@srs-us1.protection.inumbo.net>)
 id 1j4PZR-0007P2-6p
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:39:21 +0000
X-Inumbo-ID: 3a9732d6-531d-11ea-ade5-bc764e2007e4
Received: from perceval.ideasonboard.com (unknown [213.167.242.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a9732d6-531d-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 13:39:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FB2E2F9;
 Wed, 19 Feb 2020 14:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582119558;
 bh=LyUONTSrdds7t3gz62H8MOFqWkmg+wPrBzed1rOyYiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDZDd/u5eH4Y/7GygTdJqJJmFrn3hhVkcuts6v0LOA7RJL/e7uodMW5U5n6fz2MZI
 92Fp3L2aSCKUoNZV4opTYicob4qbQIKcipwE7wIMeglUpHc3hPgEvCwqLeO6TnLFg4
 /cUkChpTe5Lrq1QfAAqfOTQKzMKaQUWFr5EvKF60=
Date: Wed, 19 Feb 2020 15:39:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20200219133900.GE5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIEZlYiAxOSwgMjAy
MCBhdCAxMToyMDozNEFNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IEkgYWxzbyBkaWQg
YSBmdWxsIHJldmlldyBvZiBhbGwgY2FsbGVycywgYW5kIG9ubHkgdGhlIHhlbiBkcml2ZXIKPiBm
b3Jnb3QgdG8gY2FsbCBkcm1fZGV2X3B1dCBpbiB0aGUgZmFpbHVyZSBwYXRoLiBGaXggdGhhdCB1
cCB0b28uCgpJJ2Qgc3BsaXQgdGhpcyBwYXRjaCBpbiB0d28gdGhlbiwgd2l0aCB0aGUgWGVuIGZp
cnN0IGNvbWluZyBmaXJzdCwgYW5kCndpdGggYW4gZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIG9mIHRoZSBzZWNvbmQgcGF0Y2ggYWJvdXQgd2h5CnlvdSBjYWxsIGRybW1fYWRkX2Zp
bmFsX2tmcmVlKCkgaW4gZHJtX2Rldl9hbGxvYygpLgoKPiB2MjogSSBub3RpY2VkIHRoYXQgeGVu
IGhhcyBhIGRybV9kcml2ZXIucmVsZWFzZSBob29rLCBhbmQgdXNlcwo+IGRybV9kZXZfYWxsb2Mo
KS4gV2UgbmVlZCB0byByZW1vdmUgdGhlIGtmcmVlIGZyb20KPiB4ZW5fZHJtX2Rydl9yZWxlYXNl
KCkuCj4gCj4gYm9jaHMgYWxzbyBoYXMgYSByZWxlYXNlIGhvb2ssIGJ1dCBsZWFrZWQgdGhlIGRy
bV9kZXZpY2UgZXZlciBzaW5jZQo+IAo+IGNvbW1pdCAwYTY2NTliZGM1ZTgyMjFkYTk5ZWViYjE3
NmZkOTU5MTQzNWUzOGRlCj4gQXV0aG9yOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KPiBEYXRlOiAgIFR1ZSBEZWMgMTcgMTg6MDQ6NDYgMjAxMyArMDEwMAo+IAo+ICAgICBkcm0v
Ym9jaHM6IG5ldyBkcml2ZXIKPiAKPiBUaGlzIHBhdGNoIGhlcmUgZml4ZXMgdGhhdCBsZWFrLgo+
IAo+IFNhbWUgZm9yIHZpcnRpbywgc3RhcnRlZCBsZWFraW5nIHdpdGgKPiAKPiBjb21taXQgYjFk
ZjNhMmIyNGE5MTdmODg1M2Q0M2ZlOTY4M2MwZTM2MGQyYzMzYQo+IEF1dGhvcjogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gRGF0ZTogICBUdWUgRmViIDExIDE0OjU4OjA0IDIw
MjAgKzAxMDAKPiAKPiAgICAgZHJtL3ZpcnRpbzogYWRkIGRybV9kcml2ZXIucmVsZWFzZSBjYWxs
YmFjay4KPiAKPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gQ2M6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4K
PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gCj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5j
ICAgICAgICAgICB8IDMgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5j
IHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcnYuYwo+IGluZGV4IDNlNTYyN2Q2ZWJhNi4uOWU2MmUyOGJiYzYyIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Rydi5jCj4gQEAgLTM5LDYgKzM5LDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fY29s
b3JfbWdtdC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPiAgI2luY2x1ZGUgPGRybS9k
cm1fZmlsZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gICNpbmNsdWRlIDxk
cm0vZHJtX21vZGVfb2JqZWN0Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gIAo+
IEBAIC04MTksNiArODIwLDggQEAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXZfYWxsb2Moc3Ry
dWN0IGRybV9kcml2ZXIgKmRyaXZlciwKPiAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICAJfQo+
ICAKPiArCWRybW1fYWRkX2ZpbmFsX2tmcmVlKGRldiwgZGV2KTsKCmRybW1fYWRkX2ZpbmFsX2tm
cmVlKCkgY2FuIG9ubHkgYmUgY2FsbGVkIG9uY2UuIERvZXMgdGhpcyBtZWFuIHRoYXQgYQpkcml2
ZXIgdXNpbmcgZHJtX2Rldl9hbGxvYygpIGlzbid0IGFsbG93ZWQgdG8gdXNlIGRybW1fYWRkX2Zp
bmFsX2tmcmVlKCkKdG8gdHJhY3QgaXRzIG93biBwcml2YXRlIHN0cnVjdHVyZSA/Cgo+ICsKPiAg
CXJldHVybiBkZXY7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fZGV2X2FsbG9jKTsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYwo+IGluZGV4IDRiZTQ5YzFhZWY1MS4uZDIyYjVkYTM4
OTM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPiBAQCAtNDYxLDcgKzQ2
MSw2IEBAIHN0YXRpYyB2b2lkIHhlbl9kcm1fZHJ2X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKPiAgCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7Cj4gIAo+ICAJZHJtX2Rldl9m
aW5pKGRldik7Cj4gLQlrZnJlZShkZXYpOwo+ICAKPiAgCWlmIChmcm9udF9pbmZvLT5jZmcuYmVf
YWxsb2MpCj4gIAkJeGVuYnVzX3N3aXRjaF9zdGF0ZShmcm9udF9pbmZvLT54Yl9kZXYsCj4gQEAg
LTU2MSw2ICs1NjAsNyBAQCBzdGF0aWMgaW50IHhlbl9kcm1fZHJ2X2luaXQoc3RydWN0IHhlbl9k
cm1fZnJvbnRfaW5mbyAqZnJvbnRfaW5mbykKPiAgZmFpbF9tb2Rlc2V0Ogo+ICAJZHJtX2ttc19o
ZWxwZXJfcG9sbF9maW5pKGRybV9kZXYpOwo+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJt
X2Rldik7Cj4gKwlkcm1fZGV2X3B1dChkcm1fZGV2KTsKPiAgZmFpbDoKPiAgCWtmcmVlKGRybV9p
bmZvKTsKPiAgCXJldHVybiByZXQ7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
