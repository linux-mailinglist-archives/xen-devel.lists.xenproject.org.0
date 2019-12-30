Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B179512D1C7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:14:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxeS-0002BS-TY; Mon, 30 Dec 2019 16:12:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0QMt=2U=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ilxeR-0002B7-UV
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:12:15 +0000
X-Inumbo-ID: 1b1e7a48-2b1f-11ea-a1e1-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b1e7a48-2b1f-11ea-a1e1-bc764e2007e4;
 Mon, 30 Dec 2019 16:11:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="221167345"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.206])
 by orsmga003.jf.intel.com with ESMTP; 30 Dec 2019 08:11:57 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2019 08:11:35 -0800
Message-Id: <899d79b4ab49c0aabb7743daf7b842d624bcd5fa.1577721845.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577721845.git.tamas.lengyel@intel.com>
References: <cover.1577721845.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 11/18] x86/mem_sharing: ASSERT that
 p2m_set_entry succeeds
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

U2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDQyICsrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCA5M2U3NjA1OTAwLi4zZjM2Y2Q2
YmJjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtMTExNywxMSArMTExNywxOSBAQCBpbnQgYWRk
X3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqc2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLAogICAgICAgICBnb3RvIGVycl91bmxvY2s7CiAgICAgfQogCisgICAgLyoKKyAg
ICAgKiBNdXN0IHN1Y2NlZWQsIHdlIGp1c3QgcmVhZCB0aGUgZW50cnkgYW5kIGhvbGQgdGhlIHAy
bSBsb2NrCisgICAgICogdmlhIGdldF90d29fZ2Zucy4KKyAgICAgKi8KICAgICByZXQgPSBwMm1f
c2V0X2VudHJ5KHAybSwgX2dmbihjZ2ZuKSwgc21mbiwgUEFHRV9PUkRFUl80SywKICAgICAgICAg
ICAgICAgICAgICAgICAgIHAybV9yYW1fc2hhcmVkLCBhKTsKKyAgICBBU1NFUlQoIXJldCk7CiAK
LSAgICAvKiBUZW1wdGVkIHRvIHR1cm4gdGhpcyBpbnRvIGFuIGFzc2VydCAqLwotICAgIGlmICgg
cmV0ICkKKyAgICAvKgorICAgICAqIFRoZXJlIGlzIGEgY2hhbmNlIHdlJ3JlIHBsdWdnaW5nIGEg
aG9sZSB3aGVyZSBhIHBhZ2VkIG91dAorICAgICAqIHBhZ2Ugd2FzLgorICAgICAqLworICAgIGlm
ICggcDJtX2lzX3BhZ2luZyhjbWZuX3R5cGUpICYmIChjbWZuX3R5cGUgIT0gcDJtX3JhbV9wYWdp
bmdfb3V0KSApCiAgICAgewogICAgICAgICBtZW1fc2hhcmluZ19nZm5fZGVzdHJveShzcGFnZSwg
Y2QsIGdmbl9pbmZvKTsKICAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoc3BhZ2UpOwpAQCAtMTEy
OSwyOSArMTEzNywyMSBAQCBpbnQgYWRkX3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqc2QsIHVu
c2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAogICAgIGVsc2UKICAgICB7CiAgICAg
ICAgIC8qCi0gICAgICAgICAqIFRoZXJlIGlzIGEgY2hhbmNlIHdlJ3JlIHBsdWdnaW5nIGEgaG9s
ZSB3aGVyZSBhIHBhZ2VkIG91dAotICAgICAgICAgKiBwYWdlIHdhcy4KKyAgICAgICAgICogRnVy
dGhlciwgdGhlcmUgaXMgYSBjaGFuY2UgdGhpcyB3YXMgYSB2YWxpZCBwYWdlLgorICAgICAgICAg
KiBEb24ndCBsZWFrIGl0LgogICAgICAgICAgKi8KLSAgICAgICAgaWYgKCBwMm1faXNfcGFnaW5n
KGNtZm5fdHlwZSkgJiYgKGNtZm5fdHlwZSAhPSBwMm1fcmFtX3BhZ2luZ19vdXQpICkKKyAgICAg
ICAgaWYgKCBtZm5fdmFsaWQoY21mbikgKQogICAgICAgICB7Ci0gICAgICAgICAgICBhdG9taWNf
ZGVjKCZjZC0+cGFnZWRfcGFnZXMpOwotICAgICAgICAgICAgLyoKLSAgICAgICAgICAgICAqIEZ1
cnRoZXIsIHRoZXJlIGlzIGEgY2hhbmNlIHRoaXMgd2FzIGEgdmFsaWQgcGFnZS4KLSAgICAgICAg
ICAgICAqIERvbid0IGxlYWsgaXQuCi0gICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIGlmICgg
bWZuX3ZhbGlkKGNtZm4pICkKKyAgICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKmNwYWdlID0g
bWZuX3RvX3BhZ2UoY21mbik7CisKKyAgICAgICAgICAgIGlmICggIWdldF9wYWdlKGNwYWdlLCBj
ZCkgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKmNw
YWdlID0gbWZuX3RvX3BhZ2UoY21mbik7Ci0KLSAgICAgICAgICAgICAgICBpZiAoICFnZXRfcGFn
ZShjcGFnZSwgY2QpICkKLSAgICAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgICAgIGRv
bWFpbl9jcmFzaChjZCk7Ci0gICAgICAgICAgICAgICAgICAgIHJldCA9IC1FT1ZFUkZMT1c7Ci0g
ICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3VubG9jazsKLSAgICAgICAgICAgICAgICB9Ci0g
ICAgICAgICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKGNwYWdlKTsKLSAgICAgICAgICAgICAg
ICBwdXRfcGFnZShjcGFnZSk7CisgICAgICAgICAgICAgICAgZG9tYWluX2NyYXNoKGNkKTsKKyAg
ICAgICAgICAgICAgICByZXQgPSAtRU9WRVJGTE9XOworICAgICAgICAgICAgICAgIGdvdG8gZXJy
X3VubG9jazsKICAgICAgICAgICAgIH0KKyAgICAgICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihj
cGFnZSk7CisgICAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7CiAgICAgICAgIH0KICAgICB9CiAK
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
