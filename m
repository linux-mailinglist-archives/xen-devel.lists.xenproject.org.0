Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1F14DEBA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:16:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCSU-0004Su-0a; Thu, 30 Jan 2020 16:14:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZPhi=3T=bombadil.srs.infradead.org=batv+316c8ce85392a3425e94+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCSS-0004SM-Nl
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:20 +0000
X-Inumbo-ID: 7570e732-437b-11ea-8396-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7570e732-437b-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cii2sqUGqqIXyUMQJswpEp7YbOA1HrjdrYUaabsuQ94=; b=NVcU3iEluDtLRkLrSlEhx/5SNC
 lnvYOy5/XRKC77W1rv+QXAm0v6PRNcjR4JsE7tk0vJ6rbd+8hYDRXX4bFZbQ6lq6wdHOJtl42b9Nk
 z6aJ81Z09iDvqxmwomAy/tX7uN0PsszjUUpzlH9IWZUSFKFQ4Dl7vCgQH8A8M8hti20ALrGt68MDD
 Jxb23YF+WO3O1SKgK6YEf2MH1GKkhNBGYr1VXMmaqOTC1YZ5xXSMSFH3pAc17SPmJ9cr+HbesmSb+
 6bpaAhh1fs2GXeLg1vrfOXJIc75Ihho3698ghhy7rWbtt2412dfZRHxIz6eWiT0GB8bmnR/DhQKJs
 9jMKcyjQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-00059w-F8; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009kcr-7u; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:09 +0000
Message-Id: <20200130161330.2324143-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 01/22] x86/setup: Don't skip 2MiB
 underneath relocated Xen image
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
