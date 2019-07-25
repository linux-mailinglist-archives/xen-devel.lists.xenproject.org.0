Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A574FD9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdzX-0001FQ-6q; Thu, 25 Jul 2019 13:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqdzV-0001Eo-Lf
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:41:05 +0000
X-Inumbo-ID: d5f07944-aee1-11e9-a3f7-9bdd742f4f33
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5f07944-aee1-11e9-a3f7-9bdd742f4f33;
 Thu, 25 Jul 2019 13:41:03 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 13:40:55 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:38:03 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT2lTOSoBNL5HZAmyamufWKKxMqbujLe13e7wb2eOeyoq99/EDkWKMXvrwE38KRIHD2NN/XI6JJiXONBGhHEUoOamqDBfO+8hZmUhkTak/tMeqLNiXlD/1QUtsxPL6Livg+pXruskIjFas9I+qRFX2Fb4+ZNqFwjS+zPT+pZAAUW4MU8J48VQatuuBwn4oXtcVVmQqNCWlQdxw/WVPAr03L3xE1ihGdpfzzQ5KrKChL6UysWAVhqNYVqQc9dvKxJqnsNMC5JX7cHMar6zRd/Hq66Up9tMVR6m0z4kJKhh7LRjsVpgp5O8GBey88BRkaRog0oNP413KrW48j0uuaURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na0W6M6kquUh7X/kFzxCUMYHUbDDjrEfjp8u6T6bR7s=;
 b=ILQ7bR2/REw6Oig1iZqX9ycreBiO9xeauBlf/Ibl3U2mnHZCIunbZCnXg5/zRhWcd0R/lPKjeuzmEfVzSrI83E6hM7vp9caD1CM313m2JvTgxZmrgF2HyyD0Mvowao2MKyWazU/L07msZq44MH7JFbVDVRJIgFsImR+M/8IpdgGkBfIPaBNk9FEiPfd4CncnrLU8ZqxoxJWHFSxdfN9vcjEBTYk06fJT1c2ApLYtH8C7iynoKPFpXoneC/SqidQ7lNNLgyLoZD4Rx5WW9Czf9Pm4AlLstANepsSwV8gdgMTJ6FednPkhvsVdbXHLtah6+kjrLdlnsppz2IYFo1nNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3297.namprd18.prod.outlook.com (10.255.163.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 13:38:01 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:38:01 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/2] x86/iommu: avoid mapping the APIC configuration
 space for hwdom
Thread-Index: AQHVQW4zrYUYVM3HpUS5nJG7cGq72KbYXymAgAAKL3CAARxMgIABxZQAgAANXWOAAADjAA==
Date: Thu, 25 Jul 2019 13:38:01 +0000
Message-ID: <f727e1e9-978b-94a7-6746-055c9dd8ae93@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-3-roger.pau@citrix.com>
 <5017c875-a59d-e7d1-c8fc-325b4208d15e@suse.com>
 <cade48e9-5346-b325-e06a-ee4adf2c48f0@citrix.com>
 <cb952c0d-4111-2138-660e-c9dc0dd79c11@suse.com>
 <10856269-2698-7791-3b43-3e47af14cbe7@suse.com>
 <20190725133421.t2petgaoxrra7ks7@Air-de-Roger>
In-Reply-To: <20190725133421.t2petgaoxrra7ks7@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3307236-2d21-48f2-1575-08d71105504c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3297; 
x-ms-traffictypediagnostic: BY5PR18MB3297:
x-microsoft-antispam-prvs: <BY5PR18MB32971F24897CCEE60CB70B3EB3C10@BY5PR18MB3297.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(6246003)(3846002)(6116002)(316002)(31686004)(99286004)(14444005)(52116002)(446003)(54906003)(76176011)(256004)(71200400001)(71190400001)(11346002)(186003)(66476007)(36756003)(476003)(81166006)(81156014)(8936002)(2616005)(68736007)(6916009)(8676002)(305945005)(53546011)(6506007)(386003)(86362001)(478600001)(6436002)(2906002)(53936002)(66946007)(14454004)(66446008)(7736002)(26005)(66556008)(31696002)(6486002)(229853002)(64756008)(5660300002)(4326008)(102836004)(6512007)(80792005)(486006)(25786009)(66066001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3297;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FJZajkj4KDnPTN9dYkihKXtrE3U4YbuXX5ruwvLgaJgjYWuseW8HaysJZurMXTMD+ChcV9g521fX78AxRvOfPDXpOR+bqJPZANmWc74k6FCdTAyueX36pracJULvKhX8MYbRF4+n/ucgkYwa+KaHm29AKqcVpQ+MZ8YU3ghRRoJOziUOOymswARfYS06+RGxiHGHLJav9RjMCHNhXxx+PToj3tGTVl0T4OwkhPsu7k4NPEmCHgbbn/w8WFZs20QsSYRkU7VjVFQMbNLXV/pFH0ZCyR+wdWqzc8Y64UuwRpjMfH19CVXoA/p+C36p1CIlWSROS9Ny0KvmoSmKvcF1rP/i4iRi5YBJYWF6Hk6dSBlqZIojllbTmfGP1fXe67yVpsgtCVP6eQ4roWlzUNI+ZLFR3I/Dc/xwGDnyds7FmwI=
Content-ID: <E8069D0C258C7B4B8BD0FA63ED1CE3C1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e3307236-2d21-48f2-1575-08d71105504c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:38:01.7615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3297
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTozNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDI1LCAyMDE5IGF0IDEyOjQ3OjAxUE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMjQuMDcuMjAxOSAxMTo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjMuMDcuMjAx
OSAxODo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4gT24gMjMvMDcvMjAxOSAxNzowOSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAyMy4wNy4yMDE5IDE3OjQ4LCBSb2dlciBQYXUg
TW9ubmUgd3JvdGU6DQo+Pj4+Pj4gQ3VycmVudCBjb2RlIG9ubHkgcHJldmVudHMgbWFwcGluZyB0
aGUgaW8tYXBpYyBwYWdlIGludG8gdGhlIGd1ZXN0DQo+Pj4+Pj4gcGh5c2ljYWwgbWVtb3J5IG1h
cC4gRXhwYW5kIHRoZSByYW5nZSB0byBiZSAweEZFQ3hfeHh4eCBhcyBkZXNjcmliZWQNCj4+Pj4+
PiBpbiB0aGUgSW50ZWwgMyBTZXJpZXMgQ2hpcHNldCBEYXRhc2hlZXQgc2VjdGlvbiAzLjMuMSAi
QVBJQw0KPj4+Pj4+IENvbmZpZ3VyYXRpb24gU3BhY2UgKEZFQzBfMDAwMGjigJNGRUNGX0ZGRkZo
KSIuDQo+Pj4+Pj4NCj4+Pj4+PiBBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4g
dGhlIEFNRCBTUjU2OTAgRGF0YWJvb2ssIHNlY3Rpb24NCj4+Pj4+PiAyLjQuMiAiTm9uLVNCIElP
QVBJQyBTdXBwb3J0Ii4NCj4+Pj4+IEJ1dCB0aGF0J3MgY2hpcHNldCBzcGVjaWZpYy4gSSBkb24n
dCB0aGluayB3ZSBjYW4gYmxpbmRseSBhc3N1bWUNCj4+Pj4+IHRoaXMgcmFuZ2UuDQo+Pj4+DQo+
Pj4+IFRoZSBJTy1BUElDIGhhcyBhbHdheXMgbGl2ZWQgaW4gdGhhdCByZWdpb24gc2luY2UgaXRz
IGludHJvZHVjdGlvbiwgYW5kDQo+Pj4+IHRoZSBsb2NhdGlvbiBpc24ndCBldmVuIGNvbmZpZ3Vy
YWJsZSBvbiBuZXdlciBjaGlwc2V0cyAoSWYgSSd2ZSByZWFkIHRoZQ0KPj4+PiBTQUQgcm91dGlu
ZyBydWxlcyBpbiBTa3lsYWtlIGNvcnJlY3RseS7CoCBBbGwgdGhhdCBjYW4gYmUgY29uZmlndXJl
ZCBpcw0KPj4+PiBtdWx0aXBsZSBJTy1BUElDcyBiZWluZyBtYXBwZWQgYWRqYWNlbnQgdG8gZWFj
aCBvdGhlci4pDQo+Pj4NCj4+PiBJJ20gcHJldHR5IHN1cmUgSSd2ZSBzZWVuIElPLUFQSUNzIG91
dHNpZGUgdGhhdCByYW5nZS4NCj4+DQo+PiAgIEZyb20gbXkgQU1EIEZhbTE1IHN5c3RlbToNCj4+
DQo+PiA8Nz5BQ1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMA0KPj4gPDY+SU9BUElD
WzBdOiBhcGljX2lkIDAsIHZlcnNpb24gMzMsIGFkZHJlc3MgMHhmZWMwMDAwMCwgR1NJIDAtMjMN
Cj4+IDw2PklPQVBJQ1sxXTogYXBpY19pZCAxLCB2ZXJzaW9uIDMzLCBhZGRyZXNzIDB4YzgwMDAw
MDAsIEdTSSAyNC01NQ0KPiANCj4gSG0sIEkgZ3Vlc3MgdGhlIG9ubHkgb3B0aW9uIGlzIHRvIHRo
ZW4gYmxhY2tsaXN0IHRoZSBwcm9wb3NlZCByYW5nZQ0KPiBwbHVzIGFueSBvZiB0aGUgcGFnZXMg
b2YgdGhlIGlvLWFwaWNzIG9uIHRoZSBzeXN0ZW0uIEkgY2FuIHNlbmQgYSBuZXcNCj4gdmVyc2lv
biB3aXRob3V0IGRyb3BwaW5nIHRoZSBjdXJyZW50IGlvLWFwaWMgYmxhY2tsaXN0aW5nLCBidXQg
dGhlbg0KPiBJJ20gbm90IHN1cmUgdGhlcmUncyBtdWNoIHZhbHVlIGluIGFkZGluZyB0aGUgRkVD
MF8wMDAwaOKAk0ZFQ0ZfRkZGRmgNCj4gcmFuZ2UuDQoNCk5laXRoZXIgYW0gSSwgaGVuY2UgbXkg
aW5pdGlhbCByZWFjdGlvbi4gSSdtIHN1cnByaXNlZCB5b3UgZG9uJ3Qgc2VlDQptdWNoIHZhbHVl
IGluIHRoZXJlIGFueW1vcmUgLSBhZnRlciBhbGwgaXQncyBxdWl0ZSBhIGJpdCBsYXJnZXIgYW4N
CmFyZWEgdGhhdCBnZXRzIGd1YXJkZWQgYWdhaW5zdCBnZXR0aW5nIHBvcHVsYXRlZCwgYXMgd2Un
cmUgdW5saWtlbHkNCnRvIHNlZSBtYW55IHN5c3RlbXMgd2l0aCB0aGlzIHNwYWNlIGZ1bGx5IChv
ciBldmVuIGp1c3QgbW9zdGx5KSB1c2VkDQpieSBtYW55LCBtYW55IElPLUFQSUNzLiBBcyBzYWlk
LCBJJ2QgYmUgZmluZSBhY2tpbmcgdGhlIHBhdGNoIHdpdGgNCnRoZSBsb29wIGxlZnQgaW4gcGxh
Y2UsIGFuZCB3aXRoIHRoZSBkZXNjcmlwdGlvbiByZWZpbmVkLg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
