Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2C12D1CF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:15:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxeb-0002It-31; Mon, 30 Dec 2019 16:12:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0QMt=2U=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ilxeZ-0002HN-4u
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:12:23 +0000
X-Inumbo-ID: 19b9cc3e-2b1f-11ea-a04b-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19b9cc3e-2b1f-11ea-a04b-12813bfff9fa;
 Mon, 30 Dec 2019 16:11:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="221167333"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.206])
 by orsmga003.jf.intel.com with ESMTP; 30 Dec 2019 08:11:55 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2019 08:11:32 -0800
Message-Id: <62961de1cf0b0817e327bec3ba1cd4985fc6e8f6.1577721845.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577721845.git.tamas.lengyel@intel.com>
References: <cover.1577721845.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 08/18] x86/mem_sharing: Make add_to_physmap
 static and shorten name
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

SXQncyBub3QgYmVpbmcgY2FsbGVkIGZyb20gb3V0c2lkZSBtZW1fc2hhcmluZy5jCgpTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5kZXgg
OTVlNzVmZjI5OC4uODRiOWYxMzBiOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9z
aGFyaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTEwNjksOCAr
MTA2OSw5IEBAIGVycl9vdXQ6CiAgICAgcmV0dXJuIHJldDsKIH0KIAotaW50IG1lbV9zaGFyaW5n
X2FkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBsb25nIHNnZm4sIHNo
cl9oYW5kbGVfdCBzaCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG9t
YWluICpjZCwgdW5zaWduZWQgbG9uZyBjZ2ZuLCBib29sIGxvY2spCitzdGF0aWMKK2ludCBhZGRf
dG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJfaGFu
ZGxlX3Qgc2gsCisgICAgICAgICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqY2QsIHVuc2lnbmVk
IGxvbmcgY2dmbiwgYm9vbCBsb2NrKQogewogICAgIHN0cnVjdCBwYWdlX2luZm8gKnNwYWdlOwog
ICAgIGludCByZXQgPSAtRUlOVkFMOwpAQCAtMTU4Miw3ICsxNTgzLDcgQEAgaW50IG1lbV9zaGFy
aW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFyaW5nX29wX3QpIGFy
ZykKICAgICAgICAgc2ggICAgICA9IG1zby51LnNoYXJlLnNvdXJjZV9oYW5kbGU7CiAgICAgICAg
IGNnZm4gICAgPSBtc28udS5zaGFyZS5jbGllbnRfZ2ZuOwogCi0gICAgICAgIHJjID0gbWVtX3No
YXJpbmdfYWRkX3RvX3BoeXNtYXAoZCwgc2dmbiwgc2gsIGNkLCBjZ2ZuLCB0cnVlKTsKKyAgICAg
ICAgcmMgPSBhZGRfdG9fcGh5c21hcChkLCBzZ2ZuLCBzaCwgY2QsIGNnZm4sIHRydWUpOwogCiAg
ICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGNkKTsKICAgICB9Ci0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
