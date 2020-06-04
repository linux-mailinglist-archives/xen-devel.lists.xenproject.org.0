Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634711EE7B8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 17:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgrlQ-0004bw-Tc; Thu, 04 Jun 2020 15:26:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+A8I=7R=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jgrlP-0004br-Nn
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 15:26:40 +0000
X-Inumbo-ID: c7dfac10-a677-11ea-aeac-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7dfac10-a677-11ea-aeac-12813bfff9fa;
 Thu, 04 Jun 2020 15:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YimXXOGgOnzg8mhXfJu/SvC6xmfuKVnoCGB8DlxRAp0nCmN4dj0faB4Rgb0ZhcM89f6rLeMVaMVFlwxHnysR9Ne8XRiBsb3VWG3k2o8dM2Nu1T8r7RnmRVbWx+OxKSCTVP6H93sJntiWFNGs+alS22c08FCWnWgI9ItAxphp/732Ze0vnpgdZTKwzHrK6Uu5ykegolZ+WNpnhAL9C/xBZXDklms+kAOJD6qM19okqCV1abHRFHQ1w/MHL092e+0sB2kMXQleon66piZyoP3JKufMLtMKwdGpOY5N65dsNxmpsybtrwr1b+EJflOL7IAkQIk5JbrmTTuwybYNJKLTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwytaLmNBen2071IMziFp2czcHYUHvt/1SiO5iMgFQw=;
 b=lgFGJcXABF7i2gZWTn4oMJyQxqoHEiqOuDgtj6C4Lvm+b3XGcVyFMqFVqJCXjTqzf1znBP4BkkwZVN8EF29eErPWyZD8e72DYVYKewdaNs/R/X7QXETKq5S73dzaPugVNWg3LuL8u9jsCLXGClzKO+osrOJ9V6cMaYoGKOvUZ45bv3Tm7RgTRkVk89xuKhgd86/gImF6318Km+RDR//t7ICtyM9ot9JlWCXZknliUjHt4aR/okJM3eDfPuTuettZCmE+HOTfcK5aq9ghuqp9Bf9rBJ+3PuAKgdZkqdEfRqRdV/1fq9/oFq6eW3kRyWMpF7QrHmbyt+yP46eMfyoBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwytaLmNBen2071IMziFp2czcHYUHvt/1SiO5iMgFQw=;
 b=DrwGVmMZQQ95ta6bfPfb/EZDnsC3wCuFxQAO7uzHBm6UX6LbWnZ9iXLyTG4cWMdWyu01ubEZUdmOwajSreGZ0dJds7hkSPJJVYXc67OPiysWb4KSxPHsuDLpExfwEboblb0vCBDq6Noa6jPhdn522OGBOhZ+xUB9YMPj5iUASnY=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB6240.eurprd03.prod.outlook.com (2603:10a6:800:13d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 15:26:36 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3066.019; Thu, 4 Jun 2020
 15:26:36 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Peng Fan <peng.fan@nxp.com>, Roman Shaposhnik <roman@zededa.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyQ==
Date: Thu, 4 Jun 2020 15:26:36 +0000
Message-ID: <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45869b7d-8152-4932-1970-08d8089bab6b
x-ms-traffictypediagnostic: VI1PR03MB6240:
x-microsoft-antispam-prvs: <VI1PR03MB624037CC353EAAD286925F39E7890@VI1PR03MB6240.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +IVdjqUZfWf3nhKxwkV6NOOOe3pUnOvdfoVY4PBmk+Xjkcm93LLPuotBbOf9RDNyfEi7MlNRwjopGL1aaUGdGqfl4tNr23iMxa01mOS7WGc05sVaQta34rzvzT7hqoWgkkKk9AgiBjaIX+PsCJVLvrkGH+YCVH6NXELQC8qGrCDusht4bFAGKHxlEI49Jm6Xp6T8bH16YgpkSDzybVKpaCz4Kepm34WROrB8zog18ksHjyBG2Wwi3YyoyNTnlLeHyVGx1L4OHkgCft9ZAy3Mcqb73msImi+eI7zjm6zVbINtPZNewt/uCn+6/2NjAPpixkKx0xfuYrkYdn1NAaUtfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(8936002)(5660300002)(31696002)(6506007)(8676002)(86362001)(53546011)(54906003)(316002)(4326008)(110136005)(83380400001)(31686004)(71200400001)(36756003)(26005)(64756008)(6486002)(2616005)(76116006)(6512007)(66946007)(66556008)(2906002)(186003)(478600001)(66476007)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0whMbMqrj28v1ye2WvqHkZ4IvmX9In40HAk7kZz1RtnRnrP6S8ih+RPedgA2b/8AtKm86OeC3jtF+4HujiTLXYCGcWIFjo/56F+IFr+iZUzXbRzeCbu8N20hL1iISU4HDJukmI4NL9JiNg3hKMY4uFI1OhDjZjaaG/5pAaWkj9FwGHWxD6eZ5ojb9/+ms72ySp09uSHFm+HKFdyQD5P9nyG33SZklEkETPTFvWCyruEQa+cS6MPyDJWvoonLw0UaiwMv2PZHJGYEfLAEapglQ+juXNdsGc5kzjurslNPxbPxDkzCvAwqwu+Wlv6+7YnrOevGTMJu9qC0jwJxqr0yzp7prrJjPIWUgpKxGhz5rQVf+Yf/rodRTxdZRX5DVZZRCk37Y4mc5LZXPNaVV2W6vu6eG9vxNV0kPzQV23wrm3gjrsq8Kxc4k8pwoJorPRk8DRIdc955Gc3eIju2J73EQLkQAADQNjM167WuM7vLthM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <825F4633972D3C4099A8393F3656225B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45869b7d-8152-4932-1970-08d8089bab6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 15:26:36.1131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVX2BbWA5fV7Ba/aQPs4I4oRW8RbuFDyqDeT/LqNVQJOyWiqVXtp9PvA2dAXN52grD1zi+MluC/xAMSu9diHr7zexuy6HEmrwwUwoK6Qq2wfV2aL/GrdBk2cxXgelj5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6240
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi80LzIwIDQ6NTcgQU0sIFBlbmcgRmFuIHdyb3RlOg0KPiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+Ow0KPj4gTmF0YWxpeWEgS29yb3ZraW5hIDxtYWx1cy5icmFuZHl3aW5lQGdtYWlsLmNvbT4N
Cj4+IFN1YmplY3Q6IFVFRkkgc3VwcG9ydCBpbiBBUk0gRG9tVXMNCj4gV2UgaGF2ZSBtYWRlIFUt
Qm9vdCBydW4gaW5zaWRlIFhFTiBEb21VLCBidXQganVzdCBvbmx5IFBWIGNvbnNvbGUgcGFydCwN
Cj4gbm90IGltcGxlbWVudCBvdGhlciBmcm9udGVuZCBkcml2ZXJzIGN1cnJlbnRseS4gV291bGQg
dGhpcyBoZWxwIGZvciB5b3VyDQo+IGNhc2UgaWYgZW5hYmxlIEVGSSBpbiBVLUJvb3Q/DQoNCldl
bGwsIHdlIGhhdmUgYSB3b3JraW5nIFBWIGJsb2NrIGltcGxlbWVudGF0aW9uIG9uIHRvcCBvZiB0
aGF0IG9uIGlNWDgNCg0KcGxhdGZvcm0sIG1vc3RseSBwb3J0ZWQgZnJvbSBtaW5pLW9zLiBDdXJy
ZW50bHkgd2UgYXJlIGZpbmFsaXppbmcgdGhlIHdvcmsNCg0KYW5kIGNsZWFuaW5nIHVwIChpdCdz
IGdvaW5nIHRvIHRha2UgYSB3ZWVrIG9yIHNvIGhvcGVmdWxseSkuIFRoZW4sIHdlIHdlJ2xsIHBv
c3QNCg0KaXQgb24gb3VyIHB1YmxpYyBnaXRodWIuIFdlIGFyZSBhbHNvIHRoaW5raW5nIGFib3V0
IHVwc3RyZWFtaW5nIHRoZSB3b3JrLCBidXQgaXQgbWF5DQoNCnRha2UgcXVpdGUgc29tZSB0aW1l
IGlmIHRoZSB3aG9sZSBpZGVhIGZpdHMgdS1ib290J3MgdmlldyBvbiBzdWNoIGFuIGV4dGVuc2lv
biBhdCBhbGwuDQoNClJlZ2FyZHMsDQoNCk9sZWtzYW5kcg0KDQo+IFJlZ2FyZHMsDQo+IFBlbmcu
DQo+DQo+PiBIaSENCj4+DQo+PiB3aXRoIGEgbG90IG9mIGhlbHAgZnJvbSBTdGVmYW5vLCB3ZSdy
ZSBnZXR0aW5nIFJQaTQgc3VwcG9ydCBpbiBQcm9qZWN0IEVWRQ0KPj4gcHJldHR5IG11Y2ggb24g
cGFyIGJldHdlZW4gS1ZNIGFuZCBYZW4uDQo+Pg0KPj4gT25lIGJpZyBhcmVhIHRoYXQgc3RpbGwg
cmVtYWlucyBpcyBzdXBwb3J0aW5nIFVFRkkgYm9vdCBzZXF1ZW5jZSBmb3IgRG9tVXMuDQo+PiBX
aXRoIEtWTSwgZ2l2ZW4gdGhlIHFlbXUgdmlydCBkZXZpY2UgbW9kZWwgdGhpcyBpcyBhcyBzaW1w
bGUgYXMgdXNpbmcgZWl0aGVyDQo+PiBzdG9jayBVRUZJIGJ1aWxkIGZvciBhcm0gb3IgZXZlbiBV
LUJvb3QgRUZJIGVtdWxhdGlvbiBlbnZpcm9ubWVudCBhbmQNCj4+IHBhc3NpbmcgaXQgdmlhIC1i
aW9zIG9wdGlvbi4NCj4+DQo+PiBPYnZpb3VzbHkgd2l0aCBYZW4gb24gQVJNIHdlIGRvbid0IGhh
dmUgdGhlIGRldmljZSBtb2RlbCBzbyBteQ0KPj4gdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBl
YXNpZXN0IHdheSB3ZSBjYW4gc3VwcG9ydCBpdCB3b3VsZCBiZSB0byBwb3J0DQo+PiBVRUZJJ3Mg
T3ZtZlBrZy9Pdm1mWGVuIHRhcmdldCB0byBBUk0gKGl0IHNlZW1zIHRvIGJlIGN1cnJlbnRseSBl
eGNsdXNpdmVseQ0KPj4gWDY0KS4NCj4+DQo+PiBTbyBoZXJlJ3MgbXkgZmlyc3QgcXVlc3Rpb246
IGlmIHRoZXJlJ3MgYW55Ym9keSBvbiB0aGlzIGxpc3Qgd2hvIGhhZCBhIGhhbmQgaW4NCj4+IGlt
cGxlbWVudGluZyBPdm1mUGtnL092bWZYZW4gY2FuIHlvdSBwbGVhc2Ugc2hhcmUgeW91ciB0aG91
Z2h0cyBvbiBob3cNCj4+IG11Y2ggd29yayB0aGF0IHBvcnQgbWF5IGJlIChvciB3aGV0aGVyIGl0
IGlzIGV2ZW4gZmVhc2libGUgLS0gSSBtYXkgdG90YWxseSBiZQ0KPj4gbWlzc2luZyBzb21ldGhp
bmcgcmVhbGx5IG9idmlvdXMgaGVyZSkuDQo+Pg0KPj4gQW5kIGFzIGxvbmcgYXMgSSd2ZSBnb3Qg
eW91ciBhdHRlbnRpb246IHR3byBtb3JlIHF1ZXN0aW9uczoNCj4+ICAgICAxLi4gY29tcGFyZWQg
dG8gdGhlIGFib3ZlLCB3b3VsZCBwb3J0aW5nIHB2Z3J1YiB0byBBUk0gYmUgYW55DQo+PiAgICAg
ZWFzaWVyIG9yIG1vcmUgZGlmZmljdWx0Pw0KPj4NCj4+ICAgICAyLiBzYW1lIHF1ZXN0aW9uIGZv
ciB0ZWFjaGluZyB1LWJvb3QgYWJvdXQgUFYgY2FsbHMuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gUm9t
YW4uDQo+Pg0KPj4gUC5TLiBPaCBhbmQgSSBndWVzcyBiZXR3ZWVuOg0KPj4gICAgIDAuIE92bWZQ
a2cvT3ZtZlhlbiBvbiBBUk02NA0KPj4gICAgIDEuIHB2Z3J1YiBvbiBBUk02NA0KPj4gICAgIDIu
IHUtYm9vdC9FRkkgZW11bGF0aW9uIHdpdGggUFYgY2FsbHMgYmFja2VuZCBJIGRpZG4ndCBtaXNz
IGFueSBvdGhlcg0KPj4gb2J2aW91cyB3YXkgb2YgbWFraW5nIFVFRkktYXdhcmUgVk0gaW1hZ2Vz
IHRvIGJvb3Qgb24gWGVuIEFSTTY0IERvbVUsDQo+PiByaWdodD8=

