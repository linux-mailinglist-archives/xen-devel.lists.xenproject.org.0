Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A133496
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRl-0002HC-9O; Mon, 03 Jun 2019 16:04:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRk-0002FS-02
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:28 +0000
X-Inumbo-ID: 42cbcab1-8619-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 42cbcab1-8619-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 16:04:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 460761682;
 Mon,  3 Jun 2019 09:04:26 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557A73F246;
 Mon,  3 Jun 2019 09:04:24 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:50 +0100
Message-Id: <20190603160350.29806-15-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgQXJtIGlzIHByb3ZpZGluZyBhIGR1bW15IGltcGxlbWVudGF0aW9uIGZv
ciB0aGUgTTJQCmhlbHBlcnMgdXNlZCBpbiBjb21tb24gY29kZS4gSG93ZXZlciwgdGhleSBhcmUg
cXVpdGUgaXNvbGF0ZWQgYW5kIGNvdWxkCmJlIHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlIGlu
IHRoZSBmdXR1cmUuIFNvIG1vdmUgYWxsIHRoZSBoZWxwZXJzIGluCnhlbi9tbS5oLgoKU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQWNrZWQtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MzoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgcmV2aWV3ZWQtYnkKICAgICAgICAtIEFkZCBH
ZW9yZ2UncyBhY2tlZC1ieQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRl
ZAotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCB8IDExIC0tLS0tLS0tLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vbW0uaCAgICAgfCAxNCArKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKaW5kZXggM2MwM2JlM2Jj
YS4uZDY4ZDE3OTRlNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaApAQCAtMzEzLDE3ICszMTMsNiBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgKnBhZ2VfdG9fdmlydChjb25zdCBzdHJ1Y3QgcGFnZV9pbmZvICpwZykKIHN0cnVj
dCBwYWdlX2luZm8gKmdldF9wYWdlX2Zyb21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2YWRkcl90IHZh
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
cyk7CiAKLS8qCi0gKiBBcm0gZG9lcyBub3QgaGF2ZSBhbiBNMlAsIGJ1dCBjb21tb24gY29kZSBl
eHBlY3RzIGEgaGFuZGZ1bCBvZgotICogTTJQLXJlbGF0ZWQgZGVmaW5lcyBhbmQgZnVuY3Rpb25z
LiBQcm92aWRlIGR1bW15IHZlcnNpb25zIG9mIHRoZXNlLgotICovCi0jZGVmaW5lIElOVkFMSURf
TTJQX0VOVFJZICAgICAgICAofjBVTCkKLSNkZWZpbmUgU0hBUkVEX00yUF9FTlRSWSAgICAgICAg
ICh+MFVMIC0gMVVMKQotI2RlZmluZSBTSEFSRURfTTJQKF9lKSAgICAgICAgICAgKChfZSkgPT0g
U0hBUkVEX00yUF9FTlRSWSkKLQotLyogV2UgZG9uJ3QgaGF2ZSBhIE0yUCBvbiBBcm0gKi8KLXN0
YXRpYyBpbmxpbmUgdm9pZCBzZXRfcGZuX2Zyb21fbWZuKG1mbl90IG1mbiwgdW5zaWduZWQgbG9u
ZyBwZm4pIHt9Ci0KIC8qIEFyY2gtc3BlY2lmaWMgcG9ydGlvbiBvZiBtZW1vcnlfb3AgaHlwZXJj
YWxsLiAqLwogbG9uZyBhcmNoX21lbW9yeV9vcChpbnQgb3AsIFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0odm9pZCkgYXJnKTsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL21tLmggYi94ZW4v
aW5jbHVkZS94ZW4vbW0uaAppbmRleCAxOTZjZTlmY2RhLi40NzdkMjRkNTJmIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4vbW0uaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaApAQCAtNjU1
LDQgKzY1NSwxOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9wcml2
aWxlZ2VkX2d1ZXN0cygKICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHBhZ2UsIGRvbV94
ZW4sIGZsYWdzKTsKIH0KIAorLyoKKyAqIER1bW15IGltcGxlbWVudGF0aW9uIG9mIE0yUC1yZWxh
dGVkIGhlbHBlcnMgZm9yIGNvbW1vbiBjb2RlIHdoZW4KKyAqIHRoZSBhcmNoaXRlY3R1cmUgZG9l
c24ndCBoYXZlIGFuIE0yUC4KKyAqLworI2lmbmRlZiBDT05GSUdfSEFTX00yUAorCisjZGVmaW5l
IElOVkFMSURfTTJQX0VOVFJZICAgICAgICAofjBVTCkKKyNkZWZpbmUgU0hBUkVEX00yUF9FTlRS
WSAgICAgICAgICh+MFVMIC0gMVVMKQorI2RlZmluZSBTSEFSRURfTTJQKF9lKSAgICAgICAgICAg
KChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKKworc3RhdGljIGlubGluZSB2b2lkIHNldF9wZm5f
ZnJvbV9tZm4obWZuX3QgbWZuLCB1bnNpZ25lZCBsb25nIHBmbikge30KKworI2VuZGlmCisKICNl
bmRpZiAvKiBfX1hFTl9NTV9IX18gKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
