Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB0479241
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 19:41:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs9bm-0005pq-4c; Mon, 29 Jul 2019 17:38:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs9bk-0005pd-Um
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 17:38:48 +0000
X-Inumbo-ID: b8756226-b227-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b8756226-b227-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 17:38:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SBEQXRPqaaF2q6SJRLvi0kSRI+nVITMi6P8bipKP/cNpEwwCsr/ZX/rWOAapw8btZFBB4JsWwQ
 Xu0/nWB/Z4hiOGq2aKpLLGCnKMMCWjkQGn+4QEsWA3FuUheLUtRpWc6+U+X02SLMvalXm2AETe
 g+R/tmzt6DWIYf3XC2qbDApkonf71PQOgDk6VCcB+RGzaQc3zxEDyKKOd2ZT0+3poY1irR6GrZ
 52xo3L+c/znJSBBP21elJKvIpVdkjD+kyIEpBBzUsMSEyf5sYYsXtanr0gjlC7CHMhl/+7Hrpw
 LsI=
X-SBRS: 2.7
X-MesageID: 3716346
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3716346"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 18:38:43 +0100
Message-ID: <20190729173843.21586-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729173843.21586-1-andrew.cooper3@citrix.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFhQVEkgd29yayByZXN0cmljdGVkIHRoZSB2aXNpYmlsaXR5IG9mIG1vc3Qgb2YgbWVtb3J5
LCBidXQgbWlzc2VkIGEgZmV3CmFzcGVjdHMgd2hlbiBpdCBjYW1lIHRvIHRoZSBUU1MuCgpHaXZl
biB0aGF0IHRoZSBUU1MgaXMganVzdCBhbiBvYmplY3QgaW4gcGVyY3B1IGRhdGEsIHRoZSA0ayBt
YXBwaW5nIGZvciBpdApjcmVhdGVkIGluIHNldHVwX2NwdV9yb290X3BndCgpIG1hcHMgYWRqYWNl
bnQgcGVyY3B1IGRhdGEsIG1ha2luZyBpdCBhbGwKbGVha2FibGUgdmlhIE1lbHRkb3duLCBldmVu
IHdoZW4gWFBUSSBpcyBpbiB1c2UuCgpGdXJ0aGVybW9yZSwgbm8gY2FyZSBpcyB0YWtlbiB0byBj
aGVjayB0aGF0IHRoZSBUU1MgZG9lc24ndCBjcm9zcyBhIHBhZ2UKYm91bmRhcnkuICBBcyBpdCB0
dXJucyBvdXQsIHN0cnVjdCB0c3Nfc3RydWN0IGlzIGFsaWduZWQgb24gaXRzIHNpemUgd2hpY2gK
ZG9lcyBwcmV2ZW50IGl0IHN0cmFkZGxpbmcgYSBwYWdlIGJvdW5kYXJ5LgoKTW92ZSB0aGUgVFNT
IGludG8gdGhlIHBhZ2UgYWxpZ25lZCBwZXJjcHUgYXJlYSwgc28gbm8gYWRqYWNlbnQgZGF0YSBj
YW4gYmUKbGVha2VkLiAgTW92ZSB0aGUgZGVmaW5pdGlvbiBmcm9tIHNldHVwLmMgdG8gdHJhcHMu
Yywgd2hpY2ggaXMgYSBtb3JlCmFwcHJvcHJpYXRlIHBsYWNlIGZvciBpdCB0byBsaXZlLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2
aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ0M6
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCnYzOgogKiBEcm9w
IHRoZSByZW1hcmsgYWJvdXQgQ0VULiAgSXQgaXMgbm8gbG9uZ2VyIGFjY3VyYXRlIGluIHRoZSBs
YXRlc3QgdmVyc2lvbgogICBvZiB0aGUgQ0VUIHNwZWMuCgp2MjoKICogUmViYXNlIG92ZXIgY2hh
bmdlcyB0byBpbmNsdWRlIF9fYWxpZ25lZCgpIHdpdGhpbgogICBERUZJTkVfUEVSX0NQVV9QQUdF
X0FMSUdORUQoKQogKiBEcm9wIG5vdy11bnVzZWQgeGVuL3BlcmNwdS5oIGZyb20gc2V0dXAuYwot
LS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgfCAzIC0tLQogeGVuL2FyY2gveDg2
L3RyYXBzLmMgICAgICAgICAgICB8IDYgKysrKysrCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAg
ICAgICAgIHwgMiArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCB8IDQgKystLQog
NCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXgg
ZDIwMTE5MTBmYS4uZjlkMzgxNTVkMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMK
KysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE2LDcgKzE2LDYgQEAKICNpbmNsdWRlIDx4
ZW4vZG9tYWluX3BhZ2UuaD4KICNpbmNsdWRlIDx4ZW4vdmVyc2lvbi5oPgogI2luY2x1ZGUgPHhl
bi9nZGJzdHViLmg+Ci0jaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgogI2luY2x1ZGUgPHhlbi9oeXBl
cmNhbGwuaD4KICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgogI2luY2x1ZGUgPHhlbi9udW1h
Lmg+CkBAIC0xMDAsOCArOTksNiBAQCB1bnNpZ25lZCBsb25nIF9fcmVhZF9tb3N0bHkgeGVuX3Bo
eXNfc3RhcnQ7CiAKIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSB4ZW5fdmlydF9lbmQ7CiAK
LURFRklORV9QRVJfQ1BVKHN0cnVjdCB0c3Nfc3RydWN0LCBpbml0X3Rzcyk7Ci0KIGNoYXIgX19z
ZWN0aW9uKCIuYnNzLnN0YWNrX2FsaWduZWQiKSBfX2FsaWduZWQoU1RBQ0tfU0laRSkKICAgICBj
cHUwX3N0YWNrW1NUQUNLX1NJWkVdOwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdHJhcHMu
YyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCmluZGV4IDM4ZDEyMDEzZGIuLmRlM2FjMTM1ZjUgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5j
CkBAIC0xMDgsNiArMTA4LDEyIEBAIGlkdF9lbnRyeV90IF9fc2VjdGlvbigiLmJzcy5wYWdlX2Fs
aWduZWQiKSBfX2FsaWduZWQoUEFHRV9TSVpFKQogLyogUG9pbnRlciB0byB0aGUgSURUIG9mIGV2
ZXJ5IENQVS4gKi8KIGlkdF9lbnRyeV90ICppZHRfdGFibGVzW05SX0NQVVNdIF9fcmVhZF9tb3N0
bHk7CiAKKy8qCisgKiBUaGUgVFNTIGlzIHNtYWxsZXIgdGhhbiBhIHBhZ2UsIGJ1dCB3ZSBnaXZl
IGl0IGEgZnVsbCBwYWdlIHRvIGF2b2lkCisgKiBhZGphY2VudCBwZXItY3B1IGRhdGEgbGVha2lu
ZyB2aWEgTWVsdGRvd24gd2hlbiBYUFRJIGlzIGluIHVzZS4KKyAqLworREVGSU5FX1BFUl9DUFVf
UEFHRV9BTElHTkVEKHN0cnVjdCB0c3Nfc3RydWN0LCBpbml0X3Rzcyk7CisKIGJvb2wgKCppb2Vt
dWxfaGFuZGxlX3F1aXJrKSgKICAgICB1OCBvcGNvZGUsIGNoYXIgKmlvX2VtdWxfc3R1Yiwgc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCAzYmYyMTk3NWEyLi4yNzMyZjMw
YmU1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKQEAgLTM3MCw2ICszNzAsOCBAQCBBU1NFUlQoSVNfQUxJR05FRChfXzJNX3J3
ZGF0YV9lbmQsICAgU0VDVElPTl9BTElHTiksICJfXzJNX3J3ZGF0YV9lbmQgbWlzYWxpZ25lZAog
CiBBU1NFUlQoSVNfQUxJR05FRChjcHUwX3N0YWNrLCBTVEFDS19TSVpFKSwgImNwdTBfc3RhY2sg
bWlzYWxpZ25lZCIpCiAKK0FTU0VSVChJU19BTElHTkVEKHBlcl9jcHVfX2luaXRfdHNzLCBQQUdF
X1NJWkUpLCAicGVyX2NwdShpbml0X3RzcykgbWlzYWxpZ25lZCIpCisKIEFTU0VSVChJU19BTElH
TkVEKF9faW5pdF9iZWdpbiwgUEFHRV9TSVpFKSwgIl9faW5pdF9iZWdpbiBtaXNhbGlnbmVkIikK
IEFTU0VSVChJU19BTElHTkVEKF9faW5pdF9lbmQsICAgUEFHRV9TSVpFKSwgIl9faW5pdF9lbmQg
bWlzYWxpZ25lZCIpCiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29y
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCmluZGV4IDI4NjIzMjFlZWUuLmI1
YmVlOTQ5MzEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaApAQCAtNDExLDcgKzQxMSw3IEBAIHN0
YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX19td2FpdCh1bnNpZ25lZCBsb25nIGVheCwgdW5zaWdu
ZWQgbG9uZyBlY3gpCiAjZGVmaW5lIElPQk1QX0JZVEVTICAgICAgICAgICAgIDgxOTIKICNkZWZp
bmUgSU9CTVBfSU5WQUxJRF9PRkZTRVQgICAgMHg4MDAwCiAKLXN0cnVjdCBfX3BhY2tlZCBfX2Nh
Y2hlbGluZV9hbGlnbmVkIHRzc19zdHJ1Y3Qgeworc3RydWN0IF9fcGFja2VkIHRzc19zdHJ1Y3Qg
ewogICAgIHVpbnQzMl90IDozMjsKICAgICB1aW50NjRfdCByc3AwLCByc3AxLCByc3AyOwogICAg
IHVpbnQ2NF90IDo2NDsKQEAgLTQyNSw2ICs0MjUsNyBAQCBzdHJ1Y3QgX19wYWNrZWQgX19jYWNo
ZWxpbmVfYWxpZ25lZCB0c3Nfc3RydWN0IHsKICAgICAvKiBQYWRzIHRoZSBUU1MgdG8gYmUgY2Fj
aGVsaW5lLWFsaWduZWQgKHRvdGFsIHNpemUgaXMgMHg4MCkuICovCiAgICAgdWludDhfdCBfX2Nh
Y2hlbGluZV9maWxsZXJbMjRdOwogfTsKK0RFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdHNzX3N0cnVj
dCwgaW5pdF90c3MpOwogCiAjZGVmaW5lIElTVF9OT05FIDBVTAogI2RlZmluZSBJU1RfREYgICAx
VUwKQEAgLTQ2Myw3ICs0NjQsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZGlzYWJsZV9lYWNoX2lz
dChpZHRfZW50cnlfdCAqaWR0KQogZXh0ZXJuIGlkdF9lbnRyeV90IGlkdF90YWJsZVtdOwogZXh0
ZXJuIGlkdF9lbnRyeV90ICppZHRfdGFibGVzW107CiAKLURFQ0xBUkVfUEVSX0NQVShzdHJ1Y3Qg
dHNzX3N0cnVjdCwgaW5pdF90c3MpOwogREVDTEFSRV9QRVJfQ1BVKHJvb3RfcGdlbnRyeV90ICos
IHJvb3RfcGd0KTsKIAogZXh0ZXJuIHZvaWQgd3JpdGVfcHRiYXNlKHN0cnVjdCB2Y3B1ICp2KTsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
