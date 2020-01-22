Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30593144E0E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:56:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBmv-0001OO-Di; Wed, 22 Jan 2020 08:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f6Rd=3L=merlin.srs.infradead.org=batv+5533599fc3e53c5fdf4f+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBmt-0001NY-Tl
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:54:59 +0000
X-Inumbo-ID: be432692-3cf4-11ea-aecd-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be432692-3cf4-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hoCDVMisbEijMobCdAo8zjqMwSBE37ecdhHuRielXvg=; b=SHbZotmychYr+IjAlXS1yg1KHL
 6pp4Ltjdm+MFJRlleRXuQeA/U/N6+nCXwNrN2/lxawd5r/kuHu3WCLfHyPnsrwA8zpW4+UcVsnmZx
 bRyKobS7+oq9frDnbIhc4G5nWsUC4O74uFAj1liui1YvH1T0SsOiWDlhCb4NzqAUqzsFYe20A1bgd
 2g8cmDfGzsldWbVZtrJtLAikM1DReandXv6RiyYazys5Z+iRGWJ8w5da4eUn5cgplCcLfkX6m3KoX
 37KlK2HxnjSaJiG6/cM6rCBWpRDZ6cUdNWQELjnAAPBIds9juO76RHdyrj0UkTOyRjd5iXXLU27Mp
 sanCkemA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0002cp-3v; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mRd-AH; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:50 +0000
Message-Id: <20200122085357.2092778-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 07/14] Add kimage_add_live_update_data()
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
Z2UuYyAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCB8ICAyICsrCiB4ZW4vaW5jbHVkZS94ZW4va2ltYWdl
LmggICAgIHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2tpbWFnZS5jIGIveGVuL2NvbW1vbi9raW1hZ2UuYwppbmRleCAy
MTAyNDFkZmI3Li5lYWZhNmE5YzI2IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2tpbWFnZS5jCisr
KyBiL3hlbi9jb21tb24va2ltYWdlLmMKQEAgLTkzOCw2ICs5MzgsMzkgQEAgZG9uZToKICAgICBy
ZXR1cm4gcmV0OwogfQogCitpbnQga2ltYWdlX2FkZF9saXZlX3VwZGF0ZV9kYXRhKHN0cnVjdCBr
ZXhlY19pbWFnZSAqaW1hZ2UsIG1mbl90IGRhdGEsIGludCBucl9tZm5zKQoreworICAgIGludCBy
ZXQ7CisKKyAgICAvKgorICAgICAqIEZvciBsaXZlIHVwZGF0ZSwgd2UgcGxhY2UgdGhlIHBoeXNp
Y2FsIGxvY2F0aW9uIG9mICdkYXRhJworICAgICAqIGludG8gdGhlIGZpcnN0IDY0IGJpdHMgb2Yg
dGhlIHJlc2VydmVkIGxpdmUgdXBkYXRlIGJvb3RtZW0KKyAgICAgKiByZWdpb24uIEF0ICdkYXRh
JyBpcyBhbiBNRk4gbGlzdCBvZiBwYWdlcyBjb250YWluaW5nIHRoZQorICAgICAqIGFjdHVhbCBs
aXZlIHVwZGF0ZSBzdHJlYW0sIHdoaWNoIHRoZSBuZXcgWGVuIGNhbiB2bWFwKCkuCisgICAgICoK
KyAgICAgKiBBcHBlbmQgSU5EX1dSSVRFNjQgb3BlcmF0aW9ucyB0byB0aGUgZW5kIG9mIHRoZSBr
aW1hZ2Ugc3RyZWFtCisgICAgICogdG8gc3RvcmUgdGhlIGxpdmUgdXBkYXRlIG1hZ2ljIGFuZCB0
aGUgYWRkcmVzcyBvZiAnZGF0YScgZm9yCisgICAgICogdGhlIG5ldyBYZW4gdG8gc2VlLgorICAg
ICAqLworICAgIGlmICghbHVfYm9vdG1lbV9zdGFydCB8fCBraW1hZ2VfZHN0X3VzZWQoaW1hZ2Us
IGx1X2Jvb3RtZW1fc3RhcnQpKQorICAgICAgICByZXR1cm4gLUVJTlZBTDsKKworICAgIHJldCA9
IG1hY2hpbmVfa2V4ZWNfYWRkX3BhZ2UoaW1hZ2UsIGx1X2Jvb3RtZW1fc3RhcnQsIGx1X2Jvb3Rt
ZW1fc3RhcnQpOworICAgIGlmICggcmV0IDwgMCApCisgICAgICAgIHJldHVybiByZXQ7CisKKyAg
ICByZXQgPSBraW1hZ2Vfc2V0X2Rlc3RpbmF0aW9uKGltYWdlLCBsdV9ib290bWVtX3N0YXJ0KTsK
KyAgICBpZiAoIXJldCkKKyAgICAgICAgcmV0ID0ga2ltYWdlX2FkZF9lbnRyeShpbWFnZSwgTElW
RV9VUERBVEVfTUFHSUMgfCBJTkRfV1JJVEU2NCk7CisgICAgaWYgKCFyZXQpCisgICAgICAgIHJl
dCA9IGtpbWFnZV9hZGRfZW50cnkoaW1hZ2UsIG1mbl90b19tYWRkcihkYXRhKSB8IElORF9XUklU
RTY0KTsKKyAgICBpZiAoIXJldCkKKyAgICAgICAgcmV0ID0ga2ltYWdlX2FkZF9lbnRyeShpbWFn
ZSwgKG5yX21mbnMgPDwgUEFHRV9TSElGVCkgfCBJTkRfV1JJVEU2NCk7CisKKyAgICBraW1hZ2Vf
dGVybWluYXRlKGltYWdlKTsKKworICAgIHJldHVybiByZXQ7Cit9CiAvKgogICogTG9jYWwgdmFy
aWFibGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25m
aWcuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKaW5kZXggNTVmMzI3ZGI3MC4uZTgw
Y2ZkNTRmMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaAorKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oCkBAIC0yODEsNiArMjgxLDggQEAgZXh0ZXJuIHVu
c2lnbmVkIGxvbmcgeGVuX3BoeXNfc3RhcnQ7CiBleHRlcm4gdW5zaWduZWQgbG9uZyBsdV9ib290
bWVtX3N0YXJ0LCBsdV9ib290bWVtX3NpemU7CiAjZW5kaWYKIAorI2RlZmluZSBMSVZFX1VQREFU
RV9NQUdJQyAgICAgICAgKDB4NGM2OTc2NjU1NTcwMDAwMFVMKQorCiAvKiBHRFQvTERUIHNoYWRv
dyBtYXBwaW5nIGFyZWEuIFRoZSBmaXJzdCBwZXItZG9tYWluLW1hcHBpbmcgc3ViLWFyZWEuICov
CiAjZGVmaW5lIEdEVF9MRFRfVkNQVV9TSElGVCAgICAgICA1CiAjZGVmaW5lIEdEVF9MRFRfVkNQ
VV9WQV9TSElGVCAgICAoR0RUX0xEVF9WQ1BVX1NISUZUICsgUEFHRV9TSElGVCkKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi9raW1hZ2UuaCBiL3hlbi9pbmNsdWRlL3hlbi9raW1hZ2UuaApp
bmRleCBlOTQ4MzlkN2MzLi4xZTBlMzc4YWZkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
a2ltYWdlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2tpbWFnZS5oCkBAIC01NCw2ICs1NCw5IEBA
IHVuc2lnbmVkIGxvbmcga2ltYWdlX2VudHJ5X2luZChraW1hZ2VfZW50cnlfdCAqZW50cnksIGJv
b2xfdCBjb21wYXQpOwogaW50IGtpbWFnZV9idWlsZF9pbmQoc3RydWN0IGtleGVjX2ltYWdlICpp
bWFnZSwgbWZuX3QgaW5kX21mbiwKICAgICAgICAgICAgICAgICAgICAgIGJvb2xfdCBjb21wYXQp
OwogCitpbnQga2ltYWdlX2FkZF9saXZlX3VwZGF0ZV9kYXRhKHN0cnVjdCBrZXhlY19pbWFnZSAq
aW1hZ2UsIG1mbl90IGRhdGEsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBu
cl9tZm5zKTsKKwogI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwogCiAjZW5kaWYgLyogX19YRU5f
S0lNQUdFX0hfXyAqLwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
