Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDAB17921E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:14:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Ul4-0002ip-JU; Wed, 04 Mar 2020 14:12:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dxjO=4V=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j9Ul2-0002ik-W4
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:12:21 +0000
X-Inumbo-ID: 28e7254a-5e22-11ea-8eb5-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.112]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e7254a-5e22-11ea-8eb5-bc764e2007e4;
 Wed, 04 Mar 2020 14:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mquqQUH7J7MYey/ZjIF6x5pkP/572v6Hm29AGymnMzyR+A9pwFlxFCabFubC419iq2IOzDEz/TR3IkdDCHxDaxl5U7rsvyB5/0Z522w8MgJehCc/hRVnr4vndJwK3LFSG6snO2E7f00gn8aBxCQyG0pecGrPAhzF7SnO5Pr9aSwTCH0OKW6FXnKp2jibyOoai1uRnFuby2Fr0xZsV8/FVmb4ROlPFvdNb2lz6D2IT3t8mEvDiz9UZd81VMuPdsfmxlcNs22681v697vmEp9FJkgoxkW7khvDuQFTDbgagJNi8tsjqzuAiiPa2Qd/Y+gZbtscqIO4CVDsOCKMbScxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSN5MLo2ll4Dx/95pBXvS5+84VH6LYfx+9081iDiWuw=;
 b=c48RrlHreNY1ipFgFcgPrB8mOyLgtzufmHnFS6SmuG+sy4BIpDtqvvHG4iRGb0LXV2hrJg5Db0Sx/k7qlx6dzXi6qZ9FyLrwMG31W4slgb/6M/LQ0mb37Onqw+S2V2ThjffWkFOpH4oMOT2Tw2p4MftlrhjG7i+5ILEfkemW86+CRuFzWPyxt2qg71HeAPici10OvXgEQhlDWQykZj2WDTrLz24uimuuSi6vrYlAB603ROw3mXN4jIDbGrYZf/42hcEROwbVgnJglfx0zgOIfXt+m4/s9hgiq2eUWCwaJBJsN66rJeSiqe+GrvOqB4EEusxgN0N8KOpmdkjfai9W0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSN5MLo2ll4Dx/95pBXvS5+84VH6LYfx+9081iDiWuw=;
 b=M4UFsdmmZTERmEreWyqeefNhQX+YPL0/eaxEv9++www8HJv1DOZ1Lxwy0G0ieMb9e/UAbR4ZHe55DfY6ekVx7YKarPQXuetOPpJd/1Sz5y9vG47UbsExr6HvoZohGj72fT89BWqEKh/SidpD78O7tHWHPRKkmvMGVLBP+N+5imI=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3078.eurprd02.prod.outlook.com (10.175.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Wed, 4 Mar 2020 14:12:17 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f87f:d4b3:234f:d43e%4]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 14:12:18 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:208:ab::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19 via Frontend Transport; Wed, 4 Mar 2020 14:12:17 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V6] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV8VaFWzT4PZYI70qii0UzQw6fbqg4mImA///hSYCAAAFRAA==
Date: Wed, 4 Mar 2020 14:12:17 +0000
Message-ID: <762887b4-0009-1458-0c10-6d6a72a62290@bitdefender.com>
References: <20200303122240.27013-1-aisaila@bitdefender.com>
 <dc509c91-f809-6dbb-797c-6600b4857a74@bitdefender.com>
 <623c77c6-d00a-d15e-a1e3-3827d32e1c10@suse.com>
In-Reply-To: <623c77c6-d00a-d15e-a1e3-3827d32e1c10@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0014.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::27) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcccd73e-1375-4790-a1c7-08d7c0460c01
x-ms-traffictypediagnostic: DB6PR02MB3078:|DB6PR02MB3078:
x-microsoft-antispam-prvs: <DB6PR02MB30781E90E635A42CC2606E9DABE50@DB6PR02MB3078.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(376002)(366004)(39850400004)(199004)(189003)(7416002)(5660300002)(36756003)(6916009)(2616005)(6486002)(64756008)(956004)(66476007)(66446008)(52116002)(186003)(66556008)(4326008)(16526019)(66946007)(26005)(53546011)(478600001)(8676002)(71200400001)(8936002)(54906003)(86362001)(316002)(16576012)(81166006)(81156014)(31696002)(31686004)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3078;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gUuSINLuEqYEogVbJgp12DWIRWlM4JnZCDJFf7yKX45Ky9XskcL3c6EKeogvkTCG7qEz7hQNV5fRCMkq9kW9hIT0/p8KD6VOqCHP7aSlGhvETcrxVpDhOTG8Zm8WiqkznclDYsEPFEXSzqlewTwQ9eOED/n0HB5rvZy9g6vng4W3xtNg/tyVDjJBLz5ks8D7YKqB+kqHkb0Yhv/vZcIN7F1sOel+euM/d5MwxeWV6dV2umv+38hcyDpDZuSTYmGCxueBUYuuVV3u/BkhE7rxQlhiEu1MWGesqp3RC8dZophcNUoYGDa+KxmORuYiSXlV9Gt6/YsWFJCy0FP6dVKgaH0gqX8DUQJ22dbyVsVwQt+QJtZ8L4+kNmejRMCWmhdVc1JW8dYZnTjOe0Iqm8pWA8gOEnSKqeWpDKlbtgcFy4aJz/Qv9I+zsaJ/aFx8SUs
x-ms-exchange-antispam-messagedata: m/awtsoMnecdz/rMPGvaVtmmnh357Uxdd4MONd6iApTsRmfd8Pi3RQLzOEdMwQ1Z2Zy5zYcJqP041CzhcoBH6fMLxYQud6kv1buSOnh43ICNCul++idNYEsuIw9b3nDPWjaxmmtbzmwrC24L4RikOg==
x-ms-exchange-transport-forked: True
Content-ID: <B34316873A144D4F8149A8D7A3297933@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcccd73e-1375-4790-a1c7-08d7c0460c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 14:12:17.9101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cP0I2gZEEiJzaobaie7ClcUdEKCt2jgd0e5EoJcW0bsyH0tanCSL0xOVaOmQoAJnJgG+xZi8rQoG8XxcnjKQoWK7hio1+Dy4NSwT/yWtGG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3078
Subject: Re: [Xen-devel] [PATCH V6] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA0LjAzLjIwMjAgMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wMy4y
MDIwIDE0OjU3LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEhpIEdlb3JnZSwN
Cj4+DQo+PiBUaGlzIGlzIGEga2luZCByZW1pbmRlciBpZiB5b3UgY2FuIHRha2UgYSBsb29rIGF0
IHRoaXMgcGF0Y2ggd2hlbiB5b3UNCj4+IGhhdmUgdGhlIHRpbWUuDQo+IA0KPiBBcmUgeW91IHBl
cmhhcHMgbm90IGF3YXJlIG9mIHRoZSByZWNlbnQgbWFpbnRhaW5lciBjaGFuZ2Ugb24NCj4geGVu
L2FyY2gveDg2L21tLz8gV2hhdCB5b3UgbmVlZCB0byBnbyBodW50IGlzIC4uLg0KPiANCj4+IE9u
IDAzLjAzLjIwMjAgMTQ6MjMsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+IEF0
IHRoaXMgbW9tZW50IGEgZ3Vlc3QgY2FuIGNhbGwgdm1mdW5jIHRvIGNoYW5nZSB0aGUgYWx0cDJt
IHZpZXcuIFRoaXMNCj4+PiBzaG91bGQgYmUgbGltaXRlZCBpbiBvcmRlciB0byBhdm9pZCBhbnkg
dW53YW50ZWQgdmlldyBzd2l0Y2guDQo+Pj4NCj4+PiBUaGUgbmV3IHhjX2FsdHAybV9zZXRfdmlz
aWJpbGl0eSgpIHNvbHZlcyB0aGlzIGJ5IG1ha2luZyB2aWV3cyBpbnZpc2libGUNCj4+PiB0byB2
bWZ1bmMuDQo+Pj4gVGhpcyBpcyBkb25lIGJ5IGhhdmluZyBhIHNlcGFyYXRlIGFyY2guYWx0cDJt
X3dvcmtpbmdfZXB0cCB0aGF0IGlzDQo+Pj4gcG9wdWxhdGVkIGFuZCBtYWRlIGludmFsaWQgaW4g
dGhlIHNhbWUgcGxhY2VzIGFzIGFsdHAybV9lcHRwLiBUaGlzIGlzDQo+Pj4gd3JpdHRlbiB0byBF
UFRQX0xJU1RfQUREUi4NCj4+PiBUaGUgdmlld3MgYXJlIG1hZGUgaW4vdmlzaWJsZSBieSBtYXJr
aW5nIHRoZW0gd2l0aCBJTlZBTElEX01GTiBvcg0KPj4+IGNvcHlpbmcgdGhlbSBiYWNrIGZyb20g
YWx0cDJtX2VwdHAuDQo+Pj4gVG8gaGF2ZSBjb25zaXN0ZW5jeSB0aGUgdmlzaWJpbGl0eSBhbHNv
IGFwcGxpZXMgdG8NCj4+PiBwMm1fc3dpdGNoX2RvbWFpbl9hbHRwMm1fYnlfaWQoKS4NCj4+Pg0K
Pj4+IE5vdGU6IElmIGFsdHAybSBtb2RlIGlzIHNldCB0byBtaXhlZCB0aGUgZ3Vlc3QgaXMgYWJs
ZSB0byBjaGFuZ2UgdGhlIHZpZXcNCj4+PiB2aXNpYmlsaXR5IGFuZCB0aGVuIGNhbGwgdm1mdW5j
Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRk
ZWZlbmRlci5jb20+DQo+Pj4gLS0tDQo+Pj4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPg0KPj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4+IENDOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+IENDOiBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQo+Pj4gQ0M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4+PiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0K
Pj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4g
Q0M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4gQ0M6IEp1
biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4NCj4+PiBDQzogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+Pj4gLS0tDQo+Pj4gQ2hhbmdlcyBzaW5jZSBWNToNCj4+
PiAJLSBDaGFuZ2UgaWR4IHR5cGUgZnJvbSB1aW50MTZfdCB0byB1bnNpZ25lZCBpbnQNCj4+PiAJ
LSBBZGQgcmMgdmFyIGFuZCBkcm9wcGVkIHRoZSBlcnIgcmV0dXJuIGZyb20gcDJtX2dldF9zdXBw
cmVzc192ZSgpLg0KPj4+DQo+Pj4gQ2hhbmdlcyBzaW5jZSBWNDoNCj4+PiAJLSBNb3ZlIHAybSBz
cGVjaWZpYyB0aGluZ3MgZnJvbSBodm0gdG8gcDJtLmMNCj4+PiAJLSBBZGQgY29tbWVudCBmb3Ig
YWx0cDJtX2lkeCBib3VuZHMgY2hlY2sNCj4+PiAJLSBBZGQgYWx0cDJtX2xpc3RfbG9jay91bmxv
Y2soKS4NCj4+Pg0KPj4+IENoYW5nZXMgc2luY2UgVjM6DQo+Pj4gCS0gQ2hhbmdlIHZhciBuYW1l
IGZvcm0gYWx0cDJtX2lkeCB0byBpZHggdG8gc2hvcnRlbiBsaW5lIGxlbmd0aA0KPj4+IAktIEFk
ZCBib3VuZHMgY2hlY2sgZm9yIGlkeA0KPj4+IAktIFVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KPj4+
IAktIEFkZCBjb21tZW50IGluIHhlbmN0cmwuaC4NCj4+Pg0KPj4+IENoYW5nZXMgc2luY2UgVjI6
DQo+Pj4gCS0gRHJvcCBoYXBfZW5hYmxlZCgpIGNoZWNrDQo+Pj4gCS0gUmVkdWNlIHRoZSBpbmRl
bnRhdGlvbiBkZXB0aCBpbiBodm0uYw0KPj4+IAktIEZpeCBhc3NpZ25tZW50IGluZGVudGF0aW9u
DQo+Pj4gCS0gRHJvcCBwYWQyLg0KPj4+DQo+Pj4gQ2hhbmdlcyBzaW5jZSBWMToNCj4+PiAJLSBE
cm9wIGRvdWJsZSB2aWV3IGZyb20gdGl0bGUuDQo+Pj4gLS0tDQo+Pj4gICAgdG9vbHMvbGlieGMv
aW5jbHVkZS94ZW5jdHJsLmggICB8ICA3ICsrKysrKysNCj4+PiAgICB0b29scy9saWJ4Yy94Y19h
bHRwMm0uYyAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysNCj4gDQo+IC4uLiBh
IHRvb2wgc3RhY2sgYWNrIGFuZCAuLi4NCj4gDQo+Pj4gICAgeGVuL2FyY2gveDg2L2h2bS9odm0u
YyAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrDQo+Pj4gICAgeGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgICAgICB8ICAyICstDQo+IA0KPiAuLi4gYW5kIGEgVk1YIG9uZSwgYWxzbyBmb3Ig
Li4uDQo+IA0KPj4+ICAgIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgICAgICAgfCAxNSArKysr
KysrKysrKysrKysNCj4+PiAgICB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jICAgICAgIHwgIDEg
Kw0KPiANCj4gLi4uIHRoaXMuDQo+IA0KDQpPaywgdGFua3MgZm9yIHRoaXMsIEkganVzdCBzYXcg
dGhlIGNoYW5nZXMgb24gdGhlIG1haW50YWluZXJzLg0KDQpBbGV4DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
