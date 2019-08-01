Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5927DBE4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:49:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htATY-0005T3-E2; Thu, 01 Aug 2019 12:46:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htATX-0005Sy-D4
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:46:31 +0000
X-Inumbo-ID: 53015060-b45a-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 53015060-b45a-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 12:46:30 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  1 Aug 2019 12:46:05 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 1 Aug 2019 12:43:15 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 1 Aug 2019 12:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5/edEi9UjYH7g7O/HdQbWwci8HzX+1qUYo0Hu6NsTlmXlcFmZVwML5WCbrtNCHhurYwWXkqJqwDUMqzoFyRZKkpsPE1B4vcP+Mx0WyOB6VU7VSO4hQ5RdH7ncZDv12LS43YPYISTU1z8r9iUQqb0zb11J0EKJIGRwPzejdssTPAW/NduA+Hl1gnQE5TPc5QInU0kvomHjAliCQuSf12/vDchRxBNpxImOPmb9gLmP1dSW4WmCfgQtEAi25Kny54sEhkr1DUt2kCRE8LzXfSFTiVbtWc26EVxfEZR9qNtsNLuhM3UbYS4nQtRoImqxTEqkMU5m+g9L9Bv7aieB/VYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYdJCgnCmMTAIRj+FbOi5eSvUMjPrzqVDADI1sZJo+g=;
 b=BR8CrN/3e7M/QCBf5TLnDMm8/TdmFnf5SkIvldr26J/lDsDTgXJ3W9WNQolIz2MWFg7Og99QNgH96HFnnQrw8kw7JOaSFiTu04vNwgwYEmwwlLOPZ4QD0PKb+mCBOYkuOKEDS4k0l1Nxuw2HR0cucq+68BZI9SW0x18/6YwqDb4oLjMxKtq3tKjP5pgtw8IRq46/Je05QNrx8dlF8COJ40ZJ4GVAqyl3W+AWEaSoLYVeRrgbuYmA66zbdAWx3iuhQ/7WCfhl+Y4X809T14Z6txNNhS6t13Nk7UfnC3Y+OQ5JRwsfCh2bkYyYsqvzseM7m06TqyP2klOJn+S9DdqnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3092.namprd18.prod.outlook.com (10.255.154.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Thu, 1 Aug 2019 12:43:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 12:43:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQeNoBgAADe8CAAAegOoAMhBoBgASM1gCAAAh2qIAAA3yAgANcJ+OAAQAfgIAATfBxgAAHWwA=
Date: Thu, 1 Aug 2019 12:43:13 +0000
Message-ID: <a97515c9-1b8a-d754-da64-203243d70b7b@suse.com>
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
In-Reply-To: <CAOcoXZb8SYbLryapgNmnL3w7oAkyJZtdzM0jRgsvMA=5qtysNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::32) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9a752db-0f05-46e7-4f49-08d7167dd14f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3092; 
x-ms-traffictypediagnostic: BY5PR18MB3092:
x-microsoft-antispam-prvs: <BY5PR18MB3092EE9024262CC06AEF8656B3DE0@BY5PR18MB3092.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(199004)(189003)(3846002)(6116002)(99286004)(8936002)(14444005)(6916009)(229853002)(4326008)(26005)(256004)(6436002)(8676002)(31686004)(25786009)(6246003)(6512007)(2906002)(7416002)(186003)(53936002)(14454004)(80792005)(6486002)(81156014)(81166006)(7736002)(86362001)(486006)(36756003)(305945005)(316002)(66066001)(386003)(53546011)(446003)(2616005)(6506007)(11346002)(76176011)(102836004)(71200400001)(66476007)(66556008)(476003)(68736007)(478600001)(66946007)(54906003)(5660300002)(31696002)(66446008)(52116002)(64756008)(71190400001)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3092;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y3+ZrqhCwYFHFkEmIkEp45o8Y/qBQxPMY9PTpyvFfhM9aVkUuI9NDxJ9v7b34elmeuK1Q72hc2Ho08VMkSDeUQuYdxIwYnAKxVf/PF4pSPJw8ImvsgnRJIKiPE+zjqMkasp+gtYxkaWPHdYdvR916IIpJL/G3yqIR/yXJjR6gMNT+D2SkElj9ahrge+MmkRrM1xB/K41rh1UZ/P1RodL7p4hoXm3DfJVWz/fIgspQkbl1GrG4E/L68M+qALIMPqvs+l0tPDNOnhFkPxACOQ3FbYSl7CczCuAOgYf0CD/Je786DDwXEhTbR3NBPToQ34/p2RW9Pq98/AQTwd3uNkbXt/90yQnkMSYf+OoiMVXy6fr6Z69swBVI35iJyiveIR6bEYGY3IygEiCu2pRUNu0MAZrDhYvZQCC7kPQjUSLdlU=
Content-ID: <3EF8BA8C6BFE0D4A8AAE5CD6D53B49B6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a752db-0f05-46e7-4f49-08d7167dd14f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 12:43:13.7371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3092
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxNDoxNiwgVmlrdG9yIE1pdGluIHdyb3RlOg0KPiBJIGV4cGVjdGVkIHlv
dSB0byBoYXZlIHNvbWUgYXJndW1lbnRzIHdoeSBpdCBjYW5ub3QgYmUgZml4ZWQgaW4gdGhlDQo+
IGRpZmYgb3Igb3RoZXIgdG9vbHMuDQoNCkkgZG9uJ3QgZm9sbG93OiBIb3cgZG9lcyBpdCBtYXR0
ZXIgaGVyZSB3aGV0aGVyIEkgaGF2ZSBhcmd1bWVudHMgdG93YXJkcw0KKG5vdCkgZml4aW5nIGRp
ZmYgZXRjPyBUaGF0J3MgdGhlaXIgbWFpbnRhaW5lcnMnIGFyZ3VtZW50cywgaWYgYW55LCBub3QN
Cm1pbmUuIEFsbCBJIGtub3cgKGZyb20gdGhlIGxhc3QgdGltZSB3ZSd2ZSBiZWVuIGRpc2N1c3Np
bmcgdGhpcykgaXMgdGhhdA0KZXZlbiB1cC10by1kYXRlIGRpZmYgKGF0IHRoYXQgdGltZSBhdCBs
ZWFzdCwgaS5lLiBhIGZldyBtb250aHMgYmFjaykNCnN0aWxsIGJlaGF2ZWQgdGhhdCB3YXkuIFdo
aWNoIG1lYW5zIGlmIGl0IHdhcyBmaXhlZCB0b2RheSwgaXQgd291bGQNCnN0aWxsIGJlIGEgZmV3
IHllYXJzIG91dCBhdCBsZWFzdCB1bnRpbCB3ZSBjb3VsZCBhc3N1bWUgb2xkIGRpZmYgaXNuJ3QN
CmluIHVzZSBhbnltb3JlLg0KDQo+IFRoZSBleGFtcGxlcyBJIG1lYW50IGFyZSBhbnkgcmVhbCBw
YXRjaGVzIGNvZGUgZXhhbXBsZXMgdG8gYmUgdXNlZCBmb3INCj4gdGhpcyBpbnZlc3RpZ2F0aW9u
Lg0KDQpZb3UgY2FuIGVhc2lseSBvYnNlcnZlIHRoZSBhbm9tYWx5IHlvdXJzZWxmLiBZb3UgY291
bGQgYWxzbyBnbyBodW50IGZvcg0KdGhlIHByZXZpb3VzIGRpc2N1c3Npb24uIFRvIG1lLCB0aGlz
IGRpc2N1c3Npb24gYXMgYSB3aG9sZSBoYXMgYWxyZWFkeQ0KdGFrZW4gZmFyIG1vcmUgdGltZSB0
aGFuIGl0IHdvdWxkIHRha2UgdG8gIm1hbnVhbGx5IiBjb21tZW50IG9uIF9tYW55Xw0KcGF0Y2hl
cyB2aW9sYXRpbmcgc3R5bGUuIEknbSBmaW5lIHRvIHByb3ZpZGUgaW5wdXQgaGVyZSwgYnV0IHRo
ZQ0Kb3ZlcmhlYWQgdGltZS0gd2lzZSBuZWVkcyB0byByZW1haW4gcmVhc29uYWJsZS4gQW5kIGFz
IG11Y2ggYXMgSQ0KYXBwcmVjaWF0ZSB5b3UgdG8gaGF2ZSB0YWtlbiBvbiB0aGlzIHRhc2ssIEkg
dGhpbmsgcGFydCBvZiB0aGUgZGVjaXNpb24NCnRvIGRvIHNvIHNob3VsZCBoYXZlIGJlZW4gdG8g
ZmFtaWxpYXJpemUgeW91cnNlbGYgd2l0aCBwcmlvciBkaXNjdXNzaW9ucw0Kb24gdGhlIHN1Ympl
Y3QuDQoNCkFueXdheSAtIGhlcmUgaXMgeW91ciBleGFtcGxlOg0KDQotLS0gdW5zdGFibGUub3Jp
Zy94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCisrKyB1bnN0YWJsZS94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMNCkBAIC0xNTczLDYgKzE1NzMsNyBAQCBmYXVsdDoNCiAgDQogICAgICBmb3IgKCBp
ID0gMDsgaSA8IHBhcnRpYWxfZG9uZTsgaSsrICkNCiAgICAgICAgICB1bm1hcF9jb21tb25fY29t
cGxldGUoJmNvbW1vbltpXSk7DQorICAgICh2b2lkKTA7DQogICAgICByZXR1cm4gLUVGQVVMVDsN
CiAgfQ0KICANCldpdGhvdXQgdGhlIGZ1bmN0aW9uIG5hbWUgdGhlIGNvZGUgYWRkaXRpb24gaXMg
YW1iaWd1b3VzOyBsaW5lIG51bWJlcnMNCmNhbid0IGFsd2F5cyBiZSByZWxpZWQgdXBvbiwgYW5k
IGNvZGUgcmV2aWV3IG9mdGVuIGNhbiBiZSBkb25lIHdpdGhvdXQNCmFjdHVhbGx5IG9wZW5pbmcg
dGhlIGZpbGUgaW4gcXVlc3Rpb24gYW5kIGxvb2tpbmcgYXQgdGhlIHBhdGNoZWQgY29kZQ0KbG9j
YXRpb24uDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
