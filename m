Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ADF1443A9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:53:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxfa-0004kn-9A; Tue, 21 Jan 2020 17:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxfY-0004jj-As
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:50:28 +0000
X-Inumbo-ID: 7856bad2-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7856bad2-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929158"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:02 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:39 -0800
Message-Id: <0cb067e1d0ab8bbba63a461d61c4f07cd15ab0d6.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 06/18] x86/mem_sharing: don't try to unshare
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhZ2Ugd2FzIGFscmVhZHkgdHJpZWQgdG8gYmUgdW5zaGFyZWQgaW4gZ2V0X2dmbl90eXBl
X2FjY2Vzcy4gSWYgdGhhdApkaWRuJ3Qgd29yaywgdGhlbiB0cnlpbmcgYWdhaW4gaXMgcG9pbnRs
ZXNzLiBEb24ndCB0cnkgdG8gc2VuZCB2bV9ldmVudCBhZ2FpbgplaXRoZXIsIHNpbXBseSBjaGVj
ayBpZiB0aGVyZSBpcyBhIHJpbmcgb3Igbm90LgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jIHwgMjUgKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJj
aC94ODYvaHZtL2h2bS5jCmluZGV4IDU1YmY3MzUzYzkuLmU2MGI0OTMxYmYgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAt
MzgsNiArMzgsNyBAQAogI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+CiAjaW5jbHVkZSA8eGVuL3Zw
Y2kuaD4KICNpbmNsdWRlIDx4ZW4vbm9zcGVjLmg+CisjaW5jbHVkZSA8eGVuL3ZtX2V2ZW50Lmg+
CiAjaW5jbHVkZSA8YXNtL3NoYWRvdy5oPgogI2luY2x1ZGUgPGFzbS9oYXAuaD4KICNpbmNsdWRl
IDxhc20vY3VycmVudC5oPgpAQCAtMTcwMiw3ICsxNzAzLDcgQEAgaW50IGh2bV9oYXBfbmVzdGVk
X3BhZ2VfZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAogICAgIHN0cnVjdCBk
b21haW4gKmN1cnJkID0gY3Vyci0+ZG9tYWluOwogICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0s
ICpob3N0cDJtOwogICAgIGludCByYywgZmFsbF90aHJvdWdoID0gMCwgcGFnZWQgPSAwOwotICAg
IGludCBzaGFyaW5nX2Vub21lbSA9IDA7CisgICAgYm9vbCBzaGFyaW5nX2Vub21lbSA9IGZhbHNl
OwogICAgIHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxX3B0ciA9IE5VTEw7CiAgICAgYm9vbCBzeW5j
ID0gZmFsc2U7CiAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7CkBAIC0xODk0LDE0ICsxODk1
LDE2IEBAIGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25l
ZCBsb25nIGdsYSwKICAgICBpZiAoIHAybV9pc19wYWdlZChwMm10KSB8fCAocDJtdCA9PSBwMm1f
cmFtX3BhZ2luZ19vdXQpICkKICAgICAgICAgcGFnZWQgPSAxOwogCi0gICAgLyogTWVtIHNoYXJp
bmc6IHVuc2hhcmUgdGhlIHBhZ2UgYW5kIHRyeSBhZ2FpbiAqLwotICAgIGlmICggbnBmZWMud3Jp
dGVfYWNjZXNzICYmIChwMm10ID09IHAybV9yYW1fc2hhcmVkKSApCisjaWZkZWYgQ09ORklHX01F
TV9TSEFSSU5HCisgICAgLyogTWVtIHNoYXJpbmc6IGlmIHN0aWxsIHNoYXJlZCBvbiB3cml0ZSBh
Y2Nlc3MgdGhlbiBpdHMgZW5vbWVtICovCisgICAgaWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYg
cDJtX2lzX3NoYXJlZChwMm10KSApCiAgICAgewogICAgICAgICBBU1NFUlQocDJtX2lzX2hvc3Rw
Mm0ocDJtKSk7Ci0gICAgICAgIHNoYXJpbmdfZW5vbWVtID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9w
YWdlKGN1cnJkLCBnZm4pOworICAgICAgICBzaGFyaW5nX2Vub21lbSA9IHRydWU7CiAgICAgICAg
IHJjID0gMTsKICAgICAgICAgZ290byBvdXRfcHV0X2dmbjsKICAgICB9CisjZW5kaWYKIAogICAg
IC8qIFNwdXJpb3VzIGZhdWx0PyBQb0QgYW5kIGxvZy1kaXJ0eSBhbHNvIHRha2UgdGhpcyBwYXRo
LiAqLwogICAgIGlmICggcDJtX2lzX3JhbShwMm10KSApCkBAIC0xOTU1LDE5ICsxOTU4LDIxIEBA
IGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25n
IGdsYSwKICAgICAgKi8KICAgICBpZiAoIHBhZ2VkICkKICAgICAgICAgcDJtX21lbV9wYWdpbmdf
cG9wdWxhdGUoY3VycmQsIGdmbik7CisKICAgICBpZiAoIHNoYXJpbmdfZW5vbWVtICkKICAgICB7
Ci0gICAgICAgIGludCBydjsKLQotICAgICAgICBpZiAoIChydiA9IG1lbV9zaGFyaW5nX25vdGlm
eV9lbm9tZW0oY3VycmQsIGdmbiwgdHJ1ZSkpIDwgMCApCisjaWZkZWYgQ09ORklHX01FTV9TSEFS
SU5HCisgICAgICAgIGlmICggIXZtX2V2ZW50X2NoZWNrX3JpbmcoY3VycmQtPnZtX2V2ZW50X3No
YXJlKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJEb21h
aW4gJWh1IGF0dGVtcHQgdG8gdW5zaGFyZSAiCi0gICAgICAgICAgICAgICAgICAgICAiZ2ZuICVs
eCwgRU5PTUVNIGFuZCBubyBoZWxwZXIgKHJjICVkKVxuIiwKLSAgICAgICAgICAgICAgICAgICAg
IGN1cnJkLT5kb21haW5faWQsIGdmbiwgcnYpOworICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0df
RVJSLCAiRG9tYWluICVwZCBhdHRlbXB0IHRvIHVuc2hhcmUgIgorICAgICAgICAgICAgICAgICAg
ICAiZ2ZuICVseCwgRU5PTUVNIGFuZCBubyBoZWxwZXJcbiIsCisgICAgICAgICAgICAgICAgICAg
IGN1cnJkLCBnZm4pOwogICAgICAgICAgICAgLyogQ3Jhc2ggdGhlIGRvbWFpbiAqLwogICAgICAg
ICAgICAgcmMgPSAwOwogICAgICAgICB9CisjZW5kaWYKICAgICB9CisKICAgICBpZiAoIHJlcV9w
dHIgKQogICAgIHsKICAgICAgICAgaWYgKCBtb25pdG9yX3RyYXBzKGN1cnIsIHN5bmMsIHJlcV9w
dHIpIDwgMCApCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
