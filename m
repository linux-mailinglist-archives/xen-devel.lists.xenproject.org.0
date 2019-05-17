Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E6216D7
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:14:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRZqa-0002MO-JT; Fri, 17 May 2019 10:12:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRZqY-0002MB-T4
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:12:14 +0000
X-Inumbo-ID: 3d437316-788c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d437316-788c-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:12:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:12:12 -0600
Message-Id: <5CDE88FC0200007800230034@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:12:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
 <5B61C2120200000000101EDC@prv1-mh.provo.novell.com>
 <5B61C212020000780022FF0D@prv1-mh.provo.novell.com>
 <5CDE88900200007800230027@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE88900200007800230027@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 2/3] x86/cpuidle: push parked CPUs into
 deeper sleep states when possible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB0aGUgbXdhaXQtaWRsZSBkcml2ZXIgaXNuJ3QgdXNlZCwgQy1zdGF0ZSBpbmZvcm1hdGlv
biBiZWNvbWVzCmF2YWlsYWJsZSBvbmx5IGluIHRoZSBjb3Vyc2Ugb2YgRG9tMCBzdGFydGluZyB1
cC4gVXNlIHRoZSBwcm92aWRlZCBkYXRhCnRvIGFsbG93IHBhcmtlZCBDUFVzIHRvIHNsZWVwIGlu
IGEgbW9yZSBlbmVyZ3kgZWZmaWNpZW50IHdheSwgYnkgd2FraW5nCnRoZW0gYnJpZWZseSAodmlh
IE5NSSkgb25jZSB0aGUgZGF0YSBoYXMgYmVlbiByZWNvcmRlZC4KClRoaXMgaW52b2x2ZXMgcmUt
YXJyYW5naW5nIGhvdy93aGVuIHRoZSBnb3Zlcm5vcidzIC0+ZW5hYmxlKCkgaG9vayBnZXRzCmlu
dm9rZWQuIFRoZSBjaGFuZ2VzIHRoZXJlIGluY2x1ZGUgYWRkaXRpb24gb2Ygc28gZmFyIG1pc3Np
bmcgZXJyb3IKaGFuZGxpbmcgaW4gdGhlIHJlc3BlY3RpdmUgQ1BVIG5vdGlmaWVyIGhhbmRsZXJz
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9h
cmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUu
YwpAQCAtMzUxLDEyICszNTEsMjIgQEAgc3RhdGljIHZvaWQgZHVtcF9jeCh1bnNpZ25lZCBjaGFy
IGtleSkKICAgICB1bnNpZ25lZCBpbnQgY3B1OwogCiAgICAgcHJpbnRrKCInJWMnIHByZXNzZWQg
LT4gcHJpbnRpbmcgQUNQSSBDeCBzdHJ1Y3R1cmVzXG4iLCBrZXkpOwotICAgIGZvcl9lYWNoX29u
bGluZV9jcHUgKCBjcHUgKQotICAgICAgICBpZiAocHJvY2Vzc29yX3Bvd2Vyc1tjcHVdKQotICAg
ICAgICB7Ci0gICAgICAgICAgICBwcmludF9hY3BpX3Bvd2VyKGNwdSwgcHJvY2Vzc29yX3Bvd2Vy
c1tjcHVdKTsKLSAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOwotICAgICAg
ICB9CisgICAgZm9yX2VhY2hfcHJlc2VudF9jcHUgKCBjcHUgKQorICAgIHsKKyAgICAgICAgc3Ry
dWN0IGFjcGlfcHJvY2Vzc29yX3Bvd2VyICpwb3dlciA9IHByb2Nlc3Nvcl9wb3dlcnNbY3B1XTsK
KworICAgICAgICBpZiAoICFwb3dlciApCisgICAgICAgICAgICBjb250aW51ZTsKKworICAgICAg
ICBpZiAoIGNwdV9vbmxpbmUoY3B1KSApCisgICAgICAgICAgICBwcmludF9hY3BpX3Bvd2VyKGNw
dSwgcG93ZXIpOworICAgICAgICBlbHNlIGlmICggcGFya19vZmZsaW5lX2NwdXMgKQorICAgICAg
ICAgICAgcHJpbnRrKCJDUFUldSBwYXJrZWQgaW4gc3RhdGUgJXUgKEMldSlcbiIsIGNwdSwKKyAg
ICAgICAgICAgICAgICAgICBwb3dlci0+bGFzdF9zdGF0ZSA/IHBvd2VyLT5sYXN0X3N0YXRlLT5p
ZHggOiAxLAorICAgICAgICAgICAgICAgICAgIHBvd2VyLT5sYXN0X3N0YXRlID8gcG93ZXItPmxh
c3Rfc3RhdGUtPnR5cGUgOiAxKTsKKworICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMo
KTsKKyAgICB9CiB9CiAKIHN0YXRpYyBpbnQgX19pbml0IGNwdV9pZGxlX2tleV9pbml0KHZvaWQp
CkBAIC03NjUsNiArNzc1LDcgQEAgdm9pZCBhY3BpX2RlYWRfaWRsZSh2b2lkKQogICAgICAgICBn
b3RvIGRlZmF1bHRfaGFsdDsKIAogICAgIGN4ID0gJnBvd2VyLT5zdGF0ZXNbcG93ZXItPmNvdW50
IC0gMV07CisgICAgcG93ZXItPmxhc3Rfc3RhdGUgPSBjeDsKIAogICAgIGlmICggY3gtPmVudHJ5
X21ldGhvZCA9PSBBQ1BJX0NTVEFURV9FTV9GRkggKQogICAgIHsKQEAgLTEyMTcsOSArMTIyOCwz
MCBAQCBsb25nIHNldF9jeF9wbWluZm8odWludDMyX3QgYWNwaV9pZCwgc3RyCiAgICAgICAgIHNl
dF9jeChhY3BpX3Bvd2VyLCAmeGVuX2N4KTsKICAgICB9CiAKLSAgICBpZiAoIGNwdWlkbGVfY3Vy
cmVudF9nb3Zlcm5vci0+ZW5hYmxlICYmCi0gICAgICAgICBjcHVpZGxlX2N1cnJlbnRfZ292ZXJu
b3ItPmVuYWJsZShhY3BpX3Bvd2VyKSApCi0gICAgICAgIHJldHVybiAtRUZBVUxUOworICAgIGlm
ICggIWNwdV9vbmxpbmUoY3B1X2lkKSApCisgICAgeworICAgICAgICB1aW50MzJfdCBhcGljX2lk
ID0geDg2X2NwdV90b19hcGljaWRbY3B1X2lkXTsKKworICAgICAgICAvKgorICAgICAgICAgKiBJ
ZiB3ZSd2ZSBqdXN0IGxlYXJuZWQgb2YgbW9yZSBhdmFpbGFibGUgQyBzdGF0ZXMsIHdha2UgdGhl
IENQVSBpZgorICAgICAgICAgKiBpdCdzIHBhcmtlZCwgc28gaXQgY2FuIGdvIGJhY2sgdG8gc2xl
ZXAgaW4gcGVyaGFwcyBhIGRlZXBlciBzdGF0ZS4KKyAgICAgICAgICovCisgICAgICAgIGlmICgg
cGFya19vZmZsaW5lX2NwdXMgJiYgYXBpY19pZCAhPSBCQURfQVBJQ0lEICkKKyAgICAgICAgewor
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKKworICAgICAgICAgICAgbG9jYWxfaXJx
X3NhdmUoZmxhZ3MpOworICAgICAgICAgICAgYXBpY193YWl0X2ljcl9pZGxlKCk7CisgICAgICAg
ICAgICBhcGljX2ljcl93cml0ZShBUElDX0RNX05NSSB8IEFQSUNfREVTVF9QSFlTSUNBTCwgYXBp
Y19pZCk7CisgICAgICAgICAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7CisgICAgICAgIH0K
KyAgICB9CisgICAgZWxzZSBpZiAoIGNwdWlkbGVfY3VycmVudF9nb3Zlcm5vci0+ZW5hYmxlICkK
KyAgICB7CisgICAgICAgIHJldCA9IGNwdWlkbGVfY3VycmVudF9nb3Zlcm5vci0+ZW5hYmxlKGFj
cGlfcG93ZXIpOworICAgICAgICBpZiAoIHJldCA8IDAgKQorICAgICAgICAgICAgcmV0dXJuIHJl
dDsKKyAgICB9CiAKICAgICAvKiBGSVhNRTogQy1zdGF0ZSBkZXBlbmRlbmN5IGlzIG5vdCBzdXBw
b3J0ZWQgYnkgZmFyICovCiAKQEAgLTEzNzksMTkgKzE0MTEsMjIgQEAgc3RhdGljIGludCBjcHVf
Y2FsbGJhY2soCiAgICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuZmIsIHVuc2lnbmVkIGxvbmcg
YWN0aW9uLCB2b2lkICpoY3B1KQogewogICAgIHVuc2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQg
bG9uZyloY3B1OworICAgIGludCByYyA9IDA7CiAKLSAgICAvKiBPbmx5IGhvb2sgb24gQ1BVX09O
TElORSBiZWNhdXNlIGEgZGVhZCBjcHUgbWF5IHV0aWxpemUgdGhlIGluZm8gdG8KLSAgICAgKiB0
byBlbnRlciBkZWVwIEMtc3RhdGUgKi8KKyAgICAvKgorICAgICAqIE9ubHkgaG9vayBvbiBDUFVf
VVBfUFJFUEFSRSBiZWNhdXNlIGEgZGVhZCBjcHUgbWF5IHV0aWxpemUgdGhlIGluZm8KKyAgICAg
KiB0byBlbnRlciBkZWVwIEMtc3RhdGUuCisgICAgICovCiAgICAgc3dpdGNoICggYWN0aW9uICkK
ICAgICB7Ci0gICAgY2FzZSBDUFVfT05MSU5FOgotICAgICAgICAodm9pZCljcHVpZGxlX2luaXRf
Y3B1KGNwdSk7Ci0gICAgICAgIGJyZWFrOwotICAgIGRlZmF1bHQ6CisgICAgY2FzZSBDUFVfVVBf
UFJFUEFSRToKKyAgICAgICAgcmMgPSBjcHVpZGxlX2luaXRfY3B1KGNwdSk7CisgICAgICAgIGlm
ICggIXJjICYmIGNwdWlkbGVfY3VycmVudF9nb3Zlcm5vci0+ZW5hYmxlICkKKyAgICAgICAgICAg
IHJjID0gY3B1aWRsZV9jdXJyZW50X2dvdmVybm9yLT5lbmFibGUocHJvY2Vzc29yX3Bvd2Vyc1tj
cHVdKTsKICAgICAgICAgYnJlYWs7CiAgICAgfQogCi0gICAgcmV0dXJuIE5PVElGWV9ET05FOwor
ICAgIHJldHVybiAhcmMgPyBOT1RJRllfRE9ORSA6IG5vdGlmaWVyX2Zyb21fZXJybm8ocmMpOwog
fQogCiBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGNwdV9uZmIgPSB7CkBAIC0xNDA2LDYg
KzE0NDEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjcHVpZGxlX3ByZXNtcF9pbml0KHZvCiAgICAg
ICAgIHJldHVybiAwOwogCiAgICAgbXdhaXRfaWRsZV9pbml0KCZjcHVfbmZiKTsKKyAgICBjcHVf
bmZiLm5vdGlmaWVyX2NhbGwoJmNwdV9uZmIsIENQVV9VUF9QUkVQQVJFLCBjcHUpOwogICAgIGNw
dV9uZmIubm90aWZpZXJfY2FsbCgmY3B1X25mYiwgQ1BVX09OTElORSwgY3B1KTsKICAgICByZWdp
c3Rlcl9jcHVfbm90aWZpZXIoJmNwdV9uZmIpOwogICAgIHJldHVybiAwOwotLS0gYS94ZW4vYXJj
aC94ODYvYWNwaS9jcHVpZGxlX21lbnUuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVpZGxl
X21lbnUuYwpAQCAtMjc3LDkgKzI3Nyw2IEBAIHN0YXRpYyB2b2lkIG1lbnVfcmVmbGVjdChzdHJ1
Y3QgYWNwaV9wcm8KIAogc3RhdGljIGludCBtZW51X2VuYWJsZV9kZXZpY2Uoc3RydWN0IGFjcGlf
cHJvY2Vzc29yX3Bvd2VyICpwb3dlcikKIHsKLSAgICBpZiAoIWNwdV9vbmxpbmUocG93ZXItPmNw
dSkpCi0gICAgICAgIHJldHVybiAtMTsKLQogICAgIG1lbXNldCgmcGVyX2NwdShtZW51X2Rldmlj
ZXMsIHBvd2VyLT5jcHUpLCAwLCBzaXplb2Yoc3RydWN0IG1lbnVfZGV2aWNlKSk7CiAKICAgICBy
ZXR1cm4gMDsKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2NwdS9td2FpdC1pZGxlLmMKQEAgLTExNjYsMTIgKzExNjYsMTcgQEAgc3RhdGljIGlu
dCBtd2FpdF9pZGxlX2NwdV9pbml0KHN0cnVjdCBubwogCXN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9w
b3dlciAqZGV2ID0gcHJvY2Vzc29yX3Bvd2Vyc1tjcHVdOwogCiAJc3dpdGNoIChhY3Rpb24pIHsK
KwkJaW50IHJjOworCiAJZGVmYXVsdDoKIAkJcmV0dXJuIE5PVElGWV9ET05FOwogCiAJY2FzZSBD
UFVfVVBfUFJFUEFSRToKLQkJY3B1aWRsZV9pbml0X2NwdShjcHUpOwotCQlyZXR1cm4gTk9USUZZ
X0RPTkU7CisJCXJjID0gY3B1aWRsZV9pbml0X2NwdShjcHUpOworCQlkZXYgPSBwcm9jZXNzb3Jf
cG93ZXJzW2NwdV07CisJCWlmICghcmMgJiYgY3B1aWRsZV9jdXJyZW50X2dvdmVybm9yLT5lbmFi
bGUpCisJCQlyYyA9IGNwdWlkbGVfY3VycmVudF9nb3Zlcm5vci0+ZW5hYmxlKGRldik7CisJCXJl
dHVybiAhcmMgPyBOT1RJRllfRE9ORSA6IG5vdGlmaWVyX2Zyb21fZXJybm8ocmMpOwogCiAJY2Fz
ZSBDUFVfT05MSU5FOgogCQlpZiAoIWRldikKQEAgLTEyNjAsOCArMTI2NSw2IEBAIGludCBfX2lu
aXQgbXdhaXRfaWRsZV9pbml0KHN0cnVjdCBub3RpZmkKIAl9CiAJaWYgKCFlcnIpIHsKIAkJbmZi
LT5ub3RpZmllcl9jYWxsID0gbXdhaXRfaWRsZV9jcHVfaW5pdDsKLQkJbXdhaXRfaWRsZV9jcHVf
aW5pdChuZmIsIENQVV9VUF9QUkVQQVJFLCBOVUxMKTsKLQogCQlwbV9pZGxlX3NhdmUgPSBwbV9p
ZGxlOwogCQlwbV9pZGxlID0gbXdhaXRfaWRsZTsKIAkJZGVhZF9pZGxlID0gYWNwaV9kZWFkX2lk
bGU7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
