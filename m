Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67240144E05
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:56:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBmQ-0000zl-VH; Wed, 22 Jan 2020 08:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sgrk=3L=bombadil.srs.infradead.org=batv+85ff3fd4b7fffb97e0bd+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBmP-0000zJ-Sb
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:54:29 +0000
X-Inumbo-ID: baa5799a-3cf4-11ea-9fd7-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baa5799a-3cf4-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dC/5xgPaZcGVU6/NspTQoCE57tJqbFRm5i5/smAHE/E=; b=Qb0F7KSyhYwZZyHkZq8owFPz1k
 TFWQFuID9E5LrD1+Y817zw/FUZGqBzUILG6S7g7MFo5Le0L/+FVYgW17mDcrMn8jqBoTLbCuDyS8M
 M/OaoHostB7JXRbtpakAphbo/ABsrhsLgbpCoIqqEH8egr/wAyoXEceQLafk8ZMlWa32EY9mvedE3
 muAQvUtCxfQTlXs9A872t77ItsFELKNzVoZ2w58MTUjBf/U1BhrJPmt6NExFa1QHKYi5MtVZ+XNo0
 fAkSRb3PQanawvFn/Din09/I0o/kVBO7HxwaIFTSzkCHpElKtpx5gms5q6srUNVtJkPRX1iI/cgfh
 rTAmvKNQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0001yB-F1; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mRJ-86; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:46 +0000
Message-Id: <20200122085357.2092778-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 03/14] Don't add unused parts of live
 update reserved bootmem to heap
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCldlIG5lZWQgdG8gcHJv
bWlzZSB0aGF0IHdlIHdvbid0IHVzZSBpdCBmb3IgYW55dGhpbmcgdGhhdCB3aWxsIG5lZWQgdG8K
cGVyc2lzdCBhY3Jvc3MgbGl2ZSB1cGRhdGUuIFVudGlsIHdlIGNhbiBhY2hpZXZlIHRoYXQgKHdo
aWNoIHdpbGwgYnVpbGQKb24gb2Ygc29tZSBvZiB0aGUgd29yayBIb25neWFuIGlzIGRvaW5nIGZv
ciBzZWNyZXQgaGlkaW5nKSwgdGhlIGVhc3kKYW5zd2VyIGlzIGp1c3Qgbm90IHRvIGFkZCB0aGF0
IHJlZ2lvbiB0byB0aGUgbWFpbiBoZWFwIGF0IGFsbC4gSWYKaXQgd2FzIHNpemVkIGFwcHJvcHJp
YXRlbHkgdGhlcmUgaXNuJ3QgZXZlbiBtdWNoIHdhc3RhZ2UuCi0tLQogeGVuL2FyY2gveDg2L3Nl
dHVwLmMgICAgfCAxMCArKysrKysrKysrCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8ICA1ICsr
KysrCiB4ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMKaW5kZXggNDIwYzM4NDU2Yi4uNDI5NjQ0N2Q5ZiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE1NzEs
NiArMTU3MSwxNiBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBs
b25nIG1iaV9wKQogICAgICAgICB1bnNpZ25lZCBsb25nIGxpbWl0ID0gdmlydF90b19tZm4oSFlQ
RVJWSVNPUl9WSVJUX0VORCAtIDEpOwogICAgICAgICB1aW50NjRfdCBtYXNrID0gUEFHRV9TSVpF
IC0gMTsKIAorICAgICAgICAvKgorICAgICAgICAgKiBQYWdlcyBpbiB0aGUgcmVzZXJ2ZWQgTFUg
cmVnaW9uIG11c3Qgbm90IGJlIHVzZWQgZm9yIGFueXRoaW5nIHdoaWNoCisgICAgICAgICAqIHdp
bGwgbmVlZCB0byBwZXJzaXN0IGFjcm9zcyBhIGxpdmUgdXBkYXRlLiBUaGVyZSBpcyBvbmdvaW5n
IHdvcmsgdG8KKyAgICAgICAgICogZWxpbWluYXRlIG9yIGxpbWl0IHRoZSB1c2Ugb2Ygc2hhcmVf
eGVuX3BhZ2Vfd2l0aF9ndWVzdCgpIGFuZCBnZXQKKyAgICAgICAgICogdG8gYSBwb2ludCB3aGVy
ZSB3ZSBjYW4gYWN0dWFsbHkgaG9ub3VyIHRoYXQgcHJvbWlzZSwgYnV0IGZvciBub3cKKyAgICAg
ICAgICoganVzdCAqZG9uJ3QqIGFkZCB0aG9zZSBwYWdlcyB0byB0aGUgaGVhcC4gQ2xlYXIgdGhl
IGJvb3QgYWxsb2NhdG9yCisgICAgICAgICAqIG91dCBjb21wbGV0ZWx5LCBiZWZvcmUgYWRkaW5n
IHRoZSBub24tcmVzZXJ2ZWQgcmFuZ2VzLgorICAgICAgICAgKi8KKyAgICAgICAgY2xlYXJfYm9v
dF9hbGxvY2F0b3IoKTsKKwogICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGJvb3RfZTgyMC5ucl9t
YXA7IGkrKyApCiAgICAgICAgIHsKICAgICAgICAgICAgIHVpbnQ2NF90IHMsIGU7CmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCmlu
ZGV4IDkxOWEyNzA1ODcuLjIwZWYyNWQ0NWEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCisrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCkBAIC0xODc5LDYgKzE4NzksMTEg
QEAgdm9pZCBfX2luaXQgZW5kX2Jvb3RfYWxsb2NhdG9yKHZvaWQpCiAgICAgcHJpbnRrKCJcbiIp
OwogfQogCit2b2lkIF9faW5pdCBjbGVhcl9ib290X2FsbG9jYXRvcih2b2lkKQoreworICAgIG5y
X2Jvb3RtZW1fcmVnaW9ucyA9IDA7Cit9CisKIHN0YXRpYyB2b2lkIF9faW5pdCBzbXBfc2NydWJf
aGVhcF9wYWdlcyh2b2lkICpkYXRhKQogewogICAgIHVuc2lnbmVkIGxvbmcgbWZuLCBzdGFydCwg
ZW5kOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL21tLmggYi94ZW4vaW5jbHVkZS94ZW4v
bW0uaAppbmRleCA4ZDBkZGZiNjBjLi41YmNlMTc0YTNlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vbW0uaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaApAQCAtMTU4LDYgKzE1OCw3IEBA
IHN0cnVjdCBkb21haW4gKl9fbXVzdF9jaGVjayBwYWdlX2dldF9vd25lcl9hbmRfcmVmZXJlbmNl
KHN0cnVjdCBwYWdlX2luZm8gKik7CiB2b2lkIGluaXRfYm9vdF9wYWdlcyhwYWRkcl90IHBzLCBw
YWRkcl90IHBlKTsKIG1mbl90IGFsbG9jX2Jvb3RfcGFnZXModW5zaWduZWQgbG9uZyBucl9wZm5z
LCB1bnNpZ25lZCBsb25nIHBmbl9hbGlnbik7CiB2b2lkIGVuZF9ib290X2FsbG9jYXRvcih2b2lk
KTsKK3ZvaWQgY2xlYXJfYm9vdF9hbGxvY2F0b3Iodm9pZCk7CiAKIC8qIFhlbiBzdWJhbGxvY2F0
b3IuIFRoZXNlIGZ1bmN0aW9ucyBhcmUgaW50ZXJydXB0LXNhZmUuICovCiB2b2lkIGluaXRfeGVu
aGVhcF9wYWdlcyhwYWRkcl90IHBzLCBwYWRkcl90IHBlKTsKLS0gCjIuMjEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
