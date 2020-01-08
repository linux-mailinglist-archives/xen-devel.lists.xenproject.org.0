Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC2134909
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:17:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEuq-0000VQ-07; Wed, 08 Jan 2020 17:14:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uSPe=25=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipEuo-0000V2-Ja
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:14:42 +0000
X-Inumbo-ID: 5945a022-323a-11ea-8599-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5945a022-323a-11ea-8599-bc764e2007e4;
 Wed, 08 Jan 2020 17:14:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="395806086"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.132.23])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2020 09:14:35 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 09:14:02 -0800
Message-Id: <199ba3c6fbe8f3de3b1513f70c5ea77f67aa2b42.1578503483.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578503483.git.tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 05/18] x86/mem_sharing: don't try to unshare
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
eWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5j
IHwgMjggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDM4ZTkwMDZjOTIuLjVkMjRj
ZWI0NjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gv
eDg2L2h2bS9odm0uYwpAQCAtMzgsNiArMzgsNyBAQAogI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+
CiAjaW5jbHVkZSA8eGVuL3ZwY2kuaD4KICNpbmNsdWRlIDx4ZW4vbm9zcGVjLmg+CisjaW5jbHVk
ZSA8eGVuL3ZtX2V2ZW50Lmg+CiAjaW5jbHVkZSA8YXNtL3NoYWRvdy5oPgogI2luY2x1ZGUgPGFz
bS9oYXAuaD4KICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgpAQCAtMTcwMiwxMSArMTcwMywxNCBA
QCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9u
ZyBnbGEsCiAgICAgc3RydWN0IGRvbWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47CiAgICAgc3Ry
dWN0IHAybV9kb21haW4gKnAybSwgKmhvc3RwMm07CiAgICAgaW50IHJjLCBmYWxsX3Rocm91Z2gg
PSAwLCBwYWdlZCA9IDA7Ci0gICAgaW50IHNoYXJpbmdfZW5vbWVtID0gMDsKICAgICB2bV9ldmVu
dF9yZXF1ZXN0X3QgKnJlcV9wdHIgPSBOVUxMOwogICAgIGJvb2wgc3luYyA9IGZhbHNlOwogICAg
IHVuc2lnbmVkIGludCBwYWdlX29yZGVyOwogCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCisg
ICAgYm9vbCBzaGFyaW5nX2Vub21lbSA9IGZhbHNlOworI2VuZGlmCisKICAgICAvKiBPbiBOZXN0
ZWQgVmlydHVhbGl6YXRpb24sIHdhbGsgdGhlIGd1ZXN0IHBhZ2UgdGFibGUuCiAgICAgICogSWYg
dGhpcyBzdWNjZWVkcywgYWxsIGlzIGZpbmUuCiAgICAgICogSWYgdGhpcyBmYWlscywgaW5qZWN0
IGEgbmVzdGVkIHBhZ2UgZmF1bHQgaW50byB0aGUgZ3Vlc3QuCkBAIC0xODk0LDE0ICsxODk4LDE2
IEBAIGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBs
b25nIGdsYSwKICAgICBpZiAoIHAybV9pc19wYWdlZChwMm10KSB8fCAocDJtdCA9PSBwMm1fcmFt
X3BhZ2luZ19vdXQpICkKICAgICAgICAgcGFnZWQgPSAxOwogCi0gICAgLyogTWVtIHNoYXJpbmc6
IHVuc2hhcmUgdGhlIHBhZ2UgYW5kIHRyeSBhZ2FpbiAqLwotICAgIGlmICggbnBmZWMud3JpdGVf
YWNjZXNzICYmIChwMm10ID09IHAybV9yYW1fc2hhcmVkKSApCisjaWZkZWYgQ09ORklHX01FTV9T
SEFSSU5HCisgICAgLyogTWVtIHNoYXJpbmc6IGlmIHN0aWxsIHNoYXJlZCBvbiB3cml0ZSBhY2Nl
c3MgdGhlbiBpdHMgZW5vbWVtICovCisgICAgaWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYgcDJt
X2lzX3NoYXJlZChwMm10KSApCiAgICAgewogICAgICAgICBBU1NFUlQocDJtX2lzX2hvc3RwMm0o
cDJtKSk7Ci0gICAgICAgIHNoYXJpbmdfZW5vbWVtID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdl
KGN1cnJkLCBnZm4pOworICAgICAgICBzaGFyaW5nX2Vub21lbSA9IHRydWU7CiAgICAgICAgIHJj
ID0gMTsKICAgICAgICAgZ290byBvdXRfcHV0X2dmbjsKICAgICB9CisjZW5kaWYKIAogICAgIC8q
IFNwdXJpb3VzIGZhdWx0PyBQb0QgYW5kIGxvZy1kaXJ0eSBhbHNvIHRha2UgdGhpcyBwYXRoLiAq
LwogICAgIGlmICggcDJtX2lzX3JhbShwMm10KSApCkBAIC0xOTU1LDE5ICsxOTYxLDIxIEBAIGlu
dCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGds
YSwKICAgICAgKi8KICAgICBpZiAoIHBhZ2VkICkKICAgICAgICAgcDJtX21lbV9wYWdpbmdfcG9w
dWxhdGUoY3VycmQsIGdmbik7CisKKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKICAgICBpZiAo
IHNoYXJpbmdfZW5vbWVtICkKICAgICB7Ci0gICAgICAgIGludCBydjsKLQotICAgICAgICBpZiAo
IChydiA9IG1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0oY3VycmQsIGdmbiwgdHJ1ZSkpIDwgMCAp
CisgICAgICAgIGlmICggIXZtX2V2ZW50X2NoZWNrX3JpbmcoY3VycmQtPnZtX2V2ZW50X3NoYXJl
KSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJEb21haW4g
JWh1IGF0dGVtcHQgdG8gdW5zaGFyZSAiCi0gICAgICAgICAgICAgICAgICAgICAiZ2ZuICVseCwg
RU5PTUVNIGFuZCBubyBoZWxwZXIgKHJjICVkKVxuIiwKLSAgICAgICAgICAgICAgICAgICAgIGN1
cnJkLT5kb21haW5faWQsIGdmbiwgcnYpOworICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJS
LCAiRG9tYWluICVwZCBhdHRlbXB0IHRvIHVuc2hhcmUgIgorICAgICAgICAgICAgICAgICAgICAi
Z2ZuICVseCwgRU5PTUVNIGFuZCBubyBoZWxwZXJcbiIsCisgICAgICAgICAgICAgICAgICAgIGN1
cnJkLCBnZm4pOwogICAgICAgICAgICAgLyogQ3Jhc2ggdGhlIGRvbWFpbiAqLwogICAgICAgICAg
ICAgcmMgPSAwOwogICAgICAgICB9CiAgICAgfQorI2VuZGlmCisKICAgICBpZiAoIHJlcV9wdHIg
KQogICAgIHsKICAgICAgICAgaWYgKCBtb25pdG9yX3RyYXBzKGN1cnIsIHN5bmMsIHJlcV9wdHIp
IDwgMCApCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
