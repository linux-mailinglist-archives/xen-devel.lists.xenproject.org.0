Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5AE14ECD7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:04:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixVvj-0001P1-BH; Fri, 31 Jan 2020 13:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EwZr=3U=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1ixVvh-0001On-Qk
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:01:49 +0000
X-Inumbo-ID: d4888744-4429-11ea-8396-bc764e2007e4
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4888744-4429-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 13:01:44 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixVvH-0000zU-Oq; Fri, 31 Jan 2020 16:01:23 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 Jan 2020 16:01:08 +0300
Message-Id: <20200131130118.1716-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200131130118.1716-1-vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 01/11] qapi/error: add (Error **errp)
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
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGZ1bmN0aW9ucyB0byBjbGVhbiBFcnJvciAqKmVycnA6IGNhbGwgY29ycmVzcG9uZGluZyBF
cnJvciAqZXJyCmNsZWFuaW5nIGZ1bmN0aW9uIGFuIHNldCBwb2ludGVyIHRvIE5VTEwuCgpOZXcg
ZnVuY3Rpb25zOgogIGVycm9yX2ZyZWVfZXJycAogIGVycm9yX3JlcG9ydF9lcnJwCiAgd2Fybl9y
ZXBvcnRfZXJycAoKU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8
dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgpSZXZpZXdlZC1ieTogR3JlZyBLdXJ6IDxncm91Z0Br
YW9kLm9yZz4KUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgotLS0K
CkNDOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KQ0M6IEtldmluIFdvbGYgPGt3b2xm
QHJlZGhhdC5jb20+CkNDOiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgpDQzogR3JlZyBL
dXJ6IDxncm91Z0BrYW9kLm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KQ0M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
PgpDQzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CkNDOiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+CkNDOiAiUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kiIDxwaGlsbWRA
cmVkaGF0LmNvbT4KQ0M6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CkNDOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ0M6IFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJA
bGludXguaWJtLmNvbT4KQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4K
Q0M6IE1pY2hhZWwgUm90aCA8bWRyb3RoQGxpbnV4LnZuZXQuaWJtLmNvbT4KQ0M6IHFlbXUtYmxv
Y2tAbm9uZ251Lm9yZwpDQzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgogaW5jbHVk
ZS9xYXBpL2Vycm9yLmggfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3FhcGkvZXJyb3Iu
aCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCmluZGV4IGFkNWI2ZTg5NmQuLmQzNDk4NzE0OGQgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCisrKyBiL2luY2x1ZGUvcWFwaS9lcnJvci5o
CkBAIC0zMDksNiArMzA5LDMyIEBAIHZvaWQgd2Fybl9yZXBvcnRmX2VycihFcnJvciAqZXJyLCBj
b25zdCBjaGFyICpmbXQsIC4uLikKIHZvaWQgZXJyb3JfcmVwb3J0Zl9lcnIoRXJyb3IgKmVyciwg
Y29uc3QgY2hhciAqZm10LCAuLi4pCiAgICAgR0NDX0ZNVF9BVFRSKDIsIDMpOwogCisvKgorICog
RnVuY3Rpb25zIHRvIGNsZWFuIEVycm9yICoqZXJycDogY2FsbCBjb3JyZXNwb25kaW5nIEVycm9y
ICplcnIgY2xlYW5pbmcKKyAqIGZ1bmN0aW9uLCB0aGVuIHNldCBwb2ludGVyIHRvIE5VTEwuCisg
Ki8KK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9mcmVlX2VycnAoRXJyb3IgKiplcnJwKQorewor
ICAgIGFzc2VydChlcnJwICYmICplcnJwKTsKKyAgICBlcnJvcl9mcmVlKCplcnJwKTsKKyAgICAq
ZXJycCA9IE5VTEw7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9yZXBvcnRfZXJycChF
cnJvciAqKmVycnApCit7CisgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOworICAgIGVycm9yX3Jl
cG9ydF9lcnIoKmVycnApOworICAgICplcnJwID0gTlVMTDsKK30KKworc3RhdGljIGlubGluZSB2
b2lkIHdhcm5fcmVwb3J0X2VycnAoRXJyb3IgKiplcnJwKQoreworICAgIGFzc2VydChlcnJwICYm
ICplcnJwKTsKKyAgICB3YXJuX3JlcG9ydF9lcnIoKmVycnApOworICAgICplcnJwID0gTlVMTDsK
K30KKworCiAvKgogICogSnVzdCBsaWtlIGVycm9yX3NldGcoKSwgZXhjZXB0IHlvdSBnZXQgdG8g
c3BlY2lmeSB0aGUgZXJyb3IgY2xhc3MuCiAgKiBOb3RlOiB1c2Ugb2YgZXJyb3IgY2xhc3NlcyBv
dGhlciB0aGFuIEVSUk9SX0NMQVNTX0dFTkVSSUNfRVJST1IgaXMKLS0gCjIuMjEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
