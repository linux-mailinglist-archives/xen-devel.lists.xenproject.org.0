Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC0B652D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 15:57:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAaOJ-0003px-L3; Wed, 18 Sep 2019 13:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FY6t=XN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAaOH-0003pd-TH
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 13:53:05 +0000
X-Inumbo-ID: a3107c9e-da1b-11e9-9636-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a3107c9e-da1b-11e9-9636-12813bfff9fa;
 Wed, 18 Sep 2019 13:53:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 611831000;
 Wed, 18 Sep 2019 06:53:04 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784983F67D;
 Wed, 18 Sep 2019 06:53:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Sep 2019 14:52:56 +0100
Message-Id: <20190918135256.7287-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: livepatch: Prevent CPUs to
 fetch stale instructions after livepatching
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIGxpdmVwYXRjaCwgYSBzaW5nbGUgQ1BVIHdpbGwgdGFrZSBjYXJlIG9mIGFwcGx5aW5n
IHRoZSBwYXRjaCBhbmQKYWxsIHRoZSBvdGhlcnMgd2lsbCB3YWl0IGZvciB0aGUgYWN0aW9uIHRv
IGNvbXBsZXRlLiBUaGV5IHdpbGwgdGhlbiBvbmNlCmV4ZWN1dGUgYXJjaF9saXZlcGF0Y2hfcG9z
dF9hY3Rpb24oKSB0byBmbHVzaCB0aGUgcGlwZWxpbmUuCgpQZXIgQjIuMi41ICJDb25jdXJyZW50
IG1vZGlmaWNhdGlvbiBhbmQgZXhlY3V0aW9uIG9mIGluc3RydWN0aW9ucyIgaW4KRERJIDA0ODdF
LmEsIGZsdXNoaW5nIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSBpcyBub3QgZW5vdWdoIHRvIGVuc3Vy
ZSBuZXcKaW5zdHJ1Y3Rpb25zIGFyZSBzZWVuLiBBbGwgdGhlIFBFcyBzaG91bGQgYWxzbyBkbyBh
biBpc2IoKSB0bwpzeW5jaHJvbml6ZSB0aGUgZmV0Y2hlZCBpbnN0cnVjdGlvbiBzdHJlYW0uCgpT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhl
bi9hcmNoL2FybS9saXZlcGF0Y2guYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2xpdmVwYXRj
aC5jIGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jCmluZGV4IDI3OWQ1MmNjNmMuLjAwYzVlMmJj
NDUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9saXZlcGF0Y2guYworKysgYi94ZW4vYXJjaC9h
cm0vbGl2ZXBhdGNoLmMKQEAgLTg4LDcgKzg4LDggQEAgdm9pZCBhcmNoX2xpdmVwYXRjaF9yZXZl
cnQoY29uc3Qgc3RydWN0IGxpdmVwYXRjaF9mdW5jICpmdW5jKQogCiB2b2lkIGFyY2hfbGl2ZXBh
dGNoX3Bvc3RfYWN0aW9uKHZvaWQpCiB7Ci0gICAgLyogYXJjaF9saXZlcGF0Y2hfcmV2aXZlIGhh
cyBudWtlZCB0aGUgaW5zdHJ1Y3Rpb24gY2FjaGUuICovCisgICAgLyogRGlzY2FyZCBhbnkgc3Rh
bGUgaW5zdHJ1Y3Rpb25zIHRoYXQgbWF5IGhhdmUgYmVlbiBmZXRjaGVkLiAqLworICAgIGlzYigp
OwogfQogCiB2b2lkIGFyY2hfbGl2ZXBhdGNoX21hc2sodm9pZCkKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
