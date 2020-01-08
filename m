Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2DB1348F2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:16:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEvP-00012k-Lq; Wed, 08 Jan 2020 17:15:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uSPe=25=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipEvO-000122-Qz
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:15:18 +0000
X-Inumbo-ID: 5d238151-323a-11ea-b85f-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d238151-323a-11ea-b85f-12813bfff9fa;
 Wed, 08 Jan 2020 17:14:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="395806125"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.132.23])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2020 09:14:43 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 09:14:10 -0800
Message-Id: <ce3871c8e9ee01523d2032990ff8acaaaf69a350.1578503483.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578503483.git.tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 13/18] x86/mem_sharing: Skip xen heap pages
 in memshr nominate
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

VHJ5aW5nIHRvIHNoYXJlIHRoZXNlIHdvdWxkIGZhaWwgYW55d2F5LCBiZXR0ZXIgdG8gc2tpcCB0
aGVtIGVhcmx5LgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVs
QGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X3NoYXJpbmcuYwppbmRleCBiOGE5MjI4ZWNmLi5iYWEzZTM1ZGVkIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYwpAQCAtODUyLDYgKzg1MiwxMSBAQCBzdGF0aWMgaW50IG5vbWluYXRlX3BhZ2Uoc3RydWN0
IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLAogICAgIGlmICggIXAybV9pc19zaGFyYWJsZShwMm10KSAp
CiAgICAgICAgIGdvdG8gb3V0OwogCisgICAgLyogU2tpcCB4ZW4gaGVhcCBwYWdlcyAqLworICAg
IHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOworICAgIGlmICggIXBhZ2UgfHwgaXNfeGVuX2hlYXBf
cGFnZShwYWdlKSApCisgICAgICAgIGdvdG8gb3V0OworCiAgICAgLyogQ2hlY2sgaWYgdGhlcmUg
YXJlIG1lbV9hY2Nlc3MvcmVtYXBwZWQgYWx0cDJtIGVudHJpZXMgZm9yIHRoaXMgcGFnZSAqLwog
ICAgIGlmICggYWx0cDJtX2FjdGl2ZShkKSApCiAgICAgewpAQCAtODgyLDcgKzg4Nyw2IEBAIHN0
YXRpYyBpbnQgbm9taW5hdGVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCiAgICAg
fQogCiAgICAgLyogVHJ5IHRvIGNvbnZlcnQgdGhlIG1mbiB0byB0aGUgc2hhcmFibGUgdHlwZSAq
LwotICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwogICAgIHJldCA9IHBhZ2VfbWFrZV9zaGFy
YWJsZShkLCBwYWdlLCBleHBlY3RlZF9yZWZjbnQpOwogICAgIGlmICggcmV0ICkKICAgICAgICAg
Z290byBvdXQ7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
