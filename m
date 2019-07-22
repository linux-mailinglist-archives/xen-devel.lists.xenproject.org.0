Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED2D70BC4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2c-0002YF-2l; Mon, 22 Jul 2019 21:40:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2a-0002Vn-Br
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:16 +0000
X-Inumbo-ID: 4af6d3df-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4af6d3df-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 974E1152F;
 Mon, 22 Jul 2019 14:40:15 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E49193F71F;
 Mon, 22 Jul 2019 14:40:14 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:34 +0100
Message-Id: <20190722213958.5761-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 11/35] xen/arm64: head: Document enable_mmu()
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
QGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSB4MiBhbmQgeDMgYXJl
IGFsc28gY2xvYmJlcnMuIFVwZGF0ZSB0aGUgY29tbWVudCBhY2NvcmRpbmdseQogICAgICAgIC0g
cy9JRC8xOjEvCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IGVkZGY2NjMwMjEu
LjYzNTYzZWY1ZTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtNTc2LDYgKzU3NiwxMyBAQCB2aXJ0cGh5c19j
bGFzaDoKICAgICAgICAgcmV0CiBFTkRQUk9DKGNyZWF0ZV9wYWdlX3RhYmxlcykKIAorLyoKKyAq
IFR1cm4gb24gdGhlIERhdGEgQ2FjaGUgYW5kIHRoZSBNTVUuIFRoZSBmdW5jdGlvbiB3aWxsIHJl
dHVybiBvbiB0aGUgMToxCisgKiBtYXBwaW5nLiBJbiBvdGhlciB3b3JkLCB0aGUgY2FsbGVyIGlz
IHJlc3BvbnNpYmxlIHRvIHN3aXRjaCB0byB0aGUgcnVudGltZQorICogbWFwcGluZy4KKyAqCisg
KiBDbG9iYmVycyB4MCAtIHgzCisgKi8KIGVuYWJsZV9tbXU6CiAgICAgICAgIFBSSU5UKCItIFR1
cm5pbmcgb24gcGFnaW5nIC1cclxuIikKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
