Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029731CF73F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:37:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYW1f-0002At-6j; Tue, 12 May 2020 14:36:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYW1c-0002An-VN
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:36:53 +0000
X-Inumbo-ID: 046be59e-945e-11ea-a2bb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 046be59e-945e-11ea-a2bb-12813bfff9fa;
 Tue, 12 May 2020 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589294211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eYqQ8fIPQoZurpCTyEVO9wqqBYCFIDGSp7VjbM0Cb1A=;
 b=Vs4uw6dds9COu1FDbBlPP7xolygPgilk6x2HkmKBP0nCnhHRWFDrWysb
 SMEZMGEDNzTLTObl/ZAwgTJzefQeNj8wQU+EYFaEeGFGMnoOL9/Cv4rQX
 qRm26rlavAwF5+Cw0/xIrVdu1A154xU0hYolDPadysMQc7Lql2E2dbuoc k=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 7RM7K6YbycKcovFyNYE4+HpYMyMXkX7le1fdcEMSnpr5Mhjy3H0oihw3AB8yT+YqSVo8dNWfMw
 qlG2XiZIANh41UHx/rruHlThEmk2QiQGW3oeCJGULgtpm27bICRya3GahviCzKqKP9QOdtzmQ7
 p2Q5pssdji48PPhR1U86i96nb5DnfGBx5CqlNRfNe/BIev2di7lWu6pD48vl9Lqg97mWRlvCxz
 Tqlb85E+xEIKMyYsSgK4g2L8e0t7dLVPkaDYSn5MtZxkQR3cvWl+MVH9RSF9nNQnPNVU2e9zx9
 iBE=
X-SBRS: 2.7
X-MesageID: 17599552
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17599552"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Topic: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Index: AQHWHzfMuMNvM1D6EUuQ5HJvPIpidKikdZCA
Date: Tue, 12 May 2020 14:36:47 +0000
Message-ID: <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
In-Reply-To: <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E084319BF30EC4A89535278BFABBD96@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDMwLCAyMDIwLCBhdCAxMDozOSBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBJbml0aWFsaXplIHRoZSB4ZW5saWdodCBHbyBt
b2R1bGUgdXNpbmcgdGhlIHhlbmJpdHMgZ2l0LWh0dHAgVVJMLA0KPiB4ZW5iaXRzLnhlbi5vcmcv
Z2l0LWh0dHAveGVuLmdpdC90b29scy9nb2xhbmcveGVubGlnaHQsIGFuZCB1cGRhdGUgdGhlDQo+
IFhFTl9HT0NPREVfVVJMIHZhcmlhYmxlIGluIHRvb2xzL1J1bGVzLm1rIGFjY29yZGluZ2x5Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNv
bT4NCj4gLS0tDQo+IHRvb2xzL1J1bGVzLm1rICAgICAgICAgICAgICAgfCAyICstDQo+IHRvb2xz
L2dvbGFuZy94ZW5saWdodC9nby5tb2QgfCAxICsNCj4gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2dvbGFu
Zy94ZW5saWdodC9nby5tb2QNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9SdWxlcy5tayBiL3Rv
b2xzL1J1bGVzLm1rDQo+IGluZGV4IDViOGNmNzQ4YWQuLmNhMzNjYzdiMzEgMTAwNjQ0DQo+IC0t
LSBhL3Rvb2xzL1J1bGVzLm1rDQo+ICsrKyBiL3Rvb2xzL1J1bGVzLm1rDQo+IEBAIC0zNiw3ICsz
Niw3IEBAIGRlYnVnID89IHkNCj4gZGVidWdfc3ltYm9scyA/PSAkKGRlYnVnKQ0KPiANCj4gWEVO
X0dPUEFUSCAgICAgICAgPSAkKFhFTl9ST09UKS90b29scy9nb2xhbmcNCj4gLVhFTl9HT0NPREVf
VVJMICAgID0gZ29sYW5nLnhlbnByb2plY3Qub3JnDQo+ICtYRU5fR09DT0RFX1VSTCAgICA9IHhl
bmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0L3Rvb2xzL2dvbGFuZw0KDQpUaGUgcHJpbWFy
eSBlZmZlY3Qgb2YgdGhpcyB3aWxsIGJlIHRvIGluc3RhbGwgdGhlIGNvZGUgaW4gJFBSRUZJWC9z
aGFyZS9nb2NvZGUveGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3hlbi5naXQvdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0IHdoZW4gbWFraW5nIGRlYmJhbGxzIG9yIGRvaW5nIGBtYWtlIGluc3RhbGxgLg0K
DQpJIGRvbuKAmXQgaW1tZWRpYXRlbHkgc2VlIHRoZSBhZHZhbnRhZ2Ugb2YgdGhhdCwgcGFydGlj
dWxhcmx5IGlmIHdl4oCZcmUgc3RpbGwgdGhpbmtpbmcgYWJvdXQgaGF2aW5nIGEg4oCccHJldHRp
ZXLigJ0gcGF0aCBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUuICBXaGF0IHdhcyB5b3VyIHRo
aW5raW5nIGhlcmU/DQoNCj4gaWZlcSAoJChkZWJ1Z19zeW1ib2xzKSx5KQ0KPiBDRkxBR1MgKz0g
LWczDQo+IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQvZ28ubW9kIGIvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L2dvLm1vZA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAw
MDAwMDAwMDAwLi4yMzJkMTAyMTUzDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L2dvLm1vZA0KPiBAQCAtMCwwICsxIEBADQo+ICttb2R1bGUgeGVuYml0cy54
ZW4ub3JnL2dpdC1odHRwL3hlbi5naXQvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0DQoNClRoaXMgc2hv
dWxkIHByb2JhYmx5IGJlIHMveGVuL3hlbnByb2plY3QvOyANCg0KSWYgeW91IHdhbnQgSSBjb3Vs
ZCBjaGVjayBpbiBhIHZlcnNpb24gb2YgdGhpcyBwYXRjaCB3aXRoIGp1c3QgdGhlIGdvLm1vZCwg
d2l0aCB0aGF0IGNoYW5nZS4NCg0KIC1HZW9yZ2U=

