Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791581515
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huYyO-0008UC-To; Mon, 05 Aug 2019 09:08:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sKIu=WB=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1huYyN-0008U5-9t
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:08:07 +0000
X-Inumbo-ID: 88c6a859-b760-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88c6a859-b760-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 09:08:05 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 09:07:58 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 09:05:37 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 09:05:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvMTZgKjdmnxV8aarMk6CBlVGlz5laEAR0uC1JfqpY7CglOr37QLNm3PRbeLBj0g+m8rgwfj3rVd6WChVAZVTZHrNPJTugnoIfvfmdc3uoiYRoGIxBVqh2yj/3IoK0Msxiozal9HDA4puK57rAWr5v1qfrtzHwwPOgMZEDAjnjeN4Y9Gve2qH/OxBZ0Siulhqqwli9G+gGdivGTDzXpb1V3Zw37H3HhXjzY3NyETG/ntk/Yukefm+GOYr+qI/988emlBbuVD4/1X/T60Mb0Bs4NaSkTTxcK1Hv0kpCWm4ITcikjt8HtmY9bV6lp9TcSS9/OlQk7fMmaKipps4r6DSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX/F/wM0R5nRdRMMQMy1OtKo0E1dGFRsbKQEojx9DIc=;
 b=BJbm5vWMFeArFQpaUlqM19AniQyTUjhXCITLiSgWP6IbK2sO5tOYDc8ueC41H1vkynW5MwkFyAL1E0ycT5CtD8vEMNhZWaCE0fObowyTm9pSJn57odj/XXDALPM81XnoxgsTfJkJ9iXAJIQf5qch3B960fSbtBaiUuitW3FIxCiykf95odi8prd6AnejsaJpkGRSThRsRneFsdh/vw2IR8D2NBW6ZA0Rl6TZHPy0Ehha+rPUKuDoPQmyjAatY4kCohvYFgKYDiCfpMqpQ2agPegLltC63sAcWmrW+ocq8tdmeWHZ9DUFh3T4UDH31lzqa+kQCCivsRwdY7/XSuSYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Mon, 5 Aug 2019 09:05:37 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:05:37 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1] x86/spec-ctrl: Remove EAGER_FPU when PV/HVM is
 disabled.
Thread-Index: AQHVS2tXqqYTwX0oZ0GkAajAz6g26absQrxPgAAAQ4A=
Date: Mon, 5 Aug 2019 09:05:36 +0000
Message-ID: <c3a923cf-edd2-2502-045f-2313b4d617fb@suse.com>
References: <20190805085350.23309-1-jnwang@suse.com>
 <2956f438-c3e8-2936-13da-71210909ec90@citrix.com>
In-Reply-To: <2956f438-c3e8-2936-13da-71210909ec90@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR02CA0077.apcprd02.prod.outlook.com
 (2603:1096:4:90::17) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7379aa4e-2274-4e50-1bb5-08d719841492
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB3363F7CC1515CBDF119B0D5FBEDA0@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(316002)(11346002)(8936002)(110136005)(54906003)(107886003)(7736002)(25786009)(53546011)(6506007)(386003)(2501003)(81156014)(81166006)(102836004)(5660300002)(6246003)(76176011)(2906002)(4744005)(99286004)(31696002)(6116002)(86362001)(229853002)(3846002)(8676002)(26005)(4326008)(186003)(305945005)(52116002)(68736007)(6512007)(6486002)(2616005)(476003)(71200400001)(71190400001)(446003)(36756003)(66066001)(6436002)(66946007)(64756008)(478600001)(66446008)(14454004)(53936002)(31686004)(66476007)(256004)(486006)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YhmCeyeeX2XlXRafB5XB7oongm5B2oUpQxEGYtJkooJbOX0+M4hGIjlqXDXDDAPIG15NHBk7vU+TPp0uJRPnrBEHCVTPlp4UQb4PH2MrZrD1rabH92dp7PwRdpfcvGBTn68X7SMtgAnEEibwBrYUB3Jk4Mmg01sVSxlDIQ/gunkQze+VLWmHmhbkOXvj7y+5Mi58uuww7HEnfFcxerx9lR224IJyCqACtmfeonLhPTttAxus7ElnJf0GyygpRVDDkwzansSQ9wlVgp8tJEgvYKh6qNXfgVQJf2zvWZi7OKEvN2J6I0r/D5R/37tlc4coA65XWeGb/BUaAkd2M72jd0SbCt1UWi0M0/BTUoK+IbdWac9+k18lJbm8o2evFkcnIS3ru5uCReGfVf9Xne4iWOeYQgGzMsoautCHiFAzK/M=
Content-ID: <FE84F14E34156743B2D3345E33031496@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7379aa4e-2274-4e50-1bb5-08d719841492
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:05:36.9860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnwang@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1] x86/spec-ctrl: Remove EAGER_FPU when
 PV/HVM is disabled.
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
Cc: Jan Beulich <JBeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA4LzUvMTkgNTowNCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDUvMDgvMjAx
OSAwOTo1NCwgSmluIE5hbiBXYW5nIHdyb3RlOg0KPj4gSW4gY29tbWl0IGFjM2Y5YTcyMTQxYTQ4
ZDQwZmFiZmZmNTYxZDVhN2RjMGUxYjgxMGQ6DQo+PiAgICAgRm9yIG9uZSwgIm5vLXhlbiIgc2hv
dWxkIG5vdCBpbXBseSAibm8tZWFnZXItZnB1IiwgYXMgImVhZ2VyIEZQVSIgbW9kZQ0KPj4gICAg
IGlzIHRvIGd1YXJkIGd1ZXN0cywgbm90IFhlbiBpdHNlbGYsIHdoaWNoIGlzIGFsc28gZXhwcmVz
c2VkIHNvIGJ5DQo+PiAgICAgcHJpbnRfZGV0YWlscygpLg0KPj4NCj4+IFNvIHdoZW4gc3BlYy1j
dHJsPXB2PW9mZixodm09b2ZmOyAgRUFHRVJfRlBVIHNob3VsZG4ndCBiZSBkaXNwbGF5IGluIGxp
bmVzOg0KPj4gQ3VycmVudFtXcm9uZ106DQo+PiAoWEVOKSAgIFN1cHBvcnQgZm9yIEhWTSBWTXM6
IEVBR0VSX0ZQVSBNRF9DTEVBUg0KPj4gKFhFTikgICBTdXBwb3J0IGZvciBQViBWTXM6IEVBR0VS
X0ZQVSBNRF9DTEVBUg0KPj4NCj4+IGV4cGVjdGF0aW9uOg0KPj4gKFhFTikgICBTdXBwb3J0IGZv
ciBIVk0gVk1zOiBNRF9DTEVBUg0KPj4gKFhFTikgICBTdXBwb3J0IGZvciBQViBWTXM6IE1EX0NM
RUFSDQo+IEVhZ2VyIEZQVSBpcyBhIHBlcmZvcm1hbmNlIHdpbiBhY3Jvc3MgdGhlIGJvYXJkLsKg
IEl0IHdpbGwgYmVjb21lIGFuIGV2ZW4NCj4gYmlnZ2VyIHBlcmZvcm1hbmNlIHdpbiB3aGVuIHdl
IGZvbGxvdyBpbiBMaW51eCdzIGZvb3RzdGVwcyBhbmQgcmVtb3ZlDQo+IHRoZSBlYWdlciBvcHRp
b24sIGFuZCBhc3NvY2lhdGVkIGxvZ2ljLg0KT0suDQo+IEkgZG9uJ3Qgc2VlIGFueSB2YWx1ZSBp
biB0dXJuaW5nIGl0IG9mZiBmb3Igc3BlY3VsYXRpb24gcmVsYXRlZCByZWFzb25zLg0KR290IGl0
Lg0KPiB+QW5kcmV3DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
