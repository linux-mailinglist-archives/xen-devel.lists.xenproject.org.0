Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0F1C886
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRO-00089L-LT; Tue, 14 May 2019 12:21:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRN-00088h-7M
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:21:53 +0000
X-Inumbo-ID: da83c45e-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id da83c45e-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:21:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A37341;
 Tue, 14 May 2019 05:21:51 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890773F71E;
 Tue, 14 May 2019 05:21:50 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:14 +0100
Message-Id: <20190514122136.28215-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 03/19] xen/arm: processor: Use
 BIT(.., UL) instead of _AC(1, U) in SCTLR_ defines
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHRoZSBwYXR0ZXJuIEJJVCguLi4sIFVMKSB0byBtYWtlIHRoZSBjb2RlIG1vcmUgcmVhZGFi
bGUuIE5vdGUgdGhhdAp1bnNpZ25lZCBsb25nIGlzIHVzZWQgaW5zdGVhZCBvZiB1bnNpZ25lZCBi
ZWNhdXNlIFNDVExSIGlzIHRlY2huaWNhbGx5CjMyLWJpdCBvbiBBcm0zMiBhbmQgNjQtYml0IG9u
IEFybTY0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFJld29yayB0aGUgcGF0Y2ggdG8g
dXNlIEJJVCguLi4sIFVMKSBpbnN0ZWFkIG9mIF9CSVRVTCguLi4pLgotLS0KIHhlbi9pbmNsdWRl
L2FzbS1hcm0vcHJvY2Vzc29yLmggfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29y
LmgKaW5kZXggZjNiNjgxODVlYi4uYmJjYmEwNjFjYSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5o
CkBAIC0xMjAsMjAgKzEyMCwyMCBAQAogCiAvKiBCaXRzIHNwZWNpZmljIHRvIFNDVExSX0VMMSBm
b3IgQXJtMzIgKi8KIAotI2RlZmluZSBTQ1RMUl9BMzJfRUwxX1YgICAgIChfQUMoMSxVKTw8MTMp
CisjZGVmaW5lIFNDVExSX0EzMl9FTDFfViAgICAgQklUKDEzLCBVTCkKIAogLyogQ29tbW9uIGJp
dHMgZm9yIFNDVExSX0VMeCBmb3IgQXJtMzIgKi8KIAotI2RlZmluZSBTQ1RMUl9BMzJfRUx4X1RF
ICAgIChfQUMoMSxVKTw8MzApCi0jZGVmaW5lIFNDVExSX0EzMl9FTHhfRkkgICAgKF9BQygxLFUp
PDwyMSkKKyNkZWZpbmUgU0NUTFJfQTMyX0VMeF9URSAgICBCSVQoMzAsIFVMKQorI2RlZmluZSBT
Q1RMUl9BMzJfRUx4X0ZJICAgIEJJVCgyMSwgVUwpCiAKIC8qIENvbW1vbiBiaXRzIGZvciBTQ1RM
Ul9FTHggb24gYWxsIGFyY2hpdGVjdHVyZXMgKi8KLSNkZWZpbmUgU0NUTFJfQXh4X0VMeF9FRSAg
ICAoX0FDKDEsVSk8PDI1KQotI2RlZmluZSBTQ1RMUl9BeHhfRUx4X1dYTiAgIChfQUMoMSxVKTw8
MTkpCi0jZGVmaW5lIFNDVExSX0F4eF9FTHhfSSAgICAgKF9BQygxLFUpPDwxMikKLSNkZWZpbmUg
U0NUTFJfQXh4X0VMeF9DICAgICAoX0FDKDEsVSk8PDIpCi0jZGVmaW5lIFNDVExSX0F4eF9FTHhf
QSAgICAgKF9BQygxLFUpPDwxKQotI2RlZmluZSBTQ1RMUl9BeHhfRUx4X00gICAgIChfQUMoMSxV
KTw8MCkKKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9FRSAgICBCSVQoMjUsIFVMKQorI2RlZmluZSBT
Q1RMUl9BeHhfRUx4X1dYTiAgIEJJVCgxOSwgVUwpCisjZGVmaW5lIFNDVExSX0F4eF9FTHhfSSAg
ICAgQklUKDEyLCBVTCkKKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9DICAgICBCSVQoMiwgVUwpCisj
ZGVmaW5lIFNDVExSX0F4eF9FTHhfQSAgICAgQklUKDEsIFVMKQorI2RlZmluZSBTQ1RMUl9BeHhf
RUx4X00gICAgIEJJVCgwLCBVTCkKIAogI2RlZmluZSBIU0NUTFJfQkFTRSAgICAgX0FDKDB4MzBj
NTE4NzgsVSkKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
