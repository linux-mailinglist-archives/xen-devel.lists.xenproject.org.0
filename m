Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83C3348B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:07:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRO-0001v1-Q9; Mon, 03 Jun 2019 16:04:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRN-0001uG-9I
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:05 +0000
X-Inumbo-ID: 35a05018-8619-11e9-b34d-a759a37a7fc6
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 35a05018-8619-11e9-b34d-a759a37a7fc6;
 Mon, 03 Jun 2019 16:04:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FD4AA78;
 Mon,  3 Jun 2019 09:04:04 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F4AB3F246;
 Mon,  3 Jun 2019 09:04:01 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:39 +0100
Message-Id: <20190603160350.29806-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 03/14] xen/grant-table: Make arch specific
 macros typesafe
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCByZXdvcmsgYWxsIHRoZSBhcmNoIHNwZWNpZmljIG1hY3JvcyBpbiBncmFudF90
YWJsZS5oIHRvIHVzZQp0aGUgdHlwZXNhZmUgTUZOL0dGTi4KCkF0IHRoZSBzYW1lIHRpbWUsIHNv
bWUgZnVuY3Rpb25zIGFyZSByZW5hbWVkIHMvZ21mbi9nZm4vIHRvIG1hdGNoIHRoZQpjdXJyZW50
IG5hbWluZyBzY2hlbWUgKHNlZSBpbmNsdWRlL21tLmgpLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2Vz
IGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAg
Q2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgcmV2aWV3ZWQtYnkKCiAgICBD
aGFuZ2VzIGluIHYyOgogICAgICAgIC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4g
dGhlIGNoYW5nZXMgbWFkZQogICAgICAgIC0gRml4IGluZGVudGF0aW9uCiAgICAgICAgLSBBZGFw
dCB0aGUgY29kZSB0byBtYXRjaCB0aGUgbmV3IHByb3RvdHlwZSBvZiBtZm5fdG9fZ2ZuCiAgICAg
ICAgLSBBZGQgSmFuJ3MgYWNrZWQtYnkgZm9yIG5vbi1BUk0gcGFydHMKLS0tCiB4ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMgICAgICAgICAgfCAgNCArKy0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2dy
YW50X3RhYmxlLmggfCAxMiArKysrKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3JhbnRf
dGFibGUuaCB8IDE5ICsrKysrKystLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFu
dF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCmluZGV4IGRkOGE5ZDkwNDYuLjc2
ODAyNDE4NTEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4v
Y29tbW9uL2dyYW50X3RhYmxlLmMKQEAgLTE5NjAsNyArMTk2MCw3IEBAIGdudHRhYl9zZXR1cF90
YWJsZSgKICAgICBvcC5zdGF0dXMgPSBHTlRTVF9va2F5OwogICAgIGZvciAoIGkgPSAwOyBpIDwg
b3AubnJfZnJhbWVzOyBpKysgKQogICAgIHsKLSAgICAgICAgeGVuX3Bmbl90IGdtZm4gPSBnbnR0
YWJfc2hhcmVkX2dtZm4oZCwgZ3QsIGkpOworICAgICAgICB4ZW5fcGZuX3QgZ21mbiA9IGdmbl94
KGdudHRhYl9zaGFyZWRfZ2ZuKGQsIGd0LCBpKSk7CiAKICAgICAgICAgLyogR3JhbnQgdGFibGVz
IGNhbm5vdCBiZSBzaGFyZWQgKi8KICAgICAgICAgQlVHX09OKFNIQVJFRF9NMlAoZ21mbikpOwpA
QCAtMzE3NCw3ICszMTc0LDcgQEAgZ250dGFiX2dldF9zdGF0dXNfZnJhbWVzKFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0oZ250dGFiX2dldF9zdGF0dXNfZnJhbWVzX3QpIHVvcCwKIAogICAgIGZvciAo
IGkgPSAwOyBpIDwgb3AubnJfZnJhbWVzOyBpKysgKQogICAgIHsKLSAgICAgICAgZ21mbiA9IGdu
dHRhYl9zdGF0dXNfZ21mbihkLCBndCwgaSk7CisgICAgICAgIGdtZm4gPSBnZm5feChnbnR0YWJf
c3RhdHVzX2dmbihkLCBndCwgaSkpOwogICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0
KG9wLmZyYW1lX2xpc3QsIGksICZnbWZuLCAxKSApCiAgICAgICAgICAgICBvcC5zdGF0dXMgPSBH
TlRTVF9iYWRfdmlydF9hZGRyOwogICAgIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vZ3JhbnRfdGFibGUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaAppbmRl
eCAwNTFkYjEzNjJiLi43NTA1MzYxODRlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJt
L2dyYW50X3RhYmxlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oCkBA
IC02NSwxNSArNjUsMTUgQEAgdm9pZCBnbnR0YWJfbWFya19kaXJ0eShzdHJ1Y3QgZG9tYWluICpk
LCBtZm5fdCBtZm4pOwogICAgIH0gd2hpbGUgKCAwICkKIAogI2RlZmluZSBnbnR0YWJfZ2V0X2Zy
YW1lX2dmbihndCwgc3QsIGlkeCkgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAg
IF9nZm4oKHN0KSA/IGdudHRhYl9zdGF0dXNfZ21mbihOVUxMLCBndCwgaWR4KSAgICAgICAgICAg
ICAgICAgICAgICAgICBcCi0gICAgICAgICAgICAgOiBnbnR0YWJfc2hhcmVkX2dtZm4oTlVMTCwg
Z3QsIGlkeCkpOyAgICAgICAgICAgICAgICAgICAgICAgXAorICAgKHN0KSA/IGdudHRhYl9zdGF0
dXNfZ2ZuKE5VTEwsIGd0LCBpZHgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAg
ICAgICAgOiBnbnR0YWJfc2hhcmVkX2dmbihOVUxMLCBndCwgaWR4KTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCiB9KQogCi0jZGVmaW5lIGdudHRhYl9zaGFyZWRfZ21mbihkLCB0LCBp
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgIGdmbl94KCgoaSkg
Pj0gbnJfZ3JhbnRfZnJhbWVzKHQpKSA/IElOVkFMSURfR0ZOIDogKHQpLT5hcmNoLnNoYXJlZF9n
Zm5baV0pCisjZGVmaW5lIGdudHRhYl9zaGFyZWRfZ2ZuKGQsIHQsIGkpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICgoKGkpID49IG5yX2dyYW50X2ZyYW1lcyh0
KSkgPyBJTlZBTElEX0dGTiA6ICh0KS0+YXJjaC5zaGFyZWRfZ2ZuW2ldKQogCi0jZGVmaW5lIGdu
dHRhYl9zdGF0dXNfZ21mbihkLCB0LCBpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAotICAgIGdmbl94KCgoaSkgPj0gbnJfc3RhdHVzX2ZyYW1lcyh0KSkgPyBJTlZBTElE
X0dGTiA6ICh0KS0+YXJjaC5zdGF0dXNfZ2ZuW2ldKQorI2RlZmluZSBnbnR0YWJfc3RhdHVzX2dm
bihkLCB0LCBpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAo
KChpKSA+PSBucl9zdGF0dXNfZnJhbWVzKHQpKSA/IElOVkFMSURfR0ZOIDogKHQpLT5hcmNoLnN0
YXR1c19nZm5baV0pCiAKICNkZWZpbmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSAgICAg
ICAgICAgICAgICAgICAgXAogICAgIChpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAmJiBuZWVk
X2lvbW11X3B0X3N5bmMoZCkpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2dyYW50
X3RhYmxlLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2dyYW50X3RhYmxlLmgKaW5kZXggOGI2MDRl
ZDUxZi4uNjYxMjI4ZGQzOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ncmFudF90
YWJsZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3JhbnRfdGFibGUuaApAQCAtMzksMjQg
KzM5LDE5IEBAIHN0YXRpYyBpbmxpbmUgaW50IHJlcGxhY2VfZ3JhbnRfaG9zdF9tYXBwaW5nKHVp
bnQ2NF90IGFkZHIsIG1mbl90IGZyYW1lLAogI2RlZmluZSBnbnR0YWJfZGVzdHJveV9hcmNoKGd0
KSBkbyB7fSB3aGlsZSAoIDAgKQogI2RlZmluZSBnbnR0YWJfc2V0X2ZyYW1lX2dmbihndCwgc3Qs
IGlkeCwgZ2ZuKSBkbyB7fSB3aGlsZSAoIDAgKQogI2RlZmluZSBnbnR0YWJfZ2V0X2ZyYW1lX2dm
bihndCwgc3QsIGlkeCkgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICB1bnNp
Z25lZCBsb25nIG1mbl8gPSAoc3QpID8gZ250dGFiX3N0YXR1c19tZm4oZ3QsIGlkeCkgICAgICAg
ICAgICAgICBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IGdudHRhYl9zaGFyZWRf
bWZuKGd0LCBpZHgpOyAgICAgICAgICAgICAgXAotICAgIHVuc2lnbmVkIGxvbmcgZ3Bmbl8gPSBn
ZXRfZ3Bmbl9mcm9tX21mbihtZm5fKTsgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICBtZm5f
dCBtZm5fID0gKHN0KSA/IGdudHRhYl9zdGF0dXNfbWZuKGd0LCBpZHgpICAgICAgICAgICAgICAg
ICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgOiBnbnR0YWJfc2hhcmVkX21mbihndCwg
aWR4KTsgICAgICAgICAgICAgICAgICAgICAgXAorICAgIHVuc2lnbmVkIGxvbmcgZ3Bmbl8gPSBn
ZXRfZ3Bmbl9mcm9tX21mbihtZm5feChtZm5fKSk7ICAgICAgICAgICAgICAgIFwKICAgICBWQUxJ
RF9NMlAoZ3Bmbl8pID8gX2dmbihncGZuXykgOiBJTlZBTElEX0dGTjsgICAgICAgICAgICAgICAg
ICAgICAgICBcCiB9KQogCi0jZGVmaW5lIGdudHRhYl9zaGFyZWRfbWZuKHQsIGkpICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKLSAgICAoKHZpcnRfdG9fbWFkZHIoKHQpLT5zaGFyZWRfcmF3W2ld
KSA+PiBQQUdFX1NISUZUKSkKKyNkZWZpbmUgZ250dGFiX3NoYXJlZF9tZm4odCwgaSkgX21mbihf
X3ZpcnRfdG9fbWZuKCh0KS0+c2hhcmVkX3Jhd1tpXSkpCiAKLSNkZWZpbmUgZ250dGFiX3NoYXJl
ZF9nbWZuKGQsIHQsIGkpICAgICAgICAgICAgICAgICAgICAgXAotICAgIChtZm5fdG9fZ21mbihk
LCBnbnR0YWJfc2hhcmVkX21mbih0LCBpKSkpCisjZGVmaW5lIGdudHRhYl9zaGFyZWRfZ2ZuKGQs
IHQsIGkpIG1mbl90b19nZm4oZCwgZ250dGFiX3NoYXJlZF9tZm4odCwgaSkpCiAKKyNkZWZpbmUg
Z250dGFiX3N0YXR1c19tZm4odCwgaSkgX21mbihfX3ZpcnRfdG9fbWZuKCh0KS0+c3RhdHVzW2ld
KSkKIAotI2RlZmluZSBnbnR0YWJfc3RhdHVzX21mbih0LCBpKSAgICAgICAgICAgICAgICAgICAg
ICAgICBcCi0gICAgKCh2aXJ0X3RvX21hZGRyKCh0KS0+c3RhdHVzW2ldKSA+PiBQQUdFX1NISUZU
KSkKLQotI2RlZmluZSBnbnR0YWJfc3RhdHVzX2dtZm4oZCwgdCwgaSkgICAgICAgICAgICAgICAg
ICAgICBcCi0gICAgKG1mbl90b19nbWZuKGQsIGdudHRhYl9zdGF0dXNfbWZuKHQsIGkpKSkKKyNk
ZWZpbmUgZ250dGFiX3N0YXR1c19nZm4oZCwgdCwgaSkgbWZuX3RvX2dmbihkLCBnbnR0YWJfc3Rh
dHVzX21mbih0LCBpKSkKIAogI2RlZmluZSBnbnR0YWJfbWFya19kaXJ0eShkLCBmKSBwYWdpbmdf
bWFya19kaXJ0eShkLCBmKQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
