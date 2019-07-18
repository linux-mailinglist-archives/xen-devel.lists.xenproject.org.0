Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156AD6CD0C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 12:58:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho45U-0004wc-30; Thu, 18 Jul 2019 10:56:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho45S-0004wX-EX
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 10:56:34 +0000
X-Inumbo-ID: b3405489-a94a-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3405489-a94a-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 10:56:32 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 10:56:28 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 10:55:16 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 10:55:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI8mc7nfFTxmg9TpesBsIknRSYeJZZt/Qm9y4yp4X6LUZ5cu+8mJI7oqtC9O+ppcVMTUkTmkLmDaZr4jivcWW2fE2uI8OGX/OhysnBkKJMI0Sb2Z6gLc20T1tDTbttpVE6DpTVCUwuGvoZCoXrRfKWLp1PG0kz2DaOZof3T057WQvdCdwUYSDaaNIuregr3qYt3pjsSLh+tBcLdhEKlQ95PrH1TsGzMPWcuRjQfts/97HjMQsFgV1tlzFLSmoIWOZdD+Ks4T1eyZjmSF16csLAPHqQtoDMqYIQqEvJGRdVYXs6JqZF9AOeLd91hvjoNLqjEkrjQHgvipnIIPqQ8scg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOMVgC93xhGFiFrapiM5TykPrZhSksEdFNbVfu2dmgE=;
 b=Lf85Tyg1oFz0yTFZTFNloHcBq1F84d/B+bGofY7muT74NoGsdd0pDotishbU3eMV9X9QgPgHyf10lnb0WxXpq/9kjPHJCeSwXOaT7NolM6mpCf4uwyFAnxs7YmNOVlmL1ZHkikc6QTB9SzvtONWe9dNa7KEoTrnMlSRI4OFmuMroMeko5ZUbNYvyx7NXfiylZbq0SA1C1tvisg0SXrHiJQQEPGhruFU5L8tZPROVDgmdcbWDR6qj+/pu/w6nVPzkm0k2L6X9Pb2EuuQa+ul8wX0jSkf2FtTgbvd1hm0gtbsJe6uDg0eYFrrlV1dwxaOLBs5Jz0k1dBa8NGqF+nRNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2746.namprd18.prod.outlook.com (20.179.48.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 10:55:15 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 10:55:15 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
Thread-Index: AQHVPNaxkDvYm35RQ027yAvXjVGEzqbQNNsA
Date: Thu, 18 Jul 2019 10:55:15 +0000
Message-ID: <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
In-Reply-To: <20190717193335.11991-6-tamas@tklengyel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7c1eb7d-dcd6-4855-0daf-08d70b6e6a38
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2746; 
x-ms-traffictypediagnostic: DM6PR18MB2746:
x-microsoft-antispam-prvs: <DM6PR18MB27461FD958D9E8F503EB5A03B3C80@DM6PR18MB2746.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(26005)(8676002)(476003)(256004)(36756003)(446003)(11346002)(6512007)(6506007)(386003)(53546011)(305945005)(2616005)(7736002)(76176011)(25786009)(6436002)(66446008)(64756008)(66066001)(229853002)(66946007)(81156014)(5660300002)(31696002)(102836004)(66556008)(99286004)(14444005)(6246003)(14454004)(66476007)(4326008)(81166006)(6916009)(86362001)(31686004)(6116002)(80792005)(316002)(52116002)(3846002)(8936002)(486006)(478600001)(71200400001)(2906002)(68736007)(71190400001)(6486002)(53936002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2746;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yl/yfr2m8w3wqM+0TceO0X4LqC7SWfl5o3Jo81hb7+ql6KEB3rX9t/iO0EclqlEfFbQhDe4RZAtG1OmQ1QZws0vL1MYOhFXDn9kYvX4tpmEqcGk6kPtAKoliqhk3yCPoiWqe89OfI8VoCWHxkp7YN9CFNQTxTH4Pc52Z7rX6c6tvU0wFJMA9qf5sUVYRY4udZEnveJjAgcu9ksQpCLlvvoEk2wiMt8FJYGYEBsYCI9uKCknHpF+Jih8zFyQUy2MnSvfZQ9WcXHa0rx8QBw7PVSXMoYiN4ryCNvyMm7AFT0Ypr1B0eUy/6oRwzAUtB582lIAnMJbQRGRz25dHTqmCQncPuWrXusQo61XuAzS9kYEBuiBnAeqCqTTRoZsK9kUidBRy+hW8p44Ai8GA+1/ATvunZP+5JzJZgh2bUSwo34s=
Content-ID: <8399033C5008644A984D8C0A8A99171C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c1eb7d-dcd6-4855-0daf-08d70b6e6a38
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 10:55:15.3930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2746
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAyMTozMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBAQCAtMTM2LDgg
KzEzNyw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8g
KnBhZ2UpDQo+ICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7DQo+ICAgICAgICAgICBueCA9IHgg
KyAoMSB8IFBHVF9sb2NrZWQpOw0KPiAgICAgICAgICAgaWYgKCAhKHggJiBQR1RfdmFsaWRhdGVk
KSB8fA0KPiAtICAgICAgICAgICAgICEoeCAmIFBHVF9jb3VudF9tYXNrKSB8fA0KPiAtICAgICAg
ICAgICAgICEobnggJiBQR1RfY291bnRfbWFzaykgKQ0KPiArICAgICAgICAgICAgICAgICEoeCAm
IFBHVF9jb3VudF9tYXNrKSB8fA0KPiArICAgICAgICAgICAgICAgICEobnggJiBQR1RfY291bnRf
bWFzaykgKQ0KPiAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gICAgICAgfSB3aGlsZSAo
IGNtcHhjaGcoJnBhZ2UtPnUuaW51c2UudHlwZV9pbmZvLCB4LCBueCkgIT0geCApOw0KDQpBcmVu
J3QgeW91IHNjcmV3aW5nIHVwIGluZGVudGF0aW9uIGhlcmU/IEl0IGxvb2tzIHdyb25nIGJvdGgg
aW4gbXkNCm1haWwgY2xpZW50J3MgdmlldyBhbmQgb24gdGhlIGxpc3QgYXJjaGl2ZXMsIHdoZXJl
YXMuIEZ1cnRoZXJtb3JlDQp0aGlzIGlzIGNvZGUgeW91J3ZlIGludHJvZHVjZWQgZWFybGllciBp
biB0aGUgc2VyaWVzLCBzbyBpdCBzaG91bGQNCmJlIGdvdCByaWdodCB0aGVyZSwgbm90IGhlcmUu
DQoNCj4gQEAgLTIyNSw3ICsyMjUsNyBAQCBybWFwX2luaXQoc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSkNCj4gICAjZGVmaW5lIEhBU0goZG9tYWluLCBnZm4pICAgICAgIFwNCj4gICAgICAgKCgoZ2Zu
KSArIChkb21haW4pKSAlIFJNQVBfSEFTSFRBQl9TSVpFKQ0KPiAgIA0KPiAtLyogQ29udmVyc2lv
bnMuIFR1bmVkIGJ5IHRoZSB0aHJlc2hvbGRzLiBTaG91bGQgb25seSBoYXBwZW4gdHdpY2UNCj4g
Ky8qIENvbnZlcnNpb25zLiBUdW5lZCBieSB0aGUgdGhyZXNob2xkcy4gU2hvdWxkIG9ubHkgaGFw
cGVuIHR3aWNlDQo+ICAgICogKG9uY2UgZWFjaCkgZHVyaW5nIHRoZSBsaWZldGltZSBvZiBhIHNo
YXJlZCBwYWdlICovDQoNClBsZWFzZSBmaXggdGhlIGNvbW1lbnQgc3R5bGUgYXMgYSB3aG9sZSwg
bm90IGp1c3QgdGhlIHN0cmF5IHRyYWlsaW5nDQpibGFuay4NCg0KPiBAQCAtMjg4LDEzICsyODgs
MTMgQEAgcm1hcF9jb3VudChzdHJ1Y3QgcGFnZV9pbmZvICpwZykNCj4gICB9DQo+ICAgDQo+ICAg
LyogVGhlIHBhZ2UgdHlwZSBjb3VudCBpcyBhbHdheXMgZGVjcmVhc2VkIGFmdGVyIHJlbW92aW5n
IGZyb20gdGhlIHJtYXAuDQo+IC0gKiBVc2UgYSBjb252ZXJ0IGZsYWcgdG8gYXZvaWQgbXV0YXRp
bmcgdGhlIHJtYXAgaWYgaW4gdGhlIG1pZGRsZSBvZiBhbg0KPiArICogVXNlIGEgY29udmVydCBm
bGFnIHRvIGF2b2lkIG11dGF0aW5nIHRoZSBybWFwIGlmIGluIHRoZSBtaWRkbGUgb2YgYW4NCj4g
ICAgKiBpdGVyYXRvciwgb3IgaWYgdGhlIHBhZ2Ugd2lsbCBiZSBzb29uIGRlc3Ryb3llZCBhbnl3
YXlzLiAqLw0KDQpTYW1lIGhlcmUuDQoNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQNCj4gICBybWFw
X2RlbChnZm5faW5mb190ICpnZm5faW5mbywgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgaW50IGNv
bnZlcnQpDQo+ICAgew0KPiAgICAgICBpZiAoIFJNQVBfVVNFU19IQVNIVEFCKHBhZ2UpICYmIGNv
bnZlcnQgJiYNCj4gLSAgICAgICAgIChybWFwX2NvdW50KHBhZ2UpIDw9IFJNQVBfTElHSFRfU0hB
UkVEX1BBR0UpICkNCj4gKyAgICAgICAgICAgIChybWFwX2NvdW50KHBhZ2UpIDw9IFJNQVBfTElH
SFRfU0hBUkVEX1BBR0UpICkNCg0KSGVyZSB5b3UgYWdhaW4gc2VlbSB0byBiZSBzY3Jld2luZyB1
cCBjb3JyZWN0IGluZGVudGF0aW9uLiBUaGVyZSBhcmUNCm1vcmUgc3VjaCBpbnN0YW5jZXMsIHNv
IEkgZ3Vlc3MgSSdsbCBsZWF2ZSBpdCB0byB5b3UgdG8gZ28gb3ZlciB0aGUNCndob2xlIHBhdGNo
IG9uY2UgbW9yZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
