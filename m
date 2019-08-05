Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32063814C1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huYus-0008I6-86; Mon, 05 Aug 2019 09:04:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huYuq-0008Hf-8l
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:04:28 +0000
X-Inumbo-ID: 0511694c-b760-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0511694c-b760-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 09:04:26 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 09:04:20 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 09:01:03 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 09:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzJgO1mM3rlqXQ2TpBs+nnxo0zjWT63YNMPjshpK9Ie8AoWG3RI+ARrsOU/1BJn1ALwtimvnYrirly1fAhdjFGZdc0Di1KNJ3SLMbPmTg/360gIjQ/kyGUYR3DPAhqbIeKA2gX6TvJ++F7QyTzv+cIZ1higoAHfeMooR+itCgYlysN0hkgnJ0Dnq97o1wv6ajydzuW+HdB8t6OVrCLKkzPBggRoBtIDzIwCLHbYlgit4WK3LcN8ybJaEELgKdl3mCY6xwaR28lcrj3r6Yy6AC9IwoCxKfaXe4bV24N1aQyNJkkV9liCRQIgkzq1C9474MD9SUn/BS3OWARF5g50jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XygOxPB94RzU27oZja5re5JMwK+BaprhTBGP/tbFptg=;
 b=GmJIf6wNapYQkzm2gUTIxMHRDyiovMAc/dzMOkOFQ873nRbTjxV/YO3zJcue+CPaNrO5ClDIQE2xxXp0rKKWUkPaEVEKGhdcTyCYS6crA84eHSPP6eV745fdpR4BK3bzYOeoC5tprAsL+5zV0nVDWv4oM35LuN/foSFHkG4PdFfyhdlLSDxosZJQUkRT2LiIaMIV5HkBLDmcpyw2/h/16Xvu5B3p8bpUsHHj3TRxiuaK75MDgXFexF+RYoyA4hLLq4Fv0uCbzetDyKMVwBKJMIJxxV5cd0G0UvYu1Uo5Cqs394GrBpopV2qvQ+SlmLnppo2Fcyom9OczRx8nlVL0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3262.namprd18.prod.outlook.com (10.255.237.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:01:02 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:01:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] tests/x86emul: Annotate test blobs as executable code
Thread-Index: AQHVMYy6AFJGJVgH7EeLWuDdwzrRe6boXisogAQXWAA=
Date: Mon, 5 Aug 2019 09:01:02 +0000
Message-ID: <c92d352e-95d6-f3d8-844b-f2e00c97a1c0@suse.com>
References: <98d70501-75c6-bbcd-39b3-14c5834c7d61@suse.com>
 <f5d45f8e-413d-beb9-aa2d-2e8a0f8683b7@citrix.com>
In-Reply-To: <f5d45f8e-413d-beb9-aa2d-2e8a0f8683b7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0144.eurprd07.prod.outlook.com
 (2603:10a6:207:8::30) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f3c6a89-b625-4d37-6aca-08d7198370f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3262; 
x-ms-traffictypediagnostic: MN2PR18MB3262:
x-microsoft-antispam-prvs: <MN2PR18MB326271F7A35F96BF780D0AA1B3DA0@MN2PR18MB3262.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(199004)(189003)(4326008)(25786009)(6116002)(3846002)(8676002)(53936002)(229853002)(31686004)(14454004)(478600001)(68736007)(5660300002)(66476007)(66556008)(6512007)(64756008)(66446008)(81166006)(6436002)(6486002)(66066001)(8936002)(386003)(36756003)(86362001)(256004)(71200400001)(71190400001)(476003)(2906002)(305945005)(7736002)(11346002)(66946007)(81156014)(6246003)(446003)(80792005)(99286004)(54906003)(76176011)(53546011)(486006)(26005)(2616005)(102836004)(316002)(52116002)(6506007)(31696002)(186003)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3262;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yk0BLY4ujmw0Q/1Qp4dCNvtqTC2fbNKVeb0Tzjn9Or/ppcdqhgETSBu9gRJUbz54I3BBoEGQGBliPMq7ICRw/Prk+BMXsjffFDr/WbAKqt+Oa6A77QlB/Aa3ivR6IxcJeDQ8EPEpAO+R8xgx35AT3dKSMQ2Yk+NPgZ1lUjytLQxj3gx2ynCtvjp89anPKmJDW9ZR/c0IIxLh9S3TrfTaz88ZSn7BFlqQSDLA65dyYwas6kcNE9Rtko9DjNgD6H4M/R5CGwbnny31I2Oa/xWmHIG52Yguk++Lx9ni1BEBeEHKLnM3o2iuccihgsV2XMV8tuyKXtDeA4ipPcFbyNWvVtKYStPccwLD0hneOUlYwyUBDi+Oj6OQuhBgXIDJRYqqIPlcCECalAr9IDZ2I719iEUFz9Bdf7GqzTZKOVkK3Js=
Content-ID: <0BA228F0A2A96D4E87DFA6B71A389381@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3c6a89-b625-4d37-6aca-08d7198370f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:01:02.5910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3262
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] tests/x86emul: Annotate test blobs as
 executable code
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
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAyMDozMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDMvMDcvMjAx
OSAxMTo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAyNC4wNS4xOSBhdCAxNzoxNSwg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IC0tLSBhL3Rvb2xzL3Rlc3Rz
L3g4Nl9lbXVsYXRvci9NYWtlZmlsZQ0KPj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRv
ci9NYWtlZmlsZQ0KPj4+IEBAIC0xNDksNyArMTQ5LDcgQEAgJChhZGRzdWZmaXggLmgsJChURVNU
Q0FTRVMpKTogJS5oOiAlLmMgdGVzdGNhc2UubWsgTWFrZWZpbGUNCj4+PiAgIAkJKGVjaG8gJ3N0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgX19hdHRyaWJ1dGVfXygoc2VjdGlvbigiLnRlc3QsIFwi
YXhcIiwgQHByb2diaXRzICMiKSkpJyBcDQo+Pj4gICAJCSAgICAgICIkJHtwcmVmaXh9XyQoYXJj
aCkkJHtmbGF2b3J9W10gPSB7IjsgXA0KPj4+ICAgCQkgb2QgLXYgLXQgeCAkKi5iaW4gfCBzZWQg
LWUgJ3MvXlswLTldKiAvMHgvJyAtZSAncy8gLywgMHgvZycgLWUgJ3MvJCQvLC8nOyBcDQo+Pj4g
LQkJIGVjaG8gIn07IikgPj4kQC5uZXc7IFwNCj4+PiArCQkgZWNobyAifTsgYXNtKFwiLnR5cGUg
JCR7cHJlZml4fV8kKGFyY2gpJCR7Zmxhdm9yfSwgU1RUX0ZVTkM7XCIpOyIpID4+JEAubmV3OyBc
DQo+PiBXaGlsZSBJIHRoaW5rIHdlJ3ZlIHN1ZmZpY2llbnRseSBhZ3JlZWQgb24gZnV0dXJlIGdh
cyBiZWhhdmlvcg0KPj4gdGhhdCBJJ2QgY29uc2lkZXIgdGhpcyBjaGFuZ2UgZmluZSB0byBtYWtl
IGFzIGxvbmcgYXMgeW91IGFkZA0KPj4gYW4gaW50ZXJtZWRpYXRlIHN0ZXAgZ29pbmcgdGhyb3Vn
aCBTVFRfTk9UWVBFLCBJJ2QgbGlrZSB0byBub3RlDQo+PiB0aGF0IHlvdXIgbWlsZWFnZSBmcm9t
IHRoaXMgd2lsbCBvbmx5IGJlIGFib3V0IDUwJTogV2hpbGUgdGhlDQo+PiA2NC1iaXQgYmxvYnMg
d2lsbCBkaXNhc3NlbWJsZSBmaW5lLCBJJ20gYWZyYWlkIHRoZSAzMi1iaXQgb25lcw0KPj4gd2ls
bCBiZSBzb21ld2hhdCBnYXJibGVkLiBTYWRseSB0aGVyZSdzIG5vIGFubm90YXRpb24gb3IgYWxp
a2UNCj4+IChsaWtlIEFybSdzIG1hcHBpbmcgc3ltYm9scykgdGhhdCBvbmUgY291bGQgdXNlIHRv
IG1ha2UNCj4+IGRpc2Fzc2VtYmxlcnMgc3dpdGNoIGJpdG5lc3MgZm9yIHNlcGFyYXRlIGJsb2Nr
cyBvZiBjb2RlLg0KPiANCj4gVGhhdHMgZmluZS4NCj4gDQo+IERpc2Fzc2VtYmxpbmcgdHdpY2Us
IG9uY2Ugd2l0aCAtbWkzODYgd29ya3Mgd2VsbCwgYXMgdGhlIHN5bWJvbCBuYW1lcw0KPiBzdGls
bCBnZXQgZW1pdHRlZCBzZW5zaWJseS7CoCBJIGV2ZW4gdXNlIC1tIGk4MDg2IGZvciBiaXRzIG9m
IFhlbidzDQo+IHRyYW1wb2xpbmUuDQo+IA0KPiBJdHMgcmFyZSB0byBuZWVkIHRvIGxvb2sgYXQg
YSBkaWZmZXJlbnQgZGlzYXNzZW1ibHksIGJ1dCBpdHMgdmVyeSBlYXN5DQo+IHRvIGRvIHNvIGlm
IHlvdSBuZWVkIHRvLg0KPiANCj4gQ2FuIEkgdGFrZSB0aGlzIHJlcGx5IGFzIGFuIGFjayBmb3Ig
dXNpbmcgdGhlIFNUVF9OT1RZUEUgaW50ZXJtZWRpYXRlIHN0ZXA/DQoNClllcyAtIHNvcnJ5IGZv
ciBub3QgYmVpbmcgZXhwbGljaXQgaW4gdGhpcyByZWdhcmQuDQoNCkphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
