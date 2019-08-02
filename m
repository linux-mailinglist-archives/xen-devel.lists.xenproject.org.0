Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F697F7B3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htX8f-00063d-LK; Fri, 02 Aug 2019 12:58:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htX8f-00063T-0i
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 12:58:29 +0000
X-Inumbo-ID: 2f3256b0-b525-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f3256b0-b525-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 12:58:27 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 12:58:18 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 12:57:21 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 12:57:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V90Zg34zUg/GuHlVCJFHNFQ5k+z0/xByTZ6JB29/v69XREldWrYZz8pCg3ZmduU/zerULuQaRRUE3/gbz2GqlCY93D5AgOLOhuvuIF39e67F8+gzpHSEOZwT1ktAIvHaF9/XJzIgnQVVDwt+pukLyLfcAwL55U0GaA0mB2LwONlxVfDLgS6mhLyo6h/B0Nto3JYJ7kY+pBerP1W6Hsgh5YBJ78Jas6FV/Q1wGQQVp+AuGCdRwBl6SidaCCS3xBem03OzA1BjAJ1aqdMN49M4hUybngNHVMyJ9wN8QeFXv9HsodCjj1SslE9p2AHi7bNH0Ivz5przpySWxvFxrq7sAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zNb9HE89o+wf8yVAvDgpeMxFbRxax3A6LTWO9OjcYc=;
 b=l+xEJ5Sw9asXybGJBtmv8ko3cdq+x6ERofhePZpyLhwDA7ClEpIzcvz+oQLSRn1FcMu2fIVZYs3smB8QIFLJFczy737hrbjNHjI3zB8uK3brzKGvzK72NqSLEkANki5JghSsXh7ZIlAE0Z0H7TfscZ97lfBpUVDrCnqEdhVvuB+YCFXhUUOo/47aB0ZpBjEOed/LfqDltZr+sd4MOHUPkQGhoKFIEnQWVtZ1kFWeBnPUEZNX5MbmcBsBLoJ5PVQbv+itSXAPXVlpbt0gyx8aHacWtYMLwDcIE6hbQEH7JjU3mrZlQtGfsX+UoTDu/Wo0mnPVN+HL5+enfKnZ6nnGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2537.namprd18.prod.outlook.com (20.179.105.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Fri, 2 Aug 2019 12:57:20 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 12:57:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQeNoBgAADe8CAAAegOoAMhBoBgASM1gCAAAh2qIAAA3yAgANcJ+OAAQAfgIAATfBxgAAJclqAAUxDnIAADDCOgAAnnP+AABQgAA==
Date: Fri, 2 Aug 2019 12:57:19 +0000
Message-ID: <6031d2e9-4327-cf57-4c27-41a940fad3be@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
 <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
 <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
 <be9cc69b-41cc-6725-b205-aafa31bdc39c@suse.com>
 <CAOcoXZb8SYbLryapgNmnL3w7oAkyJZtdzM0jRgsvMA=5qtysNQ@mail.gmail.com>
 <d85e76b5-0a68-af0a-375c-7f3844e6e21f@suse.com>
 <CAOcoXZYeV6oXXj4qJRH5pLC8JgM-nghna_JESYBWrO_j4PPL5Q@mail.gmail.com>
 <dcee6c93-df93-3118-1c13-75dfcc001965@suse.com>
 <CAOcoXZY2O96w3s4sPVhLbvSJ3wW0KMz7HzSJjRN1C1H=RvS7Qw@mail.gmail.com>
In-Reply-To: <CAOcoXZY2O96w3s4sPVhLbvSJ3wW0KMz7HzSJjRN1C1H=RvS7Qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc402863-6216-4f6c-e9af-08d71748f3b5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2537; 
x-ms-traffictypediagnostic: DM6PR18MB2537:
x-microsoft-antispam-prvs: <DM6PR18MB2537FFC1C26C06B865F5A503B3D90@DM6PR18MB2537.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(53546011)(6512007)(54906003)(68736007)(80792005)(53936002)(66446008)(52116002)(4326008)(36756003)(2906002)(66556008)(86362001)(66476007)(229853002)(8676002)(31686004)(7736002)(305945005)(478600001)(31696002)(64756008)(316002)(71200400001)(71190400001)(5660300002)(66946007)(186003)(2616005)(476003)(8936002)(26005)(11346002)(3846002)(446003)(486006)(81166006)(81156014)(6486002)(6116002)(256004)(14454004)(6916009)(102836004)(386003)(6506007)(14444005)(6246003)(76176011)(6436002)(7416002)(25786009)(66066001)(99286004)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2537;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uD4t3R4a7ATrc5a/9lnYmSeWvQ1eEV6AO0TBefl90WcZ0MeKAuum/G2spg4xEcL2wr7s+3G5LPf041XOB6TTI2xum41gBtESztaU2e4zuUrSjfa5OeTpZTH2WWbWByP5vzLWNBLHBBcSO+y9UdQqgskqpZ3/ps/tth5dbzS0LA4nvWkvFQl77Mdf9S9anUDhgPQctxFxZKgUzSP22ASU6Gh6NXRBaYjo0+/f0J+c7Da+BWjIKAd5r+nqmFPp9lgbF61d2pf03Ky+ARCTfMk9Y/n0KVwvma24FD+OWQ4jUEygzktLeet8H2QM6v1lLv67QiqXx63JVLWZmHwlTD02OqLhsqMSBJjRCYwuaF9wqd9RSKeyWMZAox6m1lb1pVWJ5TEADyOHJvAS1vCAaRdNcjpwPBfrixq0U4hj2a2dmJU=
Content-ID: <B10064CE47B63E4D884D1D15E7A00383@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fc402863-6216-4f6c-e9af-08d71748f3b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 12:57:19.1803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2537
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Juergen Gross <JGross@suse.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Lars Kurth <lars.kurth@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAxMzo0NCwgVmlrdG9yIE1pdGluIHdyb3RlOg0KPiBPbiBGcmksIEF1ZyAy
LCAyMDE5IGF0IDEyOjIzIFBNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6
DQo+IA0KPj4+PiBBIHNuaXBwbGV0IGZyb20gY29tbWl0IDU3ZjhiMTNjNzI0MDIzYzc4ZmExNWE4
MDQ1MmQxZGUzZTUxYTE0MTg6DQo+Pj4+DQo+Pj4+IEBAIC00MDk2LDE0ICs0MDk3LDEyIEBAIHJl
dHJ5X3RyYW5zYWN0aW9uOg0KPj4+PiAgICAgICAgICAgICBnb3RvIG91dDsNCj4+Pj4NCj4+Pj4g
ICAgICAgICBpZiAodGFyZ2V0ID09IE5VTEwpIHsNCj4+Pj4gLSAgICAgICAgbGlieGxfX3hzX3By
aW50ZihnYywgdCwgdGFyZ2V0X3BhdGgsICIlIlBSSXUzMiwNCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAodWludDMyX3QpIGluZm8uY3VycmVudF9tZW1rYik7DQo+Pj4+IC0gICAgICAg
ICp0YXJnZXRfbWVta2IgPSAodWludDMyX3QpIGluZm8uY3VycmVudF9tZW1rYjsNCj4+Pj4gKyAg
ICAgICAgbGlieGxfX3hzX3ByaW50ZihnYywgdCwgdGFyZ2V0X3BhdGgsICIlIlBSSXU2NCwNCj4+
Pj4gaW5mby5jdXJyZW50X21lbWtiKTsNCj4+Pj4gKyAgICAgICAgKnRhcmdldF9tZW1rYiA9IGlu
Zm8uY3VycmVudF9tZW1rYjsNCj4+Pj4gICAgICAgICB9DQo+Pj4+ICAgICAgICAgaWYgKHN0YXRp
Y21heCA9PSBOVUxMKSB7DQo+Pj4+IC0gICAgICAgIGxpYnhsX194c19wcmludGYoZ2MsIHQsIG1h
eF9wYXRoLCAiJSJQUkl1MzIsDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgKHVpbnQz
Ml90KSBpbmZvLm1heF9tZW1rYik7DQo+Pj4+IC0gICAgICAgICptYXhfbWVta2IgPSAodWludDMy
X3QpIGluZm8ubWF4X21lbWtiOw0KPj4+PiArICAgICAgICBsaWJ4bF9feHNfcHJpbnRmKGdjLCB0
LCBtYXhfcGF0aCwgIiUiUFJJdTY0LCBpbmZvLm1heF9tZW1rYik7DQo+Pj4+ICsgICAgICAgICpt
YXhfbWVta2IgPSBpbmZvLm1heF9tZW1rYjsNCj4+Pj4gICAgICAgICB9DQo+Pj4+DQo+Pj4+ICAg
ICAgICAgcmMgPSAwOw0KPj4+Pg0KPj4+DQo+Pj4gSSd2ZSBidWlsZCBnbnUgZGlmZnV0aWxzIGxh
dGVzdCByZWxlYXNlIDMuNyBhbmQgY2hlY2tlZCB0aGUgY29kZSBhbmQNCj4+PiB0aGUgaXNzdWUu
IEl0IHNlZW1zIHRoaXMgZmVhdHVyZSAoLXApIGRvZXNuJ3Qgd29yayBwcm9wZXJseSBhbmQgaGFz
DQo+Pj4gbWFueSBtb3JlIGJ1Z3MgdGhhbiBqdXN0IHRoZSBpc3N1ZSB3aXRoIGxhYmVscy4gU2Vl
IHRoZSBleGFtcGxlIGJlbG93LA0KPj4+IHRoZSBjaGFuZ2UgaGFzIGJlZW4gbWFkZSBpbiB0aGUg
ZnVuY3Rpb24gYTEoKSwgaG93ZXZlciwgaW4gdGhlIGRpZmYNCj4+PiBhbm90aGVyIGZ1bmN0aW9u
IGlzIHNob3duIGEoKS4NCj4+DQo+PiBUaGlzIGNhc2UgaXMgY29tcGxldGVseSBmaW5lLCBhcyB0
aGUgY29udGV4dCBvZiB0aGUgZGlmZiBpcyBzdGFydGluZw0KPj4gYmVmb3JlIHRoZSBkZWZpbml0
aW9uIG9mIGEoKSAoYW5kIGp1c3QgYWZ0ZXIgYTEoKSkuIFRoaXMgaXMgaW1wb3J0YW50IGluDQo+
PiBjYXNlIHlvdSBvbmx5IGFkZCBhIG5ldyBmdW5jdGlvbiBmb3IgZXhhbXBsZS4NCj4+DQo+IA0K
PiBKdWVyZ2VuLCB0aGUgZGlmZiByZXR1cm5zIHdyb25nIG5hbWUgb2YgdGhlIGZ1bmN0aW9uIHNp
bGVudGx5LiBJIGRvbid0DQo+IHRoaW5rIGl0IGlzICdjb21wbGV0ZWx5IGZpbmUnLCBJIHdvdWxk
IHJhdGhlciBjYWxsIGl0IGEgYnVnLCBvcg0KPiBub24tZG9jdW1lbnRlZCBsaW1pdGF0aW9uLCBi
dXQgZGVmaW5pdGVseSBub3QgYSBmZWF0dXJlLiBBcyBJIHdyb3RlDQo+IHByZXZpb3VzbHksIEkg
cGxheWVkIHdpdGggLXAgYSBsaXR0bGUgYW5kIG9ic2VydmVkIG1vcmUgc2ltaWxhciBpc3N1ZXMN
Cj4gd2l0aCBpdC4gVGhlIHJlYXNvbiBpcyB0aGF0IHRoZSBuZXh0IGRpZmYgY29kZSAoc2VlIGJl
bG93KSB0cmllcyB0bw0KPiBtYXRjaCBmdW5jdGlvbiBuYW1lcyB1c2luZyBzaW1wbGUgcmVnZXhw
IGZvciBhIGxpbmUsIGFzc3VtaW5nIHRoYXQNCj4gbGluZSB3aXRoIGZ1bmN0aW9uIG5hbWUgY2Fu
bm90IHN0YXJ0IHdpdGggYSAnbm9uLWFscGhhJyBjaGFyYWN0ZXJzLiBTbw0KPiBldmVuIGFkZGlu
ZyBvbmUgbW9yZSBzcGFjZSBiZWZvcmUgYSBsaW5lIHdpdGggZnVuY3Rpb24gbmFtZSBicmVha3Mg
aXQuDQoNCkFuZCB0aGVyZSdzIG5vdCBzdXBwb3NlZCB0byBiZSBhbnkgYmxhbmsgYWhlYWQgb2Yg
YSBmdW5jdGlvbidzDQpoZWFkaW5nLg0KDQo+IGRpZmZ1dGlscy0zLjcvc3JjL2RpZmYuYzo0NjIN
Cj4gICAgICBjYXNlICdwJzoNCj4gICAgICAgIHNob3dfY19mdW5jdGlvbiA9IHRydWU7DQo+ICAg
ICAgICBhZGRfcmVnZXhwICgmZnVuY3Rpb25fcmVnZXhwX2xpc3QsICJeW1s6YWxwaGE6XSRfXSIp
Ow0KPiANCj4gSXQgaXMgcHJvYmFibHkgY291bGQgYmUgaW1wcm92ZWQgYnkgYWRkaW5nICdubyA6
IHN5bWJvbCBhdCB0aGUgZW5kIG9mDQo+IHRoZSBsaW5lJyBsb2dpYyB0byB0aGlzIHJlZ2V4cC4g
SXQgd2lsbCByZXNvbHZlIHRoZSBpc3N1ZSB3aXRoIGxhYmVscywNCj4gYnV0IHdpbGwgYWRkIG9u
ZSBtb3JlIGJ1ZyAob3IgbGltaXRhdGlvbikgYWJvdXQgdXNpbmcgIjoiIGluIHN1Y2gNCj4gbGlu
ZXMuDQo+IA0KPiBUaGUgaXNzdWUgaXMgbW9yZSBnZW5lcmFsIGhlcmUuIFRoZSBkaWZmIHRvb2wg
c2hvdWxkIG5vdCBwYXJzZSBhbnkNCj4gcHJvZ3JhbW1pbmcgbGFuZ3VhZ2VzLCBpdCBzaG91bGQg
anVzdCBjb21wYXJlIHRoZSBzdHJpbmdzLg0KDQoiVGhlIHN0cmluZ3MiIGJlaW5nIHdoaWNoIG9u
ZXM/IFRoZSBsaW1pdGF0aW9ucyAoaWYgeW91IHdhbnQgdG8gY2FsbA0KdGhlbSBzdWNoKSBvZiAi
ZGlmZiAtcCIgYXJlLCBJIHRoaW5rLCB3ZWxsIHVuZGVyc3Rvb2QuIEFuZCB0aGVyZSdzDQpubyAi
cGFyc2luZyIgaGVyZSBhdCBhbGwgLSB0aGUgcmVnZXhwIHNpbXBseSBjaGVja3MgdGhlIGZpcnN0
DQpjaGFyYWN0ZXIuIFRoZSB0aW1lIHdoZW4geW91IHdhbnRlZCB0byBtYWtlIGl0IHNraXAgbGFi
ZWxzIHdvdWxkIGJlDQp3aGVyZSBpdCB3b3VsZCBiZWNvbWUgbW9yZSBsaWtlICJwYXJzaW5nIi4N
Cg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
