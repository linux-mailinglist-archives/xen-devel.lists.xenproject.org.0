Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C874F14DECE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:17:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCSu-0004nL-4o; Thu, 30 Jan 2020 16:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwoG=3T=merlin.srs.infradead.org=batv+f9651308fc69d1c188a8+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCSr-0004ll-O9
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:45 +0000
X-Inumbo-ID: 78c91d78-437b-11ea-b211-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78c91d78-437b-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+EvjtNtQ/Zt64mtfAp1QVm2tBB6SY7x7nrE15LbB/oA=; b=X7iQOJbgC6Oc8YF9TDnqAqDLnt
 eZ4f1UjLXYkpmDxs4D7utHH3PylsHwl15lL/hn2FRbtv5QI1XnZuFMGhak4krfJYl4RI2/Tm8WGRD
 VKAxzgllworT5oEoIEmXu4zFrDG5cEIMPZJ4VlGRvniIsQK3nqAHlF8X6K+lw5whh/HPD8uIfmUb0
 X7AGnyUh9Hf78QkfrWBK8kTCnA7NjL2yz1eNfHKNw/iWHdVbZoyefc6ub4Kzx5oRXsxXQgtlkHKyC
 FzTtWKcVOvo+sfIXnfr2+1x6ltQ8mwz7fUylFeJv8em+ugfM8nvXDdauJMo7h2Zt3CWUQOJybJuFY
 RNNDQwhw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005To-D6; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009keH-JI; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:27 +0000
Message-Id: <20200130161330.2324143-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 19/22] Add shell of lu_reserve_pages()
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoaXMgY3VycmVudGx5
IG9ubHkgaXRlcmF0ZXMgb3ZlciB0aGUgcmVjb3JkcyBhbmQgcHJpbnRzIHRoZSB2ZXJzaW9uIG9m
ClhlbiB0aGF0IHdlJ3JlIGxpdmUgdXBkYXRpbmcgZnJvbS4KCkluIHRoZSBmdWxsbmVzcyBvZiB0
aW1lLCBpdCB3aWxsIGFsc28gcmVzZXJ2ZSB0aGUgcGFnZXMgcGFzc2VkIG92ZXIgYXMKTTJQIGFz
IHdlbGwgYXMgdGhlIHBhZ2VzIGJlbG9uZ2luZyB0byBwcmVzZXJ2ZWQgZG9tYWlucy4KClNpZ25l
ZC1vZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2Fy
Y2gveDg2L3NldHVwLmMgICAgfCAgMiArKwogeGVuL2NvbW1vbi9sdS9NYWtlZmlsZSAgfCAgMiAr
LQogeGVuL2NvbW1vbi9sdS9yZXN0b3JlLmMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vbHUuaCAgICB8IDE4ICsrKysrKysrKysrKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9sdS9yZXN0b3JlLmMKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IGVlYTY3MGUwM2Iu
LmY3ODk3MTNiMWIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCkBAIC0xNjAzLDYgKzE2MDMsOCBAQCB2b2lkIF9faW5pdCBub3JldHVy
biBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgIGlmICggbHVfYnJlYWRjcnVt
Yl9waHlzICkKICAgICB7CiAgICAgICAgIGx1X3N0cmVhbV9tYXAoJmx1X3N0cmVhbSwgbHVfbWZu
bGlzdF9waHlzLCBsdV9ucl9wYWdlcyk7CisKKyAgICAgICAgbHVfcmVzZXJ2ZV9wYWdlcygmbHVf
c3RyZWFtKTsKICAgICB9CiAKICAgICBpZiAoIGx1X2Jvb3RtZW1fc3RhcnQgKQpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9sdS9NYWtlZmlsZSBiL3hlbi9jb21tb24vbHUvTWFrZWZpbGUKaW5kZXgg
N2I3ZDk3NWY2NS4uNTkyYzcyZTFlYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9sdS9NYWtlZmls
ZQorKysgYi94ZW4vY29tbW9uL2x1L01ha2VmaWxlCkBAIC0xICsxIEBACi1vYmoteSArPSBzdHJl
YW0ubyBzYXZlLm8KK29iai15ICs9IHN0cmVhbS5vIHNhdmUubyByZXN0b3JlLm8KZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vbHUvcmVzdG9yZS5jIGIveGVuL2NvbW1vbi9sdS9yZXN0b3JlLmMKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZjUyYmI2NjBkMgotLS0gL2Rldi9u
dWxsCisrKyBiL3hlbi9jb21tb24vbHUvcmVzdG9yZS5jCkBAIC0wLDAgKzEsMzQgQEAKKyNpbmNs
dWRlIDx4ZW4vdHlwZXMuaD4KKyNpbmNsdWRlIDx4ZW4vdm1hcC5oPgorI2luY2x1ZGUgPHhlbi9s
dS5oPgorI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgorI2luY2x1ZGUgPHhlbi9sdS5oPgorCisjaW5j
bHVkZSA8cHVibGljL21pZ3JhdGlvbl9zdHJlYW0uaD4KKwordm9pZCBsdV9yZXNlcnZlX3BhZ2Vz
KHN0cnVjdCBsdV9zdHJlYW0gKnN0cmVhbSkKK3sKKyAgICBzdHJ1Y3QgbXJfcmhkciAqaGRyOwor
CisgICAgd2hpbGUgKCAoaGRyID0gbHVfbmV4dF9yZWNvcmQoc3RyZWFtKSkgJiYgaGRyLT50eXBl
ICE9IFJFQ19UWVBFX0VORCApCisgICAgeworICAgICAgICBpZiAoIGhkci0+dHlwZSA9PSBSRUNf
VFlQRV9MVV9WRVJTSU9OICYmCisgICAgICAgICAgICAgaGRyLT5sZW5ndGggPT0gc2l6ZW9mKHN0
cnVjdCBtcl9sdV92ZXJzaW9uKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIHN0cnVjdCBtcl9s
dV92ZXJzaW9uICp2ZXJzID0gTFVfUkVDX0RBVEEoaGRyKTsKKworICAgICAgICAgICAgcHJpbnRr
KCJMaXZlIHVwZGF0ZSBmcm9tIFhlbiAlZC4lZFxuIiwKKyAgICAgICAgICAgICAgICAgICB2ZXJz
LT54ZW5fbWFqb3IsIHZlcnMtPnhlbl9taW5vcik7CisgICAgICAgIH0KKyAgICB9Cit9CisKKy8q
CisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0Qi
CisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQtdGFicy1t
b2RlOiBuaWwKKyAqIEVuZDoKKyAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2x1Lmgg
Yi94ZW4vaW5jbHVkZS94ZW4vbHUuaAppbmRleCBjMDIyNjhlNDE0Li41ODhmMmRkMTM3IDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbHUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbHUuaApA
QCAtNSw2ICs1LDggQEAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KICNpbmNsdWRlIDx4ZW4vbW0u
aD4KIAorI2luY2x1ZGUgPHB1YmxpYy9taWdyYXRpb25fc3RyZWFtLmg+CisKICNkZWZpbmUgTElW
RV9VUERBVEVfTUFHSUMgICAgICAgICgweDRjNjk3NjY1NTU3MDY0NjFVTCAmIFBBR0VfTUFTSykK
IAogc3RydWN0IGx1X3N0cmVhbSB7CkBAIC0yOCw2ICszMCwyMiBAQCBzdHJ1Y3Qga2V4ZWNfaW1h
Z2U7CiBpbnQgbHVfc2F2ZV9hbGwoc3RydWN0IGtleGVjX2ltYWdlICppbWFnZSk7CiAKIHZvaWQg
bHVfc3RyZWFtX21hcChzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0sIHVuc2lnbmVkIGxvbmcgbWZu
c19waHlzLCBpbnQgbnJfcGFnZXMpOwordm9pZCBsdV9yZXNlcnZlX3BhZ2VzKHN0cnVjdCBsdV9z
dHJlYW0gKnN0cmVhbSk7CisKKy8qIFBvaW50ZXIgdG8gdGhlIGRhdGEgaW1tZWRpYXRlbHkgZm9s
bG93aW5nIGEgcmVjb3JkIGhlYWRlciAqLworI2RlZmluZSBMVV9SRUNfREFUQShoZHIpICgodm9p
ZCAqKSYoaGRyKVsxXSkKKworc3RhdGljIGlubGluZSBzdHJ1Y3QgbXJfcmhkciAqbHVfbmV4dF9y
ZWNvcmQoc3RydWN0IGx1X3N0cmVhbSAqc3RyZWFtKQoreworICAgIHN0cnVjdCBtcl9yaGRyICpo
ZHIgPSAoc3RydWN0IG1yX3JoZHIgKikoc3RyZWFtLT5kYXRhICsgc3RyZWFtLT5sYXN0X2hkcik7
CisKKyAgICBpZiAoc3RyZWFtLT5sZW4gPCBzdHJlYW0tPmxhc3RfaGRyICsgc2l6ZW9mKCpoZHIp
IHx8CisgICAgICAgIHN0cmVhbS0+bGVuIDwgc3RyZWFtLT5sYXN0X2hkciArIHNpemVvZigqaGRy
KSArIGhkci0+bGVuZ3RoKQorICAgICAgICByZXR1cm4gTlVMTDsKKworICAgIHN0cmVhbS0+bGFz
dF9oZHIgKz0gc2l6ZW9mKCpoZHIpICsgUk9VTkRVUChoZHItPmxlbmd0aCwgMTw8UkVDX0FMSUdO
X09SREVSKTsKKyAgICByZXR1cm4gaGRyOworfQogCiAjZW5kaWYgLyogX19YRU5fTFVfSF9fICov
CiAKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
