Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8626482DCE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 10:35:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huurz-0001Bn-3m; Tue, 06 Aug 2019 08:30:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huurx-0001Bi-Ir
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 08:30:57 +0000
X-Inumbo-ID: 80bece2a-b824-11e9-958e-1f010a5ae198
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80bece2a-b824-11e9-958e-1f010a5ae198;
 Tue, 06 Aug 2019 08:30:53 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  6 Aug 2019 08:30:46 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 6 Aug 2019 08:26:56 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 6 Aug 2019 08:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSTodpcf2Nwg+TqbPo3lVHvPjuUnzU4zxLp/rF8CCEthtjOILRPICHz/MCcP17vdiYZ8Tcebgb5AIDAtR8B+4wkxEU0PXjoxMyMuFqbC7UFUXZVFYDOaNRgl6OR20iuJm3BfkQfIFWmbF8hziqzaBVm163zjDX7UuyhIW1XCGExktPUcWbzNdAh8B3uhqcrhfB2ZU3Wy6I1myVm5apTHpYBaaCEA05uAirtQWMXmUdwNacOk3/qVaAInnc5ErZoXazjbNQcPsl7P+8IA3658z3fBNoi1TCCNMTFp+EylplHuwycXixkqqpYeAKT6U836Vn9hEl/hPhPJqkqC78vDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XPnrEytd1dmGgLUJfhAQnFf+XA9q8rihICw7rnpfNs=;
 b=b8GPcq5WgjCLI1/qdA8CPV86gwLTrj5hnb2o2dSUarq04X4P0/IjhjAWZcHd/Vm4DIlrHRXpOPVkURZIcngC3AGcEzxMTPkH9/5vT/X7s+JMIaQ5Nin65anVgF4YRjtBdylMsrABKHMM7fBVqPZSb5Tj7qDkptlEJR1JyPHZQ5/HbDTWzQsou9Z804SWfUxoKEyJQYNcaz8EODElvWo87E38yZRL34+74VBZ7OvqEnnVYBZ9kM/PCOcHKPFXNkIgxPYBX3CTriqTkUMJHkMZX3gpNsZByS/3BWUzSacWsZyi7VhQGBamTyIkoIGUjQSLlYDhQansPPzdQoW35PbFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2750.namprd18.prod.outlook.com (20.179.20.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Tue, 6 Aug 2019 08:26:55 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 08:26:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH] xen/x86: lock cacheline for add_sized()
Thread-Index: AQHVTCSgB+UnTRxATECSyt7gptB4DqbtyRoA
Date: Tue, 6 Aug 2019 08:26:54 +0000
Message-ID: <e3ff98ba-efed-e953-8de7-4f032a73b101@suse.com>
References: <20190806070000.13718-1-jgross@suse.com>
In-Reply-To: <20190806070000.13718-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::23) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d80f608-1d93-414a-4a9f-08d71a47d6f0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2750; 
x-ms-traffictypediagnostic: MN2PR18MB2750:
x-microsoft-antispam-prvs: <MN2PR18MB2750B2DE56269FC6FE48B0A4B3D50@MN2PR18MB2750.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(199004)(189003)(31696002)(68736007)(102836004)(53936002)(8936002)(6636002)(446003)(11346002)(6436002)(99286004)(186003)(4326008)(25786009)(486006)(6862004)(2616005)(476003)(54906003)(37006003)(316002)(52116002)(478600001)(71190400001)(14444005)(71200400001)(66066001)(5660300002)(6512007)(256004)(26005)(6486002)(31686004)(76176011)(66446008)(2906002)(64756008)(6116002)(3846002)(66946007)(229853002)(86362001)(66556008)(66476007)(36756003)(6246003)(53546011)(386003)(6506007)(7736002)(14454004)(80792005)(8676002)(81156014)(81166006)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2750;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rq1fHAI0w9pmElfenIX497tJ5YKqODv2iunHdvbH4iXGjAL/kDJEEQ8WTgLmnHws1N+nLA+kMicbeYXbKqhaxhvADI40qbCTBeZ2621olVDaOWqerdBHBR4OddT68wQKwaxapemvWVZAyOR7rmvNm050tsE7b3D+fG4yPk0xh74JftN/8/R5i1XhtKAnzhKN0rSVSCSZpamT9ch7WScRq9g1EvdxPx6ARJlxANURe6R89j2BMXNTXjbAlL7o3SArPzowdekn3ABgGqFsnQb8cgegQJZEyI9NfW/IIXPO/xujt4v7Dl1oZzEoeEtBUaW20QN/5FwNoqDX1tAIBacrqK1bndVcZHM3kszrc4M03g848k3Ij5N2vRAbpp/jrTkWw0JTP3CQvwMQGT/L5jxx7aRAaCeor9N6CsPe1e9dwLk=
Content-ID: <2F30CCEDE7D2DB4490B5FC44978E29D9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d80f608-1d93-414a-4a9f-08d71a47d6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 08:26:54.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2750
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/x86: lock cacheline for add_sized()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAwOTowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gYWRkX3NpemVkKCkg
c2hvdWxkIHVzZSBhbiBhdG9taWMgdXBkYXRlIG9mIHRoZSBtZW1vcnkgd29yZCwgYXMgaXQgaXMN
Cj4gdXNlZCBieSBzcGluX3VubG9jaygpLg0KPiANCj4gV2l0aCB0aWNrZXQgbG9ja3MgdW5sb2Nr
aW5nIG5lZWRzIHRvIGJlIGF0b21pYyBpbiBvcmRlciB0byBhdm9pZCB2ZXJ5DQo+IHJhcmUgcmFj
ZXMgd2hlbiBzb21lb25lIHRyaWVzIHRvIGdldCB0aGUgbG9jayB3aGlsZSB0aGUgbG9jayBob2xk
ZXINCj4gaXMganVzdCByZWxlYXNpbmcgaXQuDQoNCkNvbnNpZGVyaW5nIHRoZSBjb21taXQgaW50
cm9kdWNpbmcgdGhlIGZ1bmN0aW9uICgzYzY5NGFlYzA4KQ0KZXhwbGljaXRseSBzYXlpbmcgIlRo
ZSBhZGQgaXMgL25vdC8gYXRvbWljIiB0aGlzIG5lZWRzIG1vcmUgZGV0YWlsLg0KVGhlIGlkZWEg
YmVoaW5kIG5vdCB1c2luZyBhIExPQ0tlZCBhY2Nlc3MgaGVyZSB3YXMsIGlpcmMsIHRoYXQNCm5v
LW9uZSBlbHNlIGNvdWxkIGV2ZXIgdXBkYXRlIHRoZSBoZWFkIHBvaW50ZXI7IHNvbWVvbmUgdHJ5
aW5nIHRvDQphY3F1aXJlIHRoZSBsb2NrIHdvdWxkIG9ubHkgd3JpdGUgdG8gdGhlIHRhaWwgcG9y
dGlvbi4gQnV0IHllcywgSQ0KdGhpbmsgSSBjYW4gc2VlIGhvdyB0aGlzIHdhcyB3cm9uZzogVGhl
IGFyY2hfZmV0Y2hfYW5kX2FkZCgpIGFjdHMNCm9uIGhlYWRfdGFpbCBhZnRlciBhbGwsIG5vdCBq
dXN0IHRhaWwuDQoNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaA0KPiArKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2F0b21pYy5oDQo+IEBAIC0yMSw3ICsyMSw3IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBuYW1lKHZvbGF0aWxlIHR5cGUgKmFkZHIsIHR5cGUgdmFsKSBcDQo+ICAg
I2RlZmluZSBidWlsZF9hZGRfc2l6ZWQobmFtZSwgc2l6ZSwgdHlwZSwgcmVnKSBcDQo+ICAgICAg
IHN0YXRpYyBpbmxpbmUgdm9pZCBuYW1lKHZvbGF0aWxlIHR5cGUgKmFkZHIsIHR5cGUgdmFsKSAg
ICAgICAgICAgICAgXA0KPiAgICAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgYXNtIHZvbGF0
aWxlKCJhZGQiIHNpemUgIiAlMSwlMCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwN
Cj4gKyAgICAgICAgYXNtIHZvbGF0aWxlKCJsb2NrOyBhZGQiIHNpemUgIiAlMSwlMCIgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCg0KSSByZWFsaXplIHByZS1leGlzdGluZyBjb2RlIGluIG91
ciB0cmVlIHVzZXMgdGhpcyBub3QgZnVsbHkgY29ycmVjdA0KZm9ybSBvZiBzcGVjaWZ5aW5nIHBy
ZWZpeGVzICh0aGVyZSBzaG91bGRuJ3QgcmVhbGx5IGJlIGEgbGluZQ0Kc2VwYXJhdG9yIGJldHdl
ZW4gcHJlZml4IGFuZCBtYWluIG1uZW1vbmljLCB1bmxlc3MgZ2FzIHdvdWxkIHJlZnVzZQ0KYXNz
ZW1ibGluZyB0aGUgcmVzdWx0IGJlY2F1c2Ugb2YgaXQgd3JvbmdseSB0aGlua2luZyB0aGUgcHJl
Zml4IHdhcw0KaW5hcHBsaWNhYmxlIHRvIHRoZSBpbnNuLCBsaWtlIGlzIGUuZy4gdGhlIGNhc2Ug
aGVyZSBhbmQgdGhlcmUgZm9yDQp0aGUgUkVQIHByZWZpeGVzKSwgYnV0IEkgdGhpbmsgd2Ugc2hv
dWxkIHRyeSB0byBhdm9pZCB3aWRlbmluZyB0aGUNCmlzc3VlLiBTZWUgZS5nLiBnbnR0YWJfY2xl
YXJfZmxhZ3MoKSB3aGVyZSB3ZSBhbHJlYWR5IGhhdmUgbm8NCnNlbWljb2xvbiwgYW5kIHRoaXMg
aGFzIGdvbmUgZmluZSBzaW5jZSBhcm91bmQgNC4yLiBJIHNlZW0gdG8gdmFndWVseQ0KcmVjYWxs
IHRoYXQgTGludXggaGFzIGJlZW4gdXNpbmcgdGhpcyBjb25zdHJ1Y3QgdG8gYXZvaWQgYnVpbGQg
aXNzdWVzDQp3aXRoIHNvbWUgc3BlY2lmaWMgKFN1bj8pIGFzc2VtYmxlci4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
