Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFE14DEBD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:16:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCRv-00048a-4g; Thu, 30 Jan 2020 16:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZPhi=3T=bombadil.srs.infradead.org=batv+316c8ce85392a3425e94+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCRt-00048D-MS
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:13:45 +0000
X-Inumbo-ID: 75906d96-437b-11ea-8396-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75906d96-437b-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZTgfDMXt3n597mGD9I/q6Dgx1CUvT+O8Ay/FP5gtSHI=; b=pd6yl2vfbxOutyLDfuee0eJIzX
 R+e6fU09g+WvwiU2Jx2AvWnq0r4dqmbX9KQ0tmBxMhB9wOWXdEpHZFSvl1uaV4iOQuUyQDdryROt+
 O4mu4+aY4/XCKeOls56JPoY5a6MomA/VqYaWMTBWt6pJT0WVTogaeK1mNJIXyaxKkMH26MqXFzF+m
 gEM4z1+NoGRNwoKstqCTEGOdsx/OAkOMrzA3sYfixrR+Dd0z5M9mMh2Ds4L3ILYg7pr6R8KX83WwN
 haUSuzdqV4cdP7uaiDLBiMqNhBCza6tLZDZnTF8/j2jD8xp+tKqGlhdgLO3E2jaTBpEmmKfiEoUB1
 IxAqRhTA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005A4-Pi; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009keC-Ig; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:26 +0000
Message-Id: <20200130161330.2324143-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 18/22] Add LU_VERSION and LU_END records
 to live update stream
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
YXZlLmMgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKy0KIHhlbi9pbmNsdWRlL3B1
YmxpYy9taWdyYXRpb25fc3RyZWFtLmggfCAgOSArKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
bHUvc2F2ZS5jIGIveGVuL2NvbW1vbi9sdS9zYXZlLmMKaW5kZXggYzQzOTYyYzQ0ZS4uODQ4NTJk
YTM1ZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9sdS9zYXZlLmMKKysrIGIveGVuL2NvbW1vbi9s
dS9zYXZlLmMKQEAgLTQsMTAgKzQsMTcgQEAKICNpbmNsdWRlIDx4ZW4vbHUuaD4KICNpbmNsdWRl
IDx4ZW4va2ltYWdlLmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CisjaW5jbHVkZSA8eGVuL3Zl
cnNpb24uaD4KKyNpbmNsdWRlIDxwdWJsaWMvbWlncmF0aW9uX3N0cmVhbS5oPgogCiBpbnQgbHVf
c2F2ZV9nbG9iYWwoc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtKQogewotICAgIHJldHVybiAwOwor
ICAgIHN0cnVjdCBtcl9sdV92ZXJzaW9uIHZlcl9yZWM7CisKKyAgICB2ZXJfcmVjLnhlbl9tYWpv
ciA9IHhlbl9tYWpvcl92ZXJzaW9uKCk7CisgICAgdmVyX3JlYy54ZW5fbWlub3IgPSB4ZW5fbWlu
b3JfdmVyc2lvbigpOworICAgIHJldHVybiBsdV9zdHJlYW1fYXBwZW5kX3JlY29yZChzdHJlYW0s
IFJFQ19UWVBFX0xVX1ZFUlNJT04sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZ2ZXJfcmVjLCBzaXplb2YodmVyX3JlYykpOwogfQogCiAKQEAgLTM0LDYgKzQxLDEwIEBAIGlu
dCBsdV9zYXZlX2FsbChzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlKQogICAgICAgICByZXQgPSBs
dV9zYXZlX2RvbWFpbigmc3RyZWFtLCBkKTsKICAgICB9CiAKKyAgICBpZiAoIXJldCkKKyAgICAg
ICAgcmV0ID0gbHVfc3RyZWFtX2FwcGVuZF9yZWNvcmQoJnN0cmVhbSwgUkVDX1RZUEVfRU5ELAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCAwKTsKKwogICAgIGlm
ICghcmV0KQogICAgICAgICByZXQgPSBraW1hZ2VfYWRkX2xpdmVfdXBkYXRlX2RhdGEoaW1hZ2Us
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIF9tZm4odmlydF90b19tZm4oc3RyZWFtLnBhZ2Vs
aXN0KSksCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWlncmF0aW9uX3N0cmVhbS5o
IGIveGVuL2luY2x1ZGUvcHVibGljL21pZ3JhdGlvbl9zdHJlYW0uaAppbmRleCA5MmRkMTE5Zjlm
Li4yOWVkOGNjMmI1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWlncmF0aW9uX3N0
cmVhbS5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9taWdyYXRpb25fc3RyZWFtLmgKQEAgLTUx
LDYgKzUxLDggQEAgc3RydWN0IG1yX3JoZHIKICNkZWZpbmUgUkVDX1RZUEVfQ0hFQ0tQT0lOVCAg
ICAgICAgICAgICAgICAgMHgwMDAwMDAwZVUKICNkZWZpbmUgUkVDX1RZUEVfQ0hFQ0tQT0lOVF9E
SVJUWV9QRk5fTElTVCAgMHgwMDAwMDAwZlUKIAorI2RlZmluZSBSRUNfVFlQRV9MVV9WRVJTSU9O
ICAgICAgICAgICAgICAgICAweDQwMDAwMDAwVQorCiAjZGVmaW5lIFJFQ19UWVBFX09QVElPTkFM
ICAgICAgICAgICAgIDB4ODAwMDAwMDBVCiAjZGVmaW5lIFJFQ19UWVBFX0xJVkVfVVBEQVRFICAg
ICAgICAgIDB4NDAwMDAwMDBVCiAKQEAgLTExMyw2ICsxMTUsMTMgQEAgc3RydWN0IG1yX2h2bV9w
YXJhbXMKICAgICBzdHJ1Y3QgbXJfaHZtX3BhcmFtc19lbnRyeSBwYXJhbVswXTsKIH07CiAKKy8q
IExVX1ZFUlNJT04gKi8KK3N0cnVjdCBtcl9sdV92ZXJzaW9uCit7CisgICAgdWludDMyX3QgeGVu
X21ham9yOworICAgIHVpbnQzMl90IHhlbl9taW5vcjsKK307CisKICNlbmRpZiAvKiBfX1hFTl9N
SUdSQVRJT05fU1RSRUFNX0hfXyAqLwogCiAvKgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
