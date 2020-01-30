Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A314DED0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:17:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCT4-0004wC-6w; Thu, 30 Jan 2020 16:14:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwoG=3T=merlin.srs.infradead.org=batv+f9651308fc69d1c188a8+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCT1-0004uO-OI
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:55 +0000
X-Inumbo-ID: 78cad7e4-437b-11ea-a933-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78cad7e4-437b-11ea-a933-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j0bRNgj/mkTr+3RVAh2A0VZOBTd/VSZMQJdSs4KPZ0I=; b=0i7G+cHLZGpPJpeYPH6bFwyPU7
 ZGIAtDNG7ulsMnGt0hr5a7vi7jPXD4O7dOHquOAPPKbu4kbz3dRJ1Rm4jy/fGKYoQ7RHh5Tu0ww+t
 91QWMXlbs1zuEfDcMb4/NbNfiudsIEvHyxTYy779YOUJWaGF4RFpIV+DaojGSjCDGEy4MJ5ZSMZW8
 cCRSvcw8f4bfnE1ZU1V/m+oZh5cPa/1fwcdwVsfothtsXJ0ObY6VmGnEbPKo8+S5nowy+4qQKKa4y
 6W4+hC0CMdXdVSns2LfrVcFdg3nO0V8kEcn0xK8/PvHXWnv2uc71+M2CFieUUxp+zG9m76TpoFy6B
 BhaE+EPQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005Ti-63; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009kdO-CI; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:16 +0000
Message-Id: <20200130161330.2324143-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 08/22] Add kimage_add_live_update_data()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 paul@xen.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, Amit Shah <aams@amazon.de>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClNpZ25lZC1vZmYtYnk6
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2NvbW1vbi9raW1h
Z2UuYyAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2lu
Y2x1ZGUveGVuL2tpbWFnZS5oIHwgIDMgKysrCiB4ZW4vaW5jbHVkZS94ZW4vbHUuaCAgICAgfCAg
MyArKysKIDMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24va2ltYWdlLmMgYi94ZW4vY29tbW9uL2tpbWFnZS5jCmluZGV4IDIxMDI0MWRmYjcu
Ljg2ZDI3OTdjYmMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24va2ltYWdlLmMKKysrIGIveGVuL2Nv
bW1vbi9raW1hZ2UuYwpAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1ZGUgPHhlbi9tbS5oPgogI2lu
Y2x1ZGUgPHhlbi9rZXhlYy5oPgogI2luY2x1ZGUgPHhlbi9raW1hZ2UuaD4KKyNpbmNsdWRlIDx4
ZW4vbHUuaD4KIAogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAKQEAgLTkzOCw2ICs5MzksMzkgQEAg
ZG9uZToKICAgICByZXR1cm4gcmV0OwogfQogCitpbnQga2ltYWdlX2FkZF9saXZlX3VwZGF0ZV9k
YXRhKHN0cnVjdCBrZXhlY19pbWFnZSAqaW1hZ2UsIG1mbl90IGRhdGEsIGludCBucl9tZm5zKQor
eworICAgIGludCByZXQ7CisKKyAgICAvKgorICAgICAqIEZvciBsaXZlIHVwZGF0ZSwgd2UgcGxh
Y2UgdGhlIHBoeXNpY2FsIGxvY2F0aW9uIG9mICdkYXRhJworICAgICAqIGludG8gdGhlIGZpcnN0
IDY0IGJpdHMgb2YgdGhlIHJlc2VydmVkIGxpdmUgdXBkYXRlIGJvb3RtZW0KKyAgICAgKiByZWdp
b24uIEF0ICdkYXRhJyBpcyBhbiBNRk4gbGlzdCBvZiBwYWdlcyBjb250YWluaW5nIHRoZQorICAg
ICAqIGFjdHVhbCBsaXZlIHVwZGF0ZSBzdHJlYW0sIHdoaWNoIHRoZSBuZXcgWGVuIGNhbiB2bWFw
KCkuCisgICAgICoKKyAgICAgKiBBcHBlbmQgSU5EX1dSSVRFNjQgb3BlcmF0aW9ucyB0byB0aGUg
ZW5kIG9mIHRoZSBraW1hZ2Ugc3RyZWFtCisgICAgICogdG8gc3RvcmUgdGhlIGxpdmUgdXBkYXRl
IG1hZ2ljIGFuZCB0aGUgYWRkcmVzcyBvZiAnZGF0YScgZm9yCisgICAgICogdGhlIG5ldyBYZW4g
dG8gc2VlLgorICAgICAqLworICAgIGlmICghbHVfYm9vdG1lbV9zdGFydCB8fCBraW1hZ2VfZHN0
X3VzZWQoaW1hZ2UsIGx1X2Jvb3RtZW1fc3RhcnQpKQorICAgICAgICByZXR1cm4gLUVJTlZBTDsK
KworICAgIHJldCA9IG1hY2hpbmVfa2V4ZWNfYWRkX3BhZ2UoaW1hZ2UsIGx1X2Jvb3RtZW1fc3Rh
cnQsIGx1X2Jvb3RtZW1fc3RhcnQpOworICAgIGlmICggcmV0IDwgMCApCisgICAgICAgIHJldHVy
biByZXQ7CisKKyAgICByZXQgPSBraW1hZ2Vfc2V0X2Rlc3RpbmF0aW9uKGltYWdlLCBsdV9ib290
bWVtX3N0YXJ0KTsKKyAgICBpZiAoIXJldCkKKyAgICAgICAgcmV0ID0ga2ltYWdlX2FkZF9lbnRy
eShpbWFnZSwgTElWRV9VUERBVEVfTUFHSUMgfCBJTkRfV1JJVEU2NCk7CisgICAgaWYgKCFyZXQp
CisgICAgICAgIHJldCA9IGtpbWFnZV9hZGRfZW50cnkoaW1hZ2UsIG1mbl90b19tYWRkcihkYXRh
KSB8IElORF9XUklURTY0KTsKKyAgICBpZiAoIXJldCkKKyAgICAgICAgcmV0ID0ga2ltYWdlX2Fk
ZF9lbnRyeShpbWFnZSwgKG5yX21mbnMgPDwgUEFHRV9TSElGVCkgfCBJTkRfV1JJVEU2NCk7CisK
KyAgICBraW1hZ2VfdGVybWluYXRlKGltYWdlKTsKKworICAgIHJldHVybiByZXQ7Cit9CiAvKgog
ICogTG9jYWwgdmFyaWFibGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL2tpbWFnZS5oIGIveGVuL2luY2x1ZGUveGVuL2tpbWFnZS5oCmluZGV4IGU5NDgzOWQ3YzMu
LjFlMGUzNzhhZmQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9raW1hZ2UuaAorKysgYi94
ZW4vaW5jbHVkZS94ZW4va2ltYWdlLmgKQEAgLTU0LDYgKzU0LDkgQEAgdW5zaWduZWQgbG9uZyBr
aW1hZ2VfZW50cnlfaW5kKGtpbWFnZV9lbnRyeV90ICplbnRyeSwgYm9vbF90IGNvbXBhdCk7CiBp
bnQga2ltYWdlX2J1aWxkX2luZChzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlLCBtZm5fdCBpbmRf
bWZuLAogICAgICAgICAgICAgICAgICAgICAgYm9vbF90IGNvbXBhdCk7CiAKK2ludCBraW1hZ2Vf
YWRkX2xpdmVfdXBkYXRlX2RhdGEoc3RydWN0IGtleGVjX2ltYWdlICppbWFnZSwgbWZuX3QgZGF0
YSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IG5yX21mbnMpOworCiAjZW5k
aWYgLyogX19BU1NFTUJMWV9fICovCiAKICNlbmRpZiAvKiBfX1hFTl9LSU1BR0VfSF9fICovCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbHUuaCBiL3hlbi9pbmNsdWRlL3hlbi9sdS5oCmlu
ZGV4IGFiYjMwNTQ1ZmUuLjIxZWUxODI1ZDMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9s
dS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9sdS5oCkBAIC0xLDkgKzEsMTIgQEAKICNpZm5kZWYg
X19YRU5fTFVfSF9fCiAjZGVmaW5lIF9fWEVOX0xVX0hfXwogCisKICNpbmNsdWRlIDx4ZW4vdHlw
ZXMuaD4KICNpbmNsdWRlIDx4ZW4vbW0uaD4KIAorI2RlZmluZSBMSVZFX1VQREFURV9NQUdJQyAg
ICAgICAgKDB4NGM2OTc2NjU1NTcwNjQ2MVVMICYgUEFHRV9NQVNLKQorCiBzdHJ1Y3QgbHVfc3Ry
ZWFtIHsKICAgICBtZm5fdCAqcGFnZWxpc3Q7CiAgICAgc2l6ZV90IGxlbjsKLS0gCjIuMjEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
