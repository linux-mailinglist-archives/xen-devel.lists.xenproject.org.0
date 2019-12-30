Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977712D1C4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxeD-00024k-RC; Mon, 30 Dec 2019 16:12:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0QMt=2U=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ilxeC-00024e-Tl
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:12:00 +0000
X-Inumbo-ID: 196ad99e-2b1f-11ea-88e7-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 196ad99e-2b1f-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 16:11:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="221167330"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.206])
 by orsmga003.jf.intel.com with ESMTP; 30 Dec 2019 08:11:54 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2019 08:11:31 -0800
Message-Id: <32e7f9ffc37da3445080a6901a638a43805765de.1577721845.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577721845.git.tamas.lengyel@intel.com>
References: <cover.1577721845.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 07/18] x86/mem_sharing: Use INVALID_MFN and
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
ZXggM2FhNjFjMzBlNi4uOTVlNzVmZjI5OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21l
bV9zaGFyaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTEzMjYs
NyArMTMyNiw3IEBAIGludCByZWxpbnF1aXNoX3NoYXJlZF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpk
KQogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJt
LCBfZ2ZuKGdmbiksICZ0LCAmYSwgMCwgTlVMTCwgTlVMTCk7Ci0gICAgICAgIGlmICggbWZuX3Zh
bGlkKG1mbikgJiYgdCA9PSBwMm1fcmFtX3NoYXJlZCApCisgICAgICAgIGlmICggbWZuX3ZhbGlk
KG1mbikgJiYgcDJtX2lzX3NoYXJlZCh0KSApCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIERv
ZXMgbm90IGZhaWwgd2l0aCBFTk9NRU0gZ2l2ZW4gdGhlIERFU1RST1kgZmxhZyAqLwogICAgICAg
ICAgICAgQlVHX09OKF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKApAQCAtMTMzNiw3ICsxMzM2
LDcgQEAgaW50IHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQpCiAgICAg
ICAgICAgICAgKiB1bnNoYXJlLiAgTXVzdCBzdWNjZWVkOiB3ZSBqdXN0IHJlYWQgdGhlIG9sZCBl
bnRyeSBhbmQKICAgICAgICAgICAgICAqIHdlIGhvbGQgdGhlIHAybSBsb2NrLgogICAgICAgICAg
ICAgICovCi0gICAgICAgICAgICBzZXRfcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIF9nZm4oZ2Zu
KSwgX21mbigwKSwgUEFHRV9PUkRFUl80SywKKyAgICAgICAgICAgIHNldF9yYyA9IHAybS0+c2V0
X2VudHJ5KHAybSwgX2dmbihnZm4pLCBJTlZBTElEX01GTiwgUEFHRV9PUkRFUl80SywKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9pbnZhbGlkLCBwMm1fYWNjZXNzX3J3
eCwgLTEpOwogICAgICAgICAgICAgQVNTRVJUKCFzZXRfcmMpOwogICAgICAgICAgICAgY291bnQg
Kz0gMHgxMDsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
