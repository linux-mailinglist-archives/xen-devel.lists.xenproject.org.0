Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71270BD4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg37-0003gb-MV; Mon, 22 Jul 2019 21:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2x-0003L7-Rw
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:39 +0000
X-Inumbo-ID: 57dc0934-acc9-11e9-854b-cf3f7e8ca122
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 57dc0934-acc9-11e9-854b-cf3f7e8ca122;
 Mon, 22 Jul 2019 21:40:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4931F1509;
 Mon, 22 Jul 2019 14:40:37 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9740D3F71F;
 Mon, 22 Jul 2019 14:40:36 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:58 +0100
Message-Id: <20190722213958.5761-36-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 35/35] xen/arm: Zero BSS after the MMU and
 D-cache is turned on
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCBCU1MgaXMgemVyb2VkIGJlZm9yZSB0aGUgTU1VIGFuZCBELUNhY2hlIGlz
IHR1cm5lZCBvbi4KSW4gb3RoZXIgd29yZHMsIHRoZSBjYWNoZSB3aWxsIGJlIGJ5cGFzc2VkIHdo
ZW4gemVyb2luZyB0aGUgQlNTIHNlY3Rpb24uCgpPbiBBcm02NCwgcGVyIHRoZSBJbWFnZSBwcm90
b2NvbCBbMV0sIHRoZSBzdGF0ZSBvZiB0aGUgY2FjaGUgZm9yIEJTUyByZWdpb24KaXMgbm90IGtu
b3duIGJlY2F1c2UgaXQgaXMgbm90IHBhcnQgb2YgdGhlICJsb2FkZWQga2VybmVsIGltYWdlIi4K
Ck9uIEFybTMyLCB0aGUgYm9vdCBwcm90b2NvbCBbMl0gZG9lcyBub3QgbWVudGlvbiBhbnl0aGlu
ZyBhYm91dCB0aGUKc3RhdGUgb2YgdGhlIGNhY2hlLiBUaGVyZWZvcmUsIGl0IHNob3VsZCBiZSBh
c3N1bWVkIHRoYXQgaXQgaXMgbm90IGtub3duCmZvciBCU1MgcmVnaW9uLgoKVGhpcyBtZWFucyB0
aGF0IHRoZSBjYWNoZSB3aWxsIG5lZWQgdG8gYmUgaW52YWxpZGF0ZWQgdHdpY2UgZm9yIHRoZSBC
U1MKcmVnaW9uOgogICAgMSkgQmVmb3JlIHplcm9pbmcgdG8gcmVtb3ZlIGFueSBkaXJ0eSBjYWNo
ZSBsaW5lLiBPdGhlcndpc2UgdGhleSBtYXkKICAgIGdldCBldmljdGVkIHdoaWxlIHplcm9pbmcg
YW5kIHRoZXJlZm9yZSBvdmVycmlkaW5nIHRoZSB2YWx1ZS4KICAgIDIpIEFmdGVyIHplcm9pbmcg
dG8gcmVtb3ZlIGFueSBjYWNoZSBsaW5lIHRoYXQgbWF5IGhhdmUgYmVlbgogICAgc3BlY3VsYXRl
ZC4gT3RoZXJ3aXNlIHdoZW4gdHVybmluZyBvbiBNTVUgYW5kIEQtQ2FjaGUsIHRoZSBDUFUgbWF5
CiAgICBzZWUgb2xkIHZhbHVlcy4KCkF0IHRoZSBtb21lbnQsIHRoZSBvbmx5IHJlYXNvbiB0byBo
YXZlIEJTUyB6ZXJvZWQgZWFybHkgaXMgYmVjYXVzZSB0aGUKYm9vdCBwYWdlIHRhYmxlcyBhcmUg
cGFydCBvZiBpdC4gVG8gYXZvaWQgdGhlIHR3byBjYWNoZSBpbnZhbGlkYXRpb25zLAppdCB3b3Vs
ZCBiZSBiZXR0ZXIgaWYgdGhlIGJvb3QgcGFnZSB0YWJsZXMgYXJlIHBhcnQgb2YgdGhlICJsb2Fk
ZWQKa2VybmVsIGltYWdlIiBhbmQgdGhlcmVmb3JlIGJlIHplcm9lZCB3aGVuIGxvYWRpbmcgdGhl
IGltYWdlIGludG8KbWVtb3J5LiBBIGdvb2QgY2FuZGlkYXRlIGlzIHRoZSBzZWN0aW9uIC5kYXRh
LnBhZ2VfYWxpZ25lZC4KCkEgbmV3IG1hY3JvIERFRklORV9CT09UX1BBR0VfVEFCTEUgaXMgaW50
cm9kdWNlZCB0byBjcmVhdGUgYW5kIG1hcmsKcGFnZS10YWJsZXMgdXNlZCBiZWZvcmUgQlNTIGlz
IHplcm9lZC4gVGhpcyBpbmNsdWRlcyBhbGwgYm9vdF8qIGJ1dCBhbHNvCnhlbl9maXhtYXAgYXMg
emVyb19ic3MoKSB3aWxsIHByaW50IGEgbWVzc2FnZSB3aGVuIGVhcmx5cHJpbnRrIGlzCmVuYWJs
ZWQuCgpbMV0gbGludXgvRG9jdW1lbnRhdGlvbi9hcm02NC9ib290aW5nLnR4dApbMl0gbGludXgv
RG9jdW1lbnRhdGlvbi9hcm0vQm9vdGluZwoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBB
ZGQgbWlzc2luZyBzaWduZWQtb2ZmCiAgICAgICAgLSBDbGFyaWZ5IGNvbW1pdCBtZXNzYWdlCiAg
ICAgICAgLSBBZGQgYXJtMzIgcGFydHMKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwg
MTEgKysrLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAgNyArKystLS0tCiB4
ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKystLS0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKaW5kZXggOGExZTI3MmFhYi4uNDhjYWQ2MTAzZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0xNDksNyAr
MTQ5LDYgQEAgcGFzdF96SW1hZ2U6CiAgICAgICAgIG1vdiAgIHIxMiwgIzAgICAgICAgICAgICAg
ICAgLyogcjEyIDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KIAogICAgICAgICBibCAgICBjaGVja19j
cHVfbW9kZQotICAgICAgICBibCAgICB6ZXJvX2JzcwogICAgICAgICBibCAgICBjcHVfaW5pdAog
ICAgICAgICBibCAgICBjcmVhdGVfcGFnZV90YWJsZXMKICAgICAgICAgYmwgICAgZW5hYmxlX21t
dQpAQCAtMTcwLDYgKzE2OSw3IEBAIHByaW1hcnlfc3dpdGNoZWQ6CiAgICAgICAgIC8qIFVzZSBh
IHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovCiAgICAgICAgIG1vdl93IHIx
MSwgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKICNlbmRpZgorICAgICAgICBibCAgICB6ZXJv
X2JzcwogICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCiAgICAgICAgIC8qIFNldHVwIHRo
ZSBhcmd1bWVudHMgZm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBDIHdvcmxkICovCiAgICAgICAg
IG1vdiAgIHIwLCByMTAgICAgICAgICAgICAgICAgLyogcjAgOj0gUGh5c2ljYWwgb2Zmc2V0ICov
CkBAIC0yODAsMTcgKzI4MCwxMiBAQCBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQogLyoKICAqIFpl
cm8gQlNTCiAgKgotICogSW5wdXRzOgotICogICByMTA6IFBoeXNpY2FsIG9mZnNldAotICoKICAq
IENsb2JiZXJzIHIwIC0gcjMKICAqLwogemVyb19ic3M6CiAgICAgICAgIFBSSU5UKCItIFplcm8g
QlNTIC1cclxuIikKLSAgICAgICAgbGRyICAgcjAsID1fX2Jzc19zdGFydCAgICAgICAvKiBMb2Fk
IHN0YXJ0ICYgZW5kIG9mIGJzcyAqLwotICAgICAgICBsZHIgICByMSwgPV9fYnNzX2VuZAotICAg
ICAgICBhZGQgICByMCwgcjAsIHIxMCAgICAgICAgICAgIC8qIEFwcGx5IHBoeXNpY2FsIG9mZnNl
dCAqLwotICAgICAgICBhZGQgICByMSwgcjEsIHIxMAorICAgICAgICBsZHIgICByMCwgPV9fYnNz
X3N0YXJ0ICAgICAgIC8qIHIwIDo9IHZhZGRyKF9fYnNzX3N0YXJ0KSAqLworICAgICAgICBsZHIg
ICByMSwgPV9fYnNzX2VuZCAgICAgICAgIC8qIHIxIDo9IHZhZGRyKF9fYnNzX3N0YXJ0KSAqLwog
CiAgICAgICAgIG1vdiAgIHIyLCAjMAogMTogICAgICBzdHIgICByMiwgW3IwXSwgIzQKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVh
ZC5TCmluZGV4IDIyODdmM2NlNDguLmI2NzFlMGU1OWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtMzAzLDcg
KzMwMyw2IEBAIHJlYWxfc3RhcnRfZWZpOgogICAgICAgICBtb3YgICB4MjIsICMwICAgICAgICAg
ICAgICAgIC8qIHgyMiA6PSBpc19zZWNvbmRhcnlfY3B1ICovCiAKICAgICAgICAgYmwgICAgY2hl
Y2tfY3B1X21vZGUKLSAgICAgICAgYmwgICAgemVyb19ic3MKICAgICAgICAgYmwgICAgY3B1X2lu
aXQKICAgICAgICAgYmwgICAgY3JlYXRlX3BhZ2VfdGFibGVzCiAgICAgICAgIGJsICAgIGVuYWJs
ZV9tbXUKQEAgLTMyNCw2ICszMjMsNyBAQCBwcmltYXJ5X3N3aXRjaGVkOgogICAgICAgICAvKiBV
c2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLwogICAgICAgICBsZHIg
ICB4MjMsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwogI2VuZGlmCisgICAgICAgIGJsICAg
IHplcm9fYnNzCiAgICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKICAgICAgICAgLyogU2V0
dXAgdGhlIGFyZ3VtZW50cyBmb3Igc3RhcnRfeGVuIGFuZCBqdW1wIHRvIEMgd29ybGQgKi8KICAg
ICAgICAgbW92ICAgeDAsIHgyMCAgICAgICAgICAgICAgICAvKiB4MCA6PSBQaHlzaWNhbCBvZmZz
ZXQgKi8KQEAgLTQyNiw3ICs0MjYsNiBAQCBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQogICogWmVy
byBCU1MKICAqCiAgKiBJbnB1dHM6Ci0gKiAgIHgyMDogUGh5c2ljYWwgb2Zmc2V0CiAgKiAgIHgy
NjogRG8gd2UgbmVlZCB0byB6ZXJvIEJTUz8KICAqCiAgKiBDbG9iYmVycyB4MCAtIHgzCkBAIC00
MzYsOCArNDM1LDggQEAgemVyb19ic3M6CiAgICAgICAgIGNibnogIHgyNiwgc2tpcF9ic3MKIAog
ICAgICAgICBQUklOVCgiLSBaZXJvIEJTUyAtXHJcbiIpCi0gICAgICAgIGxvYWRfcGFkZHIgeDAs
IF9fYnNzX3N0YXJ0ICAgIC8qIExvYWQgcGFkZHIgb2Ygc3RhcnQgJiBlbmQgb2YgYnNzICovCi0g
ICAgICAgIGxvYWRfcGFkZHIgeDEsIF9fYnNzX2VuZAorICAgICAgICBsZHIgICB4MCwgPV9fYnNz
X3N0YXJ0ICAgICAgIC8qIHgwIDo9IHZhZGRyKF9fYnNzX3N0YXJ0KSAqLworICAgICAgICBsZHIg
ICB4MSwgPV9fYnNzX2VuZCAgICAgICAgIC8qIHgxIDo9IHZhZGRyKF9fYnNzX3N0YXJ0KSAqLwog
CiAxOiAgICAgIHN0ciAgIHh6ciwgW3gwXSwgIzgKICAgICAgICAgY21wICAgeDAsIHgxCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDQ0MjU4
YWQ4OWMuLjY3MGEzMDg5ZWEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hl
bi9hcmNoL2FybS9tbS5jCkBAIC02Miw2ICs2MiwxNyBAQCBtbV9wcmludGsoY29uc3QgY2hhciAq
Zm10LCAuLi4pIHt9CiAgICAgfSB3aGlsZSAoMCk7CiAjZW5kaWYKIAorLyoKKyAqIE1hY3JvcyB0
byBkZWZpbmUgcGFnZS10YWJsZXM6CisgKiAgLSBERUZJTkVfQk9PVF9QQUdFX1RBQkxFIGlzIHVz
ZWQgdG8gZGVmaW5lIHBhZ2UtdGFibGUgdGhhdCBhcmUgdXNlZAorICogIGluIGFzc2VtYmx5IGNv
ZGUgYmVmb3JlIEJTUyBpcyB6ZXJvZWQuCisgKiAgLSBERUZJTkVfUEFHRV9UQUJMRXssU30gYXJl
IHVzZWQgdG8gZGVmaW5lIG9uZSBvciBtdWx0aXBsZQorICogIHBhZ2UtdGFibGVzIHRvIGJlIHVz
ZWQgYWZ0ZXIgQlNTIGlzIHplcm9lZCAodHlwaWNhbGx5IHRoZXkgYXJlIG9ubHkgdXNlZAorICog
IGluIEMpLgorICovCisjZGVmaW5lIERFRklORV9CT09UX1BBR0VfVEFCTEUobmFtZSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCitscGFlX3QgX19hbGlnbmVkKFBB
R0VfU0laRSkgX19zZWN0aW9uKCIuZGF0YS5wYWdlX2FsaWduZWQiKSBuYW1lW0xQQUVfRU5UUklF
U10KKwogI2RlZmluZSBERUZJTkVfUEFHRV9UQUJMRVMobmFtZSwgbnIpICAgICAgICAgICAgICAg
ICAgICBcCiBscGFlX3QgX19hbGlnbmVkKFBBR0VfU0laRSkgbmFtZVtMUEFFX0VOVFJJRVMgKiAo
bnIpXQogCkBAIC05MCwxMyArMTAxLDEzIEBAIGxwYWVfdCBfX2FsaWduZWQoUEFHRV9TSVpFKSBu
YW1lW0xQQUVfRU5UUklFUyAqIChucildCiAgKiBGaW5hbGx5LCBpZiBFQVJMWV9QUklOVEsgaXMg
ZW5hYmxlZCB0aGVuIHhlbl9maXhtYXAgd2lsbCBiZSBtYXBwZWQKICAqIGJ5IHRoZSBDUFUgb25j
ZSBpdCBoYXMgbW92ZWQgb2ZmIHRoZSAxOjEgbWFwcGluZy4KICAqLwotREVGSU5FX1BBR0VfVEFC
TEUoYm9vdF9wZ3RhYmxlKTsKK0RFRklORV9CT09UX1BBR0VfVEFCTEUoYm9vdF9wZ3RhYmxlKTsK
ICNpZmRlZiBDT05GSUdfQVJNXzY0Ci1ERUZJTkVfUEFHRV9UQUJMRShib290X2ZpcnN0KTsKLURF
RklORV9QQUdFX1RBQkxFKGJvb3RfZmlyc3RfaWQpOworREVGSU5FX0JPT1RfUEFHRV9UQUJMRShi
b290X2ZpcnN0KTsKK0RFRklORV9CT09UX1BBR0VfVEFCTEUoYm9vdF9maXJzdF9pZCk7CiAjZW5k
aWYKLURFRklORV9QQUdFX1RBQkxFKGJvb3Rfc2Vjb25kKTsKLURFRklORV9QQUdFX1RBQkxFKGJv
b3RfdGhpcmQpOworREVGSU5FX0JPT1RfUEFHRV9UQUJMRShib290X3NlY29uZCk7CitERUZJTkVf
Qk9PVF9QQUdFX1RBQkxFKGJvb3RfdGhpcmQpOwogCiAvKiBNYWluIHJ1bnRpbWUgcGFnZSB0YWJs
ZXMgKi8KIApAQCAtMTQ5LDcgKzE2MCw3IEBAIHN0YXRpYyBfX2luaXRkYXRhIGludCB4ZW5oZWFw
X2ZpcnN0X2ZpcnN0X3Nsb3QgPSAtMTsKICAqLwogc3RhdGljIERFRklORV9QQUdFX1RBQkxFUyh4
ZW5fc2Vjb25kLCAyKTsKIC8qIEZpcnN0IGxldmVsIHBhZ2UgdGFibGUgdXNlZCBmb3IgZml4bWFw
ICovCi1ERUZJTkVfUEFHRV9UQUJMRSh4ZW5fZml4bWFwKTsKK0RFRklORV9CT09UX1BBR0VfVEFC
TEUoeGVuX2ZpeG1hcCk7CiAvKiBGaXJzdCBsZXZlbCBwYWdlIHRhYmxlIHVzZWQgdG8gbWFwIFhl
biBpdHNlbGYgd2l0aCB0aGUgWE4gYml0IHNldAogICogYXMgYXBwcm9wcmlhdGUuICovCiBzdGF0
aWMgREVGSU5FX1BBR0VfVEFCTEUoeGVuX3hlbm1hcCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
