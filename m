Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4E158380
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 20:24:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Ed5-0000qc-Q9; Mon, 10 Feb 2020 19:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EP43=36=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1j1Ed3-0000qR-WB
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 19:21:58 +0000
X-Inumbo-ID: 97f57c2e-4c3a-11ea-8cad-bc764e2007e4
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97f57c2e-4c3a-11ea-8cad-bc764e2007e4;
 Mon, 10 Feb 2020 19:21:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 11:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,426,1574150400"; d="scan'208";a="380199789"
Received: from jcguru1x-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.67.221])
 by orsmga004.jf.intel.com with ESMTP; 10 Feb 2020 11:21:46 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Feb 2020 11:21:25 -0800
Message-Id: <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1581362050.git.tamas.lengyel@intel.com>
References: <cover.1581362050.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 1/5] x86/p2m: Allow p2m_get_page_from_gfn to
 return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG93bmVyIGRvbWFpbiBvZiBzaGFyZWQgcGFnZXMgaXMgZG9tX2NvdywgdXNlIHRoYXQgZm9y
IGdldF9wYWdlCm90aGVyd2lzZSB0aGUgZnVuY3Rpb24gZmFpbHMgdG8gcmV0dXJuIHRoZSBjb3Jy
ZWN0IHBhZ2UgdW5kZXIgc29tZQpzaXR1YXRpb25zLiBUaGUgY2hlY2sgaWYgZG9tX2NvdyBzaG91
bGQgYmUgdXNlZCB3YXMgb25seSBwZXJmb3JtZWQgaW4KYSBzdWJzZXQgb2YgdXNlLWNhc2VzLiBG
aXhpbmcgdGhlIGVycm9yIGFuZCBzaW1wbGlmeWluZyB0aGUgZXhpc3RpbmcgY2hlY2sKc2luY2Ug
d2UgY2FuJ3QgaGF2ZSBhbnkgc2hhcmVkIGVudHJpZXMgd2l0aCBkb21fY293IGJlaW5nIE5VTEwu
CgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDE0ICsrKysrKysrLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBmZDlmMDk1
MzZkLi4yYzBiYjdlODY5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIv
eGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC01NzQsMTEgKzU3NCwxMiBAQCBzdHJ1Y3QgcGFnZV9p
bmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCiAgICAgICAgICAgICAgICAgaWYgKCBmZG9tID09
IE5VTEwgKQogICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsKICAgICAgICAgICAgIH0K
LSAgICAgICAgICAgIGVsc2UgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICYmCi0g
ICAgICAgICAgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBiZSBzaGFyZWQgKi8KLSAgICAgICAg
ICAgICAgICAgICAgICAoIWRvbV9jb3cgfHwgIXAybV9pc19zaGFyZWQoKnQpIHx8Ci0gICAgICAg
ICAgICAgICAgICAgICAgICFnZXRfcGFnZShwYWdlLCBkb21fY293KSkgKQotICAgICAgICAgICAg
ICAgIHBhZ2UgPSBOVUxMOworICAgICAgICAgICAgZWxzZQorICAgICAgICAgICAgeworICAgICAg
ICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRv
bWFpbiA6IGRvbV9jb3c7CisgICAgICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkg
KQorICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsKKyAgICAgICAgICAgIH0KICAgICAg
ICAgfQogICAgICAgICBwMm1fcmVhZF91bmxvY2socDJtKTsKIApAQCAtNTk0LDggKzU5NSw5IEBA
IHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKICAgICBtZm4gPSBnZXRf
Z2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgdCwgYSwgcSwgTlVMTCk7CiAgICAgaWYg
KCBwMm1faXNfcmFtKCp0KSAmJiBtZm5fdmFsaWQobWZuKSApCiAgICAgeworICAgICAgICBzdHJ1
Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFyZWQoKnQpID8gcDJtLT5kb21haW4gOiBkb21fY293
OwogICAgICAgICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKLSAgICAgICAgaWYgKCAhZ2V0X3Bh
Z2UocGFnZSwgcDJtLT5kb21haW4pICkKKyAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkg
KQogICAgICAgICAgICAgcGFnZSA9IE5VTEw7CiAgICAgfQogICAgIHB1dF9nZm4ocDJtLT5kb21h
aW4sIGdmbl94KGdmbikpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
