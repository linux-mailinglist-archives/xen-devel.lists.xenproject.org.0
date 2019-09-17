Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87473B53A1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:07:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGvT-0003Aq-2H; Tue, 17 Sep 2019 17:06:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGvR-00039i-Hr
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:06:01 +0000
X-Inumbo-ID: 6c1b4b28-d96d-11e9-961b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c1b4b28-d96d-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739961;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qSFaroxXT/Gy4A8MYMF3GhN1OVeVhtiQvjBWAdzUDok=;
 b=iPhtaGuSrEdG+dOKfXcx6HVGTWV/8ECJVCxuJ/G1v/ci0KZ+IdWOU8Uo
 OJb49RQwdFUcZPwjfrdQ1FHLoVfQo5A9BAqTOAI0/3CYfKoWKpuJ6ptGf
 8vLjQ8YCOlewJozuOVzEPaufI6TZPRsDlkWD/JYuvU3DSsJubs15i9dhl s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QWCvKz5mdYBYhS4erFstfAhuIrNvG8BPLDX0WDYEVi87HK1471wAKH4wPqAE/2gXFvhvfeDR/w
 Mu3/zfR78XPgMTBzhnPpypDkGCRcOUoDklRq1Rql5relvu2SpjCDPcG4K/U0/n2SzQOdAFscJl
 JdqjpV1W9DP0YMu9wVu7o0rSjQTV8PdMOCO5GfTYOYFVlU1hWXAV4lh6hBKqtwTG2R6UBdnvNb
 O2DkgRrQ6Xq9MNyRo7B8hVSuU91KbxLee8ls0YiInys+/JkfHuV+/+4QHmW3chIMakA46or/H4
 6bg=
X-SBRS: 2.7
X-MesageID: 5682984
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5682984"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4720.193798.304132@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:05:52 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-16-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-16-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 15/35] libxl: Inline do_usbdev_add into
 libxl__device_usbdev_add
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE1LzM1XSBsaWJ4bDogSW5saW5lIGRvX3Vz
YmRldl9hZGQgaW50byBsaWJ4bF9fZGV2aWNlX3VzYmRldl9hZGQiKToKPiBIYXZpbmcgdGhlIGZ1
bmN0aW9uIGRvX3VzYmRldl9hZGQgbWFrZXMgaXQgaGFyZGVyIHRvIGFkZCBhc3luY2hyb25vdXMK
PiBjYWxscyBpbnRvIGl0LiBNb3ZlIGl0cyBib2R5IGJhY2sgaW50byBsaWJ4bF9fZGV2aWNlX3Vz
YmRldl9hZGQgYW5kCj4gYWRqdXN0IHRoZSBsYXR0ZXIgYXMgdGhlcmUgYXJlIG5vIHJlYXNvbiB0
byBoYXZlIGEgc2VwYXJhdGVkIGZ1bmN0aW9uLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
