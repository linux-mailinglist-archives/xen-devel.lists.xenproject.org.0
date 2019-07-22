Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2C70BCA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2Z-0002UK-PE; Mon, 22 Jul 2019 21:40:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2Y-0002Sg-BD
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:14 +0000
X-Inumbo-ID: 495e8108-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 495e8108-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E390A1595;
 Mon, 22 Jul 2019 14:40:12 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37EB73F71F;
 Mon, 22 Jul 2019 14:40:12 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:31 +0100
Message-Id: <20190722213958.5761-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 08/35] xen/arm64: head: Rework and document
 zero_bss()
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

T24gc2Vjb25kYXJ5IENQVXMsIHplcm9fYnNzKCkgd2lsbCBiZSBhIE5PUCBiZWNhdXNlIEJTUyBv
bmx5IG5lZWQgdG8gYmUKemVyb2VkIG9uY2UgYXQgYm9vdC4gU28gdGhlIGNhbGwgaW4gdGhlIHNl
Y29uZGFyeSBDUFVzIHBhdGggY2FuIGJlCnJlbW92ZWQuIEl0IGFsc28gbWVhbnMgdGhhdCB4MjYg
ZG9lcyBub3QgbmVlZCB0byBiZSBzZXQgZm9yIHNlY29uZGFyeQpDUFUuCgpOb3RlIHRoYXQgd2Ug
d2lsbCBuZWVkIHRvIGtlZXAgeDI2IGFyb3VuZCBmb3IgdGhlIGJvb3QgQ1BVIGFzIEJTUyBzaG91
bGQKbm90IGJlIHJlc2V0IHdoZW4gYm9vdGluZyB2aWEgVUVGSS4KCkxhc3RseSwgZG9jdW1lbnQg
dGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQpmdW5j
dGlvbi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBDbGFyaWZ5IHRoZSBjb21taXQgbWVz
c2FnZQogICAgICAgIC0gTWVudGlvbiB4MjAgaXMgdXNlZCBhcyBhbiBpbnB1dAotLS0KIHhlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMgfCAxNCArKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggZmJjYzc5
MmFkZS4uOTJjODMzOGQ3MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwor
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC03MSw3ICs3MSw3IEBACiAgKiAgeDIz
IC0gVUFSVCBhZGRyZXNzCiAgKiAgeDI0IC0KICAqICB4MjUgLSBpZGVudGl0eSBtYXAgaW4gcGxh
Y2UKLSAqICB4MjYgLSBza2lwX3plcm9fYnNzCisgKiAgeDI2IC0gc2tpcF96ZXJvX2JzcyAoYm9v
dCBjcHUgb25seSkKICAqICB4MjcgLQogICogIHgyOCAtCiAgKiAgeDI5IC0KQEAgLTMxMyw4ICsz
MTMsNiBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCiAgICAgICAgIHN1YiAgIHgyMCwgeDE5LCB4
MCAgICAgICAgICAgLyogeDIwIDo9IHBoeXMtb2Zmc2V0ICovCiAKICAgICAgICAgbW92ICAgeDIy
LCAjMSAgICAgICAgICAgICAgICAvKiB4MjIgOj0gaXNfc2Vjb25kYXJ5X2NwdSAqLwotICAgICAg
ICAvKiBCb290IENQVSBhbHJlYWR5IHplcm8gQlNTIHNvIHNraXAgaXQgb24gc2Vjb25kYXJ5IENQ
VXMuICovCi0gICAgICAgIG1vdiAgIHgyNiwgIzEgICAgICAgICAgICAgICAgLyogWDI2IDo9IHNr
aXBfemVyb19ic3MgKi8KIAogICAgICAgICBtcnMgICB4MCwgbXBpZHJfZWwxCiAgICAgICAgIGxk
ciAgIHgxMywgPSh+TVBJRFJfSFdJRF9NQVNLKQpAQCAtMzM3LDcgKzMzNSw2IEBAIEdMT0JBTChp
bml0X3NlY29uZGFyeSkKICAgICAgICAgUFJJTlQoIiBib290aW5nIC1cclxuIikKICNlbmRpZgog
ICAgICAgICBibCAgICBjaGVja19jcHVfbW9kZQotICAgICAgICBibCAgICB6ZXJvX2JzcwogICAg
ICAgICBibCAgICBjcHVfaW5pdAogICAgICAgICBibCAgICBjcmVhdGVfcGFnZV90YWJsZXMKICAg
ICAgICAgYmwgICAgZW5hYmxlX21tdQpAQCAtMzc1LDYgKzM3MiwxNSBAQCBjaGVja19jcHVfbW9k
ZToKICAgICAgICAgYiBmYWlsCiBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQogCisvKgorICogWmVy
byBCU1MKKyAqCisgKiBJbnB1dHM6CisgKiAgIHgyMDogUGh5c2ljYWwgb2Zmc2V0CisgKiAgIHgy
NjogRG8gd2UgbmVlZCB0byB6ZXJvIEJTUz8KKyAqCisgKiBDbG9iYmVycyB4MCAtIHgzCisgKi8K
IHplcm9fYnNzOgogICAgICAgICAvKiBaZXJvIEJTUyBvbmx5IHdoZW4gcmVxdWVzdGVkICovCiAg
ICAgICAgIGNibnogIHgyNiwgc2tpcF9ic3MKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
