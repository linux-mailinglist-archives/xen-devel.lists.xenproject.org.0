Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79556866A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:38:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmxOJ-0006Wq-Hl; Mon, 15 Jul 2019 09:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmxOH-0006Wl-PV
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:35:25 +0000
X-Inumbo-ID: d54134da-a6e3-11e9-8385-c7670d7417c5
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d54134da-a6e3-11e9-8385-c7670d7417c5;
 Mon, 15 Jul 2019 09:35:21 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 09:35:10 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 09:18:15 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 09:18:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv/lcWQItidS6t75VAL3ag0vuQyKF7sVCdPQfz9A7w5JSbMqKBJQSBJhdAeFGg2czkMcG1iLUwjIM7De9YwQACbPr+D9gixt4/67ytFAIXVeEb8LbOTteQr68jcN2KtE1JDvuWMYLQHHBgajps2ryzHpSTQygoWwNOIQN1yJLgEzDSuZcWJvEQ43UT5gpwjwG3UMp8y/+IajA9LVreDmkFkltq4DE/QLT8PA9xfAOzG/B2d8M1CU69UXEUmqN/wOi9AugIxrj/X0VG0EISZbKL9T7YRMwoOn4qxmSTpDehaUDtfIPL215r0DtpEXXFvxnbzMICp30krEttqDM415PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM6QHVKF3D+PBAk7fRd+umBeUtd6pMcUevl0r1WUvHw=;
 b=bZq79+igrX4x6tVck/KF/LxM3mRFLjVHKZ7ELjaYkU0E8/Nm2snWDRlyjg4PlPhkJ3KZ20KR6MrVjyXtEvEi/IpLD6U0ezObwCZaYjBxG2lQm+Zyci7hdvYH6nUlpBnCK+STDdQhlUBeC4VBDSa7dHpi2XzpzCfHzmxPlM1TPLqYzRYcQQ+uazM9pL/SM4Rm4kCYF+N0jdBdgIV3MHeGIeIHbnwoC9ANLvVAIJ6+UTSMxVmD3Yp4QylOG7XFsagipffzP/Q7+BXnaqdXPnqmwhsdVmxtL5YFTMa1nB0DA7RLlrbChxWkP6h6z/Zr7eykiE3KazxIK3g3xxzzvCvLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0052.namprd18.prod.outlook.com (20.178.229.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 09:18:13 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 09:18:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
Thread-Index: AQHVNz5AbDzZgpaVWECo7hdqnCPqGqbEVHqAgAcOBACAAAtxAA==
Date: Mon, 15 Jul 2019 09:18:13 +0000
Message-ID: <04d3bc49-9abd-3485-df50-ee00a645d5c9@suse.com>
References: <20190710161733.39119-1-paul.durrant@citrix.com>
 <9bead6ec-9fad-2ba9-3948-de217de6d856@suse.com>
 <c50d8a4fdcba4a61b736d8a748c4659c@AMSPEX02CL03.citrite.net>
In-Reply-To: <c50d8a4fdcba4a61b736d8a748c4659c@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0100.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c048a7a-0479-413c-25de-08d709055cf6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0052; 
x-ms-traffictypediagnostic: DM6SPR01MB0052:
x-microsoft-antispam-prvs: <DM6SPR01MB0052DAECBA25EA34DE01B003B3CF0@DM6SPR01MB0052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(7736002)(66446008)(4326008)(256004)(316002)(53936002)(66476007)(80792005)(71200400001)(99286004)(5660300002)(66946007)(6916009)(36756003)(81166006)(81156014)(66556008)(6512007)(229853002)(66066001)(6246003)(64756008)(486006)(71190400001)(68736007)(8936002)(31696002)(52116002)(8676002)(7416002)(446003)(86362001)(25786009)(478600001)(6436002)(6116002)(6486002)(3846002)(26005)(53546011)(76176011)(305945005)(2906002)(54906003)(2616005)(476003)(11346002)(102836004)(31686004)(186003)(386003)(6506007)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0052;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dp5PmeToaPdDgqdpy3Ji4HyTuLICOea3CoC0mZkKuy5+ER9tO0TtkEikzWK7Mkr/EKwClasDaxeUnL3Cha8U7iWGyocoueMVRStYRfk6DMhl6m4XrpAgAoLC0eRVpJICGsNVuDfOGbUSNWXH5p+Gc2JgebsWwxwIvHJVSq8eA5BsqKLoyMa75WPfXCiFFOrx0GROBS270v3NQpWkqnIONoWsmj22Sd1bePrPBebgN/A7duDBa7ijq28VLaBHyST4YNy5x0iGvJ/340z5fNumtWGLM1JowZTVm/ofFgLleryPgUdrHKn8149iH0A2pc48wflR+bwQ3dReqPTX94JhpBjGrFsjm6rA3ZDNvvQxjp5Z88+kiiqwpdADbWFRyJZ0kFmGwLmq/adwb7nHK5UKrv5Fd6gAmharigXrKXCZFWk=
Content-ID: <E795E2DFFEB75540BC27F2D5D2009066@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c048a7a-0479-413c-25de-08d709055cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 09:18:13.8204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0052
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxMDo0NSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMTAgSnVseSAyMDE5IDIzOjUzDQo+
Pg0KPj4gT24gMTAuMDcuMjAxOSAxODoxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+IEBAIC00
MTgsMTMgKzQxNyw3IEBAIHN0YXRpYyB2b2lkIGh2bV9mcmVlX2lvcmVxX21mbihzdHJ1Y3QgaHZt
X2lvcmVxX3NlcnZlciAqcywgYm9vbCBidWYpDQo+Pj4gICAgICAgIHVubWFwX2RvbWFpbl9wYWdl
X2dsb2JhbChpb3JwLT52YSk7DQo+Pj4gICAgICAgIGlvcnAtPnZhID0gTlVMTDsNCj4+Pg0KPj4+
IC0gICAgLyoNCj4+PiAtICAgICAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBjbGVhciB0aGUg
YWxsb2NhdGlvbiByZWZlcmVuY2UgYmVmb3JlDQo+Pj4gLSAgICAgKiBkcm9wcGluZyB0aGUgZXhw
bGljaXQgcmVmZXJlbmNlcyB0YWtlbiBieSBnZXRfcGFnZV9hbmRfdHlwZSgpLg0KPj4+IC0gICAg
ICovDQo+Pj4gLSAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBh
Z2UtPmNvdW50X2luZm8pICkNCj4+PiAtICAgICAgICBwdXRfcGFnZShwYWdlKTsNCj4+PiAtDQo+
Pj4gKyAgICBjbGVhcl9hc3NpZ25tZW50X3JlZmVyZW5jZShwYWdlKTsNCj4+PiAgICAgICAgcHV0
X3BhZ2VfYW5kX3R5cGUocGFnZSk7DQo+Pj4gICAgfQ0KPj4NCj4+IElzIHRoZXJlIGEgc3BlY2lm
aWMgcmVhc29uIHlvdSBkcm9wIHRoZSBjb21tZW50PyBJdCBkb2Vzbid0IGJlY29tZQ0KPj4gbGVz
cyByZWxldmFudCB0aGFuIHdoZW4gaXQgd2FzIGFkZGVkLCBkb2VzIGl0Pw0KPiANCj4gTm90IHN1
cmUsIHNpbmNlIHdoYXQncyBhY3R1YWxseSBnb2luZyBvbiBpcyBub3cgaW50ZXJuYWwgdG8gdGhl
IGZ1bmN0aW9uLg0KPiBJZiBJIGNoYW5nZSB0aGUgZnVuY3Rpb24gbmFtZSB0byBjbGVhcl9hbGxv
Y2F0aW9uX3JlZmVyZW5jZSgpIHRoZW4gSQ0KPiB0aGluayB0aGUgY29tbWVudCBwcm9iYWJseSBi
ZWNvbWVzIGV4dHJhbmVvdXMuDQoNCldlbGwsIHRoZSBwZXJzcGVjdGl2ZSBJJ20gdGFraW5nIGlz
IHRoYXQgdGhlIG9yZGVyaW5nIGNvbnN0cmFpbnQNCndydCBwdXRfcGFnZV9hbmRfdHlwZSgpIGRv
ZXNuJ3QgZ28gYXdheSBhbmQgaXMgYSByZWxldmFudCBwYXJ0IG9mDQp3aGF0IHRoZSBjb21tZW50
IHRhbGtzIGFib3V0Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
