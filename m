Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C761B52F9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:32:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGLu-0003Dh-I4; Tue, 17 Sep 2019 16:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGLt-0003DW-BC
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:29:17 +0000
X-Inumbo-ID: 4a86e6c0-d968-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a86e6c0-d968-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568737757;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=oRb8MtKEbrzEj9V2YWp6iFjmpeb/ajEJxlR0NbuttPY=;
 b=cefS43Uh0LcTbdTy6k3eLt9TZ2GXBgYvwOj5x5XmMY2yVaFX3hliLZ7z
 VVNd2H62tVHA8dGOKIvlvh8uSRafA5WoF8okdpLuQuEzHzdAopmoOYmBE
 LunMDIJORfhKIiWPTIn4hJlpC3hl6LA94q34gI2m4YRbL3kdZBU66AgLU Q=;
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
IronPort-SDR: nb+j20nFjSzTYkyl7eA4P0d7osr4FJ/C0MJ0rly7T5wQh2C8wrtY8ZGRSrkaIXVC59Ds7bB27a
 PiWFKdJ13Dcb7yyk308C9FdlPreWaREXY5KgNdg9jkxfpAy/6K/QRxLAtbNMotyqcIxztLsK4Y
 YbCwxguZ22ok6tBois765cwJEigR3Vst+HmGAnRPvVg0wFoFtpxTYWUof2KQkwiHOyeDg+XfNa
 dc8iMSr6IU+nlYH8P8WSz/WvHBpTCbPQU191E7Roie9TsNS6HZndCtKVBcf/a4IZzvVuRfCDVB
 7Tk=
X-SBRS: 2.7
X-MesageID: 5683475
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5683475"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.2491.325098.153285@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:28:43 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-2-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-2-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 01/15] libxl: Rename struct
 libxl_device_type to libxl__device_type
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDAxLzE1XSBsaWJ4bDogUmVuYW1lIHN0cnVj
dCBsaWJ4bF9kZXZpY2VfdHlwZSB0byBsaWJ4bF9fZGV2aWNlX3R5cGUiKToKPiBsaWJ4bF9fZGV2
aWNlX3R5cGUgaXMgaW50ZXJuYWwgdG8gbGlieGwsIHJlbmFtZSBpdCB0byB0aGUgaW50ZXJuYWwK
PiBvbmx5IHByZWZpeC4gQW5kIGVsaW1pbmF0ZSByZWR1bmRhbnQgJ3N0cnVjdCcga2V5d29yZCwg
aW4gYWNjb3JkIHdpdGgKPiB0aGUgY29kaW5nIHN0eWxlLgoKQWNrZWQtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
