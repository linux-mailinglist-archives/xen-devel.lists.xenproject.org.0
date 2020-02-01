Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA714F56F
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:35:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgiw-0006Eo-JV; Sat, 01 Feb 2020 00:33:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YQT+=3V=merlin.srs.infradead.org=batv+14355fafd9c313d768ee+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgiv-0006Dt-2u
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:33:21 +0000
X-Inumbo-ID: 6aebf616-448a-11ea-ad98-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aebf616-448a-11ea-ad98-bc764e2007e4;
 Sat, 01 Feb 2020 00:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bCC1czvIgY7PeMeaG5CbgEmu47OJWNzV1dFnhwyx6o=; b=fjdh81HBbuGIUWbLgEJMmNX8n5
 uMOU+EcN5hcjHntnUKM3Fr6y+TWG4aZdowrQltKhwbP1vLojAn7c4UYJjAcGp/K573h+vCfJ5BMjK
 Nm4sPVJUNLHRXCfg3A5vFHMTnbPN7vVkZOiSq9S50jeW402xalvVjjbWmYjzRKat6usN9hj5XTifJ
 APOfvIP/ahzPFi2kiRwE8MbrWUjFO5ggxrIj9F9VTMHKcVAOBfM7aRoOEedjrjSQrr5jOZeAhRe5a
 /sQkU1DNMoHIfL2+MqlsWHvl5RBPP9VZnxNK7M5+lKkhbdW8CBG/aXb2S1LjDDY4McO74VRc5Vtdm
 B7hLRQFA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgie-0007nz-2s; Sat, 01 Feb 2020 00:33:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixgid-009ulB-8s; Sat, 01 Feb 2020 00:33:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Sat,  1 Feb 2020 00:33:00 +0000
Message-Id: <20200201003303.2363081-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 5/8] xen/vmap: allow vmap() to be called during
 early boot
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClNpZ25lZC1vZmYtYnk6
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2NvbW1vbi92bWFw
LmMgfCAyMyArKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92bWFwLmMg
Yi94ZW4vY29tbW9uL3ZtYXAuYwppbmRleCAzNzkyMmY3MzViLi44MzQzNDYwNzk0IDEwMDY0NAot
LS0gYS94ZW4vY29tbW9uL3ZtYXAuYworKysgYi94ZW4vY29tbW9uL3ZtYXAuYwpAQCAtNjgsNyAr
NjgsNyBAQCBzdGF0aWMgdm9pZCAqdm1fYWxsb2ModW5zaWduZWQgaW50IG5yLCB1bnNpZ25lZCBp
bnQgYWxpZ24sCiAgICAgc3Bpbl9sb2NrKCZ2bV9sb2NrKTsKICAgICBmb3IgKCA7IDsgKQogICAg
IHsKLSAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7CisgICAgICAgIG1mbl90IG1mbjsKIAog
ICAgICAgICBBU1NFUlQodm1fbG93W3RdID09IHZtX3RvcFt0XSB8fCAhdGVzdF9iaXQodm1fbG93
W3RdLCB2bV9iaXRtYXAodCkpKTsKICAgICAgICAgZm9yICggc3RhcnQgPSB2bV9sb3dbdF07IHN0
YXJ0IDwgdm1fdG9wW3RdOyApCkBAIC0xMDMsOSArMTAzLDE3IEBAIHN0YXRpYyB2b2lkICp2bV9h
bGxvYyh1bnNpZ25lZCBpbnQgbnIsIHVuc2lnbmVkIGludCBhbGlnbiwKICAgICAgICAgaWYgKCB2
bV90b3BbdF0gPj0gdm1fZW5kW3RdICkKICAgICAgICAgICAgIHJldHVybiBOVUxMOwogCi0gICAg
ICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwotICAgICAgICBpZiAoICFwZyAp
Ci0gICAgICAgICAgICByZXR1cm4gTlVMTDsKKyAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPT0g
U1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQorICAgICAgICB7CisgICAgICAgICAgICBtZm4gPSBhbGxv
Y19ib290X3BhZ2VzKDEsIDEpOworICAgICAgICB9CisgICAgICAgIGVsc2UKKyAgICAgICAgewor
ICAgICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoTlVM
TCwgMCk7CisgICAgICAgICAgICBpZiAoICFwZyApCisgICAgICAgICAgICAgICAgcmV0dXJuIE5V
TEw7CisgICAgICAgICAgICBtZm4gPSBwYWdlX3RvX21mbihwZyk7CisgICAgICAgIH0KIAogICAg
ICAgICBzcGluX2xvY2soJnZtX2xvY2spOwogCkBAIC0xMTMsNyArMTIxLDcgQEAgc3RhdGljIHZv
aWQgKnZtX2FsbG9jKHVuc2lnbmVkIGludCBuciwgdW5zaWduZWQgaW50IGFsaWduLAogICAgICAg
ICB7CiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZhID0gKHVuc2lnbmVkIGxvbmcpdm1fYml0
bWFwKHQpICsgdm1fdG9wW3RdIC8gODsKIAotICAgICAgICAgICAgaWYgKCAhbWFwX3BhZ2VzX3Rv
X3hlbih2YSwgcGFnZV90b19tZm4ocGcpLCAxLCBQQUdFX0hZUEVSVklTT1IpICkKKyAgICAgICAg
ICAgIGlmICggIW1hcF9wYWdlc190b194ZW4odmEsIG1mbiwgMSwgUEFHRV9IWVBFUlZJU09SKSAp
CiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgY2xlYXJfcGFnZSgodm9pZCAqKXZhKTsK
ICAgICAgICAgICAgICAgICB2bV90b3BbdF0gKz0gUEFHRV9TSVpFICogODsKQEAgLTEyMyw3ICsx
MzEsMTAgQEAgc3RhdGljIHZvaWQgKnZtX2FsbG9jKHVuc2lnbmVkIGludCBuciwgdW5zaWduZWQg
aW50IGFsaWduLAogICAgICAgICAgICAgfQogICAgICAgICB9CiAKLSAgICAgICAgZnJlZV9kb21o
ZWFwX3BhZ2UocGcpOworICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVfZWFy
bHlfYm9vdCApCisgICAgICAgICAgICBpbml0X2Jvb3RfcGFnZXMobWZuX3RvX21hZGRyKG1mbiks
IG1mbl90b19tYWRkcihtZm4pICsgUEFHRV9TSVpFKTsKKyAgICAgICAgZWxzZQorICAgICAgICAg
ICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7CiAKICAgICAgICAgaWYgKCBz
dGFydCA+PSB2bV90b3BbdF0gKQogICAgICAgICB7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
