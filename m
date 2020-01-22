Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EA4144E0A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:56:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBlx-0000kb-Rl; Wed, 22 Jan 2020 08:54:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sgrk=3L=bombadil.srs.infradead.org=batv+85ff3fd4b7fffb97e0bd+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBlv-0000kI-TH
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:53:59 +0000
X-Inumbo-ID: baa6679c-3cf4-11ea-aecd-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baa6679c-3cf4-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p233OatuRQuoWS6LOUmWPlwIXjbBEnNCI12DOuMnnC8=; b=rowZcxFz/1a7uBUKZ17pXnmB2I
 /W39PPTxOf1xBW2Ii5tK8aLOW4VNsaaxj7rIjUtfSTpBs/FwX17XnIuSKCGNrK91AS3n6MP/F3k1A
 pfbtB3RYSlB3lpFIBj9ZgRva3ppPTlYc08LZk6+tpkRxdG8mhhEOFeiHuBi6U/6dGy6d4kevzby2h
 3Wbza7rp+B/zXXvVLp01GLmWMTC6Izi3r+LnGhT7/FKtfswzB7ifmnd5z+8mCfB5bIGe1rjsQvnu3
 i1Y/pJpFjg2sR6FHcYklDcdAnXkK/FY5ToMi4taaA9FhxvRXkuwk2MtErNdbTSn+b6ZtZLO4RLVOn
 oa498Vzg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0001yE-Gf; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mRY-9l; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:49 +0000
Message-Id: <20200122085357.2092778-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 06/14] Add IND_WRITE64 primitive to kexec
 kimage
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoaXMgYWxsb3dzIGEg
c2luZ2xlIHBhZ2UtYWxpZ25lZCBwaHlzaWNhbCBhZGRyZXNzIHRvIGJlIHdyaXR0ZW4gdG8KdGhl
IGN1cnJlbnQgZGVzdGluYXRpb24sIGludGVuZGVkIHRvIHBhc3MgdGhlIGxvY2F0aW9uIG9mIHRo
ZSBsaXZlCnVwZGF0ZSBkYXRhIHN0cmVhbSBmcm9tIG9uZSBYZW4gdG8gdGhlIG5leHQuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0KIHhlbi9h
cmNoL3g4Ni94ODZfNjQva2V4ZWNfcmVsb2MuUyB8IDkgKysrKysrKystCiB4ZW4vaW5jbHVkZS94
ZW4va2ltYWdlLmggICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9rZXhl
Y19yZWxvYy5TIGIveGVuL2FyY2gveDg2L3g4Nl82NC9rZXhlY19yZWxvYy5TCmluZGV4IGQ0ODhk
MTI3Y2YuLmE3NWY5ODk5MjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQva2V4ZWNf
cmVsb2MuUworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2tleGVjX3JlbG9jLlMKQEAgLTEzMSwx
MSArMTMxLDE4IEBAIGlzX3NvdXJjZToKICAgICAgICAgam1wICAgICBuZXh0X2VudHJ5CiBpc196
ZXJvOgogICAgICAgICB0ZXN0YiAgICRJTkRfWkVSTywgJWNsCi0gICAgICAgIGp6ICAgICAgbmV4
dF9lbnRyeQorICAgICAgICBqeiAgICAgIGlzX3dyaXRlNjQKICAgICAgICAgbW92bCAgICAkKFBB
R0VfU0laRSAvIDgpLCAlZWN4ICAvKiBaZXJvIHRoZSBkZXN0aW5hdGlvbiBwYWdlLiAqLwogICAg
ICAgICB4b3JsICAgICVlYXgsICVlYXgKICAgICAgICAgcmVwIHN0b3NxCiAgICAgICAgIGptcCAg
ICAgbmV4dF9lbnRyeQoraXNfd3JpdGU2NDoKKyAgICAgICAgdGVzdGIgICAkSU5EX1dSSVRFNjQs
ICVjbAorICAgICAgICBqeiAgICAgIG5leHRfZW50cnkKKyAgICAgICAgYW5kcSAgICAkUEFHRV9N
QVNLLCAlcmN4CisgICAgICAgIG1vdnEgICAgJXJjeCwgJXJheAorICAgICAgICBzdG9zcQorICAg
ICAgICBqbXAgICAgIG5leHRfZW50cnkKIGRvbmU6CiAgICAgICAgIHBvcHEgICAgJXJieAogICAg
ICAgICByZXQKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9raW1hZ2UuaCBiL3hlbi9pbmNs
dWRlL3hlbi9raW1hZ2UuaAppbmRleCBjYmZiOWU5MDU0Li5lOTQ4MzlkN2MzIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4va2ltYWdlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2tpbWFnZS5o
CkBAIC02LDYgKzYsNyBAQAogI2RlZmluZSBJTkRfRE9ORSAgICAgICAgIDB4NAogI2RlZmluZSBJ
TkRfU09VUkNFICAgICAgIDB4OAogI2RlZmluZSBJTkRfWkVSTyAgICAgICAgMHgxMAorI2RlZmlu
ZSBJTkRfV1JJVEU2NCAgICAgMHgyMAogCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
