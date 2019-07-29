Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C426B78C75
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:14:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Pv-0004B0-8J; Mon, 29 Jul 2019 13:10:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs5Pu-0004Au-JM
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:10:18 +0000
X-Inumbo-ID: 2946fc9e-b202-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2946fc9e-b202-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:10:17 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 13:09:55 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 12:45:01 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 12:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBD6K83pC/w/j5RLo0YREqZeZ3zgvFu16/RRJHgV2T21oW6HndsjwOVA8Jgr/E6ZYNKINK63fGPtlrm0pVeG2sbi8PXV7Y1uyZ+iUbnDUVxt35LIQXgtOMW6/UxGkokCnDwfgiYJd2Wk5DGGREmgI/Gb4eeVlAW/6iFnD+tPdiDwsPjfKjZat32Fn+E50jdMH1DGBFt5wh7jjLgN5JdpP/wVaOBcVmRhZijIBTW2e9WsXzn6UDHahiPc9HUurubiC0JM3aLeTRrySuZmGqUwM9AVoMuNZovlNSPNEjiv3mCUbHqq5IBDhop7G1WDaYlDE5VvRN8xwPXMTnAhKfmgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQvpUfiFu8Lp+tP4FDfTmWGOCvMdyLYZttse5modv2U=;
 b=Aihqi6jNVlVNU+/iaGUCe4IcHTZfQ7pKkOLuRCZP+VO0luRjV0yyKC4SIyrn3Xb53bPyuumb4wwXLATmk3c/gIjvSZCjmriOcZqK0pSYrCztyL/F5ADVEil9w2EbW/ISljdqGzDQXqC4q2CzPZSL6N2af/dbs5pbqMt/BBcUOWaArgxSjz5Oq9nFnPE0+LQO4I8sknH8BufbXL5xEcHxfu/3qIIDp8kkIA3ROiSvt2Lkp8YgU850dFOqIkRVZBaePF1PyrsfcuHL3hpOFBUa+PCISsV6oNcrlQVg/A83r8aWhwLQW0CNrrRn9OyLF3aI+V8Nc/2sBpVP7Xu3/w39xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3092.namprd18.prod.outlook.com (10.255.154.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 12:45:00 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 12:45:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 1/3] xen: move debugtrace coding to common/debugtrace.c
Thread-Index: AQHVRSA2vhgAAF6AnUuE4HJXiRUWH6bhjJWA
Date: Mon, 29 Jul 2019 12:45:00 +0000
Message-ID: <014a658d-c2d5-0497-a2b3-793997f952ad@suse.com>
References: <20190728084100.13071-1-jgross@suse.com>
 <20190728084100.13071-2-jgross@suse.com>
In-Reply-To: <20190728084100.13071-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0033.eurprd02.prod.outlook.com
 (2603:10a6:8:1::46) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5744716f-5663-428a-51e2-08d7142291b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3092; 
x-ms-traffictypediagnostic: BY5PR18MB3092:
x-microsoft-antispam-prvs: <BY5PR18MB309239F05164DC0B5C32DD6CB3DD0@BY5PR18MB3092.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(4326008)(6862004)(6116002)(3846002)(86362001)(6636002)(8676002)(478600001)(36756003)(53936002)(6246003)(6512007)(14454004)(229853002)(6486002)(8936002)(31696002)(66066001)(6436002)(81156014)(81166006)(316002)(71200400001)(71190400001)(102836004)(66476007)(5660300002)(37006003)(99286004)(54906003)(66946007)(7736002)(2616005)(31686004)(476003)(486006)(2906002)(256004)(25786009)(305945005)(68736007)(14444005)(52116002)(64756008)(186003)(26005)(386003)(66446008)(66556008)(6506007)(53546011)(11346002)(80792005)(76176011)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3092;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xSd+pa0CYl47ODkGngVMMkefx4WnJZUdJfiZpPefGm0PG2ykjIcqYs6zhc+QWQ36GrNffqmGb2A7MAzoWMMK3b70Fv25dDo1Gw15CuCF00Jr1wyDJGL2mq9UUy0pQzGR0VfVQH1dCYdyvXbx3OySRhhteG4T+gYQYAz3FP8uQOdgEjm6xdC82vXW3mvXJ79+EOL+uiPh9xgpx5GiZpblqi/Jnbv+vqUmNzDzv+fsugIgVT+5qveBXurjjBdbtAn9KJjN9Srh/8Dg1fRZ/Plh+Q/n/aVZcuzkcksN5KuSej8YewaGJ7OESoQhev70h1/FfqgvALyI/mNsUQkgaMZkzbgSJronmAQgYqERB62ARHfCygnysGy0RF4qhbvSXGHehYe9JMTIGMh5MmbDV/RGD6sfq9pPZuZzHrcruk8rLoQ=
Content-ID: <67B49C42818EEE4FBDC26B5F12BE2607@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5744716f-5663-428a-51e2-08d7142291b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 12:45:00.4230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3092
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDcuMjAxOSAxMDo0MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQEAgLTExNTUsMTc4
ICsxMTU1LDYgQEAgaW50IHByaW50a19yYXRlbGltaXQodm9pZCkNCj4gICAgICAgcmV0dXJuIF9f
cHJpbnRrX3JhdGVsaW1pdChwcmludGtfcmF0ZWxpbWl0X21zLCBwcmludGtfcmF0ZWxpbWl0X2J1
cnN0KTsNCj4gICB9DQo+ICAgDQo+IC0vKg0KPiAtICogKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gLSAqICoqKioqKioqKioq
KioqKiBTZXJpYWwgY29uc29sZSByaW5nIGJ1ZmZlciAqKioqKioqKioqKioqKioqKioqDQo+IC0g
KiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKg0KPiAtICovDQoNCkkgYWNrbm93bGVkZ2UgdGhhdCB0aGlzIGNvbW1lbnQgaGFzIGF0
IGJlc3QgYmVlbiBkaXNwbGFjZWQgZnJvbSB3aGF0DQppdCB3b3VsZCBwcm9wZXJseSBiZWxvbmcg
dG8sIHNvIGlzIGluZGVlZCBwZXJoYXBzIGJlc3QgZHJvcHBlZC4gQnV0IC4uLg0KDQo+IC0jaWZk
ZWYgQ09ORklHX0RFQlVHX1RSQUNFDQo+IC0NCj4gLS8qIFNlbmQgb3V0cHV0IGRpcmVjdCB0byBj
b25zb2xlLCBvciBidWZmZXIgaXQ/ICovDQo+IC1zdGF0aWMgdm9sYXRpbGUgaW50IGRlYnVndHJh
Y2Vfc2VuZF90b19jb25zb2xlOw0KPiAtDQo+IC1zdGF0aWMgY2hhciAgICAgICAgKmRlYnVndHJh
Y2VfYnVmOyAvKiBEZWJ1Zy10cmFjZSBidWZmZXIgKi8NCj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQg
ZGVidWd0cmFjZV9wcmQ7IC8qIFByb2R1Y2VyIGluZGV4ICAgICAqLw0KPiAtc3RhdGljIHVuc2ln
bmVkIGludCBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IDEyOCwgZGVidWd0cmFjZV9ieXRlczsNCj4g
LXN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV91c2VkOw0KPiAtc3RhdGljIERFRklORV9T
UElOTE9DSyhkZWJ1Z3RyYWNlX2xvY2spOw0KPiAtaW50ZWdlcl9wYXJhbSgiZGVidWd0cmFjZSIs
IGRlYnVndHJhY2Vfa2lsb2J5dGVzKTsNCj4gLQ0KPiAtc3RhdGljIHZvaWQgZGVidWd0cmFjZV9k
dW1wX3dvcmtlcih2b2lkKQ0KPiAtew0KPiAtICAgIGlmICggKGRlYnVndHJhY2VfYnl0ZXMgPT0g
MCkgfHwgIWRlYnVndHJhY2VfdXNlZCApDQo+IC0gICAgICAgIHJldHVybjsNCj4gLQ0KPiAtICAg
IHByaW50aygiZGVidWd0cmFjZV9kdW1wKCkgc3RhcnRpbmdcbiIpOw0KPiAtDQo+IC0gICAgLyog
UHJpbnQgb2xkZXN0IHBvcnRpb24gb2YgdGhlIHJpbmcuICovDQo+IC0gICAgQVNTRVJUKGRlYnVn
dHJhY2VfYnVmW2RlYnVndHJhY2VfYnl0ZXMgLSAxXSA9PSAwKTsNCj4gLSAgICBzZXJjb25fcHV0
cygmZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmRdKTsNCj4gLQ0KPiAtICAgIC8qIFByaW50
IHlvdW5nZXN0IHBvcnRpb24gb2YgdGhlIHJpbmcuICovDQo+IC0gICAgZGVidWd0cmFjZV9idWZb
ZGVidWd0cmFjZV9wcmRdID0gJ1wwJzsNCj4gLSAgICBzZXJjb25fcHV0cygmZGVidWd0cmFjZV9i
dWZbMF0pOw0KPiAtDQo+IC0gICAgbWVtc2V0KGRlYnVndHJhY2VfYnVmLCAnXDAnLCBkZWJ1Z3Ry
YWNlX2J5dGVzKTsNCj4gLQ0KPiAtICAgIHByaW50aygiZGVidWd0cmFjZV9kdW1wKCkgZmluaXNo
ZWRcbiIpOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX3RvZ2dsZSh2b2lk
KQ0KPiAtew0KPiAtICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0NCj4gLSAgICB3YXRjaGRv
Z19kaXNhYmxlKCk7DQo+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRlYnVndHJhY2VfbG9jaywg
ZmxhZ3MpOw0KPiAtDQo+IC0gICAgLyoNCj4gLSAgICAgKiBEdW1wIHRoZSBidWZmZXIgKmJlZm9y
ZSogdG9nZ2xpbmcsIGluIGNhc2UgdGhlIGFjdCBvZiBkdW1waW5nIHRoZQ0KPiAtICAgICAqIGJ1
ZmZlciBpdHNlbGYgY2F1c2VzIG1vcmUgcHJpbnRrKCkgaW52b2NhdGlvbnMuDQo+IC0gICAgICov
DQo+IC0gICAgcHJpbnRrKCJkZWJ1Z3RyYWNlX3ByaW50ayBub3cgd3JpdGluZyB0byAlcy5cbiIs
DQo+IC0gICAgICAgICAgICFkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZSA/ICJjb25zb2xlIjog
ImJ1ZmZlciIpOw0KPiAtICAgIGlmICggIWRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlICkNCj4g
LSAgICAgICAgZGVidWd0cmFjZV9kdW1wX3dvcmtlcigpOw0KPiAtDQo+IC0gICAgZGVidWd0cmFj
ZV9zZW5kX3RvX2NvbnNvbGUgPSAhZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGU7DQo+IC0NCj4g
LSAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZWJ1Z3RyYWNlX2xvY2ssIGZsYWdzKTsNCj4g
LSAgICB3YXRjaGRvZ19lbmFibGUoKTsNCj4gLQ0KPiAtfQ0KPiAtDQo+IC12b2lkIGRlYnVndHJh
Y2VfZHVtcCh2b2lkKQ0KPiAtew0KPiAtICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0NCj4g
LSAgICB3YXRjaGRvZ19kaXNhYmxlKCk7DQo+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRlYnVn
dHJhY2VfbG9jaywgZmxhZ3MpOw0KPiAtDQo+IC0gICAgZGVidWd0cmFjZV9kdW1wX3dvcmtlcigp
Ow0KPiAtDQo+IC0gICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGVidWd0cmFjZV9sb2NrLCBm
bGFncyk7DQo+IC0gICAgd2F0Y2hkb2dfZW5hYmxlKCk7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyB2
b2lkIGRlYnVndHJhY2VfYWRkX3RvX2J1ZihjaGFyICpidWYpDQo+IC17DQo+IC0gICAgY2hhciAq
cDsNCj4gLQ0KPiAtICAgIGZvciAoIHAgPSBidWY7ICpwICE9ICdcMCc7IHArKyApDQo+IC0gICAg
ew0KPiAtICAgICAgICBkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZCsrXSA9ICpwOw0KPiAt
ICAgICAgICAvKiBBbHdheXMgbGVhdmUgYSBudWwgYnl0ZSBhdCB0aGUgZW5kIG9mIHRoZSBidWZm
ZXIuICovDQo+IC0gICAgICAgIGlmICggZGVidWd0cmFjZV9wcmQgPT0gKGRlYnVndHJhY2VfYnl0
ZXMgLSAxKSApDQo+IC0gICAgICAgICAgICBkZWJ1Z3RyYWNlX3ByZCA9IDA7DQo+IC0gICAgfQ0K
PiAtfQ0KPiAtDQo+IC12b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4u
KQ0KPiAtew0KPiAtICAgIHN0YXRpYyBjaGFyIGJ1ZlsxMDI0XSwgbGFzdF9idWZbMTAyNF07DQo+
IC0gICAgc3RhdGljIHVuc2lnbmVkIGludCBjb3VudCwgbGFzdF9jb3VudCwgbGFzdF9wcmQ7DQo+
IC0NCj4gLSAgICBjaGFyICAgICAgICAgIGNudGJ1ZlsyNF07DQo+IC0gICAgdmFfbGlzdCAgICAg
ICBhcmdzOw0KPiAtICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0NCj4gLSAgICBpZiAoIGRl
YnVndHJhY2VfYnl0ZXMgPT0gMCApDQo+IC0gICAgICAgIHJldHVybjsNCj4gLQ0KPiAtICAgIGRl
YnVndHJhY2VfdXNlZCA9IDE7DQo+IC0NCj4gLSAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZGVidWd0
cmFjZV9sb2NrLCBmbGFncyk7DQo+IC0NCj4gLSAgICBBU1NFUlQoZGVidWd0cmFjZV9idWZbZGVi
dWd0cmFjZV9ieXRlcyAtIDFdID09IDApOw0KPiAtDQo+IC0gICAgdmFfc3RhcnQoYXJncywgZm10
KTsNCj4gLSAgICB2c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsNCj4gLSAg
ICB2YV9lbmQoYXJncyk7DQo+IC0NCj4gLSAgICBpZiAoIGRlYnVndHJhY2Vfc2VuZF90b19jb25z
b2xlICkNCj4gLSAgICB7DQo+IC0gICAgICAgIHNucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1
ZiksICIldSAiLCArK2NvdW50KTsNCj4gLSAgICAgICAgc2VyaWFsX3B1dHMoc2VyY29uX2hhbmRs
ZSwgY250YnVmKTsNCj4gLSAgICAgICAgc2VyaWFsX3B1dHMoc2VyY29uX2hhbmRsZSwgYnVmKTsN
Cj4gLSAgICB9DQo+IC0gICAgZWxzZQ0KPiAtICAgIHsNCj4gLSAgICAgICAgaWYgKCBzdHJjbXAo
YnVmLCBsYXN0X2J1ZikgKQ0KPiAtICAgICAgICB7DQo+IC0gICAgICAgICAgICBsYXN0X3ByZCA9
IGRlYnVndHJhY2VfcHJkOw0KPiAtICAgICAgICAgICAgbGFzdF9jb3VudCA9ICsrY291bnQ7DQo+
IC0gICAgICAgICAgICBzYWZlX3N0cmNweShsYXN0X2J1ZiwgYnVmKTsNCj4gLSAgICAgICAgICAg
IHNucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICIldSAiLCBjb3VudCk7DQo+IC0gICAg
ICAgIH0NCj4gLSAgICAgICAgZWxzZQ0KPiAtICAgICAgICB7DQo+IC0gICAgICAgICAgICBkZWJ1
Z3RyYWNlX3ByZCA9IGxhc3RfcHJkOw0KPiAtICAgICAgICAgICAgc25wcmludGYoY250YnVmLCBz
aXplb2YoY250YnVmKSwgIiV1LSV1ICIsIGxhc3RfY291bnQsICsrY291bnQpOw0KPiAtICAgICAg
ICB9DQo+IC0gICAgICAgIGRlYnVndHJhY2VfYWRkX3RvX2J1ZihjbnRidWYpOw0KPiAtICAgICAg
ICBkZWJ1Z3RyYWNlX2FkZF90b19idWYoYnVmKTsNCj4gLSAgICB9DQo+IC0NCj4gLSAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZkZWJ1Z3RyYWNlX2xvY2ssIGZsYWdzKTsNCj4gLX0NCj4gLQ0K
PiAtc3RhdGljIHZvaWQgZGVidWd0cmFjZV9rZXkodW5zaWduZWQgY2hhciBrZXkpDQo+IC17DQo+
IC0gICAgZGVidWd0cmFjZV90b2dnbGUoKTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGludCBfX2lu
aXQgZGVidWd0cmFjZV9pbml0KHZvaWQpDQo+IC17DQo+IC0gICAgaW50IG9yZGVyOw0KPiAtICAg
IHVuc2lnbmVkIGludCBrYnl0ZXMsIGJ5dGVzOw0KPiAtDQo+IC0gICAgLyogUm91bmQgc2l6ZSBk
b3duIHRvIG5leHQgcG93ZXIgb2YgdHdvLiAqLw0KPiAtICAgIHdoaWxlICggKGtieXRlcyA9IChk
ZWJ1Z3RyYWNlX2tpbG9ieXRlcyAmIChkZWJ1Z3RyYWNlX2tpbG9ieXRlcy0xKSkpICE9IDAgKQ0K
PiAtICAgICAgICBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IGtieXRlczsNCj4gLQ0KPiAtICAgIGJ5
dGVzID0gZGVidWd0cmFjZV9raWxvYnl0ZXMgPDwgMTA7DQo+IC0gICAgaWYgKCBieXRlcyA9PSAw
ICkNCj4gLSAgICAgICAgcmV0dXJuIDA7DQo+IC0NCj4gLSAgICBvcmRlciA9IGdldF9vcmRlcl9m
cm9tX2J5dGVzKGJ5dGVzKTsNCj4gLSAgICBkZWJ1Z3RyYWNlX2J1ZiA9IGFsbG9jX3hlbmhlYXBf
cGFnZXMob3JkZXIsIDApOw0KPiAtICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZiAhPSBOVUxMKTsN
Cj4gLQ0KPiAtICAgIG1lbXNldChkZWJ1Z3RyYWNlX2J1ZiwgJ1wwJywgYnl0ZXMpOw0KPiAtDQo+
IC0gICAgZGVidWd0cmFjZV9ieXRlcyA9IGJ5dGVzOw0KPiAtDQo+IC0gICAgcmVnaXN0ZXJfa2V5
aGFuZGxlcignVCcsIGRlYnVndHJhY2Vfa2V5LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
InRvZ2dsZSBkZWJ1Z3RyYWNlIHRvIGNvbnNvbGUvYnVmZmVyIiwgMCk7DQo+IC0NCj4gLSAgICBy
ZXR1cm4gMDsNCj4gLX0NCj4gLV9faW5pdGNhbGwoZGVidWd0cmFjZV9pbml0KTsNCj4gLQ0KPiAt
I2VuZGlmIC8qICFDT05GSUdfREVCVUdfVFJBQ0UgKi8NCj4gLQ0KPiAtDQo+ICAgLyoNCj4gICAg
KiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKg0KPiAgICAqICoqKioqKioqKioqKioqKiBEZWJ1Z2dpbmcvdHJhY2luZy9lcnJvci1y
ZXBvcnQgKioqKioqKioqKioqKioqDQoNCi4uLiB3aGF0IGFib3V0IHRoaXMgb25lPyBUaGVyZSdz
IG9ubHkgcGFuaWMoKSBiZXR3ZWVuIGl0IGFuZCB0aGUgbmV4dA0Kc3VjaCBjb21tZW50LCBhbmQg
SSBkb24ndCB0aGluayB0aGUgIkRlYnVnZ2luZy90cmFjaW5nIiBwYXJ0IG9mIGl0DQphcmUgYXBw
bGljYWJsZSAoYW55bW9yZSkuDQoNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaA0K
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5oDQo+IEBAIC00OCw0ICs0OCw4IEBAIGlu
dCBjb25zb2xlX3Jlc3VtZSh2b2lkKTsNCj4gICANCj4gICBleHRlcm4gaW50OF90IG9wdF9jb25z
b2xlX3hlbjsNCj4gICANCj4gKy8qIElzc3VlIHN0cmluZyB2aWEgc2VyaWFsIGxpbmUuICovDQo+
ICtleHRlcm4gaW50IHNlcmNvbl9oYW5kbGU7DQo+ICt2b2lkIHNlcmNvbl9wdXRzKGNvbnN0IGNo
YXIgKnMpOw0KDQpJIGd1ZXNzIGF2b2lkaW5nIHRoZWlyIGV4cG9zdXJlIHdhcyBvbmUgb2YgdGhl
IHJlYXNvbnMgdGhlIGRlYnVnIHRyYWNlDQpjb2RlIGxpdmVkIGluIHRoZSBwbGFjZSB5b3UgbW92
ZSBpdCBmcm9tLiBJJ20gdW5jb252aW5jZWQgbm9uLWNvbnNvbGUNCmNvZGUgaXMgYWN0dWFsbHkg
c3VwcG9zZWQgdG8gbWFrZSB1c2Ugb2YgZWl0aGVyLCBidXQgSSdtIG5vdCBvcHBvc2VkDQplbm91
Z2ggdG8gbmFrIHRoZSBjaGFuZ2UuIEkgZG9uJ3QgdGhpbmsgdGhvdWdoIHRoZSBjb21tZW50IGZp
dHMgd2VsbA0Kd2l0aCB0aGUgdmFyaWFibGUgZGVjbGFyYXRpb24uDQoNCkphbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
