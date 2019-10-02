Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A7C891F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFeDX-0000kR-P6; Wed, 02 Oct 2019 12:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=moxi=X3=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1iFeDW-0000k2-Du
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 12:58:54 +0000
X-Inumbo-ID: 62e4f84e-e514-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 62e4f84e-e514-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570021133;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=imGmHzaC70nAlrkr6vl1IfUEQx0P+ECholmi26YGgH8=;
 b=LAhbhwD8yx6MJRAwqdwXV1B3q41u0E3+Se2YPwIp3+rk0qw6FUKRXWUu
 Qtpq8KnD2Gy9SO2cyX7DEPGkPyGemym8QwXEv9RqdB4ul+8BgUOAT1YTw
 bwD3dWk+LZc2Vg4IKaX7XGMDuFex9Bn+anT3swFBNS1ZROpEkzhX+bJYC k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5Y4GjvmGod/nLQXqfM45zf14uVBperySKu4D9UgrIKb2ltvs6+4wEKRY05QNpv3Jqvg92xU/E5
 hOWKIeZGDQZRUT8MQootk8LAozPKpfmkq1ieQ6JG5HeUO4VaXRCevVrQVHn0a4UgZ3DY5t7TYS
 IhTJp0HXutyuN50Hkojy8Lkg0eD42ifH8Eb/i9cNl8ABPUTFZnxvlFLFyng7PgpxJKx1oDirsJ
 kUc+7P/tef78M5IXwBvlrWOcxPEh0EFD6vW3zsBPA4rM0dMA9TDSLCqv8+3PSsWgPeUOQVQtCW
 rOk=
X-SBRS: 2.7
X-MesageID: 6721375
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,574,1559534400"; 
   d="scan'208";a="6721375"
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2] libxl: wait for the ack when issuing power control
 requests
Thread-Index: AQHVeGwSoGs2nUAQcU2NNaCYF8MuKqdHL+SA
Date: Wed, 2 Oct 2019 12:58:50 +0000
Message-ID: <6460EFE3-72AC-4EE0-8E6B-71057B876D1F@citrix.com>
References: <20191001152233.55491-1-roger.pau@citrix.com>
In-Reply-To: <20191001152233.55491-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <900A6DEDC9350B459C39A7B77E94FD2E@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] libxl: wait for the ack when issuing
 power control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEgT2N0IDIwMTksIGF0IDE2OjIyLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiAKPiB0b29scy9vY2FtbC9saWJzL3hsL3hlbmxpZ2h0Lm1sLmlu
ICAgfCAgNCArLQo+IHRvb2xzL29jYW1sL2xpYnMveGwveGVubGlnaHQubWxpLmluICB8ICA0ICst
Cj4gdG9vbHMvb2NhbWwvbGlicy94bC94ZW5saWdodF9zdHVicy5jIHwgMTggKysrKy0tCgpBY2tl
ZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
