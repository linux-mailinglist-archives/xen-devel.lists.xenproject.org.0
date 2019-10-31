Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D2EB391
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC5d-0007cy-98; Thu, 31 Oct 2019 15:10:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC5c-0007cL-BL
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:10:20 +0000
X-Inumbo-ID: 7c48a022-fbf0-11e9-954c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7c48a022-fbf0-11e9-954c-12813bfff9fa;
 Thu, 31 Oct 2019 15:09:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2457A7;
 Thu, 31 Oct 2019 08:09:50 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652183F71E;
 Thu, 31 Oct 2019 08:09:49 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:17 +0000
Message-Id: <20191031150922.22938-15-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 14/19] xen/arm: Move
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
bEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJj
aHVrQGVwYW0uY29tPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgotLS0KCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIFJvc3MncyBy
ZXZpZXdlZC1ieQogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQogICAgICAgIC0gQWRk
IFZvbG9keW15cidzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMg
ICAgICB8IDIgLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oICAgICAgfCAzICsrKwogeGVu
L2luY2x1ZGUvYXNtLWFybS9saXZlcGF0Y2guaCB8IDQgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FsdGVybmF0aXZlLmMgYi94ZW4vYXJjaC9hcm0vYWx0ZXJuYXRpdmUuYwppbmRleCA1MmVkN2Vk
ZjY5Li4yMzdjNGU1NjQyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYWx0ZXJuYXRpdmUuYwor
KysgYi94ZW4vYXJjaC9hcm0vYWx0ZXJuYXRpdmUuYwpAQCAtMzAsOCArMzAsNiBAQAogI2luY2x1
ZGUgPGFzbS9ieXRlb3JkZXIuaD4KICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgogI2luY2x1
ZGUgPGFzbS9pbnNuLmg+Ci0vKiBYWFg6IE1vdmUgQVJDSF9QQVRDSF9JTlNOX1NJWkUgb3V0IG9m
IGxpdmVwYXRjaC5oICovCi0jaW5jbHVkZSA8YXNtL2xpdmVwYXRjaC5oPgogI2luY2x1ZGUgPGFz
bS9wYWdlLmg+CiAKIC8qIE92ZXJyaWRlIG1hY3JvcyBmcm9tIGFzbS9wYWdlLmggdG8gbWFrZSB0
aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9p
bnNuLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaAppbmRleCAzNDg5MTc5ODI2Li4xOTI3
NzIxMmUxIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaAorKysgYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2luc24uaApAQCAtMTEsNiArMTEsOSBAQAogIyBlcnJvciAidW5rbm93
biBBUk0gdmFyaWFudCIKICNlbmRpZgogCisvKiBPbiBBUk0zMiw2NCBpbnN0cnVjdGlvbnMgYXJl
IGFsd2F5cyA0IGJ5dGVzIGxvbmcuICovCisjZGVmaW5lIEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIDQK
KwogI2VuZGlmIC8qICFfX0FSQ0hfQVJNX0lOU04gKi8KIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2xpdmVwYXRjaC5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9saXZlcGF0Y2guaAppbmRleCA2YmNhNzlkZWI5Li4wMjZhZjVlN2RjIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2xpdmVwYXRjaC5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vbGl2ZXBhdGNoLmgKQEAgLTcsOSArNyw3IEBACiAjZGVmaW5lIF9fWEVOX0FSTV9M
SVZFUEFUQ0hfSF9fCiAKICNpbmNsdWRlIDx4ZW4vc2l6ZXMuaD4gLyogRm9yIFNaXyogbWFjcm9z
LiAqLwotCi0vKiBPbiBBUk0zMiw2NCBpbnN0cnVjdGlvbnMgYXJlIGFsd2F5cyA0IGJ5dGVzIGxv
bmcuICovCi0jZGVmaW5lIEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIDQKKyNpbmNsdWRlIDxhc20vaW5z
bi5oPgogCiAvKgogICogVGhlIHZhIG9mIHRoZSBoeXBlcnZpc29yIC50ZXh0IHJlZ2lvbi4gV2Ug
bmVlZCB0aGlzIGFzIHRoZQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
