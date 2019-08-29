Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FCBA1BAC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 15:42:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Ke6-0005P3-HX; Thu, 29 Aug 2019 13:39:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Ke5-0005Ow-DR
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:39:25 +0000
X-Inumbo-ID: 69a1834a-ca62-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69a1834a-ca62-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 13:39:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63793B656;
 Thu, 29 Aug 2019 13:39:23 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-9-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ac91f71-eac4-bf13-ff01-09fe4d9b7376@suse.com>
Date: Thu, 29 Aug 2019 15:39:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-9-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 08/10] remove late (on-demand)
 construction of IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDguMjAxOSAxOToxOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCj4gQEAgLTE0Niw2ICsxNDYsMTcgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfZG9t
MF9pb21tdV9wYXJhbShjb25zdCBjaGFyICpzKQo+ICB9Cj4gIGN1c3RvbV9wYXJhbSgiZG9tMC1p
b21tdSIsIHBhcnNlX2RvbTBfaW9tbXVfcGFyYW0pOwo+ICAKPiArc3RhdGljIHZvaWQgX19od2Rv
bV9pbml0IGNoZWNrX2h3ZG9tX3JlcXMoc3RydWN0IGRvbWFpbiAqZCkKClRoaXMgcmVhbGx5IHNo
b3VsZCBoYXZlIGNvbnN0LCBidXQgSSByZWFsaXplIC4uLgoKPiArewo+ICsgICAgaWYgKCBpb21t
dV9od2RvbV9ub25lIHx8ICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQo+ICsgICAgICAgIHJl
dHVybjsKPiArCj4gKyAgICBhcmNoX2lvbW11X2NoZWNrX2F1dG90cmFuc2xhdGVkX2h3ZG9tKGQp
OwoKLi4uIHRoaXMgb25lIHdhbnRzIG5vbi1jb25zdCAoZm9yIC0gYWZhaWN0IC0gbm8gcmVhc29u
KS4KCj4gQEAgLTE1OSwxMjkgKzE3MCw0NCBAQCBpbnQgaW9tbXVfZG9tYWluX2luaXQoc3RydWN0
IGRvbWFpbiAqZCkKPiAgICAgICAgICByZXR1cm4gcmV0Owo+ICAKPiAgICAgIGhkLT5wbGF0Zm9y
bV9vcHMgPSBpb21tdV9nZXRfb3BzKCk7Cj4gLSAgICByZXR1cm4gaGQtPnBsYXRmb3JtX29wcy0+
aW5pdChkKTsKPiAtfQo+ICsgICAgcmV0ID0gaGQtPnBsYXRmb3JtX29wcy0+aW5pdChkKTsKPiAr
ICAgIGlmICggcmV0ICkKPiArICAgICAgICByZXR1cm4gcmV0Owo+ICAKPiAtc3RhdGljIHZvaWQg
X19od2RvbV9pbml0IGNoZWNrX2h3ZG9tX3JlcXMoc3RydWN0IGRvbWFpbiAqZCkKPiAtewo+IC0g
ICAgaWYgKCBpb21tdV9od2RvbV9ub25lIHx8ICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQo+
IC0gICAgICAgIHJldHVybjsKPiArICAgIC8qCj4gKyAgICAgKiBOQjogJ3JlbGF4ZWQnIGgvdyBk
b21haW5zIGRvbid0IG5lZWQgdGhlIElPTU1VIG1hcHBpbmdzIHRvIGJlIGtlcHQKPiArICAgICAq
ICAgICBpbi1zeW5jIHdpdGggdGhlaXIgYXNzaWduZWQgcGFnZXMgYmVjYXVzZSBhbGwgaG9zdCBS
QU0gd2lsbCBiZQo+ICsgICAgICogICAgIG1hcHBlZCBkdXJpbmcgaHdkb21faW5pdCgpLgo+ICsg
ICAgICovCgpEb2Vzbid0IHRoaXMgY29tbWVudCBiZWxvbmcgdG8gLi4uCgo+ICsgICAgaWYgKCBp
c19oYXJkd2FyZV9kb21haW4oZCkgKQo+ICsgICAgICAgIGNoZWNrX2h3ZG9tX3JlcXMoZCk7IC8q
IG1heSBtb2RpZnkgaW9tbXVfaHdkb21fc3RyaWN0ICovCj4gIAo+IC0gICAgYXJjaF9pb21tdV9j
aGVja19hdXRvdHJhbnNsYXRlZF9od2RvbShkKTsKPiArICAgIGlmICggIWlzX2hhcmR3YXJlX2Rv
bWFpbihkKSB8fCBpb21tdV9od2RvbV9zdHJpY3QgKQo+ICsgICAgICAgIGhkLT5uZWVkX3N5bmMg
PSAhaW9tbXVfdXNlX2hhcF9wdChkKTsKCi4uLiB0aGlzIGlmKCk/Cgo+IEBAIC02MjksOCArNTUy
LDcgQEAgc3RhdGljIHZvaWQgaW9tbXVfZHVtcF9wMm1fdGFibGUodW5zaWduZWQgY2hhciBrZXkp
Cj4gICAgICBvcHMgPSBpb21tdV9nZXRfb3BzKCk7Cj4gICAgICBmb3JfZWFjaF9kb21haW4oZCkK
PiAgICAgIHsKPiAtICAgICAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSB8fAo+IC0gICAg
ICAgICAgICAgZG9tX2lvbW11KGQpLT5zdGF0dXMgPCBJT01NVV9TVEFUVVNfaW5pdGlhbGl6ZWQg
KQo+ICsgICAgICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQo+ICAgICAgICAgICAgICBj
b250aW51ZTsKCkRpZG4ndCB5b3UgYWdyZWUgdG8gcmV0YWluIHRoZSBod2RvbSBwYXJ0IG9mIHRo
ZSBjb25kaXRpb24gaGVyZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
