Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66078B8B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:16:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Vi-0006dF-1R; Mon, 29 Jul 2019 12:12:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs4Vg-0006cc-Vw
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:13 +0000
X-Inumbo-ID: 185cb658-b1fa-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 185cb658-b1fa-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:12:12 +0000 (UTC)
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
IronPort-SDR: 5QZiSNMik7uRCxlEeakZ1vL297kyK81835L9fPWpvLzcdvePxl5X3If1poscTHuzkrJsUzbEMr
 NcJu7oUn3vXinvH09IEq3CvDy+rBA6xCJ2BSDfPlA26tKOfcp4ZZseklU+A36Z6/2YIH7KlOl6
 pQQkzCLs2jkJTnHbG+XWBWnFkwr4xsUxjLxgGrvpZWoFnhrUNAjAhs43Ijrd/EXJatnB12CMj3
 wvcPFEdcLbeWuZiexO1OUvu5gHionW3RPTUnOKlik0HwW5dtXwKsO/KTPjxiTfUTYf/xDOUu5Y
 BwU=
X-SBRS: 2.7
X-MesageID: 3672665
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3672665"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 13:12:00 +0100
Message-ID: <20190729121204.13559-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729121204.13559-1-andrew.cooper3@citrix.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/10] xen/nodemask: Introduce a
 NODEMASK_PR() wrapper for printing
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

UmV3b3JrIG5vZGVzX2FkZHIoKSBpbnRvIG5vZGVtYXNrX2JpdHMoKSBhbmQgY2hhbmdlIHRoZSBp
bmRpcmVjdGlvbiB0byBtYXRjaAppdHMgY3B1bWFza19iaXRzKCkgY291bnRlcnBhcnQsIGFuZCB1
cGRhdGUgdGhlIGNhbGxlci4KClVzZSBOT0RFTUFTS19QUigpIHRvIGZpeCB1cCBvbmUgb3BlbmNv
ZGVkIGFjY2VzcyBpbnRvIG5vZGVtYXNrLmJpdHMgaW4KZHVtcF9kb21haW5zKCkuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkNDOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+Cgp2MzoKICogTmV3Ci0tLQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAg
fCAgNCArKy0tCiB4ZW4vY29tbW9uL2tleWhhbmRsZXIuYyAgICB8ICAyICstCiB4ZW4vaW5jbHVk
ZS94ZW4vbm9kZW1hc2suaCB8IDEzICsrKysrKysrKystLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2Rv
bWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwuYwppbmRleCBmYTI2MGNlNWZiLi45ZWQ5ZjU3ZjBk
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCisrKyBiL3hlbi9jb21tb24vZG9tY3Rs
LmMKQEAgLTEyMywxNCArMTIzLDE0IEBAIGludCB4ZW5jdGxfYml0bWFwX3RvX2NwdW1hc2soY3B1
bWFza192YXJfdCAqY3B1bWFzaywKIHN0YXRpYyBpbnQgbm9kZW1hc2tfdG9feGVuY3RsX2JpdG1h
cChzdHJ1Y3QgeGVuY3RsX2JpdG1hcCAqeGVuY3RsX25vZGVtYXAsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgbm9kZW1hc2tfdCAqbm9kZW1hc2spCiB7Ci0gICAg
cmV0dXJuIGJpdG1hcF90b194ZW5jdGxfYml0bWFwKHhlbmN0bF9ub2RlbWFwLCBub2Rlc19hZGRy
KCpub2RlbWFzayksCisgICAgcmV0dXJuIGJpdG1hcF90b194ZW5jdGxfYml0bWFwKHhlbmN0bF9u
b2RlbWFwLCBub2RlbWFza19iaXRzKG5vZGVtYXNrKSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTUFYX05VTU5PREVTKTsKIH0KIAogc3RhdGljIGludCB4ZW5jdGxfYml0bWFw
X3RvX25vZGVtYXNrKG5vZGVtYXNrX3QgKm5vZGVtYXNrLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB4ZW5jdGxfYml0bWFwICp4ZW5jdGxfbm9kZW1h
cCkKIHsKLSAgICByZXR1cm4geGVuY3RsX2JpdG1hcF90b19iaXRtYXAobm9kZXNfYWRkcigqbm9k
ZW1hc2spLCB4ZW5jdGxfbm9kZW1hcCwKKyAgICByZXR1cm4geGVuY3RsX2JpdG1hcF90b19iaXRt
YXAobm9kZW1hc2tfYml0cyhub2RlbWFzayksIHhlbmN0bF9ub2RlbWFwLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBNQVhfTlVNTk9ERVMpOwogfQogCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2tleWhhbmRsZXIuYyBiL3hlbi9jb21tb24va2V5aGFuZGxlci5jCmluZGV4IGE1
ZTk1ZTJmZTkuLjU3YjM2MGVlNGIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24va2V5aGFuZGxlci5j
CisrKyBiL3hlbi9jb21tb24va2V5aGFuZGxlci5jCkBAIC0yOTMsNyArMjkzLDcgQEAgc3RhdGlj
IHZvaWQgZHVtcF9kb21haW5zKHVuc2lnbmVkIGNoYXIga2V5KQogICAgICAgICBkdW1wX3BhZ2Vm
cmFtZV9pbmZvKGQpOwogCiAgICAgICAgIHByaW50aygiTk9ERSBhZmZpbml0eSBmb3IgZG9tYWlu
ICVkOiBbJSpwYmxdXG4iLAotICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBNQVhfTlVNTk9E
RVMsIGQtPm5vZGVfYWZmaW5pdHkuYml0cyk7CisgICAgICAgICAgICAgICBkLT5kb21haW5faWQs
IE5PREVNQVNLX1BSKCZkLT5ub2RlX2FmZmluaXR5KSk7CiAKICAgICAgICAgcHJpbnRrKCJWQ1BV
IGluZm9ybWF0aW9uIGFuZCBjYWxsYmFja3MgZm9yIGRvbWFpbiAldTpcbiIsCiAgICAgICAgICAg
ICAgICBkLT5kb21haW5faWQpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL25vZGVtYXNr
LmggYi94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaAppbmRleCA3YWI4Yjc5NGM2Li4xZGQ2Yzc0
NThlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vbm9kZW1hc2suaApAQCAtMzksNyArMzksNyBAQAogICogbm9kZW1hc2tfdCBub2Rl
bWFza19vZl9ub2RlKG5vZGUpCVJldHVybiBub2RlbWFzayB3aXRoIGJpdCAnbm9kZScgc2V0CiAg
KiBOT0RFX01BU0tfQUxMCQkJSW5pdGlhbGl6ZXIgLSBhbGwgYml0cyBzZXQKICAqIE5PREVfTUFT
S19OT05FCQkJSW5pdGlhbGl6ZXIgLSBubyBiaXRzIHNldAotICogdW5zaWduZWQgbG9uZyAqbm9k
ZXNfYWRkcihtYXNrKQlBcnJheSBvZiB1bnNpZ25lZCBsb25nJ3MgaW4gbWFzaworICogdW5zaWdu
ZWQgbG9uZyAqbm9kZW1hc2tfYml0cyhtYXNrKQlBcnJheSBvZiB1bnNpZ25lZCBsb25nJ3MgaW4g
bWFzawogICoKICAqIGZvcl9lYWNoX25vZGVfbWFzayhub2RlLCBtYXNrKQlmb3ItbG9vcCBub2Rl
IG92ZXIgbWFzawogICoKQEAgLTU4LDYgKzU4LDE1IEBACiAjaW5jbHVkZSA8eGVuL251bWEuaD4K
IAogdHlwZWRlZiBzdHJ1Y3QgeyBERUNMQVJFX0JJVE1BUChiaXRzLCBNQVhfTlVNTk9ERVMpOyB9
IG5vZGVtYXNrX3Q7CisKKy8qCisgKiBwcmludGYgYXJndW1lbnRzIGZvciBhIG5vZGVtYXNrLiAg
U2hvcnRoYW5kIGZvciB1c2luZyAnJSpwYltsXScgd2hlbgorICogcHJpbnRpbmcgYSBub2RlbWFz
ay4KKyAqLworI2RlZmluZSBOT0RFTUFTS19QUihzcmMpIE1BWF9OVU1OT0RFUywgbm9kZW1hc2tf
Yml0cyhzcmMpCisKKyNkZWZpbmUgbm9kZW1hc2tfYml0cyhzcmMpICgoc3JjKS0+Yml0cykKKwog
ZXh0ZXJuIG5vZGVtYXNrX3QgX3VudXNlZF9ub2RlbWFza19hcmdfOwogCiAjZGVmaW5lIG5vZGVf
c2V0KG5vZGUsIGRzdCkgX19ub2RlX3NldCgobm9kZSksICYoZHN0KSkKQEAgLTI1MCw4ICsyNTks
NiBAQCBzdGF0aWMgaW5saW5lIGludCBfX2N5Y2xlX25vZGUoaW50IG4sIGNvbnN0IG5vZGVtYXNr
X3QgKm1hc2twLCBpbnQgbmJpdHMpCiAJWzAgLi4uIEJJVFNfVE9fTE9OR1MoTUFYX05VTU5PREVT
KS0xXSA9ICAwVUwJCQlcCiB9IH0pCiAKLSNkZWZpbmUgbm9kZXNfYWRkcihzcmMpICgoc3JjKS5i
aXRzKQotCiAjaWYgTUFYX05VTU5PREVTID4gMQogI2RlZmluZSBmb3JfZWFjaF9ub2RlX21hc2so
bm9kZSwgbWFzaykJCQlcCiAJZm9yICgobm9kZSkgPSBmaXJzdF9ub2RlKG1hc2spOwkJCVwKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
