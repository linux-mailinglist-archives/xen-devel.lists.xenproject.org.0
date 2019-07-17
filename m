Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52F6B93B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hngFP-0003RF-Jf; Wed, 17 Jul 2019 09:29:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hngFO-0003RA-LK
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:29:14 +0000
X-Inumbo-ID: 529afbae-a875-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 529afbae-a875-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 09:29:13 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 09:29:05 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 09:28:49 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 09:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6LqEiG+78t8cVLNPhIF/MbbmF4RK6TgMxnaQmEw6rctpkTkQH6Q7yIjUZZr8opnclY/BF6XWrZlNUw9KgY8FhOB4EEUqLmO54JoY1H2eViOlU1EXjTn34BpQisnEGo9Fj50JuzJym/aUBOdWufUsaJ8ArsyMjmqmHCOVs3eKcXkzI29CIVgUaVp/msIxeQc2bkYdaM17k5FBdB/P9AF+DFt0xf3wprcrIaRDLQBC8iT0MKCr4pdpsJPcj3iQ+mMTWllwTXWsTvRBSeW8e1KOMWBK2rO2JbmRVorv0qnmak7XivJ9iOksle0/ZyjRWWNBc30g/Tf06qXZGYlAvWPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIr2kV0o2eOkvu2WxpaUWtvesmpKQGVB0p/d7KzL+l8=;
 b=dZm3oXB1Bfs1MmPvgiWTNkf8ZgQjDkz1ampRcggc9k1poyNyvf8s8IKyiEXpAoCH1jq1fO5bdpo7qwInI9FLSRafYR7k13WiAa7s/mcWB/qUlBo6EqC5NMyifLwFc/Ji64dbIrD6Z+uv34whCdoDqe8SAoKXsW1Lv5xdmdKwjjSWMB/jgQOC7Z7nx0aYtBZWqAW8EXK2ogTYPBT3+7UbwAQ6LEc5ndm5hlxcLIYJSVBNPjBFg3JsHEV7hzFlhwCMsE4qb8FVj02p1q5tBtiU5eBCrkTg89vHGc3scWRVmPRmKbdT+xX61/SCFjFUmtktV77EjsNZCPr7X8xNiorf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2395.namprd18.prod.outlook.com (20.179.71.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.15; Wed, 17 Jul 2019 09:28:48 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:28:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Thread-Topic: [PATCH v2 03/10] vm_event: Add 'struct domain' backpointer to
 vm_event_domain.
Thread-Index: AQHVO/jj9FRgKIqTq0yUgGv4CypWM6bOjBoA
Date: Wed, 17 Jul 2019 09:28:48 +0000
Message-ID: <464cc39c-a965-42c9-df1c-4036b3304e42@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <c7e5c600bbe00646d35eb3fa65b1894f7146e0df.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <c7e5c600bbe00646d35eb3fa65b1894f7146e0df.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0049.eurprd06.prod.outlook.com
 (2603:10a6:10:120::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7b1288b-c181-491d-b00a-08d70a992c0d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2395; 
x-ms-traffictypediagnostic: DM6PR18MB2395:
x-microsoft-antispam-prvs: <DM6PR18MB239509FE3B7CAB8C7EE946CBB3C90@DM6PR18MB2395.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(80792005)(229853002)(64756008)(66946007)(66476007)(66446008)(8936002)(486006)(4326008)(316002)(86362001)(31696002)(66556008)(6486002)(11346002)(256004)(2906002)(446003)(71190400001)(71200400001)(478600001)(54906003)(36756003)(81166006)(68736007)(4744005)(14444005)(5660300002)(7736002)(3846002)(6116002)(6916009)(305945005)(6506007)(53546011)(102836004)(386003)(81156014)(6246003)(52116002)(76176011)(99286004)(186003)(8676002)(31686004)(2616005)(6436002)(53936002)(26005)(14454004)(6512007)(476003)(7416002)(66066001)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2395;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PSonUfSPiP6jQl9VCZlLNu8Lhtpn1yroSFQ63LNMxvwcBn0zrskS5vmWWpOQjY2BuJ6R8kfm2F1FxGBD/MXa/5Tq12ejIstp8ZzD75KY+Abc/cpB4LniyITm0ythFqjWuVeADMelywIX2fVB/zb2PooDIP7i3Xqp2kO6kMnSK9YqRo2wmV6Ct2VzfpFHpr9Jb2tvpDtc2wffueTQdYcxG+EKIOn59S6OY+vibWVsWiuyD34DwK3jckNdqU+M9t3TZkaMgvvMv1FimLi9aXcMdP4xLIxc1fh97EwqOFQQQtHaWHoaEqiOsAk+xU7LX49QLS21hM8b5/Mn1fVMCFGW9aj3dhI59A36AG0KrqKhkWsf7AKFAYL7g7XczZ6V8sRpM38IWxLY1bJ2g8vzVxJP5EZQYm3TUftHgELo5lvogrU=
Content-ID: <CAE81F9A04E402419E10103935276A98@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b1288b-c181-491d-b00a-08d70a992c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:28:48.3472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2395
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 03/10] vm_event: Add 'struct domain'
 backpointer to vm_event_domain.
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOg0KPiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiBA
QCAtMjc5LDYgKzI3OSw4IEBAIHN0cnVjdCB2Y3B1DQo+ICAgLyogVk0gZXZlbnQgKi8NCj4gICBz
dHJ1Y3Qgdm1fZXZlbnRfZG9tYWluDQo+ICAgew0KPiArICAgIC8qIERvbWFpbiByZWZlcmVuY2Ug
Ki8NCj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkOw0KPiAgICAgICBzcGlubG9ja190IGxvY2s7DQo+
ICAgICAgIC8qIFRoZSByaW5nIGhhcyA2NCBlbnRyaWVzICovDQo+ICAgICAgIHVuc2lnbmVkIGNo
YXIgZm9yZWlnbl9wcm9kdWNlcnM7DQoNClRoaXMgc3RydWN0dXJlIHNob3VsZCBhY3R1YWxseSBt
b3ZlIG91dCBvZiBoZXJlLCBub3cgdGhhdCBpdA0KaGFzIGJlZW4gb25seSBwb2ludGVycyB3aGlj
aCBvdGhlciBzdHJ1Y3R1cmVzIGluIHRoaXMgaGVhZGVyDQp1c2UuIERvaW5nIHNvIHdvdWxkIHNp
bXBsaWZ5IHRoZSBwcm9jZXNzIG9mIGdldHRpbmcgYWNrcyBmb3INCmNoYW5nZXMgbGlrZSB0aGlz
IG9uZS4NCg0KSmFuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
