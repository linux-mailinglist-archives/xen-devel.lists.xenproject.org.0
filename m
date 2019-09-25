Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D305CBE1B5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Y0-0000sV-M4; Wed, 25 Sep 2019 15:49:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Xy-0000rO-TX
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:49:42 +0000
X-Inumbo-ID: 12ae8a4c-dfac-11e9-9637-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 12ae8a4c-dfac-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 15:49:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812668"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:33 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:47 -0700
Message-Id: <8e1eedcf984b7948683fe2a2cf5cb1d2b6c5a674.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 09/18] x86/mem_sharing: Use
 INVALID_MFN and p2m_is_shared in relinquish_shared_pages
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
ZXggZDVlY2I3NzY3OS4uNjAwNTdmZDNlZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21l
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
