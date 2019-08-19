Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C8926BA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 16:30:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzicj-0007I8-GE; Mon, 19 Aug 2019 14:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzici-0007Ht-2I
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 14:27:04 +0000
X-Inumbo-ID: 69736474-c28d-11e9-b90c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 69736474-c28d-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 14:27:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D9DC1576;
 Mon, 19 Aug 2019 07:27:02 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29E2E3F718;
 Mon, 19 Aug 2019 07:27:01 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 15:26:51 +0100
Message-Id: <20190819142651.11058-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190819142651.11058-1-julien.grall@arm.com>
References: <20190819142651.11058-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v4 2/2] xen/domain: Use typesafe gfn in
 map_vcpu_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIHNhbWUgdGltZSwgbW9kaWZ5IHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoZSBoeXBlcmNh
bGwgdG8gcmVmbGVjdAp0aGUgcmVhbCBtZWFuaW5nIG9mIHRoZSBmaWVsZCBtZm4uCgpTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBDaGFu
Z2VzIGluIHY0OgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5j
ICAgICAgIHwgNiArKystLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy92Y3B1LmggfCAyICstCiB4ZW4v
aW5jbHVkZS94ZW4vZG9tYWluLmggIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBi
L3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggZThmNmRmYmRmMS4uOTE1ZWJjYTE5MCAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCkBAIC0x
MjgyLDcgKzEyODIsNyBAQCBpbnQgdmNwdV9yZXNldChzdHJ1Y3QgdmNwdSAqdikKICAqIG9mIG1l
bW9yeSwgYW5kIGl0IHNldHMgYSBwZW5kaW5nIGV2ZW50IHRvIG1ha2Ugc3VyZSB0aGF0IGEgcGVu
ZGluZwogICogZXZlbnQgZG9lc24ndCBnZXQgbWlzc2VkLgogICovCi1pbnQgbWFwX3ZjcHVfaW5m
byhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBnZm4sIHVuc2lnbmVkIG9mZnNldCkKK2lu
dCBtYXBfdmNwdV9pbmZvKHN0cnVjdCB2Y3B1ICp2LCBnZm5fdCBnZm4sIHVuc2lnbmVkIG9mZnNl
dCkKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwogICAgIHZvaWQgKm1hcHBp
bmc7CkBAIC0xMjk5LDcgKzEyOTksNyBAQCBpbnQgbWFwX3ZjcHVfaW5mbyhzdHJ1Y3QgdmNwdSAq
diwgdW5zaWduZWQgbG9uZyBnZm4sIHVuc2lnbmVkIG9mZnNldCkKICAgICBpZiAoICh2ICE9IGN1
cnJlbnQpICYmICEodi0+cGF1c2VfZmxhZ3MgJiBWUEZfZG93bikgKQogICAgICAgICByZXR1cm4g
LUVJTlZBTDsKIAotICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbihkLCBfZ2ZuKGdmbiksIE5V
TEwsIFAyTV9BTExPQyk7CisgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbiwgTlVM
TCwgUDJNX0FMTE9DKTsKICAgICBpZiAoICFwYWdlICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAKQEAgLTE1MzgsNyArMTUzOCw3IEBAIGxvbmcgZG9fdmNwdV9vcChpbnQgY21kLCB1bnNpZ25l
ZCBpbnQgdmNwdWlkLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKICAgICAgICAg
ICAgIGJyZWFrOwogCiAgICAgICAgIGRvbWFpbl9sb2NrKGQpOwotICAgICAgICByYyA9IG1hcF92
Y3B1X2luZm8odiwgaW5mby5tZm4sIGluZm8ub2Zmc2V0KTsKKyAgICAgICAgcmMgPSBtYXBfdmNw
dV9pbmZvKHYsIF9nZm4oaW5mby5tZm4pLCBpbmZvLm9mZnNldCk7CiAgICAgICAgIGRvbWFpbl91
bmxvY2soZCk7CiAKICAgICAgICAgYnJlYWs7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvdmNwdS5oIGIveGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaAppbmRleCAzNjIzYWY5MzJmLi5k
YzRjNmE3MmEwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdmNwdS5oCisrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy92Y3B1LmgKQEAgLTE4Miw3ICsxODIsNyBAQCBERUZJTkVfWEVOX0dV
RVNUX0hBTkRMRSh2Y3B1X3NldF9zaW5nbGVzaG90X3RpbWVyX3QpOwogICovCiAjZGVmaW5lIFZD
UFVPUF9yZWdpc3Rlcl92Y3B1X2luZm8gICAxMCAgLyogYXJnID09IHZjcHVfcmVnaXN0ZXJfdmNw
dV9pbmZvX3QgKi8KIHN0cnVjdCB2Y3B1X3JlZ2lzdGVyX3ZjcHVfaW5mbyB7Ci0gICAgdWludDY0
X3QgbWZuOyAgICAvKiBtZm4gb2YgcGFnZSB0byBwbGFjZSB2Y3B1X2luZm8gKi8KKyAgICB1aW50
NjRfdCBtZm47ICAgIC8qIGdmbiBvZiBwYWdlIHRvIHBsYWNlIHZjcHVfaW5mbyAqLwogICAgIHVp
bnQzMl90IG9mZnNldDsgLyogb2Zmc2V0IHdpdGhpbiBwYWdlICovCiAgICAgdWludDMyX3QgcnN2
ZDsgICAvKiB1bnVzZWQgKi8KIH07CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWlu
LmggYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKaW5kZXggM2YwOWNiNjZjMC4uN2U3NTRmN2Nj
MCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCisrKyBiL3hlbi9pbmNsdWRl
L3hlbi9kb21haW4uaApAQCAtNTgsNyArNTgsNyBAQCB2b2lkIGZyZWVfcGlycV9zdHJ1Y3Qodm9p
ZCAqKTsKIGludCAgYXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3QgdmNwdSAqdik7CiB2b2lkIGFyY2hf
dmNwdV9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KTsKIAotaW50IG1hcF92Y3B1X2luZm8oc3RydWN0
IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgZ2ZuLCB1bnNpZ25lZCBvZmZzZXQpOworaW50IG1hcF92
Y3B1X2luZm8oc3RydWN0IHZjcHUgKnYsIGdmbl90IGdmbiwgdW5zaWduZWQgb2Zmc2V0KTsKIHZv
aWQgdW5tYXBfdmNwdV9pbmZvKHN0cnVjdCB2Y3B1ICp2KTsKIAogaW50IGFyY2hfZG9tYWluX2Ny
ZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
