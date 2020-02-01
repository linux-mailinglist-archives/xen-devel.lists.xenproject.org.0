Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F314F576
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgii-000678-If; Sat, 01 Feb 2020 00:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jGrC=3V=bombadil.srs.infradead.org=batv+4ea019283916f422e4b4+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgig-00066E-Fy
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:33:06 +0000
X-Inumbo-ID: 690dca7c-448a-11ea-ad98-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 690dca7c-448a-11ea-ad98-bc764e2007e4;
 Sat, 01 Feb 2020 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oJ4ggL9B9DVukcCynxJbKxFVyNAbYCr/rqO67ToM4Zo=; b=hzTcrbp90+kCz6dQW0ZDbXyGIT
 5pcfR+6ziBec6NiKYoonyuJ3QM9uiA52qCYX1zGtvA2gbNh0K+jId5ntgXohROwOkidHTrjYfzncO
 0P8mEZdJVb9CX732ntt/Uc52BG4LHmaNqKnDDXflYAbXmL08K/rXFVL0b9d4EGR954RS71+ur+UzW
 IYmlO3Bym4lxxO09ZLcDMTOmXTq4VBnWNj3fLpic7ZQwLowu5nSanaslrhib7oaPeTvnFOhhOD/Dh
 QdZDNcxSvBLDOjlywdF1DORCMCg//x1uzGx+2mhbFH9e7ciY7h+JVmZGDKC1ogO00oZgJ9fuD7SPy
 AXIyUiLg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgie-0007N2-GR; Sat, 01 Feb 2020 00:33:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixgid-009ulG-9S; Sat, 01 Feb 2020 00:33:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Sat,  1 Feb 2020 00:33:01 +0000
Message-Id: <20200201003303.2363081-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 6/8] x86/setup: move vm_init() before
 end_boot_allocator()
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCldlIHdvdWxkIGxpa2Ug
dG8gYmUgYWJsZSB0byB1c2Ugdm1hcCgpIHRvIG1hcCB0aGUgbGl2ZSB1cGRhdGUgZGF0YSwgYW5k
CndlIG5lZWQgdG8gZG8gYSBmaXJzdCBwYXNzIG9mIHRoZSBsaXZlIHVwZGF0ZSBkYXRhIGJlZm9y
ZSB3ZSBwcmltZSB0aGUKaGVhcCBiZWNhdXNlIHdlIG5lZWQgdG8ga25vdyB3aGljaCBwYWdlcyBu
ZWVkIHRvIGJlIHByZXNlcnZlZC4KClRoZSB3YXJuaW5nIGFib3V0IEFDUEkgY29kZSBjYW4gYmUg
ZHJvcHBlZCwgc2luY2UgdGhhdCBwcm9ibGVtIG5vIGxvbmdlcgpleGlzdHMgd2hlbiB0aGluZ3Mg
YXJlIGRvbmUgaW4gdGhpcyBvcmRlci4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8
ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMgfCA4ICsrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXgg
MjY3N2YxMjdiOS4uNWY2OGExMzA4ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMK
KysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE0ODksNiArMTQ4OSw4IEBAIHZvaWQgX19p
bml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAKICAgICBudW1h
X2luaXRtZW1faW5pdCgwLCByYXdfbWF4X3BhZ2UpOwogCisgICAgdm1faW5pdCgpOworCiAgICAg
aWYgKCBtYXhfcGFnZSAtIDEgPiB2aXJ0X3RvX21mbihIWVBFUlZJU09SX1ZJUlRfRU5EIC0gMSkg
KQogICAgIHsKICAgICAgICAgdW5zaWduZWQgbG9uZyBsaW1pdCA9IHZpcnRfdG9fbWZuKEhZUEVS
VklTT1JfVklSVF9FTkQgLSAxKTsKQEAgLTE1MTksMTIgKzE1MjEsNiBAQCB2b2lkIF9faW5pdCBu
b3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAgICBlbmRfYm9v
dF9hbGxvY2F0b3IoKTsKIAogICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9ib290OwotICAg
IC8qCi0gICAgICogTm8gY2FsbHMgaW52b2x2aW5nIEFDUEkgY29kZSBzaG91bGQgZ28gYmV0d2Vl
biB0aGUgc2V0dGluZyBvZgotICAgICAqIFNZU19TVEFURV9ib290IGFuZCB2bV9pbml0KCkgKG9y
IGVsc2UgYWNwaV9vc197LHVufW1hcF9tZW1vcnkoKQotICAgICAqIHdpbGwgYnJlYWspLgotICAg
ICAqLwotICAgIHZtX2luaXQoKTsKIAogICAgIGNvbnNvbGVfaW5pdF9yaW5nKCk7CiAgICAgdmVz
YV9pbml0KCk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
