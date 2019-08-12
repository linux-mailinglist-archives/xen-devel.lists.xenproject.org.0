Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6DA8A4A2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9i-0006y6-UX; Mon, 12 Aug 2019 17:30:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9h-0006vS-25
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:49 +0000
X-Inumbo-ID: ec34de73-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ec34de73-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E48174E;
 Mon, 12 Aug 2019 10:30:48 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 566DF3F706;
 Mon, 12 Aug 2019 10:30:47 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:14 +0100
Message-Id: <20190812173019.11956-24-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 23/28] xen/arm32: head: Setup HTTBR in
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
CnNlZW4gYmVmb3JlIHRoZSBNTVUgaXMgdHVybmVkIG9uLgoKTGFzdGx5LCB0aGUgb25seSB1c2Ug
b2YgcjUgaW4gY3JlYXRlX3BhZ2VfdGFibGVzKCkgaXMgbm93IHJlbW92ZWQuIFNvCnRoZSByZWdp
c3RlciBjYW4gYmUgcmVtb3ZlZCBmcm9tIHRoZSBjbG9iYmVyIGxpc3Qgb2YgdGhlIGZ1bmN0aW9u
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0t
LQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIE1vdmUgdGhlIGNvbW1lbnQgaW4gdGhlIGNv
cnJlY3QgcGxhY2UKICAgICAgICAtIHI1IGlzIG5vdCBjbG9iZXJyZWQgYW55bW9yZQoKICAgIENo
YW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
UyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggM2MxODAzNzU3NS4uMjMxN2ZiODg1
NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9h
cm0vYXJtMzIvaGVhZC5TCkBAIC0zNTksNyArMzU5LDcgQEAgRU5EUFJPQyhjcHVfaW5pdCkKICAq
ICAgcjkgOiBwYWRkcihzdGFydCkKICAqICAgcjEwOiBwaHlzIG9mZnNldAogICoKLSAqIENsb2Ji
ZXJzIHIwIC0gcjYKKyAqIENsb2JiZXJzIHIwIC0gcjQsIHI2CiAgKgogICogUmVnaXN0ZXIgdXNh
Z2Ugd2l0aGluIHRoaXMgZnVuY3Rpb246CiAgKiAgIHI2IDogSWRlbnRpdHkgbWFwIGluIHBsYWNl
CkBAIC0zNzQsMTEgKzM3NCw4IEBAIGNyZWF0ZV9wYWdlX3RhYmxlczoKICAgICAgICAgbW92ZXEg
cjYsICMxICAgICAgICAgICAgICAgICAvKiByNiA6PSBpZGVudGl0eSBtYXAgbm93IGluIHBsYWNl
ICovCiAgICAgICAgIG1vdm5lIHI2LCAjMCAgICAgICAgICAgICAgICAgLyogcjYgOj0gaWRlbnRp
dHkgbWFwIG5vdCB5ZXQgaW4gcGxhY2UgKi8KIAotICAgICAgICAvKiBXcml0ZSBYZW4ncyBQVCdz
IHBhZGRyIGludG8gdGhlIEhUVEJSICovCiAgICAgICAgIGxkciAgIHI0LCA9Ym9vdF9wZ3RhYmxl
CiAgICAgICAgIGFkZCAgIHI0LCByNCwgcjEwICAgICAgICAgICAgLyogcjQgOj0gcGFkZHIgKGJv
b3RfcGFnZXRhYmxlKSAqLwotICAgICAgICBtb3YgICByNSwgIzAgICAgICAgICAgICAgICAgIC8q
IHI0OnI1IGlzIHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8KLSAgICAgICAgbWNyciAgQ1A2NChy
NCwgcjUsIEhUVEJSKQogCiAgICAgICAgIC8qIFNldHVwIGJvb3RfcGd0YWJsZTogKi8KICAgICAg
ICAgbGRyICAgcjEsID1ib290X3NlY29uZApAQCAtNDg0LDYgKzQ4MSwxMyBAQCBlbmFibGVfbW11
OgogICAgICAgICBtY3IgICBDUDMyKHIwLCBUTEJJQUxMSCkgICAgIC8qIEZsdXNoIGh5cGVydmlz
b3IgVExCcyAqLwogICAgICAgICBkc2IgICBuc2gKIAorICAgICAgICAvKiBXcml0ZSBYZW4ncyBQ
VCdzIHBhZGRyIGludG8gdGhlIEhUVEJSICovCisgICAgICAgIGxkciAgIHIwLCA9Ym9vdF9wZ3Rh
YmxlCisgICAgICAgIGFkZCAgIHIwLCByMCwgcjEwICAgICAgICAgICAgLyogcjAgOj0gcGFkZHIg
KGJvb3RfcGFnZXRhYmxlKSAqLworICAgICAgICBtb3YgICByMSwgIzAgICAgICAgICAgICAgICAg
IC8qIHIwOnIxIGlzIHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8KKyAgICAgICAgbWNyciAgQ1A2
NChyMCwgcjEsIEhUVEJSKQorICAgICAgICBpc2IKKwogICAgICAgICBtcmMgICBDUDMyKHIwLCBI
U0NUTFIpCiAgICAgICAgIC8qIEVuYWJsZSBNTVUgYW5kIEQtY2FjaGUgKi8KICAgICAgICAgb3Jy
ICAgcjAsIHIwLCAjKFNDVExSX0F4eF9FTHhfTXxTQ1RMUl9BeHhfRUx4X0MpCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
