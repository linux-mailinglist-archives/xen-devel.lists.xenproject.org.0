Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9349FE1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCfV-0004gH-2Q; Tue, 18 Jun 2019 11:52:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6zAf=UR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hdCfT-0004gB-BZ
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:52:51 +0000
X-Inumbo-ID: 98b8fffe-91bf-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 98b8fffe-91bf-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:52:50 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zLY1YsY6pE43I81XtXl93HiV1GVsQGAuFZVXyJc7+kUAsTAqh9GGCdrYWSCOT1Jiwhm2/wzj3A
 bDWmdrLWKTvyoDoJTlhu3gbA3ZLdxELhLPL/+6oprC9QmNCC2T0Eyb1NuVn/o1jq/wtZq6gbf+
 sjNHtPKyHigkbpQQhDWBmnLjhSsyELY4vUvY7SIhSG84fcnM040uso8tMUlj/vZWjcekylhkgF
 +slb19Tx/t7srME0WLTbjtRyuSMvzJ5FYSS5Ket4J0u18G+VPuqLVyWiGoe0OdQSypGeDElGuM
 +00=
X-SBRS: 2.7
X-MesageID: 1866285
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1866285"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 4/4] xen: Avoid VLA
Thread-Index: AQHVJchKT6z1AbWFfUC6DqRqpG72VqahTQUQ
Date: Tue, 18 Jun 2019 11:52:46 +0000
Message-ID: <3c5959420c754d208954f6da7730d87b@AMSPEX02CL03.citrite.net>
References: <20190618112341.513-1-anthony.perard@citrix.com>
 <20190618112341.513-5-anthony.perard@citrix.com>
In-Reply-To: <20190618112341.513-5-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen: Avoid VLA
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxOCBKdW5lIDIwMTkgMTI6MjQK
PiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNv
bT47IFN0ZWZhbm8KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogW1BBVENIIHYyIDQvNF0geGVuOiBB
dm9pZCBWTEEKPiAKPiBBdm9pZCB1c2luZyBhIHZhcmlhYmxlIGxlbmd0aCBhcnJheS4KPiAKPiBX
ZSBhbGxvY2F0ZSB0aGUgYGRpcnR5X2JpdG1hcCcgYnVmZmVyIG9ubHkgb25jZSB3aGVuIHdlIHN0
YXJ0IHRyYWNraW5nCj4gZm9yIGRpcnR5IGJpdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
