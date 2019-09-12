Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5008B095D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 09:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8JOJ-000251-Hf; Thu, 12 Sep 2019 07:19:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+knL=XH=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i8JOI-00024F-72
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 07:19:42 +0000
X-Inumbo-ID: a0d2847e-d52d-11e9-83e3-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0d2847e-d52d-11e9-83e3-12813bfff9fa;
 Thu, 12 Sep 2019 07:19:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 00:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189906389"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 00:19:13 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 15:22:28 +0800
Message-Id: <1568272949-1086-16-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v10 15/16] microcode: disable late loading if
 CPUs are affected by BDF90
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgcG9ydHMgdGhlIGltcGxlbWVudGF0aW9uIG9mIGlzX2JsYWNrbGlzdGVkKCkgaW4gbGludXgg
a2VybmVsCnRvIFhlbi4KCkxhdGUgbG9hZGluZyBtYXkgY2F1c2Ugc3lzdGVtIGhhbmcgaWYgQ1BV
cyBhcmUgYWZmZWN0ZWQgYnkgQkRGOTAuCkNoZWNrIGFnYWluc3QgQkRGOTAgYmVmb3JlIHBlcmZv
cm1pbmcgYSBsYXRlIGxvYWRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9A
aW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgICAgICAgfCAgNiArKysr
KysKIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyAgfCAyMyArKysrKysrKysrKysrKysr
KysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaCB8ICAxICsKIDMgZmlsZXMg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNy
b2NvZGUuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwppbmRleCA2NGE0MzIxLi5kYmQyNzMw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZS5jCkBAIC01NjEsNiArNTYxLDEyIEBAIGludCBtaWNyb2NvZGVfdXBkYXRlKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCkgYnVmLCB1bnNpZ25lZCBsb25nIGxlbikK
ICAgICBpZiAoIG1pY3JvY29kZV9vcHMgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiAtRUlOVkFM
OwogCisgICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5pc19ibGFja2xpc3RlZCAmJiBtaWNyb2NvZGVf
b3BzLT5pc19ibGFja2xpc3RlZCgpICkKKyAgICB7CisgICAgICAgIHByaW50ayhYRU5MT0dfV0FS
TklORyAiTGF0ZSB1Y29kZSBsb2FkaW5nIGlzIGRpc2FibGVkIVxuIik7CisgICAgICAgIHJldHVy
biAtRVBFUk07CisgICAgfQorCiAgICAgYnVmZmVyID0geG1hbGxvY19ieXRlcyhsZW4pOwogICAg
IGlmICggIWJ1ZmZlciApCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRl
bC5jCmluZGV4IDE5ZjFiYTAuLmJjZWY2NjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNy
b2NvZGVfaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKQEAgLTI4
LDYgKzI4LDcgQEAKICNpbmNsdWRlIDx4ZW4vc21wLmg+CiAjaW5jbHVkZSA8eGVuL3NwaW5sb2Nr
Lmg+CiAKKyNpbmNsdWRlIDxhc20vZGl2NjQuaD4KICNpbmNsdWRlIDxhc20vbXNyLmg+CiAjaW5j
bHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9taWNyb2NvZGUuaD4KQEAgLTI4
Myw2ICsyODQsMjcgQEAgc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBjb21wYXJl
X3BhdGNoKAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDogT0xEX1VDT0RFOwogfQogCitzdGF0aWMgYm9vbCBpc19ibGFja2xpc3Rl
ZCh2b2lkKQoreworICAgIHN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjdXJyZW50X2NwdV9kYXRh
OworICAgIHVpbnQ2NF90IGxsY19zaXplID0gYy0+eDg2X2NhY2hlX3NpemUgKiAxMDI0VUxMOwor
ICAgIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpzaWcgPSAmdGhpc19jcHUoY3B1X3NpZyk7CisKKyAg
ICBkb19kaXYobGxjX3NpemUsIGMtPng4Nl9tYXhfY29yZXMpOworCisgICAgLyoKKyAgICAgKiBM
YXRlIGxvYWRpbmcgb24gbW9kZWwgNzkgd2l0aCBtaWNyb2NvZGUgcmV2aXNpb24gbGVzcyB0aGFu
IDB4MGIwMDAwMjEKKyAgICAgKiBhbmQgTExDIHNpemUgcGVyIGNvcmUgYmlnZ2VyIHRoYW4gMi41
TUIgbWF5IHJlc3VsdCBpbiBhIHN5c3RlbSBoYW5nLgorICAgICAqIFRoaXMgYmVoYXZpb3IgaXMg
ZG9jdW1lbnRlZCBpbiBpdGVtIEJERjkwLCAjMzM0MTY1IChJbnRlbCBYZW9uCisgICAgICogUHJv
Y2Vzc29yIEU3LTg4MDAvNDgwMCB2NCBQcm9kdWN0IEZhbWlseSkuCisgICAgICovCisgICAgaWYg
KCBjLT54ODYgPT0gNiAmJiBjLT54ODZfbW9kZWwgPT0gMHg0RiAmJiBjLT54ODZfbWFzayA9PSAw
eDEgJiYKKyAgICAgICAgIGxsY19zaXplID4gMjYyMTQ0MCAmJiBzaWctPnJldiA8IDB4MGIwMDAw
MjEgKQorICAgICAgICByZXR1cm4gdHJ1ZTsKKworICAgIHJldHVybiBmYWxzZTsKK30KKwogc3Rh
dGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0
Y2gpCiB7CiAgICAgdWludDY0X3QgbXNyX2NvbnRlbnQ7CkBAIC00MTUsNiArNDM3LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfb3BzIG1pY3JvY29kZV9pbnRlbF9vcHMgPSB7CiAg
ICAgLmZyZWVfcGF0Y2ggICAgICAgICAgICAgICAgICAgICAgID0gZnJlZV9wYXRjaCwKICAgICAu
Y29tcGFyZV9wYXRjaCAgICAgICAgICAgICAgICAgICAgPSBjb21wYXJlX3BhdGNoLAogICAgIC5t
YXRjaF9jcHUgICAgICAgICAgICAgICAgICAgICAgICA9IG1hdGNoX2NwdSwKKyAgICAuaXNfYmxh
Y2tsaXN0ZWQgICAgICAgICAgICAgICAgICAgPSBpc19ibGFja2xpc3RlZCwKIH07CiAKIGludCBf
X2luaXQgbWljcm9jb2RlX2luaXRfaW50ZWwodm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvbWljcm9jb2RlLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oCmlu
ZGV4IDdkNWExZjguLjlmZmQ5ZDIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWlj
cm9jb2RlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaApAQCAtMzAsNiAr
MzAsNyBAQCBzdHJ1Y3QgbWljcm9jb2RlX29wcyB7CiAgICAgYm9vbCAoKm1hdGNoX2NwdSkoY29u
c3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpOwogICAgIGVudW0gbWljcm9jb2RlX21h
dGNoX3Jlc3VsdCAoKmNvbXBhcmVfcGF0Y2gpKAogICAgICAgICBjb25zdCBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICpuZXcsIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm9sZCk7CisgICAg
Ym9vbCAoKmlzX2JsYWNrbGlzdGVkKSh2b2lkKTsKIH07CiAKIHN0cnVjdCBjcHVfc2lnbmF0dXJl
IHsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
