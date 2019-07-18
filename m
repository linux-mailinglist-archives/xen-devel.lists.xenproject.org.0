Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C46CEB1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:16:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6F7-0007jK-Ao; Thu, 18 Jul 2019 13:14:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho6F5-0007iW-Q9
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:14:39 +0000
X-Inumbo-ID: fdd83db0-a95d-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fdd83db0-a95d-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:14:38 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 13:14:34 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 13:14:35 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 13:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFfGPmwwT5x94/GLOiOBzV9C11dK0Za3/W6v6hUbInpKYEIVOl6cR1S8m9a8VasXo8DOjX3RUWX+SFBPQ7vXsM4FXpSUJaAm65EzFeUmxoV7tJdvLPn8ZA3dBoSLqfDsJ5XvbxxaEBHaDJfeZBxVTCLzymZSow2d8L+22XAIXBlwZD1dcDdWIkh/4y6ugL/u2xzHnbMFyzoOEDpNDZfICDtwwBv3YXGUWqdGSJaix+jTC7zuUwNfVibf8O2NLN7NGFGypa7PVGTWLDY7E8ot246Gj3AgVbWcpIl4+oeZotolt/cA2vp8HAdGZHRc1S2pHYsWcMZ9+gYrI01Vy//0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeK+bkWX/ByzEgAvFSf/gZsOW/QBySL3ol4smJqPins=;
 b=SxGCALfEalCyz3ibPD6hubPDmRZ1RJBxKpkUsInytg7oa/AAdCX3Su5uoRTmvSfxP/Nx9UdVPLaWJG8DBmuZskU/Is04zHritgFYTMIE94PtuI6joGBbFR0XnRWdRVUpvvbZu9EFin+csPPhpWxeRLo7SRXQunMfaaHjJFjwqD056Y2Dlsgp2MejC19qpaR/hWbGzBTRsHTiN9mYi3Fo5lDVgVjs3NO4w0mkuRbPefYj+QwZlL0chkKBRIldz8unVfb84Lcr6CYFNKKc456x0YL2JUxttcoENn4REc2zetMFKb9B86g8AjZfj0rMr3LxjZmIiHuVdsawHbCe8Z8VTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2538.namprd18.prod.outlook.com (20.179.105.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 13:14:35 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:14:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
Thread-Index: AQHVPNaxkDvYm35RQ027yAvXjVGEzqbQNNsAgAAjJviAAAPJgA==
Date: Thu, 18 Jul 2019 13:14:34 +0000
Message-ID: <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
 <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
In-Reply-To: <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0201CA0040.eurprd02.prod.outlook.com
 (2603:10a6:4:3f::50) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87660ddb-2b8f-46a5-14cb-08d70b81e0ce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2538; 
x-ms-traffictypediagnostic: DM6PR18MB2538:
x-microsoft-antispam-prvs: <DM6PR18MB25384FD4F4D640C63B4F1B54B3C80@DM6PR18MB2538.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(189003)(199004)(66446008)(66476007)(66556008)(64756008)(80792005)(81166006)(81156014)(8936002)(31696002)(26005)(446003)(186003)(476003)(2906002)(2616005)(86362001)(66066001)(11346002)(305945005)(66946007)(71190400001)(6486002)(71200400001)(478600001)(99286004)(8676002)(316002)(7736002)(5660300002)(68736007)(6246003)(6116002)(3846002)(6512007)(14444005)(6436002)(486006)(25786009)(53936002)(229853002)(256004)(102836004)(76176011)(14454004)(6916009)(36756003)(52116002)(53546011)(6506007)(386003)(4326008)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2538;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: arysEsZiQmosopfr+PPjOcATqx7iLaHpj61hG0oQ8iUQ2mlujxgpRLPejM7Sn5cXU6TdEEkcXBvoXqrUdvUGCV8YvrUBAJGZRmhFzDyIXTEidenOuiiMLvwccbY4UBu429orQ/czUDfoiOFjkhcGtpLydoR/vG/EzuHVIW/c7OOYGPZH037ZDeqe3TAUKkli7LzUo+1YAcehh0ujCeVo6Gzbp5NgESIVZG71W1IsbPC9iBOtr8zKR6E0NXjxtRDTwg/O/JYztPbBezklsa+tl34J0DVlu8hUuLYq8IxyhJL66Rxu1WjpnFYZpawKW6JBNhZS4Xo/OeoYBKmQzCQsmW5QceLopG5zc3rS1o+xbWtb+oMFUFwea6LhLQIrnGZQ9P2aSZbWX4H0fm5HuxeCOvI8Y3EtrPdVONgCf1hWp1s=
Content-ID: <597B254D0C06654E9C30DFDC597ECB5F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87660ddb-2b8f-46a5-14cb-08d70b81e0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:14:34.8532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2538
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNDo1OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCA0OjU2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMTcuMDcuMjAxOSAyMTozMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0K
Pj4+IEBAIC0xMzYsOCArMTM3LDggQEAgc3RhdGljIGlubGluZSBib29sIF9wYWdlX2xvY2soc3Ry
dWN0IHBhZ2VfaW5mbyAqcGFnZSkNCj4+PiAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsNCj4+
PiAgICAgICAgICAgIG54ID0geCArICgxIHwgUEdUX2xvY2tlZCk7DQo+Pj4gICAgICAgICAgICBp
ZiAoICEoeCAmIFBHVF92YWxpZGF0ZWQpIHx8DQo+Pj4gLSAgICAgICAgICAgICAhKHggJiBQR1Rf
Y291bnRfbWFzaykgfHwNCj4+PiAtICAgICAgICAgICAgICEobnggJiBQR1RfY291bnRfbWFzaykg
KQ0KPj4+ICsgICAgICAgICAgICAgICAgISh4ICYgUEdUX2NvdW50X21hc2spIHx8DQo+Pj4gKyAg
ICAgICAgICAgICAgICAhKG54ICYgUEdUX2NvdW50X21hc2spICkNCj4+PiAgICAgICAgICAgICAg
ICByZXR1cm4gZmFsc2U7DQo+Pj4gICAgICAgIH0gd2hpbGUgKCBjbXB4Y2hnKCZwYWdlLT51Lmlu
dXNlLnR5cGVfaW5mbywgeCwgbngpICE9IHggKTsNCj4+DQo+PiBBcmVuJ3QgeW91IHNjcmV3aW5n
IHVwIGluZGVudGF0aW9uIGhlcmU/IEl0IGxvb2tzIHdyb25nIGJvdGggaW4gbXkNCj4+IG1haWwg
Y2xpZW50J3MgdmlldyBhbmQgb24gdGhlIGxpc3QgYXJjaGl2ZXMsIHdoZXJlYXMuIEZ1cnRoZXJt
b3JlDQo+PiB0aGlzIGlzIGNvZGUgeW91J3ZlIGludHJvZHVjZWQgZWFybGllciBpbiB0aGUgc2Vy
aWVzLCBzbyBpdCBzaG91bGQNCj4+IGJlIGdvdCByaWdodCB0aGVyZSwgbm90IGhlcmUuDQo+IA0K
PiBUaGUgc3R5bGUgd2FzIGF1dG8tYXBwbGllZCB3aXRoIGFzdHlsZSB1c2luZyB0aGUgYnNkIGZv
cm1hdC4gSW4gdGhlDQo+IHByZXZpb3VzIHBhdGNoIHRoZXJlIHdlcmUgbm8gc3R5bGUtY2hhbmdl
cyBhcHBsaWVkIGJlY2F1c2UgaXQgd2FzIGENCj4gY29weS1wYXN0ZSBqb2IgZnJvbSB0aGUgb3Ro
ZXIgY29kZSBsb2NhdGlvbi4gSSByYXRoZXIga2VlcA0KPiBjb2RlLWNvcHlpbmcgYW5kIHN0eWxl
IGZpeGVzIHNlcGFyYXRlLg0KDQpCdXQgeW91J3JlIGFjdGl2ZWx5IGJyZWFraW5nIFhlbiBzdHls
ZSBoZXJlIChhbmQgYmVsb3cpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
