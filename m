Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604ABE1C2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Ys-0002Ij-Nm; Wed, 25 Sep 2019 15:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Yq-0002HV-Pa
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:50:36 +0000
X-Inumbo-ID: 15334a78-dfac-11e9-8628-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 15334a78-dfac-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812716"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:38 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:55 -0700
Message-Id: <a97af141e136843ac831574148921ae233e370e0.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 17/18] xen/mem_sharing: VM forking
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
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vk0gZm9ya2luZyBpcyB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyBhIGRvbWFpbiB3aXRoIGFuIGVt
cHR5IG1lbW9yeSBzcGFjZSBhbmQgYQpwYXJlbnQgZG9tYWluIHNwZWNpZmllZCBmcm9tIHdoaWNo
IHRvIHBvcHVsYXRlIHRoZSBtZW1vcnkgd2hlbiBuZWNlc3NhcnkuIEZvcgp0aGUgbmV3IGRvbWFp
biB0byBiZSBmdW5jdGlvbmFsIHRoZSBWTSBzdGF0ZSBpcyBjb3BpZWQgb3ZlciBhcyBwYXJ0IG9m
IHRoZSBmb3JrCm9wZXJhdGlvbiAoSFZNIHBhcmFtcywgaGFwIGFsbG9jYXRpb24sIGV0YykuCgpT
aWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gv
eDg2L21tL21lbV9zaGFyaW5nLmMgICAgIHwgMjM1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgIHwgIDExICstCiB4ZW4vaW5j
bHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggfCAgMjAgKystCiB4ZW4vaW5jbHVkZS9wdWJsaWMv
bWVtb3J5LmggICAgICAgfCAgIDUgKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAg
IHwgICAxICsKIDYgZmlsZXMgY2hhbmdlZCwgMjcwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMKaW5kZXggMmFmMmY5MzZhNS4uODcyYmQxMTJiYSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC0xODkwLDcg
KzE4OTAsNyBAQCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5z
aWduZWQgbG9uZyBnbGEsCiAgICAgfQogI2VuZGlmCiAKLSAgICAvKiBTcHVyaW91cyBmYXVsdD8g
UG9EIGFuZCBsb2ctZGlydHkgYWxzbyB0YWtlIHRoaXMgcGF0aC4gKi8KKyAgICAvKiBTcHVyaW91
cyBmYXVsdD8gUG9ELCBsb2ctZGlydHkgYW5kIFZNIGZvcmtpbmcgYWxzbyB0YWtlIHRoaXMgcGF0
aC4gKi8KICAgICBpZiAoIHAybV9pc19yYW0ocDJtdCkgKQogICAgIHsKICAgICAgICAgcmMgPSAx
OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBmNTQ5NjliY2FkLi42NGI5NzIzZjhjIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYwpAQCAtMjIsMTEgKzIyLDEzIEBACiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMu
aD4KICNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4KKyNpbmNsdWRlIDx4ZW4vZXZlbnQuaD4K
ICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KICNpbmNsdWRlIDx4ZW4vcndsb2NrLmg+CiAjaW5j
bHVkZSA8eGVuL21tLmg+CiAjaW5jbHVkZSA8eGVuL2dyYW50X3RhYmxlLmg+CiAjaW5jbHVkZSA8
eGVuL3NjaGVkLmg+CisjaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVkZSA8eGVuL3Jj
dXBkYXRlLmg+CiAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgogI2luY2x1ZGUgPHhlbi92
bV9ldmVudC5oPgpAQCAtMzYsNiArMzgsOSBAQAogI2luY2x1ZGUgPGFzbS9hbHRwMm0uaD4KICNp
bmNsdWRlIDxhc20vYXRvbWljLmg+CiAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+CisjaW5jbHVkZSA8
YXNtL2hhcC5oPgorI2luY2x1ZGUgPGFzbS9odm0vaHZtLmg+CisjaW5jbHVkZSA8YXNtL2h2bS9z
YXZlLmg+CiAjaW5jbHVkZSA8eHNtL3hzbS5oPgogCiAjaW5jbHVkZSAibW0tbG9ja3MuaCIKQEAg
LTE0MjMsNiArMTQyOCwyMDcgQEAgc3RhdGljIGlubGluZSBpbnQgbWVtX3NoYXJpbmdfY29udHJv
bChzdHJ1Y3QgZG9tYWluICpkLCBib29sIGVuYWJsZSkKICAgICByZXR1cm4gMDsKIH0KIAorLyoK
KyAqIEZvcmtpbmcgYSBwYWdlIG9ubHkgZ2V0cyBjYWxsZWQgd2hlbiB0aGUgVk0gZmF1bHRzIGR1
ZSB0byBubyBlbnRyeSBiZWluZworICogaW4gdGhlIEVQVCBmb3IgdGhlIGFjY2Vzcy4gRGVwZW5k
aW5nIG9uIHRoZSB0eXBlIG9mIGFjY2VzcyB3ZSBlaXRoZXIKKyAqIHBvcHVsYXRlIHRoZSBwaHlz
bWFwIHdpdGggYSBzaGFyZWQgZW50cnkgZm9yIHJlYWQtb25seSBhY2Nlc3Mgb3IKKyAqIGZvcmsg
dGhlIHBhZ2UgaWYgaXRzIGEgd3JpdGUgYWNjZXNzLgorICoKKyAqIFRoZSBjbGllbnQgcDJtIGlz
IGFscmVhZHkgbG9ja2VkIHNvIHdlIG9ubHkgbmVlZCB0byBsb2NrCisgKiB0aGUgcGFyZW50J3Mg
aGVyZS4KKyAqLworaW50IG1lbV9zaGFyaW5nX2ZvcmtfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBn
Zm5fdCBnZm4sIGJvb2wgdW5zaGFyaW5nKQoreworICAgIGludCByYyA9IC1FTk9FTlQ7CisgICAg
c2hyX2hhbmRsZV90IGhhbmRsZTsKKyAgICBzdHJ1Y3QgZG9tYWluICpwYXJlbnQ7CisgICAgc3Ry
dWN0IHAybV9kb21haW4gKnAybTsKKyAgICB1bnNpZ25lZCBsb25nIGdmbl9sID0gZ2ZuX3goZ2Zu
KTsKKyAgICBtZm5fdCBtZm4sIG5ld19tZm47CisgICAgcDJtX3R5cGVfdCBwMm10OworICAgIHN0
cnVjdCBwYWdlX2luZm8gKnBhZ2U7CisKKyAgICBpZiAoICFtZW1fc2hhcmluZ19pc19mb3JrKGQp
ICkKKyAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CisKKyAgICBwYXJlbnQgPSBkLT5wYXJlbnQ7CisK
KyAgICBpZiAoICF1bnNoYXJpbmcgKQorICAgIHsKKyAgICAgICAgLyogRm9yIHJlYWQtb25seSBh
Y2Nlc3NlcyB3ZSBqdXN0IGFkZCBhIHNoYXJlZCBlbnRyeSB0byB0aGUgcGh5c21hcCAqLworICAg
ICAgICB3aGlsZSAoIHBhcmVudCApCisgICAgICAgIHsKKyAgICAgICAgICAgIGlmICggIShyYyA9
IG5vbWluYXRlX3BhZ2UocGFyZW50LCBnZm4sIDAsICZoYW5kbGUpKSApCisgICAgICAgICAgICAg
ICAgYnJlYWs7CisKKyAgICAgICAgICAgIHBhcmVudCA9IHBhcmVudC0+cGFyZW50OworICAgICAg
ICB9CisKKyAgICAgICAgaWYgKCAhcmMgKQorICAgICAgICB7CisgICAgICAgICAgICAvKiBUaGUg
Y2xpZW50J3MgcDJtIGlzIGFscmVhZHkgbG9ja2VkICovCisgICAgICAgICAgICBzdHJ1Y3QgcDJt
X2RvbWFpbiAqcHAybSA9IHAybV9nZXRfaG9zdHAybShwYXJlbnQpOworCisgICAgICAgICAgICBw
Mm1fbG9jayhwcDJtKTsKKyAgICAgICAgICAgIHJjID0gYWRkX3RvX3BoeXNtYXAocGFyZW50LCBn
Zm5fbCwgaGFuZGxlLCBkLCBnZm5fbCwgZmFsc2UpOworICAgICAgICAgICAgcDJtX3VubG9jayhw
cDJtKTsKKworICAgICAgICAgICAgaWYgKCAhcmMgKQorICAgICAgICAgICAgICAgIHJldHVybiAw
OworICAgICAgICB9CisgICAgfQorCisgICAgLyoKKyAgICAgKiBJZiBpdCdzIGEgd3JpdGUgYWNj
ZXNzIChpZS4gdW5zaGFyaW5nKSBvciBpZiBhZGRpbmcgYSBzaGFyZWQgZW50cnkgdG8KKyAgICAg
KiB0aGUgcGh5c21hcCBmYWlsZWQgd2UnbGwgZm9yayB0aGUgcGFnZSBkaXJlY3RseS4KKyAgICAg
Ki8KKyAgICBwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7CisgICAgcGFyZW50ID0gZC0+cGFyZW50
OworCisgICAgd2hpbGUgKCBwYXJlbnQgKQorICAgIHsKKyAgICAgICAgbWZuID0gZ2V0X2dmbl9x
dWVyeShwYXJlbnQsIGdmbl9sLCAmcDJtdCk7CisKKyAgICAgICAgaWYgKCBtZm5fdmFsaWQobWZu
KSAmJiBwMm1faXNfYW55X3JhbShwMm10KSApCisgICAgICAgICAgICBicmVhazsKKworICAgICAg
ICBwdXRfZ2ZuKHBhcmVudCwgZ2ZuX2wpOworICAgICAgICBwYXJlbnQgPSBwYXJlbnQtPnBhcmVu
dDsKKyAgICB9CisKKyAgICBpZiAoICFwYXJlbnQgKQorICAgICAgICByZXR1cm4gLUVOT0VOVDsK
KworICAgIGlmICggIShwYWdlID0gYWxsb2NfZG9taGVhcF9wYWdlKGQsIDApKSApCisgICAgewor
ICAgICAgICBwdXRfZ2ZuKHBhcmVudCwgZ2ZuX2wpOworICAgICAgICByZXR1cm4gLUVOT01FTTsK
KyAgICB9CisKKyAgICBuZXdfbWZuID0gcGFnZV90b19tZm4ocGFnZSk7CisgICAgY29weV9kb21h
aW5fcGFnZShuZXdfbWZuLCBtZm4pOworICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG5ld19t
Zm4pLCBnZm5fbCk7CisKKyAgICBwdXRfZ2ZuKHBhcmVudCwgZ2ZuX2wpOworCisgICAgcmV0dXJu
IHAybS0+c2V0X2VudHJ5KHAybSwgZ2ZuLCBuZXdfbWZuLCBQQUdFX09SREVSXzRLLCBwMm1fcmFt
X3J3LAorICAgICAgICAgICAgICAgICAgICAgICAgICBwMm0tPmRlZmF1bHRfYWNjZXNzLCAtMSk7
Cit9CisKK3N0YXRpYyBpbnQgYnJpbmdfdXBfdmNwdXMoc3RydWN0IGRvbWFpbiAqY2QsIHN0cnVj
dCBjcHVwb29sICpjcHVwb29sKQoreworICAgIGludCByZXQ7CisgICAgdW5zaWduZWQgaW50IGks
IGNwdTsKKyAgICBjcHVtYXNrX3QgKm9ubGluZTsKKworICAgIGlmICggKHJldCA9IGNwdXBvb2xf
bW92ZV9kb21haW4oY2QsIGNwdXBvb2wpKSApCisgICAgICAgIHJldHVybiByZXQ7CisKKyAgICBm
b3IgKCBpID0gMDsgaSA8IGNkLT5tYXhfdmNwdXM7IGkrKyApCisgICAgeworICAgICAgICBpZiAo
IGNkLT52Y3B1W2ldICkKKyAgICAgICAgICAgIGNvbnRpbnVlOworCisgICAgICAgIG9ubGluZSA9
IGNwdXBvb2xfZG9tYWluX2NwdW1hc2soY2QpOworCisgICAgICAgIGNwdSA9IChpID09IDApID8K
KyAgICAgICAgICAgIGNwdW1hc2tfYW55KG9ubGluZSkgOgorICAgICAgICAgICAgY3B1bWFza19j
eWNsZShjZC0+dmNwdVtpLTFdLT5wcm9jZXNzb3IsIG9ubGluZSk7CisKKyAgICAgICAgaWYgKCAh
dmNwdV9jcmVhdGUoY2QsIGksIGNwdSkgKQorICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cisg
ICAgfQorCisgICAgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KGNkKTsKKyAgICByZXR1cm4g
MDsKK30KKworc3RhdGljIGludCBmb3JrX2hhcF9hbGxvY2F0aW9uKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBkb21haW4gKmNkKQoreworICAgIGludCByYzsKKyAgICBib29sIHByZWVtcHRlZDsK
KyAgICB1bnNpZ25lZCBsb25nIG1iID0gaGFwX2dldF9hbGxvY2F0aW9uKGQpOworCisgICAgaWYg
KCBtYiA9PSBoYXBfZ2V0X2FsbG9jYXRpb24oY2QpICkKKyAgICAgICAgcmV0dXJuIDA7CisKKyAg
ICBwYWdpbmdfbG9jayhjZCk7CisgICAgcmMgPSBoYXBfc2V0X2FsbG9jYXRpb24oY2QsIG1iIDw8
ICgyMCAtIFBBR0VfU0hJRlQpLCAmcHJlZW1wdGVkKTsKKyAgICBwYWdpbmdfdW5sb2NrKGNkKTsK
KworICAgIGlmICggcmMgKQorICAgICAgICByZXR1cm4gcmM7CisKKyAgICBpZiAoIHByZWVtcHRl
ZCApCisgICAgICAgIHJldHVybiAtRVJFU1RBUlQ7CisKKyAgICByZXR1cm4gMDsKK30KKworc3Rh
dGljIGludCBmb3JrX2h2bShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKK3sK
KyAgICBpbnQgcmMsIGk7CisgICAgc3RydWN0IGh2bV9kb21haW5fY29udGV4dCBjID0geyAwIH07
CisgICAgdWludDMyX3QgdHNjX21vZGU7CisgICAgdWludDMyX3QgZ3RzY19raHo7CisgICAgdWlu
dDMyX3QgaW5jYXJuYXRpb247CisgICAgdWludDY0X3QgZWxhcHNlZF9uc2VjOworCisgICAgYy5z
aXplID0gaHZtX3NhdmVfc2l6ZShkKTsKKyAgICBpZiAoIChjLmRhdGEgPSB4bWFsbG9jX2J5dGVz
KGMuc2l6ZSkpID09IE5VTEwgKQorICAgICAgICByZXR1cm4gLUVOT01FTTsKKworICAgIGZvciAo
IGkgPSAwOyBpIDwgSFZNX05SX1BBUkFNUzsgaSsrICkKKyAgICB7CisgICAgICAgIHVpbnQ2NF90
IHZhbHVlID0gMDsKKworICAgICAgICBpZiAoIGh2bV9nZXRfcGFyYW0oZCwgaSwgJnZhbHVlKSB8
fCAhdmFsdWUgKQorICAgICAgICAgICAgY29udGludWU7CisKKyAgICAgICAgaWYgKCAocmMgPSBo
dm1fc2V0X3BhcmFtKGNkLCBpLCB2YWx1ZSkpICkKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAg
IH0KKworICAgIHRzY19nZXRfaW5mbyhkLCAmdHNjX21vZGUsICZlbGFwc2VkX25zZWMsICZndHNj
X2toeiwgJmluY2FybmF0aW9uKTsKKyAgICB0c2Nfc2V0X2luZm8oY2QsIHRzY19tb2RlLCBlbGFw
c2VkX25zZWMsIGd0c2Nfa2h6LCBpbmNhcm5hdGlvbik7CisKKyAgICBpZiAoIChyYyA9IGh2bV9z
YXZlKGQsICZjKSkgKQorICAgICAgICBnb3RvIG91dDsKKworICAgIGMuY3VyID0gMDsKKyAgICBy
YyA9IGh2bV9sb2FkKGNkLCAmYyk7CisKK291dDoKKyAgICB4ZnJlZShjLmRhdGEpOworICAgIHJl
dHVybiByYzsKK30KKworc3RhdGljIGludCBtZW1fc2hhcmluZ19mb3JrKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBkb21haW4gKmNkKQoreworICAgIGludCByYzsKKworICAgIGlmICggIWQtPmNv
bnRyb2xsZXJfcGF1c2VfY291bnQgJiYKKyAgICAgICAgIChyYyA9IGRvbWFpbl9wYXVzZV9ieV9z
eXN0ZW1jb250cm9sbGVyKGQpKSApCisgICAgICAgIHJldHVybiByYzsKKworICAgIGNkLT5tYXhf
cGFnZXMgPSBkLT5tYXhfcGFnZXM7CisgICAgY2QtPm1heF92Y3B1cyA9IGQtPm1heF92Y3B1czsK
KworICAgIC8qIHRoaXMgaXMgcHJlZW1wdGlibGUgc28gaXQncyB0aGUgZmlyc3QgdG8gZ2V0IGRv
bmUgKi8KKyAgICBpZiAoIChyYyA9IGZvcmtfaGFwX2FsbG9jYXRpb24oZCwgY2QpKSApCisgICAg
ICAgIHJldHVybiByYzsKKworICAgIGlmICggKHJjID0gYnJpbmdfdXBfdmNwdXMoY2QsIGQtPmNw
dXBvb2wpKSApCisgICAgICAgIHJldHVybiByYzsKKworICAgIGlmICggKHJjID0gZm9ya19odm0o
ZCwgY2QpKSApCisgICAgICAgIHJldHVybiByYzsKKworICAgIGNkLT5wYXJlbnQgPSBkOworCisg
ICAgcmV0dXJuIDA7Cit9CisKIGludCBtZW1fc2hhcmluZ19tZW1vcChYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHhlbl9tZW1fc2hhcmluZ19vcF90KSBhcmcpCiB7CiAgICAgaW50IHJjOwpAQCAtMTY3
Nyw2ICsxODgzLDM1IEBAIGludCBtZW1fc2hhcmluZ19tZW1vcChYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHhlbl9tZW1fc2hhcmluZ19vcF90KSBhcmcpCiAgICAgICAgICAgICByYyA9IGRlYnVnX2dy
ZWYoZCwgbXNvLnUuZGVidWcudS5ncmVmKTsKICAgICAgICAgICAgIGJyZWFrOwogCisgICAgICAg
IGNhc2UgWEVOTUVNX3NoYXJpbmdfb3BfZm9yazoKKyAgICAgICAgeworICAgICAgICAgICAgc3Ry
dWN0IGRvbWFpbiAqcGQ7CisKKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKKyAgICAgICAgICAg
IGlmICggbXNvLnUuZm9yay5fcGFkWzBdIHx8IG1zby51LmZvcmsuX3BhZFsxXSB8fAorICAgICAg
ICAgICAgICAgICBtc28udS5mb3JrLl9wYWRbMl0gKQorICAgICAgICAgICAgICAgICBnb3RvIG91
dDsKKworICAgICAgICAgICAgcmMgPSByY3VfbG9ja19saXZlX3JlbW90ZV9kb21haW5fYnlfaWQo
bXNvLnUuZm9yay5wYXJlbnRfZG9tYWluLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnBkKTsKKyAgICAgICAgICAgIGlmICggcmMgKQorICAgICAg
ICAgICAgICAgIGJyZWFrOworCisgICAgICAgICAgICBpZiAoICFtZW1fc2hhcmluZ19lbmFibGVk
KHBkKSApCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgaWYgKCAocmMgPSBtZW1fc2hh
cmluZ19jb250cm9sKHBkLCB0cnVlKSkgKQorICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7
CisgICAgICAgICAgICB9CisKKyAgICAgICAgICAgIHJjID0gbWVtX3NoYXJpbmdfZm9yayhwZCwg
ZCk7CisKKyAgICAgICAgICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkKKyAgICAgICAgICAgICAg
ICByYyA9IGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKF9fSFlQRVJWSVNPUl9tZW1vcnlf
b3AsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
bGgiLCBYRU5NRU1fc2hhcmluZ19vcCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGFyZyk7CisgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihw
ZCk7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQogICAgICAgICBkZWZhdWx0OgogICAg
ICAgICAgICAgcmMgPSAtRU5PU1lTOwogICAgICAgICAgICAgYnJlYWs7CmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5kZXggYWVlMDM0
Nzc4NS4uOTc4NzJhN2NjNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtNTAzLDYgKzUwMywxNCBAQCBtZm5fdCBfX2dldF9n
Zm5fdHlwZV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm5f
bCwKIAogICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCB0LCBhLCBxLCBwYWdlX29y
ZGVyLCBOVUxMKTsKIAorICAgIC8qIENoZWNrIGlmIHdlIG5lZWQgdG8gZm9yayB0aGUgcGFnZSAq
LworICAgIGlmICggKHEgJiBQMk1fQUxMT0MpICYmIHAybV9pc19ob2xlKCp0KSAmJgorICAgICAg
ICAgIW1lbV9zaGFyaW5nX2ZvcmtfcGFnZShwMm0tPmRvbWFpbiwgZ2ZuLCAhIShxICYgUDJNX1VO
U0hBUkUpKSApCisgICAgeworICAgICAgICBtZm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwg
dCwgYSwgcSwgcGFnZV9vcmRlciwgTlVMTCk7CisgICAgfQorCisgICAgLyogQ2hlY2sgaWYgd2Ug
bmVlZCB0byB1bnNoYXJlIHRoZSBwYWdlICovCiAgICAgaWYgKCAocSAmIFAyTV9VTlNIQVJFKSAm
JiBwMm1faXNfc2hhcmVkKCp0KSApCiAgICAgewogICAgICAgICBBU1NFUlQocDJtX2lzX2hvc3Rw
Mm0ocDJtKSk7CkBAIC01ODEsNyArNTg5LDggQEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9w
YWdlX2Zyb21fZ2ZuKAogICAgICAgICAgICAgcmV0dXJuIHBhZ2U7CiAKICAgICAgICAgLyogRXJy
b3IgcGF0aDogbm90IGEgc3VpdGFibGUgR0ZOIGF0IGFsbCAqLwotICAgICAgICBpZiAoICFwMm1f
aXNfcmFtKCp0KSAmJiAhcDJtX2lzX3BhZ2luZygqdCkgJiYgIXAybV9pc19wb2QoKnQpICkKKyAg
ICAgICAgaWYgKCAhcDJtX2lzX3JhbSgqdCkgJiYgIXAybV9pc19wYWdpbmcoKnQpICYmICFwMm1f
aXNfcG9kKCp0KSAmJgorICAgICAgICAgICAgICFtZW1fc2hhcmluZ19pc19mb3JrKHAybS0+ZG9t
YWluKSApCiAgICAgICAgICAgICByZXR1cm4gTlVMTDsKICAgICB9CiAKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVt
X3NoYXJpbmcuaAppbmRleCAxODMwMmFkYmZhLi5hNTYxN2M4N2RkIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
ZW1fc2hhcmluZy5oCkBAIC0yNiw4ICsyNiw3IEBACiAKICNpZmRlZiBDT05GSUdfTUVNX1NIQVJJ
TkcKIAotc3RydWN0IG1lbV9zaGFyaW5nX2RvbWFpbgoteworc3RydWN0IG1lbV9zaGFyaW5nX2Rv
bWFpbiB7CiAgICAgYm9vbCBlbmFibGVkOwogCiAgICAgLyoKQEAgLTQwLDYgKzM5LDkgQEAgc3Ry
dWN0IG1lbV9zaGFyaW5nX2RvbWFpbgogI2RlZmluZSBtZW1fc2hhcmluZ19lbmFibGVkKGQpIFwK
ICAgICAoaGFwX2VuYWJsZWQoZCkgJiYgKGQpLT5hcmNoLmh2bS5tZW1fc2hhcmluZy5lbmFibGVk
KQogCisjZGVmaW5lIG1lbV9zaGFyaW5nX2lzX2ZvcmsoZCkgXAorICAgIChtZW1fc2hhcmluZ19l
bmFibGVkKGQpICYmICEhKChkKS0+cGFyZW50KSkKKwogLyogQXVkaXRpbmcgb2YgbWVtb3J5IHNo
YXJpbmcgY29kZT8gKi8KICNpZm5kZWYgTkRFQlVHCiAjZGVmaW5lIE1FTV9TSEFSSU5HX0FVRElU
IDEKQEAgLTkwLDYgKzkyLDkgQEAgaW50IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3Qg
ZG9tYWluICpkLAogICAgIHJldHVybiByYzsKIH0KIAoraW50IG1lbV9zaGFyaW5nX2ZvcmtfcGFn
ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCisgICAgICAgICAgICAgICAgICAgICAgICAg
IGJvb2wgdW5zaGFyaW5nKTsKKwogLyoKICAqIElmIGNhbGxlZCBieSBhIGZvcmVpZ24gZG9tYWlu
LCBwb3NzaWJsZSBlcnJvcnMgYXJlCiAgKiAgIC1FQlVTWSAtPiByaW5nIGZ1bGwKQEAgLTExOSw2
ICsxMjQsNyBAQCBpbnQgcmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCk7
CiAjZWxzZQogCiAjZGVmaW5lIG1lbV9zaGFyaW5nX2VuYWJsZWQoZCkgZmFsc2UKKyNkZWZpbmUg
bWVtX3NoYXJpbmdfaXNfZm9yayhwMm0pIGZhbHNlCiAKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQg
aW50IG1lbV9zaGFyaW5nX2dldF9ucl9zYXZlZF9tZm5zKHZvaWQpCiB7CkBAIC0xNDUsNiArMTUx
LDE2IEBAIGludCBtZW1fc2hhcmluZ19ub3RpZnlfZW5vbWVtKHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGxvbmcgZ2ZuLAogICAgIHJldHVybiAtRU9QTk9UU1VQUDsKIH0KIAorc3RhdGljIGlu
bGluZSBpbnQgbWVtX3NoYXJpbmdfZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWlu
ICpjZCwgYm9vbCB2Y3B1KQoreworICAgIHJldHVybiAtRU9QTk9UU1VQUDsKK30KKworc3RhdGlj
IGlubGluZSBpbnQgbWVtX3NoYXJpbmdfZm9ya19wYWdlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90
IGdmbiwgYm9vbCBsb2NrKQoreworICAgIHJldHVybiAtRU9QTk9UU1VQUDsKK30KKwogI2VuZGlm
CiAKICNlbmRpZiAvKiBfX01FTV9TSEFSSU5HX0hfXyAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvcHVibGljL21lbW9yeS5oIGIveGVuL2luY2x1ZGUvcHVibGljL21lbW9yeS5oCmluZGV4IGNm
ZGRhNmUyYTguLjkwYTNmNDQ5OGUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1v
cnkuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgKQEAgLTQ4Miw2ICs0ODIsNyBA
QCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fbWVtX2FjY2Vzc19vcF90KTsKICNkZWZpbmUg
WEVOTUVNX3NoYXJpbmdfb3BfYWRkX3BoeXNtYXAgICAgICAgNgogI2RlZmluZSBYRU5NRU1fc2hh
cmluZ19vcF9hdWRpdCAgICAgICAgICAgICA3CiAjZGVmaW5lIFhFTk1FTV9zaGFyaW5nX29wX3Jh
bmdlX3NoYXJlICAgICAgIDgKKyNkZWZpbmUgWEVOTUVNX3NoYXJpbmdfb3BfZm9yayAgICAgICAg
ICAgICAgOQogCiAjZGVmaW5lIFhFTk1FTV9TSEFSSU5HX09QX1NfSEFORExFX0lOVkFMSUQgICgt
MTApCiAjZGVmaW5lIFhFTk1FTV9TSEFSSU5HX09QX0NfSEFORExFX0lOVkFMSUQgICgtOSkKQEAg
LTUzMiw2ICs1MzMsMTAgQEAgc3RydWN0IHhlbl9tZW1fc2hhcmluZ19vcCB7CiAgICAgICAgICAg
ICAgICAgdWludDMyX3QgZ3JlZjsgICAgIC8qIElOOiBncmVmIHRvIGRlYnVnICAgICAgICAgKi8K
ICAgICAgICAgICAgIH0gdTsKICAgICAgICAgfSBkZWJ1ZzsKKyAgICAgICAgc3RydWN0IG1lbV9z
aGFyaW5nX29wX2ZvcmsgeworICAgICAgICAgICAgZG9taWRfdCBwYXJlbnRfZG9tYWluOworICAg
ICAgICAgICAgdWludDE2X3QgX3BhZFszXTsgICAgICAgICAgICAgICAgLyogTXVzdCBiZSBzZXQg
dG8gMCAqLworICAgICAgICB9IGZvcms7CiAgICAgfSB1OwogfTsKIHR5cGVkZWYgc3RydWN0IHhl
bl9tZW1fc2hhcmluZ19vcCB4ZW5fbWVtX3NoYXJpbmdfb3BfdDsKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggMmQxN2M4
NDkxNS4uZGFkNjcxNWQxNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKQEAgLTQ1NSw2ICs0NTUsNyBAQCBzdHJ1Y3QgZG9t
YWluCiAgICAgLyogTWVtb3J5IHNoYXJpbmcgc3VwcG9ydCAqLwogI2lmZGVmIENPTkZJR19NRU1f
U0hBUklORwogICAgIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZtX2V2ZW50X3NoYXJlOworICAg
IHN0cnVjdCBkb21haW4gKnBhcmVudDsgLyogVk0gZm9yayBwYXJlbnQgKi8KICNlbmRpZgogICAg
IC8qIE1lbW9yeSBwYWdpbmcgc3VwcG9ydCAqLwogI2lmZGVmIENPTkZJR19IQVNfTUVNX1BBR0lO
RwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
