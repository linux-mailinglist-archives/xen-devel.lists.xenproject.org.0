Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207383BCF2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1z-0007jV-8w; Mon, 10 Jun 2019 19:32:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1x-0007hz-Cx
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:33 +0000
X-Inumbo-ID: 7df36253-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7df36253-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6381C346;
 Mon, 10 Jun 2019 12:32:32 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A5833F73C;
 Mon, 10 Jun 2019 12:32:31 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:09 +0100
Message-Id: <20190610193215.23704-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 11/17] xen/arm64: head: Document enable_mmu()
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGlu
IGVuYWJsZV9tbXUoKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDcgKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IDdiOTJjMWM4ZWIu
LmQ2NzNmN2MwZDggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtNTgzLDYgKzU4MywxMyBAQCB2aXJ0cGh5c19j
bGFzaDoKICAgICAgICAgcmV0CiBFTkRQUk9DKGNyZWF0ZV9wYWdlX3RhYmxlcykKIAorLyoKKyAq
IFR1cm4gb24gdGhlIERhdGEgQ2FjaGUgYW5kIHRoZSBNTVUuIFRoZSBmdW5jdGlvbiB3aWxsIHJl
dHVybiBvbiB0aGUgSUQKKyAqIG1hcHBpbmcuIEluIG90aGVyIHdvcmQsIHRoZSBjYWxsZXIgaXMg
cmVzcG9uc2libGUgdG8gc3dpdGNoIHRvIHRoZSBydW50aW1lCisgKiBtYXBwaW5nLgorICoKKyAq
IENsb2JiZXJzIHgwIC0geDEKKyAqLwogZW5hYmxlX21tdToKICAgICAgICAgUFJJTlQoIi0gVHVy
bmluZyBvbiBwYWdpbmcgLVxyXG4iKQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
