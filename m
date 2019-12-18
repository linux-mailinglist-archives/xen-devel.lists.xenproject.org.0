Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B8124170
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 09:17:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihUSy-0007dx-V3; Wed, 18 Dec 2019 08:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihUSx-0007ds-UC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 08:13:55 +0000
X-Inumbo-ID: 50034c80-216e-11ea-88e7-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.90]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50034c80-216e-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 08:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyNYRVq4eU/H1UJJl8IWKCuYlXWoMJOVHWb/UYoO6rWoXGXFsBLANlZGb46B5WKRfiqNpu+yE0qymNN834x3+eP/IJ0r5rJlFdz9J6XKIDWLfJd/pzb6lmvuX4MWg6c3669MOhXaMiQLvxroMVPe8FhpGF99ccu8NG7Cy7j2huKmlbCbm/NGNbTJFB9prW98H/GHR7UWHfUbdOP1JC2QejS1lDkII0D09o68lzalKPD2ZbAFTh1vsTnAjFwoxeUlZp/9B8ZbcxhatnLmb1qFWQ+Q/zxfgNmCnx5Dw1n/HWGPAX5zShouLgPk8h3A4aEIXWXx2ZGTvfpqrYSxT/IxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKlSo8t+n2s0aCpV5YMO2xuCxx6aqZ/xwAnef4PdXZg=;
 b=TH4LH4E4pE2klvyNKPLllFm/HyRmT9yaxWfKRD5ChgT16ptK0WGAD3ogHxiiJFw0snUNyjMk7NsGo/muVJ909lFXy6MBLLu1fTawqThBjil7hUKSDl73XbZt7ifq6saa8vNj6JyE2A2EoDplx3CqLbMxoAlQR8+limG/CBCDxk4isiDjwoLOtBNIymNp/QMHjOaz9aKmtiivhEhSNDHLAH6UKbizz/TqVa9FAGAc+6L+aVpYR+qRH1agVMpZ4pAnwSJdu+I39ghLsCR3whGL+b2Zyd0ffMcBzT/ai3G5kmzavmqW/NmXaWTv0tpWVuI+Hvb8fvH2JhWxq1eIGtbXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKlSo8t+n2s0aCpV5YMO2xuCxx6aqZ/xwAnef4PdXZg=;
 b=DjheXd6+w0svdXWtQfuJi+FvwvONdxUduLLShPueWpft5j2Sqhh4zZ+2+FWL9OU6Tv0OomL9a9y/dHQSzvbdnUuxZ4UQ3R+Lek8XosnqW4y6L4xLwTxEov119nh4stos2MAq3ndlaoLwNNzT7/JZ3rZgYshrOaxn0sUl/X++0Vo=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5954.eurprd02.prod.outlook.com (52.132.214.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 08:13:45 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 08:13:45 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V4 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVtOxnMZNvtoiQIE62yqEH5VgLvKe+jS4AgAD/GYA=
Date: Wed, 18 Dec 2019 08:13:44 +0000
Message-ID: <3afbe9f0-0b89-f566-b5f0-b656cb2f23da@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-2-aisaila@bitdefender.com>
 <c0bc8c84-dbb5-0030-061a-a665a7901b80@suse.com>
In-Reply-To: <c0bc8c84-dbb5-0030-061a-a665a7901b80@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0075.eurprd08.prod.outlook.com
 (2603:10a6:205:2::46) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a22aab1-6f93-4601-af33-08d783923373
x-ms-traffictypediagnostic: AM0PR02MB5954:|AM0PR02MB5954:|AM0PR02MB5954:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5954297762EEA695CF5D9DB4AB530@AM0PR02MB5954.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(6486002)(66946007)(66556008)(316002)(66446008)(64756008)(31686004)(6506007)(54906003)(71200400001)(6512007)(6916009)(7416002)(36756003)(2906002)(4326008)(186003)(5660300002)(66476007)(26005)(8936002)(2616005)(31696002)(86362001)(478600001)(81166006)(81156014)(8676002)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5954;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vGYWGy3vWrsQ7qy8hS2714GAIZb8ilx4EjoUapL/FDyN7+e+zhbmYb1hU3wEQrAgachk3oW8TqsYs86kDYsQqDWsfUWM1TxV9rbh0Vta2P+nrYxseqknYYDN9d0GevRjw7oUx3iBFVxKu9HbdRJ00fU/gdRGLq7JYURYxuRfSH1pHTLdSxTeotxkGtF8nGme8I4zBxPM9O1lLVSGahDu+RnfSqtPtXpPhFFNRbdmZTDsv/a0C+iG7P9kKHPwwvWM6fQ7QW54rJf7Kd3y1aC+SoCvuI9dCM5p9f2ZseCpdfm9266l7CVvVFwT52FF6S93LrvZYfF1xKThZMXmqVr7mh3VE0GGSYGERvkJU0lnin2OxZKhunJMvn5lMYVBxq3+4cVmj5WZ1xGFcI5cOJ22SffTbJ11m4clIfEY0hNfoRP8lCvTSHZHsUZkA8rEO3sl
Content-ID: <EF717A6B85A6124DB301322771AB2E63@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a22aab1-6f93-4601-af33-08d783923373
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 08:13:44.8817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMtcv23KGqNRZivY7TNJKJjxRMrkzzLu9vTR7dZWsWtxdXIg1MwXlEmLsS2IELyMwgON2FphRl0Si1muRr1EmNeOulSC5JaZG0DuBudk9j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5954
Subject: Re: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+PiArLyoNCj4+ICsgKiBTZXQvY2xlYXIgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9yIG11bHRp
cGxlIHBhZ2VzLiAgT25seSBhdmFpbGFibGUgb24gVk1YLg0KPj4gKyAqLw0KPj4gK2ludCBwMm1f
c2V0X3N1cHByZXNzX3ZlX211bHRpKHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRp
ICpzdmUpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdF9wMm0gPSBwMm1f
Z2V0X2hvc3RwMm0oZCk7DQo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICphcDJtID0gTlVMTDsN
Cj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IGhvc3RfcDJtOw0KPj4gKyAgICB1aW50
NjRfdCBzdGFydCA9IHN2ZS0+Zmlyc3RfZ2ZuOw0KPj4gKyAgICBpbnQgcmMgPSAwOw0KPj4gKyAg
ICB1aW50NjRfdCBtYXhfcGh5c19hZGRyID0gKDFVTCA8PCBkLT5hcmNoLmNwdWlkLT5leHRkLm1h
eHBoeXNhZGRyKSAtIDE7DQo+PiArDQo+PiArICAgIGlmICggc3ZlLT52aWV3ID4gMCApDQo+PiAr
ICAgIHsNCj4+ICsgICAgICAgIGlmICggc3ZlLT52aWV3ID49IE1BWF9BTFRQMk0gfHwNCj4+ICsg
ICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoc3ZlLT52
aWV3LCBNQVhfRVBUUCldID09DQo+PiArICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSAp
DQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgICAgICBwMm0g
PSBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhzdmUtPnZpZXcs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBNQVhfQUxUUDJNKV07DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcDJtX2xvY2so
aG9zdF9wMm0pOw0KPj4gKw0KPj4gKyAgICBpZiAoIGFwMm0gKQ0KPj4gKyAgICAgICAgcDJtX2xv
Y2soYXAybSk7DQo+PiArDQo+PiArICAgIHdoaWxlICggc3ZlLT5sYXN0X2dmbiA+PSBzdGFydCAm
JiBzdGFydCA8IG1heF9waHlzX2FkZHIgKQ0KPiANCj4gV2h5IGRvbid0IHlvdSBjbGlwIC0+bGFz
dF9nZm4gYWhlYWQgb2YgdGhlIGxvb3AsIHNhdmluZyBvbmUNCj4gY29tcGFyaXNvbiBwZXIgaXRl
cmF0aW9uPw0KDQpJJ3ZlIGRvbmUgdGhpcyBzbyBpdCB3aWxsIGhhdmUgZmV3ZXIgbGluZXMgYnV0
IHN1cmUsIEkgY2FuIGhhdmUgdGhlIA0KLT5sYXN0X2dmbiBjaGVjayBiZWZvcmUgdGhlIGxvb3Au
DQoNCj4gDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHAybV9hY2Nlc3NfdCBhOw0KPj4gKyAgICAg
ICAgcDJtX3R5cGVfdCB0Ow0KPj4gKyAgICAgICAgbWZuX3QgbWZuOw0KPj4gKyAgICAgICAgaW50
IGVyciA9IDA7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGFsdHAybV9nZXRfZWZmZWN0aXZlX2Vu
dHJ5KHAybSwgX2dmbihzdGFydCksICZtZm4sICZ0LCAmYSwgQVAyTUdFVF9xdWVyeSkgKQ0KPj4g
KyAgICAgICAgICAgIGEgPSBwMm0tPmRlZmF1bHRfYWNjZXNzOw0KPj4gKw0KPj4gKyAgICAgICAg
aWYgKCAoZXJyID0gcDJtLT5zZXRfZW50cnkocDJtLCBfZ2ZuKHN0YXJ0KSwgbWZuLCBQQUdFX09S
REVSXzRLLCB0LCBhLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Zl
LT5zdXBwcmVzc192ZSkpICYmICFzdmUtPmZpcnN0X2Vycm9yICkNCj4+ICsgICAgICAgIHsNCj4+
ICsgICAgICAgICAgICBzdmUtPmZpcnN0X2Vycm9yID0gc3RhcnQ7IC8qIFNhdmUgdGhlIGdmbiBv
ZiB0aGUgZmlyc3QgZXJyb3IgKi8NCj4+ICsgICAgICAgICAgICBzdmUtPmZpcnN0X2Vycm9yX2Nv
ZGUgPSBlcnI7IC8qIFNhdmUgdGhlIGZpcnN0IGVycm9yIGNvZGUgKi8NCj4+ICsgICAgICAgIH0N
Cj4gDQo+IFdoYXQgaWYgdGhlIGZpcnN0IGVycm9yIG9jY3VycyBvbiBHRk4gMD8gSSBndWVzcyB5
b3Ugd2FudCB0byBjaGVjaw0KPiAtPmZpcnN0X2Vycm9yX2NvZGUgYWdhaW5zdCB6ZXJvIGluIHRo
ZSBjb25kaXRpb24uDQoNClRoYXQgaXMgcmlnaHQsIEkgd2lsbCBjaGFuZ2UgdG8gY2hlY2sgLT5m
aXJzdF9lcnJvcl9jb2RlIGluc3RlYWQgb2YgDQotPmZpcnN0X2Vycm9yLg0KDQpUaGFua3MsDQpB
bGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
