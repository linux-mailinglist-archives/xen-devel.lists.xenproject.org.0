Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32706BCC7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 15:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnjez-0004oZ-SF; Wed, 17 Jul 2019 13:07:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnjex-0004oU-Ms
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 13:07:51 +0000
X-Inumbo-ID: e0f0ce34-a893-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e0f0ce34-a893-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 13:07:50 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 13:07:49 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 13:07:05 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 13:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mooYVbEJw1HJcEu9C7bS9aQkBipTm9BlMTI1XFO2ZF4wCZtiqqgvvz2x/gaCfZm7OdoLaZ3sGRXyAqbleMA3gOlA1jD2eb3yZQlclEloM78vqUMubXGBcAjN6gsHS+Byv4It09uE+1aWw730XwxwR4qDtAoiOx9XCA5vVD06nbsLGTiH9etzsb/BGvO5DhL9u3fVtuNN3by7cVv1Fljl+Gg6l83CwPfjKz3v5Xr9QVVf9nqySBzmxIEUMAs6So4Lv1y41NQbzGnGuSj4evi/+29YEHZEkNIMOHyG7ze1PctCV5wqV2LxAeAYoyBpJmzo5QsdbZwiOOL6mBNOPNaHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pePDj41+UxNyeafVIl/3aa8hn4QBgnmCz63epvKj9yU=;
 b=i4qB11foTXUumO+esrhS/s5c3DQRJaBN4xSICVXyCZ5DTrs/ELaHyqPFIgoCJxqpPb3yk/Ttd4qwo1bCsHiwhOmHfdUjMZ9gYcaowr+iQkM2XuV1FEDH+Dn3h+lol4s5FBMUbPhDOdv8q04JVPPuTRIeh0qAj4+N7MKPGLRJVm/QUC/SW9Sv4VEueqLe2tzHLemOiKcQs4s9D0tKYOhOk6dO/0P2S/lWV7ydQvvt89nrPanchWE9GpbzHYtPngezGIaVYIhajnOap8jNbvvb0PbklE8UblaI62KfzdIyoEatli+P3LjG4gTOVHjeYsJGiGTkzyTZjgRU5Rcr1KWggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3372.namprd18.prod.outlook.com (10.255.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:07:04 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:07:04 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH RFC] x86emul: unconditionally deliver #UD for LWP insns
Thread-Index: AQHVPGrBPWLzciEO+UWYWtF8DkKtbabOsLCmgAAXhYA=
Date: Wed, 17 Jul 2019 13:07:04 +0000
Message-ID: <798637b0-2b1c-9ca0-43af-408868072eaf@suse.com>
References: <d7b10cdc-b33a-0297-458d-1bad42727fa0@suse.com>
 <18e7f37f-826e-0671-9d2c-1a33b1d1d6f3@citrix.com>
In-Reply-To: <18e7f37f-826e-0671-9d2c-1a33b1d1d6f3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0059.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::36) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26e4717c-6c83-4253-7d4b-08d70ab7a9f7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3372; 
x-ms-traffictypediagnostic: DM6PR18MB3372:
x-microsoft-antispam-prvs: <DM6PR18MB3372B3EA718B9B69B1017484B3C90@DM6PR18MB3372.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(199004)(189003)(76176011)(478600001)(80792005)(31696002)(66066001)(2501003)(53546011)(52116002)(2906002)(6506007)(99286004)(25786009)(446003)(476003)(14454004)(7736002)(68736007)(386003)(305945005)(8676002)(36756003)(186003)(11346002)(2616005)(26005)(53936002)(8936002)(31686004)(3846002)(6246003)(4326008)(6486002)(486006)(316002)(81166006)(229853002)(54906003)(110136005)(81156014)(102836004)(256004)(66476007)(71190400001)(86362001)(6116002)(66946007)(66556008)(64756008)(66446008)(71200400001)(5660300002)(6512007)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3372;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jYgh0qYO4CNXsh8XqOoANK0o6Blt3rfm3JRZVaNXhzc8zqiyVW17/rNk701HvnMOTsRZRFouCF/6RMqepCjzuI3n6YQF4bX66ExoT0Mv3dIvMUD64OHyvwfrfJ7JGNz/hFh634cs86DGILkC2GinkA/luok0Vb60R+Iy5uwVp3tyz5e3Suums55LTbXoPYJLN1aEf7t9MsqLxbtBsmM0kYYGLi6coOLGa+yDZ4YMuds5Laz5ja+gC3N6+oxHBoZMqo7W5RleH5PTAY7pEGFzs2OBOMuTYSYRl5EJ0zq8AjFNpVLNTMIS/z3HJW3dTo5pXGutseAhjkqH601givVci46LQgaW7+Mq2L3qTSPbLqezVtwpauS+RyTCwgzqMZcjFwwTsBVYv/Xjkp328easgAiPbtFKiHLCmNcGEaADPpY=
Content-ID: <0B94E87A3365FE45BE6EB59D488EAF0C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e4717c-6c83-4253-7d4b-08d70ab7a9f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:07:04.5515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3372
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH RFC] x86emul: unconditionally deliver #UD
 for LWP insns
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
Cc: Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxMzo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDcvMjAx
OSAwNzo0MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBUaGlzIGlzIHRvIGFjY29tcGFueSBjb21t
aXQgICgieDg2L3N2bTogRHJvcCBzdXBwb3J0IGZvciBBTUQncw0KPiANCj4gOTFmODZmODYzNA0K
DQpIbW0sIG9kZCAtIEknbSBzdXJlIEkgaGFkIGNoZWNrZWQsIHJlc3VsdGluZyBpbiB0aGUgaW1w
cmVzc2lvbiB0aGF0DQp0aGlzIGRpZG4ndCBnZXQgY29tbWl0dGVkIHlldC4NCg0KPj4gTGlnaHR3
ZWlnaHQgUHJvZmlsaW5nIikuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gDQo+PiAtLS0NCj4+IFdpdGggQU1EIGFwcGFyZW50bHkgaGF2aW5n
IGFiYW5kb25lZCBYT1AgZW5jb2RlZCBpbnNucywgYW5vdGhlciBvcHRpb24NCj4+IHdvdWxkIHNl
ZW0gdG8gYmUgdG8gc2ltcGx5IHdpcmUgYWxsIHVucmVjb2duaXplZCBvbmVzIGludG8gI1VEIChy
YXRoZXINCj4+IHRoZW4gcmV0dXJuaW5nIFVOSU1QTEVNRU5URUQvVU5SRUNPR05JWkVEKS4NCj4g
DQo+IFRoZXJlIGFyZSBzdGlsbCBzb21lIFhPUCBpbnN0cnVjdGlvbnMgd2hpY2ggYWN0dWFsbHkg
d29yayBvbiBGYW0xN2gNCj4gcHJvY2Vzc29ycywgaWYgeW91IGlnbm9yZSBDUFVJRCBhbmQgZ28g
YmxpbmRseSBleGVjdXRpbmcuDQo+IA0KPiBHaXZlbiBubyBvZmZpY2lhbCBzdGF0ZW1lbnQgdGhh
dCBYT1AgaXMgZGVhZCwgSSdkIGtlZXAgdGhlIHN1cHBvcnQgd2UNCj4gY3VycmVudGx5IGhhdmUu
DQoNClRoZW4gbXkgcmVtYXJrIHdhc24ndCBjbGVhciBlbm91Z2g6IEknbSBub3Qgc3VnZ2VzdGlu
ZyB0byByaXAgb3V0DQpYT1AgaW5zbiBzdXBwb3J0IHdlIGhhdmUuIEknbSBpbnN0ZWFkIGNvbnNp
ZGVyaW5nIHdoZXRoZXIgdG8gd2lyZQ0KYWxsIHVuc3VwcG9ydGVkIFhPUCBlbmNvZGluZ3MgaW50
byAjVUQgKHJhdGhlciB0aGFuIHJldHVybg0KVU5JTVBMRU1FTlRFRC9VTlJFQ09HTklaRUQgZm9y
IHRoZW0pLCBub3QganVzdCB0aGUgTFdQIG9uZXMuDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
