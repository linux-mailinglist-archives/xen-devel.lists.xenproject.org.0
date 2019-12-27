Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C012B28E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 09:06:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkbX-0000jr-BM; Fri, 27 Dec 2019 08:04:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkbV-0000jX-EB
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 08:04:13 +0000
X-Inumbo-ID: 6f7aade8-287f-11ea-a914-bc764e2007e4
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f7aade8-287f-11ea-a914-bc764e2007e4;
 Fri, 27 Dec 2019 08:04:01 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 08:02:58 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 08:02:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 08:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB2Vbwp7n9IMNuUEB7i9QTjoS38OeHbsNIyjBVpa7xoRVuK4AjlqNppv43x+1kPbDQu8y8AszbJxG/bXbbHE4ehzeWRi5QvFQoFfJU1WrZ4VBwJRsOkOcc3r+hfjSRR7nXbpT+K/2VT2BojmRSq94sVoF1W/I3dG+mNHqlLWCnmoJm8w/2GLmsuU2TIYMq7aw2cpeTWXkfr6optbJBi4mDPAKbs2J983Sy1QtaAHAmTXn7gJ9sF+n7uugs5tP7WGp5KB+SvmelON10ltQTcyCVXfy55OWzfaFwNR3R1giOfpo6osRjKcFGfv02oLxUa4HyTyuayF7SFyOwPX5mSW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2joeicOqe/w0gss+IZ9O9BEdOZQAc8ABEKxSHBaSCOA=;
 b=MbeYDTo3GoHWdONSB4An56MwtkjCbXOrBijjQ0qMXaP/l9wWw8gGwMiv8O/y05fUniAq8q3EYca2admHUXTblrWZHqHWWnkCGP77ogWcSt7+rePmzBFQL83vJvjOsiSlGgNbETbI98f5SVyB2ZPBo49j9Q/lHdKaCpL/QWboDUumTIg2puywZ7PIUvl67HuklgoZLdrabvYyt9GpubPx/3D5EogTq7fct3enAijp+Ca1Uy0fPiXWnBHwBOaxFTjXBPeIHD2qkckNBP96uZ4C5QUKshEzdOJT8q2+H3aQ2i4bRAwtVrpTV3Y32c/NVflV2d8/hcpIarOxELwxVv8hgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB2624.namprd18.prod.outlook.com (20.179.83.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 08:02:11 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 08:02:11 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 08:02:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Thread-Topic: [PATCH v2 01/20] x86: make hvm_{get/set}_param accessible
Thread-Index: AQHVuXSJhNM6yiIxok+f/IO5h+IrHqfHzv8AgAXWHwA=
Date: Fri, 27 Dec 2019 08:02:11 +0000
Message-ID: <279e2e11-3928-b7ef-4dda-632ce58c650d@suse.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
 <CABfawhmeMQtpwjubk_YLO26Lo+6JvZtVtqKWexgjE3VR8SNZZQ@mail.gmail.com>
In-Reply-To: <CABfawhmeMQtpwjubk_YLO26Lo+6JvZtVtqKWexgjE3VR8SNZZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::23)
 To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a53f1d16-8e59-4c13-1b0c-08d78aa313c0
x-ms-traffictypediagnostic: MN2PR18MB2624:
x-microsoft-antispam-prvs: <MN2PR18MB262435A09738DAECA23030BCB32A0@MN2PR18MB2624.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(66946007)(186003)(16526019)(26005)(66446008)(64756008)(66476007)(478600001)(6916009)(8936002)(52116002)(4326008)(66556008)(31686004)(31696002)(2616005)(956004)(86362001)(16576012)(316002)(5660300002)(2906002)(53546011)(54906003)(81166006)(71200400001)(6486002)(8676002)(36756003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2624;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bSWcAXaDPVx9ZOPW0mj8SlKhSIwlK8IxpFg1TPQARDXmJsfolAJuYoOut3m2VEPJbintWzYM6GKxR0THPS4zBnhRnQhv5Sv9taHijmFINMsT3Oqpkm3r6eTxR1ByKW91Jx+ejLLTF0XYAqxuYx13s0/2WL/RSeBCFU+P2+B8l/ZLt/TnO17OOwd64pxtYlRNCv2E86jRHYVtDOCjFLHzpDVB3k96REoO65noE1iskX3Dllu1mBmTZzg4s2ahrdmPXKdBHHMUaTRkdq60zMoUejMyDHhvwS411SPQdMMfB7E8diH08zoZ2d0CLbQUDhRhHXonhWVG3yIA7toIxyFMfXhAUJTi5+4ke+H303l2dUwnuQyB9u1VB2/5gk+QxUd/gCccL7uWy5yrjNsUllQK19GKjUEZHGcGh2qP9kM/IIS66HEr1JUYCvnvUOn3ZjVg
x-ms-exchange-transport-forked: True
Content-ID: <F8B803852B4FB5468C1E91E080FB47A2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a53f1d16-8e59-4c13-1b0c-08d78aa313c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 08:02:11.4502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y5vqbQVeyynofTMmGGpqNQxc5AK5qrIoTyeoOXKy2SvW6sUaCvOvn+Q7SvWrbaotmBiMUsRVn7ZkJoMWzr8iuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2624
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBtYWlsIGhhdmluZyBhcHBlYXJl
ZCBvbiB0aGUgbGlzdCkNCg0KT24gMjMuMTIuMjAxOSAxNTo1NSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOg0KPiBPbiBNb24sIERlYyAyMywgMjAxOSBhdCAyOjM3IEFNIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gMjAuMTIuMjAxOSAxODozMiwgQW5kcmV3
IENvb3BlciB3cm90ZToNCj4+PiBPbiAyMC8xMi8yMDE5IDE3OjI3LCBUYW1hcyBLIExlbmd5ZWwg
d3JvdGU6DQo+Pj4+IE9uIEZyaSwgRGVjIDIwLCAyMDE5IGF0IDk6NDcgQU0gSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDE4LjEyLjIwMTkgMjA6NDAsIFRh
bWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+Pj4+PiBDdXJyZW50bHkgdGhlIGh2bSBwYXJhbWV0ZXJz
IGFyZSBvbmx5IGFjY2Vzc2libGUgdmlhIHRoZSBIVk1PUCBoeXBlcmNhbGxzLiBCeQ0KPj4+Pj4+
IGV4cG9zaW5nIGh2bV97Z2V0L3NldH1fcGFyYW0gaXQgd2lsbCBiZSBwb3NzaWJsZSBmb3IgVk0g
Zm9ya2luZyB0byBjb3B5IHRoZQ0KPj4+Pj4+IHBhcmFtZXRlcnMgZGlyZWN0bHkgaW50byB0aGUg
Y2xvbmUgZG9tYWluLg0KPj4+Pj4gSGF2aW5nIHBlZWtlZCBhaGVhZCBhdCBwYXRjaCAxNywgd2hl
cmUgdGhpcyBnZXRzIHVzZWQsIEkgd29uZGVyIHdoeQ0KPj4+Pj4geW91IHdhbnQgYSBwYWlyIG9m
IG9uZS1ieS1vbmUgZnVuY3Rpb25zLCByYXRoZXIgdGhhbiBhIGNvcHktYWxsIG9uZS4NCj4+Pj4+
IFRoaXMgdGhlbiB3b3VsZG4ndCByZXF1aXJlIGV4cG9zdXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91
IHRvdWNoIGhlcmUuDQo+Pj4+IFdlbGwsIHByb3ZpZGVkIHRoZXJlIGlzIG5vIHN1Y2ggZnVuY3Rp
b24gaW4gZXhpc3RlbmNlIHRvZGF5IGl0IHdhcw0KPj4+PiBqdXN0IGVhc2llciB0byB1c2Ugd2hh
dCdzIGFscmVhZHkgYXZhaWxhYmxlLiBJIHN0aWxsIHdvdWxkbid0IHdhbnQgdG8NCj4+Pj4gaW1w
bGVtZW50IGEgb25lLXNob3QgZnVuY3Rpb24gbGlrZSB0aGF0IGJlY2F1c2UgdGhpcyBzYW1lIGNv
ZGUtcGF0aCBpcw0KPj4+PiBzaGFyZWQgYnkgdGhlIHNhdmUtcmVzdG9yZSBvcGVyYXRpb25zIG9u
IHRoZSB0b29sc3RhY2sgc2lkZSwgc28gYXQNCj4+Pj4gbGVhc3QgSSBoYXZlIGEgcmVhc29uYWJs
ZSBhc3N1bXB0aW9uIHRoYXQgaXQgd29uJ3QgYnJlYWsgb24gbWUgaW4gdGhlDQo+Pj4+IGZ1dHVy
ZS4NCj4+Pg0KPj4+IEluIHBhcnRpY3VsYXIsIGEgbnVtYmVyIG9mIHRoZSBzZXQgb3BlcmF0aW9u
cyBhcmUgZGlzdGluY3RseQ0KPj4+IG5vbi10cml2aWFsLg0KPj4NCj4+IEhvdyBpcyB0cml2aWFs
IG9yIG5vdCByZWxhdGVkIHRvIHRoZXJlIGJlaW5nIG9uZSBmdW5jdGlvbiBkb2luZw0KPj4gdGhl
IGxvb3Bpbmcgd2FudGVkIGhlcmUgdnMgdGhlIGxvb3BpbmcgYmVpbmcgZG9uZSBieSB0aGUgY2Fs
bGVyDQo+PiBhcm91bmQgdGhlIHR3byBwZXItZW50aXR5IGNhbGxzPw0KPiANCj4gSSBkb24ndCBy
ZWFsbHkgZ2V0IHdoeSB3b3VsZCBpdCBtYXR0ZXIgd2hlcmUgdGhlIGxvb3BpbmcgaXMgYmVpbmcN
Cj4gZG9uZT8gRXZlbiBpZiBJIHdlcmUgdG8gYWRkIGEgc2luZ2xlIGZ1bmN0aW9uIHRvIGRvIHRo
aXMsIGl0IHdvdWxkIGRvDQo+IHRoZSBzYW1lIGxvb3BpbmcgYW5kIGp1c3QgY2FsbCB0aGUgbm93
IGludGVybmFsbHkga2VwdCBnZXQvc2V0IHBhcmFtcw0KPiBmdW5jdGlvbnMuDQoNClRoZSBkaWZm
ZXJlbmNlICh0byBtZSkgaXMgd2hhdCBsZXZlbCBvZiBjb250cm9sIGdldHMgZXhwb3NlZCBvdXRz
aWRlDQpvZiB0aGUgZmlsZS4gRm9yIGV4YW1wbGUgSSBhbHNvIGRpc2xpa2UgZXh0ZXJuYWwgY29k
ZSBkb2luZyB0aGlzDQpzb21ld2hhdCBvZGQgKGJ1dCBuZWNlc3NhcnkgYXMgcGVyIHlvdXIgY29t
bXVuaWNhdGlvbiB3aXRoIEFuZHJldykNCmNoZWNraW5nIGFnYWluc3QgemVybyB2YWx1ZXMuIFN1
Y2ggYXJlIGltcGxlbWVudGF0aW9uIGRldGFpbHMgd2hpY2gNCndvdWxkIGJldHRlciBub3QgYmUg
c2NhdHRlciBhcm91bmQuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
