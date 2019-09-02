Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31ACA50DA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:06:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hJm-0002Ej-S4; Mon, 02 Sep 2019 08:04:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4hJl-0002EZ-9b
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:04:05 +0000
X-Inumbo-ID: 3a6a44f6-cd58-11e9-ae9f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a6a44f6-cd58-11e9-ae9f-12813bfff9fa;
 Mon, 02 Sep 2019 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567411444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sMugyXjzvJ4Lksa6BIPcVCjtjuqDlbW8dEO5gNtm/7o=;
 b=NREVj6dFZcMHrlPEs8vlc0zsyIj7mpEVOiSMn9OZDs9vHXpAlrkcbPlt
 /06+mvyQyFvOSAkZ2Z3/776WGugeKNq60uVBg3KE+29Q7P4GscK3ItxWZ
 d9nYU0TKBW0zaSPDSe2aEmsfGOeAU+8Y+0IPBIjDpoVypjn+gDCU3M/MM 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ygC9TBNLzSca+rA0arlfwN+cZg1Fd+3nLG2Qx5ooQngn0KlmKdENaHVnfw7xactigYLWxrwdOr
 jDmQk1/WcUQaQNJDtspi84SHrap8DE9T6ADdMro0oP55JXltQKXWqjoKu8WBzG0t+Qdudx7Eut
 dyol6IfRfR2tyMkXEAsURMhVfoNX7O+hBkLpPHFgp7NGtwSDNSh+nj3LhfmFloidi2b4WPq8Br
 Yw7W/mrtRa2rhW5SGEMfMO3jjeWJQMRVY3UNYwD0X8d5fOD+ARnUkX+aqkiJuO96P/IDklL2ks
 fmg=
X-SBRS: 2.7
X-MesageID: 5006807
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,457,1559534400"; 
   d="scan'208";a="5006807"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Steven Haigh' <netwiz@crc.id.au>, Andreas Kinzler <hfp@posteo.de>
Thread-Topic: Windows HVM no longer boots with AMD Ryzen 3700X (and 3900X)
Thread-Index: AQHVYS/C+HQxXSiQEUCMz+59RzWjzqcXfpcAgACHy+A=
Date: Mon, 2 Sep 2019 08:04:00 +0000
Message-ID: <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
 <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
In-Reply-To: <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiANCj4gRnVydGhlciB0byB0aGUgYWJvdmUs
IEkgZGlkIHNvbWUgZXhwZXJpbWVudGF0aW9uLiBUaGUgZm9sbG93aW5nIGlzIGENCj4gbGlzdCBv
ZiBhdHRlbXB0ZWQgYm9vdCBjb25maWd1cmF0aW9ucyBhbmQgdGhlaXIgb3V0Y29tZXM6DQo+IA0K
PiB2aXJpZGlhbj0xDQo+IHZjcHVzPTQNCj4gU1RPUENPREU6IEhBTCBNRU1PUlkgQUxMT0NBVElP
Tg0KPiANCj4gdmlyaWRpYW49MA0KPiB2Y3B1cz00DQo+IFNUT1BDT0RFOiBNVUxUSVBST0NFU1NP
Ul9DT05GSUdVUkFUSU9OX05PVF9TVVBQT1JURUQNCj4gDQo+IHZpcmlkaWFuPTANCj4gdmNwdXM9
MQ0KPiBCb290IE9LIC0gZ2V0IHRvIFdpbmRvd3MgU2VydmVyIDIwMTYgbG9naW4gZXRjDQo+IA0K
DQpBbmQgdG8gY29tcGxldGUgdGhlIHNldCwgaG93IGFib3V0IHZpcmlkaWFuPTEgdmNwdXM9MT8N
Cg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
