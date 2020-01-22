Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC72144E06
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:56:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBmb-00017w-Qj; Wed, 22 Jan 2020 08:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f6Rd=3L=merlin.srs.infradead.org=batv+5533599fc3e53c5fdf4f+5995+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iuBmZ-00016q-TZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:54:39 +0000
X-Inumbo-ID: be438876-3cf4-11ea-aecd-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be438876-3cf4-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9TwAYGYlcelt/F0YlAPGXX2H4Bo71w4f4pVagbaPYhM=; b=gVZ3r8JpLQ8Y8spelTlHomcOBP
 AWVkWXYYOZb11Y+mk3hK8f9x1uBsmtxqA0/6lk8N0zr66bMtCym0Kwn9k85RLEi3o1uRrPzPx6izQ
 svSWDaCt+wJvK5LjAQg/WN4OFn4pXANhHbs4nrHMKGr0316FaS2YWOOz/bXiHB1ihbP6qCUEiDczv
 wCyDY5GjoBTsWsiVqnlrjpJysJOZEGx1RMBvLIZVeCh9vThYM341mUO9zllryFxxX6upinypApOQT
 Im/BdElVJdQnXjzhh/V0fpUOdNaNTwUcHErzR3keo+oyPJSg84rbDnFQf7LmN2k6RvCVYUsA2CxyM
 5k5kpy5g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBlu-0002cs-6E; Wed, 22 Jan 2020 08:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1iuBlt-008mRx-Ca; Wed, 22 Jan 2020 08:53:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 08:53:54 +0000
Message-Id: <20200122085357.2092778-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122085357.2092778-1-dwmw2@infradead.org>
References: <6cbe16ae42ab806df513d359220212d4f01ce43d.camel@infradead.org>
 <20200122085357.2092778-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 11/14] Don't panic if no multiboot
 modules are provided on live update boot
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
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2FyY2gveDg2L3Nl
dHVwLmMgfCAxMSArKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCmluZGV4IDUyMTk0NmRjMjcuLmJkNjVkNmJmNWQgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC04ODMs
OSArODgzLDE0IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxv
bmcgbWJpX3ApCiAgICAgcHJpbnRrKCIgRm91bmQgJWQgRUREIGluZm9ybWF0aW9uIHN0cnVjdHVy
ZXNcbiIsCiAgICAgICAgICAgIGJvb3RzeW0oYm9vdF9lZGRfaW5mb19ucikpOwogCi0gICAgLyog
Q2hlY2sgdGhhdCB3ZSBoYXZlIGF0IGxlYXN0IG9uZSBNdWx0aWJvb3QgbW9kdWxlLiAqLwotICAg
IGlmICggIShtYmktPmZsYWdzICYgTUJJX01PRFVMRVMpIHx8IChtYmktPm1vZHNfY291bnQgPT0g
MCkgKQotICAgICAgICBwYW5pYygiZG9tMCBrZXJuZWwgbm90IHNwZWNpZmllZC4gQ2hlY2sgYm9v
dGxvYWRlciBjb25maWd1cmF0aW9uXG4iKTsKKyAgICBpZiAoIGx1X2RhdGEgKSB7CisgICAgICAg
IGlmICggKG1iaS0+ZmxhZ3MgJiBNQklfTU9EVUxFUykgJiYgKG1iaS0+bW9kc19jb3VudCA+IDAp
ICkKKyAgICAgICAgICAgIHBhbmljKCJNdWx0aWJvb3QgbW9kdWxlcyBwcm92aWRlZCB3aXRoIGxp
dmUgdXBkYXRlIGRhdGFcbiIpOworICAgIH0gZWxzZSB7CisgICAgICAgIC8qIENoZWNrIHRoYXQg
d2UgaGF2ZSBhdCBsZWFzdCBvbmUgTXVsdGlib290IG1vZHVsZS4gKi8KKyAgICAgICAgaWYgKCAh
KG1iaS0+ZmxhZ3MgJiBNQklfTU9EVUxFUykgfHwgKG1iaS0+bW9kc19jb3VudCA9PSAwKSApCisg
ICAgICAgICAgICBwYW5pYygiZG9tMCBrZXJuZWwgbm90IHNwZWNpZmllZC4gQ2hlY2sgYm9vdGxv
YWRlciBjb25maWd1cmF0aW9uXG4iKTsKKyAgICB9CiAKICAgICAvKiBDaGVjayB0aGF0IHdlIGRv
bid0IGhhdmUgYSBzaWxseSBudW1iZXIgb2YgbW9kdWxlcy4gKi8KICAgICBpZiAoIG1iaS0+bW9k
c19jb3VudCA+IHNpemVvZihtb2R1bGVfbWFwKSAqIDggKQotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
