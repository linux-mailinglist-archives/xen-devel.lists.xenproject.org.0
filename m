Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA55FA56
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj35S-0005Oq-F3; Thu, 04 Jul 2019 14:51:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj35Q-0005Ob-1c
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:51:48 +0000
X-Inumbo-ID: 3e6b6e84-9e6b-11e9-a187-07f21b944edb
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e6b6e84-9e6b-11e9-a187-07f21b944edb;
 Thu, 04 Jul 2019 14:51:46 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 14:51:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 14:50:46 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 14:50:46 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3426.namprd18.prod.outlook.com (10.255.136.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 14:50:45 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 14:50:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 08/23] x86emul: support AVX512PF insns
Thread-Index: AQHVL/7/6QHyQ/r2N0GJ2x6uY/K0IKa6jhdDgAABmYA=
Date: Thu, 4 Jul 2019 14:50:45 +0000
Message-ID: <b8d4e2dc-3422-2693-619c-6ab83894a36f@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <4365e23d-c2aa-dc10-46d0-df38d9c36322@suse.com>
 <3379d8e6-701b-09f4-4def-673dda44cd70@citrix.com>
In-Reply-To: <3379d8e6-701b-09f4-4def-673dda44cd70@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:6::23)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 596db1f1-4f8d-460b-7ad9-08d7008efe86
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3426; 
x-ms-traffictypediagnostic: BY5PR18MB3426:
x-microsoft-antispam-prvs: <BY5PR18MB3426818ACA1A3410FE250F84B3FA0@BY5PR18MB3426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(199004)(189003)(2501003)(52116002)(99286004)(5660300002)(53546011)(6246003)(2906002)(486006)(6506007)(386003)(53936002)(6512007)(6436002)(110136005)(305945005)(76176011)(54906003)(7736002)(446003)(476003)(11346002)(66556008)(66066001)(36756003)(66446008)(64756008)(14454004)(2616005)(6486002)(72206003)(478600001)(73956011)(66946007)(316002)(66476007)(102836004)(81166006)(4326008)(86362001)(8676002)(71200400001)(4744005)(31686004)(31696002)(229853002)(8936002)(25786009)(186003)(81156014)(256004)(80792005)(26005)(6116002)(3846002)(71190400001)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3426;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XElVPGiHFKuKH1+ZEEEPdWvtr5FuPUf8xVZLLqFac1/ht/T33RUyy77ifSvT+qPRZTsRlDq03myiVNGN/VNbEgVayb4eIIjBfx6pkLmksn3Dr6UGrF3qVctfiwydTHwE2QE/OsRLJMWBhAOhcfF3+kmfS8c9GiFLQxf7OHkLoZpvjWYMQD9vM7lmMkQSjxEoYNQpqabo5G4u9gw1vUJX9pQG3/Amib4tkj9QBvgBjBr1a48LvNxOvwv0or2NRoi8BpKXivMkT0iUCwVH9SFDmxIxrOGsph2V4gxehG9kNoRVfnGZoeCf1bnx/MTvkxkwD2GW1DV/Fg310f3IHK2uBR1+1K2x8tCGHtu04IZOMaIjLO5SD5KiYH46usjkKnJ5xPAa8aPlR1T/rERHm2j2qDQ92uMyy/oFT49d5rBLXLc=
Content-ID: <7F35A8068FCE734989088CB632B24658@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 596db1f1-4f8d-460b-7ad9-08d7008efe86
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 14:50:45.4025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3426
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v9 08/23] x86emul: support AVX512PF insns
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

T24gMDQuMDcuMjAxOSAxNjo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDcvMjAx
OSAxMjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiArICAgICAgICAvKiBDbGVhciB1bnRvdWNo
ZWQgcGFydHMgb2YgdGhlIG1hc2sgdmFsdWUuICovDQo+PiArICAgICAgICBuID0gMSA8PCAoNCAt
ICgoYiAmIDEpIHwgZXZleC53KSk7DQo+PiArICAgICAgICBvcF9tYXNrICY9ICgxIDw8IG4pIC0g
MTsNCj4+ICsNCj4+ICsgICAgICAgIGZvciAoIGkgPSAwOyByYyA9PSBYODZFTVVMX09LQVkgJiYg
b3BfbWFzazsgKytpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBzaWduZWQgbG9u
ZyBpZHggPSBiICYgMSA/IGluZGV4LnF3W2ldIDogaW5kZXguZHdbaV07DQo+PiArDQo+PiArICAg
ICAgICAgICAgaWYgKCAhKG9wX21hc2sgJiAoMSA8PCBpKSkgKQ0KPj4gKyAgICAgICAgICAgICAg
ICBjb250aW51ZTsNCj4gDQo+IEl0IG9jY3VycyBmcm9tIG15IHJlY2VudCBmb3JheSBpbnRvIFVC
U0FOIHRoYXQgb3BfbWFzayBpcyA2NCBiaXRzIHdpZGUsDQo+IGFsdGhvdWdoIGl0IGxvb2tzIGxp
a2UgbiBjYW4gYmUgYXQgbWF4aW11bSAxNiBpbiB0aGlzIHNwZWNpZmljIGNhc2UuDQo+IA0KPiBJ
ZiBub3RoaW5nIGVsc2UsIHVzaW5nICgxdSA8PCAxKSB3b3VsZCByZWR1Y2UgdGhlIHNpemUgb2Yg
dGhlIFVCU0FODQo+IGJ1aWxkLCBidXQgSSBleHBlY3Qgd2UncmUgc29vbiBnb2luZyB0byBoYXZl
IHN1YnRsZSBidWdzIHdoZW4gd2UgZ2V0IHRvDQo+IHRoZSBpbnQ4IGluc3RydWN0aW9ucy4NCj4g
DQo+IEFyZSB0aGVyZSBjdXJyZW50IFMvRyBpbnN0cnVjdGlvbnMgd2hpY2ggY2FuIHRha2UgMzIg
aXRlcmF0aW9ucz8NCg0KTm8sIFMvRyBpbnNucyBjdXJyZW50bHkgb25seSBhY3Qgb24gdmVjdG9y
IGVsZW1lbnRzIDMyIG9yIDY0IGJpdHMNCmluIHNpemUsIHdoaWNoIG1lYW5zIDE2IG9yIDggZWxl
bWVudHMgcGVyIHZlY3RvciBtYXguDQoNCkphbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
