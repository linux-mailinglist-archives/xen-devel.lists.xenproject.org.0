Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894431C8D1
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWap-0005MA-I1; Tue, 14 May 2019 12:31:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWao-0005Le-0o
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:38 +0000
X-Inumbo-ID: 377b0a74-7644-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 377b0a74-7644-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:31:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FBEB15AB;
 Tue, 14 May 2019 05:31:37 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E08DF3F71E;
 Tue, 14 May 2019 05:31:35 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:17 +0100
Message-Id: <20190514123125.29086-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 04/12] xen/arm: mm: Only increment
 mfn when valid in xen_pt_update
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

Q3VycmVudGx5LCB0aGUgTUZOIHdpbGwgYmUgaW5jcmVtZW50ZWQgZXZlbiBpZiBpdCBpcyBpbnZh
bGlkLiBUaGlzIHdpbGwKcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0
IGl0ZXJhdGlvbi4KCldoaWxlIHRoaXMgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSB0b2RheSwgdGhp
cyB3aWxsIGJlIGluIHRoZSBmdXR1cmUgaWYKdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZO
IGF0IGV2ZXJ5IGl0ZXJhdGlvbi4KClN1Y2ggYmVoYXZpb3IgaXMgcHJldmVudGVkIGJ5IGF2b2lk
aW5nIHRvIGluY3JlbWVudCBhbiBpbnZhbGlkIE1GTi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0g
TW92ZSB0aGUgcGF0Y2ggZWFybGllciBvbiBpbiB0aGUgc2VyaWVzCiAgICAgICAgLSBBZGQgQW5k
cmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDUgKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IGY5NTZhYTYzOTkuLjlk
ZTJhMTE1MGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9tbS5jCkBAIC0xMDUxLDExICsxMDUxLDE0IEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZShl
bnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCiAKICAgICBzcGluX2xvY2soJnhlbl9wdF9sb2NrKTsK
IAotICAgIGZvcig7IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUsIG1mbiA9IG1m
bl9hZGQobWZuLCAxKSkKKyAgICBmb3IoIDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0Vf
U0laRSApCiAgICAgewogICAgICAgICByYyA9IHhlbl9wdF91cGRhdGVfZW50cnkob3AsIGFkZHIs
IG1mbiwgZmxhZ3MpOwogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIGJyZWFrOworCisg
ICAgICAgIGlmICggIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCisgICAgICAgICAgICBtZm4g
PSBtZm5fYWRkKG1mbiwgMSk7CiAgICAgfQogCiAgICAgLyoKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
