Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F37A71D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 13:37:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQOu-0001EJ-2c; Tue, 30 Jul 2019 11:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsQOt-0001EE-4S
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:34:39 +0000
X-Inumbo-ID: 01214f82-b2be-11e9-9e58-b7402142c376
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01214f82-b2be-11e9-9e58-b7402142c376;
 Tue, 30 Jul 2019 11:34:35 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 11:34:30 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 11:26:38 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 11:26:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOPejiiKDmqMyj3l3YBhcko8HSItRVYEfIg62WNa1IkiK0P/Wqn+vrzjw6EtWNigQqdGSW2sc/GpIk0FwR/4aIlFuvng/IALD/dT7sWNMmGFWNRydWK+TC1RalhaELWqcte4rzuDZPExOF6d/uo5Jbvrn3oK3w7Ag/49NRBYrxaAWKknylxIFIOFb4V6MbWYLJRXj6ytNgbD8+PvI6n+6iY5dZU/+U3MU6PZFW6SnHhDL576Q2WiMsu3ghwXUrVSStjXQi23SxKp3Hn1JyeoEL50OpD+RbN+tXYfugZPJjpvbCGHrvyh6eQRh+AGIWcgBXYf8jnVpZ22wQE5jp5z9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKhcQdi4rYdnSP7CHUtuaTnevhIPu5W0a+389yuvrYY=;
 b=HfCx01sLTgPthGxz70mSA1hp1/u3MG1dIT1/moBnuq4xxXevs1Gvc1dVDFKMFjQTcudLzScguz87f9Z8xMFQ3F1987hiGcIrrrBBM1Ym+6EV+gHY8rO/lHguEFtVpdtTyj9AY1poJIgYZGKY/JHPeBf3wefwAwptWeX8DQr1bwl07rMmZgbAQ6+VnXKAo/nhQ0JVoNdALQPK+wSCPZIAyZjQU2HoRUqDZl09FqncyWtOw9TFJsYTJhvUuSMIYwcSCyVF6f1Gfh10uXSLpsWoVkqUjFUTwvuLwlPV0H9EqLPd5YBbqKXqTsQ9fuN/WYdSn02fcOyUah8QaZ4YFJImoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3169.namprd18.prod.outlook.com (10.255.139.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 11:26:37 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 11:26:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 08/10] xen/nodemask: Introduce unlocked
 __nodemask_{set,clear}() helpers
Thread-Index: AQHVRgbw7C6GvWJsh0yxbCWlYQa9EqbjBzYA
Date: Tue, 30 Jul 2019 11:26:37 +0000
Message-ID: <7528b666-d5d8-9457-9be2-59ccc13797ab@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-9-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-9-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0043.eurprd02.prod.outlook.com
 (2603:10a6:4:a5::29) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f7c7bf9-db66-418a-1b15-08d714e0c8b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3169; 
x-ms-traffictypediagnostic: BY5PR18MB3169:
x-microsoft-antispam-prvs: <BY5PR18MB3169123151451B980CB00E73B3DC0@BY5PR18MB3169.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(199004)(189003)(478600001)(66946007)(6436002)(25786009)(36756003)(6246003)(6916009)(66446008)(81156014)(229853002)(4326008)(81166006)(8676002)(80792005)(53936002)(8936002)(64756008)(66556008)(66476007)(316002)(6512007)(6486002)(54906003)(6506007)(102836004)(186003)(386003)(53546011)(446003)(26005)(14454004)(476003)(52116002)(3846002)(6116002)(71200400001)(71190400001)(2906002)(11346002)(2616005)(31686004)(305945005)(76176011)(486006)(7736002)(14444005)(86362001)(99286004)(31696002)(256004)(68736007)(66066001)(5660300002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3169;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z2BggWM1rQLje2wtmj6Rc++IMvNq85bo95N4LhfyhzWHgz+zgiTOzx4m1Bu6Tptq07dpGgPMhwSQA0R5os9Pm86W5Kd8zVu/UfITlHBzpm3XH0BLHhKGIBxlT+zLv2EymBJwpOuBfHQJ2KyYugD5u9BOOUxdP8nVSfDvG0YYap8sDB/gROFS7KXSDBOgnBh1yTGMLdIBLeF11KY/9h4/4XiZBS6bYwSX/DnvvTLnK0hSR3Q3HLzTDC7BEB/IwAyjq6p/Mt9hT4XmemGFRIo4KfAts6a9ZGMG95COGoBGPBefL7u+X2avWGGZmgzqmadeVbeBIZT1icllQjxa3Yl6e+0Vjh03wblTvWyl58/RXcxjTIZ5HwSPt8x263LNtoA8oEu2Qlhe6ckc+LDIwkezZfPIml5h93vyUO7DZYbD4bw=
Content-ID: <A80A532BD1E5B146AE5ACE4BC29A4A47@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7c7bf9-db66-418a-1b15-08d714e0c8b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 11:26:37.0668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3169
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 08/10] xen/nodemask: Introduce unlocked
 __nodemask_{set, clear}() helpers
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL25vZGVtYXNrLmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmgN
Cj4gQEAgLTExLDcgKzExLDkgQEANCj4gICAqIFRoZSBhdmFpbGFibGUgbm9kZW1hc2sgb3BlcmF0
aW9ucyBhcmU6DQo+ICAgKg0KPiAgICogdm9pZCBub2RlX3NldChub2RlLCBtYXNrKQkJdHVybiBv
biBiaXQgJ25vZGUnIGluIG1hc2sNCj4gKyAqIHZvaWQgX19ub2RlbWFza19zZXQobm9kZSwgbWFz
aykJdHVybiBvbiBiaXQgJ25vZGUnIGluIG1hc2sgKHVubG9ja2VkKQ0KPiAgICogdm9pZCBub2Rl
X2NsZWFyKG5vZGUsIG1hc2spCQl0dXJuIG9mZiBiaXQgJ25vZGUnIGluIG1hc2sNCj4gKyAqIHZv
aWQgX19ub2RlbWFza19jbGVhcihub2RlLCBtYXNrKQl0dXJuIG9mZiBiaXQgJ25vZGUnIGluIG1h
c2sgKHVubG9ja2VkKQ0KDQpUbyBiZSBob25lc3QgSSdtIHVuaGFwcHkgdG8gc2VlIHlvdSBpbnRy
b2R1Y2UgbmV3IG5hbWUgc3BhY2UNCnZpb2xhdGlvbnMuIEkgcmVhbGl6ZSB5b3Ugd2FudCB0byBo
YXZlIHRoZSBub2RlIG1hc2sgaW50ZXJmYWNlcw0KbWF0Y2ggdGhlIENQVSBtYXNrIG9uZSBhcyBj
bG9zZWx5IGFzIHBvc3NpYmxlLCBidXQgSSB0aGluayB3ZQ0Kc2hvdWxkIGRpdmVyZ2UgaGVyZSAo
YW5kIGV2ZW50dWFsbHkgbWFrZSB0aGUgQ1BVIG1hc2sgb25lcw0KZm9sbG93IHdoYXRldmVyIHJv
dXRlIHdlIGdvIGhlcmUpLiBBcyB0byBuYW1pbmcsIHNpbmNlIHRoZXNlDQphcmUgc3RhdGljIGlu
bGluZXMsIGEgc2luZ2xlIGxlYWRpbmcgdW5kZXJzY29yZSBtYXkgYmUgYW4NCm9wdGlvbiAoYWxi
ZWl0IEknZCBwcmVmZXIgdG8gYXZvaWQgdGhpcykuIEFub3RoZXIgb3B0aW9uIHdvdWxkDQpiZSB0
byBoYXZlIGRvdWJsZSBpbmZpeCB1bmRlcnNjb3JlcyAobm9kZW1hc2tfX3NldCgpKS4gWWV0DQph
bm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBleHByZXNzIHRoZSBub24tYXRvbWljaXR5IGluIGEN
CnZlcmJhbCB3YXkgcmF0aGVyIHRoYW4gYnkgdGhlIG51bWJlciBvZiB1bmRlcnNjb3JlcyB1c2Vk
LiBJJ20NCmFmcmFpZCBJIGRvbid0IGhhdmUgYSBnb29kIG5hbWluZyBzdWdnZXN0aW9uIGluIHRo
YXQgY2FzZSwNCnRob3VnaC4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
