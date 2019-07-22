Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CDD70BD7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2w-0003Eb-DI; Mon, 22 Jul 2019 21:40:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2q-00032G-9J
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:32 +0000
X-Inumbo-ID: 542428e5-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 542428e5-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0F0344;
 Mon, 22 Jul 2019 14:40:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 593493F71F;
 Mon, 22 Jul 2019 14:40:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:51 +0100
Message-Id: <20190722213958.5761-29-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 28/35] xen/arm32: head: Document enable_mmu()
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

RG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGlu
IGVuYWJsZV9tbXUoKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAot
LS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
IGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRleCBlZjg5Nzk5NTliLi40MDgxYTUyZGZh
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMKQEAgLTQyMiw2ICs0MjIsMTMgQEAgdmlydHBoeXNfY2xhc2g6CiAgICAg
ICAgIGIgICAgIGZhaWwKIEVORFBST0MoY3JlYXRlX3BhZ2VfdGFibGVzKQogCisvKgorICogVHVy
biBvbiB0aGUgRGF0YSBDYWNoZSBhbmQgdGhlIE1NVS4gVGhlIGZ1bmN0aW9uIHdpbGwgcmV0dXJu
IG9uIHRoZSAxOjEKKyAqIG1hcHBpbmcuIEluIG90aGVyIHdvcmQsIHRoZSBjYWxsZXIgaXMgcmVz
cG9uc2libGUgdG8gc3dpdGNoIHRvIHRoZSBydW50aW1lCisgKiBtYXBwaW5nLgorICoKKyAqIENs
b2JiZXJzIHIwIC0gcjMKKyAqLwogZW5hYmxlX21tdToKICAgICAgICAgUFJJTlQoIi0gVHVybmlu
ZyBvbiBwYWdpbmcgLVxyXG4iKQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
