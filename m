Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45812B342
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 09:23:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkqy-0002ZD-Gw; Fri, 27 Dec 2019 08:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkqw-0002Z8-Up
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 08:20:10 +0000
X-Inumbo-ID: aca9ee20-2881-11ea-88e7-bc764e2007e4
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aca9ee20-2881-11ea-88e7-bc764e2007e4;
 Fri, 27 Dec 2019 08:20:00 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 08:19:10 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 08:17:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 08:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TifDag2Y/LWMZETg+R7/7PooPkl4iXoTAikMIkc78SGBisTCpQWO3MrqjEa76WaUBRgr7/wCVGBmB8lgK94gVNUQwzCFw0oiw6mV6IfUtPdGfvW5gDr6EoI5f3GdZXUxiyo2wF0dAnYstdFVOqz2ybdsFGgL6E0JkUUy23pTZn6l6ptYLjZC/am6DusM8eJpSmcJqTZyS4VEtlAphThBfFiHK3VAxj0t+RtAgc+dEyIvtC9LcIKjxHQCdUZZAdx3X8uOON3ZV1axRxV6v9aoRmqpF/hkYMVPZfg3Xqqcy1+h+4zUu0Op6YD75H1Fjp9jvJrHXqdXKpUvJrVwQg73Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4AN2OwdziUsP1L9yzWKj6bLrkSia0X9SHzIV+kG8wE=;
 b=W67lfihlu102ouywxYwVdVx8AOPP9tTdsu20VjDCGd5sqnPfqKliIauP4hTrEVNtyyp4Eypngecc2eq2VE2DLIM8fhyr16nM2sp9BwOvZDXQLlpt53DyWrbW+TSlKKn0TWOhw34t6Pcn2CWdKHgNb23YX/r0YJNSO+7qO9LJiw0+pfuwQ7poeLEzIYE7yJgS1N9485D/vRt9y7ePhHCteH8rVcBg+g9YaTxd1Ku19HuCIe+obZbdayFHNN8ZHDyTs6jtqWFnA5sBiAggaIaJVRuIb3RBoTK2rU+z3tTvvKTqfMlR9KViqWdX/A3m6o+Sq6aNklW4EPJVw2JLdNaqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2SPR01MB0008.namprd18.prod.outlook.com (20.179.144.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 08:17:39 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:17:39 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P265CA0038.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 08:17:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien@xen.org>
Thread-Topic: [PATCH] x86: move vgc_flags to struct pv_vcpu
Thread-Index: AQHVtz0W7fLZmjjTFESLDQs6+XYow6fH/5KAgAWuTIA=
Date: Fri, 27 Dec 2019 08:17:39 +0000
Message-ID: <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
In-Reply-To: <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::26) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23a161dc-34a2-40d6-c444-08d78aa53d10
x-ms-traffictypediagnostic: MN2SPR01MB0008:
x-microsoft-antispam-prvs: <MN2SPR01MB0008BD5518646A574C5F3B5DB32A0@MN2SPR01MB0008.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(66556008)(66476007)(66946007)(53546011)(4326008)(71200400001)(52116002)(64756008)(66446008)(31686004)(478600001)(31696002)(86362001)(36756003)(316002)(16576012)(2616005)(956004)(6486002)(81156014)(16526019)(5660300002)(54906003)(8936002)(6916009)(26005)(81166006)(186003)(8676002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2SPR01MB0008;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lC1CFu08zdf+RTgaXV6arg4TAd+/+IK3xrqsSojB+IqO2v/LVjhPe6B6BfmkRPPAj2CjjsA+koOxLai7cK6DAYBo6FeVLUmH06CO8OXBrGdQATi1Zn1KwKCjxqOHj7PJOQuLdsdDDtr9ObHw9uznWcCcIc8+I00+LohF2wXiJoX2nL8ZvJgsnOhxE3zCH37Rave6dsAUfCPqNrg7ynAS+ByKy2jYq7mabhEsQZzsFDR1I5pfuHmX22/3lK6t8cXBGWJ9sqY3UByfktMsniufew4l4BG9i5a0rheigos7GA2J87fS4wyhK9FTRchvNGJbexORs2/xPIRUjbh+cHTPHvs/W90pTuQo/rFT4ejkiRyNblmbAHF1vFXZM3w+ZVAgsEQ/AcAEmboBrnfCqIuve8nmySg/pmCmUBK7GTtLq/iWs2zILRrYd0nn3tVDCN0P
x-ms-exchange-transport-forked: True
Content-ID: <69B65B0D343F4F47B0CD854724607B3B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a161dc-34a2-40d6-c444-08d78aa53d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 08:17:39.6839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U77qn+m/GNalUjsVX4LUpvuk2BTe9cfs9D+ZZD/3nJMlEyYZWnmYv0ORb2+noFKEsMWS4sY2d0rS5mjIp5SuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0008
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxODozMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBKYW4sDQo+IA0K
PiBPbiAyMC8xMi8yMDE5IDE0OjU1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IFRoZXJlJ3MgYmVl
biBlZmZlY3RpdmVseSBubyB1c2Ugb2YgdGhlIGZpZWxkIGZvciBIVk0uDQo+Pg0KPj4gQWxzbyBz
aHJpbmsgdGhlIGZpZWxkIHRvIHVuc2lnbmVkIGludCwgZXZlbiBpZiB0aGlzIGRvZXNuJ3QgaW1t
ZWRpYXRlbHkNCj4+IHlpZWxkIGFueSBzcGFjZSBiZW5lZml0IGZvciB0aGUgc3RydWN0dXJlIGl0
c2VsZi4gVGhlIHJlc3VsdGluZyAzMi1iaXQNCj4+IHBhZGRpbmcgc2xvdCBjYW4gZXZlbnR1YWxs
eSBiZSB1c2VkIGZvciBzb21lIG90aGVyIGZpZWxkLiBUaGUgY2hhbmdlIGluDQo+PiBzaXplIG1h
a2VzIGFjY2Vzc2VzIHNsaWdodGx5IG1vcmUgZWZmaWNpZW50IHRob3VnaCwgYXMgbm8gUkVYLlcg
cHJlZml4DQo+PiBpcyBnb2luZyB0byBiZSBuZWVkZWQgYW55bW9yZSBvbiB0aGUgcmVzcGVjdGl2
ZSBpbnNucy4NCj4+DQo+PiBNaXJyb3IgdGhlIEhWTSBzaWRlIGNoYW5nZSBoZXJlIChkcm9wcGlu
ZyBvZiBzZXR0aW5nIHRoZSBmaWVsZCB0bw0KPj4gVkdDRl9vbmxpbmUpIGFsc28gdG8gQXJtLCBv
biB0aGUgYXNzdW1wdGlvbiB0aGF0IGl0IHdhcyBjbG9uZWQgbGlrZQ0KPj4gdGhpcyBvcmlnaW5h
bGx5LiBWR0NGX29ubGluZSByZWFsbHkgc2hvdWxkIHNpbXBseSBhbmQgY29uc2lzdGVudGx5IGJl
DQo+PiB0aGUgZ3Vlc3QgdmlldyBvZiB0aGUgaW52ZXJzZSBvZiBWUEZfZG93biwgYW5kIGhlbmNl
IG5lZWRzIHJlcHJlc2VudGluZw0KPj4gb25seSBpbiB0aGUgZ2V0L3NldCB2Q1BVIGNvbnRleHQg
aW50ZXJmYWNlcy4NCj4gDQo+IEJ1dCB2UFNDSSBpcyBqdXN0IGEgd3JhcHBlciB0byBnZXQvc2V0
IHZDUFUgY29udGV4dCBpbnRlcmZhY2VzLiBZb3VyIA0KPiBjaGFuZ2VzIGJlbG93IHdpbGwgY2xl
YXJseSBicmVhayBicmluZy11cCBvZiBzZWNvbmRhcnkgdkNQVXMgb24gQXJtLg0KPiANCj4gVGhp
cyBpcyBiZWNhdXNlIGFyY2hfc2V0X2d1ZXN0X2luZm8oKSB3aWxsIHJlbHkgb24gdGhpcyBmbGFn
IHRvIA0KPiBjbGVhci9zZXQgVlBGX2Rvd24gaW4gdGhlIHBhdXNlIGZsYWdzLg0KPiANCj4gU28g
SSB0aGluayB0aGUgbGluZSBpbiBhcm0vdnBzY2kuYyBzaG91bGQgYmUgbGVmdCBhbG9uZS4NCg0K
T2gsIEkgc2VlIC0gSSBkaWRuJ3Qgbm90aWNlIHRoaXMgKGFiKXVzZSBkZXNwaXRlIC4uLg0KDQo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBzY2kuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3Zwc2Np
LmMNCj4+IEBAIC03OCw3ICs3OCw2IEBAIHN0YXRpYyBpbnQgZG9fY29tbW9uX2NwdV9vbihyZWdp
c3Rlcl90IHQNCj4+ICAgICAgICAgICBjdHh0LT51c2VyX3JlZ3MueDAgPSBjb250ZXh0X2lkOw0K
Pj4gICAgICAgfQ0KPj4gICAjZW5kaWYNCj4+IC0gICAgY3R4dC0+ZmxhZ3MgPSBWR0NGX29ubGlu
ZTsgPg0KPj4gICAgICAgZG9tYWluX2xvY2soZCk7DQo+PiAgICAgICByYyA9IGFyY2hfc2V0X2lu
Zm9fZ3Vlc3QodiwgY3R4dCk7DQoNCi4uLiBpdCBhY3R1YWxseSBiZWluZyBpbiBjb250ZXh0LiBU
aGFua3MgZm9yIG5vdGljaW5nLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
