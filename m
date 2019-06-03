Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3122334A4
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpVl-0003Ns-0T; Mon, 03 Jun 2019 16:08:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpVj-0003Nn-So
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:08:35 +0000
X-Inumbo-ID: d6ab9909-8619-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d6ab9909-8619-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 16:08:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E1780D;
 Mon,  3 Jun 2019 09:08:34 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 581493F246;
 Mon,  3 Jun 2019 09:08:33 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:08:29 +0100
Message-Id: <20190603160829.31912-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/public: arch-arm: Use xen_mk_ullong instead
 of suffixing value with ULL
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
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGEgZmV3IHBsYWNlcyBpbiBpbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHRoYXQg
YXJlIHN0aWxsCnN1ZmZpeGluZyBpbW1lZGlhdGUgd2l0aCBVTEwgaW5zdGVhZCBvZiB1c2luZyB4
ZW5fbWtfdWxsb25nLgoKVGhlIGxhdHRlciBhbGxvd3MgYSBjb25zdW1lciB0byBlYXNpbHkgdHdl
YWsgdGhlIGhlYWRlciBpZiBVTEwgaXMgbm90CnN1cHBvcnRlZC4KClNvIHN3aXRjaCB0aGUgcmVt
YWluaW5nIHVzZXJzIG9mIFVMTCB0byB4ZW5fbWtfdWxsb25nLgoKU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaCB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJt
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAppbmRleCBlYjQyNGU4Mjg2Li5mNTUw
MTM3MDg5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAorKysgYi94
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaApAQCAtNDA3LDEyICs0MDcsMTIgQEAgdHlwZWRl
ZiB1aW50NjRfdCB4ZW5fY2FsbGJhY2tfdDsKICNkZWZpbmUgR1VFU1RfR0lDVjNfR0lDUjBfU0la
RSAgICAgeGVuX21rX3VsbG9uZygweDAxMDAwMDAwKQogCiAvKiBBQ1BJIHRhYmxlcyBwaHlzaWNh
bCBhZGRyZXNzICovCi0jZGVmaW5lIEdVRVNUX0FDUElfQkFTRSAweDIwMDAwMDAwVUxMCi0jZGVm
aW5lIEdVRVNUX0FDUElfU0laRSAweDAyMDAwMDAwVUxMCisjZGVmaW5lIEdVRVNUX0FDUElfQkFT
RSB4ZW5fbWtfdWxsb25nKDB4MjAwMDAwMDApCisjZGVmaW5lIEdVRVNUX0FDUElfU0laRSB4ZW5f
bWtfdWxsb25nKDB4MDIwMDAwMDApCiAKIC8qIFBMMDExIG1hcHBpbmdzICovCi0jZGVmaW5lIEdV
RVNUX1BMMDExX0JBU0UgICAgMHgyMjAwMDAwMFVMTAotI2RlZmluZSBHVUVTVF9QTDAxMV9TSVpF
ICAgIDB4MDAwMDEwMDBVTEwKKyNkZWZpbmUgR1VFU1RfUEwwMTFfQkFTRSAgICB4ZW5fbWtfdWxs
b25nKDB4MjIwMDAwMDApCisjZGVmaW5lIEdVRVNUX1BMMDExX1NJWkUgICAgeGVuX21rX3VsbG9u
ZygweDAwMDAxMDAwKQogCiAvKgogICogMTZNQiA9PSA0MDk2IHBhZ2VzIHJlc2VydmVkIGZvciBn
dWVzdCB0byB1c2UgYXMgYSByZWdpb24gdG8gbWFwIGl0cwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
