Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5A91AAA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 03:25:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzWNW-0001qM-6v; Mon, 19 Aug 2019 01:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JIwN=WP=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hzWNU-0001pW-LU
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 01:22:32 +0000
X-Inumbo-ID: d1010542-c21f-11e9-aee9-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1010542-c21f-11e9-aee9-bc764e2007e4;
 Mon, 19 Aug 2019 01:22:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 18:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="261684035"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2019 18:22:30 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 09:25:28 +0800
Message-Id: <1566177928-19114-16-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling when
 loading an ucode
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

cmVnaXN0ZXIgYW4gbm1pIGNhbGxiYWNrLiBBbmQgdGhpcyBjYWxsYmFjayBkb2VzIGJ1c3ktbG9v
cCBvbiB0aHJlYWRzCndoaWNoIGFyZSB3YWl0aW5nIGZvciBsb2FkaW5nIGNvbXBsZXRpb24uIENv
bnRyb2wgdGhyZWFkcyBzZW5kIE5NSSB0bwpzbGF2ZSB0aHJlYWRzIHRvIHByZXZlbnQgTk1JIGFj
Y2VwdGFuY2UgZHVyaW5nIHVjb2RlIGxvYWRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8
Y2hhby5nYW9AaW50ZWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2OToKIC0gY29udHJvbCB0aHJlYWRz
IHNlbmQgTk1JIHRvIGFsbCBvdGhlciB0aHJlYWRzLiBTbGF2ZSB0aHJlYWRzIHdpbGwKIHN0YXkg
aW4gdGhlIE5NSSBoYW5kbGluZyB0byBwcmV2ZW50IE5NSSBhY2NlcHRhbmNlIGR1cmluZyB1Y29k
ZQogbG9hZGluZy4gTm90ZSB0aGF0IHNlbGYtbm1pIGlzIGludmFsaWQgYWNjb3JkaW5nIHRvIFNE
TS4KIC0gcy9yZXBfbm9wL2NwdV9yZWxheAogLSByZW1vdmUgZGVidWcgbWVzc2FnZSBpbiBtaWNy
b2NvZGVfbm1pX2NhbGxiYWNrKCkuIFByaW50aW5nIGRlYnVnCiBtZXNzYWdlIHdvdWxkIHRha2Ug
bG9uZyB0aW1lcyBhbmQgY29udHJvbCB0aHJlYWQgbWF5IHRpbWVvdXQuCiAtIHJlYmFzZSBhbmQg
Zml4IGNvbmZsaWN0cwoKQ2hhbmdlcyBpbiB2ODoKIC0gbmV3Ci0tLQogeGVuL2FyY2gveDg2L21p
Y3JvY29kZS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IDkxZjll
ODEuLmQ5NDM4MzUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94
ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKQEAgLTM4LDYgKzM4LDcgQEAKIAogI2luY2x1ZGUgPGFz
bS9kZWxheS5oPgogI2luY2x1ZGUgPGFzbS9tc3IuaD4KKyNpbmNsdWRlIDxhc20vbm1pLmg+CiAj
aW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9zZXR1cC5oPgogI2luY2x1
ZGUgPGFzbS9taWNyb2NvZGUuaD4KQEAgLTMzOSwxNCArMzQwLDggQEAgc3RhdGljIGludCBtaWNy
b2NvZGVfdXBkYXRlX2NwdShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKIAog
c3RhdGljIGludCBzbGF2ZV90aHJlYWRfZm4odm9pZCkKIHsKLSAgICB1bnNpZ25lZCBpbnQgY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwogICAgIHVuc2lnbmVkIGludCBtYXN0ZXIgPSBjcHVtYXNr
X2ZpcnN0KHRoaXNfY3B1KGNwdV9zaWJsaW5nX21hc2spKTsKIAotICAgIHdoaWxlICggbG9hZGlu
Z19zdGF0ZSAhPSBMT0FESU5HX0NBTExJTiApCi0gICAgICAgIGNwdV9yZWxheCgpOwotCi0gICAg
Y3B1bWFza19zZXRfY3B1KGNwdSwgJmNwdV9jYWxsaW5fbWFwKTsKLQogICAgIHdoaWxlICggbG9h
ZGluZ19zdGF0ZSAhPSBMT0FESU5HX0VYSVQgKQogICAgICAgICBjcHVfcmVsYXgoKTsKIApAQCAt
Mzk5LDYgKzM5NCw4IEBAIHN0YXRpYyBpbnQgY29udHJvbF90aHJlYWRfZm4oY29uc3Qgc3RydWN0
IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCiAKICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1
X2NhbGxpbl9tYXApOwogCisgICAgc21wX3NlbmRfbm1pX2FsbGJ1dHNlbGYoKTsKKwogICAgIC8q
IFdhaXRpbmcgZm9yIGFsbCB0aHJlYWRzIGNhbGxpbmcgaW4gKi8KICAgICByZXQgPSB3YWl0X2Zv
cl9jb25kaXRpb24od2FpdF9jcHVfY2FsbGluLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAodm9pZCAqKSh1bnNpZ25lZCBsb25nKW51bV9vbmxpbmVfY3B1cygpLApAQCAtNDgxLDEyICs0
NzgsMjggQEAgc3RhdGljIGludCBkb19taWNyb2NvZGVfdXBkYXRlKHZvaWQgKnBhdGNoKQogICAg
IHJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgbWljcm9jb2RlX25taV9jYWxsYmFjayhjb25z
dCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgaW50IGNwdSkKK3sKKyAgICAvKiBUaGUgZmly
c3QgdGhyZWFkIG9mIGEgY29yZSBpcyB0byBsb2FkIGFuIHVwZGF0ZS4gRG9uJ3QgYmxvY2sgaXQu
ICovCisgICAgaWYgKCBjcHUgPT0gY3B1bWFza19maXJzdChwZXJfY3B1KGNwdV9zaWJsaW5nX21h
c2ssIGNwdSkpIHx8CisgICAgICAgICBsb2FkaW5nX3N0YXRlICE9IExPQURJTkdfQ0FMTElOICkK
KyAgICAgICAgcmV0dXJuIDA7CisKKyAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X2NhbGxp
bl9tYXApOworCisgICAgd2hpbGUgKCBsb2FkaW5nX3N0YXRlICE9IExPQURJTkdfRVhJVCApCisg
ICAgICAgIGNwdV9yZWxheCgpOworCisgICAgcmV0dXJuIDA7Cit9CisKIGludCBtaWNyb2NvZGVf
dXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCkgYnVmLCB1bnNpZ25lZCBs
b25nIGxlbikKIHsKICAgICBpbnQgcmV0OwogICAgIHZvaWQgKmJ1ZmZlcjsKICAgICB1bnNpZ25l
ZCBpbnQgY3B1LCB1cGRhdGVkOwogICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoOwor
ICAgIG5taV9jYWxsYmFja190ICpzYXZlZF9ubWlfY2FsbGJhY2s7CiAKICAgICBpZiAoIGxlbiAh
PSAodWludDMyX3QpbGVuICkKICAgICAgICAgcmV0dXJuIC1FMkJJRzsKQEAgLTU1MSw2ICs1NjQs
OCBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3Zv
aWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCiAgICAgICogd2F0Y2hkb2cgdGltZW91dC4KICAg
ICAgKi8KICAgICB3YXRjaGRvZ19kaXNhYmxlKCk7CisKKyAgICBzYXZlZF9ubWlfY2FsbGJhY2sg
PSBzZXRfbm1pX2NhbGxiYWNrKG1pY3JvY29kZV9ubWlfY2FsbGJhY2spOwogICAgIC8qCiAgICAg
ICogTGF0ZSBsb2FkaW5nIGRhbmNlLiBXaHkgdGhlIGhlYXZ5LWhhbmRlZCBzdG9wX21hY2hpbmUg
ZWZmb3J0PwogICAgICAqCkBAIC01NjMsNiArNTc4LDcgQEAgaW50IG1pY3JvY29kZV91cGRhdGUo
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVu
KQogICAgICAqICAgY29uc2VydmF0aXZlIGFuZCBnb29kLgogICAgICAqLwogICAgIHJldCA9IHN0
b3BfbWFjaGluZV9ydW4oZG9fbWljcm9jb2RlX3VwZGF0ZSwgcGF0Y2gsIE5SX0NQVVMpOworICAg
IHNldF9ubWlfY2FsbGJhY2soc2F2ZWRfbm1pX2NhbGxiYWNrKTsKICAgICB3YXRjaGRvZ19lbmFi
bGUoKTsKIAogICAgIHVwZGF0ZWQgPSBhdG9taWNfcmVhZCgmY3B1X3VwZGF0ZWQpOwotLSAKMS44
LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
