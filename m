Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611CD78B8A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:16:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Vk-0006fM-PI; Mon, 29 Jul 2019 12:12:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs4Vi-0006dc-9g
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:14 +0000
X-Inumbo-ID: 19196c88-b1fa-11e9-a920-c38cce9d7243
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19196c88-b1fa-11e9-a920-c38cce9d7243;
 Mon, 29 Jul 2019 12:12:13 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DrraWLNbgCR9vHZf8Lr+j2mjbl3oOB4oIFPs8no0crbJy+jJ/Q4kM85d8qYfduYgPJmxNErBOz
 LIqIK2AJL5sLr/Jtl5o7VgfIDUANGoYAZjCRi7dhKohTv2OSO/66nY59t7NyaG6QLtU2xMYNFQ
 9Lkb6uWLLoJyYvCss6sh+/6eNzIyy3kjpPGcgirqnIhxRPbVn/A6lYsdYIdcGitGRyQk0ng1RA
 5MKB5KVoQD9+1qs+gErcO4Wp4hOy9z2jPVu9G5S1A4vlOffqOl0ao4a02fhkGE6W2bDy4fjLuv
 jas=
X-SBRS: 2.7
X-MesageID: 3672667
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3672667"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 13:12:02 +0100
Message-ID: <20190729121204.13559-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729121204.13559-1-andrew.cooper3@citrix.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 08/10] xen/nodemask: Introduce unlocked
 __nodemask_{set, clear}() helpers
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgd2l0aCB0aGUgY3B1bWFzayBzaWRlIG9mIHRoaW5ncywgdGhlcmUgYXJlIHRpbWVzIHdoZW4g
d2UgZG8gbm90IG5lZWQgbG9ja2VkCmJpdCBvcGVyYXRpb25zIG9uIGEgbm9kZW1hc2suCgpDb252
ZXJ0IGFwcHJvcHJpYXRlIGNhbGxlcnMuICBUaHJlZSBvZiB0aGVtIG9wZXJhdGUgb24gaW5pdC10
aW1lIGRhdGEsIHdoaWxlCmRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eSgpIGFscmVhZHkgaGFz
IHVwZGF0ZXMgdG8gdGhlIG5vZGVtYXNrIGluIHF1ZXN0aW9uCnByb3RlY3RlZCBieSBhIHNwaW5s
b2NrLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZv
bG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgoKdjM6CiAqIE5ldwotLS0KIHhlbi9hcmNoL3g4Ni9k
b20wX2J1aWxkLmMgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9zcmF0LmMgICAgICAgIHwgIDQgKyst
LQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUveGVuL25v
ZGVtYXNrLmggfCAxMiArKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tMF9idWls
ZC5jIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwppbmRleCAwNjUwMGM4N2M2Li5jNjI1ZTY0
ZDAzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9kb20wX2J1aWxkLmMKQEAgLTI0Niw3ICsyNDYsNyBAQCB1bnNpZ25lZCBpbnQgX19pbml0
IGRvbTBfbWF4X3ZjcHVzKHZvaWQpCiAKICAgICBmb3IgKCBpID0gMDsgaSA8IGRvbTBfbnJfcHht
czsgKytpICkKICAgICAgICAgaWYgKCAobm9kZSA9IHB4bV90b19ub2RlKGRvbTBfcHhtc1tpXSkp
ICE9IE5VTUFfTk9fTk9ERSApCi0gICAgICAgICAgICBub2RlX3NldChub2RlLCBkb20wX25vZGVz
KTsKKyAgICAgICAgICAgIF9fbm9kZW1hc2tfc2V0KG5vZGUsICZkb20wX25vZGVzKTsKICAgICBu
b2Rlc19hbmQoZG9tMF9ub2RlcywgZG9tMF9ub2Rlcywgbm9kZV9vbmxpbmVfbWFwKTsKICAgICBp
ZiAoIG5vZGVzX2VtcHR5KGRvbTBfbm9kZXMpICkKICAgICAgICAgZG9tMF9ub2RlcyA9IG5vZGVf
b25saW5lX21hcDsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMgYi94ZW4vYXJjaC94
ODYvc3JhdC5jCmluZGV4IDUwNmE1NmQ2NmIuLjVmNDRhYzI3ZjEgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9zcmF0LmMKKysrIGIveGVuL2FyY2gveDg2L3NyYXQuYwpAQCAtMjI4LDcgKzIyOCw3
IEBAIGFjcGlfbnVtYV94MmFwaWNfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QgYWNwaV9zcmF0
X3gyYXBpY19jcHVfYWZmaW5pdHkgKnBhKQogCX0KIAogCWFwaWNpZF90b19ub2RlW3BhLT5hcGlj
X2lkXSA9IG5vZGU7Ci0Jbm9kZV9zZXQobm9kZSwgcHJvY2Vzc29yX25vZGVzX3BhcnNlZCk7CisJ
X19ub2RlbWFza19zZXQobm9kZSwgJnByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQpOwogCWFjcGlfbnVt
YSA9IDE7CiAJcHJpbnRrKEtFUk5fSU5GTyAiU1JBVDogUFhNICV1IC0+IEFQSUMgJTA4eCAtPiBO
b2RlICV1XG4iLAogCSAgICAgICBweG0sIHBhLT5hcGljX2lkLCBub2RlKTsKQEAgLTI2MSw3ICsy
NjEsNyBAQCBhY3BpX251bWFfcHJvY2Vzc29yX2FmZmluaXR5X2luaXQoY29uc3Qgc3RydWN0IGFj
cGlfc3JhdF9jcHVfYWZmaW5pdHkgKnBhKQogCQlyZXR1cm47CiAJfQogCWFwaWNpZF90b19ub2Rl
W3BhLT5hcGljX2lkXSA9IG5vZGU7Ci0Jbm9kZV9zZXQobm9kZSwgcHJvY2Vzc29yX25vZGVzX3Bh
cnNlZCk7CisJX19ub2RlbWFza19zZXQobm9kZSwgJnByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQpOwog
CWFjcGlfbnVtYSA9IDE7CiAJcHJpbnRrKEtFUk5fSU5GTyAiU1JBVDogUFhNICV1IC0+IEFQSUMg
JTAyeCAtPiBOb2RlICV1XG4iLAogCSAgICAgICBweG0sIHBhLT5hcGljX2lkLCBub2RlKTsKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4
IDExNTY1YTY0YjMuLjVkYmM2OGNiYzMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMK
KysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtNjE3LDcgKzYxNyw3IEBAIHZvaWQgZG9tYWlu
X3VwZGF0ZV9ub2RlX2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpCiAKICAgICAgICAgZC0+bm9k
ZV9hZmZpbml0eSA9IE5PREVNQVNLX05PTkU7CiAgICAgICAgIGZvcl9lYWNoX2NwdSAoIGNwdSwg
ZG9tX2FmZmluaXR5ICkKLSAgICAgICAgICAgIG5vZGVfc2V0KGNwdV90b19ub2RlKGNwdSksIGQt
Pm5vZGVfYWZmaW5pdHkpOworICAgICAgICAgICAgX19ub2RlbWFza19zZXQoY3B1X3RvX25vZGUo
Y3B1KSwgJmQtPm5vZGVfYWZmaW5pdHkpOwogICAgIH0KIAogICAgIHNwaW5fdW5sb2NrKCZkLT5u
b2RlX2FmZmluaXR5X2xvY2spOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL25vZGVtYXNr
LmggYi94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaAppbmRleCA5OTMzZmVjNWM0Li4xNjA1YzFi
Y2M1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vbm9kZW1hc2suaApAQCAtMTEsNyArMTEsOSBAQAogICogVGhlIGF2YWlsYWJsZSBu
b2RlbWFzayBvcGVyYXRpb25zIGFyZToKICAqCiAgKiB2b2lkIG5vZGVfc2V0KG5vZGUsIG1hc2sp
CQl0dXJuIG9uIGJpdCAnbm9kZScgaW4gbWFzaworICogdm9pZCBfX25vZGVtYXNrX3NldChub2Rl
LCBtYXNrKQl0dXJuIG9uIGJpdCAnbm9kZScgaW4gbWFzayAodW5sb2NrZWQpCiAgKiB2b2lkIG5v
ZGVfY2xlYXIobm9kZSwgbWFzaykJCXR1cm4gb2ZmIGJpdCAnbm9kZScgaW4gbWFzaworICogdm9p
ZCBfX25vZGVtYXNrX2NsZWFyKG5vZGUsIG1hc2spCXR1cm4gb2ZmIGJpdCAnbm9kZScgaW4gbWFz
ayAodW5sb2NrZWQpCiAgKiBib29sIG5vZGVtYXNrX3Rlc3Qobm9kZSwgbWFzaykJdHJ1ZSBpZmYg
Yml0ICdub2RlJyBzZXQgaW4gbWFzawogICogaW50IG5vZGVfdGVzdF9hbmRfc2V0KG5vZGUsIG1h
c2spCXRlc3QgYW5kIHNldCBiaXQgJ25vZGUnIGluIG1hc2sKICAqCkBAIC0xMDAsMTIgKzEwMiwy
MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19ub2RlX3NldChpbnQgbm9kZSwgdm9sYXRpbGUgbm9k
ZW1hc2tfdCAqZHN0cCkKIAlzZXRfYml0KG5vZGUsIGRzdHAtPmJpdHMpOwogfQogCitzdGF0aWMg
aW5saW5lIHZvaWQgX19ub2RlbWFza19zZXQodW5zaWduZWQgaW50IG5vZGUsIG5vZGVtYXNrX3Qg
KmRzdCkKK3sKKyAgICBfX3NldF9iaXQobm9kZSwgZHN0LT5iaXRzKTsKK30KKwogI2RlZmluZSBu
b2RlX2NsZWFyKG5vZGUsIGRzdCkgX19ub2RlX2NsZWFyKChub2RlKSwgJihkc3QpKQogc3RhdGlj
IGlubGluZSB2b2lkIF9fbm9kZV9jbGVhcihpbnQgbm9kZSwgdm9sYXRpbGUgbm9kZW1hc2tfdCAq
ZHN0cCkKIHsKIAljbGVhcl9iaXQobm9kZSwgZHN0cC0+Yml0cyk7CiB9CiAKK3N0YXRpYyBpbmxp
bmUgdm9pZCBfX25vZGVtYXNrX2NsZWFyKHVuc2lnbmVkIGludCBub2RlLCBub2RlbWFza190ICpk
c3QpCit7CisgICAgX19jbGVhcl9iaXQobm9kZSwgZHN0LT5iaXRzKTsKK30KKwogc3RhdGljIGlu
bGluZSBib29sIG5vZGVtYXNrX3Rlc3QodW5zaWduZWQgaW50IG5vZGUsIGNvbnN0IG5vZGVtYXNr
X3QgKmRzdCkKIHsKICAgICByZXR1cm4gdGVzdF9iaXQobm9kZSwgZHN0LT5iaXRzKTsKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
