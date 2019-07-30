Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7F7AA02
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:47:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSQY-00059R-Ve; Tue, 30 Jul 2019 13:44:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsSQX-00057e-1K
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:44:29 +0000
X-Inumbo-ID: 2669953a-b2d0-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2669953a-b2d0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 13:44:27 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sadaRrpa3Xj2ZfJFr5+ODF6TwzzRofH0tmUTmBt5dcumJMNnUx7l9pKq1iEbhlQlbj8u4KkWW2
 9a5Zv//7eTr3dp4iEQH56jJSp8S5FG02IZhQ5Ey+dWeIGtGymeC0E0PZounala8kdOaI3u7rcG
 Peuw8BkMOlfFQ7L7fD6z0p1cFvmu/jqvfgIR4Y5VYEjliLYbAjysLVfJ9OEi3+xsM7gscnbfQ6
 LMZGjg8msW8auCuSt/oddFUSleoOHJGdnHE4yLTK9RFn+mbEwhSWue6jmI2e/N207i38s33Pkz
 bS0=
X-SBRS: 2.7
X-MesageID: 3760805
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3760805"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 14:44:13 +0100
Message-ID: <20190730134419.2739-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/6] per-domain IOMMU control
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaXMgYmFzZSBvbiBteSByZWNlbnQgJ3VzZSBzdGFzaGVkIGRvbWFpbiBjcmVh
dGUgZmxhZ3MnCnNlcmllcyBbMV0gYW5kIEFsZXhhbmRydSBJc2FpbGEncyAnQ2xlYW4gaW9tbXVf
aGFwX3B0X3NoYXJlIGVuYWJsZWQgY29kZScKcGF0Y2ggWzJdLiBJdCB1bHRpbWF0ZWx5IGludHJv
ZHVjZXMgYSBuZXcgJ3Bhc3N0aHJvdWdoJyBvcHRpb24gdG8geGwuY2ZnIHRvCnByb3ZpZGUgcGVy
LWRvbWFpbiBjb250cm9sIG92ZXIgYSBndWVzdHMgSU9NTVUgbWFwcGluZ3MuCgpbMV0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21z
ZzAyMjUzLmh0bWwKWzJdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTcwOC5odG1sCgpQYXVsIER1cnJhbnQgKDYpOgogIGRv
bWFpbjogaW50cm9kdWNlIFhFTl9ET01DVExfQ0RGX2lvbW11CiAgdXNlIGlzX2lvbW11X2VuYWJs
ZWQoKSB3aGVyZSBhcHByb3ByaWF0ZS4uLgogIHJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0
cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcwogIG1ha2UgcGFzc3Rocm91Z2gvcGNpLmM6ZGVh
c3NpZ25fZGV2aWNlKCkgc3RhdGljCiAgaW9tbXU6IHRpZHkgdXAgaW9tbXVfdXNfaGFwX3B0KCkg
YW5kIG5lZWRfaW9tbXVfcHRfc3luYygpIG1hY3JvcwogIGludHJvZHVjZSBhICdwYXNzdGhyb3Vn
aCcgY29uZmlndXJhdGlvbiBvcHRpb24gdG8geGwuY2ZnLi4uCgogZG9jcy9tYW4veGwuY2ZnLjUu
cG9kLmluICAgICAgICAgICAgICAgICAgfCAgNTIgKysrKysrKwogdG9vbHMvbGlieGwvbGlieGwu
aCAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKwogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMgICAgICAgICAgICAgICAgfCAgMjIgKysrCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwg
ICAgICAgICAgICAgICB8ICAgNyArCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzOCArKysrKwogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgICAgICAg
ICAgICAgfCAgMTIgKy0KIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA1ICstCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8ICAg
MyArCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICAgICAgICB8ICAgNCArLQog
eGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIHhlbi9h
cmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4vYXJjaC94
ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L2h2
bS9tdHJyLmMgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdmlv
YXBpYy5jICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNz
LmMgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAg
ICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgICAg
ICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jICAgICAgICAgICAgICAg
ICB8ICAgNCArLQogeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsK
IHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4v
Y29tbW9uL2RvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQogeGVuL2NvbW1v
bi9tZW1vcnkuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9jb21tb24vdm1f
ZXZlbnQuYyAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXVfZ3Vlc3QuYyB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
ZGV2aWNlX3RyZWUuYyAgICAgfCAgMTggKy0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5j
ICAgICAgICAgICAgICB8ICAgOCArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyAg
ICAgICAgICAgfCAxNzAgKysrKysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMgICAgICAgICAgICAgfCAxMTYgKysrKysrKy0tLS0tLS0tCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICB8ICAxMiArLQogeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL3g4Ni9odm0uYyAgICAgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3g4Ni9pb21tdS5jICAgICAgIHwgIDk3ICstLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNt
LWFybS9pb21tdS5oICAgICAgICAgICAgICAgfCAgIDMgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9p
b21tdS5oICAgICAgICAgICAgICAgfCAgIDQgLQogeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5o
ICAgICAgICAgICAgICAgfCAgMTAgKy0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAg
ICAgICAgICAgIHwgIDM1ICsrLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAg
ICAgICAgICB8ICAxMyArLQogMzcgZmlsZXMgY2hhbmdlZCwgMzIxIGluc2VydGlvbnMoKyksIDM3
MCBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVu
ZGVyLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IEJyaWFuIFdv
b2RzIDxicmlhbi53b29kc0BhbWQuY29tPgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50
ZWwuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CkNjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBQZXRyZSBQaXJjYWxh
YnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgpDYzogUmF6dmFuIENvam9jYXJ1IDxyY29q
b2NhcnVAYml0ZGVmZW5kZXIuY29tPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5j
b20+CkNjOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tIAoyLjIwLjEuMi5nYjIxZWJi
NjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
