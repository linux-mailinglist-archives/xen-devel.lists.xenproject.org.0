Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5EC3389
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 13:58:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFGl2-0003mv-I3; Tue, 01 Oct 2019 11:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T9og=X2=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1iFGl1-0003mq-2M
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 11:55:55 +0000
X-Inumbo-ID: 6b79ebb8-e442-11e9-96f9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 6b79ebb8-e442-11e9-96f9-12813bfff9fa;
 Tue, 01 Oct 2019 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569930953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=osVZnobzbwAuBRRggcesFtkFAPDjgISieu4HYTKrMMA=;
 b=QuKZHf/QYjv8v0OPZ8aUXm8ZxpYcSLh5+3wh+315S7neU4VNhpqlYwJY
 EzJIsxw+319UG3PwQizyPh35bzaHhCS44WSojUtJqksDBRC7q0ERQF0fF
 wJwWfRGz1/17O08Dp8a/JtrP8qxOaThs5CVQeojpHLCBa87NDVoh3er0z o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sJoX0ORgiQnwnssTRViSUIda+xpL4StwvdI4+rdNXhjerTai8uhRk/x3QUYmx791RZQLG2FhXF
 uo5E+1r40BVyhHzTWCbYDJSKYaVe6WWno8sNB8sleDX+IFrcElNhunas3WlOuB8UejDnRoj30P
 bCYEVaQIXrw7kNelrpsuGthgAZJ8093eg0Z3QSrZjOh9Mp5+v9uT10oFtWNkcYYL19lYBPrwan
 jQqvfdt3F9+qgnNpAv3O8LI2lvycJ2RjayINhJwsezgVWwoHhy3VRrSnCtAWqGiedwLVix9wVX
 0Zs=
X-SBRS: 2.7
X-MesageID: 6590585
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6590585"
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] libxl: wait for the ack when issuing power control
 requests
Thread-Index: AQHVeEDUBflDRvLA3k2DRILSexOTiadFjEyA
Date: Tue, 1 Oct 2019 11:55:50 +0000
Message-ID: <05BD0B27-1DC3-4976-9E2E-622410ECDA8C@citrix.com>
References: <20191001101259.53162-1-roger.pau@citrix.com>
In-Reply-To: <20191001101259.53162-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <90D3E3CFF644FB4FB2FF29455472CC84@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] libxl: wait for the ack when issuing power
 control requests
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

Cgo+IE9uIDEgT2N0IDIwMTksIGF0IDExOjEyLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiAKPiB0b29scy9vY2FtbC9saWJzL3hsL3hlbmxpZ2h0X3N0dWJz
LmMgfCAxOCArKysrLS0tCgpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxp
bmRpZ0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
