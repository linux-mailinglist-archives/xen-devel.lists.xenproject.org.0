Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C73BCF5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:35:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1x-0007hY-CX; Mon, 10 Jun 2019 19:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1v-0007fS-7t
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:31 +0000
X-Inumbo-ID: 7bfa0d68-8bb6-11e9-a239-6f7b6f0f0c80
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7bfa0d68-8bb6-11e9-a239-6f7b6f0f0c80;
 Mon, 10 Jun 2019 19:32:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E115346;
 Mon, 10 Jun 2019 12:32:29 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25EDD3F73C;
 Mon, 10 Jun 2019 12:32:28 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:06 +0100
Message-Id: <20190610193215.23704-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 08/17] xen/arm64: head: Rework and document
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gc2Vjb25kYXJ5IENQVXMsIHplcm9fYnNzKCkgd2lsbCBiZSBhIE5PUCBiZWNhdXNlIEJTUyBv
bmx5IG5lZWQgdG8gYmUKemVyb2VkIG9uY2UgYXQgYm9vdC4gU28gdGhlIGNhbGwgaW4gdGhlIHNl
Y29uZGFyeSBDUFVzIHBhdGggY2FuIGJlCnJlbW92ZWQuIEl0IGFsc28gbWVhbnMgdGhhdCB4MjYg
ZG9lcyBub3QgbmVlZCB0byBzZXQgYW5kIGlzIG5vdyBvbmx5CnVzZWQgYnkgdGhlIGJvb3QgQ1BV
LgoKTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1
c2FnZSB3aXRoaW4gdGhlCmZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTMg
KysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUwppbmRleCA4N2ZjZDNiZTZjLi42YWEzMTQ4MTkyIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKQEAgLTcxLDcgKzcxLDcgQEAKICAqICB4MjMgLSBVQVJUIGFkZHJlc3MKICAqICB4MjQgLQog
ICogIHgyNSAtIGlkZW50aXR5IG1hcCBpbiBwbGFjZQotICogIHgyNiAtIHNraXBfemVyb19ic3MK
KyAqICB4MjYgLSBza2lwX3plcm9fYnNzIChib290IGNwdSBvbmx5KQogICogIHgyNyAtCiAgKiAg
eDI4IC0KICAqICB4MjkgLQpAQCAtMzEzLDggKzMxMyw2IEBAIEdMT0JBTChpbml0X3NlY29uZGFy
eSkKICAgICAgICAgc3ViICAgeDIwLCB4MTksIHgwICAgICAgICAgICAvKiB4MjAgOj0gcGh5cy1v
ZmZzZXQgKi8KIAogICAgICAgICBtb3YgICB4MjIsICMxICAgICAgICAgICAgICAgIC8qIHgyMiA6
PSBpc19zZWNvbmRhcnlfY3B1ICovCi0gICAgICAgIC8qIEJvb3QgQ1BVIGFscmVhZHkgemVybyBC
U1Mgc28gc2tpcCBpdCBvbiBzZWNvbmRhcnkgQ1BVcy4gKi8KLSAgICAgICAgbW92ICAgeDI2LCAj
MSAgICAgICAgICAgICAgICAvKiBYMjYgOj0gc2tpcF96ZXJvX2JzcyAqLwogCiAgICAgICAgIG1y
cyAgIHgwLCBtcGlkcl9lbDEKICAgICAgICAgbGRyICAgeDEzLCA9KH5NUElEUl9IV0lEX01BU0sp
CkBAIC0zMzcsNyArMzM1LDYgQEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQogICAgICAgICBQUklO
VCgiIGJvb3RpbmcgLVxyXG4iKQogI2VuZGlmCiAgICAgICAgIGJsICAgIGNoZWNrX2NwdV9tb2Rl
Ci0gICAgICAgIGJsICAgIHplcm9fYnNzCiAgICAgICAgIGJsICAgIGNwdV9pbml0CiAgICAgICAg
IGJsICAgIGNyZWF0ZV9wYWdlX3RhYmxlcwogICAgICAgICBibCAgICBlbmFibGVfbW11CkBAIC0z
NzUsNiArMzcyLDE0IEBAIGNoZWNrX2NwdV9tb2RlOgogICAgICAgICBiIGZhaWwKIEVORFBST0Mo
Y2hlY2tfY3B1X21vZGUpCiAKKy8qCisgKiBaZXJvIEJTUworICoKKyAqIElucHV0czoKKyAqICAg
eDI2OiBEbyB3ZSBuZWVkIHRvIHplcm8gQlNTPworICoKKyAqIENsb2JiZXJzIHgwIC0geDMKKyAq
LwogemVyb19ic3M6CiAgICAgICAgIC8qIFplcm8gQlNTIG9ubHkgd2hlbiByZXF1ZXN0ZWQgKi8K
ICAgICAgICAgY2JueiAgeDI2LCBza2lwX2JzcwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
