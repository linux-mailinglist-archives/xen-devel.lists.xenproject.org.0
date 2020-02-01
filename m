Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036D14F571
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:35:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgim-00068c-Ta; Sat, 01 Feb 2020 00:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jGrC=3V=bombadil.srs.infradead.org=batv+4ea019283916f422e4b4+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgil-00068C-2j
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:33:11 +0000
X-Inumbo-ID: 690f4b7c-448a-11ea-8396-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 690f4b7c-448a-11ea-8396-bc764e2007e4;
 Sat, 01 Feb 2020 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNt82ToGZTbiQmLWphlDTKMwMKPPJsJCzyiuyVo3of4=; b=XPXbANAX5EkzvwMZXCL6YQWqFT
 UwQKHjnRbQhYzz6TzL6iT0FomQOYie7PrhlRwEXQgbact2p8ZGcEgQkYCs/N5xYTsmYqhvgO8Rwyv
 eSJsPqMPk3KPFzrtZXaGj3OdYv0VWMjWCxj4zZc2ogY6SKoXFXIGlUQSE6tC+TpbjJxSuDHG+RgHA
 OQdifP35PbU4h2PPR+YfFvLf5v9WlVm5Ru4FBmy9aHDIaokHQnvl8wyVl7njv1x5iCeOSxEIp/jBP
 hk9d7gJ5IJbAelDhRX28AKMMSky6GUm5JLfUqhpXZel7dFWLLiRd0PSBTdXEahVfxFDeL9kPGnNAn
 QKOfB3iQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgie-0007N3-Gv; Sat, 01 Feb 2020 00:33:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixgid-009ulL-A1; Sat, 01 Feb 2020 00:33:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Sat,  1 Feb 2020 00:33:02 +0000
Message-Id: <20200201003303.2363081-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 7/8] x86/setup: simplify handling of initrdidx
 when no initrd present
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClJlbW92ZSBhIHRlcm5h
cnkgb3BlcmF0b3IgdGhhdCBtYWRlIG15IGJyYWluIGh1cnQuCgpSZXBsYWNlIGl0IHdpdGggc29t
ZXRoaW5nIHNpbXBsZXIgdGhhdCBtYWtlcyBpdCBzb21ld2hhdCBjbGVhcmVyIHRoYXQKdGhlIGNo
ZWNrIGZvciBpbml0cmRpZHggPCBtYmktPm1vZHNfY291bnQgaXMgYmVjYXVzZSBtYmktPm1vZHNf
Y291bnQKaXMgd2hhdCBmaW5kX2ZpcnN0X2JpdCgpIHdpbGwgcmV0dXJuIHdoZW4gaXQgZG9lc24n
dCBmaW5kIGFueXRoaW5nLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFt
YXpvbi5jby51az4KLS0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyB8IDkgKysrKystLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggNWY2OGEx
MzA4Zi4uMTAyMDllNmJmYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIv
eGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTY4Nyw3ICs2ODcsNyBAQCB2b2lkIF9faW5pdCBub3Jl
dHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgIGNoYXIgKmNtZGxpbmUs
ICprZXh0cmEsICpsb2FkZXI7CiAgICAgdW5zaWduZWQgaW50IGluaXRyZGlkeCwgbnVtX3Bhcmtl
ZCA9IDA7CiAgICAgbXVsdGlib290X2luZm9fdCAqbWJpOwotICAgIG1vZHVsZV90ICptb2Q7Cisg
ICAgbW9kdWxlX3QgKm1vZCwgKmluaXRyZCA9IE5VTEw7CiAgICAgdW5zaWduZWQgbG9uZyBucl9w
YWdlcywgcmF3X21heF9wYWdlLCBtb2R1bGVzX2hlYWRyb29tLCBtb2R1bGVfbWFwWzFdOwogICAg
IGludCBpLCBqLCBlODIwX3dhcm4gPSAwLCBieXRlcyA9IDA7CiAgICAgYm9vbCBhY3BpX2Jvb3Rf
dGFibGVfaW5pdF9kb25lID0gZmFsc2UsIHJlbG9jYXRlZCA9IGZhbHNlOwpAQCAtMTc5Myw2ICsx
NzkzLDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBt
YmlfcCkKICAgICAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgfD0gWEVOX1BST0NFU1NPUl9QTV9D
WDsKIAogICAgIGluaXRyZGlkeCA9IGZpbmRfZmlyc3RfYml0KG1vZHVsZV9tYXAsIG1iaS0+bW9k
c19jb3VudCk7CisgICAgaWYgKCBpbml0cmRpZHggPCBtYmktPm1vZHNfY291bnQgKQorICAgICAg
ICBpbml0cmQgPSBtb2QgKyBpbml0cmRpZHg7CisKICAgICBpZiAoIGJpdG1hcF93ZWlnaHQobW9k
dWxlX21hcCwgbWJpLT5tb2RzX2NvdW50KSA+IDEgKQogICAgICAgICBwcmludGsoWEVOTE9HX1dB
Uk5JTkcKICAgICAgICAgICAgICAgICJNdWx0aXBsZSBpbml0cmQgY2FuZGlkYXRlcywgcGlja2lu
ZyBtb2R1bGUgIyV1XG4iLApAQCAtMTgxNyw5ICsxODIwLDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1
cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgKiBXZSdyZSBnb2luZyB0
byBzZXR1cCBkb21haW4wIHVzaW5nIHRoZSBtb2R1bGUocykgdGhhdCB3ZSBzdGFzaGVkIHNhZmVs
eQogICAgICAqIGFib3ZlIG91ciBoZWFwLiBUaGUgc2Vjb25kIG1vZHVsZSwgaWYgcHJlc2VudCwg
aXMgYW4gaW5pdHJkIHJhbWRpc2suCiAgICAgICovCi0gICAgaWYgKCBjb25zdHJ1Y3RfZG9tMChk
b20wLCBtb2QsIG1vZHVsZXNfaGVhZHJvb20sCi0gICAgICAgICAgICAgICAgICAgICAgICAoaW5p
dHJkaWR4ID4gMCkgJiYgKGluaXRyZGlkeCA8IG1iaS0+bW9kc19jb3VudCkKLSAgICAgICAgICAg
ICAgICAgICAgICAgID8gbW9kICsgaW5pdHJkaWR4IDogTlVMTCwgY21kbGluZSkgIT0gMCkKKyAg
ICBpZiAoIGNvbnN0cnVjdF9kb20wKGRvbTAsIG1vZCwgbW9kdWxlc19oZWFkcm9vbSwgaW5pdHJk
LCBjbWRsaW5lKSAhPSAwICkKICAgICAgICAgcGFuaWMoIkNvdWxkIG5vdCBzZXQgdXAgRE9NMCBn
dWVzdCBPU1xuIik7CiAKICAgICBpZiAoIGNwdV9oYXNfc21hcCApCi0tIAoyLjIxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
