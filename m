Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B416FAD9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 10:37:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6t5D-0006eV-0Z; Wed, 26 Feb 2020 09:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xAue=4O=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j6t5C-0006eQ-3u
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 09:34:22 +0000
X-Inumbo-ID: 297e03e1-587b-11ea-93e4-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.129]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 297e03e1-587b-11ea-93e4-12813bfff9fa;
 Wed, 26 Feb 2020 09:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB7FH4k/C0eWKae1cgHNEbEsRNzImfiI1aB52x0RZFS42rBKPH2BI2Ev9YZpkF/yDXrQxtRABlkHsE7GKE7Qz6mbQY8QAvoKZjOaLnG2mOHDp5HfYmJbX2Dws8j8rVFMyF3+F9h9PumcxV6Pa6N9m+o5ZNJAMCsksex0R97beL67qLjPyin0XlVaSb/aKrIzqC/BvxB89G53Tds13Z+O3y0LVxiOA4boJ5BWkT02hLo7Q4twvYYId8nfVr08unlw9JUMTMlg2OhkdE5mE5JnDZZoK8A7YEUhCHasb+Sl56daXzhMO2lwV0SHRhFM9myH4j6mA6pETW5SAwu1WVk4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOqx6Y/baL9nMb2fYPMrhU1QIbVOFRxzPL//BKBIo+0=;
 b=IjEhWST/7xEB2+ekQalcTOdxqD1dAyDgesdCDPloYaKhUuyttQmIVBApgxFyRg5uVKir9YXLrsFiw61/IasCjyRYL/MhsXwjo0Tl8EpAuP9SqHmM89NiRz493XdYQACKQpRtpRa4FQQLYqAka0RxneDMQa/qWAKeMyEc+LQ+KLyNUGhKnF7G+MezDkiw/sUHa2g7Fj+rvK2bMnSVdNyTb5iLuinbFEBCQsCae2nf28kocKjEGN1ZspfjMT8N6sUjlmyr03TsS+RKiAo2HnuOVMde2/LxLOgggW4e4X9rZlFY+nJ7AnkmwQ3wJx5bvRdHCFXpe1Sf1vqVa6KKYhg0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOqx6Y/baL9nMb2fYPMrhU1QIbVOFRxzPL//BKBIo+0=;
 b=Z+DeJ77MsUtXvq/kbOITbTyb5CIVeSsl3Lo0Ktd13OE7Sm7DieU6O4iuKCzwo2vP+Tpw1aFWDVVZc164s++H8VhfWteIhq6sBa0wZqPYDiKr/zQvwGo1d+BByYgx+kB3u8rFJjrkfTzCEiK9iCPa+eRcCYm/hNo9+0Hw06mDePU=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3095.eurprd02.prod.outlook.com (10.170.221.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Wed, 26 Feb 2020 09:34:17 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e%4]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 09:34:17 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:208:aa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 09:34:16 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V4] x86/altp2m: Hypercall to set altp2m view
 visibility
Thread-Index: AQHV6JEygsFwXfT/ykedOiNCZrGg7Kgl2b8AgARZ/4CAAwrxgA==
Date: Wed, 26 Feb 2020 09:34:17 +0000
Message-ID: <e8145049-9814-d830-dbba-f5ec08276022@bitdefender.com>
References: <20200221083014.29274-1-aisaila@bitdefender.com>
 <db92db09-3f73-aa91-cac7-a1652782da95@suse.com>
 <0b88a34f-caa4-54c3-cbed-637660ad8b09@bitdefender.com>
In-Reply-To: <0b88a34f-caa4-54c3-cbed-637660ad8b09@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0037.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::14) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3854ebbc-407f-4cc5-65c9-08d7ba9f0c9c
x-ms-traffictypediagnostic: DB6PR02MB3095:|DB6PR02MB3095:
x-microsoft-antispam-prvs: <DB6PR02MB3095D98A0BDD193A08683ED5ABEA0@DB6PR02MB3095.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39850400004)(396003)(366004)(136003)(376002)(189003)(199004)(16576012)(54906003)(7416002)(316002)(16526019)(31686004)(8936002)(8676002)(31696002)(2616005)(4326008)(53546011)(52116002)(81156014)(956004)(81166006)(6916009)(71200400001)(36756003)(2906002)(186003)(66946007)(6486002)(66446008)(64756008)(66556008)(66476007)(26005)(5660300002)(478600001)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3095;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RlINlC8kn+6q9lq54VUbaLb8JeWMXOjoMKGXqaRt1quh47iE8StimQpkJwgOQ5hLKYsFIdWVEfSufgXAGqx/RLcrorW/WdrZL5lUEiCeAMZapktSzjxx475TpKJGaHsmILkNAQ6kf8V6cMrHmvEBOp11ttD9f+WuB8z0XlSZjsXUZqsqRvKkr9CHBTDvM2+vTLziDKM2tF3UnN3qRN6Xe/iTpSJrXIoaPy0ENeYi0OBPD8rsTgc5GmxDjMB08Jlchuh+SZHlMgEFiMYXTLVrqQ/I0I8ZN8NyzIdsCgHkF5FquLTlwlf+fss8I1tJj/JqIfp22LLFobEN4G39fu3A+AkApeIIyg0OCIlxCTOPXdKNem8DVFJLhIWNxUGBwrvKnjzPj2Hmxvn15o5oFrhEOdO54185KrrZJSfUQxuL6SLMo1QHEXYhzWUg4VbTPOcw
x-ms-exchange-antispam-messagedata: aAsu0ebZ21oOFlFWHRPWr8ngplOqwp0+fOkEpcctzr142Yl/3xSl79AGz5bokUDRPRg5Ubl1VduxBG7W1c2p5uCHcZYgB1UCWaR9Ruz2OcCIUDPTu657uHMY6HJ+1iCpRIJ+CRwgVc9xu3ciXPLaKg==
x-ms-exchange-transport-forked: True
Content-ID: <913F2E2C15583148964F80B5B270799C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3854ebbc-407f-4cc5-65c9-08d7ba9f0c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 09:34:17.2186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IlhlXkNECkCN62QggBcrJxo1rCy8z+uetCte7rqFvwbfwg1HI51l6snkyN9cNZQ2Td4yYB20rALQnknjX60UGmqrSpkJHT8iCxij+c8N0qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3095
Subject: Re: [Xen-devel] [PATCH V4] x86/altp2m: Hypercall to set altp2m view
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI0LjAyLjIwMjAgMTE6MDYsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0K
PiANCj4gDQo+IE9uIDIxLjAyLjIwMjAgMTg6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MjEuMDIuMjAyMCAwOTozMCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4gQEAg
LTQ4MzUsNiArNDgzNiwyNiBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgNCj4+PiAgICAgICAg
ICAgIGJyZWFrOw0KPj4+ICAgICAgICB9DQo+Pj4gICAgDQo+Pj4gKyAgICBjYXNlIEhWTU9QX2Fs
dHAybV9zZXRfdmlzaWJpbGl0eToNCj4+PiArICAgIHsNCj4+PiArICAgICAgICB1aW50MTZfdCBp
ZHggPSBhLnUuc2V0X3Zpc2liaWxpdHkuYWx0cDJtX2lkeDsNCj4+PiArDQo+Pj4gKyAgICAgICAg
aWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkIHx8DQo+Pj4gKyAgICAgICAgICAgICBpZHggPj0g
bWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJtKSwgTUFYX0VQVFApIHx8DQo+Pg0KPj4g
V2h5IG1pbigpIGhlcmU/IFlvdSBvbmx5IGFjY2VzcyBNQVhfRVBUUC1kaW1lbnNpb25lZCBhcnJh
eXMgYWZhaWNzLiBJZg0KPj4gdGhpcyBpcyBpbnRlbnRpb25hbCwgSSB0aGluayBpdCBkZXNlcnZl
cyBhIGNvbW1lbnQuDQo+IA0KPiBJIGhhdmUgbWluKCkgaGVyZSBiZWNhdXNlIHRoZSBhbHRwMm0g
aW5kZXggc2hvdWxkIG5vdCBiZSBncmF0ZXIgdGhlbg0KPiBNQVhfQUxUUDJNLiBJIGtub3cgdGhp
cyBpcyB1c2VkIGFzIGFsdHAybV9lcHRwKCkgaW5kZXggYnV0IHRoZSB0d28gYXJlDQo+IGNvdXBs
ZWQuDQo+IA0KPj4NCj4+PiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlf
aW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9PQ0KPj4+ICsgICAgICAgICAgICAgbWZuX3go
SU5WQUxJRF9NRk4pICkNCj4+PiArICAgICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPj4+ICsgICAg
ICAgIGVsc2UgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApDQo+Pj4gKyAgICAgICAgICAgIHJjID0g
LUVPUE5PVFNVUFA7DQo+Pj4gKyAgICAgICAgZWxzZSBpZiAoIGEudS5zZXRfdmlzaWJpbGl0eS52
aXNpYmxlICkNCj4+PiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRwW2Fy
cmF5X2luZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQ0KPj4+ICsgICAgICAgICAgICAgICAg
ZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoaWR4LCBNQVhfRVBUUCldOw0K
Pj4+ICsgICAgICAgIGVsc2UNCj4+PiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2lu
Z19lcHRwW2FycmF5X2luZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQ0KPj4+ICsgICAgICAg
ICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pOw0KPj4+ICsgICAgICAgIGJyZWFrOw0KPj4NCj4+
IFlvdSBkb24ndCBzZWVtIHRvIGJlIGhvbGRpbmcgYW55IGxvY2tzLiBBdCB0aGUgdmVyeSBsZWFz
dCB0aGlzIG1lYW5zDQo+PiB0aGUgaW4tcmFuZ2UtaW5kZXgtaXMtdmFsaWQgY2hlY2sgZnVydGhl
ciB1cCB3aWxsIGhhdmUgYmVjb21lIHN0YWxlDQo+PiBieSB0aGUgdGltZSB5b3UgYWN0dWFsbHkg
Y29uc3VtZSB0aGUgc2xvdC4NCj4+DQo+IA0KPiBHb29kIHRoaW5nIHRvIHBvaW50IHRoaXMgb3V0
IGhlcmUuIEkgd2lsbCBhZGQgYWx0cDJtX2xpc3RfbG9jay91bmxvY2soZCkNCj4gdG8gZ3VhcmQg
dGhpcyBjaGVjayBhbmQgb3BlcmF0aW9uLg0KDQpJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIG1vdmUg
YWxsIHRoZSBhbHRwMm0gdGhpbmdzIGluIGEgbmV3IGZ1bmN0aW9uLCANCnNvbWV0aGluZyBsaWtl
IHAybV9zZXRfYWx0cDJtX3ZpZXdfdmlzaWJpbGl0eSgpLCBpbiBwMm0uYy4gVGhpcyB3YXkgDQp0
aGVyZSB3aWxsIGJlIG5vIGFkZGl0aW9uYWwgaW5jbHVkZSBuZWVkZWQuDQoNCkFsZXgNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
