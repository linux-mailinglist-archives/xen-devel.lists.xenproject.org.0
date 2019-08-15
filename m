Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0898F254
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 19:35:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyJca-0007EK-8r; Thu, 15 Aug 2019 17:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyJcX-0007EE-Vk
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 17:33:06 +0000
X-Inumbo-ID: bbeb0bde-bf82-11e9-b90c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bbeb0bde-bf82-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 17:33:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2EC928;
 Thu, 15 Aug 2019 10:33:02 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BAB33F706;
 Thu, 15 Aug 2019 10:33:02 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 18:32:58 +0100
Message-Id: <20190815173258.20752-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct domain
 in initrd_load()
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

aW5pdHJkX2xvYWQoKSBjYW4gYmUgY2FsbGVkIGJ5IG90aGVyIGRvbWFpbiB0aGFuIGRvbTAuIFRv
IGF2b2lkCmNvbmZ1c2lvbiBpbiB0aGUgbG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCgpT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggMTI2Mzc0ZjYw
My4uMzMxNzEwODFlYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtMTgxOCw4ICsxODE4LDggQEAgc3Rh
dGljIHZvaWQgX19pbml0IGluaXRyZF9sb2FkKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCiAg
ICAgcGFkZHIgPSBtb2QtPnN0YXJ0OwogICAgIGxlbiA9IG1vZC0+c2l6ZTsKIAotICAgIHByaW50
aygiTG9hZGluZyBkb20wIGluaXRyZCBmcm9tICUiUFJJcGFkZHIiIHRvIDB4JSJQUklwYWRkciIt
MHglIlBSSXBhZGRyIlxuIiwKLSAgICAgICAgICAgcGFkZHIsIGxvYWRfYWRkciwgbG9hZF9hZGRy
ICsgbGVuKTsKKyAgICBwcmludGsoIkxvYWRpbmcgJXBkIGluaXRyZCBmcm9tICUiUFJJcGFkZHIi
IHRvIDB4JSJQUklwYWRkciItMHglIlBSSXBhZGRyIlxuIiwKKyAgICAgICAgICAga2luZm8tPmQs
IHBhZGRyLCBsb2FkX2FkZHIsIGxvYWRfYWRkciArIGxlbik7CiAKICAgICAvKiBGaXggdXAgbGlu
dXgsaW5pdHJkLXN0YXJ0IGFuZCBsaW51eCxpbml0cmQtZW5kIGluIC9jaG9zZW4gKi8KICAgICBu
b2RlID0gZmR0X3BhdGhfb2Zmc2V0KGtpbmZvLT5mZHQsICIvY2hvc2VuIik7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
