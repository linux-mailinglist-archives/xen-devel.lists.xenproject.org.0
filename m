Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5B5E597
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifPh-0007uQ-2Q; Wed, 03 Jul 2019 13:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hifPf-0007uL-Vx
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:35:08 +0000
X-Inumbo-ID: 5c53812c-9d97-11e9-a523-cbccaa70e6cc
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c53812c-9d97-11e9-a523-cbccaa70e6cc;
 Wed, 03 Jul 2019 13:35:03 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:35:02 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:29:34 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:29:34 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3268.namprd18.prod.outlook.com (10.255.137.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 3 Jul 2019 13:29:32 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:29:32 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
Thread-Index: AQHVMA90BljvITdDGUqgQggQX/Boqqa4wnSAgAAih5CAAAGQAA==
Date: Wed, 3 Jul 2019 13:29:32 +0000
Message-ID: <14d8827e-6b13-2f0c-dd1d-f22b0917ec29@suse.com>
References: <20190701131750.37855-1-paul.durrant@citrix.com>
 <a57d3e6a-b28a-611b-9db7-c49004157da3@suse.com>
 <e07d1e6fa911456490ec9a8475fa4000@AMSPEX02CL03.citrite.net>
In-Reply-To: <e07d1e6fa911456490ec9a8475fa4000@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:10:110::29) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1159eeb1-bd27-4bbb-f76c-08d6ffba7b8a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3268; 
x-ms-traffictypediagnostic: BY5PR18MB3268:
x-microsoft-antispam-prvs: <BY5PR18MB32683E9B7B48B9685F370984B3FB0@BY5PR18MB3268.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(189003)(199004)(13464003)(52314003)(2906002)(11346002)(186003)(6486002)(446003)(66066001)(2616005)(53546011)(6506007)(476003)(7736002)(26005)(6436002)(386003)(229853002)(102836004)(36756003)(76176011)(81156014)(6512007)(71200400001)(81166006)(4326008)(305945005)(99286004)(31696002)(8676002)(71190400001)(53936002)(52116002)(8936002)(86362001)(6246003)(478600001)(54906003)(14454004)(14444005)(486006)(25786009)(80792005)(110136005)(2501003)(73956011)(66946007)(5660300002)(31686004)(3846002)(6116002)(72206003)(316002)(256004)(68736007)(66446008)(64756008)(66556008)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3268;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hhjN6Tnqs1J59ie01nmhlrrEgmc2E1m6BaU0FFCoSgvK74o75fJMMRUumbqyBpbJrchEBF8j5++SB6YjDpO5tsthlv7HkdQ8yyQs4bAJWIbnmnuID8jVlaA0eSWILBhogJrliRVsxkBpFKoj/n40NbibLzb3CkASO4kSc+vu2iEhZ3bBm91fAiuD0T5fk4IWhNZ/StGPgsIr2zxp4pIk6kRoCiXgSBnmvXf5matBslkTBCK5Po+8S3ubz6fb1H7tex+GsaKcn5XhLDofoerrYlh8QlpeL8pWtFCHyBI635SrDUi4J6+QXdBAvtXXQfQ7VsVdd6ofDNoJKsHDymF8+tkcDcCtkYZ7v7Nuud01/xDJyaNiQ8xTxVIAcpZqNiFM65JZ8nMg86R3+ABYRPou7Umax7H82y5qwavJyJAtXXc=
Content-ID: <79B501B2FEC3F34CA6E2EA3166E20418@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1159eeb1-bd27-4bbb-f76c-08d6ffba7b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:29:32.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3268
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Tamas
 KLengyel <tamas@tklengyel.com>, George Dunlap <George.Dunlap@citrix.com>,
 WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNToyNSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4N
Cj4+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxNDoyMA0KPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4+IENj
OiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4+IDxHZW9yZ2UuRHVu
bGFwQGNpdHJpeC5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBX
ZWlMaXUgPHdsQHhlbi5vcmc+DQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBwYXNzdGhyb3VnaC9w
Y2k6IHByb3Blcmx5IHF1YWxpZnkgdGhlIG1lbV9zaGFyaW5nX2VuYWJsZWQgY2hlY2suLi4NCj4+
DQo+PiBPbiAwMS4wNy4yMDE5IDE1OjE3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+Pj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9wY2kuYw0KPj4+IEBAIC0xNDUwLDcgKzE0NTAsNyBAQCBzdGF0aWMgaW50IGFzc2ln
bl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMy
DQo+PiBmbGFnKQ0KPj4+DQo+Pj4gICAgICAgIC8qIFByZXZlbnQgZGV2aWNlIGFzc2lnbiBpZiBt
ZW0gcGFnaW5nIG9yIG1lbSBzaGFyaW5nIGhhdmUgYmVlbg0KPj4+ICAgICAgICAgKiBlbmFibGVk
IGZvciB0aGlzIGRvbWFpbiAqLw0KPj4+IC0gICAgaWYgKCB1bmxpa2VseShkLT5hcmNoLmh2bS5t
ZW1fc2hhcmluZ19lbmFibGVkIHx8DQo+Pj4gKyAgICBpZiAoIHVubGlrZWx5KG1lbV9zaGFyaW5n
X2VuYWJsZWQoZCkgfHwNCj4+PiAgICAgICAgICAgICAgICAgICAgICB2bV9ldmVudF9jaGVja19y
aW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwNCj4+PiAgICAgICAgICAgICAgICAgICAgICBwMm1f
Z2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQ0KPj4+ICAgICAgICAgICAgcmV0dXJu
IC1FWERFVjsNCj4+DQo+PiBUaGlzIGNoYW5nZSBpcyByZWR1bmRhbnQgd2l0aCB0aGUgbW9yZSBl
eHRlbnNpdmUgb25lIGJ5DQo+PiAieDg2L0hWTTogcDJtX3JhbV9ybyBpcyBpbmNvbXBhdGlibGUg
d2l0aCBkZXZpY2UgcGFzcy10aHJvdWdoIiwNCj4+IG9mIHdoaWNoIEkndmUgc2VudCB2MiBlYXJs
aWVyIHRvZGF5LCBhbmQgdjEgb2Ygd2hpY2ggaGFzIGJlZW4NCj4+IHBlbmRpbmcgZm9yIHF1aXRl
IHNvbWUgdGltZSB3aXRob3V0IGhhdmluZyBoZWFyZCBiYWNrIGZyb20NCj4+IG90aGVyIHRoYW4g
eW91Lg0KPiANCj4gQWdyZWVkLCBidXQgSSBzdGlsbCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRv
IG1vdmUgdGhlDQo+IG1lbV9zaGFyaW5nX2VuYWJsZWQoKSBtYWNybyBpbnRvIGRvbWFpbi5oLCBz
byBtYXliZSBpbmNvcnBvcmF0ZQ0KPiB0aGF0IGludG8geW91ciBwYXRjaD8NCg0KSG1tLCB0aGF0
IHdvdWxkIGFjdHVhbGx5IGhhdmUgYmVlbiBhIHF1ZXN0aW9uIG9mIG1pbmUgaWYgSSBoYWRuJ3QN
CnJlY29nbml6ZWQgdGhlIHJlZHVuZGFuY3k6IFdoeSBkb21haW4uaCByYXRoZXIgdGhhbiBtZW1f
c2hhcmluZy5oPw0KRnVydGhlcm1vcmUgSSdkIHJhdGhlciBub3QgdXNlIGl0IGhlcmUgYW55d2F5
LCB0byBhdm9pZCB0d28NCmNvbnNlY3V0aXZlIGlzX2h2bV8qKCkgY2hlY2tzICh3aGljaCBoYXZl
IGJlY29tZSBzbGlnaHRseSBtb3JlDQpleHBlbnNpdmUgd2l0aCB0aGUgTEZFTkNFIGFkZGl0aW9u
KS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
