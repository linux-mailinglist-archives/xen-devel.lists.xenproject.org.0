Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B368636
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:21:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmx7d-00059V-QC; Mon, 15 Jul 2019 09:18:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hmx7c-00059Q-Md
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:18:12 +0000
X-Inumbo-ID: 77299104-a6e1-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77299104-a6e1-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 09:18:11 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dBy/dmip1BDG8TkVuVDIO3UAjBFXWIdg9rHNDnFO3mj6eXb344mUY7CI5ReCZ5sAQdxHajj+7E
 3Wg0qyXoiuPqifghzB7ggpU0Oxy08RP4zc/9RMz4L8RQGf42Ei9tVugHKTnPX6l5UwBPa0Z3cg
 ze8OuZcclWOmZMQBsjkxLuo/kbMQOxI5+NCgYRiNJnU1JaK29mJ6+IPgVZ19F9UT/6MvKobXXK
 7I7O7bNNL56I7oNvptCX1pKcxs/KGTEzKNDEp+7F8hqA174nEUK3IBOaqZ30/yx7uiw5dZbUEh
 ORc=
X-SBRS: 2.7
X-MesageID: 2970992
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2970992"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 10:17:56 +0100
Message-ID: <20190715091756.39065-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIF9QR0NfYWxsb2NhdGVkIGZsYWcgaXMgc2V0IG9uIGEgcGFnZSB3aGVuIGl0IGlzIGFzc2ln
bmVkIHRvIGEgZG9tYWluCmFsb25nIHdpdGggYW4gaW5pdGlhbCByZWZlcmVuY2UgY291bnQgb2Yg
YXQgbGVhc3QgMS4gVG8gY2xlYXIgdGhpcwonYWxsb2NhdGlvbicgcmVmZXJlbmNlIGl0IGlzIG5l
Y2Vzc2FyeSB0byB0ZXN0LWFuZC1jbGVhciBfUEdDX2FsbG9jYXRlZCBhbmQKdGhlbiBvbmx5IGRy
b3AgdGhlIHJlZmVyZW5jZSBpZiB0aGUgdGVzdC1hbmQtY2xlYXIgc3VjY2VlZHMuIFRoaXMgaXMg
b3Blbi0KY29kZWQgaW4gbWFueSBwbGFjZXMuIEl0IGlzIGFsc28gdW5zYWZlIHRvIHRlc3QtYW5k
LWNsZWFyIF9QR0NfYWxsb2NhdGVkCnVubGVzcyB0aGUgY2FsbGVyIGhvbGRzIGFuIGFkZGl0aW9u
YWwgcmVmZXJlbmNlLgoKVGhpcyBwYXRjaCBhZGRzIGEgaGVscGVyIGZ1bmN0aW9uLCBwdXRfcGFn
ZV9hbGxvY19yZWYoKSwgdG8gcmVwbGFjZSBhbGwgdGhlCm9wZW4tY29kZWQgdGVzdC1hbmQtY2xl
YXIvcHV0X3BhZ2Ugb2NjdXJyZW5jZXMgYW5kIGluY29ycG9yYXRlcyBpbiB0aGF0IGEKQlVHX09O
KCkgYW4gYWRkaXRpb25hbCBwYWdlIHJlZmVyZW5jZSBub3QgYmVpbmcgaGVsZC4KClNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNj
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CkNjOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Cgp2MjoKIC0gUmUtbmFtZSBjbGVhcl9h
c3NpZ25tZW50X3JlZmVyZW5jZSgpIHRvIHB1dF9wYWdlX2FsbG9jX3JlZigpCiAtIFN3YXAgQVNT
RVJUKCkgZm9yIEJVR19PTigpCiAtIEFkZCBhbiBleHRyYSBjb21tZW50IGV4cGxhaW5pbmcgd2hh
dCBwdXRfcGFnZV9hbGxvY19yZWYoKSBpcyBkb2luZwotLS0KIHhlbi9hcmNoL2FybS9kb21haW4u
YyAgICAgICAgIHwgIDQgKy0tLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgfCAgMyAr
LS0KIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgIHwgMTEgKystLS0tLS0tLS0KIHhlbi9h
cmNoL3g4Ni9tbS5jICAgICAgICAgICAgIHwgIDMgKy0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3No
YXJpbmcuYyB8ICA5ICsrKy0tLS0tLQogeGVuL2FyY2gveDg2L21tL3AybS1wb2QuYyAgICAgfCAg
NCArLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICB8ICAzICstLQogeGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jICAgICAgfCAgMyArLS0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAg
ICAgIHwgIDUgKystLS0KIHhlbi9jb21tb24veGVub3Byb2YuYyAgICAgICAgIHwgIDMgKy0tCiB4
ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiAxMSBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKaW5kZXggNGY0
NGQ1Yzc0Mi4uOTQxYmJmZjRmZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCisr
KyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwpAQCAtOTI2LDkgKzkyNiw3IEBAIHN0YXRpYyBpbnQg
cmVsaW5xdWlzaF9tZW1vcnkoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfbGlzdF9oZWFk
ICpsaXN0KQogICAgICAgICAgICAgICovCiAgICAgICAgICAgICBjb250aW51ZTsKIAotICAgICAg
ICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2lu
Zm8pICkKLSAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwotCisgICAgICAgIHB1dF9wYWdlX2Fs
bG9jX3JlZihwYWdlKTsKICAgICAgICAgcHV0X3BhZ2UocGFnZSk7CiAKICAgICAgICAgaWYgKCBo
eXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwppbmRleCAxNDdmOTZhMDllLi5lNzkxZDg2ODky
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKKysrIGIveGVuL2FyY2gveDg2L2Rv
bWFpbi5jCkBAIC0xOTM5LDggKzE5MzksNyBAQCBzdGF0aWMgaW50IHJlbGlucXVpc2hfbWVtb3J5
KAogICAgICAgICAgICAgQlVHKCk7CiAgICAgICAgIH0KIAotICAgICAgICBpZiAoIHRlc3RfYW5k
X2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8pICkKLSAgICAgICAg
ICAgIHB1dF9wYWdlKHBhZ2UpOworICAgICAgICBwdXRfcGFnZV9hbGxvY19yZWYocGFnZSk7CiAK
ICAgICAgICAgLyoKICAgICAgICAgICogRm9yY2libHkgaW52YWxpZGF0ZSB0b3AtbW9zdCwgc3Rp
bGwgdmFsaWQgcGFnZSB0YWJsZXMgYXQgdGhpcyBwb2ludApkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCmluZGV4IDdhODBjZmIy
OGIuLmE3OWNhYmI2ODAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKQEAgLTM5OCw4ICszOTgsNyBAQCBzdGF0aWMgaW50
IGh2bV9hbGxvY19pb3JlcV9tZm4oc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMsIGJvb2wgYnVm
KQogICAgIHJldHVybiAwOwogCiAgZmFpbDoKLSAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChf
UEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8pICkKLSAgICAgICAgcHV0X3BhZ2UocGFn
ZSk7CisgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOwogICAgIHB1dF9wYWdlX2FuZF90eXBl
KHBhZ2UpOwogCiAgICAgcmV0dXJuIC1FTk9NRU07CkBAIC00MTgsMTMgKzQxNyw3IEBAIHN0YXRp
YyB2b2lkIGh2bV9mcmVlX2lvcmVxX21mbihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywgYm9v
bCBidWYpCiAgICAgdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGlvcnAtPnZhKTsKICAgICBpb3Jw
LT52YSA9IE5VTEw7CiAKLSAgICAvKgotICAgICAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBj
bGVhciB0aGUgYWxsb2NhdGlvbiByZWZlcmVuY2UgYmVmb3JlCi0gICAgICogZHJvcHBpbmcgdGhl
IGV4cGxpY2l0IHJlZmVyZW5jZXMgdGFrZW4gYnkgZ2V0X3BhZ2VfYW5kX3R5cGUoKS4KLSAgICAg
Ki8KLSAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNv
dW50X2luZm8pICkKLSAgICAgICAgcHV0X3BhZ2UocGFnZSk7Ci0KKyAgICBwdXRfcGFnZV9hbGxv
Y19yZWYocGFnZSk7CiAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7CiB9CiAKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZGYyYzAxMzBm
MS4uMTM4NjYyZTc3NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tLmMKQEAgLTQ5OCw4ICs0OTgsNyBAQCB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhf
Z3Vlc3Qoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgc3RydWN0IGRvbWFpbiAqZCwKIAogdm9pZCBm
cmVlX3NoYXJlZF9kb21oZWFwX3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKIHsKLSAgICBp
ZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8p
ICkKLSAgICAgICAgcHV0X3BhZ2UocGFnZSk7CisgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2Up
OwogICAgIGlmICggIXRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX3hlbl9oZWFwLCAmcGFnZS0+Y291
bnRfaW5mbykgKQogICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKICAgICBwYWdlLT51Lmlu
dXNlLnR5cGVfaW5mbyA9IDA7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCmluZGV4IGYxNmEzZjUzMjQuLjU4
ZDkxNTdmYTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCkBAIC0xMDAwLDggKzEwMDAsNyBAQCBzdGF0
aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFu
ZGxlX3Qgc2gsCiAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2soZmlyc3RwZyk7CiAKICAgICAv
KiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLwotICAgIGlmKHRlc3RfYW5kX2NsZWFyX2JpdChfUEdD
X2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkKLSAgICAgICAgcHV0X3BhZ2UoY3BhZ2Up
OworICAgIHB1dF9wYWdlX2FsbG9jX3JlZihjcGFnZSk7CiAgICAgcHV0X3BhZ2UoY3BhZ2UpOwog
CiAgICAgLyogV2UgbWFuYWdlZCB0byBmcmVlIGEgZG9tYWluIHBhZ2UuICovCkBAIC0xMDgyLDgg
KzEwODEsNyBAQCBpbnQgbWVtX3NoYXJpbmdfYWRkX3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAq
c2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hhbmRsZQogICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAtRU9WRVJGTE9XOwogICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl91bmxvY2s7CiAg
ICAgICAgICAgICAgICAgfQotICAgICAgICAgICAgICAgIGlmICggdGVzdF9hbmRfY2xlYXJfYml0
KF9QR0NfYWxsb2NhdGVkLCAmY3BhZ2UtPmNvdW50X2luZm8pICkKLSAgICAgICAgICAgICAgICAg
ICAgcHV0X3BhZ2UoY3BhZ2UpOworICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihj
cGFnZSk7CiAgICAgICAgICAgICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwogICAgICAgICAgICAgfQog
ICAgICAgICB9CkBAIC0xMTc3LDggKzExNzUsNyBAQCBpbnQgX19tZW1fc2hhcmluZ191bnNoYXJl
X3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgICAgICBkb21haW5fY3Jhc2goZCk7
CiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1ZFUkZMT1c7CiAgICAgICAgICAgICB9Ci0gICAg
ICAgICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNv
dW50X2luZm8pICkKLSAgICAgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKKyAgICAgICAgICAg
IHB1dF9wYWdlX2FsbG9jX3JlZihwYWdlKTsKICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwog
ICAgICAgICB9CiAgICAgICAgIHB1dF9nZm4oZCwgZ2ZuKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0tcG9kLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLXBvZC5jCmluZGV4IDQzMTM4
NjMwNjYuLjA5NmUyNzczZmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYwpAQCAtMjc0LDkgKzI3NCw3IEBAIHAybV9w
b2Rfc2V0X2NhY2hlX3RhcmdldChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25n
IHBvZF90YXJnZXQsIGludCBwCiAgICAgICAgICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChf
UEdUX3Bpbm5lZCwgJihwYWdlK2kpLT51LmludXNlLnR5cGVfaW5mbykgKQogICAgICAgICAgICAg
ICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UgKyBpKTsKIAotICAgICAgICAgICAgaWYgKCB0ZXN0
X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICYocGFnZStpKS0+Y291bnRfaW5mbykgKQot
ICAgICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UgKyBpKTsKLQorICAgICAgICAgICAgcHV0X3Bh
Z2VfYWxsb2NfcmVmKHBhZ2UgKyBpKTsKICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UgKyBpKTsK
IAogICAgICAgICAgICAgaWYgKCBwcmVlbXB0aWJsZSAmJiBwb2RfdGFyZ2V0ICE9IHAybS0+cG9k
LmNvdW50ICYmCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKaW5kZXggNGM5OTU0ODY3Yy4uODgzMzUyZGE3ZCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMTYwOSw4
ICsxNjA5LDcgQEAgaW50IHAybV9tZW1fcGFnaW5nX2V2aWN0KHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGxvbmcgZ2ZuX2wpCiAgICAgICAgIGdvdG8gb3V0X3B1dDsKIAogICAgIC8qIERlY3Jl
bWVudCBndWVzdCBkb21haW4ncyByZWYgY291bnQgb2YgdGhlIHBhZ2UgKi8KLSAgICBpZiAoIHRl
c3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50X2luZm8pICkKLSAg
ICAgICAgcHV0X3BhZ2UocGFnZSk7CisgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOwogCiAg
ICAgLyogUmVtb3ZlIG1hcHBpbmcgZnJvbSBwMm0gdGFibGUgKi8KICAgICByZXQgPSBwMm1fc2V0
X2VudHJ5KHAybSwgZ2ZuLCBJTlZBTElEX01GTiwgUEFHRV9PUkRFUl80SywKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwppbmRl
eCBlNmEwZjMwYTRiLi5mMGNhMTBhN2ZhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMKKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC0xNzA3LDggKzE3MDcsNyBA
QCBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBncmFudF90YWJsZSAqZ3QpCiAgICAgICAgIH0KIAogICAgICAgICBCVUdfT04ocGFnZV9nZXRf
b3duZXIocGcpICE9IGQpOwotICAgICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2Fs
bG9jYXRlZCwgJnBnLT5jb3VudF9pbmZvKSApCi0gICAgICAgICAgICBwdXRfcGFnZShwZyk7Cisg
ICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihwZyk7CiAKICAgICAgICAgaWYgKCBwZy0+Y291bnRf
aW5mbyAmIH5QR0NfeGVuX2hlYXAgKQogICAgICAgICB7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L21lbW9yeS5jIGIveGVuL2NvbW1vbi9tZW1vcnkuYwppbmRleCAwM2RiN2JmYTllLi4zMGQyMTBm
YzA4IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCisrKyBiL3hlbi9jb21tb24vbWVt
b3J5LmMKQEAgLTM4OCw5ICszODgsOCBAQCBpbnQgZ3Vlc3RfcmVtb3ZlX3BhZ2Uoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnbWZuKQogICAgICAqIEZvciB0aGlzIHB1cnBvc2UgKGFu
ZCB0byBtYXRjaCBwb3B1bGF0ZV9waHlzbWFwKCkgYmVoYXZpb3IpLCB0aGUgcGFnZQogICAgICAq
IGlzIGtlcHQgYWxsb2NhdGVkLgogICAgICAqLwotICAgIGlmICggIXJjICYmICFpc19kb21haW5f
ZGlyZWN0X21hcHBlZChkKSAmJgotICAgICAgICAgdGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxs
b2NhdGVkLCAmcGFnZS0+Y291bnRfaW5mbykgKQotICAgICAgICBwdXRfcGFnZShwYWdlKTsKKyAg
ICBpZiAoICFyYyAmJiAhaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgKQorICAgICAgICBwdXRf
cGFnZV9hbGxvY19yZWYocGFnZSk7CiAKICAgICBwdXRfcGFnZShwYWdlKTsKIApkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi94ZW5vcHJvZi5jIGIveGVuL2NvbW1vbi94ZW5vcHJvZi5jCmluZGV4IDhh
NzJlMzgyZTYuLjRmM2U3OTllYmIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24veGVub3Byb2YuYwor
KysgYi94ZW4vY29tbW9uL3hlbm9wcm9mLmMKQEAgLTE3Myw4ICsxNzMsNyBAQCB1bnNoYXJlX3hl
bm9wcm9mX3BhZ2Vfd2l0aF9ndWVzdChzdHJ1Y3QgeGVub3Byb2YgKngpCiAgICAgICAgIHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2UgPSBtZm5fdG9fcGFnZShtZm5fYWRkKG1mbiwgaSkpOwogCiAgICAg
ICAgIEJVR19PTihwYWdlX2dldF9vd25lcihwYWdlKSAhPSBjdXJyZW50LT5kb21haW4pOwotICAg
ICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBhZ2UtPmNvdW50
X2luZm8pICkKLSAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOworICAgICAgICBwdXRfcGFnZV9h
bGxvY19yZWYocGFnZSk7CiAgICAgfQogfQogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
bW0uaCBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCmluZGV4IGE1Nzk3NGFlNTEuLjVkMGMxOWYwMTEg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9t
bS5oCkBAIC02NTgsNCArNjU4LDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzaGFyZV94ZW5fcGFn
ZV93aXRoX3ByaXZpbGVnZWRfZ3Vlc3RzKAogICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qo
cGFnZSwgZG9tX3hlbiwgZmxhZ3MpOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgcHV0X3BhZ2Vf
YWxsb2NfcmVmKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCit7CisgICAgLyoKKyAgICAgKiBXaGVu
ZXZlciBhIHBhZ2UgaXMgYXNzaWduZWQgdG8gYSBkb21haW4gdGhlbiB0aGUgX1BHQ19hbGxvY2F0
ZWQgYml0CisgICAgICogaXMgc2V0IGFuZCB0aGUgcmVmZXJlbmNlIGNvdW50IGlzIHNldCB0byBh
dCBsZWFzdCAxLiBUaGlzIGZ1bmN0aW9uCisgICAgICogY2xlYXJzIHRoYXQgJ2FsbG9jYXRpb24g
cmVmZXJlbmNlJyBidXQgaXQgaXMgdW5zYWZlIHRvIGRvIHNvIHdpdGhvdXQKKyAgICAgKiB0aGUg
Y2FsbGVyIGhvbGRpbmcgYW4gYWRkaXRpb25hbCByZWZlcmVuY2UuIEkuZS4gdGhlIGFsbG9jYXRp
b24KKyAgICAgKiByZWZlcmVuY2UgbXVzdCBuZXZlciBiZSB0aGUgbGFzdCByZWZlcmVuY2UgaGVs
ZC4KKyAgICAgKi8KKyAgICBCVUdfT04oKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFz
aykgPD0gMSk7CisgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZw
YWdlLT5jb3VudF9pbmZvKSApCisgICAgICAgIHB1dF9wYWdlKHBhZ2UpOworfQorCiAjZW5kaWYg
LyogX19YRU5fTU1fSF9fICovCi0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
