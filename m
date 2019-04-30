Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC801015F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 23:06:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLZu3-0007jz-4E; Tue, 30 Apr 2019 21:03:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLZu1-0007h5-1B
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 21:03:01 +0000
X-Inumbo-ID: 55a3a1be-6b8b-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 55a3a1be-6b8b-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 21:02:59 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E28DC21744;
 Tue, 30 Apr 2019 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556658179;
 bh=za6Exya73K7slM0wbPXGyWU791U1dzjVrB9Mqj71bKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uhWpDVuybrBDmJCFgsrHD4soAXHAnI2/aU77dNRlSHiuVTLXOtbcgFoox9FBY2wvS
 tZngt+KiJLWp5MinRiGTEWiMkWzZ9VgH/6n+AwYDn24zdriqzuBjbdNvxEaNz9RjhI
 UU2ELBowTEXvIUXWhU9XKVKIhQD6XhHgLQSSpfl0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Apr 2019 14:02:52 -0700
Message-Id: <1556658172-8824-10-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH v2 10/10] xen/arm: add reserved-memory regions
 to the dom0 memory node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgYXJlIGF1dG9tYXRpY2FsbHkgcmVtYXBwZWQgdG8gZG9t
MC4gVGhlaXIgZGV2aWNlCnRyZWUgbm9kZXMgYXJlIGFsc28gYWRkZWQgdG8gZG9tMCBkZXZpY2Ug
dHJlZS4gSG93ZXZlciwgdGhlIGRvbTAgbWVtb3J5Cm5vZGUgaXMgbm90IGN1cnJlbnRseSBleHRl
bmRlZCB0byBjb3ZlciB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMKcmFuZ2VzIGFzIHJlcXVp
cmVkIGJ5IHRoZSBzcGVjLiAgVGhpcyBjb21taXQgZml4ZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IGU1ZDQ4
OGQuLmZhMWNhMjAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTY0Myw3ICs2NDMsOCBAQCBzdGF0aWMg
aW50IF9faW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCiB7CiAg
ICAgaW50IHJlcywgaTsKICAgICBpbnQgcmVnX3NpemUgPSBhZGRyY2VsbHMgKyBzaXplY2VsbHM7
Ci0gICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUqa2luZm8tPm1lbS5ucl9iYW5rczsKKyAgICBp
bnQgbnJfY2VsbHMgPSByZWdfc2l6ZSAqIChraW5mby0+bWVtLm5yX2JhbmtzICsgKGlzX2hhcmR3
YXJlX2RvbWFpbihkKSA/CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vdGluZm8u
cmVzZXJ2ZWRfbWVtLm5yX2JhbmtzIDogMCkpOwogICAgIF9fYmUzMiByZWdbTlJfTUVNX0JBTktT
ICogNCAvKiBXb3JzdCBjYXNlIGFkZHJjZWxscyArIHNpemVjZWxscyAqL107CiAgICAgX19iZTMy
ICpjZWxsczsKIApAQCAtNjczLDYgKzY3NCwyMCBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX21l
bW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgIGR0X2NoaWxkX3NldF9y
YW5nZSgmY2VsbHMsIGFkZHJjZWxscywgc2l6ZWNlbGxzLCBzdGFydCwgc2l6ZSk7CiAgICAgfQog
CisgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQorICAgIHsKKyAgICAgICAgZm9yICgg
aSA9IDA7IGkgPCBib290aW5mby5yZXNlcnZlZF9tZW0ubnJfYmFua3M7IGkrKyApCisgICAgICAg
IHsKKyAgICAgICAgICAgIHU2NCBzdGFydCA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2ld
LnN0YXJ0OworICAgICAgICAgICAgdTY0IHNpemUgPSBib290aW5mby5yZXNlcnZlZF9tZW0uYmFu
a1tpXS5zaXplOworCisgICAgICAgICAgICBkdF9kcHJpbnRrKCIgIEJhbmsgJWQ6ICUjIlBSSXg2
NCItPiUjIlBSSXg2NCJcbiIsCisgICAgICAgICAgICAgICAgICAgIGksIHN0YXJ0LCBzdGFydCAr
IHNpemUpOworCisgICAgICAgICAgICBkdF9jaGlsZF9zZXRfcmFuZ2UoJmNlbGxzLCBhZGRyY2Vs
bHMsIHNpemVjZWxscywgc3RhcnQsIHNpemUpOworICAgICAgICB9CisgICAgfQorCiAgICAgcmVz
ID0gZmR0X3Byb3BlcnR5KGZkdCwgInJlZyIsIHJlZywgbnJfY2VsbHMgKiBzaXplb2YoKnJlZykp
OwogICAgIGlmICggcmVzICkKICAgICAgICAgcmV0dXJuIHJlczsKLS0gCjEuOS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
