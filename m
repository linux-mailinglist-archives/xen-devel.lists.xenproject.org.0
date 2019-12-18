Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E48124645
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:56:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXtF-0003Wt-M0; Wed, 18 Dec 2019 11:53:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihXtD-0003Wd-CI
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:53:15 +0000
X-Inumbo-ID: f8c6593e-218c-11ea-9066-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.114]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8c6593e-218c-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 11:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJbn5LePU8hsw5ERcySgxcRUXJmT43ljPI/uYiMwV8DSA+W1GUj1h5v4LX476xqq3MleZJaZZ5DRF2yYO3Vme3j7toMQzEM/g1ioCi0JKIz2S714lYPiIsxc8Ny4Gcug0JZ4ZwBeoM8UpD3Pv1qG6TyiKv3jMmcE9ZP7y5ivLc25QTjFDdqsj0SA6/9bbXFDP9YFxqu4WiJVgu8KyjU0dwVQYdLNtJD4DjYQEwBsZJi3bqKlYvhzHNoGULgHzqyuiubzx76vwo50qG+NW2g9/ksuJMZEroyMLZNG5/9kcINrEU4odAH5BQG/VuXFO5xd0uD9ZmsOnz10DOxgMMOAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYTM7pWaCgIlbv64N217tfhaoO/2WodO9NAYRGMXJwI=;
 b=n1zkyGYt3JZV8QzIhzxqhbrN0e/stFxXpsXU/+9XJxKFX6z6sQUjhTMTPEbZ94uOiv2pKp/5T+L5QMuE/szHToAz1ZsyHqkfjx0vzyX+1BhR+FNP5eoDo5Bp6jb1+g7PuFBhNas/jWRzJyPjbkZJ/zJP5lpI9NTvIsGH7JOcm6snTOChGrvcNDiSYOrpVMcs/farcxoE/imoxwdg/yTFHGFSHUJ7sHY5mrno7mXdv8d0Ksx9E6cIlg+ql6M8P/uPNvf4az7eKKW2HNrJD9oi/CTTHD2Pz4zWS8WiG6nQY5BmZvlcSt38L79JgOdFFOIo4WlWItpqbbkCUBK6fY75lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYTM7pWaCgIlbv64N217tfhaoO/2WodO9NAYRGMXJwI=;
 b=SmoPQ7Qx2+sY3q/OR+0oWFfqui/QVEU5D7p2H+5Q6o60gnJWOApPJpSdmdis+tDPuX8MFLpzMNyGPaIbvDy8C5WyPjLnCjRo41ATh2SQoET5P5AlbA57NPmKromvLXG1k7FYg36i65wumZtnBenB7O8rTzU3ab+C85zSdtlTkFA=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4483.eurprd02.prod.outlook.com (20.178.17.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 11:53:13 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 11:53:13 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH V4 4/4] x86/mm: Make use of the default access param from
 xc_altp2m_create_view
Thread-Index: AQHVtOxtPhIY/fNOfU26Nr2n4YFnQqe/tqeAgAAS8YA=
Date: Wed, 18 Dec 2019 11:53:12 +0000
Message-ID: <9a3244a5-36c4-07e3-d79c-4a2f8beb2d54@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-4-aisaila@bitdefender.com>
 <81907d55-2e36-96f7-95cf-990f062a273c@suse.com>
In-Reply-To: <81907d55-2e36-96f7-95cf-990f062a273c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:207:5::34) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 266404ad-6ec5-46d2-f14f-08d783b0dc32
x-ms-traffictypediagnostic: AM0PR02MB4483:|AM0PR02MB4483:|AM0PR02MB4483:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB44837CC6923B477B23E62AA3AB530@AM0PR02MB4483.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(31696002)(478600001)(5660300002)(36756003)(81156014)(81166006)(66946007)(4326008)(110136005)(186003)(6486002)(52116002)(86362001)(31686004)(7416002)(6512007)(107886003)(8676002)(8936002)(71200400001)(66476007)(66556008)(316002)(2616005)(53546011)(54906003)(6506007)(66446008)(64756008)(2906002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4483;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wj+NW9wlxu+qw5QpdzQqjhpA8RW4nT6eLqi9oqp+Un+5irln6iXgcWV/Jj9ZE6Rsu3zUC2xKx6wY3OyA+T2wFF5pBXS/BIlXk2bZYiMRQmOZ4VGagn7G8YsOMvFiCzrlIvcJDW6BGz0x/9EYXbZ7hG9vTHhq9Cr61siZmqYy2/ZNknwKAtpb3NKUE002VCK/+nCkkk1hSmtv1yGGOy76tAD8neRsSnK7pJ3AWMmxY74AXwIDs6coZBL+lvvOOmbsmAaE+pD8JxqFGJCadoXF0Bq4SRnPcUltUkX2RE5ODWI+4SX+ZXaEIlJhJbhDdWBXDdOzJf6G+ZttchpqjGWKl9A6m7CxGttMZBkVIwBXa6rEbsAsO215GpKVceUqqkrg1rgmnY9Yg4CjH5SQOX+xsnwuGBcE9mzNHvwnAAACo0HnJ2ubfbBEnPqIFY6zi/yb
Content-ID: <71FB7122716E224EA774E9AF8DDC2762@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266404ad-6ec5-46d2-f14f-08d783b0dc32
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 11:53:12.9312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbvZXUYCiRa9WnzQ1DpOO+sRhCkTlRjLgJcprwjM4jDHZxfLmLhMcMdjY2313ojlDyzJiqjV41BC7lXDT/u9aHhVHVg1f34ZGcsei3+I0Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4483
Subject: Re: [Xen-devel] [PATCH V4 4/4] x86/mm: Make use of the default
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjEyLjIwMTkgMTI6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMi4y
MDE5IDE2OjEyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNj
ZXNzLmMNCj4+IEBAIC0zMTQsOSArMzE0LDkgQEAgc3RhdGljIGludCBzZXRfbWVtX2FjY2Vzcyhz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPj4gICAgICAgcmV0dXJu
IHJjOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBib29sIHhlbm1lbV9hY2Nlc3NfdG9fcDJt
X2FjY2VzcyhzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB4ZW5tZW1fYWNjZXNzX3QgeGFjY2VzcywNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2FjY2Vzc190ICpwYWNjZXNzKQ0K
Pj4gK2Jvb2wgeGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNzKHN0cnVjdCBwMm1fZG9tYWluICpw
Mm0sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVubWVtX2FjY2Vzc190
IHhhY2Nlc3MsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2FjY2Vz
c190ICpwYWNjZXNzKQ0KPiANCj4gV291bGQgeW91IG1pbmQgdGFraW5nIHRoZSBvcHBvcnR1bml0
eSBhbmQgYWRkIGNvbnN0IHRvIHRoZSBmaXJzdA0KPiBwYXJhbWV0ZXI/DQoNClN1cmUsIGdpdmVu
IHRoYXQgdGhlcmUgd2lsbCBiZSBhIG5ldyB2ZXJzaW9uLCBpdCB3aWxsIGFkZCBpdC4NCg0KPiAN
Cj4+IEBAIC0yNjAxLDcgKzI2MTAsMTUgQEAgaW50IHAybV9pbml0X25leHRfYWx0cDJtKHN0cnVj
dCBkb21haW4gKmQsIHVpbnQxNl90ICppZHgpDQo+PiAgICAgICAgICAgaWYgKCBkLT5hcmNoLmFs
dHAybV9lcHRwW2ldICE9IG1mbl94KElOVkFMSURfTUZOKSApDQo+PiAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPj4gICANCj4+IC0gICAgICAgIHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShkLCBp
KTsNCj4+ICsgICAgICAgIHAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsNCj4+ICsNCj4+ICsg
ICAgICAgIGlmICggIXhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2VzcyhwMm0sIGh2bW1lbV9kZWZh
dWx0X2FjY2VzcywgJmEpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBhbHRwMm1f
bGlzdF91bmxvY2soZCk7DQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAg
ICAgICB9DQo+IA0KPiBDYW4gdGhpcyBiZSBwdWxsZWQgb3V0IG9mIHRoZSBsb2NrZWQgcmVnaW9u
LCBhaGVhZCBvZiB0aGUgbG9vcD8NCj4gVGhlIHAybSBnZXR0aW5nIHBhc3NlZCBpbiBoZXJlICh3
aGljaCBpcyB3aHkgaXQncyBpbiB0aGUgbG9vcCkNCj4gc2hvdWxkbid0IGhhdmUgYmVlbiBpbiB1
c2UgeWV0LCBpLmUuIGl0cyAtPmRlZmF1bHRfYWNjZXNzIHNob3VsZA0KPiBoYXZlIGEga25vd24g
dmFsdWUuIEhlbmNlIHRoaXMgY2FzZSBjb3VsZCBiZSB0YWtlbiBjYXJlIG9mDQo+IGluZGVwZW5k
ZW50bHksIGUuZy4gYnkgYWRqdXN0aW5nIHhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2VzcygpDQo+
IHRvIGNvcGUgd2l0aCBhIE5VTEwgcDJtIGNvbWluZyBpbiAocHJvZHVjaW5nIHdoYXRldmVyIHRo
ZSBkZWZhdWx0DQo+IG9mIHRoZSBkZWZhdWx0IGlzKS4NCj4gDQoNClllcyB0aGlzIHNvdW5kcyBn
b29kLiBJbiB4ZW5tZW1fYWNjZXNzX3RvX3AybV9hY2Nlc3MoKSB0aGVyZSBjYW4gYmUgYSANCmNo
ZWNrIGxpa2U6DQoNCmlmICggIXAybSApDQogICAgICpwYWNjZXNzID0gcDJtX2FjY2Vzc19yd3g7
DQplbHNlDQogICAgICpwYWNjZXNzID0gcDJtLT5kZWZhdWx0X2FjY2VzczsNCg0KQnV0IGJlZm9y
ZSBJIGNoYW5nZSB0aGlzIG1heWJlIFRhbWFzIG9yIEdlb3JnZSBoYXZlIHNvbWV0aGluZyB0byBh
ZGQ/DQpBbmQgY2FuIHRoaXMgc3RheSBpbiB0aGUgc2FtZSBwYXRjaCBvciBzaG91bGQgaXQgaGF2
ZSBhIHByZXJlcSBvbmU/DQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
