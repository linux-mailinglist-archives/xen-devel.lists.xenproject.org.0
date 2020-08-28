Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF45255DE4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgKY-0001sl-4o; Fri, 28 Aug 2020 15:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBgKW-0001sg-KA
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:30:16 +0000
X-Inumbo-ID: 0d0d3db0-4eb9-41e3-a697-772da9ecb0d6
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d0d3db0-4eb9-41e3-a697-772da9ecb0d6;
 Fri, 28 Aug 2020 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598628615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5e9Ph/VwqdctE9wAJn/mzJaV+Lq5RBG/S2DRXDiRu/c=;
 b=RTN1J0NTFRom8Foo7fQ/9ApuGRtk/qWD3k4d1FyTKBtU7HVgj/yngAQW
 2e1gNI2BJQxRmTkU7nzLH765piey7lKu5CKoPmD7XLWSXuWryk0aA9dB7
 cZWtji7C1fcth4mEzbt7Skx7412UmdUAeKgCB5w4BIKDS2i7nEdFE9LAk g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: dkH8vmbkH3ehi7qbTOhIKNARQq523NEpyYe/WY/xbmIYNmNLN8VwrDBe4cuhJ6JRDe2GzGOfhZ
 qfCmbwkX8Vg19qOHtGcfnEf3LJud3d+DBoYm9+KcXuWG8A/tAbsJCjqiybIEvXe+Fm605rmcsm
 pALebpnFGFec91m90LkKgGFRqeTWj9i/gJPCFWuhATL1PN3SmnUR3kj/ywgm5u8J/mWe2XJzxL
 N0zTY2zqlOGldzkHim0yFBmenPeF7n8B1WOghEwI2Xy+isiKK5UuI2RQDnNN2kGw3/pDkHO7EO
 VPc=
X-SBRS: 2.7
X-MesageID: 25861529
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,364,1592884800"; d="scan'208";a="25861529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAhIe4fCY9GRbntsLmNg1O9HRpmeVDc/4P+dYPSmmFJViZ51Rgv1g/3iYmAppg2hBYkbJvO7IOYmNXuerA7TglU6XGUjQn4qLvyCvvggN2fwVArQPla5zQeBNdDDQFamxyU1gN9gkiGe+WQSiRudsCsewYcEvhTlruOwJ30bJ4zV1uKt+Rf+b1NBSoVgJ9P2t1HlHK8Ki1yoc70s7WS/QMK2M/nfj788yiCTF+rayLFX9l4tVZF/nY36oGfgZQ4qWljZbPtMwcVQjJWZE6Tgfejxzj9znGtMmVJNiyVAA6f7LXVtAn4YFEj/WewUFGufn9Mpdt6rZsE89jv3exYT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e9Ph/VwqdctE9wAJn/mzJaV+Lq5RBG/S2DRXDiRu/c=;
 b=as0R8/zHzS9phpBe5Oz16eDrijTYNUz47SY4aavb6pFX7HgKQ4INlA/QFhEwq/K6SnEdImVKTfVK9f/XahmM5lOKY/LSBJNbpT2ESULIpxj42unz+wIEs3FqPjo3vkmzMzRfBRYGdHvTpSU0SQ8XMa97RcU+q/3yNZynJGDVGUMm18yeyVuMoetljZrpl5dqJNC1/N9raQHJsR4fM+T9yUZ/x8eNnhQU0KoHmLNE+L/4H1+iU4o0JhgsT7Zk4H2vwxL5Aunc0nX7s6ERvUmmw6pIhzI+xBm/C3TUcAjbJRIA8GxoWQEoknzi+PdnBmti3QGTagaJBaPbSHVeqUVmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e9Ph/VwqdctE9wAJn/mzJaV+Lq5RBG/S2DRXDiRu/c=;
 b=rh8wJgEBdjC/dSCIs2O9aEYuPV2U0f62LMpg4xjq9mCIeO0dFG49p5E6THruTONCvlet0evMG3P2RV73DL5ndky7irf+oJirsk4gE7Kn27woz3wI/0F+3KNlJCTTsCyhGhB6wtRuYqgvtenZvLdXp63viP02mIhmdA7BFw0Hpw0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson
 <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] Revert "libxl: Generate golang bindings in libxl Makefile"
Thread-Topic: [PATCH] Revert "libxl: Generate golang bindings in libxl
 Makefile"
Thread-Index: AQHWfUmKs/bNNJRlP0m5qFgUgpHdO6lNor0AgAAC6gA=
Date: Fri, 28 Aug 2020 15:30:11 +0000
Message-ID: <E2B79841-A19E-4827-90CA-785575F86D51@citrix.com>
References: <20200828144248.1970259-1-george.dunlap@citrix.com>
 <20200828151944.GA21717@six>
In-Reply-To: <20200828151944.GA21717@six>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a6bdad5-0b95-4770-78ac-08d84b6740c4
x-ms-traffictypediagnostic: BYAPR03MB3749:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB3749D914F4FFA333ECD5693C99520@BYAPR03MB3749.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zytCy9pgEe1MG4WZULmh3EWBLfQ2vp0efEQeeQMjbH6huuS5rhpctD4FwzDU7zYSq3lB4Dvcsom32JiSZ4/FbLpNu63xDw4xXhlrq2OXkDsOpHWj/AAabYlvIq7slzoqnAtXLwMaWEZg/hvzSJJrWWdcHn7RhF8JERDT/jBQOFOiCb7S+7jFefIS2FyUbyuihzdk3lrCTdm8O+z7VIWswUiDZumPugVMAjUsr/9cxPuY0phloGbznbjjxscW+dEbI1tAi9DxHgEymjefTIXh3w7E5VsPg6m1UpmAqSTt2jgkiTW0eEZ8JtJydIK95w5GWSk4fjVYJ3Qzf3vxAoHQaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(8676002)(4326008)(6916009)(2906002)(316002)(66556008)(66446008)(76116006)(64756008)(8936002)(478600001)(66476007)(91956017)(66946007)(54906003)(33656002)(186003)(6486002)(6512007)(26005)(86362001)(2616005)(71200400001)(6506007)(5660300002)(83380400001)(53546011)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oVPTbz1KpSOKFBth5FL6h/cqu07SghW/VMWISfhZEa8YUizo11/4I13fQhp8MOMgy5SNEfg9DtJxjSTEAW1vES5QEeIgEv2VRDRad++U906PuGEyrf0y1VVwobQE6+323MeheO4Qg+TGIk4ZJvBsAR8nU5xfiK9ccOjiAQw9tnRepJ/e86YXgXPHF4129UM4Hnv0Rut9zX12zA9mqdlgDBtGWyUatFqXRkL7Udfqu3WqcqyRWC2huo0IIWr/ykoKSdDB5D0uIP0Pfae8N+tdY/yFrBiog6qI11Znhk76D8mDksDSisEKSII3DqckiiFhFMVMWgKIp5o8rZl3qlhYTwldz4D/vckb6t4Pw6K73hctwbA5svS3q9gJYmXaQ9YlA0eMUpf/8Vg3p3OG5p23J68ss0QHwp0VqBZp0W5/96nAanEm07h9feuiaKpcZFPPnC6Vnldq39KFZxipfCGx1bQRePowkoq1Sz4/XKanKOqMuVPkAylno23fu8oj1GhooK6jwVg/dY7obsPx9MWd6bSZZ9Uhh6R9nzmwHiKGqcdvpsWEeMyHHuVzRQMpd7o+Adbc/m5Gs7i0d1KUPq8F7Jl+mBmV9F/Wue4VOkC3lxEEcJeQv0MytiqmMPJ4mFaYci9XzYzduEt8LFeBO3YxXw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <897855350B066448B1A3F13650B21FAF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6bdad5-0b95-4770-78ac-08d84b6740c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 15:30:11.1278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5hrmG03sMDbpmg/ySp0qDFT56fo4Fy65e4a8M43SV3/z3MRLqqeAVpj+RkfYM21gvpX9JpAeWWiNd136N252Ekq3FR6lLHSXGY/UZN2xZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3749
X-OriginatorOrg: citrix.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDI4LCAyMDIwLCBhdCA0OjE5IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDAzOjQy
OjQ4UE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBUaGlzIHJldmVydHMgY29tbWl0
IDYwZGI1ZGE2MmFjMDUxYWFiMGIyMTdmYTJkOTZhY2NhMWNkM2NhM2UuDQo+PiANCj4+IFRoaXMg
aXMgaW4gcHJlcGFyYXRpb24gZm9yIHRoZSBwbGFubmVkIG1vdmUgdG8gaG9zdGluZyB0aGUgeGVu
bGlnaHQNCj4+IHBhY2thZ2UgaW4gYSBzZXBhcmF0ZSByZXBvLg0KPj4gDQo+PiBUaGlzIGFsc28g
Zml4ZXMgYSByZWdyZXNzaW9uIHdoZW4gYnVpbGRpbmcgd2l0aCBhIHJlYWQtb25seSBzb3VyY2Ug
YW5kDQo+PiBhbiBvdXQtb2YtdHJlZSBidWlsZC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBUaGlzIGlz
IGEgY2FuZGlkYXRlIHRvIGJhY2twb3J0IGZvciA0LjE0Lg0KPj4gDQo+PiBJIHdhcyBkb2luZyBw
cmVwIGZvciB3cml0aW5nIHRoZSBpbmZyYXN0cnVjdHVyZSB0byBjcmVhdGUgb3IgdXBkYXRlIGFu
DQo+PiBleHRlcm5hbCByZXBvLCBhbmQgZmlndXJlZCBJIG1pZ2h0IGFzIHdlbGwgc2VuZCB0aGlz
IG91dCBub3cuDQo+PiANCj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
PiBDQzogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4NCj4+IENDOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4NCj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPj4gLS0tDQo+PiB0b29scy9nb2xhbmcveGVubGlnaHQvTWFrZWZpbGUgfCAgOSAtLS0t
LS0tLS0NCj4+IHRvb2xzL2xpYnhsL01ha2VmaWxlICAgICAgICAgICB8IDE3ICstLS0tLS0tLS0t
LS0tLS0tDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyNSBkZWxldGlvbnMo
LSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9NYWtlZmlsZSBi
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC9NYWtlZmlsZQ0KPj4gaW5kZXggZWFjOWRiZjEyYS4uOGQ0
ZDFlOTdhYyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9NYWtlZmlsZQ0K
Pj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2VmaWxlDQo+PiBAQCAtMTMsMTUgKzEz
LDYgQEAgTElCWExfU1JDX0RJUiA9IC4uLy4uL2xpYnhsDQo+PiAuUEhPTlk6IGFsbA0KPj4gYWxs
OiBidWlsZA0KPj4gDQo+PiAtR09YTF9HRU5fRklMRVMgPSB0eXBlcy5nZW4uZ28gaGVscGVycy5n
ZW4uZ28NCj4gVGhlIGJ1aWxkIHRhcmdldCBpbiBnb2xhbmcveGVubGlnaHQvTWFrZWZpbGUgc3Rp
bGwgdXNlcyB0aGlzIHZhcmlhYmxlDQo+IGFmdGVyIHJldmVydGluZyB0aGlzIHBhdGNoLiAkKEdP
WExfR0VOX0ZJTEVTKSB3aWxsIGJlIGVtcHR5IG5vdywgbWVhbmluZw0KPiBgbWFrZSBidWlsZGAg
d2lsbCBub3QgcmUtZ2VuZXJhdGUgKi5nZW4uZ28gaWYgYSBjaGFuZ2Ugd2FzIG1hZGUgdG8NCj4g
Z2VuZ290eXBlcy5weS4NCg0KT29wcyDigJQgZ29vZCBjYXRjaC4gIHYyIG9uIHRoZSB3YXkuDQoN
CiAtR2Vvcmdl

