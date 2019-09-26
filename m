Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67ABF95E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 20:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYeu-0002TI-Lk; Thu, 26 Sep 2019 18:38:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYet-0002SL-4A
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:31 +0000
X-Inumbo-ID: d0838a78-e08c-11e9-965e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id d0838a78-e08c-11e9-965e-12813bfff9fa;
 Thu, 26 Sep 2019 18:38:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A932A142F;
 Thu, 26 Sep 2019 11:38:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCD553F67D;
 Thu, 26 Sep 2019 11:38:19 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:38:05 +0100
Message-Id: <20190926183808.11630-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH RFC for-4.13 07/10] xen/arm: Allow insn.h to be
 called from assembly
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCByZXF1aXJlIHRvIGluY2x1ZGUgaW5zbi5oIGZyb20gYXNz
ZW1ibHkgY29kZS4gU28Kd2VlIG5lZWQgdG8gcHJvdGVjdCBhbnkgQy1zcGVjaWZpYyBkZWZpbml0
aW9uIHRvIGF2b2lkIGNvbXBpbGF0aW9uCmVycm9yIHdoZW4gdXNlZCBpbiBhc3NlbWJseSBjb2Rl
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0t
CiB4ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24u
aCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCmluZGV4IDE5Mjc3MjEyZTEuLjAwMzkxZjgz
ZjkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vaW5zbi5oCkBAIC0xLDggKzEsMTQgQEAKICNpZm5kZWYgX19BUkNIX0FSTV9J
TlNOCiAjZGVmaW5lIF9fQVJDSF9BUk1fSU5TTgogCisjaWZuZGVmIF9fQVNTRU1CTFlfXworCiAj
aW5jbHVkZSA8eGVuL3R5cGVzLmg+CiAKKy8qCisgKiBBdCB0aGUgbW9tZW50LCBhcmNoLXNwZWNp
ZmljIGhlYWRlcnMgY29udGFpbiBvbmx5IGRlZmluaXRpb24gZm9yIEMKKyAqIGNvZGUuCisgKi8K
ICNpZiBkZWZpbmVkKENPTkZJR19BUk1fNjQpCiAjIGluY2x1ZGUgPGFzbS9hcm02NC9pbnNuLmg+
CiAjZWxpZiBkZWZpbmVkKENPTkZJR19BUk1fMzIpCkBAIC0xMSw2ICsxNyw4IEBACiAjIGVycm9y
ICJ1bmtub3duIEFSTSB2YXJpYW50IgogI2VuZGlmCiAKKyNlbmRpZiAvKiBfX0FTU0VNQkxZX18g
Ki8KKwogLyogT24gQVJNMzIsNjQgaW5zdHJ1Y3Rpb25zIGFyZSBhbHdheXMgNCBieXRlcyBsb25n
LiAqLwogI2RlZmluZSBBUkNIX1BBVENIX0lOU05fU0laRSA0CiAKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
