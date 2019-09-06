Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218EAAFF4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 02:53:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i62SI-0005b0-6c; Fri, 06 Sep 2019 00:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i62SH-0005at-LW
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 00:50:25 +0000
X-Inumbo-ID: 4fa9e430-d040-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fa9e430-d040-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 00:50:25 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99009207E0;
 Fri,  6 Sep 2019 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567731024;
 bh=+Nnz0FIHQJ3jHYwiPpXCPIDVXG7NsASc8gVWuOyip0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zsuXaaqGyaOfDGQ7DyKPVO1u6gl1Yd+AH8J/Sa9mAthkCyT1oiMDaKAt1ycfwvcNS
 AodFvZKMyOLo4Xw1WRvjL+fHn4N8sYado5rBcUSR3LW6LJAlO3rDmt+9kfiNbqEsvM
 yss5dQEs77VIhrrrRqt1aWZU+aPjool/Ok5y60EA=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 09:50:19 +0900
Message-Id: <156773101914.29031.4027232648773934988.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156773100816.29031.12557431294039450779.stgit@devnote2>
References: <156773100816.29031.12557431294039450779.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v2 1/2] x86: xen: insn: Decode Xen and KVM
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
aSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Ci0tLQogQ2hhbmdlcyBpbiB2MjoKICAt
IEdlbmVyYWxpemUgdGhlIGVtdWxhdGUtcHJlZml4IGhhbmRsaW5nIG5vdCBvbmx5IGZvciBYZW4g
YnV0IEtWTS4KICAtIEludHJvZHVjZSBpbnNuLmVtdWxhdGVfcHJlZml4X3NpemUgaW5zdGVhZCBv
ZiB1c2luZyBpbnNuLnByZWZpeGVzLgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaCAg
ICAgICAgICAgICB8ICAgIDYgKysrKysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZh
Y2UuaCAgICB8ICAgIDcgKysrKy0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4Lmgg
ICAgICAgfCAgIDEwICsrKysrKysrKwogYXJjaC94ODYvbGliL2luc24uYyAgICAgICAgICAgICAg
ICAgICAgIHwgICAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmggICAgICAgfCAgICA2ICsrKysrCiB0b29scy9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggfCAgIDEwICsrKysrKysrKwogdG9vbHMvYXJjaC94
ODYvbGliL2luc24uYyAgICAgICAgICAgICAgIHwgICAzNiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiB0b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2ggICAgICAgICAgICAgfCAgICAz
ICsrLQogOCBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pbnNuLmgKaW5kZXggMTU0ZjI3YmU4YmZjLi41YzFhZTNlZmY5ZDQgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9pbnNuLmgKQEAgLTQ1LDYgKzQ1LDcgQEAgc3RydWN0IGluc24gewogCQlzdHJ1Y3QgaW5zbl9m
aWVsZCBpbW1lZGlhdGUyOwkvKiBmb3IgNjRiaXQgaW1tIG9yIHNlZzE2ICovCiAJfTsKIAorCWlu
dAllbXVsYXRlX3ByZWZpeF9zaXplOwogCWluc25fYXR0cl90IGF0dHI7CiAJdW5zaWduZWQgY2hh
ciBvcG5kX2J5dGVzOwogCXVuc2lnbmVkIGNoYXIgYWRkcl9ieXRlczsKQEAgLTEyOCw2ICsxMjks
MTEgQEAgc3RhdGljIGlubGluZSBpbnQgaW5zbl9pc19ldmV4KHN0cnVjdCBpbnNuICppbnNuKQog
CXJldHVybiAoaW5zbi0+dmV4X3ByZWZpeC5uYnl0ZXMgPT0gNCk7CiB9CiAKK3N0YXRpYyBpbmxp
bmUgaW50IGluc25faGFzX2VtdWxhdGVfcHJlZml4KHN0cnVjdCBpbnNuICppbnNuKQoreworCXJl
dHVybiAhIWluc24tPmVtdWxhdGVfcHJlZml4X3NpemU7Cit9CisKIC8qIEVuc3VyZSB0aGlzIGlu
c3RydWN0aW9uIGlzIGRlY29kZWQgY29tcGxldGVseSAqLwogc3RhdGljIGlubGluZSBpbnQgaW5z
bl9jb21wbGV0ZShzdHJ1Y3QgaW5zbiAqaW5zbikKIHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRl
cmZhY2UuaAppbmRleCA2MmNhMDNlZjVjNjUuLmZlMzNhOTc5ODcwOCAxMDA2NDQKLS0tIGEvYXJj
aC94ODYvaW5jbHVkZS9hc20veGVuL2ludGVyZmFjZS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3hlbi9pbnRlcmZhY2UuaApAQCAtMzc5LDEyICszNzksMTUgQEAgc3RydWN0IHhlbl9wbXVf
YXJjaCB7CiAgKiBQcmVmaXggZm9yY2VzIGVtdWxhdGlvbiBvZiBzb21lIG5vbi10cmFwcGluZyBp
bnN0cnVjdGlvbnMuCiAgKiBDdXJyZW50bHkgb25seSBDUFVJRC4KICAqLworI2luY2x1ZGUgPGFz
bS94ZW4vcHJlZml4Lmg+CisKICNpZmRlZiBfX0FTU0VNQkxZX18KLSNkZWZpbmUgWEVOX0VNVUxB
VEVfUFJFRklYIC5ieXRlIDB4MGYsMHgwYiwweDc4LDB4NjUsMHg2ZSA7CisjZGVmaW5lIFhFTl9F
TVVMQVRFX1BSRUZJWCAuYnl0ZSBfX1hFTl9FTVVMQVRFX1BSRUZJWCA7CiAjZGVmaW5lIFhFTl9D
UFVJRCAgICAgICAgICBYRU5fRU1VTEFURV9QUkVGSVggY3B1aWQKICNlbHNlCi0jZGVmaW5lIFhF
Tl9FTVVMQVRFX1BSRUZJWCAiLmJ5dGUgMHgwZiwweDBiLDB4NzgsMHg2NSwweDZlIDsgIgorI2Rl
ZmluZSBYRU5fRU1VTEFURV9QUkVGSVggIi5ieXRlICIgX19YRU5fRU1VTEFURV9QUkVGSVhfU1RS
ICIgOyAiCiAjZGVmaW5lIFhFTl9DUFVJRCAgICAgICAgICBYRU5fRU1VTEFURV9QUkVGSVggImNw
dWlkIgorCiAjZW5kaWYKIAogI2VuZGlmIC8qIF9BU01fWDg2X1hFTl9JTlRFUkZBQ0VfSCAqLwpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20veGVuL3ByZWZpeC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uZjkwMWJlMGQ3YTk1Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20veGVuL3ByZWZpeC5oCkBAIC0wLDAgKzEsMTAgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wICovCisjaWZuZGVmIF9UT09MU19BU01fWDg2X1hFTl9QUkVGSVhfSAor
I2RlZmluZSBfVE9PTFNfQVNNX1g4Nl9YRU5fUFJFRklYX0gKKworI2luY2x1ZGUgPGxpbnV4L3N0
cmluZ2lmeS5oPgorCisjZGVmaW5lIF9fWEVOX0VNVUxBVEVfUFJFRklYICAweDBmLDB4MGIsMHg3
OCwweDY1LDB4NmUKKyNkZWZpbmUgX19YRU5fRU1VTEFURV9QUkVGSVhfU1RSICBfX3N0cmluZ2lm
eShfX1hFTl9FTVVMQVRFX1BSRUZJWCkKKworI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9s
aWIvaW5zbi5jIGIvYXJjaC94ODYvbGliL2luc24uYwppbmRleCAwYjU4NjJiYTZhNzUuLmI3ZWI1
MDE4N2RiOSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbGliL2luc24uYworKysgYi9hcmNoL3g4Ni9s
aWIvaW5zbi5jCkBAIC0xMyw2ICsxMyw5IEBACiAjaW5jbHVkZSA8YXNtL2luYXQuaD4KICNpbmNs
dWRlIDxhc20vaW5zbi5oPgogCisvKiBGb3Igc3BlY2lhbCBYZW4gcHJlZml4ICovCisjaW5jbHVk
ZSA8YXNtL3hlbi9wcmVmaXguaD4KKwogLyogVmVyaWZ5IG5leHQgc2l6ZW9mKHQpIGJ5dGVzIGNh
biBiZSBvbiB0aGUgc2FtZSBpbnN0cnVjdGlvbiAqLwogI2RlZmluZSB2YWxpZGF0ZV9uZXh0KHQs
IGluc24sIG4pCVwKIAkoKGluc24pLT5uZXh0X2J5dGUgKyBzaXplb2YodCkgKyBuIDw9IChpbnNu
KS0+ZW5kX2thZGRyKQpAQCAtNTgsNiArNjEsMzcgQEAgdm9pZCBpbnNuX2luaXQoc3RydWN0IGlu
c24gKmluc24sIGNvbnN0IHZvaWQgKmthZGRyLCBpbnQgYnVmX2xlbiwgaW50IHg4Nl82NCkKIAkJ
aW5zbi0+YWRkcl9ieXRlcyA9IDQ7CiB9CiAKK3N0YXRpYyBjb25zdCBpbnNuX2J5dGVfdCB4ZW5f
cHJlZml4W10gPSB7IF9fWEVOX0VNVUxBVEVfUFJFRklYIH07CisvKiBTZWUgaGFuZGxlX3VkKClA
YXJjaC94ODYva3ZtL3g4Ni5jICovCitzdGF0aWMgY29uc3QgaW5zbl9ieXRlX3Qga3ZtX3ByZWZp
eFtdID0gIlx4Zlx4Ymt2bSI7CisKK3N0YXRpYyBpbnQgX19pbnNuX2dldF9lbXVsYXRlX3ByZWZp
eChzdHJ1Y3QgaW5zbiAqaW5zbiwKKwkJCQkgICAgIGNvbnN0IGluc25fYnl0ZV90ICpwcmVmaXgs
IHNpemVfdCBsZW4pCit7CisJc2l6ZV90IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKysp
IHsKKwkJaWYgKHBlZWtfbmJ5dGVfbmV4dChpbnNuX2J5dGVfdCwgaW5zbiwgaSkgIT0gcHJlZml4
W2ldKQorCQkJZ290byBlcnJfb3V0OworCX0KKworCWluc24tPmVtdWxhdGVfcHJlZml4X3NpemUg
PSBsZW47CisJaW5zbi0+bmV4dF9ieXRlICs9IGxlbjsKKworCXJldHVybiAxOworCitlcnJfb3V0
OgorCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBpbnNuX2dldF9lbXVsYXRlX3ByZWZpeChz
dHJ1Y3QgaW5zbiAqaW5zbikKK3sKKwlpZiAoX19pbnNuX2dldF9lbXVsYXRlX3ByZWZpeChpbnNu
LCB4ZW5fcHJlZml4LCBzaXplb2YoeGVuX3ByZWZpeCkpKQorCQlyZXR1cm47CisKKwlfX2luc25f
Z2V0X2VtdWxhdGVfcHJlZml4KGluc24sIGt2bV9wcmVmaXgsIHNpemVvZihrdm1fcHJlZml4KSk7
Cit9CisKIC8qKgogICogaW5zbl9nZXRfcHJlZml4ZXMgLSBzY2FuIHg4NiBpbnN0cnVjdGlvbiBw
cmVmaXggYnl0ZXMKICAqIEBpbnNuOgkmc3RydWN0IGluc24gY29udGFpbmluZyBpbnN0cnVjdGlv
bgpAQCAtNzYsNiArMTEwLDggQEAgdm9pZCBpbnNuX2dldF9wcmVmaXhlcyhzdHJ1Y3QgaW5zbiAq
aW5zbikKIAlpZiAocHJlZml4ZXMtPmdvdCkKIAkJcmV0dXJuOwogCisJaW5zbl9nZXRfZW11bGF0
ZV9wcmVmaXgoaW5zbik7CisKIAluYiA9IDA7CiAJbGIgPSAwOwogCWIgPSBwZWVrX25leHQoaW5z
bl9ieXRlX3QsIGluc24pOwpkaWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20v
aW5zbi5oIGIvdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDM3YTRjMzkw
NzUwYi4uNTY4ODU0YjE0ZDBhIDEwMDY0NAotLS0gYS90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9pbnNuLmgKKysrIGIvdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oCkBAIC00NSw2
ICs0NSw3IEBAIHN0cnVjdCBpbnNuIHsKIAkJc3RydWN0IGluc25fZmllbGQgaW1tZWRpYXRlMjsJ
LyogZm9yIDY0Yml0IGltbSBvciBzZWcxNiAqLwogCX07CiAKKwlpbnQJZW11bGF0ZV9wcmVmaXhf
c2l6ZTsKIAlpbnNuX2F0dHJfdCBhdHRyOwogCXVuc2lnbmVkIGNoYXIgb3BuZF9ieXRlczsKIAl1
bnNpZ25lZCBjaGFyIGFkZHJfYnl0ZXM7CkBAIC0xMjgsNiArMTI5LDExIEBAIHN0YXRpYyBpbmxp
bmUgaW50IGluc25faXNfZXZleChzdHJ1Y3QgaW5zbiAqaW5zbikKIAlyZXR1cm4gKGluc24tPnZl
eF9wcmVmaXgubmJ5dGVzID09IDQpOwogfQogCitzdGF0aWMgaW5saW5lIGludCBpbnNuX2hhc19l
bXVsYXRlX3ByZWZpeChzdHJ1Y3QgaW5zbiAqaW5zbikKK3sKKwlyZXR1cm4gISFpbnNuLT5lbXVs
YXRlX3ByZWZpeF9zaXplOworfQorCiAvKiBFbnN1cmUgdGhpcyBpbnN0cnVjdGlvbiBpcyBkZWNv
ZGVkIGNvbXBsZXRlbHkgKi8KIHN0YXRpYyBpbmxpbmUgaW50IGluc25fY29tcGxldGUoc3RydWN0
IGluc24gKmluc24pCiB7CmRpZmYgLS1naXQgYS90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94
ZW4vcHJlZml4LmggYi90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mOTAxYmUwZDdhOTUKLS0tIC9k
ZXYvbnVsbAorKysgYi90b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKQEAg
LTAsMCArMSwxMCBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKyNp
Zm5kZWYgX1RPT0xTX0FTTV9YODZfWEVOX1BSRUZJWF9ICisjZGVmaW5lIF9UT09MU19BU01fWDg2
X1hFTl9QUkVGSVhfSAorCisjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CisKKyNkZWZpbmUg
X19YRU5fRU1VTEFURV9QUkVGSVggIDB4MGYsMHgwYiwweDc4LDB4NjUsMHg2ZQorI2RlZmluZSBf
X1hFTl9FTVVMQVRFX1BSRUZJWF9TVFIgIF9fc3RyaW5naWZ5KF9fWEVOX0VNVUxBVEVfUFJFRklY
KQorCisjZW5kaWYKZGlmZiAtLWdpdCBhL3Rvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMgYi90b29s
cy9hcmNoL3g4Ni9saWIvaW5zbi5jCmluZGV4IDc5ZTA0OGYxZDkwMi4uY2UwNGU0M2UwNzQ5IDEw
MDY0NAotLS0gYS90b29scy9hcmNoL3g4Ni9saWIvaW5zbi5jCisrKyBiL3Rvb2xzL2FyY2gveDg2
L2xpYi9pbnNuLmMKQEAgLTEzLDYgKzEzLDkgQEAKICNpbmNsdWRlICIuLi9pbmNsdWRlL2FzbS9p
bmF0LmgiCiAjaW5jbHVkZSAiLi4vaW5jbHVkZS9hc20vaW5zbi5oIgogCisvKiBGb3Igc3BlY2lh
bCBYZW4gcHJlZml4ICovCisjaW5jbHVkZSAiLi4vaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oIgor
CiAvKiBWZXJpZnkgbmV4dCBzaXplb2YodCkgYnl0ZXMgY2FuIGJlIG9uIHRoZSBzYW1lIGluc3Ry
dWN0aW9uICovCiAjZGVmaW5lIHZhbGlkYXRlX25leHQodCwgaW5zbiwgbikJXAogCSgoaW5zbikt
Pm5leHRfYnl0ZSArIHNpemVvZih0KSArIG4gPD0gKGluc24pLT5lbmRfa2FkZHIpCkBAIC01OCw2
ICs2MSwzNyBAQCB2b2lkIGluc25faW5pdChzdHJ1Y3QgaW5zbiAqaW5zbiwgY29uc3Qgdm9pZCAq
a2FkZHIsIGludCBidWZfbGVuLCBpbnQgeDg2XzY0KQogCQlpbnNuLT5hZGRyX2J5dGVzID0gNDsK
IH0KIAorc3RhdGljIGNvbnN0IGluc25fYnl0ZV90IHhlbl9wcmVmaXhbXSA9IHsgX19YRU5fRU1V
TEFURV9QUkVGSVggfTsKKy8qIFNlZSBoYW5kbGVfdWQoKUBhcmNoL3g4Ni9rdm0veDg2LmMgKi8K
K3N0YXRpYyBjb25zdCBpbnNuX2J5dGVfdCBrdm1fcHJlZml4W10gPSAiXHhmXHhia3ZtIjsKKwor
c3RhdGljIGludCBfX2luc25fZ2V0X2VtdWxhdGVfcHJlZml4KHN0cnVjdCBpbnNuICppbnNuLAor
CQkJCSAgICAgY29uc3QgaW5zbl9ieXRlX3QgKnByZWZpeCwgc2l6ZV90IGxlbikKK3sKKwlzaXpl
X3QgaTsKKworCWZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykgeworCQlpZiAocGVla19uYnl0ZV9u
ZXh0KGluc25fYnl0ZV90LCBpbnNuLCBpKSAhPSBwcmVmaXhbaV0pCisJCQlnb3RvIGVycl9vdXQ7
CisJfQorCisJaW5zbi0+ZW11bGF0ZV9wcmVmaXhfc2l6ZSA9IGxlbjsKKwlpbnNuLT5uZXh0X2J5
dGUgKz0gbGVuOworCisJcmV0dXJuIDE7CisKK2Vycl9vdXQ6CisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyB2b2lkIGluc25fZ2V0X2VtdWxhdGVfcHJlZml4KHN0cnVjdCBpbnNuICppbnNuKQorewor
CWlmIChfX2luc25fZ2V0X2VtdWxhdGVfcHJlZml4KGluc24sIHhlbl9wcmVmaXgsIHNpemVvZih4
ZW5fcHJlZml4KSkpCisJCXJldHVybjsKKworCV9faW5zbl9nZXRfZW11bGF0ZV9wcmVmaXgoaW5z
biwga3ZtX3ByZWZpeCwgc2l6ZW9mKGt2bV9wcmVmaXgpKTsKK30KKwogLyoqCiAgKiBpbnNuX2dl
dF9wcmVmaXhlcyAtIHNjYW4geDg2IGluc3RydWN0aW9uIHByZWZpeCBieXRlcwogICogQGluc246
CSZzdHJ1Y3QgaW5zbiBjb250YWluaW5nIGluc3RydWN0aW9uCkBAIC03Niw2ICsxMTAsOCBAQCB2
b2lkIGluc25fZ2V0X3ByZWZpeGVzKHN0cnVjdCBpbnNuICppbnNuKQogCWlmIChwcmVmaXhlcy0+
Z290KQogCQlyZXR1cm47CiAKKwlpbnNuX2dldF9lbXVsYXRlX3ByZWZpeChpbnNuKTsKKwogCW5i
ID0gMDsKIAlsYiA9IDA7CiAJYiA9IHBlZWtfbmV4dChpbnNuX2J5dGVfdCwgaW5zbik7CmRpZmYg
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
