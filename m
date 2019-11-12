Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665EF95C2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 17:37:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUZ7f-0004bo-U0; Tue, 12 Nov 2019 16:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ob2=ZE=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1iUZ7e-0004bj-Dx
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 16:34:30 +0000
X-Inumbo-ID: 497ce8b4-056a-11ea-984a-bc764e2007e4
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 497ce8b4-056a-11ea-984a-bc764e2007e4;
 Tue, 12 Nov 2019 16:34:26 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 12 Nov 2019 16:33:46 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 12 Nov 2019 16:23:35 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 12 Nov 2019 16:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOeprC7mV6HJbcAPLe+WP4K/wairaLZftP9k0dYQXw9bqxn1oO3U0qr3ebUNO6SDRhA+Th4rA3SBhvbAwmTCOQi+LaxzDtOfTQAhx2Amt+NlSmTzfbtNHJLUkwkL5sYzzh1FR5mU9mHB2h5WVgQnOTxrnQA+6Gy0vxl2eiLwf1ybN9FNIc0q4JoATnYJMXQi636MkoU1zSRzp4Z8ngz6pv3b7Bfzad7n5G4vVeRAQo++0mEQmKsB/kpVyi1DmMsysaIFstr/rqM2RT7fxI3L9x+96RGZ2er4e1haed5DT47rWBMGRte8/ZoQdCdohfzN3csmHp5iZ1sDonaxY8Wukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wobGdQmjJyKki43mBAI7aIjRUUXIG3qH6ChtDW0l4RQ=;
 b=ROUvHNNho42Rjhk+oFuP8S/BuK28RZn6xVzngaW4cTXk8pQlk7LofTiJbmZ261y8ypE/2IYKBF9OS8bAUDo6l0Qfah/4u32bWS+kxWfV98pi9UhZ+VTbyV/rtMGu2O5JaixrZMEhPZbOJZ/C6xW+02Hg2IwJ/J46l9wCOZRMlUN1PRUoz5OSXQjWPzlU03Wdyy0nwKsDcrbl4WWcDYXiLPyyNNUKt0CwW1H37GrY/0gZgSjWUf9IS8Td8KqiW/4VKOQv4pgtaaOFkeWK99E7fPw83MDqyJKqzyEsQ79q0NBRvhlYqGJpjB3b9fRqfNemDJ3y7NMhxVyNgA6LlmNdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3105.namprd18.prod.outlook.com (10.255.136.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 16:23:34 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 16:23:34 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [OSSTEST PATCH 2/2] ts-libvirt-build: Do an out-of-tree build
Thread-Index: AQHVmVI6429aMa0My0KgJaURJTPYn6eHsnIAgAACQwCAAAOagA==
Date: Tue, 12 Nov 2019 16:23:34 +0000
Message-ID: <891d8268-5170-5a4b-3206-2007e401ecdf@suse.com>
References: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
 <20191112120913.25864-2-ian.jackson@eu.citrix.com>
 <ac4c8f6f-f38b-bb56-ce6d-e0b6780d0293@suse.com>
 <24010.55658.885034.429904@mariner.uk.xensource.com>
In-Reply-To: <24010.55658.885034.429904@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:180::34) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [137.65.135.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c195ffd-e106-4d6d-1440-08d7678caa28
x-ms-traffictypediagnostic: BY5PR18MB3105:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB31058336863806E1422872C5C6770@BY5PR18MB3105.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(51914003)(476003)(52116002)(2906002)(11346002)(81166006)(64756008)(66946007)(25786009)(66476007)(8676002)(81156014)(966005)(66446008)(478600001)(386003)(6916009)(446003)(14454004)(8936002)(6506007)(256004)(36756003)(76176011)(102836004)(5660300002)(486006)(2616005)(31686004)(186003)(66556008)(53546011)(6486002)(7736002)(99286004)(316002)(6512007)(305945005)(26005)(6116002)(6306002)(229853002)(54906003)(71200400001)(4326008)(71190400001)(6246003)(31696002)(6436002)(3846002)(66066001)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3105;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8lyL7upO3c4HkamBAiLQLL3rC+4lSPK4+bR/5xJhFfeu5qXmrJNYwIaNOL3Gh4V/UJovOxEGH+Am9T/Jfk2EV53AhMUKk7utUiG9rNMgSpIsZeaMt79K7KdGGd1EGsaMQ7kJmXgR0lkVfU5bzLZy5RVyzrFxVuBYzxbqsL2rjU7hofUjqrNLX2/rQ3GXi3SQMQQO3c0w+gG7JtDFHH01xOVnaFeyrFaw8DH/7OQixslizdUvnlIUcyFw4AyVXsiuN/KjuJsoGJG58SlWYkR1YeBn8C638pkbIa0etDpkWjWDIWq2vjd4a3/pkUBpvN0Sgs1pnBGm8r8Vh4CNfPXzQjuGthUMRSBZTpUmdvsxyDY/+MLHFnNSIehjak7U/Ezi1TS2A2yFWvpXbW1DbSbCSz65L/je1DbTcS6hO7sADWLtN9h5yfTQFGmYAYDzKlXBgrOMPXpxssPUqHwIgRy4ka8z/sTExQkABj754FsKUH4=
Content-ID: <54F4F9F15283D04A9AF2834D48DA471C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c195ffd-e106-4d6d-1440-08d7678caa28
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 16:23:34.5469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSvx5bBNkPBliJomdpSe+wxd4y7PrnskeFWVdSpry64qUm89MrP0R8DEk87YgOis6DhH2VZgKlUbNF5/RlFc2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3105
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] ts-libvirt-build: Do an
 out-of-tree build
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Pavel Hrdina <phrdina@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTIvMTkgOToxMCBBTSwgSWFuIEphY2tzb24gd3JvdGU6DQo+IEhpLiAgVGhhbmtzIGZv
ciB0aGUgaW5mb3JtYXRpb24uDQo+IA0KPiBKaW0gRmVobGlnIHdyaXRlcyAoIlJlOiBbT1NTVEVT
VCBQQVRDSCAyLzJdIHRzLWxpYnZpcnQtYnVpbGQ6IERvIGFuIG91dC1vZi10cmVlIGJ1aWxkIik6
DQo+PiBJIGFzc3VtZWQgbGlidmlydCdzIGdyYWR1YWwgbW92ZSBmcm9tIGF1dG90b29scyB0byBt
ZXNvbiB3b3VsZA0KPj4gYWZmZWN0IE9TU1RFU1QsIGJ1dCBsYXRlciByYXRoZXIgdGhhbiBzb29u
ZXIuIFNvcnJ5IGZvciBub3QNCj4+IG1lbnRpb25pbmcgaXQgZWFybGllciwgYnV0IG5vdyB5b3Ug
aGF2ZSBiZWVuIHdhcm5lZCB0aGF0IGxpYnZpcnQgaXMNCj4+IG1vdmluZyB0byBtZXNvbiA6LSku
IE1lc29uIGhhcyBhIHN0cmljdCBzZXBhcmF0aW9uIGJldHdlZW4gc291cmNlDQo+PiBhbmQgYnVp
bGQgZGlyZWN0b3JpZXMgYW5kIHNvbWUgcHJlcGFyYXRvcnkgcGF0Y2hlcyB3ZXJlIHB1c2hlZCB0
aGF0DQo+PiBmb3JjZSBzcmNkaXIgIT0gYnVpbGRkaXINCj4+DQo+PiBodHRwczovL3d3dy5yZWRo
YXQuY29tL2FyY2hpdmVzL2xpYnZpci1saXN0LzIwMTktT2N0b2Jlci9tc2cwMTY4MS5odG1sDQo+
IA0KPiBJIHJlYWQgdGhpcyBhbmQgc29tZSBvZiBpdCBpcyBhIGJpdCBjb25jZXJuaW5nLiAgRG9l
cyBhbGwgb2YgdGhpcw0KPiAgICBzcmM6IFtzdHVmZl0gZ2VuZXJhdGUgc291cmNlIGZpbGVzIGlu
dG8gYnVpbGQgZGlyZWN0b3J5DQo+IG1lYW4gdGhhdCBwcmV2aW91c2x5IG9ubHkgaW4tdHJlZSBi
dWlsZHMgd2VyZSBzdXBwb3J0ZWQgYW5kIHRoYXQNCj4gdGhlcmVmb3JlIHRoZXJlIGlzIG5vIG9u
ZSBzZXQgb2YgYnVpbGQgcnVuZXMgdGhhdCB3aWxsIHdvcmsgYm90aA0KPiBiZWZvcmUgYW5kIGFm
dGVyIHRoZXNlIGNoYW5nZXMgPw0KDQpWUEFUSCBidWlsZHMgd2VyZSBwcmV2aW91c2x5IHN1cHBv
cnRlZCwgYXMgd2VsbCBhcyBpbi10cmVlIGJ1aWxkcy4gQnV0IHF1ZXN0aW9ucyANCmFyb3VuZCB0
aGlzIHdvcmsgYXJlIHByb2JhYmx5IGJlc3QgYW5zd2VyZWQgYnkgdGhlIGF1dGhvci4gQWRkaW5n
IFBhdmVsIHRvIGNjLg0KDQpQYXZlbCwgZm9yIGNvbnRleHQsIHNlZSBJYW4ncyBPU1NURVNUIHBh
dGNoZXMgdG8gYWNjb21tb2RhdGUgcmVjZW50IGNoYW5nZXMgdG8gDQpsaWJ2aXJ0J3MgYnVpbGQg
c3lzdGVtDQoNCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOS0xMS9tc2cwMDUxNC5odG1sDQoNClJlZ2FyZHMsDQpKaW0NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
