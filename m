Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA6B53AA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGvl-0003HE-Cb; Tue, 17 Sep 2019 17:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGvj-0003Gm-5E
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:06:19 +0000
X-Inumbo-ID: 76f3eb0e-d96d-11e9-978d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76f3eb0e-d96d-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739978;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=t6IoZz6Y7x9h4lESdoKcoY/tSgqVnnTVayjY4FDR/4M=;
 b=cbkOpp5I1ivPD+t/SD/Ws6GUCXhFluh/8BUa2aPfNExFJ9K2hrncXdx8
 R4YP1hz9rzqfiilsLGmwPHYj6Y1exTdiVg3qceKtkqENBk/5npSxN6RdN
 8oqtgwGETdoPVz+e2cEZ+qS3lAMavkrsdlPgw9lb13zYhob4bo0wHlXGE Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BTvPzDsQCHC423vvBbyx4vmUnBdQbq9zurolfx8GXxNjoLnsmzJo7m6vlLa9uj7GDDsA3Xsdxn
 8Bqh9mmxE6p2/dJmWTeuzHbs9FGVCJy/KMfvoHkCabsu9IHjANRdHTaP6aUhayAlXjo5vqKDUq
 mCNvFD37YadMIiBG/rt+1UaUQ66WpaNJ0mHjO46W9D+RZqAAuw9N84/B+u4/5coSXEx4LSA5yP
 3xuaxEkdgdU21YtmiviMfd8f3wzjBJ7zH2QfJRT6d1406Xh39DSjVvjHWr+SUM10qssGEQOF4i
 ieI=
X-SBRS: 2.7
X-MesageID: 5936648
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5936648"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4738.377891.419579@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:06:10 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-17-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-17-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 16/35] libxl: Inline do_usbdev_remove into
 libxl__device_usbdev_remove
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE2LzM1XSBsaWJ4bDogSW5saW5lIGRvX3Vz
YmRldl9yZW1vdmUgaW50byBsaWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUiKToKPiBIYXZpbmcg
dGhlIGZ1bmN0aW9uIGRvX3VzYmRldl9yZW1vdmUgbWFrZXMgaXQgaGFyZGVyIHRvIGFkZCBhc3lu
Y2hyb25vdXMKPiBjYWxscyBpbnRvIGl0LiBNb3ZlIGl0cyBib2R5IGJhY2sgaW50byBsaWJ4bF9f
ZGV2aWNlX3VzYmRldl9yZW1vdmUgYW5kCj4gYWRqdXN0IHRoZSBsYXR0ZXIgYXMgdGhlcmUgYXJl
IG5vIHJlYXNvbiB0byBoYXZlIGEgc2VwYXJhdGVkIGZ1bmN0aW9uLgoKQWNrZWQtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
