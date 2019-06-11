Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4C3D55E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:21:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halM5-0003CA-8H; Tue, 11 Jun 2019 18:18:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYfD=UK=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1halM3-0003C3-Uy
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:18:44 +0000
X-Inumbo-ID: 5703aa38-8c75-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.82]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5703aa38-8c75-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDdav4y7XhxZ6S8KRcoF6uhdLr8/LBRVJOZoDSVnIKk=;
 b=PasunxUQYZE+lpSgNnwWK+HHGt9FS6KlL7P8ue57pCUxbuWlYBOuZQvN96mqfatUBpcKMMP6Yrd/EK0z3F6QDKdSgnyV7xj53VFVszzZrbjo5l7lyoa1QBgA+7cVNMNv9LL54dKm5rO+21bHW6pQ3DcJXh6V8mp4byNaG6aOXnTy/L/HRsGLgIWsyWUCuKQZ/bFhzSRjN0W5a/oeAYNjWiItqMdneQ+a3ixL8mWEf5hR0+akBDc6EtItiKy5sIYMmP0gHLGXtTrZnJmOXxPiw5jSRWNHfBBmcvr6v70IN08niSS+go8OaaDeQumveV8fooQpjVYceC53YcJvtE2Pig==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4482.eurprd03.prod.outlook.com (20.177.40.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 11 Jun 2019 18:18:38 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1965.011; Tue, 11 Jun 2019
 18:18:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 01/10] xen/arm: add generic TEE mediator framework
Thread-Index: AQHVEBu+v99Aq9L0vky2ENVWc7gtYqaO4l8AgAEmUoCABttBgA==
Date: Tue, 11 Jun 2019 18:18:37 +0000
Message-ID: <87y3286l50.fsf@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
 <1183ab3f-e483-9ad8-ede3-c905bc2d9331@arm.com>
 <73a3c967-66f8-5d26-f657-5093c25cc76b@arm.com>
In-Reply-To: <73a3c967-66f8-5d26-f657-5093c25cc76b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eeae7a2-8364-467e-0695-08d6ee9939d2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4482; 
x-ms-traffictypediagnostic: AM0PR03MB4482:
x-microsoft-antispam-prvs: <AM0PR03MB448244DD0CE0132D1FF2B18EE6ED0@AM0PR03MB4482.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(26005)(6916009)(86362001)(102836004)(229853002)(66066001)(5660300002)(6506007)(55236004)(53546011)(2906002)(71190400001)(71200400001)(7416002)(256004)(6246003)(80792005)(7736002)(81166006)(81156014)(8676002)(305945005)(186003)(8936002)(6512007)(54906003)(68736007)(446003)(91956017)(316002)(66946007)(66476007)(66446008)(64756008)(66556008)(76176011)(73956011)(486006)(36756003)(6486002)(53936002)(76116006)(14454004)(99286004)(3846002)(2616005)(476003)(6116002)(6436002)(72206003)(11346002)(478600001)(4326008)(25786009)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4482;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eJhK2SqmQuLydGulYJD6+nr9SDQUAdCxct4wptW8SYdNJeK/JiPDzuV6KrY7WTLwz7v6nttcUl2vUoeSjUphqi3qtYu/WyQyNMMAAiy0fH+uA6JH7EDWbXlb0G228U6mJOwrNkKCs1TrTIrKHeA5+X4l+eIG7NVUc/vic/DILeDvOu74EqYCTgDMIEHGzzQ0IjoiVT2ets3pYFJ0t7GKP9RTXyXcyiznvhmU2SXDflCgtovETzFFgWwWngvCQMVeSiKB3ItpH71PDGBxwb0elcy53Ffo+up+pEOitNGirrZRpH+F4Xs19opIz4PkMAL6oPVBBIevfc4LPk9nXFc+nblenR1wqYEFJjxfFqY6Hk8jwyJ6KDstsmQonFbyqmOUT1+0oxjbVWTxpcviCZRq4sipE8wzYuVazyQqtLie8Uw=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeae7a2-8364-467e-0695-08d6ee9939d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 18:18:38.6246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4482
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDA2LzA2LzIwMTkgMTc6MDIs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgVm9sb2R5bXlyLAo+Pgo+PiBPbiA1LzIxLzE5IDEw
OjI1IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+ICtzdGF0aWMgaW5saW5lIGJvb2wg
dGVlX2hhbmRsZV9jYWxsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+Pj4gK3sKPj4+ICsg
cmV0dXJuIGZhbHNlOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW5saW5lIGludCB0ZWVfZG9t
YWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3QgdGVlX3R5cGUpCj4+PiArewo+Pj4g
KyByZXR1cm4gLUVOT0RFVjsKPj4+ICt9Cj4+Cj4+IEkgaGFkIGEgcmVwb3J0IHRoYXQgWGVuIGZh
aWxzIHRvIGJvb3Qgd2l0aCB0aGlzIHNlcmllcyBhbmQKPj4gIUNPTkZJR19URUUuIFRoaXMgaXMg
YmVjYXVzZSB5b3UgcmV0dXJuIGFuIGVycm9yIGhlcmUgaW4gYWxsIHRoZQo+PiBjYXNlIHNvbWUg
ZG9tYWluIGNyZWF0aW9uIHdpbGwgYWx3YXlzIGZhaWwuClRoYW5rcyBmb3IgcmVwb3J0aW5nLiBJ
IGZvcmdvdCB0byB0ZXN0IHRoYXQgY2FzZSA6KAoKPj4gSW5zdGVhZCB0aGlzIHNob3VsZCBjaGVj
ayB0aGF0IHRlZV90eXBlIGlzIGFsd2F5cyBOT05FIG9yIGVsc2UgcmV0dXJuIGFuIGVycm9yLgo+
Pgo+PiBBbHNvLCBwbGVhc2UgYXQgbGVhc3QgY2hlY2sgdGhhdCB5b3VyIHNlcmllcyBkb2VzIG5v
dCBicmVhayBib290Cj4+IHdoZW4gQ09ORklHX1RFRSBpcyBub3Qgc2VsZWN0ZWQuIEl0IHdvdWxk
IGFsc28gYmUgaWRlYWwgKGJ1dCBub3QKPj4gbWFuZGF0b3J5KSBpZiB5b3UgY2FuIGNoZWNrIHRo
YXQgaXQgZG9lcyBub3QgYnJlYWsgb24gbm9uLU9QVEVFCj4+IHBsYXRmb3JtIHdoZW4gIUNPTkZJ
R19URUUgaXMgc2VsZWN0ZWQuCj4KPiBJIGp1c3QgcmVhbGl6ZWQgdGhpcyBwYXJhZ3JhcGggbWF5
IG5vdCBiZSBjbGVhci4gV2hhdCBJIG1lYW50IGlzIHdlCj4gbmVlZCB0byBhdCBsZWFzdCB0ZXN0
IHRoZXJlIGFyZSBubyByZWdyZXNzaW9uIHdoZW4gYm9vdGluZyB3aGVuIHdpdGgKPiBDT05GSUdf
VEVFPW4uCj4KPiBGb3IgQ09ORklHX1RFRT15LCBpdCB3b3VsZCBiZSBnb29kIHRvIHRlc3QgdGhh
dCBpdCBzdGlsbCBib290cyBvbgo+IHBsYXRmb3JtIG5vdCBwcm92aWRpbmcgT1AtVEVFLiBUaGlz
IGlzIG5vdCBjcml0aWNhbCBiZWNhdXNlIHRoZSBjb25maWcKPiBjYW5ub3QgYmUgc2VsZWN0ZWQg
d2l0aG91dCBDT05GSUdfWEVOX0VYUEVSVD15LgpJIGZpeGVkIENPTkZJR19URUU9biBpc3N1ZSBp
biB0aGUgbmV3IHZlcnNpb24sIHdoaWNoIEknbSBnb2luZyB0byBzZW5kCmxhdGVyIHRvZGF5LgoK
QWxzbyBJIG1hZGUgb3B0ZWVfcHJvYmUoKSAod2l0aCBDT05GSUdfT1BURUU9eSBvZiBjb3Vyc2Up
IHRvIHJldHVybgpmYWxzZSB0byBlbXVsYXRlZCBwbGF0Zm9ybSB3aXRob3V0IE9QLVRFRS4gU3lz
dGVtIGJvb3RzIGFuZCB3b3JrcyBhcwp1c3VhbC4KCkFsc28gSSBhZGRyZXNzZWQgeW91ciBvdGhl
ciBjb21tZW50cyBmb3IgdGhpcyBwYXRjaC4KCi0tCkJlc3QgcmVnYXJkcyxWb2xvZHlteXIgQmFi
Y2h1awpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
