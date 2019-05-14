Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C571C8A9
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:27:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWUg-0002gA-U0; Tue, 14 May 2019 12:25:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUd-0002cG-V0
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:15 +0000
X-Inumbo-ID: 5379f0d4-7643-11e9-bc9c-af883ea96da6
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5379f0d4-7643-11e9-bc9c-af883ea96da6;
 Tue, 14 May 2019 12:25:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8562515BE;
 Tue, 14 May 2019 05:25:14 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 526503F71E;
 Tue, 14 May 2019 05:25:13 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:24:45 +0100
Message-Id: <20190514122456.28559-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 RESEND v2 08/19] xen/arm64: head: Move
 earlyprintk messages in .rodata.str
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgdGhlIGVhcmx5cHJpbnRrIG1lc3NhZ2VzIGFyZSBpbnRlcmxlYXZlZCB3
aXRoIHRoZQppbnN0cnVjdGlvbnMuIFRoaXMgbWFrZXMgbW9yZSBkaWZmaWN1bHQgdG8gcmVhZCB0
aGUgb2JqZHVtcCBvdXRwdXQuCgpJbnRyb2R1Y2UgYSBuZXcgbWFjcm8gdG8gYWRkIGEgc3RyaW5n
IGluIC5yb2RhdGEuc3RyIGFuZCB1c2UgaXQgZm9yIGFsbAp0aGUgZWFybHlwcmludGsgbWVzc2Fn
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tLQoK
SSBoYXZlbid0IGRvbmUgYSBzaW1pbGFyIGNoYW5nZSBpbiBhcm0zMiB5ZXQgYmVjYXVzZSB0aGUg
Y29tcGlsZXIgd2lsbAp0aHJvdyBhbiBlcnJvciB3aGVuIHVzaW5nICdhZHInIHdoZW4gbG9hZCBh
biBhZGRyZXNzIGZyb20gYSBkaWZmZXJlbnQKc2VjdGlvbiAoc2VlIEE1LTIwMCBpbiBBUk0gRERJ
IDA0MDZDLmEgZm9yIHRoZSB0ZWNobmljYWwgcmVhc29uKS4KVGhlIGNoYW5nZSBpcyBsaWtlbHkg
dG8gYmUgbW9yZSBlbGFib3JhdGUuCgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBB
bmRyaWkncyByZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgICAgICAg
fCAxNCArKysrKy0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9hc21fZGVmbnMuaCB8ICA1
ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKaW5kZXggYWQ0NDZlNzM0NS4uYjk1N2ViOTBmYiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBA
IC04MSwxMyArODEsMTAgQEAKIC8qIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRvIHRoZSBVQVJU
LCBpZiB0aGVyZSBpcyBvbmUuCiAgKiBDbG9iYmVycyB4MC14My4gKi8KICNpZmRlZiBDT05GSUdf
RUFSTFlfUFJJTlRLCi0jZGVmaW5lIFBSSU5UKF9zKSAgICAgICBcCi0gICAgICAgIGFkciAgIHgw
LCA5OGYgOyBcCi0gICAgICAgIGJsICAgIHB1dHMgICAgOyBcCi0gICAgICAgIGIgICAgIDk5ZiAg
ICAgOyBcCi05ODogICAgIC5hc2NpeiBfcyAgICAgOyBcCi0gICAgICAgIC5hbGlnbiAyICAgICAg
OyBcCi05OToKKyNkZWZpbmUgUFJJTlQoX3MpICAgICAgICAgICBcCisgICAgICAgIGFkciAgIHgw
LCA5OGYgOyAgICAgXAorICAgICAgICBibCAgICBwdXRzICAgIDsgICAgIFwKKyAgICAgICAgUk9E
QVRBX1NUUig5OCwgX3MpCiAjZWxzZSAvKiBDT05GSUdfRUFSTFlfUFJJTlRLICovCiAjZGVmaW5l
IFBSSU5UKHMpCiAjZW5kaWYgLyogIUNPTkZJR19FQVJMWV9QUklOVEsgKi8KQEAgLTYzMyw4ICs2
MzAsNyBAQCBpbml0X3VhcnQ6CiAjZW5kaWYKICAgICAgICAgYWRyICAgeDAsIDFmCiAgICAgICAg
IGIgICAgIHB1dHMKLTE6ICAgICAgLmFzY2l6ICItIFVBUlQgZW5hYmxlZCAtXHJcbiIKLSAgICAg
ICAgLmFsaWduIDQKK1JPREFUQV9TVFIoMSwgIi0gVUFSVCBlbmFibGVkIC1cclxuIikKIAogLyog
UHJpbnQgZWFybHkgZGVidWcgbWVzc2FnZXMuCiAgKiB4MDogTnVsLXRlcm1pbmF0ZWQgc3RyaW5n
IHRvIHByaW50LgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hc21fZGVmbnMuaCBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vYXNtX2RlZm5zLmgKaW5kZXggMDJiZTgzZTJiMy4uM2YyMWRl
ZjBhYiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hc21fZGVmbnMuaAorKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2FzbV9kZWZucy5oCkBAIC0xNiw2ICsxNiwxMSBAQAogIyBlcnJv
ciAidW5rbm93biBBUk0gdmFyaWFudCIKICNlbmRpZgogCisjZGVmaW5lIFJPREFUQV9TVFIobGFi
ZWwsIG1zZykgICAgICAgICAgICAgICAgICBcCisucHVzaHNlY3Rpb24gLnJvZGF0YS5zdHIsICJh
TVMiLCAlcHJvZ2JpdHMsIDEgOyBcCitsYWJlbDogIC5hc2NpeiBtc2c7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCisucG9wc2VjdGlvbgorCiAjZW5kaWYgLyogX19BUk1fQVNNX0RFRk5T
X0hfXyAqLwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
