Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A378BE7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:40:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4uH-0001KL-Vw; Mon, 29 Jul 2019 12:37:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs4uG-0001KF-SX
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:37:36 +0000
X-Inumbo-ID: 9fc24518-b1fd-11e9-8ce5-0fd3a9dbfd71
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fc24518-b1fd-11e9-8ce5-0fd3a9dbfd71;
 Mon, 29 Jul 2019 12:37:33 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 12:37:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 12:19:59 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 12:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewCqS6vcltOUO8OyVvsAfSp5a9XIakpaP4mqZFKb1xierxd7doGx90bo4KCTh+So8TXbFFBPlk/NG4qhaWA+wLKVFJr0mYEBCyJ4coER3BvAiMTJfemt8FEq23SZm/B0+MQcPJkz6uWM7ilua/a4mxHgzZZlY9RMi+GgTn4EJielCtC8DjKozAhlabgEWE6ZsSoMvveagMB6cbA44RlkeOs1IV9SOUyf0SuJQUPfDS7MhSUam+I1N00xkvEi9ZvP5r4WWi3OLzfehg3rU53LlMfgui/j4oVmsw0UKLsxZ7kc/WUXiX9SBpnK07MFvzgMtSw9BB4itqA6sCWBW4p02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjjVyfccExT3ApdmCBFgDWL0evxGs9wyrLepJZjaBIg=;
 b=hqYmfszeF+tOjit53ButkVSR8pzqM52TGHWRnEO4yCTkR8464l2sN+w6FA3wRmBaVRRBSoL/AgQaasWihKpHrlCVH5P8Da4m0HhMjmAvX50GfBT4zElkHO0dPSi3PGppvFjOdzW/2Q++8cWZj2Fe+Lw6dpaOAZvtoSMv31g+FbgzDxFf8SJT+YNwtSsBYrOG7Rwd56wx28rf6Vg70cqZEMF4Fz7tuyfyWO8OWcYsp4nR2v4GTG3QvtHJwmmOUpLRbR6ERN5il0ys4GTtWbg4emcpawQl9mfb5tMaw7dz6QzSCt8tad1UysrwgeTtrN5SI5hxGdNq6Ou4OgpnhH1bfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3314.namprd18.prod.outlook.com (10.255.138.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 12:19:58 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 12:19:58 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQeNoBgAADe8CAAAegOoAMhBoBgASM1gA=
Date: Mon, 29 Jul 2019 12:19:58 +0000
Message-ID: <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
In-Reply-To: <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR08CA0011.eurprd08.prod.outlook.com
 (2603:10a6:5:16::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c49400e-f923-4516-d1dd-08d7141f126a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3314; 
x-ms-traffictypediagnostic: BY5PR18MB3314:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR18MB33143C71DF73016299381786B3DD0@BY5PR18MB3314.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(189003)(199004)(64756008)(7416002)(66946007)(6512007)(186003)(486006)(66446008)(66556008)(26005)(68736007)(14454004)(6306002)(81166006)(81156014)(256004)(14444005)(229853002)(102836004)(53936002)(76176011)(66476007)(476003)(2616005)(11346002)(446003)(31686004)(36756003)(99286004)(2906002)(52116002)(386003)(6506007)(53546011)(66066001)(6486002)(6436002)(8936002)(25786009)(80792005)(7736002)(4326008)(6116002)(86362001)(316002)(54906003)(6246003)(305945005)(478600001)(5660300002)(6916009)(3846002)(31696002)(71190400001)(71200400001)(8676002)(966005)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3314;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qD/2lCYd5m+u0HDnYJbwv5taeZG6Rh/FRltL9/FddudLU4o6XNRDsk/W2RvJol+ztZyRIMgeA0qmPgx5sYASFi63ZB2+mMiK+ncLrytFXizqPtW48ruz21C67/CU92SNCWNaqgkElqnSDQXTw/USoW1EpJLIJOH4I0G+dzfZUpyJyrLEetKLjHUPd1xiQig4RE6EvKakI6/AqBRstpcEvp7cQp6yJ0Z0NwmEyF03zseka5CpWcR/ZEWqpY6ibG1Ohr52+/EPS30okr2P/UgVJbj96etTyOHzd/+DekZvydymqz2aBLMmdms1n13pimcvqRIwpvDJ7/CnwkouHn0WeDK5lzKHUyKR4P/dMSE2TFkfJ9IpCj6lS/HhTUuu8ANzW+8ELwp9Yfn8Mt8trw/Y/LQLCGmjVCKA+6fbdaRSef8=
Content-ID: <9371954F9010CC44B4CE6FE4AC8172B4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c49400e-f923-4516-d1dd-08d7141f126a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 12:19:58.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3314
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNjo0OSwgVmlrdG9yIE1pdGluIHdyb3RlOg0KPiBIaSBKdWxpZW4sIEFs
bCwNCj4gDQo+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDY6NDQgUE0gSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgVGFtYXMsDQo+Pg0KPj4gT24g
Ny8xOC8xOSA0OjE0IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4gT24gVGh1LCBKdWwg
MTgsIDIwMTkgYXQgOTowMiBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3
cm90ZToNCj4+Pj4NCj4+Pj4gSGkgVGFtYXMsDQo+Pj4+DQo+Pj4+IEFkZGluZyBMYXJzLCBBcnRl
bSBhbmQgSXVyaWkuIEl1cmlpIGhhcyBiZWVuIHdvcmtpbmcgb24gYSB2ZXJzaW9uIGZvcg0KPj4+
PiBjbGFuZy1mb3JtYXQgcmVjZW50bHkuDQo+Pj4+DQo+Pj4+IE9uIDcvMTgvMTkgMzo0MyBQTSwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4+Pj4gVXNpbmcgYXN0eWxlIChodHRwOi8vYXN0eWxl
LnNvdXJjZWZvcmdlLm5ldCkgY2FuIGdyZWF0bHkgcmVkdWNlIHRoZSBvdmVyaGVhZCBvZg0KPj4+
Pj4gbWFudWFsbHkgY2hlY2tpbmcgYW5kIGFwcGx5aW5nIHN0eWxlLWZpeGVzIHRvIHNvdXJjZS1j
b2RlLiBUaGUgaW5jbHVkZWQNCj4+Pj4+IC5hc3R5bGVyYyBpcyB0aGUgY2xvc2VzdCBhcHByb3hp
bWF0aW9uIG9mIHRoZSBlc3RhYmxpc2hlZCBYZW4gc3R5bGUgKGluY2x1ZGluZw0KPj4+Pj4gc3R5
bGVzIG5vdCBmb3JtYWxseSBzcGVsbGVkIG91dCBieSBDT0RJTkdfU1RZTEUgYnV0IGNvbW1vbmx5
IHJlcXVlc3RlZCkuDQo+Pj4+Pg0KPj4+Pj4gQ2hlY2tpbmcgdGhlIGNvbW1lbnQgc3R5bGVzIGFy
ZSBub3QgaW5jbHVkZWQgaW4gdGhlIGF1dG9tYXRpb24uDQo+Pj4+Pg0KPj4+Pj4gSW5jb3Jwb3Jh
dGluZyBYZW4ncyBleGNlcHRpb24gdG8gdGhlIGRvLXdoaWxlIHN0eWxlIGlzIG9ubHkgcGFydGlh
bGx5IHBvc3NpYmxlLA0KPj4+Pj4gdGh1cyBhIGNoYW5nZSBpcyBwcm9wb3NlZCB0byB0aGUgQ09E
SU5HX1NUWUxFIG9mIG1vdmluZyB0aGUgYnJhY2UgZnJvbSAiZG8geyINCj4+Pj4+IHRvIHRoZSBu
ZXh0IGxpbmUuDQo+Pj4+Pg0KPj4+Pj4gTW9zdCBvZiBYZW4ncyBjb2RlLWJhc2UgaXMgbm9uLWNv
bmZvcm1pbmcgYXQgdGhlIG1vbWVudDogMjg5IGZpbGVzIHBhc3MNCj4+Pj4+IHVuY2hhbmdlZCwg
ODc2IGhhdmUgc29tZSBzdHlsZSBpc3N1ZQ0KPj4+Pj4NCj4+Pj4+IElkZWFsbHkgd2UgY2FuIHNs
b3dseSBtaWdyYXRlIHRoZSBlbnRpcmUgY29kZS1iYXNlIHRvIGJlIGNvbmZvcm1pbmcsIHRodXMN
Cj4+Pj4+IGVsaW1pbmF0aW5nIHRoZSBuZWVkIG9mIGRpc2N1c3NpbmcgYW5kIGVuZm9yY2luZyBz
dHlsZSBpc3N1ZXMgbWFudWFsbHkgb24gdGhlDQo+Pj4+PiBtYWlsaW5nbGlzdC4NCj4+Pj4NCj4+
Pj4gSSBxdWl0ZSBsaWtlIHRoZSBpZGVhIG9mIGFuIGF1dG9tYXRpYyBjb2Rpbmcgc3R5bGUgY2hl
Y2tlci4gSG93ZXZlciwgaXQNCj4+Pj4gaXMgYSBiaXQgY29uY2VybmluZyB0aGF0IG5vdCBldmVu
IGEgMS8zIG9mIHRoZSBmaWxlcyBhcmUgYWJsZSB0byBwYXNzDQo+Pj4+IHRoZSBjb2Rpbmcgc3R5
bGUgeW91IHN1Z2dlc3QuIENvdWxkIHlvdSBleHBsYWluIHdoZXRoZXIgdGhpcyBpcyBiZWNhdXNl
DQo+Pj4+IHRoZSBmaWxlcyBkb2VzIG5vdCBhbHJlYWR5IGZvbGxvdyBYZW4gY29kaW5nIHN0eWxl
IG9yIGlzIGl0IGp1c3QgdGhlDQo+Pj4+IGRpZmZlcmVuY2Ugd2l0aCBhc3R5bGU/DQo+Pj4+DQo+
Pj4+IFdoYXQgYXJlIHRoZSBtYWluIHN0eWxlIGlzc3Vlcz8NCj4+Pg0KPj4+IExvb2tzIGxpa2Ug
YSBsb3Qgb2YgZmlsZXMgdGhhdCBkb24ndCBmb2xsb3cgdGhlIFhlbiBjb2Rpbmcgc3R5bGUNCj4+
PiBhcy1pcy4gQWxpZ25tZW50IGlzc3VlcyBzZWVtIHRvIG1lIHRvIGJlIHRoZSBtb3N0IGNvbW1v
biBlcnJvcnMuIFNlZQ0KPj4+IHRoZSBmdWxsIGRpZmYgaGVyZToNCj4+Pg0KPj4+IGh0dHBzOi8v
Z2lzdC5naXRodWIuY29tL3RrbGVuZ3llbC9jNWNhYzE0YTBkNTdmMTE5ZGQ3NzQ3YTFiZTZmYjI2
MA0KPj4+DQo+Pj4gV2UgY2FuIHBlcmhhcHMgdHVuZSBzb21lIGFzcGVjdHMgb2YgaXQgd2UgZGlz
YWdyZWUgd2l0aCB0aGUgYXN0eWxlDQo+Pj4gZ2VuZXJhdGVkIHN0eWxlIGFuZCB0cnkgdG8gb3Zl
cnJpZGUgaXQuIEkgZGlkIG15IGJlc3QgdG8gbWFrZSBpdA0KPj4+IGNvbmZvcm0gdG8gdGhlIGV4
aXN0aW5nIFhlbiBzdHlsZSBidXQgY2VydGFpbmx5IHRoZXJlIGNvdWxkIGJlIG90aGVyDQo+Pj4g
dHdlYWtzIG1hZGUgdG8gcmVkdWNlIHRoZSBjaHVybi4NCj4+DQo+PiBJIHRoaW5rIHdlIGRlZmlu
aXRlbHkgd2FudCB0byBhdm9pZCBjaHVybiBhcyB0aGlzIGlzIGdvaW5nIHRvIHRha2UgYSBsb3QN
Cj4+IG9mIHRpbWUgdG8gZml4IGFsbCB0aGUgcGxhY2VzIHRvIHRoZSBuZXcgaW5kZW50YXRpb24u
DQo+Pg0KPj4gR29pbmcgdGhyb3VnaCB0aGUgZGlmZiBJIGNhbiBzZWUgbWFqb3IgZGlmZmVyZW5j
ZXMgd2l0aCB0aGUgWGVuIENvZGluZw0KPj4gc3R5bGUgYW5kIGFsc28gd2hhdCBsb29rcyBsaWtl
IGluY29uc2lzdGVuY2llcyBmcm9tIHRoZSB0b29scyBpdHNlbGY6DQo+PiAgICAgLSBMaW5lIDU4
OiBUaGlzIGlzIGZhaXJseSBjb21tb24gdG8gaW5kZW50IHRoZSBwYXJhbWV0ZXJzIGFzIGl0IGlz
DQo+PiB0b2RheS4gQnV0IHRoZW4gb24gbGluZSAxNTgvMjcyIGl0IGluZGVudHMgYXMgd2UgZG8g
dG9kYXkuIFNvIEkgYW0gbm90DQo+PiBzdXJlIHdoYXQgdGhlIGV4cGVjdGVkIGNvZGluZyBzdHls
ZSBmcm9tIHRoZSB0b29scy4NCj4+ICAgICAtIExpbmUgNjc6IEkgYmVsaWV2ZSBKYW4gcmVxdWVz
dCB0aGUgc3BhY2UgYmVmb3JlIGxhYmVsDQo+IFNlZW1zIGFncmVlZCBub3QgdG8gYWRkIHRoZSBz
cGFjZXMgYmVmb3JlIGxhYmVsLiBSaWdodD8NCg0KQ2VydGFpbmx5IG5vdCwgYWZhaWEuIEkgd2ls
bCBvYmplY3QgdG8gYW55IHdyaXR0ZW4gZG93biBydWxlIGRpc2FsbG93aW5nDQpsZWFkaW5nIGJs
YW5rKHMpIGFsdG9nZXRoZXIuIEkgd2lsbCBhcmd1ZSBmb3IgbWFraW5nIG1hbmRhdG9yeSBhdCBs
ZWFzdA0Kb25lIGJsYW5rIG9mIGluZGVudGF0aW9uLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
