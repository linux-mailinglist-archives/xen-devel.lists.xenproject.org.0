Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234EF14DECC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:17:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCSj-0004eo-Aj; Thu, 30 Jan 2020 16:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwoG=3T=merlin.srs.infradead.org=batv+f9651308fc69d1c188a8+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCSh-0004dz-NA
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:35 +0000
X-Inumbo-ID: 78cd6306-437b-11ea-b211-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78cd6306-437b-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlalkARsClixWlIYZ3dNEz91vQZ1wmUKqx0bvL84HHo=; b=3jirisKvFxxzCsna4kXLVhU/s7
 k/i7spQa4qNDgi57ADfn6/5gSVgqcuS2+2pMKT5EVIaOZOLJuF9v0jXTooO3hbdp85NF8FNIWjxof
 cbRBIumAdeAXOVJLda/LRFd9AGGyNfFDkfHKbCb8WzMNS3UlD+m36yagNHnOXSUi1kicxAztmnxgn
 5yObEuBNgSzA51+mh5AsydS6bYjyrCt1QbTJLdthFuTpdw5Pwme6Ov2XC5+eWVMX8zXJaMYEkTGq1
 oZduYT5epY7dI02eOlFtVJr4Gbxp3JQk8sbKPYkOtIayYtbBMcYZaGQr4IdFw93wFy0lT1varRiC8
 +7u1OLhQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005Tl-93; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009kdn-FO; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:21 +0000
Message-Id: <20200130161330.2324143-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 13/22] x86/setup: move vm_init() before
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
 paul@xen.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, Amit Shah <aams@amazon.de>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCldlIHdvdWxkIGxpa2Ug
dG8gYmUgYWJsZSB0byB1c2Ugdm1hcCgpIHRvIG1hcCB0aGUgbGl2ZSB1cGRhdGUgZGF0YSwgYW5k
CndlIG5lZWQgdG8gZG8gYSBmaXJzdCBwYXNzIG9mIHRoZSBsaXZlIHVwZGF0ZSBkYXRhIGJlZm9y
ZSB3ZSBwcmltZSB0aGUKaGVhcCBiZWNhdXNlIHdlIG5lZWQgdG8ga25vdyB3aGljaCBwYWdlcyBu
ZWVkIHRvIGJlIHByZXNlcnZlZC4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdt
d0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMgfCA4ICsrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggZGJh
OGMzZjBhMS4uZWEzZjQyM2I0YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysr
IGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE1NzIsNiArMTU3Miw4IEBAIHZvaWQgX19pbml0
IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAKICAgICBudW1hX2lu
aXRtZW1faW5pdCgwLCByYXdfbWF4X3BhZ2UpOwogCisgICAgdm1faW5pdCgpOworCiAgICAgaWYg
KCBsdV9ib290bWVtX3N0YXJ0ICkKICAgICB7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGltaXQg
PSB2aXJ0X3RvX21mbihIWVBFUlZJU09SX1ZJUlRfRU5EIC0gMSk7CkBAIC0xNjM1LDEyICsxNjM3
LDYgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKICAgICAgICAgZW5kX2Jvb3RfYWxsb2NhdG9yKCk7CiAKICAgICBzeXN0ZW1fc3RhdGUgPSBT
WVNfU1RBVEVfYm9vdDsKLSAgICAvKgotICAgICAqIE5vIGNhbGxzIGludm9sdmluZyBBQ1BJIGNv
ZGUgc2hvdWxkIGdvIGJldHdlZW4gdGhlIHNldHRpbmcgb2YKLSAgICAgKiBTWVNfU1RBVEVfYm9v
dCBhbmQgdm1faW5pdCgpIChvciBlbHNlIGFjcGlfb3Nfeyx1bn1tYXBfbWVtb3J5KCkKLSAgICAg
KiB3aWxsIGJyZWFrKS4KLSAgICAgKi8KLSAgICB2bV9pbml0KCk7CiAKICAgICBjb25zb2xlX2lu
aXRfcmluZygpOwogICAgIHZlc2FfaW5pdCgpOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
