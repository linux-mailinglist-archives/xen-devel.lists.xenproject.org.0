Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F0CA8153
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:49:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Tjj-00080k-3h; Wed, 04 Sep 2019 11:46:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ghLv=W7=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5Tjh-00080W-AK
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:46:05 +0000
X-Inumbo-ID: 93321200-cf09-11e9-b76c-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93321200-cf09-11e9-b76c-bc764e2007e4;
 Wed, 04 Sep 2019 11:46:04 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86AAF20820;
 Wed,  4 Sep 2019 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567597564;
 bh=i9BrEoVqV9CTOcIwZGpJ4tmN6Njby5luY7L+lyftqxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fBxx4VXIJQ8pDwWp2+Udn2j49bsUCyS4O02V6SjiW4Yk/KDhiXpn2E/mOrswU5FJr
 MGUjnHZ9B8SX/AE9kwl829Wwx3MvGlCXfcK/lO53StjvVgULFkFM/+yBzCjfDM+hyQ
 de4+kszuD2OFpbiVqDtSKrMwlHGjsD5kcfeUZBag=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Wed,  4 Sep 2019 20:45:59 +0900
Message-Id: <156759755900.24473.5182879905681416105.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156759754770.24473.11832897710080799131.stgit@devnote2>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip 1/2] x86: xen: insn: Decode
 XEN_EMULATE_PREFIX correctly
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVjb2RlIFhFTl9FTVVMQVRFX1BSRUZJWCBwcmVmaXggYnkgeDg2IGluc24gZGVjb2Rlci4KVGhp
cyB0cmVhdHMgYSBzcGVjaWFsIHNlcXVlbmNlIG9mIGluc3RydWN0aW9ucyBvZiBYRU5fRU1VTEFU
RV9QUkVGSVgKYXMgYSBwcmVmaXggYnl0ZXMgaW4geDg2IGluc24gZGVjb2Rlci4gVXNlciBjYW4g
dGVzdCB3aGV0aGVyIHRoZQppbnN0cnVjdGlvbiBoYXMgdGhlIFhFTl9FTVVMQVRFX1BSRUZJWCBv
ciBub3QgYnkgaW5zbl9pc194ZW5fcHJlZml4ZWQoKS4KTm90ZSB0aGF0IHRoaXMgcHJlZml4IGlz
IHRyZWF0ZWQgYXMganVzdCBhIGR1bW15IHByZWZpeCwgc28gbm8gYWZmZWN0CmZvciBkZWNvZGlu
ZyBvcGNvZGUgYW5kIG9wZXJhbmQuCgpSZXBvcnRlZC1ieTogSm9zaCBQb2ltYm9ldWYgPGpwb2lt
Ym9lQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0
QGtlcm5lbC5vcmc+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAgICAg
IHwgICAgMiArCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaW50ZXJmYWNlLmggICAgfCAgICA3
ICsrKystCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggICAgICAgfCAgIDEwICsr
KysrKysKIGFyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAgICAgICAgICB8ICAgNDMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20v
aW5zbi5oICAgICAgIHwgICAgMiArCiB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJl
Zml4LmggfCAgIDEwICsrKysrKysKIHRvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAg
ICAgICB8ICAgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvb2JqdG9v
bC9zeW5jLWNoZWNrLnNoICAgICAgICAgICAgIHwgICAgMyArLQogOCBmaWxlcyBjaGFuZ2VkLCAx
MTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9pbnNuLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmgKaW5kZXggMTU0
ZjI3YmU4YmZjLi5hYzQyZWZkNDI5NWEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2luc24uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmgKQEAgLTEyOCw2ICsxMjgs
OCBAQCBzdGF0aWMgaW5saW5lIGludCBpbnNuX2lzX2V2ZXgoc3RydWN0IGluc24gKmluc24pCiAJ
cmV0dXJuIChpbnNuLT52ZXhfcHJlZml4Lm5ieXRlcyA9PSA0KTsKIH0KIAorZXh0ZXJuIGludCBp
bnNuX2hhc194ZW5fcHJlZml4KHN0cnVjdCBpbnNuICppbnNuKTsKKwogLyogRW5zdXJlIHRoaXMg
aW5zdHJ1Y3Rpb24gaXMgZGVjb2RlZCBjb21wbGV0ZWx5ICovCiBzdGF0aWMgaW5saW5lIGludCBp
bnNuX2NvbXBsZXRlKHN0cnVjdCBpbnNuICppbnNuKQogewpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
aW5jbHVkZS9hc20veGVuL2ludGVyZmFjZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2lu
dGVyZmFjZS5oCmluZGV4IDYyY2EwM2VmNWM2NS4uZmUzM2E5Nzk4NzA4IDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaW50ZXJmYWNlLmgKKysrIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20veGVuL2ludGVyZmFjZS5oCkBAIC0zNzksMTIgKzM3OSwxNSBAQCBzdHJ1Y3QgeGVuX3Bt
dV9hcmNoIHsKICAqIFByZWZpeCBmb3JjZXMgZW11bGF0aW9uIG9mIHNvbWUgbm9uLXRyYXBwaW5n
IGluc3RydWN0aW9ucy4KICAqIEN1cnJlbnRseSBvbmx5IENQVUlELgogICovCisjaW5jbHVkZSA8
YXNtL3hlbi9wcmVmaXguaD4KKwogI2lmZGVmIF9fQVNTRU1CTFlfXwotI2RlZmluZSBYRU5fRU1V
TEFURV9QUkVGSVggLmJ5dGUgMHgwZiwweDBiLDB4NzgsMHg2NSwweDZlIDsKKyNkZWZpbmUgWEVO
X0VNVUxBVEVfUFJFRklYIC5ieXRlIF9fWEVOX0VNVUxBVEVfUFJFRklYIDsKICNkZWZpbmUgWEVO
X0NQVUlEICAgICAgICAgIFhFTl9FTVVMQVRFX1BSRUZJWCBjcHVpZAogI2Vsc2UKLSNkZWZpbmUg
WEVOX0VNVUxBVEVfUFJFRklYICIuYnl0ZSAweDBmLDB4MGIsMHg3OCwweDY1LDB4NmUgOyAiCisj
ZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCAiLmJ5dGUgIiBfX1hFTl9FTVVMQVRFX1BSRUZJWF9T
VFIgIiA7ICIKICNkZWZpbmUgWEVOX0NQVUlEICAgICAgICAgIFhFTl9FTVVMQVRFX1BSRUZJWCAi
Y3B1aWQiCisKICNlbmRpZgogCiAjZW5kaWYgLyogX0FTTV9YODZfWEVOX0lOVEVSRkFDRV9IICov
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggYi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5mOTAxYmUwZDdhOTUKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS94ZW4vcHJlZml4LmgKQEAgLTAsMCArMSwxMCBAQAorLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX1RPT0xTX0FTTV9YODZfWEVOX1BSRUZJWF9I
CisjZGVmaW5lIF9UT09MU19BU01fWDg2X1hFTl9QUkVGSVhfSAorCisjaW5jbHVkZSA8bGludXgv
c3RyaW5naWZ5Lmg+CisKKyNkZWZpbmUgX19YRU5fRU1VTEFURV9QUkVGSVggIDB4MGYsMHgwYiww
eDc4LDB4NjUsMHg2ZQorI2RlZmluZSBfX1hFTl9FTVVMQVRFX1BSRUZJWF9TVFIgIF9fc3RyaW5n
aWZ5KF9fWEVOX0VNVUxBVEVfUFJFRklYKQorCisjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2xpYi9pbnNuLmMgYi9hcmNoL3g4Ni9saWIvaW5zbi5jCmluZGV4IDBiNTg2MmJhNmE3NS4uMzEw
YTYwOWVlMzgyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9saWIvaW5zbi5jCisrKyBiL2FyY2gveDg2
L2xpYi9pbnNuLmMKQEAgLTEzLDYgKzEzLDkgQEAKICNpbmNsdWRlIDxhc20vaW5hdC5oPgogI2lu
Y2x1ZGUgPGFzbS9pbnNuLmg+CiAKKy8qIEZvciBzcGVjaWFsIFhlbiBwcmVmaXggKi8KKyNpbmNs
dWRlIDxhc20veGVuL3ByZWZpeC5oPgorCiAvKiBWZXJpZnkgbmV4dCBzaXplb2YodCkgYnl0ZXMg
Y2FuIGJlIG9uIHRoZSBzYW1lIGluc3RydWN0aW9uICovCiAjZGVmaW5lIHZhbGlkYXRlX25leHQo
dCwgaW5zbiwgbikJXAogCSgoaW5zbiktPm5leHRfYnl0ZSArIHNpemVvZih0KSArIG4gPD0gKGlu
c24pLT5lbmRfa2FkZHIpCkBAIC01OCw2ICs2MSw0MiBAQCB2b2lkIGluc25faW5pdChzdHJ1Y3Qg
aW5zbiAqaW5zbiwgY29uc3Qgdm9pZCAqa2FkZHIsIGludCBidWZfbGVuLCBpbnQgeDg2XzY0KQog
CQlpbnNuLT5hZGRyX2J5dGVzID0gNDsKIH0KIAorc3RhdGljIGNvbnN0IGluc25fYnl0ZV90IHhl
bl9wcmVmaXhbXSA9IHsgX19YRU5fRU1VTEFURV9QUkVGSVggfTsKKworc3RhdGljIGludCBpbnNu
X3hlbl9wcmVmaXgoc3RydWN0IGluc24gKmluc24sIGluc25fYnl0ZV90IGIpCit7CisJc3RydWN0
IGluc25fZmllbGQgKnByZWZpeGVzID0gJmluc24tPnByZWZpeGVzOworCXNpemVfdCBpOworCisJ
Zm9yIChpID0gMDsgaSA8IHNpemVvZih4ZW5fcHJlZml4KTsgaSsrKSB7CisJCWIgPSBwZWVrX25i
eXRlX25leHQoaW5zbl9ieXRlX3QsIGluc24sIGkpOworCQlpZiAoYiAhPSB4ZW5fcHJlZml4W2ld
KQorCQkJZ290byBlcnJfb3V0OworCX0KKworCW1lbWNweShwcmVmaXhlcy0+Ynl0ZXMsIHhlbl9w
cmVmaXgsIDMpOworCXByZWZpeGVzLT5ieXRlc1szXSA9IHhlbl9wcmVmaXhbc2l6ZW9mKHhlbl9w
cmVmaXgpIC0gMV07CisJcHJlZml4ZXMtPm5ieXRlcyA9IHNpemVvZih4ZW5fcHJlZml4KTsKKwlp
bnNuLT5uZXh0X2J5dGUgKz0gcHJlZml4ZXMtPm5ieXRlczsKKwlwcmVmaXhlcy0+Z290ID0gMTsK
KworCXJldHVybiAxOworCitlcnJfb3V0OgorCXJldHVybiAwOworfQorCitpbnQgaW5zbl9oYXNf
eGVuX3ByZWZpeChzdHJ1Y3QgaW5zbiAqaW5zbikKK3sKKwlpZiAodW5saWtlbHkoaW5zbi0+cHJl
Zml4ZXMubmJ5dGVzID09IHNpemVvZih4ZW5fcHJlZml4KSkpIHsKKwkJcmV0dXJuICFtZW1jbXAo
aW5zbi0+cHJlZml4ZXMuYnl0ZXMsIHhlbl9wcmVmaXgsIDMpICYmCisJCQlpbnNuLT5wcmVmaXhl
cy5ieXRlc1szXSA9PQorCQkJCXhlbl9wcmVmaXhbc2l6ZW9mKHhlbl9wcmVmaXgpIC0gMV07CisJ
fQorCisJcmV0dXJuIDA7Cit9CisKIC8qKgogICogaW5zbl9nZXRfcHJlZml4ZXMgLSBzY2FuIHg4
NiBpbnN0cnVjdGlvbiBwcmVmaXggYnl0ZXMKICAqIEBpbnNuOgkmc3RydWN0IGluc24gY29udGFp
bmluZyBpbnN0cnVjdGlvbgpAQCAtNzksNiArMTE4LDEwIEBAIHZvaWQgaW5zbl9nZXRfcHJlZml4
ZXMoc3RydWN0IGluc24gKmluc24pCiAJbmIgPSAwOwogCWxiID0gMDsKIAliID0gcGVla19uZXh0
KGluc25fYnl0ZV90LCBpbnNuKTsKKworCWlmIChpbnNuX3hlbl9wcmVmaXgoaW5zbiwgYikpCisJ
CXJldHVybjsKKwogCWF0dHIgPSBpbmF0X2dldF9vcGNvZGVfYXR0cmlidXRlKGIpOwogCXdoaWxl
IChpbmF0X2lzX2xlZ2FjeV9wcmVmaXgoYXR0cikpIHsKIAkJLyogU2tpcCBpZiBzYW1lIHByZWZp
eCAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oIGIvdG9v
bHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDM3YTRjMzkwNzUwYi4uMWM3MjNm
YjVjNmVlIDEwMDY0NAotLS0gYS90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmgKKysr
IGIvdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oCkBAIC0xMjgsNiArMTI4LDggQEAg
c3RhdGljIGlubGluZSBpbnQgaW5zbl9pc19ldmV4KHN0cnVjdCBpbnNuICppbnNuKQogCXJldHVy
biAoaW5zbi0+dmV4X3ByZWZpeC5uYnl0ZXMgPT0gNCk7CiB9CiAKK2V4dGVybiBpbnQgaW5zbl9o
YXNfeGVuX3ByZWZpeChzdHJ1Y3QgaW5zbiAqaW5zbik7CisKIC8qIEVuc3VyZSB0aGlzIGluc3Ry
dWN0aW9uIGlzIGRlY29kZWQgY29tcGxldGVseSAqLwogc3RhdGljIGlubGluZSBpbnQgaW5zbl9j
b21wbGV0ZShzdHJ1Y3QgaW5zbiAqaW5zbikKIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3hlbi9wcmVmaXguaCBiL3Rvb2xzL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hl
bi9wcmVmaXguaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmY5MDFi
ZTBkN2E5NQotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hl
bi9wcmVmaXguaApAQCAtMCwwICsxLDEwIEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCAqLworI2lmbmRlZiBfVE9PTFNfQVNNX1g4Nl9YRU5fUFJFRklYX0gKKyNkZWZpbmUg
X1RPT0xTX0FTTV9YODZfWEVOX1BSRUZJWF9ICisKKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdpZnku
aD4KKworI2RlZmluZSBfX1hFTl9FTVVMQVRFX1BSRUZJWCAgMHgwZiwweDBiLDB4NzgsMHg2NSww
eDZlCisjZGVmaW5lIF9fWEVOX0VNVUxBVEVfUFJFRklYX1NUUiAgX19zdHJpbmdpZnkoX19YRU5f
RU1VTEFURV9QUkVGSVgpCisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC94ODYvbGli
L2luc24uYyBiL3Rvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMKaW5kZXggNzllMDQ4ZjFkOTAyLi5i
MzRjZDFjZWZiMWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMKKysrIGIv
dG9vbHMvYXJjaC94ODYvbGliL2luc24uYwpAQCAtMTMsNiArMTMsOSBAQAogI2luY2x1ZGUgIi4u
L2luY2x1ZGUvYXNtL2luYXQuaCIKICNpbmNsdWRlICIuLi9pbmNsdWRlL2FzbS9pbnNuLmgiCiAK
Ky8qIEZvciBzcGVjaWFsIFhlbiBwcmVmaXggKi8KKyNpbmNsdWRlICIuLi9pbmNsdWRlL2FzbS94
ZW4vcHJlZml4LmgiCisKIC8qIFZlcmlmeSBuZXh0IHNpemVvZih0KSBieXRlcyBjYW4gYmUgb24g
dGhlIHNhbWUgaW5zdHJ1Y3Rpb24gKi8KICNkZWZpbmUgdmFsaWRhdGVfbmV4dCh0LCBpbnNuLCBu
KQlcCiAJKChpbnNuKS0+bmV4dF9ieXRlICsgc2l6ZW9mKHQpICsgbiA8PSAoaW5zbiktPmVuZF9r
YWRkcikKQEAgLTU4LDYgKzYxLDQyIEBAIHZvaWQgaW5zbl9pbml0KHN0cnVjdCBpbnNuICppbnNu
LCBjb25zdCB2b2lkICprYWRkciwgaW50IGJ1Zl9sZW4sIGludCB4ODZfNjQpCiAJCWluc24tPmFk
ZHJfYnl0ZXMgPSA0OwogfQogCitzdGF0aWMgY29uc3QgaW5zbl9ieXRlX3QgeGVuX3ByZWZpeFtd
ID0geyBfX1hFTl9FTVVMQVRFX1BSRUZJWCB9OworCitzdGF0aWMgaW50IGluc25feGVuX3ByZWZp
eChzdHJ1Y3QgaW5zbiAqaW5zbiwgaW5zbl9ieXRlX3QgYikKK3sKKwlzdHJ1Y3QgaW5zbl9maWVs
ZCAqcHJlZml4ZXMgPSAmaW5zbi0+cHJlZml4ZXM7CisJc2l6ZV90IGk7CisKKwlmb3IgKGkgPSAw
OyBpIDwgc2l6ZW9mKHhlbl9wcmVmaXgpOyBpKyspIHsKKwkJYiA9IHBlZWtfbmJ5dGVfbmV4dChp
bnNuX2J5dGVfdCwgaW5zbiwgaSk7CisJCWlmIChiICE9IHhlbl9wcmVmaXhbaV0pCisJCQlnb3Rv
IGVycl9vdXQ7CisJfQorCisJbWVtY3B5KHByZWZpeGVzLT5ieXRlcywgeGVuX3ByZWZpeCwgMyk7
CisJcHJlZml4ZXMtPmJ5dGVzWzNdID0geGVuX3ByZWZpeFtzaXplb2YoeGVuX3ByZWZpeCkgLSAx
XTsKKwlwcmVmaXhlcy0+bmJ5dGVzID0gc2l6ZW9mKHhlbl9wcmVmaXgpOworCWluc24tPm5leHRf
Ynl0ZSArPSBwcmVmaXhlcy0+bmJ5dGVzOworCXByZWZpeGVzLT5nb3QgPSAxOworCisJcmV0dXJu
IDE7CisKK2Vycl9vdXQ6CisJcmV0dXJuIDA7Cit9CisKK2ludCBpbnNuX2hhc194ZW5fcHJlZml4
KHN0cnVjdCBpbnNuICppbnNuKQoreworCWlmICh1bmxpa2VseShpbnNuLT5wcmVmaXhlcy5uYnl0
ZXMgPT0gc2l6ZW9mKHhlbl9wcmVmaXgpKSkgeworCQlyZXR1cm4gIW1lbWNtcChpbnNuLT5wcmVm
aXhlcy5ieXRlcywgeGVuX3ByZWZpeCwgMykgJiYKKwkJCWluc24tPnByZWZpeGVzLmJ5dGVzWzNd
ID09CisJCQkJeGVuX3ByZWZpeFtzaXplb2YoeGVuX3ByZWZpeCkgLSAxXTsKKwl9CisKKwlyZXR1
cm4gMDsKK30KKwogLyoqCiAgKiBpbnNuX2dldF9wcmVmaXhlcyAtIHNjYW4geDg2IGluc3RydWN0
aW9uIHByZWZpeCBieXRlcwogICogQGluc246CSZzdHJ1Y3QgaW5zbiBjb250YWluaW5nIGluc3Ry
dWN0aW9uCkBAIC03OSw2ICsxMTgsMTAgQEAgdm9pZCBpbnNuX2dldF9wcmVmaXhlcyhzdHJ1Y3Qg
aW5zbiAqaW5zbikKIAluYiA9IDA7CiAJbGIgPSAwOwogCWIgPSBwZWVrX25leHQoaW5zbl9ieXRl
X3QsIGluc24pOworCisJaWYgKGluc25feGVuX3ByZWZpeChpbnNuLCBiKSkKKwkJcmV0dXJuOwor
CiAJYXR0ciA9IGluYXRfZ2V0X29wY29kZV9hdHRyaWJ1dGUoYik7CiAJd2hpbGUgKGluYXRfaXNf
bGVnYWN5X3ByZWZpeChhdHRyKSkgewogCQkvKiBTa2lwIGlmIHNhbWUgcHJlZml4ICovCmRpZmYg
LS1naXQgYS90b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2ggYi90b29scy9vYmp0b29sL3N5bmMt
Y2hlY2suc2gKaW5kZXggMGE4MzJlMjY1YTUwLi4zNDE0M2VhM2Q0NzcgMTAwNzU1Ci0tLSBhL3Rv
b2xzL29ianRvb2wvc3luYy1jaGVjay5zaAorKysgYi90b29scy9vYmp0b29sL3N5bmMtY2hlY2su
c2gKQEAgLTQsNiArNCw3IEBACiBGSUxFUz0nCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbmF0X3R5
cGVzLmgKIGFyY2gveDg2L2luY2x1ZGUvYXNtL29yY190eXBlcy5oCithcmNoL3g4Ni9pbmNsdWRl
L2FzbS94ZW4vcHJlZml4LmgKIGFyY2gveDg2L2xpYi94ODYtb3Bjb2RlLW1hcC50eHQKIGFyY2gv
eDg2L3Rvb2xzL2dlbi1pbnNuLWF0dHIteDg2LmF3awogJwpAQCAtNDYsNiArNDcsNiBAQCBkb25l
CiBjaGVjayBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbmF0LmggICAgICctSSAiXiNpbmNsdWRlIFtc
IjxdXChhc20vXCkqaW5hdF90eXBlcy5oW1wiPl0iJwogY2hlY2sgYXJjaC94ODYvaW5jbHVkZS9h
c20vaW5zbi5oICAgICAnLUkgIl4jaW5jbHVkZSBbXCI8XVwoYXNtL1wpKmluYXQuaFtcIj5dIicK
IGNoZWNrIGFyY2gveDg2L2xpYi9pbmF0LmMgICAgICAgICAgICAgJy1JICJeI2luY2x1ZGUgW1wi
PF1cKC4uL2luY2x1ZGUvXCkqYXNtL2luc24uaFtcIj5dIicKLWNoZWNrIGFyY2gveDg2L2xpYi9p
bnNuLmMgICAgICAgICAgICAgJy1JICJeI2luY2x1ZGUgW1wiPF1cKC4uL2luY2x1ZGUvXCkqYXNt
L2luXChhdFx8c25cKS5oW1wiPl0iJworY2hlY2sgYXJjaC94ODYvbGliL2luc24uYyAgICAgICAg
ICAgICAnLUkgIl4jaW5jbHVkZSBbXCI8XVwoLi4vaW5jbHVkZS9cKSphc20vaW5cKGF0XHxzblwp
LmhbXCI+XSIgLUkgIl4jaW5jbHVkZSBbXCI8XVwoLi4vaW5jbHVkZS9cKSphc20veGVuL3ByZWZp
eC5oW1wiPl0iJwogCiBjZCAtCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
