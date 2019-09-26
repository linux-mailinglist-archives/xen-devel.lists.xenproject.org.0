Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB30BF95A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 20:41:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYeg-0002O0-4E; Thu, 26 Sep 2019 18:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYed-0002Nq-Us
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:15 +0000
X-Inumbo-ID: cc0d7a8a-e08c-11e9-b588-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id cc0d7a8a-e08c-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 18:38:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F873142F;
 Thu, 26 Sep 2019 11:38:13 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30AE33F67D;
 Thu, 26 Sep 2019 11:38:12 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:37:58 +0100
Message-Id: <20190926183808.11630-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH RFC for-4.13 00/10] xen/arm: XSA-201 and XSA-263
 fixes
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, andrii.anisov@gmail.com,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBmaXggdHdvIGJ1Z3MgaW4gdGhlIGVu
dHJ5IHBhdGggZnJvbSB0aGUgZ3Vlc3Q6CiAgICAxKSBNYWtlIHN1cmUgdGhhdCBTU0JEIHdvcmth
cm91bmQgaXMgZW5hYmxlZCBiZWZvcmUgZXhlY3V0aW5nIGFueSBoeXBlcnZpc29yIGNvZGUKICAg
IDIpIEF2b2lkIGd1ZXN0IHN0YXRlIGNvcnJ1cHRpb24gd2hlbiBhbiB2aXJ0dWFsIFNFcnJvciBp
cyByZWNlaXZlZAoKVGhlIGZ1bGwgc2VyaWVzIGlzIGNhbmRpZGF0ZSBmb3IgWGVuIDQuMTMuIFdp
dGhvdXQgaXQsIHRoZSBoeXBlcnZpc29yIHdvdWxkCm5vdCBiZSBwcm9wZXJseSBwcm90ZWN0ZWQg
YWdhaW5zdCBTU0IgdnVsbmVyYWJpbGl0eSBhbmQgdGhlIGd1ZXN0IHN0YXRlIG1heQpnZXQgY29y
cnVwdGVkIGlmIGFuIFNFcnJvciBpcyByZWNlaXZlZC4KClRoaXMgaXMgaW4gUkZDIHN0YXRlIGJl
Y2F1c2UgdGhlIGVudHJ5IGNvZGUgaXMgbm93IHF1aXRlIGRpZmZlcmVudCBhbmQKYXJtMzIgY2hh
bmdlcyBhcmUgbm90IHlldCBpbXBsZW1lbnRlZC4gSSB3aWxsIG1vZGlmeSBhcm0zMiBvbmNlIHdl
IGFncmVlZApvbiB0aGUgYXBwcm9hY2guCgpDaGVlcnMsCgpDYzogamdyb3NzQHN1c2UuY29tCgpK
dWxpZW4gR3JhbGwgKDkpOgogIHhlbi9hcm02NDogZW50cnk6IEludHJvZHVjZSBhIG1hY3JvIHRv
IGdlbmVyYXRlIGd1ZXN0IHZlY3RvciBhbmQgdXNlCiAgICBpdAogIHhlbi9hcm02NDogaGVhZDog
Q2hlY2sgaWYgYW4gU0Vycm9yIGlzIHBlbmRpbmcgd2hlbiByZWNlaXZpbmcgYQogICAgdlNFcnJv
cgogIHhlbi9hcm06IHRyYXBzOiBSZXdvcmsgZW50cnkvZXhpdCBmcm9tIHRoZSBndWVzdCBwYXRo
CiAgeGVuL2FybTogRW5zdXJlIHRoZSBTU0JEIHdvcmthcm91bmQgaXMgcmUtZW5hYmxlZCByaWdo
dCBhZnRlciBleGl0aW5nCiAgICBhIGd1ZXN0CiAgeGVuL2FybTogYWx0ZXJuYXRpdmU6IFJlbW92
ZSB1bnVzZWQgcGFyYW1ldGVyIGZvcgogICAgYWx0ZXJuYXRpdmVfaWZfbm90X2NhcAogIHhlbi9h
cm06IE1vdmUgQVJDSF9QQVRDSF9JTlNOX1NJWkUgb3V0IG9mIHRoZSBoZWFkZXIgbGl2ZXBhdGNo
LmgKICB4ZW4vYXJtOiBBbGxvdyBpbnNuLmggdG8gYmUgY2FsbGVkIGZyb20gYXNzZW1ibHkKICB4
ZW4vYXJtOiBhc206IFJlcGxhY2UgdXNlIG9mIEFMVEVSTkFUSVZFIHdpdGggYWx0ZXJuYXRpdmVf
aWYKICB4ZW4vYXJtNjQ6IGVudHJ5OiBFbnN1cmUgdGhlIGd1ZXN0IHN0YXRlIGlzIHN5bmNlZCB3
aGVuIHJlY2VpdmluZyBhCiAgICB2U0Vycm9yCgpNYXJrIFJ1dGxhbmQgKDEpOgogIHhlbi9hcm06
IGFsdGVybmF0aXZlOiBhZGQgYXV0by1ub3AgaW5mcmFzdHJ1Y3R1cmUKCiB4ZW4vYXJjaC9hcm0v
YWx0ZXJuYXRpdmUuYyAgICAgICAgfCAgIDIgLQogeGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMg
ICAgICAgIHwgICA5ICsrLQogeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgICAgICAgIHwgMTIx
ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vdHJh
cHMuYyAgICAgICAgICAgICAgfCAgODEgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogeGVuL2lu
Y2x1ZGUvYXNtLWFybS9hbHRlcm5hdGl2ZS5oIHwgIDc0ICsrKysrKysrKysrKysrKystLS0tLS0t
CiB4ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCAgICAgICAgfCAgMTEgKysrKwogeGVuL2luY2x1
ZGUvYXNtLWFybS9saXZlcGF0Y2guaCAgIHwgICA0ICstCiB4ZW4vaW5jbHVkZS9hc20tYXJtL21h
Y3Jvcy5oICAgICAgfCAgIDcgKysrCiA4IGZpbGVzIGNoYW5nZWQsIDE3MiBpbnNlcnRpb25zKCsp
LCAxMzcgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
