Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792881667C
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:18:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1oT-0007OC-Eg; Tue, 07 May 2019 15:15:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1oS-0007NN-IZ
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:24 +0000
X-Inumbo-ID: ef840d39-70da-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ef840d39-70da-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 15:15:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63E2F15AD;
 Tue,  7 May 2019 08:15:23 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C5923F5AF;
 Tue,  7 May 2019 08:15:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  7 May 2019 16:14:51 +0100
Message-Id: <20190507151458.29350-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507151458.29350-1-julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 07/14] xen: Convert is_xen_fixed_mfn to use
 typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Shane Wang <shane.wang@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Gang Wei <gang.wei@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBKYW4ncyByZXZpZXdlZC1i
eQogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQotLS0KIHhlbi9hcmNoL3g4Ni90Ym9v
dC5jICAgICB8IDIgKy0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICB8IDIgKy0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaCB8IDQgKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIHwgNCAr
Ky0tCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCmlu
ZGV4IGYzZmRlZTRkMzkuLjMwZDE1OWNjNjIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90Ym9v
dC5jCisrKyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCkBAIC0yODAsNyArMjgwLDcgQEAgc3RhdGlj
IHZvaWQgdGJvb3RfZ2VuX3hlbmhlYXBfaW50ZWdyaXR5KGNvbnN0IHVpbnQ4X3Qga2V5W1RCX0tF
WV9TSVpFXSwKIAogICAgICAgICBpZiAoICFtZm5fdmFsaWQoX21mbihtZm4pKSApCiAgICAgICAg
ICAgICBjb250aW51ZTsKLSAgICAgICAgaWYgKCBpc194ZW5fZml4ZWRfbWZuKG1mbikgKQorICAg
ICAgICBpZiAoIGlzX3hlbl9maXhlZF9tZm4oX21mbihtZm4pKSApCiAgICAgICAgICAgICBjb250
aW51ZTsgLyogc2tpcCBYZW4gKi8KICAgICAgICAgaWYgKCAobWZuID49IFBGTl9ET1dOKGdfdGJv
b3Rfc2hhcmVkLT50Ym9vdF9iYXNlIC0gMyAqIFBBR0VfU0laRSkpCiAgICAgICAgICAgICAgJiYg
KG1mbiA8IFBGTl9VUChnX3Rib290X3NoYXJlZC0+dGJvb3RfYmFzZQpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwppbmRleCBmNDQ1
ZjdkYWVjLi5iNDA2N2FlMjAyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwor
KysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwpAQCAtMTU4NCw3ICsxNTg0LDcgQEAgaW50IG9m
ZmxpbmVfcGFnZShtZm5fdCBtZm4sIGludCBicm9rZW4sIHVpbnQzMl90ICpzdGF0dXMpCiAgICAg
KnN0YXR1cyA9IDA7CiAgICAgcGcgPSBtZm5fdG9fcGFnZShtZm4pOwogCi0gICAgaWYgKCBpc194
ZW5fZml4ZWRfbWZuKG1mbl94KG1mbikpICkKKyAgICBpZiAoIGlzX3hlbl9maXhlZF9tZm4obWZu
KSApCiAgICAgewogICAgICAgICAqc3RhdHVzID0gUEdfT0ZGTElORV9YRU5QQUdFIHwgUEdfT0ZG
TElORV9GQUlMRUQgfAogICAgICAgICAgIChET01JRF9YRU4gPDwgUEdfT0ZGTElORV9PV05FUl9T
SElGVCk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL21tLmgKaW5kZXggN2I2YWFmNWUzZi4uYjU2MDE4YWFjZSAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaApA
QCAtMTUxLDggKzE1MSw4IEBAIGV4dGVybiB2YWRkcl90IHhlbmhlYXBfdmlydF9zdGFydDsKICNl
bmRpZgogCiAjZGVmaW5lIGlzX3hlbl9maXhlZF9tZm4obWZuKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAotICAgICgocGZuX3RvX3BhZGRyKG1mbikgPj0gdmlydF90b19tYWRk
cigmX3N0YXJ0KSkgJiYgICAgICAgXAotICAgICAocGZuX3RvX3BhZGRyKG1mbikgPD0gdmlydF90
b19tYWRkcigmX2VuZCkpKQorICAgICgobWZuX3RvX21hZGRyKG1mbikgPj0gdmlydF90b19tYWRk
cigmX3N0YXJ0KSkgJiYgICAgICAgICAgIFwKKyAgICAgKG1mbl90b19tYWRkcihtZm4pIDw9IHZp
cnRfdG9fbWFkZHIoJl9lbmQpKSkKIAogI2RlZmluZSBwYWdlX2dldF9vd25lcihfcCkgICAgKF9w
KS0+di5pbnVzZS5kb21haW4KICNkZWZpbmUgcGFnZV9zZXRfb3duZXIoX3AsX2QpICgoX3ApLT52
LmludXNlLmRvbWFpbiA9IChfZCkpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21t
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5kZXggNmZhYTU2MzE2Ny4uZjEyNGY1Nzk2
NCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvbW0uaApAQCAtMjgwLDggKzI4MCw4IEBAIHN0cnVjdCBwYWdlX2luZm8KICNkZWZp
bmUgaXNfeGVuX2hlYXBfbWZuKG1mbikgXAogICAgIChfX21mbl92YWxpZChtZm4pICYmIGlzX3hl
bl9oZWFwX3BhZ2UobWZuX3RvX3BhZ2UoX21mbihtZm4pKSkpCiAjZGVmaW5lIGlzX3hlbl9maXhl
ZF9tZm4obWZuKSAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAoKCgobWZuKSA8PCBQQUdFX1NI
SUZUKSA+PSBfX3BhKCZfc3RleHQpKSAmJiAgXAotICAgICAoKChtZm4pIDw8IFBBR0VfU0hJRlQp
IDw9IF9fcGEoJl9fMk1fcndkYXRhX2VuZCkpKQorICAgICgoKG1mbl90b19tYWRkcihtZm4pKSA+
PSBfX3BhKCZfc3RleHQpKSAmJiAgICBcCisgICAgICgobWZuX3RvX21hZGRyKG1mbikpIDw9IF9f
cGEoJl9fMk1fcndkYXRhX2VuZCkpKQogCiAjZGVmaW5lIFBSdHlwZV9pbmZvICIwMTZseCIvKiBz
aG91bGQgb25seSBiZSB1c2VkIGZvciBwcmludGsncyAqLwogCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
