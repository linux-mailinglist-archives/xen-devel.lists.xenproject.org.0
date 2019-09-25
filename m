Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88BBE1B4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9YB-00010p-42; Wed, 25 Sep 2019 15:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Y8-0000zI-W7
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:49:53 +0000
X-Inumbo-ID: 13cf570a-dfac-11e9-9637-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 13cf570a-dfac-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 15:49:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812705"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:37 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:53 -0700
Message-Id: <17cdac1caa0c29c4d6a32c5d9167d223550ac0e6.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 15/18] x86/mem_sharing: Skip xen
 heap pages in memshr nominate
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
X3NoYXJpbmcuYwppbmRleCA2NWFhNjRiZTk5Li5kMzViN2ViMTM4IDEwMDY0NAotLS0gYS94ZW4v
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
