Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C58F524
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 21:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyLmM-0003Hi-0h; Thu, 15 Aug 2019 19:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyLmK-0003Hd-GW
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 19:51:20 +0000
X-Inumbo-ID: 0cdedb7a-bf96-11e9-aee9-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0cdedb7a-bf96-11e9-aee9-bc764e2007e4;
 Thu, 15 Aug 2019 19:51:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24118344;
 Thu, 15 Aug 2019 12:51:19 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 664763F694;
 Thu, 15 Aug 2019 12:51:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 20:51:14 +0100
Message-Id: <20190815195114.31148-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: domain_build: Remove redundant check
 in make_vpl011_uart_node()
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

Tm9uZSBvZiB0aGUgY29kZSBzaW5jZSB0aGUgbGFzdCBjaGVjayBvZiByZXMgbW9kaWZ5IHRoZSB2
YWx1ZS4gU28gdGhlCmNoZWNrIGNhbiBiZSByZW1vdmVkLgoKQ292ZXJpdHktSUQ6IDE0NzY4MjQK
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCBjZjlmZmJjMzYw
Li4xNzM1NDRkOGM1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC0xNjI5LDggKzE2MjksNyBAQCBzdGF0
aWMgaW50IF9faW5pdCBtYWtlX3ZwbDAxMV91YXJ0X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCwgdm9pZCAqZmR0KQogICAgIGR0X2NoaWxkX3NldF9yYW5nZSgmY2VsbHMsIEdVRVNUX1JPT1Rf
QUREUkVTU19DRUxMUywKICAgICAgICAgICAgICAgICAgICAgICAgR1VFU1RfUk9PVF9TSVpFX0NF
TExTLCBHVUVTVF9QTDAxMV9CQVNFLAogICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9QTDAx
MV9TSVpFKTsKLSAgICBpZiAoIHJlcyApCi0gICAgICAgIHJldHVybiByZXM7CisKICAgICByZXMg
PSBmZHRfcHJvcGVydHkoZmR0LCAicmVnIiwgcmVnLCBzaXplb2YocmVnKSk7CiAgICAgaWYgKCBy
ZXMgKQogICAgICAgICByZXR1cm4gcmVzOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
