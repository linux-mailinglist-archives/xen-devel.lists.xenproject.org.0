Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87595CC30
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:47:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEOA-000282-CC; Tue, 02 Jul 2019 08:43:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiEO8-00027x-E2
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:43:44 +0000
X-Inumbo-ID: 7f278d8a-9ca5-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f278d8a-9ca5-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 08:43:43 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 08:43:23 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 08:42:18 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 08:42:17 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3218.namprd18.prod.outlook.com (10.255.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 08:42:15 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 08:42:15 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 15/60] xen/sched: add domain pointer to struct sched_unit
Thread-Index: AQHVMLIMTFFZEHMfhUe85+9OoqjaTg==
Date: Tue, 2 Jul 2019 08:42:15 +0000
Message-ID: <29a1a8d8-0ec6-4e95-cb23-91fb2e50c83a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0020.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bcf3cf1-f8b2-4c7f-93e1-08d6fec92f24
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3218; 
x-ms-traffictypediagnostic: BY5PR18MB3218:
x-microsoft-antispam-prvs: <BY5PR18MB32181194BF4E491E8FAC7DF2B3F80@BY5PR18MB3218.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(199004)(189003)(6512007)(6436002)(54906003)(7736002)(68736007)(305945005)(229853002)(102836004)(52116002)(53936002)(14454004)(72206003)(186003)(316002)(37006003)(53546011)(80792005)(8936002)(386003)(31686004)(81156014)(81166006)(8676002)(99286004)(66066001)(5660300002)(66946007)(6486002)(2616005)(36756003)(2906002)(256004)(486006)(6862004)(476003)(4326008)(3846002)(6116002)(66476007)(86362001)(64756008)(25786009)(6246003)(6506007)(66446008)(66556008)(4744005)(71190400001)(71200400001)(478600001)(6636002)(73956011)(26005)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3218;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdgQxaXpt3Y9IT5e7EVrIBzHOGFrh2rMRqhoiCA3YaVNKkxa/9VPcZpmD/R43Jg1lydWb46K3ZxMBC4Jv0I50wDdQVRfFPIq0qlbxUZPBrmce0ChkQBuac6ccgte4XmwTmtI2m6IHHqDOfT4BM2faRLSvDC3z7UC+HHumeiHJeA8bO/AhfTIwbOTqHGHuma1rHsITBjZ5m1aSmH9madXWBV7JLU6J3LkW7qiuJJ/b6/pRgGsE5SY5DgK8WH/qq+kFSgO+AvM/73MEmjx2jmwmmqlDWgV8tJDR/csDtpRfxq3+gMT0PygJ6m2EKd/1W3DI3ZWkoQ0/i9EqxaPfyqJgfs3DJppHxcu0sRIgwfykyJs0TtH49oNNXJUGCtrkm4K9xD9/CC8esR1NTp9gE0UQ2Wl+8kSvUrq8SaSeIwqOJo=
Content-ID: <1D272BBD01947C469A325E7FF0880B87@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcf3cf1-f8b2-4c7f-93e1-08d6fec92f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:42:15.5669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3218
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 15/60] xen/sched: add domain pointer to
 struct sched_unit
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim
 Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gLS0t
IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jDQo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYw0K
PiBAQCAtMjUzLDcgKzI1Myw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NwaW5fdW5sb2NrX2RvdWJs
ZShzcGlubG9ja190ICpsb2NrMSwgc3BpbmxvY2tfdCAqbG9jazIsDQo+ICBzdGF0aWMgdm9pZCBz
Y2hlZF9mcmVlX3VuaXQoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpDQo+ICB7DQo+ICAgICAgc3Ry
dWN0IHNjaGVkX3VuaXQgKnByZXZfdW5pdDsNCj4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gdW5p
dC0+dmNwdS0+ZG9tYWluOw0KPiArICAgIHN0cnVjdCBkb21haW4gKmQgPSB1bml0LT5kb21haW47
DQoNCkFzIHNhaWQgaW4gcmVwbHkgdG8gcGF0Y2ggMTMsIEkgdGhpbmsgdGhlIGRvbWFpbiBwb2lu
dGVyIHNob3VsZCBiZQ0KaW50cm9kdWNlZCByaWdodCBpbiBwYXRjaCA0LCB0byBhdm9pZCBjaGFu
Z2VzIGxpa2UgdGhlIGFib3ZlIG9uZSwNCmFuZCBpbiBwYXJ0aWN1bGFyIHRvIGF2b2lkIG1pc3Np
bmcgY2hhbmdlcyBsaWtlIHRoZSBvbmUgdGhhdCB3b3VsZA0KYmUgd2FudGVkIGFsc28gdG8gaGFz
X3NvZnRfYWZmaW5pdHkoKS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
