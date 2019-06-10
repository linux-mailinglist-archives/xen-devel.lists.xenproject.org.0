Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398053BCEB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1w-0007h4-Ta; Mon, 10 Jun 2019 19:32:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1u-0007ez-SM
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:30 +0000
X-Inumbo-ID: 7ca62288-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7ca62288-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A096C0A;
 Mon, 10 Jun 2019 12:32:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 420733F73C;
 Mon, 10 Jun 2019 12:32:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:07 +0100
Message-Id: <20190610193215.23704-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 09/17] xen/arm64: head: Improve coding style and
 document cpu_init()
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRqdXN0IHRoZSBjb2Rpbmcgc3R5bGUgdXNlZCBpbiB0aGUgY29tbWVudHMgd2l0aGluIGNwdV9p
bml0KCkuIFRha2UgdGhlCm9wcG9ydHVuaXR5IHRvIGFsdGVyIHRoZSBlYXJseSBwcmludCB0byBt
YXRjaCB0aGUgZnVuY3Rpb24gbmFtZS4KCkxhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFu
ZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQpmdW5jdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IDZhYTMx
NDgxOTIuLmVlMDAyNDE3M2UgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMK
KysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtMzk2LDE5ICszOTYsMjYgQEAgc2tp
cF9ic3M6CiAgICAgICAgIHJldAogRU5EUFJPQyh6ZXJvX2JzcykKIAorLyoKKyAqIEluaXRpYWxp
emUgdGhlIHByb2Nlc3NvciBmb3IgdHVybmluZyB0aGUgTU1VIG9uLgorICoKKyAqIENsb2JiZXJz
IHgwIC0geDQKKyAqLwogY3B1X2luaXQ6Ci0gICAgICAgIFBSSU5UKCItIFNldHRpbmcgdXAgY29u
dHJvbCByZWdpc3RlcnMgLVxyXG4iKQorICAgICAgICBQUklOVCgiLSBJbml0aWFsaXplIENQVSAt
XHJcbiIpCiAKICAgICAgICAgLyogU2V0IHVwIG1lbW9yeSBhdHRyaWJ1dGUgdHlwZSB0YWJsZXMg
Ki8KICAgICAgICAgbGRyICAgeDAsID1NQUlSVkFMCiAgICAgICAgIG1zciAgIG1haXJfZWwyLCB4
MAogCi0gICAgICAgIC8qIFNldCB1cCBUQ1JfRUwyOgorICAgICAgICAvKgorICAgICAgICAgKiBT
ZXQgdXAgVENSX0VMMjoKICAgICAgICAgICogUFMgLS0gQmFzZWQgb24gSURfQUE2NE1NRlIwX0VM
MS5QQVJhbmdlCiAgICAgICAgICAqIFRvcCBieXRlIGlzIHVzZWQKICAgICAgICAgICogUFQgd2Fs
a3MgdXNlIElubmVyLVNoYXJlYWJsZSBhY2Nlc3NlcywKICAgICAgICAgICogUFQgd2Fsa3MgYXJl
IHdyaXRlLWJhY2ssIHdyaXRlLWFsbG9jYXRlIGluIGJvdGggY2FjaGUgbGV2ZWxzLAotICAgICAg
ICAgKiA0OC1iaXQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGdvZXMgdGhyb3VnaCB0aGlzIHRhYmxl
LiAqLworICAgICAgICAgKiA0OC1iaXQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGdvZXMgdGhyb3Vn
aCB0aGlzIHRhYmxlLgorICAgICAgICAgKi8KICAgICAgICAgbGRyICAgeDAsID0oVENSX1JFUzF8
VENSX1NIMF9JU3xUQ1JfT1JHTjBfV0JXQXxUQ1JfSVJHTjBfV0JXQXxUQ1JfVDBTWig2NC00OCkp
CiAgICAgICAgIC8qIElEX0FBNjRNTUZSMF9FTDFbMzowXSAoUEFSYW5nZSkgY29ycmVzcG9uZHMg
dG8gVENSX0VMMlsxODoxNl0gKFBTKSAqLwogICAgICAgICBtcnMgICB4MSwgSURfQUE2NE1NRlIw
X0VMMQpAQCAtNDI3LDkgKzQzNCwxMSBAQCBjcHVfaW5pdDoKICAgICAgICAgbGRyICAgeDAsID0o
SFNDVExSX0JBU0UpCiAgICAgICAgIG1zciAgIFNDVExSX0VMMiwgeDAKIAotICAgICAgICAvKiBF
bnN1cmUgdGhhdCBhbnkgZXhjZXB0aW9ucyBlbmNvdW50ZXJlZCBhdCBFTDIKKyAgICAgICAgLyoK
KyAgICAgICAgICogRW5zdXJlIHRoYXQgYW55IGV4Y2VwdGlvbnMgZW5jb3VudGVyZWQgYXQgRUwy
CiAgICAgICAgICAqIGFyZSBoYW5kbGVkIHVzaW5nIHRoZSBFTDIgc3RhY2sgcG9pbnRlciwgcmF0
aGVyCi0gICAgICAgICAqIHRoYW4gU1BfRUwwLiAqLworICAgICAgICAgKiB0aGFuIFNQX0VMMC4K
KyAgICAgICAgICovCiAgICAgICAgIG1zciBzcHNlbCwgIzEKICAgICAgICAgcmV0CiBFTkRQUk9D
KGNwdV9pbml0KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
