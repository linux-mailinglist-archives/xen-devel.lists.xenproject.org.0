Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99957144E10
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:57:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBmM-0000wy-LX; Wed, 22 Jan 2020 08:54:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sgrk=3L=bombadil.srs.infradead.org=batv+85ff3fd4b7fffb97e0bd+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBmK-0000wN-T1
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:54:24 +0000
X-Inumbo-ID: baa6db50-3cf4-11ea-aecd-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baa6db50-3cf4-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+S0kYvpeLyNkUVGsaMuA5j56PCidM2RGqFP/X8l6vkw=; b=YOmVLemikCO2OXuoyQqA3IfyUG
 7henKRTtEACbH1kRe6mYnnTxl+1RcjKBqxxVTgPAORNDMDYn1NUCRifEtjPtBJXuWjDhS9e5ddnyD
 sSDBpadE1LJjxhYMm32hoqzf8DUJwX18X08po+jCrj072FcMIm+5vxdSKXS8lUbfdNfOviNfesKTA
 fHV5kBIMCiS+J1wBWYeDozS0ZPBHx29iN9wmSNfhA8pAu6nOicodRNXxuSbmWX0DZtBajkZshZ1DG
 Q4Zm+quI5XvpI3PqxmOQR+6bByY3T0vRhoZ7TEOcG3hniij0sURLPrl79xdGEYBUoqplg5V/KtDyl
 zUbKwvvA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0001yC-FK; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mRO-8g; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:47 +0000
Message-Id: <20200122085357.2092778-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 04/14] Add KEXEC_RANGE_MA_LIVEUPDATE
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoaXMgYWxsb3dzIGtl
eGVjIHVzZXJzcGFjZSB0byB0ZWxsIHRoZSBuZXh0IFhlbiB3aGVyZSB0aGUgcmFuZ2UgaXMsCm9u
IGl0cyBjb21tYW5kIGxpbmUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMgfCAxMyArKysr
KysrKysrLS0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNs
dWRlL3B1YmxpYy9rZXhlYy5oICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21hY2hpbmVf
a2V4ZWMuYyBiL3hlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMKaW5kZXggYjcwZDVhNmE4Ni4u
MjczYmMyMDY2NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21hY2hpbmVfa2V4ZWMuYworKysg
Yi94ZW4vYXJjaC94ODYvbWFjaGluZV9rZXhlYy5jCkBAIC0xODYsOSArMTg2LDE2IEBAIHZvaWQg
bWFjaGluZV9rZXhlYyhzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlKQogCiBpbnQgbWFjaGluZV9r
ZXhlY19nZXQoeGVuX2tleGVjX3JhbmdlX3QgKnJhbmdlKQogewotCWlmIChyYW5nZS0+cmFuZ2Ug
IT0gS0VYRUNfUkFOR0VfTUFfWEVOKQotCQlyZXR1cm4gLUVJTlZBTDsKLQlyZXR1cm4gbWFjaGlu
ZV9rZXhlY19nZXRfeGVuKHJhbmdlKTsKKyAgICBzd2l0Y2ggKHJhbmdlLT5yYW5nZSkgeworICAg
IGNhc2UgS0VYRUNfUkFOR0VfTUFfWEVOOgorICAgICAgICByZXR1cm4gbWFjaGluZV9rZXhlY19n
ZXRfeGVuKHJhbmdlKTsKKyAgICBjYXNlIEtFWEVDX1JBTkdFX01BX0xJVkVVUERBVEU6CisgICAg
ICAgIHJhbmdlLT5zdGFydCA9IGx1X2Jvb3RtZW1fc3RhcnQ7CisgICAgICAgIHJhbmdlLT5zaXpl
ID0gbHVfYm9vdG1lbV9zaXplOworICAgICAgICByZXR1cm4gMDsKKyAgICBkZWZhdWx0OgorICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CiB9CiAKIHZvaWQgYXJjaF9jcmFzaF9zYXZlX3Zt
Y29yZWluZm8odm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMKaW5kZXggNDI5NjQ0N2Q5Zi4uNTIxOTQ2ZGMyNyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTY4MSw3
ICs2ODEsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdCBjb3B5X2Jpb3NfZTgyMChzdHJ1
Y3QgZTgyMGVudHJ5ICptYXAsIHVuc2lnbmVkIGludCBsaQogLyogSG93IG11Y2ggb2YgdGhlIGRp
cmVjdG1hcCBpcyBwcmVidWlsdCBhdCBjb21waWxlIHRpbWUuICovCiAjZGVmaW5lIFBSRUJVSUxU
X01BUF9MSU1JVCAoMSA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpCiAKLXN0YXRpYyB1bnNpZ25lZCBs
b25nIGx1X2Jvb3RtZW1fc3RhcnQsIGx1X2Jvb3RtZW1fc2l6ZSwgbHVfZGF0YTsKK3Vuc2lnbmVk
IGxvbmcgbHVfYm9vdG1lbV9zdGFydCwgbHVfYm9vdG1lbV9zaXplLCBsdV9kYXRhOwogCiBzdGF0
aWMgaW50IF9faW5pdCBwYXJzZV9saXZldXBkYXRlKGNvbnN0IGNoYXIgKnN0cikKIHsKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5oIGIveGVuL2luY2x1ZGUvcHVibGljL2tl
eGVjLmgKaW5kZXggM2YyYTExODM4MS4uMjk4MzgxYWY4ZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2tleGVjLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2tleGVjLmgKQEAgLTE1
MCw2ICsxNTAsNyBAQCB0eXBlZGVmIHN0cnVjdCB4ZW5fa2V4ZWNfbG9hZF92MSB7CiAjZGVmaW5l
IEtFWEVDX1JBTkdFX01BX0VGSV9NRU1NQVAgNSAvKiBtYWNoaW5lIGFkZHJlc3MgYW5kIHNpemUg
b2YKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG9mIHRoZSBFRkkgTWVt
b3J5IE1hcCAqLwogI2RlZmluZSBLRVhFQ19SQU5HRV9NQV9WTUNPUkVJTkZPIDYgLyogbWFjaGlu
ZSBhZGRyZXNzIGFuZCBzaXplIG9mIHZtY29yZWluZm8gKi8KKyNkZWZpbmUgS0VYRUNfUkFOR0Vf
TUFfTElWRVVQREFURSA3IC8qIEJvb3QgbWVtIGZvciBsaXZlIHVwZGF0ZSAqLwogCiAvKgogICog
RmluZCB0aGUgYWRkcmVzcyBhbmQgc2l6ZSBvZiBjZXJ0YWluIG1lbW9yeSBhcmVhcwotLSAKMi4y
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
