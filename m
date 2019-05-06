Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD0144C0
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 08:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYn-0002Ic-7g; Mon, 06 May 2019 06:57:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYf-00023Z-OX
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:05 +0000
X-Inumbo-ID: 2508fa17-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2508fa17-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37678AF2F;
 Mon,  6 May 2019 06:56:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:27 +0200
Message-Id: <20190506065644.7415-29-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 28/45] xen: switch from for_each_vcpu()
 to for_each_sched_item()
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlcmUgYXBwcm9wcmlhdGUgc3dpdGNoIGZyb20gZm9yX2VhY2hfdmNwdSgpIHRvIGZvcl9lYWNo
X3NjaGVkX2l0ZW0oKQppbiBvcmRlciB0byBwcmVwYXJlIGNvcmUgc2NoZWR1bGluZy4KClNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9u
L2RvbWFpbi5jICAgfCAgIDkgKystLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8IDEwNyArKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA3OGE4MzhmYWIz
Li5kMGY5ZTVlODZhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9j
b21tb24vZG9tYWluLmMKQEAgLTUxMCw3ICs1MTAsNyBAQCB2b2lkIGRvbWFpbl91cGRhdGVfbm9k
ZV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogICAgIGNwdW1hc2tfdmFyX3QgZG9tX2NwdW1h
c2ssIGRvbV9jcHVtYXNrX3NvZnQ7CiAgICAgY3B1bWFza190ICpkb21fYWZmaW5pdHk7CiAgICAg
Y29uc3QgY3B1bWFza190ICpvbmxpbmU7Ci0gICAgc3RydWN0IHZjcHUgKnY7CisgICAgc3RydWN0
IHNjaGVkX2l0ZW0gKml0ZW07CiAgICAgdW5zaWduZWQgaW50IGNwdTsKIAogICAgIC8qIERvIHdl
IGhhdmUgdmNwdXMgYWxyZWFkeT8gSWYgbm90LCBubyBuZWVkIHRvIHVwZGF0ZSBub2RlLWFmZmlu
aXR5LiAqLwpAQCAtNTQzLDEyICs1NDMsMTEgQEAgdm9pZCBkb21haW5fdXBkYXRlX25vZGVfYWZm
aW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgICogYW5kIHRoZSBmdWxsIG1hc2sgb2Yg
d2hlcmUgaXQgd291bGQgcHJlZmVyIHRvIHJ1biAodGhlIHVuaW9uIG9mCiAgICAgICAgICAqIHRo
ZSBzb2Z0IGFmZmluaXR5IG9mIGFsbCBpdHMgdmFyaW91cyB2Y3B1cykuIExldCdzIGJ1aWxkIHRo
ZW0uCiAgICAgICAgICAqLwotICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCisgICAgICAg
IGZvcl9lYWNoX3NjaGVkX2l0ZW0gKCBkLCBpdGVtICkKICAgICAgICAgewotICAgICAgICAgICAg
Y3B1bWFza19vcihkb21fY3B1bWFzaywgZG9tX2NwdW1hc2ssCi0gICAgICAgICAgICAgICAgICAg
ICAgIHYtPnNjaGVkX2l0ZW0tPmNwdV9oYXJkX2FmZmluaXR5KTsKKyAgICAgICAgICAgIGNwdW1h
c2tfb3IoZG9tX2NwdW1hc2ssIGRvbV9jcHVtYXNrLCBpdGVtLT5jcHVfaGFyZF9hZmZpbml0eSk7
CiAgICAgICAgICAgICBjcHVtYXNrX29yKGRvbV9jcHVtYXNrX3NvZnQsIGRvbV9jcHVtYXNrX3Nv
ZnQsCi0gICAgICAgICAgICAgICAgICAgICAgIHYtPnNjaGVkX2l0ZW0tPmNwdV9zb2Z0X2FmZmlu
aXR5KTsKKyAgICAgICAgICAgICAgICAgICAgICAgaXRlbS0+Y3B1X3NvZnRfYWZmaW5pdHkpOwog
ICAgICAgICB9CiAgICAgICAgIC8qIEZpbHRlciBvdXQgbm9uLW9ubGluZSBjcHVzICovCiAgICAg
ICAgIGNwdW1hc2tfYW5kKGRvbV9jcHVtYXNrLCBkb21fY3B1bWFzaywgb25saW5lKTsKZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRl
eCA1MzY4ZDY2Y2ZjLi5iYzA1NTRmMmRhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC00MjMsMTYgKzQyMywxNyBAQCBzdGF0
aWMgdm9pZCBzY2hlZF9tb3ZlX2lycXMoc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0pCiBpbnQgc2No
ZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiB7CiAg
ICAgc3RydWN0IHZjcHUgKnY7CisgICAgc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW07CiAgICAgdW5z
aWduZWQgaW50IG5ld19wOwotICAgIHZvaWQgKip2Y3B1X3ByaXY7CisgICAgdm9pZCAqKml0ZW1f
cHJpdjsKICAgICB2b2lkICpkb21kYXRhOwotICAgIHZvaWQgKnZjcHVkYXRhOworICAgIHZvaWQg
Kml0ZW1kYXRhOwogICAgIHN0cnVjdCBzY2hlZHVsZXIgKm9sZF9vcHM7CiAgICAgdm9pZCAqb2xk
X2RvbWRhdGE7CiAKLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCisgICAgZm9yX2VhY2hfc2No
ZWRfaXRlbSAoIGQsIGl0ZW0gKQogICAgIHsKLSAgICAgICAgaWYgKCB2LT5zY2hlZF9pdGVtLT5h
ZmZpbml0eV9icm9rZW4gKQorICAgICAgICBpZiAoIGl0ZW0tPmFmZmluaXR5X2Jyb2tlbiApCiAg
ICAgICAgICAgICByZXR1cm4gLUVCVVNZOwogICAgIH0KIApAQCAtNDQwLDIyICs0NDEsMjEgQEAg
aW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpj
KQogICAgIGlmICggSVNfRVJSKGRvbWRhdGEpICkKICAgICAgICAgcmV0dXJuIFBUUl9FUlIoZG9t
ZGF0YSk7CiAKLSAgICB2Y3B1X3ByaXYgPSB4emFsbG9jX2FycmF5KHZvaWQgKiwgZC0+bWF4X3Zj
cHVzKTsKLSAgICBpZiAoIHZjcHVfcHJpdiA9PSBOVUxMICkKKyAgICBpdGVtX3ByaXYgPSB4emFs
bG9jX2FycmF5KHZvaWQgKiwgZC0+bWF4X3ZjcHVzKTsKKyAgICBpZiAoIGl0ZW1fcHJpdiA9PSBO
VUxMICkKICAgICB7CiAgICAgICAgIHNjaGVkX2ZyZWVfZG9tZGF0YShjLT5zY2hlZCwgZG9tZGF0
YSk7CiAgICAgICAgIHJldHVybiAtRU5PTUVNOwogICAgIH0KIAotICAgIGZvcl9lYWNoX3ZjcHUg
KCBkLCB2ICkKKyAgICBmb3JfZWFjaF9zY2hlZF9pdGVtICggZCwgaXRlbSApCiAgICAgewotICAg
ICAgICB2Y3B1X3ByaXZbdi0+dmNwdV9pZF0gPSBzY2hlZF9hbGxvY192ZGF0YShjLT5zY2hlZCwg
di0+c2NoZWRfaXRlbSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZG9tZGF0YSk7Ci0gICAgICAgIGlmICggdmNwdV9wcml2W3YtPnZjcHVfaWRdID09
IE5VTEwgKQorICAgICAgICBpdGVtX3ByaXZbaXRlbS0+aXRlbV9pZF0gPSBzY2hlZF9hbGxvY192
ZGF0YShjLT5zY2hlZCwgaXRlbSwgZG9tZGF0YSk7CisgICAgICAgIGlmICggaXRlbV9wcml2W2l0
ZW0tPml0ZW1faWRdID09IE5VTEwgKQogICAgICAgICB7Ci0gICAgICAgICAgICBmb3JfZWFjaF92
Y3B1ICggZCwgdiApCi0gICAgICAgICAgICAgICAgeGZyZWUodmNwdV9wcml2W3YtPnZjcHVfaWRd
KTsKLSAgICAgICAgICAgIHhmcmVlKHZjcHVfcHJpdik7CisgICAgICAgICAgICBmb3JfZWFjaF9z
Y2hlZF9pdGVtICggZCwgaXRlbSApCisgICAgICAgICAgICAgICAgeGZyZWUoaXRlbV9wcml2W2l0
ZW0tPml0ZW1faWRdKTsKKyAgICAgICAgICAgIHhmcmVlKGl0ZW1fcHJpdik7CiAgICAgICAgICAg
ICBzY2hlZF9mcmVlX2RvbWRhdGEoYy0+c2NoZWQsIGRvbWRhdGEpOwogICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07CiAgICAgICAgIH0KQEAgLTQ2NiwzMCArNDY2LDM1IEBAIGludCBzY2hlZF9t
b3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICBvbGRf
b3BzID0gZG9tX3NjaGVkdWxlcihkKTsKICAgICBvbGRfZG9tZGF0YSA9IGQtPnNjaGVkX3ByaXY7
CiAKLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCisgICAgZm9yX2VhY2hfc2NoZWRfaXRlbSAo
IGQsIGl0ZW0gKQogICAgIHsKLSAgICAgICAgc2NoZWRfcmVtb3ZlX2l0ZW0ob2xkX29wcywgdi0+
c2NoZWRfaXRlbSk7CisgICAgICAgIHNjaGVkX3JlbW92ZV9pdGVtKG9sZF9vcHMsIGl0ZW0pOwog
ICAgIH0KIAogICAgIGQtPmNwdXBvb2wgPSBjOwogICAgIGQtPnNjaGVkX3ByaXYgPSBkb21kYXRh
OwogCiAgICAgbmV3X3AgPSBjcHVtYXNrX2ZpcnN0KGMtPmNwdV92YWxpZCk7Ci0gICAgZm9yX2Vh
Y2hfdmNwdSAoIGQsIHYgKQorICAgIGZvcl9lYWNoX3NjaGVkX2l0ZW0gKCBkLCBpdGVtICkKICAg
ICB7CiAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2s7CisgICAgICAgIHVuc2lnbmVkIGludCBpdGVt
X3AgPSBuZXdfcDsKIAotICAgICAgICB2Y3B1ZGF0YSA9IHYtPnNjaGVkX2l0ZW0tPnByaXY7Cisg
ICAgICAgIGl0ZW1kYXRhID0gaXRlbS0+cHJpdjsKIAotICAgICAgICBtaWdyYXRlX3RpbWVyKCZ2
LT5wZXJpb2RpY190aW1lciwgbmV3X3ApOwotICAgICAgICBtaWdyYXRlX3RpbWVyKCZ2LT5zaW5n
bGVzaG90X3RpbWVyLCBuZXdfcCk7Ci0gICAgICAgIG1pZ3JhdGVfdGltZXIoJnYtPnBvbGxfdGlt
ZXIsIG5ld19wKTsKKyAgICAgICAgZm9yX2VhY2hfc2NoZWRfaXRlbV92Y3B1KCBpdGVtLCB2ICkK
KyAgICAgICAgeworICAgICAgICAgICAgbWlncmF0ZV90aW1lcigmdi0+cGVyaW9kaWNfdGltZXIs
IG5ld19wKTsKKyAgICAgICAgICAgIG1pZ3JhdGVfdGltZXIoJnYtPnNpbmdsZXNob3RfdGltZXIs
IG5ld19wKTsKKyAgICAgICAgICAgIG1pZ3JhdGVfdGltZXIoJnYtPnBvbGxfdGltZXIsIG5ld19w
KTsKKyAgICAgICAgICAgIG5ld19wID0gY3B1bWFza19jeWNsZShuZXdfcCwgYy0+Y3B1X3ZhbGlk
KTsKKyAgICAgICAgfQogCi0gICAgICAgIGxvY2sgPSBpdGVtX3NjaGVkdWxlX2xvY2tfaXJxKHYt
PnNjaGVkX2l0ZW0pOworICAgICAgICBsb2NrID0gaXRlbV9zY2hlZHVsZV9sb2NrX2lycShpdGVt
KTsKIAotICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkodiwgJmNwdW1hc2tfYWxsLCAmY3B1bWFz
a19hbGwpOworICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkoaXRlbS0+dmNwdSwgJmNwdW1hc2tf
YWxsLCAmY3B1bWFza19hbGwpOwogCi0gICAgICAgIHNjaGVkX3NldF9yZXModi0+c2NoZWRfaXRl
bSwgcGVyX2NwdShzY2hlZF9yZXMsIG5ld19wKSk7CisgICAgICAgIHNjaGVkX3NldF9yZXMoaXRl
bSwgcGVyX2NwdShzY2hlZF9yZXMsIGl0ZW1fcCkpOwogICAgICAgICAvKgogICAgICAgICAgKiBX
aXRoIHYtPnByb2Nlc3NvciBtb2RpZmllZCB3ZSBtdXN0IG5vdAogICAgICAgICAgKiAtIG1ha2Ug
YW55IGZ1cnRoZXIgY2hhbmdlcyBhc3N1bWluZyB3ZSBob2xkIHRoZSBzY2hlZHVsZXIgbG9jaywK
QEAgLTQ5NywxNSArNTAyLDEzIEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICAgICAgICovCiAgICAgICAgIHNwaW5fdW5sb2Nr
X2lycShsb2NrKTsKIAotICAgICAgICB2LT5zY2hlZF9pdGVtLT5wcml2ID0gdmNwdV9wcml2W3Yt
PnZjcHVfaWRdOworICAgICAgICBpdGVtLT5wcml2ID0gaXRlbV9wcml2W2l0ZW0tPml0ZW1faWRd
OwogICAgICAgICBpZiAoICFkLT5pc19keWluZyApCiAgICAgICAgICAgICBzY2hlZF9tb3ZlX2ly
cXModi0+c2NoZWRfaXRlbSk7CiAKLSAgICAgICAgbmV3X3AgPSBjcHVtYXNrX2N5Y2xlKG5ld19w
LCBjLT5jcHVfdmFsaWQpOworICAgICAgICBzY2hlZF9pbnNlcnRfaXRlbShjLT5zY2hlZCwgaXRl
bSk7CiAKLSAgICAgICAgc2NoZWRfaW5zZXJ0X2l0ZW0oYy0+c2NoZWQsIHYtPnNjaGVkX2l0ZW0p
OwotCi0gICAgICAgIHNjaGVkX2ZyZWVfdmRhdGEob2xkX29wcywgdmNwdWRhdGEpOworICAgICAg
ICBzY2hlZF9mcmVlX3ZkYXRhKG9sZF9vcHMsIGl0ZW1kYXRhKTsKICAgICB9CiAKICAgICBkb21h
aW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoZCk7CkBAIC01MTQsNyArNTE3LDcgQEAgaW50IHNjaGVk
X21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKQogCiAgICAg
c2NoZWRfZnJlZV9kb21kYXRhKG9sZF9vcHMsIG9sZF9kb21kYXRhKTsKIAotICAgIHhmcmVlKHZj
cHVfcHJpdik7CisgICAgeGZyZWUoaXRlbV9wcml2KTsKIAogICAgIHJldHVybiAwOwogfQpAQCAt
ODE5LDE1ICs4MjIsMTQgQEAgdm9pZCB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoc3RydWN0IHZjcHUg
KnYpCiB2b2lkIHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogewogICAg
IHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Ci0gICAgc3RydWN0IHZjcHUg
KnY7CisgICAgc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW07CiAKICAgICBBU1NFUlQoc3lzdGVtX3N0
YXRlID09IFNZU19TVEFURV9yZXN1bWUpOwogCi0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQor
ICAgIGZvcl9lYWNoX3NjaGVkX2l0ZW0gKCBkLCBpdGVtICkKICAgICB7CiAgICAgICAgIHNwaW5s
b2NrX3QgKmxvY2s7Ci0gICAgICAgIHVuc2lnbmVkIGludCBvbGRfY3B1ID0gdi0+cHJvY2Vzc29y
OwotICAgICAgICBzdHJ1Y3Qgc2NoZWRfaXRlbSAqaXRlbSA9IHYtPnNjaGVkX2l0ZW07CisgICAg
ICAgIHVuc2lnbmVkIGludCBvbGRfY3B1ID0gc2NoZWRfaXRlbV9jcHUoaXRlbSk7CiAgICAgICAg
IHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqcmVzOwogCiAgICAgICAgIEFTU0VSVCghaXRlbV9ydW5u
YWJsZShpdGVtKSk7CkBAIC04NDYsNyArODQ4LDggQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5p
dHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgewogICAgICAgICAgICAgaWYgKCBpdGVtLT5h
ZmZpbml0eV9icm9rZW4gKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIHNjaGVkX3Nl
dF9hZmZpbml0eSh2LCBpdGVtLT5jcHVfaGFyZF9hZmZpbml0eV9zYXZlZCwgTlVMTCk7CisgICAg
ICAgICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KGl0ZW0tPnZjcHUsIGl0ZW0tPmNwdV9oYXJk
X2FmZmluaXR5X3NhdmVkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxM
KTsKICAgICAgICAgICAgICAgICBpdGVtLT5hZmZpbml0eV9icm9rZW4gPSAwOwogICAgICAgICAg
ICAgICAgIGNwdW1hc2tfYW5kKGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSwgaXRlbS0+Y3B1X2hh
cmRfYWZmaW5pdHksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5f
Y3B1bWFzayhkKSk7CkBAIC04NTQsOCArODU3LDggQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5p
dHkoc3RydWN0IGRvbWFpbiAqZCkKIAogICAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KGNw
dW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAg
IHByaW50ayhYRU5MT0dfREVCVUcgIkJyZWFraW5nIGFmZmluaXR5IGZvciAlcHZcbiIsIHYpOwot
ICAgICAgICAgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh2LCAmY3B1bWFza19hbGwsIE5VTEwp
OworICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfREVCVUcgIkJyZWFraW5nIGFmZmluaXR5
IGZvciAlcHZcbiIsIGl0ZW0tPnZjcHUpOworICAgICAgICAgICAgICAgIHNjaGVkX3NldF9hZmZp
bml0eShpdGVtLT52Y3B1LCAmY3B1bWFza19hbGwsIE5VTEwpOwogICAgICAgICAgICAgICAgIGNw
dW1hc2tfYW5kKGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSwgaXRlbS0+Y3B1X2hhcmRfYWZmaW5p
dHksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1bWFzayhk
KSk7CiAgICAgICAgICAgICB9CkBAIC04NjUsMTIgKzg2OCwxMiBAQCB2b2lkIHJlc3RvcmVfdmNw
dV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICBzY2hlZF9zZXRfcmVzKGl0ZW0s
IHJlcyk7CiAKICAgICAgICAgbG9jayA9IGl0ZW1fc2NoZWR1bGVfbG9ja19pcnEoaXRlbSk7Ci0g
ICAgICAgIHJlcyA9IHNjaGVkX3BpY2tfcmVzb3VyY2UodmNwdV9zY2hlZHVsZXIodiksIGl0ZW0p
OworICAgICAgICByZXMgPSBzY2hlZF9waWNrX3Jlc291cmNlKHZjcHVfc2NoZWR1bGVyKGl0ZW0t
PnZjcHUpLCBpdGVtKTsKICAgICAgICAgc2NoZWRfc2V0X3JlcyhpdGVtLCByZXMpOwogICAgICAg
ICBzcGluX3VubG9ja19pcnEobG9jayk7CiAKLSAgICAgICAgaWYgKCBvbGRfY3B1ICE9IHYtPnBy
b2Nlc3NvciApCi0gICAgICAgICAgICBzY2hlZF9tb3ZlX2lycXModi0+c2NoZWRfaXRlbSk7Cisg
ICAgICAgIGlmICggb2xkX2NwdSAhPSBzY2hlZF9pdGVtX2NwdShpdGVtKSApCisgICAgICAgICAg
ICBzY2hlZF9tb3ZlX2lycXMoaXRlbSk7CiAgICAgfQogCiAgICAgZG9tYWluX3VwZGF0ZV9ub2Rl
X2FmZmluaXR5KGQpOwpAQCAtODg0LDcgKzg4Nyw2IEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmlu
aXR5KHN0cnVjdCBkb21haW4gKmQpCiBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2lnbmVk
IGludCBjcHUpCiB7CiAgICAgc3RydWN0IGRvbWFpbiAqZDsKLSAgICBzdHJ1Y3QgdmNwdSAqdjsK
ICAgICBzdHJ1Y3QgY3B1cG9vbCAqYzsKICAgICBjcHVtYXNrX3Qgb25saW5lX2FmZmluaXR5Owog
ICAgIGludCByZXQgPSAwOwpAQCAtODk1LDEwICs4OTcsMTEgQEAgaW50IGNwdV9kaXNhYmxlX3Nj
aGVkdWxlcih1bnNpZ25lZCBpbnQgY3B1KQogCiAgICAgZm9yX2VhY2hfZG9tYWluX2luX2NwdXBv
b2wgKCBkLCBjICkKICAgICB7Ci0gICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKKyAgICAg
ICAgc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW07CisKKyAgICAgICAgZm9yX2VhY2hfc2NoZWRfaXRl
bSAoIGQsIGl0ZW0gKQogICAgICAgICB7CiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
OwotICAgICAgICAgICAgc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0gPSB2LT5zY2hlZF9pdGVtOwog
ICAgICAgICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IGl0ZW1fc2NoZWR1bGVfbG9ja19pcnFzYXZl
KGl0ZW0sICZmbGFncyk7CiAKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKCZvbmxpbmVfYWZmaW5p
dHksIGl0ZW0tPmNwdV9oYXJkX2FmZmluaXR5LCBjLT5jcHVfdmFsaWQpOwpAQCAtOTEzLDE0ICs5
MTYsMTQgQEAgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcih1bnNpZ25lZCBpbnQgY3B1KQogICAg
ICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgICAgICB9CiAKLSAgICAgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJCcmVha2luZyBhZmZpbml0eSBmb3IgJXB2XG4iLCB2
KTsKKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJCcmVha2luZyBhZmZpbml0
eSBmb3IgJXB2XG4iLCBpdGVtLT52Y3B1KTsKIAotICAgICAgICAgICAgICAgIHNjaGVkX3NldF9h
ZmZpbml0eSh2LCAmY3B1bWFza19hbGwsIE5VTEwpOworICAgICAgICAgICAgICAgIHNjaGVkX3Nl
dF9hZmZpbml0eShpdGVtLT52Y3B1LCAmY3B1bWFza19hbGwsIE5VTEwpOwogICAgICAgICAgICAg
fQogCi0gICAgICAgICAgICBpZiAoIHYtPnByb2Nlc3NvciAhPSBjcHUgKQorICAgICAgICAgICAg
aWYgKCBzY2hlZF9pdGVtX2NwdShpdGVtKSAhPSBzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSkg
KQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIC8qIFRoZSB2Y3B1IGlzIG5vdCBvbiB0
aGlzIGNwdSwgc28gd2UgY2FuIG1vdmUgb24uICovCisgICAgICAgICAgICAgICAgLyogVGhlIGl0
ZW0gaXMgbm90IG9uIHRoaXMgY3B1LCBzbyB3ZSBjYW4gbW92ZSBvbi4gKi8KICAgICAgICAgICAg
ICAgICBpdGVtX3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCBpdGVtKTsK
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgIH0KQEAgLTkzMywxNyArOTM2
LDE3IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKICAgICAg
ICAgICAgICAqICAqIHRoZSBzY2hlZHVsZXIgd2lsbCBhbHdheXMgZmluZCBhIHN1aXRhYmxlIHNv
bHV0aW9uLCBvcgogICAgICAgICAgICAgICogICAgdGhpbmdzIHdvdWxkIGhhdmUgZmFpbGVkIGJl
Zm9yZSBnZXR0aW5nIGluIGhlcmUuCiAgICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIHZjcHVf
bWlncmF0ZV9zdGFydCh2KTsKKyAgICAgICAgICAgIHZjcHVfbWlncmF0ZV9zdGFydChpdGVtLT52
Y3B1KTsKICAgICAgICAgICAgIGl0ZW1fc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywg
ZmxhZ3MsIGl0ZW0pOwogCi0gICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYpOworICAg
ICAgICAgICAgdmNwdV9taWdyYXRlX2ZpbmlzaChpdGVtLT52Y3B1KTsKIAogICAgICAgICAgICAg
LyoKICAgICAgICAgICAgICAqIFRoZSBvbmx5IGNhdmVhdCwgaW4gdGhpcyBjYXNlLCBpcyB0aGF0
IGlmIGEgdmNwdSBhY3RpdmUgaW4KICAgICAgICAgICAgICAqIHRoZSBoeXBlcnZpc29yIGlzbid0
IG1pZ3JhdGFibGUuIEluIHRoaXMgY2FzZSwgdGhlIGNhbGxlcgogICAgICAgICAgICAgICogc2hv
dWxkIHRyeSBhZ2FpbiBhZnRlciByZWxlYXNpbmcgYW5kIHJlYXF1aXJpbmcgYWxsIGxvY2tzLgog
ICAgICAgICAgICAgICovCi0gICAgICAgICAgICBpZiAoIHYtPnByb2Nlc3NvciA9PSBjcHUgKQor
ICAgICAgICAgICAgaWYgKCBzY2hlZF9pdGVtX2NwdShpdGVtKSA9PSBzY2hlZF9nZXRfcmVzb3Vy
Y2VfY3B1KGNwdSkgKQogICAgICAgICAgICAgICAgIHJldCA9IC1FQUdBSU47CiAgICAgICAgIH0K
ICAgICB9CkBAIC05NTQsMTYgKzk1NywxNiBAQCBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVu
c2lnbmVkIGludCBjcHUpCiBzdGF0aWMgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcl9jaGVjayh1
bnNpZ25lZCBpbnQgY3B1KQogewogICAgIHN0cnVjdCBkb21haW4gKmQ7Ci0gICAgc3RydWN0IHZj
cHUgKnY7CiAgICAgc3RydWN0IGNwdXBvb2wgKmM7CisgICAgc3RydWN0IHNjaGVkX2l0ZW0gKml0
ZW07CiAKICAgICBjID0gcGVyX2NwdShjcHVwb29sLCBjcHUpOwogICAgIGlmICggYyA9PSBOVUxM
ICkKICAgICAgICAgcmV0dXJuIDA7CiAKICAgICBmb3JfZWFjaF9kb21haW5faW5fY3B1cG9vbCAo
IGQsIGMgKQotICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCi0gICAgICAgICAgICBpZiAo
IHYtPnNjaGVkX2l0ZW0tPmFmZmluaXR5X2Jyb2tlbiApCisgICAgICAgIGZvcl9lYWNoX3NjaGVk
X2l0ZW0gKCBkLCBpdGVtICkKKyAgICAgICAgICAgIGlmICggaXRlbS0+YWZmaW5pdHlfYnJva2Vu
ICkKICAgICAgICAgICAgICAgICByZXR1cm4gLUVBRERSSU5VU0U7CiAKICAgICByZXR1cm4gMDsK
LS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
