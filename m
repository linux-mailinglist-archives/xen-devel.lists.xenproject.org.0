Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7387B5521
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:15:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHyN-00089x-TJ; Tue, 17 Sep 2019 18:13:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAHyM-00088t-4a
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 18:13:06 +0000
X-Inumbo-ID: c3daca92-d976-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c3daca92-d976-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 18:12:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 614521000;
 Tue, 17 Sep 2019 11:12:52 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEC483F67D;
 Tue, 17 Sep 2019 11:12:51 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 17 Sep 2019 19:12:36 +0100
Message-Id: <20190917181244.30027-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v4 0/8] xen/arm: Rework head.S to make it more
 compliant with the Arm Arm
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

SGkgYWxsLAoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBib290L21lbW9yeSByZXdvcmsgZm9yIFhlbiBv
biBBcm0sIGJ1dCBub3Qgc2VudCBhcwpNTS1QQVJUeCBhcyB0aGlzIGlzIGZvY3VzaW5nIG9uIHRo
ZSBib290IGNvZGUuCgpTaW1pbGFyIHRvIHRoZSBtZW1vcnkgY29kZSwgdGhlIGJvb3QgY29kZSBp
cyBub3QgZm9sbG93aW5nIHRoZSBBcm0gQXJtIGFuZApjb3VsZCBsZWFkIHRvIG1lbW9yeSBjb3Jy
dXB0aW9uL1RMQiBjb25mbGljdCBhYm9ydC4gSSBhbSBub3QgYXdhcmUKb2YgYW55IHBsYXRmb3Jt
cyB3aGVyZSBYZW4gZmFpbHMgdG8gYm9vdCwgeWV0IGl0IHNob3VsZCBiZSBmaXhlZCBzb29uZXIK
cmF0aGVyIHRoYW4gbGF0ZXIuCgpXaGlsZSBtYWtpbmcgdGhlIGNvZGUgbW9yZSBjb21wbGlhbnQs
IEkgaGF2ZSBhbHNvIHRvb2sgdGhlIG9wcG9ydHVuaXR5CnRvIHNpbXBsaWZ5IHRoZSBib290IGFu
ZCBhbHNvIGFkZCBtb3JlIGRvY3VtZW50YXRpb24uCgpBZnRlciB0aGlzIHNlcmllcywgdGhlIGJv
b3QgQ1BVIGFuZCBzZWNvbmRhcnkgQ1BVcyBwYXRoIGlzIG1vc3RseSBjb21wbGlhbnQKd2l0aCB0
aGUgQXJtIEFybS4gVGhlIG9ubHkgbm9uLWNvbXBsaWFudCBwbGFjZXMgSSBhbSBhd2FyZSBvZiBh
cmU6CiAgICAxKSBjcmVhdGVfcGFnZV90YWJsZXM6IFNvbWUgcmV3b3JrIGlzIG5lY2Vzc2FyeSB0
byB1cGRhdGUgdGhlIHBhZ2UtdGFibGVzCiAgICAgICBzYWZlbHkgd2l0aG91dCB0aGUgTU1VIG9u
LgogICAgMikgVGhlIHN3aXRjaGVzIGJldHdlZW4gYm9vdCBhbmQgcnVudGltZSBwYWdlLXRhYmxl
cyAoZm9yIGJvdGggYm9vdCBDUFUKICAgICAgIGFuZCBzZWNvbmRhcnkgQ1BVcykgYXJlIG5vdCBz
YWZlLgoKQWxsIHdpbGwgYmUgYWRkcmVzc2VkIGluIGZvbGxvdy11cCBzZXJpZXMuIFRoZSBib290
IGNvZGUgd291bGQgYWxzbyBiZW5lZml0cwphbm90aGVyIHByb29mIHJlYWQgZm9yIG1pc3Npbmcg
aXNiKCkvZHNiKCkuCgoKRm9yIGNvbnZlbmllbmNlIEkgcHJvdmlkZWQgYSBicmFuY2ggYmFzZWQg
b24gc3RhZ2luZzoKICAgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9qdWxpZW5nL3hlbi11
bnN0YWJsZS5naXQgYnJhbmNoIGJvb3QvdjMKCkNoZWVycywKCkp1bGllbiBHcmFsbCAoOCk6CiAg
eGVuL2FybTY0OiBoZWFkOiBSZW1vdmUgMToxIG1hcHBpbmcgYXMgc29vbiBhcyBpdCBpcyBub3Qg
dXNlZAogIHhlbi9hcm02NDogaGVhZDogUmV3b3JrIGFuZCBkb2N1bWVudCBzZXR1cF9maXhtYXAo
KQogIHhlbi9hcm0zMjogaGVhZDogUmVtb3ZlIDE6MSBtYXBwaW5nIGFzIHNvb24gYXMgaXQgaXMg
bm90IHVzZWQKICB4ZW4vYXJtMzI6IGhlYWQ6IFJld29yayBhbmQgZG9jdW1lbnQgc2V0dXBfZml4
bWFwKCkKICB4ZW4vYXJtNjQ6IGhlYWQ6IEludHJvZHVjZSBtYWNyb3MgdG8gY3JlYXRlIHRhYmxl
IGFuZCBtYXBwaW5nIGVudHJ5CiAgeGVuL2FybTY0OiBoZWFkOiBVc2UgYSBwYWdlIG1hcHBpbmcg
Zm9yIHRoZSAxOjEgbWFwcGluZyBpbgogICAgY3JlYXRlX3BhZ2VfdGFibGVzKCkKICB4ZW4vYXJt
MzI6IGhlYWQ6IEludHJvZHVjZSBtYWNyb3MgdG8gY3JlYXRlIHRhYmxlIGFuZCBtYXBwaW5nIGVu
dHJ5CiAgeGVuL2FybTMyOiBoZWFkOiBVc2UgYSBwYWdlIG1hcHBpbmcgZm9yIHRoZSAxOjEgbWFw
cGluZyBpbgogICAgY3JlYXRlX3BhZ2VfdGFibGVzKCkKCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TIHwgMzI0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIHhl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAzNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICB8ICAgMiArCiAz
IGZpbGVzIGNoYW5nZWQsIDQ0MCBpbnNlcnRpb25zKCspLCAyMzMgZGVsZXRpb25zKC0pCgotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
