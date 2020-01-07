Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD71328F0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 15:33:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioptG-0003EK-G9; Tue, 07 Jan 2020 14:31:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5Cd=24=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ioptF-0003EA-31
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 14:31:25 +0000
X-Inumbo-ID: 61442324-315a-11ea-ac1d-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.107]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61442324-315a-11ea-ac1d-12813bfff9fa;
 Tue, 07 Jan 2020 14:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhSpkRe/Sh3QU6McLh3hFj69tfqvZqP5uriJZ0B/YpR3/5hnahhYRKeBsQyuyHH/H2y1n4HtPnXJER7IOmG+fqj5rGtNY7DkfQeZL7dw/fpStaJgbo2jpfBkv003TqvPmAqYSsW9ZE85wtSaxG0qR4w5BrrjalAUCw/hVA2rfoiKV5UDgkbb0W0Uaij/jLKF8YSUfa8u7PxMcw5qQ39p5JhHEn9rync3sun1ncUVXXFlANUdkgFYeYKpVDCNxCGLkXN9kgyDqSXcOTo5ycchWs2mLx2UUzcsuw0SMBFm4LJrfYbJOdbQp+ajQUDFGHaVV82kNvcGqcntog45f0GjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBPm+d/pY3hDRPrG+XOTF5U5hxN/uf0gu3NoHNsg1ZY=;
 b=cISeq13wWdUEPDee9Klx+C3EDWAaUo9QZGHrNCR1VP7Tq+JPzaEWReeYYpxVWp6YImuZXBwHgDMsII3uDL7YdTZYYeKYMtVIdPkWyW2EJ30thsge/iLgbGKTNzJCKQMbvct9NFyBDph40Ar15WkMdVXeNkgXdFwt5x8Yr0gfMKogXqKSpW67IOL8RmNGXnj5N+H8pvLT5hFetbuzKQsk6N9iHBV6rAM3i+Toj1h58gtE6zZt9e/aHTQWlu93GM92t1OBBrKf1kWbFya4u9MmpZ4XMWEeoJTNpPMDMNu89sb3g1FZDZ61mg1rULDAPRvXSp7NzT60UsrEgZtxIB5vNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBPm+d/pY3hDRPrG+XOTF5U5hxN/uf0gu3NoHNsg1ZY=;
 b=XEmROgQbAxYUGwyuRDUFoHdQtqQeWEz3zPWdIDNSPMz6NKBn6wjJtLBUCfBdofxDw1hMTKbJdH4Wey7ArtJ7ROw5KZhupFNNvBnOyIJp7sO0zNupFRomB0WQAOr9NUe5BffHWCTRmfNyNvVmccUf7Vbbg2Hw4bYtMIdBjswPjro=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3175.eurprd02.prod.outlook.com (10.170.222.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Tue, 7 Jan 2020 14:31:22 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2623.008; Tue, 7 Jan 2020
 14:31:22 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:208:55::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15 via Frontend Transport; Tue, 7 Jan 2020 14:31:21 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4afNpKMAgBHFoYD//+auAIAAChsA
Date: Tue, 7 Jan 2020 14:31:22 +0000
Message-ID: <266b2acd-00d8-8ab5-70ce-f273587dd332@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <39338776-edcd-0b5d-5c39-7d3ef7706525@suse.com>
 <f82b7198-e7c3-df69-f53a-06c436e3ecd6@bitdefender.com>
 <afa5a448-5b82-f2c6-e1b0-11085373699c@suse.com>
In-Reply-To: <afa5a448-5b82-f2c6-e1b0-11085373699c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:208:55::23) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00713caf-a699-4eaa-724a-08d7937e44a2
x-ms-traffictypediagnostic: DB6PR02MB3175:|DB6PR02MB3175:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB317563253DC5B14009C3FCCEAB3F0@DB6PR02MB3175.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(53546011)(2906002)(36756003)(71200400001)(478600001)(316002)(8936002)(31696002)(52116002)(31686004)(64756008)(4326008)(66476007)(6486002)(54906003)(81166006)(5660300002)(956004)(16526019)(81156014)(66556008)(8676002)(86362001)(16576012)(26005)(66946007)(186003)(6916009)(66446008)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3175;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RhMscWtn6LSoFVXBaZ7QU0uO6PpEmbwATkhMYIkkRaD5Rcy03o6Zm8UF26b1EeoFNymbH988WSWVYkFTOK8C0aDZXeEtLT5vVw6k0AkyEE7b8UtBICz4XvNoZvdlGblgzAPmqt3BZEehhNf4mv+rDOsd0G76VECm0nWtvXq6rYrGWbvxh7mId3fVIGZx3bAX1Rt+8DBahZdbb48aMqQwoSeSnA3absEbjHdX9xsUf4M1zG87aWmoSNy+q7YdMstjeN3uJK3l/Hsk5v+MP7EhPFsId+odcRiUTrfUPlc1c1iDdexvqVeBr14gQeRcWq5ht75cAweNPo77flsZ6ujSeHCNzkbjZcck+3sXYu5em7qrkrCRxDC4NREmOonkA3x3BCv8kEc62ztZ5gfYWFNWmjxM1VTHS7RVhJCtAPbhmlTxfGZcX+5GoxQnL0Z+XDR3qFbcsE7FzCyrsmgjeUVDWY3bXuPUlRo/opZjJtL6TB0=
Content-ID: <F9DEB38B3009114CB2CEDA3D9E645ECA@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00713caf-a699-4eaa-724a-08d7937e44a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 14:31:22.4432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPyCyHz/FEZVavxGy5sd5alCE+EKhz85FASofG9UshqJTMzFiGo1wGiehO94hG/RtYTcbQfB/Jd1YZANGk3grbfGggqE1Bt53JXz3llsCG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3175
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA3LjAxLjIwMjAgMTU6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4y
MDIwIDE0OjI1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDI3LjEyLjIw
MTkgMTA6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjEyLjIwMTkgMTU6MDQsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0v
bWVtX2FjY2Vzcy5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+
Pj4gQEAgLTM2NiwxMSArMzY2LDEyIEBAIGxvbmcgcDJtX3NldF9tZW1fYWNjZXNzKHN0cnVjdCBk
b21haW4gKmQsIGdmbl90IGdmbiwgdWludDMyX3QgbnIsDQo+Pj4+ICAgICNpZmRlZiBDT05GSUdf
SFZNDQo+Pj4+ICAgICAgICBpZiAoIGFsdHAybV9pZHggKQ0KPj4+PiAgICAgICAgew0KPj4+PiAt
ICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fA0KPj4+PiAtICAgICAgICAg
ICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4p
ICkNCj4+Pj4gKyAgICAgICAgaWYgKCBhbHRwMm1faWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5h
cmNoLmFsdHAybV9wMm0pLCBNQVhfRVBUUCkgfHwNCj4+Pg0KPj4+IFN0cmF5IGJsYW5rIGFmdGVy
ID49IC4NCj4+Pg0KPj4+PiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlf
aW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1BWF9FUFRQKV0gPT0NCj4+Pg0KPj4+IEkgYWNjZXB0
IHlvdSBjYW4ndCAoY3VycmVudGx5KSB1c2UgYXJyYXlfYWNjZXNzX25vc3BlYygpIGhlcmUsDQo+
Pj4gYnV0IC4uLg0KPj4+DQo+Pj4+ICsgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkN
Cj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICAgIA0KPj4+PiAtICAg
ICAgICBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FsdHAybV9pZHhdOw0KPj4+PiArICAgICAg
ICBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4
LCBNQVhfQUxUUDJNKV07DQo+Pj4NCj4+PiAuLi4gSSBkb24ndCBzZWUgd2h5IHlvdSBzdGlsbCBl
ZmZlY3RpdmVseSBvcGVuLWNvZGUgaXQgaGVyZS4NCj4+DQo+PiBJIGFtIG5vdCBzdXJlIEkgZm9s
bG93IHlvdSBoZXJlLCB0aGF0IGlzIHdoYXQgd2UgYWdyZWVkIGluIHY1DQo+PiAoaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTEyL21zZzAx
NzA0Lmh0bWwpLg0KPj4gRGlkIEkgbWlzcyBzb21ldGhpbmc/DQo+IA0KPiBJbiBjb250ZXh0IHRo
ZXJlIChmcm9tIGFuIGVhcmxpZXIgcmVwbHkgb2YgbWluZSkgeW91IHdpbGwgZmluZCBtZQ0KPiBo
YXZpbmcgbWVudGlvbmVkIGFycmF5X2FjY2Vzc19ub3NwZWMoKS4gVGhpcyB3YXNuJ3QgaW52YWxp
ZGF0ZWQgb3INCj4gb3ZlcnJpZGRlbiBieSBteSAiWWVzLCB0aGF0J3MgaG93IEkgdGhpbmsgaXQg
b3VnaHQgdG8gYmUuIiBJIGRpZG4ndA0KPiBzYXkgc28gZXhwbGljaXRseSAoYWdhaW4pIGJlY2F1
c2UgdG8gbWUgaXQgZ29lcyB3aXRob3V0IHNheWluZyB0aGF0DQo+IG9wZW4tY29kaW5nIF9hbnl0
aGluZ18gaXMsIGluIHRoZSBjb21tb24gY2FzZSwgYmFkIHByYWN0aWNlLg0KPiANCg0KU28gdGhl
IHdheSB0byBnbyBpcyB0byBoYXZlOg0KDQphbHRwMm1faWR4ID0gYXJyYXlfaW5kZXhfbm9zcGVj
KGFsdHAybV9pZHgsIE1BWF9BTFRQMk0pOw0KYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthbHRw
Mm1faWR4XTsNCg0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
