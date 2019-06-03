Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9583349A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRa-00024D-QQ; Mon, 03 Jun 2019 16:04:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRY-00022Q-TZ
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:16 +0000
X-Inumbo-ID: 3c5c76b6-8619-11e9-beeb-03b514b6ce83
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3c5c76b6-8619-11e9-beeb-03b514b6ce83;
 Mon, 03 Jun 2019 16:04:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74798A78;
 Mon,  3 Jun 2019 09:04:15 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DDA33F246;
 Mon,  3 Jun 2019 09:04:13 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:44 +0100
Message-Id: <20190603160350.29806-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 08/14] xen: Remove mfn_to_gmfn macro
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24geDg2LCBtZm5fdG9fZ21mbiBjYW4gYmUgcmVwbGFjZWQgd2l0aCBtZm5fdG9fZ2ZuLiBPbiBB
cm0sIHRoZXJlIGFyZQpubyBtb3JlIGNhbGwgdG8gbWZuX3RvX2dtZm4sIHNvIHRoZSBoZWxwZXIg
Y2FuIGJlIGRyb3BwZWQuCgpBdCB0aGUgc2FtZSB0aW1lIHJld29yayBhIGNvbW1lbnQgaW4gQXJt
IGNvZGUgdGhhdCBkb2VzIG5vdCBtYWtlIHNlbnNlLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBKYW4ncyBhbmQg
U3RlZmFubydzIGFja2VkLWJ5Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyB8
IDcgKysrLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oICAgICAgICB8IDQgKy0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgICB8IDUgLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpp
bmRleCA0MzE3NDE3NmMyLi5hZDQzMDlmZGU1IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAg
LTE5NSw4ICsxOTUsOCBAQCB2b2lkIF9faHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVj
dCBkb21haW4gKmQpCiAKICAgICAgICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPnBh
Z2VfbGlzdCApCiAgICAgICAgIHsKLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWZuID0gbWZu
X3gocGFnZV90b19tZm4ocGFnZSkpOwotICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBkZm4gPSBt
Zm5fdG9fZ21mbihkLCBtZm4pOworICAgICAgICAgICAgbWZuX3QgbWZuID0gcGFnZV90b19tZm4o
cGFnZSk7CisgICAgICAgICAgICBkZm5fdCBkZm4gPSBfZGZuKGdmbl94KG1mbl90b19nZm4oZCwg
bWZuKSkpOwogICAgICAgICAgICAgdW5zaWduZWQgaW50IG1hcHBpbmcgPSBJT01NVUZfcmVhZGFi
bGU7CiAgICAgICAgICAgICBpbnQgcmV0OwogCkBAIC0yMDUsOCArMjA1LDcgQEAgdm9pZCBfX2h3
ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICAgICAg
ICAgICAgPT0gUEdUX3dyaXRhYmxlX3BhZ2UpICkKICAgICAgICAgICAgICAgICBtYXBwaW5nIHw9
IElPTU1VRl93cml0YWJsZTsKIAotICAgICAgICAgICAgcmV0ID0gaW9tbXVfbWFwKGQsIF9kZm4o
ZGZuKSwgX21mbihtZm4pLCAwLCBtYXBwaW5nLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZmbHVzaF9mbGFncyk7CisgICAgICAgICAgICByZXQgPSBpb21tdV9tYXAoZCwgZGZuLCBtZm4s
IDAsIG1hcHBpbmcsICZmbHVzaF9mbGFncyk7CiAKICAgICAgICAgICAgIGlmICggIXJjICkKICAg
ICAgICAgICAgICAgICByYyA9IHJldDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
bW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAppbmRleCBhOWM4MzUyYjk0Li5hOWNiOThh
NmM3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oCkBAIC0zMjEsMTAgKzMyMSw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKmdl
dF9wYWdlX2Zyb21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2YWRkcl90IHZhLAogI2RlZmluZSBTSEFS
RURfTTJQX0VOVFJZICAgICAgICAgKH4wVUwgLSAxVUwpCiAjZGVmaW5lIFNIQVJFRF9NMlAoX2Up
ICAgICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQogCi0vKiBYZW4gYWx3YXlzIG93
bnMgUDJNIG9uIEFSTSAqLworLyogV2UgZG9uJ3QgaGF2ZSBhIE0yUCBvbiBBcm0gKi8KICNkZWZp
bmUgc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsgKHZvaWQpIChtZm4pLCAodm9pZCko
cGZuKTsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgbWZuX3RvX2dtZm4oX2QsIG1mbikgIChtZm4pCi0K
IAogLyogQXJjaC1zcGVjaWZpYyBwb3J0aW9uIG9mIG1lbW9yeV9vcCBoeXBlcmNhbGwuICovCiBs
b25nIGFyY2hfbWVtb3J5X29wKGludCBvcCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBh
cmcpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tbS5oCmluZGV4IGU0MjBkODgxMzcuLmJmOTA5MTYwNzcgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKQEAg
LTUwNiwxMSArNTA2LDYgQEAgZXh0ZXJuIHN0cnVjdCByYW5nZXNldCAqbW1pb19yb19yYW5nZXM7
CiAKICNkZWZpbmUgZ2V0X2dwZm5fZnJvbV9tZm4obWZuKSAgICAgIChtYWNoaW5lX3RvX3BoeXNf
bWFwcGluZ1sobWZuKV0pCiAKLSNkZWZpbmUgbWZuX3RvX2dtZm4oX2QsIG1mbikgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAotICAgICggKHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShfZCkpICAg
ICAgICAgICAgICAgICAgICAgICBcCi0gICAgICA/IGdldF9ncGZuX2Zyb21fbWZuKG1mbikgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgIDogKG1mbikgKQotCiAjZGVmaW5lIGNvbXBh
dF9wZm5fdG9fY3IzKHBmbikgKCgodW5zaWduZWQpKHBmbikgPDwgMTIpIHwgKCh1bnNpZ25lZCko
cGZuKSA+PiAyMCkpCiAjZGVmaW5lIGNvbXBhdF9jcjNfdG9fcGZuKGNyMykgKCgodW5zaWduZWQp
KGNyMykgPj4gMTIpIHwgKCh1bnNpZ25lZCkoY3IzKSA8PCAyMCkpCiAKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
