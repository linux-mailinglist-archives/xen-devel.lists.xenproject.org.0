Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241B5FA1A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:30:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2hr-0001YE-Fa; Thu, 04 Jul 2019 14:27:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj2hp-0001Y9-M0
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:27:25 +0000
X-Inumbo-ID: cb36b263-9e67-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb36b263-9e67-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:27:24 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 14:27:03 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 14:22:21 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 14:22:20 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3204.namprd18.prod.outlook.com (10.255.137.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 14:22:19 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 14:22:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 05/23] x86emul: support AVX512F gather insns
Thread-Index: AQHVL/7DlmNHyySWV0mdXoNuP5HddKa6hJxbgAADJ4A=
Date: Thu, 4 Jul 2019 14:22:19 +0000
Message-ID: <04b38838-ccc2-ca9e-32ec-3348019281b5@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <95252da8-777b-9527-6f5b-1e1a5994f845@suse.com>
 <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
In-Reply-To: <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 866053fd-f63c-40f6-df29-08d7008b05bd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3204; 
x-ms-traffictypediagnostic: BY5PR18MB3204:
x-microsoft-antispam-prvs: <BY5PR18MB3204E61E79B230C45EECBC65B3FA0@BY5PR18MB3204.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(52314003)(189003)(199004)(478600001)(71190400001)(6116002)(66066001)(71200400001)(3846002)(2501003)(486006)(72206003)(316002)(36756003)(68736007)(81156014)(256004)(81166006)(6512007)(14454004)(8676002)(186003)(53936002)(6436002)(8936002)(229853002)(5660300002)(6486002)(11346002)(305945005)(6246003)(110136005)(99286004)(2616005)(476003)(54906003)(102836004)(26005)(386003)(31686004)(2906002)(7736002)(52116002)(76176011)(446003)(6506007)(53546011)(64756008)(66446008)(66556008)(66476007)(66946007)(86362001)(73956011)(31696002)(25786009)(80792005)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3204;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yquk1RsuHaWhAOw/e0wJL3nBsII83TCorgahl/iU6Q3x26gcGluPA9JeQ+6uzIt2omQCdlcZ2F1C+lln2SjJE9MjRrtHQW51HcigC49V0gIPTXU7xea4ap/hauTFqjjODcSJio15JA0ftmsKme4+6KtopD95fLNT+9Z+xzuRIM4X5pi4vg4pAsnbXU5Igl2zmbjgjJhAPFuvCQZ3420TUFWHdbkvDY9dG1tKsI9slz2zgXKD8uAelOd1JMcT9L0ugykHN1DMgFr09lpXNCDp3LzXE1wVsHrmywjzfNButAXrT24/+XE60h3omShHm/MFW6ZcgvY1RGt99ejdNsJ0ws3r5xN1GCzAliVrnVZSKqncuQKa7/KFNte4ue+CrXu1iDCgRiBFNsLYElIYpCDrcRH01cmjUcGGG3jUpXqg1SU=
Content-ID: <28DACE1523DED64094AC4195DF655944@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 866053fd-f63c-40f6-df29-08d7008b05bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 14:22:19.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3204
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v9 05/23] x86emul: support AVX512F gather
 insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxNjoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDcvMjAx
OSAxMjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4
Nl9lbXVsYXRlLmMNCj4+IEBAIC05MTAwLDYgKzkxMDAsMTMzIEBAIHg4Nl9lbXVsYXRlKA0KPj4g
ICAgICAgICAgICBwdXRfc3R1YihzdHViKTsNCj4+ICAgIA0KPj4gICAgICAgICAgICBpZiAoIHJj
ICE9IFg4NkVNVUxfT0tBWSApDQo+PiArICAgICAgICAgICAgZ290byBkb25lOw0KPj4gKw0KPj4g
KyAgICAgICAgc3RhdGUtPnNpbWRfc2l6ZSA9IHNpbWRfbm9uZTsNCj4+ICsgICAgICAgIGJyZWFr
Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBm
MzgsIDB4OTApOiAvKiB2cGdhdGhlcmR7ZCxxfSBtZW0sW3h5el1tbXtrfSAqLw0KPj4gKyAgICBj
YXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDkxKTogLyogdnBnYXRoZXJxe2QscX0g
bWVtLFt4eXpdbW17a30gKi8NCj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYz
OCwgMHg5Mik6IC8qIHZnYXRoZXJkcHtzLGR9IG1lbSxbeHl6XW1te2t9ICovDQo+PiArICAgIGNh
c2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4OTMpOiAvKiB2Z2F0aGVycXB7cyxkfSBt
ZW0sW3h5el1tbXtrfSAqLw0KPj4gKyAgICB7DQo+PiArICAgICAgICB0eXBlb2YoZXZleCkgKnBl
dmV4Ow0KPj4gKyAgICAgICAgdW5pb24gew0KPj4gKyAgICAgICAgICAgIGludDMyX3QgZHdbMTZd
Ow0KPj4gKyAgICAgICAgICAgIGludDY0X3QgcXdbOF07DQo+PiArICAgICAgICB9IGluZGV4Ow0K
Pj4gKyAgICAgICAgYm9vbCBkb25lID0gZmFsc2U7DQo+PiArDQo+PiArICAgICAgICBBU1NFUlQo
ZWEudHlwZSA9PSBPUF9NRU0pOw0KPj4gKyAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCgh
ZXZleC5vcG1zayB8fCBldmV4LmJycyB8fCBldmV4LnogfHwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZXZleC5yZWcgIT0gMHhmIHx8DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1vZHJtX3JlZyA9PSBzdGF0ZS0+c2liX2luZGV4KSwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBFWENfVUQpOw0KPj4gKyAgICAgICAgYXZ4NTEyX3ZsZW5f
Y2hlY2soZmFsc2UpOw0KPj4gKyAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEy
Zik7DQo+PiArICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBVX3ptbSk7DQo+PiArDQo+PiArICAg
ICAgICAvKiBSZWFkIGRlc3RpbmF0aW9uIGFuZCBpbmRleCByZWdpc3RlcnMuICovDQo+PiArICAg
ICAgICBvcGMgPSBpbml0X2V2ZXgoc3R1Yik7DQo+PiArICAgICAgICBwZXZleCA9IGNvcHlfRVZF
WChvcGMsIGV2ZXgpOw0KPj4gKyAgICAgICAgcGV2ZXgtPm9wY3ggPSB2ZXhfMGY7DQo+PiArICAg
ICAgICBvcGNbMF0gPSAweDdmOyAvKiB2bW92ZHFhezMyLDY0fSAqLw0KPj4gKyAgICAgICAgLyoN
Cj4+ICsgICAgICAgICAqIFRoZSByZWdpc3RlciB3cml0ZWJhY2sgYmVsb3cgaGFzIHRvIHJldGFp
biBtYXNrZWQtb2ZmIGVsZW1lbnRzLCBidXQNCj4+ICsgICAgICAgICAqIG5lZWRzIHRvIGNsZWFy
IHVwcGVyIHBvcnRpb25zIGluIHRoZSBpbmRleC13aWRlci10aGFuLWRhdGEgY2FzZXMuDQo+PiAr
ICAgICAgICAgKiBUaGVyZWZvcmUgcmVhZCAoYW5kIHdyaXRlIGJlbG93KSB0aGUgZnVsbCByZWdp
c3Rlci4gVGhlIGFsdGVybmF0aXZlDQo+PiArICAgICAgICAgKiB3b3VsZCBoYXZlIGJlZW4gdG8g
ZmlkZGxlIHdpdGggdGhlIG1hc2sgcmVnaXN0ZXIgdXNlZC4NCj4+ICsgICAgICAgICAqLw0KPj4g
KyAgICAgICAgcGV2ZXgtPm9wbXNrID0gMDsNCj4+ICsgICAgICAgIC8qIFVzZSAoJXJheCkgYXMg
ZGVzdGluYXRpb24gYW5kIG1vZHJtX3JlZyBhcyBzb3VyY2UuICovDQo+PiArICAgICAgICBwZXZl
eC0+YiA9IDE7DQo+PiArICAgICAgICBvcGNbMV0gPSAobW9kcm1fcmVnICYgNykgPDwgMzsNCj4+
ICsgICAgICAgIHBldmV4LT5SWCA9IDE7DQo+PiArICAgICAgICBvcGNbMl0gPSAweGMzOw0KPj4g
Kw0KPj4gKyAgICAgICAgaW52b2tlX3N0dWIoIiIsICIiLCAiPW0iICgqbW12YWxwKSA6ICJhIiAo
bW12YWxwKSk7DQo+PiArDQo+PiArICAgICAgICBwZXZleC0+cGZ4ID0gdmV4X2YzOyAvKiB2bW92
ZHF1ezMyLDY0fSAqLw0KPj4gKyAgICAgICAgcGV2ZXgtPncgPSBiICYgMTsNCj4+ICsgICAgICAg
IC8qIFN3aXRjaCB0byBzaWJfaW5kZXggYXMgc291cmNlLiAqLw0KPj4gKyAgICAgICAgcGV2ZXgt
PnIgPSAhbW9kZV82NGJpdCgpIHx8ICEoc3RhdGUtPnNpYl9pbmRleCAmIDB4MDgpOw0KPj4gKyAg
ICAgICAgcGV2ZXgtPlIgPSAhbW9kZV82NGJpdCgpIHx8ICEoc3RhdGUtPnNpYl9pbmRleCAmIDB4
MTApOw0KPj4gKyAgICAgICAgb3BjWzFdID0gKHN0YXRlLT5zaWJfaW5kZXggJiA3KSA8PCAzOw0K
Pj4gKw0KPj4gKyAgICAgICAgaW52b2tlX3N0dWIoIiIsICIiLCAiPW0iIChpbmRleCkgOiAiYSIg
KCZpbmRleCkpOw0KPj4gKyAgICAgICAgcHV0X3N0dWIoc3R1Yik7DQo+PiArDQo+PiArICAgICAg
ICAvKiBDbGVhciB1bnRvdWNoZWQgcGFydHMgb2YgdGhlIGRlc3RpbmF0aW9uIGFuZCBtYXNrIHZh
bHVlcy4gKi8NCj4+ICsgICAgICAgIG4gPSAxIDw8ICgyICsgZXZleC5sciAtICgoYiAmIDEpIHwg
ZXZleC53KSk7DQo+PiArICAgICAgICBvcF9ieXRlcyA9IDQgPDwgZXZleC53Ow0KPj4gKyAgICAg
ICAgbWVtc2V0KCh2b2lkICopbW12YWxwICsgbiAqIG9wX2J5dGVzLCAwLCA2NCAtIG4gKiBvcF9i
eXRlcyk7DQo+PiArICAgICAgICBvcF9tYXNrICY9ICgxIDw8IG4pIC0gMTsNCj4+ICsNCj4+ICsg
ICAgICAgIGZvciAoIGkgPSAwOyBvcF9tYXNrOyArK2kgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAg
ICAgICAgICAgIHNpZ25lZCBsb25nIGlkeCA9IGIgJiAxID8gaW5kZXgucXdbaV0gOiBpbmRleC5k
d1tpXTsNCj4gDQo+IE5vIHNpZ25lZC4NCg0KSG1tIC0gd291bGQgeW91IG1pbmQgdGhpcyByZW1h
aW5pbmcgY29uc2lzdGVudCB3aXRoIHRoZSBBVlgNCmNvdW50ZXJwYXJ0IGNvZGU/IChBcyBhbiBh
c2lkZSBJIGNvbnRpbnVlIHRvIHRoaW5rIGl0IGlzIGEgYmFkDQp0aGluZyB0byBub3QgaGF2ZSBl
eHBsaWNpdCAic2lnbmVkIiB3aGVuIHdlIGFjdHVhbGx5IG1lYW4gc2lnbmVkDQpxdWFudGl0aWVz
LCBzZWVpbmcgdGhlIHN0aWxsIGxhcmdlIGFtb3VudCBvZiBwbGFpbiBzaG9ydC9pbnQvbG9uZw0K
dXNlcyB0aGF0IGFjdHVhbGx5IHNob3VsZCBiZSB1bnNpZ25lZC4pDQoNCj7CoCBIb3dldmVyLCBz
dXJlbHkgdGhpcyBuZWVkcyB0byBiZSBpbnQ2NF90IGFueXdheSwgdG8gZnVuY3Rpb24NCj4gY29y
cmVjdGx5IGluIGEgMzJiaXQgYnVpbGQgb2YgdGhlIHRlc3QgaGFybmVzcz8NCg0KTm8sIG9ubHkg
MzIgYml0cyAob3IgbGVzcywgd2hlbiB0aGUgc2NhbGUgZmFjdG9yIGlzIGxhcmdlciB0aGFuIDEp
DQp3aWxsIGJlIHVzZWQgZm9yIGFkZHJlc3MgY2FsY3VsYXRpb24uIEFuZCBhZ2FpbiB0aGlzIGlz
IG5vDQpkaWZmZXJlbnQgZnJvbSBwcmUtZXhpc3RpbmcgQVZYIGNvZGUuDQoNCj4gVGhlIFNETSBz
YXlzIFZQR0FUSEVSUUQgaXMgZW5jb2RhYmxlIGluIDMyYml0IHdpdGggcXVhZHdvcmQgaW5kaWNl
cy4NCg0KU3VyZSwgdHJ1bmNhdGluZyB0byBqdXN0IDMyLWJpdCB2YWx1ZXMgZHVlIHRvIDMyLWJp
dCBhZGRyZXNzaW5nLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
