Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA886DCB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 01:14:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvraF-00030r-Tq; Thu, 08 Aug 2019 23:12:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvraE-00030m-JL
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 23:12:34 +0000
X-Inumbo-ID: 009c1efe-ba32-11e9-827d-bf4b4d82e38c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 009c1efe-ba32-11e9-827d-bf4b4d82e38c;
 Thu, 08 Aug 2019 23:12:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2532216C8;
 Thu,  8 Aug 2019 23:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565305953;
 bh=KUzfqX3kXiw3h/mSuG8IxCUoRQmsQQp6JJCTQEyRwXg=;
 h=Date:From:To:cc:Subject:From;
 b=wFyUkQoZ4O2zBpq2HqsM/a5MumqrHHbKi5xDFKItnUFgHNG0LMRIo9XQyOalzCgLf
 GMalBXbEbgB3pbi3xB9HNtGtHt8bTn/LBYnzQvYm4Mk8fjCpUevqczeWED5exqnzbQ
 plxP/P9QQ5U9/ElzFS8RpXMfaUON6r1NXIbNifEs=
Date: Thu, 8 Aug 2019 16:12:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/6] dom0less device assignment
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, sstabellini@kernel.org,
 andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgYWRkcyBkZXZpY2UgYXNzaWdubWVudCBz
dXBwb3J0IHRvIERvbTBsZXNzLgpUaGUgbGFzdCBwYXRjaCBpcyB0aGUgZG9jdW1lbnRhdGlvbi4K
CkNoZWVycywKClN0ZWZhbm8KCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJj
MTljN2U4YmI0MGM5MTBjMDEwNWEwOGMwZTU2ZWRkMmVhMGU1ZWQ6CgogIHhlbi9hcm06IHVuYnJl
YWsgYXJtNjQgYnVpbGQgZm9yIG9sZGVyIHRvb2xjaGFpbnMgKDIwMTktMDgtMDcgMDk6NTU6NTEg
LTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cDov
L3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFiZWxsaW5pL3hlbi11
bnN0YWJsZS5naXQgCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gM2ZlZTk3YzRmZjhl
ZmJhNzkxNTk5NjVlODc3ODUxZTlhMTExOTFkYjoKCiAgeGVuL2FybTogYWRkIGRvbTBsZXNzIGRl
dmljZSBhc3NpZ25tZW50IGluZm8gdG8gZG9jcyAoMjAxOS0wOC0wOCAxNTo0MDowNyAtMDcwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KU3RlZmFubyBTdGFiZWxsaW5pICg2KToKICAgICAgeGVuL2FybTogaW50cm9kdWNl
IGhhbmRsZV9pbnRlcnJ1cHRzCiAgICAgIHhlbi9hcm06IGNvcHkgZHRiIGZyYWdtZW50IHRvIGd1
ZXN0IGR0YgogICAgICB4ZW4vYXJtOiBhc3NpZ24gZGV2aWNlcyB0byBib290IGRvbWFpbnMKICAg
ICAgeGVuL2FybTogaGFuZGxlICJtdWx0aWJvb3QsZGV2aWNlLXRyZWUiIGNvbXBhdGlibGUgbm9k
ZXMKICAgICAgeGVuL2FybTogaW50cm9kdWNlIG5yX3NwaXMKICAgICAgeGVuL2FybTogYWRkIGRv
bTBsZXNzIGRldmljZSBhc3NpZ25tZW50IGluZm8gdG8gZG9jcwoKIGRvY3MvbWlzYy9hcm0vZGV2
aWNlLXRyZWUvYm9vdGluZy50eHQgfCAxMTcgKysrKysrKysrKysrKysrKwogeGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYyAgICAgICAgICAgICAgICB8ICAgMiArCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgICAgICAgICAgIHwgMjU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0K
IHhlbi9hcmNoL2FybS9rZXJuZWwuYyAgICAgICAgICAgICAgICAgfCAgMTIgKy0KIHhlbi9hcmNo
L2FybS9zZXR1cC5jICAgICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2luY2x1ZGUvYXNtLWFy
bS9rZXJuZWwuaCAgICAgICAgICB8ICAgMiArLQogeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5o
ICAgICAgICAgICB8ICAgMSArCiA3IGZpbGVzIGNoYW5nZWQsIDM1NCBpbnNlcnRpb25zKCspLCAz
NiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
