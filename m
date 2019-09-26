Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E3BF95F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 20:42:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYep-0002Pe-Ts; Thu, 26 Sep 2019 18:38:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYeo-0002PL-49
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:26 +0000
X-Inumbo-ID: cfdb28f6-e08c-11e9-965e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id cfdb28f6-e08c-11e9-965e-12813bfff9fa;
 Thu, 26 Sep 2019 18:38:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A81F815AB;
 Thu, 26 Sep 2019 11:38:19 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A503F67D;
 Thu, 26 Sep 2019 11:38:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:38:04 +0100
Message-Id: <20190926183808.11630-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH RFC for-4.13 06/10] xen/arm: Move
 ARCH_PATCH_INSN_SIZE out of the header livepatch.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, andrii.anisov@gmail.com,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgQVJDSF9QQVRDSF9JTlNOX1NJWkUgaXMgZGVmaW5lZCBpbiB0aGUgaGVh
ZGVyCmxpdmVwYXRjaC5oLiBIb3dldmVyLCB0aGlzIGlzIGFsc28gdXNlZCBpbiB0aGUgYWx0ZXJu
YXRpdmUgY29kZS4KClJhdGhlciB0aGFuIGluY2x1ZGluZyBsaXZlcGF0Y2guaCBqdXN0IGZvciB1
c2luZyB0aGUgZGVmaW5lLCBtb3ZlIGl0IGluCnRoZSBoZWFkZXIgaW5zbi5oIHdoaWNoIHNlZW1z
IG1vcmUgc3VpdGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9hbHRlcm5hdGl2ZS5jICAgICAgfCAyIC0tCiB4
ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCAgICAgIHwgMyArKysKIHhlbi9pbmNsdWRlL2FzbS1h
cm0vbGl2ZXBhdGNoLmggfCA0ICstLS0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hbHRlcm5hdGl2ZS5j
IGIveGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMKaW5kZXggNTJlZDdlZGY2OS4uMjM3YzRlNTY0
MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMKKysrIGIveGVuL2FyY2gv
YXJtL2FsdGVybmF0aXZlLmMKQEAgLTMwLDggKzMwLDYgQEAKICNpbmNsdWRlIDxhc20vYnl0ZW9y
ZGVyLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KICNpbmNsdWRlIDxhc20vaW5zbi5o
PgotLyogWFhYOiBNb3ZlIEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIG91dCBvZiBsaXZlcGF0Y2guaCAq
LwotI2luY2x1ZGUgPGFzbS9saXZlcGF0Y2guaD4KICNpbmNsdWRlIDxhc20vcGFnZS5oPgogCiAv
KiBPdmVycmlkZSBtYWNyb3MgZnJvbSBhc20vcGFnZS5oIHRvIG1ha2UgdGhlbSB3b3JrIHdpdGgg
bWZuX3QgKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9pbnNuLmgKaW5kZXggMzQ4OTE3OTgyNi4uMTkyNzcyMTJlMSAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9pbnNuLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9pbnNuLmgKQEAgLTExLDYgKzExLDkgQEAKICMgZXJyb3IgInVua25vd24gQVJNIHZhcmlhbnQi
CiAjZW5kaWYKIAorLyogT24gQVJNMzIsNjQgaW5zdHJ1Y3Rpb25zIGFyZSBhbHdheXMgNCBieXRl
cyBsb25nLiAqLworI2RlZmluZSBBUkNIX1BBVENIX0lOU05fU0laRSA0CisKICNlbmRpZiAvKiAh
X19BUkNIX0FSTV9JTlNOICovCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9saXZlcGF0Y2guaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbGl2
ZXBhdGNoLmgKaW5kZXggNmJjYTc5ZGViOS4uMDI2YWY1ZTdkYyAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9saXZlcGF0Y2guaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2xpdmVw
YXRjaC5oCkBAIC03LDkgKzcsNyBAQAogI2RlZmluZSBfX1hFTl9BUk1fTElWRVBBVENIX0hfXwog
CiAjaW5jbHVkZSA8eGVuL3NpemVzLmg+IC8qIEZvciBTWl8qIG1hY3Jvcy4gKi8KLQotLyogT24g
QVJNMzIsNjQgaW5zdHJ1Y3Rpb25zIGFyZSBhbHdheXMgNCBieXRlcyBsb25nLiAqLwotI2RlZmlu
ZSBBUkNIX1BBVENIX0lOU05fU0laRSA0CisjaW5jbHVkZSA8YXNtL2luc24uaD4KIAogLyoKICAq
IFRoZSB2YSBvZiB0aGUgaHlwZXJ2aXNvciAudGV4dCByZWdpb24uIFdlIG5lZWQgdGhpcyBhcyB0
aGUKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
