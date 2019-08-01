Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881E7D941
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:21:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8B1-0001v8-Ml; Thu, 01 Aug 2019 10:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TV56=V5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ht8Az-0001tv-TY
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:19:13 +0000
X-Inumbo-ID: cdafed00-b445-11e9-b847-77e277d4568d
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdafed00-b445-11e9-b847-77e277d4568d;
 Thu, 01 Aug 2019 10:19:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175207938"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 03:19:09 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:22:45 +0800
Message-Id: <1564654971-31328-11-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v8 10/16] microcode/amd: call
 svm_host_osvw_init() in common code
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEgdmVuZG9yIGhvb2ssIC5lbmRfdXBkYXRlLCBmb3Igc3ZtX2hvc3Rfb3N2d19p
bml0KCkuClRoZSBob29rIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBlYWNoIGNwdSBhZnRlciBsb2Fk
aW5nIGFuIHVwZGF0ZS4KSXQgaXMgYSBwcmVwYXJhdGlvbiBmb3Igc3BsaXRpbmcgb3V0IGFwcGx5
X21pY3JvY29kZSgpIGZyb20KY3B1X3JlcXVlc3RfbWljcm9jb2RlKCkuCgpTaWduZWQtb2ZmLWJ5
OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2ODoKIC0gbmV3
Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICAgICAgICB8ICAzICsrKwogeGVuL2FyY2gv
eDg2L21pY3JvY29kZV9hbWQuYyAgICB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaCB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21p
Y3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IGJmYjBhZmIuLjA4MmIy
OWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJjaC94
ODYvbWljcm9jb2RlLmMKQEAgLTI3Nyw2ICsyNzcsOSBAQCBzdGF0aWMgbG9uZyBkb19taWNyb2Nv
ZGVfdXBkYXRlKHZvaWQgKl9pbmZvKQogICAgIGlmICggZXJyb3IgKQogICAgICAgICBpbmZvLT5l
cnJvciA9IGVycm9yOwogCisgICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlICkKKyAg
ICAgICAgbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZSgpOworCiAgICAgaW5mby0+Y3B1ID0gY3B1
bWFza19uZXh0KGluZm8tPmNwdSwgJmNwdV9vbmxpbmVfbWFwKTsKICAgICBpZiAoIGluZm8tPmNw
dSA8IG5yX2NwdV9pZHMgKQogICAgICAgICByZXR1cm4gY29udGludWVfaHlwZXJjYWxsX29uX2Nw
dShpbmZvLT5jcHUsIGRvX21pY3JvY29kZV91cGRhdGUsIGluZm8pOwpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L21pY3JvY29kZV9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMK
aW5kZXggODNlZDhmOS4uM2QxNTA1ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29k
ZV9hbWQuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCkBAIC02MDAsMTAgKzYw
MCw2IEBAIHN0YXRpYyBpbnQgY3B1X3JlcXVlc3RfbWljcm9jb2RlKGNvbnN0IHZvaWQgKmJ1Ziwg
c2l6ZV90IGJ1ZnNpemUpCiAgICAgeGZyZWUobWNfYW1kKTsKIAogICBvdXQ6Ci0jaWYgQ09ORklH
X0hWTQotICAgIHN2bV9ob3N0X29zdndfaW5pdCgpOwotI2VuZGlmCi0KICAgICAvKgogICAgICAq
IEluIHNvbWUgY2FzZXMgd2UgbWF5IHJldHVybiBhbiBlcnJvciBldmVuIGlmIHByb2Nlc3Nvcidz
IG1pY3JvY29kZSBoYXMKICAgICAgKiBiZWVuIHVwZGF0ZWQuIEZvciBleGFtcGxlLCB0aGUgZmly
c3QgcGF0Y2ggaW4gYSBjb250YWluZXIgZmlsZSBpcyBsb2FkZWQKQEAgLTYxNywxMyArNjEzLDgg
QEAgc3RhdGljIGludCBzdGFydF91cGRhdGUodm9pZCkKIHsKICNpZiBDT05GSUdfSFZNCiAgICAg
LyoKLSAgICAgKiBXZSBhc3N1bWUgaGVyZSB0aGF0IHN2bV9ob3N0X29zdndfaW5pdCgpIHdpbGwg
YmUgY2FsbGVkIG9uIGVhY2ggY3B1IChmcm9tCi0gICAgICogY3B1X3JlcXVlc3RfbWljcm9jb2Rl
KCkpLgotICAgICAqCi0gICAgICogTm90ZSB0aGF0IGlmIGNvbGxlY3RfY3B1X2luZm8oKSByZXR1
cm5zIGFuIGVycm9yIHRoZW4KLSAgICAgKiBjcHVfcmVxdWVzdF9taWNyb2NvZGUoKSB3aWxsIG5v
dCBpbnZva2VkIHRodXMgbGVhdmluZyBPU1ZXIGJpdHMgbm90Ci0gICAgICogdXBkYXRlZC4gQ3Vy
cmVudGx5IHRob3VnaCBjb2xsZWN0X2NwdV9pbmZvKCkgd2lsbCBub3QgZmFpbCBvbiBwcm9jZXNz
b3JzCi0gICAgICogc3VwcG9ydGluZyBPU1ZXIHNvIHdlIHdpbGwgbm90IGRlYWwgd2l0aCB0aGlz
IHBvc3NpYmlsaXR5LgorICAgICAqIHN2bV9ob3N0X29zdndfaW5pdCgpIHdpbGwgYmUgY2FsbGVk
IG9uIGVhY2ggY3B1IGJ5IGNhbGxpbmcgJy5lbmRfdXBkYXRlJworICAgICAqIGluIGNvbW1vbiBj
b2RlLgogICAgICAqLwogICAgIHN2bV9ob3N0X29zdndfcmVzZXQoKTsKICNlbmRpZgpAQCAtNjMx
LDExICs2MjIsMTkgQEAgc3RhdGljIGludCBzdGFydF91cGRhdGUodm9pZCkKICAgICByZXR1cm4g
MDsKIH0KIAorc3RhdGljIHZvaWQgZW5kX3VwZGF0ZSh2b2lkKQoreworI2lmIENPTkZJR19IVk0K
KyAgICBzdm1faG9zdF9vc3Z3X2luaXQoKTsKKyNlbmRpZgorfQorCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1pY3JvY29kZV9vcHMgbWljcm9jb2RlX2FtZF9vcHMgPSB7CiAgICAgLmNwdV9yZXF1ZXN0
X21pY3JvY29kZSAgICAgICAgICAgID0gY3B1X3JlcXVlc3RfbWljcm9jb2RlLAogICAgIC5jb2xs
ZWN0X2NwdV9pbmZvICAgICAgICAgICAgICAgICA9IGNvbGxlY3RfY3B1X2luZm8sCiAgICAgLmFw
cGx5X21pY3JvY29kZSAgICAgICAgICAgICAgICAgID0gYXBwbHlfbWljcm9jb2RlLAogICAgIC5z
dGFydF91cGRhdGUgICAgICAgICAgICAgICAgICAgICA9IHN0YXJ0X3VwZGF0ZSwKKyAgICAuZW5k
X3VwZGF0ZSAgICAgICAgICAgICAgICAgICAgICAgPSBlbmRfdXBkYXRlLAogICAgIC5mcmVlX3Bh
dGNoICAgICAgICAgICAgICAgICAgICAgICA9IGZyZWVfcGF0Y2gsCiAgICAgLmNvbXBhcmVfcGF0
Y2ggICAgICAgICAgICAgICAgICAgID0gY29tcGFyZV9wYXRjaCwKICAgICAubWF0Y2hfY3B1ICAg
ICAgICAgICAgICAgICAgICAgICAgPSBtYXRjaF9jcHUsCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L21pY3JvY29kZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaApp
bmRleCAzNTIyM2ViLi5jOGQyYzRmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21p
Y3JvY29kZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKQEAgLTI0LDYg
KzI0LDcgQEAgc3RydWN0IG1pY3JvY29kZV9vcHMgewogICAgIGludCAoKmNvbGxlY3RfY3B1X2lu
Zm8pKHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKTsKICAgICBpbnQgKCphcHBseV9taWNyb2Nv
ZGUpKHZvaWQpOwogICAgIGludCAoKnN0YXJ0X3VwZGF0ZSkodm9pZCk7CisgICAgdm9pZCAoKmVu
ZF91cGRhdGUpKHZvaWQpOwogICAgIHZvaWQgKCpmcmVlX3BhdGNoKSh2b2lkICptYyk7CiAgICAg
Ym9vbCAoKm1hdGNoX2NwdSkoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpOwog
ICAgIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCAoKmNvbXBhcmVfcGF0Y2gpKAotLSAKMS44
LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
