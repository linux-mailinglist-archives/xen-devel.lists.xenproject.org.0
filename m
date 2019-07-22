Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460B70BBE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2v-0003CH-3l; Mon, 22 Jul 2019 21:40:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2p-00031D-RG
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:31 +0000
X-Inumbo-ID: 53162772-acc9-11e9-85bd-17aa413bce38
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 53162772-acc9-11e9-85bd-17aa413bce38;
 Mon, 22 Jul 2019 21:40:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E903153B;
 Mon, 22 Jul 2019 14:40:29 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C80B3F71F;
 Mon, 22 Jul 2019 14:40:28 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:49 +0100
Message-Id: <20190722213958.5761-27-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 26/35] xen/arm32: head: Rework and document
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
Y29uZGFyeSBDUFVzIHBhdGggY2FuIGJlCnJlbW92ZWQuCgpMYXN0bHksIGRvY3VtZW50IHRoZSBi
ZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0t
CiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9h
cm0vYXJtMzIvaGVhZC5TIHwgMTQgKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggMDk1OWM0ZjA0NC4u
MTE5ZDJhMGRmOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0xOTIsNyArMTkyLDYgQEAgR0xPQkFMKGluaXRf
c2Vjb25kYXJ5KQogICAgICAgICBQUklOVCgiIGJvb3RpbmcgLVxyXG4iKQogI2VuZGlmCiAgICAg
ICAgIGJsICAgIGNoZWNrX2NwdV9tb2RlCi0gICAgICAgIGJsICAgIHplcm9fYnNzCiAgICAgICAg
IGJsICAgIGNwdV9pbml0CiAgICAgICAgIGJsICAgIGNyZWF0ZV9wYWdlX3RhYmxlcwogICAgICAg
ICBibCAgICBlbmFibGVfbW11CkBAIC0yMzcsMTEgKzIzNiwxNSBAQCBjaGVja19jcHVfbW9kZToK
ICAgICAgICAgYiAgICAgZmFpbAogRU5EUFJPQyhjaGVja19jcHVfbW9kZSkKIAorLyoKKyAqIFpl
cm8gQlNTCisgKgorICogSW5wdXRzOgorICogICByMTA6IFBoeXNpY2FsIG9mZnNldAorICoKKyAq
IENsb2JiZXJzIHIwIC0gcjMKKyAqLwogemVyb19ic3M6Ci0gICAgICAgIC8qIFplcm8gQlNTIE9u
IHRoZSBib290IENQVSB0byBhdm9pZCBuYXN0eSBzdXJwcmlzZXMgKi8KLSAgICAgICAgdGVxICAg
cjEyLCAjMAotICAgICAgICBibmUgICBza2lwX2JzcwotCiAgICAgICAgIFBSSU5UKCItIFplcm8g
QlNTIC1cclxuIikKICAgICAgICAgbGRyICAgcjAsID1fX2Jzc19zdGFydCAgICAgICAvKiBMb2Fk
IHN0YXJ0ICYgZW5kIG9mIGJzcyAqLwogICAgICAgICBsZHIgICByMSwgPV9fYnNzX2VuZApAQCAt
MjUzLDcgKzI1Niw2IEBAIHplcm9fYnNzOgogICAgICAgICBjbXAgICByMCwgcjEKICAgICAgICAg
YmxvICAgMWIKIAotc2tpcF9ic3M6CiAgICAgICAgIG1vdiAgIHBjLCBscgogRU5EUFJPQyh6ZXJv
X2JzcykKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
