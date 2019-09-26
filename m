Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D5BF468
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:51:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDU9Y-00024N-E8; Thu, 26 Sep 2019 13:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQ1=XV=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iDU9W-00023m-83
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:49:50 +0000
X-Inumbo-ID: 7d7576b6-e064-11e9-8628-bc764e2007e4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by localhost (Halon) with ESMTPS
 id 7d7576b6-e064-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 13:49:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 06:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; d="scan'208";a="189126026"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2019 06:49:39 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 21:53:30 +0800
Message-Id: <1569506015-26938-3-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569506015-26938-1-git-send-email-chao.gao@intel.com>
References: <1569506015-26938-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v11 2/7] microcode: unify ucode loading during
 system bootup and resuming
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIHN5c3RlbSBib290dXAgYW5kIHJlc3VtaW5nLCBDUFVzIGp1c3QgbG9hZCB0aGUgY2Fj
aGVkIHVjb2RlLgpTbyBvbmUgdW5pZmllZCBmdW5jdGlvbiBtaWNyb2NvZGVfdXBkYXRlX29uZSgp
IGlzIGludHJvZHVjZWQuIEl0CnRha2VzIGEgYm9vbGVhbiB0byBpbmRpY2F0ZSB3aGV0aGVyIC0+
c3RhcnRfdXBkYXRlIHNob3VsZCBiZSBjYWxsZWQuClNpbmNlIGVhcmx5X21pY3JvY29kZV91cGRh
dGVfY3B1KCkgaXMgb25seSBjYWxsZWQgb24gQlNQIChBUHMgY2FsbAp0aGUgdW5pZmllZCBmdW5j
dGlvbiksIHN0YXJ0X3VwZGF0ZSBpcyBhbHdheXMgdHJ1ZSBhbmQgc28gcmVtb3ZlCnRoaXMgcGFy
YW1ldGVyLgoKVGhlcmUgaXMgYSBmdW5jdGlvbmFsIGNoYW5nZTogLT5zdGFydF91cGRhdGUgaXMg
Y2FsbGVkIG9uIEJTUCBhbmQKLT5lbmRfdXBkYXRlX3BlcmNwdSBpcyBjYWxsZWQgZHVyaW5nIHN5
c3RlbSByZXN1bWluZy4gVGhleSBhcmUgbm90Cmludm9rZWQgYnkgcHJldmlvdXMgbWljcm9jb2Rl
X3Jlc3VtZV9jcHUoKS4KClNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5j
b20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpDaGFu
Z2VzIGluIHYxMDoKIC0gY2FsbCAtPnN0YXJ0X3VwZGF0ZSBmb3Igc3lzdGVtIHJlc3VtZSBmcm9t
IHN1c3BlbnNpb24KCkNoYW5nZXMgaW4gdjk6CiAtIHJldHVybiAtRU9QTk9UU1VQUCByYXRoZXIg
dGhhbiAwIGlmIG1pY3JvY29kZV9vcHMgaXMgTlVMTCBpbgogICBtaWNyb2NvZGVfdXBkYXRlX29u
ZSgpCiAtIHJlYmFzZSBhbmQgZml4IGNvbmZsaWN0cy4KCkNoYW5nZXMgaW4gdjg6CiAtIHNwbGl0
IG91dCBmcm9tIHRoZSBwcmV2aW91cyBwYXRjaAotLS0KIHhlbi9hcmNoL3g4Ni9hY3BpL3Bvd2Vy
LmMgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICAgICAgICB8IDkxICsr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvc21w
Ym9vdC5jICAgICAgICAgIHwgIDUgKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5o
IHwgIDQgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL3Bvd2VyLmMKaW5kZXggMjY5YjE0MC4uMDFlNmFlYyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2FjcGkvcG93ZXIuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCkBAIC0y
NzgsNyArMjc4LDcgQEAgc3RhdGljIGludCBlbnRlcl9zdGF0ZSh1MzIgc3RhdGUpCiAKICAgICBj
b25zb2xlX2VuZF9zeW5jKCk7CiAKLSAgICBtaWNyb2NvZGVfcmVzdW1lX2NwdSgpOworICAgIG1p
Y3JvY29kZV91cGRhdGVfb25lKHRydWUpOwogCiAgICAgaWYgKCAhcmVjaGVja19jcHVfZmVhdHVy
ZXMoMCkgKQogICAgICAgICBwYW5pYygiTWlzc2luZyBwcmV2aW91c2x5IGF2YWlsYWJsZSBmZWF0
dXJlKHMpXG4iKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyBiL3hlbi9h
cmNoL3g4Ni9taWNyb2NvZGUuYwppbmRleCAzZWEyYTZlLi45YzBlNWM0IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCkBA
IC0yMDMsMjQgKzIwMyw2IEBAIHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXJzZV9i
bG9iKGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGxlbikKICAgICByZXR1cm4gTlVMTDsKIH0KIAot
aW50IG1pY3JvY29kZV9yZXN1bWVfY3B1KHZvaWQpCi17Ci0gICAgaW50IGVycjsKLSAgICBzdHJ1
Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcpOwotCi0gICAgaWYgKCAh
bWljcm9jb2RlX29wcyApCi0gICAgICAgIHJldHVybiAwOwotCi0gICAgc3Bpbl9sb2NrKCZtaWNy
b2NvZGVfbXV0ZXgpOwotCi0gICAgZXJyID0gbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5m
byhzaWcpOwotICAgIGlmICggbGlrZWx5KCFlcnIpICkKLSAgICAgICAgZXJyID0gbWljcm9jb2Rl
X29wcy0+YXBwbHlfbWljcm9jb2RlKG1pY3JvY29kZV9jYWNoZSk7Ci0gICAgc3Bpbl91bmxvY2so
Jm1pY3JvY29kZV9tdXRleCk7Ci0KLSAgICByZXR1cm4gZXJyOwotfQotCiB2b2lkIG1pY3JvY29k
ZV9mcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9wYXRjaCkKIHsK
ICAgICBtaWNyb2NvZGVfb3BzLT5mcmVlX3BhdGNoKG1pY3JvY29kZV9wYXRjaC0+bWMpOwpAQCAt
MzkxLDExICszNzMsMzggQEAgc3RhdGljIGludCBfX2luaXQgbWljcm9jb2RlX2luaXQodm9pZCkK
IH0KIF9faW5pdGNhbGwobWljcm9jb2RlX2luaXQpOwogCi1pbnQgX19pbml0IGVhcmx5X21pY3Jv
Y29kZV91cGRhdGVfY3B1KGJvb2wgc3RhcnRfdXBkYXRlKQorLyogTG9hZCBhIGNhY2hlZCB1cGRh
dGUgdG8gY3VycmVudCBjcHUgKi8KK2ludCBtaWNyb2NvZGVfdXBkYXRlX29uZShib29sIHN0YXJ0
X3VwZGF0ZSkKK3sKKyAgICBpbnQgZXJyOworCisgICAgaWYgKCAhbWljcm9jb2RlX29wcyApCisg
ICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKKworICAgIG1pY3JvY29kZV9vcHMtPmNvbGxlY3Rf
Y3B1X2luZm8oJnRoaXNfY3B1KGNwdV9zaWcpKTsKKworICAgIGlmICggc3RhcnRfdXBkYXRlICYm
IG1pY3JvY29kZV9vcHMtPnN0YXJ0X3VwZGF0ZSApCisgICAgeworICAgICAgICBlcnIgPSBtaWNy
b2NvZGVfb3BzLT5zdGFydF91cGRhdGUoKTsKKyAgICAgICAgaWYgKCBlcnIgKQorICAgICAgICAg
ICAgcmV0dXJuIGVycjsKKyAgICB9CisKKyAgICBlcnIgPSBtaWNyb2NvZGVfdXBkYXRlX2NwdShO
VUxMKTsKKworICAgIGlmICggbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZV9wZXJjcHUgKQorICAg
ICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlX3BlcmNwdSgpOworCisgICAgcmV0dXJuIGVy
cjsKK30KKworLyogQlNQIGNhbGxzIHRoaXMgZnVuY3Rpb24gdG8gcGFyc2UgdWNvZGUgYmxvYiBh
bmQgdGhlbiBhcHBseSBhbiB1cGRhdGUuICovCitpbnQgX19pbml0IGVhcmx5X21pY3JvY29kZV91
cGRhdGVfY3B1KHZvaWQpCiB7CiAgICAgaW50IHJjID0gMDsKICAgICB2b2lkICpkYXRhID0gTlVM
TDsKICAgICBzaXplX3QgbGVuOworICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoOwog
CiAgICAgaWYgKCAhbWljcm9jb2RlX29wcyApCiAgICAgICAgIHJldHVybiAtRU5PU1lTOwpAQCAt
NDExLDQ0ICs0MjAsMjYgQEAgaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShi
b29sIHN0YXJ0X3VwZGF0ZSkKICAgICAgICAgZGF0YSA9IGJvb3RzdHJhcF9tYXAoJnVjb2RlX21v
ZCk7CiAgICAgfQogCi0gICAgbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbygmdGhpc19j
cHUoY3B1X3NpZykpOwotCiAgICAgaWYgKCAhZGF0YSApCiAgICAgICAgIHJldHVybiAtRU5PTUVN
OwogCi0gICAgaWYgKCBzdGFydF91cGRhdGUgKQorICAgIHBhdGNoID0gcGFyc2VfYmxvYihkYXRh
LCBsZW4pOworICAgIGlmICggSVNfRVJSKHBhdGNoKSApCiAgICAgewotICAgICAgICBzdHJ1Y3Qg
bWljcm9jb2RlX3BhdGNoICpwYXRjaDsKLQotICAgICAgICBwYXRjaCA9IHBhcnNlX2Jsb2IoZGF0
YSwgbGVuKTsKLSAgICAgICAgaWYgKCBJU19FUlIocGF0Y2gpICkKLSAgICAgICAgewotICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJQYXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9y
ICVsZFxuIiwKLSAgICAgICAgICAgICAgICAgICBQVFJfRVJSKHBhdGNoKSk7Ci0gICAgICAgICAg
ICByZXR1cm4gUFRSX0VSUihwYXRjaCk7Ci0gICAgICAgIH0KLQotICAgICAgICBpZiAoICFwYXRj
aCApCi0gICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKLQotICAgICAgICBzcGluX2xvY2soJm1p
Y3JvY29kZV9tdXRleCk7Ci0gICAgICAgIHJjID0gbWljcm9jb2RlX3VwZGF0ZV9jYWNoZShwYXRj
aCk7Ci0gICAgICAgIHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOwotICAgICAgICBBU1NF
UlQocmMpOwotCi0gICAgICAgIGlmICggbWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlICkKLSAg
ICAgICAgICAgIHJjID0gbWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlKCk7Ci0KLSAgICAgICAg
aWYgKCByYyApCi0gICAgICAgICAgICByZXR1cm4gcmM7CisgICAgICAgIHByaW50ayhYRU5MT0df
V0FSTklORyAiUGFyc2luZyBtaWNyb2NvZGUgYmxvYiBlcnJvciAlbGRcbiIsCisgICAgICAgICAg
ICAgICBQVFJfRVJSKHBhdGNoKSk7CisgICAgICAgIHJldHVybiBQVFJfRVJSKHBhdGNoKTsKICAg
ICB9CiAKLSAgICByYyA9IG1pY3JvY29kZV91cGRhdGVfY3B1KE5VTEwpOworICAgIGlmICggIXBh
dGNoICkKKyAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CiAKLSAgICBpZiAoIG1pY3JvY29kZV9vcHMt
PmVuZF91cGRhdGVfcGVyY3B1ICkKLSAgICAgICAgbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZV9w
ZXJjcHUoKTsKKyAgICBzcGluX2xvY2soJm1pY3JvY29kZV9tdXRleCk7CisgICAgcmMgPSBtaWNy
b2NvZGVfdXBkYXRlX2NhY2hlKHBhdGNoKTsKKyAgICBzcGluX3VubG9jaygmbWljcm9jb2RlX211
dGV4KTsKKyAgICBBU1NFUlQocmMpOwogCi0gICAgcmV0dXJuIHJjOworICAgIHJldHVybiBtaWNy
b2NvZGVfdXBkYXRlX29uZSh0cnVlKTsKIH0KIAogaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVf
aW5pdCh2b2lkKQpAQCAtNDY4LDcgKzQ1OSw3IEBAIGludCBfX2luaXQgZWFybHlfbWljcm9jb2Rl
X2luaXQodm9pZCkKICAgICAgICAgbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbygmdGhp
c19jcHUoY3B1X3NpZykpOwogCiAgICAgICAgIGlmICggdWNvZGVfbW9kLm1vZF9lbmQgfHwgdWNv
ZGVfYmxvYi5zaXplICkKLSAgICAgICAgICAgIHJjID0gZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9j
cHUodHJ1ZSk7CisgICAgICAgICAgICByYyA9IGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1KCk7
CiAgICAgfQogCiAgICAgcmV0dXJuIHJjOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJv
b3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXggNzNhMWFmYy4uMTc5ZjZiNiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCkBAIC0zNjAsMTAgKzM2MCw3IEBAIHZvaWQgc3RhcnRfc2Vjb25kYXJ5KHZvaWQgKnVudXNl
ZCkKIAogICAgIGluaXRpYWxpemVfY3B1X2RhdGEoY3B1KTsKIAotICAgIGlmICggc3lzdGVtX3N0
YXRlIDw9IFNZU19TVEFURV9zbXBfYm9vdCApCi0gICAgICAgIGVhcmx5X21pY3JvY29kZV91cGRh
dGVfY3B1KGZhbHNlKTsKLSAgICBlbHNlCi0gICAgICAgIG1pY3JvY29kZV9yZXN1bWVfY3B1KCk7
CisgICAgbWljcm9jb2RlX3VwZGF0ZV9vbmUoZmFsc2UpOwogCiAgICAgLyoKICAgICAgKiBJZiBN
U1JfU1BFQ19DVFJMIGlzIGF2YWlsYWJsZSwgYXBwbHkgWGVuJ3MgZGVmYXVsdCBzZXR0aW5nIGFu
ZCBkaXNjYXJkCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAppbmRleCBhNjczMzcyLi5jOTI5NTZmIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKQEAgLTU2OSw5ICs1NjksOSBAQCBpbnQgZ3Vlc3Rfd3Jt
c3JfeGVuKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCk7CiAKIHZv
aWQgbWljcm9jb2RlX3NldF9tb2R1bGUodW5zaWduZWQgaW50KTsKIGludCBtaWNyb2NvZGVfdXBk
YXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCksIHVuc2lnbmVkIGxvbmcgbGVu
KTsKLWludCBtaWNyb2NvZGVfcmVzdW1lX2NwdSh2b2lkKTsKLWludCBlYXJseV9taWNyb2NvZGVf
dXBkYXRlX2NwdShib29sIHN0YXJ0X3VwZGF0ZSk7CitpbnQgZWFybHlfbWljcm9jb2RlX3VwZGF0
ZV9jcHUodm9pZCk7CiBpbnQgZWFybHlfbWljcm9jb2RlX2luaXQodm9pZCk7CitpbnQgbWljcm9j
b2RlX3VwZGF0ZV9vbmUoYm9vbCBzdGFydF91cGRhdGUpOwogaW50IG1pY3JvY29kZV9pbml0X2lu
dGVsKHZvaWQpOwogaW50IG1pY3JvY29kZV9pbml0X2FtZCh2b2lkKTsKIAotLSAKMS44LjMuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
