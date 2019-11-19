Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5B1027F1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 16:19:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX5FI-0004Cu-Fc; Tue, 19 Nov 2019 15:16:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y6ir=ZL=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iX5FG-0004Cn-Qo
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 15:16:47 +0000
X-Inumbo-ID: 96998d94-0adf-11ea-9631-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96998d94-0adf-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 15:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcub5fG5YuRNGiI5rutRDBeM0F6PBHMTK4sV4vxYY1AnfGn3EF3td6ZafV9+cUJz6p4rOHWIQQMo5I7FIhIs2xUVjzM9MxnPmFiaC21tITNqQ6P+0HXvdUx2ZtJBJuBIVhSOZux26WdLWZ69EwS5lB4laNcrmxOvbnM4qSsSrPJe6woOgzlbYIW7E+3tFybyfCiqBIzOsU7XrOl4ZZAXQHFH9iLu7ZZ4//4GdyOhMZ7kOeFULPxFhWK8jSroOFoCwrQvMefQ4WqLC7EpyRxFQbplo5pPBO+D04Rja5RE0A5BzZ3z0I6my6kVI/BA9NA3d1P8SrOyjqHoTihu0ddKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3E+5ozaWJKNErx0qvNqVIaBJz2NtvNSbw4EfNZqaBnw=;
 b=gqeoSReMK+m4QOZomGpS92R2gBKaX6lsvKKFD296rIXjASlQq7xJl3sxhBGTvsT2CQP47Zx+YYoD1wsUT+B1g+KtiTqHd64YrYFzbSod2CafffUmNpBIYfzql62wElJ/IOOVile2mrMvxzFOvHdYWbZH4mhlAl3Bz678w/FkwcZnjwXbQ5ZGOc1lESAJTqaT1znWBgNfK0tvznmRPOr5LkdgGxhaSmSG11ujL17jBdkCmK44TAdtl3Nr3ypVzt71TPOxoEHqir1fiyta+EwT/gKUr8L2R6zhHMax7+P49EM2M8psllLFtDeaHaupZhzgQlDuAHsyHCkwWI4MF0Z2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3E+5ozaWJKNErx0qvNqVIaBJz2NtvNSbw4EfNZqaBnw=;
 b=mmBg5+iSzBCo/I7sR88weWAHSKX9iEBxn/7gD6y5vrtLDi2zPgRhB2T2mDxiq1c/rLep/6xI2EeoubT08WJ7iWEqklmhx9BSu0J8GKE5Uk0qJu3S0wdoOs7ptKf8KHCYETRyeD/M4UXSIvHeW2S65yLxyVCV1oMHbaA3DDj/7OE=
Received: from VI1PR03MB3711.eurprd03.prod.outlook.com (52.134.23.12) by
 VI1PR03MB3503.eurprd03.prod.outlook.com (52.134.24.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Tue, 19 Nov 2019 15:16:36 +0000
Received: from VI1PR03MB3711.eurprd03.prod.outlook.com
 ([fe80::7cc7:a998:4f5a:2a84]) by VI1PR03MB3711.eurprd03.prod.outlook.com
 ([fe80::7cc7:a998:4f5a:2a84%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 15:16:36 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "julien@xen.org" <julien@xen.org>, "julien.grall.oss@gmail.com"
 <julien.grall.oss@gmail.com>
Thread-Topic: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
Thread-Index: AQHVlINpq/WqWBMLtEGyFFz1SWBMp6d+RJSAgABv4gCAAJ06AIAKEU4AgABltgCAAPlcAIAFxMoAgAIo3wA=
Date: Tue, 19 Nov 2019 15:16:36 +0000
Message-ID: <2d66227ecda566e5840b14e7b50ab93461ebe37b.camel@epam.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
 <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
 <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
 <8337bf4b07903b75a6690880e58ca117e9c08a47.camel@epam.com>
 <CAJ=z9a3FrBOF=3wKp53U8rGWSVJCC4JCurTpyOMPvc6FNcadcA@mail.gmail.com>
 <91c78b4f4cc2e2934717e827bf3ce80be775b127.camel@epam.com>
 <fa4bcb45-aae2-ed11-e54a-456054e3cbca@xen.org>
In-Reply-To: <fa4bcb45-aae2-ed11-e54a-456054e3cbca@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [194.53.196.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b938dcb7-d252-4abc-c956-08d76d037818
x-ms-traffictypediagnostic: VI1PR03MB3503:|VI1PR03MB3503:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB3503815D2AF910645EAFA9A8F44C0@VI1PR03MB3503.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(6436002)(26005)(76176011)(54906003)(8676002)(8936002)(316002)(6116002)(229853002)(80792005)(118296001)(81166006)(5660300002)(4326008)(2906002)(305945005)(99286004)(14444005)(256004)(486006)(7416002)(2501003)(476003)(446003)(11346002)(91956017)(76116006)(2616005)(66066001)(53546011)(6506007)(71190400001)(71200400001)(6246003)(7736002)(4001150100001)(25786009)(3846002)(478600001)(110136005)(186003)(966005)(6486002)(14454004)(64756008)(36756003)(66946007)(66446008)(66556008)(86362001)(81156014)(102836004)(6306002)(66476007)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB3503;
 H:VI1PR03MB3711.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6jLp+E/zweUoJvNonsH/PV+T4rpwtGV8b5GhsYYAvR4wd6koWO6/1cdzmJS/+6Tf/0E524lo1OjXuiLLKyRniKECH0GhY255RiuYZRjzlteQd492ggY0i48wPBdTEkYyWuNbkreCJe1hAVZTR0lbx/Jb6oWk7YdNMJ2Z0t6jPJWoKOTs6f0PfDTyHTSgJ1wCFWAaRHFKkl8lylsBmJW3j6f/aCHu6xaCnY14lhVUUbNlGFiXpvLSXqBgNe3Z6hB0/A0ekezSmnTtI6SJybeCOds4zuzo1Cw0fyOH/hDYkqSuPZADNnw0B+FVTl4wVA9evd2TTiCr6WEPYbMmRIUQWE7sz1uCUquy77E6jIHSqvYTmwtIpyv919AYrM+N3NVNbJVczkFw5sydhQlxAqdTv/2NZWUI+T5TKO+89uCO4hHVKyxU1GN2qAAFrpGOm5N
Content-ID: <CF12D5C2DD94CA4697087AB5ECB178F3@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b938dcb7-d252-4abc-c956-08d76d037818
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 15:16:36.1815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdG+FfS0Oq8/uzlNCsI+CmK/x/idIMmOHaRUhetoMYDGxbNehF/0NTW9fdwEN7DoL0aZH4UXzPZP7cABHtwwLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3503
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "joculator@gmail.com" <joculator@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuDQoNCk9uIE1vbiwgMjAxOS0xMS0xOCBhdCAwNjoxOCArMDAwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPiANCj4gT24gMTQvMTEvMjAxOSAxNDoxMiwgQXJ0ZW0gTXlnYWlldiB3cm90
ZToNCj4gPiBIZWxsbyBKdWxpZW4NCj4gDQo+IEhpLA0KPiANCj4gPiBPbiBUaHUsIDIwMTktMTEt
MTQgYXQgMDg6MTkgKzA5MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiA+IA0KPiA+ID4gT24g
VGh1LCAxNCBOb3YgMjAxOSwgMDI6MTUgQXJ0ZW0gTXlnYWlldiwgPA0KPiA+ID4gQXJ0ZW1fTXln
YWlldkBlcGFtLmNvbQ0KPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gSGkgSmFuLA0KPiA+ID4gPiAN
Cj4gPiA+ID4gU29ycnkgZm9yIGRlbGF5ZWQgcmVwbHkNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFRo
dSwgMjAxOS0xMS0wNyBhdCAwODozMSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPiA+
ID4gT24gMDYuMTEuMjAxOSAyMzowOCwgQXJ0ZW0gTXlnYWlldiB3cm90ZToNCj4gPiA+ID4gPiA+
IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgNDoyOCBQTSBKYW4gQmV1bGljaCA8DQo+ID4gPiA+ID4g
PiBqYmV1bGljaEBzdXNlLmNvbQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiBPbiAwNi4xMS4yMDE5IDEwOjE5LCBBbmRyaWkgQW5pc292IHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiA+IC0tLSBhL0NvbmZpZy5taw0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL0Nv
bmZpZy5taw0KPiA+ID4gPiA+ID4gPiA+IEBAIC0yMjEsNyArMjIxLDkgQEAgQ0ZMQUdTICs9IC1X
YWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
PiAgICQoY2FsbCBjYy1vcHRpb24tYWRkLEhPU1RDRkxBR1MsSE9TVENDLC1XZGVjbGFyYXRpb24t
DQo+ID4gPiA+IA0KPiA+ID4gPiBhZnRlci0NCj4gPiA+ID4gPiA+ID4gPiBzdGF0ZW1lbnQpDQo+
ID4gPiA+ID4gPiA+ID4gICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVdkZWNsYXJh
dGlvbi1hZnRlci0NCj4gPiA+ID4gDQo+ID4gPiA+IHN0YXRlbWVudCkNCj4gPiA+ID4gPiA+ID4g
PiAraWZuZXEgKCQoYXJtZHMpLHkpDQo+ID4gPiA+ID4gPiA+ID4gICAkKGNhbGwgY2Mtb3B0aW9u
LWFkZCxDRkxBR1MsQ0MsLVduby11bnVzZWQtYnV0LXNldC0NCj4gPiA+ID4gDQo+ID4gPiA+IHZh
cmlhYmxlKQ0KPiA+ID4gPiA+ID4gPiA+ICtlbmRpZg0KPiA+ID4gPiA+ID4gPiA+ICAgJChjYWxs
IGNjLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLC1Xbm8tdW51c2VkLWxvY2FsLQ0KPiA+ID4gPiA+ID4g
PiA+IHR5cGVkZWZzKQ0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ICAgTERGTEFH
UyArPSAkKGZvcmVhY2ggaSwgJChFWFRSQV9MSUIpLCAtTCQoaSkpDQo+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiAuLi4gdGhpcyB3b3VsZCBiZSBuZWNlc3NhcnkuDQo+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+IEkgYW0gdmVyeSBzb3JyeSwgdGhpcyBwYXRjaCBkb2VzIG5vdCBoYXZlIGEg
cHJvcGVyDQo+ID4gPiA+ID4gPiBkZXNjcmlwdGlvbg0KPiA+ID4gPiA+ID4gaW5kZWVkLg0KPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBGb3IgdGhpcyBwYXJ0aWN1bGFyIGNoYW5nZSAtIGFybSBj
bGFuZyBkb2VzIG5vdCB1bmRlc3RhbmQNCj4gPiA+ID4gPiA+IC1Xbm8tdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGUNCj4gPiA+ID4gPiA+IG9wdGlvbiBhdCBhbGwsIHRoYXQgaXMgd2h5IGl0IGlzIHVu
ZGVyICEkKGFybWRzKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEJ1dCBhdm9pZGluZyB0byBhZGQg
b3B0aW9ucyB3aGljaCB0aGUgY29tcGlsZXIgZG9lc24ndA0KPiA+ID4gPiA+IHVuZGVyc3RhbmQN
Cj4gPiA+ID4gPiBpcyB0aGUgcHVycG9zZSBvZiB1c2luZyBjYy1vcHRpb24tYWRkLCByYXRoZXIg
dGhhbiBibGluZGx5DQo+ID4gPiA+ID4gYWRkaW5nDQo+ID4gPiA+ID4gdGhlbSB0byBDRkxBR1Mu
IFdoYXQgYW0gSSBtaXNzaW5nIGhlcmU/DQo+ID4gPiA+IA0KPiA+ID4gPiBZb3UgYXJlIHJpZ2h0
LCB0aGUgc2NyaXB0IHNoYWxsIGNoZWNrIHRoZSBjb21waWxlciBvcHRpb24gYW5kDQo+ID4gPiA+
IGF2b2lkDQo+ID4gPiA+IGluY2x1ZGluZyBpdCB0byBDRkxBR1MuIEJ1dCBhcm1jbGFuZyByZXF1
aXJlICctLXRhcmdldD0uLi4nIHRvDQo+ID4gPiA+IGJlDQo+ID4gPiA+IHNwZWNpZmllZCBpbiBv
cmRlciB0byBvcGVyYXRlIHByb3Blcmx5LCBhbmQgdGhlIHByb3BlciBmaXgNCj4gPiA+ID4gc2hh
bGwgYmUNCj4gPiA+ID4gc29tZXRoaW5nIGxpa2UgdGhpcyAoaW5zdGVhZCBvZiAnaWZuZXEnIGhh
Y2sgYWJvdmUpOg0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0Nv
bmZpZy5taw0KPiA+ID4gPiBpbmRleCAwMTQ4N2E3Li5hYmU4ZTQ0IDEwMDY0NA0KPiA+ID4gPiAt
LS0gYS9Db25maWcubWsNCj4gPiA+ID4gKysrIGIvQ29uZmlnLm1rDQo+ID4gPiA+IEBAIC0xMDcs
NyArMTA3LDcgQEAgY2Mtb3B0aW9uID0gJChzaGVsbCBpZiB0ZXN0IC16ICJgZWNobw0KPiA+ID4g
PiAndm9pZCpwPTE7JyB8IFwNCj4gPiA+ID4gICAjIFVzYWdlOiAkKGNhbGwgY2Mtb3B0aW9uLWFk
ZCBDRkxBR1MsQ0MsLW1hcmNoPXdpbmNoaXAtYzYpDQo+ID4gPiA+ICAgY2Mtb3B0aW9uLWFkZCA9
ICQoZXZhbCAkKGNhbGwgY2Mtb3B0aW9uLWFkZC0NCj4gPiA+ID4gY2xvc3VyZSwkKDEpLCQoMiks
JCgzKSkpDQo+ID4gPiA+ICAgZGVmaW5lIGNjLW9wdGlvbi1hZGQtY2xvc3VyZQ0KPiA+ID4gPiAt
ICAgIGlmbmVxICgkJChjYWxsIGNjLW9wdGlvbiwkJCgkKDIpKSwkKDMpLG4pLG4pDQo+ID4gPiA+
ICsgICAgaWZuZXEgKCQkKGNhbGwgY2Mtb3B0aW9uLCQkKCQoMikgJCgxKSksJCgzKSxuKSxuKQ0K
PiA+ID4gPiAgICAgICAgICAgJCgxKSArPSAkKDMpDQo+ID4gPiA+ICAgICAgIGVuZGlmDQo+ID4g
PiA+ICAgZW5kZWYNCj4gPiA+ID4gDQo+ID4gPiA+IHNvIHRoYXQgQ0ZMQUdTIHRoYXQgYXJlIGFs
cmVhZHkgZGVmaW5lZCBhbmQgaW5jbHVkZSAnDQo+ID4gPiA+IC0tdGFyZ2V0PS4uLicNCj4gPiA+
ID4gb3B0aW9uIGZyb20gY29uZmlnL2FybSoubWsgYXJlIHBhc3NlZCB0byBjb21waWxlciB0byBt
YWtlIGl0DQo+ID4gPiA+IGhhcHB5Lg0KPiA+ID4gPiBJDQo+ID4gPiA+IGFtIG5vdCBzdXJlIGlm
IHRoaXMgYnJlYWtzIGFueXRoaW5nIGVsc2Ugc28gZGVjaWRlZCB0byBnbyB3aXRoDQo+ID4gPiA+
IHVnbHkNCj4gPiA+ID4gJ2lmbmVxJyBoYWNrIGFuZCBjaGVjayBob3cgdGhpcyBjYW4gYmUgc29s
dmVkIGxhdGVyIG9uLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFdoeSBub3QgaW5jbHVkaW5nIC0t
dGFyZ2V0IGluIENDIHZhcmlhYmxlIGFzIHRoaXMgd2FzIHN1Z2dlc3RlZA0KPiA+ID4gZm9yDQo+
ID4gPiBjbGFuZz8NCj4gPiANCj4gPiBJbiBjYXNlIG9mIGFybWNsYW5nIC0tdGFyZ2V0IGlzIG5v
dCB0aGUgc2FtZSBhcyBDUk9TU19DT01QSUxFLCB3ZQ0KPiA+IHdvdWxkDQo+ID4gbmVlZCB0byBp
bnRyb2R1Y2UgYW4gZXh0cmEgdmFyaWFibGUgaW5zdGVhZCBvZiBDRkxBR1MgYW5kIHRoZW4gcGFz
cw0KPiA+IGl0DQo+ID4gdG8gdGhlIGNvbXBpbGVyIGluIHNpbWlsYXIgd2F5IC10YXJnZXQgcGFz
c2VkIHRvIGNsYW5nOg0KPiANCj4gSUhNTywgLS10YXJnZXQgKGFybWRzKSBhbmQgLXRhcmdldCAo
Y2xhbmcpIGFyZSBleGFjdGx5IHRoZSBzYW1lLiBZb3UgDQo+IHNwZWNpZnkgdGhlIHRhcmdldGVk
IGFyY2hpdGVjdHVyZSB0byBidWlsZC4gU28gSSB0aGluayB3ZSBuZWVkIGENCj4gc2ltaWxhciAN
Cj4gYXBwcm9hY2ggaW4gdGhlIGJvdGggY2FzZS4gQWx0aG91Z2gsIGluIGNsYW5nIHRoZXJlIGFy
ZSBhIGRlZmF1bHQNCj4gb25lIA0KPiB3aGVuIG5vdCBzcGVjaWZpZWQuDQoNClVuZm9ydHVuYXRl
bHkgdGhpcyBpcyBub3QgdGhlIGNhc2UgLSB3ZSBuZWVkIHRvIHNwZWNpZnkgMiBkaWZmZXJlbnQN
CnRhcmdldHM6IDFzdCBpcyBmb3IgR05VIHRvb2xzIHdoaWNoIGFyZSBzdGlsbCB1c2VkIHdoZW4g
YnVpbGRpbmcgd2l0aA0KYXJtY2xhbmcsIGZvciBkZWJ1ZyBzeW1ib2xzIGR1bXBpbmcgZXRjLiAo
dGhlcmUgaXMgbm8gcmVwbGFjZW1lbnQgaW4NCkFybSB0b29sc3RhY2sgZm9yIHRoZW0sIGFuZCB0
aGlzIGlzIG5vdCBvbiBzYWZldHkgY3JpdGljYWwgcGF0aCBzbyB3ZQ0KYXJlIGZpbmUpIGFuZCAy
bmQgaXMgZm9yIGFybWNsYW5nIGl0c2VsZiBiZWNhdXNlIGl0IGhhcyBpdHMgb3duDQp0cmlwbGV0
cyBkZWZpbml0aW9uIHdoaWNoIGlzIG5vdCBjb25zaXN0ZW50IHdpdGggdGhvc2UgdXNlZCBieSBH
TlUNCnRvb2xzLg0KDQo+IA0KPiBJIGFncmVlIHRoYXQgdXNpbmcgQ1JPU1NfQ09NUElMRSBpcyBh
IGJpdCBvZiBhIHN0cmV0Y2ggKGV2ZW4gb24NCj4gY2xhbmcpLiANCj4gVGhlcmUgd2FzIGFjdHVh
bGx5IGEgbGVuZ2h0eSBkaXNjdXNzaW9uIChzZWUgWzFdKSBhYm91dCB0aGUgbWVhbmluZw0KPiBv
ZiANCj4gQ1JPU1NfQ09NUElMRS4gTWF5YmUgd2Ugd2FudCB0byBpbnRyb2R1Y2UgYSBuZXcgdmFy
aWFibGUgKGUuZy4NCj4gVEFSR0VUKSANCj4gdGhhdCBjYW4gYmUgdXNlZCB0byBwYXNzIHRoZSB0
cmlwbGV0Lg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlnL1N0ZEdOVS5tayBiL2NvbmZpZy9T
dGRHTlUubWsNCj4gPiBpbmRleCAzYmYzNDYyLi40YmNmYzU4IDEwMDY0NA0KPiA+IC0tLSBhL2Nv
bmZpZy9TdGRHTlUubWsNCj4gPiArKysgYi9jb25maWcvU3RkR05VLm1rDQo+ID4gQEAgLTMsOCAr
Myw4IEBAIEFSICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpYXINCj4gPiAgIExEICAgICAgICAg
PSAkKENST1NTX0NPTVBJTEUpbGQNCj4gPiAgIGlmZXEgKCQoY2xhbmcpLHkpDQo+ID4gICBpZmVx
ICgkKGFybWRzKSx5KQ0KPiA+IC1DQyAgICAgICAgID0gYXJtY2xhbmcNCj4gPiAtQ1hYICAgICAg
ICA9IGFybWNsYW5nDQo+ID4gK0NDICAgICAgICAgPSBhcm1jbGFuZyAtLXRhcmdldD0kKEFSTURT
X1RBUkdFVCkNCj4gPiArQ1hYICAgICAgICA9IGFybWNsYW5nIC0tdGFyZ2V0PSQoQVJNRFNfVEFS
R0VUKQ0KPiA+ICAgTERfTFRPICAgICA9IGFybWxpbmsgLS12ZXJib3NlIC0tbm9fc2NhbmxpYg0K
PiA+ICAgTEQgICAgICAgICA9IGFybWxpbmsgLS12ZXJib3NlIC0tbm9fc2NhbmxpYg0KPiA+ICAg
QVMgICAgICAgICA9IGFybWFzbQ0KPiA+IGRpZmYgLS1naXQgYS9jb25maWcvYXJtMzIubWsgYi9j
b25maWcvYXJtMzIubWsNCj4gPiBpbmRleCA1YWZlZDA3Li5iNGM4ZmIxIDEwMDY0NA0KPiA+IC0t
LSBhL2NvbmZpZy9hcm0zMi5taw0KPiA+ICsrKyBiL2NvbmZpZy9hcm0zMi5taw0KPiA+IEBAIC00
LDEwICs0LDEyIEBAIENPTkZJR19BUk1fJChYRU5fT1MpIDo9IHkNCj4gPiAgIA0KPiA+ICAgQ09O
RklHX1hFTl9JTlNUQUxMX1NVRkZJWCA6PQ0KPiA+ICAgDQo+ID4gK0FSTURTX1RBUkdFVCA6PSBh
cm0tYXJtLW5vbmUtZWFiaQ0KPiA+ICsNCj4gPiAgICMgRXhwbGljaXRseSBzcGVjaWZpeSAzMi1i
aXQgQVJNIElTQSBzaW5jZSB0b29sY2hhaW4gZGVmYXVsdCBjYW4NCj4gPiBiZQ0KPiA+IC1tdGh1
bWI6DQo+ID4gICBpZmVxICgkKGFybWRzKSx5KQ0KPiA+ICAgIyBWRSBuZWVkZWQNCj4gPiAtQ0ZM
QUdTICs9IC0tdGFyZ2V0PWFybS1hcm0tbm9uZS1lYWJpIC1tYXJjaD1hcm12Ny1hDQo+ID4gK0NG
TEFHUyArPSAtbWFyY2g9YXJtdjctYQ0KPiA+ICAgZWxzZQ0KPiA+ICAgQ0ZMQUdTICs9IC1tYXJt
ICMgLW1hcmNoPSAtbWNwdT0NCj4gPiAgICMgVXNlIG9ubHkgaWYgY2FsbGluZyAkKExEKSBkaXJl
Y3RseS4NCj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlnL2FybTY0Lm1rIGIvY29uZmlnL2FybTY0Lm1r
DQo+ID4gaW5kZXggNDZiMjAzZC4uNTdhNzMzNSAxMDA2NDQNCj4gPiAtLS0gYS9jb25maWcvYXJt
NjQubWsNCj4gPiArKysgYi9jb25maWcvYXJtNjQubWsNCj4gPiBAQCAtNCw5ICs0LDExIEBAIENP
TkZJR19BUk1fJChYRU5fT1MpIDo9IHkNCj4gPiAgIA0KPiA+ICAgQ09ORklHX1hFTl9JTlNUQUxM
X1NVRkZJWCA6PQ0KPiA+ICAgDQo+ID4gK0FSTURTX1RBUkdFVCA6PSBhYXJjaDY0LWFybS1ub25l
LWVhYmkNCj4gPiArDQo+ID4gICBpZmVxICgkKGFybWRzKSx5KQ0KPiA+ICAgIyBWRSBuZWVkZWQN
Cj4gPiAtQ0ZMQUdTICs9IC0tdGFyZ2V0PWFhcmNoNjQtYXJtLW5vbmUtZWFiaSAtbWFyY2g9YXJt
djguMS0NCj4gPiBhK25vZnArbm9zaW1kDQo+ID4gK0NGTEFHUyArPSAtbWFyY2g9YXJtdjguMS1h
K25vZnArbm9zaW1kDQo+ID4gICBlbHNlDQo+ID4gICBDRkxBR1MgKz0gIy1tYXJtIC1tYXJjaD0g
LW1jcHU9IGV0Yw0KPiA+ICAgIyBVc2Ugb25seSBpZiBjYWxsaW5nICQoTEQpIGRpcmVjdGx5Lg0K
PiA+IA0KPiA+IEJ1dCBwZXJzb25hbGx5LCBJIHJlYWxseSBkbyBub3Qgd2FudCB0byBhZGQgbW9y
ZSBidWlsZCB2YXJpYWJsZXMNCj4gPiBhbmQNCj4gPiBmbGFncyAod291bGQgYWxzbyBkcm9wIHRo
ZSAnYXJtZHMnIGlmIEkgZmluZCBhIHdheSBob3cpLiBJbnN0ZWFkLA0KPiA+IEknZA0KPiA+IHBy
ZWZlciB0aGUgaWRlYSBvZiByZS11c2luZyBrbm93biBDRkxBR1MgZHVyaW5nIHRoZSBjYy1vcHRp
b24NCj4gPiB0ZXN0cywNCj4gPiBidXQsIGFzIEkgd3JvdGUgYWJvdmUsIHdhc24ndCBzdXJlIGlm
IHRoaXMgaXMgYSByaWdodC9zYWZlIHRoaW5nIHRvDQo+ID4gZG8sDQo+ID4gc28gd2hpbGUgd29y
a2luZyBvbiBpdCBJIGp1c3QgcXVpY2tseSBoYWNrZWQgb3V0IHRoZSBvcHRpb24gY2F1c2luZw0K
PiA+IGlzc3VlcyBsaW1pdGluZyBhbW91bnQgb2YgY2hhbmdlcy4NCj4gDQo+IFRoZSBxdWVzdGlv
biBoZXJlIGlzIHdoZXRoZXIgdGhlIHRhcmdldCBpcyBhbHdheXMgZml4ZWQgZm9yDQo+IGFybTY0
L2FybTMyLiANCj4gQXJlIHRoZSB0d28gdHJpcGxldHMgdXNlZCB0aGUgb25seSBleGlzdGluZyBm
b3IgYXJtZHM/DQoNClRoZXkgYXJlIGZpeGVkIGFuZCBkZWZpbmVkIGluIEFybSBjb21waWxlciBk
b2MsIG9ubHkgMiBvcHRpb25zIGV4aXN0DQpmb3IgQWFyY2gzMiBhbmQgQWFyY2g2NCBhcmNoaXRl
Y3R1cmVzOiAtLXRhcmdldD1hYXJjaDY0LWFybS1ub25lLWVhYmkNCm9yIC0tdGFyZ2V0PWFybS1h
cm0tbm9uZS1lYWJpLiBTZWUgZS5nLiBbMl0NCg0KWzJdIA0KaHR0cHM6Ly9kZXZlbG9wZXIuYXJt
LmNvbS9kb2NzLzEwMDc0OC8wNjEyL3VzaW5nLWNvbW1vbi1jb21waWxlci1vcHRpb25zL2NvbW1v
bi1hcm0tY29tcGlsZXItdG9vbGNoYWluLW9wdGlvbnMNCg0KPiANCj4gQ2hlZXJzLA0KPiANCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
