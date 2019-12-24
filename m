Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DDB12A017
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 11:23:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijhI8-00088E-3m; Tue, 24 Dec 2019 10:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3nNa=2O=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijhI6-000889-O9
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 10:19:50 +0000
X-Inumbo-ID: ea891a74-2636-11ea-88e7-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::728])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea891a74-2636-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 10:19:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCWxcyqmlECy0We8x/jIgBgmVUdjGztzNQA84ZebRef4QZB+p1o7lH9q5UC+Tna73hjaOdwGM6zgtj1HJtVPExNoF0yDHQo9l82sv7S3kNNmi/7YuM2ks7pFqOy8K5bsOEzYH8DrrCnXQKYh5z8ND4q+Ed4t/sEID4a0PhUWqAaXMBxoRIUaNG2m/FaqBH3HNDorPE8qaRtyOhIRsciqeuBmxe1+M2nEpiv2HZbsi+aCDP7tzKikQkcXc7qV9cW8sIsg/z4/LKRf0v+AXW8Ctql+0vGn+62RyMSpq5XnzirevStdR/n4+W32+nRt/D+Ru85tVeXGUovE7fT3WoYCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdkR4iXglSVMCf479wulRKDXiKrcKTw4I5DFn8TtEJ4=;
 b=WAtV+JlQWfDyyE8Z3Y97g8qKSebztuOccbJIZ3/P7Kz1EvHu2sPbRB8FlPSF9vLSn19MZkwFEwS/KtEdsbJZ/G8OsEjzxCrgOV1u57nGpWAIpnt3qdQoAcTROApr10p5OtVjkKqzRRwA5qOATupJPa4VZA/63PyeTImuDnUsf4hi/xUCQ6UtFlyn6uInFs0TwukNX4Q7MygO9O1y9jfT8hRWG2yGOMe5+EQ37JDOpf9pYgZ+OOC5W3UXrtioZePelgBx9aqc91T7gywUd8axuPdeTUFa030/Sv8zWmSvdG51twTRCnrPknMh5dkJoQ/8vFqKso1Rgh7BYutrrs9W5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdkR4iXglSVMCf479wulRKDXiKrcKTw4I5DFn8TtEJ4=;
 b=m8Y0odw7isrzJq1JU8M0YDqHoLluNRnJuEmypPjMQjfanAWFdPmr/Hud8nQ09PrZqIULmup+czZBDtyu/kB2sdstkzjT6COMIkmBkmYJDmr495aSuZh0eTHthhZ/Y/KlrVFf+Hn/ijXrc7+6jshV3Xi56T2crPTYO+hoGBtW/IE=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB3793.eurprd02.prod.outlook.com (52.134.80.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 10:19:48 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 10:19:48 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6 4/4] x86/mm: Make use of the default access param from
 xc_altp2m_create_view
Thread-Index: AQHVuZnrNlPztLTziE+Y8R0jH4JRdKfI+p+AgAAZgIA=
Date: Tue, 24 Dec 2019 10:19:48 +0000
Message-ID: <a85de548-83ce-b177-ee94-8dbc819974ed@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-4-aisaila@bitdefender.com>
 <dc7df6c5-1784-656d-c8b6-71b3dad30d7c@citrix.com>
In-Reply-To: <dc7df6c5-1784-656d-c8b6-71b3dad30d7c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::28) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a1c9829-391b-46eb-c706-08d7885acde2
x-ms-traffictypediagnostic: AM0PR02MB3793:|AM0PR02MB3793:|AM0PR02MB3793:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB37934372B6A654F1E7488931AB290@AM0PR02MB3793.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(396003)(39860400002)(376002)(199004)(189003)(81156014)(81166006)(6506007)(52116002)(7416002)(8676002)(31686004)(53546011)(8936002)(6512007)(107886003)(31696002)(2616005)(2906002)(86362001)(66946007)(64756008)(110136005)(66446008)(54906003)(66556008)(5660300002)(66476007)(316002)(186003)(478600001)(6486002)(36756003)(71200400001)(26005)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3793;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQvcMpIv2gOQpZrtgPrml0xVRDcWZUwx6kkqnozKLWynhChDTW/M3WYq2iFY4wi3J0vEbBFRTbnW7a9q5f4inSX8l3KmPoi0P/ViFK2oXl2j4U3NZkELUO/bkSRb3mQLtY6PIzuckpGQekGmqV7WCSSUIxdkuixtYHuPh6NPwnJ20QkNdZ3OOglbqkKfXTX+0l5KjNTk8wh8wzxq2+l1lkZ2oQfuAreWPbM7t4V8lGjDLkBMSxjwJYKFNi6vcTZfIAodOJV1zcO/X+O/MJe1UyVTZjhuxn5XGXDb7q22aQCaGGqFapBvX2cNdMXa7JEFYhqi7EB33aGsidYTiTOIRY/FK9Wrmkzr6TAUqEgPEXxf0lBtukAEGbO1DRopboMK4dW7Wi5qgAx2cy4Bpha26XanQbLUQvSY2NaHeWa5HcwrXpOGFeRhrgchi6Ql7gTC
Content-ID: <D825B584BD80AF479B2374E7C55E7FBE@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1c9829-391b-46eb-c706-08d7885acde2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 10:19:48.0449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IacoTXDsxt2npYaDS6wZ7/cEY9RQCn+22ZPgBHGg+Sa81tROrD0cR0gk2ItxhgH8EjjAoiXaWwW1DgP4RiFTIpjAllBHzrD6/TcDLleGDTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3793
Subject: Re: [Xen-devel] [PATCH V6 4/4] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI0LjEyLjIwMTkgMTA6NDgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDEyLzIz
LzE5IDI6MDQgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4gQXQgdGhpcyBt
b21lbnQgdGhlIGRlZmF1bHRfYWNjZXNzIHBhcmFtIGZyb20geGNfYWx0cDJtX2NyZWF0ZV92aWV3
IGlzDQo+PiBub3QgdXNlZC4NCj4+DQo+PiBUaGlzIHBhdGNoIGFzc2lnbnMgZGVmYXVsdF9hY2Nl
c3MgdG8gcDJtLT5kZWZhdWx0X2FjY2VzcyBhdCB0aGUgdGltZSBvZg0KPj4gaW5pdGlhbGl6aW5n
IGEgbmV3IGFsdHAybSB2aWV3Lg0KPiANCj4gVGhhdCdzIGNlcnRhaW5seSBub3Qgd2hhdCBpdCBs
b29rcyBsaWtlLiAgSXQgbG9va3MgbGlrZSB5b3UncmUgY2hhbmdpbmcNCj4gaXQgZnJvbS4uLg0K
PiANCj4+IEBAIC0yNTYyLDcgKzI1NjQsNyBAQCBzdGF0aWMgaW50IHAybV9hY3RpdmF0ZV9hbHRw
Mm0oc3RydWN0IGRvbWFpbiAqZCwNCj4gdW5zaWduZWQgaW50IGlkeCkNCj4+ICAgICAgICAgICBn
b3RvIG91dDsNCj4+ICAgICAgIH0NCj4+DQo+PiAtICAgIHAybS0+ZGVmYXVsdF9hY2Nlc3MgPSBo
b3N0cDJtLT5kZWZhdWx0X2FjY2VzczsNCj4+ICsgICAgcDJtLT5kZWZhdWx0X2FjY2VzcyA9IGh2
bW1lbV9kZWZhdWx0X2FjY2VzczsNCj4+ICAgICAgIHAybS0+ZG9tYWluID0gaG9zdHAybS0+ZG9t
YWluOw0KPj4gICAgICAgcDJtLT5nbG9iYWxfbG9nZGlydHkgPSBob3N0cDJtLT5nbG9iYWxfbG9n
ZGlydHk7DQo+PiAgICAgICBwMm0tPm1pbl9yZW1hcHBlZF9nZm4gPSBnZm5feChJTlZBTElEX0dG
Tik7DQo+IA0KPiAuLi5ob3N0cDJtLT5kZWZhdWx0X2FjY2VzcyB0by4uLg0KPiANCj4+IEBAIC0z
NDAsNyArMzQwLDEwIEBAIHN0YXRpYyBib29sIHhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2Vzcyhz
dHJ1Y3QNCj4gcDJtX2RvbWFpbiAqcDJtLA0KPj4gICAgICAgICAgICpwYWNjZXNzID0gbWVtYWNj
ZXNzW3hhY2Nlc3NdOw0KPj4gICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAgY2FzZSBYRU5NRU1f
YWNjZXNzX2RlZmF1bHQ6DQo+PiAtICAgICAgICAqcGFjY2VzcyA9IHAybS0+ZGVmYXVsdF9hY2Nl
c3M7DQo+PiArICAgICAgICBpZiAoICFwMm0gKQ0KPj4gKyAgICAgICAgICAgICpwYWNjZXNzID0g
cDJtX2FjY2Vzc19yd3g7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgKnBhY2Nl
c3MgPSBwMm0tPmRlZmF1bHRfYWNjZXNzOw0KPj4gICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAg
ZGVmYXVsdDoNCj4+ICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+IA0KPiAuLi5wMm1fYWNjZXNz
X3J3eCAoYnkgcGFzc2luZyBOVUxMIGluIHRvIHRoaXMgZnVuY3Rpb24gaW4NCj4gcDJtX2luaXRf
bmV4dF9hbHRwMm0pLg0KPiANCj4gV2h5IGRvbid0IHlvdS4uLg0KPiANCj4+IC1pbnQgcDJtX2lu
aXRfbmV4dF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3QgKmlkeCkNCj4+ICtpbnQg
cDJtX2luaXRfbmV4dF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3QgKmlkeCwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgeGVubWVtX2FjY2Vzc190IGh2bW1lbV9kZWZhdWx0
X2FjY2VzcykNCj4+ICAgew0KPj4gICAgICAgaW50IHJjID0gLUVJTlZBTDsNCj4+ICAgICAgIHVu
c2lnbmVkIGludCBpOw0KPj4gKyAgICBwMm1fYWNjZXNzX3QgYTsNCj4+ICsgICAgc3RydWN0IHAy
bV9kb21haW4gKnAybTsNCj4+ICsNCj4+ICsgICAgaWYgKCBodm1tZW1fZGVmYXVsdF9hY2Nlc3Mg
PiBYRU5NRU1fYWNjZXNzX2RlZmF1bHQgfHwNCj4+ICsgICAgICAgICAheGVubWVtX2FjY2Vzc190
b19wMm1fYWNjZXNzKE5VTEwsIGh2bW1lbV9kZWZhdWx0X2FjY2VzcywgJmEpICkNCj4+ICsgICAg
ICAgIHJldHVybiByYzsNCj4+DQo+PiAgICAgICBhbHRwMm1fbGlzdF9sb2NrKGQpOw0KPj4NCj4g
DQo+IC4uLnBhc3MgaW4gaG9zdHAybSBoZXJlPw0KDQpUaGF0IHNvdW5kIGJldHRlciB0aGVuIHRo
ZSBjdXJyZW50IHZlcnNpb24sIHRoYW5rcy4NCg0KPiANCj4gQWxzby4uLg0KPiANCj4+IEBAIC0y
NjA2LDcgKzI2MTYsOCBAQCBpbnQgcDJtX2luaXRfbmV4dF9hbHRwMm0oc3RydWN0IGRvbWFpbiAq
ZCwNCj4gdWludDE2X3QgKmlkeCkNCj4+ICAgICAgICAgICBpZiAoIGQtPmFyY2guYWx0cDJtX2Vw
dHBbaV0gIT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCj4+ICAgICAgICAgICAgICAgY29udGludWU7
DQo+Pg0KPj4gLSAgICAgICAgcmMgPSBwMm1fYWN0aXZhdGVfYWx0cDJtKGQsIGkpOw0KPj4gKyAg
ICAgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2ldOw0KPiANCj4gV2hhdCdzIHRoaXMgYWJv
dXQ/DQo+IA0KDQpUaGlzIGlzIGFuIGFydGlmYWN0IGZvcm0gdjMgd2hlbiB4ZW5tZW1fYWNjZXNz
X3RvX3AybV9hY2Nlc3MoKSBuZWVkZWQgDQpwMm0uIEkgd2lsbCBjbGVhbiBpdC4NCg0KQWxleA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
