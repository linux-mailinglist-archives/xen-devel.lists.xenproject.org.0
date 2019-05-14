Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2311C882
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRk-0000Cg-HL; Tue, 14 May 2019 12:22:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRi-00009a-D3
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:14 +0000
X-Inumbo-ID: e73a3f5b-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e73a3f5b-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:22:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F28BF15AD;
 Tue, 14 May 2019 05:22:12 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2C263F71E;
 Tue, 14 May 2019 05:22:11 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:29 +0100
Message-Id: <20190514122136.28215-21-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 12/19] xen/arm32: head: Always zero
 r3 before update a page-table entry
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJvb3QgY29kZSBpcyB1c2luZyByMiBhbmQgcjMgdG8gaG9sZCB0aGUgcGFnZS10YWJsZSBl
bnRyeSB2YWx1ZS4KV2hpbGUgcjIgaXMgYWx3YXlzIHVwZGF0ZWQgYmVmb3JlIHN0b3JpbmcgdGhl
IHZhbHVlLCB0aGlzIGlzIG5vdCBhbHdheXMKdGhlIGNhc2UgZm9yIHIzLgoKVGhhbmtmdWxseSB0
b2RheSwgcjMgd2lsbCBhbHdheXMgYmUgemVybyB3aGVuIHdlIGNhcmUuIEJ1dCB0aGlzIGlzCmRp
ZmZpY3VsdCB0byB0cmFjayBhbmQgZXJyb3ItcHJvbmUuCgpTbyBhbHdheXMgemVybyByMyB3aXRo
aW4gdGhlIGZldyBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB3cml0ZSB0aGUKcGFnZS10YWJsZSBl
bnRyeS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBVc2UgMHgwIGluc3RlYWQgb2YgMAog
ICAgICAgIC0gUmVtb3ZlIGEgZHVwbGljYXRlIG1vdiByMywgIzAKLS0tCiB4ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggMzQ0ODgxN2FhYi4uMThkZWQ0OWEwNCAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJt
MzIvaGVhZC5TCkBAIC0yNzAsNiArMjcwLDcgQEAgY3B1X2luaXRfZG9uZToKICAgICAgICAgb3Jy
ICAgcjIsIHIyLCAjUFRfVVBQRVIoTUVNKSAvKiByMjpyMyA6PSBzZWN0aW9uIG1hcCAqLwogICAg
ICAgICBvcnIgICByMiwgcjIsICNQVF9MT1dFUihNRU0pCiAgICAgICAgIGxzbCAgIHIxLCByMSwg
IzMgICAgICAgICAgICAgLyogcjEgOj0gU2xvdCBvZmZzZXQgKi8KKyAgICAgICAgbW92ICAgcjMs
ICMweDAKICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjQsIHIxXSAgICAgICAvKiBNYXBwaW5nIG9m
IHBhZGRyKHN0YXJ0KSAqLwogICAgICAgICBtb3YgICByNiwgIzEgICAgICAgICAgICAgICAgIC8q
IHI2IDo9IGlkZW50aXR5IG1hcCBub3cgaW4gcGxhY2UgKi8KIApAQCAtMzcyLDExICszNzMsMTEg
QEAgcGFnaW5nOgogCiAgICAgICAgIC8qIEFkZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8K
ICAgICAgICAgbGRyICAgcjEsID14ZW5fZml4bWFwICAgICAgICAvKiByMSA6PSB2YWRkciAoeGVu
X2ZpeG1hcCkgKi8KLSAgICAgICAgbW92ICAgcjMsICMwCiAgICAgICAgIGxzciAgIHIyLCByMTEs
ICNUSElSRF9TSElGVAogICAgICAgICBsc2wgICByMiwgcjIsICNUSElSRF9TSElGVCAgIC8qIDRL
IGFsaWduZWQgcGFkZHIgb2YgVUFSVCAqLwogICAgICAgICBvcnIgICByMiwgcjIsICNQVF9VUFBF
UihERVZfTDMpCiAgICAgICAgIG9yciAgIHIyLCByMiwgI1BUX0xPV0VSKERFVl9MMykgLyogcjI6
cjMgOj0gNEsgZGV2IG1hcCBpbmNsdWRpbmcgVUFSVCAqLworICAgICAgICBtb3YgICByMywgIzB4
MAogICAgICAgICBzdHJkICByMiwgcjMsIFtyMSwgIyhGSVhNQVBfQ09OU09MRSo4KV0gLyogTWFw
IGl0IGluIHRoZSBmaXJzdCBmaXhtYXAncyBzbG90ICovCiAxOgogCkBAIC0zODgsNiArMzg5LDcg
QEAgcGFnaW5nOgogICAgICAgICBvcnIgICByMiwgcjIsICNQVF9MT1dFUihQVCkgIC8qIHIyOnIz
IDo9IHRhYmxlIG1hcCBvZiB4ZW5fZml4bWFwICovCiAgICAgICAgIGxkciAgIHI0LCA9RklYTUFQ
X0FERFIoMCkKICAgICAgICAgbW92ICAgcjQsIHI0LCBsc3IgIyhTRUNPTkRfU0hJRlQgLSAzKSAg
IC8qIHI0IDo9IFNsb3QgZm9yIEZJWE1BUCgwKSAqLworICAgICAgICBtb3YgICByMywgIzB4MAog
ICAgICAgICBzdHJkICByMiwgcjMsIFtyMSwgcjRdICAgICAgIC8qIE1hcCBpdCBpbiB0aGUgZml4
bWFwJ3Mgc2xvdCAqLwogCiAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nl
c3MgdGhlIFVBUlQuICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
