Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33557D944
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:21:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8B6-00020K-IF; Thu, 01 Aug 2019 10:19:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TV56=V5=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1ht8B4-0001ys-RP
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:19:18 +0000
X-Inumbo-ID: d06fd294-b445-11e9-850c-6f9d3012c21b
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d06fd294-b445-11e9-850c-6f9d3012c21b;
 Thu, 01 Aug 2019 10:19:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="175207950"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 01 Aug 2019 03:19:13 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:22:47 +0800
Message-Id: <1564654971-31328-13-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v8 12/16] microcode: split out apply_microcode()
 from cpu_request_microcode()
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIGxhdGUgbWljcm9jb2RlIGxvYWRpbmcsIGFwcGx5X21pY3JvY29kZSgpIGlzIGludm9r
ZWQgaW4KY3B1X3JlcXVlc3RfbWljcm9jb2RlKCkuIFRvIG1ha2UgbGF0ZSBtaWNyb2NvZGUgdXBk
YXRlIG1vcmUgcmVsaWFibGUsCndlIHdhbnQgdG8gcHV0IHRoZSBhcHBseV9taWNyb2NvZGUoKSBp
bnRvIHN0b3BfbWFjaGluZSBjb250ZXh0LiBTbwp3ZSBzcGxpdCBvdXQgaXQgZnJvbSBjcHVfcmVx
dWVzdF9taWNyb2NvZGUoKS4gSW4gZ2VuZXJhbCwgZm9yIGJvdGgKZWFybHkgbG9hZGluZyBvbiBC
U1AgYW5kIGxhdGUgbG9hZGluZywgY3B1X3JlcXVlc3RfbWljcm9jb2RlKCkgaXMKY2FsbGVkIGZp
cnN0IHRvIGdldCB0aGUgbWF0Y2hpbmcgbWljcm9jb2RlIHVwZGF0ZSBjb250YWluZWQgYnkKdGhl
IGJsb2IgYW5kIHRoZW4gYXBwbHlfbWljcm9jb2RlKCkgaXMgaW52b2tlZCBleHBsaWNpdGx5IG9u
IGVhY2gKY3B1IGluIGNvbW1vbiBjb2RlLgoKR2l2ZW4gdGhhdCBhbGwgQ1BVcyBhcmUgc3VwcG9z
ZWQgdG8gaGF2ZSB0aGUgc2FtZSBzaWduYXR1cmUsIHBhcnNpbmcKbWljcm9jb2RlIG9ubHkgbmVl
ZHMgdG8gYmUgZG9uZSBvbmNlLiBTbyBjcHVfcmVxdWVzdF9taWNyb2NvZGUoKSBpcwphbHNvIG1v
dmVkIG91dCBvZiBtaWNyb2NvZGVfdXBkYXRlX2NwdSgpLgoKSW4gc29tZSBjYXNlcyAoZS5nLiBh
IGJyb2tlbiBiaW9zKSwgdGhlIHN5c3RlbSBtYXkgaGF2ZSBtdWx0aXBsZQpyZXZpc2lvbnMgb2Yg
bWljcm9jb2RlIHVwZGF0ZS4gU28gd2Ugd291bGQgdHJ5IHRvIGxvYWQgYSBtaWNyb2NvZGUKdXBk
YXRlIGFzIGxvbmcgYXMgaXQgY292ZXJzIGN1cnJlbnQgY3B1LiBBbmQgaWYgYSBjcHUgbG9hZHMg
dGhpcyBwYXRjaApzdWNjZXNzZnVsbHksIHRoZSBwYXRjaCB3b3VsZCBiZSBzdG9yZWQgaW50byB0
aGUgcGF0Y2ggY2FjaGUuCgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwu
Y29tPgotLS0KQ2hhbmdlcyBpbiB2ODoKIC0gZGl2aWRlIHRoZSBvcmlnaW5hbCBwYXRjaCBpbnRv
IHRocmVlIHBhdGNoZXMgdG8gaW1wcm92ZSByZWFkYWJpbGl0eQogLSBsb2FkIGFuIHVwZGF0ZSBv
biBlYWNoIGNwdSBhcyBsb25nIGFzIHRoZSB1cGRhdGUgY292ZXJzIGN1cnJlbnQgY3B1CiAtIHN0
b3JlIGFuIHVwZGF0ZSBhZnRlciB0aGUgZmlyc3Qgc3VjY2Vzc2Z1bCBsb2FkaW5nIG9uIGEgQ1BV
CiAtIE1ha2Ugc3VyZSB0aGUgY3VycmVudCBDUFUgKGVzcGVjaWFsbHkgcGYgdmFsdWUpIGlzIGNv
dmVyZWQKIGJ5IHVwZGF0ZXMuCgpjaGFuZ2VzIGluIHY3OgogLSB0byBoYW5kbGUgbG9hZCBmYWls
dXJlLCB1bnZhbGlkYXRlZCBwYXRjaGVzIHdvbid0IGJlIGNhY2hlZC4gVGhleQogYXJlIHBhc3Nl
ZCBhcyBmdW5jdGlvbiBhcmd1bWVudHMuIFNvIGlmIHVwZGF0ZSBmYWlsZWQsIHdlIG5lZWRuJ3QK
IGFueSBjbGVhbnVwIHRvIG1pY3JvY29kZSBjYWNoZS4KLS0tCiB4ZW4vYXJjaC94ODYvbWljcm9j
b2RlLmMgICAgICAgIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgICAgfCAgMzggKysrKystLS0tCiB4ZW4v
YXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMgIHwgIDcwICsrKysrKysrLS0tLS0tLS0KIHhlbi9p
bmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmggfCAgIDUgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTg2
IGluc2VydGlvbnMoKyksIDEwOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbWljcm9jb2RlLmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKaW5kZXggMDNiYzBhYS4u
ZjBiMWUzOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9taWNyb2NvZGUuYwpAQCAtMTg5LDEyICsxODksMjAgQEAgc3RhdGljIERFRklORV9T
UElOTE9DSyhtaWNyb2NvZGVfbXV0ZXgpOwogCiBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgY3B1X3Np
Z25hdHVyZSwgY3B1X3NpZyk7CiAKLXN0cnVjdCBtaWNyb2NvZGVfaW5mbyB7Ci0gICAgdW5zaWdu
ZWQgaW50IGNwdTsKLSAgICB1aW50MzJfdCBidWZmZXJfc2l6ZTsKLSAgICBpbnQgZXJyb3I7Ci0g
ICAgY2hhciBidWZmZXJbMV07Ci19OworLyoKKyAqIFJldHVybiBhIHBhdGNoIHRoYXQgY292ZXJz
IGN1cnJlbnQgQ1BVLiBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgcGF0Y2hlcywKKyAqIHJldHVybiB0
aGUgb25lIHdpdGggdGhlIGhpZ2hlc3QgcmV2aXNpb24gbnVtYmVyLiBSZXR1cm4gZXJyb3IgSWYg
bm8KKyAqIHBhdGNoIGlzIGZvdW5kIGFuZCBhbiBlcnJvciBvY2N1cnMgZHVyaW5nIHRoZSBwYXJz
aW5nIHByb2Nlc3MuIE90aGVyd2lzZQorICogcmV0dXJuIE5VTEwuCisgKi8KK3N0YXRpYyBzdHJ1
Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfcGFyc2VfYmxvYihjb25zdCBjaGFyICpidWYs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgbGVuKQoreworICAgIGlmICggbGlrZWx5KCFtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2Nw
dV9pbmZvKCZ0aGlzX2NwdShjcHVfc2lnKSkpICkKKyAgICAgICAgcmV0dXJuIG1pY3JvY29kZV9v
cHMtPmNwdV9yZXF1ZXN0X21pY3JvY29kZShidWYsIGxlbik7CisKKyAgICByZXR1cm4gTlVMTDsK
K30KIAogaW50IG1pY3JvY29kZV9yZXN1bWVfY3B1KHZvaWQpCiB7CkBAIC0yMjAsMTMgKzIyOCw2
IEBAIHZvaWQgbWljcm9jb2RlX2ZyZWVfcGF0Y2goc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWlj
cm9jb2RlX3BhdGNoKQogICAgIHhmcmVlKG1pY3JvY29kZV9wYXRjaCk7CiB9CiAKLWNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9nZXRfY2FjaGUodm9pZCkKLXsKLSAgICBB
U1NFUlQoc3Bpbl9pc19sb2NrZWQoJm1pY3JvY29kZV9tdXRleCkpOwotCi0gICAgcmV0dXJuIG1p
Y3JvY29kZV9jYWNoZTsKLX0KLQogLyogUmV0dXJuIHRydWUgaWYgY2FjaGUgZ2V0cyB1cGRhdGVk
LiBPdGhlcndpc2UsIHJldHVybiBmYWxzZSAqLwogYm9vbCBtaWNyb2NvZGVfdXBkYXRlX2NhY2hl
KHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQogewpAQCAtMjUwLDQ5ICsyNTEsODggQEAg
Ym9vbCBtaWNyb2NvZGVfdXBkYXRlX2NhY2hlKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNo
KQogICAgIHJldHVybiB0cnVlOwogfQogCi1zdGF0aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1
KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IHNpemUpCisvKgorICogTG9hZCBhIG1pY3JvY29kZSB1
cGRhdGUgdG8gY3VycmVudCBDUFUuCisgKgorICogSWYgbm8gcGF0Y2ggaXMgcHJvdmlkZWQsIHRo
ZSBjYWNoZWQgcGF0Y2ggd2lsbCBiZSBsb2FkZWQuIE1pY3JvY29kZSB1cGRhdGUKKyAqIGR1cmlu
ZyBBUHMgYnJpbmd1cCBhbmQgQ1BVIHJlc3VtaW5nIGZhbGxzIGludG8gdGhpcyBjYXNlLgorICov
CitzdGF0aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhdGNoKQogewotICAgIGludCBlcnI7Ci0gICAgdW5zaWduZWQgaW50IGNwdSA9IHNt
cF9wcm9jZXNzb3JfaWQoKTsKLSAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0gJnBlcl9j
cHUoY3B1X3NpZywgY3B1KTsKKyAgICBpbnQgZXJyID0gbWljcm9jb2RlX29wcy0+Y29sbGVjdF9j
cHVfaW5mbygmdGhpc19jcHUoY3B1X3NpZykpOworCisgICAgaWYgKCB1bmxpa2VseShlcnIpICkK
KyAgICAgICAgcmV0dXJuIGVycjsKIAogICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4KTsK
IAotICAgIGVyciA9IG1pY3JvY29kZV9vcHMtPmNvbGxlY3RfY3B1X2luZm8oc2lnKTsKLSAgICBp
ZiAoIGxpa2VseSghZXJyKSApCi0gICAgICAgIGVyciA9IG1pY3JvY29kZV9vcHMtPmNwdV9yZXF1
ZXN0X21pY3JvY29kZShidWYsIHNpemUpOworICAgIGlmICggcGF0Y2ggKQorICAgIHsKKyAgICAg
ICAgLyoKKyAgICAgICAgICogSWYgYSBwYXRjaCBpcyBzcGVjaWZpZWQsIGl0IHNob3VsZCBoYXMg
bmV3ZXIgcmV2aXNpb24gdGhhbgorICAgICAgICAgKiB0aGF0IG9mIHRoZSBwYXRjaCBjYWNoZWQu
CisgICAgICAgICAqLworICAgICAgICBpZiAoIG1pY3JvY29kZV9jYWNoZSAmJgorICAgICAgICAg
ICAgIG1pY3JvY29kZV9vcHMtPmNvbXBhcmVfcGF0Y2gocGF0Y2gsIG1pY3JvY29kZV9jYWNoZSkg
IT0gTkVXX1VDT0RFICkKKyAgICAgICAgeworICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1pY3Jv
Y29kZV9tdXRleCk7CisgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgfQorICAg
IH0KKyAgICBlbHNlIGlmICggbWljcm9jb2RlX2NhY2hlICkKKyAgICAgICAgcGF0Y2ggPSBtaWNy
b2NvZGVfY2FjaGU7CisgICAgZWxzZQorICAgICAgICAvKiBObyBwYXRjaCB0byB1cGRhdGUgKi8K
KyAgICAgICAgZXJyID0gLUVOT0VOVDsKKworICAgIGlmICggcGF0Y2ggKQorICAgIHsKKyAgICAg
ICAgZXJyID0gbWljcm9jb2RlX29wcy0+YXBwbHlfbWljcm9jb2RlKHBhdGNoKTsKKyAgICAgICAg
LyogY2xlYW4gdXAgcGF0Y2ggY2FjaGUgaWYgd2UgZmFpbGVkIHRvIGxvYWQgdGhlIGNhY2hlZCBw
YXRjaCAqLworICAgICAgICBpZiAoIHBhdGNoID09IG1pY3JvY29kZV9jYWNoZSAmJiBlcnIgPT0g
LUVJTyApCisgICAgICAgIHsKKyAgICAgICAgICAgIG1pY3JvY29kZV9mcmVlX3BhdGNoKG1pY3Jv
Y29kZV9jYWNoZSk7CisgICAgICAgICAgICBtaWNyb2NvZGVfY2FjaGUgPSBOVUxMOworICAgICAg
ICB9CisgICAgfQorCiAgICAgc3Bpbl91bmxvY2soJm1pY3JvY29kZV9tdXRleCk7CiAKICAgICBy
ZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgbG9uZyBkb19taWNyb2NvZGVfdXBkYXRlKHZvaWQgKl9p
bmZvKQorc3RhdGljIGxvbmcgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKIHsKLSAg
ICBzdHJ1Y3QgbWljcm9jb2RlX2luZm8gKmluZm8gPSBfaW5mbzsKLSAgICBpbnQgZXJyb3I7Ci0K
LSAgICBCVUdfT04oaW5mby0+Y3B1ICE9IHNtcF9wcm9jZXNzb3JfaWQoKSk7CisgICAgdW5zaWdu
ZWQgaW50IGNwdTsKIAotICAgIGVycm9yID0gbWljcm9jb2RlX3VwZGF0ZV9jcHUoaW5mby0+YnVm
ZmVyLCBpbmZvLT5idWZmZXJfc2l6ZSk7Ci0gICAgaWYgKCBlcnJvciApCi0gICAgICAgIGluZm8t
PmVycm9yID0gZXJyb3I7CisgICAgLyogc3RvcmUgdGhlIHBhdGNoIGFmdGVyIGEgc3VjY2Vzc2Z1
bCBsb2FkaW5nICovCisgICAgaWYgKCAhbWljcm9jb2RlX3VwZGF0ZV9jcHUocGF0Y2gpICYmIHBh
dGNoICkKKyAgICB7CisgICAgICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4KTsKKyAgICAg
ICAgbWljcm9jb2RlX3VwZGF0ZV9jYWNoZShwYXRjaCk7CisgICAgICAgIHNwaW5fdW5sb2NrKCZt
aWNyb2NvZGVfbXV0ZXgpOworICAgICAgICBwYXRjaCA9IE5VTEw7CisgICAgfQogCiAgICAgaWYg
KCBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlICkKICAgICAgICAgbWljcm9jb2RlX29wcy0+ZW5k
X3VwZGF0ZSgpOwogCi0gICAgaW5mby0+Y3B1ID0gY3B1bWFza19uZXh0KGluZm8tPmNwdSwgJmNw
dV9vbmxpbmVfbWFwKTsKLSAgICBpZiAoIGluZm8tPmNwdSA8IG5yX2NwdV9pZHMgKQotICAgICAg
ICByZXR1cm4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdShpbmZvLT5jcHUsIGRvX21pY3JvY29k
ZV91cGRhdGUsIGluZm8pOworICAgIGNwdSA9IGNwdW1hc2tfbmV4dChzbXBfcHJvY2Vzc29yX2lk
KCksICZjcHVfb25saW5lX21hcCk7CisgICAgaWYgKCBjcHUgPCBucl9jcHVfaWRzICkKKyAgICAg
ICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoY3B1LCBkb19taWNyb2NvZGVfdXBk
YXRlLCBwYXRjaCk7CisKKyAgICAvKiBGcmVlIHRoZSBwYXRjaCBpZiBubyBDUFUgaGFzIGxvYWRl
ZCBpdCBzdWNjZXNzZnVsbHkuICovCisgICAgaWYgKCBwYXRjaCApCisgICAgICAgIG1pY3JvY29k
ZV9mcmVlX3BhdGNoKHBhdGNoKTsKIAotICAgIGVycm9yID0gaW5mby0+ZXJyb3I7Ci0gICAgeGZy
ZWUoaW5mbyk7Ci0gICAgcmV0dXJuIGVycm9yOworICAgIHJldHVybiAwOwogfQogCiBpbnQgbWlj
cm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5z
aWduZWQgbG9uZyBsZW4pCiB7CiAgICAgaW50IHJldDsKLSAgICBzdHJ1Y3QgbWljcm9jb2RlX2lu
Zm8gKmluZm87CisgICAgdm9pZCAqYnVmZmVyOworICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gg
KnBhdGNoOwogCiAgICAgaWYgKCBsZW4gIT0gKHVpbnQzMl90KWxlbiApCiAgICAgICAgIHJldHVy
biAtRTJCSUc7CkBAIC0zMDAsMzIgKzM0MCw0NCBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5f
R1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCiAg
ICAgaWYgKCBtaWNyb2NvZGVfb3BzID09IE5VTEwgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsK
IAotICAgIGluZm8gPSB4bWFsbG9jX2J5dGVzKHNpemVvZigqaW5mbykgKyBsZW4pOwotICAgIGlm
ICggaW5mbyA9PSBOVUxMICkKKyAgICBidWZmZXIgPSB4bWFsbG9jX2J5dGVzKGxlbik7CisgICAg
aWYgKCAhYnVmZmVyICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKLSAgICByZXQgPSBjb3B5
X2Zyb21fZ3Vlc3QoaW5mby0+YnVmZmVyLCBidWYsIGxlbik7Ci0gICAgaWYgKCByZXQgIT0gMCAp
CisgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoYnVmZmVyLCBidWYsIGxlbikgKQogICAgIHsKLSAg
ICAgICAgeGZyZWUoaW5mbyk7Ci0gICAgICAgIHJldHVybiByZXQ7CisgICAgICAgIHJldCA9IC1F
RkFVTFQ7CisgICAgICAgIGdvdG8gZnJlZTsKICAgICB9CiAKLSAgICBpbmZvLT5idWZmZXJfc2l6
ZSA9IGxlbjsKLSAgICBpbmZvLT5lcnJvciA9IDA7Ci0gICAgaW5mby0+Y3B1ID0gY3B1bWFza19m
aXJzdCgmY3B1X29ubGluZV9tYXApOwotCiAgICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5zdGFydF91
cGRhdGUgKQogICAgIHsKICAgICAgICAgcmV0ID0gbWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRl
KCk7CiAgICAgICAgIGlmICggcmV0ICE9IDAgKQotICAgICAgICB7Ci0gICAgICAgICAgICB4ZnJl
ZShpbmZvKTsKLSAgICAgICAgICAgIHJldHVybiByZXQ7Ci0gICAgICAgIH0KKyAgICAgICAgICAg
IGdvdG8gZnJlZTsKKyAgICB9CisKKyAgICBwYXRjaCA9IG1pY3JvY29kZV9wYXJzZV9ibG9iKGJ1
ZmZlciwgbGVuKTsKKyAgICBpZiAoIElTX0VSUihwYXRjaCkgKQorICAgIHsKKyAgICAgICAgcmV0
ID0gUFRSX0VSUihwYXRjaCk7CisgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiUGFyc2luZyBt
aWNyb2NvZGUgYmxvYiBlcnJvciAlZFxuIiwgcmV0KTsKKyAgICAgICAgZ290byBmcmVlOwogICAg
IH0KIAotICAgIHJldHVybiBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KGluZm8tPmNwdSwgZG9f
bWljcm9jb2RlX3VwZGF0ZSwgaW5mbyk7CisgICAgaWYgKCAhcGF0Y2ggKQorICAgIHsKKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19JTkZPICJObyB1Y29kZSBmb3VuZC4gVXBkYXRlIGFib3J0ZWQhXG4i
KTsKKyAgICAgICAgcmV0ID0gLUVJTlZBTDsKKyAgICAgICAgZ290byBmcmVlOworICAgIH0KKwor
ICAgIHJldCA9IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoY3B1bWFza19maXJzdCgmY3B1X29u
bGluZV9tYXApLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG9fbWljcm9j
b2RlX3VwZGF0ZSwgcGF0Y2gpOworCisgZnJlZToKKyAgICB4ZnJlZShidWZmZXIpOworICAgIHJl
dHVybiByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgX19pbml0IG1pY3JvY29kZV9pbml0KHZvaWQpCkBA
IC0zNzIsMTUgKzQyNCw0MCBAQCBpbnQgX19pbml0IGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1
KGJvb2wgc3RhcnRfdXBkYXRlKQogCiAgICAgbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5m
bygmdGhpc19jcHUoY3B1X3NpZykpOwogCisgICAgaWYgKCAhc3RhcnRfdXBkYXRlICkKKyAgICAg
ICAgcmV0dXJuIG1pY3JvY29kZV91cGRhdGVfY3B1KE5VTEwpOworCiAgICAgaWYgKCBkYXRhICkK
ICAgICB7Ci0gICAgICAgIGlmICggc3RhcnRfdXBkYXRlICYmIG1pY3JvY29kZV9vcHMtPnN0YXJ0
X3VwZGF0ZSApCisgICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoOworCisgICAg
ICAgIGlmICggbWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlICkKICAgICAgICAgICAgIHJjID0g
bWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlKCk7CiAKICAgICAgICAgaWYgKCByYyApCiAgICAg
ICAgICAgICByZXR1cm4gcmM7CiAKLSAgICAgICAgcmV0dXJuIG1pY3JvY29kZV91cGRhdGVfY3B1
KGRhdGEsIGxlbik7CisgICAgICAgIHBhdGNoID0gbWljcm9jb2RlX3BhcnNlX2Jsb2IoZGF0YSwg
bGVuKTsKKyAgICAgICAgaWYgKCBJU19FUlIocGF0Y2gpICkKKyAgICAgICAgeworICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9yICVsZFxu
IiwKKyAgICAgICAgICAgICAgICAgICBQVFJfRVJSKHBhdGNoKSk7CisgICAgICAgICAgICByZXR1
cm4gUFRSX0VSUihwYXRjaCk7CisgICAgICAgIH0KKworICAgICAgICBpZiAoICFwYXRjaCApCisg
ICAgICAgIHsKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTm8gdWNvZGUgZm91bmQu
IFVwZGF0ZSBhYm9ydGVkIVxuIik7CisgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAg
ICAgfQorCisgICAgICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4KTsKKyAgICAgICAgcmMg
PSBtaWNyb2NvZGVfdXBkYXRlX2NhY2hlKHBhdGNoKTsKKyAgICAgICAgc3Bpbl91bmxvY2soJm1p
Y3JvY29kZV9tdXRleCk7CisKKyAgICAgICAgQVNTRVJUKHJjKTsKKworICAgICAgICByZXR1cm4g
bWljcm9jb2RlX3VwZGF0ZV9jcHUoTlVMTCk7CiAgICAgfQogICAgIGVsc2UKICAgICAgICAgcmV0
dXJuIC1FTk9NRU07CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jIGIv
eGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYwppbmRleCBmZWQwNDRhLi45M2QyYTk4IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
aWNyb2NvZGVfYW1kLmMKQEAgLTQ0Niw5ICs0NDYsMTEgQEAgc3RhdGljIGJvb2xfdCBjaGVja19m
aW5hbF9wYXRjaF9sZXZlbHModW5zaWduZWQgaW50IGNwdSkKICAgICByZXR1cm4gMDsKIH0KIAot
c3RhdGljIGludCBjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3Qg
YnVmc2l6ZSkKK3N0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9taWNy
b2NvZGUoY29uc3Qgdm9pZCAqYnVmLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnVmc2l6ZSkKIHsKICAgICBzdHJ1Y3QgbWljcm9j
b2RlX2FtZCAqbWNfYW1kOworICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoID0gTlVM
TDsKICAgICBzaXplX3Qgb2Zmc2V0ID0gMDsKICAgICBpbnQgZXJyb3IgPSAwOwogICAgIHVuc2ln
bmVkIGludCBjdXJyZW50X2NwdV9pZDsKQEAgLTU1MywxOSArNTU1LDIyIEBAIHN0YXRpYyBpbnQg
Y3B1X3JlcXVlc3RfbWljcm9jb2RlKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGJ1ZnNpemUpCiAg
ICAgICAgICAgICBicmVhazsKICAgICAgICAgfQogCi0gICAgICAgIC8qIFVwZGF0ZSBjYWNoZSBp
ZiB0aGlzIHBhdGNoIGNvdmVycyBjdXJyZW50IENQVSAqLwotICAgICAgICBpZiAoIG1pY3JvY29k
ZV9maXRzKG5ld19wYXRjaC0+bWNfYW1kKSAhPSBNSVNfVUNPREUgKQotICAgICAgICAgICAgbWlj
cm9jb2RlX3VwZGF0ZV9jYWNoZShuZXdfcGF0Y2gpOwotICAgICAgICBlbHNlCi0gICAgICAgICAg
ICBtaWNyb2NvZGVfZnJlZV9wYXRjaChuZXdfcGF0Y2gpOwotCi0gICAgICAgIGlmICggbWF0Y2hf
Y3B1KG1pY3JvY29kZV9nZXRfY2FjaGUoKSkgKQorICAgICAgICAvKgorICAgICAgICAgKiBJZiB0
aGUgbmV3IHBhdGNoIGNvdmVycyBjdXJyZW50IENQVSwgY29tcGFyZSBwYXRjaGVzIGFuZCBzdG9y
ZSB0aGUKKyAgICAgICAgICogb25lIHdpdGggaGlnaGVyIHJldmlzaW9uLgorICAgICAgICAgKi8K
KyAgICAgICAgaWYgKCAobWljcm9jb2RlX2ZpdHMobmV3X3BhdGNoLT5tY19hbWQpICE9IE1JU19V
Q09ERSkgJiYKKyAgICAgICAgICAgICAoIXBhdGNoIHx8IChjb21wYXJlX3BhdGNoKG5ld19wYXRj
aCwgcGF0Y2gpID09IE5FV19VQ09ERSkpICkKICAgICAgICAgewotICAgICAgICAgICAgZXJyb3Ig
PSBhcHBseV9taWNyb2NvZGUobWljcm9jb2RlX2dldF9jYWNoZSgpKTsKLSAgICAgICAgICAgIGlm
ICggZXJyb3IgKQotICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgc3RydWN0IG1p
Y3JvY29kZV9wYXRjaCAqdG1wID0gcGF0Y2g7CisKKyAgICAgICAgICAgIHBhdGNoID0gbmV3X3Bh
dGNoOworICAgICAgICAgICAgbmV3X3BhdGNoID0gdG1wOwogICAgICAgICB9CiAKKyAgICAgICAg
aWYgKCBuZXdfcGF0Y2ggKQorICAgICAgICAgICAgbWljcm9jb2RlX2ZyZWVfcGF0Y2gobmV3X3Bh
dGNoKTsKKwogICAgICAgICBpZiAoIG9mZnNldCA+PSBidWZzaXplICkKICAgICAgICAgICAgIGJy
ZWFrOwogCkBAIC01OTksMTMgKzYwNCwxMCBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3Jv
Y29kZShjb25zdCB2b2lkICpidWYsIHNpemVfdCBidWZzaXplKQogICAgIHhmcmVlKG1jX2FtZCk7
CiAKICAgb3V0OgotICAgIC8qCi0gICAgICogSW4gc29tZSBjYXNlcyB3ZSBtYXkgcmV0dXJuIGFu
IGVycm9yIGV2ZW4gaWYgcHJvY2Vzc29yJ3MgbWljcm9jb2RlIGhhcwotICAgICAqIGJlZW4gdXBk
YXRlZC4gRm9yIGV4YW1wbGUsIHRoZSBmaXJzdCBwYXRjaCBpbiBhIGNvbnRhaW5lciBmaWxlIGlz
IGxvYWRlZAotICAgICAqIHN1Y2Nlc3NmdWxseSBidXQgc3Vic2VxdWVudCBjb250YWluZXIgZmls
ZSBwcm9jZXNzaW5nIGVuY291bnRlcnMgYQotICAgICAqIGZhaWx1cmUuCi0gICAgICovCi0gICAg
cmV0dXJuIGVycm9yOworICAgIGlmICggZXJyb3IgJiYgIXBhdGNoICkKKyAgICAgICAgcGF0Y2gg
PSBFUlJfUFRSKGVycm9yKTsKKworICAgIHJldHVybiBwYXRjaDsKIH0KIAogc3RhdGljIGludCBz
dGFydF91cGRhdGUodm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50
ZWwuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwppbmRleCBiY2I0OGJjLi44Nzgw
YmUwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKKysrIGIveGVu
L2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCkBAIC0yNzksMTUgKzI3OSw5IEBAIHN0YXRpYyBl
bnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgY29tcGFyZV9wYXRjaCgKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvbGRfaGVhZGVyLT5wZiwgb2xkX2hlYWRlci0+cmV2KTsKIH0K
IAotLyoKLSAqIHJldHVybiAwIC0gbm8gdXBkYXRlIGZvdW5kCi0gKiByZXR1cm4gMSAtIGZvdW5k
IHVwZGF0ZQotICogcmV0dXJuIDwgMCAtIGVycm9yCi0gKi8KLXN0YXRpYyBpbnQgZ2V0X21hdGNo
aW5nX21pY3JvY29kZShjb25zdCB2b2lkICptYykKK3N0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3Bh
dGNoICphbGxvY19taWNyb2NvZGVfcGF0Y2goCisgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9o
ZWFkZXJfaW50ZWwgKm1jX2hlYWRlcikKIHsKLSAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2ln
ID0gJnRoaXNfY3B1KGNwdV9zaWcpOwotICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVy
X2ludGVsICptY19oZWFkZXIgPSBtYzsKICAgICB1bnNpZ25lZCBsb25nIHRvdGFsX3NpemUgPSBn
ZXRfdG90YWxzaXplKG1jX2hlYWRlcik7CiAgICAgdm9pZCAqbmV3X21jID0geG1hbGxvY19ieXRl
cyh0b3RhbF9zaXplKTsKICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpuZXdfcGF0Y2ggPSB4
bWFsbG9jKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gpOwpAQCAtMjk2LDI2ICsyOTAsMTIgQEAgc3Rh
dGljIGludCBnZXRfbWF0Y2hpbmdfbWljcm9jb2RlKGNvbnN0IHZvaWQgKm1jKQogICAgIHsKICAg
ICAgICAgeGZyZWUobmV3X3BhdGNoKTsKICAgICAgICAgeGZyZWUobmV3X21jKTsKLSAgICAgICAg
cmV0dXJuIC1FTk9NRU07CisgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogICAgIH0K
LSAgICBtZW1jcHkobmV3X21jLCBtYywgdG90YWxfc2l6ZSk7CisgICAgbWVtY3B5KG5ld19tYywg
bWNfaGVhZGVyLCB0b3RhbF9zaXplKTsKICAgICBuZXdfcGF0Y2gtPm1jX2ludGVsID0gbmV3X21j
OwogCi0gICAgLyogTWFrZSBzdXJlIHRoYXQgdGhpcyBwYXRjaCBjb3ZlcnMgY3VycmVudCBDUFUg
Ki8KLSAgICBpZiAoIG1pY3JvY29kZV91cGRhdGVfbWF0Y2goJm5ld19wYXRjaC0+bWNfaW50ZWwt
Pmhkciwgc2lnLT5zaWcsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpZy0+cGYs
IHNpZy0+cmV2KSA9PSBNSVNfVUNPREUgKQotICAgIHsKLSAgICAgICAgbWljcm9jb2RlX2ZyZWVf
cGF0Y2gobmV3X3BhdGNoKTsKLSAgICAgICAgcmV0dXJuIDA7Ci0gICAgfQotCi0gICAgbWljcm9j
b2RlX3VwZGF0ZV9jYWNoZShuZXdfcGF0Y2gpOwotCi0gICAgcHJfZGVidWcoIm1pY3JvY29kZTog
Q1BVJWQgZm91bmQgYSBtYXRjaGluZyBtaWNyb2NvZGUgdXBkYXRlIHdpdGgiCi0gICAgICAgICAg
ICAgIiB2ZXJzaW9uICUjeCAoY3VycmVudD0lI3gpXG4iLAotICAgICAgICAgICAgIHNtcF9wcm9j
ZXNzb3JkX2lkKCksIG1jX2hlYWRlci0+cmV2LCBzaWctPnJldik7Ci0KLSAgICByZXR1cm4gMTsK
KyAgICByZXR1cm4gbmV3X3BhdGNoOwogfQogCiBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29kZShj
b25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKQEAgLTM5MSwyNiArMzcxLDQ2IEBA
IHN0YXRpYyBsb25nIGdldF9uZXh0X3Vjb2RlX2Zyb21fYnVmZmVyKHZvaWQgKiptYywgY29uc3Qg
dTggKmJ1ZiwKICAgICByZXR1cm4gb2Zmc2V0ICsgdG90YWxfc2l6ZTsKIH0KIAotc3RhdGljIGlu
dCBjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSkKK3N0
YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29uc3Qg
dm9pZCAqYnVmLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaXplX3Qgc2l6ZSkKIHsKICAgICBsb25nIG9mZnNldCA9IDA7CiAgICAgaW50IGVy
cm9yID0gMDsKICAgICB2b2lkICptYzsKKyAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRj
aCA9IE5VTEw7CisgICAgY29uc3Qgc3RydWN0IGNwdV9zaWduYXR1cmUgKnNpZyA9ICZ0aGlzX2Nw
dShjcHVfc2lnKTsKIAogICAgIHdoaWxlICggKG9mZnNldCA9IGdldF9uZXh0X3Vjb2RlX2Zyb21f
YnVmZmVyKCZtYywgYnVmLCBzaXplLCBvZmZzZXQpKSA+IDAgKQogICAgIHsKKyAgICAgICAgc3Ry
dWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3X3BhdGNoOworCiAgICAgICAgIGVycm9yID0gbWljcm9j
b2RlX3Nhbml0eV9jaGVjayhtYyk7CiAgICAgICAgIGlmICggZXJyb3IgKQogICAgICAgICAgICAg
YnJlYWs7Ci0gICAgICAgIGVycm9yID0gZ2V0X21hdGNoaW5nX21pY3JvY29kZShtYyk7Ci0gICAg
ICAgIGlmICggZXJyb3IgPCAwICkKKworICAgICAgICBuZXdfcGF0Y2ggPSBhbGxvY19taWNyb2Nv
ZGVfcGF0Y2gobWMpOworICAgICAgICBpZiAoIElTX0VSUihuZXdfcGF0Y2gpICkKKyAgICAgICAg
eworICAgICAgICAgICAgZXJyb3IgPSBQVFJfRVJSKG5ld19wYXRjaCk7CiAgICAgICAgICAgICBi
cmVhazsKKyAgICAgICAgfQorCiAgICAgICAgIC8qCi0gICAgICAgICAqIEl0J3MgcG9zc2libGUg
dGhlIGRhdGEgZmlsZSBoYXMgbXVsdGlwbGUgbWF0Y2hpbmcgdWNvZGUsCi0gICAgICAgICAqIGxl
dHMga2VlcCBzZWFyY2hpbmcgdGlsbCB0aGUgbGF0ZXN0IHZlcnNpb24KKyAgICAgICAgICogSWYg
dGhlIG5ldyBwYXRjaCBjb3ZlcnMgY3VycmVudCBDUFUsIGNvbXBhcmUgcGF0Y2hlcyBhbmQgc3Rv
cmUgdGhlCisgICAgICAgICAqIG9uZSB3aXRoIGhpZ2hlciByZXZpc2lvbi4KICAgICAgICAgICov
Ci0gICAgICAgIGlmICggZXJyb3IgPT0gMSApCi0gICAgICAgICAgICBlcnJvciA9IDA7CisgICAg
ICAgIGlmICggKG1pY3JvY29kZV91cGRhdGVfbWF0Y2goJm5ld19wYXRjaC0+bWNfaW50ZWwtPmhk
ciwgc2lnLT5zaWcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2lnLT5w
Ziwgc2lnLT5yZXYpICE9IE1JU19VQ09ERSkgJiYKKyAgICAgICAgICAgICAoIXBhdGNoIHx8IChj
b21wYXJlX3BhdGNoKG5ld19wYXRjaCwgcGF0Y2gpID09IE5FV19VQ09ERSkpICkKKyAgICAgICAg
eworICAgICAgICAgICAgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqdG1wID0gcGF0Y2g7CisKKyAg
ICAgICAgICAgIHBhdGNoID0gbmV3X3BhdGNoOworICAgICAgICAgICAgbmV3X3BhdGNoID0gdG1w
OworICAgICAgICB9CisKKyAgICAgICAgaWYgKCBuZXdfcGF0Y2ggKQorICAgICAgICAgICAgbWlj
cm9jb2RlX2ZyZWVfcGF0Y2gobmV3X3BhdGNoKTsKIAogICAgICAgICB4ZnJlZShtYyk7CiAgICAg
fQpAQCAtNDE5LDEwICs0MTksMTAgQEAgc3RhdGljIGludCBjcHVfcmVxdWVzdF9taWNyb2NvZGUo
Y29uc3Qgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSkKICAgICBpZiAoIG9mZnNldCA8IDAgKQogICAg
ICAgICBlcnJvciA9IG9mZnNldDsKIAotICAgIGlmICggIWVycm9yICYmIG1hdGNoX2NwdShtaWNy
b2NvZGVfZ2V0X2NhY2hlKCkpICkKLSAgICAgICAgZXJyb3IgPSBhcHBseV9taWNyb2NvZGUobWlj
cm9jb2RlX2dldF9jYWNoZSgpKTsKKyAgICBpZiAoIGVycm9yICYmICFwYXRjaCApCisgICAgICAg
IHBhdGNoID0gRVJSX1BUUihlcnJvcik7CiAKLSAgICByZXR1cm4gZXJyb3I7CisgICAgcmV0dXJu
IHBhdGNoOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9vcHMgbWljcm9jb2Rl
X2ludGVsX29wcyA9IHsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2Rl
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oCmluZGV4IDhjN2RlOWQuLjhlNzE2
MTUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaApAQCAtMjAsNyArMjAsOCBAQCBzdHJ1Y3QgbWlj
cm9jb2RlX3BhdGNoIHsKIH07CiAKIHN0cnVjdCBtaWNyb2NvZGVfb3BzIHsKLSAgICBpbnQgKCpj
cHVfcmVxdWVzdF9taWNyb2NvZGUpKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IHNpemUpOworICAg
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKigqY3B1X3JlcXVlc3RfbWljcm9jb2RlKShjb25zdCB2
b2lkICpidWYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemVfdCBzaXplKTsKICAgICBpbnQgKCpjb2xsZWN0X2NwdV9pbmZvKShzdHJ1Y3Qg
Y3B1X3NpZ25hdHVyZSAqY3NpZyk7CiAgICAgaW50ICgqYXBwbHlfbWljcm9jb2RlKShjb25zdCBz
dHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7CiAgICAgaW50ICgqc3RhcnRfdXBkYXRlKSh2
b2lkKTsKQEAgLTQxLDggKzQyLDYgQEAgc3RydWN0IGNwdV9zaWduYXR1cmUgewogREVDTEFSRV9Q
RVJfQ1BVKHN0cnVjdCBjcHVfc2lnbmF0dXJlLCBjcHVfc2lnKTsKIGV4dGVybiBjb25zdCBzdHJ1
Y3QgbWljcm9jb2RlX29wcyAqbWljcm9jb2RlX29wczsKIAotY29uc3Qgc3RydWN0IG1pY3JvY29k
ZV9wYXRjaCAqbWljcm9jb2RlX2dldF9jYWNoZSh2b2lkKTsKLWJvb2wgbWljcm9jb2RlX3VwZGF0
ZV9jYWNoZShzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7CiB2b2lkIG1pY3JvY29kZV9m
cmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKTsKIAogI2VuZGlmIC8qIEFT
TV9YODZfX01JQ1JPQ09ERV9IICovCi0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
