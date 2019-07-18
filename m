Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923A6D0AE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7xz-0001RL-DS; Thu, 18 Jul 2019 15:05:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho7xx-0001RE-2H
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:05:05 +0000
X-Inumbo-ID: 66ed88e2-a96d-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 66ed88e2-a96d-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:05:04 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:04:54 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:04:54 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnlMzfiuDQoj4npFsXANyyipexbFYl07EqFYjhfC5PN9wlccLF3KHmFJ3mvZyOC6nkv3WQc2E89UQ38tToYVF8Y+Lc1cEop96RF93+Ldm1mkMcpL2MHXMPQMkA7iFwuIrtPFhUuOj7s3lzuETY3nsitebKIF5rZLk5dQ04duu4TcLO4y4T0JfWSMFRvxj9KAU5rV0P7ybeeNT1SwNIHpz1A6jHLIJL/vav0OF9+b314TWmLdpXlWf8Z87u5kCQYUZk+ZoODqLf/sEulv91EO+NT72c2vSAF6tZqqvbu1t6QgTog4f9H4Y+soVn2ntJAYTnFQTQBeekq11l7pkn1aGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFcM+bJFWq1Vma8BXCN6RK1vK6nCujzKQCqbeNia/38=;
 b=ITZBhCVe/tJHOlZCa/1jo9VkZoApoiugp7LhWQkXjjz97ys4hAy53sIjynarjynAmY2MuEN75wvxUU1Wk//gf/8B9jWrTZjMT+MaLt7WjiSQ8DonCsdlVN2an/DQoMRSER+kksWYIF+Jc9e2pQG3IBs3uZNTjp+PQOKKhUV1uHIksm25TEbnDU2dss3ncg5/Wg5OPIQ8GYf1cloDaegIyWATZexBlUqxhgnPKZOh31XKquvWcaJGoveWLIju8Qrbc+RtaZsKAteTpDlj1Bda/RfxypLokgESFAMjxl9y/YmxjXXNQXWV4WmDKOd2r9GfsPaUs+Qdyf0w626xjWANrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2475.namprd18.prod.outlook.com (20.179.104.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:04:52 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:04:52 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
Thread-Index: AQHVPU7dWxB3gAbicEW8M/sijNABxqbQOA+AgAAzR5uAAA5VgA==
Date: Thu, 18 Jul 2019 15:04:52 +0000
Message-ID: <225f4ccb-d216-98cf-3615-e5196450ea58@suse.com>
References: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
 <abf62099-b848-b7ec-b665-52a2dce755b7@suse.com>
 <17c91de8-dbdb-7c56-08e4-a18b900783d3@gmail.com>
In-Reply-To: <17c91de8-dbdb-7c56-08e4-a18b900783d3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0102CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:8::49) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3be1efd-9849-4c3b-e56e-08d70b914955
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2475; 
x-ms-traffictypediagnostic: DM6PR18MB2475:
x-microsoft-antispam-prvs: <DM6PR18MB247514FBDEADD95CB65A0836B3C80@DM6PR18MB2475.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(52314003)(52116002)(81156014)(81166006)(6916009)(14454004)(4326008)(229853002)(6512007)(80792005)(186003)(5660300002)(31696002)(316002)(66066001)(478600001)(66946007)(2906002)(66556008)(66446008)(64756008)(66476007)(54906003)(86362001)(256004)(6436002)(6486002)(14444005)(446003)(31686004)(68736007)(11346002)(305945005)(8676002)(3846002)(476003)(2616005)(99286004)(7736002)(8936002)(71190400001)(71200400001)(36756003)(6246003)(486006)(76176011)(102836004)(6506007)(6116002)(53546011)(386003)(107886003)(26005)(53936002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2475;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UiOgMm4YfOysD96SDwATty//0DJxZ0wTdPEXNH3yjYG8OYVjby9C+f+KCgcl71I4kQdYUFElX3wsHVUd+4BzPjg3LavoPx1ZDYGwd4lcNwbFmpgosGt9zQp/frZxDQlTIAfE6ZrkmEm6yX/qrOhAMXB8psxVqF5j1ctNHNlCQ50eSUa8t8OsAedm1mITkEVP6OERHixQ0NEBWvkWQz1z2GoVugS6v0m+EfVj0oIrCYN+rIADMCx0t+jlYiQz1l1VGt+/CB5UwuhUsyevlYeD/7W0OyuxnT6yWNzODH1owwB8h5+aQ62ZCBTHCW8VzaFAtDk4cRf7NNCoqF9uTWXan7tBh1CaC7LannfCpLrkPN0BIulxL5ehuXMKPtBhf6XVfviqPsV6Q/Hsdzwsry4tZOFqLTiZjmtPpUszQtDDtsw=
Content-ID: <723840FDBBF48F43B60074C45D2054E5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a3be1efd-9849-4c3b-e56e-08d70b914955
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:04:52.6213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2475
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNjoxMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToNCj4gT24gMTguMDcuMTkg
MTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gQSBjb25jcmV0ZSBzY2VuYXJpbyB3aGVyZSB1
cGRhdGVfcnVuc3RhdGVfYXJlYSgpIGFuZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgpDQo+PiBjYW4g
YWN0dWFsbHkgcmFjZSB3b3VsZCBiZSB2ZXJ5IHdvcnRod2hpbGUgdG8gcG9pbnQgb3V0IGhlcmUu
IEluIHBhcnRpY3VsYXINCj4+IG9uIEFybSBJJ20gbm90ICh5ZXQ/KSBzZWVpbmcgaG93IHRoaXMg
Y291bGQgaGFwcGVuLg0KPiANCj4gVGhlIHNjZW5hcmlvIGlzIHF1aXRlIHRyaXZpYWw6IHNvbWUg
dmNwdSB1cHRkYXRpbmcgaXRzIHJ1bnN0YXRlIHZhbHVlcw0KPiAoZS5nLiBjb250ZXh0IHN3aXRj
aGluZykgd2hpbGUgdGhvc2UgdmFsdWVzIGFyZSBiZWluZyByZWFkIGJ5IGEgZ3Vlc3QgdXNpbmcN
Cj4gb3RoZXIgdmNwdS4NCg0KV2VsbCwgdGhhdCdzIChhZmFpYSkgbm90IGFuIGludGVuZGVkIHVz
YWdlIHNjZW5hcmlvLiBUaGF0J3Mgc3BlY2lmaWNhbGx5DQp3aGF0IHRoZSBYRU5fUlVOU1RBVEVf
VVBEQVRFIGZsYWcgd2FzIGludHJvZHVjZWQgZm9yOiBUaGlzIHdheSBndWVzdHMNCmNhbiBub3Rp
Y2UgdGhhdCB0aGV5IHNob3VsZG4ndCB1c2UgdGhlIHZhbHVlcywgYXMgdGhleSdyZSBsaWtlbHkN
CmluY29uc2lzdGVudC4gVGhleSdkIHBhdXNlIGZvciBhIGJyaWVmIG1vbWVudCBhbmQgbWFrZSBh
bm90aGVyIGF0dGVtcHQ7DQpzZWUgTGludXgnZXMgeGVuX2dldF9ydW5zdGF0ZV9zbmFwc2hvdF9j
cHVfZGVsdGEoKS4NCg0KQnV0IG5laXRoZXIgZnJvbSB0aGUgY29kZSBjaGFuZ2Ugbm9yIGZyb20g
dGhlIGRlc2NyaXB0aW9uIEkgd291bGQgaGF2ZQ0KaW1wbGllZCB0aGF0IGl0J3MgYSBndWVzdCBz
aWRlIHByb2JsZW0geW91J3JlIHRyeWluZyB0byBhZGRyZXNzLiBTbw0KZmFyIEkgd2FzIGFzc3Vt
aW5nIHlvdSBoYWQgZm91bmQgYSByYWNlIGluIFhlbiBpdHNlbGYuDQoNCj4+IENvbnNpZGVyaW5n
IHRoZSB2YWx1ZSBvZiBYRU5fUlVOU1RBVEVfVVBEQVRFIGl0IG11c3QgYmUgYSByYXRoZXIgcmFy
ZSByYWNlDQo+PiBhbnl3YXksIEkgd291bGQgZ3Vlc3MuDQo+IA0KPiBJJ20gbm90IHN1cmUgaG93
IGRvIHlvdSBsaW5rIHRoZSB2YWx1ZSBvZiBYRU5fUlVOU1RBVEVfVVBEQVRFIGFuZCB0aGUgaXNz
dWUNCj4gb2NjdXJyZW5jZSByYXRlLiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgbW9yZSBkZXRh
aWxzIGFib3V0IHRoZSBpZGVhPw0KDQpUaGUgdmFsdWUgaXMgaHVnZSwgaGVuY2UgaXQgYmVpbmcg
d3JvbmdseSBwYXJ0IG9mIGEgY2FsY3VsYXRpb24gb3VnaHQgdG8NCmJlIGVhc2lseSBub3RpY2Vh
YmxlIF9pZl8gaXQgb2NjdXJyZWQgb2Z0ZW4gZW5vdWdoLg0KDQpKYW4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
