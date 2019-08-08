Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB485BB8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:42:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvd1F-0003di-FD; Thu, 08 Aug 2019 07:39:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvd1D-0003dU-Na
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:39:27 +0000
X-Inumbo-ID: a10726a3-b9af-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a10726a3-b9af-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 07:39:26 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:39:06 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 07:35:43 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 07:35:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffKvZCBo6W/nkUKusVHUUK8zQ8q4TlwCpoMZ5fTj6pArbXHowy5NRZsbp4bHcWNKzIAs77KsbxLzOb4PKJiQSFhrJol4jxLDYho85vFL/EkVe1bMZIvv2LnU+6WdsFrnQTdyLT8ShSrDAMIabgH57veDcy62Kwvliij7h2FTP7A7eOmbGvXHvRyqC1wmY4skQqxTT9Pk/QyFbGVTun+cCFxWEs1/AX8ZYmPsCW8Ta5Awt0cYF3MzEw5tesAOVDHOgClEFKVX8IjwjiBrqVT4e/D2jAW01Ql8Ux5wVKkjvHdfkMFcje/qhHLwJUt3bO9sgO2k5FvpbyPjAHPYPV3nBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaNR5ijRICDMK3qbDtG6Lmn/Zhdbg7gZlU9gW4uzP1k=;
 b=ZMCP/bBdxMo8jiFfa2/2zosjxPQA0aydf98tYohmEhZif+hMsNO/nzKyVqr9MVwIUZdKU30n8AthsKg9a4xc5WlV+38hNUn6VLEmYCvejW2vFNKrJB6aa711zntPsR46Om5SqNkJhQBofEGpREDhAJSBnh/um4D50MmqjlmUeGwVI8YNxd4GlylHP/xnFqwmi6PvitrL2sw1aBoCl3sY3dVbqym2w1auvXQPH6J2kC83w/NvgJc1cOlNFO5Tc7qijyl1Qp41lqNhFrZO4TgXcyJI6h7xBqrUocPWzblheWlHs8sQdK5UTrdlFJrcognz20NcDiwbaesuR5ovd2seBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 07:35:40 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:35:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG option
Thread-Index: AQHVTSzXKk23fauQiUyiEfLANmxBAKbw7fkA///sPUaAAAMtgA==
Date: Thu, 8 Aug 2019 07:35:40 +0000
Message-ID: <686598d3-b09f-fbad-6115-71188c5ab28c@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-3-jgross@suse.com>
 <ab0314ec-9af8-e1b3-343c-b7183152418d@suse.com>
 <0db0162e-6d43-7540-4d4a-c53605b57eeb@suse.com>
In-Reply-To: <0db0162e-6d43-7540-4d4a-c53605b57eeb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0061.eurprd05.prod.outlook.com
 (2603:10a6:208:be::38) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69d3d085-2767-4f31-88e2-08d71bd3035f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3405; 
x-ms-traffictypediagnostic: MN2PR18MB3405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB3405022AB75E4BDF2423A713B3D70@MN2PR18MB3405.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(189003)(199004)(64756008)(66476007)(66556008)(66446008)(5660300002)(66946007)(31696002)(76176011)(71190400001)(99286004)(86362001)(6116002)(6486002)(3846002)(256004)(25786009)(7736002)(478600001)(36756003)(14444005)(8936002)(6636002)(305945005)(71200400001)(66066001)(4744005)(52116002)(6246003)(53936002)(316002)(31686004)(229853002)(54906003)(2616005)(446003)(486006)(6862004)(11346002)(4326008)(476003)(80792005)(102836004)(2906002)(37006003)(6506007)(6512007)(53546011)(6436002)(386003)(186003)(81156014)(8676002)(26005)(81166006)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3405;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MNV80VvP2IR6v3BvP17TxOXn5TDYQXTFSGDvp0uyeR7Zv6m8WARSDsiwwUVXZW0staeIhENif7w9KPjGZWjWZQN0gj3LhzWWykJ+KC+4MzVtCE+rc3daW2lMj2zX6lfI4K3ONOgdeM4DG6NU5rCHAATwpfTJkcQq8E7N33Gyce61wzH7bVucn+U7q+IVfUNMdBDNKqNrbg6r8jnDELlYicWUD/gt5hU6yw2GInTNHR0iJHTME5uXrO87twpMzP3IF5Y4N8VybZTjQ6cj/cuiIJyy6lS/lVMlt1hBFyAz9bg16BfyGJCUby//1BcTjM+BYaw5aowu3vOTK2gPmVtjqoIJpKf48FAA3anl2sHYTqtOT7VNSFVF3c2nbPw5kL4XhrI0fbtHS77/SjWWdSBpteoZ7uKfBrRPuQ6AZfnGJiA=
Content-ID: <9E3C672E65597E478C3F8DF35F766F38@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d3d085-2767-4f31-88e2-08d71bd3035f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:35:40.7784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHnh6bOfpYwFWeVHNMCH+YbIEe1roazkYhfnZzZx3MiLDSt13E6nVnrKs2nkQwyH+CflA1ZLbTOj8aYJdQ6NyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3405
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG
 option
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAwOToyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDguMDguMTkg
MDg6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiAtLS0gYS94ZW4vS2NvbmZpZy5kZWJ1Zw0KPj4+ICsrKyBiL3hl
bi9LY29uZmlnLmRlYnVnDQo+Pj4gQEAgLTQ0LDYgKzQ0LDEzIEBAIGNvbmZpZyBDT1ZFUkFHRQ0K
Pj4+IMKgwqDCoMKgwqDCoMKgIElmIHVuc3VyZSwgc2F5IE4gaGVyZS4NCj4+PiArY29uZmlnIFNQ
SU5MT0NLX0RFQlVHDQo+Pj4gK8KgwqDCoCBib29sICJTcGlubG9jayBkZWJ1Z2dpbmciDQo+Pj4g
K8KgwqDCoCBkZWZhdWx0IERFQlVHDQo+Pj4gK8KgwqDCoCAtLS1oZWxwLS0tDQo+Pj4gK8KgwqDC
oMKgwqAgRW5hYmxlIGRlYnVnZ2luZyBmZWF0dXJlcyBvZiBzcGlubG9jayBoYW5kbGluZy7CoCBT
b21lIGFkZGl0aW9uYWwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGNoZWNrcyB3aWxsIGJlIHBl
cmZvcm1lZCB3aGVuIGFjcXVpcmluZyBhbmQgcmVsZWFzaW5nIGxvY2tzLg0KPj4+ICsNCj4+PiDC
oCBjb25maWcgTE9DS19QUk9GSUxFDQo+Pg0KPj4gV2hpbGUgdGhlIHByZS1leGlzdGluZyBMT0NL
X1BST0ZJTEUgc3VnZ2VzdHMgdGhlIG9wcG9zaXRlLCBJJ2QNCj4+IHN0aWxsIGxpa2UgdG8gcHJv
cG9zZSB0aGF0IHdlIHVuaWZvcm1seSBuYW1lIGFsbCBkZWJ1Z2dpbmcNCj4+IG9wdGlvbnMgQ09O
RklHX0RFQlVHXyogKHJhdGhlciB0aGFuIGhhdmluZyB0aGUgREVCVUcgYXQgdGhlDQo+PiBlbmQp
LiBUaG91Z2h0cz8NCj4gDQo+IEZpbmUgd2l0aCBtZS4gSSBjYW4gcmVuYW1lIHRoZSBMT0NLX1BS
T0ZJTEUgb3B0aW9uIGluIHBhdGNoIDQgYXMgSSdtDQo+IHRvdWNoaW5nIGl0IGFueXdheS4NCg0K
T25lIG1vcmUgdGhpbmc6IFBlcmhhcHMgaXQgd291bGQgYmV0dGVyIGJlIERFQlVHX0xPQ0sgKGku
ZS4NCndpdGhvdXQgIlNQSU4iKSBvciBERUJVR19MT0NLUywgdG8gYWxzbyBhbGxvdyBpdCB0byBj
b3ZlciByL3cNCmxvY2tzLCBzaG91bGQgYW55b25lIHdhbnQgdG8gaW5zdHJ1bWVudCB0aGVtIGFz
IHdlbGwuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
