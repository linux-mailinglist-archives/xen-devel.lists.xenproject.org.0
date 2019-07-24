Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF472BAB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 11:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqDpc-0002fN-1x; Wed, 24 Jul 2019 09:45:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqDpa-0002fI-UM
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 09:45:06 +0000
X-Inumbo-ID: b4792ee0-adf7-11e9-9f16-278e57fc02dc
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4792ee0-adf7-11e9-9f16-278e57fc02dc;
 Wed, 24 Jul 2019 09:45:03 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 09:44:50 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 09:43:36 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 09:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xz6NvvThcV9t3rWsuhSeOD+2whbYDE08yecIyvVt8/X6o6pli8rtIgIwX8RdjesF6XdETqTVNX9hHk1cc50ned+/5ZfRUjMOzQebvf5Q382f7Lwoz8W3Li9YrlOCG/GnO8X9qgaHVl6ngTXMaK6A92nAolTGtMSmAYhraXDBWluORop22C8d4/E/mM5DVNpqZU+i+UzJ1Ebf6UDVf3FdM8ROxhPnqxo6s7FZH2r7KzwD2TBWZ+A5IVHZfY9bY/SPHmFAfSfIa8WRLC0lMe8BeR+DPn0VZ+3CgU5vnEN4p2NAzI+SuP+x7WkMSv/EIZCKDcMTT4SM5Iqe6hVB2EWsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WlF4y0XUQMZnMvwBrOMIErzp/p14I+WmsDdRmAa/bw=;
 b=MzirggDbi45jqxZ+miAFVUSr52Kd6xuySULLEppfUkjFAHjNWPt+YnSilIn4KI4QpwprE6lez0hzViAEGGcGL40qO7hPQ5iLv7HIzTAat798xwholwF4B5mWHuPGBttEf6epSoUoQv8x62RuykTmaHnsr1bOFqN7MI+9ugyjgeXkyoTiT7vD6QEqA7Ez5juwNP+DmfTJ9+HbDSJscxnXuvqGa6yU3Iq2ugtDPZT8vSseChnooIKxFVs8aHaOAUCFi1jx251eS0T7CXS25KzzxBFhjGXRhuCj4fCVSNhNvekhhK1N0f24wNoV3Kia5FrxL2FlxJf2PzGpUC+gwuNjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.137.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 09:43:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 09:43:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/2] x86/iommu: avoid mapping the APIC configuration
 space for hwdom
Thread-Index: AQHVQW4zrYUYVM3HpUS5nJG7cGq72KbYXymAgAAKL3CAARxMgA==
Date: Wed, 24 Jul 2019 09:43:35 +0000
Message-ID: <cb952c0d-4111-2138-660e-c9dc0dd79c11@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-3-roger.pau@citrix.com>
 <5017c875-a59d-e7d1-c8fc-325b4208d15e@suse.com>
 <cade48e9-5346-b325-e06a-ee4adf2c48f0@citrix.com>
In-Reply-To: <cade48e9-5346-b325-e06a-ee4adf2c48f0@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::34) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed20f257-32c0-4630-424c-08d7101b65a2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB341076A05809C98B04040B9EB3C60@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(189003)(199004)(110136005)(8676002)(81166006)(256004)(99286004)(6486002)(80792005)(14444005)(316002)(71200400001)(52116002)(53936002)(8936002)(6436002)(81156014)(6512007)(476003)(25786009)(71190400001)(76176011)(478600001)(66946007)(5660300002)(14454004)(102836004)(11346002)(66066001)(53546011)(446003)(66556008)(186003)(2906002)(66446008)(26005)(386003)(6506007)(486006)(66476007)(68736007)(64756008)(229853002)(31686004)(36756003)(7736002)(6116002)(4326008)(3846002)(305945005)(6246003)(31696002)(2616005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B8BZpL6xidlF60ufOsgmtTI+3+BB6+o8cb7cOrLCda8/TJ1Y3wt1txjbPFbfv+3HVbrcWRYZwL/q7GRf8xcaZDgYgSzCRCQCfZKAKKFszKbBLwDcqzNcBddfZ+WmC8s13xYFTEBYK62ql0Xzh1ASPNstK/n+M7yYyerzj41Qy8275IeB0mq8gD5bsDom7+jnvyPG0IdlNMChcMRwLZizC2XC6k3lmb7ekiTqD1fxuRp2qXQC+5B1+E6/jzKXSaDY+15QnNiH3nCS1LGJfiP5nV/EIAWPekA90sqC2GetSOEO+VpF2oUOoxw0i38WijnbZ3lTOX0Iv5yZVptpdLtcyqGrmt4F/jmCAqCwFY6UoNAR9H3pS+Vho6U82LIOSqikvL3zbYObMi0kIp/sYiHq5+7Jq2BH6Imb6FLLHY22WHw=
Content-ID: <769D9DD240FB3D4FB53116264B20CBE7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed20f257-32c0-4630-424c-08d7101b65a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 09:43:35.4976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] x86/iommu: avoid mapping the APIC
 configuration space for hwdom
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxODo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjMvMDcvMjAx
OSAxNzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMy4wNy4yMDE5IDE3OjQ4LCBSb2dl
ciBQYXUgTW9ubmUgd3JvdGU6DQo+Pj4gQ3VycmVudCBjb2RlIG9ubHkgcHJldmVudHMgbWFwcGlu
ZyB0aGUgaW8tYXBpYyBwYWdlIGludG8gdGhlIGd1ZXN0DQo+Pj4gcGh5c2ljYWwgbWVtb3J5IG1h
cC4gRXhwYW5kIHRoZSByYW5nZSB0byBiZSAweEZFQ3hfeHh4eCBhcyBkZXNjcmliZWQNCj4+PiBp
biB0aGUgSW50ZWwgMyBTZXJpZXMgQ2hpcHNldCBEYXRhc2hlZXQgc2VjdGlvbiAzLjMuMSAiQVBJ
Qw0KPj4+IENvbmZpZ3VyYXRpb24gU3BhY2UgKEZFQzBfMDAwMGjigJNGRUNGX0ZGRkZoKSIuDQo+
Pj4NCj4+PiBBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4gdGhlIEFNRCBTUjU2
OTAgRGF0YWJvb2ssIHNlY3Rpb24NCj4+PiAyLjQuMiAiTm9uLVNCIElPQVBJQyBTdXBwb3J0Ii4N
Cj4+IEJ1dCB0aGF0J3MgY2hpcHNldCBzcGVjaWZpYy4gSSBkb24ndCB0aGluayB3ZSBjYW4gYmxp
bmRseSBhc3N1bWUNCj4+IHRoaXMgcmFuZ2UuDQo+IA0KPiBUaGUgSU8tQVBJQyBoYXMgYWx3YXlz
IGxpdmVkIGluIHRoYXQgcmVnaW9uIHNpbmNlIGl0cyBpbnRyb2R1Y3Rpb24sIGFuZA0KPiB0aGUg
bG9jYXRpb24gaXNuJ3QgZXZlbiBjb25maWd1cmFibGUgb24gbmV3ZXIgY2hpcHNldHMgKElmIEkn
dmUgcmVhZCB0aGUNCj4gU0FEIHJvdXRpbmcgcnVsZXMgaW4gU2t5bGFrZSBjb3JyZWN0bHkuwqAg
QWxsIHRoYXQgY2FuIGJlIGNvbmZpZ3VyZWQgaXMNCj4gbXVsdGlwbGUgSU8tQVBJQ3MgYmVpbmcg
bWFwcGVkIGFkamFjZW50IHRvIGVhY2ggb3RoZXIuKQ0KDQpJJ20gcHJldHR5IHN1cmUgSSd2ZSBz
ZWVuIElPLUFQSUNzIG91dHNpZGUgdGhhdCByYW5nZS4NCg0KSSdtIG5vdCBlbnRpcmVseSBvcHBv
c2VkIHRvIGEgY2hhbmdlIGxpa2UgdGhpcywgYnV0IEkgdGhpbmsgaXQgd2FudHMgdG8NCmNvbWUg
d2l0aCBiZXR0ZXIgZGVzY3JpcHRpb24gKHRha2luZyBpbnRvIGFjY291bnQgdGhlIGNoaXBzZXQt
IHJhdGhlcg0KdGhhbiBhcmNoaXRlY3R1cmUtZGVmaW5lZC1uZXNzKSBhbmQgZWl0aGVyIHJldGFp
bmluZyBvZiB0aGUgbG9vcCB0aGUNCnBhdGNoIGN1cnJlbnRseSByZXBsYWNlcywgb3IgYW4gZXhw
bGFuYXRpb24gd2h5IHRoZSBsb29wIGlzIHN0cmljdGx5DQp1bm5lY2Vzc2FyeS4NCg0KSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
