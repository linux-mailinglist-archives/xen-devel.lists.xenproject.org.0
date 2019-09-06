Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1717AB060
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 03:48:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i63K0-0000mC-8x; Fri, 06 Sep 2019 01:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i63Jy-0000lz-Ry
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 01:45:54 +0000
X-Inumbo-ID: 10218036-d048-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10218036-d048-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 01:45:54 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1980B206CD;
 Fri,  6 Sep 2019 01:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567734353;
 bh=CcVaQDFBcPv2lQF9bE3zujLhd2gzHtsZ9Io9bYLSvpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YnU0wX4+sJ5qTazcOFj4HW1lwoMr2bqQjVLW2QiUm6uzNT2WuYRPhAH2m7wmKBTGY
 M3h2/K49RrAtmxMYp5Di2TlQm3uqOyGds62R4TsY35gjBFPxI6i1pX43PkB6335Vug
 xfo89gQNYQloMvxj7TLvBFn08yQWDHQie/mnOAVg=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 10:45:48 +0900
Message-Id: <156773434815.31441.12739136439382289412.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156773433821.31441.2905951246664148487.stgit@devnote2>
References: <156773433821.31441.2905951246664148487.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v3 1/2] x86: xen: insn: Decode Xen and KVM
 emulate-prefix signature
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
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVjb2RlIFhlbiBhbmQgS1ZNJ3MgZW11bGF0ZS1wcmVmaXggc2lnbmF0dXJlIGJ5IHg4NiBpbnNu
IGRlY29kZXIuCkl0IGlzIGNhbGxlZCAicHJlZml4IiBidXQgYWN0dWFsbHkgbm90IHg4NiBpbnN0
cnVjdGlvbiBwcmVmaXgsIHNvCnRoaXMgYWRkcyBpbnNuLmVtdWxhdGVfcHJlZml4X3NpemUgZmll
bGQgaW5zdGVhZCBvZiByZXVzaW5nCmluc24ucHJlZml4ZXMuCgpJZiB4ODYgZGVjb2RlciBmaW5k
cyBhIHNwZWNpYWwgc2VxdWVuY2Ugb2YgaW5zdHJ1Y3Rpb25zIG9mClhFTl9FTVVMQVRFX1BSRUZJ
WCBhbmQgJ3VkMmE7IC5hc2NpaSAia3ZtIicsIGl0IGp1c3QgY291bnRzIHRoZQpsZW5ndGgsIHNl
dCBpbnNuLmVtdWxhdGVfcHJlZml4X3NpemUgYW5kIGZvbGQgaXQgd2l0aCB0aGUgbmV4dAppbnN0
cnVjdGlvbi4gSW4gb3RoZXIgd29yZHMsIHRoZSBzaWduYXR1cmUgYW5kIHRoZSBuZXh0IGluc3Ry
dWN0aW9uCmlzIHRyZWF0ZWQgYXMgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uCgpSZXBvcnRlZC1ieTog
Sm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hc2Ft
aSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBKb3NoIFBvaW1ib2V1
ZiA8anBvaW1ib2VAcmVkaGF0LmNvbT4KLS0tCiBDaGFuZ2VzIGluIHYzOgogIC0gRml4IHBlcmYn
cyBjaGVjayBzY3JpcHQgdG9vLgogQ2hhbmdlcyBpbiB2MjoKICAtIEdlbmVyYWxpemUgdGhlIGVt
dWxhdGUtcHJlZml4IGhhbmRsaW5nIG5vdCBvbmx5IGZvciBYZW4gYnV0IEtWTS4KICAtIEludHJv
ZHVjZSBpbnNuLmVtdWxhdGVfcHJlZml4X3NpemUgaW5zdGVhZCBvZiB1c2luZyBpbnNuLnByZWZp
eGVzLgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaCAgICAgICAgICAgICB8ICAgIDYg
KysrKysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaCAgICB8ICAgIDcgKysr
Ky0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggICAgICAgfCAgIDEwICsrKysr
KysrKwogYXJjaC94ODYvbGliL2luc24uYyAgICAgICAgICAgICAgICAgICAgIHwgICAzNiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9p
bnNuLmggICAgICAgfCAgICA2ICsrKysrCiB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4v
cHJlZml4LmggfCAgIDEwICsrKysrKysrKwogdG9vbHMvYXJjaC94ODYvbGliL2luc24uYyAgICAg
ICAgICAgICAgIHwgICAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9v
Ymp0b29sL3N5bmMtY2hlY2suc2ggICAgICAgICAgICAgfCAgICAzICsrLQogdG9vbHMvcGVyZi9j
aGVjay1oZWFkZXJzLnNoICAgICAgICAgICAgIHwgICAgMiArLQogOSBmaWxlcyBjaGFuZ2VkLCAx
MTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9pbnNuLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmgKaW5kZXggMTU0
ZjI3YmU4YmZjLi41YzFhZTNlZmY5ZDQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2luc24uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmgKQEAgLTQ1LDYgKzQ1LDcg
QEAgc3RydWN0IGluc24gewogCQlzdHJ1Y3QgaW5zbl9maWVsZCBpbW1lZGlhdGUyOwkvKiBmb3Ig
NjRiaXQgaW1tIG9yIHNlZzE2ICovCiAJfTsKIAorCWludAllbXVsYXRlX3ByZWZpeF9zaXplOwog
CWluc25fYXR0cl90IGF0dHI7CiAJdW5zaWduZWQgY2hhciBvcG5kX2J5dGVzOwogCXVuc2lnbmVk
IGNoYXIgYWRkcl9ieXRlczsKQEAgLTEyOCw2ICsxMjksMTEgQEAgc3RhdGljIGlubGluZSBpbnQg
aW5zbl9pc19ldmV4KHN0cnVjdCBpbnNuICppbnNuKQogCXJldHVybiAoaW5zbi0+dmV4X3ByZWZp
eC5uYnl0ZXMgPT0gNCk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgaW50IGluc25faGFzX2VtdWxhdGVf
cHJlZml4KHN0cnVjdCBpbnNuICppbnNuKQoreworCXJldHVybiAhIWluc24tPmVtdWxhdGVfcHJl
Zml4X3NpemU7Cit9CisKIC8qIEVuc3VyZSB0aGlzIGluc3RydWN0aW9uIGlzIGRlY29kZWQgY29t
cGxldGVseSAqLwogc3RhdGljIGlubGluZSBpbnQgaW5zbl9jb21wbGV0ZShzdHJ1Y3QgaW5zbiAq
aW5zbikKIHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2Uu
aCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaAppbmRleCA2MmNhMDNlZjVj
NjUuLmZlMzNhOTc5ODcwOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2lu
dGVyZmFjZS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaApAQCAt
Mzc5LDEyICszNzksMTUgQEAgc3RydWN0IHhlbl9wbXVfYXJjaCB7CiAgKiBQcmVmaXggZm9yY2Vz
IGVtdWxhdGlvbiBvZiBzb21lIG5vbi10cmFwcGluZyBpbnN0cnVjdGlvbnMuCiAgKiBDdXJyZW50
bHkgb25seSBDUFVJRC4KICAqLworI2luY2x1ZGUgPGFzbS94ZW4vcHJlZml4Lmg+CisKICNpZmRl
ZiBfX0FTU0VNQkxZX18KLSNkZWZpbmUgWEVOX0VNVUxBVEVfUFJFRklYIC5ieXRlIDB4MGYsMHgw
YiwweDc4LDB4NjUsMHg2ZSA7CisjZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCAuYnl0ZSBfX1hF
Tl9FTVVMQVRFX1BSRUZJWCA7CiAjZGVmaW5lIFhFTl9DUFVJRCAgICAgICAgICBYRU5fRU1VTEFU
RV9QUkVGSVggY3B1aWQKICNlbHNlCi0jZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCAiLmJ5dGUg
MHgwZiwweDBiLDB4NzgsMHg2NSwweDZlIDsgIgorI2RlZmluZSBYRU5fRU1VTEFURV9QUkVGSVgg
Ii5ieXRlICIgX19YRU5fRU1VTEFURV9QUkVGSVhfU1RSICIgOyAiCiAjZGVmaW5lIFhFTl9DUFVJ
RCAgICAgICAgICBYRU5fRU1VTEFURV9QUkVGSVggImNwdWlkIgorCiAjZW5kaWYKIAogI2VuZGlm
IC8qIF9BU01fWDg2X1hFTl9JTlRFUkZBQ0VfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5j
bHVkZS9hc20veGVuL3ByZWZpeC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5o
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZjkwMWJlMGQ3YTk1Ci0t
LSAvZGV2L251bGwKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oCkBAIC0w
LDAgKzEsMTAgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaWZu
ZGVmIF9UT09MU19BU01fWDg2X1hFTl9QUkVGSVhfSAorI2RlZmluZSBfVE9PTFNfQVNNX1g4Nl9Y
RU5fUFJFRklYX0gKKworI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgorCisjZGVmaW5lIF9f
WEVOX0VNVUxBVEVfUFJFRklYICAweDBmLDB4MGIsMHg3OCwweDY1LDB4NmUKKyNkZWZpbmUgX19Y
RU5fRU1VTEFURV9QUkVGSVhfU1RSICBfX3N0cmluZ2lmeShfX1hFTl9FTVVMQVRFX1BSRUZJWCkK
KworI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9saWIvaW5zbi5jIGIvYXJjaC94ODYvbGli
L2luc24uYwppbmRleCAwYjU4NjJiYTZhNzUuLmI3ZWI1MDE4N2RiOSAxMDA2NDQKLS0tIGEvYXJj
aC94ODYvbGliL2luc24uYworKysgYi9hcmNoL3g4Ni9saWIvaW5zbi5jCkBAIC0xMyw2ICsxMyw5
IEBACiAjaW5jbHVkZSA8YXNtL2luYXQuaD4KICNpbmNsdWRlIDxhc20vaW5zbi5oPgogCisvKiBG
b3Igc3BlY2lhbCBYZW4gcHJlZml4ICovCisjaW5jbHVkZSA8YXNtL3hlbi9wcmVmaXguaD4KKwog
LyogVmVyaWZ5IG5leHQgc2l6ZW9mKHQpIGJ5dGVzIGNhbiBiZSBvbiB0aGUgc2FtZSBpbnN0cnVj
dGlvbiAqLwogI2RlZmluZSB2YWxpZGF0ZV9uZXh0KHQsIGluc24sIG4pCVwKIAkoKGluc24pLT5u
ZXh0X2J5dGUgKyBzaXplb2YodCkgKyBuIDw9IChpbnNuKS0+ZW5kX2thZGRyKQpAQCAtNTgsNiAr
NjEsMzcgQEAgdm9pZCBpbnNuX2luaXQoc3RydWN0IGluc24gKmluc24sIGNvbnN0IHZvaWQgKmth
ZGRyLCBpbnQgYnVmX2xlbiwgaW50IHg4Nl82NCkKIAkJaW5zbi0+YWRkcl9ieXRlcyA9IDQ7CiB9
CiAKK3N0YXRpYyBjb25zdCBpbnNuX2J5dGVfdCB4ZW5fcHJlZml4W10gPSB7IF9fWEVOX0VNVUxB
VEVfUFJFRklYIH07CisvKiBTZWUgaGFuZGxlX3VkKClAYXJjaC94ODYva3ZtL3g4Ni5jICovCitz
dGF0aWMgY29uc3QgaW5zbl9ieXRlX3Qga3ZtX3ByZWZpeFtdID0gIlx4Zlx4Ymt2bSI7CisKK3N0
YXRpYyBpbnQgX19pbnNuX2dldF9lbXVsYXRlX3ByZWZpeChzdHJ1Y3QgaW5zbiAqaW5zbiwKKwkJ
CQkgICAgIGNvbnN0IGluc25fYnl0ZV90ICpwcmVmaXgsIHNpemVfdCBsZW4pCit7CisJc2l6ZV90
IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsKKwkJaWYgKHBlZWtfbmJ5dGVfbmV4
dChpbnNuX2J5dGVfdCwgaW5zbiwgaSkgIT0gcHJlZml4W2ldKQorCQkJZ290byBlcnJfb3V0Owor
CX0KKworCWluc24tPmVtdWxhdGVfcHJlZml4X3NpemUgPSBsZW47CisJaW5zbi0+bmV4dF9ieXRl
ICs9IGxlbjsKKworCXJldHVybiAxOworCitlcnJfb3V0OgorCXJldHVybiAwOworfQorCitzdGF0
aWMgdm9pZCBpbnNuX2dldF9lbXVsYXRlX3ByZWZpeChzdHJ1Y3QgaW5zbiAqaW5zbikKK3sKKwlp
ZiAoX19pbnNuX2dldF9lbXVsYXRlX3ByZWZpeChpbnNuLCB4ZW5fcHJlZml4LCBzaXplb2YoeGVu
X3ByZWZpeCkpKQorCQlyZXR1cm47CisKKwlfX2luc25fZ2V0X2VtdWxhdGVfcHJlZml4KGluc24s
IGt2bV9wcmVmaXgsIHNpemVvZihrdm1fcHJlZml4KSk7Cit9CisKIC8qKgogICogaW5zbl9nZXRf
cHJlZml4ZXMgLSBzY2FuIHg4NiBpbnN0cnVjdGlvbiBwcmVmaXggYnl0ZXMKICAqIEBpbnNuOgkm
c3RydWN0IGluc24gY29udGFpbmluZyBpbnN0cnVjdGlvbgpAQCAtNzYsNiArMTEwLDggQEAgdm9p
ZCBpbnNuX2dldF9wcmVmaXhlcyhzdHJ1Y3QgaW5zbiAqaW5zbikKIAlpZiAocHJlZml4ZXMtPmdv
dCkKIAkJcmV0dXJuOwogCisJaW5zbl9nZXRfZW11bGF0ZV9wcmVmaXgoaW5zbik7CisKIAluYiA9
IDA7CiAJbGIgPSAwOwogCWIgPSBwZWVrX25leHQoaW5zbl9ieXRlX3QsIGluc24pOwpkaWZmIC0t
Z2l0IGEvdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oIGIvdG9vbHMvYXJjaC94ODYv
aW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDM3YTRjMzkwNzUwYi4uNTY4ODU0YjE0ZDBhIDEwMDY0
NAotLS0gYS90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmgKKysrIGIvdG9vbHMvYXJj
aC94ODYvaW5jbHVkZS9hc20vaW5zbi5oCkBAIC00NSw2ICs0NSw3IEBAIHN0cnVjdCBpbnNuIHsK
IAkJc3RydWN0IGluc25fZmllbGQgaW1tZWRpYXRlMjsJLyogZm9yIDY0Yml0IGltbSBvciBzZWcx
NiAqLwogCX07CiAKKwlpbnQJZW11bGF0ZV9wcmVmaXhfc2l6ZTsKIAlpbnNuX2F0dHJfdCBhdHRy
OwogCXVuc2lnbmVkIGNoYXIgb3BuZF9ieXRlczsKIAl1bnNpZ25lZCBjaGFyIGFkZHJfYnl0ZXM7
CkBAIC0xMjgsNiArMTI5LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGluc25faXNfZXZleChzdHJ1
Y3QgaW5zbiAqaW5zbikKIAlyZXR1cm4gKGluc24tPnZleF9wcmVmaXgubmJ5dGVzID09IDQpOwog
fQogCitzdGF0aWMgaW5saW5lIGludCBpbnNuX2hhc19lbXVsYXRlX3ByZWZpeChzdHJ1Y3QgaW5z
biAqaW5zbikKK3sKKwlyZXR1cm4gISFpbnNuLT5lbXVsYXRlX3ByZWZpeF9zaXplOworfQorCiAv
KiBFbnN1cmUgdGhpcyBpbnN0cnVjdGlvbiBpcyBkZWNvZGVkIGNvbXBsZXRlbHkgKi8KIHN0YXRp
YyBpbmxpbmUgaW50IGluc25fY29tcGxldGUoc3RydWN0IGluc24gKmluc24pCiB7CmRpZmYgLS1n
aXQgYS90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggYi90b29scy9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi5mOTAxYmUwZDdhOTUKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKQEAgLTAsMCArMSwxMCBAQAorLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX1RPT0xTX0FTTV9YODZfWEVO
X1BSRUZJWF9ICisjZGVmaW5lIF9UT09MU19BU01fWDg2X1hFTl9QUkVGSVhfSAorCisjaW5jbHVk
ZSA8bGludXgvc3RyaW5naWZ5Lmg+CisKKyNkZWZpbmUgX19YRU5fRU1VTEFURV9QUkVGSVggIDB4
MGYsMHgwYiwweDc4LDB4NjUsMHg2ZQorI2RlZmluZSBfX1hFTl9FTVVMQVRFX1BSRUZJWF9TVFIg
IF9fc3RyaW5naWZ5KF9fWEVOX0VNVUxBVEVfUFJFRklYKQorCisjZW5kaWYKZGlmZiAtLWdpdCBh
L3Rvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMgYi90b29scy9hcmNoL3g4Ni9saWIvaW5zbi5jCmlu
ZGV4IDc5ZTA0OGYxZDkwMi4uY2UwNGU0M2UwNzQ5IDEwMDY0NAotLS0gYS90b29scy9hcmNoL3g4
Ni9saWIvaW5zbi5jCisrKyBiL3Rvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMKQEAgLTEzLDYgKzEz
LDkgQEAKICNpbmNsdWRlICIuLi9pbmNsdWRlL2FzbS9pbmF0LmgiCiAjaW5jbHVkZSAiLi4vaW5j
bHVkZS9hc20vaW5zbi5oIgogCisvKiBGb3Igc3BlY2lhbCBYZW4gcHJlZml4ICovCisjaW5jbHVk
ZSAiLi4vaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oIgorCiAvKiBWZXJpZnkgbmV4dCBzaXplb2Yo
dCkgYnl0ZXMgY2FuIGJlIG9uIHRoZSBzYW1lIGluc3RydWN0aW9uICovCiAjZGVmaW5lIHZhbGlk
YXRlX25leHQodCwgaW5zbiwgbikJXAogCSgoaW5zbiktPm5leHRfYnl0ZSArIHNpemVvZih0KSAr
IG4gPD0gKGluc24pLT5lbmRfa2FkZHIpCkBAIC01OCw2ICs2MSwzNyBAQCB2b2lkIGluc25faW5p
dChzdHJ1Y3QgaW5zbiAqaW5zbiwgY29uc3Qgdm9pZCAqa2FkZHIsIGludCBidWZfbGVuLCBpbnQg
eDg2XzY0KQogCQlpbnNuLT5hZGRyX2J5dGVzID0gNDsKIH0KIAorc3RhdGljIGNvbnN0IGluc25f
Ynl0ZV90IHhlbl9wcmVmaXhbXSA9IHsgX19YRU5fRU1VTEFURV9QUkVGSVggfTsKKy8qIFNlZSBo
YW5kbGVfdWQoKUBhcmNoL3g4Ni9rdm0veDg2LmMgKi8KK3N0YXRpYyBjb25zdCBpbnNuX2J5dGVf
dCBrdm1fcHJlZml4W10gPSAiXHhmXHhia3ZtIjsKKworc3RhdGljIGludCBfX2luc25fZ2V0X2Vt
dWxhdGVfcHJlZml4KHN0cnVjdCBpbnNuICppbnNuLAorCQkJCSAgICAgY29uc3QgaW5zbl9ieXRl
X3QgKnByZWZpeCwgc2l6ZV90IGxlbikKK3sKKwlzaXplX3QgaTsKKworCWZvciAoaSA9IDA7IGkg
PCBsZW47IGkrKykgeworCQlpZiAocGVla19uYnl0ZV9uZXh0KGluc25fYnl0ZV90LCBpbnNuLCBp
KSAhPSBwcmVmaXhbaV0pCisJCQlnb3RvIGVycl9vdXQ7CisJfQorCisJaW5zbi0+ZW11bGF0ZV9w
cmVmaXhfc2l6ZSA9IGxlbjsKKwlpbnNuLT5uZXh0X2J5dGUgKz0gbGVuOworCisJcmV0dXJuIDE7
CisKK2Vycl9vdXQ6CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyB2b2lkIGluc25fZ2V0X2VtdWxh
dGVfcHJlZml4KHN0cnVjdCBpbnNuICppbnNuKQoreworCWlmIChfX2luc25fZ2V0X2VtdWxhdGVf
cHJlZml4KGluc24sIHhlbl9wcmVmaXgsIHNpemVvZih4ZW5fcHJlZml4KSkpCisJCXJldHVybjsK
KworCV9faW5zbl9nZXRfZW11bGF0ZV9wcmVmaXgoaW5zbiwga3ZtX3ByZWZpeCwgc2l6ZW9mKGt2
bV9wcmVmaXgpKTsKK30KKwogLyoqCiAgKiBpbnNuX2dldF9wcmVmaXhlcyAtIHNjYW4geDg2IGlu
c3RydWN0aW9uIHByZWZpeCBieXRlcwogICogQGluc246CSZzdHJ1Y3QgaW5zbiBjb250YWluaW5n
IGluc3RydWN0aW9uCkBAIC03Niw2ICsxMTAsOCBAQCB2b2lkIGluc25fZ2V0X3ByZWZpeGVzKHN0
cnVjdCBpbnNuICppbnNuKQogCWlmIChwcmVmaXhlcy0+Z290KQogCQlyZXR1cm47CiAKKwlpbnNu
X2dldF9lbXVsYXRlX3ByZWZpeChpbnNuKTsKKwogCW5iID0gMDsKIAlsYiA9IDA7CiAJYiA9IHBl
ZWtfbmV4dChpbnNuX2J5dGVfdCwgaW5zbik7CmRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL3N5
bmMtY2hlY2suc2ggYi90b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2gKaW5kZXggMGE4MzJlMjY1
YTUwLi4zNDE0M2VhM2Q0NzcgMTAwNzU1Ci0tLSBhL3Rvb2xzL29ianRvb2wvc3luYy1jaGVjay5z
aAorKysgYi90b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2gKQEAgLTQsNiArNCw3IEBACiBGSUxF
Uz0nCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbmF0X3R5cGVzLmgKIGFyY2gveDg2L2luY2x1ZGUv
YXNtL29yY190eXBlcy5oCithcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKIGFyY2gv
eDg2L2xpYi94ODYtb3Bjb2RlLW1hcC50eHQKIGFyY2gveDg2L3Rvb2xzL2dlbi1pbnNuLWF0dHIt
eDg2LmF3awogJwpAQCAtNDYsNiArNDcsNiBAQCBkb25lCiBjaGVjayBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9pbmF0LmggICAgICctSSAiXiNpbmNsdWRlIFtcIjxdXChhc20vXCkqaW5hdF90eXBlcy5o
W1wiPl0iJwogY2hlY2sgYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oICAgICAnLUkgIl4jaW5j
bHVkZSBbXCI8XVwoYXNtL1wpKmluYXQuaFtcIj5dIicKIGNoZWNrIGFyY2gveDg2L2xpYi9pbmF0
LmMgICAgICAgICAgICAgJy1JICJeI2luY2x1ZGUgW1wiPF1cKC4uL2luY2x1ZGUvXCkqYXNtL2lu
c24uaFtcIj5dIicKLWNoZWNrIGFyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAgJy1JICJe
I2luY2x1ZGUgW1wiPF1cKC4uL2luY2x1ZGUvXCkqYXNtL2luXChhdFx8c25cKS5oW1wiPl0iJwor
Y2hlY2sgYXJjaC94ODYvbGliL2luc24uYyAgICAgICAgICAgICAnLUkgIl4jaW5jbHVkZSBbXCI8
XVwoLi4vaW5jbHVkZS9cKSphc20vaW5cKGF0XHxzblwpLmhbXCI+XSIgLUkgIl4jaW5jbHVkZSBb
XCI8XVwoLi4vaW5jbHVkZS9cKSphc20veGVuL3ByZWZpeC5oW1wiPl0iJwogCiBjZCAtCmRpZmYg
LS1naXQgYS90b29scy9wZXJmL2NoZWNrLWhlYWRlcnMuc2ggYi90b29scy9wZXJmL2NoZWNrLWhl
YWRlcnMuc2gKaW5kZXggZTJlMGYwNmM5N2QwLi5lZGNmZmE1NWE4MjYgMTAwNzU1Ci0tLSBhL3Rv
b2xzL3BlcmYvY2hlY2staGVhZGVycy5zaAorKysgYi90b29scy9wZXJmL2NoZWNrLWhlYWRlcnMu
c2gKQEAgLTExNSw3ICsxMTUsNyBAQCBjaGVjayBsaWIvY3R5cGUuYwkJICAgICAgJy1JICJeRVhQ
T1JUX1NZTUJPTCIgLUkgIl4jaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+IiAtQgogY2hlY2sgYXJj
aC94ODYvaW5jbHVkZS9hc20vaW5hdC5oICAgICAnLUkgIl4jaW5jbHVkZSBbXCI8XVwoYXNtL1wp
KmluYXRfdHlwZXMuaFtcIj5dIicKIGNoZWNrIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaCAg
ICAgJy1JICJeI2luY2x1ZGUgW1wiPF1cKGFzbS9cKSppbmF0LmhbXCI+XSInCiBjaGVjayBhcmNo
L3g4Ni9saWIvaW5hdC5jCSAgICAgICctSSAiXiNpbmNsdWRlIFtcIjxdXCguLi9pbmNsdWRlL1wp
KmFzbS9pbnNuLmhbXCI+XSInCi1jaGVjayBhcmNoL3g4Ni9saWIvaW5zbi5jCSAgICAgICctSSAi
XiNpbmNsdWRlIFtcIjxdXCguLi9pbmNsdWRlL1wpKmFzbS9pblwoYXRcfHNuXCkuaFtcIj5dIicK
K2NoZWNrIGFyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAgJy1JICJeI2luY2x1ZGUgW1wi
PF1cKC4uL2luY2x1ZGUvXCkqYXNtL2luXChhdFx8c25cKS5oW1wiPl0iIC1JICJeI2luY2x1ZGUg
W1wiPF1cKC4uL2luY2x1ZGUvXCkqYXNtL3hlbi9wcmVmaXguaFtcIj5dIicKIAogIyBkaWZmIG5v
bi1zeW1tZXRyaWMgZmlsZXMKIGNoZWNrXzIgdG9vbHMvcGVyZi9hcmNoL3g4Ni9lbnRyeS9zeXNj
YWxscy9zeXNjYWxsXzY0LnRibCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxscy9zeXNjYWxsXzY0LnRi
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
