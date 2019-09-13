Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC9B1BE2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 13:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8jHk-0001K3-Op; Fri, 13 Sep 2019 10:58:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8jHi-0001JK-Nh
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 10:58:38 +0000
X-Inumbo-ID: 6f269275-d615-11e9-95aa-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f269275-d615-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568372317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H4KdO7RxcnIMr+euwIfopal5xte9fx7/C2u5PfkCFrc=;
 b=ZoKdugqcxiNpU/OMpov/QTIG/XDubaE7Xl0p10xywft14CaDdzIrCLAC
 ey/8k3QJtZTpxd7atlykuBDIItgr197ZZgYcH3yxi7FZZq95o73UmXlx4
 1kQP8QshlDJEw1gsMUFninOBnqCVKkLBgVsfaTrlJ8+U5WZNugQtkoA57 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hhpoOsQDIIHIlIMWQSUa5cjiVuI5lV1fLDnVEkVXTPIL3g+Cz9GzwyJn8ELlnVkaQQcgIGVZFD
 Dcwf1ERFdry+cquKWdnuoEPGHdQXAvojynbOSny+vnD4BF5u3Qu30iaqyvidy0HJBwzaxsWzp/
 2f9Oac6KEEbaHXtLFuk1Xj1Y3Ja9lUvwvwhIN3UeKTU2Go5IrQED84FqnSId+64oZzCsPkibMv
 YVfa6ZUNtGQYMp0PbrW3+oultuEkPZbK3EzGyDiFRAkUSgMe0XvayR2r6N9o1Y1HRY2jRA+Kca
 qg4=
X-SBRS: 2.7
X-MesageID: 5583083
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5583083"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 11:58:20 +0100
Message-ID: <20190913105826.2704-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v11 0/6] add per-domain IOMMU control
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
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIHJldmlzaW9ucyBvZiB0aGUgcmVtYWluaW5nIHVuY29tbWl0dGVkIHBhdGNoZXMg
ZnJvbSBteQpwcmV2aW91cyBzZXJpZXM6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDE3MzcuaHRtbAoKVGhpcyBzZXJpZXMg
KHBhcnRpY2xhcmx5IHBhdGNoICM2KSBuZWVkcyB0byBiZSBhcHBsaWVkIGFmdGVyOgoKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21z
ZzAxMjA0Lmh0bWwKCnRvIGF2b2lkIGFuIGFiaS1jaGVjayBmYWlsdXJlLgoKUGF1bCBEdXJyYW50
ICg3KToKICBJYW4ncyBhYmktY2hlY2sgZml4CiAgZG9tYWluOiBpbnRyb2R1Y2UgWEVOX0RPTUNU
TF9DREZfaW9tbXUgZmxhZwogIHVzZSBpc19pb21tdV9lbmFibGVkKCkgd2hlcmUgYXBwcm9wcmlh
dGUuLi4KICBzeXNjdGwgLyBsaWJ4bDogcmVwb3J0IHdoZXRoZXIgSU9NTVUvSEFQIHBhZ2UgdGFi
bGUgc2hhcmluZyBpcwogICAgc3VwcG9ydGVkCiAgcmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29u
c3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzCiAgaW9tbXU6IHRpZHkgdXAgaW9tbXVfdXNl
X2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5bmMoKSBtYWNyb3MKICBpbnRyb2R1Y2UgYSAn
cGFzc3Rocm91Z2gnIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRvIHhsLmNmZy4uLgoKIGRvY3MvbWFu
L3hsLmNmZy41LnBvZC5pbiAgICAgICAgICAgICAgICAgIHwgIDU2ICsrKysrKwogdG9vbHMvbGli
eGwvbGlieGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogdG9vbHMvbGlieGwvbGli
eGwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMjMgKysrCiB0b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYyAgICAgICAgICAgICAgICB8ICAgOSArCiB0b29scy9saWJ4bC9saWJ4bF9tZW0uYyAg
ICAgICAgICAgICAgICAgICB8ICAgNiArLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICAg
ICAgICAgICAgICAgfCAgIDkgKwogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyAgICAgICAgICAg
ICAgICAgfCAgMTUgKysKIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmggICAgICAgICAgICAgICAg
IHwgICAxICsKIHRvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrICAgICAgICAgICAgIHwgIDE3
ICstCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICAgICAgICB8ICAgNiArCiB0
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICAgICAgICB8ICAgNyArCiB0b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgICAgICB8ICAxNyArLQogdG9vbHMveGwveGxf
aW5mby5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHRvb2xzL3hsL3hsX3BhcnNl
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTcyICsrKysrKysrKysrKystLS0tLS0KIHhlbi9h
cmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL2Fy
bS9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgIHwgIDE3ICstCiB4ZW4vYXJjaC9hcm0vcDJt
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gvYXJtL3NldHVwLmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyAg
ICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgICAgICAg
ICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICAgICAgICAg
fCAgMzEgKystLQogeGVuL2FyY2gveDg2L2h2bS9tdHJyLmMgICAgICAgICAgICAgICAgICAgfCAg
IDUgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdmlvYXBpYy5jICAgICAgICAgICAgICAgIHwgICAyICst
CiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgICAgICAgICAgICAgICB8ICAgMiArLQogeGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNo
L3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYv
bW0vcDJtLWVwdC5jICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L21tL3Ay
bS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wYWdpbmcu
YyAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMyArCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTYgKy0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICstCiB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
CiB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyAgICAgICAgICAgfCAgIDMgKwogeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgIHwgICA1ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9kZXZpY2VfdHJlZS5jICAgICB8ICAxOCArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW8uYyAgICAgICAgICAgICAgfCAgIDggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11
LmMgICAgICAgICAgIHwgMTk4ICsrKysrKysrLS0tLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jICAgICAgICAgICAgIHwgIDI4ICstLQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2lvbW11LmMgICAgICAgfCAgMTggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC94ODYvaHZtLmMgICAgIHwgICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYv
aW9tbXUuYyAgICAgICB8ICA5OSArLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9pb21t
dS5oICAgICAgICAgICAgICAgfCAgIDMgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oICAg
ICAgICAgICAgICAgfCAgMTUgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCAgICAgICAg
ICAgICAgIHwgIDE1ICstCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAgICAgICAg
ICB8ICAgNiArLQogeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAgICAgICAgfCAg
NDYgKystLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICAgICAgIHwgIDEz
ICstCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgICAgICAgICB8ICAxOCArLQog
NTMgZmlsZXMgY2hhbmdlZCwgNTMzIGluc2VydGlvbnMoKyksIDQyNyBkZWxldGlvbnMoLSkKLS0t
CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBDaHJpc3RpYW4gTGluZGln
IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CkNjOiBEYXZpZCBTY290dCA8ZGF2ZUByZWNv
aWwub3JnPgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpD
YzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgpDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgpDYzogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0
ZGVmZW5kZXIuY29tPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFN1
cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+CkNjOiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBUaW0gRGVlZ2FuIDx0aW1A
eGVuLm9yZz4KQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
