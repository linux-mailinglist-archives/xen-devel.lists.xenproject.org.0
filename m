Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F41CCBF
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 18:16:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQa47-0001ce-HZ; Tue, 14 May 2019 16:14:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TJPZ=TO=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQa46-0001cY-BH
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:14:06 +0000
X-Inumbo-ID: 49835262-7663-11e9-b693-b7b8ae3e16fb
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49835262-7663-11e9-b693-b7b8ae3e16fb;
 Tue, 14 May 2019 16:14:02 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 62AD33031EDB; Tue, 14 May 2019 19:14:01 +0300 (EEST)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 46BD8306E477;
 Tue, 14 May 2019 19:14:01 +0300 (EEST)
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 19:13:57 +0300
Message-Id: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] x86/altp2m: move altp2m_get_effective_entry()
 under CONFIG_HVM
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
Cc: wei.liu2@citrix.com, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIGl0cyBjYWxsZXJzIGxpdmUgaW5zaWRlICNpZmRlZiBDT05GSUdfSFZNIHNlY3Rpb25zLgoK
U2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgfCA3MiArKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCB8
ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYwppbmRleCBjYzY2NjFlLi41N2M1ZWVkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0v
cDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC00NzgsNDIgKzQ3OCw2IEBAIHZv
aWQgcDJtX3VubG9ja19hbmRfdGxiX2ZsdXNoKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCiAgICAg
ICAgIG1tX3dyaXRlX3VubG9jaygmcDJtLT5sb2NrKTsKIH0KIAotaW50IGFsdHAybV9nZXRfZWZm
ZWN0aXZlX2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICphcDJtLCBnZm5fdCBnZm4sIG1mbl90ICpt
Zm4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCAqdCwgcDJtX2Fj
Y2Vzc190ICphLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHJlcG9wdWxh
dGUpCi17Ci0gICAgKm1mbiA9IGFwMm0tPmdldF9lbnRyeShhcDJtLCBnZm4sIHQsIGEsIDAsIE5V
TEwsIE5VTEwpOwotCi0gICAgLyogQ2hlY2sgaG9zdCBwMm0gaWYgbm8gdmFsaWQgZW50cnkgaW4g
YWx0ZXJuYXRlICovCi0gICAgaWYgKCAhbWZuX3ZhbGlkKCptZm4pICYmICFwMm1faXNfaG9zdHAy
bShhcDJtKSApCi0gICAgewotICAgICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSA9IHAybV9n
ZXRfaG9zdHAybShhcDJtLT5kb21haW4pOwotICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRl
cjsKLSAgICAgICAgaW50IHJjOwotCi0gICAgICAgICptZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nl
c3MoaHAybSwgZ2ZuX3goZ2ZuKSwgdCwgYSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOwotCi0gICAg
ICAgIHJjID0gLUVTUkNIOwotICAgICAgICBpZiAoICFtZm5fdmFsaWQoKm1mbikgfHwgKnQgIT0g
cDJtX3JhbV9ydyApCi0gICAgICAgICAgICByZXR1cm4gcmM7Ci0KLSAgICAgICAgLyogSWYgdGhp
cyBpcyBhIHN1cGVycGFnZSwgY29weSB0aGF0IGZpcnN0ICovCi0gICAgICAgIGlmICggcHJlcG9w
dWxhdGUgJiYgcGFnZV9vcmRlciAhPSBQQUdFX09SREVSXzRLICkKLSAgICAgICAgewotICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7Ci0g
ICAgICAgICAgICBnZm5fdCBnZm5fYWxpZ25lZCA9IF9nZm4oZ2ZuX3goZ2ZuKSAmIG1hc2spOwot
ICAgICAgICAgICAgbWZuX3QgbWZuX2FsaWduZWQgPSBfbWZuKG1mbl94KCptZm4pICYgbWFzayk7
Ci0KLSAgICAgICAgICAgIHJjID0gYXAybS0+c2V0X2VudHJ5KGFwMm0sIGdmbl9hbGlnbmVkLCBt
Zm5fYWxpZ25lZCwgcGFnZV9vcmRlciwgKnQsICphLCAxKTsKLSAgICAgICAgICAgIGlmICggcmMg
KQotICAgICAgICAgICAgICAgIHJldHVybiByYzsKLSAgICAgICAgfQotICAgIH0KLQotICAgIHJl
dHVybiAwOwotfQotCiBtZm5fdCBfX2dldF9nZm5fdHlwZV9hY2Nlc3Moc3RydWN0IHAybV9kb21h
aW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm5fbCwKICAgICAgICAgICAgICAgICAgICAgcDJtX3R5
cGVfdCAqdCwgcDJtX2FjY2Vzc190ICphLCBwMm1fcXVlcnlfdCBxLAogICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgKnBhZ2Vfb3JkZXIsIGJvb2xfdCBsb2NrZWQpCkBAIC0yMzc4LDYg
KzIzNDIsNDIgQEAgaW50IHVubWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAogCiAj
aWZkZWYgQ09ORklHX0hWTQogCitpbnQgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkoc3RydWN0
IHAybV9kb21haW4gKmFwMm0sIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwMm1fdHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBwcmVwb3B1bGF0ZSkKK3sKKyAgICAqbWZuID0g
YXAybS0+Z2V0X2VudHJ5KGFwMm0sIGdmbiwgdCwgYSwgMCwgTlVMTCwgTlVMTCk7CisKKyAgICAv
KiBDaGVjayBob3N0IHAybSBpZiBubyB2YWxpZCBlbnRyeSBpbiBhbHRlcm5hdGUgKi8KKyAgICBp
ZiAoICFtZm5fdmFsaWQoKm1mbikgJiYgIXAybV9pc19ob3N0cDJtKGFwMm0pICkKKyAgICB7Cisg
ICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpocDJtID0gcDJtX2dldF9ob3N0cDJtKGFwMm0tPmRv
bWFpbik7CisgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX29yZGVyOworICAgICAgICBpbnQgcmM7
CisKKyAgICAgICAgKm1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhocDJtLCBnZm5feChnZm4p
LCB0LCBhLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAyTV9BTExPQyB8
IFAyTV9VTlNIQVJFLCAmcGFnZV9vcmRlciwgMCk7CisKKyAgICAgICAgcmMgPSAtRVNSQ0g7Cisg
ICAgICAgIGlmICggIW1mbl92YWxpZCgqbWZuKSB8fCAqdCAhPSBwMm1fcmFtX3J3ICkKKyAgICAg
ICAgICAgIHJldHVybiByYzsKKworICAgICAgICAvKiBJZiB0aGlzIGlzIGEgc3VwZXJwYWdlLCBj
b3B5IHRoYXQgZmlyc3QgKi8KKyAgICAgICAgaWYgKCBwcmVwb3B1bGF0ZSAmJiBwYWdlX29yZGVy
ICE9IFBBR0VfT1JERVJfNEsgKQorICAgICAgICB7CisgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IG1hc2sgPSB+KCgxVUwgPDwgcGFnZV9vcmRlcikgLSAxKTsKKyAgICAgICAgICAgIGdmbl90IGdm
bl9hbGlnbmVkID0gX2dmbihnZm5feChnZm4pICYgbWFzayk7CisgICAgICAgICAgICBtZm5fdCBt
Zm5fYWxpZ25lZCA9IF9tZm4obWZuX3goKm1mbikgJiBtYXNrKTsKKworICAgICAgICAgICAgcmMg
PSBhcDJtLT5zZXRfZW50cnkoYXAybSwgZ2ZuX2FsaWduZWQsIG1mbl9hbGlnbmVkLCBwYWdlX29y
ZGVyLCAqdCwgKmEsIDEpOworICAgICAgICAgICAgaWYgKCByYyApCisgICAgICAgICAgICAgICAg
cmV0dXJuIHJjOworICAgICAgICB9CisgICAgfQorCisgICAgcmV0dXJuIDA7Cit9CisKIHZvaWQg
cDJtX2FsdHAybV9jaGVjayhzdHJ1Y3QgdmNwdSAqdiwgdWludDE2X3QgaWR4KQogewogICAgIGlm
ICggYWx0cDJtX2FjdGl2ZSh2LT5kb21haW4pICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvcDJtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCmluZGV4IDJkMGJkYTEuLjdl
NzFiZjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9wMm0uaApAQCAtNTE0LDYgKzUxNCw3IEBAIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBtZm5fdG9fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIG1mbl90IG1mbikKICAgICAg
ICAgcmV0dXJuIG1mbl94KG1mbik7CiB9CiAKKyNpZmRlZiBDT05GSUdfSFZNCiAjZGVmaW5lIEFQ
Mk1HRVRfcHJlcG9wdWxhdGUgdHJ1ZQogI2RlZmluZSBBUDJNR0VUX3F1ZXJ5IGZhbHNlCiAKQEAg
LTUyNSw2ICs1MjYsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbWZuX3RvX2dmbihz
dHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBtZm4pCiBpbnQgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50
cnkoc3RydWN0IHAybV9kb21haW4gKmFwMm0sIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBwcmVwb3B1bGF0ZSk7CisjZW5k
aWYKIAogLyogRGVhZGxvY2stYXZvaWRhbmNlIHNjaGVtZSB3aGVuIGNhbGxpbmcgZ2V0X2dmbiBv
biBkaWZmZXJlbnQgZ2ZuJ3MgKi8KIHN0cnVjdCB0d29fZ2ZucyB7Ci0tIAoyLjcuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
