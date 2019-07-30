Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017AC7A333
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:40:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNcw-00027v-NF; Tue, 30 Jul 2019 08:36:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNcu-00027l-UP
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:36:56 +0000
X-Inumbo-ID: 2f81f43b-b2a5-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f81f43b-b2a5-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:36:55 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:36:53 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:29:44 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:29:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK/1wvW0Iz6nQATZpDzjfxF7jcSjWZyIY4x9Msom0CU7kXLmpf1glKhdTaeToE20lp8bsOP8zcNrrd3aPyx5sBNldAxj+OCMt4ujODl695Ahf3oIk0fST/E1D+QarsTOo80xJ+/e0aCGAuqqKLDhmqXd+LVd3MBlJ3Td5NN1P2iPN+JHUb0wexQehtbnZco/OZxtQSeWSyQUS8s2ArlYglqTNEqMuGbPg/d30gsiyNwGVjeYBytuQIHUZNVXVCJ4KC/587nXTU44nNNHD6f3wBM1vcDIfAl5crN3vzu9UIk3XpsoLJBiXldMYFzExp1yjKGyRCw6LqPsoT0TmFJ/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcFv/M7lwN0N8E+c3RAha/AtYMG3i5cSiY4LoAFX6ew=;
 b=DDg3Qh1h/OhQf2FsBVWuQscSfilFaKjWj+0Lw97K703SMIVPW5SbhgzD3n0F7nX6Ci6aJ+P5RkPVDo1qN860auT4GaUQ83EJxtrzGqh6/GAK68Wosl/6Y3moogTMwiXG1KVeQ26Tkr1rTMOGggj1gC2MjAbbb68WS1Gv8lQUMQKH+0ysPQQ8hDPLSJfzb+QmTq4PH2Tjf6F2lb3pE6JpqByM3Q9GrIBb8UyJCDW1DFKovY3k2v/VtCq1u5DA5HSaYIiv/0br0dRBIxynPT7k4kPJ1QE4eXSgklMwgmXN/k9h7ed54kBtabQV7byC7ao6vba+95cfmIC24QiVCXaf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3186.namprd18.prod.outlook.com (10.255.137.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 08:29:43 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:29:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Intel TXT: add reviewer, move to Odd Fixes state
Thread-Index: AQHVRqQXgGfUTRtdJUu4GI2iK/jW8qbi1I8A
Date: Tue, 30 Jul 2019 08:29:42 +0000
Message-ID: <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
In-Reply-To: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0173.eurprd07.prod.outlook.com
 (2603:10a6:6:43::27) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbd98788-bd15-42d1-e7bd-08d714c81204
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3186; 
x-ms-traffictypediagnostic: BY5PR18MB3186:
x-microsoft-antispam-prvs: <BY5PR18MB3186FBBBC0997B945ED76B35B3DC0@BY5PR18MB3186.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(51444003)(2351001)(8936002)(71200400001)(52116002)(186003)(14454004)(66556008)(102836004)(53546011)(6116002)(76176011)(81156014)(81166006)(71190400001)(478600001)(4744005)(486006)(386003)(6506007)(256004)(64756008)(5660300002)(66946007)(14444005)(26005)(66476007)(446003)(7736002)(2906002)(5640700003)(2616005)(8676002)(476003)(66446008)(53936002)(7416002)(3846002)(99286004)(4326008)(305945005)(6246003)(25786009)(229853002)(6916009)(6436002)(6512007)(31696002)(2501003)(316002)(6486002)(11346002)(36756003)(80792005)(68736007)(66066001)(54906003)(86362001)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3186;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ja9dyzReUoR+Jf7S88brGmkDhoGxJJASu9YjH86It8FI5PCG+lXHQMQCMErHuLRhI0lEatIE6jA+yMZzMwvyuAejwDcpqqSR51ilKt0kOFKvBdyYvyJvi0e2zBsZZOowhOnnYxCCRDIjobC6MMPLkaZH8wkraXc/VyqErm9cMPu+MhAYjiJ90V1bqqMB5Mb9d2m1b8Beqlxhbq6ho4VxoScQ96JeF2AvAXsF+DMq2FC3qK+JF5257ITx+UF6YYzxKO+wjetspfDNQhzUgbD1zFnFjIWvznQBBazdzE+Yqu4Z4tAta2lRMJzq/mVU/ni4rnIhGxIAGImHmGsdxhTtfIW2odmorFQHAPisgczZN5rkbE6Ik8qJfpQNvQgEsnRUK0fXufKYESoz2OlTkg76i+QrZZsJiQtVFOzYfpbmAR8=
Content-ID: <00E8279FACA9DB4CB14BAA646671BFDA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd98788-bd15-42d1-e7bd-08d714c81204
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:29:42.7968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3186
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAwODo1NiwgTHVrYXN6IEhhd3J5bGtvIHdyb3RlOg0KPiBTdXBwb3J0IGZv
ciBJbnRlbCBUWFQgaGFzIG9ycGhhbmVkIHN0YXR1cyByaWdodCBub3cgYmVjYXVzZQ0KPiBubyBh
Y3RpdmUgbWFpbnRhaW50ZXIgaXMgbGlzdGVkLiBBZGRpbmcgbXlzZWxmIGFzIHJldmlld2VyDQo+
IGFuZCBtb3ZpbmcgaXQgdG8gT2RkIEZpeGVzIHN0YXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
THVrYXN6IEhhd3J5bGtvIDxsdWthc3ouaGF3cnlsa29AaW50ZWwuY29tPg0KPiAtLS0NCj4gICBN
QUlOVEFJTkVSUyB8IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMNCj4gaW5kZXggODlhMDFiNzEwYi4uY2EzMDBlODdjOCAxMDA2NDQNCj4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTI0MCw3ICsyNDAsOCBAQCBTOglNYWlu
dGFpbmVkDQo+ICBGOgl0b29scy9nb2xhbmcNCj4gIA0KPiAgSU5URUwoUikgVFJVU1RFRCBFWEVD
VVRJT04gVEVDSE5PTE9HWSAoVFhUKQ0KPiAtUzoJT3JwaGFuZWQNCj4gK1I6CUx1a2FzeiBIYXdy
eWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGludGVsLmNvbT4NCj4gK1M6CU9kZCBGaXhlcw0KDQpJIGd1
ZXNzIHdlIHNob3VsZCBnaXZlIGl0IGEgZmV3IGRheXMgZm9yIG9iamVjdGlvbnMgdG8gYmUgcmFp
c2VkDQphZ2FpbnN0IHRoaXMgc2xpZ2h0bHkgaW5jb25zaXN0ZW50IHN0YXRlLCBidXQgSSB0aGlu
ayB0aGF0J3MgdGhlDQpiZXN0IHdheSB0byBleHByZXNzIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRo
aW5ncyAoaGVuY2UgbXkNCnN1Z2dlc3Rpb24gdG8gdGhpcyBlZmZlY3QpLiBJZiBubyBvYmplY3Rp
b25zIHR1cm4gdXAsIEkndmUgcXVldWVkDQp0aGlzIG9udG8gbXkgdG8tYmUtY29tbWl0dGVkIGxp
c3QuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
