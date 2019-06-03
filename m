Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B859033489
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:07:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRc-00025f-7L; Mon, 03 Jun 2019 16:04:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRa-00023a-6c
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:18 +0000
X-Inumbo-ID: 3d3ae388-8619-11e9-8d3d-37e54aa2a50d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3d3ae388-8619-11e9-8d3d-37e54aa2a50d;
 Mon, 03 Jun 2019 16:04:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E47A015AB;
 Mon,  3 Jun 2019 09:04:16 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B187C3F246;
 Mon,  3 Jun 2019 09:04:15 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:45 +0100
Message-Id: <20190603160350.29806-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 09/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c2V0X2dwZm5fZnJvbV9tZm4oKSBpcyBjdXJyZW50bHkgaW1wbGVtZW50IGluIGEgMiBwYXJ0IG1h
Y3Jvcy4gVGhlCnNlY29uZCBtYWNybyBpcyBvbmx5IGNhbGxlZCB3aXRoaW4gdGhlIGZpcnN0IG1h
Y3JvLCBzbyB0aGV5IGNhbiBiZQpmb2xkZWQgdG9nZXRoZXIuCgpGdXJ0aGVybW9yZSwgdGhpcyBp
cyBub3cgY29udmVydGVkIHRvIGEgc3RhdGljIGlubGluZSBtYWtpbmcgdGhlIGNvZGUKbW9yZSBy
ZWFkYWJsZSBhbmQgc2FmZXIuCgpBcyBzZXRfZ3Bmbl9mcm9tX21mbiBpcyBub3cgYSBzdGF0aWMg
aW5saW5lIGZ1bmN0aW9uLCB0aGUgZXh0ZXJuCnZhcmlhYmxlIGRvbV9jb3cgc2hvdWxkIGJlIGRl
ZmluZWQgZWFybGllciBvbi4gRm9yIGNvbnZlbmllbmNlLCB0aGUKZGVmaW5pdGlvbiBvZiBhbGwg
ZG9tXyogdmFyaWFibGVzIGFyZSBtb3ZlZCBlYXJsaWVyIG9uLgoKU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MzoK
ICAgICAgICAtIEFkZCBtaXNzaW5nIGJsYW5rCiAgICAgICAgLSBGaXggY29uZGl0aW9uCgogICAg
Q2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9tbS5oIHwgMjkgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5kZXggYmY5
MDkxNjA3Ny4uZGNhZTU1ODc2NCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtNDQyLDYgKzQ0Miw4IEBAIGludCBj
aGVja19kZXNjcmlwdG9yKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHNlZ19kZXNjX3QgKmRlc2Mp
OwogCiBleHRlcm4gcGFkZHJfdCBtZW1faG90cGx1ZzsKIAorZXh0ZXJuIHN0cnVjdCBkb21haW4g
KmRvbV94ZW4sICpkb21faW8sICpkb21fY293OwkvKiBmb3Igdm1jb3JlaW5mbyAqLworCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqCiAgKiBXaXRoIHNoYWRvdyBwYWdldGFibGVzLCB0aGUgZGlmZmVy
ZW50IGtpbmRzIG9mIGFkZHJlc3Mgc3RhcnQKICAqIHRvIGdldCBnZXQgY29uZnVzaW5nLgpAQCAt
NDgzLDI0ICs0ODUsMjUgQEAgZXh0ZXJuIHBhZGRyX3QgbWVtX2hvdHBsdWc7CiAjZGVmaW5lIFNI
QVJFRF9NMlAoX2UpICAgICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQogCiAjZGVm
aW5lIGNvbXBhdF9tYWNoaW5lX3RvX3BoeXNfbWFwcGluZyAoKHVuc2lnbmVkIGludCAqKVJEV1Jf
Q09NUEFUX01QVF9WSVJUX1NUQVJUKQotI2RlZmluZSBfc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBw
Zm4pICh7ICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgIHN0cnVjdCBkb21haW4gKmQgPSBw
YWdlX2dldF9vd25lcihtZm5fdG9fcGFnZShfbWZuKG1mbikpKTsgXAotICAgIHVuc2lnbmVkIGxv
bmcgZW50cnkgPSAoZCAmJiAoZCA9PSBkb21fY293KSkgPyAgICAgICAgICAgICAgXAotICAgICAg
ICBTSEFSRURfTTJQX0VOVFJZIDogKHBmbik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAotICAgICgodm9pZCkoKG1mbikgPj0gKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJEV1Jf
Q09NUEFUX01QVF9WSVJUX1NUQVJUKSAvIDQgfHwgXAotICAgICAgICAgICAgKGNvbXBhdF9tYWNo
aW5lX3RvX3BoeXNfbWFwcGluZ1sobWZuKV0gPSAodW5zaWduZWQgaW50KShlbnRyeSkpKSwgXAot
ICAgICBtYWNoaW5lX3RvX3BoeXNfbWFwcGluZ1sobWZuKV0gPSAoZW50cnkpKTsgICAgICAgICAg
ICAgICAgXAotICAgIH0pCiAKIC8qCiAgKiBEaXNhYmxlIHNvbWUgdXNlcnMgb2Ygc2V0X2dwZm5f
ZnJvbV9tZm4oKSAoZS5nLiwgZnJlZV9oZWFwX3BhZ2VzKCkpIHVudGlsCiAgKiB0aGUgbWFjaGlu
ZV90b19waHlzX21hcHBpbmcgaXMgYWN0dWFsbHkgc2V0IHVwLgogICovCiBleHRlcm4gYm9vbCBt
YWNoaW5lX3RvX3BoeXNfbWFwcGluZ192YWxpZDsKLSNkZWZpbmUgc2V0X2dwZm5fZnJvbV9tZm4o
bWZuLCBwZm4pIGRvIHsgICAgICAgIFwKLSAgICBpZiAoIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5n
X3ZhbGlkICkgICAgICAgIFwKLSAgICAgICAgX3NldF9ncGZuX2Zyb21fbWZuKG1mbiwgcGZuKTsg
ICAgICAgICAgIFwKLX0gd2hpbGUgKDApCisKK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfZ3Bmbl9m
cm9tX21mbih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pCit7CisgICAgc3Ry
dWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKG1mbl90b19wYWdlKF9tZm4obWZuKSkpOwor
ICAgIHVuc2lnbmVkIGxvbmcgZW50cnkgPSAoZCAmJiAoZCA9PSBkb21fY293KSkgPyBTSEFSRURf
TTJQX0VOVFJZIDogcGZuOworCisgICAgaWYgKCAhbWFjaGluZV90b19waHlzX21hcHBpbmdfdmFs
aWQgKQorICAgICAgICByZXR1cm47CisKKyAgICBpZiAoIG1mbiA8IChSRFdSX0NPTVBBVF9NUFRf
VklSVF9FTkQgLSBSRFdSX0NPTVBBVF9NUFRfVklSVF9TVEFSVCkgLyA0ICkKKyAgICAgICAgY29t
cGF0X21hY2hpbmVfdG9fcGh5c19tYXBwaW5nW21mbl0gPSBlbnRyeTsKKyAgICBtYWNoaW5lX3Rv
X3BoeXNfbWFwcGluZ1ttZm5dID0gZW50cnk7Cit9CiAKIGV4dGVybiBzdHJ1Y3QgcmFuZ2VzZXQg
Km1taW9fcm9fcmFuZ2VzOwogCkBAIC01OTAsOCArNTkzLDYgQEAgdW5zaWduZWQgaW50IGRvbWFp
bl9jbGFtcF9hbGxvY19iaXRzaXplKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBiaXRz
KTsKIAogdW5zaWduZWQgbG9uZyBkb21haW5fZ2V0X21heGltdW1fZ3BmbihzdHJ1Y3QgZG9tYWlu
ICpkKTsKIAotZXh0ZXJuIHN0cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21faW8sICpkb21fY293
OwkvKiBmb3Igdm1jb3JlaW5mbyAqLwotCiAvKiBEZWZpbml0aW9uIG9mIGFuIG1tIGxvY2s6IHNw
aW5sb2NrIHdpdGggZXh0cmEgZmllbGRzIGZvciBkZWJ1Z2dpbmcgKi8KIHR5cGVkZWYgc3RydWN0
IG1tX2xvY2sgewogICAgIHNwaW5sb2NrX3QgICAgICAgICBsb2NrOwotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
