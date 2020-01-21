Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFB1443AA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:53:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxfK-0004bH-LH; Tue, 21 Jan 2020 17:50:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxfJ-0004aa-AV
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:50:13 +0000
X-Inumbo-ID: 738d7522-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 738d7522-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929128"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:00 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:36 -0800
Message-Id: <17ea032201adfecdb5dedc3a0b9667eccdf7f118.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 03/18] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
ZWN0IHBhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxA
aW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDUgKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5kZXggMzExOTI2OTA3
My4uZmRlYjc0MjcwNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtNTk0LDcgKzU5NCwxMCBAQCBzdHJ1Y3QgcGFnZV9pbmZv
ICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCiAgICAgaWYgKCBwMm1faXNfcmFtKCp0KSAmJiBtZm5f
dmFsaWQobWZuKSApCiAgICAgewogICAgICAgICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKLSAg
ICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICkKKyAgICAgICAgaWYgKCAh
Z2V0X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICYmCisgICAgICAgICAgICAgLyogUGFnZSBjb3Vs
ZCBiZSBzaGFyZWQgKi8KKyAgICAgICAgICAgICAoIWRvbV9jb3cgfHwgIXAybV9pc19zaGFyZWQo
KnQpIHx8CisgICAgICAgICAgICAgICFnZXRfcGFnZShwYWdlLCBkb21fY293KSkgKQogICAgICAg
ICAgICAgcGFnZSA9IE5VTEw7CiAgICAgfQogICAgIHB1dF9nZm4ocDJtLT5kb21haW4sIGdmbl94
KGdmbikpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
