Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4BC4E3C0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:38:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFyR-0007aY-Ih; Fri, 21 Jun 2019 09:36:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mzu6=UU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1heFyP-0007a9-QI
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:36:45 +0000
X-Inumbo-ID: 152d0e33-9408-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 152d0e33-9408-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:36:44 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pJBqWnN1+Zomj8YcpNMobkrhTT26oNYxj6+fwFmgCGNca26V+TRBk9BNwD0Xq1upyfT3pZwqct
 H3vNTM+CbqEwOThyqzFgaPr3OMnNSd7g6ihEd8KYfEE9cvCYfMu2joQD8Zy+sI5BW5X4LDwccd
 YZWrpreQ6NyWJp8GiZnR+eH/nymFelEKr8tAjaaj0LXwahK17ASE4jwSWpxnqRa0EciIo6aSVE
 HywicuF133pwCzD2RXbUo6ljFkb6Zq3fuXJwgr5iOigqQx6cUOGDUmnVXpRl9xQNCaarbPdnZ2
 5ts=
X-SBRS: 2.7
X-MesageID: 2060661
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,399,1557201600"; 
   d="scan'208";a="2060661"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 10:36:36 +0100
Message-ID: <1561109798-8744-4-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
References: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/5] arm/gnttab: Implement stub helpers as
 static inlines
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgaW5lZmZpY2llbnQgdG8gY2FsbCBpbnRvIGEgZGlmZmVyZW50IHRyYW5zbGF0aW9uIHVu
aXQgZm9yIGEgc3R1YgpmdW5jdGlvbiwgd2hlbiBhIHN0YXRpYyBpbmxpbmUgd2lsbCB3b3JrIGZp
bmUuICBSZXBsYWNlIGFuIG9wZW4tY29kZWQKcHJpbnRrX29uY2UoKSB3aGlsZSBtb3ZpbmcgaXQu
CgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICAgICAgICAgfCAxNiAtLS0tLS0tLS0t
LS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmggfCAxNyArKysrKysrKysr
KysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmlu
ZGV4IDM1ZGMxZjcuLjQ0MjU4YWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBi
L3hlbi9hcmNoL2FybS9tbS5jCkBAIC00MSw3ICs0MSw2IEBACiAjaW5jbHVkZSA8eGVuL3NpemVz
Lmg+CiAjaW5jbHVkZSA8eGVuL2xpYmZkdC9saWJmZHQuaD4KIAotI2luY2x1ZGUgPGFzbS9ndWVz
dF9hdG9taWNzLmg+CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAKIC8qIE92ZXJyaWRlIG1hY3Jv
cyBmcm9tIGFzbS9wYWdlLmggdG8gbWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwpAQCAtMTUz
MiwyMSArMTUzMSw2IEBAIHZvaWQgcHV0X3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
KQogICAgIHJldHVybjsKIH0KIAotdm9pZCBnbnR0YWJfY2xlYXJfZmxhZyhzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIG5yLCB1aW50MTZfdCAqYWRkcikKLXsKLSAgICBndWVzdF9jbGVh
cl9tYXNrMTYoZCwgQklUKG5yLCBVTCksIGFkZHIpOwotfQotCi12b2lkIGdudHRhYl9tYXJrX2Rp
cnR5KHN0cnVjdCBkb21haW4gKmQsIG1mbl90IG1mbikKLXsKLSAgICAvKiBYWFg6IG1hcmsgZGly
dHkgKi8KLSAgICBzdGF0aWMgaW50IHdhcm5pbmc7Ci0gICAgaWYgKCF3YXJuaW5nKSB7Ci0gICAg
ICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiZ250dGFiX21hcmtfZGlydHkgbm90IGltcGxl
bWVudGVkIHlldFxuIik7Ci0gICAgICAgIHdhcm5pbmcgPSAxOwotICAgIH0KLX0KLQogaW50IGNy
ZWF0ZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9uZyBhZGRyLCBtZm5fdCBmcmFtZSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncywgdW5zaWdu
ZWQgaW50IGNhY2hlX2ZsYWdzKQogewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9n
cmFudF90YWJsZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oCmluZGV4IDFl
ZDBhZWYuLmIwZDY3M2IgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFi
bGUuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmgKQEAgLTYsNiArNiw4
IEBACiAjaW5jbHVkZSA8eGVuL3Bmbi5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogCisjaW5j
bHVkZSA8YXNtL2d1ZXN0X2F0b21pY3MuaD4KKwogI2RlZmluZSBJTklUSUFMX05SX0dSQU5UX0ZS
QU1FUyAxVQogI2RlZmluZSBHTlRUQUJfTUFYX1ZFUlNJT04gMQogCkBAIC0xNCwxMyArMTYsMjQg
QEAgc3RydWN0IGdyYW50X3RhYmxlX2FyY2ggewogICAgIGdmbl90ICpzdGF0dXNfZ2ZuOwogfTsK
IAotdm9pZCBnbnR0YWJfY2xlYXJfZmxhZyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25n
IG5yLCB1aW50MTZfdCAqYWRkcik7CitzdGF0aWMgaW5saW5lIHZvaWQgZ250dGFiX2NsZWFyX2Zs
YWcoc3RydWN0IGRvbWFpbiAqZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIG5yLCB1aW50MTZfdCAqYWRkcikKK3sKKyAgICBndWVzdF9jbGVhcl9t
YXNrMTYoZCwgQklUKG5yLCBVTCksIGFkZHIpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgZ250
dGFiX21hcmtfZGlydHkoc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuKQoreworI2lmbmRlZiBO
REVCVUcKKyAgICBwcmludGtfb25jZShYRU5MT0dfR19XQVJOSU5HICJnbnR0YWJfbWFya19kaXJ0
eSBub3QgaW1wbGVtZW50ZWQgeWV0XG4iKTsKKyNlbmRpZgorfQorCiBpbnQgY3JlYXRlX2dyYW50
X2hvc3RfbWFwcGluZyh1bnNpZ25lZCBsb25nIGdwYWRkciwgbWZuX3QgbWZuLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzLCB1bnNpZ25lZCBpbnQgY2Fj
aGVfZmxhZ3MpOwogI2RlZmluZSBnbnR0YWJfaG9zdF9tYXBwaW5nX2dldF9wYWdlX3R5cGUocm8s
IGxkLCByZCkgKDApCiBpbnQgcmVwbGFjZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9u
ZyBncGFkZHIsIG1mbl90IG1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIG5ld19ncGFkZHIsIHVuc2lnbmVkIGludCBmbGFncyk7Ci12b2lkIGdudHRhYl9t
YXJrX2RpcnR5KHN0cnVjdCBkb21haW4gKmQsIG1mbl90IG1mbik7CiAjZGVmaW5lIGdudHRhYl9y
ZWxlYXNlX2hvc3RfbWFwcGluZ3MoZG9tYWluKSAxCiAKIC8qCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
