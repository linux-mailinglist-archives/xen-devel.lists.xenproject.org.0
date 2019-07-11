Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29F65797
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 15:06:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlYjd-0000uW-3h; Thu, 11 Jul 2019 13:03:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlYjb-0000uR-OI
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 13:03:39 +0000
X-Inumbo-ID: 4b43fb82-a3dc-11e9-979d-03170c29f8d8
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b43fb82-a3dc-11e9-979d-03170c29f8d8;
 Thu, 11 Jul 2019 13:03:37 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 11 Jul 2019 13:03:36 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 11 Jul 2019 12:34:54 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 11 Jul 2019 12:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiaHz26lUdIj70leF7kvf8wsXU6EykQJFXWiSYDeilb5eaUd06svGtPtRJev1mT8YjBmAaITQLqJYsHydDNKiec3vYXZlwvH9M1iZNHhQ19tRNkxuoGegH+qjQiNDiCU4PjAFH+hze6gmArxrP4qH9I/apO0lBFLzfpfRnls9hifTShc6cyDaGMCS+whvx6dcfS/Uo48/ix8UmBJEcgTp8vFLZxUbnhcx79ypjRyutz7cg4IPYF3A7LYB63JLBWfnr6za93q1/meqGY8jYCSkNoa2hYvb787fnxSWa31E6bUQ0UHuI5xAvaruyIUuC9QZj3eVs7Zksjr70ffrgj3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yITyWbP45HTWXv+F9SzrlKxGWSE0WnCnk0VuTmV5QvE=;
 b=edjg/BdNrR7hHopbn7jFsImyzG7GgNJC3JVFNs/WoI1i1T0uFUjX9SHtLGT8SE+SIVy24KUpQhKeKMTsXpppORa7f8kY1M98HVg5HZKc0YSNBjdtgQDePRYVnGDnewpVuBx535AbCSynrsCS20zZc6UWTQBn5BC2jT3HHp7laY9Xlypt9cUb2jrI2/ZWSurq8qwcKJLeD+i26aowbksNpvKsPDq/wZ+F4f6gUmwIeGizjAKTAlVQgByI/RbEzWjj516DHZGVRjcSFqh0Cioz0+h/ySxMMnZdcmJRXFkxGZGsGqehvU2Y+UIngKYeZ3197i678P2Kgc2YxnEGQGIasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2506.namprd18.prod.outlook.com (20.179.105.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 12:34:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 12:34:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v2 1/2] common/grant_table: harden bound
 accesses
Thread-Index: AQHVN+UKQvX8Kon4G0q0xnaou4Hi/w==
Date: Thu, 11 Jul 2019 12:34:53 +0000
Message-ID: <d68407b5-bbac-ed3c-553a-1d22681eb0ac@suse.com>
References: <1562763277-11674-1-git-send-email-nmanthey@amazon.de>
 <1562763277-11674-2-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1562763277-11674-2-git-send-email-nmanthey@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85c2e39a-e6b3-4136-b3ee-08d705fc2c90
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2506; 
x-ms-traffictypediagnostic: DM6PR18MB2506:
x-microsoft-antispam-prvs: <DM6PR18MB2506F661DF4A15E1556F3194B3F30@DM6PR18MB2506.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(189003)(199004)(26005)(66066001)(478600001)(68736007)(14454004)(229853002)(6486002)(76176011)(6436002)(66946007)(66556008)(66476007)(64756008)(31686004)(66446008)(102836004)(2906002)(8936002)(305945005)(3846002)(6116002)(7736002)(6506007)(36756003)(7416002)(386003)(53546011)(81166006)(8676002)(81156014)(6916009)(25786009)(5024004)(54906003)(86362001)(186003)(6246003)(31696002)(5660300002)(316002)(11346002)(446003)(2616005)(99286004)(476003)(486006)(14444005)(52116002)(6512007)(71190400001)(4326008)(71200400001)(80792005)(256004)(53936002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2506;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vGQFHb+an1exBkru2sCoP0nKtOyGZZefi+2HEsSmgxdUCgTYSrLfx9bQvRvvkgG7LBRMyqTgyq9kqihh/H7z7fQm87rQ6Hj+qsZNCzfvFhGZnBMo8P1xgck3bHcn3Nb5l/AcTME4/G80HsWyQEi8Joicoc/4DfD8tgVXMcQ5k2sANSimUeocijQO6GQZW0a6QTydUzAihJfx8XZyep7FudMnCRyPVw34VJWRWCYI2xTtkF+pbPli17TVcP1bsB2cMWn6QrGF3yLQS+brukJ6lmfCn64U+5ORSEndj87GXqVhegnSLEgeWk+1t63jtEkZ2IbL6aQrOinkceaHf0muuAXXI1PLBRweyJrSndd8QQW+/zQIxzx4X0OIB/Tjiej0c2ZUtZRbSfSYpo2Akxx8KC+nOzFfF54lbUeHtvMcQ4I=
Content-ID: <8AA634E5690C0B44AE5E6330F9A23157@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c2e39a-e6b3-4136-b3ee-08d705fc2c90
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 12:34:53.6181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2506
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v2 1/2] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel
 Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bjoern
 Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDcuMjAxOSAxNDo1NCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBHdWVzdHMgY2Fu
IGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxl
ZA0KPiBkYXRhIHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkg
bG9hZHMgYWZ0ZXIgYm91bmQNCj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVj
dWxhdGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMsIHdlDQo+IHVzZSB0aGUgYXJyYXlfaW5kZXhf
bm9zcGVjIG1hY3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybw0KPiBibG9ja19zcGVj
dWxhdGlvbi4gTm90ZSwgdGhlIGJsb2NrX3NwZWN1bGF0aW9uIG1hY3JvIGlzIHVzZWQgb24gYWxs
DQo+IHBhdGggaW4gc2hhcmVkX2VudHJ5X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcy4gVGhp
cyB3YXksIGFmdGVyIGENCj4gY2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVj
a3MgdGhhdCBoYXBwZW5lZCBiZWZvcmUgYmVjb21lDQo+IGFyY2hpdGVjdHVyYWwgdmlzaWJsZSwg
c28gdGhhdCBubyBhZGRpdGlvbmFsIHByb3RlY3Rpb24gaXMgcmVxdWlyZWQNCj4gZm9yIGNvcnJl
c3BvbmRpbmcgYXJyYXkgYWNjZXNzZXMuIEFzIHRoZSB3YXkgd2UgaW50cm9kdWNlIGFuIGxmZW5j
ZQ0KPiBpbnN0cnVjdGlvbiBtaWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRh
aW4gdmFsdWVzIGZyb20NCj4gbWVtb3J5IG11bHRpcGxlIHRpbWVzLCB3ZSB0cnkgdG8gYXZvaWQg
c3BlY3VsYXRpdmVseSBjb250aW51aW5nDQo+IGV4ZWN1dGlvbiB3aXRoIHN0YWxlIHJlZ2lzdGVy
IGRhdGEgYnkgbW92aW5nIHJlbGV2YW50IGRhdGEgaW50bw0KPiBmdW5jdGlvbiBsb2NhbCB2YXJp
YWJsZXMuDQo+IA0KPiBTcGVjdWxhdGl2ZSBleGVjdXRpb24gaXMgbm90IGJsb2NrZWQgaW4gY2Fz
ZSBvbmUgb2YgdGhlIGZvbGxvd2luZw0KPiBwcm9wZXJ0aWVzIGlzIHRydWU6DQo+ICAgLSBwYXRo
IGNhbm5vdCBiZSB0cmlnZ2VyZWQgYnkgdGhlIGd1ZXN0DQo+ICAgLSBwYXRoIGRvZXMgbm90IHJl
dHVybiB0byB0aGUgZ3Vlc3QNCj4gICAtIHBhdGggZG9lcyBub3QgcmVzdWx0IGluIGFuIG91dC1v
Zi1ib3VuZCBhY2Nlc3MNCj4gICAtIHBhdGggY2Fubm90IGJlIGV4ZWN1dGVkIHJlcGVhdGVkbHkN
Cg0KVXBvbiByZS1yZWFkaW5nIEkgdGhpbmsgdGhpcyBsYXN0IGl0ZW0gaXNuJ3QgZnVsbHkgYXBw
bGljYWJsZTogSSB0aGluaw0KeW91IGF0dGFjaCBzdWNoIGFuIGF0dHJpYnV0ZSB0byBkb21haW4g
Y3JlYXRpb24vZGVzdHJ1Y3Rpb24gZnVuY3Rpb25zLg0KVGhvc2UgYXJlbid0IGV4ZWN1dGVkIHJl
cGVhdGVkbHkgZm9yIGEgc2luZ2xlIGd1ZXN0LCBidXQgZS5nLiByYXBpZA0KcmVib290aW5nIG9m
IGEgZ3Vlc3QgKG9yIHNldmVyYWwgb25lcykgbWF5IGFjdHVhbGx5IGJlIGFibGUgdG8gdHJhaW4N
CnN1Y2ggcGF0aHMuDQoNCj4gQEAgLTIwOTEsNiArMjEwMCw3IEBAIGdudHRhYl90cmFuc2ZlcigN
Cj4gICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsNCj4gICAgICAgaW50IGk7DQo+ICAgICAg
IHN0cnVjdCBnbnR0YWJfdHJhbnNmZXIgZ29wOw0KPiArICAgIGdyYW50X3JlZl90IHJlZjsNCg0K
VGhpcyBkZWNsYXJhdGlvbiB3b3VsZCBiZXR0ZXIgbGl2ZSBpbiB0aGUgbW9yZSBuYXJyb3cgc2Nv
cGUgaXQncw0KKG9ubHkpIHVzZWQgaW4uDQoNCj4gQEAgLTIyMzcsOCArMjI0NywxNCBAQCBnbnR0
YWJfdHJhbnNmZXIoDQo+ICAgICAgICAgICAgKi8NCj4gICAgICAgICAgIHNwaW5fdW5sb2NrKCZl
LT5wYWdlX2FsbG9jX2xvY2spOw0KPiAgICAgICAgICAgb2theSA9IGdudHRhYl9wcmVwYXJlX2Zv
cl90cmFuc2ZlcihlLCBkLCBnb3AucmVmKTsNCj4gKyAgICAgICAgcmVmID0gZ29wLnJlZjsNCg0K
T3RoZXIgdGhhbiBpbiB0aGUgZWFybGllciBjYXNlcyBoZXJlIHlvdSBjb3B5IGEgdmFyaWFibGUg
dGhhdCdzDQphbHJlYWR5IGxvY2FsIHRvIHRoZSBmdW5jdGlvbi4gSXMgdGhpcyByZWFsbHkgaGVs
cGZ1bD8NCg0KSW5kZXBlbmRlbnQgb2YgdGhpcyAtIGlzIHRoZXJlIGEgcGFydGljdWxhciByZWFz
b24geW91IGxhdGNoIHRoZQ0KdmFsdWUgaW50byB0aGUgKHNlY29uZCkgbG9jYWwgdmFyaWFibGUg
b25seSBhZnRlciBpdHMgZmlyc3QgdXNlPyBJdA0KbGlrZWx5IHdvbid0IG1hdHRlciBtdWNoLCBi
dXQgaXQncyBhIGxpdHRsZSBwdXp6bGluZyBuZXZlcnRoZWxlc3MuDQoNCj4gLSAgICAgICAgaWYg
KCB1bmxpa2VseSghb2theSB8fCBhc3NpZ25fcGFnZXMoZSwgcGFnZSwgMCwgTUVNRl9ub19yZWZj
b3VudCkpICkNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogTWFrZSBzdXJlIHRoZSByZWZl
cmVuY2UgYm91bmQgY2hlY2sgaW4gZ250dGFiX3ByZXBhcmVfZm9yX3RyYW5zZmVyDQo+ICsgICAg
ICAgICAqIGlzIHJlc3BlY3RlZCBhbmQgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGlzIGJsb2NrZWQg
YWNjb3JkaW5nbHkNCj4gKyAgICAgICAgICovDQo+ICsgICAgICAgIGlmICggdW5saWtlbHkoIWV2
YWx1YXRlX25vc3BlYyhva2F5KSkgfHwNCj4gKyAgICAgICAgICAgIHVubGlrZWx5KGFzc2lnbl9w
YWdlcyhlLCBwYWdlLCAwLCBNRU1GX25vX3JlZmNvdW50KSkgKQ0KDQpJZiBJIGNhbiB0cnVzdCBt
eSBtYWlsIFVJICh3aGljaCBJJ20gbm90IHN1cmUgSSBjYW4pIHRoZXJlJ3MgYW4NCmluZGVudGF0
aW9uIGlzc3VlIGhlcmUuDQoNCj4gQEAgLTM4NTMsNyArMzg3OSw4IEBAIHN0YXRpYyBpbnQgZ250
dGFiX2dldF9zdGF0dXNfZnJhbWVfbWZuKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICAqbWZuID0gX21mbih2
aXJ0X3RvX21mbihndC0+c3RhdHVzW2lkeF0pKTsNCj4gKyAgICAvKiBNYWtlIHN1cmUgaWR4IGlz
IGJvdW5kZWQgd3J0IG5yX3N0YXR1c19mcmFtZXMgKi8NCj4gKyAgICAqbWZuID0gX21mbih2aXJ0
X3RvX21mbihndC0+c3RhdHVzW2FycmF5X2luZGV4X25vc3BlYyhpZHgsIG5yX3N0YXR1c19mcmFt
ZXMoZ3QpKV0pKTsNCg0KVGhpcyBhbmQgLi4uDQoNCj4gQEAgLTM4ODIsNyArMzkwOSw4IEBAIHN0
YXRpYyBpbnQgZ250dGFiX2dldF9zaGFyZWRfZnJhbWVfbWZuKHN0cnVjdCBkb21haW4gKmQsDQo+
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICAq
bWZuID0gX21mbih2aXJ0X3RvX21mbihndC0+c2hhcmVkX3Jhd1tpZHhdKSk7DQo+ICsgICAgLyog
TWFrZSBzdXJlIGlkeCBpcyBib3VuZGVkIHdydCBucl9zdGF0dXNfZnJhbWVzICovDQo+ICsgICAg
Km1mbiA9IF9tZm4odmlydF90b19tZm4oZ3QtPnNoYXJlZF9yYXdbYXJyYXlfaW5kZXhfbm9zcGVj
KGlkeCwgbnJfZ3JhbnRfZnJhbWVzKGd0KSldKSk7DQoNCi4uLiB0aGlzIGxpbmUgYXJlIHRvbyBs
b25nIG5vdyBhbmQgaGVuY2UgbmVlZCB3cmFwcGluZy4NCg0KSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
