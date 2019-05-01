Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E310770
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 13:20:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnFC-0001jj-Ke; Wed, 01 May 2019 11:17:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnFA-0001gi-1r
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:44 +0000
X-Inumbo-ID: bbe16ed4-6c02-11e9-843c-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbe16ed4-6c02-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:References:In-Reply-To:
 Message-Id:Date:Subject:To:From:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0uzhdEgCHmkBXOnlYFszNL13fpDQ+zr287GzwBDOIO8=; b=okOMnDngTouZPJfb2YLtdN7rf
 gPVzdD8clfE3xlnmVfea7xYpBhvm1+CcRm80r4+S+Di5Cp544DnRJG/9g7+vkyNwZ8Oral4AxHC21
 6T1ytLuRKkB4XUZ+706ca3kAx0Pq1Y+Ia7CBO1/wAf6aOcfjcagwa4BuUTh5XeOgXN84ZXmIcI8z0
 W43ccX11ht6vRg0vG0uV+JTxwNtAc1i67yWiqmvnrOjYApOef5OPyfXrON+YYLun1yfOQ2D1ebrQP
 s3l0CnbfKnFzICouCJ7nUCyVeNzmurRwDSP+bLmComwkz5dJ8+hK8rYGom/bolvXNbEftBpvQX31V
 lIa+sQInQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLnF6-0008Rt-6H
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLnF5-0030Nx-AB
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:17:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 12:17:35 +0100
Message-Id: <ec9a721d769910ff5e9d77caf036fb931a32ff1f.1556708226.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 3/7] x86/boot: Only jump into low trampoline
 code for real-mode boot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCklmIHRoZSBuby1yZWFs
LW1vZGUgZmxhZyBpcyBzZXQsIGRvbid0IGdvIHRoZXJlIGF0IGFsbC4gVGhpcyBpcyBhIHByZWx1
ZGUKdG8gbm90IGV2ZW4gcHV0dGluZyBpdCB0aGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0KIHhlbi9h
cmNoL3g4Ni9ib290L2hlYWQuUyAgICAgICB8IDEwICsrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9i
b290L3RyYW1wb2xpbmUuUyB8ICA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFk
LlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKaW5kZXggZGIxOWFjNmZkOC4uN2MzMGRlMzY3
MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4
Ni9ib290L2hlYWQuUwpAQCAtNzM0LDcgKzczNCwxNyBAQCB0cmFtcG9saW5lX3NldHVwOgogICAg
ICAgICAvKiBTd2l0Y2ggdG8gbG93LW1lbW9yeSBzdGFjayB3aGljaCBsaXZlcyBhdCB0aGUgZW5k
IG9mIHRyYW1wb2xpbmUgcmVnaW9uLiAqLwogICAgICAgICBtb3YgICAgIHN5bV9mcyh0cmFtcG9s
aW5lX3BoeXMpLCVlZGkKICAgICAgICAgbGVhICAgICBUUkFNUE9MSU5FX1NQQUNFK1RSQU1QT0xJ
TkVfU1RBQ0tfU1BBQ0UoJWVkaSksJWVzcAorICAgICAgICBjbXBiICAgICQwLCBzeW1fZnMoc2tp
cF9yZWFsbW9kZSkKKyAgICAgICAganogICAgICAxZgorICAgICAgICAvKiBJZiBuby1yZWFsLW1v
ZGUsIGp1bXAgc3RyYWlnaHQgdG8gdHJhbXBvbGluZV9wcm90bW9kZV9lbnRyeSAqLworICAgICAg
ICBsZWEgICAgIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnktdHJhbXBvbGluZV9zdGFydCglZWRp
KSwlZWF4CisgICAgICAgIC8qIEVCWCA9PSAwIGluZGljYXRlcyB3ZSBhcmUgdGhlIEJQIChCb290
IFByb2Nlc3NvcikuICovCisgICAgICAgIHhvciAgICAgJWVieCwlZWJ4CisgICAgICAgIGptcCAg
ICAgMmYKKzE6CisgICAgICAgIC8qIEdvIHZpYSAxNi1iaXQgY29kZSBpbiB0cmFtcG9saW5lX2Jv
b3RfY3B1X2VudHJ5ICovCiAgICAgICAgIGxlYSAgICAgdHJhbXBvbGluZV9ib290X2NwdV9lbnRy
eS10cmFtcG9saW5lX3N0YXJ0KCVlZGkpLCVlYXgKKzI6CiAgICAgICAgIHB1c2hsICAgJEJPT1Rf
Q1MzMgogICAgICAgICBwdXNoICAgICVlYXgKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jv
b3QvdHJhbXBvbGluZS5TIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCmluZGV4IDU1
ODhjNzk4NmEuLmRmMGZmZDUwMTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1w
b2xpbmUuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKQEAgLTE4Nyw5ICsx
ODcsNiBAQCBzdGFydDY0OgogCiAgICAgICAgIC5jb2RlMzIKIHRyYW1wb2xpbmVfYm9vdF9jcHVf
ZW50cnk6Ci0gICAgICAgIGNtcGIgICAgJDAsYm9vdHN5bV9yZWwoc2tpcF9yZWFsbW9kZSw1KQot
ICAgICAgICBqbnogICAgIC5Mc2tpcF9yZWFsbW9kZQotCiAgICAgICAgIC8qIExvYWQgcHNldWRv
LXJlYWwtbW9kZSBzZWdtZW50cy4gKi8KICAgICAgICAgbW92ICAgICAkQk9PVF9QU0VVRE9STV9E
UywlZWF4CiAgICAgICAgIG1vdiAgICAgJWVheCwlZHMKQEAgLTI2OSw3ICsyNjYsNiBAQCB0cmFt
cG9saW5lX2Jvb3RfY3B1X2VudHJ5OgogICAgICAgICBtb3YgICAgICVlYXgsJWdzCiAgICAgICAg
IG1vdiAgICAgJWVheCwlc3MKIAotLkxza2lwX3JlYWxtb2RlOgogICAgICAgICAvKiBFQlggPT0g
MCBpbmRpY2F0ZXMgd2UgYXJlIHRoZSBCUCAoQm9vdCBQcm9jZXNzb3IpLiAqLwogICAgICAgICB4
b3IgICAgICVlYngsJWVieAogCi0tIAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
