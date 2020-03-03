Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819B17735A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 11:02:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j94Kf-0007AS-ET; Tue, 03 Mar 2020 09:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wH0y=4U=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j94Ke-0007AN-5B
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 09:59:20 +0000
X-Inumbo-ID: a5e00bcc-5d35-11ea-902a-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::718])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e00bcc-5d35-11ea-902a-bc764e2007e4;
 Tue, 03 Mar 2020 09:59:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIxHNpoOA0aRamNz2Z7Tt3mxkIOVg6M6Yol5AnfW0PoRlfvtxCeFXeItdPZUCRUh/wXhh5VNn9mwhWIvYQOVg0IX5XEjoD20bskpPH5cCdt7JVTtmICZhHhwkHLF8vbaXB1TSAqE7I/PNUORCsJES7xUp1pzP1xZkcfZ7bIONFHncf/pqZaoBocwsZxa4tUZYLk66uon9ecKhYnKqCZZnm6noXgB5gQykQK7l9b6j94rqw4JYlJz0O9eUnH0J/u1FDfbuZuAxh0RoWxJ8iADsYfGDxH3tzrFA6gXt7MQGDtLe0JC/j4Hrtg2f/mZ16XeORl3VeVuMk9DQ7kNzifLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsoAG2jjO9Lppu8LqsaraO+SjbHYVaV59fsyTLx9hiw=;
 b=UOL0xvKto2N3tnOseRfdMY857w9mkH+XQz2yUgdUSi+u1QKT/uDyBOJ38gz9zyuzHoaPkyy2ZqWqlyD5J//72sELrVL4YqV39J5oGeNKCwL4K3rDXOhhRsXynvrK/lxbDbB0MjAnHP0sJYxMmboxUQi4cYPRNioP5Dv+URKsKs3FnH8Zbo1RYtyL2WR1olb8gns+RJ3MINJlHqccGs8O+14tai1JDgVphfY0h+hZXw9+DrqK1cbh48j+kr+uM1lNvT9tVERLPx7f0gbxA66M0OmLxSioXq55BDvHxrGR+84e41ZaZp51l1ONirc9uV0LFyOzC3A/oQdTMNAVhrjGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsoAG2jjO9Lppu8LqsaraO+SjbHYVaV59fsyTLx9hiw=;
 b=MAk7dhTAdnttPPdZh1tlti80BXyf2QSkJV0uCkGaYNTpV47Mi7TX7oRqEZhDqBvYaQpUYjx2sN/H5AFTerGiAovkbsaTcoN4mDNBGu9m7ctOjesSzaCA0hJVGi6/zTJ6stscVnWa859vD7S6hESusPCn7L/s/+egMCTC6HeG6JY=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3191.eurprd02.prod.outlook.com (10.175.234.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19; Tue, 3 Mar 2020 09:59:17 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e%4]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 09:59:17 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Tue, 3 Mar 2020 09:59:15 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V5] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV7Kc8f1s5+kS3/0OKIQZfqMdQDqg2o5AAgAAlAoD//9/PAIAAAxoA
Date: Tue, 3 Mar 2020 09:59:16 +0000
Message-ID: <537b518b-1ca3-304b-8634-d7bf44c3ed89@bitdefender.com>
References: <20200226131806.32444-1-aisaila@bitdefender.com>
 <e94a2335-cd08-339f-4fb0-9d1cb72b78d3@suse.com>
 <4d92a595-28d6-cf73-3d84-80ffcf970331@bitdefender.com>
 <71a5d12c-e886-4b6e-c954-d4a300bf0aab@suse.com>
In-Reply-To: <71a5d12c-e886-4b6e-c954-d4a300bf0aab@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6648bbf2-90fc-4e66-3cb5-08d7bf59890c
x-ms-traffictypediagnostic: DB6PR02MB3191:|DB6PR02MB3191:
x-microsoft-antispam-prvs: <DB6PR02MB31917A87DD826943026DF97EABE40@DB6PR02MB3191.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(346002)(396003)(376002)(199004)(189003)(54906003)(81166006)(86362001)(81156014)(8676002)(31696002)(316002)(71200400001)(7416002)(66476007)(16576012)(66446008)(26005)(64756008)(2906002)(31686004)(4326008)(53546011)(52116002)(66556008)(16526019)(8936002)(66946007)(478600001)(6916009)(186003)(5660300002)(956004)(36756003)(2616005)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3191;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eDc7eWLCnvXMrwZ7cH7LT0Qjllcl/hoVD+SefAWTYXPMKwbqqB81t+qDPoPQyB7d6xh6OV2b3HZRsFRYL9mQUSAxkdbk+5WH7r/f6dYJqUkpWqKYDyGcm2KWeXFf186WhwztAqaGxSAThJClzWNdtE+j0TOJRa2Xr7aX9jajyK8+smPymU4Jmi7x/0F68831ioLRgwHVwnmsOYM7hKsxwLW4JX55K8lfJsA8el7frnJsKetUXVdrWoQ/kINrUTPQHDa4HSQJHsH/PvUu08xb1LAP3vlVUe5SnXr0QT6nlKVf63woYMySaKqJdU2PAqRQH7pJG2zy8c84OfjkWVhXr44WW5+lGnrs2TOcSZ4cv1fPQO64/WhZ61g1+wFaDFiyk51MVI6dSukk1mHgsuwlPCzDjaS29GqQYxJdR2eN33MKUj5qmXsNJrPW62NQXarv
x-ms-exchange-antispam-messagedata: UZQ6w8t8g0KOk+be7Gb62tUc/XHFsbxb8Q8YrVdsk+itKcl7R1SAlQMHEfZtj3M6mSqJSr/hNFm9o8m3HPJf2oDRSY0oXp/GEgGuF4toj3kVvHKgYKziNDkHE5gktfZN8q1iOV7uHcRwTVLcR15+TQ==
x-ms-exchange-transport-forked: True
Content-ID: <5E91409196E89A43988004FC0C0DD307@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6648bbf2-90fc-4e66-3cb5-08d7bf59890c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 09:59:16.9708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ju3JzfgfH/zGAAdKJ5ZhyfNCbrH6oy7IZIyqJPinJhgOc/zzzM2iH/gyRWV3oIzk9aKvKPAYXEsH/LANIQq0aJ5WodfLcJJA1TEu/tIsBvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3191
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

DQoNCk9uIDAzLjAzLjIwMjAgMTE6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wMy4y
MDIwIDEwOjQzLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MDMuMDMuMjAyMCAxMTozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjYuMDIuMjAyMCAx
NDoxOCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IEBAIC00ODQwLDYgKzQ4
NDEsMTkgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+Pj4+ICAgICAgICAgICAgYnJlYWs7
DQo+Pj4+ICAgICAgICB9DQo+Pj4+ICAgIA0KPj4+PiArICAgIGNhc2UgSFZNT1BfYWx0cDJtX3Nl
dF92aXNpYmlsaXR5Og0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgdWludDE2X3QgaWR4ID0g
YS51LnNldF92aXNpYmlsaXR5LmFsdHAybV9pZHg7DQo+Pj4NCj4+PiBXaHkgYSBmaXhlZCB3aWR0
aCB0eXBlIChhbmQgZXZlbiBvbmUgaW5lZmZpY2llbnQgdG8gZGVhbCB3aXRoKT8NCj4+PiAoT25l
IG1pZ2h0IGV2ZW4gYXNrIC0gd2h5IGEgbG9jYWwgdmFyaWFibGUgaW4gdGhlIGZpcnN0IHBsYWNl
LA0KPj4+IHdoZW4gaXQncyB1c2VkIC4uLg0KPj4+DQo+Pj4+ICsgICAgICAgIGlmICggYS51LnNl
dF92aXNpYmlsaXR5LnBhZCApDQo+Pj4+ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7DQo+Pj4+
ICsgICAgICAgIGVsc2UgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApDQo+Pj4+ICsgICAgICAgICAg
ICByYyA9IC1FT1BOT1RTVVBQOw0KPj4+PiArICAgICAgICBlbHNlDQo+Pj4+ICsgICAgICAgICAg
ICByYyA9IHAybV9zZXRfYWx0cDJtX3ZpZXdfdmlzaWJpbGl0eShkLCBpZHgsDQo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhLnUuc2V0X3Zpc2li
aWxpdHkudmlzaWJsZSk7DQo+Pj4NCj4+PiAuLi4ganVzdCBvbmNlIGhlcmUuKSBUaGUgZnVuY3Rp
b24gdGFrZXMgInVuc2lnbmVkIGludCIgaW4gYW55DQo+Pj4gZXZlbnQuDQo+Pg0KPj4gU3VyZSwg
SSBjYW4gaGF2ZSB0aGlzIGlkeCBkcm9wcGVkIGFuZCB1c2UgdGhlIHZhbHVlIGluIHRoZSBzdHJ1
Y3R1cmUuDQo+PiBJIGhhZCB0aGF0IGluIHBsYWNlIHRvIGhhdmUgbGluZSBzaXplIHNtYWxsZXIg
YW5kIHRoZSBjb2RlIGVhc3kgdG8gcmVhZC4NCj4gDQo+IERyb3BwaW5nIHRoZSB2YXJpYWJsZSBp
cyBzZWNvbmRhcnkgLSBpZiB5b3UgcHJlZmVyIHlvdSBrZWVwIGl0LCBzbw0KPiBiZSBpdC4gQnV0
IGlmIHlvdSBrZWVwIGl0LCBpdHMgdHlwZSBzaG91bGQgYnkgaW4gbGluZSB3aXRoDQo+IC4vQ09E
SU5HX1NUWUxFLg0KPiANCg0KQWggeWVzLCB5b3UgYXJlIHJpZ2h0LCBJIHdpbGwgY2hhbmdlIHRo
ZSB0eXBlIHRvIHVuc2lnbmVkIGludC4NCg0KDQpPbiB0aGUgcmMgcG9pbnQgeW91IG1lbnRpb25l
ZCwgSSB0aGluayBpdCB3aWxsIGJlIGJldHRlciB0byBoYXZlIGEgZ290byANCmxhYmVsIHRoZXJl
IGFuZCBoYXZlIHRoZSBjbGVhbnVwIG9uICJvdXQ6Ig0KDQoNClRoYW5rcyBmb3IgdGhlIHJldmll
dywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
