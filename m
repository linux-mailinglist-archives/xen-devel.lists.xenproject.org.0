Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D714A9D9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:36:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw9DH-0001yO-Av; Mon, 27 Jan 2020 18:34:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5jYl=3Q=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iw9DG-0001y7-38
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:34:18 +0000
X-Inumbo-ID: 9d8af63a-4133-11ea-aafc-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d8af63a-4133-11ea-aafc-bc764e2007e4;
 Mon, 27 Jan 2020 18:34:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 10:06:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,370,1574150400"; d="scan'208";a="231562353"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.183.124])
 by orsmga006.jf.intel.com with ESMTP; 27 Jan 2020 10:06:46 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 Jan 2020 10:06:29 -0800
Message-Id: <8f7138e4d6a11975ef85458c000a337a60a4e13e.1580148227.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1580148227.git.tamas.lengyel@intel.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 1/9] x86/p2m: Allow p2m_get_page_from_gfn to
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG93bmVyIGRvbWFpbiBvZiBzaGFyZWQgcGFnZXMgaXMgZG9tX2NvdywgdXNlIHRoYXQgZm9y
IGdldF9wYWdlCm90aGVyd2lzZSB0aGUgZnVuY3Rpb24gZmFpbHMgdG8gcmV0dXJuIHRoZSBjb3Jy
ZWN0IHBhZ2UuIEZpeGluZyB0aGUKZXJyb3Igbm93IGFuZCBzaW1wbGlmeWluZyB0aGUgY2hlY2tz
IHNpbmNlIHdlIGNhbid0IGhhdmUgYW55IHNoYXJlZAplbnRyaWVzIHdpdGggZG9tX2NvdyBiZWlu
ZyBOVUxMLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGlu
dGVsLmNvbT4KLS0tCnY2OiB1c2Ugc2ltcGxpZmllZCBjaGVjayBmb3IgZG9tX2NvdyBpbiBib3Ro
IHNsb3cgYW5kIGZhc3QgcGF0aAotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDE0ICsrKysr
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYwppbmRleCA0OWNjMTM4MzYyLi5mNTQzNjBiNDNkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC01NzQsMTEgKzU3NCwx
MiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCiAgICAgICAgICAg
ICAgICAgaWYgKCBmZG9tID09IE5VTEwgKQogICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVM
TDsKICAgICAgICAgICAgIH0KLSAgICAgICAgICAgIGVsc2UgaWYgKCAhZ2V0X3BhZ2UocGFnZSwg
cDJtLT5kb21haW4pICYmCi0gICAgICAgICAgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBiZSBz
aGFyZWQgKi8KLSAgICAgICAgICAgICAgICAgICAgICAoIWRvbV9jb3cgfHwgIXAybV9pc19zaGFy
ZWQoKnQpIHx8Ci0gICAgICAgICAgICAgICAgICAgICAgICFnZXRfcGFnZShwYWdlLCBkb21fY293
KSkgKQotICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOworICAgICAgICAgICAgZWxzZQorICAg
ICAgICAgICAgeworICAgICAgICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSAhcDJtX2lzX3No
YXJlZCgqdCkgPyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7CisgICAgICAgICAgICAgICAgaWYgKCAh
Z2V0X3BhZ2UocGFnZSwgZCkgKQorICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsKKyAg
ICAgICAgICAgIH0KICAgICAgICAgfQogICAgICAgICBwMm1fcmVhZF91bmxvY2socDJtKTsKIApA
QCAtNTk0LDggKzU5NSw5IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dm
bigKICAgICBtZm4gPSBnZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgdCwgYSwg
cSwgTlVMTCk7CiAgICAgaWYgKCBwMm1faXNfcmFtKCp0KSAmJiBtZm5fdmFsaWQobWZuKSApCiAg
ICAgeworICAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFyZWQoKnQpID8gcDJt
LT5kb21haW4gOiBkb21fY293OwogICAgICAgICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKLSAg
ICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICkKKyAgICAgICAgaWYgKCAh
Z2V0X3BhZ2UocGFnZSwgZCkgKQogICAgICAgICAgICAgcGFnZSA9IE5VTEw7CiAgICAgfQogICAg
IHB1dF9nZm4ocDJtLT5kb21haW4sIGdmbl94KGdmbikpOwotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
