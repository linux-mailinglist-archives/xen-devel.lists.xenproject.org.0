Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0742B5376
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:57:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGkm-0000tM-NE; Tue, 17 Sep 2019 16:55:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGkl-0000tE-O1
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:54:59 +0000
X-Inumbo-ID: e1efe752-d96b-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1efe752-d96b-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739299;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ukkhatIkeElldpJy8CND3eceXXXxnlZm6Wy2T8XwKQ4=;
 b=X5bSZlSnvHqrPZnNbFa+qUsnJcK2ItrjWYbfiQIy1x8GDTOR8pdDTiIO
 6UJZvLMuCPG9gJg6s34I7xFsh50zRGIoafh5Mo+iSweUfssad2yuIRkIU
 ukKeIEoDS/MTuiwl+8qSyA4AMHyjxCpNYG+TCBY3rsQspQNZQQ3Z2oEW6 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ecSklw/emtChF+RWSmnE/VmrYqZFWRm/wABddC4OaFEIa2l+l3RINQLCkQUmxTLpMK8CQCbRX0
 dIKE6M7kkloNvCwm4LgcPNBbpPx0bTyrUpKHgtkCIO0eUn64nkKNIMso57ZqP5fHbvoXn3rcBZ
 PXuiavXdfO8SfNmSX9ks470FnSM/1orBM4A3fxxCDcYHfjD09xyAH5Blsk8YzX6IwHmafA2gIl
 h2xSOl30cRSZnQs+qaLdKpIw/k+0cQz2YPbUk3tG52Z0e/IW96MYhZti85hYfFNSr5BUuqRw56
 5pE=
X-SBRS: 2.7
X-MesageID: 5885668
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5885668"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4059.106814.2658@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:54:51 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-8-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-8-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 07/35] libxl: Move "qmp_initializations" to
 libxl_dm
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA3LzM1XSBsaWJ4bDogTW92ZSAicW1wX2lu
aXRpYWxpemF0aW9ucyIgdG8gbGlieGxfZG0iKToKPiBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9u
cyBpcyBwYXJ0IG9mIHRoZSBkZXZpY2UgZG9tYWluIHN0YXJ0dXAsIGl0Cj4gcXVlcmllcyBpbmZv
cm1hdGlvbiBhYm91dCB0aGUgbmV3bHkgc3Bhd25lZCBRRU1VIGFuZCBkbyBzb21lCj4gcG9zdC1z
dGFydHVwIGNvbmZpZ3VyYXRpb24uIFNvIHRoZSBmdW5jdGlvbiBjYWxsIGRvZXNuJ3QgYmVsb25n
IHRvIHRoZQo+IGdlbmVyYWwgZG9tYWluIGNyZWF0aW9uLCBidXQgb25seSB0byB0aGUgZGV2aWNl
IG1vZGVsIHBhcnQgb2YgdGhlCj4gcHJvY2VzcywgdGh1cyB0aGUgY2FsbCBiZWxvbmcgdG8gbGli
eGxfZG0gYW5kIGxpYnhsX19kbV9zcGF3bl9zdGF0ZSdzCj4gbWFjaGluZXJ5Lgo+IAo+IFdlIG1v
dmUgdGhlIGNhbGwgYWhlYWQgb2YgYSBmb2xsb3ctdXAgcGF0Y2ggd2hpY2ggZ29pbmcgdG8gImlu
bGluZSIKPiBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucy4KCkFja2VkLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
