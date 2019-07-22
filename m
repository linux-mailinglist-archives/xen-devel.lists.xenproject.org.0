Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6670BBA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2a-0002Uz-6l; Mon, 22 Jul 2019 21:40:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2Y-0002Sw-N2
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:14 +0000
X-Inumbo-ID: 49db19cd-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 49db19cd-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E781509;
 Mon, 22 Jul 2019 14:40:13 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 237123F71F;
 Mon, 22 Jul 2019 14:40:13 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:32 +0100
Message-Id: <20190722213958.5761-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 09/35] xen/arm64: head: Improve coding style
 and document cpu_init()
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

QWRqdXN0IHRoZSBjb2Rpbmcgc3R5bGUgdXNlZCBpbiB0aGUgY29tbWVudHMgd2l0aGluIGNwdV9p
bml0KCkuIFRha2UgdGhlCm9wcG9ydHVuaXR5IHRvIGFsdGVyIHRoZSBlYXJseSBwcmludCB0byBt
YXRjaCB0aGUgZnVuY3Rpb24gbmFtZS4KCkxhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFu
ZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQpmdW5jdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIENoYW5n
ZXMgaW4gdjI6CiAgICAgICAgLSBXZSBkb24ndCBjbG9iYmVyIHg0IHNvIHVwZGF0ZSB0aGUgY29t
bWVudAotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAxOSArKysrKysrKysrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwppbmRleCA5MmM4MzM4ZDcxLi5kZGM1MTY3MDIwIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKQEAgLTM5
NywxOSArMzk3LDI2IEBAIHNraXBfYnNzOgogICAgICAgICByZXQKIEVORFBST0MoemVyb19ic3Mp
CiAKKy8qCisgKiBJbml0aWFsaXplIHRoZSBwcm9jZXNzb3IgZm9yIHR1cm5pbmcgdGhlIE1NVSBv
bi4KKyAqCisgKiBDbG9iYmVycyB4MCAtIHgzCisgKi8KIGNwdV9pbml0OgotICAgICAgICBQUklO
VCgiLSBTZXR0aW5nIHVwIGNvbnRyb2wgcmVnaXN0ZXJzIC1cclxuIikKKyAgICAgICAgUFJJTlQo
Ii0gSW5pdGlhbGl6ZSBDUFUgLVxyXG4iKQogCiAgICAgICAgIC8qIFNldCB1cCBtZW1vcnkgYXR0
cmlidXRlIHR5cGUgdGFibGVzICovCiAgICAgICAgIGxkciAgIHgwLCA9TUFJUlZBTAogICAgICAg
ICBtc3IgICBtYWlyX2VsMiwgeDAKIAotICAgICAgICAvKiBTZXQgdXAgVENSX0VMMjoKKyAgICAg
ICAgLyoKKyAgICAgICAgICogU2V0IHVwIFRDUl9FTDI6CiAgICAgICAgICAqIFBTIC0tIEJhc2Vk
IG9uIElEX0FBNjRNTUZSMF9FTDEuUEFSYW5nZQogICAgICAgICAgKiBUb3AgYnl0ZSBpcyB1c2Vk
CiAgICAgICAgICAqIFBUIHdhbGtzIHVzZSBJbm5lci1TaGFyZWFibGUgYWNjZXNzZXMsCiAgICAg
ICAgICAqIFBUIHdhbGtzIGFyZSB3cml0ZS1iYWNrLCB3cml0ZS1hbGxvY2F0ZSBpbiBib3RoIGNh
Y2hlIGxldmVscywKLSAgICAgICAgICogNDgtYml0IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBnb2Vz
IHRocm91Z2ggdGhpcyB0YWJsZS4gKi8KKyAgICAgICAgICogNDgtYml0IHZpcnR1YWwgYWRkcmVz
cyBzcGFjZSBnb2VzIHRocm91Z2ggdGhpcyB0YWJsZS4KKyAgICAgICAgICovCiAgICAgICAgIGxk
ciAgIHgwLCA9KFRDUl9SRVMxfFRDUl9TSDBfSVN8VENSX09SR04wX1dCV0F8VENSX0lSR04wX1dC
V0F8VENSX1QwU1ooNjQtNDgpKQogICAgICAgICAvKiBJRF9BQTY0TU1GUjBfRUwxWzM6MF0gKFBB
UmFuZ2UpIGNvcnJlc3BvbmRzIHRvIFRDUl9FTDJbMTg6MTZdIChQUykgKi8KICAgICAgICAgbXJz
ICAgeDEsIElEX0FBNjRNTUZSMF9FTDEKQEAgLTQyMCw5ICs0MjcsMTEgQEAgY3B1X2luaXQ6CiAg
ICAgICAgIGxkciAgIHgwLCA9U0NUTFJfRUwyX1NFVAogICAgICAgICBtc3IgICBTQ1RMUl9FTDIs
IHgwCiAKLSAgICAgICAgLyogRW5zdXJlIHRoYXQgYW55IGV4Y2VwdGlvbnMgZW5jb3VudGVyZWQg
YXQgRUwyCisgICAgICAgIC8qCisgICAgICAgICAqIEVuc3VyZSB0aGF0IGFueSBleGNlcHRpb25z
IGVuY291bnRlcmVkIGF0IEVMMgogICAgICAgICAgKiBhcmUgaGFuZGxlZCB1c2luZyB0aGUgRUwy
IHN0YWNrIHBvaW50ZXIsIHJhdGhlcgotICAgICAgICAgKiB0aGFuIFNQX0VMMC4gKi8KKyAgICAg
ICAgICogdGhhbiBTUF9FTDAuCisgICAgICAgICAqLwogICAgICAgICBtc3Igc3BzZWwsICMxCiAg
ICAgICAgIHJldAogRU5EUFJPQyhjcHVfaW5pdCkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
