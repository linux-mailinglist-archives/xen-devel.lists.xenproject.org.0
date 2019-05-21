Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E643125229
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 16:32:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT5lc-0008Vh-F1; Tue, 21 May 2019 14:29:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT5la-0008Vc-Ba
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:29:22 +0000
X-Inumbo-ID: d21a6224-7bd4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d21a6224-7bd4-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 14:29:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAA73374;
 Tue, 21 May 2019 07:29:19 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD6213F5AF;
 Tue, 21 May 2019 07:29:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 May 2019 15:29:13 +0100
Message-Id: <20190521142913.22394-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm64: livepatch: Fix build after 03957f58db
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDAzOTU3ZjU4ZGIgInhlbi9jb25zdDogRXh0ZW5kIHRoZSBleGlzdGluZyBtYWNybyBC
SVQgdG8gdGFrZSBhCnN1ZmZpeCBpbiBwYXJhbWV0ZXIiIGRpZG4ndCBjb252ZXJ0IGFsbCB0aGUg
Y2FsbGVycyBvZiB0aGUgbWFjcm8gQklULgoKVGhpcyB3aWxsIHJlc3VsdCB0byBhIGJ1aWxkIGJy
ZWFrYWdlIHdoZW4gZW5hYmxpbmcgTGl2ZXBhdGNoIG9uIGFybTY0LgoKUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTY0
L2xpdmVwYXRjaC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jCmluZGV4IDIyNDdiOTI1YTAuLjVjNzU3Nzky
ODQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2guYworKysgYi94ZW4v
YXJjaC9hcm0vYXJtNjQvbGl2ZXBhdGNoLmMKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50
IHJlbG9jX2luc25faW1tKGVudW0gYWFyY2g2NF9yZWxvY19vcCBvcCwgdm9pZCAqZGVzdCwgdTY0
IHZhbCwKICAgICBzdmFsID4+PSBsc2I7CiAKICAgICAvKiBFeHRyYWN0IHRoZSB2YWx1ZSBiaXRz
IGFuZCBzaGlmdCB0aGVtIHRvIGJpdCAwLiAqLwotICAgIGltbV9tYXNrID0gKEJJVChsc2IgKyBs
ZW4pIC0gMSkgPj4gbHNiOworICAgIGltbV9tYXNrID0gKEJJVChsc2IgKyBsZW4sIFVMKSAtIDEp
ID4+IGxzYjsKICAgICBpbW0gPSBzdmFsICYgaW1tX21hc2s7CiAKICAgICAvKiBVcGRhdGUgdGhl
IGluc3RydWN0aW9uJ3MgaW1tZWRpYXRlIGZpZWxkLiAqLwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
