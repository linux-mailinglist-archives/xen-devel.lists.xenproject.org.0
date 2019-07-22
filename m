Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176A70BD8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg34-0003Y1-CJ; Mon, 22 Jul 2019 21:40:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2v-0003Fv-QZ
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:37 +0000
X-Inumbo-ID: 574d476e-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 574d476e-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 634521595;
 Mon, 22 Jul 2019 14:40:36 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B15533F71F;
 Mon, 22 Jul 2019 14:40:35 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:57 +0100
Message-Id: <20190722213958.5761-35-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 34/35] xen/arm32: head: Setup HTTBR in
 enable_mmu() and add missing isb
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

QXQgdGhlIG1vbWVudCwgSFRUQlIgaXMgc2V0dXAgaW4gY3JlYXRlX3BhZ2VfdGFibGVzKCkuIFRo
aXMgaXMgZmluZSBhcwppdCBpcyBjYWxsZWQgYnkgZXZlcnkgQ1BVcy4KCkhvd2V2ZXIsIHN1Y2gg
YXNzdW1wdGlvbiBtYXkgbm90IGhvbGQgaW4gdGhlIGZ1dHVyZS4gVG8gbWFrZSBjaGFuZ2UKZWFz
aWVyLCB0aGUgSFRUQlIgaXMgbm90IHNldHVwIGluIGVuYWJsZV9tbXUoKS4KClRha2UgdGhlIG9w
cG9ydHVuaXR5IHRvIGFkZCB0aGUgbWlzc2luZyBpc2IoKSB0byBlbnN1cmUgdGhlIEhUVEJSIGlz
CnNlZW4gYmVmb3JlIHRoZSBNTVUgaXMgdHVybmVkIG9uLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAg
ICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDggKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMKaW5kZXggNmQ1NWEyMTE5YS4uOGExZTI3MmFhYiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0z
NzMsOCArMzczLDYgQEAgY3JlYXRlX3BhZ2VfdGFibGVzOgogICAgICAgICAvKiBXcml0ZSBYZW4n
cyBQVCdzIHBhZGRyIGludG8gdGhlIEhUVEJSICovCiAgICAgICAgIGxkciAgIHI0LCA9Ym9vdF9w
Z3RhYmxlCiAgICAgICAgIGFkZCAgIHI0LCByNCwgcjEwICAgICAgICAgICAgLyogcjQgOj0gcGFk
ZHIgKGJvb3RfcGFnZXRhYmxlKSAqLwotICAgICAgICBtb3YgICByNSwgIzAgICAgICAgICAgICAg
ICAgIC8qIHI0OnI1IGlzIHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8KLSAgICAgICAgbWNyciAg
Q1A2NChyNCwgcjUsIEhUVEJSKQogCiAgICAgICAgIC8qIFNldHVwIGJvb3RfcGd0YWJsZTogKi8K
ICAgICAgICAgbGRyICAgcjEsID1ib290X3NlY29uZApAQCAtNDgwLDYgKzQ3OCwxMiBAQCBlbmFi
bGVfbW11OgogICAgICAgICBtY3IgICBDUDMyKHIwLCBUTEJJQUxMSCkgICAgIC8qIEZsdXNoIGh5
cGVydmlzb3IgVExCcyAqLwogICAgICAgICBkc2IgICBuc2gKIAorICAgICAgICBsZHIgICByMCwg
PWJvb3RfcGd0YWJsZQorICAgICAgICBhZGQgICByMCwgcjAsIHIxMCAgICAgICAgICAgIC8qIHIw
IDo9IHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8KKyAgICAgICAgbW92ICAgcjEsICMwICAgICAg
ICAgICAgICAgICAvKiByMDpyMSBpcyBwYWRkciAoYm9vdF9wYWdldGFibGUpICovCisgICAgICAg
IG1jcnIgIENQNjQocjAsIHIxLCBIVFRCUikKKyAgICAgICAgaXNiCisKICAgICAgICAgbXJjICAg
Q1AzMihyMCwgSFNDVExSKQogICAgICAgICAvKiBFbmFibGUgTU1VIGFuZCBELWNhY2hlICovCiAg
ICAgICAgIG9yciAgIHIwLCByMCwgIyhTQ1RMUl9BeHhfRUx4X018U0NUTFJfQXh4X0VMeF9DKQot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
