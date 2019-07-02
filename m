Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D45CC4F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEdD-0003GA-Iu; Tue, 02 Jul 2019 08:59:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiEdC-0003G5-GX
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:59:18 +0000
X-Inumbo-ID: ab5632aa-9ca7-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab5632aa-9ca7-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 08:59:17 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 08:59:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 08:55:20 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 08:55:20 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3137.namprd18.prod.outlook.com (10.255.136.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 08:55:17 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 08:55:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 26/60] xen: let vcpu_create() select processor
Thread-Index: AQHVMLPfLYWVKdFqI0a2PB5gCChpGQ==
Date: Tue, 2 Jul 2019 08:55:17 +0000
Message-ID: <309aa9f8-b412-120b-6f20-090d11236443@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:6::29)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36c992a9-416e-455f-8671-08d6fecb015a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3137; 
x-ms-traffictypediagnostic: BY5PR18MB3137:
x-microsoft-antispam-prvs: <BY5PR18MB3137D3B9008D76FC51B1B744B3F80@BY5PR18MB3137.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(52314003)(37006003)(68736007)(36756003)(6246003)(86362001)(5660300002)(6436002)(486006)(386003)(26005)(31696002)(7736002)(31686004)(80792005)(66446008)(64756008)(73956011)(476003)(6486002)(53546011)(316002)(7416002)(25786009)(66066001)(99286004)(2616005)(478600001)(72206003)(14454004)(8936002)(6512007)(71190400001)(66946007)(2906002)(66556008)(186003)(229853002)(54906003)(256004)(102836004)(8676002)(66476007)(305945005)(6636002)(4326008)(81166006)(6862004)(81156014)(6116002)(6506007)(3846002)(53936002)(52116002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3137;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vaqdGMRfeD7YIcSARjEkeXRCoPILs3814E430QKAI5VQ4yAw6E5uVEBz1bLqXoAujyma/IN/eZMcThI29MIs90tHljmSD3jSNfcl3K+7Ei+qWnQYedsgu2MtYH/Lyv+empi6PhWuEmeScG5eLB+tp21PJ0BLqY5/ON9dpf3CFk6ns0lY4uDhm3psEIwj7Tt/C3bGRK0xEsKVftTEX6VIOPFfGxES4AthUXMtPfFWaiOEEvFE5JQvphMY1+wIrJ/5VDkfUdvvL+hCfmr95cH63LOsrJyNR44hVsjXeh6cXUHbeTSMGPDv/9DonStFdtp9lADQaBdNqIpLXQ1RNZGncC1i1nJ7Xf652bWfSPhxtKs8zT3Pab77d5Yiq0X5QoUizJtk7YnwXSuAno0eMW6c65eC7CGXtbA5RGznJkIHdMM=
Content-ID: <505BEFB033D69F43BB9B36E47190BE7F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c992a9-416e-455f-8671-08d6fecb015a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:55:17.8117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3137
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 26/60] xen: let vcpu_create() select
 processor
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Ian
 Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gVG9k
YXkgdGhlcmUgYXJlIHR3byBkaXN0aW5jdCBzY2VuYXJpb3MgZm9yIHZjcHVfY3JlYXRlKCk6IGVp
dGhlciBmb3INCj4gY3JlYXRpb24gb2YgaWRsZS1kb21haW4gdmNwdXMgKHZjcHVpZCA9PSBwcm9j
ZXNzb3IpIG9yIGZvciBjcmVhdGlvbiBvZg0KPiAibm9ybWFsIiBkb21haW4gdmNwdXMgKGluY2x1
ZGluZyBkb20wKSwgd2hlcmUgdGhlIGNhbGxlciBzZWxlY3RzIHRoZQ0KPiBpbml0aWFsIHByb2Nl
c3NvciBvbiBhIHJvdW5kLXJvYmluIHNjaGVtZSBvZiB0aGUgYWxsb3dlZCBwcm9jZXNzb3JzDQo+
IChhbGxvd2VkIGJlaW5nIGJhc2VkIG9uIGNwdXBvb2wgYW5kIGFmZmluaXRpZXMpLg0KPiANCj4g
SW5zdGVhZCBvZiBwYXNzaW5nIHRoZSBpbml0aWFsIHByb2Nlc3NvciB0byB2Y3B1X2NyZWF0ZSgp
IGFuZCBwYXNzaW5nDQo+IG9uIHRvIHNjaGVkX2luaXRfdmNwdSgpIGxldCBzY2hlZF9pbml0X3Zj
cHUoKSBkbyB0aGUgcHJvY2Vzc29yDQo+IHNlbGVjdGlvbi4gRm9yIHN1cHBvcnRpbmcgZG9tMCB2
Y3B1IGNyZWF0aW9uIHVzZSB0aGUgbm9kZV9hZmZpbml0eSBvZg0KPiB0aGUgZG9tYWluIGFzIGEg
YmFzZSBmb3Igc2VsZWN0aW5nIHRoZSBwcm9jZXNzb3JzLiBVc2VyIGRvbWFpbnMgd2lsbA0KPiBo
YXZlIGluaXRpYWxseSBhbGwgbm9kZXMgc2V0LCBzbyB0aGlzIGlzIG5vIGRpZmZlcmVudCBiZWhh
dmlvciBjb21wYXJlZA0KPiB0byB0b2RheS4NCg0KVGhpcyBsYXN0IGFzcGVjdCBpcyBhIHJlc3Vs
dCBvZiBob3cgdGhlIHRvb2wgc3RhY2sgY3VycmVudGx5IHdvcmtzLCBidXQNCmFzIGxvbmcgYXMg
dGhlcmUncyBhIHNlcGFyYXRlIFhFTl9ET01DVExfbWF4X3ZjcHVzIHRoZXJlJ3Mgbm8NCnJlYWwg
Z3VhcmFudGVlIHRoYXQgdGhlIGRvbWFpbiBhZmZpbml0eSBtYXNrIGhhc24ndCBjaGFuZ2VkIGFs
cmVhZHksDQppcyB0aGVyZT8gSSBkb24ndCBtaW5kIHN1Y2ggYSBkZXBlbmRlbmN5LCBzaW5jZSBY
RU5fRE9NQ1RMX21heF92Y3B1cw0KaXMgc2NoZWR1bGVkIHRvIGdvIGF3YXkgYW55d2F5LCBidXQg
SSB0aGluayB0aGlzIHNob3VsZCBiZSBjYWxsZWQgb3V0DQpleHBsaWNpdGx5IGhlcmUuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
