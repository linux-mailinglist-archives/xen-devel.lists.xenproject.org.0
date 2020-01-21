Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30A143D87
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 14:00:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itt5l-0002nH-Pq; Tue, 21 Jan 2020 12:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8osE=3K=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1itt5k-0002nA-Gb
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:57:12 +0000
X-Inumbo-ID: 89d6571e-3c4d-11ea-9fd7-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::702])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89d6571e-3c4d-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 12:57:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDiI7Q1SNnbuq1dqkl7sBn6UgrIlYzyHd44sPaAi+oSo7xlNuNloqj3uS/N0idXgEB6M/d7Qa7mOmKrhug7vLjTf+9br0+rkjK+/nHIs5ogygeRct9OzHR7t32eAklAviqV8Il1HcCLeHxDTcJhRKBNGVEJP6F6DxODP1bn6irZ+Na5CNTve75FSm4EOK01odigTaoFwmL/wa7hSbV6TqJ46C86gTHKD4GZNLKL5WPg2REUFAev2KNGhjXHH/YQUvRt+GhVZ7ODhnvlPcB2YstNIRFndKd+6lkcWrfYAbTZGouv9kHu5Ia/VLNnGPkt/zecycEQEJHDRpOyy00F4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo0s+13vf+oqJ7dsept0Uw0JsLbutmnrgqW/FrJUY8s=;
 b=jx/bX7zL2K0vX66/LGDrWm8LvI+IwU8LwvnijpxHmaIwL/NUlH+2HWOMeEN0GeBG/KRaGjwmtG5icVnSwAADHQBDpHZitEQfALHfeSkjlPHZgfMO7/nrZpKqH7lU9BjZIaOp1pnaYmadNnmOMi3+o1aMuXQIQXVB8I2mXjpHCcdy+lwUxpcMJExtAXZK/8dAgD5WyInlcR2sEEhsXgFQK6TsY/hknU/JfhucDDwhQGrhR75oIwpMg+VDcwovqi653/r8bPWVRVIzNtsi8sOKYHMpy8+onyfGbNkTVw31s9A5W94UEQd06VTgEhd+dn0r7PSpIBUH6poVlMIObsjhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo0s+13vf+oqJ7dsept0Uw0JsLbutmnrgqW/FrJUY8s=;
 b=nX/cMAhYksIK1c/P4qYbVOyO8R5VP7KdM4/iaZZ6BUa3NXaFio4maXXMAMs2+0Rhcn/25ptYO8AiwmlL4Dsf7ys9SzcvsxHdbAzTY6kLFOKW28r8rpRGvJhzjTF4i3Vj5ilxMQdoHnJNlSAn7f0YlKi4EdDq+wp+o/LKcXQJaeY=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB5591.eurprd02.prod.outlook.com (10.255.120.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Tue, 21 Jan 2020 12:57:08 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 12:57:08 +0000
Received: from pepi-Latitude-E5570 (91.199.104.6) by
 AM0PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:208:55::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.22 via Frontend Transport; Tue, 21 Jan 2020 12:57:07 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V8 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVzTptMPE/AtSUUU2wUupLHavs1af1GhwA
Date: Tue, 21 Jan 2020 12:57:08 +0000
Message-ID: <ff9a0f576bcd36a140deb3efd497776f36f6f352.camel@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
 <20200117133059.14602-2-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-2-aisaila@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0004.eurprd05.prod.outlook.com
 (2603:10a6:208:55::17) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e95d4f5-7218-43da-c36a-08d79e716c80
x-ms-traffictypediagnostic: AM6PR02MB5591:|AM6PR02MB5591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB5591FAADB2B5AA43EFF4600DD60D0@AM6PR02MB5591.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(110136005)(54906003)(5660300002)(71200400001)(316002)(6486002)(186003)(2906002)(16526019)(66476007)(66446008)(66556008)(52116002)(8936002)(26005)(4744005)(6496006)(64756008)(7416002)(4326008)(36756003)(81166006)(66946007)(86362001)(81156014)(478600001)(2616005)(956004)(8676002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5591;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OXya9Z1hPIkyu/jLGLcT2Kvyl1KkkB1sFROI1E3ANh6y0IyiJvcxIWYCM+ZqAVUrvIbwQCKq2gB/gIFi9XWoe1sfm4Sbmk4Zy62+Vu9WPrgBV8X/fW7i5Wu7C8uq2Rl5R08G8HtRBFDj2XMiOTPzFXqy/8ZKe1cEoraAxWwhoCVVDC4py9Udu4uEDDNKy1R/vyv9ilTaK29SyWW7rsz1+aajpmHhA0SRF4JEr69PYcNdyqUkGgguZ+Kth9QYUNaR53uilqqefdXnEtFCQ6WL1juHfLRloWf2BmCC/WQwkq4rXUJ+xR6j2DhIUQubv4vELuhX6Ix0aIRUF7iiIOJoVc6DYuKeKNrM3I1/QCDhgY3XMQ8UNyVpbOCdzREDqhPDffEHOjrxiyeo9dQNNdYC/5KX62ZgMK/A2NfjIqkBacL5CVtEtPXiQ5UTh2FO3Mod5ZMg44im8lMlDKmRqgouTq6ClRgb6zqPAg19RIlvpOUm+NpyLFQ5Lu1PRLC5nmiv
Content-ID: <CCD7BF890042554BA2CB30E7DB43FEA7@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e95d4f5-7218-43da-c36a-08d79e716c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 12:57:08.6864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaAUFgYcr7RTY1WZIBeb2Cct1qHaWCiNSt5W7tAut9/0fA17WdeV9MuEyhpSkCfGWIn1BhNXE9PMCtE9wc6NQmR4iN0yqR2fNdt2XPH265w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5591
Subject: Re: [Xen-devel] [PATCH V8 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAxLTE3IGF0IDE1OjMxICswMjAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gQnkgZGVmYXVsdCB0aGUgc3ZlIGJpdHMgYXJlIG5vdCBzZXQuDQo+IFRoaXMg
cGF0Y2ggYWRkcyBhIG5ldyBoeXBlcmNhbGwsIHhjX2FsdHAybV9zZXRfc3VwcmVzc192ZV9tdWx0
aSgpLA0KPiB0byBzZXQgYSByYW5nZSBvZiBzdmUgYml0cy4NCj4gVGhlIGNvcmUgZnVuY3Rpb24s
IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoKSwgZG9lcyBub3QgYnJlYWsgaW4NCj4gY2FzZQ0K
PiBvZiBhIGVycm9yIGFuZCBpdCBpcyBkb2luZyBhIGJlc3QgZWZmb3J0IGZvciBzZXR0aW5nIHRo
ZSBiaXRzIGluIHRoZQ0KPiBnaXZlbiByYW5nZS4gQSBjaGVjayBmb3IgY29udGludWF0aW9uIGlz
IG1hZGUgaW4gb3JkZXIgdG8gaGF2ZQ0KPiBwcmVlbXB0aW9uIG9uIGxhcmdlIHJhbmdlcy4NCj4g
VGhlIGdmbiBvZiB0aGUgZmlyc3QgZXJyb3IgaXMgc3RvcmVkIGluDQo+IHhlbl9odm1fYWx0cDJt
X3N1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vycm9yX2dmbiBhbmQgdGhlIGVycm9yIGNvZGUNCj4g
aXMNCj4gc3RvcmVkIGluIHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vy
cm9yLg0KPiBJZiBubyBlcnJvciBvY2N1cnJlZCB0aGUgdmFsdWVzIHdpbGwgYmUgMC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
Pg0KPiANClJldmlld2VkLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5k
ZXIuY29tPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
