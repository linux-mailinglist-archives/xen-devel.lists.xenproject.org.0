Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7F70075
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 15:03:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXuy-00060w-1w; Mon, 22 Jul 2019 12:59:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpXuw-00060r-LT
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:59:50 +0000
X-Inumbo-ID: 8a9ae51e-ac80-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a9ae51e-ac80-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 12:59:49 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 12:59:28 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 12:56:48 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 12:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aocBBLELancMFkPw3jqPe6HgesB9aZuk6X46Sl1ldR7TFSAxWE+uXuhalFE3H/A/1oONeLdNGrwNxrv8it3bM6gnIkXR2xIrk8c7uphQD3zhSANHOS6jf6tATtK1hqlTXPornq3ZcEONw/pXUwG81mL4DMaQa0nedkuEFuWriRteb4x8ju/cMOF+qDNueTtfc+0bBBEtrk5Ewqs6qtfvhMzfXnJr68hUHjkw5cYjkuM5ii8Hjxw8VVU6owBtdiRGtQytO11ACyZVYklfBZwZ2cHwDvwu8/9OKxlZjb/jynTAzZyPGr7uo3rSpy9vTjVxHyiBTIMBLmTpEjuvSsF+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY0dsQvK4O4yp29+23bWzTOUuTEoulpGRgzEL+DNZqY=;
 b=Vt97PHAm1oiKWMLALo508ws0u/9uqEGbtED+P3uh9ZIT1lQTGtfueiNrn7MjYdG3YXF55NkgylQw/xfhaBwavkJYVV8PnS4q2znR7XhJZuPXAc5c0XUFGLCCFqhX/24GcfsjwKoLmgNO5EDz/DoFV2Bmo5JvP99Qg+oXx9l9rZ52TB1nl/Z9NexcKHnzcJhNuF4CN7KFrP7zL7vFUB8jm3vcUfZy1Jl2cKmNtRRHDJmc9lKvBUQA8SvVJPBf3w/P0goArLwIxBmRHn66kv+BLKypdnc9m47oUe32XwcMrQ0hVBdpiGTPaNsCYzBRMUxo4ikVcnjQbKfXe6Z1Mh9Ofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3068.namprd18.prod.outlook.com (20.179.48.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 12:56:46 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 12:56:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v3] x86/altp2m: Add a new hypercall to get the active
 altp2m index
Thread-Index: AQHVHR91gFCC2wnfik6rp2c4QxPTkqaQFCmAgEbGmYCAAATLAA==
Date: Mon, 22 Jul 2019 12:56:45 +0000
Message-ID: <4fbb197a-ffa4-e9d0-9c48-8e1073961a90@suse.com>
References: <20190607105449.28167-1-aisaila@bitdefender.com>
 <5CFA4F850200007800236337@prv1-mh.provo.novell.com>
 <cc40b093-86a5-f1b1-d316-f8787f7b717b@bitdefender.com>
In-Reply-To: <cc40b093-86a5-f1b1-d316-f8787f7b717b@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::24) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61340480-52e0-46d4-c383-08d70ea40d4e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3068; 
x-ms-traffictypediagnostic: DM6PR18MB3068:
x-microsoft-antispam-prvs: <DM6PR18MB30685E9982D741065CB4A37CB3C40@DM6PR18MB3068.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(6916009)(99286004)(53546011)(6506007)(386003)(256004)(14444005)(53936002)(6246003)(316002)(2906002)(486006)(54906003)(76176011)(229853002)(81156014)(81166006)(26005)(14454004)(31686004)(186003)(8936002)(8676002)(102836004)(478600001)(52116002)(4326008)(25786009)(6436002)(80792005)(86362001)(66446008)(66476007)(66556008)(64756008)(305945005)(66066001)(446003)(31696002)(5660300002)(6486002)(7416002)(476003)(36756003)(2616005)(71190400001)(71200400001)(6512007)(6116002)(68736007)(66946007)(7736002)(11346002)(3846002)(15583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3068;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wa21Fi2JuujC9MgKvYrV5xVfuQduEwL3sYaaC5rfn7Rs2VrBbqtDAOSseLVsxHFhCtCnjsNGHtoyns+V+QbdZk9/7A7TZ6o8JQcqTj0ln6g6VAMxh3CzoYRFo6L9I3cOWo3MY4ud1KmAv5XImlkwcOMsI+ekBfx6FRM6ad1ITm9yyqT2EER+be+gxbUQXfQyJYyBA7DVI/PTpeVTB1VluOgc/2wCpWlk3z1jxgDYItQEfb2S2mi40AF+YOGd5GE9c+JwNRcFrcdl2Vg2C23o35IpWs+c29zutu6j8GOzrm8nevp1T8WG2zea1TDTZFigutiyZuxuAdTLw3/LQ3GBwuAQi2Vr3jzWqhNC4TPZm8AGf8PMgz3P5GESTfl2B8M4wK+ydwGo2uJLQ1WmExrVxxUuXwburnEnAJIZkt4FBQY=
Content-ID: <F86A0150965B38419D56CAD51C562585@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 61340480-52e0-46d4-c383-08d70ea40d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 12:56:45.8754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3068
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3] x86/altp2m: Add a new hypercall to get
 the active altp2m index
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNDozOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IFBp
bmcsDQo+IA0KPiBBbnkgcmV2aWV3cyBvbiB0aGlzIHBhdGNoIGFyZSBhcHByZWNpYXRlZC4NCg0K
RkFPRCBJIHRoaW5rIEkndmUgcHJvdmlkZWQgYWxsIHRoZSBmZWVkYmFjayBJIGhhdmUuIFRoZSBw
YXRjaCBkb2Vzbid0DQpzZWVtIHRvIGhhdmUgYSB0b29sIHN0YWNrIG1haW50YWluZXIgYWNrIHll
dCwgYW5kIEkgdGhpbmsgSSBoYWQgbWFkZQ0KY2xlYXIgcHJldmlvdXNseSB0aGF0IEknbSB3aWxs
aW5nIHRvIGxvb2sgYXQgY2hhbmdlcyB0byBkb19hbHRwMm1fb3AoKSwNCmJ1dCB0aGF0IEknbSBu
b3Qgd2lsbGluZyB0byBhY2sgbmV3IGFkZGl0aW9ucyB0byB0aGlzIGludGVyZmFjZSBhcyBsb25n
DQphcyBpdCdzIChvcHRpb25hbGx5IG9yIG5vdCkgZXhwb3NlZCB0byBndWVzdHMuIEl0IGVmZmVj
dGl2ZWx5IGJlaW5nDQpwYXJ0IG9mIGFsdHAybSwgc3RyaWN0bHkgc3BlYWtpbmcgaXQgc2hvdWxk
bid0IGJlIGEgZ2VuZXJhbCB4ODYNCm1haW50YWluZXIgYWNrIHRoYXQncyBuZWVkZWQgaGVyZSBh
bnl3YXkuIEFzIGEgaGludCAtIGl0IGNlcnRhaW5seQ0Kd291bGQgaGVscCBpZiB0aGUgZnVuY3Rp
b24gd2FzIG1vdmVkIHN1aXRhYmx5Lg0KDQpKYW4NCg0KPiBPbiAwNy4wNi4yMDE5IDE0OjUwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA3LjA2LjE5IGF0IDEyOjU1LCA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+IEBAIC00NzM1LDYgKzQ3MzYsMjggQEAgc3RhdGlj
IGludCBkb19hbHRwMm1fb3AoDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBfZ2ZuKGEudS5j
aGFuZ2VfZ2ZuLm9sZF9nZm4pLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgX2dmbihhLnUu
Y2hhbmdlX2dmbi5uZXdfZ2ZuKSk7DQo+Pj4gICAgICAgICAgICBicmVhazsNCj4+PiArDQo+Pj4g
KyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeDoNCj4+PiArICAgIHsNCj4+PiArICAg
ICAgICBzdHJ1Y3QgdmNwdSAqdjsNCj4+PiArDQo+Pj4gKyAgICAgICAgaWYgKCAhYWx0cDJtX2Fj
dGl2ZShkKSApDQo+Pj4gKyAgICAgICAgew0KPj4+ICsgICAgICAgICAgICByYyA9IC1FT1BOT1RT
VVBQOw0KPj4+ICsgICAgICAgICAgICBicmVhazsNCj4+PiArICAgICAgICB9DQo+Pj4gKw0KPj4+
ICsgICAgICAgIGlmICggKHYgPSBkb21haW5fdmNwdShkLCBhLnUuZ2V0X3ZjcHVfcDJtX2lkeC52
Y3B1X2lkKSkgPT0gTlVMTCApDQo+Pj4gKyAgICAgICAgew0KPj4+ICsgICAgICAgICAgICByYyA9
IC1FSU5WQUw7DQo+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+ICsgICAgICAgIH0NCj4+DQo+
PiBUaGUgb3JkZXIgb2YgcmV0dXJuIHZhbHVlcyB3YXMgdGhlIG90aGVyIHdheSBhcm91bmQgYmVm
b3JlLCBidXQNCj4+IEkgc3VwcG9zZSB0aGlzIGRvZXNuJ3QgbWF0dGVyIG11Y2g/DQo+Pg0KPj4+
ICsgICAgICAgIGEudS5nZXRfdmNwdV9wMm1faWR4LmFsdHAybV9pZHggPSBhbHRwMm1fdmNwdV9p
ZHgodik7DQo+Pj4gKyAgICAgICAgcmMgPSBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkgPyAt
RUZBVUxUIDogMDsNCj4+DQo+PiBKdXN0IGFzIHJlbWFyayBmb3IgdGhlIGZ1dHVyZSAoSSBkaWRu
J3QgcGF5IGF0dGVudGlvbiBiZWZvcmUsDQo+PiBhbmQgdGhlIGRpZmZlcmVuY2UgaXNuJ3Qgb3Zl
cmx5IG1lYW5pbmdmdWwgZm9yIG9wZXJhdGlvbnMgdGhhdA0KPj4gZG9uJ3Qgb2NjdXIgZnJlcXVl
bnRseSkgLSBfX2NvcHlfZmllbGRfdG9fZ3Vlc3QoKSB3b3VsZCBiZQ0KPj4gbGVzcyBvdmVyaGVh
ZCBoZXJlLiBPaCwgcmlnaHQgLSB0aGlzIGlzIG9uY2UgYWdhaW4gbm90IHBvc3NpYmxlDQo+PiBi
ZWNhdXNlIG9mIGFyZyAoc3RpbGwpIGJlaW5nIGEgaGFuZGxlIG9mIHZvaWQuDQo+Pg0KPj4gSmFu
DQo+Pg0KPj4NCj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX18NCj4+IFRoaXMgZW1haWwg
d2FzIHNjYW5uZWQgYnkgQml0ZGVmZW5kZXINCj4+DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
