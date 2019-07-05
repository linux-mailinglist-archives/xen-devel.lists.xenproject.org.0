Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D83605CF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 14:16:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjN64-0005xe-9j; Fri, 05 Jul 2019 12:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjN62-0005xW-QU
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 12:13:46 +0000
X-Inumbo-ID: 559a54b8-9f1e-11e9-8629-e3870cf514c7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 559a54b8-9f1e-11e9-8629-e3870cf514c7;
 Fri, 05 Jul 2019 12:13:45 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GjCGS3b93QFcmFPt5soHo8dfIQlHFHVmb2bAdcQMrWJS75Ps47oFpvifFAF6eG5JCpBtVGBZ4V
 ngMtspRWq3dTH/0vOLp6GIvd+qa9fLIBpKsmN55Tvhp8a255wre1En2oFy6eERGqyCCgN6WaXO
 U3NbExeaNk0CXYLi5C4lFRtUutbnsnyjIiGHsBdMPmfE9SgoLbwt2u6PeT2QrKWtpDYJZd6L2f
 kO1/T4Si61cWpuO/N/h2WfPk18ZOpSk3AOrUVbGr52cDM22E450y48YoCoJzW0oo7cPKP7KoeO
 WCM=
X-SBRS: 2.7
X-MesageID: 2676711
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2676711"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Juergen Gross' <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
Thread-Index: AQHVMntmcjAjDu/MbEW4KaEw4V64e6a6eY2AgAAlqmCAAOmPAIAAKFiAgAA/XlA=
Date: Fri, 5 Jul 2019 12:13:39 +0000
Message-ID: <3eabb798d11e4bc086e9c4f231f79d32@AMSPEX02CL03.citrite.net>
References: <20190704151522.32639-1-anthony.perard@citrix.com>
 <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
 <c2a91602902b4c9294a12c4994a3663a@AMSPEX02CL03.citrite.net>
 <5c3268fd-bd69-f490-ef12-01a8c9cd4369@suse.com>
 <75a7ebcf-5265-5ad5-b8c3-107caf4a1f91@suse.com>
In-Reply-To: <75a7ebcf-5265-5ad5-b8c3-107caf4a1f91@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+IA0KPiBJJ20gY29tcGxldGVs
eSBvbiBKYW4ncyBzaWRlIGhlcmUuDQo+IA0KPiBXaGF0IHdvdWxkIGJlIHBvc3NpYmxlIHBlcmhh
cHMgaXMgdG8gc3BsaXQgcmluZy5oIGludG8gdHdvIGhlYWRlcnM6IGENCj4gbmV3IG9uZSB3aXRo
IHRoZSBwdXJlIHJpbmcgZGVmaW5pdGlvbnMgYW5kIHJpbmcuaCAjaW5jbHVkZS1pbmcNCj4geGVu
LWNvbXBhdC5oIGFuZCB0aGUgbmV3IGhlYWRlciBhbmQgI2RlZmluZS1pbmcgdGhlIHhlbiptYigp
IG1hY3Jvcy4NCj4gDQo+IE5vdCBzdXJlIHRoaXMgd291bGQgYmUgd29ydGggaXQsIHRob3VnaC4N
Cj4gDQoNCk9rLiBQcm9iYWJseSBub3Qgd29ydGggaXQsIGFzIHlvdSBzYXkuIElmIHdlIGRvbid0
IGZlZWwgY29tZm9ydGFibGUgcmVtb3ZlIG9sZCBjcnVmdCBsaWtlIHRoZXNlIHRoZW4gcHJvamVj
dHMgaW1wb3J0aW5nIHRoZSBoZWFkZXJzIHdpbGwganVzdCBoYXZlIHRvIGhhY2sgaXQgb3IgbGl2
ZSB3aXRoIGltcG9ydGluZyB4ZW4tY29tcGF0IHRvby4gQW50aG9ueSBhbHJlYWR5IHN1Ym1pdHRl
ZCBhIHBhdGNoIGRvaW5nIHRoZSBmb3JtZXIgZm9yIFFFTVUuDQoNCiAgUGF1bA0KDQo+IA0KPiBK
dWVyZ2VuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
