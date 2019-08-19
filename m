Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A165491AA8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 03:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzWMw-0001Lv-Gw; Mon, 19 Aug 2019 01:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JIwN=WP=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hzWMv-0001L3-Bb
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 01:21:57 +0000
X-Inumbo-ID: bc2599f8-c21f-11e9-8be6-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc2599f8-c21f-11e9-8be6-12813bfff9fa;
 Mon, 19 Aug 2019 01:21:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 18:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="261683934"
Received: from gao-cwp.sh.intel.com ([10.239.159.26])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2019 18:21:55 -0700
From: Chao Gao <chao.gao@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 09:25:24 +0800
Message-Id: <1566177928-19114-12-git-send-email-chao.gao@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
Subject: [Xen-devel] [PATCH v9 11/15] microcode: unify loading update during
 CPU resuming and AP wakeup
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

Qm90aCBhcmUgbG9hZGluZyB0aGUgY2FjaGVkIHBhdGNoLiBTaW5jZSBBUHMgY2FsbCB0aGUgdW5p
ZmllZCBmdW5jdGlvbiwKbWljcm9jb2RlX3VwZGF0ZV9vbmUoKSwgZHVyaW5nIHdha2V1cCwgdGhl
ICdzdGFydF91cGRhdGUnIHBhcmFtZXRlcgp3aGljaCBvcmlnaW5hbGx5IHVzZWQgdG8gZGlzdGlu
Z3Vpc2ggQlNQIGFuZCBBUHMgaXMgcmVkdW5kYW50LiBTbyByZW1vdmUKdGhpcyBwYXJhbWV0ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgotLS0KTm90ZSB0
aGF0IGhlcmUgaXMgYSBmdW5jdGlvbmFsIGNoYW5nZTogcmVzdW1pbmcgYSBDUFUgd291bGQgY2Fs
bAotPmVuZF91cGRhdGUoKSBub3cgd2hpbGUgcHJldmlvdXNseSBpdCB3YXNuJ3QuIE5vdCBxdWl0
ZSBzdXJlCndoZXRoZXIgaXQgaXMgY29ycmVjdC4KCkNoYW5nZXMgaW4gdjk6CiAtIHJldHVybiAt
RU9QTk9UU1VQUCByYXRoZXIgdGhhbiAwIGlmIG1pY3JvY29kZV9vcHMgaXMgTlVMTCBpbgogICBt
aWNyb2NvZGVfdXBkYXRlX29uZSgpCiAtIHJlYmFzZSBhbmQgZml4IGNvbmZsaWN0cy4KCkNoYW5n
ZXMgaW4gdjg6CiAtIHNwbGl0IG91dCBmcm9tIHRoZSBwcmV2aW91cyBwYXRjaAotLS0KIHhlbi9h
cmNoL3g4Ni9hY3BpL3Bvd2VyLmMgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21pY3JvY29k
ZS5jICAgICAgICB8IDkwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAgICAgIHwgIDUgKy0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L3Byb2Nlc3Nvci5oIHwgIDQgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9u
cygrKSwgNTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKaW5kZXggNGYyMTkwMy4uMjQ3OThkNSAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYworKysgYi94ZW4vYXJjaC94ODYv
YWNwaS9wb3dlci5jCkBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIGludCBlbnRlcl9zdGF0ZSh1
MzIgc3RhdGUpCiAKICAgICBjb25zb2xlX2VuZF9zeW5jKCk7CiAKLSAgICBtaWNyb2NvZGVfcmVz
dW1lX2NwdSgpOworICAgIG1pY3JvY29kZV91cGRhdGVfb25lKCk7CiAKICAgICBpZiAoICFyZWNo
ZWNrX2NwdV9mZWF0dXJlcygwKSApCiAgICAgICAgIHBhbmljKCJNaXNzaW5nIHByZXZpb3VzbHkg
YXZhaWxhYmxlIGZlYXR1cmUocylcbiIpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IGEyZmViYzcuLmJkZDljOWYg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJjaC94ODYv
bWljcm9jb2RlLmMKQEAgLTIwMywyNCArMjAzLDYgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hhciAqYnVmLCB1aW50MzJfdCBsZW4pCiAgICAgcmV0
dXJuIE5VTEw7CiB9CiAKLWludCBtaWNyb2NvZGVfcmVzdW1lX2NwdSh2b2lkKQotewotICAgIGlu
dCBlcnI7Ci0gICAgc3RydWN0IGNwdV9zaWduYXR1cmUgKnNpZyA9ICZ0aGlzX2NwdShjcHVfc2ln
KTsKLQotICAgIGlmICggIW1pY3JvY29kZV9vcHMgKQotICAgICAgICByZXR1cm4gMDsKLQotICAg
IHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4KTsKLQotICAgIGVyciA9IG1pY3JvY29kZV9vcHMt
PmNvbGxlY3RfY3B1X2luZm8oc2lnKTsKLSAgICBpZiAoIGxpa2VseSghZXJyKSApCi0gICAgICAg
IGVyciA9IG1pY3JvY29kZV9vcHMtPmFwcGx5X21pY3JvY29kZShtaWNyb2NvZGVfY2FjaGUpOwot
ICAgIHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOwotCi0gICAgcmV0dXJuIGVycjsKLX0K
LQogdm9pZCBtaWNyb2NvZGVfZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNy
b2NvZGVfcGF0Y2gpCiB7CiAgICAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRjaChtaWNyb2NvZGVf
cGF0Y2gtPm1jKTsKQEAgLTM4NCwxMSArMzY2LDI5IEBAIHN0YXRpYyBpbnQgX19pbml0IG1pY3Jv
Y29kZV9pbml0KHZvaWQpCiB9CiBfX2luaXRjYWxsKG1pY3JvY29kZV9pbml0KTsKIAotaW50IF9f
aW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShib29sIHN0YXJ0X3VwZGF0ZSkKKy8qIExv
YWQgYSBjYWNoZWQgdXBkYXRlIHRvIGN1cnJlbnQgY3B1ICovCitpbnQgbWljcm9jb2RlX3VwZGF0
ZV9vbmUodm9pZCkKK3sKKyAgICBpbnQgcmM7CisKKyAgICBpZiAoICFtaWNyb2NvZGVfb3BzICkK
KyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOworCisgICAgcmMgPSBtaWNyb2NvZGVfdXBkYXRl
X2NwdShOVUxMKTsKKworICAgIGlmICggbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZSApCisgICAg
ICAgIG1pY3JvY29kZV9vcHMtPmVuZF91cGRhdGUoKTsKKworICAgIHJldHVybiByYzsKK30KKwor
LyogQlNQIGNhbGxzIHRoaXMgZnVuY3Rpb24gdG8gcGFyc2UgdWNvZGUgYmxvYiBhbmQgdGhlbiBh
cHBseSBhbiB1cGRhdGUuICovCitpbnQgX19pbml0IGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1
KHZvaWQpCiB7CiAgICAgaW50IHJjID0gMDsKICAgICB2b2lkICpkYXRhID0gTlVMTDsKICAgICBz
aXplX3QgbGVuOworICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoOwogCiAgICAgaWYg
KCAhbWljcm9jb2RlX29wcyApCiAgICAgICAgIHJldHVybiAtRU5PU1lTOwpAQCAtNDA5LDQzICs0
MDksMzMgQEAgaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShib29sIHN0YXJ0
X3VwZGF0ZSkKICAgICBpZiAoICFkYXRhICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKLSAg
ICBpZiAoIHN0YXJ0X3VwZGF0ZSApCi0gICAgewotICAgICAgICBzdHJ1Y3QgbWljcm9jb2RlX3Bh
dGNoICpwYXRjaDsKLQotICAgICAgICBpZiAoIG1pY3JvY29kZV9vcHMtPnN0YXJ0X3VwZGF0ZSAp
Ci0gICAgICAgICAgICByYyA9IG1pY3JvY29kZV9vcHMtPnN0YXJ0X3VwZGF0ZSgpOwotCi0gICAg
ICAgIGlmICggcmMgKQotICAgICAgICAgICAgcmV0dXJuIHJjOwotCi0gICAgICAgIHBhdGNoID0g
cGFyc2VfYmxvYihkYXRhLCBsZW4pOwotICAgICAgICBpZiAoIElTX0VSUihwYXRjaCkgKQotICAg
ICAgICB7Ci0gICAgICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIlBhcnNpbmcgbWljcm9jb2Rl
IGJsb2IgZXJyb3IgJWxkXG4iLAotICAgICAgICAgICAgICAgICAgIFBUUl9FUlIocGF0Y2gpKTsK
LSAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBhdGNoKTsKLSAgICAgICAgfQorICAgIGlmICgg
bWljcm9jb2RlX29wcy0+c3RhcnRfdXBkYXRlICkKKyAgICAgICAgcmMgPSBtaWNyb2NvZGVfb3Bz
LT5zdGFydF91cGRhdGUoKTsKIAotICAgICAgICBpZiAoICFwYXRjaCApCi0gICAgICAgIHsKLSAg
ICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTm8gdWNvZGUgZm91bmQuIFVwZGF0ZSBhYm9y
dGVkIVxuIik7Ci0gICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICAgICAgfQorICAgIGlm
ICggcmMgKQorICAgICAgICByZXR1cm4gcmM7CiAKLSAgICAgICAgc3Bpbl9sb2NrKCZtaWNyb2Nv
ZGVfbXV0ZXgpOwotICAgICAgICByYyA9IG1pY3JvY29kZV91cGRhdGVfY2FjaGUocGF0Y2gpOwot
ICAgICAgICBzcGluX3VubG9jaygmbWljcm9jb2RlX211dGV4KTsKKyAgICBwYXRjaCA9IHBhcnNl
X2Jsb2IoZGF0YSwgbGVuKTsKKyAgICBpZiAoIElTX0VSUihwYXRjaCkgKQorICAgIHsKKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9yICVsZFxu
IiwKKyAgICAgICAgICAgICAgIFBUUl9FUlIocGF0Y2gpKTsKKyAgICAgICAgcmV0dXJuIFBUUl9F
UlIocGF0Y2gpOworICAgIH0KIAotICAgICAgICBBU1NFUlQocmMpOworICAgIGlmICggIXBhdGNo
ICkKKyAgICB7CisgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTm8gdWNvZGUgZm91bmQuIFVw
ZGF0ZSBhYm9ydGVkIVxuIik7CisgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAotICAg
IHJjID0gbWljcm9jb2RlX3VwZGF0ZV9jcHUoTlVMTCk7CisgICAgc3Bpbl9sb2NrKCZtaWNyb2Nv
ZGVfbXV0ZXgpOworICAgIHJjID0gbWljcm9jb2RlX3VwZGF0ZV9jYWNoZShwYXRjaCk7CisgICAg
c3Bpbl91bmxvY2soJm1pY3JvY29kZV9tdXRleCk7CiAKLSAgICBpZiAoIG1pY3JvY29kZV9vcHMt
PmVuZF91cGRhdGUgKQotICAgICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlKCk7CisgICAg
QVNTRVJUKHJjKTsKIAotICAgIHJldHVybiByYzsKKyAgICByZXR1cm4gbWljcm9jb2RlX3VwZGF0
ZV9vbmUoKTsKIH0KIAogaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfaW5pdCh2b2lkKQpAQCAt
NDY1LDcgKzQ1NSw3IEBAIGludCBfX2luaXQgZWFybHlfbWljcm9jb2RlX2luaXQodm9pZCkKICAg
ICAgICAgbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbygmdGhpc19jcHUoY3B1X3NpZykp
OwogCiAgICAgICAgIGlmICggdWNvZGVfbW9kLm1vZF9lbmQgfHwgdWNvZGVfYmxvYi5zaXplICkK
LSAgICAgICAgICAgIHJjID0gZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9jcHUodHJ1ZSk7CisgICAg
ICAgICAgICByYyA9IGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1KCk7CiAgICAgfQogCiAgICAg
cmV0dXJuIHJjOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMKaW5kZXggYzgxOGNmYy4uZTYyYTFjYSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC0zNjEsMTAg
KzM2MSw3IEBAIHZvaWQgc3RhcnRfc2Vjb25kYXJ5KHZvaWQgKnVudXNlZCkKIAogICAgIGluaXRp
YWxpemVfY3B1X2RhdGEoY3B1KTsKIAotICAgIGlmICggc3lzdGVtX3N0YXRlIDw9IFNZU19TVEFU
RV9zbXBfYm9vdCApCi0gICAgICAgIGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1KGZhbHNlKTsK
LSAgICBlbHNlCi0gICAgICAgIG1pY3JvY29kZV9yZXN1bWVfY3B1KCk7CisgICAgbWljcm9jb2Rl
X3VwZGF0ZV9vbmUoKTsKIAogICAgIC8qCiAgICAgICogSWYgTVNSX1NQRUNfQ1RSTCBpcyBhdmFp
bGFibGUsIGFwcGx5IFhlbidzIGRlZmF1bHQgc2V0dGluZyBhbmQgZGlzY2FyZApkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
cHJvY2Vzc29yLmgKaW5kZXggMTA0ZmFhOS4uMmE3NmQ5MCAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nv
ci5oCkBAIC01NjgsOSArNTY4LDkgQEAgaW50IGd1ZXN0X3dybXNyX3hlbihzdHJ1Y3QgdmNwdSAq
diwgdWludDMyX3QgaWR4LCB1aW50NjRfdCB2YWwpOwogCiB2b2lkIG1pY3JvY29kZV9zZXRfbW9k
dWxlKHVuc2lnbmVkIGludCk7CiBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFORExF
X1BBUkFNKGNvbnN0X3ZvaWQpLCB1bnNpZ25lZCBsb25nIGxlbik7Ci1pbnQgbWljcm9jb2RlX3Jl
c3VtZV9jcHUodm9pZCk7Ci1pbnQgZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9jcHUoYm9vbCBzdGFy
dF91cGRhdGUpOworaW50IGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1KHZvaWQpOwogaW50IGVh
cmx5X21pY3JvY29kZV9pbml0KHZvaWQpOworaW50IG1pY3JvY29kZV91cGRhdGVfb25lKHZvaWQp
OwogaW50IG1pY3JvY29kZV9pbml0X2ludGVsKHZvaWQpOwogaW50IG1pY3JvY29kZV9pbml0X2Ft
ZCh2b2lkKTsKIAotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
