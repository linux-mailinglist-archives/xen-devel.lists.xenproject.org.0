Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479223348A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRT-0001xO-Ie; Mon, 03 Jun 2019 16:04:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRS-0001wq-D7
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:10 +0000
X-Inumbo-ID: 3886b10a-8619-11e9-892c-875838fe41ea
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3886b10a-8619-11e9-892c-875838fe41ea;
 Mon, 03 Jun 2019 16:04:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0929515AB;
 Mon,  3 Jun 2019 09:04:09 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A268F3F246;
 Mon,  3 Jun 2019 09:04:06 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:41 +0100
Message-Id: <20190603160350.29806-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 05/14] xen: Convert is_xen_fixed_mfn to use
 typesafe MFN
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Shane Wang <shane.wang@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Gang Wei <gang.wei@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
Ci0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEFkZCBHZW9yZ2UncyByZXZpZXdlZC1i
eQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgSmFuJ3MgcmV2aWV3ZWQtYnkKICAg
ICAgICAtIEFkZCBTdGVmYW5vJ3MgYWNrZWQtYnkKLS0tCiB4ZW4vYXJjaC94ODYvdGJvb3QuYyAg
ICAgfCAyICstCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgfCAyICstCiB4ZW4vaW5jbHVkZS9h
c20tYXJtL21tLmggfCA0ICsrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCB8IDQgKystLQog
NCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3Rib290LmMgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwppbmRleCBm
M2ZkZWU0ZDM5Li4zMGQxNTljYzYyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGJvb3QuYwor
KysgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwpAQCAtMjgwLDcgKzI4MCw3IEBAIHN0YXRpYyB2b2lk
IHRib290X2dlbl94ZW5oZWFwX2ludGVncml0eShjb25zdCB1aW50OF90IGtleVtUQl9LRVlfU0la
RV0sCiAKICAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKF9tZm4obWZuKSkgKQogICAgICAgICAgICAg
Y29udGludWU7Ci0gICAgICAgIGlmICggaXNfeGVuX2ZpeGVkX21mbihtZm4pICkKKyAgICAgICAg
aWYgKCBpc194ZW5fZml4ZWRfbWZuKF9tZm4obWZuKSkgKQogICAgICAgICAgICAgY29udGludWU7
IC8qIHNraXAgWGVuICovCiAgICAgICAgIGlmICggKG1mbiA+PSBQRk5fRE9XTihnX3Rib290X3No
YXJlZC0+dGJvb3RfYmFzZSAtIDMgKiBQQUdFX1NJWkUpKQogICAgICAgICAgICAgICYmIChtZm4g
PCBQRk5fVVAoZ190Ym9vdF9zaGFyZWQtPnRib290X2Jhc2UKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKaW5kZXggNzA3NWUwODRi
NC4uNzFlMjRkYmIyZCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTE1NzIsNyArMTU3Miw3IEBAIGludCBvZmZsaW5l
X3BhZ2UobWZuX3QgbWZuLCBpbnQgYnJva2VuLCB1aW50MzJfdCAqc3RhdHVzKQogICAgICpzdGF0
dXMgPSAwOwogICAgIHBnID0gbWZuX3RvX3BhZ2UobWZuKTsKIAotICAgIGlmICggaXNfeGVuX2Zp
eGVkX21mbihtZm5feChtZm4pKSApCisgICAgaWYgKCBpc194ZW5fZml4ZWRfbWZuKG1mbikgKQog
ICAgIHsKICAgICAgICAgKnN0YXR1cyA9IFBHX09GRkxJTkVfWEVOUEFHRSB8IFBHX09GRkxJTkVf
RkFJTEVEIHwKICAgICAgICAgICAoRE9NSURfWEVOIDw8IFBHX09GRkxJTkVfT1dORVJfU0hJRlQp
OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9tbS5oCmluZGV4IDdiNmFhZjVlM2YuLmI1NjAxOGFhY2UgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKQEAgLTE1
MSw4ICsxNTEsOCBAQCBleHRlcm4gdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfc3RhcnQ7CiAjZW5kaWYK
IAogI2RlZmluZSBpc194ZW5fZml4ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKLSAgICAoKHBmbl90b19wYWRkcihtZm4pID49IHZpcnRfdG9fbWFkZHIoJl9z
dGFydCkpICYmICAgICAgIFwKLSAgICAgKHBmbl90b19wYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFk
ZHIoJl9lbmQpKSkKKyAgICAoKG1mbl90b19tYWRkcihtZm4pID49IHZpcnRfdG9fbWFkZHIoJl9z
dGFydCkpICYmICAgICAgICAgICBcCisgICAgIChtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3Rv
X21hZGRyKCZfZW5kKSkpCiAKICNkZWZpbmUgcGFnZV9nZXRfb3duZXIoX3ApICAgIChfcCktPnYu
aW51c2UuZG9tYWluCiAjZGVmaW5lIHBhZ2Vfc2V0X293bmVyKF9wLF9kKSAoKF9wKS0+di5pbnVz
ZS5kb21haW4gPSAoX2QpKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCmluZGV4IGM3MmUzMjk1MDYuLjBkOTU0ZTFiZDggMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21tLmgKQEAgLTI4MCw4ICsyODAsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvCiAjZGVmaW5lIGlz
X3hlbl9oZWFwX21mbihtZm4pIFwKICAgICAoX19tZm5fdmFsaWQobWZuKSAmJiBpc194ZW5faGVh
cF9wYWdlKG1mbl90b19wYWdlKF9tZm4obWZuKSkpKQogI2RlZmluZSBpc194ZW5fZml4ZWRfbWZu
KG1mbikgICAgICAgICAgICAgICAgICAgICBcCi0gICAgKCgoKG1mbikgPDwgUEFHRV9TSElGVCkg
Pj0gX19wYSgmX3N0ZXh0KSkgJiYgIFwKLSAgICAgKCgobWZuKSA8PCBQQUdFX1NISUZUKSA8PSBf
X3BhKCZfXzJNX3J3ZGF0YV9lbmQpKSkKKyAgICAoKChtZm5fdG9fbWFkZHIobWZuKSkgPj0gX19w
YSgmX3N0ZXh0KSkgJiYgICAgXAorICAgICAoKG1mbl90b19tYWRkcihtZm4pKSA8PSBfX3BhKCZf
XzJNX3J3ZGF0YV9lbmQpKSkKIAogI2RlZmluZSBQUnR5cGVfaW5mbyAiMDE2bHgiLyogc2hvdWxk
IG9ubHkgYmUgdXNlZCBmb3IgcHJpbnRrJ3MgKi8KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
