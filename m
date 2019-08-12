Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE18B04C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:57:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgc-00025p-P4; Tue, 13 Aug 2019 06:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZmNG=WJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxQgb-000258-2o
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:37 +0000
X-Inumbo-ID: 8ddb8072-bd50-11e9-a84e-ebac4160b3f6
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ddb8072-bd50-11e9-a84e-ebac4160b3f6;
 Mon, 12 Aug 2019 22:28:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37255208C2;
 Mon, 12 Aug 2019 22:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565648928;
 bh=YqKn8gmGY2dQjIORe3HXpvRI5Usi/ROP9j2EUde90d8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oy5Hjrgx/ZBjk1flDZWZVYxubXVc2qRJUTkwuIa5I53oe/XLq5M3gRGy5GvQzDXtD
 2MehBW9WBuKQTl5dLWflfxvPR8TPb7h9u5Bl79TguWzQ18VbI3rTprkhdaEwDS1L+S
 qwzzikybUOCxi/sK9vqM9sRz5H5KZsfFJeH2Pd3k=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 15:28:43 -0700
Message-Id: <20190812222844.9636-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v5 6/7] xen/arm: don't iomem_permit_access for
 reserved-memory regions
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gYmUgcmVtYXBwZWQgaW50byBh
bnkgdW5wcml2aWxlZ2VkCmd1ZXN0cywgdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJl
IHByb3Blcmx5IHN1cHBvcnRlZCBpbiBYZW4uIEZvcgpub3csIGRvIG5vdCBjYWxsIGlvbWVtX3Bl
cm1pdF9hY2Nlc3Mgb24gdGhlbSwgYmVjYXVzZSBnaXZpbmcKaW9tZW1fcGVybWl0X2FjY2VzcyB0
byBkb20wIG1lYW5zIHRoYXQgdGhlIHRvb2xzdGFjayB3aWxsIGJlIGFibGUgdG8KYXNzaWduIHRo
ZSByZWdpb24gdG8gYSBkb21VLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgotLS0KCkNoYW5nZXMgaW4gdjU6Ci0gZml4IGNoZWNrIGNvbmRp
dGlvbgotIHVzZSBzdHJuaWNtcAotIHJldHVybiBlcnJvcgotIGltcHJvdmUgY29tbWl0IG1lc3Nh
Z2UKCkNoYW5nZXMgaW4gdjQ6Ci0gY29tcGFyZSB0aGUgcGFyZW50IG5hbWUgd2l0aCByZXNlcnZl
ZC1tZW1vcnkKLSB1c2UgZHRfbm9kZV9jbXAKCkNoYW5nZXMgaW4gdjM6Ci0gbmV3IHBhdGNoCi0t
LQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKaW5kZXggNGM4NDA0MTU1YS4uZTBjMGMwMWM4OCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YwpAQCAtMTE1NSwxNSArMTE1NSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXBfcmFuZ2VfdG9f
ZG9tYWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAogICAgIGJvb2wgbmVlZF9t
YXBwaW5nID0gIWR0X2RldmljZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsKICAgICBpbnQgcmVzOwog
Ci0gICAgcmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRy
ICsgbGVuIC0gMSkpKTsKLSAgICBpZiAoIHJlcyApCisgICAgLyoKKyAgICAgKiBEb24ndCBnaXZl
IGlvbWVtIHBlcm1pc3Npb25zIGZvciByZXNlcnZlZC1tZW1vcnkgcmFuZ2VzIHRvIGRvbVVzCisg
ICAgICogdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHN1cHBvcnQgaXMgY29tcGxldGUuCisgICAgICov
CisgICAgaWYgKCBzdHJuaWNtcChkdF9ub2RlX2Z1bGxfbmFtZShkZXYpLCAiL3Jlc2VydmVkLW1l
bW9yeSIsCisgICAgICAgICBzdHJsZW4oIi9yZXNlcnZlZC1tZW1vcnkiKSkgIT0gMCApCiAgICAg
ewotICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBh
Y2Nlc3MgdG8iCi0gICAgICAgICAgICAgICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIs
Ci0gICAgICAgICAgICAgICBkLT5kb21haW5faWQsCi0gICAgICAgICAgICAgICBhZGRyICYgUEFH
RV9NQVNLLCBQQUdFX0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7Ci0gICAgICAgIHJldHVybiByZXM7
CisgICAgICAgIHJlcyA9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFkZHJfdG9fcGZuKGFkZHIp
LAorICAgICAgICAgICAgICAgIHBhZGRyX3RvX3BmbihQQUdFX0FMSUdOKGFkZHIgKyBsZW4gLSAx
KSkpOworICAgICAgICBpZiAoIHJlcyApCisgICAgICAgIHsKKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFjY2VzcyB0byIKKyAgICAgICAg
ICAgICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAorICAgICAgICAgICAg
ICAgICAgICBkLT5kb21haW5faWQsCisgICAgICAgICAgICAgICAgICAgIGFkZHIgJiBQQUdFX01B
U0ssIFBBR0VfQUxJR04oYWRkciArIGxlbikgLSAxKTsKKyAgICAgICAgICAgIHJldHVybiByZXM7
CisgICAgICAgIH0KICAgICB9CiAKICAgICBpZiAoIG5lZWRfbWFwcGluZyApCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
