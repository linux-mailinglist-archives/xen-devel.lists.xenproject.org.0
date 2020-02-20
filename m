Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3E165DE7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lIi-00088w-A8; Thu, 20 Feb 2020 12:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/BCT=4I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j4lIg-00088j-BX
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 12:51:30 +0000
X-Inumbo-ID: b63166ba-53df-11ea-bc8e-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.112]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63166ba-53df-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 12:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV6FJC92V3rMp/k2CcHxh6pxVkCLoTQs8GhfmcvEl3zHrf+Jru/C3dF2ZOIptSLUXN+f5SCbuas1gozNCQFAblz2hUD4aycS3dibdJFtIikuVOHDzD2q1EF8UiSkcUCKnq0oPaut8Bp8gea6Eix255HutbFDkDRzfT7NNRwhVEF0Ehi6KZSxEC6epT5GC2g3eQaf2Vhs57aa543p3k0aL7o7Ng8QGvK5h0ig+cW0th6e1DOSuKNPZFzjebNPBcESxdzBzIzYLbcGXJjnRD+IPl2EQtkTZdw8P2ZcVdyvXF+L83DdqoKGRXkc9L7HUDMdlnC7muo4MvDOBmy0UOPS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulaKp8yYnrvUrk28IG+JedSHY1XXGlmjMy6g3PTdIrY=;
 b=PHSzzyx1UjZL3Hi2ECVep+8y5vQV5st3WEcrZvi7i6Y8aLzMiMIfoALnUUJy6EzJxk0KnLLS5M80FoO3lEH9MO3yMAUEpE9TIzvWon9SmMJraWIG4qRnYC8l0tkXLjTni+HFSE2xi4ITW25gMXLFyzvbNKy8kF2ycbZ5jK933Aycejw5tjku4PfS8OybGuhaWC9bDdl9V17asNTtL8PcKgSXyVWYmWj3bZ+4j1cNL2a0Tmf2HjmOxktLlzyNH6eulh1lodcccajXnfhvy3GTeaUP78Cvr/l2qBY0k6fm631P39GmOX+3rSE2Udx+/5uTkR6UlfT3LIGR/nmzPNd4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulaKp8yYnrvUrk28IG+JedSHY1XXGlmjMy6g3PTdIrY=;
 b=NtFld7o6rvlxlGucfU3uBu9BeOBO2t6qXNDI7SwTchIjCH/cEuLI5zx9x2Svt461tbGwBwLSENa3uwJPfbwOgC/EkOHtkDnJrtABwjGP+mDfErYOCiEjP6Yw6Q2xIEKjy4x/8SekNwZHQKEtJMBuX83hPclsZvPuXr1AxPAYtL4=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3143.eurprd02.prod.outlook.com (10.175.233.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 20 Feb 2020 12:51:27 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 12:51:27 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM3PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:207:5::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Thu, 20 Feb 2020 12:51:26 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V3] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV5wWKuFf2vClElk6nKYx34YpPrKgkAnyAgAAIZIA=
Date: Thu, 20 Feb 2020 12:51:27 +0000
Message-ID: <5d50b53c-a52a-62ef-19b6-488c144b70ac@bitdefender.com>
References: <20200219091811.9689-1-aisaila@bitdefender.com>
 <d1c77b95-8607-fede-d4dc-ab99db74a014@citrix.com>
In-Reply-To: <d1c77b95-8607-fede-d4dc-ab99db74a014@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:207:5::28) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be72f6d6-ab85-4b66-36cf-08d7b6039988
x-ms-traffictypediagnostic: DB6PR02MB3143:|DB6PR02MB3143:
x-microsoft-antispam-prvs: <DB6PR02MB3143047EAB841089CA9D50F5AB130@DB6PR02MB3143.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(346002)(396003)(39850400004)(189003)(199004)(7416002)(71200400001)(36756003)(66946007)(956004)(52116002)(2616005)(66556008)(66476007)(64756008)(66446008)(6486002)(31686004)(53546011)(4326008)(81166006)(81156014)(478600001)(86362001)(110136005)(8676002)(26005)(54906003)(16576012)(316002)(5660300002)(2906002)(186003)(31696002)(8936002)(16526019);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3143;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 60FWd7FSOezVQtgfdt4158q1wtHWE+SYobAvSZCF/mmkKiRLwaexhJ03k4JdDH6hZW3DuP+gcNndf19hJrngftCaqBabcxYAFSGXRa/VCns4vq2jeGK62Z1AYiw9ri3Dns1QsI023eswK61wYtzMOW+xVGtxUU1nyVOQ2hmx1mn49lEfYyFiAEmqnyyN1PmDVqlQjFmwmkcge4vj8ouHx1BpLkMJ9ugcuXLUM0bNzJohe1OBkybwZhi0XkyVTTkBTXspYrXNEAc/alTARFcp5yo9TgoO3o1iywfHSz8hBeEcp/oQn+QXQdZ50crNnnzdNMUwCxEx270r44XOPQLJbL3AcXaB0Uioee6XwxCW9gv6/OFciLNR+sVgowSEPu6F4GrJL3nrJyQvyInmmthGMK2uSdlbu7uWi+bh8tpfFbS7EJZ1Ga+sIr+Ns6Vj1vAG
x-ms-exchange-antispam-messagedata: k5SFxV4UWm7a53Q/AN5muTAqCtmGDZeXNDxVBceqHTwclXYHGG4oPmSjX6w/PgclD2e9mYKPwWhfbeADO/7ml1WDkXIoJrZfpMYAH56fisiutHbd3HrrheoqmC2YdmKIl7Vekji/tvpR8yA7EPn47Q==
x-ms-exchange-transport-forked: True
Content-ID: <8267A1985FD4744383E10EC0FD7DD745@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be72f6d6-ab85-4b66-36cf-08d7b6039988
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 12:51:27.4761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TOgm2Eu942KS5DY1x2c6/cXLj9eUptZnfKH/u9yaFOLp7h4DF31txul0GAFAhUMmKdpX5UNE4KVUh3nyuv/f5T9okWuY9Hm4LDUJl946Uck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3143
Subject: Re: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIwLjAyLjIwMjAgMTQ6MjEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDIvMTkv
MjAgOToxOCBBTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+PiBBdCB0aGlzIG1v
bWVudCBhIGd1ZXN0IGNhbiBjYWxsIHZtZnVuYyB0byBjaGFuZ2UgdGhlIGFsdHAybSB2aWV3LiBU
aGlzDQo+PiBzaG91bGQgYmUgbGltaXRlZCBpbiBvcmRlciB0byBhdm9pZCBhbnkgdW53YW50ZWQg
dmlldyBzd2l0Y2guDQo+Pg0KPj4gVGhlIG5ldyB4Y19hbHRwMm1fc2V0X3Zpc2liaWxpdHkoKSBz
b2x2ZXMgdGhpcyBieSBtYWtpbmcgdmlld3MgaW52aXNpYmxlDQo+PiB0byB2bWZ1bmMuDQo+PiBU
aGlzIGlzIGRvbmUgYnkgaGF2aW5nIGEgc2VwYXJhdGUgYXJjaC5hbHRwMm1fd29ya2luZ19lcHRw
IHRoYXQgaXMNCj4+IHBvcHVsYXRlZCBhbmQgbWFkZSBpbnZhbGlkIGluIHRoZSBzYW1lIHBsYWNl
cyBhcyBhbHRwMm1fZXB0cC4gVGhpcyBpcw0KPj4gd3JpdHRlbiB0byBFUFRQX0xJU1RfQUREUi4N
Cj4+IFRoZSB2aWV3cyBhcmUgbWFkZSBpbi92aXNpYmxlIGJ5IG1hcmtpbmcgdGhlbSB3aXRoIElO
VkFMSURfTUZOIG9yDQo+PiBjb3B5aW5nIHRoZW0gYmFjayBmcm9tIGFsdHAybV9lcHRwLg0KPj4g
VG8gaGF2ZSBjb25zaXN0ZW5jeSB0aGUgdmlzaWJpbGl0eSBhbHNvIGFwcGxpZXMgdG8NCj4+IHAy
bV9zd2l0Y2hfZG9tYWluX2FsdHAybV9ieV9pZCgpLg0KPiANCj4gDQo+IFNvIGl0IGxvb2tzIGxp
a2UgYnkgZGVmYXVsdCB0aGUgdmlld3MgYXJlIHZpc2libGUsIHVudGlsIHRoZXkncmUgbWFkZQ0K
PiBub24tdmlzaWJsZT8NCg0KWWVzLCBieSBkZWZhdWx0IGFsbCB0aGUgYWN0aXZlIHZpZXdzIGFy
ZSB2aXNpYmxlIHVudGlsIHRoZXkncmUgbWFkZSANCm5vbi12aXNpYmxlLg0KDQo+IA0KPiBBbHNv
LCBkb2VzIHRoZSBsYXN0IGxpbmUgbWVhbiB0aGF0IHRoZSB0b29sc3RhY2sgY2FuJ3QgY2hhbmdl
IHRvIGENCj4gIm5vbi12aXNpYmxlIiBhbHRwMm0gZWl0aGVyPw0KDQpUaGUgbGFzdCBsaW5lIG1l
YW5zIHRoYXQgeGNfYWx0cDJtX3N3aXRjaF90b192aWV3KCkgd2lsbCBub3QgYmUgYWJsZSB0byAN
CnN3aXRjaCB0byBhIG5vbi12aXNpYmxlIHZpZXcuDQoNCi1BbGV4DQoNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
