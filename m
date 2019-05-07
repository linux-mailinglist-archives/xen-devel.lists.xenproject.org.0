Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6741516682
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:18:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1oc-0007Vq-Qi; Tue, 07 May 2019 15:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1ob-0007UV-5f
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:33 +0000
X-Inumbo-ID: f4392e90-70da-11e9-82a8-5b2083d4bc8e
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f4392e90-70da-11e9-82a8-5b2083d4bc8e;
 Tue, 07 May 2019 15:15:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35F4F15AD;
 Tue,  7 May 2019 08:15:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 025F63F5AF;
 Tue,  7 May 2019 08:15:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  7 May 2019 16:14:55 +0100
Message-Id: <20190507151458.29350-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507151458.29350-1-julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
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
 Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>,
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
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoK
ICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIHwgMjkg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5kZXggNzE3Mzc4NzMwYi4uNDcyMTcy
NWM2MCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvbW0uaApAQCAtNDQyLDYgKzQ0Miw4IEBAIGludCBjaGVja19kZXNjcmlwdG9y
KGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHNlZ19kZXNjX3QgKmRlc2MpOwogCiBleHRlcm4gcGFk
ZHJfdCBtZW1faG90cGx1ZzsKIAorZXh0ZXJuIHN0cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21f
aW8sICpkb21fY293OwkvKiBmb3Igdm1jb3JlaW5mbyAqLworCiAvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCiAgKiBXaXRoIHNoYWRvdyBwYWdldGFibGVzLCB0aGUgZGlmZmVyZW50IGtpbmRzIG9mIGFk
ZHJlc3Mgc3RhcnQKICAqIHRvIGdldCBnZXQgY29uZnVzaW5nLgpAQCAtNDgzLDI0ICs0ODUsMjUg
QEAgZXh0ZXJuIHBhZGRyX3QgbWVtX2hvdHBsdWc7CiAjZGVmaW5lIFNIQVJFRF9NMlAoX2UpICAg
ICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQogCiAjZGVmaW5lIGNvbXBhdF9tYWNo
aW5lX3RvX3BoeXNfbWFwcGluZyAoKHVuc2lnbmVkIGludCAqKVJEV1JfQ09NUEFUX01QVF9WSVJU
X1NUQVJUKQotI2RlZmluZSBfc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pICh7ICAgICAgICAg
ICAgICAgICAgICAgICAgXAotICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lciht
Zm5fdG9fcGFnZShfbWZuKG1mbikpKTsgXAotICAgIHVuc2lnbmVkIGxvbmcgZW50cnkgPSAoZCAm
JiAoZCA9PSBkb21fY293KSkgPyAgICAgICAgICAgICAgXAotICAgICAgICBTSEFSRURfTTJQX0VO
VFJZIDogKHBmbik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICgodm9pZCko
KG1mbikgPj0gKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJEV1JfQ09NUEFUX01QVF9WSVJU
X1NUQVJUKSAvIDQgfHwgXAotICAgICAgICAgICAgKGNvbXBhdF9tYWNoaW5lX3RvX3BoeXNfbWFw
cGluZ1sobWZuKV0gPSAodW5zaWduZWQgaW50KShlbnRyeSkpKSwgXAotICAgICBtYWNoaW5lX3Rv
X3BoeXNfbWFwcGluZ1sobWZuKV0gPSAoZW50cnkpKTsgICAgICAgICAgICAgICAgXAotICAgIH0p
CiAKIC8qCiAgKiBEaXNhYmxlIHNvbWUgdXNlcnMgb2Ygc2V0X2dwZm5fZnJvbV9tZm4oKSAoZS5n
LiwgZnJlZV9oZWFwX3BhZ2VzKCkpIHVudGlsCiAgKiB0aGUgbWFjaGluZV90b19waHlzX21hcHBp
bmcgaXMgYWN0dWFsbHkgc2V0IHVwLgogICovCiBleHRlcm4gYm9vbCBtYWNoaW5lX3RvX3BoeXNf
bWFwcGluZ192YWxpZDsKLSNkZWZpbmUgc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsg
ICAgICAgIFwKLSAgICBpZiAoIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkICkgICAgICAg
IFwKLSAgICAgICAgX3NldF9ncGZuX2Zyb21fbWZuKG1mbiwgcGZuKTsgICAgICAgICAgIFwKLX0g
d2hpbGUgKDApCisKK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfZ3Bmbl9mcm9tX21mbih1bnNpZ25l
ZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pCit7CisgICAgc3RydWN0IGRvbWFpbiAqZCA9
IHBhZ2VfZ2V0X293bmVyKG1mbl90b19wYWdlKF9tZm4obWZuKSkpOworICAgIHVuc2lnbmVkIGxv
bmcgZW50cnkgPSAoZCAmJiAoZCA9PSBkb21fY293KSkgPyBTSEFSRURfTTJQX0VOVFJZIDogcGZu
OworCisgICAgaWYgKCFtYWNoaW5lX3RvX3BoeXNfbWFwcGluZ192YWxpZCkKKyAgICAgICAgcmV0
dXJuOworCisgICAgaWYgKCBtZm4gPj0gKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJEV1Jf
Q09NUEFUX01QVF9WSVJUX1NUQVJUKSAvIDQgKQorICAgICAgICBjb21wYXRfbWFjaGluZV90b19w
aHlzX21hcHBpbmdbbWZuXSA9IGVudHJ5OworICAgIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nW21m
bl0gPSBlbnRyeTsKK30KIAogZXh0ZXJuIHN0cnVjdCByYW5nZXNldCAqbW1pb19yb19yYW5nZXM7
CiAKQEAgLTU5Miw4ICs1OTUsNiBAQCB1bnNpZ25lZCBpbnQgZG9tYWluX2NsYW1wX2FsbG9jX2Jp
dHNpemUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGJpdHMpOwogCiB1bnNpZ25lZCBs
b25nIGRvbWFpbl9nZXRfbWF4aW11bV9ncGZuKHN0cnVjdCBkb21haW4gKmQpOwogCi1leHRlcm4g
c3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRvbV9pbywgKmRvbV9jb3c7CS8qIGZvciB2bWNvcmVp
bmZvICovCi0KIC8qIERlZmluaXRpb24gb2YgYW4gbW0gbG9jazogc3BpbmxvY2sgd2l0aCBleHRy
YSBmaWVsZHMgZm9yIGRlYnVnZ2luZyAqLwogdHlwZWRlZiBzdHJ1Y3QgbW1fbG9jayB7CiAgICAg
c3BpbmxvY2tfdCAgICAgICAgIGxvY2s7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
