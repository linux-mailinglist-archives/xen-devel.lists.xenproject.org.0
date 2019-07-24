Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E472C2F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 12:14:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqEG1-00055V-IB; Wed, 24 Jul 2019 10:12:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqEG0-00055Q-5k
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 10:12:24 +0000
X-Inumbo-ID: 86a55ef9-adfb-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 86a55ef9-adfb-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 10:12:22 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 10:08:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 10:07:41 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 10:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0wo7E2EWqUzzFLPf+1cYZcG1iDmdTh2QTwnsagOFw6NUQuBIGJ9hzSpbkW0J8J2CNv72UAN+6GCR5x+MltVp23FcZDeR4OSYKv1q0cyDdl4pYhuRukc57sW3mQ8K1kvD6EkYrQIe5ibpCM8pYGaS+UMwdhlv6YwH+/sB2Rh4fdMDFvVxfS8UFb/1xH1IBzqdR2QMpu5JmivY4LewthYS30+iKh/xYZeMHJGpbKakG4abNJOC3fpsG6NPatpjuuSTfvpbOTDpFU+BvIO6yVcMaGbuUoD3rhx3SC6IOCfgqwickb0qFLt54tIm+8COQKGHlny/IOMOgZJpCLBDsEplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71zGrWYcTUQ6svJkRRvp5X6Prp58NS0KUhhyzar1144=;
 b=oSWB8onuF+Ic1dxAMsjfaGutAP1VadgyVCXCYSD54rtcZXicOxAEQjzSiNbZzbmfl5DREUUkasTRvC8nq/eZsq/RDVwjR63lbT+uMqSIu9Rp+Tbuskapki57IYRafEPMr0PjFha9D0QLAkalbSFduDIBSvq2fLgU8yMvspjAN311dyF7eObnL1ecmhcxZmq8zpgagv98t3nEvo7iS9djLiQWlVNG5x+nw5o0Z1/jo2UG7qVgAtU3bsWiGw81a/DU5wVphYWu28LhO/kdwjUdmVEOdulnnVG0npM8i5IlAjSVV1l2kvSnc3weuCUp+tJO5rZ0a4R3oJYVtSnH2VADvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 10:07:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 10:07:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH v2 2/2] xen: merge temporary vcpu pinning scenarios
Thread-Index: AQHVQYQU1WujqebfXkKqWlkiYmjVv6bZjDEA
Date: Wed, 24 Jul 2019 10:07:40 +0000
Message-ID: <0530cd8f-5b00-ae08-15e2-10266ca5dbb8@suse.com>
References: <20190723182530.24087-1-jgross@suse.com>
 <20190723182530.24087-3-jgross@suse.com>
In-Reply-To: <20190723182530.24087-3-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0027.eurprd02.prod.outlook.com
 (2603:10a6:4:a5::13) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 744b4f5a-7f13-44a1-4374-08d7101ec2e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3267; 
x-ms-traffictypediagnostic: BY5PR18MB3267:
x-microsoft-antispam-prvs: <BY5PR18MB32678E389F33A5EACD703662B3C60@BY5PR18MB3267.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(189003)(199004)(66556008)(66476007)(6512007)(64756008)(476003)(305945005)(11346002)(66946007)(66446008)(446003)(6246003)(6862004)(14444005)(53546011)(8676002)(7736002)(2906002)(256004)(2616005)(31696002)(54906003)(86362001)(71200400001)(102836004)(6506007)(386003)(37006003)(229853002)(99286004)(186003)(478600001)(68736007)(26005)(71190400001)(6636002)(76176011)(4326008)(6436002)(486006)(31686004)(36756003)(80792005)(316002)(6486002)(8936002)(53936002)(25786009)(66066001)(52116002)(6116002)(3846002)(81166006)(81156014)(14454004)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3267;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l3nuER3ZbU6B58zaIvbdi4k0n1bPuwKH+nlfY7CllaSlaCvfWtQe6Hgr+F1uNKpmQOTGKy50nFOmasXaGo2dy1Hr40XJQhbTTc3mVvhDXab9dwa0gB5Xj4ovrsTH4pa9blsZuwmeYff8dYNMBJZsRHfvN5D5amjkVTZ/TOOyLQesOdztyIHXVjyZwmO9Y+CJeIN2mkRhyRUgH1PUHrgSY6Q08rJIFdd31Hkxq2qd47ykkUwI9UuVznAeJ3+StMGmiX2wEpJX1LUO8ik7c6jXrkQabR6eaoB6MVLzv2NDpppegIiQO+vCfWthWgTbeMCwG4Jw3PaOza1yGbJTgbImFU/w3HtdOPHQ2AazHwcM5H+kZe/zkBdbq1yY0Air6sftn8XA2WqlFE0RX3g9YHJU6ZEeeLh5SZbAOK8JwJ0m1+0=
Content-ID: <D15D92B0461F254F98AF97A54E2377FC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 744b4f5a-7f13-44a1-4374-08d7101ec2e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 10:07:40.4289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3267
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAyMDoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVG9kYXkgdGhlcmUg
YXJlIHR3byBzY2VuYXJpb3Mgd2hpY2ggYXJlIHBpbm5pbmcgdmNwdXMgdGVtcG9yYXJpbHkgdG8N
Cj4gYSBzaW5nbGUgcGh5c2ljYWwgY3B1Og0KPiANCj4gLSB3YWl0X2V2ZW50KCkgaGFuZGxpbmcN
Cj4gLSB2Y3B1X3Bpbl9vdmVycmlkZSgpIGhhbmRsaW5nDQo+IA0KPiBFYWNoIG9mIHRob3NlIGNh
c2VzIGFyZSBoYW5kbGVkIGluZGVwZW5kZW50bHkgdG9kYXkgdXNpbmcgdGhlaXIgb3duDQo+IHRl
bXBvcmFyeSBjcHVtYXNrIHRvIHNhdmUgdGhlIG9sZCBhZmZpbml0eSBzZXR0aW5ncy4NCj4gDQo+
IFRoZSB0d28gY2FzZXMgY2FuIGJlIGNvbWJpbmVkIGFzIHRoZSBmaXJzdCBjYXNlIHdpbGwgb25s
eSBwaW4gYSB2Y3B1IHRvDQo+IHRoZSBwaHlzaWNhbCBjcHUgaXQgaXMgYWxyZWFkeSBydW5uaW5n
IG9uLCB3aGlsZSB2Y3B1X3Bpbl9vdmVycmlkZSgpIGlzDQo+IGFsbG93ZWQgdG8gZmFpbC4NCj4g
DQo+IFNvIG1lcmdlIHRoZSB0d28gdGVtcG9yYXJ5IHBpbm5pbmcgc2NlbmFyaW9zIGJ5IG9ubHkg
dXNpbmcgb25lIGNwdW1hc2sNCj4gYW5kIGEgcGVyLXZjcHUgYml0bWFzayBmb3Igc3BlY2lmeWlu
ZyB3aGljaCBvZiB0aGUgc2NlbmFyaW9zIGlzDQo+IGN1cnJlbnRseSBhY3RpdmUgKHRoZXkgYXJl
IGFsbG93ZWQgdG8gbmVzdCkuDQoNCkhtbSwgIm5lc3QiIHRvIG1lIG1lYW5zIExJRk8tbGlrZSBi
ZWhhdmlvciwgYnV0IHRoZSBsb2dpYyBpcyBtb3JlIHJlbGF4ZWQNCmFmYWljdC4NCg0KPiBAQCAt
MTI2Nyw3ICsxMjg0LDggQEAgcmV0X3QgZG9fc2NoZWRfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+ICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZz
Y2hlZF9waW5fb3ZlcnJpZGUsIGFyZywgMSkgKQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+ICAg
DQo+IC0gICAgICAgIHJldCA9IHZjcHVfcGluX292ZXJyaWRlKGN1cnJlbnQsIHNjaGVkX3Bpbl9v
dmVycmlkZS5wY3B1KTsNCj4gKyAgICAgICAgY3B1ID0gc2NoZWRfcGluX292ZXJyaWRlLnBjcHUg
PCAwID8gTlJfQ1BVUyA6IHNjaGVkX3Bpbl9vdmVycmlkZS5wY3B1Ow0KDQpJIGRvbid0IHRoaW5r
IHlvdSBtZWFuIHRoZSBjYWxsZXIgdG8gYWNoaWV2ZSB0aGUgc2FtZSBlZmZlY3QgYnkgYm90aA0K
cGFzc2luZyBpbiBhIG5lZ2F0aXZlIHZhbHVlIG9yIE5SX0NQVVMgLSBpdCBzaG91bGQgcmVtYWlu
IHRvIGJlIGp1c3QNCm5lZ2F0aXZlIHZhbHVlcyB3aGljaCBjbGVhciB0aGUgb3ZlcnJpZGUuDQoN
CkV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBmaW5lIHRvIG1lLCB0aGFua3MuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
