Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CEFC873B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 13:24:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFcgB-0001A9-03; Wed, 02 Oct 2019 11:20:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFcg9-00018v-5O
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 11:20:21 +0000
X-Inumbo-ID: 98ea5906-e506-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 98ea5906-e506-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 11:20:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 71ABFAE5E;
 Wed,  2 Oct 2019 11:20:08 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 13:20:04 +0200
Message-Id: <20191002112004.25793-7-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002112004.25793-1-jgross@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 6/6] xen: add runtime parameter reading
 support to hypfs
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHN1cHBvcnQgdG8gcmVhZCB2YWx1ZXMgb2YgaHlwZXJ2aXNvciBydW50aW1lIHBhcmFtZXRl
cnMgdmlhIHRoZQpoeXBlcnZpc29yIGZpbGUgc3lzdGVtIGZvciBhbGwgdW5zaWduZWQgaW50ZWdl
ciB0eXBlIHJ1bnRpbWUgcGFyYW1ldGVycy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jIHwgIDkg
KysrKysrKysrCiB4ZW4vY29tbW9uL2tlcm5lbC5jICAgICAgICAgIHwgMzkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jIGIvZG9jcy9t
aXNjL2h5cGZzLXBhdGhzLnBhbmRvYwppbmRleCA4MTM1MzU0NmVmLi5jMTIwMTQ1MDVlIDEwMDY0
NAotLS0gYS9kb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jCisrKyBiL2RvY3MvbWlzYy9oeXBm
cy1wYXRocy5wYW5kb2MKQEAgLTEwMiwzICsxMDIsMTIgQEAgaHlwZXJ2aXNvci4KICMjIyMgL2J1
aWxkaW5mby9jb25maWcgPSBTVFJJTkcKIAogVGhlIGNvbnRlbnRzIG9mIHRoZSBgeGVuLy5jb25m
aWdgIGZpbGUgYXQgdGhlIHRpbWUgb2YgdGhlIGh5cGVydmlzb3IgYnVpbGQuCisKKyMjIyMgL3Bh
cmFtcy8KKworQSBkaXJlY3Rvcnkgb2YgcnVudGltZSBwYXJhbWV0ZXJzICh0aG9zZSBjYW4gYmUg
c2V0IHZpYSB4bCBzZXQtcGFyYW1ldGVycykuCisKKyMjIyMgL3BhcmFtcy8qCisKK1RoZSBzaW5n
bGUgcGFyYW1ldGVycy4gVGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBkaWZmZXJlbnQgcGFyYW1ldGVy
cyBjYW4gYmUKK2ZvdW5kIGluIGBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2NgLgpk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9rZXJuZWwuYyBiL3hlbi9jb21tb24va2VybmVsLmMKaW5k
ZXggNzYwOTE3ZGFiNS4uZTJlNmQxNzFhNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwu
YworKysgYi94ZW4vY29tbW9uL2tlcm5lbC5jCkBAIC03LDYgKzcsNyBAQAogI2luY2x1ZGUgPHhl
bi9pbml0Lmg+CiAjaW5jbHVkZSA8eGVuL2xpYi5oPgogI2luY2x1ZGUgPHhlbi9lcnJuby5oPgor
I2luY2x1ZGUgPHhlbi9oeXBmcy5oPgogI2luY2x1ZGUgPHhlbi92ZXJzaW9uLmg+CiAjaW5jbHVk
ZSA8eGVuL3NjaGVkLmg+CiAjaW5jbHVkZSA8eGVuL3BhZ2luZy5oPgpAQCAtMzIwLDYgKzMyMSw0
NCBAQCBpbnQgY21kbGluZV9zdHJjbXAoY29uc3QgY2hhciAqZnJhZywgY29uc3QgY2hhciAqbmFt
ZSkKICAgICB9CiB9CiAKK3N0YXRpYyBzdHJ1Y3QgaHlwZnNfZGlyIGh5cGZzX3BhcmFtcyA9IHsK
KyAgICAubGlzdCA9IExJU1RfSEVBRF9JTklUKGh5cGZzX3BhcmFtcy5saXN0KSwKK307CisKK3N0
YXRpYyBpbnQgX19pbml0IHJ1bnRpbWVfcGFyYW1faHlwZnNfYWRkKHZvaWQpCit7CisgICAgY29u
c3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAqcGFyYW07CisgICAgaW50IHJldDsKKworICAgIHJldCA9
IGh5cGZzX25ld19kaXIoJmh5cGZzX3Jvb3QsICJwYXJhbXMiLCAmaHlwZnNfcGFyYW1zKTsKKyAg
ICBCVUdfT04ocmV0KTsKKworICAgIGZvciAoIHBhcmFtID0gX19wYXJhbV9zdGFydDsgcGFyYW0g
PCBfX3BhcmFtX2VuZDsgcGFyYW0rKyApCisgICAgeworICAgICAgICBzd2l0Y2ggKCBwYXJhbS0+
dHlwZSApCisgICAgICAgIHsKKyAgICAgICAgY2FzZSBPUFRfVUlOVDoKKyAgICAgICAgICAgIGlm
ICggcGFyYW0tPmxlbiA9PSBzaXplb2YodW5zaWduZWQgaW50KSApCisgICAgICAgICAgICAgICAg
cmV0ID0gaHlwZnNfbmV3X2VudHJ5X3VpbnQoJmh5cGZzX3BhcmFtcywgcGFyYW0tPm5hbWUsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGludCAq
KShwYXJhbS0+cGFyLnZhcikpOworICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgY2FzZSBP
UFRfU1RSOgorICAgICAgICAgICAgcmV0ID0gaHlwZnNfbmV3X2VudHJ5X3VpbnQoJmh5cGZzX3Bh
cmFtcywgcGFyYW0tPm5hbWUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXJhbS0+cGFyLnZhcik7CisgICAgICAgICAgICBicmVhazsKKworICAgICAgICBkZWZhdWx0
OgorICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KKworICAgICAgICBCVUdfT04ocmV0KTsK
KyAgICB9CisKKyAgICByZXR1cm4gMDsKK30KK19faW5pdGNhbGwocnVudGltZV9wYXJhbV9oeXBm
c19hZGQpOworCiB1bnNpZ25lZCBpbnQgdGFpbnRlZDsKIAogLyoqCi0tIAoyLjE2LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
