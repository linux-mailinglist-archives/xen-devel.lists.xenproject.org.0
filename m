Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546315E151
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 11:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hibnm-0002qZ-VB; Wed, 03 Jul 2019 09:43:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yqyy=VA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hibnl-0002qT-I3
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 09:43:45 +0000
X-Inumbo-ID: 0bd12d4f-9d77-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bd12d4f-9d77-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 09:43:44 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dfxBY5OlyMg3r00Z3HrHB9J8Pj0ij5eERtf4MygBtPdRIxyZvFWbhc5kYlj7fpBXkn9ATs4Son
 3MtK7+WwcNIixAHM9+sGunyrRl6jcqv/iPCBMlifnkQwfzx+Wjwz+Y3MWnwIb6YKlGUaNDxVsq
 EPeFATEwmVbbR5r3Rxa6hHfKUExRMFebKVRgWKesfpVJhoXHSVbW8eabTY0WdgibkjVs2GCfrp
 nxzKFwP0Y+psdrF6gXxURLz9pWVdxCK6lhXAE9LEVVVBcmt206xixHzoA74P1ybhu11DGIrpUL
 plQ=
X-SBRS: 2.7
X-MesageID: 2547509
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2547509"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 3 Jul 2019 11:43:22 +0200
Message-ID: <20190703094322.1551-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/ept: pass correct level to p2m_entry_modify
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RVBUIGRpZmZlcnMgZnJvbSBOUFQgYW5kIHNoYWRvdyB3aGVuIHRyYW5zbGF0aW5nIHBhZ2Ugb3Jk
ZXJzIHRvIGxldmVscwppbiB0aGUgcGh5c21hcCBwYWdlIHRhYmxlcy4gRVBUIHBhZ2UgdGFibGVz
IGxldmVsIGZvciBvcmRlciAwIHBhZ2VzIGlzCjAsIHdoaWxlIE5QVCBhbmQgc2hhZG93IGluc3Rl
YWQgdXNlIDEsIGllOiBFUFQgcGFnZSB0YWJsZXMgbGV2ZWxzCnN0YXJ0cyBhdCAwIHdoaWxlIE5Q
VCBhbmQgc2hhZG93IHN0YXJ0cyBhdCAxLgoKRml4IHRoZSBwMm1fZW50cnlfbW9kaWZ5IGNhbGwg
aW4gYXRvbWljX3dyaXRlX2VwdF9lbnRyeSB0byBhbHdheXMgYWRkCm9uZSB0byB0aGUgbGV2ZWws
IGluIG9yZGVyIHRvIG1hdGNoIE5QVCBhbmQgc2hhZG93IHVzYWdlLgoKV2hpbGUgdGhlcmUgYWxz
byBmaXggcDJtX2VudHJ5X21vZGlmeSBCVUcgY29uZGl0aW9uIHRvIHRyaWdnZXIgd2hlbgpmb3Jl
aWduIG9yIGlvcmVxIGVudHJpZXMgd2l0aCBsZXZlbCBkaWZmZXJlbnQgdGhhbiAwIGFyZSBhdHRl
bXB0ZWQuClRoYXQgc2hvdWxkIGFsbG93IHRvIGNhdGNoIGZ1dHVyZSBlcnJvcnMgcmVsYXRlZCB0
byB0aGUgbGV2ZWwKcGFyYW1ldGVyLgoKRml4ZXM6IGM3YTRjMCAoJ3g4Ni9tbTogc3BsaXQgcDJt
IGlvcmVxIHNlcnZlciBwYWdlcyBzcGVjaWFsIGhhbmRsaW5nIGludG8gaGVscGVyJykKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzog
SnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNp
dHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIHwgMiArLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9wMm0uaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLWVwdC5jCmluZGV4IGUzMDQ0YmVlMmUuLjZiODQ2OGM3OTMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKKysrIGIveGVuL2FyY2gveDg2L21tL3Ay
bS1lcHQuYwpAQCAtNTEsNyArNTEsNyBAQCBzdGF0aWMgaW50IGF0b21pY193cml0ZV9lcHRfZW50
cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgbGV2ZWwpCiB7CiAgICAgaW50IHJjID0gcDJtX2VudHJ5X21vZGlmeShwMm0sIG5l
dy5zYV9wMm10LCBlbnRyeXB0ci0+c2FfcDJtdCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF9tZm4obmV3Lm1mbiksIF9tZm4oZW50cnlwdHItPm1mbiksIGxldmVsKTsKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9tZm4obmV3Lm1mbiksIF9tZm4oZW50cnlwdHItPm1mbiks
IGxldmVsICsgMSk7CiAKICAgICBpZiAoIHJjICkKICAgICAgICAgcmV0dXJuIHJjOwpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJt
LmgKaW5kZXggMDllZjdlMDJmZC4uNzU2OTI5ZDVjMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9wMm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCkBAIC05NDYsNyAr
OTQ2LDcgQEAgc3RhdGljIGlubGluZSBpbnQgcDJtX2VudHJ5X21vZGlmeShzdHJ1Y3QgcDJtX2Rv
bWFpbiAqcDJtLCBwMm1fdHlwZV90IG50LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwMm1fdHlwZV90IG90LCBtZm5fdCBuZm4sIG1mbl90IG9mbiwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxldmVsKQogewotICAgIEJVR19PTihs
ZXZlbCA+IDEgJiYgKG50ID09IHAybV9pb3JlcV9zZXJ2ZXIgfHwgbnQgPT0gcDJtX21hcF9mb3Jl
aWduKSk7CisgICAgQlVHX09OKGxldmVsICE9IDEgJiYgKG50ID09IHAybV9pb3JlcV9zZXJ2ZXIg
fHwgbnQgPT0gcDJtX21hcF9mb3JlaWduKSk7CiAKICAgICBpZiAoIGxldmVsICE9IDEgfHwgKG50
ID09IG90ICYmIG1mbl9lcShuZm4sIG9mbikpICkKICAgICAgICAgcmV0dXJuIDA7Ci0tIAoyLjIw
LjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
