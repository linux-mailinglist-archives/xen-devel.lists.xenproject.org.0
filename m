Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB514DEC1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:16:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCSE-0004Ib-Qf; Thu, 30 Jan 2020 16:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZPhi=3T=bombadil.srs.infradead.org=batv+316c8ce85392a3425e94+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCSD-0004I9-MT
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:05 +0000
X-Inumbo-ID: 75a285c6-437b-11ea-ad98-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75a285c6-437b-11ea-ad98-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0s0/VAvwl0g9rp0gJ4yY/77JC3YwThEFwhhDArumQc=; b=G1/6HPsMgAzG3s+MOV47+gA3NV
 sfGWXzmNR3s5kh9gAonDoxdtbbYQcRmRhp3tRXi/xsftM8i8cjTcXMUi021fDJPsNqj9YRZ6/2BsY
 5viv9TgQhUyeDogP1g/HzbWdjEjJJxrRfqSdH3fWgVVcOzy8wDgrOWXM+B3vQ9guTQLcQ2srQqV9g
 QQ4AfCYsSv307IN8Eox8ArlbNrEy5dspmlat49/EKdkFOT1tsFK7T7IyRPkg+8iadi35Ut3aEyXTQ
 P1zofnPq1Hv1epqfSy7zcN5rvUedscczOTzYfywxRrvUV6prUkhf3dPWgN4yrr0iDZ0IdoUysCw7C
 OFOSN1UQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005A6-SI; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009keW-LF; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:30 +0000
Message-Id: <20200130161330.2324143-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 22/22] x86/setup: simplify handling of
 initrdidx when no initrd present
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClJlbW92ZSBhIHRlcm5h
cnkgb3BlcmF0b3IgdGhhdCBtYWRlIG15IGJyYWluIGh1cnQgYW5kIHJlcGxhY2UgaXQgd2l0aApz
b21ldGhpbmcgc2ltcGxlciB0aGF0IG1ha2VzIGl0IGNsZWFyZXIgdGhhdCB0aGUgPj0gbWJpLT5t
b2RzX2NvdW50CmlzIGJlY2F1c2Ugb2Ygd2hhdCBmaW5kX2ZpcnN0X2JpdCgpIHJldHVybnMgd2hl
biBpdCBkb2Vzbid0IGZpbmQKYW55dGhpbmcuIEp1c3QgaGF2ZSBhIHNpbXBsZSBjb25kaXRpb24g
dG8gc2V0IGluaXRyZGlkeCB0byB6ZXJvIGluCnRoYXQgY2FzZSwgYW5kIGEgbXVjaCBzaW1wbGVy
IHRlcm5hcnkgb3BlcmF0b3IgaW4gdGhlIGNyZWF0ZV9kb20wKCkKY2FsbC4KClNpZ25lZC1vZmYt
Ynk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2FyY2gveDg2
L3NldHVwLmMgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYwppbmRleCA1M2Y3YjljZWQ0Li42YjNhNTc3N2NiIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTk5Myw2
ICsxOTkzLDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBtYmlfcCkKICAgICBlbHNlCiAgICAgewogICAgICAgICBpbml0cmRpZHggPSBmaW5kX2ZpcnN0
X2JpdChtb2R1bGVfbWFwLCBtYmktPm1vZHNfY291bnQpOworICAgICAgICBpZiAoIGluaXRyZGlk
eCA+PSBtYmktPm1vZHNfY291bnQgKQorICAgICAgICAgICAgaW5pdHJkaWR4ID0gMDsKKwogICAg
ICAgICBpZiAoIGJpdG1hcF93ZWlnaHQobW9kdWxlX21hcCwgbWJpLT5tb2RzX2NvdW50KSA+IDEg
KQogICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HCiAgICAgICAgICAgICAgICAgICAg
Ik11bHRpcGxlIGluaXRyZCBjYW5kaWRhdGVzLCBwaWNraW5nIG1vZHVsZSAjJXVcbiIsCkBAIC0y
MDAyLDggKzIwMDUsOCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25l
ZCBsb25nIG1iaV9wKQogICAgICAgICAgKiBzYWZlbHkgYWJvdmUgb3VyIGhlYXAuIFRoZSBzZWNv
bmQgbW9kdWxlLCBpZiBwcmVzZW50LCBpcyBhbiBpbml0cmQuCiAgICAgICAgICAqLwogICAgICAg
ICBkb20wID0gY3JlYXRlX2RvbTAobW9kLCBtb2R1bGVzX2hlYWRyb29tLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKGluaXRyZGlkeCA+IDApICYmIChpbml0cmRpZHggPCBtYmktPm1vZHNf
Y291bnQpCi0gICAgICAgICAgICAgICAgICAgICAgICAgICA/IG1vZCArIGluaXRyZGlkeCA6IE5V
TEwsIGtleHRyYSwgbG9hZGVyKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGluaXRyZGlk
eCA/IG1vZCArIGluaXRyZGlkeCA6IE5VTEwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBr
ZXh0cmEsIGxvYWRlcik7CiAgICAgICAgIGlmICggZG9tMCA9PSBOVUxMICkKICAgICAgICAgICAg
IHBhbmljKCJDb3VsZCBub3Qgc2V0IHVwIERPTTAgZ3Vlc3QgT1NcbiIpOwogICAgIH0KLS0gCjIu
MjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
