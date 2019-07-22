Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7F70BD6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2u-00038Y-1F; Mon, 22 Jul 2019 21:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2p-00031C-Qd
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:31 +0000
X-Inumbo-ID: 539a022c-acc9-11e9-91e4-e3ebf45ca47e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 539a022c-acc9-11e9-91e4-e3ebf45ca47e;
 Mon, 22 Jul 2019 21:40:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251911509;
 Mon, 22 Jul 2019 14:40:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 729C93F71F;
 Mon, 22 Jul 2019 14:40:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:50 +0100
Message-Id: <20190722213958.5761-28-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 27/35] xen/arm32: head: Document
 create_pages_tables()
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

RG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGlu
IHRoZSBmdW5jdGlvbi4KTm90ZSB0aGF0IHI2IGlzIG5vdyBvbmx5IHVzZWQgd2l0aGluIHRoZSBm
dW5jdGlvbiwgc28gaXQgZG9lcyBub3QgbmVlZAp0byBiZSBwYXJ0IG9mIHRoZSBjb21tb24gcmVn
aXN0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMzAgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9o
ZWFkLlMKaW5kZXggMTE5ZDJhMGRmOC4uZWY4OTc5OTU5YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC01Myw3
ICs1Myw3IEBACiAgKiAgIHIzICAtCiAgKiAgIHI0ICAtCiAgKiAgIHI1ICAtCi0gKiAgIHI2ICAt
IGlkZW50aXR5IG1hcCBpbiBwbGFjZQorICogICByNiAgLQogICogICByNyAgLQogICogICByOCAg
LSBEVEIgYWRkcmVzcyAoYm9vdCBDUFUgb25seSkKICAqICAgcjkgIC0gcGFkZHIoc3RhcnQpCkBA
IC0zMDEsMTggKzMwMSwyNiBAQCBjcHVfaW5pdF9kb25lOgogICAgICAgICBtb3YgICBwYywgcjUg
ICAgICAgICAgICAgICAgICAgICAgICAvKiBSZXR1cm4gYWRkcmVzcyBpcyBpbiByNSAqLwogRU5E
UFJPQyhjcHVfaW5pdCkKIAorLyoKKyAqIFJlYnVpbGQgdGhlIGJvb3QgcGFnZXRhYmxlJ3MgZmly
c3QtbGV2ZWwgZW50cmllcy4gVGhlIHN0cnVjdHVyZQorICogaXMgZGVzY3JpYmVkIGluIG1tLmMu
CisgKgorICogQWZ0ZXIgdGhlIENQVSBlbmFibGVzIHBhZ2luZyBpdCB3aWxsIGFkZCB0aGUgZml4
bWFwIG1hcHBpbmcKKyAqIHRvIHRoZXNlIHBhZ2UgdGFibGVzLCBob3dldmVyIHRoaXMgbWF5IGNs
YXNoIHdpdGggdGhlIDE6MQorICogbWFwcGluZy4gU28gZWFjaCBDUFUgbXVzdCByZWJ1aWxkIHRo
ZSBwYWdlIHRhYmxlcyBoZXJlIHdpdGgKKyAqIHRoZSAxOjEgaW4gcGxhY2UuCisgKgorICogSW5w
dXRzOgorICogICByOSA6IHBhZGRyKHN0YXJ0KQorICogICByMTA6IHBoeXMgb2Zmc2V0CisgKgor
ICogQ2xvYmJlcnMgcjAgLSByNgorICoKKyAqIFJlZ2lzdGVyIHVzYWdlIHdpdGhpbiB0aGlzIGZ1
bmN0aW9uOgorICogICByNiA6IElkZW50aXR5IG1hcCBpbiBwbGFjZQorICovCiBjcmVhdGVfcGFn
ZV90YWJsZXM6CiAgICAgICAgIC8qCi0gICAgICAgICAqIFJlYnVpbGQgdGhlIGJvb3QgcGFnZXRh
YmxlJ3MgZmlyc3QtbGV2ZWwgZW50cmllcy4gVGhlIHN0cnVjdHVyZQotICAgICAgICAgKiBpcyBk
ZXNjcmliZWQgaW4gbW0uYy4KLSAgICAgICAgICoKLSAgICAgICAgICogQWZ0ZXIgdGhlIENQVSBl
bmFibGVzIHBhZ2luZyBpdCB3aWxsIGFkZCB0aGUgZml4bWFwIG1hcHBpbmcKLSAgICAgICAgICog
dG8gdGhlc2UgcGFnZSB0YWJsZXMsIGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2ggd2l0aCB0aGUgMTox
Ci0gICAgICAgICAqIG1hcHBpbmcuIFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUgcGFnZSB0
YWJsZXMgaGVyZSB3aXRoCi0gICAgICAgICAqIHRoZSAxOjEgaW4gcGxhY2UuCi0gICAgICAgICAq
LwotCi0gICAgICAgIC8qCiAgICAgICAgICAqIElmIFhlbiBpcyBsb2FkZWQgYXQgZXhhY3RseSBY
RU5fVklSVF9TVEFSVCB0aGVuIHdlIGRvbid0CiAgICAgICAgICAqIG5lZWQgYW4gYWRkaXRpb25h
bCAxOjEgbWFwcGluZywgdGhlIHZpcnR1YWwgbWFwcGluZyB3aWxsCiAgICAgICAgICAqIHN1ZmZp
Y2UuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
