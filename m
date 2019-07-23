Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C002721B4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq2S7-0001w1-3I; Tue, 23 Jul 2019 21:36:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlUe=VU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hq2S5-0001vV-3J
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 21:36:05 +0000
X-Inumbo-ID: df4cb4aa-ad91-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id df4cb4aa-ad91-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 21:36:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA5F15A2;
 Tue, 23 Jul 2019 14:36:03 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 275DA3F71F;
 Tue, 23 Jul 2019 14:36:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 22:35:50 +0100
Message-Id: <20190723213553.22300-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190723213553.22300-1-julien.grall@arm.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 4/7] xen/arm: traps: Avoid using BUG_ON() in
 _show_registers()
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

QXQgdGhlIG1vbWVudCwgX3Nob3dfcmVnaXN0ZXJzKCkgaXMgdXNpbmcgYSBCVUdfT04oKSB0byBh
c3NlcnQgb25seQp1c2Vyc3BhY2Ugd2lsbCBydW4gMzItYml0IGNvZGUgaW4gYSA2NC1iaXQgZG9t
YWluLgoKU3VjaCBleHRyYSBwcmVjYXV0aW9uIGlzIG5vdCBuZWNlc3NhcnkgYW5kIGNvdWxkIGJl
IGF2b2lkZWQgYnkgb25seQpjaGVja2luZyB0aGUgQ1BVIG1vZGUgdG8gZGVjaWRlIHdoZXRoZXIg
c2hvd19yZWdpc3RlcnNfNjQoKSBvcgpzaG93X3JlaWdzdGVyc18zMigpIHNob3VsZCBiZSBjYWxs
ZWQuCgpUaGlzIGhhcyBhbHNvIHRoZSBuaWNlIGFkdmFudGFnZSB0byBhdm9pZCBuZXN0ZWQgaWYg
aW4gdGhlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS90cmFwcy5jIHwgMTYgKysrLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwppbmRleCA1
NGU2NmE4NmQwLi4xMzI2ODZlZTBmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwor
KysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwpAQCAtOTE0LDIxICs5MTQsMTEgQEAgc3RhdGljIHZv
aWQgX3Nob3dfcmVnaXN0ZXJzKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAogCiAg
ICAgaWYgKCBndWVzdF9tb2RlICkKICAgICB7Ci0gICAgICAgIGlmICggaXNfMzJiaXRfZG9tYWlu
KHYtPmRvbWFpbikgKQorICAgICAgICBpZiAoIHBzcl9tb2RlX2lzXzMyYml0KHJlZ3MpICkKICAg
ICAgICAgICAgIHNob3dfcmVnaXN0ZXJzXzMyKHJlZ3MsIGN0eHQsIGd1ZXN0X21vZGUsIHYpOwog
I2lmZGVmIENPTkZJR19BUk1fNjQKLSAgICAgICAgZWxzZSBpZiAoIGlzXzY0Yml0X2RvbWFpbih2
LT5kb21haW4pICkKLSAgICAgICAgewotICAgICAgICAgICAgaWYgKCBwc3JfbW9kZV9pc18zMmJp
dChyZWdzKSApCi0gICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgQlVHX09OKCF1c3JfbW9k
ZShyZWdzKSk7Ci0gICAgICAgICAgICAgICAgc2hvd19yZWdpc3RlcnNfMzIocmVncywgY3R4dCwg
Z3Vlc3RfbW9kZSwgdik7Ci0gICAgICAgICAgICB9Ci0gICAgICAgICAgICBlbHNlCi0gICAgICAg
ICAgICB7Ci0gICAgICAgICAgICAgICAgc2hvd19yZWdpc3RlcnNfNjQocmVncywgY3R4dCwgZ3Vl
c3RfbW9kZSwgdik7Ci0gICAgICAgICAgICB9Ci0gICAgICAgIH0KKyAgICAgICAgZWxzZQorICAg
ICAgICAgICAgc2hvd19yZWdpc3RlcnNfNjQocmVncywgY3R4dCwgZ3Vlc3RfbW9kZSwgdik7CiAj
ZW5kaWYKICAgICB9CiAgICAgZWxzZQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
