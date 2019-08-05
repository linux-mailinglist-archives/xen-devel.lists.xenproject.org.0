Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E5820E1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hufIE-0008PH-Qd; Mon, 05 Aug 2019 15:53:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hufID-0008PC-Lg
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 15:53:01 +0000
X-Inumbo-ID: 1815c434-b799-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1815c434-b799-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 15:52:59 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 15:52:52 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 15:51:57 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 15:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBR9uD3CkX3S+uPdWHFxuzx8UB7JtwYsvbJvM+n16aG8b4gg1g2gVNOT8UOYFJ7bMfzvKehJnEDL765RPV5EWMZSlDJ5My4h4OOckjokl8l08Zw+9NtqbJfcpI0joZyM81846k4edDWIQP9py1twJlqdxfcZYLj0WHV21AJhuzP00OJuvS4odXr+paqR5l6eiP+1c9byRKcmwuODfWBgx8BsfdK3n+x2tcVE2UP+yKEWJwja5vcuLKdJIxJd8Wk/MC9cA1prnuFUUEDmYRDNmvI1g3/zbxNn9QeQ22zCvwUP4wV7jY75S3PLwqcsKaRIwDF842C3dw+Q3PbhTuIn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vvq6l/nAVJt3c1Ous9hQzynCcj6yq0AIpEucZZGoCI=;
 b=PkQFnto0c/kuVkavHWbEcnGPHNxBJLNd9BQOcpGph7S3uT90qzkz/xs+sIWfzW1Kqhyp3BZ9YJjDD4ocwQV3/Bar3vcCqOmKNdNsg27Ho71B4drkyJoz4uX3+W+V1clGOcsQsj5KrcNE/IwMoVc93QGulYhCLJCo6MCLoVJx68psLl5PN4bhVmPQbbGhqMCG7QmNFns74E4NpzmAYlPgC9gIpk2f5PsHeviHsJvwjOSsV5vMT99NhK+qBEtyTW6Cb3S8i2dpr8uLnBbvGqOKdd+wE00bGpsPaP626L+zNel9SwEtZF85lRIXSn1erVdo/YRXrDRY2vSeR0UD9vv0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2413.namprd18.prod.outlook.com (20.179.83.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Mon, 5 Aug 2019 15:51:55 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 15:51:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH] libacpi: report PCI slots as enabled only for
 hotpluggable devices
Thread-Index: AQHVS51JH2NAarmoikCRSWu51JcdnabstCeA
Date: Mon, 5 Aug 2019 15:51:55 +0000
Message-ID: <70a89b64-a3c1-1fe7-1b15-6f6fee98c92a@suse.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
 <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
 <20190523152007.GH2373@zion.uk.xensource.com>
 <5CE6BCA70200007800231C92@prv1-mh.provo.novell.com>
 <23880.16947.795708.667141@mariner.uk.xensource.com>
In-Reply-To: <23880.16947.795708.667141@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0150.eurprd05.prod.outlook.com
 (2603:10a6:207:3::28) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3a90146-7532-448e-9b5e-08d719bcd767
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2413; 
x-ms-traffictypediagnostic: MN2PR18MB2413:
x-microsoft-antispam-prvs: <MN2PR18MB2413E0AFEDD5CD800EC428C6B3DA0@MN2PR18MB2413.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(189003)(199004)(31686004)(6512007)(229853002)(53936002)(6116002)(99286004)(2906002)(6486002)(3846002)(102836004)(6246003)(4326008)(7736002)(26005)(6506007)(53546011)(71200400001)(386003)(8936002)(71190400001)(6436002)(52116002)(5660300002)(316002)(54906003)(81166006)(186003)(14454004)(256004)(81156014)(8676002)(25786009)(66066001)(68736007)(76176011)(80792005)(6916009)(486006)(305945005)(478600001)(446003)(476003)(86362001)(2616005)(66476007)(31696002)(66446008)(11346002)(66946007)(66556008)(36756003)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2413;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ljTOTQqZpru3gAuEGe5KttnlNv1neyrc/2JSxMghKJo2Eo5zxHLFfUU0PgWyWbfQ4u30biQMrbk2EVLW/wFykpfMA44t1LT/pDYtQSYt4F2gQKMLnREWOwyB8XgVOWUCGVJqbhY3916SPOtvDex1IQg7SfCXmpg8WsqM9IUQSYhYOzP4Z94K9n2rg2KkGnYb8+fPyt8KH/+hUVbB8aGN/DRjA9cMULp69vU5HfJOMFA7edv1GcGkev6GkOcVqPFJaHmHdEXb7dJ4ctiAMeW+dTdIJI0LgKxrMs/ef5esu4hCHnNS3hsXuq/Oc11Exijrj1yWeUfMNQV6Ypg/YKzl0wqjryxBILZK1cPkOTUWQTMtDpgoPfUiwL9LZOnfCmMco9bLxjYORh4HCEURnf6kv/I75zmGRuXulL7HlYrAEp4=
Content-ID: <50A1D864EBCC264493BF3A0D852D344E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a90146-7532-448e-9b5e-08d719bcd767
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 15:51:55.6980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2413
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNjo1MCwgSWFuIEphY2tzb24gd3JvdGU6DQo+IEphbiBCZXVsaWNoIHdy
aXRlcyAoIlJlOiBbUEFUQ0hdIGxpYmFjcGk6IHJlcG9ydCBQQ0kgc2xvdHMgYXMgZW5hYmxlZCBv
bmx5IGZvciBob3RwbHVnZ2FibGUgZGV2aWNlcyIpOg0KPj4+Pj4gT24gMjMuMDUuMTkgYXQgMTc6
MjAsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToNCj4+PiBPbiBUaHUsIE1heSAyMywgMjAx
OSBhdCAwMjo1Nzo0OUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMjIu
MDUuMTkgYXQgMjA6MTAsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+
IERTRFQgZm9yIHFlbXUteGVuIGxhY2tzIF9TVEEgbWV0aG9kIG9mIFBDSSBzbG90IG9iamVjdC4g
SWYgX1NUQSBtZXRob2QNCj4+Pj4+IGRvZXNuJ3QgZXhpc3QgdGhlbiB0aGUgc2xvdCBpcyBhc3N1
bWVkIHRvIGJlIGFsd2F5cyBwcmVzZW50IGFuZCBhY3RpdmUNCj4+Pj4+IHdoaWNoIGluIGNvbmp1
bmN0aW9uIHdpdGggX0VKMCBtZXRob2QgbWFrZXMgZXZlcnkgZGV2aWNlIGVqZWN0YWJsZSBmb3IN
Cj4+Pj4+IGFuIE9TIGV2ZW4gaWYgaXQncyBub3QgdGhlIGNhc2UuDQo+Pj4+Pg0KPj4+Pj4gcWVt
dS1rdm0gaXMgYWJsZSB0byBkeW5hbWljYWxseSBhZGQgX0VKMCBtZXRob2Qgb25seSB0byB0aG9z
ZSBzbG90cw0KPj4+Pj4gdGhhdCBlaXRoZXIgaGF2ZSBob3RwbHVnZ2FibGUgZGV2aWNlcyBvciBm
cmVlIGZvciBQQ0kgcGFzc3Rocm91Z2guDQo+Pj4+PiBBcyBYZW4gbGFja3MgdGhpcyBjYXBhYmls
aXR5IHdlIGNhbm5vdCB1c2UgdGhlaXIgd2F5Lg0KPj4+Pj4NCj4+Pj4+IHFlbXUteGVuLXRyYWRp
dGlvbmFsIERTRFQgaGFzIF9TVEEgbWV0aG9kIHdoaWNoIG9ubHkgcmVwb3J0cyB0aGF0DQo+Pj4+
PiB0aGUgc2xvdCBpcyBwcmVzZW50IGlmIHRoZXJlIGlzIGEgUENJIGRldmljZXMgaG90cGx1Z2dl
ZCB0aGVyZS4NCj4+Pj4+IFRoaXMgaXMgZG9uZSB0aHJvdWdoIHF1ZXJ5aW5nIG9mIGl0cyBQQ0kg
aG90cGx1ZyBjb250cm9sbGVyLg0KPj4+Pj4gcWVtdS14ZW4gaGFzIHNpbWlsYXIgY2FwYWJpbGl0
eSB0aGF0IHJlcG9ydHMgaWYgZGV2aWNlIGlzICJob3RwbHVnZ2FibGUNCj4+Pj4+IG9yIGFic2Vu
dCIgd2hpY2ggd2UgY2FuIHVzZSB0byBhY2hpZXZlIHRoZSBzYW1lIHJlc3VsdC4NCj4+Pj4+DQo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4
LmNvbT4NCj4+Pj4NCj4+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCj4+Pj4NCj4+Pg0KPj4+IEphbiwgRkFPRCBzaW5jZSB5b3UncmUgdGhlIG1haW50YWlu
ZXIgSSdtIGV4cGVjdGluZyB5b3UgdG8gcHVzaCB0aGlzDQo+Pj4gcGF0Y2ggeW91cnNlbGYuDQo+
Pg0KPj4gU3VyZSwgSSBoYXZlIGl0IG9uIG15IGxpc3Qgb2YgdGhpbmdzIHRvIHB1c2guDQo+IA0K
PiBJcyB0aGlzIGEgYmFja3BvcnQgY2FuZGlkYXRlID8gIEl0IHNvdW5kcyBsaWtlIGl0IG1pZ2h0
IGJlIGEgYnVnZml4DQo+IGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHJpc2tzL2ltcGxpY2F0
aW9ucy4NCg0KSSBkaWQgYWxyZWFkeSB0YWtlIHRoZSBsaWJlcnR5IG9mIGJhY2twb3J0aW5nIHRo
aXMgKGJhY2sgaW4gSnVuZSkuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
