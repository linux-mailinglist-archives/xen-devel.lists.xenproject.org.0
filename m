Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104EBE1A8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:51:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9YE-00014a-P2; Wed, 25 Sep 2019 15:49:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9YC-000139-Nx
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:49:56 +0000
X-Inumbo-ID: 11e6bb5c-dfac-11e9-8628-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 11e6bb5c-dfac-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812656"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:31 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:45 -0700
Message-Id: <8be4685eb151ec323f822fdee0d55cb2be7ab1b2.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 07/18] x86/mem_sharing: don't try
 to unshare twice during page fault
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
eWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5j
IHwgMjYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDdjMjU1NzI4YzIuLjJhZjJmOTM2
YTUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS9odm0uYwpAQCAtMzgsNiArMzgsNyBAQAogI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+CiAj
aW5jbHVkZSA8eGVuL3ZwY2kuaD4KICNpbmNsdWRlIDx4ZW4vbm9zcGVjLmg+CisjaW5jbHVkZSA8
eGVuL3ZtX2V2ZW50Lmg+CiAjaW5jbHVkZSA8YXNtL3NoYWRvdy5oPgogI2luY2x1ZGUgPGFzbS9o
YXAuaD4KICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgpAQCAtMTcwMSwxMSArMTcwMiwxNCBAQCBp
bnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9uZyBn
bGEsCiAgICAgc3RydWN0IGRvbWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47CiAgICAgc3RydWN0
IHAybV9kb21haW4gKnAybSwgKmhvc3RwMm07CiAgICAgaW50IHJjLCBmYWxsX3Rocm91Z2ggPSAw
LCBwYWdlZCA9IDA7Ci0gICAgaW50IHNoYXJpbmdfZW5vbWVtID0gMDsKICAgICB2bV9ldmVudF9y
ZXF1ZXN0X3QgKnJlcV9wdHIgPSBOVUxMOwogICAgIGJvb2wgc3luYyA9IGZhbHNlOwogICAgIHVu
c2lnbmVkIGludCBwYWdlX29yZGVyOwogCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCisgICAg
Ym9vbCBzaGFyaW5nX2Vub21lbSA9IGZhbHNlOworI2VuZGlmCisKICAgICAvKiBPbiBOZXN0ZWQg
VmlydHVhbGl6YXRpb24sIHdhbGsgdGhlIGd1ZXN0IHBhZ2UgdGFibGUuCiAgICAgICogSWYgdGhp
cyBzdWNjZWVkcywgYWxsIGlzIGZpbmUuCiAgICAgICogSWYgdGhpcyBmYWlscywgaW5qZWN0IGEg
bmVzdGVkIHBhZ2UgZmF1bHQgaW50byB0aGUgZ3Vlc3QuCkBAIC0xODc1LDE0ICsxODc5LDE2IEBA
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
ICAgIGlmICggcDJtX2lzX3JhbShwMm10KSApCkBAIC0xOTM2LDE5ICsxOTQyLDIxIEBAIGludCBo
dm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwK
ICAgICAgKi8KICAgICBpZiAoIHBhZ2VkICkKICAgICAgICAgcDJtX21lbV9wYWdpbmdfcG9wdWxh
dGUoY3VycmQsIGdmbik7CisKKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKICAgICBpZiAoIHNo
YXJpbmdfZW5vbWVtICkKICAgICB7Ci0gICAgICAgIGludCBydjsKLQotICAgICAgICBpZiAoIChy
diA9IG1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0oY3VycmQsIGdmbiwgdHJ1ZSkpIDwgMCApCisg
ICAgICAgIGlmICggIXZtX2V2ZW50X2NoZWNrX3JpbmcoY3VycmQtPnZtX2V2ZW50X3NoYXJlKSAp
CiAgICAgICAgIHsKICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJEb21haW4gJWh1
IGF0dGVtcHQgdG8gdW5zaGFyZSAiCi0gICAgICAgICAgICAgICAgICAgICAiZ2ZuICVseCwgRU5P
TUVNIGFuZCBubyBoZWxwZXIgKHJjICVkKVxuIiwKLSAgICAgICAgICAgICAgICAgICAgIGN1cnJk
LT5kb21haW5faWQsIGdmbiwgcnYpOworICAgICAgICAgICAgICAgICAgICAgImdmbiAlbHgsIEVO
T01FTSBhbmQgbm8gaGVscGVyXG4iLAorICAgICAgICAgICAgICAgICAgICAgY3VycmQtPmRvbWFp
bl9pZCwgZ2ZuKTsKICAgICAgICAgICAgIC8qIENyYXNoIHRoZSBkb21haW4gKi8KICAgICAgICAg
ICAgIHJjID0gMDsKICAgICAgICAgfQogICAgIH0KKyNlbmRpZgorCiAgICAgaWYgKCByZXFfcHRy
ICkKICAgICB7CiAgICAgICAgIGlmICggbW9uaXRvcl90cmFwcyhjdXJyLCBzeW5jLCByZXFfcHRy
KSA8IDAgKQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
