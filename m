Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292DE721BE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:39:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq2S8-0001wp-S7; Tue, 23 Jul 2019 21:36:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlUe=VU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hq2S6-0001vh-BJ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 21:36:06 +0000
X-Inumbo-ID: dfec0d65-ad91-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id dfec0d65-ad91-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 21:36:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B43DE1509;
 Tue, 23 Jul 2019 14:36:04 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DAAD3F71F;
 Tue, 23 Jul 2019 14:36:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 22:35:51 +0100
Message-Id: <20190723213553.22300-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190723213553.22300-1-julien.grall@arm.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in
 do_trap_brk()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgZG9fdHJhcF9icmsoKSBpcyB1c2luZyBhIEJVR19PTigpIHRvIGNoZWNr
IHRoZSBoYXJkd2FyZQpoYXMgYmVlbiBjb3JyZWN0bHkgY29uZmlndXJlZCBkdXJpbmcgYm9vdC4K
CkFueSBlcnJvciB3aGVuIGNvbmZpZ3VyaW5nIHRoZSBoYXJkd2FyZSBjb3VsZCByZXN1bHQgdG8g
YSBndWVzdCAnYnJrJwp0cmFwcGluZyBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgY3Jhc2ggaXQuCgpU
aGlzIGlzIHByZXR0eSBoYXJzaCB0byBraWxsIFhlbiB3aGVuIGFjdHVhbGx5IGtpbGxpbmcgdGhl
IGd1ZXN0IHdvdWxkCmJlIGVub3VnaCBhcyBtaXNjb25maWd1cmluZyB0aGlzIHRyYXAgd291bGQg
bm90IGxlYWQgdG8gZXhwb3NpbmcKc2Vuc2l0aXZlIGRhdGEuIFJlcGxhY2UgdGhlIEJVR19PTigp
IHdpdGggY3Jhc2hpbmcgdGhlIGd1ZXN0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyB8IDExICsrKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMK
aW5kZXggMTMyNjg2ZWUwZi4uZWYzN2NhNmJkZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3Ry
YXBzLmMKKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKQEAgLTEzMDQsMTAgKzEzMDQsMTUgQEAg
aW50IGRvX2J1Z19mcmFtZShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdmFkZHJf
dCBwYykKICNpZmRlZiBDT05GSUdfQVJNXzY0CiBzdGF0aWMgdm9pZCBkb190cmFwX2JyayhzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgY29uc3QgdW5pb24gaHNyIGhzcikKIHsKLSAgICAvKiBI
Q1JfRUwyLlRHRSBhbmQgTURDUl9FTDIuVERFIGFyZSBub3Qgc2V0IHNvIHdlIG5ldmVyIHJlY2Vp
dmUKLSAgICAgKiBzb2Z0d2FyZSBicmVha3BvaW50IGV4Y2VwdGlvbiBmb3IgRUwxIGFuZCBFTDAg
aGVyZS4KKyAgICAvKgorICAgICAqIEhDUl9FTDIuVEdFIGFuZCBNRENSX0VMMi5URFIgYXJlIGN1
cnJlbnRseSBub3Qgc2V0LiBTbyB3ZSBzaG91bGQKKyAgICAgKiBuZXZlciByZWNlaXZlIHNvZnR3
YXJlIGJyZWFrcG9pbmcgZXhjZXB0aW9uIGZvciBFTDEgYW5kIEVMMCBoZXJlLgogICAgICAqLwot
ICAgIEJVR19PTighaHlwX21vZGUocmVncykpOworICAgIGlmICggIWh5cF9tb2RlKHJlZ3MpICkK
KyAgICB7CisgICAgICAgIGRvbWFpbl9jcmFzaChjdXJyZW50LT5kb21haW4pOworICAgICAgICBy
ZXR1cm47CisgICAgfQogCiAgICAgc3dpdGNoICggaHNyLmJyay5jb21tZW50ICkKICAgICB7Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
