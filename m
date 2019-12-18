Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EBB12521C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:44:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfCa-0007ng-Ig; Wed, 18 Dec 2019 19:41:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfCZ-0007my-7O
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:41:43 +0000
X-Inumbo-ID: 5a2671aa-21ce-11ea-90f3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a2671aa-21ce-11ea-90f3-12813bfff9fa;
 Wed, 18 Dec 2019 19:41:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196304"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:13 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:43 -0800
Message-Id: <eb5f44858d47bde49fbc189e4f3dfe9a2d23d9f9.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 06/20] x86/mem_sharing: drop flags from
 mem_sharing_unshare_page
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIGNhbGxlcnMgcGFzcyAwIGluLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hcy5sZW5neWVsQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgIHwgMiArLQogeGVuL2FyY2gv
eDg2L21tL3AybS5jICAgICAgICAgICAgIHwgNSArKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9t
ZW1fc2hhcmluZy5oIHwgOCArKystLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBi
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggMWU4ODhiNDAzYi4uZTA1NTExNDkyMiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jCkBAIC0xOTAyLDcgKzE5MDIsNyBAQCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChw
YWRkcl90IGdwYSwgdW5zaWduZWQgbG9uZyBnbGEsCiAgICAgaWYgKCBucGZlYy53cml0ZV9hY2Nl
c3MgJiYgKHAybXQgPT0gcDJtX3JhbV9zaGFyZWQpICkKICAgICB7CiAgICAgICAgIEFTU0VSVChw
Mm1faXNfaG9zdHAybShwMm0pKTsKLSAgICAgICAgc2hhcmluZ19lbm9tZW0gPSBtZW1fc2hhcmlu
Z191bnNoYXJlX3BhZ2UoY3VycmQsIGdmbiwgMCk7CisgICAgICAgIHNoYXJpbmdfZW5vbWVtID0g
bWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBnZm4pOwogICAgICAgICByYyA9IDE7CiAg
ICAgICAgIGdvdG8gb3V0X3B1dF9nZm47CiAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCmluZGV4IDMxMTkyNjkwNzMuLmJhZWE2
MzJhY2MgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYworKysgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKQEAgLTUxNSw3ICs1MTUsNyBAQCBtZm5fdCBfX2dldF9nZm5fdHlwZV9hY2Nl
c3Moc3RydWN0IHAybV9kb21haW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm5fbCwKICAgICAgICAg
ICogVHJ5IHRvIHVuc2hhcmUuIElmIHdlIGZhaWwsIGNvbW11bmljYXRlIEVOT01FTSB3aXRob3V0
CiAgICAgICAgICAqIHNsZWVwaW5nLgogICAgICAgICAgKi8KLSAgICAgICAgaWYgKCBtZW1fc2hh
cmluZ191bnNoYXJlX3BhZ2UocDJtLT5kb21haW4sIGdmbl9sLCAwKSA8IDAgKQorICAgICAgICBp
ZiAoIG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShwMm0tPmRvbWFpbiwgZ2ZuX2wpIDwgMCApCiAg
ICAgICAgICAgICBtZW1fc2hhcmluZ19ub3RpZnlfZW5vbWVtKHAybS0+ZG9tYWluLCBnZm5fbCwg
ZmFsc2UpOwogICAgICAgICBtZm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwgdCwgYSwgcSwg
cGFnZV9vcmRlciwgTlVMTCk7CiAgICAgfQpAQCAtODk2LDggKzg5Niw3IEBAIGd1ZXN0X3BoeXNt
YXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgbWZuX3QgbWZuLAogICAg
ICAgICB7CiAgICAgICAgICAgICAvKiBEbyBhbiB1bnNoYXJlIHRvIGNsZWFubHkgdGFrZSBjYXJl
IG9mIGFsbCBjb3JuZXIgY2FzZXMuICovCiAgICAgICAgICAgICBpbnQgcmM7Ci0gICAgICAgICAg
ICByYyA9IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShwMm0tPmRvbWFpbiwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl94KGdmbl9hZGQoZ2ZuLCBpKSksIDAp
OworICAgICAgICAgICAgcmMgPSBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UocDJtLT5kb21haW4s
IGdmbl94KGdmbl9hZGQoZ2ZuLCBpKSkpOwogICAgICAgICAgICAgaWYgKCByYyApCiAgICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICAgcDJtX3VubG9jayhwMm0pOwpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1f
c2hhcmluZy5oCmluZGV4IDdkNDBlMzg1NjMuLjBhOTE5MmQwZTIgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21l
bV9zaGFyaW5nLmgKQEAgLTcwLDEwICs3MCw5IEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVf
cGFnZShzdHJ1Y3QgZG9tYWluICpkLAogCiBzdGF0aWMgaW5saW5lCiBpbnQgbWVtX3NoYXJpbmdf
dW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZ2ZuLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
MTZfdCBmbGFncykKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBn
Zm4pCiB7Ci0gICAgaW50IHJjID0gX19tZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoZCwgZ2ZuLCBm
bGFncyk7CisgICAgaW50IHJjID0gX19tZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoZCwgZ2ZuLCAw
KTsKICAgICBCVUdfT04ocmMgJiYgKHJjICE9IC1FTk9NRU0pKTsKICAgICByZXR1cm4gcmM7CiB9
CkBAIC0xMTcsOCArMTE2LDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgbWVtX3NoYXJp
bmdfZ2V0X25yX3NoYXJlZF9tZm5zKHZvaWQpCiB9CiAKIHN0YXRpYyBpbmxpbmUKLWludCBtZW1f
c2hhcmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm4s
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdzKQoraW50IG1lbV9z
aGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbikK
IHsKICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
