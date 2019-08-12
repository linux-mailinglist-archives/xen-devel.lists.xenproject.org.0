Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAAD8A48F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:32:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9T-0006gy-0H; Mon, 12 Aug 2019 17:30:35 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9R-0006ge-KT
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:33 +0000
X-Inumbo-ID: e29140f4-bd26-11e9-8483-13847f7cc42a
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e29140f4-bd26-11e9-8483-13847f7cc42a;
 Mon, 12 Aug 2019 17:30:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC39E19BF;
 Mon, 12 Aug 2019 10:30:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16AA23F706;
 Mon, 12 Aug 2019 10:30:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:56 +0100
Message-Id: <20190812173019.11956-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 05/28] xen/arm64: head: Setup TTBR_EL2 in
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
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MzoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgYWNrZWQtYnkKCiAgICBDaGFuZ2VzIGluIHYy
OgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwg
NyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TCmluZGV4IDkyNWZiOTNlNTguLjliNzAzZTc5Y2UgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpA
QCAtNTA3LDkgKzUwNyw3IEBAIGNyZWF0ZV9wYWdlX3RhYmxlczoKICAgICAgICAgY21wICAgeDE5
LCAjWEVOX1ZJUlRfU1RBUlQKICAgICAgICAgY3NldCAgeDI1LCBlcSAgICAgICAgICAgICAgICAv
KiB4MjUgOj0gaWRlbnRpdHkgbWFwIGluIHBsYWNlLCBvciBub3QgKi8KIAotICAgICAgICAvKiBX
cml0ZSBYZW4ncyBQVCdzIHBhZGRyIGludG8gVFRCUjBfRUwyICovCiAgICAgICAgIGxvYWRfcGFk
ZHIgeDQsIGJvb3RfcGd0YWJsZQotICAgICAgICBtc3IgICBUVEJSMF9FTDIsIHg0CiAKICAgICAg
ICAgLyogU2V0dXAgYm9vdF9wZ3RhYmxlOiAqLwogICAgICAgICBsb2FkX3BhZGRyIHgxLCBib290
X2ZpcnN0CkBAIC02MzcsNiArNjM1LDExIEBAIGVuYWJsZV9tbXU6CiAgICAgICAgIHRsYmkgIGFs
bGUyICAgICAgICAgICAgICAgICAgLyogRmx1c2ggaHlwZXJ2aXNvciBUTEJzICovCiAgICAgICAg
IGRzYiAgIG5zaAogCisgICAgICAgIC8qIFdyaXRlIFhlbidzIFBUJ3MgcGFkZHIgaW50byBUVEJS
MF9FTDIgKi8KKyAgICAgICAgbG9hZF9wYWRkciB4MCwgYm9vdF9wZ3RhYmxlCisgICAgICAgIG1z
ciAgIFRUQlIwX0VMMiwgeDAKKyAgICAgICAgaXNiCisKICAgICAgICAgbXJzICAgeDAsIFNDVExS
X0VMMgogICAgICAgICBvcnIgICB4MCwgeDAsICNTQ1RMUl9BeHhfRUx4X00gIC8qIEVuYWJsZSBN
TVUgKi8KICAgICAgICAgb3JyICAgeDAsIHgwLCAjU0NUTFJfQXh4X0VMeF9DICAvKiBFbmFibGUg
RC1jYWNoZSAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
