Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5912409A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 08:52:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihU5K-0003mO-CO; Wed, 18 Dec 2019 07:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihU5J-0003lu-5i
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 07:49:29 +0000
X-Inumbo-ID: deef0b90-216a-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deef0b90-216a-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 07:49:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC402AE52;
 Wed, 18 Dec 2019 07:49:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 08:48:58 +0100
Message-Id: <20191218074859.21665-9-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191218074859.21665-1-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 8/9] xen/sched: eliminate sched_tick_suspend()
 and sched_tick_resume()
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c2NoZWRfdGlja19zdXNwZW5kKCkgYW5kIHNjaGVkX3RpY2tfcmVzdW1lKCkgb25seSBjYWxsIHJj
dSByZWxhdGVkCmZ1bmN0aW9ucywgc28gZWxpbWluYXRlIHRoZW0gYW5kIGRvIHRoZSByY3VfaWRs
ZV90aW1lciooKSBjYWxsaW5nIGluCnJjdV9pZGxlX1tlbnRlcnxleGl0XSgpLgoKU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL2FybS9k
b21haW4uYyAgICAgICAgIHwgIDYgKysrLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5j
ICB8IDE1ICsrKysrKysrLS0tLS0tLQogeGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMgfCAg
OCArKysrLS0tLQogeGVuL2NvbW1vbi9yY3VwZGF0ZS5jICAgICAgICAgfCAgNyArKysrKy0tCiB4
ZW4vY29tbW9uL3NjaGVkL3NjaGVkdWxlLmMgICB8IDEyIC0tLS0tLS0tLS0tLQogeGVuL2luY2x1
ZGUveGVuL3JjdXBkYXRlLmggICAgfCAgMyAtLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAg
ICAgIHwgIDIgLS0KIDcgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJt
L2RvbWFpbi5jCmluZGV4IGMwYTEzYWEwYWIuLmFhM2RmM2IzYmEgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9kb21haW4uYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKQEAgLTQ2LDggKzQ2
LDggQEAgc3RhdGljIHZvaWQgZG9faWRsZSh2b2lkKQogewogICAgIHVuc2lnbmVkIGludCBjcHUg
PSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAKLSAgICBzY2hlZF90aWNrX3N1c3BlbmQoKTsKLSAgICAv
KiBzY2hlZF90aWNrX3N1c3BlbmQoKSBjYW4gcmFpc2UgVElNRVJfU09GVElSUS4gUHJvY2VzcyBp
dCBub3cuICovCisgICAgcmN1X2lkbGVfZW50ZXIoY3B1KTsKKyAgICAvKiByY3VfaWRsZV9lbnRl
cigpIGNhbiByYWlzZSBUSU1FUl9TT0ZUSVJRLiBQcm9jZXNzIGl0IG5vdy4gKi8KICAgICBwcm9j
ZXNzX3BlbmRpbmdfc29mdGlycXMoKTsKIAogICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7CkBAIC01
OCw3ICs1OCw3IEBAIHN0YXRpYyB2b2lkIGRvX2lkbGUodm9pZCkKICAgICB9CiAgICAgbG9jYWxf
aXJxX2VuYWJsZSgpOwogCi0gICAgc2NoZWRfdGlja19yZXN1bWUoKTsKKyAgICByY3VfaWRsZV9l
eGl0KGNwdSk7CiB9CiAKIHZvaWQgaWRsZV9sb29wKHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvYWNwaS9jcHVfaWRsZS5jIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwppbmRl
eCA1ZWRkMTg0NGY0Li4yNjc2ZjBkN2RhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9j
cHVfaWRsZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKQEAgLTU5OSw3ICs1
OTksOCBAQCB2b2lkIHVwZGF0ZV9pZGxlX3N0YXRzKHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9wb3dl
ciAqcG93ZXIsCiAKIHN0YXRpYyB2b2lkIGFjcGlfcHJvY2Vzc29yX2lkbGUodm9pZCkKIHsKLSAg
ICBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKnBvd2VyID0gcHJvY2Vzc29yX3Bvd2Vyc1tz
bXBfcHJvY2Vzc29yX2lkKCldOworICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29y
X2lkKCk7CisgICAgc3RydWN0IGFjcGlfcHJvY2Vzc29yX3Bvd2VyICpwb3dlciA9IHByb2Nlc3Nv
cl9wb3dlcnNbY3B1XTsKICAgICBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfY3ggKmN4ID0gTlVMTDsK
ICAgICBpbnQgbmV4dF9zdGF0ZTsKICAgICB1aW50NjRfdCB0MSwgdDIgPSAwOwpAQCAtNjQ4LDgg
KzY0OSw4IEBAIHN0YXRpYyB2b2lkIGFjcGlfcHJvY2Vzc29yX2lkbGUodm9pZCkKIAogICAgIGNw
dWZyZXFfZGJzX3RpbWVyX3N1c3BlbmQoKTsKIAotICAgIHNjaGVkX3RpY2tfc3VzcGVuZCgpOwot
ICAgIC8qIHNjaGVkX3RpY2tfc3VzcGVuZCgpIGNhbiByYWlzZSBUSU1FUl9TT0ZUSVJRLiBQcm9j
ZXNzIGl0IG5vdy4gKi8KKyAgICByY3VfaWRsZV9lbnRlcihjcHUpOworICAgIC8qIHJjdV9pZGxl
X2VudGVyKCkgY2FuIHJhaXNlIFRJTUVSX1NPRlRJUlEuIFByb2Nlc3MgaXQgbm93LiAqLwogICAg
IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOwogCiAgICAgLyoKQEAgLTY1OCwxMCArNjU5LDEw
IEBAIHN0YXRpYyB2b2lkIGFjcGlfcHJvY2Vzc29yX2lkbGUodm9pZCkKICAgICAgKi8KICAgICBs
b2NhbF9pcnFfZGlzYWJsZSgpOwogCi0gICAgaWYgKCAhY3B1X2lzX2hhbHRhYmxlKHNtcF9wcm9j
ZXNzb3JfaWQoKSkgKQorICAgIGlmICggIWNwdV9pc19oYWx0YWJsZShjcHUpICkKICAgICB7CiAg
ICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKLSAgICAgICAgc2NoZWRfdGlja19yZXN1bWUoKTsK
KyAgICAgICAgcmN1X2lkbGVfZXhpdChjcHUpOwogICAgICAgICBjcHVmcmVxX2Ric190aW1lcl9y
ZXN1bWUoKTsKICAgICAgICAgcmV0dXJuOwogICAgIH0KQEAgLTc4Niw3ICs3ODcsNyBAQCBzdGF0
aWMgdm9pZCBhY3BpX3Byb2Nlc3Nvcl9pZGxlKHZvaWQpCiAgICAgICAgIC8qIE5vdyBpbiBDMCAq
LwogICAgICAgICBwb3dlci0+bGFzdF9zdGF0ZSA9ICZwb3dlci0+c3RhdGVzWzBdOwogICAgICAg
ICBsb2NhbF9pcnFfZW5hYmxlKCk7Ci0gICAgICAgIHNjaGVkX3RpY2tfcmVzdW1lKCk7CisgICAg
ICAgIHJjdV9pZGxlX2V4aXQoY3B1KTsKICAgICAgICAgY3B1ZnJlcV9kYnNfdGltZXJfcmVzdW1l
KCk7CiAgICAgICAgIHJldHVybjsKICAgICB9CkBAIC03OTQsNyArNzk1LDcgQEAgc3RhdGljIHZv
aWQgYWNwaV9wcm9jZXNzb3JfaWRsZSh2b2lkKQogICAgIC8qIE5vdyBpbiBDMCAqLwogICAgIHBv
d2VyLT5sYXN0X3N0YXRlID0gJnBvd2VyLT5zdGF0ZXNbMF07CiAKLSAgICBzY2hlZF90aWNrX3Jl
c3VtZSgpOworICAgIHJjdV9pZGxlX2V4aXQoY3B1KTsKICAgICBjcHVmcmVxX2Ric190aW1lcl9y
ZXN1bWUoKTsKIAogICAgIGlmICggY3B1aWRsZV9jdXJyZW50X2dvdmVybm9yLT5yZWZsZWN0ICkK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5jIGIveGVuL2FyY2gveDg2
L2NwdS9td2FpdC1pZGxlLmMKaW5kZXggNTI0MTNlNmRhMS4uZjQ5YjA0YzQ1YiAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9t
d2FpdC1pZGxlLmMKQEAgLTc1NSw4ICs3NTUsOCBAQCBzdGF0aWMgdm9pZCBtd2FpdF9pZGxlKHZv
aWQpCiAKIAljcHVmcmVxX2Ric190aW1lcl9zdXNwZW5kKCk7CiAKLQlzY2hlZF90aWNrX3N1c3Bl
bmQoKTsKLQkvKiBzY2hlZF90aWNrX3N1c3BlbmQoKSBjYW4gcmFpc2UgVElNRVJfU09GVElSUS4g
UHJvY2VzcyBpdCBub3cuICovCisJcmN1X2lkbGVfZW50ZXIoY3B1KTsKKwkvKiByY3VfaWRsZV9l
bnRlcigpIGNhbiByYWlzZSBUSU1FUl9TT0ZUSVJRLiBQcm9jZXNzIGl0IG5vdy4gKi8KIAlwcm9j
ZXNzX3BlbmRpbmdfc29mdGlycXMoKTsKIAogCS8qIEludGVycnVwdHMgbXVzdCBiZSBkaXNhYmxl
ZCBmb3IgQzIgYW5kIGhpZ2hlciB0cmFuc2l0aW9ucy4gKi8KQEAgLTc2NCw3ICs3NjQsNyBAQCBz
dGF0aWMgdm9pZCBtd2FpdF9pZGxlKHZvaWQpCiAKIAlpZiAoIWNwdV9pc19oYWx0YWJsZShjcHUp
KSB7CiAJCWxvY2FsX2lycV9lbmFibGUoKTsKLQkJc2NoZWRfdGlja19yZXN1bWUoKTsKKwkJcmN1
X2lkbGVfZXhpdChjcHUpOwogCQljcHVmcmVxX2Ric190aW1lcl9yZXN1bWUoKTsKIAkJcmV0dXJu
OwogCX0KQEAgLTgwNiw3ICs4MDYsNyBAQCBzdGF0aWMgdm9pZCBtd2FpdF9pZGxlKHZvaWQpCiAJ
aWYgKCEobGFwaWNfdGltZXJfcmVsaWFibGVfc3RhdGVzICYgKDEgPDwgY3N0YXRlKSkpCiAJCWxh
cGljX3RpbWVyX29uKCk7CiAKLQlzY2hlZF90aWNrX3Jlc3VtZSgpOworCXJjdV9pZGxlX2V4aXQo
Y3B1KTsKIAljcHVmcmVxX2Ric190aW1lcl9yZXN1bWUoKTsKIAogCWlmICggY3B1aWRsZV9jdXJy
ZW50X2dvdmVybm9yLT5yZWZsZWN0ICkKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcmN1cGRhdGUu
YyBiL3hlbi9jb21tb24vcmN1cGRhdGUuYwppbmRleCBhNTYxMDNjNmY3Li5jYjcxMmM4NjkwIDEw
MDY0NAotLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMKKysrIGIveGVuL2NvbW1vbi9yY3VwZGF0
ZS5jCkBAIC00NTksNyArNDU5LDcgQEAgaW50IHJjdV9uZWVkc19jcHUoaW50IGNwdSkKICAqIHBl
cmlvZGljYWxseSBwb2tlIHJjdV9wZWRuaW5nKCksIHNvIHRoYXQgaXQgd2lsbCBpbnZva2UgdGhl
IGNhbGxiYWNrCiAgKiBub3QgdG9vIGxhdGUgYWZ0ZXIgdGhlIGVuZCBvZiB0aGUgZ3JhY2UgcGVy
aW9kLgogICovCi12b2lkIHJjdV9pZGxlX3RpbWVyX3N0YXJ0KCkKK3N0YXRpYyB2b2lkIHJjdV9p
ZGxlX3RpbWVyX3N0YXJ0KHZvaWQpCiB7CiAgICAgc3RydWN0IHJjdV9kYXRhICpyZHAgPSAmdGhp
c19jcHUocmN1X2RhdGEpOwogCkBAIC00NzUsNyArNDc1LDcgQEAgdm9pZCByY3VfaWRsZV90aW1l
cl9zdGFydCgpCiAgICAgcmRwLT5pZGxlX3RpbWVyX2FjdGl2ZSA9IHRydWU7CiB9CiAKLXZvaWQg
cmN1X2lkbGVfdGltZXJfc3RvcCgpCitzdGF0aWMgdm9pZCByY3VfaWRsZV90aW1lcl9zdG9wKHZv
aWQpCiB7CiAgICAgc3RydWN0IHJjdV9kYXRhICpyZHAgPSAmdGhpc19jcHUocmN1X2RhdGEpOwog
CkBAIC02MzMsMTAgKzYzMywxMyBAQCB2b2lkIHJjdV9pZGxlX2VudGVyKHVuc2lnbmVkIGludCBj
cHUpCiAgICAgICogU2UgdGhlIGNvbW1lbnQgYmVmb3JlIGNwdW1hc2tfYW5kbm90KCkgaW4gIHJj
dV9zdGFydF9iYXRjaCgpLgogICAgICAqLwogICAgIHNtcF9tYigpOworCisgICAgcmN1X2lkbGVf
dGltZXJfc3RhcnQoKTsKIH0KIAogdm9pZCByY3VfaWRsZV9leGl0KHVuc2lnbmVkIGludCBjcHUp
CiB7CisgICAgcmN1X2lkbGVfdGltZXJfc3RvcCgpOwogICAgIEFTU0VSVChjcHVtYXNrX3Rlc3Rf
Y3B1KGNwdSwgJnJjdV9jdHJsYmxrLmlkbGVfY3B1bWFzaykpOwogICAgIGNwdW1hc2tfY2xlYXJf
Y3B1KGNwdSwgJnJjdV9jdHJsYmxrLmlkbGVfY3B1bWFzayk7CiB9CmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL3NjaGVkL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkL3NjaGVkdWxlLmMKaW5k
ZXggMzMwN2U4OGI2Yy4uZGRiZmFjZTk2OSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9z
Y2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWQvc2NoZWR1bGUuYwpAQCAtMzI2NSwxOCAr
MzI2NSw2IEBAIHZvaWQgc2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICByY3Vf
cmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KIAotdm9pZCBzY2hlZF90aWNrX3N1
c3BlbmQodm9pZCkKLXsKLSAgICByY3VfaWRsZV9lbnRlcihzbXBfcHJvY2Vzc29yX2lkKCkpOwot
ICAgIHJjdV9pZGxlX3RpbWVyX3N0YXJ0KCk7Ci19Ci0KLXZvaWQgc2NoZWRfdGlja19yZXN1bWUo
dm9pZCkKLXsKLSAgICByY3VfaWRsZV90aW1lcl9zdG9wKCk7Ci0gICAgcmN1X2lkbGVfZXhpdChz
bXBfcHJvY2Vzc29yX2lkKCkpOwotfQotCiB2b2lkIHdhaXQodm9pZCkKIHsKICAgICBzY2hlZHVs
ZSgpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmggYi94ZW4vaW5jbHVk
ZS94ZW4vcmN1cGRhdGUuaAppbmRleCAxMzg1MDg2NWVkLi4xNzRkMDU4MTEzIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcmN1cGRh
dGUuaApAQCAtMTQ4LDcgKzE0OCw0IEBAIGludCByY3VfYmFycmllcih2b2lkKTsKIHZvaWQgcmN1
X2lkbGVfZW50ZXIodW5zaWduZWQgaW50IGNwdSk7CiB2b2lkIHJjdV9pZGxlX2V4aXQodW5zaWdu
ZWQgaW50IGNwdSk7CiAKLXZvaWQgcmN1X2lkbGVfdGltZXJfc3RhcnQodm9pZCk7Ci12b2lkIHJj
dV9pZGxlX3RpbWVyX3N0b3Aodm9pZCk7Ci0KICNlbmRpZiAvKiBfX1hFTl9SQ1VQREFURV9IICov
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oCmluZGV4IGIyZjQ4YTM1MTIuLmU0MjYzZGUyZDUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC02ODgsOCAr
Njg4LDYgQEAgdm9pZCBzY2hlZF9kZXN0cm95X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKTsKIGxv
bmcgc2NoZWRfYWRqdXN0KHN0cnVjdCBkb21haW4gKiwgc3RydWN0IHhlbl9kb21jdGxfc2NoZWR1
bGVyX29wICopOwogbG9uZyBzY2hlZF9hZGp1c3RfZ2xvYmFsKHN0cnVjdCB4ZW5fc3lzY3RsX3Nj
aGVkdWxlcl9vcCAqKTsKIGludCAgc2NoZWRfaWQodm9pZCk7Ci12b2lkIHNjaGVkX3RpY2tfc3Vz
cGVuZCh2b2lkKTsKLXZvaWQgc2NoZWRfdGlja19yZXN1bWUodm9pZCk7CiB2b2lkIHZjcHVfd2Fr
ZShzdHJ1Y3QgdmNwdSAqdik7CiBsb25nIHZjcHVfeWllbGQodm9pZCk7CiB2b2lkIHZjcHVfc2xl
ZXBfbm9zeW5jKHN0cnVjdCB2Y3B1ICp2KTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
