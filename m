Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87E46662
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:54:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqMr-0001pa-Si; Fri, 14 Jun 2019 17:52:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqMp-0001oQ-GI
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:51:59 +0000
X-Inumbo-ID: 1ab88dd2-8ecd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1ab88dd2-8ecd-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 17:51:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6D6344;
 Fri, 14 Jun 2019 10:51:57 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C75443F718;
 Fri, 14 Jun 2019 10:51:56 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Jun 2019 18:51:40 +0100
Message-Id: <20190614175144.20046-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
References: <20190614175144.20046-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v3 5/9] xen/arm: mm: Remove enum
 xenmap_operation
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

VGhlIGVudW0geGVubWFwX29wZXJhdGlvbiBpcyBub3QgdXNlZCBhbnltb3JlLiBTbyByZW1vdmUg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KQWNrZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAg
Q2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgYWNrZWQtYnkKCiAgICBDaGFu
Z2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2Fy
Y2gvYXJtL21tLmMgfCAyNCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggYjJiOGJkM2RjNi4uM2Y2ZDBlMjlk
NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMK
QEAgLTk0NywxMyArOTQ3LDYgQEAgc3RhdGljIGludCBjcmVhdGVfeGVuX3RhYmxlKGxwYWVfdCAq
ZW50cnkpCiAgICAgcmV0dXJuIDA7CiB9CiAKLWVudW0geGVubWFwX29wZXJhdGlvbiB7Ci0gICAg
SU5TRVJULAotICAgIFJFTU9WRSwKLSAgICBNT0RJRlksCi0gICAgUkVTRVJWRQotfTsKLQogLyog
U2FuaXR5IGNoZWNrIG9mIHRoZSBlbnRyeSAqLwogc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2Vu
dHJ5KGxwYWVfdCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CkBAIC0x
MDIwLDggKzEwMTMsOCBAQCBzdGF0aWMgYm9vbCB4ZW5fcHRfY2hlY2tfZW50cnkobHBhZV90IGVu
dHJ5LCBtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncykKICAgICByZXR1cm4gdHJ1ZTsKIH0K
IAotc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KGVudW0geGVubWFwX29wZXJhdGlvbiBv
cCwgdW5zaWduZWQgbG9uZyBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1m
bl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQorc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2Vu
dHJ5KHVuc2lnbmVkIGxvbmcgYWRkciwgbWZuX3QgbWZuLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKICAgICBscGFlX3QgcHRlLCAqZW50cnk7
CiAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7CkBAIC0xMDc5LDggKzEwNzIsNyBAQCBzdGF0aWMg
aW50IHhlbl9wdF91cGRhdGVfZW50cnkoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLCB1bnNpZ25l
ZCBsb25nIGFkZHIsCiAKIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soeGVuX3B0X2xvY2spOwogCi1z
dGF0aWMgaW50IHhlbl9wdF91cGRhdGUoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAotICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlydCwKK3N0YXRpYyBpbnQgeGVuX3B0
X3VwZGF0ZSh1bnNpZ25lZCBsb25nIHZpcnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgbWZu
X3QgbWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZucywK
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCkBAIC0xMTExLDcg
KzExMDMsNyBAQCBzdGF0aWMgaW50IHhlbl9wdF91cGRhdGUoZW51bSB4ZW5tYXBfb3BlcmF0aW9u
IG9wLAogCiAgICAgZm9yKCA7IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUgKQog
ICAgIHsKLSAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5KG9wLCBhZGRyLCBtZm4sIGZs
YWdzKTsKKyAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5KGFkZHIsIG1mbiwgZmxhZ3Mp
OwogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIGJyZWFrOwogCkBAIC0xMTM2LDI0ICsx
MTI4LDI0IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKHVuc2lnbmVkIGxvbmcgdmlydCwKICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZucywKICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKLSAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShJTlNF
UlQsIHZpcnQsIG1mbiwgbnJfbWZucywgZmxhZ3MpOworICAgIHJldHVybiB4ZW5fcHRfdXBkYXRl
KHZpcnQsIG1mbiwgbnJfbWZucywgZmxhZ3MpOwogfQogCiBpbnQgcG9wdWxhdGVfcHRfcmFuZ2Uo
dW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiB7Ci0gICAgcmV0dXJu
IHhlbl9wdF91cGRhdGUoUkVTRVJWRSwgdmlydCwgSU5WQUxJRF9NRk4sIG5yX21mbnMsIF9QQUdF
X1BPUFVMQVRFKTsKKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZSh2aXJ0LCBJTlZBTElEX01GTiwg
bnJfbWZucywgX1BBR0VfUE9QVUxBVEUpOwogfQogCiBpbnQgZGVzdHJveV94ZW5fbWFwcGluZ3Mo
dW5zaWduZWQgbG9uZyB2LCB1bnNpZ25lZCBsb25nIGUpCiB7CiAgICAgQVNTRVJUKHYgPD0gZSk7
Ci0gICAgcmV0dXJuIHhlbl9wdF91cGRhdGUoUkVNT1ZFLCB2LCBJTlZBTElEX01GTiwgKGUgLSB2
KSA+PiBQQUdFX1NISUZULCAwKTsKKyAgICByZXR1cm4geGVuX3B0X3VwZGF0ZSh2LCBJTlZBTElE
X01GTiwgKGUgLSB2KSA+PiBQQUdFX1NISUZULCAwKTsKIH0KIAogaW50IG1vZGlmeV94ZW5fbWFw
cGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBmbGFn
cykKIHsKICAgICBBU1NFUlQocyA8PSBlKTsKLSAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShNT0RJ
RlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0VfU0hJRlQsIGZsYWdzKTsKKyAgICBy
ZXR1cm4geGVuX3B0X3VwZGF0ZShzLCBJTlZBTElEX01GTiwgKGUgLSBzKSA+PiBQQUdFX1NISUZU
LCBmbGFncyk7CiB9CiAKIGVudW0gbWcgeyBtZ19jbGVhciwgbWdfcm8sIG1nX3J3LCBtZ19yeCB9
OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
