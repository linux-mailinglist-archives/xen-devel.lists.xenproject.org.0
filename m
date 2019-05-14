Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3197C1CA97
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYa8-0001H3-FZ; Tue, 14 May 2019 14:39:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQYa6-0001Gy-9x
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:39:02 +0000
X-Inumbo-ID: 018ef338-7656-11e9-9e76-bfc9fc52d097
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 018ef338-7656-11e9-9e76-bfc9fc52d097;
 Tue, 14 May 2019 14:38:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="85444224"
Date: Tue, 14 May 2019 15:38:55 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190514143855.GH2798@zion.uk.xensource.com>
References: <20190514080558.14540-1-olaf@aepfle.de>
 <20190514101452.10c40b6e.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514101452.10c40b6e.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6MTQ6NTJBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVHVlLCAxNCBNYXkgMjAxOSAxMDowNTo1OCArMDIwMAo+IHNjaHJpZWIgT2xhZiBI
ZXJpbmcgPG9sYWZAYWVwZmxlLmRlPjoKPiAKPiA+IEBAIC00NTksNyArNDYxLDkgQEAgaW50IGxp
YnhsX19kb21haW5fcmVzdW1lKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLCBpbnQgc3Vz
cGVuZF9jYW5jZWwpCj4gPiAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgfQo+ID4gIAo+ID4g
LSAgICBpZiAodHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0pIHsKPiA+ICsgICAgaWYgKHR5
cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNIHx8Cj4gPiArICAgICAgICBsaWJ4bF9fZGV2aWNl
X21vZGVsX3ZlcnNpb25fcnVubmluZyhnYywgZG9taWQpID09Cj4gPiArICAgICAgICBMSUJYTF9E
RVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTikgewo+ID4gICAgICAgICAgcmMgPSBsaWJ4bF9f
ZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWwoZ2MsIGRvbWlkKTsKPiA+ICAgICAgICAgIGlmIChy
Yykgewo+ID4gICAgICAgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAiZmFpbGVkIHRvIHJlc3Vt
ZSBkZXZpY2UgbW9kZWw6JWQiLCByYyk7Cj4gCj4gSSB0aGluayB0aGlzIGNvdWxkIGJlIGRvbmUg
bGlrZSB0aGF0IGluc3RlYWQsIHNvIHRoYXQgbGlieGxfX2RldmljZV9tb2RlbF92ZXJzaW9uX3J1
bm5pbmcKPiBpcyBjYWxsZWQganVzdCBvbmNlOgo+IAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2RvbV9zdXNwZW5kLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21fc3VzcGVuZC5jCj4g
QEAgLTQ0NCw2ICs0NDQsOCBAQCBpbnQgbGlieGxfX2RvbWFpbl9yZXN1bWVfZGV2aWNlX21vZGVs
KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKQo+ICAgICAgICAgIGlmIChsaWJ4bF9fcW1w
X3Jlc3VtZShnYywgZG9taWQpKQo+ICAgICAgICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKPiAg
ICAgICAgICBicmVhazsKPiArICAgIGNhc2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fTk9O
RToKPiArICAgICAgICBicmVhazsKPiAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgcmV0dXJuIEVS
Uk9SX0lOVkFMOwo+ICAgICAgfQo+IEBAIC00NjEsMTQgKzQ2MywxMCBAQCBpbnQgbGlieGxfX2Rv
bWFpbl9yZXN1bWUobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsIGludCBzdXNwZW5kX2Nh
bmNlbCkKPiAgICAgICAgICBnb3RvIG91dDsKPiAgICAgIH0KPiAgCj4gLSAgICBpZiAodHlwZSA9
PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0gfHwKPiAtICAgICAgICBsaWJ4bF9fZGV2aWNlX21vZGVs
X3ZlcnNpb25fcnVubmluZyhnYywgZG9taWQpID09Cj4gLSAgICAgICAgTElCWExfREVWSUNFX01P
REVMX1ZFUlNJT05fUUVNVV9YRU4pIHsKPiAtICAgICAgICByYyA9IGxpYnhsX19kb21haW5fcmVz
dW1lX2RldmljZV9tb2RlbChnYywgZG9taWQpOwo+IC0gICAgICAgIGlmIChyYykgewo+IC0gICAg
ICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgImZhaWxlZCB0byByZXN1bWUgZGV2aWNlIG1vZGVs
OiVkIiwgcmMpOwo+IC0gICAgICAgICAgICBnb3RvIG91dDsKPiAtICAgICAgICB9Cj4gKyAgICBy
YyA9IGxpYnhsX19kb21haW5fcmVzdW1lX2RldmljZV9tb2RlbChnYywgZG9taWQpOwo+ICsgICAg
aWYgKHJjKSB7Cj4gKyAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJmYWlsZWQgdG8gcmVzdW1l
IGRldmljZSBtb2RlbDolZCIsIHJjKTsKPiArICAgICAgICBnb3RvIG91dDsKPiAgICAgIH0KPiAg
Cj4gICAgICBpZiAoeGNfZG9tYWluX3Jlc3VtZShDVFgtPnhjaCwgZG9taWQsIHN1c3BlbmRfY2Fu
Y2VsKSkgewo+IAoKWWVhaCwgZnJvbSB0aGUgbG9vayBvZiBpdCB0aGlzIGlzIGRlZmluaXRlbHkg
YmV0dGVyLgoKPiAKPiBXaGlsZSBpdCBpcyBlYXN5IGZvciB0aGUgcmVzdW1lIHBhdGgsIGRvaW5n
IHRoZSBzYW1lIGluIHRoZSBzdXNwZW5kIHBhdGgKPiBuZWVkcyBtb3JlIGNoYW5nZXMuIGxpYnhs
X19kb21haW5fc3VzcGVuZF9kZXZpY2VfbW9kZWwgd291bGQgbmVlZCB0byByZWNlaXZlCj4gdGhl
IGNhbGxiYWNrIGFuZCBzZXQgaXQgaWYgYSBkZXZpY2UgbW9kZWwgaXMgYWN0aXZlLgoKV2hhdCBk
byB5b3UgbWVhbiBoZXJlPyBDYW4ndCB5b3UgaGFuZGxlIHRoZSBOT05FIGNhc2UganVzdCBsaWtl
IHlvdSBkbwppbiB0aGUgcmVzdW1lIGZ1bmN0aW9uPwoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
