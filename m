Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B778C137771
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 20:46:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq0BJ-0003r9-Qf; Fri, 10 Jan 2020 19:42:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OjxR=27=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iq0BI-0003qs-Nq
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 19:42:52 +0000
X-Inumbo-ID: 58f8f8c8-33e1-11ea-ac27-bc764e2007e4
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f8f8c8-33e1-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 19:42:34 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iq0AT-0008Ob-Ta; Fri, 10 Jan 2020 22:42:02 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 Jan 2020 22:41:48 +0300
Message-Id: <20200110194158.14190-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200110194158.14190-1-vsementsov@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 01/11] qapi/error: add (Error **errp)
 cleaning APIs
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2
aXJ0dW96em8uY29tPgotLS0KCkNDOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4K
Q0M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgpDQzogS2V2aW4gV29sZiA8a3dvbGZA
cmVkaGF0LmNvbT4KQ0M6IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+CkNDOiBHcmVnIEt1
cnogPGdyb3VnQGthb2Qub3JnPgpDQzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQu
Y29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzog
QW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNDOiBQYXVsIER1cnJh
bnQgPHBhdWxAeGVuLm9yZz4KQ0M6ICJQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSIgPHBoaWxtZEBy
ZWRoYXQuY29tPgpDQzogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KQ0M6IEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDQzogU3RlZmFuIEJlcmdlciA8c3RlZmFuYkBs
aW51eC5pYm0uY29tPgpDQzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgpD
QzogTWljaGFlbCBSb3RoIDxtZHJvdGhAbGludXgudm5ldC5pYm0uY29tPgpDQzogcWVtdS1ibG9j
a0Bub25nbnUub3JnCkNDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKCiBpbmNsdWRl
L3FhcGkvZXJyb3IuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWFwaS9lcnJvci5o
IGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKaW5kZXggYWQ1YjZlODk2ZC4uZmE4ZDUxZmQ2ZCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9xYXBpL2Vycm9yLmgKKysrIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgK
QEAgLTMwOSw2ICszMDksMzIgQEAgdm9pZCB3YXJuX3JlcG9ydGZfZXJyKEVycm9yICplcnIsIGNv
bnN0IGNoYXIgKmZtdCwgLi4uKQogdm9pZCBlcnJvcl9yZXBvcnRmX2VycihFcnJvciAqZXJyLCBj
b25zdCBjaGFyICpmbXQsIC4uLikKICAgICBHQ0NfRk1UX0FUVFIoMiwgMyk7CiAKKy8qCisgKiBG
dW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNvcnJlc3BvbmRpbmcgRXJyb3Ig
KmVyciBjbGVhbmluZworICogZnVuY3Rpb24gYW4gc2V0IHBvaW50ZXIgdG8gTlVMTAorICovCitz
dGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfZnJlZV9lcnJwKEVycm9yICoqZXJycCkKK3sKKyAgICBh
c3NlcnQoZXJycCAmJiAqZXJycCk7CisgICAgZXJyb3JfZnJlZSgqZXJycCk7CisgICAgKmVycnAg
PSBOVUxMOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfcmVwb3J0X2VycnAoRXJyb3Ig
KiplcnJwKQoreworICAgIGFzc2VydChlcnJwICYmICplcnJwKTsKKyAgICBlcnJvcl9yZXBvcnRf
ZXJyKCplcnJwKTsKKyAgICAqZXJycCA9IE5VTEw7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCB3
YXJuX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkKK3sKKyAgICBhc3NlcnQoZXJycCAmJiAqZXJy
cCk7CisgICAgd2Fybl9yZXBvcnRfZXJyKCplcnJwKTsKKyAgICAqZXJycCA9IE5VTEw7Cit9CisK
KwogLyoKICAqIEp1c3QgbGlrZSBlcnJvcl9zZXRnKCksIGV4Y2VwdCB5b3UgZ2V0IHRvIHNwZWNp
ZnkgdGhlIGVycm9yIGNsYXNzLgogICogTm90ZTogdXNlIG9mIGVycm9yIGNsYXNzZXMgb3RoZXIg
dGhhbiBFUlJPUl9DTEFTU19HRU5FUklDX0VSUk9SIGlzCi0tIAoyLjIxLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
