Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA0C0665
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:36:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqN7-0006vA-RQ; Fri, 27 Sep 2019 13:33:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDqN6-0006v5-Jl
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:33:20 +0000
X-Inumbo-ID: 5e07c1ae-e12b-11e9-97fb-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::600]) by localhost (Halon) with ESMTPS
 id 5e07c1ae-e12b-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 13:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESv8KCdFH/6JE3lJzVN6rFL3sUIcABY0gT+xw+4B+eRBHtv1bkOh0DsGcQWZ0z+sBKTeBVGKjuD6qG/E78hPMeSqxKAMv5xlCHZLCBycR7OlMR+XuCjuULWnPquEMwXT1w7ulZXUkm2KSahOe4i6dcNICsnhHHR8/D8FzTFvgbY07jEIhHj193iLobckIswUejJmPgAqDngccGElfuei5i4zyJsI7XwNumOJ/CtIx6U6xM3vpdvUNRb3efN79O0ya/mzdamkwcDyyjqndvgeEuyuq6yVQWiCPbASO0dPzh2ASZ6Wdp0EgoHfvi/JpjxaUGs0oAuxWVsICNSMQqvnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7C4+hwQPNzns8skO7ZobePchjejIZq5DoH+JcNXKHs=;
 b=drh03GP8CxcL425qocBynQFFUOHGe95QZ73e+sfcn3IUZJCnElQuawpAuVdRsPckntQKZPQnLivSaxElty7di11v8LYZJxyQe9Ns8zCkaSaga5f+eSDYIcrJImwSnzw4JqymEPUx80jLekONgMZhpT1UzYBu8I1H0YWXf472428QRCjZcjfqBURg9y2bLuE4CAlozL++S8Vp6swhZBaY/a4rM5vAXDO2vOSpr2mo0vCta1mF5dDzrJhDI2gK+2vEm5Ep5q7WKMwFN6jsws6QeWQRytw99rM0b/Q0yyCIIDuItB7Yr1gvR8nZ1nQSt7z8fv2+8ulHU2ergP6ktMUvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7C4+hwQPNzns8skO7ZobePchjejIZq5DoH+JcNXKHs=;
 b=uztbeVKxrhcd5e0jn14TaDKsknxmY3scBWI6EHfaoV39qoqRZtAUmCbAyTe/cDgCEkS5AAKhvj//GY+Zijo7Ptz2SU9a77Tzzi8XnvUnv+WHp43hWrQ01Q/JDYb1i05JqQJoOCr/KkmChzjKcJezvqwz8XTgTTYipUG5gyzvODI=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4435.eurprd03.prod.outlook.com (20.176.214.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Fri, 27 Sep 2019 13:33:18 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 13:33:17 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmSz7FwOb+ZL0aIExPYLyfVU6c/a/SAgAAHRoCAAATGAIAACkYAgAAExIA=
Date: Fri, 27 Sep 2019 13:33:17 +0000
Message-ID: <87muep984i.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
 <df6b891c-2670-47d9-ae0d-223161edc225@arm.com>
In-Reply-To: <df6b891c-2670-47d9-ae0d-223161edc225@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfd7b238-a3dd-411d-e6a6-08d7434f419c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4435; 
x-ms-traffictypediagnostic: AM0PR03MB4435:|AM0PR03MB4435:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4435AFF6F5D4AF4239708578E6810@AM0PR03MB4435.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(189003)(199004)(51444003)(11346002)(478600001)(54906003)(66066001)(6916009)(2906002)(4326008)(6246003)(256004)(36756003)(102836004)(3846002)(14444005)(53546011)(6506007)(6116002)(55236004)(107886003)(229853002)(76116006)(91956017)(316002)(186003)(26005)(305945005)(6486002)(76176011)(7736002)(81156014)(81166006)(6436002)(86362001)(14454004)(66476007)(66946007)(25786009)(66446008)(8936002)(64756008)(71200400001)(66556008)(71190400001)(476003)(8676002)(486006)(6512007)(80792005)(2616005)(99286004)(5660300002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4435;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2ou33c0mNOWMLEkjJtDpgIBkQ9tHx7Lf0JnjrkB3kX7LoiG8UJvKJ//E937cQFNB2cNxLRvKm5qrziKlWohuHUsW1xVGjPj20L6LhFRVpebLbqT3RJX1fVhcmcdLrlCOb9PvNXhqm4Apxost3xN5p5rDrUhuoggFN0CHOkjBAYguW7/ButsRUMuoBxD6Hh9+d3bagWupMC7GJ/M3P44Rzcj9E97cuxrCvJCRJMHCn9cbJ3IizPd9QFHStDMLTMoeIAQET1L3b1IvdV+dHXNq1l6+ippnE+kmRgEAMX7tNAPGRlXJGc0HtggffQZKfkWmRBWUhq5jy07Wk0PtPqZjOVNT53KM9yT3355whoWpweLYRVuFCtWETVhdP/CI6Fw+MuEjADXA2OC7sGM2+NvGNdWJ1j4jfY9QP3qMogDjxi8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd7b238-a3dd-411d-e6a6-08d7434f419c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 13:33:17.7953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IzFojta25k4rwdcXyiNPjRLH9ess8YaRhzI011vunEy5WtrqBtiH/uQX+X8ilmKrhUi5kKy+NYG6QSzYMsiLPHQ+1JR3wwOzTnFhTfDgac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4435
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLAoKSnVsaWVuIEdyYWxsIHdyaXRlczoKCj4gSGksCj4KPiBPbiAyNy8wOS8yMDE5IDEzOjM5
LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+IE9u
IDI3LzA5LzIwMTkgMTI6NTYsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4+IEp1bGllbiBH
cmFsbCB3cml0ZXM6Cj4+Pj4KPj4+Pj4gQXQgdGhlIG1vbWVudCwgU1NCRCB3b3JrYXJvdW5kIGlz
IHJlLWVuYWJsZWQgZm9yIFhlbiBhZnRlciBpbnRlcnJ1cHRzCj4+Pj4+IGFyZSB1bm1hc2tlZC4g
VGhpcyBtZWFucyB3ZSBtYXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29tZSBwYXJ0IG9mIHRoZQo+Pj4+
PiBoeXBlcnZpc29yIGlmIGFuIGludGVycnVwdCBpcyByZWNlaXZlZCBiZWZvcmUgdGhlIHdvcmth
cm91bmQgaXMKPj4+Pj4gcmUtZW5hYmxlZC4KPj4+Pj4KPj4+Pj4gQXMgdGhlIHJlc3Qgb2YgZW50
ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkgZG9lcyBub3QgcmVxdWlyZSB0byBoYXZlCj4+Pj4+
IGludGVycnVwdHMgbWFza2VkLCB0aGUgZnVuY3Rpb24gaXMgbm93IHNwbGl0IGluIHR3byBwYXJ0
czoKPj4+Pj4gICAgICAgMSkgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKCkgY2Fs
bGVkIHdpdGggaW50ZXJydXB0cwo+Pj4+PiAgICAgICAgICBtYXNrZWQuCj4+Pj4gSSdtIG9rYXkg
d2l0aCB0aGlzIGFwcHJvYWNoLCBidXQgSSBkb24ndCBsaWtlIG5hbWUgZm9yCj4+Pj4gZW50ZXJf
aHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKCkuIFJpZ2h0IG5vdyBpdCBpcyBkb2luZyBleGFj
dGx5IG9uZQo+Pj4+IHRoaW5nIC0gbWl0aWdhdGVzIFNTQkQuIFNvLCBtYXliZSBtb3JlIGFwcHJv
cHJpYXRlIG5hbWUgd2lsbCBiZQo+Pj4+IHNvbWV0aGluZyBsaWtlICJtaXRpZ2F0ZV9zc2JkKCki
ID8KPj4+Cj4+PiBJZiBJIHdhbnRlZCB0byBjYWxsIGl0IG1pdGlnYXRlX3NzYmQoKSBJIHdvdWxk
IGhhdmUgaW1wbGVtZW50ZWQKPj4+IGNvbXBsZXRlbHkgZGlmZmVyZW50bHkuIFRoZSByZWFzb24g
aXQgaXMgbGlrZSB0aGF0IGlzIGJlY2F1c2Ugd2UgbWF5Cj4+PiBuZWVkIG1vcmUgY29kZSB0byBi
ZSBhZGRlZCBoZXJlIGluIHRoZSBmdXR1cmUgKEkgaGF2ZSBBbmRyaWkncyBzZXJpZXMKPj4+IGlu
IG1pbmQpLiBTbyBJIHdvdWxkIHJhdGhlciBhdm9pZCBhIGZ1cnRoZXIgcmVuYW1pbmcgbGF0ZXIg
b24gYW5kIHNvbWUKPj4+IHJld29yay4KPj4gRmFpciBlbm91Z2gKPj4KPj4+Cj4+PiBSZWdhcmRp
bmcgdGhlIG5hbWUsIHRoaXMgaXMgYSBzcGxpdCBvZgo+Pj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9t
X2d1ZXN0KCkuIEhlbmNlLCB3aHkgdGhlIGZpcnN0IHBhdGggaXMgdGhlCj4+PiBzYW1lLiBUaGUg
bm9pcnEgbWVyZWx5IGhlbHAgdGhlIHVzZXIgdG8ga25vdyB3aGF0IHRvIGV4cGVjdC4gVGhpcyBp
cwo+Pj4gYmV0dGVyIG9mIHlldCBhbiBfXyB2ZXJzaW9uLiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBh
IGJldHRlciBzdWZmaXguCj4+IEknbSBiYWQgYXQgbmFtaW5nIHRoaW5ncyA6KQo+Cj4gTWUgdG9v
IDspLgo+Cj4+Cj4+IEkgdW5kZXJzdGFuZCB0aGF0IGlzIHR3byBoYWx2ZXMgb2Ygb25lIGZ1bmN0
aW9uLiBCdXQgZnVuY19uYW1lX25vaXJxKCkKPj4gcGF0dGVybiBpcyB3aWRlbHkgdXNlZCBmb3Ig
b3RoZXIgY2FzZTogd2hlbiB3ZSBoYXZlIGZ1bmNfbmFtZV9ub2lycSgpCj4+IGZ1bmN0aW9uIGFu
ZCBzb21lIGZ1bmNfbmFtZSgpIHRoYXQgZGlzYWJsZXMgaW50ZXJydXB0cyBsaWtlIHRoaXM6Cj4+
Cj4+IHZvaWQgZnVuY19uYW1lKCkKPj4gewo+PiAgICAgICAgICBkaXNhYmxlX2lycXMoKTsKPj4g
ICAgICAgICAgZnVuY19uYW1lX25vaXJxKCk7Cj4+ICAgICAgICAgIGVuYWJsZV9pcnFzKCk7Cj4+
IH0KPj4KPj4gSSBsaWtlIHByaW5jaXBsZSBvZiBsZWFzdCBzdXJwcmlzZSwgc28gaXQgaXMgYmV0
dGVyIHRvIHVzZSBzb21lIG90aGVyCj4+IG5hbWluZyBwYXR0ZXJuIHRoZXJlLgo+Cj4gSSBjYW4n
dCBmaW5kIGFueSBmdW5jdGlvbiBzdWZmaXhlZCB3aXRoIF9ub2lycSBpbiBYZW4uIFNvIEkgZG9u
J3QKPiB0aGluayB0aGlzIHdvdWxkIGJlIGEgbWFqb3IgaXNzdWUgaGVyZS4KWWVzLCB0aGVyZSBh
cmUgbm8gc3VjaCBmdW5jdGlvbnMgaW4gWGVuLiBCdXQgaXQgbWF5IGNvbmZ1c2UgZGV2ZWxvcGVy
cwp3aG8gY29tZSBmcm9tIGFub3RoZXIgcHJvamVjdHMuCgo+Pgo+PiBtYXliZSBzb21ldGhpbmcg
bGlrZSBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3RfcHQxKCkgYW5kCj4+IGVudGVyX2h5cGVy
dmlzb3JfZnJvbV9ndWVzdF9wdDIoKT8KPiBIbW1tLCBpdCByZW1pbmRzIG1lIHVuaSB3aGVuIHdl
IGhhZCB0byBsaW1pdCBmdW5jdGlvbiBzaXplIHRvIDIwIGxpbmVzIDopLgo+Cj4gSSBjaG9zZSBf
bm9pcnEgYmVjYXVzZSB0aGUgb3RoZXIgbmFtZSBJIGhhZCBpbiBtaW5kIHdhcyBxdWl0ZQo+IHZl
cmJvc2UuIEkgd2FzIHRoaW5raW5nOgo+IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9iZWZv
cmVfaW50ZXJydXB0cygpLgpBIHdhcyB0aGlua2luZyBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGlz
IHRvby4KV2hhdCBhYm91dCBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3RfcHJlaXJxKCk/CgpJ
IHRoaW5rIHRoYXQgIl9wcmUiIGJldHRlciBzaG93cyB0aGUgcmVsYXRpb24gdG8KZW50ZXJfaHlw
ZXJ2aXNvcl9mcm9tX2d1ZXN0KCkKCj4KPj4KPj4gT3IgbWF5YmUsIHdlIHNob3VsZCBub3Qgc3Bs
aXQgdGhlIGZ1bmN0aW9uIGF0IGFsbD8gSW5zdGVhZCwgd2UgZW5hYmxlCj4+IGludGVycnVwdHMg
cmlnaHQgaW4gdGhlIG1pZGRsZSBvZiBpdC4KPgo+IEkgdGhvdWdodCBhYm91dCB0aGlzIGJ1dCBJ
IGRpZG4ndCBtdWNoIGxpa2UgdGhlIHJlc3VsdGluZyBjb2RlLgo+Cj4gVGhlIGluc3RydWN0aW9u
IHRvIHVubWFzayBpbnRlcnJ1cHRzIHJlcXVpcmVzIHRvIHRha2UgYW4gaW1tZWRpYXRlCj4gKGlu
ZGljYXRlcyB3aGljaCBpbnRlcnJ1cHRzIHRvIHVubWFzaykuIEFzIG5vdCBhbGwgdGhlIHRyYXBz
IHJlcXVpcmUKPiB0byB1bm1hc2sgdGhlIHNhbWUgaW50ZXJydXB0cywgd2Ugd291bGQgZW5kIHVw
IHRvIGhhdmUgdG8gYSBidW5jaCBvZgo+IGlmIGluIHRoZSBjb2RlIHRvIHNlbGVjdCB0aGUgcmln
aHQgdW5tYXNraW5nLgpBaCwgeWVzLCB0aGlzIGlzIHRoZSBwcm9ibGVtLiBXZSBjYW4gcHJvdmlk
ZSBjYWxsYmFjayB0bwplbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QoKS4KCk9yIHN3aXRjaCgp
IGluc3RlYWQgb2YgbXVsdGlwbGUgaWZzLiBNYXliZSBpbiBzb21lIGhlbHBlciBmdW5jdGlvbi4K
Ci0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
