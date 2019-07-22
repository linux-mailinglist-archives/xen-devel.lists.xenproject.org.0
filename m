Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1870BD3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2i-0002iY-1Y; Mon, 22 Jul 2019 21:40:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2f-0002fA-R2
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:21 +0000
X-Inumbo-ID: 4e2d3518-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4e2d3518-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17CDB15A1;
 Mon, 22 Jul 2019 14:40:21 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65BE73F71F;
 Mon, 22 Jul 2019 14:40:20 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:40 +0100
Message-Id: <20190722213958.5761-18-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 17/35] xen/arm64: head: Setup TTBR_EL2 in
 enable_mmu() and add missing isb
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

QXQgdGhlIG1vbWVudCwgVFRCUl9FTDIgaXMgc2V0dXAgaW4gY3JlYXRlX3BhZ2VfdGFibGVzKCku
IFRoaXMgaXMgZmluZQphcyBpdCBpcyBjYWxsZWQgYnkgZXZlcnkgQ1BVcy4KCkhvd2V2ZXIsIHN1
Y2ggYXNzdW1wdGlvbiBtYXkgbm90IGhvbGQgaW4gdGhlIGZ1dHVyZS4gVG8gbWFrZSBjaGFuZ2UK
ZWFzaWVyLCB0aGUgVFRCUl9FTDIgaXMgbm90IHNldHVwIGluIGVuYWJsZV9tbXUoKS4KClRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvIGFkZCB0aGUgbWlzc2luZyBpc2IoKSB0byBlbnN1cmUgdGhlIFRU
QlJfRUwyIGlzCnNlZW4gYmVmb3JlIHRoZSBNTVUgaXMgdHVybmVkIG9uLgoKU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUwppbmRleCA3NTQxNjM1MTAyLi45YWZkODlkNDQ3IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKQEAgLTUwMSw5ICs1MDEsNyBAQCBjcmVhdGVfcGFnZV90YWJsZXM6CiAgICAgICAgIGNtcCAg
IHgxOSwgI1hFTl9WSVJUX1NUQVJUCiAgICAgICAgIGNzZXQgIHgyNSwgZXEgICAgICAgICAgICAg
ICAgLyogeDI1IDo9IGlkZW50aXR5IG1hcCBpbiBwbGFjZSwgb3Igbm90ICovCiAKLSAgICAgICAg
LyogV3JpdGUgWGVuJ3MgUFQncyBwYWRkciBpbnRvIFRUQlIwX0VMMiAqLwogICAgICAgICBsb2Fk
X3BhZGRyIHg0LCBib290X3BndGFibGUKLSAgICAgICAgbXNyICAgVFRCUjBfRUwyLCB4NAogCiAg
ICAgICAgIC8qIFNldHVwIGJvb3RfcGd0YWJsZTogKi8KICAgICAgICAgbG9hZF9wYWRkciB4MSwg
Ym9vdF9maXJzdApAQCAtNjMxLDYgKzYyOSwxMSBAQCBlbmFibGVfbW11OgogICAgICAgICB0bGJp
ICBhbGxlMiAgICAgICAgICAgICAgICAgIC8qIEZsdXNoIGh5cGVydmlzb3IgVExCcyAqLwogICAg
ICAgICBkc2IgICBuc2gKIAorICAgICAgICAvKiBXcml0ZSBYZW4ncyBQVCdzIHBhZGRyIGludG8g
VFRCUjBfRUwyICovCisgICAgICAgIGxvYWRfcGFkZHIgeDAsIGJvb3RfcGd0YWJsZQorICAgICAg
ICBtc3IgICBUVEJSMF9FTDIsIHgwCisgICAgICAgIGlzYgorCiAgICAgICAgIG1ycyAgIHgwLCBT
Q1RMUl9FTDIKICAgICAgICAgb3JyICAgeDAsIHgwLCAjU0NUTFJfQXh4X0VMeF9NICAvKiBFbmFi
bGUgTU1VICovCiAgICAgICAgIG9yciAgIHgwLCB4MCwgI1NDVExSX0F4eF9FTHhfQyAgLyogRW5h
YmxlIEQtY2FjaGUgKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
