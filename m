Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDDBE1AF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Yd-00023J-Fc; Wed, 25 Sep 2019 15:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Yb-000220-Op
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:50:21 +0000
X-Inumbo-ID: 13934be6-dfac-11e9-8628-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 13934be6-dfac-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812688"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:35 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:51 -0700
Message-Id: <92649106a0d6651ebc8cf42a381418a9c1c8890c.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 13/18] x86/mem_sharing: ASSERT that
 p2m_set_entry succeeds
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDQ2ICsrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBhN2I5NjY1YzhiLi45OWYyNGZj
ZjZjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtMTExMywzOSArMTExMywzNyBAQCBpbnQgYWRk
X3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqc2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLAogICAgICAgICBnb3RvIGVycl91bmxvY2s7CiAgICAgfQogCisgICAgLyoKKyAg
ICAgKiBNdXN0IHN1Y2NlZWQsIHdlIGp1c3QgcmVhZCB0aGUgZW50cnkgYW5kIGhvbGQgdGhlIHAy
bSBsb2NrCisgICAgICogdmlhIGdldF90d29fZ2Zucy4KKyAgICAgKi8KICAgICByZXQgPSBwMm1f
c2V0X2VudHJ5KHAybSwgX2dmbihjZ2ZuKSwgc21mbiwgUEFHRV9PUkRFUl80SywKICAgICAgICAg
ICAgICAgICAgICAgICAgIHAybV9yYW1fc2hhcmVkLCBhKTsKKyAgICBBU1NFUlQoIXJldCk7CiAK
LSAgICAvKiBUZW1wdGVkIHRvIHR1cm4gdGhpcyBpbnRvIGFuIGFzc2VydCAqLwotICAgIGlmICgg
cmV0ICkKKyAgICAvKgorICAgICAqIFRoZXJlIGlzIGEgY2hhbmNlIHdlJ3JlIHBsdWdnaW5nIGEg
aG9sZSB3aGVyZSBhIHBhZ2VkIG91dAorICAgICAqIHBhZ2Ugd2FzLgorICAgICAqLworICAgIGlm
ICggcDJtX2lzX3BhZ2luZyhjbWZuX3R5cGUpICYmIChjbWZuX3R5cGUgIT0gcDJtX3JhbV9wYWdp
bmdfb3V0KSApCiAgICAgewotICAgICAgICBtZW1fc2hhcmluZ19nZm5fZGVzdHJveShzcGFnZSwg
Y2QsIGdmbl9pbmZvKTsKLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoc3BhZ2UpOwotICAgIH0g
ZWxzZSB7CisgICAgICAgIGF0b21pY19kZWMoJmNkLT5wYWdlZF9wYWdlcyk7CiAgICAgICAgIC8q
Ci0gICAgICAgICAqIFRoZXJlIGlzIGEgY2hhbmNlIHdlJ3JlIHBsdWdnaW5nIGEgaG9sZSB3aGVy
ZSBhIHBhZ2VkIG91dAotICAgICAgICAgKiBwYWdlIHdhcy4KKyAgICAgICAgICogRnVydGhlciwg
dGhlcmUgaXMgYSBjaGFuY2UgdGhpcyB3YXMgYSB2YWxpZCBwYWdlLgorICAgICAgICAgKiBEb24n
dCBsZWFrIGl0LgogICAgICAgICAgKi8KLSAgICAgICAgaWYgKCBwMm1faXNfcGFnaW5nKGNtZm5f
dHlwZSkgJiYgKGNtZm5fdHlwZSAhPSBwMm1fcmFtX3BhZ2luZ19vdXQpICkKKyAgICAgICAgaWYg
KCBtZm5fdmFsaWQoY21mbikgKQogICAgICAgICB7Ci0gICAgICAgICAgICBhdG9taWNfZGVjKCZj
ZC0+cGFnZWRfcGFnZXMpOwotICAgICAgICAgICAgLyoKLSAgICAgICAgICAgICAqIEZ1cnRoZXIs
IHRoZXJlIGlzIGEgY2hhbmNlIHRoaXMgd2FzIGEgdmFsaWQgcGFnZS4KLSAgICAgICAgICAgICAq
IERvbid0IGxlYWsgaXQuCi0gICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIGlmICggbWZuX3Zh
bGlkKGNtZm4pICkKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZV9p
bmZvICpjcGFnZSA9IG1mbl90b19wYWdlKGNtZm4pOworICAgICAgICAgICAgc3RydWN0IHBhZ2Vf
aW5mbyAqY3BhZ2UgPSBtZm5fdG9fcGFnZShjbWZuKTsKIAotICAgICAgICAgICAgICAgIGlmICgg
IWdldF9wYWdlKGNwYWdlLCBjZCkgKQotICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAg
ICAgICAgZG9tYWluX2NyYXNoKGNkKTsKLSAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVPVkVS
RkxPVzsKLSAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5sb2NrOwotICAgICAgICAgICAg
ICAgIH0KLSAgICAgICAgICAgICAgICBwdXRfcGFnZV9hbGxvY19yZWYoY3BhZ2UpOwotICAgICAg
ICAgICAgICAgIHB1dF9wYWdlKGNwYWdlKTsKKyAgICAgICAgICAgIGlmICggIWdldF9wYWdlKGNw
YWdlLCBjZCkgKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIGRvbWFpbl9jcmFzaChj
ZCk7CisgICAgICAgICAgICAgICAgcmV0ID0gLUVPVkVSRkxPVzsKKyAgICAgICAgICAgICAgICBn
b3RvIGVycl91bmxvY2s7CiAgICAgICAgICAgICB9CisgICAgICAgICAgICBwdXRfcGFnZV9hbGxv
Y19yZWYoY3BhZ2UpOworICAgICAgICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwogICAgICAgICB9CiAg
ICAgfQogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
