Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E585C0C1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:59:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyeF-00030W-Rm; Mon, 01 Jul 2019 15:55:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhyeE-00030R-GN
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:55:18 +0000
X-Inumbo-ID: 94d660ee-9c18-11e9-85b8-f3ec141576d6
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94d660ee-9c18-11e9-85b8-f3ec141576d6;
 Mon, 01 Jul 2019 15:55:15 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 15:55:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 15:53:21 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 15:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=w2fZhctGzeb703cH1jwNi1wOlVXNcPZcTriiJsrC0E59F93UekBhnkfgzL/Tfa3/scNKT+bntD3c7IDUn+MMkY9LQ/yNl4I6oCpdDB0AS3L2Szdden47oRrF1x/aMoCtKy7WqkUWeO3mj5uq6lEkdfgNrsIGc5CDrJJvHRiOd/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkMUmQAvuYhBFUXH+t1mx/kuqA2ZwfiuUoUAivE0keo=;
 b=waVkXfh2uGQLv6mkljG4rjhduk/N2OybrNM6i5pyU14Hr5cbFutsKEqjIvqQROMeAp7iCFblScu3ujMAAxWstkxDHjoStavwyrAtilA+MJM/u3bkQz7cpkcptkGk4yuE6pSfsSNXKy/Co5V2Vbqgd55I4aSS2vkacw1UYG7fx7g=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3220.namprd18.prod.outlook.com (10.255.137.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 1 Jul 2019 15:53:18 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 15:53:18 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a2CYCA///QXACAAAtsgIAABLuA
Date: Mon, 1 Jul 2019 15:53:18 +0000
Message-ID: <031156bc-936f-79e0-e1ca-3e49a1274c71@suse.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
 <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
 <e38967e1-1705-5a3f-9601-a9a4b68f3ead@bitdefender.com>
In-Reply-To: <e38967e1-1705-5a3f-9601-a9a4b68f3ead@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1d313e9-63d9-4d23-5b7b-08d6fe3c3c14
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3220; 
x-ms-traffictypediagnostic: BY5PR18MB3220:
x-microsoft-antispam-prvs: <BY5PR18MB3220CBC96BCC6D4B3F3AD9EAB3F90@BY5PR18MB3220.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(189003)(199004)(6512007)(66066001)(52116002)(478600001)(2616005)(71200400001)(71190400001)(36756003)(7736002)(6436002)(66476007)(68736007)(229853002)(66946007)(26005)(73956011)(4326008)(6916009)(186003)(80792005)(66556008)(6486002)(64756008)(66446008)(14444005)(256004)(305945005)(486006)(102836004)(8676002)(6246003)(31686004)(11346002)(7416002)(386003)(53546011)(6506007)(86362001)(5660300002)(81156014)(446003)(8936002)(72206003)(31696002)(6116002)(81166006)(53936002)(3846002)(76176011)(99286004)(14454004)(2906002)(54906003)(476003)(316002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3220;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BVGTRWOWzXmLe3KodeVqyVFeNA9n4E/ZLKpJz8/fFD0ZI05QsNAsUJf1TnXsb8Yu/Z5kOD+gmen7yc24ydxowq0x/rEpY09VMYbtTc5uHfH0NYT1yVTSmwYK3n7miIjdg/OdCf2nWhY7iTFEHY20KSSmzNVVX+weLlyaQpKQgl77+vPBfxUJCN5511ogZPrtn5VQfK9LJjM3juXoPGivB/ILiia9jug6crXGu0cmdU9yb9o/HvsyInDfG2VWex3TXZWMWgOB644otPQ+fTI6szGgM31KqyRpBhGsD8kN+W1SWbNF74xNqqtByZKWED7hnxPU6GgdfS5Ej8k0/HZXe0Pvly58cQ8JaGsK1NpVhgboRFwhThw3+e2SQzUKqWBNms5ubd1WzzoyiLz7yXlJILWe3IEfeNzDvAuHpH91I8k=
Content-ID: <569F7A0DC693B340B6A547A96130CD48@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d313e9-63d9-4d23-5b7b-08d6fe3c3c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:53:18.2201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3220
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: Wei Liu <wl@xen.org>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 PaulDurrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>, Roger
 PauMonne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNzozNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IE9u
IDAxLjA3LjIwMTkgMTc6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDcuMjAxOSAx
Njo0NSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4gT24gMDEuMDcuMjAxOSAx
NjoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjA2LjE5IGF0IDEzOjQ5LCA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+Pj4gKyAgICBpZiAoICFyZXEudS5t
ZW1fYWNjZXNzLmZsYWdzICkNCj4+Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsgLyogbm8gdmlv
bGF0aW9uICovDQo+Pj4+DQo+Pj4+IEhvdyBpcyB0aGUgImZhbHNlIiBoZXJlIChJIHRoaW5rIHRo
aXMgaXMgdGhlIG9uZSB0aGUgZGVzY3JpcHRpb24gdGFsa3MNCj4+Pj4gYWJvdXQpIG1hdGNoaW5n
IHVwIHdpdGggdGhlIHZhcmlvdXMgb3RoZXIgb25lcyBpbiB0aGUgZnVuY3Rpb24/DQo+Pj4NCj4+
PiBUaGVyZSBzaG91bGQgYmUgbm8gZXZlbnQgaWYgdGhlcmUgaXMgbm8gYWNjZXNzIHZpb2xhdGlv
bi4gU28gaW4gdGhpcw0KPj4+IGNhc2UgdGhlIGVtdWxhdGlvbiBpcyBjb250aW51ZWQgYXMgZXhw
ZWN0ZWQuDQo+Pg0KPj4gQnV0IHRoaXMgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb246IFlvdSB1
c2UgImZhbHNlIiBhcyByZXR1cm4gdmFsdWUNCj4+IHRvIGluZGljYXRlIGRpZmZlcmVudCB0aGlu
Z3MuIE9ubHkgdGhlIG9uZSBoZXJlIG1lYW5zICJubyBhY2Nlc3MNCj4+IHZpb2xhdGlvbiIuDQo+
IA0KPiBTb3JyeSBhYm91dCB0aGF0LCBzaW5jZSB0aGlzIHdpbGwgcmVtYWluIHRoZSBvbmx5IHJl
dHVybiBmYWxzZSBhcGFydA0KPiBmb3JtIHRoZSBtYWluIG9uZSAocmV0dXJuIG1vbml0b3JfdHJh
cHMoKSksIGZhbHNlICA9IGV2ZW50IHdhcyBub3Qgc2VudA0KPiBhbmQgdHJ1ZSA9IGV2ZW50IHdh
cyBzZW50Lg0KPiANCj4gSSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBhc2tpbmcgYWJvdXQgdGhl
IHNjZW5hcmlvIHdoZW4gdGhlcmUgd2FzIGENCj4gdmlvbGF0aW9uIGFuZCB0aGUgZXZlbnQgd2Fz
IG5vdCBzZW50LiBUaGVuIEkgY2FuIGlzc3VlIGEgZG9tYWluX2NyYXNoKCkNCj4gYXMgdGhhdCBp
cyBwb3RlbnRpYWxseSBhIGJpZyBpc3N1ZS4NCj4gDQo+IEkgaG9wZSBJIGdvdCB0aGF0IGNvcnJl
Y3RseS4NCg0KSSBkb24ndCBnZXQgdGhlIGltcHJlc3Npb24gdGhhdCB5b3UgZGlkLiBJIGNvdW50
IGEgdG90YWwgb2YgZm91cg0KInJldHVybiBmYWxzZSIgaW4gdGhlIGZ1bmN0aW9uLCBvbmx5IG9u
ZSBvZiB3aGljaCBleHBsaWNpdGx5IG1lYW5zDQoibm8gYWNjZXNzIHZpb2xhdGlvbiIgKG90aGVy
cyBtYXkgaGF2ZSB0aGF0IG1lYW5pbmcgaW1wbGljaXRseSkuIExldCdzDQp0YWtlIHRoZSBwMm1f
Z2V0X21lbV9hY2Nlc3MoKSBmYWlsdXJlIGNhc2UgYXMgYW4gZXhhbXBsZTogV2hhdCBJIGRvbid0
DQp1bmRlcnN0YW5kIGlzIHdoeSB0aGlzIGNhc2UgYW5kIHRoZSAibm8gYWNjZXNzIHZpb2xhdGlv
biIgb25lIGFyZSBib3RoDQptZWFudCB0byBiZSB0cmVhdGVkIHRoZSBzYW1lLg0KDQpKYW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
