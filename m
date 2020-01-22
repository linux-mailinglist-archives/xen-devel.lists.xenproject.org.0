Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241EC145C3E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 20:08:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuLJz-0007xc-Pk; Wed, 22 Jan 2020 19:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=S3a7=3L=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1iuLJy-0007xX-TR
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 19:05:46 +0000
X-Inumbo-ID: 26aa735c-3d4a-11ea-b833-bc764e2007e4
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26aa735c-3d4a-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 19:05:34 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 22 Jan 2020 19:04:48 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 22 Jan 2020 18:56:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 22 Jan 2020 18:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaDVj6h+YMIU1cEylTTh7Dvvf4po0yL2WJ7iGVreDxxLLIWHUjzgPrt992ZakU3KwzqUzchUhNwX1Py9tSifc3czWSuiWwDvIpHRIJwc5Q46cpPq1A3iQLtBuRwAN41MJ4opEpQLatTaktmkHXeRhhG3q9aTlroQDqNB7xjTtOd5pRcszjBbAaTZU446Sz3bP5W/UfURQh4kMi1qvBbDHvkQXBt1PhWZN5k6YlzWe+jRbQbsm/JQxoaCY0paSvTCelOrr5UASrwS6z9FV6W0KVABUqJjTih88DWGtzCsqwMhS0qhBqMPmnHMrIXgzSfi62+pITP2zxey2EE/D4aFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXA3EkeHE3mMEy+ogOYnao5GbQt6drKy4LDrDIeQmx4=;
 b=EwdgsO6Nl3srmPNDTyjm8RV2QycAWJpWMHSl7L73RiuNbkkdxqj4bD+Ta+OboVzdu/OcRiZcRID/LsKwZlLZ1I+x+a50uzRFcHJQrVfhJcOLC37wprNhzCnqyMMsiFVluplrW2GfaZdkAmz2GYkf+1CAA9vfOUiV0u9t0Nl2LqAaJFE0+/4sCr7sFNsXKjUrVXNrxyVHde2sdNNdZOBehWWxf6aTQ5WvwXJvLLPu+l2VVyEXxc+wzeJc3c3UJwsQtZp0v7ymqdvoj9+vcupCKp+fZUopzA4/VkW6JWPP68annVq//E5AwxbdlQwiO278m2UJ9yXyiV8JDbEOujSm+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3219.namprd18.prod.outlook.com (10.255.137.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Wed, 22 Jan 2020 18:56:59 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4%7]) with mapi id 15.20.2644.028; Wed, 22 Jan 2020
 18:56:58 +0000
Received: from [137.65.135.33] (137.65.135.33) by
 BYAPR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:40::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 18:56:58 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: Juergen Gross <JGross@suse.com>, Kevin Stange <kevin@steadfast.net>,
 xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] libvirt support for scheduler credit2
Thread-Index: AQHV0Hvtf6QEb3pbvkm9aw4Pu75O/af1WQ4AgAGxRwA=
Date: Wed, 22 Jan 2020 18:56:58 +0000
Message-ID: <30aa7949-0294-bfff-cef3-5d8406f8ada8@suse.com>
References: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
 <1e150c03-13fc-edd8-90a9-71ac669965f3@suse.com>
In-Reply-To: <1e150c03-13fc-edd8-90a9-71ac669965f3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [137.65.135.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 115ba612-dc1a-473e-8256-08d79f6cdb9b
x-ms-traffictypediagnostic: BY5PR18MB3219:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB321977403864DFFE1D993805C60C0@BY5PR18MB3219.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(199004)(189003)(5660300002)(81156014)(81166006)(8676002)(110136005)(478600001)(16576012)(71200400001)(31686004)(956004)(36756003)(2616005)(6706004)(2906002)(8936002)(31696002)(66446008)(86362001)(66946007)(66476007)(66556008)(64756008)(6486002)(52116002)(16526019)(316002)(966005)(53546011)(26005)(186003)(3940600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3219;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PXt6IXwEhS/6mUWsd/+kXSLdDZn3fDWx/mabrX4o1r2uTohMFmSBuHpyEEj3OiIg7ePJTNxJ6k6RdKXg+VBX2JiS45cxv2HfYlM4/nEZ427L7zDHFeZxu3lrSEtna8pC/i1lAZICuFaafbMucrPoov6bZyY60C5hF71zx6fcikyqAZjH8ziGCtjQHM+F1RPGTYqrUh2HggKQo8rfzDtrW5xSvY/NQHe/GuEilpb8Zz3jUY1w/B30/r3xrmcmk0oUvM6HTbtoNCrsj0vc+Iyg7toPYq2LtI9cFaSifeqs4ZTwLeh1nnlnDcJ6xjUfvapQ1p+IeLmlFUzB6L4ih4gMMIJff0QdKOMSoQqKewmbty0NWvtgkoU5mlZfizBtqwEHzlL8eg/IEMuYPQntiKWpFVYL/X8f/cvpTWmLZU2M76PtJwKZAl4KPXi1f5FrdneMBXCoxydz/sFqKm/cF2yAZWuVMMhrkaddqn4yEz+TKsFV+jADpF7yBDVr0OHhQwwqKXeP8SFHZUnwabbxHwwR+dGZH9UogTPUgTSz/cireHA=
Content-ID: <CF84413A5A420448AC2FBD8847771376@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 115ba612-dc1a-473e-8256-08d79f6cdb9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 18:56:58.8349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMNQZzSEnP9IZoZpw5VwkDvI+uMU0J/LmrsXzJisd6JEmWE+h2ZcKI7Txt2OAP30TGp8X6fmD80eVPPe6LxZPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3219
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] libvirt support for scheduler credit2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMS8yMCAxMDowNSBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMjEuMDEuMjAg
MTc6NTYsIEtldmluIFN0YW5nZSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IEkgbG9va2VkIGFyb3Vu
ZCBhIGJpdCBhbmQgd2Fzbid0IGFibGUgdG8gZmluZCBhIGdvb2QgYW5zd2VyIHRvIHRoaXMsIHNv
DQo+PiBHZW9yZ2Ugc3VnZ2VzdGVkIEkgYXNrIGhlcmUuDQo+IA0KPiBDYy1pbmcgSmltLg0KPiAN
Cj4+DQo+PiBTaW5jZSBYZW4gNC4xMiwgY3JlZGl0MiBpcyB0aGUgZGVmYXVsdCBzY2hlZHVsZXIs
IGJ1dCBhdCBsZWFzdCBhcyBvZg0KPj4gbGlidmlydCA1LjEuMCB2aXJzaCBkb2Vzbid0IGFwcGVh
ciB0byB1bmRlcnN0YW5kIGNyZWRpdDIgYW5kIHByb2R1Y2VzDQo+PiB0aGlzIHNvcnQgb2Ygb3V0
cHV0Og0KDQpZb3Ugd291bGQgc2VlIHRoZSBzYW1lIHdpdGggbGlidmlydC5naXQgbWFzdGVyLCBz
b3JyeS4gQVRNIHRoZSBsaWJ2aXJ0IGxpYnhsIA0KZHJpdmVyIGlzIHVuYXdhcmUgb2YgdGhlIGNy
ZWRpdDIgc2NoZWR1bGVyLiBIbW0sIGFzIEkgcmVjYWxsIERhcmlvIHdhcyBnb2luZyB0byANCnBy
b3ZpZGUgYSBwYXRjaCBmb3IgbGlidmlydCA6LSkuIEJ1dCBoZSBpcyBxdWl0ZSBidXN5IHNvIGl0
IHdpbGwgaGF2ZSB0byBiZSANCmFkZGVkIHRvIG15IHZlcnkgbG9uZyB0b2RvIGxpc3QuDQoNClJl
Z2FyZHMsDQpKaW0NCg0KPj4NCj4+ICMgeGwgc2NoZWQtY3JlZGl0MiAtZCB5dzZoazdtbzZ6eTNr
OA0KPj4gTmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIElEIFdlaWdodMKgIENhcA0KPj4geXc2aGs3bW82enkzazjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0wqDCoMKgwqAgMTDCoMKgwqAg
MA0KPj4gIyB2aXJzaCBzY2hlZGluZm8geXc2aGs3bW82enkzazgNCj4+IFNjaGVkdWxlcsKgwqDC
oMKgwqAgOiBjcmVkaXQyDQo+Pg0KPj4gQ29tcGFyZWQgdG8gYSBob3N0IHJ1bm5pbmcgY3JlZGl0
Og0KPj4NCj4+ICMgeGwgc2NoZWQtY3JlZGl0IC1kIGd2ejJiMTZzcTM4ZHY5DQo+PiBOYW1lwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgSUQgV2VpZ2h0wqAgQ2FwDQo+PiBndnoyYjE2c3EzOGR2OcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNMKgwqDCoCA4MDDCoMKgwqAgMA0KPj4gIyB2aXJzaCBz
Y2hlZGluZm8gZ3Z6MmIxNnNxMzhkdjkNCj4+IFNjaGVkdWxlcsKgwqDCoMKgwqAgOiBjcmVkaXQN
Cj4+IHdlaWdodMKgwqDCoMKgwqDCoMKgwqAgOiA4MDANCj4+IGNhcMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgOiAwDQo+Pg0KPj4gVHJ5aW5nIHRvIGNoYW5nZSB0aGUgd2VpZ2h0IGRvZXMgbm90aGlu
Zywgbm90IGV2ZW4gcHJvZHVjaW5nIGFuIGVycm9yDQo+PiBtZXNzYWdlOg0KPj4NCj4+ICMgdmly
c2ggc2NoZWRpbmZvIHN5dXhwbHNtZGloY3djIC0td2VpZ2h0IDMwMA0KPj4gU2NoZWR1bGVywqDC
oMKgwqDCoCA6IGNyZWRpdDINCj4+DQo+PiAjIHhsIHNjaGVkLWNyZWRpdDIgLWQgc3l1eHBsc21k
aWhjd2MNCj4+IE5hbWXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBJRCBXZWlnaHTCoCBDYXANCj4+IHN5dXhwbHNtZGloY3djwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIzwqDCoMKgIDQwMMKgwqDC
oCAwDQo+Pg0KPj4gSXMgdGhlcmUgYSB2ZXJzaW9uIG9mIGxpYnZpcnQgd2hlcmUgSSBjYW4gZXhw
ZWN0IHRoaXMgdG8gd29yaywgb3IgaXMgaXQNCj4+IG5vdCBzdXBwb3J0ZWQgeWV0P8KgIEFzIGEg
d29ya2Fyb3VuZCBmb3Igbm93IEkndmUgYWRkZWQgc2NoZWQ9Y3JlZGl0IHRvDQo+PiBteSBjb21t
YW5kIGxpbmUsIGJ1dCBpdCB3b3VsZCBiZSBuaWNlIHRvIGdhaW4gdGhlIGJlbmVmaXRzIG9mIGlt
cHJvdmVkDQo+PiBzY2hlZHVsaW5nIGF0IHNvbWUgcG9pbnQuDQo+Pg0KPiANCj4gDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
