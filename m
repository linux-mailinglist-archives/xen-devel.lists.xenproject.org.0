Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837E14F577
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:36:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgjB-0006QX-VP; Sat, 01 Feb 2020 00:33:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YQT+=3V=merlin.srs.infradead.org=batv+14355fafd9c313d768ee+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgjA-0006Pa-3a
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:33:36 +0000
X-Inumbo-ID: 6aebfdc8-448a-11ea-ad98-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aebfdc8-448a-11ea-ad98-bc764e2007e4;
 Sat, 01 Feb 2020 00:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cii2sqUGqqIXyUMQJswpEp7YbOA1HrjdrYUaabsuQ94=; b=O9J5HksmOcBX4+CEMauqFjccYp
 qkLKFWyYOeZYF6mp1Z0zuhktL+zSKdJ//KbGVkNEtYdceoRlOmoZHxL8KVb4vVGb+snsieCYChJvn
 Sc9NwawuJEUWX3iWFvW1sA232aqNeYwfm7TNTiwjHX8VClL4qiaBAxHnsP28RazZ/92hXLTs56l6O
 S8TjWe6b9Tcra3nA3bnlNT3lcw9KFSRez0qOJw2xWlz8/o6DWlw1mX5s/mSk+3wbLmQXBzhUUSlnC
 6wZInBZRZbO7I3EMEtR3gzOXVvCO6b83LvgO3CqN5cISjX/lFy9sbxQUmFO4QWlT360+zsljkMX4C
 1f5IbzaQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgie-0007nx-29; Sat, 01 Feb 2020 00:33:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixgid-009ul1-7i; Sat, 01 Feb 2020 00:33:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Sat,  1 Feb 2020 00:32:58 +0000
Message-Id: <20200201003303.2363081-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 3/8] x86/setup: Don't skip 2MiB underneath
 relocated Xen image
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClNldCAnZScgY29ycmVj
dGx5IHRvIHJlZmxlY3QgdGhlIGxvY2F0aW9uIHRoYXQgWGVuIGlzIGFjdHVhbGx5IHJlbG9jYXRl
ZAp0byBmcm9tIGl0cyBkZWZhdWx0IDJNaUIgbG9jYXRpb24uIE5vdCAyTWlCIGJlbG93IHRoYXQu
CgpUaGlzIGlzIG9ubHkgdmFndWVseSBhIGJ1ZyBmaXguIFRoZSAibWlzc2luZyIgMk1pQiB3b3Vs
ZCBoYXZlIGJlZW4gdXNlZAppbiB0aGUgZW5kLCBhbmQgZmVkIHRvIHRoZSBhbGxvY2F0b3IuIEl0
J3MganVzdCB0aGF0IG90aGVyIHRoaW5ncyBkb24ndApnZXQgdG8gc2l0IHJpZ2h0IHVwICpuZXh0
KiB0byB0aGUgWGVuIGltYWdlLCBhbmQgaXQgaXNuJ3QgdmVyeSB0aWR5LgoKRm9yIGxpdmUgdXBk
YXRlLCBJJ2QgcXVpdGUgbGlrZSBhIHNpbmdsZSBjb250aWd1b3VzIHJlZ2lvbiBmb3IgdGhlCnJl
c2VydmVkIGJvb3RtZW0gYW5kIFhlbiwgYWxsb3dpbmcgdGhlICdzbGFjaycgaW4gdGhlIGZvcm1l
ciB0byBiZSB1c2VkCndoZW4gWGVuIGl0c2VsZiBncm93cyBsYXJnZXIuIExldCdzIG5vdCBhbGxv
dyAyTWlCIG9mIHJhbmRvbSBoZWFwIHBhZ2VzCnRvIGdldCBpbiB0aGUgd2F5Li4uCgpTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNo
L3g4Ni9zZXR1cC5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBi
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IGQ4NTg4ODM0MDQuLjI2NzdmMTI3YjkgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBA
IC0xMDgwLDkgKzEwODAsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIG1iaV9wKQogICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwdGVfdXBkYXRlX2xp
bWl0OwogCiAgICAgICAgICAgICAvKiBTZWxlY3QgcmVsb2NhdGlvbiBhZGRyZXNzLiAqLwotICAg
ICAgICAgICAgZSA9IGVuZCAtIHJlbG9jX3NpemU7Ci0gICAgICAgICAgICB4ZW5fcGh5c19zdGFy
dCA9IGU7Ci0gICAgICAgICAgICBib290c3ltKHRyYW1wb2xpbmVfeGVuX3BoeXNfc3RhcnQpID0g
ZTsKKyAgICAgICAgICAgIHhlbl9waHlzX3N0YXJ0ID0gZW5kIC0gcmVsb2Nfc2l6ZTsKKyAgICAg
ICAgICAgIGUgPSB4ZW5fcGh5c19zdGFydCArIFhFTl9JTUdfT0ZGU0VUOworICAgICAgICAgICAg
Ym9vdHN5bSh0cmFtcG9saW5lX3hlbl9waHlzX3N0YXJ0KSA9IHhlbl9waHlzX3N0YXJ0OwogCiAg
ICAgICAgICAgICAvKgogICAgICAgICAgICAgICogTm8gUFRFcyBwb2ludGluZyBhYm92ZSB0aGlz
IGFkZHJlc3MgYXJlIGNhbmRpZGF0ZXMgZm9yIHJlbG9jYXRpb24uCkBAIC0xMDkwLDcgKzEwOTAs
NyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9w
KQogICAgICAgICAgICAgICogYW5kIHRoZSBiZWdpbm5pbmcgb2YgcmVnaW9uIGZvciBkZXN0aW5h
dGlvbiBpbWFnZSBzb21lIFBURXMgbWF5CiAgICAgICAgICAgICAgKiBwb2ludCB0byBhZGRyZXNz
ZXMgaW4gcmFuZ2UgW2UsIGUgKyBYRU5fSU1HX09GRlNFVCkuCiAgICAgICAgICAgICAgKi8KLSAg
ICAgICAgICAgIHB0ZV91cGRhdGVfbGltaXQgPSBQRk5fRE9XTihlICsgWEVOX0lNR19PRkZTRVQp
OworICAgICAgICAgICAgcHRlX3VwZGF0ZV9saW1pdCA9IFBGTl9ET1dOKGUpOwogCiAgICAgICAg
ICAgICAvKgogICAgICAgICAgICAgICogUGVyZm9ybSByZWxvY2F0aW9uIHRvIG5ldyBwaHlzaWNh
bCBhZGRyZXNzLgpAQCAtMTA5OSw3ICsxMDk5LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19z
dGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgICAgICAgICAqIGRhdGEgdW50aWwg
YWZ0ZXIgd2UgaGF2ZSBzd2l0Y2hlZCB0byB0aGUgcmVsb2NhdGVkIHBhZ2V0YWJsZXMhCiAgICAg
ICAgICAgICAgKi8KICAgICAgICAgICAgIGJhcnJpZXIoKTsKLSAgICAgICAgICAgIG1vdmVfbWVt
b3J5KGUgKyBYRU5fSU1HX09GRlNFVCwgWEVOX0lNR19PRkZTRVQsIF9lbmQgLSBfc3RhcnQsIDEp
OworICAgICAgICAgICAgbW92ZV9tZW1vcnkoZSwgWEVOX0lNR19PRkZTRVQsIF9lbmQgLSBfc3Rh
cnQsIDEpOwogCiAgICAgICAgICAgICAvKiBXYWxrIGluaXRpYWwgcGFnZXRhYmxlcywgcmVsb2Nh
dGluZyBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzLiAqLwogICAgICAgICAgICAgcGw0ZSA9IF9fdmEo
X19wYShpZGxlX3BnX3RhYmxlKSk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
