Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505DB8644C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:26:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjK2-0005oQ-F3; Thu, 08 Aug 2019 14:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KK2h=WE=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hvjK1-0005oL-KS
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:23:17 +0000
X-Inumbo-ID: 0f857d42-b9e8-11e9-ac85-072972b2d38d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f857d42-b9e8-11e9-ac85-072972b2d38d;
 Thu, 08 Aug 2019 14:23:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yMWd9yZ3l1hO8wxEgKEvTvKr/lvBSuR9/fqcWuRq6HsJ9zU8bRdROK+SQR10Rit7/hOtHHoWS0
 4UG5w+UkOCov/eJFh6YptmRT6mCjozNbtRFsCDaqX3iPENVfJEIAUNb7XYzc5ScVUWm9vUOUYe
 KxpGjSwloVQeeg6p5KU8uXc/iCVjNCq5PEy0oDMEWh9BTYTBrIGkGvq83MShD88iR1kGxzHlIe
 wDz6f/XfzVDB3rel5aifOHgJwRQioz8htjyFtZPRfl+W0dN4QBRYqpAZDO65PYXiiMGtYuwyGA
 HNc=
X-SBRS: 2.7
X-MesageID: 4028343
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4028343"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Oleksandr <olekstysh@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA support
Thread-Index: AQHVTVR5WwElDFPXJE2L9/6buLUFm6bxPjCA
Date: Thu, 8 Aug 2019 14:23:12 +0000
Message-ID: <E2C1BAA8-A60B-4D51-B0B1-22D8392C9CB8@citrix.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
In-Reply-To: <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C7ADBCF10DAA2F47BAC57E67CC40C231@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA3LzA4LzIwMTksIDIwOjE1LCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KDQogICAgKCsgTGFycykNCiAgICANCiAgICBIaSwNCiAgICANCiAg
ICBPbiA4LzcvMTkgNTowMSBQTSwgT2xla3NhbmRyIHdyb3RlOg0KICAgID4+PiArICogeW91IGNh
biBmb3VuZCBhdDoNCiAgICA+Pj4gKyAqICAgIHVybDogDQogICAgPj4+IGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ob3Jtcy9yZW5lc2FzLWJzcC5naXQNCiAg
ICA+Pj4gKyAqICAgIGJyYW5jaDogdjQuMTQuNzUtbHRzaS9yY2FyLTMuOS42DQogICAgPj4+ICsg
KiAgICBjb21taXQ6IGUyMDZlYjViODFhNjBlNjRjMzVmYmMzYTk5OWIxYTBkYjJiOTgwNDQNCiAg
ICA+Pj4gKyAqIGFuZCBYZW4ncyBTTU1VIGRyaXZlcjoNCiAgICA+Pj4gKyAqICAgIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCiAgICA+Pj4gKyAqDQogICAgPj4+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMTYtMjAxOSBFUEFNIFN5c3RlbXMgSW5jLg0KICAgID4+PiArICoNCiAgICA+
Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3INCiAgICA+Pj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgYW5kIGNv
bmRpdGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYw0KICAgID4+PiArICogTGljZW5zZSwg
dmVyc2lvbiAyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4N
CiAgICA+Pj4gKyAqDQogICAgPj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCiAgICA+Pj4gKyAqIGJ1dCBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQogICAg
Pj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UuICBTZWUgdGhlIEdOVQ0KICAgID4+PiArICogR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3Ig
bW9yZSBkZXRhaWxzLg0KICAgID4+PiArICoNCiAgICA+Pj4gKyAqIFlvdSBzaG91bGQgaGF2ZSBy
ZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYw0KICAgID4+PiArICogTGlj
ZW5zZSBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgDQogICAgPj4+IDxodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4NCiAgICA+PiBJIGRvbid0IGtub3cgdGhhdCBYZW4g
bGljZW5zZSBkZXNjcmlwdGlvbiBydWxlLCBidXQgc2luY2UgYSBmZXcgc291cmNlIA0KICAgID4+
IGZpbGVzIGhhdmUNCiAgICA+PiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllciwgY2FuIHdlIGFsc28g
dXNlIGl0IG9uIHRoZSBkcml2ZXI/DQogICAgPiANCiAgICA+IEkgYW0gYWZyYWlkLCBJIGRvbid0
IGtub3cgYSBjb3JyZWN0IGFuc3dlciBmb3IgdGhpcyBxdWVzdGlvbi4gSSB3b3VsZCANCiAgICA+
IGxlYXZlIHRoaXMgdG8gbWFpbnRhaW5lcnMuDQogICAgPiANCiAgICA+IEkganVzdCBmb2xsb3dl
ZCBzYW1wbGUgY29weXJpZ2h0IG5vdGljZSBmb3IgR1BMIHYyIExpY2Vuc2UgYWNjb3JkaW5nIHRv
IA0KICAgID4gdGhlIGRvY3VtZW50Og0KICAgID4gDQogICAgPiBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPUNPTlRSSUJVVElORw0KICAgIA0KICAgIFRo
ZSBmaWxlIENPTlRSSUJVVElORyBpcyBvbmx5IGdpdmluZyBleGFtcGxlIG9mIGNvbW1vbiBleGFt
cGxlIG9mIA0KICAgIGxpY2Vuc2UuIFNvIEkgdGhpbmsgdGhpcyBpcyBmaW5lIHRvIHVzZSBTUERY
LCB0aGUgbW9yZSB0aGV5IGFyZSBhbHJlYWR5IA0KICAgIHVzZWQuIFRoZSBvbmx5IHJlcXVlc3Qg
aXMgdG8gcHV0IGVpdGhlciBTRFBYIG9yIHRoZSBmdWxsLWJsb3duIHRleHQgYnV0IA0KICAgIG5v
dCB0aGUgdHdvIDopLiBMYXJzLCBhbnkgb2JqZWN0aW9uPw0KICAgIA0KICAgIEkgYW0gcXVpdGUg
aW4gZmF2b3Igb2YgU1BEWCBiZWNhdXNlIGl0IGlzIGVhc2llciB0byBmaW5kIG91dCB0aGUgDQog
ICAgbGljZW5zZS4gV2l0aCB0aGUgZnVsbC1ibG93biB0ZXh0LCB0aGUgdGV4dCBtYXkgc2xpZ2h0
bHkgdmFyeSBiZXR3ZWVuIA0KICAgIGxpY2Vuc2VzLiBGb3IgaW5zdGFuY2UsIHRoZSBvbmx5IGRp
ZmZlcmVuY2UgYmV0d2VlbiBHUEx2MiBhbmQgR1BMdjIrIGlzIA0KICAgICIsb3IgKGF0IHlvdXIg
b3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbiIuIEkgbGV0IHlvdSBpbWFnaW5lIGhvdyBpdCBjYW4g
DQogICAgYmUgZWFzeSB0byBtaXNzIGl0IHdoZW4gcmV2aWV3aW5nIDspLg0KICAgIA0KICAgIFdl
IGhhZCBhIGRpc2N1c3Npb24gbGFzdCB5ZWFyIGFib3V0IHVzaW5nIFNQRFggaW4gWGVuIGNvZGUg
YmFzZSBidXQgSSANCiAgICBuZXZlciBnb3QgdGhlIHRpbWUgdG8gZm9ybWFsbHkgc3VnZ2VzdCBp
dC4NCiAgICANCkkgZGlkIG5vdCBwdXNoIGl0IGVpdGhlci4gDQoNCkluIHRoZSBwYXN0IG9uZSBv
ZiB0aGUgY29tbWl0dGVycyBoYWQgbWFqb3Igb2JqZWN0aW9ucyBhZ2FpbnN0IFNQRFgsIGJ1dCBh
ZnRlciBhIGNvbnZlcnNhdGlvbiBsYXN0IHllYXIgYW5kIGNoYW5nZXMgdG8gdGhlIGxhdGVzdCB2
ZXJzaW9uIG9mIFNQRFggaGUgZHJvcHBlZCB0aGVzZS4NCg0KVGhlIG9ubHkgcmVtYWluaW5nIG9i
amVjdGlvbiB3YXMgdG8gaGF2ZSBib3RoIFNQRFggaWRlbnRpZmllciBBTkQgYSBsaWNlbnNlIGlu
IHRoZSBzYW1lIGZpbGUuIFRoZSBhcmd1bWVudCBhZ2FpbnN0IGl0IGlzOiB3aGF0IGRvZXMgaXQg
bWVhbiBpZiB0aGV5IGNvbnRyYWRpY3QgZWFjaCBvdGhlcj8gVG8gYmUgZmFpciB0aGF0IGlzIGEg
dmFsaWQgY29uY2Vybi4NCg0KSSBhbSBub3Qgc3VyZSBpdCBpcyBhIGdvb2QgaWRlYSB0byBpbnRy
b2R1Y2UgU1BEWCBwaWVjZW1lYWwuIEl0IHdvdWxkIGJlIG11Y2ggYmV0dGVyIHRvDQphKSBhZ3Jl
ZSBpdA0KYikgdHJhbnNmb3JtIHRoZSBjb2RlYmFzZSB1c2luZyBhIHRvb2wNCnJhdGhlciB0aGFu
IGludHJvZHVjaW5nIGl0IHBpZWNlbWVhbA0KDQpMYXJzDQogDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
