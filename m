Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B57ADB32
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KgF-0001Ba-ML; Mon, 09 Sep 2019 14:30:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7KgE-0001BL-2U
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:30:10 +0000
X-Inumbo-ID: 5329a2e6-d30e-11e9-a337-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5329a2e6-d30e-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568039410;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Jo5cFt0zcv4LDcPm69gC3raHh4p9pYJlOb5VupXq+yE=;
 b=M6JcsVGC28f0SahcGpxP8cjaUCLFaLhVlHoOkKT5gaqqyrafgOw3ZDEE
 rg3m9JtfzkEh2XaqZ1uh2AxDrNDvlo4nHZLOXPKZMMzISOoftNCjkY2Fn
 AY4J4x2LJ73WN2cObDR1jvMXr/CnYNcJrvu2JRLfVEO0t5X6agE1l9zyc 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tcsFABwgzK8O+ev7Ye0hgr0bxomszozRQb1CplJxCaQsW1jov0kTQ/mIgR3lidEd6axgQWN2mI
 wfj8ZdEiX9TXn8euqOWspXUdQs4yEs3xr10Dy1bk2CIl2M5CVUdr+yYhNt3v8JMrzb+H2znlO9
 uYQPYW1RUGRIGxiBg0+zc3Zu3jPbi9SPPpECrJ6ubjkE6NQJcNgth09s3mx0SWZSoWlBQat9xW
 sgxcHNXMOWdPTjk9CQK8Q+ZY3dhvoTCTMsfGQzG4K5XqRbRAHBZeOt+xVHfUk0s339N6pKGyOL
 14Q=
X-SBRS: 2.7
X-MesageID: 5323764
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5323764"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23926.25040.382625.960666@mariner.uk.xensource.com>
Date: Mon, 9 Sep 2019 15:29:36 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20190909134701.12477-1-andrew.cooper3@citrix.com>
References: <20190906143021.28261-3-roger.pau@citrix.com>
 <20190909134701.12477-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] fixup sysctl/libxl: choose a sane default
 for HAP
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
Cc: Rob Hoes <Rob.Hoes@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIGZpeHVwIHN5c2N0bC9saWJ4bDogY2hvb3Nl
IGEgc2FuZSBkZWZhdWx0IGZvciBIQVAiKToKPiBUaGlzIGRlbHRhIHdhbnRzIGZvbGRpbmcgdG8g
a2VlcCB0aGUgT2NhbWwgc3R1YnMgaW4gbGluZS4KCkduYWdoLgoKQWNrZWQtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
