Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D3C144E09
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:56:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBml-0001Fy-Ff; Wed, 22 Jan 2020 08:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f6Rd=3L=merlin.srs.infradead.org=batv+5533599fc3e53c5fdf4f+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBmj-0001F0-Tr
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:54:49 +0000
X-Inumbo-ID: be41eb74-3cf4-11ea-b833-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be41eb74-3cf4-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=var8fE0CFHkpxyo42WantTfe48iSaJODKoM74jdvIxc=; b=gO3le3JnxQ0OtMC/4Vv9LkHByH
 6vKiRqSrQV5nC2AQ/bZ5HTjgVnKfW/J6LpF8izGwUAsCnJxmvfU/DvWHDyfFJvVoHZR87tQuEx8pJ
 7r3YcpRFR4+p8eIbLskjmjCnU5W99+OVwhNzfNQF8gXgl6w8x30nt6XB4Y8Oo0D5IsW8q1MjduMOm
 TR5P8171UWcfs/fNMZaoIBZpWvC3JENUioJQt2FYTs1kG+yH5h1dE3NzL4AIpGeZliWjYpl8MwZwJ
 sXzR0Cnjuvekfufvda7SVxxKzITb0REugBHippyzAZgkOmKceDWu0Cqi/ohKty58ulh3Lgean1I3S
 2oDZWQmA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0002cr-53; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mRn-BM; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:52 +0000
Message-Id: <20200122085357.2092778-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 09/14] Add basic lu_save_all() shell
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCi0tLQogeGVuL2NvbW1v
bi9rZXhlYy5jICAgICB8ICA2ICsrKysrKwogeGVuL2NvbW1vbi9sdS9NYWtlZmlsZSB8ICAyICst
CiB4ZW4vY29tbW9uL2x1L3NhdmUuYyAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vbHUuaCAgIHwgIDMgKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vY29tbW9uL2x1L3NhdmUuYwoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24va2V4ZWMu
YyBiL3hlbi9jb21tb24va2V4ZWMuYwppbmRleCBhNzhhYTRmNWIwLi42NThmZTNkM2Q0IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL2tleGVjLmMKKysrIGIveGVuL2NvbW1vbi9rZXhlYy5jCkBAIC0y
OSw2ICsyOSw3IEBACiAjaW5jbHVkZSA8cHVibGljL2VsZm5vdGUuaD4KICNpbmNsdWRlIDx4c20v
eHNtLmg+CiAjaW5jbHVkZSA8eGVuL2NwdS5oPgorI2luY2x1ZGUgPHhlbi9sdS5oPgogI2lmZGVm
IENPTkZJR19DT01QQVQKICNpbmNsdWRlIDxjb21wYXQva2V4ZWMuaD4KICNlbmRpZgpAQCAtNDA3
LDYgKzQwOCwxMSBAQCBzdGF0aWMgbG9uZyBrZXhlY19yZWJvb3Qodm9pZCAqX2ltYWdlKQogc3Rh
dGljIGxvbmcga2V4ZWNfbGl2ZV91cGRhdGUodm9pZCAqX2ltYWdlKQogewogICAgIHN0cnVjdCBr
ZXhlY19pbWFnZSAqaW1hZ2UgPSBfaW1hZ2U7CisgICAgaW50IHJldDsKKworICAgIHJldCA9IGx1
X3NhdmVfYWxsKGltYWdlKTsKKyAgICBpZiAocmV0KQorICAgICAgICByZXR1cm4gcmV0OwogCiAg
ICAga2V4ZWNpbmcgPSBUUlVFOwogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2x1L01ha2VmaWxl
IGIveGVuL2NvbW1vbi9sdS9NYWtlZmlsZQppbmRleCA2ODk5MWIzY2E0Li43YjdkOTc1ZjY1IDEw
MDY0NAotLS0gYS94ZW4vY29tbW9uL2x1L01ha2VmaWxlCisrKyBiL3hlbi9jb21tb24vbHUvTWFr
ZWZpbGUKQEAgLTEgKzEgQEAKLW9iai15ICs9IHN0cmVhbS5vCitvYmoteSArPSBzdHJlYW0ubyBz
YXZlLm8KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbHUvc2F2ZS5jIGIveGVuL2NvbW1vbi9sdS9z
YXZlLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzc2N2FiZDhmNAot
LS0gL2Rldi9udWxsCisrKyBiL3hlbi9jb21tb24vbHUvc2F2ZS5jCkBAIC0wLDAgKzEsNDUgQEAK
KworI2luY2x1ZGUgPHhlbi90eXBlcy5oPgorI2luY2x1ZGUgPHhlbi92bWFwLmg+CisjaW5jbHVk
ZSA8eGVuL2x1Lmg+CisjaW5jbHVkZSA8eGVuL2tpbWFnZS5oPgorI2luY2x1ZGUgPHhlbi9zY2hl
ZC5oPgorCitpbnQgbHVfc2F2ZV9nbG9iYWwoc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtKQorewor
CXJldHVybiAwOworfQorCisKK2ludCBsdV9zYXZlX2RvbWFpbihzdHJ1Y3QgbHVfc3RyZWFtICpz
dHJlYW0sIHN0cnVjdCBkb21haW4gKmQpCit7CisJcmV0dXJuIDA7Cit9CisKK2ludCBsdV9zYXZl
X2FsbChzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlKQoreworCXN0cnVjdCBsdV9zdHJlYW0gc3Ry
ZWFtOworCXN0cnVjdCBkb21haW4gKmQ7CisJaW50IHJldDsKKworCW1lbXNldCgmc3RyZWFtLCAw
LCBzaXplb2Yoc3RyZWFtKSk7CisKKwlyZXQgPSBsdV9zYXZlX2dsb2JhbCgmc3RyZWFtKTsKKwor
CWZvcl9lYWNoX2RvbWFpbiAoIGQgKSB7CisJCWlmIChyZXQpCisJCQlicmVhazsKKworCQlyZXQg
PSBsdV9zYXZlX2RvbWFpbigmc3RyZWFtLCBkKTsKKwl9CisKKwlpZiAoIXJldCkKKwkJcmV0ID0g
a2ltYWdlX2FkZF9saXZlX3VwZGF0ZV9kYXRhKGltYWdlLAorCQkJCQkJICB2aXJ0X3RvX21mbihz
dHJlYW0ucGFnZWxpc3QpLAorCQkJCQkJICBzdHJlYW0ubnJfcGFnZXMpOworCisJaWYgKHJldCkK
KwkJbHVfc3RyZWFtX2ZyZWUoJnN0cmVhbSk7CisKKwlyZXR1cm4gcmV0OworfQpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL2x1LmggYi94ZW4vaW5jbHVkZS94ZW4vbHUuaAppbmRleCBjYjJm
MWRiZTA2Li42ZTgzNzdiNmMzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbHUuaAorKysg
Yi94ZW4vaW5jbHVkZS94ZW4vbHUuaApAQCAtMTAsMyArMTAsNiBAQCB2b2lkICpsdV9zdHJlYW1f
cmVzZXJ2ZShzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0sIHNpemVfdCBzaXplKTsKIHZvaWQgbHVf
c3RyZWFtX2VuZF9yZXNlcnZhdGlvbihzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0sIHNpemVfdCBz
aXplKTsKIGludCBsdV9zdHJlYW1fYXBwZW5kKHN0cnVjdCBsdV9zdHJlYW0gKnN0cmVhbSwgdm9p
ZCAqZGF0YSwgc2l6ZV90IHNpemUpOwogdm9pZCBsdV9zdHJlYW1fZnJlZShzdHJ1Y3QgbHVfc3Ry
ZWFtICpzdHJlYW0pOworCitzdHJ1Y3Qga2V4ZWNfaW1hZ2U7CitpbnQgbHVfc2F2ZV9hbGwoc3Ry
dWN0IGtleGVjX2ltYWdlICppbWFnZSk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
