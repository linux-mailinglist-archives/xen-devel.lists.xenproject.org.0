Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC0ABC661
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCihH-0003au-33; Tue, 24 Sep 2019 11:09:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d2pe=XT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCihF-0003aU-Qt
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:09:29 +0000
X-Inumbo-ID: 8197a8d6-deac-11e9-ae5c-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 8197a8d6-deac-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569316810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CBOOfP6vF5VxhNWWyDE1g3/6fWnEywFEHZF8+zW6UMw=;
 b=Jn/r8RnQeDXn93nLUaGy/LlZ19Sx5qMK8rTZS9ZVsxcqRfDAvSGGRlDd
 NXpNbbIuO0jo2vpwJt03Sobiqa5G2DUbh49nDBMjF5YEaKIZXqluAV7P0
 hrOLsjvPCXIF5/P1JDSe4lWDQbqz8lJ6nUnlWKymu5Ghmzvz5CU/4NPrs I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0wz+gMD2qa8wUD7kCbnbMMG8Xx5iDPT27hPdCWJSxOs0nlbPnJKj3EVug1rLwcDwZ/01i5+Ze0
 4wHrx9CST76bkkfZUQMWIEH5XefRNUTD7ptI7I9TWgNFYlr5iPbEyLG2K+ZlS5iwVjUjEP+Q3R
 mPtXJs6EFEz7dVXA7nQ4BCHwEv7NLHpkHfIoAshz6Wk2JcBDbIsLJxBrtKfQUkXfMgOqekfG7W
 n4RoUv/1qBdesWoMY4y3IBtacEtRmOo8cgF98+yeuIQwG2KGKCSDQdyPC/cG8DH9YOqiwgcHfb
 06o=
X-SBRS: 2.7
X-MesageID: 6192050
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="6192050"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v6 7/8] AMD/IOMMU: allocate one device table
 per PCI segment
Thread-Index: AQHVbu3HiqLbXDTCTE6cw97y+FIVyqc5egiAgAD2W4CAACPWYA==
Date: Tue, 24 Sep 2019 09:20:06 +0000
Message-ID: <ddb120a784e549e39c6e4612c10921e1@AMSPEX02CL03.citrite.net>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <e0a904bf-b6a0-6224-88f6-e89a95867718@suse.com>
 <1b23caa9eb9a424d919c2aed1a5ba80f@AMSPEX02CL03.citrite.net>
 <d977330a-88e0-e145-84ad-e0271232e477@suse.com>
In-Reply-To: <d977330a-88e0-e145-84ad-e0271232e477@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 7/8] AMD/IOMMU: allocate one device table
 per PCI segment
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI0IFNlcHRlbWJlciAyMDE5IDEwOjEwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxw
YW5pdEBhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiA3LzhdIEFNRC9JT01NVTogYWxs
b2NhdGUgb25lIGRldmljZSB0YWJsZSBwZXIgUENJIHNlZ21lbnQNCj4gDQo+IE9uIDIzLjA5LjIw
MTkgMTg6MzAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoDQo+ID4+IFNlbnQ6IDE5IFNlcHRl
bWJlciAyMDE5IDE0OjI1DQo+ID4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj4gPj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBTdXJh
dmVlIFN1dGhpa3VscGFuaXQNCj4gPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPg0KPiA+
PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjYgNy84XSBBTUQvSU9NTVU6IGFsbG9jYXRl
IG9uZSBkZXZpY2UgdGFibGUgcGVyIFBDSSBzZWdtZW50DQo+ID4+DQo+ID4+IEhhdmluZyBhIHNp
bmdsZSBkZXZpY2UgdGFibGUgZm9yIGFsbCBzZWdtZW50cyBjYW4ndCBwb3NzaWJseSBiZSByaWdo
dC4NCj4gPg0KPiA+IFRoZSBjb3B5IG9mIHRoZSBzcGVjLiBJIGhhdmUgc2F5cyAob24gcGFnZSAy
NTM6IEZpeGVkLUxlbmd0aCBJVkhEDQo+ID4gQmxvY2tzKSB0aGF0IElWSEQgZW50cmllcyBtdXN0
IGhhdmUgYSBzZWdtZW50IGdyb3VwIG9mIDAsIHNvIGNhbid0DQo+ID4gdGhlIGNvZGUganVzdCBy
ZXF1aXJlIGlvbW11LT5zZWcgPT0gMD8NCj4gDQo+IFRoZSB3b3JkaW5nIGluIG15IHZlcnNpb24g
aXMgIkF0IHRoaXMgdGltZSwgb25seSBQQ0kgU2VnbWVudCBHcm91cCAwIGlzDQo+IHN1cHBvcnRl
ZC4iIFRoaXMgc3VnZ2VzdHMgdG8gbWUgdGhhdCBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gaGF2
ZSBsb2dpYw0KPiBiYWtlZCBpbiB0aGF0IGRlcGVuZHMgb24gdGhpcyByZW1haW5pbmcgdHJ1ZS4g
SSByZWFsaXplIHRob3VnaCB0aGF0IHRoZXJlDQo+IGFyZSBtb3JlIHBsYWNlcyB0aGFuIGp1c3Qg
dGhpcyBvbmUgd2hlcmUgd2UgKGhhdmUgdG8pIGFzc3VtZSBzZWdtZW50IDANCj4gKGFsbCBpbiBp
b21tdV9hY3BpLmMsIGFuZCBhbGwgbWFya2VkIHdpdGggYW4gWFhYIGNvbW1lbnQpLg0KPiANCg0K
T2suIEZhaXIgZW5vdWdoLiBJIGp1c3Qgd2Fzbid0IHN1cmUgaXQgd2FzIHdvcnRoIGRvaW5nIHRo
aXMgY2hhbmdlIGF0IHRoZSBtb21lbnQ7IGJ1dCBpdCBkb2Vzbid0IGh1cnQsIHNvIHlvdSBjYW4g
YWRkIG15IFItYi4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
