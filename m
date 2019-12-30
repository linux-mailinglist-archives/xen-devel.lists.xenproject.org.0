Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214612D1C9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:14:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxeA-00024F-8d; Mon, 30 Dec 2019 16:11:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0QMt=2U=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ilxe7-00024A-Vo
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:11:56 +0000
X-Inumbo-ID: 182ff5b4-2b1f-11ea-88e7-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 182ff5b4-2b1f-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 16:11:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="221167322"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.206])
 by orsmga003.jf.intel.com with ESMTP; 30 Dec 2019 08:11:53 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2019 08:11:29 -0800
Message-Id: <a6129e9ba8534b4e8e684c0a7333cc550359e8f7.1577721845.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577721845.git.tamas.lengyel@intel.com>
References: <cover.1577721845.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 05/18] x86/mem_sharing: don't try to unshare
 twice during page fault
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
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhZ2Ugd2FzIGFscmVhZHkgdHJpZWQgdG8gYmUgdW5zaGFyZWQgaW4gZ2V0X2dmbl90eXBl
X2FjY2Vzcy4gSWYgdGhhdApkaWRuJ3Qgd29yaywgdGhlbiB0cnlpbmcgYWdhaW4gaXMgcG9pbnRs
ZXNzLiBEb24ndCB0cnkgdG8gc2VuZCB2bV9ldmVudCBhZ2FpbgplaXRoZXIsIHNpbXBseSBjaGVj
ayBpZiB0aGVyZSBpcyBhIHJpbmcgb3Igbm90LgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KLS0tCnYzOiB1c2UgZ3ByaW50ayB3aGVuIHRo
ZSBkb21haW4gaXMgZ29pbmcgdG8gY3Jhc2gKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jIHwg
MjggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDM4ZTkwMDZjOTIuLjVkMjRjZWI0
NjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS9odm0uYwpAQCAtMzgsNiArMzgsNyBAQAogI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+CiAj
aW5jbHVkZSA8eGVuL3ZwY2kuaD4KICNpbmNsdWRlIDx4ZW4vbm9zcGVjLmg+CisjaW5jbHVkZSA8
eGVuL3ZtX2V2ZW50Lmg+CiAjaW5jbHVkZSA8YXNtL3NoYWRvdy5oPgogI2luY2x1ZGUgPGFzbS9o
YXAuaD4KICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgpAQCAtMTcwMiwxMSArMTcwMywxNCBAQCBp
bnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9uZyBn
bGEsCiAgICAgc3RydWN0IGRvbWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47CiAgICAgc3RydWN0
IHAybV9kb21haW4gKnAybSwgKmhvc3RwMm07CiAgICAgaW50IHJjLCBmYWxsX3Rocm91Z2ggPSAw
LCBwYWdlZCA9IDA7Ci0gICAgaW50IHNoYXJpbmdfZW5vbWVtID0gMDsKICAgICB2bV9ldmVudF9y
ZXF1ZXN0X3QgKnJlcV9wdHIgPSBOVUxMOwogICAgIGJvb2wgc3luYyA9IGZhbHNlOwogICAgIHVu
c2lnbmVkIGludCBwYWdlX29yZGVyOwogCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCisgICAg
Ym9vbCBzaGFyaW5nX2Vub21lbSA9IGZhbHNlOworI2VuZGlmCisKICAgICAvKiBPbiBOZXN0ZWQg
VmlydHVhbGl6YXRpb24sIHdhbGsgdGhlIGd1ZXN0IHBhZ2UgdGFibGUuCiAgICAgICogSWYgdGhp
cyBzdWNjZWVkcywgYWxsIGlzIGZpbmUuCiAgICAgICogSWYgdGhpcyBmYWlscywgaW5qZWN0IGEg
bmVzdGVkIHBhZ2UgZmF1bHQgaW50byB0aGUgZ3Vlc3QuCkBAIC0xODk0LDE0ICsxODk4LDE2IEBA
IGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25n
IGdsYSwKICAgICBpZiAoIHAybV9pc19wYWdlZChwMm10KSB8fCAocDJtdCA9PSBwMm1fcmFtX3Bh
Z2luZ19vdXQpICkKICAgICAgICAgcGFnZWQgPSAxOwogCi0gICAgLyogTWVtIHNoYXJpbmc6IHVu
c2hhcmUgdGhlIHBhZ2UgYW5kIHRyeSBhZ2FpbiAqLwotICAgIGlmICggbnBmZWMud3JpdGVfYWNj
ZXNzICYmIChwMm10ID09IHAybV9yYW1fc2hhcmVkKSApCisjaWZkZWYgQ09ORklHX01FTV9TSEFS
SU5HCisgICAgLyogTWVtIHNoYXJpbmc6IGlmIHN0aWxsIHNoYXJlZCBvbiB3cml0ZSBhY2Nlc3Mg
dGhlbiBpdHMgZW5vbWVtICovCisgICAgaWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYgcDJtX2lz
X3NoYXJlZChwMm10KSApCiAgICAgewogICAgICAgICBBU1NFUlQocDJtX2lzX2hvc3RwMm0ocDJt
KSk7Ci0gICAgICAgIHNoYXJpbmdfZW5vbWVtID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGN1
cnJkLCBnZm4pOworICAgICAgICBzaGFyaW5nX2Vub21lbSA9IHRydWU7CiAgICAgICAgIHJjID0g
MTsKICAgICAgICAgZ290byBvdXRfcHV0X2dmbjsKICAgICB9CisjZW5kaWYKIAogICAgIC8qIFNw
dXJpb3VzIGZhdWx0PyBQb0QgYW5kIGxvZy1kaXJ0eSBhbHNvIHRha2UgdGhpcyBwYXRoLiAqLwog
ICAgIGlmICggcDJtX2lzX3JhbShwMm10KSApCkBAIC0xOTU1LDE5ICsxOTYxLDIxIEBAIGludCBo
dm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwK
ICAgICAgKi8KICAgICBpZiAoIHBhZ2VkICkKICAgICAgICAgcDJtX21lbV9wYWdpbmdfcG9wdWxh
dGUoY3VycmQsIGdmbik7CisKKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKICAgICBpZiAoIHNo
YXJpbmdfZW5vbWVtICkKICAgICB7Ci0gICAgICAgIGludCBydjsKLQotICAgICAgICBpZiAoIChy
diA9IG1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0oY3VycmQsIGdmbiwgdHJ1ZSkpIDwgMCApCisg
ICAgICAgIGlmICggIXZtX2V2ZW50X2NoZWNrX3JpbmcoY3VycmQtPnZtX2V2ZW50X3NoYXJlKSAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJEb21haW4gJWh1
IGF0dGVtcHQgdG8gdW5zaGFyZSAiCi0gICAgICAgICAgICAgICAgICAgICAiZ2ZuICVseCwgRU5P
TUVNIGFuZCBubyBoZWxwZXIgKHJjICVkKVxuIiwKLSAgICAgICAgICAgICAgICAgICAgIGN1cnJk
LT5kb21haW5faWQsIGdmbiwgcnYpOworICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAi
RG9tYWluICVwZCBhdHRlbXB0IHRvIHVuc2hhcmUgIgorICAgICAgICAgICAgICAgICAgICAiZ2Zu
ICVseCwgRU5PTUVNIGFuZCBubyBoZWxwZXJcbiIsCisgICAgICAgICAgICAgICAgICAgIGN1cnJk
LCBnZm4pOwogICAgICAgICAgICAgLyogQ3Jhc2ggdGhlIGRvbWFpbiAqLwogICAgICAgICAgICAg
cmMgPSAwOwogICAgICAgICB9CiAgICAgfQorI2VuZGlmCisKICAgICBpZiAoIHJlcV9wdHIgKQog
ICAgIHsKICAgICAgICAgaWYgKCBtb25pdG9yX3RyYXBzKGN1cnIsIHN5bmMsIHJlcV9wdHIpIDwg
MCApCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
