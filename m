Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B964114F575
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:35:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgj1-0006Ht-Vc; Sat, 01 Feb 2020 00:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YQT+=3V=merlin.srs.infradead.org=batv+14355fafd9c313d768ee+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgj0-0006Gw-35
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:33:26 +0000
X-Inumbo-ID: 6aebf134-448a-11ea-ad98-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aebf134-448a-11ea-ad98-bc764e2007e4;
 Sat, 01 Feb 2020 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L2O922a9WZmlPredpfqcFeznyIaN0AM+ucM06nCll7Q=; b=No0A83rVbOVV5rEeJzoNIyXz3A
 Rcgg05mHipCfPSnQWuhaKEDyVDOH9ha7+kiGdycMjUMIj6UdNZhIeYOZUb8HEOSOhuc4fxOL3MLHT
 VXEdEZg/z6EL6FqQKqH/5PKps9MWqPF/MQ3m/tTkiF2oliajcDjn25p/OFX09lmuywhSUtAgOShJC
 H/Z39RMrAwvLipmeSPnUOYyduJYY3hXwQfXSZXFk54iozykrOrsIbE81gks6O11dLAZ09Dqfm9HNr
 PDxp0ms//Pht0aKPcqD3WKNxkjxKf472NwXL3jO18TWhjHL+9nBtWMKjEgW90s3sA2A8TcMQiBbdX
 p0gBhh7g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgie-0007ny-26; Sat, 01 Feb 2020 00:33:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixgid-009ul6-8J; Sat, 01 Feb 2020 00:33:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Sat,  1 Feb 2020 00:32:59 +0000
Message-Id: <20200201003303.2363081-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 4/8] xen/vmap: allow vm_init_type to be called
 during early_boot
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdhbnQgdG8gbW92ZSB2bV9p
bml0LCB3aGljaCBjYWxscyB2bV9pbml0X3R5cGUgdW5kZXIgdGhlIGhvb2QsIHRvCmVhcmx5IGJv
b3Qgc3RhZ2UuIEFkZCBhIHBhdGggdG8gZ2V0IHBhZ2UgZnJvbSBib290IGFsbG9jYXRvciBpbnN0
ZWFkLgoKQWRkIGFuIGVtYWNzIGJsb2NrIHRvIHRoYXQgZmlsZSB3aGlsZSBJIHdhcyB0aGVyZS4K
ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2Nv
bW1vbi92bWFwLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L3ZtYXAuYyBiL3hlbi9jb21tb24vdm1hcC5jCmluZGV4IGZhZWJjMWRkZjEuLjM3OTIyZjczNWIg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdm1hcC5jCisrKyBiL3hlbi9jb21tb24vdm1hcC5jCkBA
IC0zNCw5ICszNCwxNSBAQCB2b2lkIF9faW5pdCB2bV9pbml0X3R5cGUoZW51bSB2bWFwX3JlZ2lv
biB0eXBlLCB2b2lkICpzdGFydCwgdm9pZCAqZW5kKQogCiAgICAgZm9yICggaSA9IDAsIHZhID0g
KHVuc2lnbmVkIGxvbmcpdm1fYml0bWFwKHR5cGUpOyBpIDwgbnI7ICsraSwgdmEgKz0gUEFHRV9T
SVpFICkKICAgICB7Ci0gICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0gYWxsb2NfZG9taGVh
cF9wYWdlKE5VTEwsIDApOwotCi0gICAgICAgIG1hcF9wYWdlc190b194ZW4odmEsIHBhZ2VfdG9f
bWZuKHBnKSwgMSwgUEFHRV9IWVBFUlZJU09SKTsKKyAgICAgICAgbWZuX3QgbWZuOworICAgICAg
ICBpbnQgcmM7CisKKyAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2Vhcmx5
X2Jvb3QgKQorICAgICAgICAgICAgbWZuID0gYWxsb2NfYm9vdF9wYWdlcygxLCAxKTsKKyAgICAg
ICAgZWxzZQorICAgICAgICAgICAgbWZuID0gcGFnZV90b19tZm4oYWxsb2NfZG9taGVhcF9wYWdl
KE5VTEwsIDApKTsKKyAgICAgICAgcmMgPSBtYXBfcGFnZXNfdG9feGVuKHZhLCBtZm4sIDEsIFBB
R0VfSFlQRVJWSVNPUik7CisgICAgICAgIEJVR19PTihyYyk7CiAgICAgICAgIGNsZWFyX3BhZ2Uo
KHZvaWQgKil2YSk7CiAgICAgfQogICAgIGJpdG1hcF9maWxsKHZtX2JpdG1hcCh0eXBlKSwgdm1f
bG93W3R5cGVdKTsKQEAgLTMzMCwzICszMzYsMTMgQEAgdm9pZCB2ZnJlZSh2b2lkICp2YSkKICAg
ICAgICAgZnJlZV9kb21oZWFwX3BhZ2UocGcpOwogfQogI2VuZGlmCisKKy8qCisgKiBMb2NhbCB2
YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2lj
LW9mZnNldDogNAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAq
IEVuZDoKKyAqLwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
