Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766DFC1AF0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 07:24:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEo8C-000201-AY; Mon, 30 Sep 2019 05:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEo8A-0001z8-Am
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 05:21:54 +0000
X-Inumbo-ID: 2e93d930-e342-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2e93d930-e342-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 05:21:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E8ECB01F;
 Mon, 30 Sep 2019 05:21:39 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 07:21:18 +0200
Message-Id: <20190930052135.11257-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190930052135.11257-1-jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 02/19] xen/sched: introduce
 unit_runnable_state()
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlIHZjcHUgcnVuc3RhdGUgb2YgYSBuZXcgc2NoZWR1bGVkIHZjcHUgaXMgYWx3YXlz
IHNldCB0bwoicnVubmluZyIgZXZlbiBpZiBhdCB0aGF0IHRpbWUgdmNwdV9ydW5uYWJsZSgpIGlz
IGFscmVhZHkgcmV0dXJuaW5nCmZhbHNlIGR1ZSB0byBhIHJhY2UgKGUuZy4gd2l0aCBwYXVzaW5n
IHRoZSB2Y3B1KS4KCldpdGggY29yZSBzY2hlZHVsaW5nIHRoaXMgY2FuIG5vIGxvbmdlciB3b3Jr
IGFzIG5vdCBhbGwgdmNwdXMgb2YgYQpzY2hlZHVsZSB1bml0IGhhdmUgdG8gYmUgInJ1bm5pbmci
IHdoZW4gYmVpbmcgc2NoZWR1bGVkLiBTbyB0aGUgdmNwdSdzCm5ldyBydW5zdGF0ZSBoYXMgdG8g
YmUgc2VsZWN0ZWQgYXQgdGhlIHNhbWUgdGltZSBhcyB0aGUgcnVubmFiaWxpdHkgb2YKdGhlIHJl
bGF0ZWQgc2NoZWR1bGUgdW5pdCBpcyBwcm9iZWQuCgpGb3IgdGhpcyBwdXJwb3NlIGludHJvZHVj
ZSBhIG5ldyBoZWxwZXIgdW5pdF9ydW5uYWJsZV9zdGF0ZSgpIHdoaWNoCndpbGwgc2F2ZSB0aGUg
bmV3IHJ1bnN0YXRlIG9mIGFsbCB0ZXN0ZWQgdmNwdXMgaW4gYSBuZXcgZmllbGQgb2YgdGhlCnZj
cHUgc3RydWN0LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KUkZDIFYyOgotIG5ldyBwYXRjaApWMzoKLSBhZGQgdmNwdSBsb29wIHRvIHVuaXRfcnVu
bmFibGVfc3RhdGUoKSByaWdodCBub3cgaW5zdGVhZCBvZiBkb2luZwogIHNvIGluIG5leHQgcGF0
Y2ggKEphbiBCZXVsaWNoLCBEYXJpbyBGYWdnaW9saSkKLSBtYWtlIG5ld19zdGF0ZSB1bnNpZ25l
ZCBpbnQgKEphbiBCZXVsaWNoKQpWNDoKLSBhZGQgY29tbWVudCBleHBsYWluaW5nIHVuaXRfcnVu
bmFibGVfc3RhdGUoKSAoSmFuIEJldWxpY2gpCi0tLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAg
ICAgIHwgIDEgKwogeGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jIHwgIDIgKy0KIHhlbi9jb21t
b24vc2NoZWRfY3JlZGl0LmMgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgIHwgIDcgKysrKy0tLQog
eGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgICAgIHwgIDMgKystCiB4ZW4vY29tbW9uL3NjaGVkX3J0
LmMgICAgICAgfCAgOCArKysrKysrLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgIHwgIDIg
Ky0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oICB8IDMwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgIHwgIDEgKwogOSBmaWxlcyBjaGFu
Z2VkLCA3MyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA2MDFkYTI4YzljLi5h
OTg4MjUwOWVkIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21t
b24vZG9tYWluLmMKQEAgLTE1Nyw2ICsxNTcsNyBAQCBzdHJ1Y3QgdmNwdSAqdmNwdV9jcmVhdGUo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZjcHVfaWQpCiAgICAgaWYgKCBpc19pZGxl
X2RvbWFpbihkKSApCiAgICAgewogICAgICAgICB2LT5ydW5zdGF0ZS5zdGF0ZSA9IFJVTlNUQVRF
X3J1bm5pbmc7CisgICAgICAgIHYtPm5ld19zdGF0ZSA9IFJVTlNUQVRFX3J1bm5pbmc7CiAgICAg
fQogICAgIGVsc2UKICAgICB7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUz
LmMgYi94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKaW5kZXggZmNmODFkYjE5YS4uZGQ1ODc2
ZWFjZCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWRfYXJpbmM2NTMuYwpAQCAtNTYzLDcgKzU2Myw3IEBAIGE2NTNzY2hlZF9kb19z
Y2hlZHVsZSgKICAgICBpZiAoICEoKG5ld190YXNrICE9IE5VTEwpCiAgICAgICAgICAgICYmIChB
VU5JVChuZXdfdGFzaykgIT0gTlVMTCkKICAgICAgICAgICAgJiYgQVVOSVQobmV3X3Rhc2spLT5h
d2FrZQotICAgICAgICAgICAmJiB1bml0X3J1bm5hYmxlKG5ld190YXNrKSkgKQorICAgICAgICAg
ICAmJiB1bml0X3J1bm5hYmxlX3N0YXRlKG5ld190YXNrKSkgKQogICAgICAgICBuZXdfdGFzayA9
IElETEVUQVNLKGNwdSk7CiAgICAgQlVHX09OKG5ld190YXNrID09IE5VTEwpOwogCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQu
YwppbmRleCAyOTllZmYyMWFjLi4wMGJlYWMzZWE0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkX2NyZWRpdC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKQEAgLTE4OTQsNyAr
MTg5NCw3IEBAIHN0YXRpYyB2b2lkIGNzY2hlZF9zY2hlZHVsZSgKICAgICBpZiAoICF0ZXN0X2Jp
dChDU0NIRURfRkxBR19VTklUX1lJRUxELCAmc2N1cnItPmZsYWdzKQogICAgICAgICAgJiYgIXRh
c2tsZXRfd29ya19zY2hlZHVsZWQKICAgICAgICAgICYmIHBydi0+cmF0ZWxpbWl0Ci0gICAgICAg
ICAmJiB1bml0X3J1bm5hYmxlKHVuaXQpCisgICAgICAgICAmJiB1bml0X3J1bm5hYmxlX3N0YXRl
KHVuaXQpCiAgICAgICAgICAmJiAhaXNfaWRsZV91bml0KHVuaXQpCiAgICAgICAgICAmJiBydW50
aW1lIDwgcHJ2LT5yYXRlbGltaXQgKQogICAgIHsKQEAgLTE5MzksMzMgKzE5MzksMzYgQEAgc3Rh
dGljIHZvaWQgY3NjaGVkX3NjaGVkdWxlKAogICAgICAgICBkZWNfbnJfcnVubmFibGUoc2NoZWRf
Y3B1KTsKICAgICB9CiAKLSAgICBzbmV4dCA9IF9fcnVucV9lbGVtKHJ1bnEtPm5leHQpOwotCi0g
ICAgLyogVGFza2xldCB3b3JrICh3aGljaCBydW5zIGluIGlkbGUgVU5JVCBjb250ZXh0KSBvdmVy
cmlkZXMgYWxsIGVsc2UuICovCi0gICAgaWYgKCB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkICkKLSAg
ICB7Ci0gICAgICAgIFRSQUNFXzBEKFRSQ19DU0NIRURfU0NIRURfVEFTS0xFVCk7Ci0gICAgICAg
IHNuZXh0ID0gQ1NDSEVEX1VOSVQoc2NoZWRfaWRsZV91bml0KHNjaGVkX2NwdSkpOwotICAgICAg
ICBzbmV4dC0+cHJpID0gQ1NDSEVEX1BSSV9UU19CT09TVDsKLSAgICB9Ci0KICAgICAvKgogICAg
ICAqIENsZWFyIFlJRUxEIGZsYWcgYmVmb3JlIHNjaGVkdWxpbmcgb3V0CiAgICAgICovCiAgICAg
Y2xlYXJfYml0KENTQ0hFRF9GTEFHX1VOSVRfWUlFTEQsICZzY3Vyci0+ZmxhZ3MpOwogCi0gICAg
LyoKLSAgICAgKiBTTVAgTG9hZCBiYWxhbmNlOgotICAgICAqCi0gICAgICogSWYgdGhlIG5leHQg
aGlnaGVzdCBwcmlvcml0eSBsb2NhbCBydW5uYWJsZSBVTklUIGhhcyBhbHJlYWR5IGVhdGVuCi0g
ICAgICogdGhyb3VnaCBpdHMgY3JlZGl0cywgbG9vayBvbiBvdGhlciBQQ1BVcyB0byBzZWUgaWYg
d2UgaGF2ZSBtb3JlCi0gICAgICogdXJnZW50IHdvcmsuLi4gSWYgbm90LCBjc2NoZWRfbG9hZF9i
YWxhbmNlKCkgd2lsbCByZXR1cm4gc25leHQsIGJ1dAotICAgICAqIGFscmVhZHkgcmVtb3ZlZCBm
cm9tIHRoZSBydW5xLgotICAgICAqLwotICAgIGlmICggc25leHQtPnByaSA+IENTQ0hFRF9QUklf
VFNfT1ZFUiApCi0gICAgICAgIF9fcnVucV9yZW1vdmUoc25leHQpOwotICAgIGVsc2UKLSAgICAg
ICAgc25leHQgPSBjc2NoZWRfbG9hZF9iYWxhbmNlKHBydiwgc2NoZWRfY3B1LCBzbmV4dCwgJm1p
Z3JhdGVkKTsKKyAgICBkbyB7CisgICAgICAgIHNuZXh0ID0gX19ydW5xX2VsZW0ocnVucS0+bmV4
dCk7CisKKyAgICAgICAgLyogVGFza2xldCB3b3JrICh3aGljaCBydW5zIGluIGlkbGUgVU5JVCBj
b250ZXh0KSBvdmVycmlkZXMgYWxsIGVsc2UuICovCisgICAgICAgIGlmICggdGFza2xldF93b3Jr
X3NjaGVkdWxlZCApCisgICAgICAgIHsKKyAgICAgICAgICAgIFRSQUNFXzBEKFRSQ19DU0NIRURf
U0NIRURfVEFTS0xFVCk7CisgICAgICAgICAgICBzbmV4dCA9IENTQ0hFRF9VTklUKHNjaGVkX2lk
bGVfdW5pdChzY2hlZF9jcHUpKTsKKyAgICAgICAgICAgIHNuZXh0LT5wcmkgPSBDU0NIRURfUFJJ
X1RTX0JPT1NUOworICAgICAgICB9CisKKyAgICAgICAgLyoKKyAgICAgICAgICogU01QIExvYWQg
YmFsYW5jZToKKyAgICAgICAgICoKKyAgICAgICAgICogSWYgdGhlIG5leHQgaGlnaGVzdCBwcmlv
cml0eSBsb2NhbCBydW5uYWJsZSBVTklUIGhhcyBhbHJlYWR5IGVhdGVuCisgICAgICAgICAqIHRo
cm91Z2ggaXRzIGNyZWRpdHMsIGxvb2sgb24gb3RoZXIgUENQVXMgdG8gc2VlIGlmIHdlIGhhdmUg
bW9yZQorICAgICAgICAgKiB1cmdlbnQgd29yay4uLiBJZiBub3QsIGNzY2hlZF9sb2FkX2JhbGFu
Y2UoKSB3aWxsIHJldHVybiBzbmV4dCwgYnV0CisgICAgICAgICAqIGFscmVhZHkgcmVtb3ZlZCBm
cm9tIHRoZSBydW5xLgorICAgICAgICAgKi8KKyAgICAgICAgaWYgKCBzbmV4dC0+cHJpID4gQ1ND
SEVEX1BSSV9UU19PVkVSICkKKyAgICAgICAgICAgIF9fcnVucV9yZW1vdmUoc25leHQpOworICAg
ICAgICBlbHNlCisgICAgICAgICAgICBzbmV4dCA9IGNzY2hlZF9sb2FkX2JhbGFuY2UocHJ2LCBz
Y2hlZF9jcHUsIHNuZXh0LCAmbWlncmF0ZWQpOworCisgICAgfSB3aGlsZSAoICF1bml0X3J1bm5h
YmxlX3N0YXRlKHNuZXh0LT51bml0KSApOwogCiAgICAgLyoKICAgICAgKiBVcGRhdGUgaWRsZXJz
IG1hc2sgaWYgbmVjZXNzYXJ5LiBXaGVuIHdlJ3JlIGlkbGluZywgb3RoZXIgQ1BVcwpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRp
dDIuYwppbmRleCA4N2QxNDJiYmU0Li4wZTI5ZTU2ZDVhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMzI5
MSw3ICszMjkxLDcgQEAgcnVucV9jYW5kaWRhdGUoc3RydWN0IGNzY2hlZDJfcnVucXVldWVfZGF0
YSAqcnFkLAogICAgICAqIEluIGZhY3QsIGl0IG1heSBiZSB0aGUgY2FzZSB0aGF0IHNjdXJyIGlz
IGFib3V0IHRvIHNwaW4sIGFuZCB0aGVyZSdzCiAgICAgICogbm8gcG9pbnQgZm9yY2luZyBpdCB0
byBkbyBzbyB1bnRpbCByYXRlIGxpbWl0aW5nIGV4cGlyZXMuCiAgICAgICovCi0gICAgaWYgKCAh
eWllbGQgJiYgcHJ2LT5yYXRlbGltaXRfdXMgJiYgdW5pdF9ydW5uYWJsZShzY3Vyci0+dW5pdCkg
JiYKKyAgICBpZiAoICF5aWVsZCAmJiBwcnYtPnJhdGVsaW1pdF91cyAmJiB1bml0X3J1bm5hYmxl
X3N0YXRlKHNjdXJyLT51bml0KSAmJgogICAgICAgICAgKG5vdyAtIHNjdXJyLT51bml0LT5zdGF0
ZV9lbnRyeV90aW1lKSA8IE1JQ1JPU0VDUyhwcnYtPnJhdGVsaW1pdF91cykgKQogICAgIHsKICAg
ICAgICAgaWYgKCB1bmxpa2VseSh0Yl9pbml0X2RvbmUpICkKQEAgLTMzNDUsNyArMzM0NSw3IEBA
IHJ1bnFfY2FuZGlkYXRlKHN0cnVjdCBjc2NoZWQyX3J1bnF1ZXVlX2RhdGEgKnJxZCwKICAgICAg
KgogICAgICAqIE9mIGNvdXJzZSwgd2UgYWxzbyBkZWZhdWx0IHRvIGlkbGUgYWxzbyBpZiBzY3Vy
ciBpcyBub3QgcnVubmFibGUuCiAgICAgICovCi0gICAgaWYgKCB1bml0X3J1bm5hYmxlKHNjdXJy
LT51bml0KSAmJiAhc29mdF9hZmZfcHJlZW1wdCApCisgICAgaWYgKCB1bml0X3J1bm5hYmxlX3N0
YXRlKHNjdXJyLT51bml0KSAmJiAhc29mdF9hZmZfcHJlZW1wdCApCiAgICAgICAgIHNuZXh0ID0g
c2N1cnI7CiAgICAgZWxzZQogICAgICAgICBzbmV4dCA9IGNzY2hlZDJfdW5pdChzY2hlZF9pZGxl
X3VuaXQoY3B1KSk7CkBAIC0zNDA1LDcgKzM0MDUsOCBAQCBydW5xX2NhbmRpZGF0ZShzdHJ1Y3Qg
Y3NjaGVkMl9ydW5xdWV1ZV9kYXRhICpycWQsCiAgICAgICAgICAqIHNvbWUgYnVkZ2V0LCB0aGVu
IGNob29zZSBpdC4KICAgICAgICAgICovCiAgICAgICAgIGlmICggKHlpZWxkIHx8IHN2Yy0+Y3Jl
ZGl0ID4gc25leHQtPmNyZWRpdCkgJiYKLSAgICAgICAgICAgICAoIWhhc19jYXAoc3ZjKSB8fCB1
bml0X2dyYWJfYnVkZ2V0KHN2YykpICkKKyAgICAgICAgICAgICAoIWhhc19jYXAoc3ZjKSB8fCB1
bml0X2dyYWJfYnVkZ2V0KHN2YykpICYmCisgICAgICAgICAgICAgdW5pdF9ydW5uYWJsZV9zdGF0
ZShzdmMtPnVuaXQpICkKICAgICAgICAgICAgIHNuZXh0ID0gc3ZjOwogCiAgICAgICAgIC8qIElu
IGFueSBjYXNlLCBpZiB3ZSBnb3QgdGhpcyBmYXIsIGJyZWFrLiAqLwpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZF9udWxsLmMgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwppbmRleCA4MGE3
ZDQ1OTM1Li4zZGRlMWRjZDAwIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYwor
KysgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwpAQCAtODY0LDcgKzg2NCw4IEBAIHN0YXRpYyB2
b2lkIG51bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2No
ZWRfdW5pdCAqcHJldiwKICAgICAgICAgICAgIGNwdW1hc2tfc2V0X2NwdShzY2hlZF9jcHUsICZw
cnYtPmNwdXNfZnJlZSk7CiAgICAgfQogCi0gICAgaWYgKCB1bmxpa2VseShwcmV2LT5uZXh0X3Rh
c2sgPT0gTlVMTCB8fCAhdW5pdF9ydW5uYWJsZShwcmV2LT5uZXh0X3Rhc2spKSApCisgICAgaWYg
KCB1bmxpa2VseShwcmV2LT5uZXh0X3Rhc2sgPT0gTlVMTCB8fAorICAgICAgICAgICAgICAgICAg
IXVuaXRfcnVubmFibGVfc3RhdGUocHJldi0+bmV4dF90YXNrKSkgKQogICAgICAgICBwcmV2LT5u
ZXh0X3Rhc2sgPSBzY2hlZF9pZGxlX3VuaXQoc2NoZWRfY3B1KTsKIAogICAgIE5VTExfVU5JVF9D
SEVDSyhwcmV2LT5uZXh0X3Rhc2spOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9ydC5j
IGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCmluZGV4IGNmZDdkMzM0ZmEuLmZkODgyZjJjYTQgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfcnQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX3J0
LmMKQEAgLTEwOTIsMTIgKzEwOTIsMTggQEAgcnRfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVk
dWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqY3VycnVuaXQsCiAgICAgZWxzZQogICAgIHsK
ICAgICAgICAgc25leHQgPSBydW5xX3BpY2sob3BzLCBjcHVtYXNrX29mKHNjaGVkX2NwdSkpOwor
CiAgICAgICAgIGlmICggc25leHQgPT0gTlVMTCApCiAgICAgICAgICAgICBzbmV4dCA9IHJ0X3Vu
aXQoc2NoZWRfaWRsZV91bml0KHNjaGVkX2NwdSkpOworICAgICAgICBlbHNlIGlmICggIXVuaXRf
cnVubmFibGVfc3RhdGUoc25leHQtPnVuaXQpICkKKyAgICAgICAgeworICAgICAgICAgICAgcV9y
ZW1vdmUoc25leHQpOworICAgICAgICAgICAgc25leHQgPSBydF91bml0KHNjaGVkX2lkbGVfdW5p
dChzY2hlZF9jcHUpKTsKKyAgICAgICAgfQogCiAgICAgICAgIC8qIGlmIHNjdXJyIGhhcyBoaWdo
ZXIgcHJpb3JpdHkgYW5kIGJ1ZGdldCwgc3RpbGwgcGljayBzY3VyciAqLwogICAgICAgICBpZiAo
ICFpc19pZGxlX3VuaXQoY3VycnVuaXQpICYmCi0gICAgICAgICAgICAgdW5pdF9ydW5uYWJsZShj
dXJydW5pdCkgJiYKKyAgICAgICAgICAgICB1bml0X3J1bm5hYmxlX3N0YXRlKGN1cnJ1bml0KSAm
JgogICAgICAgICAgICAgIHNjdXJyLT5jdXJfYnVkZ2V0ID4gMCAmJgogICAgICAgICAgICAgICgg
aXNfaWRsZV91bml0KHNuZXh0LT51bml0KSB8fAogICAgICAgICAgICAgICAgY29tcGFyZV91bml0
X3ByaW9yaXR5KHNjdXJyLCBzbmV4dCkgPiAwICkgKQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGZmNjdmYjM2MzMuLjljMWIw
NDRiNDkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9u
L3NjaGVkdWxlLmMKQEAgLTI4MCw3ICsyODAsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRf
dW5pdF9ydW5zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCiAgICAgZm9yX2Vh
Y2hfc2NoZWRfdW5pdF92Y3B1ICggdW5pdCwgdiApCiAgICAgewogICAgICAgICBpZiAoIHJ1bm5p
bmcgKQotICAgICAgICAgICAgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UodiwgUlVOU1RBVEVfcnVubmlu
ZywgbmV3X2VudHJ5X3RpbWUpOworICAgICAgICAgICAgdmNwdV9ydW5zdGF0ZV9jaGFuZ2Uodiwg
di0+bmV3X3N0YXRlLCBuZXdfZW50cnlfdGltZSk7CiAgICAgICAgIGVsc2UKICAgICAgICAgICAg
IHZjcHVfcnVuc3RhdGVfY2hhbmdlKHYsCiAgICAgICAgICAgICAgICAgKCh2LT5wYXVzZV9mbGFn
cyAmIFZQRl9ibG9ja2VkKSA/IFJVTlNUQVRFX2Jsb2NrZWQgOgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLWlmLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAppbmRleCBj
NjVkZmE5NDNiLi43ZTU2OGE5ZDlmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQt
aWYuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaApAQCAtOTMsNiArOTMsMzYgQEAg
c3RhdGljIGlubGluZSBib29sIHVuaXRfcnVubmFibGUoY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQpCiAgICAgcmV0dXJuIGZhbHNlOwogfQogCisvKgorICogUmV0dXJucyB3aGV0aGVyIGEg
c2NoZWRfdW5pdCBpcyBydW5uYWJsZSBhbmQgc2V0cyBuZXdfc3RhdGUgZm9yIGVhY2ggb2YgaXRz
CisgKiB2Y3B1cy4gSXQgaXMgbWFuZGF0b3J5IHRvIGRldGVybWluZSB0aGUgbmV3IHJ1bnN0YXRl
IGZvciBhbGwgdmNwdXMgb2YgYSB1bml0CisgKiB3aXRob3V0IGRyb3BwaW5nIHRoZSBzY2hlZHVs
ZSBsb2NrICh3aGljaCBoYXBwZW5zIHdoZW4gc3luY2hyb25pemluZyB0aGUKKyAqIGNvbnRleHQg
c3dpdGNoIG9mIHRoZSB2Y3B1cyBvZiBhIHVuaXQpIGluIG9yZGVyIHRvIGF2b2lkIHJhY2VzIHdp
dGggZS5nLgorICogdmNwdV9zbGVlcCgpLgorICovCitzdGF0aWMgaW5saW5lIGJvb2wgdW5pdF9y
dW5uYWJsZV9zdGF0ZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKK3sKKyAgICBzdHJ1
Y3QgdmNwdSAqdjsKKyAgICBib29sIHJ1bm5hYmxlLCByZXQgPSBmYWxzZTsKKworICAgIGlmICgg
aXNfaWRsZV91bml0KHVuaXQpICkKKyAgICAgICAgcmV0dXJuIHRydWU7CisKKyAgICBmb3JfZWFj
aF9zY2hlZF91bml0X3ZjcHUgKCB1bml0LCB2ICkKKyAgICB7CisgICAgICAgIHJ1bm5hYmxlID0g
dmNwdV9ydW5uYWJsZSh2KTsKKworICAgICAgICB2LT5uZXdfc3RhdGUgPSBydW5uYWJsZSA/IFJV
TlNUQVRFX3J1bm5pbmcKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAodi0+cGF1
c2VfZmxhZ3MgJiBWUEZfYmxvY2tlZCkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA/IFJVTlNUQVRFX2Jsb2NrZWQgOiBSVU5TVEFURV9vZmZsaW5lOworCisgICAgICAgIGlmICgg
cnVubmFibGUgKQorICAgICAgICAgICAgcmV0ID0gdHJ1ZTsKKyAgICB9CisKKyAgICByZXR1cm4g
cmV0OworfQorCiBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfc2V0X3JlcyhzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzY2hl
ZF9yZXNvdXJjZSAqcmVzKQogewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBjNzcwYWI0YWEwLi4xMmYwMGNkNzhkIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaApAQCAtMTc0LDYgKzE3NCw3IEBAIHN0cnVjdCB2Y3B1CiAgICAgICAgIFhFTl9HVUVT
VF9IQU5ETEUodmNwdV9ydW5zdGF0ZV9pbmZvX2NvbXBhdF90KSBjb21wYXQ7CiAgICAgfSBydW5z
dGF0ZV9ndWVzdDsgLyogZ3Vlc3QgYWRkcmVzcyAqLwogI2VuZGlmCisgICAgdW5zaWduZWQgaW50
ICAgICBuZXdfc3RhdGU7CiAKICAgICAvKiBIYXMgdGhlIEZQVSBiZWVuIGluaXRpYWxpc2VkPyAq
LwogICAgIGJvb2wgICAgICAgICAgICAgZnB1X2luaXRpYWxpc2VkOwotLSAKMi4xNi40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
