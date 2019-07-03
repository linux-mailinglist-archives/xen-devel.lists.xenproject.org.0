Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E95E581
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:29:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifIH-0006wm-N8; Wed, 03 Jul 2019 13:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hifIG-0006wf-6q
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:27:28 +0000
X-Inumbo-ID: 495e68da-9d96-11e9-a602-17a8b0c6ccf5
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 495e68da-9d96-11e9-a602-17a8b0c6ccf5;
 Wed, 03 Jul 2019 13:27:25 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:27:03 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:24:32 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:24:32 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3106.namprd18.prod.outlook.com (10.255.154.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Wed, 3 Jul 2019 13:24:30 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:24:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
Thread-Index: AQHVMZ8qQ6Jc8o6GrEKsOZ2R6D7BYaa44X0AgAAAhoA=
Date: Wed, 3 Jul 2019 13:24:30 +0000
Message-ID: <d6778530-3f10-9ab1-cddf-c46786680d63@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
 <e735f34e-f8b2-ff15-ea3f-943efc83b23a@bitdefender.com>
In-Reply-To: <e735f34e-f8b2-ff15-ea3f-943efc83b23a@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:5:16::39) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a769222-b965-4bed-0a82-08d6ffb9c7af
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3106; 
x-ms-traffictypediagnostic: BY5PR18MB3106:
x-microsoft-antispam-prvs: <BY5PR18MB310639EDA711CD88093F3858B3FB0@BY5PR18MB3106.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(199004)(189003)(6506007)(54906003)(68736007)(52116002)(229853002)(36756003)(26005)(25786009)(186003)(76176011)(102836004)(386003)(4326008)(80792005)(478600001)(86362001)(316002)(99286004)(486006)(31696002)(53546011)(66066001)(72206003)(2906002)(446003)(31686004)(305945005)(5660300002)(6916009)(6246003)(8676002)(66476007)(71190400001)(73956011)(64756008)(66556008)(11346002)(14454004)(81166006)(66446008)(66946007)(6116002)(81156014)(3846002)(7736002)(8936002)(256004)(71200400001)(53936002)(476003)(6486002)(4744005)(2616005)(6436002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3106;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: liu2h+CoXhfLF9mzzn8+xUZxFCCoj+QT9FupFAjyj91p36qaqIOwysdqdaz9K2xGsSN3a5PJztoo1qb4JheE00qgQLz1FYF/Yr53BZKuggAnwPOtNKiW4sgGwDVACogir5Jb/rjvGOJwK3yIFpTdAo4XhFyExE+vrNn4WT7ns2qhgnTID3GegU9SLqtk5fmwe1trd1NnAhLj2l8cOqnmvKC6P0YISrEL9gO2gFsXIfA2CuSIZj83QkUSl8Hc0EjSXcm3Wx73Lgk5EPxdzL4PfLBsUNptNgf9fhZ5N3fY0wJiMwFBTPaxy5CkyaIj+n7iP2FTyJTzM4oqj4tvlFPZkac9H9FlSpt5IQXWEYa6Xw4vletW6c+keS4e2moUvoB4j0ZM+jLF7N7YHKiGYBzFddLKqCq+tPPAG9D7BYcWZUU=
Content-ID: <3DE06E73AB69FD43B053E083CE8E6527@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a769222-b965-4bed-0a82-08d6ffb9c7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:24:30.5802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3106
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNToyMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+PiAt
LS0gYS94ZW4vYXJjaC94ODYvY3B1L213YWl0LWlkbGUuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2NwdS9td2FpdC1pZGxlLmMNCj4+IEBAIC03MzEsNyArNzMxLDggQEAgc3RhdGljIHZvaWQgbXdh
aXRfaWRsZSh2b2lkKQ0KPj4gICAgIAkJfSB3aGlsZSAoY3gtPnR5cGUgPiBtYXhfY3N0YXRlICYm
IC0tbmV4dF9zdGF0ZSk7DQo+PiAgICAgCQlpZiAoIW5leHRfc3RhdGUpDQo+PiAgICAgCQkJY3gg
PSBOVUxMOw0KPj4gLQkJbWVudV9nZXRfdHJhY2VfZGF0YSgmZXhwLCAmcHJlZCk7DQo+PiArCQll
bHNlIGlmICh0Yl9pbml0X2RvbmUpDQo+PiArCQkJbWVudV9nZXRfdHJhY2VfZGF0YSgmZXhwLCAm
cHJlZCk7DQo+IA0KPiBTdHlsZSA/Pw0KDQpJIGRvbid0IHNlZSBhbnkgc3R5bGUgdmlvbGF0aW9u
IGhlcmUsIGNvbXBhcmluZyB3aXRoIG5laWdoYm9yaW5nDQpjb2RlLiBQbGVhc2UgY2xhcmlmeS4N
Cg0KSmFuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
