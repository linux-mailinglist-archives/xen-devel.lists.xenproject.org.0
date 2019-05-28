Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511F2D1B5
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 00:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVktO-0006WA-C2; Tue, 28 May 2019 22:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hVktM-0006VL-HW
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 22:48:24 +0000
X-Inumbo-ID: b2d5a4b2-819a-11e9-ae8f-57a10ded9d94
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2d5a4b2-819a-11e9-ae8f-57a10ded9d94;
 Tue, 28 May 2019 22:48:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F11920B1F;
 Tue, 28 May 2019 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559083703;
 bh=1lcuTO8r4FjCrgtzeV5AH8J5IwwIPxaTPIFzkL9GMxA=;
 h=Date:From:To:cc:Subject:From;
 b=15iL24htgosGHPqxQAvYN8aXa9nj2MZgJZPyO5POq+C6+DMGBs9xt0KKqj54QafUe
 Da16Ts8r5nt0nCZEDYzkqBeMQVTycFAa3Ctky72h4+SPj++G+VAqTox5G3j0toFwZv
 rGHZn42qcgxCXxHKyw8QHHgOraLDEyU4Tk6n2qdA=
Date: Tue, 28 May 2019 15:48:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com
Message-ID: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb twice
 on arm64
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
Cc: xen-devel@lists.xenproject.org, Julien.Grall@arm.com,
 sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKT24gYXJtNjQg
c3dpb3RsYiBpcyBvZnRlbiAobm90IGFsd2F5cykgYWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1f
aW5pdC4KV2UgZG9uJ3Qgd2FudCB0byBpbml0aWFsaXplIGl0IHR3aWNlLCB3aGljaCB3b3VsZCB0
cmlnZ2VyIGEgc2Vjb25kCm1lbW9yeSBhbGxvY2F0aW9uLiBNb3Jlb3ZlciwgdGhlIHNlY29uZCBt
ZW1vcnkgcG9vbCBpcyB0eXBpY2FsbHkgbWFkZSBvZgpoaWdoIHBhZ2VzIGFuZCBlbmRzIHVwIHJl
cGxhY2luZyB0aGUgb3JpZ2luYWwgbWVtb3J5IHBvb2wgb2YgbG93IHBhZ2VzLgpBcyBhIHNpZGUg
ZWZmZWN0IG9mIHRoaXMgY2hhbmdlLCBpdCBpcyBwb3NzaWJsZSB0byBoYXZlIGxvdyBwYWdlcyBp
bgpzd2lvdGxiLXhlbiBvbiBhcm02NC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFub3NAeGlsaW54LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gaW1wcm92ZSBjb21t
aXQgbWVzc2FnZQotIGRvbid0IGFkZCBuZXN0ZWQgaWZzCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94
ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKaW5kZXggODc3YmFm
Mi4uOGEzY2RkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC0yMTEsNiArMjExLDE1IEBAIGludCBfX3JlZiB4
ZW5fc3dpb3RsYl9pbml0KGludCB2ZXJib3NlLCBib29sIGVhcmx5KQogcmV0cnk6CiAJYnl0ZXMg
PSB4ZW5fc2V0X25zbGFicyh4ZW5faW9fdGxiX25zbGFicyk7CiAJb3JkZXIgPSBnZXRfb3JkZXIo
eGVuX2lvX3RsYl9uc2xhYnMgPDwgSU9fVExCX1NISUZUKTsKKworCS8qCisJICogSU8gVExCIG1l
bW9yeSBhbHJlYWR5IGFsbG9jYXRlZC4gSnVzdCB1c2UgaXQuCisJICovCisJaWYgKGlvX3RsYl9z
dGFydCAhPSAwKSB7CisJCXhlbl9pb190bGJfc3RhcnQgPSBwaHlzX3RvX3ZpcnQoaW9fdGxiX3N0
YXJ0KTsKKwkJZ290byBlbmQ7CisJfQorCiAJLyoKIAkgKiBHZXQgSU8gVExCIG1lbW9yeSBmcm9t
IGFueSBsb2NhdGlvbi4KIAkgKi8KQEAgLTI0MCw3ICsyNDksNiBAQCBpbnQgX19yZWYgeGVuX3N3
aW90bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBlYXJseSkKIAkJbV9yZXQgPSBYRU5fU1dJT1RM
Ql9FTk9NRU07CiAJCWdvdG8gZXJyb3I7CiAJfQotCXhlbl9pb190bGJfZW5kID0geGVuX2lvX3Rs
Yl9zdGFydCArIGJ5dGVzOwogCS8qCiAJICogQW5kIHJlcGxhY2UgdGhhdCBtZW1vcnkgd2l0aCBw
YWdlcyB1bmRlciA0R0IuCiAJICovCkBAIC0yNjcsNiArMjc1LDggQEAgaW50IF9fcmVmIHhlbl9z
d2lvdGxiX2luaXQoaW50IHZlcmJvc2UsIGJvb2wgZWFybHkpCiAJfSBlbHNlCiAJCXJjID0gc3dp
b3RsYl9sYXRlX2luaXRfd2l0aF90YmwoeGVuX2lvX3RsYl9zdGFydCwgeGVuX2lvX3RsYl9uc2xh
YnMpOwogCitlbmQ6CisJeGVuX2lvX3RsYl9lbmQgPSB4ZW5faW9fdGxiX3N0YXJ0ICsgYnl0ZXM7
CiAJaWYgKCFyYykKIAkJc3dpb3RsYl9zZXRfbWF4X3NlZ21lbnQoUEFHRV9TSVpFKTsKIAotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
