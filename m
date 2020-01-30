Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41E14DED4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:17:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCTN-0005FB-3k; Thu, 30 Jan 2020 16:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwoG=3T=merlin.srs.infradead.org=batv+f9651308fc69d1c188a8+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCTL-0005DW-Q1
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:15:15 +0000
X-Inumbo-ID: 78cb9918-437b-11ea-8396-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78cb9918-437b-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v/QUZkpN6XQ5mb9yTgHgXdzpdT/hSpe4dmLFXOsSGm4=; b=dmjZp24WTkiVupuuMxd+JNv3fp
 XuS/edGhPMTk+AtIjr36KBTfCxbr1kyeXSUwFG+m0fzvIRDTireRXgr4GubB0Jl9bAwTSEuAg3seq
 xLDGDFMBQrk0x3iWYU/961vvLV7glm0ZwMwm4yYV0OL0cYv2qlI6ptuE7WrbWBxTazgIsWc5xa6lF
 Wo7AD3Rbwk+BlzC4GeqlSHY4v0bW0JRtdapV/ZLjzaRfrnctzLS8H9WZiF00nNu01/8gRnOvc4ufU
 phWYnmMM8BKN21X3zsLuKz0EzrEy1coVqxCcTBKNR8aIyzLvFsngqRAMxDzet+M7xL7+PLzjnA2FP
 nt/TblvQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005Tn-Bi; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009ke7-I7; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:25 +0000
Message-Id: <20200130161330.2324143-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 17/22] Add lu_stream_{open, close,
 append}_record()
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
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2NvbW1vbi9sdS9z
dHJlYW0uYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
eGVuL2luY2x1ZGUveGVuL2x1LmggICB8ICA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2x1L3N0cmVhbS5jIGIveGVuL2Nv
bW1vbi9sdS9zdHJlYW0uYwppbmRleCA4YzQ0YTRlYjM3Li4yZWU4NzBlODBhIDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL2x1L3N0cmVhbS5jCisrKyBiL3hlbi9jb21tb24vbHUvc3RyZWFtLmMKQEAg
LTMzLDYgKzMzLDcgQEAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KICNpbmNsdWRlIDx4ZW4vdm1h
cC5oPgogI2luY2x1ZGUgPHhlbi9sdS5oPgorI2luY2x1ZGUgPHB1YmxpYy9taWdyYXRpb25fc3Ry
ZWFtLmg+CiAKIHN0YXRpYyBpbnQgbHVfc3RyZWFtX2V4dGVuZChzdHJ1Y3QgbHVfc3RyZWFtICpz
dHJlYW0sIGludCBucl9wYWdlcykKIHsKQEAgLTEwNSw2ICsxMDYsNTUgQEAgaW50IGx1X3N0cmVh
bV9hcHBlbmQoc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtLCBjb25zdCB2b2lkICpkYXRhLCBzaXpl
X3Qgc2l6ZSkKICAgICByZXR1cm4gMDsKIH0KIAoraW50IGx1X3N0cmVhbV9vcGVuX3JlY29yZChz
dHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0sIHVuc2lnbmVkIGludCB0eXBlKQoreworICAgIHN0cnVj
dCBtcl9yaGRyICpoZHI7CisKKyAgICBzdHJlYW0tPmxhc3RfaGRyID0gc3RyZWFtLT5sZW47CisK
KyAgICBoZHIgPSBsdV9zdHJlYW1fcmVzZXJ2ZShzdHJlYW0sIHNpemVvZihoZHIpKTsKKyAgICBp
ZiAoIWhkcikKKyAgICAgICAgcmV0dXJuIC1FTk9NRU07CisKKyAgICBoZHItPnR5cGUgPSB0eXBl
OworICAgIGhkci0+bGVuZ3RoID0gMDsKKworICAgIGx1X3N0cmVhbV9lbmRfcmVzZXJ2YXRpb24o
c3RyZWFtLCBzaXplb2YoKmhkcikpOworCisgICAgcmV0dXJuIDA7Cit9CisKK2ludCBsdV9zdHJl
YW1fY2xvc2VfcmVjb3JkKHN0cnVjdCBsdV9zdHJlYW0gKnN0cmVhbSkKK3sKKyAgICB1aW50NjRf
dCB6ZXJvZXMgPSAwOworICAgIHN0cnVjdCBtcl9yaGRyICpoZHI7CisgICAgaW50IHJjID0gMDsK
KworICAgIGhkciA9IChzdHJ1Y3QgbXJfcmhkciAqKShzdHJlYW0tPmRhdGEgKyBzdHJlYW0tPmxh
c3RfaGRyKTsKKworICAgIGhkci0+bGVuZ3RoID0gc3RyZWFtLT5sZW4gLSBzdHJlYW0tPmxhc3Rf
aGRyIC0gc2l6ZW9mKCpoZHIpOworCisgICAgaWYgKHN0cmVhbS0+bGVuICYgNykKKyAgICAgICAg
cmMgPSBsdV9zdHJlYW1fYXBwZW5kKHN0cmVhbSwgJnplcm9lcywgOCAtIChzdHJlYW0tPmxlbiAm
IDcpKTsKKworICAgIHJldHVybiByYzsKK30KKworaW50IGx1X3N0cmVhbV9hcHBlbmRfcmVjb3Jk
KHN0cnVjdCBsdV9zdHJlYW0gKnN0cmVhbSwgdW5zaWduZWQgaW50IHR5cGUsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdm9pZCAqcmVjLCBzaXplX3QgbGVuKQoreworICAgIGludCByYzsK
KworCisgICAgcmMgPSBsdV9zdHJlYW1fb3Blbl9yZWNvcmQoc3RyZWFtLCB0eXBlKTsKKyAgICBp
ZiAoIXJjICYmIGxlbikKKyAgICAgICAgcmMgPSBsdV9zdHJlYW1fYXBwZW5kKHN0cmVhbSwgcmVj
LCBsZW4pOworICAgIGlmICghcmMpCisgICAgICAgIHJjID0gbHVfc3RyZWFtX2Nsb3NlX3JlY29y
ZChzdHJlYW0pOworCisgICAgcmV0dXJuIDA7Cit9CisKIHZvaWQgbHVfc3RyZWFtX2ZyZWUoc3Ry
dWN0IGx1X3N0cmVhbSAqc3RyZWFtKQogewogICAgIHVuc2lnbmVkIGludCBvcmRlciA9IGdldF9v
cmRlcl9mcm9tX2J5dGVzKChzdHJlYW0tPm5yX3BhZ2VzICsgMSkgKiBzaXplb2YobWZuX3QpKTsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9sdS5oIGIveGVuL2luY2x1ZGUveGVuL2x1LmgK
aW5kZXggMjFhYmFjZTEzMC4uYzAyMjY4ZTQxNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVu
L2x1LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2x1LmgKQEAgLTksNiArOSw3IEBACiAKIHN0cnVj
dCBsdV9zdHJlYW0gewogICAgIG1mbl90ICpwYWdlbGlzdDsKKyAgICBzaXplX3QgbGFzdF9oZHI7
CiAgICAgc2l6ZV90IGxlbjsKICAgICBpbnQgbnJfcGFnZXM7CiAgICAgY2hhciAqZGF0YTsKQEAg
LTE3LDYgKzE4LDEwIEBAIHN0cnVjdCBsdV9zdHJlYW0gewogdm9pZCAqbHVfc3RyZWFtX3Jlc2Vy
dmUoc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtLCBzaXplX3Qgc2l6ZSk7CiB2b2lkIGx1X3N0cmVh
bV9lbmRfcmVzZXJ2YXRpb24oc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtLCBzaXplX3Qgc2l6ZSk7
CiBpbnQgbHVfc3RyZWFtX2FwcGVuZChzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0sIGNvbnN0IHZv
aWQgKmRhdGEsIHNpemVfdCBzaXplKTsKK2ludCBsdV9zdHJlYW1fb3Blbl9yZWNvcmQoc3RydWN0
IGx1X3N0cmVhbSAqc3RyZWFtLCB1bnNpZ25lZCBpbnQgdHlwZSk7CitpbnQgbHVfc3RyZWFtX2Ns
b3NlX3JlY29yZChzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0pOworaW50IGx1X3N0cmVhbV9hcHBl
bmRfcmVjb3JkKHN0cnVjdCBsdV9zdHJlYW0gKnN0cmVhbSwgdW5zaWduZWQgaW50IHR5cGUsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqcmVjLCBzaXplX3QgbGVuKTsKIHZvaWQg
bHVfc3RyZWFtX2ZyZWUoc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtKTsKIAogc3RydWN0IGtleGVj
X2ltYWdlOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
