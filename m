Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02017DFE
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 18:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOPEq-0008EW-Aq; Wed, 08 May 2019 16:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOPEo-0008EE-T5
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:16:10 +0000
X-Inumbo-ID: 976a1332-71ac-11e9-90eb-eb305858670c
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 976a1332-71ac-11e9-90eb-eb305858670c;
 Wed, 08 May 2019 16:16:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B64EC80D;
 Wed,  8 May 2019 09:16:09 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 830353F238;
 Wed,  8 May 2019 09:16:08 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 May 2019 17:15:57 +0100
Message-Id: <20190508161603.21964-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190508161603.21964-1-julien.grall@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxvZ2ljIHRvIHNldCBTQ1RMUl9FTDIuV1hOIGlzIHRoZSBzYW1lIGZvciB0aGUgYm9vdCBD
UFUgYW5kCm5vbi1ib290IENQVS4gU28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gc2V0IHRoZSBi
aXQgYW5kIGNsZWFyIFRMQnMuCgpUaGlzIG5ldyBmdW5jdGlvbiB3aWxsIGhlbHAgdXMgdG8gZG9j
dW1lbnQgYW5kIHVwZGF0ZSB0aGUgbG9naWMgaW4gYQpzaW5nbGUgcGxhY2UuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogQW5k
cmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2
MjoKICAgICAgICAtIEZpeCB0eXBvIGluIHRoZSBjb21taXQgbWVzc2FnZQogICAgICAgIC0gQWRk
IEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCAyMiArKysrKysr
KysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9t
bS5jCmluZGV4IDAxYWUyY2NjYzAuLjkzYWQxMTgxODMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS9tbS5jCisrKyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC02MDEsNiArNjAxLDE5IEBAIHZvaWQg
X19pbml0IHJlbW92ZV9lYXJseV9tYXBwaW5ncyh2b2lkKQogICAgIGZsdXNoX3hlbl9kYXRhX3Rs
Yl9yYW5nZV92YShCT09UX0ZEVF9WSVJUX1NUQVJULCBCT09UX0ZEVF9TTE9UX1NJWkUpOwogfQog
CisvKgorICogQWZ0ZXIgYm9vdCwgWGVuIHBhZ2UtdGFibGVzIHNob3VsZCBub3QgY29udGFpbiBt
YXBwaW5nIHRoYXQgYXJlIGJvdGgKKyAqIFdyaXRhYmxlIGFuZCBlWGVjdXRhYmxlcy4KKyAqCisg
KiBUaGlzIHNob3VsZCBiZSBjYWxsZWQgb24gZWFjaCBDUFUgdG8gZW5mb3JjZSB0aGUgcG9saWN5
LgorICovCitzdGF0aWMgdm9pZCB4ZW5fcHRfZW5mb3JjZV93bngodm9pZCkKK3sKKyAgICBXUklU
RV9TWVNSRUczMihSRUFEX1NZU1JFRzMyKFNDVExSX0VMMikgfCBTQ1RMUl9XWE4sIFNDVExSX0VM
Mik7CisgICAgLyogRmx1c2ggZXZlcnl0aGluZyBhZnRlciBzZXR0aW5nIFdYTiBiaXQuICovCisg
ICAgZmx1c2hfeGVuX3RleHRfdGxiX2xvY2FsKCk7Cit9CisKIGV4dGVybiB2b2lkIHN3aXRjaF90
dGJyKHVpbnQ2NF90IHR0YnIpOwogCiAvKiBDbGVhciBhIHRyYW5zbGF0aW9uIHRhYmxlIGFuZCBj
bGVhbiAmIGludmFsaWRhdGUgdGhlIGNhY2hlICovCkBAIC03MDIsMTAgKzcxNSw3IEBAIHZvaWQg
X19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0KQog
ICAgIGNsZWFyX3RhYmxlKGJvb3Rfc2Vjb25kKTsKICAgICBjbGVhcl90YWJsZShib290X3RoaXJk
KTsKIAotICAgIC8qIEZyb20gbm93IG9uLCBubyBtYXBwaW5nIG1heSBiZSBib3RoIHdyaXRhYmxl
IGFuZCBleGVjdXRhYmxlLiAqLwotICAgIFdSSVRFX1NZU1JFRzMyKFJFQURfU1lTUkVHMzIoU0NU
TFJfRUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwyKTsKLSAgICAvKiBGbHVzaCBldmVyeXRoaW5n
IGFmdGVyIHNldHRpbmcgV1hOIGJpdC4gKi8KLSAgICBmbHVzaF94ZW5fdGV4dF90bGJfbG9jYWwo
KTsKKyAgICB4ZW5fcHRfZW5mb3JjZV93bngoKTsKIAogI2lmZGVmIENPTkZJR19BUk1fMzIKICAg
ICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKQEAgLTc3Nyw5ICs3ODcs
NyBAQCBpbnQgaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcyhpbnQgY3B1KQogLyogTU1VIHNldHVw
IGZvciBzZWNvbmRhcnkgQ1BVUyAod2hpY2ggYWxyZWFkeSBoYXZlIHBhZ2luZyBlbmFibGVkKSAq
Lwogdm9pZCBtbXVfaW5pdF9zZWNvbmRhcnlfY3B1KHZvaWQpCiB7Ci0gICAgLyogRnJvbSBub3cg
b24sIG5vIG1hcHBpbmcgbWF5IGJlIGJvdGggd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUuICovCi0g
ICAgV1JJVEVfU1lTUkVHMzIoUkVBRF9TWVNSRUczMihTQ1RMUl9FTDIpIHwgU0NUTFJfV1hOLCBT
Q1RMUl9FTDIpOwotICAgIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpOworICAgIHhlbl9wdF9l
bmZvcmNlX3dueCgpOwogfQogCiAjaWZkZWYgQ09ORklHX0FSTV8zMgotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
