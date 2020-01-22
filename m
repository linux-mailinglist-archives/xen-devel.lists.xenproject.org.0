Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8554144E04
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:56:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBmC-0000r7-1d; Wed, 22 Jan 2020 08:54:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sgrk=3L=bombadil.srs.infradead.org=batv+85ff3fd4b7fffb97e0bd+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBmA-0000qm-So
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:54:14 +0000
X-Inumbo-ID: baa725ec-3cf4-11ea-b833-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baa725ec-3cf4-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VgQjjHotepf4XKe5zdOlsNW1e89KCj7K1D1AbkLnhS4=; b=hXaXTXm+hmlsR5lct6q96AYwUn
 ClRVFl0q3mQeuttNIYqt7+GQX0XdmDS7iEunk4uQJuhYQbVrIL4fl4hYCLfclqv4aUyTavpllODa2
 FaAmgVIdFs2FRP/WFOfpFhSIKJVjQ5lrBotT37AHQtZLS7Zfna8u7jXsGPDhErs+k5uzmLpnrUvRC
 KEj5c+5NhqFXwCd3ecCFd6vMqdO5KLK//oip7+85GyB9BAGqOll+7Ox0UlR3NgScgmQLcGRrskckQ
 7yVcj7O9Er9TiuSaiQykV4EwydL7aADJ0RqTf4qnRvPYGbS+dossKGYIZLGONwy3aaT6f11gFfryt
 0u0F+dKA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0001yG-Kr; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mSC-ED; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:57 +0000
Message-Id: <20200122085357.2092778-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 14/14] debug hacks
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
bi9sdS9yZXN0b3JlLmMgfCA3ICsrKysrKysKIHhlbi9jb21tb24vbHUvc3RyZWFtLmMgIHwgMiAr
KwogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCA2ICsrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9sdS9yZXN0b3JlLmMgYi94
ZW4vY29tbW9uL2x1L3Jlc3RvcmUuYwppbmRleCA3ZjQwNTEzZWY5Li5mYTE2OGJkYWMxIDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL2x1L3Jlc3RvcmUuYworKysgYi94ZW4vY29tbW9uL2x1L3Jlc3Rv
cmUuYwpAQCAtMzEsNiArMzEsMTMgQEAgdm9pZCBsdV9yZXNlcnZlX3BhZ2VzKHBhZGRyX3QgbWZu
c19wLCBpbnQgbnJfcGFnZXMpCiAJfQogCiAgICAgLyogWFg6IENvbnN1bWUgdGhlIHN0cmVhbSBv
ZiBkYXRhIGFuZCBtYXJrIGFsbCBkb21haW4gcGFnZXMgYXMgYWxsb2NhdGVkIHRvby4gKi8KKwor
ICAgIHByaW50aygiRmlyc3QgbGl2ZSB1cGRhdGUgZGF0YSBwYWdlIGF0IE1GTiAlbHg6XG4iLCBt
Zm5zWzBdKTsKKyAgICBwID0gbWZuX3RvX3ZpcnQobWZuc1swXSk7CisgICAgbWFwX3BhZ2VzX3Rv
X3hlbigodW5zaWduZWQgbG9uZylwLCBtZm5zWzBdLCAxLCBQQUdFX0hZUEVSVklTT1IpOworICAg
IGZvciAoaSA9IDA7IGkgPCAxNjsgaSsrKQorICAgICAgICBwcmludGsoIiAlMDJ4IiwgcFtpXSk7
CisgICAgcHJpbnRrKCJcbiIpOwogfQogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9sdS9z
dHJlYW0uYyBiL3hlbi9jb21tb24vbHUvc3RyZWFtLmMKaW5kZXggNTIwMzBlOGIyZS4uMzI3YzAz
OTZmZiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9sdS9zdHJlYW0uYworKysgYi94ZW4vY29tbW9u
L2x1L3N0cmVhbS5jCkBAIC02NSw2ICs2NSw3IEBAIHN0YXRpYyBpbnQgbHVfc3RyZWFtX2V4dGVu
ZChzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0sIGludCBucl9wYWdlcykKIAlpZiAoc3RyZWFtLT5k
YXRhKQogCQl2dW5tYXAoc3RyZWFtLT5kYXRhKTsKIAlzdHJlYW0tPmRhdGEgPSB2bWFwKHN0cmVh
bS0+cGFnZWxpc3QsIHN0cmVhbS0+bnJfcGFnZXMpOworCXByaW50aygiTWFwcGVkICVkIE1GTnMg
YXQgJWx4IHRvICVwXG4iLCBzdHJlYW0tPm5yX3BhZ2VzLCBzdHJlYW0tPnBhZ2VsaXN0WzBdLCBz
dHJlYW0tPmRhdGEpOwogCWlmICghc3RyZWFtLT5kYXRhKQogCQlyZXR1cm4gLUVOT01FTTsKIApA
QCAtOTEsNiArOTIsNyBAQCBpbnQgbHVfc3RyZWFtX2FwcGVuZChzdHJ1Y3QgbHVfc3RyZWFtICpz
dHJlYW0sIHZvaWQgKmRhdGEsIHNpemVfdCBzaXplKQogCXZvaWQgKnAgPSBsdV9zdHJlYW1fcmVz
ZXJ2ZShzdHJlYW0sIHNpemUpOwogCWlmICghcCkKIAkJcmV0dXJuIC1FTk9NRU07CisJcHJpbnRr
KCJDb3B5ICVsZCBzdGFydGluZyAlMDJ4IHRvICVwXG4iLCBzaXplLCAqKHVuc2lnbmVkIGNoYXIg
KilkYXRhLCBwKTsKIAltZW1jcHkocCwgZGF0YSwgc2l6ZSk7CiAJbHVfc3RyZWFtX2VuZF9yZXNl
cnZhdGlvbihzdHJlYW0sIHNpemUpOwogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCmluZGV4IDJhMjBjMTJhYmIuLmEzNjY4YTUx
N2YgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCisrKyBiL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jCkBAIC0xNzY1LDcgKzE3NjUsMTAgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
Y29udGlnX2F2YWlsX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLCB1bnNpZ25lZCBsb25nIG1h
eF8KICAgICBmb3IgKCBpID0gMCA7IGkgPCBtYXhfcGFnZXM7IGkrKykKICAgICB7CiAgICAgICAg
IGlmICggcGdbaV0uY291bnRfaW5mbyAmIChQR0NfYnJva2VuIHwgUEdDX2FsbG9jYXRlZCkgKQor
ICAgICAgICB7CisgICAgICAgICAgICBwcmludGsoIlNraXBwaW5nIHJlc2VydmVkIE1GTiAlbHhc
biIsIG1mbl94KHBhZ2VfdG9fbWZuKCZwZ1tpXSkpKTsKICAgICAgICAgICAgIGJyZWFrOworICAg
ICAgICB9CiAgICAgfQogICAgIHJldHVybiBpOwogfQpAQCAtMTgxNCw3ICsxODE3LDEwIEBAIHN0
YXRpYyB2b2lkIGluaXRfaGVhcF9wYWdlcygKICAgICAgICAgLyogSWYgdGhlIChmaXJzdCkgcGFn
ZSBpcyBhbHJlYWR5IG1hcmtlZCBiYWQsIG9yIGFsbG9jYXRlZCBpbiBhZHZhbmNlCiAgICAgICAg
ICAqIGR1ZSB0byBsaXZlIHVwZGF0ZSwgZG9uJ3QgYWRkIGl0IHRvIHRoZSBoZWFwLiAqLwogICAg
ICAgICBpZiAocGdbaV0uY291bnRfaW5mbyAmIChQR0NfYnJva2VuIHwgUEdDX2FsbG9jYXRlZCkp
CisgICAgICAgIHsKKyAgICAgICAgICAgIHByaW50aygiU2tpcHBpbmcgcmVzZXJ2ZWQgTUZOICVs
eFxuIiwgbWZuX3gocGFnZV90b19tZm4oJnBnW2ldKSkpOwogICAgICAgICAgICAgY29udGludWU7
CisgICAgICAgIH0KIAogICAgICAgICBpZiAoIHVubGlrZWx5KCFhdmFpbFtuaWRdKSApCiAgICAg
ICAgIHsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
