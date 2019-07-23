Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F571CAE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:18:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxSA-0002xv-Is; Tue, 23 Jul 2019 16:15:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpxS8-0002xp-Hr
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:15:48 +0000
X-Inumbo-ID: 20de1198-ad65-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20de1198-ad65-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 16:15:47 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 16:11:49 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 16:09:40 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 16:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGFX7MQZW+yWHyCnEblBcCIDrUEy94zwYewe1jp4A+MPTM63XZiHARgFuwMB1+h60TrsQ9Apoq74Ko2KuS3JYhcP1Ywh2ThHJz2kSIYF8wxWyp7T4jsE5/M9ytDUYH+arNzLuDaUmI5rMsAJDQPdgMWGUEvV2tomPdPEt7Ejy2cPm4E7Uj+Vv3GVWRjeYu9wGaN610vT23x9H8xvltojE+cI/ZDF/H9O6yy/5YRwPCLklOdUbtDIOVRSK66YYSzT8Kv47bE3wCgzgF0Wq3ilTeSVeVL0IUsID20APMXqPBwBdDNV4alp+mYeORbZyixC4LhEYPjYU5eSTZr5Iq7xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AccA2uSwIlwi8bTmbs8rr+AaKqsmRO45PG3QNYoxyEw=;
 b=Z9lUcRnlCsOGMcr0VbqxvFFPJJQmwagGqKih+rXAQUGhTR4WHux/i4ZBNab07MyCIZupS4HKdOwIl5YQXtxMV09OCwKLMpDYqnk1jNEPefTzv01V7IDUoacqcWPjUqAaubVX/c2wP6TWREhteL38Xlgqvg6bb6gFR5YdOE3V3rvJ9J3gfPATymMuwrBnNzWrdMk1XNE1jMZrFl9mTz9iFKlcuuarUQhnjFPLe6f7bO0AFeZjMbR/CUsD4PSQlxzbPshPy08jLqBIQZ51xIMNkOuzJpWIki4Y1ggKB5J5gK1sTzbYA77GmGLmt2z7rRsPTXau//mevAbd7PRtSgZFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3388.namprd18.prod.outlook.com (10.255.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 16:09:38 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 16:09:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/2] x86/iommu: avoid mapping the APIC configuration
 space for hwdom
Thread-Index: AQHVQW4zrYUYVM3HpUS5nJG7cGq72KbYXymA
Date: Tue, 23 Jul 2019 16:09:38 +0000
Message-ID: <5017c875-a59d-e7d1-c8fc-325b4208d15e@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-3-roger.pau@citrix.com>
In-Reply-To: <20190723154851.77627-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cf34f2d-54d7-41ed-9063-08d70f882984
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3388; 
x-ms-traffictypediagnostic: DM6PR18MB3388:
x-microsoft-antispam-prvs: <DM6PR18MB33887C92798DDC5292468CF5B3C70@DM6PR18MB3388.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(189003)(199004)(52116002)(31696002)(81166006)(14454004)(305945005)(5660300002)(99286004)(6246003)(2616005)(26005)(36756003)(53936002)(446003)(7736002)(2906002)(86362001)(3846002)(6116002)(81156014)(8936002)(6512007)(76176011)(14444005)(316002)(6436002)(68736007)(66066001)(66476007)(71190400001)(64756008)(256004)(6486002)(71200400001)(4326008)(476003)(66946007)(186003)(25786009)(66446008)(478600001)(66556008)(31686004)(11346002)(53546011)(486006)(54906003)(102836004)(386003)(8676002)(6916009)(80792005)(6506007)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3388;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SaYU1c6MZNp9UbsJLbgCnzYo8IuDIT0ZmG29Slm3DvpGerBEvIvDrMnQev67DUX7L8HXuV6r+mBl95Bm1KKaZBZU4D+11+uS7dxoWUuTWzN+t9CUgHwEDGsMMsSdyDthKKo4JU8rFQf3vHGlOOFVN8NfO4LZMRGhIo6xVaSVzLLY6SkbBhMbs0codeGyIv2z4yOrJL+X0/eO9fgHxjjjHvkIBkzPoffjV6rUNle6ydS56kD0POSTYAh/wK7xDo4ReRvThUhhhHoRZMFg05oRoVxey/VzzUOZBILwLT1of7yvKdvknQwScYTPMO0q5DLpxJSyPY0npxwOZe5Ztv191f8T8Uo1slP2lh1YuOGYxc7wkNJhJw144CsfYo2G+wsuKfb4BPayKjKELf7kSxhnGllRIzDwRqZ/niewCI4s0uE=
Content-ID: <0885ABCFA3BF424EA8A1A2DC97F61702@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf34f2d-54d7-41ed-9063-08d70f882984
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 16:09:38.4685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3388
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] x86/iommu: avoid mapping the APIC
 configuration space for hwdom
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNzo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDdXJyZW50IGNv
ZGUgb25seSBwcmV2ZW50cyBtYXBwaW5nIHRoZSBpby1hcGljIHBhZ2UgaW50byB0aGUgZ3Vlc3QN
Cj4gcGh5c2ljYWwgbWVtb3J5IG1hcC4gRXhwYW5kIHRoZSByYW5nZSB0byBiZSAweEZFQ3hfeHh4
eCBhcyBkZXNjcmliZWQNCj4gaW4gdGhlIEludGVsIDMgU2VyaWVzIENoaXBzZXQgRGF0YXNoZWV0
IHNlY3Rpb24gMy4zLjEgIkFQSUMNCj4gQ29uZmlndXJhdGlvbiBTcGFjZSAoRkVDMF8wMDAwaOKA
k0ZFQ0ZfRkZGRmgpIi4NCj4gDQo+IEFNRCBhbHNvIGxpc3RzIHRoaXMgYWRkcmVzcyByYW5nZSBp
biB0aGUgQU1EIFNSNTY5MCBEYXRhYm9vaywgc2VjdGlvbg0KPiAyLjQuMiAiTm9uLVNCIElPQVBJ
QyBTdXBwb3J0Ii4NCg0KQnV0IHRoYXQncyBjaGlwc2V0IHNwZWNpZmljLiBJIGRvbid0IHRoaW5r
IHdlIGNhbiBibGluZGx5IGFzc3VtZQ0KdGhpcyByYW5nZS4gSnVzdCBpbiBjYXNlIG9uZSBzbWFs
bCByZW1hcmsgb24gdGhlIGNoYW5nZSBpdHNlbGYgYXMNCndlbGw6DQoNCj4gQEAgLTIyOSwxMCAr
MjI5LDkgQEAgc3RhdGljIGJvb2wgX19od2RvbV9pbml0IGh3ZG9tX2lvbW11X21hcChjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgICAvKiBDaGVjayB0aGF0IGl0IGRvZXNuJ3Qgb3Zlcmxh
cCB3aXRoIHRoZSBJbnRlcnJ1cHQgQWRkcmVzcyBSYW5nZS4gKi8NCj4gICAgICAgaWYgKCBwZm4g
Pj0gMHhmZWUwMCAmJiBwZm4gPD0gMHhmZWVmZiApDQo+ICAgICAgICAgICByZXR1cm4gZmFsc2U7
DQo+IC0gICAgLyogLi4uIG9yIHRoZSBJTy1BUElDICovDQo+IC0gICAgZm9yICggaSA9IDA7IGhh
c192aW9hcGljKGQpICYmIGkgPCBkLT5hcmNoLmh2bS5ucl92aW9hcGljczsgaSsrICkNCj4gLSAg
ICAgICAgaWYgKCBwZm4gPT0gUEZOX0RPV04oZG9tYWluX3Zpb2FwaWMoZCwgaSktPmJhc2VfYWRk
cmVzcykgKQ0KPiAtICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgIC8qIC4uLiBvciB0
aGUgQVBJQyBDb25maWd1cmF0aW9uIFNwYWNlLiAqLw0KPiArICAgIGlmICggcGZuID49IDB4ZmVj
MDAgJiYgcGZuIDw9IDB4ZmVjZmYgKQ0KPiArICAgICAgICByZXR1cm4gZmFsc2U7DQoNCkRlc3Bp
dGUgdGhlIGNoaXBzZXQgZG9jdW1lbnRhdGlvbiBjYWxsaW5nIGl0IGp1c3QgQVBJQywgaW4gb3Vy
DQpjb2RlIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIGEgY29ubmVjdGlvbiB0byBJTy1B
UElDIHdhcw0KbWFkZSwgdG8gYXZvaWQgYW1iaWd1aXR5Lg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
