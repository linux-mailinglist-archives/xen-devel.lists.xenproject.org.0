Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6768B1C8AB
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:27:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWUo-0002rr-51; Tue, 14 May 2019 12:25:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUm-0002pk-9m
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:24 +0000
X-Inumbo-ID: 589e5fd1-7643-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 589e5fd1-7643-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:25:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3897A15AD;
 Tue, 14 May 2019 05:25:23 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 057143F71E;
 Tue, 14 May 2019 05:25:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:24:51 +0100
Message-Id: <20190514122456.28559-15-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 RESEND v2 14/19] xen/arm32: mm: Avoid
 cleaning the cache for secondary CPUs page-tables
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJl
YWJpbGl0eSBhbmQKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBk
YXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBUaGlzCm1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Ig
c2Vjb25kYXJ5IENQVXMgcnVudGltZSBwYWdlLXRhYmxlcyBpcwp1bm5lY2Vzc2FyeS4KClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5
OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2Vz
IGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gv
YXJtL21tLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBjZGEyODQ3
ZDAwLi42ZGI3ZGRhMGRhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4v
YXJjaC9hcm0vbW0uYwpAQCAtNzY5LDkgKzc2OSw2IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdl
dGFibGVzKGludCBjcHUpCiAgICAgICAgIHdyaXRlX3B0ZSgmZmlyc3RbZmlyc3RfdGFibGVfb2Zm
c2V0KERPTUhFQVBfVklSVF9TVEFSVCtpKkZJUlNUX1NJWkUpXSwgcHRlKTsKICAgICB9CiAKLSAg
ICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoZmlyc3QsIFBBR0VfU0laRSk7Ci0gICAgY2xlYW5fZGNh
Y2hlX3ZhX3JhbmdlKGRvbWhlYXAsIERPTUhFQVBfU0VDT05EX1BBR0VTKlBBR0VfU0laRSk7Ci0K
ICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0gZmlyc3Q7CiAgICAgcGVyX2NwdSh4ZW5f
ZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
