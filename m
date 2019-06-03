Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C537932EAB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 13:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXl8Z-0005F5-5I; Mon, 03 Jun 2019 11:28:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b4kp=UC=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hXl8X-0005F0-MM
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 11:28:21 +0000
X-Inumbo-ID: b03315f1-85f2-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::71d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b03315f1-85f2-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERqiocbL0xFnGMsSAOfH2FYaO3/TXoRZUrbLINfcIvc=;
 b=Gl9shX7L1KwC5XKivfTsXg9PFM5c1QY/TUzib1gpPn5TZ03MZCP5inYRvbSAZ5S3T5VXrsnP1NaFhboi2AbRpJvb/Gx++CABnXa2hRtFCpFFNmkheM0Vpi9uBkJVUni6ewiujdpxI5BgWZkzcOvYeKL7wcjVPqH2djLpIjzFKTE=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB3652.eurprd02.prod.outlook.com (52.134.87.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 11:28:18 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 11:28:18 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 6/9] vm_event: Move struct vm_event_domain to vm_event.c
Thread-Index: AQHVFvKbhjDWuFHolEqXNcdonKP5VaaF56MAgAPpVoA=
Date: Mon, 3 Jun 2019 11:28:18 +0000
Message-ID: <57270ced911c1882b12347b1102140f581c3dcfc.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
 <91ee93af-e42b-064f-1e7e-6f08a40d16c1@citrix.com>
In-Reply-To: <91ee93af-e42b-064f-1e7e-6f08a40d16c1@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::13) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b524675-878e-476f-3e3a-08d6e8169385
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR02MB3652; 
x-ms-traffictypediagnostic: AM0PR02MB3652:|AM0PR02MB3652:
x-microsoft-antispam-prvs: <AM0PR02MB36523E5C6C92FF0C253F8BEDD6140@AM0PR02MB3652.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(376002)(366004)(346002)(189003)(199004)(118296001)(66066001)(14454004)(486006)(68736007)(186003)(229853002)(6486002)(2906002)(7736002)(305945005)(2501003)(3846002)(6512007)(6116002)(6436002)(476003)(50226002)(66556008)(54906003)(64756008)(66446008)(66476007)(8676002)(53936002)(36756003)(8936002)(2616005)(110136005)(73956011)(81166006)(81156014)(66946007)(446003)(11346002)(53546011)(256004)(71200400001)(71190400001)(76176011)(14444005)(99286004)(386003)(6506007)(5660300002)(86362001)(25786009)(102836004)(26005)(508600001)(4326008)(7416002)(316002)(52116002)(4744005)(6246003)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3652;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kC2nG6HHHHNbD/hmmWk/CfL9iwhImbRRpUDKkCDU6LSx/MGyIe6+QQxpRTG8/ju3Zv8f3C6Imf6ccx6TEFqP3+yzWeXhWjN2dlK8A8hwJspZySgHRd/c40BCStnHylWxuQERwzT5/cjsHiMeukAOuZqlbb2xR1OXcDwGIDAGmx1/N+UmFg8EqvhWgQhmknCAAY7QSTprrP5gT7nruQL7sOb/9SgO6oENKT4Q3GR8jRhYeKMan+7+n22rowWuxoDH7P6dmW0l7VHyxQSd8Q0IIlu+M1YAXWIzuLYhku0IHlhTO8+1bi1keFfOeO2heSOSDPdxMWNJcxrzHEwAAhoxdySCnWAFyYFJTad9ltrvFVXoUskGQ0I6GOZYTB2EfDQvc374jVB7l3NSxpsfN8DdIKpzWRRE+ksgJnDJp/elZeY=
Content-ID: <2DD40D9A9F0CA8469980310D1A1F333A@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b524675-878e-476f-3e3a-08d6e8169385
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 11:28:18.3340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3652
Subject: Re: [Xen-devel] [PATCH 6/9] vm_event: Move struct vm_event_domain
 to vm_event.c
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE2OjQ0IC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gVGhlIHZt
X2V2ZW50X2RvbWFpbiBtZW1iZXJzIGFyZSBub3QgYWNjZXNzZWQgb3V0c2lkZSB2bV9ldmVudC5j
IHNvDQo+ID4gaXQncw0KPiA+IGJldHRlciB0byBoaWRlIGRlIGltcGxlbWVudGF0aW9uIGRldGFp
bHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1
QGJpdGRlZmVuZGVyLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4gQXJlIHRoZXJlIGFueSBmaWxlcyB3aGljaCBub3cg
bm8gbG9uZ2VyIG5lZWQgdG8gaW5jbHVkZSBzY2hlZC5oID8gDQo+IChQcm9iYWJseSBub3QsIGJ1
dCBpdCBpcyB3b3J0aCBjaGVja2luZykNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBUaGlzIGVtYWlsIHdhcyBzY2FubmVkIGJ5IEJpdGRlZmVuZGVyDQoNClRoZSAieGVuL3NjaGVk
LmggaGVhZGVyIGNhbiBiZSByZW1vdmVkIGZyb20gdGhlICJ4ZW4vdm1fZXZlbnQuaCINCmluY2x1
ZGUgbGlzdCBieSBmdyBkZWNsYXJpbmcgInN0cnVjdCBkb21haW4iIGFuZCAic3RydWN0DQp2bV9l
dmVudF9kb21haW4iLg0KVGhlIHZtX2V2ZW50IGNsaWVudHMgKG1vbml0b3IsIG1lbV9zaGFyaW5n
LCBtZW1fcGFnaW5nKSBuZWVkIHRvIGluY2x1ZGUNCiJzY2hlZC5oIiBiZWNhdXNlIHRoZXkgbmVl
ZCBhY2Nlc3MgdG8gdGhlICJzdHJ1Y3QgZG9tYWluIiBkZXRhaWxzLg0KDQpNYW55IHRoYW5rcywN
ClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
