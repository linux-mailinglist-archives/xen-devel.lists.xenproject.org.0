Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5164F18C
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:58:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTOA-0004XO-SA; Fri, 21 Jun 2019 23:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTO8-0004VI-Ff
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:56:12 +0000
X-Inumbo-ID: 252ef43a-9480-11e9-8a87-cb80762533cf
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 252ef43a-9480-11e9-8a87-cb80762533cf;
 Fri, 21 Jun 2019 23:56:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C19A821530;
 Fri, 21 Jun 2019 23:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561161371;
 bh=xd6isYPxj9hWpPMW0MEOb61upETwKMmHwAnuRy4ymKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eXtwr+/C11Vjc0WAUnRweNCdcdrIhZqw5gzocJaWuTT9pjpsV30sVs2YTJ6eOM/Df
 zw5oKLWyW34Bwgyx660MY4fNlRXTapbJLa0spqszqrQJoGcwusZ1mAprGAyYaPm7E+
 Yfbc672L8KrksFVn3fvKmcv3rEz9Qd6vW3bUAf1w=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 16:56:06 -0700
Message-Id: <20190621235608.2153-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 4/6] xen/arm: handle reserved-memory in
 consider_modules and dt_unreserved_regions
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

cmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgb3ZlcmxhcCB3aXRoIG1lbW9yeSBub2Rlcy4gVGhlIG92
ZXJsYXBwaW5nCm1lbW9yeSBpcyByZXNlcnZlZC1tZW1vcnkgYW5kIHNob3VsZCBiZSBoYW5kbGVk
IGFjY29yZGluZ2x5Ogpjb25zaWRlcl9tb2R1bGVzIGFuZCBkdF91bnJlc2VydmVkX3JlZ2lvbnMg
c2hvdWxkIHNraXAgdGhlc2UgcmVnaW9ucyB0aGUKc2FtZSB3YXkgdGhleSBhcmUgYWxyZWFkeSBz
a2lwcGluZyBtZW0tcmVzZXJ2ZSByZWdpb25zLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBjb2Rpbmcg
c3R5bGUKLSBpbi1jb2RlIGNvbW1lbnRzCgpDaGFuZ2VzIGluIHYyOgotIGZpeCBjb21taXQgbWVz
c2FnZTogZnVsbCBvdmVybGFwCi0gcmVtb3ZlIGNoZWNrX3Jlc2VydmVkX21lbW9yeQotIGV4dGVu
ZCBjb25zaWRlcl9tb2R1bGVzIGFuZCBkdF91bnJlc2VydmVkX3JlZ2lvbnMKLS0tCiB4ZW4vYXJj
aC9hcm0vc2V0dXAuYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
CmluZGV4IDIxNTc0NmE1YzMuLmQ5Y2ZiMWFhMmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC0yMDYsNiArMjA2LDI4IEBAIHZv
aWQgX19pbml0IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsIHBhZGRyX3QgZSwKICAg
ICAgICAgfQogICAgIH0KIAorICAgIC8qCisgICAgICogaSBpcyB0aGUgY3VycmVudCBib290bW9k
dWxlIHdlIGFyZSBldmFsdWF0aW5nIGFjcm9zcyBhbGwgcG9zc2libGUKKyAgICAgKiBraW5kcy4K
KyAgICAgKgorICAgICAqIFdoZW4gcmV0cmlldmluZyB0aGUgY29ycmVzcG9uZGluZyByZXNlcnZl
ZC1tZW1vcnkgYWRkcmVzc2VzCisgICAgICogYmVsb3csIHdlIG5lZWQgdG8gaW5kZXggdGhlIGJv
b3RpbmZvLnJlc2VydmVkX21lbSBiYW5rIHN0YXJ0aW5nCisgICAgICogZnJvbSAwLCBhbmQgb25s
eSBjb3VudGluZyB0aGUgcmVzZXJ2ZWQtbWVtb3J5IG1vZHVsZXMuIEhlbmNlLAorICAgICAqIHdl
IG5lZWQgdG8gdXNlIGkgLSBuci4KKyAgICAgKi8KKyAgICBmb3IgKCA7IGkgLSBuciA8IGJvb3Rp
bmZvLnJlc2VydmVkX21lbS5ucl9iYW5rczsgaSsrICkKKyAgICB7CisgICAgICAgIHBhZGRyX3Qg
cl9zID0gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaSAtIG5yXS5zdGFydDsKKyAgICAgICAg
cGFkZHJfdCByX2UgPSByX3MgKyBib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tpIC0gbnJdLnNp
emU7CisKKyAgICAgICAgaWYgKCBzIDwgcl9lICYmIHJfcyA8IGUgKQorICAgICAgICB7CisgICAg
ICAgICAgICBkdF91bnJlc2VydmVkX3JlZ2lvbnMocl9lLCBlLCBjYiwgaSsxKTsKKyAgICAgICAg
ICAgIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhzLCByX3MsIGNiLCBpKzEpOworICAgICAgICAgICAg
cmV0dXJuOworICAgICAgICB9CisgICAgfQorCiAgICAgY2IocywgZSk7CiB9CiAKQEAgLTM5Miw3
ICs0MTQsNyBAQCBzdGF0aWMgcGFkZHJfdCBfX2luaXQgY29uc2lkZXJfbW9kdWxlcyhwYWRkcl90
IHMsIHBhZGRyX3QgZSwKIHsKICAgICBjb25zdCBzdHJ1Y3QgYm9vdG1vZHVsZXMgKm1pID0gJmJv
b3RpbmZvLm1vZHVsZXM7CiAgICAgaW50IGk7Ci0gICAgaW50IG5yX3JzdmQ7CisgICAgaW50IG5y
OwogCiAgICAgcyA9IChzK2FsaWduLTEpICYgfihhbGlnbi0xKTsKICAgICBlID0gZSAmIH4oYWxp
Z24tMSk7CkBAIC00MTgsOSArNDQwLDkgQEAgc3RhdGljIHBhZGRyX3QgX19pbml0IGNvbnNpZGVy
X21vZHVsZXMocGFkZHJfdCBzLCBwYWRkcl90IGUsCiAKICAgICAvKiBOb3cgY2hlY2sgYW55IGZk
dCByZXNlcnZlZCBhcmVhcy4gKi8KIAotICAgIG5yX3JzdmQgPSBmZHRfbnVtX21lbV9yc3YoZGV2
aWNlX3RyZWVfZmxhdHRlbmVkKTsKKyAgICBuciA9IGZkdF9udW1fbWVtX3JzdihkZXZpY2VfdHJl
ZV9mbGF0dGVuZWQpOwogCi0gICAgZm9yICggOyBpIDwgbWktPm5yX21vZHMgKyBucl9yc3ZkOyBp
KysgKQorICAgIGZvciAoIDsgaSA8IG1pLT5ucl9tb2RzICsgbnI7IGkrKyApCiAgICAgewogICAg
ICAgICBwYWRkcl90IG1vZF9zLCBtb2RfZTsKIApAQCAtNDQyLDYgKzQ2NCwzMSBAQCBzdGF0aWMg
cGFkZHJfdCBfX2luaXQgY29uc2lkZXJfbW9kdWxlcyhwYWRkcl90IHMsIHBhZGRyX3QgZSwKICAg
ICAgICAgICAgIHJldHVybiBjb25zaWRlcl9tb2R1bGVzKHMsIG1vZF9zLCBzaXplLCBhbGlnbiwg
aSsxKTsKICAgICAgICAgfQogICAgIH0KKworICAgIC8qCisgICAgICogaSBpcyB0aGUgY3VycmVu
dCBib290bW9kdWxlIHdlIGFyZSBldmFsdWF0aW5nLCBhY3Jvc3MgYWxsCisgICAgICogcG9zc2li
bGUga2luZHMgb2YgYm9vdG1vZHVsZXMuCisgICAgICoKKyAgICAgKiBXaGVuIHJldHJpZXZpbmcg
dGhlIGNvcnJlc3BvbmRpbmcgcmVzZXJ2ZWQtbWVtb3J5IGFkZHJlc3Nlcywgd2UKKyAgICAgKiBu
ZWVkIHRvIGluZGV4IHRoZSBib290aW5mby5yZXNlcnZlZF9tZW0gYmFuayBzdGFydGluZyBmcm9t
IDAsIGFuZAorICAgICAqIG9ubHkgY291bnRpbmcgdGhlIHJlc2VydmVkLW1lbW9yeSBtb2R1bGVz
LiBIZW5jZSwgd2UgbmVlZCB0byB1c2UKKyAgICAgKiBpIC0gbnIuCisgICAgICovCisgICAgbnIg
Kz0gbWktPm5yX21vZHM7CisgICAgZm9yICggOyBpIC0gbnIgPCBib290aW5mby5yZXNlcnZlZF9t
ZW0ubnJfYmFua3M7IGkrKyApCisgICAgeworICAgICAgICBwYWRkcl90IHJfcyA9IGJvb3RpbmZv
LnJlc2VydmVkX21lbS5iYW5rW2kgLSBucl0uc3RhcnQ7CisgICAgICAgIHBhZGRyX3Qgcl9lID0g
cl9zICsgYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaSAtIG5yXS5zaXplOworCisgICAgICAg
IGlmICggcyA8IHJfZSAmJiByX3MgPCBlICkKKyAgICAgICAgeworICAgICAgICAgICAgcl9lID0g
Y29uc2lkZXJfbW9kdWxlcyhyX2UsIGUsIHNpemUsIGFsaWduLCBpICsgMSk7CisgICAgICAgICAg
ICBpZiAoIHJfZSApCisgICAgICAgICAgICAgICAgcmV0dXJuIHJfZTsKKworICAgICAgICAgICAg
cmV0dXJuIGNvbnNpZGVyX21vZHVsZXMocywgcl9zLCBzaXplLCBhbGlnbiwgaSArIDEpOworICAg
ICAgICB9CisgICAgfQogICAgIHJldHVybiBlOwogfQogI2VuZGlmCi0tIAoyLjE3LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
