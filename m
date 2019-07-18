Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A17E6CFB5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:31:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7Oj-0006K3-Ju; Thu, 18 Jul 2019 14:28:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho7Oi-0006Jy-5J
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:28:40 +0000
X-Inumbo-ID: 5218c667-a968-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5218c667-a968-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:28:38 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 14:28:32 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 14:28:19 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 14:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcZ2LtxdlzICa7MUt2dogKYfYq1WgClIJoQmbNWnX2WO62XW2AZBFHlsuP/WAs0b2KNulEvoTeHHBFr/zkICDvJnzNhY6Zb81ysGD/tU0NIvGeSrCq1O1wm9LVVfqYJu/OEfYFkBagb+hzPlQYC829Z8eXaf+Hcmvlq1K1j+5mwaJ6S6Y7CfQrtxzEPO4iIH9g/kQMpPAwvxgfxfb+pLDCX2U604Jbv56KDt8ff3dkpSca6EYtx2X/ywXX5zYZmA/vNUDRzPsMVSOhM2NGGxRoeTGAT4fFKnP+H3vsZ+JP+KWQD6C7M7wm0NnooJYvioEL6y7kjIZc3kGOzJtr/0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+kBLf8I0/5WQRoaEKDKffxPZOvI3M9u2+BoZoszg/A=;
 b=VkHDxnVzZLvdyyptha1+SDInnr19xwFV4eRVHVZ474kuklgB7E4MoZuJS4xJOsxMmAe/4FMUMgFjdTkFD9gGSFFfA86RLxGN17F8QW/pa828GomoG8UxbWqn0CDDgWooyR8RbQRHcvBj/DoWnd38vrhLfluWp8IZsrtX5+1hsWSUYyWe9394dGmkS5FfZy21cYfg6132OIKhc/I8QjbtJtyV0wDpIkN7A1hypUJ6SnEr4tCmVU5DPNstyWIt7F1qCNbAKVAPF+S5YTuusurQsWIqQqH18myHMGBEJlrxeX2k4E0VOTWRbeSRr+fjI0LLQ59H/BmjZVHpY5jpd+GaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2619.namprd18.prod.outlook.com (20.179.106.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 14:28:18 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 14:28:18 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
Thread-Index: AQHVPNaoMN4/6VqHlEm91bwrx18tx6bQMluAgAAkhnuAAARMgIAAAL3BgAAFHgCAAAROh4AACw0A
Date: Thu, 18 Jul 2019 14:28:18 +0000
Message-ID: <f3fc709b-d959-07f3-c047-a1da24816e09@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
 <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
 <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
In-Reply-To: <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0032.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:55::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56eb9b58-ab60-4c72-ab55-08d70b8c2d78
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2619; 
x-ms-traffictypediagnostic: DM6PR18MB2619:
x-microsoft-antispam-prvs: <DM6PR18MB261981392ED419EF45A23969B3C80@DM6PR18MB2619.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(189003)(199004)(4326008)(36756003)(25786009)(305945005)(476003)(66556008)(66476007)(14454004)(66446008)(64756008)(486006)(6436002)(7736002)(5660300002)(186003)(26005)(6246003)(316002)(31686004)(54906003)(256004)(81156014)(81166006)(99286004)(478600001)(53936002)(3846002)(68736007)(6512007)(6486002)(71190400001)(14444005)(446003)(6916009)(86362001)(102836004)(76176011)(229853002)(71200400001)(6116002)(31696002)(53546011)(8676002)(80792005)(2906002)(386003)(6506007)(2616005)(8936002)(66066001)(66946007)(52116002)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2619;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hMvSmAGJVk9cGuL/p2V3pGSjYmxBXjcPEJSFr7WR84iL3NSlPeQzt+vIJscW40TwfkYXiIkSKJHUACmmVSal0ftVpGiuGec2z2FZZ2nD7FZWmtWr0oqSDoNsncGobmENiERZvE5kKFekdLgGJ8dLyiXT//HDuS6QxqpuUykO/8nO5L9kWiCRtAq3kIB2RMnpkSXuI9BszJvC2cbDTINdl5suGRlWEfg0dFEDR89Ms3rb5ioziYviQwPElFJZNdwS8MPUaUeldT7Xin7usp0rgS1nzm/T28z4KApj0Xdu8lV2jUEULph0Lxyfw76JBxDqJseE+diIl4VUe6EIs8jbGCYtHzXIMBULC4jkwOsiP0UJhjpsSWOoAqEqneRNEla54B4F8IzgPOB5nqCoEI6o2GRyPekP9ORy1yyFZaHrJ0g=
Content-ID: <103A5F15ACB7254CAEFFCFB6378674DE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56eb9b58-ab60-4c72-ab55-08d70b8c2d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 14:28:18.5052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2619
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNTo0NywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCA3OjMzIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMTguMDcuMjAxOSAxNToxMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0K
Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDc6MTIgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMTguMDcuMjAxOSAxNDo1NSwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDo0NyBBTSBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+IE9uIDE3LjA3LjIw
MTkgMjE6MzMsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+Pj4+Pj4gQEAgLTkwMCw2ICs4OTUs
NyBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2Zu
LCBzaHJfaGFuZGxlX3Qgc2gsDQo+Pj4+Pj4+ICAgICAgICAgIHAybV90eXBlX3Qgc21mbl90eXBl
LCBjbWZuX3R5cGU7DQo+Pj4+Pj4+ICAgICAgICAgIHN0cnVjdCB0d29fZ2ZucyB0ZzsNCj4+Pj4+
Pj4gICAgICAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Igcmk7DQo+Pj4+Pj4+ICsgICAgdW5zaWdu
ZWQgbG9uZyBwdXRfY291bnQgPSAwOw0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgICBnZXRfdHdv
X2dmbnMoc2QsIHNnZm4sICZzbWZuX3R5cGUsIE5VTEwsICZzbWZuLA0KPj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgY2QsIGNnZm4sICZjbWZuX3R5cGUsIE5VTEwsICZjbWZuLCAwLCAmdGcp
Ow0KPj4+Pj4+PiBAQCAtOTY0LDE1ICs5NjAsNiBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0
cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsDQo+Pj4+Pj4+ICAg
ICAgICAgICAgICBnb3RvIGVycl9vdXQ7DQo+Pj4+Pj4+ICAgICAgICAgIH0NCj4+Pj4+Pj4NCj4+
Pj4+Pj4gLSAgICAvKiBBY3F1aXJlIGFuIGV4dHJhIHJlZmVyZW5jZSwgZm9yIHRoZSBmcmVlaW5n
IGJlbG93IHRvIGJlIHNhZmUuICovDQo+Pj4+Pj4+IC0gICAgaWYgKCAhZ2V0X3BhZ2UoY3BhZ2Us
IGRvbV9jb3cpICkNCj4+Pj4+Pj4gLSAgICB7DQo+Pj4+Pj4+IC0gICAgICAgIHJldCA9IC1FT1ZF
UkZMT1c7DQo+Pj4+Pj4+IC0gICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBn
KTsNCj4+Pj4+Pj4gLSAgICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2soZmlyc3RwZyk7DQo+
Pj4+Pj4+IC0gICAgICAgIGdvdG8gZXJyX291dDsNCj4+Pj4+Pj4gLSAgICB9DQo+Pj4+Pj4+IC0N
Cj4+Pj4+Pj4gICAgICAgICAgLyogTWVyZ2UgdGhlIGxpc3RzIHRvZ2V0aGVyICovDQo+Pj4+Pj4+
ICAgICAgICAgIHJtYXBfc2VlZF9pdGVyYXRvcihjcGFnZSwgJnJpKTsNCj4+Pj4+Pj4gICAgICAg
ICAgd2hpbGUgKCAoZ2ZuID0gcm1hcF9pdGVyYXRlKGNwYWdlLCAmcmkpKSAhPSBOVUxMKQ0KPj4+
Pj4+PiBAQCAtOTg0LDEzICs5NzEsMTQgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3Qg
ZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLA0KPj4+Pj4+PiAgICAgICAg
ICAgICAgICogRG9uJ3QgY2hhbmdlIHRoZSB0eXBlIG9mIHJtYXAgZm9yIHRoZSBjbGllbnQgcGFn
ZS4gKi8NCj4+Pj4+Pj4gICAgICAgICAgICAgIHJtYXBfZGVsKGdmbiwgY3BhZ2UsIDApOw0KPj4+
Pj4+PiAgICAgICAgICAgICAgcm1hcF9hZGQoZ2ZuLCBzcGFnZSk7DQo+Pj4+Pj4+IC0gICAgICAg
IHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsNCj4+Pj4+Pj4gKyAgICAgICAgcHV0X2NvdW50Kys7
DQo+Pj4+Pj4+ICAgICAgICAgICAgICBkID0gZ2V0X2RvbWFpbl9ieV9pZChnZm4tPmRvbWFpbik7
DQo+Pj4+Pj4+ICAgICAgICAgICAgICBCVUdfT04oIWQpOw0KPj4+Pj4+PiAgICAgICAgICAgICAg
QlVHX09OKHNldF9zaGFyZWRfcDJtX2VudHJ5KGQsIGdmbi0+Z2ZuLCBzbWZuKSk7DQo+Pj4+Pj4+
ICAgICAgICAgICAgICBwdXRfZG9tYWluKGQpOw0KPj4+Pj4+PiAgICAgICAgICB9DQo+Pj4+Pj4+
ICAgICAgICAgIEFTU0VSVChsaXN0X2VtcHR5KCZjcGFnZS0+c2hhcmluZy0+Z2ZucykpOw0KPj4+
Pj4+PiArICAgIEJVR19PTighcHV0X2NvdW50KTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgICAg
LyogQ2xlYXIgdGhlIHJlc3Qgb2YgdGhlIHNoYXJlZCBzdGF0ZSAqLw0KPj4+Pj4+PiAgICAgICAg
ICBwYWdlX3NoYXJpbmdfZGlzcG9zZShjcGFnZSk7DQo+Pj4+Pj4+IEBAIC0xMDAxLDcgKzk4OSw5
IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4s
IHNocl9oYW5kbGVfdCBzaCwNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgICAgLyogRnJlZSB0aGUg
Y2xpZW50IHBhZ2UgKi8NCj4+Pj4+Pj4gICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKGNwYWdl
KTsNCj4+Pj4+Pj4gLSAgICBwdXRfcGFnZShjcGFnZSk7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAg
ICB3aGlsZSAoIHB1dF9jb3VudC0tICkNCj4+Pj4+Pj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5
cGUoY3BhZ2UpOw0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgICAvKiBXZSBtYW5hZ2VkIHRvIGZy
ZWUgYSBkb21haW4gcGFnZS4gKi8NCj4+Pj4+Pj4gICAgICAgICAgYXRvbWljX2RlYygmbnJfc2hh
cmVkX21mbnMpOw0KPj4+Pj4+PiBAQCAtMTE2NSwxOSArMTE1NSwxMyBAQCBpbnQgX19tZW1fc2hh
cmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+Pj4gICAgICAgICAgew0K
Pj4+Pj4+PiAgICAgICAgICAgICAgaWYgKCAhbGFzdF9nZm4gKQ0KPj4+Pj4+PiAgICAgICAgICAg
ICAgICAgIG1lbV9zaGFyaW5nX2dmbl9kZXN0cm95KHBhZ2UsIGQsIGdmbl9pbmZvKTsNCj4+Pj4+
Pj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4g
ICAgICAgICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHBhZ2UpOw0KPj4+Pj4+PiArDQo+
Pj4+Pj4+ICAgICAgICAgICAgICBpZiAoIGxhc3RfZ2ZuICkNCj4+Pj4+Pj4gLSAgICAgICAgew0K
Pj4+Pj4+PiAtICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZG9tX2NvdykgKQ0KPj4+
Pj4+PiAtICAgICAgICAgICAgew0KPj4+Pj4+PiAtICAgICAgICAgICAgICAgIHB1dF9nZm4oZCwg
Z2ZuKTsNCj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICBkb21haW5fY3Jhc2goZCk7DQo+Pj4+Pj4+
IC0gICAgICAgICAgICAgICAgcmV0dXJuIC1FT1ZFUkZMT1c7DQo+Pj4+Pj4+IC0gICAgICAgICAg
ICB9DQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOw0K
Pj4+Pj4+PiAtICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+Pj4+Pj4+IC0gICAgICAgIH0N
Cj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsNCj4+
Pj4+Pj4gICAgICAgICAgICAgIHB1dF9nZm4oZCwgZ2ZuKTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAg
ICAgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+DQo+Pj4+Pj4gLi4uIHRoaXMgKG1haW4sIGFzIEkg
Z3Vlc3MgYnkgdGhlIHRpdGxlKSBwYXJ0IG9mIHRoZSBjaGFuZ2U/IEkgdGhpbmsNCj4+Pj4+PiB5
b3Ugd2FudCB0byBleHBsYWluIHdoYXQgd2FzIHdyb25nIGhlcmUgYW5kL29yIHdoeSB0aGUgbmV3
IGFycmFuZ2VtZW50DQo+Pj4+Pj4gaXMgYmV0dGVyLiAoSSdtIHNvcnJ5LCBJIGd1ZXNzIGl0IHdh
cyB0aGlzIHdheSBvbiBwcmlvciB2ZXJzaW9ucw0KPj4+Pj4+IGFscmVhZHksIGJ1dCBhcHBhcmVu
dGx5IEkgZGlkbid0IG5vdGljZS4pDQo+Pj4+Pg0KPj4+Pj4gSXQncyB3aGF0IHRoZSBwYXRjaCBt
ZXNzYWdlIHNheXMgLSBjYWxsaW5nIHB1dF9wYWdlX2FuZF90eXBlIGJlZm9yZQ0KPj4+Pj4gbWVt
X3NoYXJpbmdfcGFnZV91bmxvY2sgY2FuIGNhdXNlIGEgZGVhZGxvY2suIFNpbmNlIG5vdyB3ZSBh
cmUgbm93DQo+Pj4+PiBob2xkaW5nIGEgcmVmZXJlbmNlIHRvIHRoZSBwYWdlIHRpbGwgdGhlIGVu
ZCB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUNCj4+Pj4+IGV4dHJhIGdldF9wYWdlL3B1dF9wYWdl
IGxvZ2ljIHdoZW4gd2UgYXJlIGRlYWxpbmcgd2l0aCB0aGUgbGFzdF9nZm4uDQo+Pj4+DQo+Pj4+
IFRoZSB0aXRsZSBzYXlzICJyZW9yZGVyIiB3aXRob3V0IGFueSAid2h5Ii4NCj4+Pg0KPj4+IFll
cywgSSBjYW4ndCByZWFzb25hYmx5IGZpdCAiQ2FsbGluZyBfcHV0X3BhZ2VfdHlwZSB3aGlsZSBh
bHNvIGhvbGRpbmcNCj4+PiB0aGUgcGFnZV9sb2NrIGZvciB0aGF0IHBhZ2UgY2FuIGNhdXNlIGEg
ZGVhZGxvY2suIiBpbnRvIHRoZSB0aXRsZS4gU28NCj4+PiBpdCdzIHNwZWxsZWQgb3V0IGluIHRo
ZSBwYXRjaCBtZXNzYWdlLg0KPj4NCj4+IE9mIGNvdXJzZSBub3QuIEFuZCBJIHJlYWxpemUgX3Bh
cnRfIG9mIHRoZSBjaGFuZ2VzIGlzIGluZGVlZCB3aGF0IHRoZQ0KPj4gdGl0bGUgc2F5cyAoYWx0
aG91Z2ggZm9yIHNoYXJlX3BhZ2VzKCkgdGhhdCdzIG5vdCBvYnZpb3VzIGZyb20gdGhlDQo+PiBw
YXRjaCBhbG9uZSkuIEJ1dCB5b3UgZG8gbW9yZTogWW91IGFsc28gYXZvaWQgYWNxdWlyaW5nIGFu
IGV4dHJhDQo+PiByZWZlcmVuY2UgaW4gc2hhcmVfcGFnZXMoKS4NCj4gDQo+IEkgZmVlbCBsaWtl
IHdlIGFyZSBnb2luZyBpbiBjaXJjbGVzIGFuZCBoYXZpbmcgdGhlIHNhbWUgY29udmVyc2F0aW9u
cw0KPiBvdmVyIGFuZCBvdmVyIHdpdGhvdXQgcmVhbGx5IG1ha2luZyBhbnkgaGVhZHdheS4gWW91
IGludHJvZHVjZWQNCj4gZ3JhYmJpbmcgdGhlIGJyb2tlbiBleHRyYSByZWZlcmVuY2UgaW4gMDUw
MmUwYWRhZTIuIEl0IGlzIGFuZCB3YXMNCj4gYWN0dWFsbHkgdW5uZWVkZWQgdG8gc3RhcnQgd2l0
aCBpZiB0aGUgcHJvcGVyIHNvbHV0aW9uIHdhcyBwdXQgaW4NCj4gcGxhY2UsIHdoaWNoIGlzIHdo
YXQgdGhpcyBwYXRjaCBkb2VzLCByZW9yZGVyaW5nIHRoaW5ncy4NCg0KSSdtIG5vdCBjb21wbGFp
bmluZyBhYm91dCB0aGUgY2hhbmdlczsgSSdkIG1lcmVseSBsaWtlIHRoZSBkZXNjcmlwdGlvbg0K
c3RhdGUgd2h5IHRoZXkncmUgbmVlZGVkLg0KDQo+PiBBbmQgc2luY2UgeW91IG1hZGUgbWUgbG9v
ayBhdCB0aGUgY29kZSBhZ2FpbjogSWYgcHV0X3BhZ2UoKSBpcyB1bnNhZmUNCj4+IHdpdGggYSBs
b2NrIGhlbGQsIGhvdyBjb21lIHRoZSBnZXRfcGFnZV9hbmRfdHlwZSgpIGluIHNoYXJlX3BhZ2Vz
KCkNCj4+IGlzIHNhZmUgd2l0aCB0d28gc3VjaCBsb2NrcyBoZWxkPyBJZiBpdCByZWFsbHkgaXMs
IGl0IHN1cmVseSB3b3VsZCBiZQ0KPj4gd29ydGh3aGlsZSB0byBzdGF0ZSBpbiB0aGUgZGVzY3Jp
cHRpb24uIFRoZXJlJ3MgYW5vdGhlciBzdWNoIGluc3RhbmNlDQo+PiBpbiBtZW1fc2hhcmluZ19h
ZGRfdG9fcGh5c21hcCgpIChwbHVzIGEgZ2V0X3BhZ2UoKSksIGFuZCBhbHNvIG9uZQ0KPj4gd2hl
cmUgcHV0X3BhZ2VfYW5kX3R5cGUoKSBnZXRzIGNhbGxlZCB3aXRoIHN1Y2ggYSBsb2NrIGhlbGQg
KGFmYWljcykuDQo+IA0KPiBJdCdzIHBvc3NpYmxlIHRoZXJlIGFyZSBvdGhlciBpbnN0YW5jZXMg
d2hlcmUgdGhpcyBtYXkgc3RpbGwgYmUNCj4gYnJva2VuLiBSaWdodCBub3cgSSBvbmx5IGhhdmUg
YmFuZHdpZHRoIHRvIHRlc3QgYW5kIGZpeCB0aGUgcGF0aHMgSQ0KPiB1c2UuIElmIHRoYXQncyB1
bmFjY2VwdGFibGUgSSdtIGhhcHB5IHRvIGNvbnRpbnVlIGRldmVsb3BtZW50IGluIG15DQo+IHBy
aXZhdGUgZm9yayBhbmQgbGVhdmUgdGhpbmdzIGFzLWlzIHVwc3RyZWFtLg0KDQpTaW1pbGFybHks
IGlmIHRoZXJlIGFyZSBsaW1pdGF0aW9ucyAtIGZpbmUuIEJ1dCBwbGVhc2Ugc2F5IHNvIGluIHRo
ZQ0KZGVzY3JpcHRpb24sIHRvIGF2b2lkIGdpdmluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZSBp
c3N1ZXMgaGF2ZSBiZWVuDQp0YWtlbiBjYXJlIG9mIGFsdG9nZXRoZXIuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
