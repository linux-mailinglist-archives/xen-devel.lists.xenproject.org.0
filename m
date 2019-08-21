Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC698700
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 00:14:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0YqE-0004U5-PF; Wed, 21 Aug 2019 22:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7y8g=WR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0YqD-0004U0-6N
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 22:12:29 +0000
X-Inumbo-ID: c31086b8-c460-11e9-adcc-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c31086b8-c460-11e9-adcc-12813bfff9fa;
 Wed, 21 Aug 2019 22:12:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCBFF337;
 Wed, 21 Aug 2019 15:12:27 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4103F718;
 Wed, 21 Aug 2019 15:12:26 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 21 Aug 2019 23:12:21 +0100
Message-Id: <20190821221221.19456-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: domain_build: Don't continue if unable
 to allocate all dom0 banks
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIHdpbGwgb25seSBwcmludCBhIHdhcm5pbmcgaWYgdGhlcmUgYXJlIG1lbW9yeSB1bmFsbG9j
YXRlZCB3aGVuIHVzaW5nCjE6MSBtYXBwaW5nIChvbmx5IHVzZWQgYnkgZG9tMCkuIFRoaXMgYWxz
byBpbmNsdWRlcyB0aGUgY2FzZSB3aGVyZSBubwptZW1vcnkgaGFzIGJlZW4gYWxsb2NhdGVkLgoK
SXQgd2lsbCBicmluZyB0byBhbGwgc29ydCBvZiBpc3N1ZXMgdGhhdCBjYW4gYmUgaGFyZCB0byBk
aWFnbm9zdGljIGZvcgp1c2VycyAodGhlIHdhcm5pbmcgY2FuIGJlIGRpZmZpY3VsdCB0byBzcG90
IG9yIGRpc3JlZ2FyZCkuCgpJZiB0aGUgdXNlcnMgcmVxdWVzdCAxR0Igb2YgbWVtb3J5LCB0aGVu
IG1vc3QgbGlrZWx5IHRoZXkgd2FudCB0aGUgZXhhY3QKYW1vdW50IGFuZCBub3QgNTEyTUIuIFNv
IHBhbmljIGlmIGFsbCB0aGUgbWVtb3J5IGhhcyBub3QgYmVlbiBhbGxvY2F0ZWQuCgpBZnRlciB0
aGlzIGNoYW5nZSwgdGhlIGJlaGF2aW9yIGlzIHRoZSBzYW1lIGFzIGZvciBub24tMToxIG1lbW9y
eQphbGxvY2F0aW9uICh1c2VkIGJ5IGRvbVUpLgoKQXQgdGhlIHNhbWUgdGltZSwgcmVmbG93IHRo
ZSBtZXNzYWdlIHRvIGhhdmUgdGhlIGZvcm1hdCBvbiBhIHNpbmdsZQpsaW5lLgoKU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQoKQ2M6IEJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbQoKSXQgdG9vayBtZSBzb21ldGltZXMgdGhpcyBtb3JuaW5nIHRv
IHNwb3QgdGhlIHdhcm5pbmcgaW4gdGhlIGxvZy4gSWYgd2UKZG9uJ3QgaG9ub3IgdGhlIHNpemUs
IGl0IGZlZWxzIGl0IGlzIGJldHRlciB0byBjcmFzaCBhbmQgcmVxdWVzdCB0aGUKdXNlciB0byBy
ZXF1ZXN0IGxlc3MgbWVtb3J5IChvciByZS1vcmRlciB0aGUgYmluYXJ5KS4KClRoaXMgaXMgaW5s
aW5lIG9uIGhvdyBkb21VIG1lbW9yeSBhbGxvY2F0aW9uIGlzIGhhbmRsZWQuCi0tLQogeGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCAxYTNkY2IxYmNk
Li43MmUxNDc0NmNkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC0zNTgsMTAgKzM1OCw5IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBhbGxvY2F0ZV9tZW1vcnlfMTEoc3RydWN0IGRvbWFpbiAqZCwKICAgICB9
CiAKICAgICBpZiAoIGtpbmZvLT51bmFzc2lnbmVkX21lbSApCi0gICAgICAgIHByaW50aygiV0FS
TklORzogRmFpbGVkIHRvIGFsbG9jYXRlIHJlcXVlc3RlZCBkb20wIG1lbW9yeS4iCi0gICAgICAg
ICAgICAgICAvKiBEb24ndCB3YW50IGZvcm1hdCB0aGlzIGFzIFBSSXBhZGRyICgxNiBkaWdpdCBo
ZXgpICovCi0gICAgICAgICAgICAgICAiICVsZE1CIHVuYWxsb2NhdGVkXG4iLAotICAgICAgICAg
ICAgICAgKHVuc2lnbmVkIGxvbmcpa2luZm8tPnVuYXNzaWduZWRfbWVtID4+IDIwKTsKKyAgICAg
ICAgLyogRG9uJ3Qgd2FudCBmb3JtYXQgdGhpcyBhcyBQUklwYWRkciAoMTYgZGlnaXQgaGV4KSAq
LworICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIHJlcXVlc3RlZCBkb20wIG1lbW9y
eS4gJWxkTUIgdW5hbGxvY2F0ZWRcbiIsCisgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWtp
bmZvLT51bmFzc2lnbmVkX21lbSA+PiAyMCk7CiAKICAgICBmb3IoIGkgPSAwOyBpIDwga2luZm8t
Pm1lbS5ucl9iYW5rczsgaSsrICkKICAgICB7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
