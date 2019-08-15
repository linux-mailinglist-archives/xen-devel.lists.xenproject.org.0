Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0358F7AB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 01:38:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyPHy-0004VM-If; Thu, 15 Aug 2019 23:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HmHk=WL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hyPHx-0004VH-6i
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 23:36:13 +0000
X-Inumbo-ID: 76e970c4-bfb5-11e9-b90c-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76e970c4-bfb5-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 23:36:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F6E0206C2;
 Thu, 15 Aug 2019 23:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565912171;
 bh=MuarmClQDqQ/C2A4LAB3LHfLqzR8Fp7gWkgXqCeVwEQ=;
 h=Date:From:To:cc:Subject:From;
 b=XAZhP7UXWymyXuCe9XjC0DxvsGYe6MMALFT2KYHCfESlUm9GLcY+lO5h1uuG07snm
 Q4Pqxnm4q71yCNVzQ+9T1H7o+snDTBI+4M1Lls5ADUESnkYl8GTWF5NAEXWEKtB043
 lCoPoT9+vTNvhH13R+9T1f0AH94OiNthinbtgbxs=
Date: Thu, 15 Aug 2019 16:36:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/8] reserved-memory in dom0
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
Cc: julien.grall@arm.com, sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBwYXJ0aWFsIHJlc2VydmVkLW1l
bW9yeSBzdXBwb3J0IGZvciBkb20wCm9ubHkgKG5vIGRvbVUgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQt
bWVtb3J5IHlldC4pCgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNzYyYjlh
MmQ5OTBiYmExZjNhZWZlNjYwY2ZmMGMzN2FkMmUzNzViYzoKCiAgeGVuL3BhZ2VfYWxsb2M6IEtl
ZXAgYXdheSBNRk4gMCBmcm9tIHRoZSBidWRkeSBhbGxvY2F0b3IgKDIwMTktMDgtMDkgMTE6MTI6
NTUgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0
cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFiZWxsaW5pL3hl
bi11bnN0YWJsZS5naXQgcmVzZXJ2ZWQtbWVtLTUgCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gMTRlY2I2ZTNiYzJiYjVlMzZkY2NlYzE1YzlmYmJjYjExZGUwMGI2ZDoKCiAgeGVuL2Fy
bTogYWRkIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHRvIHRoZSBkb20wIG1lbW9yeSBub2RlICgy
MDE5LTA4LTE1IDE2OjMzOjQxIC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTdGVmYW5vIFN0YWJlbGxpbmkgKDgp
OgogICAgICB4ZW4vYXJtOiBwYXNzIG5vZGUgdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZQog
ICAgICB4ZW4vYXJtOiBtYWtlIHByb2Nlc3NfbWVtb3J5X25vZGUgYSBkZXZpY2VfdHJlZV9ub2Rl
X2Z1bmMKICAgICAgeGVuL2FybToga2VlcCB0cmFjayBvZiByZXNlcnZlZC1tZW1vcnkgcmVnaW9u
cwogICAgICB4ZW4vYXJtOiBmaXggaW5kZW50YXRpb24gaW4gZWFybHlfcHJpbnRfaW5mbwogICAg
ICB4ZW4vYXJtOiBlYXJseV9wcmludF9pbmZvIHByaW50IHJlc2VydmVkX21lbQogICAgICB4ZW4v
YXJtOiBoYW5kbGUgcmVzZXJ2ZWQtbWVtb3J5IGluIGNvbnNpZGVyX21vZHVsZXMgYW5kIGR0X3Vu
cmVzZXJ2ZWRfcmVnaW9ucwogICAgICB4ZW4vYXJtOiBkb24ndCBpb21lbV9wZXJtaXRfYWNjZXNz
IGZvciByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucwogICAgICB4ZW4vYXJtOiBhZGQgcmVzZXJ2ZWQt
bWVtb3J5IHJlZ2lvbnMgdG8gdGhlIGRvbTAgbWVtb3J5IG5vZGUKCiB4ZW4vYXJjaC9hcm0vYWNw
aS9ib290LmMgICAgICB8ICAgOCArKy0KIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICAgIHwg
MTI0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jICAgfCAgNDYgKysrKysrKysrKystLS0tLQogeGVuL2FyY2gvYXJt
L3NldHVwLmMgICAgICAgICAgfCAgNTMgKysrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9h
c20tYXJtL3NldHVwLmggICB8ICAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8
ICAgNiArLQogNiBmaWxlcyBjaGFuZ2VkLCAxNzYgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25z
KC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
