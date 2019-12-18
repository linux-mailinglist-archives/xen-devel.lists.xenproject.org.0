Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21500125216
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:43:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfD4-0008IN-Kd; Wed, 18 Dec 2019 19:42:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfD3-0008HI-8Y
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:42:13 +0000
X-Inumbo-ID: 5d0e22a1-21ce-11ea-90f3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d0e22a1-21ce-11ea-90f3-12813bfff9fa;
 Wed, 18 Dec 2019 19:41:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196365"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:19 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:50 -0800
Message-Id: <8c8e88a464770b9eceab3d70340c7390ff5bd0b3.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 13/20] x86/mem_sharing: ASSERT that
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
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCA5MGI2MzcxZTJmLi5lNWMxNDI0
ZjliIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4v
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
