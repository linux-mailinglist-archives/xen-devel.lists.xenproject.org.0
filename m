Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132512B28D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 09:06:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkbi-0000mb-LQ; Fri, 27 Dec 2019 08:04:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkbh-0000mG-4L
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 08:04:25 +0000
X-Inumbo-ID: 7eaf5fb6-287f-11ea-9b94-12813bfff9fa
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eaf5fb6-287f-11ea-9b94-12813bfff9fa;
 Fri, 27 Dec 2019 08:04:24 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 08:03:22 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 08:02:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 08:02:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A66/PNgAsBoEYGUdfeNX/TJWN1bpDUM83jjtmgdXMXGrFK5qrCkPkfF6HfPQeSLtWLoIKOIx6RbpuvS7mibXKAKMu1EI8Pxz0JivoQ+VNS5oqwbdyqHkgLjN19JqWe+j6v7pSf50+c2oADNkakT9sDe1WuiN2DuZhibAQXMXzuQktECFkicgn8za7qEqfsf0nFDlo7OBle1/aLUVgqOH8oHJ0QMO/4xNLqZIWXXk4oTnshilb2/GldoAs9yKGx+b/BbrKbhgqXMi7/QcpjJ4kLluZRdMiks2XAfcm29X/QG6jaDWHseDDvFfidg4lnZkCqFRNXhTkhgkvLsQKvlJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5OsWrdlRHkxCCcd9k91qqwP8dVQNQYWIk6bJrxwHS4=;
 b=mvjAf9JeIKesfRclv3Qx6pv90pibW9FhoiwqZAuTZVjRWzIlGQStx1FaXEizaoOTZBXTcTygQkbG+ZkkzitzOtQ5WZO+x0x4tx3WowqQXiwCGxavGpz6C4gdRObN5ifhgsDK8CvkfHl/JSz9DvdJonzHioutox1NhSEghuyLeDLH66/GY4BLVJBL0ZT4DEu0xbeJLsiSj2KPE323RfHJ0TvI3sIkq0/ISVWGy93xPe5AvK/mleNPdyePz5REi6DQB0rRhXvlyhG9UJBH8JpFK5HW2F8mu4IYWJwDNcAF7lI2T6JSNbH6y4Srk3Ei2C0E+sQwEmkLBUgavnXtUJhcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB2624.namprd18.prod.outlook.com (20.179.83.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 08:02:27 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:02:27 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P123CA0033.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 08:02:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH 1/4] xen: Remove trailing whitespace from time.c
Thread-Index: AQHVubApoReZXgQDj0aHbqbmsi4Ai6fNpLoA
Date: Fri, 27 Dec 2019 08:02:27 +0000
Message-ID: <ac26fbb4-8f2c-a74a-ac67-a86535fd2bcc@suse.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
 <20191223164329.3113378-2-george.dunlap@citrix.com>
In-Reply-To: <20191223164329.3113378-2-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0033.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::21)
 To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e37e9e5-0df5-4174-3f6e-08d78aa31d38
x-ms-traffictypediagnostic: MN2PR18MB2624:
x-microsoft-antispam-prvs: <MN2PR18MB26246C649C4ED73875F6CFF0B32A0@MN2PR18MB2624.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(66946007)(186003)(16526019)(26005)(66446008)(64756008)(66476007)(478600001)(6916009)(8936002)(52116002)(4326008)(66556008)(31686004)(31696002)(2616005)(558084003)(956004)(86362001)(16576012)(316002)(5660300002)(2906002)(53546011)(54906003)(81166006)(71200400001)(6486002)(8676002)(36756003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2624;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zcHlj3Vp0S9TMl522SGE8AvhWB5kmtueRec9jDVERNdJvtmq1y0xWofEQYE+M68Ve2UcpBO1zrGSQ+P9kzmCdigVuI0DziJfnKJUW1sd++rH/pEnarU4sPjZSelo2kBi74Vii5reKJPX5BuZZsqFkxV+5+Bd8Zi1SdLjhXemxegqt3yJ+vby0ksHMcV8YrcPlpss3cYcvJVYxkcPUm1wVegDBnDi6DCM/wiNWs4WtzzOMVcgJV6vinzTFfwYbpHCOt9sYYDT5Yjk891m+QrQZULOXS5XyXMsnF4SCsKFBW52Q0QCC4c3cmgcLr5GAG3qFbf13JBkQNw8nOWI5EUnmFShodx2G07vr74jv9ozEMa3xATniliCv/0c7g5ttfGYiMvx2ks7tTAOSR6LEz0BodbZQZ8EiNdKykU3ExiLCjxqVXon/vNm2/E1JWtNlPdb
x-ms-exchange-transport-forked: True
Content-ID: <FB87520667E0F347986E7F41C5E1DCCA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e37e9e5-0df5-4174-3f6e-08d78aa31d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 08:02:27.3950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2OgmM5VS6fN9ZtlMfAozR1zY6rEJZYMK0m5VdCpJcyAfTEeU9kiVnQ1/FxsjBk0MDuh09LyE5iwP6o2frmQvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2624
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/4] xen: Remove trailing whitespace from
 time.c
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBtYWlsIGhhdmluZyBhcHBlYXJl
ZCBvbiB0aGUgbGlzdCkNCg0KT24gMjMuMTIuMjAxOSAxNzo0MywgR2VvcmdlIER1bmxhcCB3cm90
ZToNCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
