Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E66AD70
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 19:10:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQuO-0005oF-Bo; Tue, 16 Jul 2019 17:06:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v+lg=VN=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnQuM-0005nX-PT
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 17:06:30 +0000
X-Inumbo-ID: 0cf9c1ea-a7ec-11e9-abc9-8f14cbf2e7c2
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cf9c1ea-a7ec-11e9-abc9-8f14cbf2e7c2;
 Tue, 16 Jul 2019 17:06:29 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E1DAE305FFA3; Tue, 16 Jul 2019 20:06:25 +0300 (EEST)
Received: from bitdefender.com (unknown [195.189.155.70])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D3C83305B7B6;
 Tue, 16 Jul 2019 20:06:25 +0300 (EEST)
From: Petre Pircalabu <ppircalabu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 16 Jul 2019 20:06:19 +0300
Message-Id: <93d50867ea8e45270a180a8f93aaed5a89619510.1563293545.git.ppircalabu@bitdefender.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563293545.git.ppircalabu@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1563293545.git.ppircalabu@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
Subject: [Xen-devel] [PATCH v2 05/10] vm_event: Move struct vm_event_domain
 to vm_event.c
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZtX2V2ZW50X2RvbWFpbiBtZW1iZXJzIGFyZSBub3QgYWNjZXNzZWQgb3V0c2lkZSB2bV9l
dmVudC5jIHNvIGl0J3MKYmV0dGVyIHRvIGhpZGUgZGUgaW1wbGVtZW50YXRpb24gZGV0YWlscy4K
ClNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpB
Y2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgotLS0KIHhlbi9j
b21tb24vdm1fZXZlbnQuYyAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oIHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi92bV9ldmVudC5jIGIveGVuL2NvbW1vbi92bV9ldmVudC5jCmluZGV4IGEy
MzVkMjUuLjIxODk1YzIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdm1fZXZlbnQuYworKysgYi94
ZW4vY29tbW9uL3ZtX2V2ZW50LmMKQEAgLTM1LDYgKzM1LDMyIEBACiAjZGVmaW5lIHhlbl9ybWIo
KSAgc21wX3JtYigpCiAjZGVmaW5lIHhlbl93bWIoKSAgc21wX3dtYigpCiAKKy8qIFZNIGV2ZW50
ICovCitzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluCit7CisgICAgLyogRG9tYWluIHJlZmVyZW5jZSAq
LworICAgIHN0cnVjdCBkb21haW4gKmQ7CisgICAgc3BpbmxvY2tfdCBsb2NrOworICAgIC8qIFRo
ZSByaW5nIGhhcyA2NCBlbnRyaWVzICovCisgICAgdW5zaWduZWQgY2hhciBmb3JlaWduX3Byb2R1
Y2VyczsKKyAgICB1bnNpZ25lZCBjaGFyIHRhcmdldF9wcm9kdWNlcnM7CisgICAgLyogc2hhcmVk
IHJpbmcgcGFnZSAqLworICAgIHZvaWQgKnJpbmdfcGFnZTsKKyAgICBzdHJ1Y3QgcGFnZV9pbmZv
ICpyaW5nX3BnX3N0cnVjdDsKKyAgICAvKiBmcm9udC1lbmQgcmluZyAqLworICAgIHZtX2V2ZW50
X2Zyb250X3JpbmdfdCBmcm9udF9yaW5nOworICAgIC8qIGV2ZW50IGNoYW5uZWwgcG9ydCAodmNw
dTAgb25seSkgKi8KKyAgICBpbnQgeGVuX3BvcnQ7CisgICAgLyogdm1fZXZlbnQgYml0IGZvciB2
Y3B1LT5wYXVzZV9mbGFncyAqLworICAgIGludCBwYXVzZV9mbGFnOworICAgIC8qIGxpc3Qgb2Yg
dmNwdXMgd2FpdGluZyBmb3Igcm9vbSBpbiB0aGUgcmluZyAqLworICAgIHN0cnVjdCB3YWl0cXVl
dWVfaGVhZCB3cTsKKyAgICAvKiB0aGUgbnVtYmVyIG9mIHZDUFVzIGJsb2NrZWQgKi8KKyAgICB1
bnNpZ25lZCBpbnQgYmxvY2tlZDsKKyAgICAvKiBUaGUgbGFzdCB2Y3B1IHdva2VuIHVwICovCisg
ICAgdW5zaWduZWQgaW50IGxhc3RfdmNwdV93YWtlX3VwOworfTsKKwogc3RhdGljIGludCB2bV9l
dmVudF9lbmFibGUoCiAgICAgc3RydWN0IGRvbWFpbiAqZCwKICAgICBzdHJ1Y3QgeGVuX2RvbWN0
bF92bV9ldmVudF9vcCAqdmVjLApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBlMzA5M2QzLi4xOTk4MGQyIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aApAQCAtMjc2LDMxICsyNzYsNyBAQCBzdHJ1Y3QgdmNwdQogI2RlZmluZSBkb21haW5fbG9jayhk
KSBzcGluX2xvY2tfcmVjdXJzaXZlKCYoZCktPmRvbWFpbl9sb2NrKQogI2RlZmluZSBkb21haW5f
dW5sb2NrKGQpIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgmKGQpLT5kb21haW5fbG9jaykKIAotLyog
Vk0gZXZlbnQgKi8KLXN0cnVjdCB2bV9ldmVudF9kb21haW4KLXsKLSAgICAvKiBEb21haW4gcmVm
ZXJlbmNlICovCi0gICAgc3RydWN0IGRvbWFpbiAqZDsKLSAgICBzcGlubG9ja190IGxvY2s7Ci0g
ICAgLyogVGhlIHJpbmcgaGFzIDY0IGVudHJpZXMgKi8KLSAgICB1bnNpZ25lZCBjaGFyIGZvcmVp
Z25fcHJvZHVjZXJzOwotICAgIHVuc2lnbmVkIGNoYXIgdGFyZ2V0X3Byb2R1Y2VyczsKLSAgICAv
KiBzaGFyZWQgcmluZyBwYWdlICovCi0gICAgdm9pZCAqcmluZ19wYWdlOwotICAgIHN0cnVjdCBw
YWdlX2luZm8gKnJpbmdfcGdfc3RydWN0OwotICAgIC8qIGZyb250LWVuZCByaW5nICovCi0gICAg
dm1fZXZlbnRfZnJvbnRfcmluZ190IGZyb250X3Jpbmc7Ci0gICAgLyogZXZlbnQgY2hhbm5lbCBw
b3J0ICh2Y3B1MCBvbmx5KSAqLwotICAgIGludCB4ZW5fcG9ydDsKLSAgICAvKiB2bV9ldmVudCBi
aXQgZm9yIHZjcHUtPnBhdXNlX2ZsYWdzICovCi0gICAgaW50IHBhdXNlX2ZsYWc7Ci0gICAgLyog
bGlzdCBvZiB2Y3B1cyB3YWl0aW5nIGZvciByb29tIGluIHRoZSByaW5nICovCi0gICAgc3RydWN0
IHdhaXRxdWV1ZV9oZWFkIHdxOwotICAgIC8qIHRoZSBudW1iZXIgb2YgdkNQVXMgYmxvY2tlZCAq
LwotICAgIHVuc2lnbmVkIGludCBibG9ja2VkOwotICAgIC8qIFRoZSBsYXN0IHZjcHUgd29rZW4g
dXAgKi8KLSAgICB1bnNpZ25lZCBpbnQgbGFzdF92Y3B1X3dha2VfdXA7Ci19Oworc3RydWN0IHZt
X2V2ZW50X2RvbWFpbjsKIAogc3RydWN0IGV2dGNobl9wb3J0X29wczsKIAotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
