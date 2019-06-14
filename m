Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BE4631C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:42:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hboI9-0006kp-Do; Fri, 14 Jun 2019 15:39:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hboI7-0006ke-HY
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:38:59 +0000
X-Inumbo-ID: 865f6484-8eba-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 865f6484-8eba-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:38:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 09:38:57 -0600
Message-Id: <5D03BF8E020000780023861C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 09:38:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D03BE5102000078002385FE@prv1-mh.provo.novell.com>
In-Reply-To: <5D03BE5102000078002385FE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 4/4] drop __get_cpu_var() and __get_cpu_ptr()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dGhpc19jcHV7LF9wdHJ9KCkgYXJlIHNob3J0ZXIsIGFuZCBoYXZlIHByZXZpb3VzbHkgYmVlbiBt
YXJrZWQgYXMKcHJlZmVycmVkIGluIFhlbiBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMKKysr
IGIveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCkBAIC0yMjUsNyArMjI1LDcgQEAgdm9pZCBjYWxsX3Jj
dShzdHJ1Y3QgcmN1X2hlYWQgKmhlYWQsCiAgICAgaGVhZC0+ZnVuYyA9IGZ1bmM7CiAgICAgaGVh
ZC0+bmV4dCA9IE5VTEw7CiAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwotICAgIHJkcCA9ICZf
X2dldF9jcHVfdmFyKHJjdV9kYXRhKTsKKyAgICByZHAgPSAmdGhpc19jcHUocmN1X2RhdGEpOwog
ICAgICpyZHAtPm54dHRhaWwgPSBoZWFkOwogICAgIHJkcC0+bnh0dGFpbCA9ICZoZWFkLT5uZXh0
OwogICAgIGlmICh1bmxpa2VseSgrK3JkcC0+cWxlbiA+IHFoaW1hcmspKSB7CkBAIC00MDksNyAr
NDA5LDcgQEAgc3RhdGljIHZvaWQgX19yY3VfcHJvY2Vzc19jYWxsYmFja3Moc3RydQogCiBzdGF0
aWMgdm9pZCByY3VfcHJvY2Vzc19jYWxsYmFja3Modm9pZCkKIHsKLSAgICBfX3JjdV9wcm9jZXNz
X2NhbGxiYWNrcygmcmN1X2N0cmxibGssICZfX2dldF9jcHVfdmFyKHJjdV9kYXRhKSk7CisgICAg
X19yY3VfcHJvY2Vzc19jYWxsYmFja3MoJnJjdV9jdHJsYmxrLCAmdGhpc19jcHUocmN1X2RhdGEp
KTsKIH0KIAogc3RhdGljIGludCBfX3JjdV9wZW5kaW5nKHN0cnVjdCByY3VfY3RybGJsayAqcmNw
LCBzdHJ1Y3QgcmN1X2RhdGEgKnJkcCkKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wZXJjcHUu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BlcmNwdS5oCkBAIC0xNywxMiArMTcsMTIgQEAg
dm9pZCBwZXJjcHVfaW5pdF9hcmVhcyh2b2lkKTsKIAogI2RlZmluZSBwZXJfY3B1KHZhciwgY3B1
KSAgXAogICAgICgqUkVMT0NfSElERSgmcGVyX2NwdV9fIyN2YXIsIF9fcGVyX2NwdV9vZmZzZXRb
Y3B1XSkpCi0jZGVmaW5lIF9fZ2V0X2NwdV92YXIodmFyKSBcCisjZGVmaW5lIHRoaXNfY3B1KHZh
cikgXAogICAgICgqUkVMT0NfSElERSgmcGVyX2NwdV9fIyN2YXIsIFJFQURfU1lTUkVHKFRQSURS
X0VMMikpKQogCiAjZGVmaW5lIHBlcl9jcHVfcHRyKHZhciwgY3B1KSAgXAogICAgICgqUkVMT0Nf
SElERSh2YXIsIF9fcGVyX2NwdV9vZmZzZXRbY3B1XSkpCi0jZGVmaW5lIF9fZ2V0X2NwdV9wdHIo
dmFyKSBcCisjZGVmaW5lIHRoaXNfY3B1X3B0cih2YXIpIFwKICAgICAoKlJFTE9DX0hJREUodmFy
LCBSRUFEX1NZU1JFRyhUUElEUl9FTDIpKSkKIAogI2RlZmluZSBERUNMQVJFX1BFUl9DUFUodHlw
ZSwgbmFtZSkgZXh0ZXJuIF9fdHlwZW9mX18odHlwZSkgcGVyX2NwdV9fIyNuYW1lCi0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvcGVyY3B1LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wZXJj
cHUuaApAQCAtMTUsMTIgKzE1LDEyIEBAIHZvaWQgcGVyY3B1X2luaXRfYXJlYXModm9pZCk7CiAv
KiB2YXIgaXMgaW4gZGlzY2FyZGVkIHJlZ2lvbjogb2Zmc2V0IHRvIHBhcnRpY3VsYXIgY29weSB3
ZSB3YW50ICovCiAjZGVmaW5lIHBlcl9jcHUodmFyLCBjcHUpICBcCiAgICAgKCpSRUxPQ19ISURF
KCZwZXJfY3B1X18jI3ZhciwgX19wZXJfY3B1X29mZnNldFtjcHVdKSkKLSNkZWZpbmUgX19nZXRf
Y3B1X3Zhcih2YXIpIFwKKyNkZWZpbmUgdGhpc19jcHUodmFyKSBcCiAgICAgKCpSRUxPQ19ISURF
KCZwZXJfY3B1X18jI3ZhciwgZ2V0X2NwdV9pbmZvKCktPnBlcl9jcHVfb2Zmc2V0KSkKIAogI2Rl
ZmluZSBERUNMQVJFX1BFUl9DUFUodHlwZSwgbmFtZSkgZXh0ZXJuIF9fdHlwZW9mX18odHlwZSkg
cGVyX2NwdV9fIyNuYW1lCiAKLSNkZWZpbmUgX19nZXRfY3B1X3B0cih2YXIpIFwKKyNkZWZpbmUg
dGhpc19jcHVfcHRyKHZhcikgXAogICAgICgqUkVMT0NfSElERSh2YXIsIGdldF9jcHVfaW5mbygp
LT5wZXJfY3B1X29mZnNldCkpCiAKICNkZWZpbmUgcGVyX2NwdV9wdHIodmFyLCBjcHUpICBcCi0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcGVyY3B1
LmgKQEAgLTEzLDExICsxMyw2IEBACiAjZGVmaW5lIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZ
KHR5cGUsIG5hbWUpIFwKIAlfX0RFRklORV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUsIC5yZWFkX21v
c3RseSkKIAotLyogUHJlZmVycmVkIG9uIFhlbi4gQWxzbyBzZWUgYXJjaC1kZWZpbmVkIHBlcl9j
cHUoKS4gKi8KLSNkZWZpbmUgdGhpc19jcHUodmFyKSAgICBfX2dldF9jcHVfdmFyKHZhcikKLQot
I2RlZmluZSB0aGlzX2NwdV9wdHIocHRyKSAgICBfX2dldF9jcHVfcHRyKHB0cikKLQogI2RlZmlu
ZSBnZXRfcGVyX2NwdV92YXIodmFyKSAgKHBlcl9jcHVfXyMjdmFyKQogCiAvKiBMaW51eCBjb21w
YXRpYmlsaXR5LiAqLwotLS0gYS94ZW4veHNtL2ZsYXNrL2F2Yy5jCisrKyBiL3hlbi94c20vZmxh
c2svYXZjLmMKQEAgLTU3LDkgKzU3LDkgQEAgY29uc3Qgc3RydWN0IHNlbGludXhfY2xhc3NfcGVy
bSBzZWxpbnV4XwogI2RlZmluZSBBVkNfQ0FDSEVfUkVDTEFJTSAgICAgICAgMTYKIAogI2lmZGVm
IENPTkZJR19YU01fRkxBU0tfQVZDX1NUQVRTCi0jZGVmaW5lIGF2Y19jYWNoZV9zdGF0c19pbmNy
KGZpZWxkKSAgICAgICAgICAgICAgICAgXAotZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAotICAgIF9fZ2V0X2NwdV92YXIoYXZjX2NhY2hlX3N0YXRzKS5maWVsZCsrOyAgICAg
ICAgXAorI2RlZmluZSBhdmNfY2FjaGVfc3RhdHNfaW5jcihmaWVsZCkgICAgXAorZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgIHRoaXNfY3B1KGF2Y19jYWNoZV9z
dGF0cykuZmllbGQrKzsgXAogfSB3aGlsZSAoMCkKICNlbHNlCiAjZGVmaW5lIGF2Y19jYWNoZV9z
dGF0c19pbmNyKGZpZWxkKSAgICBkbyB7fSB3aGlsZSAoMCkKCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
