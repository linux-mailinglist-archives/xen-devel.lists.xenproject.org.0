Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C9146C99
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:25:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueI1-0007gg-2v; Thu, 23 Jan 2020 15:21:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7kHC=3M=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1iueHz-0007ga-QP
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:20:59 +0000
X-Inumbo-ID: f4d6db7c-3df3-11ea-be5f-12813bfff9fa
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.70.110]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4d6db7c-3df3-11ea-be5f-12813bfff9fa;
 Thu, 23 Jan 2020 15:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLwt+4v+lycYdOoKn36ICC66rTgCc7kMJHcKVf5Bmak55+T/ZDnSjDlWfryHlfe9j7Yc44tmub9eOiixOTEZexHpU4CKwUZ5s/8jU49nZXnN4rtRPJ4uvPmWkXEqWsRfPLyHmu54FWeHS/SkJEp4eS4HdcHh/Npp8ohIyzuzODC+Z0etMuQRrBKStV7fGu+lyhC9ZHL2Qv2O6uZZowQcIrZZ9zHtmfnA8r+D+1Dn0QsLo65yN74chnH7/11F9tSwrDSoFODlbU7LleDF5oHHOIhHyvzL21Zfyzrx8TkTV2l+SP5qYueYYpP7C0NoriQ8n/sNxQN8Q3rE58V+xhMJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8/LivvNoGoUdHMTsMWP6Fml+/K1S6wqN0qc1aVpgCk=;
 b=DcLShrCzySYlFG8MRmogHBocRDnouRgvzyp00FaL4bbK6CpRC3CZtDE/Q5YVU/mP0EdS96GzL7JjaJ0FWC0W2JVKCEggq34VS1nqH8jFcPp1XwdRt2sRN4zi6LeLB/r1mW21Ep5qV/mn1z68MKTsrFyUQ3YkPKyelY1LHfgvlG1CbIjeRXO1n4tyEzTWzr/3YZ81SHoSZog+FGUg5E/uAnv0K+uuZ1exj+6gQMe7LyPG4cDwimnqpkjjuA1xZnqweySN5Tz73exmxn/owOvip/47JrkuDqdYi9fQnanDQzPbRoR/4AgPdN26GUSYOw1rjiWjdG5qzbpusX1TSt2r9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8/LivvNoGoUdHMTsMWP6Fml+/K1S6wqN0qc1aVpgCk=;
 b=VzRUqVdfGZQu/QTp0kLo6FGq+/eTg6jdPvB7TNWq0Y+YpvXXn6AegFky2kdTOp6qigAKz4r24f9Me4LO7BlHQliFvjCnun+PjzuPrsWMJeOasdGGUkz3m/54Cx2orDW/jN689+Odrgr+UokkUiyiSRjfrpg4j1C20u+8mZvPIWk=
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com (52.132.149.16) by
 MW2PR2101MB1113.namprd21.prod.outlook.com (52.132.149.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.12; Thu, 23 Jan 2020 15:20:56 +0000
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::d561:cbc4:f1a:e5fe]) by MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::d561:cbc4:f1a:e5fe%9]) with mapi id 15.20.2686.013; Thu, 23 Jan 2020
 15:20:56 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Thread-Topic: [PATCH v4 2/7] x86/hyperv: setup hypercall page
Thread-Index: AQHV0WHc3YI15L4ktUefA+4TX5s0hKf4GveAgABBBeA=
Date: Thu, 23 Jan 2020 15:20:56 +0000
Message-ID: <MW2PR2101MB1052117683680CDB1DBFC54AD70F0@MW2PR2101MB1052.namprd21.prod.outlook.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
 <06b7abf9-69c2-9f62-d55a-d8c2e684557a@suse.com>
In-Reply-To: <06b7abf9-69c2-9f62-d55a-d8c2e684557a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-23T15:20:54.5877868Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=08f24227-399e-40c8-8a7c-b6e0b2ae4568;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8483e53a-7df1-4c07-b4a5-08d7a017d7ee
x-ms-traffictypediagnostic: MW2PR2101MB1113:|MW2PR2101MB1113:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB111350135CBC8B5A3D53C046D70F0@MW2PR2101MB1113.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(199004)(189003)(26005)(8990500004)(316002)(186003)(110136005)(10290500003)(478600001)(54906003)(7696005)(8676002)(4326008)(6506007)(2906002)(33656002)(53546011)(81166006)(55016002)(52536014)(8936002)(81156014)(66476007)(66556008)(86362001)(9686003)(66446008)(66946007)(5660300002)(64756008)(71200400001)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB1113;
 H:MW2PR2101MB1052.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cOU8diJNTC0n5iYSKGO4oIuT0JVDMRTknlmjOhV5rSqy5Wh+UWXCSp3MSTjffQlhHv6/iIynUhOfLKr+TDT52yeMg4kBBVN+R/sVEbaPz19rAKx7y/C5yhhKg9U/3jD0y0K1IRK+QEG7zdSc+aJn9wdrJIFp7E0mr1jbEB77jvqefvR6Iz3OJCUHZyp81mNXoumpO9RwJmy5NgvBcG8iF2E4tkpmv1UhdcktMxK3MsTCdKosZYzbit0YHGaa7m3DY2tI08rH9bIs/c78/Kz5qEhAcG+B6QNk33QekibDW6kezlZ9vnGL0i9B1MNNKBP7DJYnWSkIo/poQkibCRxV9D4uiJqxsgnQrqqUZGR6Th0JcE60cXBgd0XWiErvax2y3pQ8z+zgFMeE+22mhgZfYz6+WeElrGYtH0HlORSrZ8Z0grYV1kOVk3LWdoaLJ+10
x-ms-exchange-antispam-messagedata: CsiOKIUj6m9s0JyhRqyH2kdclv0cigLrkzQbZTkB68aaqH+mw+IOFkoy6sUKdPz7D38cX93gDKVs1wuor25NMM4RG12djHn3iIUveSBpHi+SP5dNCIIKIwLKlgaplTqySsj5ReO/HKmvXMMaXnzxIg==
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8483e53a-7df1-4c07-b4a5-08d7a017d7ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 15:20:56.2262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Df6AFZNIPhF6mGtHN74y51DrCVbbWcGK1pT2HE96DVUGux1PvLm0d2QrOYY91jnqr1c5lBa+rivk9aUywWllU36Ofn7hq8JtsTOF+Dy84Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1113
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiBTZW50OiBUaHVyc2RheSwgSmFu
dWFyeSAyMywgMjAyMCAzOjE5IEFNDQo+IA0KPiBPbiAyMi4wMS4yMDIwIDIxOjIzLCBXZWkgTGl1
IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMNCj4gPiArKysgYi94ZW4vYXJj
aC94ODYvZTgyMC5jDQo+ID4gQEAgLTM2LDYgKzM2LDIyIEBAIGJvb2xlYW5fcGFyYW0oImU4MjAt
dmVyYm9zZSIsIGU4MjBfdmVyYm9zZSk7DQo+ID4gIHN0cnVjdCBlODIwbWFwIGU4MjA7DQo+ID4g
IHN0cnVjdCBlODIwbWFwIF9faW5pdGRhdGEgZTgyMF9yYXc7DQo+ID4NCj4gPiArc3RhdGljIHVu
c2lnbmVkIGludCBmaW5kX3BoeXNfYWRkcl9iaXRzKHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHVp
bnQzMl90IGVheDsNCj4gPiArICAgIHVuc2lnbmVkIGludCBwaHlzX2JpdHMgPSAzNjsNCj4gPiAr
DQo+ID4gKyAgICBlYXggPSBjcHVpZF9lYXgoMHg4MDAwMDAwMCk7DQo+ID4gKyAgICBpZiAoIChl
YXggPj4gMTYpID09IDB4ODAwMCAmJiBlYXggPj0gMHg4MDAwMDAwOCApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgcGh5c19iaXRzID0gKHVpbnQ4X3QpY3B1aWRfZWF4KDB4ODAwMDAwMDgpOw0K
PiA+ICsgICAgICAgIGlmICggcGh5c19iaXRzID4gUEFERFJfQklUUyApDQo+ID4gKyAgICAgICAg
ICAgIHBoeXNfYml0cyA9IFBBRERSX0JJVFM7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAg
cmV0dXJuIHBoeXNfYml0czsNCj4gPiArfQ0KPiANCj4gSW5zdGVhZCBvZiB0aGlzLCBob3cgYWJv
dXQgcHVsbGluZyBmdXJ0aGVyIGFoZWFkIHRoZSBjYWxsIHRvDQo+IGVhcmx5X2NwdV9pbml0KCkg
aW4gc2V0dXAuYz8gKE90aGVyd2lzZSB0aGUgZnVuY3Rpb24gd2FudHMgdG8NCj4gYmUgX19pbml0
IGF0IGxlYXN0LikNCj4gDQo+ID4gQEAgLTM1Nyw2ICszNzMsMjEgQEAgc3RhdGljIHVuc2lnbmVk
IGxvbmcgX19pbml0IGZpbmRfbWF4X3Bmbih2b2lkKQ0KPiA+ICAgICAgICAgICAgICBtYXhfcGZu
ID0gZW5kOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfSFlQRVJWX0dVRVNU
DQo+ID4gKyAgICB7DQo+ID4gKwkvKg0KPiA+ICsJICogV2UgcmVzZXJ2ZSB0aGUgdG9wLW1vc3Qg
cGFnZSBmb3IgaHlwZXJjYWxsIHBhZ2UuIEFkanVzdA0KPiA+ICsJICogbWF4X3BmbiBpZiBuZWNl
c3NhcnkuDQo+ID4gKwkgKi8NCj4gPiArICAgICAgICB1bnNpZ25lZCBpbnQgcGh5c19iaXRzID0g
ZmluZF9waHlzX2FkZHJfYml0cygpOw0KPiA+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgaGNhbGxf
cGZuID0NCj4gPiArICAgICAgICAgICgoMXVsbCA8PCBwaHlzX2JpdHMpIC0gMSkgPj4gUEFHRV9T
SElGVDsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBtYXhfcGZuID49IGhjYWxsX3BmbiApDQo+
ID4gKyAgICAgICAgICBtYXhfcGZuID0gaGNhbGxfcGZuIC0gMTsNCj4gPiArICAgIH0NCj4gPiAr
I2VuZGlmDQo+IA0KPiBUaGlzIHdhbnRzIGFic3RyYWN0aW5nIGF3YXk6IFRoZXJlIHNob3VsZG4n
dCBiZSBIeXBlci1WIHNwZWNpZmljDQo+IGNvZGUgaW4gaGVyZSBpZiBhdCBhbGwgcG9zc2libGUs
IGFuZCB0aGUgYWRqdXN0bWVudCBhbHNvIHNob3VsZG4ndA0KPiBiZSBtYWRlIHVubGVzcyBhY3R1
YWxseSBydW5uaW5nIG9uIEh5cGVyLVYuDQo+IA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5
cGVydi5jDQo+ID4gQEAgLTE4LDE3ICsxOCwyNyBAQA0KPiA+ICAgKg0KPiA+ICAgKiBDb3B5cmln
aHQgKGMpIDIwMTkgTWljcm9zb2Z0Lg0KPiA+ICAgKi8NCj4gPiArI2luY2x1ZGUgPHhlbi92ZXJz
aW9uLmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiANCj4gUGxlYXNlIHNvcnQgYWxw
aGFiZXRpY2FsbHkuDQo+IA0KPiA+ICsjaW5jbHVkZSA8YXNtL2ZpeG1hcC5oPg0KPiA+ICAjaW5j
bHVkZSA8YXNtL2d1ZXN0Lmg+DQo+ID4gICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMu
aD4NCj4gPiArI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4NCj4gPg0KPiA+ICBzdHJ1Y3QgbXNf
aHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7DQo+ID4NCj4gPiAtc3RhdGljIGNv
bnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7DQo+ID4gLSAgICAubmFtZSA9ICJIeXBl
ci1WIiwNCj4gPiAtfTsNCj4gPiArc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZv
aWQpDQo+ID4gK3sNCj4gPiArICAgIHVpbnQ2NF90IGlkID0gMDsNCj4gDQo+IFBvaW50bGVzcyBp
bml0aWFsaXplci4NCj4gDQo+ID4gKyAgICBpZCA9ICh1aW50NjRfdClIVl9YRU5fVkVORE9SX0lE
IDw8IDQ4Ow0KPiA+ICsgICAgaWQgfD0gKHhlbl9tYWpvcl92ZXJzaW9uKCkgPDwgMTYpIHwgeGVu
X21pbm9yX3ZlcnNpb24oKTsNCj4gPiArDQo+ID4gKyAgICByZXR1cm4gaWQ7DQo+ID4gK30NCj4g
Pg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wczsNCj4gPiAgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpDQo+IA0K
PiBCbGFuayBsaW5lIGJldHdlZW4gdGhlc2UgdHdvIHBsZWFzZSAoaWYgeW91IGNhbid0IGdldCBh
d2F5IHdpdGhvdXQNCj4gdGhpcyBkZWNsYXJhdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UpLg0KPiAN
Cj4gPiBAQCAtNzIsNiArODIsNDMgQEAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2lu
aXQgaHlwZXJ2X3Byb2JlKHZvaWQpDQo+ID4gICAgICByZXR1cm4gJm9wczsNCj4gPiAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQ0KPiA+
ICt7DQo+ID4gKyAgICB1bmlvbiBodl94NjRfbXNyX2h5cGVyY2FsbF9jb250ZW50cyBoeXBlcmNh
bGxfbXNyOw0KPiA+ICsgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgZ3Vlc3RfaWQ7DQo+ID4gKyAg
ICB1bnNpZ25lZCBsb25nIG1mbjsNCj4gPiArDQo+ID4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9H
VUVTVF9PU19JRCwgZ3Vlc3RfaWQucmF3KTsNCj4gPiArICAgIGlmICggIWd1ZXN0X2lkLnJhdyAp
DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgZ3Vlc3RfaWQucmF3ID0gZ2VuZXJhdGVfZ3Vlc3Rf
aWQoKTsNCj4gPiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9HVUVTVF9PU19JRCwgZ3Vlc3Rf
aWQucmF3KTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9I
WVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsNCj4gPiArICAgIGlmICggIWh5cGVy
Y2FsbF9tc3IuZW5hYmxlICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBtZm4gPSAoKDF1bGwg
PDwgcGFkZHJfYml0cykgLSAxKSA+PiBIVl9IWVBfUEFHRV9TSElGVDsNCj4gDQo+IEFsb25nIHRo
ZSBsaW5lcyBvZiB0aGUgYWJzdHJhY3RpbmctYXdheSByZXF1ZXN0IGFib3ZlOiBIb3cgaXMNCj4g
YW55b25lIHRvIG5vdGljZSB3aGF0IGVsc2UgbmVlZHMgY2hhbmdpbmcgaWYgaXQgaXMgZGVjaWRl
ZA0KPiB0aGF0IHRoaXMgcGFnZSBnZXRzIG1vdmVkIGVsc2V3aGVyZT8NCj4gDQo+ID4gKyAgICAg
ICAgaHlwZXJjYWxsX21zci5lbmFibGUgPSAxOw0KPiA+ICsgICAgICAgIGh5cGVyY2FsbF9tc3Iu
Z3Vlc3RfcGh5c2ljYWxfYWRkcmVzcyA9IG1mbjsNCj4gPiArICAgICAgICB3cm1zcmwoSFZfWDY0
X01TUl9IWVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsNCj4gDQo+IFNvIG9uIEh5
cGVyLVYgdGhlIGh5cGVydmlzb3IgbWFnaWNhbGx5IHBvcHVsYXRlcyB0aGlzIHBhZ2UgYXMNCj4g
YSBzaWRlIGVmZmVjdCBvZiB0aGUgTVNSIHdyaXRlPw0KPiANCg0KWWVzLCB0aGF0J3MgZXhhY3Rs
eSB3aGF0IGhhcHBlbnMuIDotKSAgSHlwZXItViB0YWtlcyB0aGUgZ3Vlc3QNCnBoeXNpY2FsIGFk
ZHJlc3MgYW5kIHJlbWFwcyBpdCB0byBhIGRpZmZlcmVudCBwaHlzaWNhbCBwYWdlIHRoYXQNCkh5
cGVyLVYgaGFzIHNldCB1cCB3aXRoIHdoYXRldmVyIGlzIG5lZWRlZCB0byBleGVjdXRlIHRoZSBo
eXBlcmNhbGwNCnNlcXVlbmNlLiBUaGUgb3JpZ2luYWwgcGh5c2ljYWwgcGFnZSBjb3JyZXNwb25k
aW5nIHRvIHRoZSBndWVzdCBwaHlzaWNhbA0KYWRkcmVzcyBpcyBub3QgbW9kaWZpZWQsIGJ1dCBp
dCByZW1haW5zIHVudXNlZCBhbmQgaW5hY2Nlc3NpYmxlIHRvIHRoZQ0KZ3Vlc3QuICBXaGVuL2lm
IHRoZSBNU1IgaXMgd3JpdHRlbiBhZ2FpbiB3aXRoIHRoZSBlbmFibGUgZmxhZyBzZXQgdG8gMCwN
CnRoZSBtYXBwaW5nIGlzIGZsaXBwZWQgYmFjaywgYW5kIHRoZSBvcmlnaW5hbCBwaHlzaWNhbCBw
YWdlLCB3aXRoIGl0cw0Kb3JpZ2luYWwgY29udGVudHMsIHJlYXBwZWFycy4gVGhlcmUgYXJlIGEg
ZmV3IG90aGVyIHBhZ2VzIHdpdGggdGhpcw0Kc2FtZSBiZWhhdmlvci4gIFRoZSBIeXBlci1WIFRM
RlMgcmVmZXJzIHRvIHRoZXNlICJHUEEgT3ZlcmxheQ0KUGFnZXMiLiAgU2VlIFNlY3Rpb24gNS4y
LjEgb2YgdGhlIFRMRlMuDQoNCk1pY2hhZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
