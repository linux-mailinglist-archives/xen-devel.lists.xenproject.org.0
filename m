Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A2165A25
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 10:27:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4i5U-0002Np-SD; Thu, 20 Feb 2020 09:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/BCT=4I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j4i5T-0002Nk-Qy
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:25:39 +0000
X-Inumbo-ID: f473ea78-53c2-11ea-84ef-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.109]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f473ea78-53c2-11ea-84ef-12813bfff9fa;
 Thu, 20 Feb 2020 09:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRV0bRfKm42b5k8q7b5xOYCW88oEJhNK3GLGG159trPwowvjaCTVDXY1fXJBCjszmgiEoxmyVBwuz7Rq7MSC8E5iD3VA18E9L4QeipWnxfIthCiTGwKhl4Jg2oL9/uPx+mSBr+HnyyGZWhR4tHD5i7I/OWVDiY5ErfwOZeZo9nUoVwAKG/xrPZ8htIp5qQisfzSg6cILNgpqWlTSc4y0tkS3eMNk/zODH9g8josqvzHUc7RxNptyrhGDisQ3mkRdY08rt70bf0bK9j0Dac1T7wR8ugQuRlTgaxkSP6v3jBMeBOwlm0mblExV9miVd8m1Qm3jFAVYmcBjMF5PT9WXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZsK2TZ9dYI8Oc3ZuKlHx5bXvMH/NjsGntZK9lMNGyM=;
 b=iOeUqRPJyxPbzjVWsVyb0afKgOGfeWNDlfx8BFiEMoosgrrTWcx980OEgauc8/qQSYObqNrgALcD+OOqEzChY1P7HAt4o5Yen7qt6ETbOJ0BswlVqgWdVsrRFwsG2b+2x02AbpD+wP0npqLuy7rkOAEVoNDW5XycB1xc2MaINsl5+0Y45FPDqzsx3syZF3fK776MnKm0Avb2u1z5n/03mV/lYMegOG9pu7irag+neVyxg1LpNt27CSsfK/7/t4ClXyV9wgC5AZUazQn+cK4r8SsgDR9kYQgXdWcbzctiPBcRA4uJyhgZthluaBrpO7G6GuF2diYDy/e0NPgyuEvzIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZsK2TZ9dYI8Oc3ZuKlHx5bXvMH/NjsGntZK9lMNGyM=;
 b=db3/j05ZCWpfTu4CU5yVthRaYWQvZvWlbhLvq3ZI5nfSOeqQcJ91qBdeGkdJ7an+5c2puCv2daxYpIeGCXKXHNKgqz5bEpDDxOVyi1WcenSzQwSa6yjzP6UOH9kE/GdMJ7QoJ1DPYVJDaKIlpxd7NugL5T84hIfcqbMajcLSVFk=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3240.eurprd02.prod.outlook.com (10.170.220.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 20 Feb 2020 09:25:36 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 09:25:36 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Thu, 20 Feb 2020 09:25:34 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Thread-Topic: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
 visibility
Thread-Index: AQHV5wWKuFf2vClElk6nKYx34YpPrKgit70AgAEZnoA=
Date: Thu, 20 Feb 2020 09:25:36 +0000
Message-ID: <aae92c4b-c45d-752e-553d-6b43d2628276@bitdefender.com>
References: <20200219091811.9689-1-aisaila@bitdefender.com>
 <CABfawhkS2f6p9gFDP6h4vS5b7eAe_d-knsrvcz9O8zyjv-stvw@mail.gmail.com>
In-Reply-To: <CABfawhkS2f6p9gFDP6h4vS5b7eAe_d-knsrvcz9O8zyjv-stvw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6316707e-750c-4ef3-5de1-08d7b5e6d781
x-ms-traffictypediagnostic: DB6PR02MB3240:|DB6PR02MB3240:
x-microsoft-antispam-prvs: <DB6PR02MB3240E391E1952FEE5B883603AB130@DB6PR02MB3240.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39840400004)(366004)(136003)(346002)(376002)(189003)(199004)(8936002)(956004)(2616005)(86362001)(31696002)(64756008)(66556008)(66446008)(6486002)(66946007)(66476007)(316002)(16576012)(54906003)(2906002)(71200400001)(5660300002)(16526019)(81166006)(53546011)(186003)(31686004)(81156014)(4326008)(26005)(8676002)(52116002)(6916009)(478600001)(36756003)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3240;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z/gAPZcSds66n6fT0b7iAZfV7u6sHEL5mokqt0gH1Bl0GiaIW66+OGxloAmQ+S6xEfLYaQIHPr6+FNa1D+kqFssq6sh3u2WW64nDTSGsKVEOmwT4MaV4JZMx5RWNvmKMcwFfZCSy28r0GMdvH1LF217XRGpkAQlYFu4uNtXpCEpFagRnrzTlRvF5ZTBM6Q0Lxd2V6G6sz5XbGW9IzHqFEjC2uJ1XTK6Rmca09YX7Lip8fJiT071udkQFTrBOvLjbcEF3vW2G3zp/JxAPD/8DFY8V/nNaTyrduy3fE3ZVQABjsG3LUyGTME5pUd8AT/ZU0CcGbSAvmCi82UNgInw2vmhAZrgzJ4Sb3ll/lWRbHKxGysGnuyZbdGx49aSDYkWTj4k8Ju4rL6IKvqEr5vOGCLq7PNo5mVodVD8y+l5xM/8SoidrfTCFquMpcLAvW+s8
x-ms-exchange-antispam-messagedata: OyF2W6ohMImHOzJ7KqpyVmNid1MxOELqCnWu7MPMiKVl2HExjfeksaOdq4nxnA56YpwkO89r+gxet598uDzDymhnoCTF+mNVEVzbAEYo1WtJuZNnm0dePxE2QGj1cNbUj2aVjtX4pepMXWTjf4mXcQ==
x-ms-exchange-transport-forked: True
Content-ID: <E5264A5F91BE754DB04EDFA8BE683BD4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6316707e-750c-4ef3-5de1-08d7b5e6d781
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 09:25:36.1138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mY3eMbgM82U8ke1jI00KyyinxACG48AomKQ2LaQ7n1n0Fk0ol6+kHYU5w3EqRftW1CXKS72A8RrbJxy/jMchaX6iXBECzZCO9ujFrdCa8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3240
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
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE5LjAyLjIwMjAgMTg6MzcsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gV2Vk
LCBGZWIgMTksIDIwMjAgYXQgMjoxOSBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQ0KPiA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4NCj4+IEF0IHRoaXMgbW9tZW50IGEgZ3Vl
c3QgY2FuIGNhbGwgdm1mdW5jIHRvIGNoYW5nZSB0aGUgYWx0cDJtIHZpZXcuIFRoaXMNCj4+IHNo
b3VsZCBiZSBsaW1pdGVkIGluIG9yZGVyIHRvIGF2b2lkIGFueSB1bndhbnRlZCB2aWV3IHN3aXRj
aC4NCj4+DQo+PiBUaGUgbmV3IHhjX2FsdHAybV9zZXRfdmlzaWJpbGl0eSgpIHNvbHZlcyB0aGlz
IGJ5IG1ha2luZyB2aWV3cyBpbnZpc2libGUNCj4+IHRvIHZtZnVuYy4NCj4+IFRoaXMgaXMgZG9u
ZSBieSBoYXZpbmcgYSBzZXBhcmF0ZSBhcmNoLmFsdHAybV93b3JraW5nX2VwdHAgdGhhdCBpcw0K
Pj4gcG9wdWxhdGVkIGFuZCBtYWRlIGludmFsaWQgaW4gdGhlIHNhbWUgcGxhY2VzIGFzIGFsdHAy
bV9lcHRwLiBUaGlzIGlzDQo+PiB3cml0dGVuIHRvIEVQVFBfTElTVF9BRERSLg0KPj4gVGhlIHZp
ZXdzIGFyZSBtYWRlIGluL3Zpc2libGUgYnkgbWFya2luZyB0aGVtIHdpdGggSU5WQUxJRF9NRk4g
b3INCj4+IGNvcHlpbmcgdGhlbSBiYWNrIGZyb20gYWx0cDJtX2VwdHAuDQo+PiBUbyBoYXZlIGNv
bnNpc3RlbmN5IHRoZSB2aXNpYmlsaXR5IGFsc28gYXBwbGllcyB0bw0KPj4gcDJtX3N3aXRjaF9k
b21haW5fYWx0cDJtX2J5X2lkKCkuDQo+IA0KPiBJJ20ganVzdCB3b25kZXJpbmcsIHdoYXQgcHJl
dmVudHMgdGhlIGd1ZXN0IGZyb20gY2FsbGluZyB0aGlzIEhWTSBvcA0KPiBiZWZvcmUgZG9pbmcg
dm1mdW5jPyBUaGlzIHNlZW1zIHRvIG9ubHkgbWFrZSBhIGRpZmZlcmVuY2UgaW4gY2FzZSB0aGUN
Cj4gYWx0cDJtIG1vZGUgaXMgZWl0aGVyIHNldCBhcyBleHRlcm5hbCBvciBsaW1pdGVkIChvciBo
YXZlIGEgbW9yZQ0KPiBmaW5lLWdyYWluZWQgWFNNIHBvbGljeSBsb2FkZWQpLiBJcyB0aGF0IGNv
cnJlY3Q/IElmIHNvLCBwZXJoYXBzDQoNClllcywgdGhhdCBpcyBjb3JyZWN0Lg0KDQo+IG1lbnRp
b24gdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGFzIGEgY29tbWVudCBvbiB0aGUgbGli
eGMNCj4gZnVuY3Rpb24gc28gdGhhdCBwZW9wbGUgZG9uJ3QgZ2V0IGEgZmFsc2Ugc2Vuc2Ugb2Yg
c2VjdXJpdHkgd2hlbiB1c2luZw0KPiB0aGUgbWl4ZWQgbW9kZS4NCj4gDQoNCkkgd2lsbCBhZGQg
dGhpcyBmYWN0IGluIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgaW4gbGlieGMuIEdvb2QgdGhpbmcg
dG8gDQpwb2ludCB0aGF0IG91dC4NCg0KDQpUaGFua3MsDQpBbGV4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
