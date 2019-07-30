Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6537A36E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:55:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNrA-0003Sw-3Q; Tue, 30 Jul 2019 08:51:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNr9-0003Sr-1J
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:51:39 +0000
X-Inumbo-ID: 3d0a668c-b2a7-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d0a668c-b2a7-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:51:37 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:51:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:46:58 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:46:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVNXquYWE/6+h9bDcP0gszcDIRC0yM6yK9nAS2l0zEqORZQr4ROFdqiiBiTRPw0rcx9CdEx6BccQLzqDXtxsiTJznn1KktvBs1zJbqwOet1EIw24gzxaf99Z3/HV+jVUkW4QunfOMjgRV/R7kjZ5kI2SXCt6P+HJx7JhT9RwmwSXLYSEqJaz5QXtOEdOS6tO6Y1laBZeTNA79I/XPEUbSFFWg1HY+Cl2MJ8srJSnaT1sqUmp7QIAMFaaaO7X0XW+wtIPkzDPIVBy1kIael91PI/2pjDCj4CAa0Lnr1M4weXogit0ComMkE7/ttV0zUNZzjY8wW5M8N/+PwmVBzTLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pk1ofjtbqdvBT6IqNV7O+i3IZk2+lu3IJTcXcbmMriI=;
 b=AsnF89idHfyqIvaf4hs9iivTTUupQGt3Idiyhncn8A3TvehXoM/iaY4bHgncrlOOImLtIUwsc1lYv7GW3nvf6xpZ5nLfdqNazMsgNKHfdQKRuFLoc6At4ES2QEteY1cHNCE2lGZQRGfycOU767hGGoAL2t89DeI0etVYJoUoZuURUBfnSKOHfgjREnvfgBolbqb7Rb0r6IYbz2SZGxpPCRPzM8sFo1npdh4+yFu3O54SOVwSAMKIOSnwFTT+dX3dI8dtDuCUEnF31Xz2u2WqjQjZ4qH/xsUABgwg9j6diHcr6n7yboYxf6TR2Nq56z1HV7ag1jT52MyjjyMweTS81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3282.namprd18.prod.outlook.com (10.255.138.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 08:46:56 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:46:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 2/2] x86/xpti: Don't leak TSS-adjacent percpu data via
 Meltdown
Thread-Index: AQHVRjSFfC2E6IjOF0q7sjJMHtTAKqbi2j4A
Date: Tue, 30 Jul 2019 08:46:56 +0000
Message-ID: <824dc9bc-3fe8-16ae-ec98-446908fadc28@suse.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
 <20190729173843.21586-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190729173843.21586-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0801CA0053.eurprd08.prod.outlook.com
 (2603:10a6:4:2b::21) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8414a8a1-34f7-4cef-8f20-08d714ca79f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3282; 
x-ms-traffictypediagnostic: BY5PR18MB3282:
x-microsoft-antispam-prvs: <BY5PR18MB328270DA8F334CEA04EBAAB1B3DC0@BY5PR18MB3282.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(68736007)(64756008)(316002)(80792005)(81156014)(81166006)(4326008)(14454004)(8676002)(6116002)(71200400001)(3846002)(31696002)(86362001)(6436002)(2906002)(6512007)(71190400001)(478600001)(6916009)(8936002)(25786009)(66946007)(305945005)(53936002)(26005)(5660300002)(446003)(6246003)(53546011)(102836004)(66066001)(186003)(4744005)(2616005)(36756003)(66556008)(52116002)(476003)(6486002)(54906003)(11346002)(229853002)(66446008)(256004)(486006)(76176011)(99286004)(6506007)(386003)(66476007)(7736002)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3282;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PYQbC7zZLYO7HYX+1gpFRUuuMXuXaDaLy8HSIA4/0pe7XUdVoIAHzVE/bByqwLhvR+rsBOqrZRIFK/0fHBAP1CPKKDsoPFhmxSHXX0i+w3d3KDKNhW7Zjqtkuul+aLRxQgOT9pDvxQhJf4/1Jh3LSg1voEQfd7Q4b+VdrOKgWHLVWil2ePsBZaT10glTuWNlJTQDoSB/B3ODqpg8kylZK1Wiu9b0NCZkT/b+oMctGhr5xX6KGTiLUVdEewyIV76tPRTX/e8rdOVcrgsZyZnWGnp2CnEBcc1Zv9CNNXnZShmrOn+romKoox+7SnbAUPcdS2UdMwnIGepuWYTwNoPvV1mo4Quv0U6xGAVa+cQOhNWkjp+AM4+/V4gaC5h65f6X0YUMYsZPqZDCAY1q6n3SztaRPPJPsBfoAtiiXxigbtY=
Content-ID: <10DD08E042CED44583E8960A1104E276@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8414a8a1-34f7-4cef-8f20-08d714ca79f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:46:56.2004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3282
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxOTozOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMNCj4gQEAgLTEwOCw2
ICsxMDgsMTIgQEAgaWR0X2VudHJ5X3QgX19zZWN0aW9uKCIuYnNzLnBhZ2VfYWxpZ25lZCIpIF9f
YWxpZ25lZChQQUdFX1NJWkUpDQo+ICAgLyogUG9pbnRlciB0byB0aGUgSURUIG9mIGV2ZXJ5IENQ
VS4gKi8NCj4gICBpZHRfZW50cnlfdCAqaWR0X3RhYmxlc1tOUl9DUFVTXSBfX3JlYWRfbW9zdGx5
Ow0KPiAgIA0KPiArLyoNCj4gKyAqIFRoZSBUU1MgaXMgc21hbGxlciB0aGFuIGEgcGFnZSwgYnV0
IHdlIGdpdmUgaXQgYSBmdWxsIHBhZ2UgdG8gYXZvaWQNCj4gKyAqIGFkamFjZW50IHBlci1jcHUg
ZGF0YSBsZWFraW5nIHZpYSBNZWx0ZG93biB3aGVuIFhQVEkgaXMgaW4gdXNlLg0KPiArICovDQo+
ICtERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQoc3RydWN0IHRzc19zdHJ1Y3QsIGluaXRfdHNz
KTsNCg0KSSBhc3N1bWUgdGhlcmUncyBhIHJlYXNvbiB3aHkgeW91IGRpZG4ndCBpbnRyb2R1Y2Ug
YSB3cmFwcGVyDQp1bmlvbiB0byBwYWQgdGhpcyB0byBwYWdlIHNpemUgLSBJJ2QgbGlrZSB0byB1
bmRlcnN0YW5kIHRoaXMNCnJlYXNvbiAoc2VlIGFsc28gbXkgcmVwbHkgdG8gcGF0Y2ggMSkgYmVm
b3JlIGFja2luZyBib3RoDQpwYXRjaGVzLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
