Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734116680
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:18:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1oJ-0007JJ-5y; Tue, 07 May 2019 15:15:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1oH-0007J1-FB
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:13 +0000
X-Inumbo-ID: e891d2aa-70da-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e891d2aa-70da-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 15:15:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9B59EBD;
 Tue,  7 May 2019 08:15:11 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0F483F5AF;
 Tue,  7 May 2019 08:15:10 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  7 May 2019 16:14:45 +0100
Message-Id: <20190507151458.29350-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507151458.29350-1-julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 01/14] xen/arm: Use mfn_to_pdx instead of
 pfn_to_pdx when possible
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
 Stefano Stabellini <sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWZuX3RvX3BkeCBhZGRzIG1vcmUgc2FmZXR5IHRoYW4gcGZuX3RvX3BkeC4gUmVwbGFjZSBhbGwg
YnV0IG9uIHBsYWNlIGluCnRoZSBBcm0gY29kZSB0byB1c2UgdGhlIGZvcm1lci4KCk5vIGZ1bmN0
aW9uYWwgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgotLS0KICAgIFRoZXJlIGFyZSBzdGlsbCBvbmUgdXNlIG9mIHBmbl90b19wZHgg
aW4gdGhlIEFybSBjb2RlIChzZWUKICAgIG1mbl92YWxpZCkuIElkZWFsbHkgd2Ugd291bGQgd2Fu
dCB0byBzd2l0Y2ggX19tZm5fdmFsaWQoLi4uKSB0byBiZQogICAgdHlwZXNhZmUgYnV0IGl0IGxv
b2tzIGxpa2UgaXQgZG9lcyBub3QgY29tcGlsZSBvbiB4ODYuIEZvciB0aGUKICAgIGRldGFpbHMg
c2VlOiA8MDI0NzhmZjgtZDFlMi1hYmUxLTc0YTUtY2E3MmFiODdmMTU0QGFybS5jb20+CgogICAg
VGhpcyBpcyB1bmxpa2VseSBnb2luZyB0byBiZSBoYW5kbGVkIGluIHRoaXMgc2VyaWVzLgotLS0K
IHhlbi9hcmNoL2FybS9tbS5jICAgICAgICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0u
aCB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5j
CmluZGV4IDAxYWUyY2NjYzAuLmJlNTMzOGJiNGMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9t
bS5jCisrKyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC04ODYsNyArODg2LDcgQEAgdm9pZCBfX2lu
aXQgc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncyhwYWRkcl90IHBzLCBwYWRkcl90IHBlKQogICAg
IGludCBpOwogI2VuZGlmCiAKLSAgICBmcmFtZXRhYmxlX2Jhc2VfcGR4ID0gcGZuX3RvX3BkeChw
cyA+PiBQQUdFX1NISUZUKTsKKyAgICBmcmFtZXRhYmxlX2Jhc2VfcGR4ID0gbWZuX3RvX3BkeCht
YWRkcl90b19tZm4ocHMpKTsKICAgICAvKiBSb3VuZCB1cCB0byAyTSBvciAzMk0gYm91bmRhcnks
IGFzIGFwcHJvcHJpYXRlLiAqLwogICAgIGZyYW1ldGFibGVfc2l6ZSA9IFJPVU5EVVAoZnJhbWV0
YWJsZV9zaXplLCBtYXBwaW5nX3NpemUpOwogICAgIGJhc2VfbWZuID0gYWxsb2NfYm9vdF9wYWdl
cyhmcmFtZXRhYmxlX3NpemUgPj4gUEFHRV9TSElGVCwgMzI8PCgyMC0xMikpOwpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCmlu
ZGV4IGVhZmEyNmY1NmUuLjdiNmFhZjVlM2YgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKQEAgLTIyNSw3ICsyMjUsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF93YyhwYWRkcl90IHN0YXJ0LCBz
aXplX3QgbGVuKQogLyogQ29udmVydCBiZXR3ZWVuIGZyYW1lIG51bWJlciBhbmQgYWRkcmVzcyBm
b3JtYXRzLiAgKi8KICNkZWZpbmUgcGZuX3RvX3BhZGRyKHBmbikgKChwYWRkcl90KShwZm4pIDw8
IFBBR0VfU0hJRlQpCiAjZGVmaW5lIHBhZGRyX3RvX3BmbihwYSkgICgodW5zaWduZWQgbG9uZyko
KHBhKSA+PiBQQUdFX1NISUZUKSkKLSNkZWZpbmUgcGFkZHJfdG9fcGR4KHBhKSAgICBwZm5fdG9f
cGR4KHBhZGRyX3RvX3BmbihwYSkpCisjZGVmaW5lIHBhZGRyX3RvX3BkeChwYSkgICAgbWZuX3Rv
X3BkeChtYWRkcl90b19tZm4ocGEpKQogI2RlZmluZSBnZm5fdG9fZ2FkZHIoZ2ZuKSAgIHBmbl90
b19wYWRkcihnZm5feChnZm4pKQogI2RlZmluZSBnYWRkcl90b19nZm4oZ2EpICAgIF9nZm4ocGFk
ZHJfdG9fcGZuKGdhKSkKICNkZWZpbmUgbWZuX3RvX21hZGRyKG1mbikgICBwZm5fdG9fcGFkZHIo
bWZuX3gobWZuKSkKQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRy
X3RvX3ZpcnQocGFkZHJfdCBtYSkKICNlbHNlCiBzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRyX3Rv
X3ZpcnQocGFkZHJfdCBtYSkKIHsKLSAgICBBU1NFUlQocGZuX3RvX3BkeChtYSA+PiBQQUdFX1NI
SUZUKSA8IChESVJFQ1RNQVBfU0laRSA+PiBQQUdFX1NISUZUKSk7CisgICAgQVNTRVJUKG1mbl90
b19wZHgobWFkZHJfdG9fbWZuKG1hKSkgPCAoRElSRUNUTUFQX1NJWkUgPj4gUEFHRV9TSElGVCkp
OwogICAgIHJldHVybiAodm9pZCAqKShYRU5IRUFQX1ZJUlRfU1RBUlQgLQogICAgICAgICAgICAg
ICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpICsKICAgICAgICAgICAgICAg
ICAgICAgKChtYSAmIG1hX3ZhX2JvdHRvbV9tYXNrKSB8CkBAIC0zMDEsNyArMzAxLDcgQEAgc3Rh
dGljIGlubGluZSBzdHJ1Y3QgcGFnZV9pbmZvICp2aXJ0X3RvX3BhZ2UoY29uc3Qgdm9pZCAqdikK
ICAgICBBU1NFUlQodmEgPCB4ZW5oZWFwX3ZpcnRfZW5kKTsKIAogICAgIHBkeCA9ICh2YSAtIFhF
TkhFQVBfVklSVF9TVEFSVCkgPj4gUEFHRV9TSElGVDsKLSAgICBwZHggKz0gcGZuX3RvX3BkeCht
Zm5feCh4ZW5oZWFwX21mbl9zdGFydCkpOworICAgIHBkeCArPSBtZm5fdG9fcGR4KHhlbmhlYXBf
bWZuX3N0YXJ0KTsKICAgICByZXR1cm4gZnJhbWVfdGFibGUgKyBwZHggLSBmcmFtZXRhYmxlX2Jh
c2VfcGR4OwogfQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
