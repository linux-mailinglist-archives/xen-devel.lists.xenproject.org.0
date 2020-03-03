Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2E1772DB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 10:46:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j945H-000672-PQ; Tue, 03 Mar 2020 09:43:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wH0y=4U=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j945H-00066x-3f
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 09:43:27 +0000
X-Inumbo-ID: 6d98a532-5d33-11ea-a0cb-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.107]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d98a532-5d33-11ea-a0cb-12813bfff9fa;
 Tue, 03 Mar 2020 09:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieYDrks4c/VwutuZC8Zz+p7LJMcVPNnusfs+761yntDguWPUP7CJbdx5BCY1Owxg3b+6AN5szqdQlA/+n5AOgCjDU7kWW8H0tAm5eltNFXdpmF1Q3oXllGqRY1sUfeijbrdtKy+aGRnlMahFmqv65vD6QwDH5g1mzhyOMuA9TXs+Je5NvflGXHabF4uE4wIGy0HcYEMMamqPhTblj5AH+9cV46Vy2haryzxsCwBkRpFdnU1n5BFZlgBoot48skD93bq/YnZq1qXUt8PJJaYyD0VqKd6cAfWB2uzhqZ1T8BP7Cc0uaWJxfUd8Ukz9CGZlvLeWhEOlPojWAFZDwz3zyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zjl6cGXWaxlmoKt9/R0sIOpYLy0sssGep3kRKlgD/H0=;
 b=LhaslsjzfdyCJh44/h3KLQfLYQlcfxrzaA2XbeJpGEWD6nCcSIaBR/znVzse3oda1tz9nuNevuGDJAEdR9uORyNMFqL/SCANNxJ/zzWOYlSG+eXSKSylGvleqqL5T1lQdb2PWY+8XNU1So9ZDNu8mpjWh7xK82VuRQ/cYj5hLdYIzFAMCeJDzY1apVcWVoLzhZL//YrVZV9ZwnQR+9gwR6ptOjbAANZAfJ+PVsEzw00vbZFgX4+S1VI188xa61QESXFOvsIiMGZN5c4QL9lnjypK9k51FEurpRk8ZdMd/6vLLesYhoGuAn+4O304fjpQ/gN0LFH4XrSv4q52ym5Hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zjl6cGXWaxlmoKt9/R0sIOpYLy0sssGep3kRKlgD/H0=;
 b=n4zHukqleN1txa58Tymc76Gv+R2bMP9B8epAs9h+VSWYilWLYds4OEURTG6ZQtBqAQI9EK78GsG8jjPzMge/y+eNrcj+fRqsxdpR8UCEuoIYR0AzkK4C7kMvo4cTw4r4cqQkYI0uFIutzdWjtHWP5KQi4kle1YCrTYXf/XjAQ8U=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB2998.eurprd02.prod.outlook.com (10.175.234.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19; Tue, 3 Mar 2020 09:43:24 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e%4]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 09:43:24 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 ZR0P278CA0016.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Tue, 3 Mar 2020 09:43:22 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V5] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV7Kc8f1s5+kS3/0OKIQZfqMdQDqg2o5AAgAADe4A=
Date: Tue, 3 Mar 2020 09:43:23 +0000
Message-ID: <4d92a595-28d6-cf73-3d84-80ffcf970331@bitdefender.com>
References: <20200226131806.32444-1-aisaila@bitdefender.com>
 <e94a2335-cd08-339f-4fb0-9d1cb72b78d3@suse.com>
In-Reply-To: <e94a2335-cd08-339f-4fb0-9d1cb72b78d3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::26) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee206ed9-ee11-4edc-b4e1-08d7bf5750e0
x-ms-traffictypediagnostic: DB6PR02MB2998:|DB6PR02MB2998:
x-microsoft-antispam-prvs: <DB6PR02MB299895F716C0CC5DFAA21670ABE40@DB6PR02MB2998.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(16576012)(8676002)(81156014)(81166006)(53546011)(52116002)(66946007)(64756008)(66476007)(4326008)(54906003)(956004)(66446008)(66556008)(2616005)(16526019)(186003)(26005)(7416002)(6486002)(86362001)(31696002)(71200400001)(6916009)(31686004)(2906002)(5660300002)(36756003)(478600001)(316002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB2998;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: enHtXuQr1IXHyM0ANito39ppFGgu7EmaAQN6vnQzFZPJmVLm9amNf7dvCSgL8mRMGzWzfqt/GamBTvItgTH+GpVbStOSy6mj7Od2joITGoTAxriQJPaIhcLto0eRrrV4zL10SrdeV4qMl2icjN0GrjOsFPbzsMY8LTRRbVaZrUBiY07PIZT7WnNIE58kvCbmncL2Fmc/Crzcfd2kj0lLzq416geqrcPq1XTYRa1UFJK6zcq6wWp1EggPYWclXDgA/1XucVZcm/7NQQNYkOCBVIDvve3tGEIZhzq1NtvglmieSNOoCtKu32GthwzLldDTiBmA90HrIC71eExafe7tV9086bZ+/DmnoWkuTIJCu55P9PhKIP6NZBLhLM1rR/Aaraxmx2mOuERRcaR7t0qLDFVlF/sV5DFiatc1gaGVkrlVvox5Q3slEm83UsPg2pwy
x-ms-exchange-antispam-messagedata: RuaF16s4USratIAcppThkkNcOLn2dTdcjFcrlg1xZIdM79Ti/jHtxQ5d6yVB10x5ForLiEi+Is4iyc+GXgg182iHm5JtZ9E2EZasvcyURiv/VnHau6JWUIWJ53J3OT486YIJD7pQlnYBrBrE/EQFJA==
x-ms-exchange-transport-forked: True
Content-ID: <85A86A4CB21ED443B8C314B4515A195B@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee206ed9-ee11-4edc-b4e1-08d7bf5750e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 09:43:23.8686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5toj0a8byn2oF4Y/GSTjJhlmwQIupRKtCAqREYJlyAw91PkS4bAV8UWZlXkNxmnNpSuo0EtoK52QE1Z61dKcZfSjRZDaV0lNT7OA+qvzdzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB2998
Subject: Re: [Xen-devel] [PATCH V5] x86/altp2m: Hypercall to set altp2m view
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

DQoNCk9uIDAzLjAzLjIwMjAgMTE6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wMi4y
MDIwIDE0OjE4LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC00ODQwLDYg
KzQ4NDEsMTkgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+PiAgICAgICAgICAgYnJlYWs7
DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJp
bGl0eToNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdWludDE2X3QgaWR4ID0gYS51LnNldF92aXNp
YmlsaXR5LmFsdHAybV9pZHg7DQo+IA0KPiBXaHkgYSBmaXhlZCB3aWR0aCB0eXBlIChhbmQgZXZl
biBvbmUgaW5lZmZpY2llbnQgdG8gZGVhbCB3aXRoKT8NCj4gKE9uZSBtaWdodCBldmVuIGFzayAt
IHdoeSBhIGxvY2FsIHZhcmlhYmxlIGluIHRoZSBmaXJzdCBwbGFjZSwNCj4gd2hlbiBpdCdzIHVz
ZWQgLi4uDQo+IA0KPj4gKyAgICAgICAgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkICkNCj4+
ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7DQo+PiArICAgICAgICBlbHNlIGlmICggIWFsdHAy
bV9hY3RpdmUoZCkgKQ0KPj4gKyAgICAgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7DQo+PiArICAg
ICAgICBlbHNlDQo+PiArICAgICAgICAgICAgcmMgPSBwMm1fc2V0X2FsdHAybV92aWV3X3Zpc2li
aWxpdHkoZCwgaWR4LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGEudS5zZXRfdmlzaWJpbGl0eS52aXNpYmxlKTsNCj4gDQo+IC4uLiBqdXN0IG9u
Y2UgaGVyZS4pIFRoZSBmdW5jdGlvbiB0YWtlcyAidW5zaWduZWQgaW50IiBpbiBhbnkNCj4gZXZl
bnQuDQoNClN1cmUsIEkgY2FuIGhhdmUgdGhpcyBpZHggZHJvcHBlZCBhbmQgdXNlIHRoZSB2YWx1
ZSBpbiB0aGUgc3RydWN0dXJlLg0KSSBoYWQgdGhhdCBpbiBwbGFjZSB0byBoYXZlIGxpbmUgc2l6
ZSBzbWFsbGVyIGFuZCB0aGUgY29kZSBlYXN5IHRvIHJlYWQuDQoNCj4gDQo+PiBAQCAtMzE0NSw2
ICszMTQ4LDM1IEBAIGludCBwMm1fZ2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4gKmQsIGdm
bl90IGdmbiwgYm9vbCAqc3VwcHJlc3NfdmUsDQo+PiAgIA0KPj4gICAgICAgcmV0dXJuIHJjOw0K
Pj4gICB9DQo+PiArDQo+PiAraW50IHAybV9zZXRfYWx0cDJtX3ZpZXdfdmlzaWJpbGl0eShzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgdmlzaWJsZSkNCj4+ICt7DQo+PiArICAgIGFs
dHAybV9saXN0X2xvY2soZCk7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIEVwdHAgaW5k
ZXggaXMgY29ycmVsYXRlZCB3aXRoIGFsdHAybSBpbmRleCBhbmQgc2hvdWxkIG5vdCBleGNlZWQN
Cj4+ICsgICAgICogbWluKE1BWF9BTFRQMk0sIE1BWF9FUFRQKS4NCj4+ICsgICAgICovDQo+PiAr
ICAgIGlmICggYWx0cDJtX2lkeCA+PSBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0p
LCBNQVhfRVBUUCkgfHwNCj4+ICsgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2lu
ZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09DQo+PiArICAgICAgICAgbWZuX3go
SU5WQUxJRF9NRk4pICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgYWx0cDJtX2xpc3RfdW5sb2Nr
KGQpOw0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIGlmIHRoaXMgd2VudCB0aGUgbm9y
bWFsIGZ1bmN0aW9uIGV4aXQgcGF0aC4NCj4gV291bGQgYmUgcHJldHR5IHNpbXBsZSB0byBhcnJh
bmdlIGZvciBieSBpbnRyb2R1Y2luZyBhIGxvY2FsIHZhcmlhYmxlDQo+IGhvbGRpbmcgdGhlIGZ1
bmN0aW9uIHJldHVybiB2YWx1ZS4NCj4gDQoNCkkgaGFkIHRoZSByZXR1cm4gaGVyZSBzbyBhcyBu
b3QgdG8gaGF2ZSBib3VuZGFyeSBpc3N1ZXMgaWYgdGhlIA0KYWx0cDJtX2lkeCBpcyB3cm9uZyAg
YW5kIHRoZW4gSSBoYXZlIHRvIG1hbmlwdWxhdGUgIGFsdHAybV9lcHRwW10uDQoNCg0KQnV0IHN1
cmUsIGl0IGNhbiBoYXZlIGEgbG9jYWwgcmMgdmFyIHRoYXQgaXMgcmV0dXJuZWQgYXQgdGhlIGVu
ZCBvZiB0aGUgDQpmdW5jdGlvbiBhbmQgZHJvcCB0aGlzIHVubG9jayBqdXN0IHRvIHVzZSBhIHNp
bmdsZSBvbmUgYmVmb3JlIHRoZSByZXR1cm4uDQoNCkFsZXgNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
