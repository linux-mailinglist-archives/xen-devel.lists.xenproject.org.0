Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5333BCF1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1t-0007dp-HI; Mon, 10 Jun 2019 19:32:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1r-0007dM-KE
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:27 +0000
X-Inumbo-ID: 794fea56-8bb6-11e9-83b0-8b88c32ede0b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 794fea56-8bb6-11e9-83b0-8b88c32ede0b;
 Mon, 10 Jun 2019 19:32:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9070E344;
 Mon, 10 Jun 2019 12:32:24 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A86193F73C;
 Mon, 10 Jun 2019 12:32:23 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:02 +0100
Message-Id: <20190610193215.23704-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 04/17] xen/arm64: head: Don't "reserve" x24 for
 the CPUID
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

QWZ0ZXIgdGhlIHJlY2VudCByZXdvcmssIHRoZSBDUFVJRCBpcyBvbmx5IHVzZWQgYXQgdGhlIHZl
cnkgYmVnaW5uaW5nIG9mCnRoZSBzZWNvbmRhcnkgQ1BVcyBib290IHBhdGguIFNvIHRoZXJlIGlz
IG5vIG5lZWQgdG8gInJlc2VydmUiIHgyNCBmb3IKaGUgQ1BVSUQuCgpTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUwppbmRleCBmZDQzMmVlMTVkLi44NGUyNjU4MmM0IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKQEAgLTY5LDcgKzY5LDcgQEAKICAqICB4MjEgLSBEVEIgYWRkcmVzcyAoYm9vdCBjcHUgb25s
eSkKICAqICB4MjIgLSBpc19zZWNvbmRhcnlfY3B1CiAgKiAgeDIzIC0gVUFSVCBhZGRyZXNzCi0g
KiAgeDI0IC0gY3B1aWQKKyAqICB4MjQgLQogICogIHgyNSAtIGlkZW50aXR5IG1hcCBpbiBwbGFj
ZQogICogIHgyNiAtIHNraXBfemVyb19ic3MKICAqICB4MjcgLQotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
