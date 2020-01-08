Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05435134955
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:27:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipF58-0003SY-5F; Wed, 08 Jan 2020 17:25:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DQVU=25=merlin.srs.infradead.org=batv+2c4203d137aea531db05+5981+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ipF57-0003SF-1o
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:25:21 +0000
X-Inumbo-ID: ceecf5b8-323b-11ea-b1f0-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ceecf5b8-323b-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PfBZWrPNvtZNsGAP2K/mtbCxT8Cyw9RbJYllM4G66pE=; b=Cns5Fvp9DUaPgKgFVE7KALW25p
 ZPCKWsCOy+SAiFcuDRG1tPEedEnQLivTfY/lVPKfDq1S71wye6D5+MQqfd2m71OTE41Qwz/nmr21I
 NGHpeO8UhZP8y6QU0AhXMW8ODzFsrGI7iYrTuSIq8ClY9CBizDzL/WHdsSrA9kJPhCrx0mLBqRcPN
 U0041Ww7c/SXad1nrZnPcbXDwRwVq0X0w7cVrPrTKeuwEpRSmigZ3m2xA8krcoR0iSG4CbDE4lFxD
 J+7pjYIA0IN9+hal8qr+Mbj0c6mNZ4ffymM0U5HnVnPLEK20RnTjuM95nDismLQicVXW491Y558z6
 kOM3US8A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipF4o-0004uw-9d; Wed, 08 Jan 2020 17:25:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ipF4m-005xKd-AP; Wed, 08 Jan 2020 17:25:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed,  8 Jan 2020 17:25:00 +0000
Message-Id: <20200108172500.1419665-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200108172500.1419665-1-dwmw2@infradead.org>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <20200108172500.1419665-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 3/3] Add KEXEC_RANGE_MA_LIVEUPDATE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoaXMgYWxsb3dzIGtl
eGVjIHVzZXJzcGFjZSB0byB0ZWxsIHRoZSBuZXh0IFhlbiB3aGVyZSB0aGUgcmFuZ2UgaXMsCm9u
IGl0cyBjb21tYW5kIGxpbmUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMgfCAxNSArKysr
KysrKysrKystLS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgfCAgMiArLQogeGVuL2lu
Y2x1ZGUvcHVibGljL2tleGVjLmggICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWFjaGlu
ZV9rZXhlYy5jIGIveGVuL2FyY2gveDg2L21hY2hpbmVfa2V4ZWMuYwppbmRleCBiNzBkNWE2YTg2
Li5mMGM0NjE3MjM0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWFjaGluZV9rZXhlYy5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMKQEAgLTE4NCwxMSArMTg0LDIwIEBAIHZv
aWQgbWFjaGluZV9rZXhlYyhzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlKQogICAgICAgICAgICAg
ICAgIGltYWdlLT5oZWFkLCBpbWFnZS0+ZW50cnlfbWFkZHIsIHJlbG9jX2ZsYWdzKTsKIH0KIAor
ZXh0ZXJuIHVuc2lnbmVkIGxvbmcgbHVfYm9vdG1lbV9zdGFydCwgbHVfYm9vdG1lbV9zaXplOwor
CiBpbnQgbWFjaGluZV9rZXhlY19nZXQoeGVuX2tleGVjX3JhbmdlX3QgKnJhbmdlKQogewotCWlm
IChyYW5nZS0+cmFuZ2UgIT0gS0VYRUNfUkFOR0VfTUFfWEVOKQotCQlyZXR1cm4gLUVJTlZBTDsK
LQlyZXR1cm4gbWFjaGluZV9rZXhlY19nZXRfeGVuKHJhbmdlKTsKKyAgICBzd2l0Y2ggKHJhbmdl
LT5yYW5nZSkgeworICAgIGNhc2UgS0VYRUNfUkFOR0VfTUFfWEVOOgorICAgICAgICByZXR1cm4g
bWFjaGluZV9rZXhlY19nZXRfeGVuKHJhbmdlKTsKKyAgICBjYXNlIEtFWEVDX1JBTkdFX01BX0xJ
VkVVUERBVEU6CisgICAgICAgIHJhbmdlLT5zdGFydCA9IGx1X2Jvb3RtZW1fc3RhcnQ7CisgICAg
ICAgIHJhbmdlLT5zaXplID0gbHVfYm9vdG1lbV9zaXplOworICAgICAgICByZXR1cm4gMDsKKyAg
ICBkZWZhdWx0OgorICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CiB9CiAKIHZvaWQgYXJj
aF9jcmFzaF9zYXZlX3ZtY29yZWluZm8odm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9z
ZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggNjUwZDcwYzFmYy4uMTFjMWJhOGU5
MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3Nl
dHVwLmMKQEAgLTY3OCw3ICs2NzgsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdCBjb3B5
X2Jpb3NfZTgyMChzdHJ1Y3QgZTgyMGVudHJ5ICptYXAsIHVuc2lnbmVkIGludCBsaQogICAgIHJl
dHVybiBuOwogfQogCi1zdGF0aWMgdW5zaWduZWQgbG9uZyBsdV9ib290bWVtX3N0YXJ0LCBsdV9i
b290bWVtX3NpemUsIGx1X2RhdGE7Cit1bnNpZ25lZCBsb25nIGx1X2Jvb3RtZW1fc3RhcnQsIGx1
X2Jvb3RtZW1fc2l6ZSwgbHVfZGF0YTsKIAogc3RhdGljIGludCBfX2luaXQgcGFyc2VfbGl2ZXVw
ZGF0ZShjb25zdCBjaGFyICpzdHIpCiB7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMv
a2V4ZWMuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5oCmluZGV4IDNmMmExMTgzODEuLjI5
ODM4MWFmOGQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5oCisrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5oCkBAIC0xNTAsNiArMTUwLDcgQEAgdHlwZWRlZiBzdHJ1
Y3QgeGVuX2tleGVjX2xvYWRfdjEgewogI2RlZmluZSBLRVhFQ19SQU5HRV9NQV9FRklfTUVNTUFQ
IDUgLyogbWFjaGluZSBhZGRyZXNzIGFuZCBzaXplIG9mCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKiBvZiB0aGUgRUZJIE1lbW9yeSBNYXAgKi8KICNkZWZpbmUgS0VYRUNf
UkFOR0VfTUFfVk1DT1JFSU5GTyA2IC8qIG1hY2hpbmUgYWRkcmVzcyBhbmQgc2l6ZSBvZiB2bWNv
cmVpbmZvICovCisjZGVmaW5lIEtFWEVDX1JBTkdFX01BX0xJVkVVUERBVEUgNyAvKiBCb290IG1l
bSBmb3IgbGl2ZSB1cGRhdGUgKi8KIAogLyoKICAqIEZpbmQgdGhlIGFkZHJlc3MgYW5kIHNpemUg
b2YgY2VydGFpbiBtZW1vcnkgYXJlYXMKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
