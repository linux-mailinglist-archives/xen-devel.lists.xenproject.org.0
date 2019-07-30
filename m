Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AC7A54C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:58:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOrp-000297-FU; Tue, 30 Jul 2019 09:56:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsOro-00028y-H4
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:56:24 +0000
X-Inumbo-ID: 42b7b753-b2b0-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42b7b753-b2b0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:56:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:56:14 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 09:49:39 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 09:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kw0p97jc03fYAhN7XOSKm93HJcN+F3Ct119eFfXbUhQTgpbEw96LQVLRuv/Y8lxlmn3awJ8rYk5eRr51lSNkx0IreqS377NmPp3sHaqqJha3qMsn3EtV6z4Hn9HHyqz2ZzgAmkcxPNhqtpjUQ3kl4lAVtWL97zFWWZMbuA/dz9Op0y/HH0YSyrOMKqu/Nvkcz8BB8GBbFE7jkaebqkEaVfhMR1rf42FXoNgrsaFDfIZACGLVsNGLFRI1tMiOLJrvYAXMSlw+2o7vZtS1PHP1uc/FESjpR+O9dpvNnEHnnHCmlsL9q1QLTFcfYeE8OBv4FTDjLy4ZlZ+zus9aeR2Xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XDLqKgK3TBnmiDmgtdc9cDFf0qIuMw7IXQJrYH/268=;
 b=KmG26AUU7nJSCbBUFGDBzD7+aB2ve9iPF+MkpJRNdLGcVttgf/KYt+AKvTmHfkBLQV4WUWxnj0uy9I+l/0500Q9I70vFl6dki6lkKaEFWcUVG3+AkfMJUDsWL41h2RMD7yPcZZbCAagy+7YOkYKWfWjzgL2bb8/FroHoeqf7N7EB2fCYPUmt8uyEk1yz6OyX7mwM3GfVA2bEcFhHKw5c7nOUB4YmCjhBirCZir49IdQm3QS4ZCKLsfOPPHsKfVsGjQWxOx6qrt6L5MqoNUB4M0sIpD514fSY3YZ5AVKYydX+RUtzYal2DX3tOTDrNFa3XBoEibWGttWY6L6jl1UEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3185.namprd18.prod.outlook.com (10.255.137.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 09:49:38 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:49:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 1/2] xen/link: Introduce .bss.percpu.page_aligned
Thread-Index: AQHVRjSGjfvYvY8Mj0+dnjT7dlU+s6bi2QqAgAAPEuOAAAOnAA==
Date: Tue, 30 Jul 2019 09:49:38 +0000
Message-ID: <7061f1db-aa45-d016-8645-1f733f753944@suse.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
 <20190729173843.21586-2-andrew.cooper3@citrix.com>
 <446e9293-2689-39cb-9086-19abd6702431@suse.com>
 <fb4f5507-11aa-d197-c759-a84d84c7779d@citrix.com>
In-Reply-To: <fb4f5507-11aa-d197-c759-a84d84c7779d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:6:43::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7654813e-62f6-43fb-b1d3-08d714d33ca3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3185; 
x-ms-traffictypediagnostic: BY5PR18MB3185:
x-microsoft-antispam-prvs: <BY5PR18MB3185D7C0D6C3D03FE54F2FD9B3DC0@BY5PR18MB3185.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(3846002)(31686004)(446003)(229853002)(71190400001)(71200400001)(256004)(7736002)(305945005)(2906002)(6246003)(66946007)(6116002)(64756008)(4326008)(66556008)(6916009)(316002)(66446008)(25786009)(66476007)(486006)(14444005)(5660300002)(11346002)(476003)(186003)(2616005)(26005)(99286004)(8676002)(386003)(6506007)(53546011)(478600001)(6486002)(54906003)(86362001)(31696002)(80792005)(6436002)(52116002)(81156014)(81166006)(8936002)(102836004)(14454004)(6512007)(66066001)(76176011)(68736007)(53936002)(36756003)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3185;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mCZm0E1e9hCDmX4rYK17Wuks4qX66PhKW9t0N/9ykFa9YbTJ41AOxkVnjLp3E8wyTdU04DiOk46wTxid4J5EqkP+mNeDpkrayQR1agJyYl+Aq2lTxW/H7VYR9exLMY3k73OzSWRgvsSxP9qi3uCpzugmjj1cfOOorLtwAv0sslpPkLV6Wlq/9TmNKt9Z6x0Dw8DOUHw+wXUzxMEq8CjEOoAQsyn8L0USn8mqTgSbuy50mgIRdivWnoDs/h5pk7xecFjLZsOT1ESumRRKioBKIHfkK4ikpiJFCpr3cuV/5bsC0VJPnOJZeMfVTHhwF7imyCFq1wKFOV4jHGus8QlBKWKH3U7f80jOVMxwvF84FQVw8HZKAgWVzycaUcGxCieHs7obYEIXCRuuGSUt3d0FLGid44iqjgP7XkavyHjLUnI=
Content-ID: <CB8732AF6939F845A82B7E5363F4B50C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7654813e-62f6-43fb-b1d3-08d714d33ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:49:38.7468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3185
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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

T24gMzAuMDcuMjAxOSAxMTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzAvMDcvMjAx
OSAwOTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOS4wNy4yMDE5IDE5OjM4LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+Pj4gQEAgLTI5MywxNCArMjkzLDE3IEBAIFNF
Q1RJT05TDQo+Pj4gICAgICAgICAgX19ic3Nfc3RhcnQgPSAuOw0KPj4+ICAgICAgICAgICooLmJz
cy5zdGFja19hbGlnbmVkKQ0KPj4+ICAgICAgICAgICooLmJzcy5wYWdlX2FsaWduZWQqKQ0KPj4+
IC0gICAgICAgKiguYnNzKQ0KPj4+IC0gICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7
DQo+Pj4gKyAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4+PiAgICAgICAgICBfX3Blcl9j
cHVfc3RhcnQgPSAuOw0KPj4+ICsgICAgICAgKiguYnNzLnBlcmNwdS5wYWdlX2FsaWduZWQpDQo+
Pj4gKyAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4+IEJ1dCB0aGlzIGdvZXMgdG9vIGZh
cjogV2hhdCB3ZSB3YW50IGlzIGZvciB0aGUgVFNTIHRvIG9jY3VweSBhIGZ1bGwNCj4+IHBhZ2Us
IG5vdCBmb3Igd2hhdGV2ZXIgcmFuZG9tIG90aGVyIHBhZ2UtYWxpZ25lZCBvYmplY3QgZW5kcyB1
cA0KPj4gbGFzdCBoZXJlIChzaG91bGQgYW55IGV2ZXJ5IGFwcGVhcikuDQo+IA0KPiBDb21lIGFn
YWluP8KgIFRoaXMgaXMgcmlkaWN1bG91cy4NCj4gDQo+IE9iamVjdHMgaW4gYSBzZWN0aW9uIGZv
bGxvd2luZyBmb28ucGFnZV9hbGlnbmVkIHNob3VsZCBuZXZlciBlbmQgdXAgaW4NCj4gdGhlIHRh
aWwgb2YgdGhlIGZpbmFsIHBhZ2Ugb2YgZm9vLnBhZ2VfYWxpZ25lZCwgYmVjYXVzZSB0aGVuIHRo
ZXkgYXJlIGluDQo+IHRoZSB3cm9uZyBzZWN0aW9uLg0KDQpIb3cgZG8geW91IGRlcml2ZSAid3Jv
bmcgc2VjdGlvbiI/IFNlY3Rpb25zIGhhdmUgYW4gYWxpZ25tZW50IGFuZCBhDQpzaXplLiBUaGUg
bGF0dGVyIGRvZXNuJ3QgbmVlZCB0byBiZSBhIG11bHRpcGxlIG9mIHRoZSBmb3JtZXIuIFRoZQ0K
c2VjdGlvbiBlbmRzIHdoZXJldmVyIGl0cyBzaXplIHNheXMgaXQgZW5kcy4gVXNpbmcgdGhpcyBw
cm9wZXJ0eSBpcw0KYWN0dWFsbHkgZGVzaXJhYmxlIGluIG90aGVyIGNhc2VzLCB0byBsaW1pdCB3
YXN0ZSBvZiBzcGFjZS4NCg0KPiBBIHNob3J0IFRTUyBpcyBhIHBhaW4gdG8gZGVhbCB3aXRoLCBi
dXQgZXZlbiB5b3Ugc2FpZCB5b3UgZGlkbid0IGxpa2UNCj4gdGhlIHhlbl90c3MgaWRlYSB3aGVu
IHlvdSBzdWdnZXN0ZWQgaXQuDQo+IA0KPiBUaGUgbmFtZSBvZiB0aGUgc2VjdGlvbiBpcyB2ZXJ5
IGRlbGliZXJhdGVseSBub3QgVFNTIHNwZWNpZmljLCBiZWNhdXNlDQo+IHRoZXJlIGlzIHBsZW50
eSBvZiBvdGhlciBjbGVhbnVwIHdoaWNoIHdpbGwgZW5kIHVwIHdpdGggb2JqZWN0cyBpbiB0aGlz
DQo+IHNlY3Rpb24uDQoNCldlbGwsIGlmIHRoZXkncmUgYWxsIHN0cmljdGx5IGEgbXVsdGlwbGUg
b2YgUEFHRV9TSVpFLCB0aGVuIHdyaXRpbmcNCmRvd24gYSByZXNwZWN0aXZlIHJlcXVpcmVtZW50
IG1pZ2h0IGJlIGFjY2VwdGFibGUuIEJ1dCBldmVuIHRoZW4gSQ0Kd291bGRuJ3QgYmUgb3Zlcmx5
IGhhcHB5IGdvaW5nIHRoYXQgcm91dGUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
