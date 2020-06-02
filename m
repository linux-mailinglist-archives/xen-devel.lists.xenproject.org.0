Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7961EB2E4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 03:13:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfvTa-0002cV-69; Tue, 02 Jun 2020 01:12:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4g6=7P=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jfvTZ-0002cP-1u
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 01:12:21 +0000
X-Inumbo-ID: 1aea3ea4-a46e-11ea-ab73-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aea3ea4-a46e-11ea-ab73-12813bfff9fa;
 Tue, 02 Jun 2020 01:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dv9JJ+yZzjAYZICrp691FDqCkFIDFwQFVP53uZg6dNi9LLZi3V81nHtDIao/IATRoGmaznx0xi0mPgV9Ehnjyhy0RTRVGRRFQWTCnHf3X3F/I8MGXCTdea0tMbA+P1PPFm/CMmrSYX1a86C6OutLbTv+3Nn9r/eZer/Dd2rEZkaakTvfMjJL9uBMFjIW8MPqtkqscAx+UOc64R4l64IDx28H6fJrf5GyOr2hWLyYQDId0cbVhL+bkRtdFQsC/4z8w+RWOoti2KgDzF04N5aZAtz65RqkCzTE7spFhHyUghgHDBxqbOVLOTlz+IcBlf3FhR531hwSYRXiUX4vGEArww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xQrngUYPEu8lqWQhL3J7bxSr1SPE39TjnwqMaCAlhQ=;
 b=KhIERCZwWXJe9qSTsOSz1sNueCeC+AdJ7QI65gIoywrbsF9YJdQ2NERBIrSKSkgbLWbC3Vq+FhoT71uZPaiz/CeQgn/VjObmaE7Iw20AO0MEJ4m5yuFwZXHOYYfX/dXT039kZ9eVFV74zJXeU/LWCxKodW+U9SmR0EltBKEvejlP4KIVyJY5iaxgY7esiU5UN2N9AWeXx+tj7qZU0uJRPa9JOJDDVL0lHbEWfGkeYfrzYfXndq8dNd60IkI9BqFp/YjcPmm8q7LLSO8hyG7j5hLDGRlakmrfkJL9+lfPJwKGEVFa8CfAhMJYPClqZwAjwcPpqLM60YeYn6Fx0KOiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xQrngUYPEu8lqWQhL3J7bxSr1SPE39TjnwqMaCAlhQ=;
 b=K8RCKsB2PtS5JAUcyyhbWsCbyu4PyWyTr4eJbtyWmrlvSwF8AXBBtlJj3oZlE1aUW24GYbOU+AV1Si8DVA1bSFYWb0Y4Y/g1Bpp3ug7Xuj65Wx0N25/eOOasoWepFFMRPzuXl1OyHZ0qAOB+UEZIT1xTHuetxB/O3Ff52TcoSd8=
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB3215.eurprd03.prod.outlook.com
 (2603:10a6:803:1f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 01:12:16 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 01:12:16 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "dfaggioli@suse.com" <dfaggioli@suse.com>, "george.dunlap@eu.citrix.com"
 <george.dunlap@eu.citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [RFC 1/9] schedule: Introduce per-pcpu time accounting
Thread-Topic: [Xen-devel] [RFC 1/9] schedule: Introduce per-pcpu time
 accounting
Thread-Index: AQHVaIxKZPZB1+b+UEeHqKVXpxsigKdwZuYAgA3xnYCBPODKAIAFIZCAgAXJvoA=
Date: Tue, 2 Jun 2020 01:12:16 +0000
Message-ID: <061528bf93664a3ca00fce5d4bd3c585af1282e9.camel@epam.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-2-git-send-email-andrii.anisov@gmail.com>
 <8c74cacb-ff73-eddc-626c-f6fa862cf5a6@arm.com>
 <f3767489-e46a-3830-8b3c-0b637b71e0b8@gmail.com>
 <0e46fc4b29b7c3b3e6b4ca4704b9e7dac5738868.camel@epam.com>
 <6fcdb69457e5768b0fa2259f83a23158e9c939f5.camel@suse.com>
In-Reply-To: <6fcdb69457e5768b0fa2259f83a23158e9c939f5.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7afffd39-0500-416c-b203-08d80691fd48
x-ms-traffictypediagnostic: VI1PR0302MB3215:
x-microsoft-antispam-prvs: <VI1PR0302MB3215B47D53D85796B4F365CBE68B0@VI1PR0302MB3215.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: veRA4+akgna7zXvP4bBjKavm3EWuIzh9vg7wucHZPPvauBdrLZEN28ksQ3/ILJCIeorHJsjXy0HUddi3No6mnjptdPD0fYKdMilMKWLNCBGQgR+83WhBmh3D+1wqaLj8EPldzhlINAFfob8K8Ue4eVVe6MoRTKWhzOBltidaNK8+Pu0mtBj7LFMeM0uiPvNRGmk7c19JvM9T5PRRlss3QIbGaJWa3GEtEXecnZlnJ0EmiMrKlkSROquNyO9BlhbJ1sADfSLlbUNeT9lNw2WEuV4uMg34qhCfWHloFjMX4YFfFntix9ueBVuKkt3r64MJn4u6+Pz0SVJu0ysQf48PqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(15650500001)(5660300002)(316002)(2906002)(2616005)(8676002)(86362001)(6512007)(6486002)(478600001)(71200400001)(55236004)(6506007)(54906003)(110136005)(36756003)(7416002)(8936002)(66446008)(91956017)(76116006)(26005)(186003)(64756008)(66476007)(66946007)(4326008)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: AMjjh/ZDAZ2oOKYDxZWq742fDzKK0AhfzzoYVngVY5Mr+RtjU6bgDTCahcmTn1YN5y1x0m3ZjJrcro8BPIqUaClIbthIYLj1sv+fBlpLKFnGLsje3bAtRHzzpdIUjDn/Lb5o+dOeItzz2EUB9rhwTFdhuTnaj03s02Fev/uoPIAtTT5A7gZd/EpBeFc21NgPuorOYVGFZgpssDr7+sRlHTT/n+pRLFyaE6PSXVdIsdR3SI+5jmMhcmoRDZTavt0YXC5Jm05xIMNwx5gwHJOod6xxsjILAyFtvKyHdmo4KoD3X2M0qS8XA+uC60bmmQOYFf9MGQS/Vnx0OYV0LXqUVACi7o5xtB2PkuvF1cA3iS+rmlRVqZI9viaxsWlu3vFcwQU33AcmbhTLVN7l9U2Y1t8hCd8XbydR1Imk1Tg/N46rNvroynSP35thLXNCCieYOW+fELzUoixyShXla8/55YlgedVIqYKQ4+bWzC13Xhs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3D35729CF2BD447A4690E651F25042C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afffd39-0500-416c-b203-08d80691fd48
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 01:12:16.1037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hW3MwH7P2IioEvuam8Rbr9Z2n3COiLOh+tVSELzsKeugJSkDaedxE/yb0ZUJxvID5kEp5Sp05EoSfrmMw62P7KeNU72em7TyXL7tINg0JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3215
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTA1LTI5IGF0IDEwOjQ4ICswMjAwLCBEYXJpbyBGYWdnaW9saSB3cm90ZToN
Cj4gT24gVHVlLCAyMDIwLTA1LTI2IGF0IDAyOjI3ICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3
cm90ZToNCj4gPiBIZWxsbyBBbGwsDQo+ID4gDQo+IEhlbGxvIFZvbG9keW15ciwNCj4gDQoNCkhp
IERhcmlvLA0KDQo+ID4gVGhpcyBpcyBnZW50bGUgcmVtaW5kZXIgYWJvdXQgdGhpcyBSRkMuIA0K
PiA+IA0KPiA+IFNhZGx5LCBBbmRyaWkgQW5pc292IGhhcyBsZWZ0IG91ciB0ZWFtLiBCdXQgSSdt
IGNvbW1pdGVkIHRvIGNvbnRpbnVlDQo+ID4gaGlzIHdvcmsgb24gdGltZSBhY2NvdW50aW5nIGFu
ZCByZWFsIHRpbWUgc2NoZWR1bGluZy4NCj4gPiANCj4gT2ssIHNvLCBmaXJzdCBvZiBhbGwsIHNv
cnJ5IHRoYXQgdGhpcyBoYXMgbm90IGJlZW4gcHJvcGVybHkgYWRkcmVzc2VkLg0KPiANCj4gSSBw
ZXJzb25hbGx5IG5ldmVyIGZvcmdvdCBhYm91dCBpdCBvciBhbnl0aGluZy4uLiBTdGlsbCwgSSBo
YXZlbid0IGJlZW4NCj4gYWJsZSB0byBsb29rIGludG8gaXQgcHJvcGVybHkuDQo+IA0KDQpJIHNl
ZS4uIEFueXdheXMsIHRoYW5rcyBmb3IgdGhlIHJlcGx5LiANCg0KQWN0dWFsbHksIEkgdHJpZWQg
dG8gbm90IG9ubHkgcmViYXNlIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIHRoZSBjdXJyZW50DQptYWlu
bGluZSwgYnV0IGFsc28gdG8gYWRkIHg4NiBzdXBwb3J0LiBUaGlzIGdhdmUgbWUgZGVlcGVyDQp1
bnN0ZXJzdGFuZGluZyBvZiB0aGUgaW5uZXIgd29ya2luZ3MuIEF0IGxlYXN0IEkgaG9wZSBzbyA6
KQ0KDQpBbnl3YXlzLCBJIHdhbnQgdG8gZGlzY3VzcyB0aGUgbWF0dGVyIGJlZm9yZSBjb250aW51
aW5nIHJld29ya2luZyB0aGUNCnBhdGNoZXMuIFRoZSBnb2FsIG9mIHRob3NlIHBhdGNoZXMgaXMg
dG8gYWNjb3VudCBndWVzdCB0aW1lIG1vcmUNCnByZWNpc2VseS4gDQoNClJpZ2h0IG5vdyBJIGNh
biBzZWUgb25seSB0d28gbWFpbiByZWFzb25zLCB3aGVuIGd1ZXN0IGNhbiBiZSBjaGFyZ2VkDQpm
b3IgYSB0aW1lIGl0IGRpbmRuJ3QgdXNlZDogaW50ZXJydXB0cyBhbmQgc29mdCBpcnFzLiANCg0K
LSBkb19zb2Z0aXJxKCkgaXMgY2FsbGVkIGV2ZXJ5IHRpbWUgd2UgbGVhdmUgaHlwZXJ2aXNvciBt
b2RlLiBJdCBpcw0KdXNlZCB0byBkbyBob3VzZWtlZXBpbmcgZm9yIHRoZSBoeXBlcnZpc29yIGl0
c2VsZi4gQnV0LCBzb21lIHJhbmRvbQ0KZ3Vlc3Qgd2lsbCBjaGFyZ2VkIGZvciB0aW1lIHNwZW50
IGluIGRvX3NvZnRpcnEoKSB1bmxlc3MgdGhpcyBmdW5jdGlvbg0KaXMgbm90IGNhbGxlZCBvbiBh
IGlkbGUgdmNwdS4NCg0KLSBhbHNvLCBwQ1BVIGNhbiBiZSBpbnRlcnJ1cHRlZCBieSBJUlEgYXNz
aWduZWQgdG8gc29tZSBvdGhlciBndWVzdCBvcg0KdG8gaHlwZXJ2aXNvciBpdHNlbGYuIEJ1dCB0
aW1lIHNwZW50IGluIGludGVycnVwdCBoYW5kbGVyIHdpbGwgYmUNCmNoYXJnZWQgZm9yIGEgZ3Vl
c3QgYmVpbmcgaW50ZXJydXB0ZWQuDQoNClNvLCBiYXNpY2FsbHksIHRvIGFjY291bnQgZ3Vlc3Qg
dGltZSBjb3JyZWN0bHksIHdlIG5lZWQgdG8gc3Vic3RyYWN0DQp0aW1lIHNwZW50IGluIGRvX3Nv
ZnRpcnEoKSBhbmQgaW4gZG9fSVJRKCkuIA0KDQpBY3R1YWxseSwgd2UgY2FuIGNoYXJnZSB0aGUg
Y29ycmVjdCBndWVzdCBmb3IgdGltZSBzcGVudCBpbiBkb19JUlEoKSwNCmJlY2F1c2UgaGFuZGxl
ciBjb2RlIHdpbGwgZXZlbnR1YWxseSBrbm93IHRhcmdldCB2Q1BVIGZvciB0aGUNCmludGVycnVw
dC4gVGhlcmUgaXMgdGVjaG5pY2FsIHByb2JsZW0gd2l0aCBpbnRlcnJ1cHQgbmVzdGluZy4gV2Ug
d2lsbA0KbmVlZCBzb21lIHN0YWNrIHRvIHRyYWNrIG5lc3RpbmcgY29ycmVjdGx5LiBCdXQgdGhp
cyBpcyBkb2FibGUuDQoNCkp1c3QgZm9yIHN0YXRpc3RpY2FsIHB1cnBvc2VzIHdlIGNhbiB0cmFj
ayBoeXBlcnZpc29yIHRpbWUgc29td2hlcmUsDQpidXQgaXQgaXMgbm90IG5lZWRlZCBmb3Igc2No
ZWR1bGluZyBkZWNpc2lvbnMuDQoNCkFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCg0K

