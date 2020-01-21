Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD91443AC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:53:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxfS-0004et-BN; Tue, 21 Jan 2020 17:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxfR-0004eU-Gw
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:50:21 +0000
X-Inumbo-ID: 79141b7c-3c76-11ea-aecd-bc764e2007e4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79141b7c-3c76-11ea-aecd-bc764e2007e4;
 Tue, 21 Jan 2020 17:50:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929173"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:03 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:41 -0800
Message-Id: <a39bf7418d86179b234876da4346fbd437d32854.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 08/18] x86/mem_sharing: Use INVALID_MFN and
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgdXNpbmcgX21mbigwKSBpcyBvZiBubyBjb25zZXF1ZW5jZSBkdXJpbmcgdGVhcmRvd24s
IElOVkFMSURfTUZOIGlzIHRoZQpjb3JyZWN0IHZhbHVlIHRoYXQgc2hvdWxkIGJlIHVzZWQuCgpT
aWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1f
c2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5kZXggMTg0NmY5N2Fj
Yy4uY2MzZmM5NzYxOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTEzMTQsNyArMTMxNCw3IEBA
IGludCByZWxpbnF1aXNoX3NoYXJlZF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICAg
ICAgYnJlYWs7CiAKICAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJtLCBfZ2ZuKGdmbiks
ICZ0LCAmYSwgMCwgTlVMTCwgTlVMTCk7Ci0gICAgICAgIGlmICggbWZuX3ZhbGlkKG1mbikgJiYg
dCA9PSBwMm1fcmFtX3NoYXJlZCApCisgICAgICAgIGlmICggbWZuX3ZhbGlkKG1mbikgJiYgcDJt
X2lzX3NoYXJlZCh0KSApCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIERvZXMgbm90IGZhaWwg
d2l0aCBFTk9NRU0gZ2l2ZW4gdGhlIERFU1RST1kgZmxhZyAqLwogICAgICAgICAgICAgQlVHX09O
KF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKApAQCAtMTMyNCw3ICsxMzI0LDcgQEAgaW50IHJl
bGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgICAgICAgICAgKiB1
bnNoYXJlLiAgTXVzdCBzdWNjZWVkOiB3ZSBqdXN0IHJlYWQgdGhlIG9sZCBlbnRyeSBhbmQKICAg
ICAgICAgICAgICAqIHdlIGhvbGQgdGhlIHAybSBsb2NrLgogICAgICAgICAgICAgICovCi0gICAg
ICAgICAgICBzZXRfcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIF9nZm4oZ2ZuKSwgX21mbigwKSwg
UEFHRV9PUkRFUl80SywKKyAgICAgICAgICAgIHNldF9yYyA9IHAybS0+c2V0X2VudHJ5KHAybSwg
X2dmbihnZm4pLCBJTlZBTElEX01GTiwgUEFHRV9PUkRFUl80SywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHAybV9pbnZhbGlkLCBwMm1fYWNjZXNzX3J3eCwgLTEpOwogICAg
ICAgICAgICAgQVNTRVJUKCFzZXRfcmMpOwogICAgICAgICAgICAgY291bnQgKz0gMHgxMDsKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
