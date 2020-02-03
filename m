Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D114B150A9C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 17:15:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeKl-0007Vc-Kz; Mon, 03 Feb 2020 16:12:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZuA2=3X=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iyeKj-0007VR-Pz
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:12:21 +0000
X-Inumbo-ID: f3a74a0c-469f-11ea-8e75-12813bfff9fa
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3a74a0c-469f-11ea-8e75-12813bfff9fa;
 Mon, 03 Feb 2020 16:12:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 08:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="337726362"
Received: from kchen27-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.20.224])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2020 08:12:17 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Feb 2020 08:12:03 -0800
Message-Id: <b784bc7edf0c267e03100b30a0250454be37f59c.1580746020.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1580746020.git.tamas.lengyel@intel.com>
References: <cover.1580746020.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 1/7] x86/p2m: Allow p2m_get_page_from_gfn to
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
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
PgotLS0Kdjc6IHVwZGF0ZSBjb21taXQgbWVzc2FnZQotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0u
YyB8IDE0ICsrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwppbmRleCBkZWYxM2Y2NTdiLi4wMDdmZWY3MjBkIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC01
NzUsMTEgKzU3NSwxMiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4o
CiAgICAgICAgICAgICAgICAgaWYgKCBmZG9tID09IE5VTEwgKQogICAgICAgICAgICAgICAgICAg
ICBwYWdlID0gTlVMTDsKICAgICAgICAgICAgIH0KLSAgICAgICAgICAgIGVsc2UgaWYgKCAhZ2V0
X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICYmCi0gICAgICAgICAgICAgICAgICAgICAgLyogUGFn
ZSBjb3VsZCBiZSBzaGFyZWQgKi8KLSAgICAgICAgICAgICAgICAgICAgICAoIWRvbV9jb3cgfHwg
IXAybV9pc19zaGFyZWQoKnQpIHx8Ci0gICAgICAgICAgICAgICAgICAgICAgICFnZXRfcGFnZShw
YWdlLCBkb21fY293KSkgKQotICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOworICAgICAgICAg
ICAgZWxzZQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQg
PSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7CisgICAgICAgICAg
ICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkgKQorICAgICAgICAgICAgICAgICAgICBwYWdl
ID0gTlVMTDsKKyAgICAgICAgICAgIH0KICAgICAgICAgfQogICAgICAgICBwMm1fcmVhZF91bmxv
Y2socDJtKTsKIApAQCAtNTk1LDggKzU5Niw5IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRf
cGFnZV9mcm9tX2dmbigKICAgICBtZm4gPSBnZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3go
Z2ZuKSwgdCwgYSwgcSwgTlVMTCk7CiAgICAgaWYgKCBwMm1faXNfcmFtKCp0KSAmJiBtZm5fdmFs
aWQobWZuKSApCiAgICAgeworICAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFy
ZWQoKnQpID8gcDJtLT5kb21haW4gOiBkb21fY293OwogICAgICAgICBwYWdlID0gbWZuX3RvX3Bh
Z2UobWZuKTsKLSAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICkKKyAg
ICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkgKQogICAgICAgICAgICAgcGFnZSA9IE5VTEw7
CiAgICAgfQogICAgIHB1dF9nZm4ocDJtLT5kb21haW4sIGdmbl94KGdmbikpOwotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
