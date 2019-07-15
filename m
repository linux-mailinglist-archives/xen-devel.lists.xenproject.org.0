Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6168903
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:39:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn0EI-0003hE-C1; Mon, 15 Jul 2019 12:37:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hn0EG-0003gk-Cs
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:37:16 +0000
X-Inumbo-ID: 466a6979-a6fd-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 466a6979-a6fd-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 12:37:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2kDyxL27pTybUMI4zYMqjzK1EMuzCP5tliLepxhdmv21C8AhX8Yuz3MCo9cswmyZGv3OlhO0pP
 9D2Pm4jHEf5jHNTsd9oHoF06lBcPo2RuAcP2I1544FBYy8Z6QliSdYu0O45O5QPF6QBQGCmM/I
 aRRd1BMmU8B9yCGpTg28lxlyWAxD3KEILh2vknelB5nrxGhAANU7N/8RtFSpYrMuUSaSHlxtnw
 z9UTF0m+Sbo0X+iI8UuGblq+3y1wuThU1ooFo7nGIubVR67bfXr99O/HLB1faQ1+bWq+KhXVF+
 uDE=
X-SBRS: 2.7
X-MesageID: 3015090
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3015090"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 13:37:07 +0100
Message-ID: <20190715123710.1780-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190715123710.1780-1-paul.durrant@citrix.com>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBub3QgdmVuZG9yIHNwZWNpZmljIHNvIGl0IGRvZXNuJ3QgcmVhbGx5IGJlbG9uZyB0aGVy
ZS4KClNjYW5uaW5nIHRoZSBQQ0kgdG9wb2xvZ3kgYWxzbyByZWFsbHkgZG9lc24ndCBoYXZlIG11
Y2ggdG8gZG8gd2l0aCBJT01NVQppbml0aWFsaXphdGlvbi4gSXQgZG9lc24ndCBkZXBlbmQgb24g
dGhlcmUgZXZlbiBiZWluZyBhbiBJT01NVS4gVGhpcyBwYXRjaAptb3ZlcyB0byB0aGUgY2FsbCB0
byB0aGUgYmVnaW5uaW5nIG9mIGlvbW11X2hhcmR3YXJlX3NldHVwKCkgYnV0IG9ubHkKcGxhY2Vz
IGl0IHRoZXJlIGJlY2F1c2UgdGhlIHRvcG9sb2d5IGluZm9ybWF0aW9uIHdvdWxkIGJlIG90aGVy
d2lzZSB1bnVzZWQuCgpTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBhY3R1YWxseSBtYWtlIHVzZSBv
ZiB0aGUgUENJIHRvcG9sb2d5IGR1cmluZwooeDg2KSBJT01NVSBpbml0aWFsaXphdGlvbi4KClNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpD
YzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4K
Q2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cgp2MjoKIC0gRXhwYW5kZWQgY29tbWl0IGNvbW1lbnQuCiAtIE1vdmVkIFBDSSBzY2FuIHRvIGJl
Zm9yZSBJT01NVSBpbml0aWFsaXphdGlvbiwgcmF0aGVyIHRoYW4gYWZ0ZXIgaXQuCi0tLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8IDMgKystCiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICAgIHwgNCAtLS0tCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAgICAgICAgIHwgNiArKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCmluZGV4IDRhZmJjZDE2MDkuLjMzMzhhOGUwZTgg
MTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMK
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwpAQCAtMTgw
LDcgKzE4MCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGlvdl9kZXRlY3Qodm9pZCkKIAogICAgIGlm
ICggIWFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAgKQogICAgICAgICBwcmludGsoWEVOTE9HX1dB
Uk5JTkcgIkFNRC1WaTogVXNpbmcgZ2xvYmFsIGludGVycnVwdCByZW1hcCB0YWJsZSBpcyBub3Qg
cmVjb21tZW5kZWQgKHNlZSBYU0EtMzYpIVxuIik7Ci0gICAgcmV0dXJuIHNjYW5fcGNpX2Rldmlj
ZXMoKTsKKworICAgIHJldHVybiAwOwogfQogCiBpbnQgYW1kX2lvbW11X2FsbG9jX3Jvb3Qoc3Ry
dWN0IGRvbWFpbl9pb21tdSAqaGQpCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCmluZGV4
IDhiMjdkN2U3NzUuLmIwZTNiZjI2YjUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3Z0ZC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
CkBAIC0yMzcyLDEwICsyMzcyLDYgQEAgc3RhdGljIGludCBfX2luaXQgdnRkX3NldHVwKHZvaWQp
CiAgICAgUChpb21tdV9oYXBfcHRfc2hhcmUsICJTaGFyZWQgRVBUIHRhYmxlcyIpOwogI3VuZGVm
IFAKIAotICAgIHJldCA9IHNjYW5fcGNpX2RldmljZXMoKTsKLSAgICBpZiAoIHJldCApCi0gICAg
ICAgIGdvdG8gZXJyb3I7Ci0KICAgICByZXQgPSBpbml0X3Z0ZF9odygpOwogICAgIGlmICggcmV0
ICkKICAgICAgICAgZ290byBlcnJvcjsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3g4Ni9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKaW5k
ZXggMGZhNmRjYzNmZC4uYTc0MzhjOWMyNSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gveDg2L2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11
LmMKQEAgLTI4LDkgKzI4LDE1IEBAIHN0cnVjdCBpb21tdV9vcHMgX19yZWFkX21vc3RseSBpb21t
dV9vcHM7CiAKIGludCBfX2luaXQgaW9tbXVfaGFyZHdhcmVfc2V0dXAodm9pZCkKIHsKKyAgICBp
bnQgcmM7CisKICAgICBpZiAoICFpb21tdV9pbml0X29wcyApCiAgICAgICAgIHJldHVybiAtRU5P
REVWOwogCisgICAgcmMgPSBzY2FuX3BjaV9kZXZpY2VzKCk7CisgICAgaWYgKCByYyApCisgICAg
ICAgIHJldHVybiByYzsKKwogICAgIGlmICggIWlvbW11X29wcy5pbml0ICkKICAgICAgICAgaW9t
bXVfb3BzID0gKmlvbW11X2luaXRfb3BzLT5vcHM7CiAgICAgZWxzZQotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
