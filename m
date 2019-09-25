Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364FBD827
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 08:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD0UQ-0003GG-5w; Wed, 25 Sep 2019 06:09:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD0UO-0003GB-NY
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 06:09:24 +0000
X-Inumbo-ID: 048d9b7a-df5b-11e9-962b-12813bfff9fa
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by localhost (Halon) with ESMTPS
 id 048d9b7a-df5b-11e9-962b-12813bfff9fa;
 Wed, 25 Sep 2019 06:09:23 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 25 Sep 2019 06:07:27 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 25 Sep 2019 06:08:31 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 25 Sep 2019 06:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGw2bnNfwls7sbFmbYaYfTlXjTGPHJ4ILqCQl2a43ZX29hCZqGn/JPfZjZ1+yAFRuennIgGnT+k1UJcAxpQUYySkq9YNQznvCNABJ/0Hth5p1FFAixphc7qr7BxT5xdP8BLa2nsQjLJKASmS+3m0t+tNtSZHPPPQjEiqH4Dbmofs+paZfZn+nB7THYICSTsVY+lFNIvU4MjGtbkCiZ0xwALZRzOEPUUXNDgowJFvQzmjnk+BwB3nHbte+pQdjIpMmhxtEEPxALL44YtkfSkccIeNn/B8Q1JJHt2XjSOpNnCDYlTvybQQMk5b8NiBuWhnJExMwajbcoQG+Pm8gyGdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4onE2qZWetvF1RgzihneNNPw2jPuxX3acVvoZ9w6Nus=;
 b=g5zQADL801paQzTqb/QxogvZeXBs4Gc0sIL5NqD4A3UcXTME4954fboOhhirMoQaOa0iacuuzxOpUd7Pb2N1uXPVdVxt6oavzh7ATqzvuGOFwX+qEfVAuBlXZ9H64cBdCZa5PX0CD4tA8SxsWiZshTc+0DbtMlVItTnOfHqcqhiHw/8UYxxqDGdoUmxa0MXLnmb6c1Slxyk43qGRNFAsYLt1UPPvWn6UX8yFdAxf1u102JQ9kD4Ev8y9nA4OXlCYL96u5WNMTvgIbICdVYiPumkgY7dPZwjbSwM3117rN9kzjfbbfvJAnO/wGHzNJivrF8Y5LHslKzXBSQ2VlNY5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2880.namprd18.prod.outlook.com (20.179.22.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 06:08:30 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::797c:70cc:ad11:d976]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::797c:70cc:ad11:d976%5]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 06:08:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH v2] xen/sched: don't let XEN_RUNSTATE_UPDATE leak into
 vcpu_runstate_get()
Thread-Index: AQHVc1ndKdrgVRDze0yWaCsselS36ac76JMA
Date: Wed, 25 Sep 2019 06:08:29 +0000
Message-ID: <344cdec3-eb1b-14fd-858e-28a79c6ab79d@suse.com>
References: <20190925042917.11392-1-jgross@suse.com>
In-Reply-To: <20190925042917.11392-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::16) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:ca:b712:5537:2cd9:44e2:cf9b:b565]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4b6c558-1d49-4f13-140e-08d7417ec951
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2880; 
x-ms-traffictypediagnostic: MN2PR18MB2880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB2880B54AD12990901B70A805B3870@MN2PR18MB2880.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(6246003)(25786009)(80792005)(46003)(2906002)(31696002)(99286004)(86362001)(6116002)(64756008)(66446008)(66476007)(66556008)(5660300002)(66946007)(186003)(52116002)(76176011)(4744005)(102836004)(53546011)(6506007)(386003)(31686004)(4326008)(7736002)(305945005)(6862004)(14444005)(256004)(6512007)(6636002)(6486002)(6436002)(54906003)(37006003)(71190400001)(71200400001)(316002)(2616005)(229853002)(36756003)(8676002)(478600001)(8936002)(486006)(11346002)(446003)(81166006)(81156014)(14454004)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2880;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VTzCBt3u49TP48cNCN1zSiGJQ389WVBjKMmhXxlCOo7uhZEevKQRhRfhVLFni5kf8o7mnaAiHLm7P4p9Urw5Ud1mQzDsv6SiagBrHHnW0S2UaAUTJhSuy8PVanwPTm94lJ7k5ZvjSPnTkXoqj2IH/X7emCpSJjhGNQANHCLkhm4l7j+3NXUQZBS1nXPkw8Gr9Pp3vE0StrZScXmpZbBjRj4rW/c/I0PAQJXKZ6WtrjIYRCsr/MNaTSMQ5dQ2BJ2imi7Cr8yKATwqgEhMOr5CimLxQWTjVqFLyo3WoZcv7Z6HaI+8WcenFAYp75giYhz8TnmzeHYX5xMkEkRk2XstF9RJbjXEu05Rtvhhxe3qu0C9oUGdvBSQ0DHNkPNQvIHxT/YOU/S2xD8vUs+xWy3umHmgbTyYGNatKLQtV2w0wwM=
Content-ID: <C0A50BE86A7C3042BDCD4699FA91062E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b6c558-1d49-4f13-140e-08d7417ec951
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 06:08:29.9251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNJthNdUyocx31UoE+pnyg0YfW+nX8z1pUkMqsgmhhp9eooAio4+TZtxHDdiKHolyVkM5IJFiTpXIC5DmpB43w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2880
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: don't let XEN_RUNSTATE_UPDATE
 leak into vcpu_runstate_get()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAwNjoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gdmNwdV9ydW5zdGF0
ZV9nZXQoKSBzaG91bGQgbmV2ZXIgcmV0dXJuIGEgc3RhdGUgZW50cnkgdGltZSB3aXRoDQo+IFhF
Tl9SVU5TVEFURV9VUERBVEUgc2V0LiBUbyBhdm9pZCB0aGlzIGxldCB1cGRhdGVfcnVuc3RhdGVf
YXJlYSgpDQo+IG9wZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5Lg0KPiANCj4gVGhpcyBw
cm9ibGVtIHdhcyBpbnRyb2R1Y2VkIHdpdGggY29tbWl0IDI1MjljODUwZWE0OGYwMzYgKCJhZGQg
dXBkYXRlDQo+IGluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4NCj4gDQo+IFJlcG9y
dGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCk9uY2UgYWdhaW4N
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
