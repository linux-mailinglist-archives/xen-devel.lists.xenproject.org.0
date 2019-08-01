Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3267D940
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:21:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8BF-0002BB-Dz; Thu, 01 Aug 2019 10:19:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TV56=V5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ht8BD-00029Z-Tk
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:19:27 +0000
X-Inumbo-ID: d64a087e-b445-11e9-821f-834822357b79
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d64a087e-b445-11e9-821f-834822357b79;
 Thu, 01 Aug 2019 10:19:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175207990"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 03:19:23 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:22:51 +0800
Message-Id: <1564654971-31328-17-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v8 16/16] microcode: block #NMI handling when
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
cCBvbiB0aHJlYWRzCndoaWNoIGFyZSB3YWl0aW5nIGZvciBsb2FkaW5nIGNvbXBsZXRpb24gaWYg
J2xvYWRpbmdfdWNvZGUnIGlzIHRydWUuCgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5n
YW9AaW50ZWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2ODoKIC0gbmV3Ci0tLQogeGVuL2FyY2gveDg2
L21pY3JvY29kZS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IDY3NTQ5YmUuLjRhYzdlOTMg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJjaC94ODYv
bWljcm9jb2RlLmMKQEAgLTM4LDYgKzM4LDcgQEAKIAogI2luY2x1ZGUgPGFzbS9kZWxheS5oPgog
I2luY2x1ZGUgPGFzbS9tc3IuaD4KKyNpbmNsdWRlIDxhc20vbm1pLmg+CiAjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9zZXR1cC5oPgogI2luY2x1ZGUgPGFzbS9taWNy
b2NvZGUuaD4KQEAgLTQzOSwxMiArNDQwLDM3IEBAIHN0YXRpYyBpbnQgZG9fbWljcm9jb2RlX3Vw
ZGF0ZSh2b2lkICpwYXRjaCkKICAgICByZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IG1pY3Jv
Y29kZV9ubWlfY2FsbGJhY2soY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGludCBj
cHUpCit7CisgICAgYm9vbCBwcmludCA9IGZhbHNlOworCisgICAgLyogVGhlIGZpcnN0IHRocmVh
ZCBvZiBhIGNvcmUgaXMgdG8gbG9hZCBhbiB1cGRhdGUuIERvbid0IGJsb2NrIGl0LiAqLworICAg
IGlmICggY3B1ID09IGNwdW1hc2tfZmlyc3QocGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUp
KSApCisgICAgICAgIHJldHVybiAwOworCisgICAgaWYgKCBsb2FkaW5nX3N0YXRlID09IExPQURJ
TkdfRU5URVJFRCApCisgICAgeworICAgICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X2Nh
bGxpbl9tYXApOworICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJDUFUldSBlbnRlcnMgJXNc
biIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgX19mdW5jX18pOworICAgICAgICBwcmludCA9IHRydWU7
CisgICAgfQorCisgICAgd2hpbGUgKCBsb2FkaW5nX3N0YXRlID09IExPQURJTkdfRU5URVJFRCAp
CisgICAgICAgIHJlcF9ub3AoKTsKKworICAgIGlmICggcHJpbnQgKQorICAgICAgICBwcmludGso
WEVOTE9HX0RFQlVHICJDUFUldSBleGl0cyAlc1xuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpLCBfX2Z1
bmNfXyk7CisKKyAgICByZXR1cm4gMDsKK30KKwogaW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVuKQogewog
ICAgIGludCByZXQ7CiAgICAgdm9pZCAqYnVmZmVyOwogICAgIHVuc2lnbmVkIGludCBjcHUsIHVw
ZGF0ZWQ7CiAgICAgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2g7CisgICAgbm1pX2NhbGxi
YWNrX3QgKnNhdmVkX25taV9jYWxsYmFjazsKIAogICAgIGlmICggbGVuICE9ICh1aW50MzJfdCls
ZW4gKQogICAgICAgICByZXR1cm4gLUUyQklHOwpAQCAtNTA5LDYgKzUzNSw4IEBAIGludCBtaWNy
b2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCkgYnVmLCB1bnNp
Z25lZCBsb25nIGxlbikKICAgICAgKiB3YXRjaGRvZyB0aW1lb3V0LgogICAgICAqLwogICAgIHdh
dGNoZG9nX2Rpc2FibGUoKTsKKworICAgIHNhdmVkX25taV9jYWxsYmFjayA9IHNldF9ubWlfY2Fs
bGJhY2sobWljcm9jb2RlX25taV9jYWxsYmFjayk7CiAgICAgLyoKICAgICAgKiBMYXRlIGxvYWRp
bmcgZGFuY2UuIFdoeSB0aGUgaGVhdnktaGFuZGVkIHN0b3BfbWFjaGluZSBlZmZvcnQ/CiAgICAg
ICoKQEAgLTUyMSw2ICs1NDksNyBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFO
RExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCiAgICAgICogICBj
b25zZXJ2YXRpdmUgYW5kIGdvb2QuCiAgICAgICovCiAgICAgcmV0ID0gc3RvcF9tYWNoaW5lX3J1
bihkb19taWNyb2NvZGVfdXBkYXRlLCBwYXRjaCwgTlJfQ1BVUyk7CisgICAgc2V0X25taV9jYWxs
YmFjayhzYXZlZF9ubWlfY2FsbGJhY2spOwogICAgIHdhdGNoZG9nX2VuYWJsZSgpOwogCiAgICAg
dXBkYXRlZCA9IGF0b21pY19yZWFkKCZjcHVfdXBkYXRlZCk7Ci0tIAoxLjguMy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
