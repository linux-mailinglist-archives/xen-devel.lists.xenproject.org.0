Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF6B001D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:33:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84au-0003z5-1S; Wed, 11 Sep 2019 15:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i84as-0003ys-5A
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:31:42 +0000
X-Inumbo-ID: 4027cb72-d4a9-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4027cb72-d4a9-11e9-a337-bc764e2007e4;
 Wed, 11 Sep 2019 15:31:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136AD28;
 Wed, 11 Sep 2019 08:31:40 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E4A3F67D;
 Wed, 11 Sep 2019 08:31:39 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 16:31:34 +0100
Message-Id: <20190911153134.20402-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: setup: Relocate the Device-Tree later
 on in the boot
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

QXQgdGhlIG1vbWVudCwgdGhlIERldmljZS1UcmVlIGlzIHJlbG9jYXRlZCBpbnRvIHhlbmhlYXAg
d2hpbGUgc2V0dGluZwp1cCB0aGUgbWVtb3J5IHN1YnN5c3RlbS4gVGhpcyBpcyBhY3R1YWxseSBu
b3QgbmVjZXNzYXJ5IGJlY2F1c2UgdGhlCmVhcmx5IG1hcHBpbmcgaXMgc3RpbGwgcHJlc2VudCBh
bmQgd2UgZG9uJ3QgcmVxdWlyZSB0aGUgdmlydHVhbCBhZGRyZXNzCnRvIGJlIHN0YWJsZSB1bnRp
bCB1bmZsYXR0aW5nIHRoZSBEZXZpY2UtVHJlZS4KClNvIHRoZSByZWxvY2F0aW9uIGNhbiBzYWZl
bHkgYmUgbW92ZWQgYWZ0ZXIgdGhlIG1lbW9yeSBzdWJzeXN0ZW0gaXMKZnVsbHkgc2V0dXAuIFRo
aXMgaGFzIHRoZSBuaWNlIGFkdmFudGFnZSB0byBtYWtlIHRoZSByZWxvY2F0aW9uIGNvbW1vbgph
bmQgbGV0IHRoZSB4ZW5oZWFwIGFsbG9jYXRvciBkZWNpZGVzIHdoZXJlIHRvIHB1dCBpdC4KCkxh
c3RseSwgdGhlIGRldmljZS10cmVlIGlzIG5vdCBnb2luZyB0byBiZSB1c2VkIGZvciBBQ1BJIHN5
c3RlbS4gU28KdGhlcmUgYXJlIG5vIG5lZWQgdG8gcmVsb2NhdGUgaXQgYW5kIGNhbiBqdXN0IGJl
IGRpc2NhcmRlZC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgfCA1OCArKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCAxYjMwM2JkZTM0Li5lYmJmYWQ5NGU0
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwpAQCAtMzk5LDYgKzM5OSwxOSBAQCB2b2lkIF9faW5pdCBkaXNjYXJkX2luaXRpYWxfbW9k
dWxlcyh2b2lkKQogICAgIHJlbW92ZV9lYXJseV9tYXBwaW5ncygpOwogfQogCisvKiBSZWxvY2F0
ZSB0aGUgRkRUIGluIFhlbiBoZWFwICovCitzdGF0aWMgdm9pZCAqIF9faW5pdCByZWxvY2F0ZV9m
ZHQocGFkZHJfdCBkdGJfcGFkZHIsIHNpemVfdCBkdGJfc2l6ZSkKK3sKKyAgICB2b2lkICpmZHQg
PSB4bWFsbG9jX2J5dGVzKGR0Yl9zaXplKTsKKworICAgIGlmICggIWZkdCApCisgICAgICAgIHBh
bmljKCJVbmFibGUgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciByZWxvY2F0aW5nIHRoZSBEZXZpY2Ut
VHJlZS5cbiIpOworCisgICAgY29weV9mcm9tX3BhZGRyKGZkdCwgZHRiX3BhZGRyLCBkdGJfc2l6
ZSk7CisKKyAgICByZXR1cm4gZmR0OworfQorCiAjaWZkZWYgQ09ORklHX0FSTV8zMgogLyoKICAq
IFJldHVybnMgdGhlIGVuZCBhZGRyZXNzIG9mIHRoZSBoaWdoZXN0IHJlZ2lvbiBpbiB0aGUgcmFu
Z2Ugcy4uZQpAQCAtNTcyLDE2ICs1ODUsMTMgQEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfcGR4
KHZvaWQpCiB9CiAKICNpZmRlZiBDT05GSUdfQVJNXzMyCi1zdGF0aWMgdm9pZCBfX2luaXQgc2V0
dXBfbW0odW5zaWduZWQgbG9uZyBkdGJfcGFkZHIsIHNpemVfdCBkdGJfc2l6ZSkKK3N0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lkKQogewogICAgIHBhZGRyX3QgcmFtX3N0YXJ0LCByYW1f
ZW5kLCByYW1fc2l6ZTsKICAgICBwYWRkcl90IHMsIGU7CiAgICAgdW5zaWduZWQgbG9uZyByYW1f
cGFnZXM7CiAgICAgdW5zaWduZWQgbG9uZyBoZWFwX3BhZ2VzLCB4ZW5oZWFwX3BhZ2VzLCBkb21o
ZWFwX3BhZ2VzOwotICAgIHVuc2lnbmVkIGxvbmcgZHRiX3BhZ2VzOwotICAgIHVuc2lnbmVkIGxv
bmcgYm9vdF9tZm5fc3RhcnQsIGJvb3RfbWZuX2VuZDsKICAgICBpbnQgaTsKLSAgICB2b2lkICpm
ZHQ7CiAgICAgY29uc3QgdWludDMyX3QgY3RyID0gUkVBRF9DUDMyKENUUik7CiAKICAgICBpZiAo
ICFib290aW5mby5tZW0ubnJfYmFua3MgKQpAQCAtNjU1LDIxICs2NjUsNiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgc2V0dXBfbW0odW5zaWduZWQgbG9uZyBkdGJfcGFkZHIsIHNpemVfdCBkdGJfc2l6
ZSkKIAogICAgIHNldHVwX3hlbmhlYXBfbWFwcGluZ3MoKGUgPj4gUEFHRV9TSElGVCkgLSB4ZW5o
ZWFwX3BhZ2VzLCB4ZW5oZWFwX3BhZ2VzKTsKIAotICAgIC8qCi0gICAgICogTmVlZCBhIHNpbmds
ZSBtYXBwZWQgcGFnZSBmb3IgcG9wdWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0Ci0gICAgICog
YW5kIGVub3VnaCBtYXBwZWQgcGFnZXMgZm9yIGNvcHlpbmcgdGhlIERUQi4KLSAgICAgKi8KLSAg
ICBkdGJfcGFnZXMgPSAoZHRiX3NpemUgKyBQQUdFX1NJWkUtMSkgPj4gUEFHRV9TSElGVDsKLSAg
ICBib290X21mbl9zdGFydCA9IG1mbl94KHhlbmhlYXBfbWZuX2VuZCkgLSBkdGJfcGFnZXMgLSAx
OwotICAgIGJvb3RfbWZuX2VuZCA9IG1mbl94KHhlbmhlYXBfbWZuX2VuZCk7Ci0KLSAgICBpbml0
X2Jvb3RfcGFnZXMocGZuX3RvX3BhZGRyKGJvb3RfbWZuX3N0YXJ0KSwgcGZuX3RvX3BhZGRyKGJv
b3RfbWZuX2VuZCkpOwotCi0gICAgLyogQ29weSB0aGUgRFRCLiAqLwotICAgIGZkdCA9IG1mbl90
b192aXJ0KG1mbl94KGFsbG9jX2Jvb3RfcGFnZXMoZHRiX3BhZ2VzLCAxKSkpOwotICAgIGNvcHlf
ZnJvbV9wYWRkcihmZHQsIGR0Yl9wYWRkciwgZHRiX3NpemUpOwotICAgIGRldmljZV90cmVlX2Zs
YXR0ZW5lZCA9IGZkdDsKLQogICAgIC8qIEFkZCBub24teGVuaGVhcCBtZW1vcnkgKi8KICAgICBm
b3IgKCBpID0gMDsgaSA8IGJvb3RpbmZvLm1lbS5ucl9iYW5rczsgaSsrICkKICAgICB7CkBAIC03
MTMsMjAgKzcwOCwxNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odW5zaWduZWQgbG9u
ZyBkdGJfcGFkZHIsIHNpemVfdCBkdGJfc2l6ZSkKICAgICBzZXR1cF9mcmFtZXRhYmxlX21hcHBp
bmdzKHJhbV9zdGFydCwgcmFtX2VuZCk7CiAgICAgbWF4X3BhZ2UgPSBQRk5fRE9XTihyYW1fZW5k
KTsKIAotICAgIC8qIEFkZCB4ZW5oZWFwIG1lbW9yeSB0aGF0IHdhcyBub3QgYWxyZWFkeSBhZGRl
ZCB0byB0aGUgYm9vdAotICAgICAgIGFsbG9jYXRvci4gKi8KKyAgICAvKiBBZGQgeGVuaGVhcCBt
ZW1vcnkgdGhhdCB3YXMgbm90IGFscmVhZHkgYWRkZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiAq
LwogICAgIGluaXRfeGVuaGVhcF9wYWdlcyhtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQp
LAotICAgICAgICAgICAgICAgICAgICAgICBwZm5fdG9fcGFkZHIoYm9vdF9tZm5fc3RhcnQpKTsK
KyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX2VuZCkpOwog
fQogI2Vsc2UgLyogQ09ORklHX0FSTV82NCAqLwotc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21t
KHVuc2lnbmVkIGxvbmcgZHRiX3BhZGRyLCBzaXplX3QgZHRiX3NpemUpCitzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfbW0odm9pZCkKIHsKICAgICBwYWRkcl90IHJhbV9zdGFydCA9IH4wOwogICAg
IHBhZGRyX3QgcmFtX2VuZCA9IDA7CiAgICAgcGFkZHJfdCByYW1fc2l6ZSA9IDA7CiAgICAgaW50
IGJhbms7Ci0gICAgdW5zaWduZWQgbG9uZyBkdGJfcGFnZXM7Ci0gICAgdm9pZCAqZmR0OwogCiAg
ICAgaW5pdF9wZHgoKTsKIApAQCAtNzcwLDE2ICs3NjIsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
c2V0dXBfbW0odW5zaWduZWQgbG9uZyBkdGJfcGFkZHIsIHNpemVfdCBkdGJfc2l6ZSkKICAgICB4
ZW5oZWFwX21mbl9zdGFydCA9IG1hZGRyX3RvX21mbihyYW1fc3RhcnQpOwogICAgIHhlbmhlYXBf
bWZuX2VuZCA9IG1hZGRyX3RvX21mbihyYW1fZW5kKTsKIAotICAgIC8qCi0gICAgICogTmVlZCBl
bm91Z2ggbWFwcGVkIHBhZ2VzIGZvciBjb3B5aW5nIHRoZSBEVEIuCi0gICAgICovCi0gICAgZHRi
X3BhZ2VzID0gKGR0Yl9zaXplICsgUEFHRV9TSVpFLTEpID4+IFBBR0VfU0hJRlQ7Ci0KLSAgICAv
KiBDb3B5IHRoZSBEVEIuICovCi0gICAgZmR0ID0gbWZuX3RvX3ZpcnQobWZuX3goYWxsb2NfYm9v
dF9wYWdlcyhkdGJfcGFnZXMsIDEpKSk7Ci0gICAgY29weV9mcm9tX3BhZGRyKGZkdCwgZHRiX3Bh
ZGRyLCBkdGJfc2l6ZSk7Ci0gICAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gZmR0OwotCiAgICAg
c2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncyhyYW1fc3RhcnQsIHJhbV9lbmQpOwogICAgIG1heF9w
YWdlID0gUEZOX0RPV04ocmFtX2VuZCk7CiB9CkBAIC04MzgsNyArODIwLDcgQEAgdm9pZCBfX2lu
aXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKICAgICBwcmludGso
IkNvbW1hbmQgbGluZTogJXNcbiIsIGNtZGxpbmUpOwogICAgIGNtZGxpbmVfcGFyc2UoY21kbGlu
ZSk7CiAKLSAgICBzZXR1cF9tbShmZHRfcGFkZHIsIGZkdF9zaXplKTsKKyAgICBzZXR1cF9tbSgp
OwogCiAgICAgLyogUGFyc2UgdGhlIEFDUEkgdGFibGVzIGZvciBwb3NzaWJsZSBib290LXRpbWUg
Y29uZmlndXJhdGlvbiAqLwogICAgIGFjcGlfYm9vdF90YWJsZV9pbml0KCk7CkBAIC04NTYsMTAg
KzgzOCwxNCBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNf
b2Zmc2V0LAogICAgIGlmICggYWNwaV9kaXNhYmxlZCApCiAgICAgewogICAgICAgICBwcmludGso
IkJvb3RpbmcgdXNpbmcgRGV2aWNlIFRyZWVcbiIpOworICAgICAgICBkZXZpY2VfdHJlZV9mbGF0
dGVuZWQgPSByZWxvY2F0ZV9mZHQoZmR0X3BhZGRyLCBmZHRfc2l6ZSk7CiAgICAgICAgIGR0X3Vu
ZmxhdHRlbl9ob3N0X2RldmljZV90cmVlKCk7CiAgICAgfQogICAgIGVsc2UKKyAgICB7CiAgICAg
ICAgIHByaW50aygiQm9vdGluZyB1c2luZyBBQ1BJXG4iKTsKKyAgICAgICAgZGV2aWNlX3RyZWVf
ZmxhdHRlbmVkID0gTlVMTDsKKyAgICB9CiAKICAgICBpbml0X0lSUSgpOwogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
