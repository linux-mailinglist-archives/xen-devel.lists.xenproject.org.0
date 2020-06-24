Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB9206DE5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 09:39:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnzzd-00040N-W8; Wed, 24 Jun 2020 07:38:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DbcV=AF=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jnzzc-00040I-J0
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 07:38:48 +0000
X-Inumbo-ID: bc23091e-b5ed-11ea-bb8b-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc23091e-b5ed-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 07:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlMYCRVTpZYZS70lF0PdFrDxP/JszeEJMUpVR5l90gd4k1ZoMewM7LQAJUzsR3FhPbxWZe8LbWbScf4Mvq1GRES6BNVH+a54aE1/o2/wgz9fJblycs46nDSyEWlPCNa1JezKFaDLb2IBFsdIVvrZr/FOBxobExs7wbXE3wtHLQ+igsFCmlXJwNrkN9f8hQ8ju4G4dpgxvZT2PoVd6tlhCoBGyBoT9tOV7cf6rVG6rDH1BlL3IdBKlHe3FFZ3JxXecvOs9DA8OjAGVkU8Yd3GU04IGLzm4/kXlhocf3cuJK/dUpBEhFD6MO7DG0fZAXFSTkmqCxM9ODlKvtDDdUwsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz1Q2ocq/uRC88smFmfIpZof01SF/ZKN9cts21k2DmA=;
 b=hYoZO1q+MZcA8AkKb+H5Zgd0NNe+3Q03EGfEXe3RSn/1FOFpamNr0X8hDKoIdwfEEQGSIS4k4j/pVXzrLA6cjPo6JR+M8Lfo7F2saj9YM2M+7H3T6zdztvZ/XwcUOxj4H3N1EbjEsxW+RVbzBB7aVadgQbarnYPWVYa+DPtNlYJA0E6PHsQDl4/QRZuaGiDIQZNBLoZ/nBDOpxGab0+ixJLJkYJrLA4HG978ck/kDinNoHXdctGb++JB5Tq9l5bBH+BjSTf4UVO1fh5KnhzQl4romTjRm9s/6km2aq1/Witb6yYRdsrCv9cRfAnNm/iojoXcbSMA4g41CmpZKO1PdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz1Q2ocq/uRC88smFmfIpZof01SF/ZKN9cts21k2DmA=;
 b=4YRfrRFEm6Nb1bGnroMb2R8vUyVHDeklHBCdjnWe/u8xe5nO0+Wa8OIpvhcG9Z9aOJcJJsaOHoLKXmt3kWdKwtEjuMYKbN0VSjtQjTKmbo00fFTtypC86qonXlt64XWWB32lpFSSZoCo47c41MCNsOgJMm2bDrmcnkoWVSrCIfPVBxZPus36Gc1aTA7s2R2HDjduLD9QGGx/BuPeAriB6uuBYXv813zuNAoWRgOZzbxt7obHqXQEcXRdvjdODrLeGfT6JQU4E5OXSPjjGtFVPT+cxgPzX43bTX6h7PqVEa/TIJ5hn+1zdZ09fbb8xjazQkNsrezac28WyrikXouTnA==
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com (2603:10a6:20b:25::20)
 by AM6PR03MB4277.eurprd03.prod.outlook.com (2603:10a6:20b:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 07:38:44 +0000
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c]) by AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 07:38:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAWPDgIAEUtgAgAAGgYCAAAHAgIAANpaAgAB+IgCAAEYyAIABnlyAgAAOqgCAAALEAIAAAnuAgAADfIA=
Date: Wed, 24 Jun 2020 07:38:44 +0000
Message-ID: <c1310174-1b9f-ce5b-fb90-0665068f9e49@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
 <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
 <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
 <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
 <DB6PR0402MB27601E1DDED18CDBF3D6A18188950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <273d5fe8-dac9-6375-77df-e24f56066cfe@epam.com>
 <DB6PR0402MB27601AFCF42050A4CC1372B588950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB27601AFCF42050A4CC1372B588950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19814bb4-bf10-46c1-b1e6-08d818119f90
x-ms-traffictypediagnostic: AM6PR03MB4277:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB42770452B8E13ECEBB5E3FDAE7950@AM6PR03MB4277.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCsC+EZH2Dof+Q3ZAMJbMncLQZpJ7Ht0AGs9QDQq8vkuz/z+lYSFXGDFoZjAuZrchwYxxFCNfZ/x9ikUVmVGuMxIaJy6t8Jtc9Z4TIFUnUxDG3BPtG1NPqtqO6baUQdNJrdFDki2f0TD/e/R7f7YHJo1PtvIX4fjVfiaamna1uBmYCY+yjL3AhUc6bUceeMDzwuN+aYpIQarVxuynwgW6/BHD9kIKyNFbp8fZ39X9NCO6QrKJ4hppl2bKVWZtxNmmtzWyOwxzjWiBRmR6dobWHbOGelxRlMPv08eHA3MJZF+1y8JldrdILADohgdonf861k9Vu1mj5nL51tqFzwqaA4CodjZRjq45BIzGWyvv6zZxxqiJDf3dTpIXCHJ338AKeVd5cd97N0LptHmK7uJ3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3991.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(7416002)(86362001)(2616005)(5660300002)(66476007)(66946007)(64756008)(66556008)(66446008)(31696002)(316002)(76116006)(6486002)(26005)(4326008)(31686004)(966005)(6512007)(45080400002)(478600001)(8936002)(186003)(36756003)(8676002)(6506007)(2906002)(110136005)(53546011)(71200400001)(83380400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ibmXI6EXbFyVh2PvqpQtKR1yWixzNmFwy5ChtCDOlpmef/X9rmQOAfpKZuIeaTSgzRuUxc500vqQthFYviQY1iruRcu7AdmsPmK4R8JTEbQ5Qf3xwjBBGMctWSEd/nuNr4G7rkTdp9BZeyBc2eWrsTBZ9mcvlyXMrEvuBhi4JeZn8mrNG/Dlnhms4zFlJ/hY0voxxI5SKYwW0NY1DBJpwKh5FZUzVVZftNWQCNnwvuMnLslRe1kYS9h5JSN/vQ0iZmuP7XMR83AEbvtxYJ+bpnhOKUylFjDHsJfv28/m/kEuJvHRU1WJX92V7tjtNYQUeDtEq01IDz4WQ+nHSXUY58iojfjClcuYZBtvNwbo6r1yVhQVYbNuIZeewIDpog1GSd/FJopfBDDm9YcDU5MzYNnInEdKFsevM3b+E9nqB7v+bSLQjFM4R6RcMqfvB1C8mxaMhmxJ8KTyeV7UwYVyt44Z4emGbhaYkMh61b0sd0g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F194DBD00575249A82937BF70C94C59@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19814bb4-bf10-46c1-b1e6-08d818119f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:38:44.2546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/94m01EQap+0Hl4myEDzllBteJxt9HOVS403j4uWPIdV4QWoSg+Bz8Fx8cgZwlriJIP4bKeNnIgafx7/KJNh16FnCYJ6K7LgYGoDmi6ZfXebklkhj4Mk4pwhlmlJ3zA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4277
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzI0LzIwIDEwOjI2IEFNLCBQZW5nIEZhbiB3cm90ZToNCj4+IFN1YmplY3Q6IFJlOiBV
RUZJIHN1cHBvcnQgaW4gQVJNIERvbVVzDQo+Pg0KPj4NCj4+IE9uIDYvMjQvMjAgMTA6MDcgQU0s
IFBlbmcgRmFuIHdyb3RlOg0KPj4+PiBTdWJqZWN0OiBSZTogVUVGSSBzdXBwb3J0IGluIEFSTSBE
b21Vcw0KPj4+Pg0KPj4+Pg0KPj4+PiBPbiA2LzIzLzIwIDg6MzEgQU0sIE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gT24gNi8yMy8yMCA0OjIwIEFNLCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQo+Pj4+Pj4gT24gTW9uLCAyMiBKdW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4+Pj4+Pj4+PiBGb3IgdGhlIGZpcnN0IHBhcnQgKF9fWEVOX0lOVEVSRkFDRV9WRVJT
SU9OX18pIEkgdGhpbmsgd2UgY2FuDQo+Pj4+Pj4+Pj4+IHByb3ZpZGUgaXQgdmlhDQo+Pj4+Pj4+
Pj4+DQo+Pj4+Pj4+Pj4+IENGTEFHUyBvciBzb21ldGhpbmcuIFRoaXMgY2FuIGFsc28gYmUgZG9u
ZSBmb3IgdGhlIGxvY2F0aW9uIG9mDQo+Pj4+Pj4+Pj4+IFhlbiBoZWFkZXJzLg0KPj4+Pj4+Pj4+
IF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gc2hvdWxkIHdvcmsgdGhyb3VnaCB0aGUgQ0ZMQUdT
Lg0KPj4gQW4NCj4+Pj4+Pj4+PiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBhbGxvdyB0aGUgdXNl
ciB0byBzcGVjaWZ5IHRocm91Z2ggdGhlDQo+PiBLY29uZmlnLg0KPj4+Pj4+Pj4gWW91IG1lYW4g
c3BlY2lmeWluZyB2aWEgS2NvbmZpZyBzb21ldGhpbmcgbGlrZSAiMHgwMDA0MGQwMCI/DQo+Pj4+
Pj4+IFBvc3NpYmx5IHllcy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4+IEFuZCB3aGF0IGFib3V0IHRoZSBo
ZWFkZXJzPyBIb3cgd2lsbCB3ZSBwcm92aWRlIHRoZWlyIGxvY2F0aW9uIGlmDQo+Pj4+Pj4+PiB3
ZSBkZWNpZGUgbm90IHRvIGluY2x1ZGUgdGhvc2UNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBpbiB0aGUg
dHJlZT8NCj4+Pj4+Pj4gSSB3b3VsZCBkbyB0aHJvdWdoIEtjb25maWcgYXMgd2VsbC4NCj4+Pj4+
PiBJZiB3ZSBzcGVjaWZ5IHRoZSBleHRlcm5hbCBsb2NhdGlvbiBvZiB0aGUgWGVuIGhlYWRlcnMg
dmlhIEtjb25maWcsDQo+Pj4+Pj4gaXQgc2VlbXMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgYmUgYWJs
ZSB0byBkZXRlY3QgdGhlIGludGVyZmFjZQ0KPj4+Pj4+IHZlcnNpb24gYXV0b21hdGljYWxseSBm
cm9tIGFueSBNYWtlZmlsZSBhcyBwYXJ0IG9mIHRoZSBidWlsZC4gTm8NCj4+Pj4+PiBuZWVkIHRv
IGFzayB0aGUgdXNlci4NCj4+Pj4+Pg0KPj4+Pj4+IEhvd2V2ZXIsIGlmIE9sZWtzYW5kciBpcyB0
aGlua2luZyBvZiB1c2luZyB0aGUgWGVuIGhlYWRlcnMgZm9yIHRoZQ0KPj4+Pj4+IGh5cGVyY2Fs
bHMgZGVmaW5pdGlvbnMsIHRoZW4gSSB0aGluayB3ZSBtaWdodCBub3QgbmVlZCBleHRlcm5hbA0K
Pj4+Pj4+IGhlYWRlcnMgYXQgYWxsIGJlY2F1c2UgdGhhdCBpcyBhIHN0YWJsZSBpbnRlcmZhY2Us
IGFzIEp1bGllbiB3cm90ZS4NCj4+Pj4+PiBXZSBjb3VsZCBqdXN0IGRlZmluZSBvdXIgb3duIGZl
dyBoZWFkZXJzIGZvciBqdXN0IHdoYXQgeW91IG5lZWQNCj4+Pj4+PiBsaWtlIExpbnV4DQo+Pj4+
IGRvZXMuDQo+Pj4+PiBUaGlzIGlzIGEgZ29vZCBpZGVhOiBJJ2xsIHRyeSB0byBnZXQgdGhlIG1p
bmltYWwgc2V0IG9mIGhlYWRlcnMgZnJvbQ0KPj4+Pj4gTGludXgNCj4+Pj4+DQo+Pj4+PiBpbnN0
ZWFkIG9mIFhlbiBhcyB0aG9zZSBzZWVtIHRvIGJlIHdlbGwgcHJlcGFyZWQgZm9yIHN1Y2ggYSB1
c2UtY2FzZS4NCj4+Pj4+IFRoaXMNCj4+Pj4+DQo+Pj4+PiB3YXkgd2UnbGwgaGF2ZSBoZWFkZXJz
IGluIFUtYm9vdCB0cmVlIGFuZCBndWFyYW50ZWUgdGhhdCB3ZSBoYXZlIGENCj4+Pj4+IG1pbmlt
YWwNCj4+Pj4+DQo+Pj4+PiBzdWJzZXQgd2hpY2ggaXMgZWFzaWVyIHRvIG1haW50YWluLiBJJ2xs
IGtlZXAgeW91IHVwZGF0ZWQgb24gdGhlDQo+Pj4+PiBwcm9ncmVzcw0KPj4+PiBXZSd2ZSBtYW5h
Z2VkIHRvIHN0cmlwIHRoZSBoZWFkZXJzIGFuZCByZW1vdmUgX19YRU5fXyBhbmQgdGhlIHJlc3QN
Cj4+Pj4gZGVmaW5pdGlvbnMNCj4+Pj4NCj4+Pj4gd2Ugd2VyZSB0YWxraW5nIGFib3V0LiBTbywg
dGhlc2UgYXJlIG5vdyB0aGUgbWluaW1hbCByZXF1aXJlZCBzZXQgb2YNCj4+Pj4gaGVhZGVycw0K
Pj4+Pg0KPj4+PiB0aGF0IGFsbG93cyBVLWJvb3QgdG8gYnVpbGQgc2VyaWFsIGFuZCBibG9jayBk
cml2ZXJzLiBQbGVhc2UgdGFrZSBhDQo+Pj4+IGxvb2sgYXQgWzFdDQo+Pj4+DQo+Pj4+IFB1bGwg
cmVxdWVzdCBmb3IgY29tbWVudHMgaXMgYXQgWzJdDQo+Pj4gVGhlIFUtQm9vdCBuZXcgbWVyZ2Ug
d2luZG93IHdpbGwgYmUgb3BlbiBpbiAyMDIwLzcvMSwgc28gSSdkIHN1Z2dlc3QNCj4+PiB0aGUg
cGF0Y2hzZXQgZ29lcyB0byBVLUJvb3QgbWFpbCBsaXN0IGZvciBkaXNjdXNzaW9uIGlmIHlvdSB3
YW5uYSB0aGUNCj4+PiBwYXRjaGVzIGdvbm5hIG1lcmdlZCBzb29uLg0KPj4gV2UgZGVmaW5pdGVs
eSB3YW50IHRoZSBwYXRjaGVzIHRvIGJlIHVwc3RyZWFtZWQgYW5kIG1lcmdlZCwgYnV0IGJlZm9y
ZQ0KPj4gdGhhdA0KPj4NCj4+IHdlIGFsc28gd2FudCB0byBtYWtlIHN1cmUgdGhhdCBYZW4gY29t
bXVuaXR5IGlzIGhhcHB5IHdpdGggd2hhdCB3ZQ0KPj4gdXBzdHJlYW0NCj4+DQo+PiBJIGJlbGll
dmUgd2UgcmVzb2x2ZWQgbW9zdCBvZiB0aGUgY29uY2VybnMgc3VjaCBhcyBoZWFkZXJzLCBQSUUg
ZXRjLCBzbyB0aGlzDQo+PiBjYW4NCj4+DQo+PiBiZSBkb25lLg0KPj4NCj4+IEJUVywgUGVuZywg
ZGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHRyeSB0aGUgcHZibG9jayBkcml2ZXIgeWV0Pw0KPiBO
b3QgeWV0LiBJIGNvdWxkIGhhdmUgdGltZSB0byBnaXZlIGEgdGVzdCBuZXh0IE1vbmRheS4gSSB0
aGluayB5b3Ugbm90DQo+IGVuYWJsZSBTUEwsIHJpZ2h0Pw0KDQpObywgd2UgZGVjaWRlZCB0aGF0
IHdlIGNhbiBydW4gd2l0aCBVLWJvb3QgcHJvcGVyLCBzbyB3ZSBjYW4gaGF2ZSBtb3JlDQoNCmZs
ZXhpYmlsaXR5IGNvbXBhcmluZyB0byB3aGF0IHdlIGhhdmUgaW4gU1BMLiBJdCBzZWVtcyB0aGF0
IHdhcyB0aGUgcmlnaHQNCg0KYXBwcm9hY2g6IHlvdSBjYW4ganVtcCB0byBMaW51eCBvciB5b3Ug
Y2FuIGp1bXAgdG8gdGhlIFUtYm9vdCBwcm92aWRlZA0KDQpieSBBbmRyb2lkIGFueXdheSwgd2hh
dGV2ZXIgeW91ciBzZXR1cA0KDQo+ICAgU28gYW5kcm9pZCBkdWFsIGJvb3Rsb2FkZXIgZmVhdHVy
ZSBub3QgZW5hYmxlZC4NCg0KSSB0aGluayB0aGlzIHN0ZXAgd2lsbCBkZXBlbmQgb24gdGhlIHVz
ZS1jYXNlIHlvdSBoYXZlOiBhdCB0aGUgbW9tZW50IHdlIGhhdmUNCg0KYSBiYXNlIGJ1aWxkIGNh
cGFibGUgb2YgYm9vdGluZyBMaW51eCBrZXJuZWwsIGJ1dCB0aGlzIGNhbiBlYXNpbHkgYmUgZXh0
ZW5kZWQgd2l0aA0KDQpzcGVjaWZpYyBkZWZjb25maWcgdG8gYnVpbGQgaW4gYm9vdGEgY29tbWFu
ZCBvciB3aGF0ZXZlciBlbHNlIGlzIHJlcXVpcmVkLg0KDQo+IEJ1dCBTUEwgbW9zdGx5IG5vdCBo
YXZlIE1NVSBlbmFibGVkLi4NCj4NCj4gUmVnYXJkcywNCj4gUGVuZy4NCj4NCj4+PiBSZWdhcmRz
LA0KPj4+IFBlbmcuDQo+Pj4NCj4+Pj4+PiBJZiB5b3UgY2FuIGRvIHRoYXQsIEkgdGhpbmsgaXQg
d291bGQgYmUgYmV0dGVyIGJlY2F1c2Ugd2UgZGVjb3VwbGUNCj4+Pj4+PiB0aGUgVUJvb3QgYnVp
bGQgZnJvbSB0aGUgWGVuIGJ1aWxkIGNvbXBsZXRlbHkuIFdlIGRvbid0IGV2ZW4gbmVlZA0KPj4+
Pj4+IHRoZSBYZW4gdHJlZSBjaGVja2VkIG91dCB0byBidWlsZCBVQm9vdC4gSXQgd291bGQgYmUg
YSBodWdlDQo+Pj4+Pj4gYWR2YW50YWdlIGJlY2F1c2UgaXQgbWFrZXMgaXQgZmFyIGVhc2llciB0
byBidWlsZC10ZXN0IGNoYW5nZXMgZm9yDQo+Pj4+Pj4gb3RoZXJzIGluIHRoZSBjb21tdW5pdHkg
dGhhdCBkb24ndCBrbm93IGFib3V0IFhlbiBhbmQgYWxzbyBpdA0KPj4+Pj4+IGJlY29tZXMgZmFy
IGVhc2llciB0byBpbnRlZ3JhdGUgaW50byBhbnkgYnVpbGQgc3lzdGVtLg0KPj4+PiBbMV0NCj4+
Pj4NCj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2V1cjAxLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMqM0EqMkYqMkZ1cmxkZWZfXztKU1Vs
ISFHRl8yOWRiY1FJVUJQQSFrSmhXRnI1Wk9fVVduMm9EX0k5cERmbm42NHBaWHcxWkJ0QVNzeFM5
QVp3Ykc2NTA5M1p5ZHRsVlB5NmJhUHk0b2VGOTU3R0JOQSQNCj4+IGVuc2UuY29tJTJGdjMlMkZf
X2h0dHBzJTNBJTJGJTJGZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jDQo+PiBv
bSUyRiUzRnVybCUzRGh0dHBzKjNBKjJGKjJGZ2l0aHViX18lM0JKU1VsISFHRl8yOWRiY1FJVUJQ
QSFtd2kNCj4+IGIzdW42LXZZQkc2OHpNZnVyVzYtME11dUVSNXRObUp0T2l0RHBWaUlDTmtYMGxo
aWc4aVBIbVpva3VNLUJMUQ0KPj4gWXBlS1lBR1ElMjQmYW1wO2RhdGE9MDIlN0MwMSU3Q3Blbmcu
ZmFuJTQwbnhwLmNvbSU3Qzk1MGQ5YzBhDQo+PiBkYzUxNDkyN2NlOGIwOGQ4MTgwZWE0ZWYlN0M2
ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3Qw0KPj4gMCU3QzAlN0M2MzcyODU3OTg0
NjA1NjM5MTQmYW1wO3NkYXRhPWZNckklMkZRb3RrbkNzWFYwYW1DNEJGbA0KPj4gMUhnNHZQdzN6
T01WZEFWaW0yV2NzJTNEJmFtcDtyZXNlcnZlZD0wIC4NCj4+IGNvbSUyRmFuZHIyMDAwJTJGdS1i
b290JTJGdHJlZSUyRnB2YmxvY2tfdXBzdHJlYW1fdjEmYW1wO2RhdGE9MA0KPj4gMiU3QzAxJTdD
cGVuZy5mYW4lNDBueHAuY29tJTdDNDA3ZDhhZjI0YTM2NDgzZmJkY2UwOGQ4MTgwNWVkODgNCj4+
Pj4gJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzI4NTc2
MTAyMQ0KPj4gOTc1DQo+PiAxNjQmYW1wO3NkYXRhPTV2V2ZCYkxTY0lDWFBaV1UlMkJVM2I3RHlP
TmNneFQ4aUlDc3hyd1ViT1JaWSUNCj4+Pj4gM0QmYW1wO3Jlc2VydmVkPTANCj4+Pj4NCj4+Pj4g
WzJdDQo+Pj4+DQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9ldXIwMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzKjNBKjJGKjJGdXJsZGVm
X187SlNVbCEhR0ZfMjlkYmNRSVVCUEEha0poV0ZyNVpPX1VXbjJvRF9JOXBEZm5uNjRwWlh3MVpC
dEFTc3hTOUFad2JHNjUwOTNaeWR0bFZQeTZiYVB5NG9lRjk1N0dCTkEkDQo+PiBlbnNlLmNvbSUy
RnYzJTJGX19odHRwcyUzQSUyRiUyRmV1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Yw0KPj4gb20lMkYlM0Z1cmwlM0RodHRwcyozQSoyRioyRmdpdGh1Yl9fJTNCSlNVbCEhR0ZfMjlk
YmNRSVVCUEEhbXdpDQo+PiBiM3VuNi12WUJHNjh6TWZ1clc2LTBNdXVFUjV0Tm1KdE9pdERwVmlJ
Q05rWDBsaGlnOGlQSG1ab2t1TS1CTFENCj4+IFlwZUtZQUdRJTI0JmFtcDtkYXRhPTAyJTdDMDEl
N0NwZW5nLmZhbiU0MG54cC5jb20lN0M5NTBkOWMwYQ0KPj4gZGM1MTQ5MjdjZThiMDhkODE4MGVh
NGVmJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MNCj4+IDAlN0MwJTdDNjM3
Mjg1Nzk4NDYwNTYzOTE0JmFtcDtzZGF0YT1mTXJJJTJGUW90a25Dc1hWMGFtQzRCRmwNCj4+IDFI
ZzR2UHczek9NVmRBVmltMldjcyUzRCZhbXA7cmVzZXJ2ZWQ9MCAuDQo+PiBjb20lMkZ4ZW4tdHJv
b3BzJTJGdS1ib290JTJGcHVsbCUyRjImYW1wO2RhdGE9MDIlN0MwMSU3Q3BlbmcuZmENCj4+IG4l
NDBueHAuY29tJTdDNDA3ZDhhZjI0YTM2NDgzZmJkY2UwOGQ4MTgwNWVkODglN0M2ODZlYTFkM2Jj
MmI0DQo+PiBjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcyODU3NjEwMjE5NzUxNjQm
YW1wO3NkYXRhPSUyDQo+PiBGbVhoZUV2S3NzTGpqYUZLc0hCQmJxaCUyQjcyakgzdVFuRTdjcE4w
SjNrOEklM0QmYW1wO3Jlc2VydmVkPTA=

