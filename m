Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73470BC8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2k-0002nT-Hn; Mon, 22 Jul 2019 21:40:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2i-0002jm-5e
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:24 +0000
X-Inumbo-ID: 4f58cf37-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4f58cf37-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E3A152F;
 Mon, 22 Jul 2019 14:40:22 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC763F71F;
 Mon, 22 Jul 2019 14:40:22 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:42 +0100
Message-Id: <20190722213958.5761-20-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 19/35] xen/arm32: head: Add a macro to move
 an immediate constant into a 32-bit register
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

VGhlIGN1cnJlbnQgYm9vdCBjb2RlIGlzIHVzaW5nIHRoZSBwYXR0ZXJuIGxkciByWCwgPS4uLiB0
byBtb3ZlIGFuCmltbWVkaWF0ZSBjb25zdGFudCBpbnRvIGEgMzItYml0IHJlZ2lzdGVyLgoKVGhp
cyBwYXR0ZXJuIGltcGxpZXMgdG8gbG9hZCB0aGUgaW1tZWRpYXRlIGNvbnN0YW50IGZyb20gYSBs
aXRlcmFsIHBvb2wsCm1lYW5pbmcgYSBtZW1vcnkgYWNjZXNzIHdpbGwgYmUgcGVyZm9ybWVkLgoK
VGhlIG1lbW9yeSBhY2Nlc3MgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgbW92dy9tb3Z0IGluc3Ry
dWN0aW9ucy4KCkEgbmV3IG1hY3JvIGlzIGludHJvZHVjZWQgdG8gbW92ZSBhbiBpbW1lZGlhdGUg
Y29uc3RhbnQgaW50byBhIDMyLWJpdApyZWdpc3RlciB3aXRob3V0IGEgbWVtb3J5IGxvYWQuIEZv
bGxvdy11cCBwYXRjaGVzIHdpbGwgbWFrZSB1c2Ugb2YgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgog
ICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgOSAr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRl
eCAxOGRlZDQ5YTA0Li45OWY0YWYxOGQ4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTM3LDYgKzM3LDE1IEBA
CiAjZW5kaWYKIAogLyoKKyAqIE1vdmUgYW4gaW1tZWRpYXRlIGNvbnN0YW50IGludG8gYSAzMi1i
aXQgcmVnaXN0ZXIgdXNpbmcgbW92dy9tb3Z0CisgKiBpbnN0cnVjdGlvbnMuCisgKi8KKy5tYWNy
byBtb3ZfdyByZWcsIHdvcmQKKyAgICAgICAgbW92dyAgXHJlZywgIzpsb3dlcjE2Olx3b3JkCisg
ICAgICAgIG1vdnQgIFxyZWcsICM6dXBwZXIxNjpcd29yZAorLmVuZG0KKworLyoKICAqIENvbW1v
biByZWdpc3RlciB1c2FnZSBpbiB0aGlzIGZpbGU6CiAgKiAgIHIwICAtCiAgKiAgIHIxICAtCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
