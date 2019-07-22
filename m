Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B527F6FDD0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 12:30:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpVVx-0003BL-LA; Mon, 22 Jul 2019 10:25:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpVVw-0003BG-E3
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 10:25:52 +0000
X-Inumbo-ID: 0bf083ef-ac6b-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bf083ef-ac6b-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 10:25:51 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 10:25:35 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 10:23:33 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 10:23:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acTXW9W+uqPNdl4m7PgWPIrj+9gJsyFNzx+5xbDgLDEAUPpS+6cHPasAlMumD+M0Kuslqy5vtB2QKMZwQgXi401AZ30fwsiU4JmYXbP4wTu9Wqn6N7Ybd1wvQ0nUcUCyQw9jBHxSfz6PJ4Y1Q5s/e+YiFcnSzpgvTH3n/NEJqHJGeaKlq98GIRyfiA1kGG+5bC74sKPvdULQ4GicbALlHisPUt9zCU/5wYsTabrw/hRN1b8rCSCk9W+0nwF3WeiQxt4rGHhDBRgEDGCrkVACJ34DbQQsQETsv0vdUUqpHDh4zOAWMdpB8n7xZtI1uXGY5Tge4mMNjGVyEOYMAxR/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgFAEco8JZuZ5XtVSPYhybBcyYshCKzGQHV5tok0Epg=;
 b=OyyEffGwRh3Fc9jygEyVcy3C2yPJIw6shfGT7somXWrjiLnQapDBPyNqqP2PO2+hBD+eOHQNF/DIDtMB8tRLoVbeXuuah4P+TlHl0L0ZPh33IE3VBkeAcXuOn4LctjJi74H7dXtAiRitayzDc16rfupApkwklRCXycQpgj4iTVtbM+tVhVIBpTJK1+QBvjev4qkNfbJT6VO15efY+U+z/cxtOwldvnmKt3X89YV9oEpzRKltPnV8e2NU1ifNSLDwa4Y1cEatTDxLVJ9+XSjTmQzPQ64GUYyGMS5XjGQnbFLduqgcZaNI92JuFbODQrdoUfJkFyQaPthswWBmzI0E6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3274.namprd18.prod.outlook.com (10.255.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 10:23:31 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 10:23:31 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [PATCH] vunmap: let vunmap align virtual address by itself
Thread-Index: AQHVPhWLg4cyYnQWKUW8aYX9saIQuqbWZDjPgAAOmQA=
Date: Mon, 22 Jul 2019 10:23:31 +0000
Message-ID: <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
In-Reply-To: <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f680f7d-d593-4bd6-f9ae-08d70e8ea510
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3274; 
x-ms-traffictypediagnostic: DM6PR18MB3274:
x-microsoft-antispam-prvs: <DM6PR18MB3274B849AE9D9A07994EF153B3C40@DM6PR18MB3274.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(199004)(189003)(14454004)(6436002)(7416002)(486006)(99286004)(446003)(53936002)(14444005)(6116002)(6512007)(305945005)(3846002)(8676002)(478600001)(11346002)(2616005)(25786009)(6486002)(7736002)(316002)(8936002)(256004)(66066001)(52116002)(476003)(86362001)(26005)(53546011)(6506007)(386003)(31696002)(71200400001)(102836004)(71190400001)(66946007)(36756003)(76176011)(31686004)(68736007)(66476007)(66556008)(64756008)(66446008)(6916009)(5660300002)(54906003)(81156014)(81166006)(2906002)(229853002)(80792005)(186003)(4326008)(6246003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3274;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 98OnUSeGH9Mz/NRoaVbwv0wEumX0wuItSPJqMSnzNzEdKyi+mgpy3hpzaLwELI+byDvMj0BzPA0GV6TDepYGa7hcKXPvdrSaYneeD0AIbMG1z51Lu2EJBWj+UNmyv/k6QTvGB4AZqeizSuUfiw5sIVqebphuB2/9MJDQWgHjYQLQfgt4FhSI3mKSnoOc/VW5/6Cyfd/iEkPsBpiXLZ/1hkIzM+FXD7a68lcvFzeo4XcR5IPbPkHfpeME9/6PU6R4YxW//pUn8yk/ni8TRet84Pa5FZIRJkF6EMGzOCRQuEQwoylYIQ35lF/HgGQQHLJ+gytC4/Al7Bu1bPKvQlDhRLv3t990X/r1+0j396Fva00lzooV1I3Up7xEwc0aLoCPmJXCX009Lgngs3PJqYsBL5X1E82aectEuZTz18ru4Nw=
Content-ID: <00674AD11C516C47966B6AEB2C540D65@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f680f7d-d593-4bd6-f9ae-08d70e8ea510
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 10:23:31.6251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3274
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxMTozMCwgQW5kcmlpIEFuaXNvdiB3cm90ZToNCj4gDQo+IA0KPiBPbiAx
OS4wNy4xOSAxMjozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxOC4wNy4yMDE5IDE5OjEx
LCBBbmRyaWkgQW5pc292IHdyb3RlOg0KPj4+IExldCB2dW5tYXAgYWxpZ24gcGFzc2VkIHZpcnR1
YWwgYWRkcmVzcyBieSBQQUdFX1NJWkUuDQo+Pg0KPj4gRGVzcGl0ZSBzZWVpbmcgQW5kcmV3J3Mg
Ui1iIHlvdSd2ZSBhbHJlYWR5IGdvdCBJJ2QgbGlrZSB0byBwb2ludCBvdXQNCj4+IHRoYXQgdGhp
cyBpbmNyZWFzZXMgdGhlIHJpc2sgb2Ygc29tZSBjb2RlIHBhc3NpbmcgdGhlIHdyb25nIHBvaW50
ZXINCj4+IGludG8gaGVyZS4geyx1bn1tYXBfZG9tYWluX3BhZ2UoKSBhY3Qgb24gc2luZ2xlIHBh
Z2VzIG9ubHksIHNvIHRoZXJlJ3MNCj4+IG5vIGFtYmlndWl0eS4gV2hlbiB0YWxraW5nIGFib3V0
IG11bHRpLXBhZ2UgcmVnaW9ucyB0aG91Z2gsIG5vdCB1bmRvaW5nDQo+PiBhcml0aG1ldGljIHBy
ZXZpb3VzbHkgZG9uZSBtYXkgbWVhbiBhY3R1YWxseSBwb2ludGluZyBhdCBvdGhlciB0aGFuIHRo
ZQ0KPj4gZmlyc3QgcGFnZSBvZiB0aGUgbWFwcGluZy4NCj4gDQo+IFdlbGwsIHdoYXQgd2UgYXJl
IG1vdmluZyBpbnRvIHZ1bm1hcCgpLCBpcyBhIHBhZ2UgYWxpZ25tZW50IG9ubHkuIEl0IGNhbid0
IHNhdmUgdXMgZnJvbSB0aGUgd3JvbmcgcG9pbnRlciwgZXZlbiBpZiBpdCBpcyBkb25lIG91dHNp
ZGUgdGhlIHZ1bm1hcCgpLg0KPiANCj4+PiBXaXRoIHRoZSBtYWluIGNoYW5nZSwgYWxzbzoNCj4+
PiDCoMKgIC0gc3RyaXAgYWxsIGV4aXN0aW5nIHZ1bm1hcCgpIGNhbGxzIGZyb20gcHJpb3IgbWFz
a2luZw0KPj4NCj4+IF9JZl8gd2UgYXJlIHRvIGdvIHRoaXMgcm91dGUsIHRoZW4gdW5tYXBfZG9t
YWluX3BhZ2VfZ2xvYmFsKCkNCj4+IGNhbGxlcnMgc2hvdWxkIGFsc28gYmUgYWRqdXN0ZWQuIFRo
ZXJlLCBhcyBmb3IgdW5tYXBfZG9tYWluX3BhZ2UoKSwNCj4+IEkgYWdyZWUgaXQgd291bGQgbWFr
ZSBzZW5zZSB0byBiZSBtb3JlIHRvbGVyYW50Lg0KPiANCj4gSSd2ZSBmb3VuZCB0d28gcGFnZSBh
bGlnbm1lbnRzIHByaW9yIHRvIGB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoKWAgY2FsbC4gU2hv
dWxkIEkgd2lwZSB0aGVtIGluIHRoaXMgcGF0Y2gsIG9yIGluIHNlcGFyYXRlPw0KDQpJZiB3ZSdy
ZSB0byBnbyB0aGUgc3VnZ2VzdGVkIHJvdXRlIHRoZW4gaXQgbWlnaHQgbm90IG1hdHRlciBtdWNo
Lg0KQXMgSSdtIG5vdCBlbnRpcmVseSBjZXJ0YWluIHlldCB0aGF0IHdlIHdpbGwsIG1ha2luZyB0
aGlzIGEgcHJlcmVxDQpvbmUgZGVhbGluZyB3aXRoIHRoZSBhbGlnbm1lbnQgaW4gdW5tYXBfZG9t
YWluX3BhZ2VfZ2xvYmFsKCkgbWlnaHQNCmJlIGJldHRlci4gWW91ciBleGlzdGluZyBwYXRjaCB3
b3VsZCB0aGVuIGZ1cnRoZXIgc2hpZnQgdGhpcyBpbnRvDQp2dW5tYXAoKS4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
