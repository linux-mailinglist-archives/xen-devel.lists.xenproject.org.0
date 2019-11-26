Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB4510A116
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:18:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcZJ-0005z0-KD; Tue, 26 Nov 2019 15:15:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Gxi=ZS=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1iZcZI-0005yv-7C
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:15:56 +0000
X-Inumbo-ID: a3d261e0-105f-11ea-a3a3-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.120]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3d261e0-105f-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHADuWjgqYsn702I1uOCMM0HkfAJDLvlsh7OIRWnujulx+/VPdfnI2XovTtQ8vje7YYyHVKF+V7MJiGMJcIivJAuA0ujdO8mjUPX8M7IQUOlH9C5YYMqulMsuidqrqdJ5ifJG02YyaTjuuvh6GRDeLk4weT4zn4slABtwwGSvA430ADQMyJovjUWavDbE046/skYs+U7pjpszQi7Nacs1adhVeizXGCajfcIOkrcBjxgrsxyZwcBppv7mys5cWUdra9uQQyNnf7aiI7FLqvvq9kXJshrYWBti4+UMfpAFQFqsg4/FSGBnk1vrCwdLiQu21Z60zsqHN8d93PIHztEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNznjxZuOkHDFRDIGzF9SX34mxPvc8saxIvRedCBp2M=;
 b=Lg/da601iAtYcL9xGf/wLue2cAKMiwAD9x1mcu4byn3hmTBz6QGooKa64b+mnBYogxlv7ppRWQt9NlPDykqwJGwVJeb89ti07/KrWXCkr38HIN9yOnHDaJQNiiQPXWwLw4AC2ULZ/CvFjt4ze2vgoJqj3QDcHJjbuS8gNiSEOyZ7ZpMjHN0eBaw9Jyuo3uhb3RxYAbrx75CeHhUwhCxWqOd1sznrteOKb0iR5YXQoiBfcReaXvFkIlGQ/0wgHpywvr3WMkHslZGbo8Jf2vNLSpXu+H1iIpiJc75t4D7KPrJxGDVSzt70H3WWhCZukLb5LT1kdkXjLGhRyBMyOUMsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNznjxZuOkHDFRDIGzF9SX34mxPvc8saxIvRedCBp2M=;
 b=lfdkjtBxG3f6q0sWy0FravZqzDtE3ZJDV6hL+f9lB/2lDdHBc+GdJBhQzOxvueOZQl0Y/yjTlBNysVDG7pOgP+e9/vAgA2r45e/74hHLZowJv+s3Ve8np+BsmRrIBdmUHuU3gzLDOwfPHxKJ0eWPAzGlH5CmVaL+NiF1PEB1X6U=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB3973.eurprd02.prod.outlook.com (20.177.114.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 15:15:53 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::24d8:e9cf:24b6:f9cd]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::24d8:e9cf:24b6:f9cd%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:15:53 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/3] x86/svm: Always intercept ICEBP
Thread-Index: AQHVpFGs2dLY1rb8bkmMGlapXTy5F6edkCOA
Date: Tue, 26 Nov 2019 15:15:52 +0000
Message-ID: <a8e6299a70fd9a807db34e64d0c0dec5efc9f3f5.camel@bitdefender.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
In-Reply-To: <20191126120357.13398-3-andrew.cooper3@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::43) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50fb03f1-30e6-4bb8-cbb9-08d772838705
x-ms-traffictypediagnostic: AM6PR02MB3973:|AM6PR02MB3973:|AM6PR02MB3973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB39735527246C18E291654928D6450@AM6PR02MB3973.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(2616005)(76176011)(102836004)(54906003)(6512007)(118296001)(110136005)(71200400001)(71190400001)(5660300002)(256004)(26005)(8676002)(316002)(66446008)(64756008)(66556008)(66946007)(66476007)(66066001)(11346002)(6246003)(4326008)(446003)(186003)(2906002)(4001150100001)(6116002)(3846002)(81156014)(99286004)(81166006)(7736002)(305945005)(86362001)(6486002)(229853002)(8936002)(478600001)(14454004)(50226002)(25786009)(36756003)(6436002)(386003)(52116002)(6506007)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB3973;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RoPW4lKpHQ+Kb7jNGP4Ve2TFi0SIoOaeY39ERvZ7ySU/2zFsF5Bd9KvNyvLryBtwnYXmcTEtE0c9L6zlj0ExMgx5YpSvXg01mgXXlN9khVWYPJ1kata5C4Ofg1eoYm0YY3jktwIgUsQL+OFc9I9Kn4dL3bS+878esoQhOBPcGHBWWaHn6uHeI5/5liMH1DxX7q3hacELn0+h6Rfg+1Tlq3N4NCBSqeTAlu/3UY+vvHKAXbJzmuE9NGT5/DTX38TCyiPznYSZOuxi942FXu6mu47E2JPXMwzDFfE7tk5JOPwnd9SHCXWzBo0B/jqZI+QZ6FrqNCWmysnc5O9QyBacKu1WeCEOPcHYyAubIr6QkYT2St8Vy5P2fNJIbAMIFL4RRLYNwpAFGIgF/ErdNpsixCWaDuiNgIIKsgTTE9DP5N9oAHOqJ5BQF0DtvsUVDpqy
Content-ID: <86140C745714814E91CEC678340F5F50@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fb03f1-30e6-4bb8-cbb9-08d772838705
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 15:15:52.9959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uVAw9cTbqLIVxUwblXfiZuUH2MqzJAxWEMm3yGFzC5RAXDgIYGbfF4uyB3a/pYp9GC2Smjz4MU7GzhHOLfdEkWrDheT0E4SNOKYnbzoDYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB3973
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Jan Beulich <JBeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTExLTI2IGF0IDEyOjAzICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBJQ0VCUCBpc24ndCBoYW5kbGVkIHdlbGwgYnkgU1ZNLg0KPiANCj4gVGhlIFZNZXhpdCBzdGF0
ZSBmb3IgYSAjREItdmVjdG9yZWQgVEFTS19TV0lUQ0ggaGFzICVyaXAgcG9pbnRpbmcgdG8NCj4g
dGhlDQo+IGFwcHJvcHJpYXRlIGluc3RydWN0aW9uIGJvdW5kYXJ5IChmYXVsdCBvciB0cmFwLCBh
cyBhcHByb3ByaWF0ZSksDQo+IGV4Y2VwdCBmb3INCj4gYW4gSUNFQlAtaW5kdWNlZCAjREIgVEFT
S19TV0lUQ0gsIHdoZXJlICVyaXAgcG9pbnRzIGF0IHRoZSBJQ0VCUA0KPiBpbnN0cnVjdGlvbg0K
PiByYXRoZXIgdGhhbiBhZnRlciBpdC4gIEFzIElDRUJQIGlzbid0IGRpc3Rpbmd1aXNoZWQgaW4g
dGhlIHZlY3RvcmluZw0KPiBldmVudA0KPiB0eXBlLCB0aGUgc3RhdGUgaXMgYW1iaWd1b3VzLg0K
PiANCj4gVG8gYWRkIHRvIHRoZSBjb25mdXNpb24sIGFuIElDRUJQIHdoaWNoIG9jY3VycyBkdWUg
dG8gSW50cm9zcGVjdGlvbg0KPiBpbnRlcmNlcHRpbmcgdGhlIGluc3RydWN0aW9uLCBvciBmcm9t
IHg4Nl9lbXVsYXRlKCkgd2lsbCBoYXZlICVyaXANCj4gdXBkYXRlZCBhcw0KPiBhIGNvbnNlcXVl
bmNlIG9mIHBhcnRpYWwgZW11bGF0aW9uIHJlcXVpcmVkIHRvIGluamVjdCBhbiBJQ0VCUCBldmVu
dA0KPiBpbiB0aGUNCj4gZmlyc3QgcGxhY2UuDQo+IA0KPiBXZSBjb3VsZCBpbiBwcmluY2lwbGUg
c3BvdCB0aGUgbm9uLWluamVjdGVkIGNhc2UgaW4gdGhlIFRBU0tfU1dJVENIDQo+IGhhbmRsZXIs
DQo+IGJ1dCB0aGlzIHN0aWxsIHJlc3VsdHMgaW4gY29tcGxleGl0eSBpZiB0aGUgSUNFQlAgaW5z
dHJ1Y3Rpb24gYWxzbw0KPiBoYXMgYW4NCj4gSW5zdHJ1Y3Rpb24gQnJlYWtwb2ludCBhY3RpdmUg
b24gaXQgKHdoaWNoIGdlbnVpbmVseSBoYXMgZmF1bHQNCj4gc2VtYW50aWNzKS4NCj4gDQo+IFVu
Y29uZGl0aW9uYWxseSBpbnRlcmNlcHQgSUNFQlAuICBUaGlzIGRvZXMgaGF2ZSBhIHRyYXAgc2Vt
YW50aWNzIGZvcg0KPiB0aGUNCj4gaW50ZXJjZXB0LCBhbmQgYWxsb3dzIHVzIHRvIG1vdmUgJXJp
cCBmb3J3YXJkcyBhcHByb3ByaWF0ZWx5IGJlZm9yZQ0KPiB0aGUNCj4gVEFTS19TV0lUQ0ggaW50
ZXJjZXB0IGlzIGhpdC4gIFRoaXMgbWFrZXMgdGhlIGJlaGF2aW91ciBvZiAjREItDQo+IHZlY3Rv
cmVkDQo+IHN3aXRjaGVzIGNvbnNpc3RlbnQgaG93ZXZlciB0aGUgSUNFQlAgI0RCIGNhbWUgYWJv
dXQsIGFuZCBhdm9pZHMNCj4gc3BlY2lhbCBjYXNlcw0KPiBpbiB0aGUgVEFTS19TV0lUQ0ggaW50
ZXJjZXB0Lg0KPiANCj4gVGhpcyBpbiB0dXJuIGFsbG93cyBmb3IgdGhlIHJlbW92YWwgb2YgdGhl
IGNvbmRpdGlvbmFsDQo+IGh2bV9zZXRfaWNlYnBfaW50ZXJjZXB0aW9uKCkgbG9naWMgdXNlZCBi
eSB0aGUgbW9uaXRvciBzdWJzeXN0ZW0sIGFzDQo+IElDRUJQJ3MNCj4gd2lsbCBub3cgYWx3YXlz
IGJlIHN1Ym1pdHRlZCBmb3IgbW9uaXRvcmluZyBjaGVja3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANClJldmlld2Vk
LWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
