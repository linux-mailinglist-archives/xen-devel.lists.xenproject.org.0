Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C355125223
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:44:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfCD-0007bu-CA; Wed, 18 Dec 2019 19:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfCC-0007bW-8C
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:41:20 +0000
X-Inumbo-ID: 5b82fe42-21ce-11ea-a1e1-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b82fe42-21ce-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 19:41:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196344"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:16 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:47 -0800
Message-Id: <b1cdb08badd4b93967b14e52775c5c0f3cae860c.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 10/20] x86/mem_sharing: Make add_to_physmap
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
MWI3YjUyMGNjZi4uZmMxZDhiZTFlYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9z
aGFyaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTEwNjQsOCAr
MTA2NCw5IEBAIGVycl9vdXQ6CiAgICAgcmV0dXJuIHJldDsKIH0KIAotaW50IG1lbV9zaGFyaW5n
X2FkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBsb25nIHNnZm4sIHNo
cl9oYW5kbGVfdCBzaCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG9t
YWluICpjZCwgdW5zaWduZWQgbG9uZyBjZ2ZuLCBib29sIGxvY2spCitzdGF0aWMKK2ludCBhZGRf
dG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJfaGFu
ZGxlX3Qgc2gsCisgICAgICAgICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqY2QsIHVuc2lnbmVk
IGxvbmcgY2dmbiwgYm9vbCBsb2NrKQogewogICAgIHN0cnVjdCBwYWdlX2luZm8gKnNwYWdlOwog
ICAgIGludCByZXQgPSAtRUlOVkFMOwpAQCAtMTU1OCw3ICsxNTU5LDcgQEAgaW50IG1lbV9zaGFy
aW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFyaW5nX29wX3QpIGFy
ZykKICAgICAgICAgICAgIHNoICAgICAgPSBtc28udS5zaGFyZS5zb3VyY2VfaGFuZGxlOwogICAg
ICAgICAgICAgY2dmbiAgICA9IG1zby51LnNoYXJlLmNsaWVudF9nZm47CiAKLSAgICAgICAgICAg
IHJjID0gbWVtX3NoYXJpbmdfYWRkX3RvX3BoeXNtYXAoZCwgc2dmbiwgc2gsIGNkLCBjZ2ZuLCB0
cnVlKTsKKyAgICAgICAgICAgIHJjID0gYWRkX3RvX3BoeXNtYXAoZCwgc2dmbiwgc2gsIGNkLCBj
Z2ZuLCB0cnVlKTsKIAogICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4oY2QpOwogICAgICAg
ICB9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
