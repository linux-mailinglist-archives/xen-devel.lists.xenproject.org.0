Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCFC3122
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:22:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFGB-0002kA-BG; Tue, 01 Oct 2019 10:19:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T9og=X2=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1iFFG9-0002k4-RP
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:19:57 +0000
X-Inumbo-ID: d8fcf1cb-e434-11e9-96f7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id d8fcf1cb-e434-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569925126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=L4mCuKBI1giqXCrzqi7RkGzQw9+yedgJeSi3SUdVDOA=;
 b=HR4GQ8rKEMZyVJygnXn7UXhREQBW86g2RlEmyRDhJbiA3Z8MDkyKb0Xn
 uZPlKmM7RvpHrD30oqZ2O6wOm6vp0YTD9LJOM0+f4Bem8RRt5qGGVrzJf
 KeZzYEtvgZLoMJOJV/uIMOzq9MTTg1kb66DPwfb/5rBWs2alfVKGW4Y+e 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UL4urjB9mXG3e6uH3ydxo1HDJpUmmlc6VzKfC/uP4KV5p08Vsr1YdAvSmlGsaiCqSYdpCl1uLy
 GcYESJv4eE6h98pYh2hGwZ9Woh+NggbWZYSHoswQWiOB3e2cc1bDix4OJdYifco900GqwNIMaz
 hzZK/sOOaW+Hvya95Sl/9YkVe6uPUzUGh6rC26irUh5xMYa33tm3Z+2Zf5EePuMqfyqmX6qnvL
 d9UM6TZMvSFLeSDd0H1tcOdrsMvlww+0xvKA3TvJt7mdvVx+ndqeOjN7xA+huEfz1eY/etNpLM
 ABA=
X-SBRS: 2.7
X-MesageID: 6303303
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6303303"
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] libxl: wait for the ack when issuing power control
 requests
Thread-Index: AQHVeEDUBflDRvLA3k2DRILSexOTiadFcSiA
Date: Tue, 1 Oct 2019 10:18:41 +0000
Message-ID: <C99AFD6E-47A3-4F39-9B0A-4F01163F2081@citrix.com>
References: <20191001101259.53162-1-roger.pau@citrix.com>
In-Reply-To: <20191001101259.53162-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <2856ECFEEDA6074E8462B082291D6D59@citrix.com>
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

DQoNCj4gT24gMSBPY3QgMjAxOSwgYXQgMTE6MTIsIFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gKwlsaWJ4bF9hc3luY29wX2hvdyAqYW9faG93ID0g
YW9ob3dfdmFsKGFzeW5jKTsNCj4gDQo+IAljYW1sX2VudGVyX2Jsb2NraW5nX3NlY3Rpb24oKTsN
Cj4gLQlyZXQgPSBsaWJ4bF9kb21haW5fc2h1dGRvd24oQ1RYLCBjX2RvbWlkKTsNCj4gKwlyZXQg
PSBsaWJ4bF9kb21haW5fc2h1dGRvd24oQ1RYLCBjX2RvbWlkLCBhb19ob3cpOw0KPiAJY2FtbF9s
ZWF2ZV9ibG9ja2luZ19zZWN0aW9uKCk7DQo+IA0KPiArCWZyZWUoYW9faG93KTsNCj4gKw0KDQpE
b2VzIHRoaXMgd29yayB3aGVuIGFvaG93X3ZhbCByZXR1cm5zIE5VTEwgb3IgZG9lcyB0aGlzIG5l
ZWRzIHRvIGJlIGNoZWNrZWQ/IE90aGVyd2lzZSBUaGlzIGxvb2tzIGdvb2QgdG8gbWUuDQoNCuKA
lCBDCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
