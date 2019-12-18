Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF99125221
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:44:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfCp-00083S-9V; Wed, 18 Dec 2019 19:41:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfCo-00082V-7x
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:41:58 +0000
X-Inumbo-ID: 5b7ec746-21ce-11ea-90f3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b7ec746-21ce-11ea-90f3-12813bfff9fa;
 Wed, 18 Dec 2019 19:41:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196338"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:16 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:46 -0800
Message-Id: <c3ce2328f6ab3d2939c6e78413215212dc3356e8.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 09/20] x86/mem_sharing: Use INVALID_MFN and
 p2m_is_shared in relinquish_shared_pages
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

V2hpbGUgdXNpbmcgX21mbigwKSBpcyBvZiBubyBjb25zZXF1ZW5jZSBkdXJpbmcgdGVhcmRvd24s
IElOVkFMSURfTUZOIGlzIHRoZQpjb3JyZWN0IHZhbHVlIHRoYXQgc2hvdWxkIGJlIHVzZWQuCgpT
aWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5k
ZXggNWQ4MTczMDMxNS4uMWI3YjUyMGNjZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21l
bV9zaGFyaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTEzMTcs
NyArMTMxNyw3IEBAIGludCByZWxpbnF1aXNoX3NoYXJlZF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpk
KQogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJt
LCBfZ2ZuKGdmbiksICZ0LCAmYSwgMCwgTlVMTCwgTlVMTCk7Ci0gICAgICAgIGlmICggbWZuX3Zh
bGlkKG1mbikgJiYgdCA9PSBwMm1fcmFtX3NoYXJlZCApCisgICAgICAgIGlmICggbWZuX3ZhbGlk
KG1mbikgJiYgcDJtX2lzX3NoYXJlZCh0KSApCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIERv
ZXMgbm90IGZhaWwgd2l0aCBFTk9NRU0gZ2l2ZW4gdGhlIERFU1RST1kgZmxhZyAqLwogICAgICAg
ICAgICAgQlVHX09OKF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGQsIGdmbiwKQEAgLTEzMjcs
NyArMTMyNyw3IEBAIGludCByZWxpbnF1aXNoX3NoYXJlZF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpk
KQogICAgICAgICAgICAgICogdW5zaGFyZS4gIE11c3Qgc3VjY2VlZDogd2UganVzdCByZWFkIHRo
ZSBvbGQgZW50cnkgYW5kCiAgICAgICAgICAgICAgKiB3ZSBob2xkIHRoZSBwMm0gbG9jay4KICAg
ICAgICAgICAgICAqLwotICAgICAgICAgICAgc2V0X3JjID0gcDJtLT5zZXRfZW50cnkocDJtLCBf
Z2ZuKGdmbiksIF9tZm4oMCksIFBBR0VfT1JERVJfNEssCisgICAgICAgICAgICBzZXRfcmMgPSBw
Mm0tPnNldF9lbnRyeShwMm0sIF9nZm4oZ2ZuKSwgSU5WQUxJRF9NRk4sIFBBR0VfT1JERVJfNEss
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1faW52YWxpZCwgcDJtX2Fj
Y2Vzc19yd3gsIC0xKTsKICAgICAgICAgICAgIEFTU0VSVCghc2V0X3JjKTsKICAgICAgICAgICAg
IGNvdW50ICs9IDB4MTA7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
