Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21C78DA1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6S9-0001DG-C6; Mon, 29 Jul 2019 14:16:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs6S8-0001DB-At
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:16:40 +0000
X-Inumbo-ID: 6c9544cd-b20b-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c9544cd-b20b-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 14:16:38 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 14:16:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 14:00:06 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 14:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct15zKb6tjbTunvRemFJ84tZ2Gf67BxHb2DS48fQojo7Llpw7O56agILoSfIVDAedrCNQv2AZF4ikipYkcLa0xBzbnbDD8v1FY7IMSYEg03e/5nVszBiHbfxQVE3xLbfnIE2ODJhkp3qlQ6XDwOlVMFFoC1/8W3d/rPgmSSQ4gE8WfpzPRQRCaTkitXaD989w0aQ6eJxtOV85Io2/6kAbElvbDsLNaAJ4heCXX6ERnEZEBnFheRyVRGnnP/v08CM8wBTA6pFrZJoBxVrazvqY6QK/+jbJlXJkWQROc/TPs5QdVdMxcKUx5tI3fjrYzV+74VvsFTan5U10VOt2K9b1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdltsNFbWtaWIG+wgiEMpgh/57m8Og8VZt5cnW6xZg8=;
 b=HuzuQ1myxOh6rc+ybSjwBN2gG+joknZZCrS0rC0ehBpEQpfUGGU5/jbRo8k4L74j2IADnbyqiNSO0TrZ2/7Pw/E3lmIO54A9kTBysdpuHfivLb2bNWRq60Tu5a/rMTakMomBb1UmT0fUvZWpN9iJna2cA3MUIOkVcmIwKfDEtbipCi/dh4Roi8X1CXhQJ9QUNE0xJKVLS/4toEKNdatC2Ne9p+j1oDwAAh+GM75M/yAYM95gHr/HKEt7t8FKeqW/1VBW37RBuYVNDkUrUTNwHZ2pQdT9XwBm/grC/zDGRBchPXGOJjzPOyZ7Q7GkpSHC4pli2ac94JDi42vLwkFmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3219.namprd18.prod.outlook.com (10.255.137.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 14:00:05 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 14:00:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 1/3] xen: move debugtrace coding to common/debugtrace.c
Thread-Index: AQHVRSA2vhgAAF6AnUuE4HJXiRUWH6bhjJWAgAAM8DaAAAgJgA==
Date: Mon, 29 Jul 2019 14:00:05 +0000
Message-ID: <58a04e6c-8dbc-198c-cfb2-16a5b626bfb8@suse.com>
References: <20190728084100.13071-1-jgross@suse.com>
 <20190728084100.13071-2-jgross@suse.com>
 <014a658d-c2d5-0497-a2b3-793997f952ad@suse.com>
 <1895d2d8-db34-8c93-09c2-56f11b890cd6@suse.com>
In-Reply-To: <1895d2d8-db34-8c93-09c2-56f11b890cd6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::15)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 753fa56a-f50e-4f56-6aca-08d7142d0ec5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3219; 
x-ms-traffictypediagnostic: BY5PR18MB3219:
x-microsoft-antispam-prvs: <BY5PR18MB32199E72672CEFEFD2713259B3DD0@BY5PR18MB3219.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(6862004)(66476007)(66946007)(66556008)(64756008)(66446008)(486006)(54906003)(31686004)(71190400001)(71200400001)(478600001)(31696002)(80792005)(4326008)(7736002)(476003)(14454004)(86362001)(6246003)(8936002)(66066001)(6116002)(3846002)(6636002)(53546011)(6512007)(186003)(53936002)(6436002)(52116002)(6486002)(2616005)(68736007)(102836004)(2906002)(36756003)(8676002)(229853002)(11346002)(446003)(316002)(5660300002)(37006003)(25786009)(26005)(99286004)(305945005)(6506007)(386003)(256004)(81166006)(81156014)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3219;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0W4jIV/DcYqYAdkoFDPIWH1g8U9IcU4B8mMjNlbg/egzMyzeo9EXLCGtxML3fUUKlT9DUrgXdSVGt4phMPJv2RBezsNirwEZXEWfYE/CAjJDbHxAtHzbIW4FVL2Hx7InTTp73MqyEkBnb+U2hzRSHsemEhZkxLf2UaCJbEa3UOit6O1y6wzE40uG/B6qy9x7IMzw8oy8fsJcdracfbDJ9rlFtM6dF7daYcECHuMaXpfH4hMG0b1U5xdLWfzfDHgirSwvuMtbzKinTflmOV5sQ18Q7jDxySllszfZyA/hxgaUz2xDxoOGBATxy24YsssjJdBNawtpQuseY2hxOcxuFI2S547agWTUIspdXeeUr3WpAx2t0NMZ3dExaQbzoZOOmnlPA3U9EiHw57MRjKLnGnwYoYwXfA5Z1RsnuRJbKFQ=
Content-ID: <8D7CD53AA0495A4EA9AA669AFD37B330@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 753fa56a-f50e-4f56-6aca-08d7142d0ec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 14:00:05.1956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3219
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/3] xen: move debugtrace coding to
 common/debugtrace.c
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

T24gMjkuMDcuMjAxOSAxNTozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjkuMDcuMTkg
MTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjguMDcuMjAxOSAxMDo0MCwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiAtI2VuZGlmIC8qICFDT05GSUdfREVCVUdfVFJBQ0UgKi8NCj4+
PiAtDQo+Pj4gLQ0KPj4+IMKgwqAgLyoNCj4+PiDCoMKgwqAgKiAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+IMKgwqDCoCAq
ICoqKioqKioqKioqKioqKiBEZWJ1Z2dpbmcvdHJhY2luZy9lcnJvci1yZXBvcnQgKioqKioqKioq
KioqKioqDQo+Pg0KPj4gLi4uIHdoYXQgYWJvdXQgdGhpcyBvbmU/IFRoZXJlJ3Mgb25seSBwYW5p
YygpIGJldHdlZW4gaXQgYW5kIHRoZSBuZXh0DQo+PiBzdWNoIGNvbW1lbnQsIGFuZCBJIGRvbid0
IHRoaW5rIHRoZSAiRGVidWdnaW5nL3RyYWNpbmciIHBhcnQgb2YgaXQNCj4+IGFyZSBhcHBsaWNh
YmxlIChhbnltb3JlKS4NCj4gDQo+IFRydWUuIEknbGwgcmVtb3ZlIHRoZSAiRGVidWdnaW5nL3Ry
YWNpbmciIHBhcnQuDQo+IA0KPj4NCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5o
DQo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaA0KPj4+IEBAIC00OCw0ICs0OCw4
IEBAIGludCBjb25zb2xlX3Jlc3VtZSh2b2lkKTsNCj4+PiDCoMKgIGV4dGVybiBpbnQ4X3Qgb3B0
X2NvbnNvbGVfeGVuOw0KPj4+ICsvKiBJc3N1ZSBzdHJpbmcgdmlhIHNlcmlhbCBsaW5lLiAqLw0K
Pj4+ICtleHRlcm4gaW50IHNlcmNvbl9oYW5kbGU7DQo+Pj4gK3ZvaWQgc2VyY29uX3B1dHMoY29u
c3QgY2hhciAqcyk7DQo+Pg0KPj4gSSBndWVzcyBhdm9pZGluZyB0aGVpciBleHBvc3VyZSB3YXMg
b25lIG9mIHRoZSByZWFzb25zIHRoZSBkZWJ1ZyB0cmFjZQ0KPj4gY29kZSBsaXZlZCBpbiB0aGUg
cGxhY2UgeW91IG1vdmUgaXQgZnJvbS4gSSdtIHVuY29udmluY2VkIG5vbi1jb25zb2xlDQo+PiBj
b2RlIGlzIGFjdHVhbGx5IHN1cHBvc2VkIHRvIG1ha2UgdXNlIG9mIGVpdGhlciwgYnV0IEknbSBu
b3Qgb3Bwb3NlZA0KPj4gZW5vdWdoIHRvIG5hayB0aGUgY2hhbmdlLiBJIGRvbid0IHRoaW5rIHRo
b3VnaCB0aGUgY29tbWVudCBmaXRzIHdlbGwNCj4+IHdpdGggdGhlIHZhcmlhYmxlIGRlY2xhcmF0
aW9uLg0KPiANCj4gc2VyY29uX2hhbmRsZSBpcyB1c2VkIGZvciBjYWxsaW5nIHNlcmlhbF9wdXRz
KCksIHNvIG1heWJlIGluc3RlYWQgb2YNCj4gZGlyZWN0bHkgdXNpbmcgc2VyaWFsX3B1dHMoKSB3
aXRoIHNlcmNvbl9oYW5kbGUgSSBzaG91bGQgYWRkIGEgd3JhcHBlcg0KPiB0byBjb25zb2xlLmMg
KGUuZy4gY29uc29sZV9zZXJpYWxfcHV0cygpKT8gSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQNCj4g
c2VyaWFsX3B1dHMoKSBpcyBjYWxsZWQgb25seSBpbiBjYXNlIG9mIGRlYnVndHJhY2Ugb3V0cHV0
IHRvZ2dsZWQgdG8gZ28NCj4gdG8gdGhlIGNvbnNvbGUuIEkgZ3Vlc3MgdXNpbmcgc2VyaWFsX3B1
dHMoKSBpbiB0aGF0IGNhc2UgaXMgbWVhbnQgdG8NCj4gYXZvaWQgdG9vIG1hbnkgc29mdHdhcmUg
bGF5ZXJzIHdoZW4gZG9pbmcgdGhlIG91dHB1dC4NCg0KSG1tLCBJJ2QgcmF0aGVyIGV4cGVjdCB0
aGlzIHRvIGJlIHVzZWQgdG8gYXZvaWQgZG9pbmcgYW55dGhpbmcgZWxzZQ0Kc2VyY29uX3B1dHMo
KSBkb2VzIGJlc2lkZXMgY2FsbGluZyBzZXJpYWxfcHV0cygpLiBUaGVzZSBvdGhlciBzdGVwcw0K
YXJlIGFsc28gd2h5IEkgdGhpbmsgdGhpcyBpcyB0byByZW1haW4gYSBjb25zb2xlIGludGVybmFs
IGludGVyZmFjZS4NCg0KPiBJdCB3b3VsZCBiZQ0KPiBwb3NzaWJsZSB0byB1c2Ugc2VyY29uX3B1
dHMoKSBmb3IgdGhhdCBjYXNlLCB0b28sIHJlc3VsdGluZyBpbiB0aGUNCj4gaW5hYmlsaXR5IHRv
IHVzZSBkZWJ1Z3RyYWNlX3ByaW50aygpIGluIHRoZSB0aGVuIGFkZGl0aW9uYWxseSBuZWVkZWQN
Cj4gcGF0aHMgKG9yIGJldHRlcjogdG8gdXNlIGl0IHdpdGggb3V0cHV0IHJlZGlyZWN0ZWQgdG8g
Y29uc29sZSkuDQo+IA0KPiBzZXJjb25fcHV0cygpIGNvdWxkIHVzZSBhbm90aGVyIHdyYXBwZXIs
IGUuZy4gY29uc29sZV9kZWJ1Z19wdXRzKCkuDQo+IA0KPiBXb3VsZCB5b3UgbGlrZSB0aGF0IGJl
dHRlcj8NCg0KUHJvYmFibHkgbm90LiBJIHdvbmRlciB3aGV0aGVyIHNwbGl0dGluZyBvdXQgdGhp
cyBjb2RlIGlzIHJlYWxseSBhDQpnb29kIHN0ZXAuDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
