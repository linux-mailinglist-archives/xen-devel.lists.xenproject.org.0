Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD347BD8A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 11:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsl4r-0001SJ-4h; Wed, 31 Jul 2019 09:39:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsl4p-0001SD-7v
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 09:39:19 +0000
X-Inumbo-ID: 0acd6537-b377-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0acd6537-b377-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 09:39:18 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 09:39:11 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 09:28:43 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 09:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq+u6l+dDHL2vlc2MUNGdTWm3Uw2AbUe/O3Ildz+LOuUlEg4AphplKFGH8B8iPupnjKRN5v47d5mU4OhGFi+NlR7Ricsbjmd50COz9vdULgE6woupyeeL+74W+JYdADZhOHZbHWZxvPkWNilz09CptVa4AVARXG+WpPN08P1oZ9MZyWde0ypps5EBePwq75sIcFP2IfbY1szJoEf5Te2gxvkrEm7tgXzXSG/2mmwn6zwAEOQD9I/Nf8Mys86yP1KIrweBRqsWVEYz2XlGsRIrzRDa0TX3y4C7KV/i8J4K/7LC6iPXlJ50Nub2ig0nCLIFrUhzSIfKjfTNutVVFb/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm6jFnZJCLNqApkJk9iDRRigDbKhmJYO24031aTQg/8=;
 b=nDGv8+Jzuk+FE+GQebk7XscCiZY3q2nZKVRYE2LdRfm7NQoxPsEl1czqbF/UFXXDiMWdLguGPVsrmkVMBh+xQBfytRRZZaMttwGne+XtjH/D+e4/pVKRCsu5IDGb63KW/P7KRWMGoYO0uM+XWjrrd3QmJ2roi/9TFHJRuK+384nKEE48uZ1QsiVL0k7n0jAXe0DuzQgZvB9Xo5ml3MdSZsrfntwXs/CHQHsJlDMJGuh9zBnEGXu5pVdvbQBqfeyNJYIC8Yu0w/9DB041LypM4eevx6UuRTJpQGq0a1nCM6ew3g8r8l8cQ7rIX8dOXVCgw9nj48auo7mJk7Nj7lcSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3417.namprd18.prod.outlook.com (10.255.175.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Wed, 31 Jul 2019 09:28:42 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 09:28:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
Thread-Index: AQHVRjSGjfvYvY8Mj0+dnjT7dlU+s6bi2QqAgAAPEuOAAAOnAIAAclQ3gAEaKgA=
Date: Wed, 31 Jul 2019 09:28:42 +0000
Message-ID: <decb59fa-7f39-0606-eb7a-e21a04819eba@suse.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
 <20190729173843.21586-2-andrew.cooper3@citrix.com>
 <446e9293-2689-39cb-9086-19abd6702431@suse.com>
 <fb4f5507-11aa-d197-c759-a84d84c7779d@citrix.com>
 <7061f1db-aa45-d016-8645-1f733f753944@suse.com>
 <5cc90018-6795-1a90-05a1-de1911aed8ce@citrix.com>
In-Reply-To: <5cc90018-6795-1a90-05a1-de1911aed8ce@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:45::35) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d67aa83-5a15-4b2c-2ed9-08d715997a89
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3417; 
x-ms-traffictypediagnostic: DM6PR18MB3417:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB34177DC934893886A4DD1278B3DF0@DM6PR18MB3417.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(7736002)(14454004)(66066001)(99286004)(229853002)(305945005)(81156014)(53936002)(66446008)(81166006)(966005)(478600001)(54906003)(316002)(8936002)(6306002)(26005)(186003)(386003)(6506007)(66476007)(6486002)(6512007)(52116002)(66946007)(6436002)(8676002)(66556008)(76176011)(64756008)(5660300002)(3846002)(36756003)(6916009)(2616005)(71190400001)(14444005)(53546011)(102836004)(256004)(476003)(11346002)(486006)(6246003)(71200400001)(25786009)(68736007)(86362001)(31696002)(6116002)(31686004)(446003)(2906002)(4326008)(80792005)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3417;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SfL7cXAn8TqJ7RPOhygQTWmTECrCBsBKqUIZBiMa6MFmAasIO8EfeVVw7i2O+5UkPQcowI5zUMwd8a7bKnG3SRyiyo6SsvnWyKWzlXUNkAzgQ2RGpp0QZgXDnplJ7wyou79tpUUgfJ/Ff/VB7oABcZuigalQEEir1yjwivukQ3rxVuBZdg2gfNJPWvqZoCL/BZz5mK6sZLAVlEE59M3OhgITSbRotKwzs9iO61I5uSekbYBsV/w9ZbpmM7BDPVuCMXdcfkg1SJMw1U7DY2tLUtAkpd6ameOqq6jc0hn+dUOZWmbLFP4w9yTSMYuBhH8Y5UUsfXEQSSR7NHUTdwsLDgHSBmBazwFF0Cx9rTFPU3ESrLXyWCAHTJQR/k9ebjeSNJEqOMUbosEuVNwGYCMzOPjxYYEtLsmGVz42xkizn68=
Content-ID: <9A564468551D7149AF8034AFDCE50BBF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d67aa83-5a15-4b2c-2ed9-08d715997a89
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 09:28:42.7773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3417
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

T24gMzAuMDcuMjAxOSAxODozNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzAvMDcvMjAx
OSAxMDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAzMC4wNy4yMDE5IDExOjM1LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDMwLzA3LzIwMTkgMDk6NDIsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAyOS4wNy4yMDE5IDE5OjM4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2
L3hlbi5sZHMuUw0KPj4+Pj4gQEAgLTI5MywxNCArMjkzLDE3IEBAIFNFQ1RJT05TDQo+Pj4+PiAg
ICAgICAgICAgX19ic3Nfc3RhcnQgPSAuOw0KPj4+Pj4gICAgICAgICAgICooLmJzcy5zdGFja19h
bGlnbmVkKQ0KPj4+Pj4gICAgICAgICAgICooLmJzcy5wYWdlX2FsaWduZWQqKQ0KPj4+Pj4gLSAg
ICAgICAqKC5ic3MpDQo+Pj4+PiAtICAgICAgIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMpOw0K
Pj4+Pj4gKyAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4+Pj4+ICAgICAgICAgICBfX3Bl
cl9jcHVfc3RhcnQgPSAuOw0KPj4+Pj4gKyAgICAgICAqKC5ic3MucGVyY3B1LnBhZ2VfYWxpZ25l
ZCkNCj4+Pj4+ICsgICAgICAgLiA9IEFMSUdOKFBBR0VfU0laRSk7DQo+Pj4+IEJ1dCB0aGlzIGdv
ZXMgdG9vIGZhcjogV2hhdCB3ZSB3YW50IGlzIGZvciB0aGUgVFNTIHRvIG9jY3VweSBhIGZ1bGwN
Cj4+Pj4gcGFnZSwgbm90IGZvciB3aGF0ZXZlciByYW5kb20gb3RoZXIgcGFnZS1hbGlnbmVkIG9i
amVjdCBlbmRzIHVwDQo+Pj4+IGxhc3QgaGVyZSAoc2hvdWxkIGFueSBldmVyeSBhcHBlYXIpLg0K
Pj4+IENvbWUgYWdhaW4/wqAgVGhpcyBpcyByaWRpY3Vsb3VzLg0KPj4+DQo+Pj4gT2JqZWN0cyBp
biBhIHNlY3Rpb24gZm9sbG93aW5nIGZvby5wYWdlX2FsaWduZWQgc2hvdWxkIG5ldmVyIGVuZCB1
cCBpbg0KPj4+IHRoZSB0YWlsIG9mIHRoZSBmaW5hbCBwYWdlIG9mIGZvby5wYWdlX2FsaWduZWQs
IGJlY2F1c2UgdGhlbiB0aGV5IGFyZSBpbg0KPj4+IHRoZSB3cm9uZyBzZWN0aW9uLg0KPj4gSG93
IGRvIHlvdSBkZXJpdmUgIndyb25nIHNlY3Rpb24iPyBTZWN0aW9ucyBoYXZlIGFuIGFsaWdubWVu
dCBhbmQgYQ0KPj4gc2l6ZS4gVGhlIGxhdHRlciBkb2Vzbid0IG5lZWQgdG8gYmUgYSBtdWx0aXBs
ZSBvZiB0aGUgZm9ybWVyLiBUaGUNCj4+IHNlY3Rpb24gZW5kcyB3aGVyZXZlciBpdHMgc2l6ZSBz
YXlzIGl0IGVuZHMuIFVzaW5nIHRoaXMgcHJvcGVydHkgaXMNCj4+IGFjdHVhbGx5IGRlc2lyYWJs
ZSBpbiBvdGhlciBjYXNlcywgdG8gbGltaXQgd2FzdGUgb2Ygc3BhY2UuDQo+IA0KPiBUaGUgcHJp
bmNpcGxlIG9mIGxlYXN0IHN1cnByaXNlLCBmb3IgYSBzZWN0aW9uIHdpdGggcGFnZV9hbGlnbmVk
IGluIGl0cw0KPiBuYW1lLCBpcyB0aGF0IHRoZSBzZWN0aW9uIHN0YXJ0cyBhbmQgZW5kcyBvbiBh
IHBhZ2UgYm91bmRhcnkuwqAgVGhpcyBpcw0KPiB3aGF0IHBlb3BsZSBleHBlY3Qgd2hlbiB0aGV5
IHNlZSBhIG5hbWUgbGlrZSB0aGF0Lg0KDQpIbW0sIHdoZW4gSSBzZWUgImFsaWduZWQiIEkgdGhp
bmsgImFsaWduZWQiLCBhbmQgbm90aGluZyBlbHNlLiBXaGF0J3MNCm1vcmUgb2RkIC0geW91ciBy
ZXNwb25zZSBoZXJlIGlzIGluY29uc2lzdGVudCB3aXRoIHlvdXIgZWFybGllciBvbmUgaW4NCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0w
Ny9tc2cwMjA4NC5odG1sDQpUaGVyZSB5b3UgZGlkIGFwcGVhciB0byBhZ3JlZSB0aGF0IC5ic3Mu
cGFnZV9hbGlnbmVkIG1heSBlbmQgd2l0aCBhbg0Kb2JqZWN0IHRoZSBzaXplIG9mIHdoaWNoIGlz
IG5vdCBhIG11bHRpcGxlIG9mIFBBR0VfU0laRS4gRnVydGhlcm1vcmUNCnlvdSBldmVuIG1ha2Ug
cHJvdmlzaW9ucyBmb3IgdGhpcyB0byBoYXBwZW4gcmlnaHQgaW4gdGhlIHBhdGNoDQpkZXNjcmlw
dGlvbiBoZXJlLg0KDQooQXMgYW4gYXNpZGUsIHlvdSBhbHNvIGRvbid0IHNlZW0gdG8gaGF2ZSBh
bnkgcHJvYmxlbXMgd2l0aCAudGV4dC5rZXhlYw0KYmVpbmcgcGFnZSBhbGlnbmVkIGJ1dCBub3Qg
YSBtdWx0aXBsZSBvZiBQQUdFX1NJWkUgaW4gc2l6ZS4gR3JhbnRlZCB0aGlzDQpzZWN0aW9uIGRv
ZXNuJ3QgY2FycnkgInBhZ2VfYWxpZ25lZCIgaW4gaXRzIG5hbWUuKQ0KDQo+Pj4gQSBzaG9ydCBU
U1MgaXMgYSBwYWluIHRvIGRlYWwgd2l0aCwgYnV0IGV2ZW4geW91IHNhaWQgeW91IGRpZG4ndCBs
aWtlDQo+Pj4gdGhlIHhlbl90c3MgaWRlYSB3aGVuIHlvdSBzdWdnZXN0ZWQgaXQuDQo+Pj4NCj4+
PiBUaGUgbmFtZSBvZiB0aGUgc2VjdGlvbiBpcyB2ZXJ5IGRlbGliZXJhdGVseSBub3QgVFNTIHNw
ZWNpZmljLCBiZWNhdXNlDQo+Pj4gdGhlcmUgaXMgcGxlbnR5IG9mIG90aGVyIGNsZWFudXAgd2hp
Y2ggd2lsbCBlbmQgdXAgd2l0aCBvYmplY3RzIGluIHRoaXMNCj4+PiBzZWN0aW9uLg0KPj4gV2Vs
bCwgaWYgdGhleSdyZSBhbGwgc3RyaWN0bHkgYSBtdWx0aXBsZSBvZiBQQUdFX1NJWkUsIHRoZW4g
d3JpdGluZw0KPj4gZG93biBhIHJlc3BlY3RpdmUgcmVxdWlyZW1lbnQgbWlnaHQgYmUgYWNjZXB0
YWJsZS4gQnV0IGV2ZW4gdGhlbiBJbm90IHN1Ym1pdHRlZCBieSBtZS4NCj4+IHdvdWxkbid0IGJl
IG92ZXJseSBoYXBweSBnb2luZyB0aGF0IHJvdXRlLg0KPiANCj4gVGhpcyByZXBseSwgbGlrZSBt
b3N0IG90aGVycyBpbiB0aGlzIHRocmVhZCwgaXMgYWN0aXZlbHkgdW5oZWxwZnVsLCBhbmQNCj4g
SSBnaXZlIHVwLg0KPiANCj4gSSBjYW4ndCByZWFkIHlvdXIgbWluZC7CoCBOZWl0aGVyIGNhbiBh
bnlvbmUgZWxzZSwgYW5kIG5vb25lIGhhcyB0aGUgdGltZQ0KPiB0byBkaXZpbmUgd2hhdCB5b3Ug
d2FudC4NCj4gDQo+IElmIHlvdSBkb24ndCBjb21lIHVwIHdpdGggc29tZXRoaW5nIG1vcmUgaGVs
cGZ1bCB0aGFuICJJIGRvbid0IGxpa2UgaXQNCj4gdGhpcyB3YXkiLCB0aGVuIEknbSBnb2luZyB0
byBjb21taXQgdGhpcyBzZXJpZXMgaW4gaXRzIGN1cnJlbnQgZm9ybSwgYW5kDQo+IHlvdSBjYW4g
YWRqdXN0aW5nIGl0IHRvIHlvdXIgb3duIHRhc3RlLCBpbiB5b3VyIG93biB0aW1lLg0KPiANCj4g
VGhpcyBnb2VzIGZvciBvdGhlciBzZXJpZXMgYXMgd2VsbCwgaW5jbHVkaW5nIG9uZXMgc3VibWl0
dGVkIGJ5IG90aGVycy4NCj4gSXQgaXMgYWJzb2x1dGVseSBjcml0aWNhbCB0aGF0IHJldmlldyBm
ZWVkYmFjayBpZGVudGlmaWVzLCBpbiBhIGNsZWFyDQo+IG1hbm5lciwgaG93IHlvdSBleHBlY3Qg
dGhlIGlzc3VlIHRvIGJlIHJlc29sdmVkLg0KPiANCj4gRm9yIGFueSBub24tdHJpdmlhbCBwaWVj
ZSBvZiBmZWVkYmFjaywgaWYgaXQgY2FuJ3QgYmUgcGhyYXNlZCBpbiB0aGUNCj4gZm9ybSAiSSB3
b3VsZCB0aGlzIHBhdGNoIG9rIGlmIHlvdSBhbHRlciAkWCB0byAkWSIsIHRoZW4gaXQgaXMgcHJv
YmFibHkNCj4gd2FudHMgcmV0aGlua2luZy7CoCBXaGF0ZXZlciB0aGUgZmVlZGJhY2sgYWN0dWFs
bHkgaXMsIHRoYXQgZ2l2ZXMgYQ0KPiBjb25jcmV0ZSAkWCB3aGljaCBpcyB0aGUgcGVyY2VpdmVk
IHByb2JsZW0sIGFuZCBhIGNvbmNyZXRlICRZIHdoaWNoIGlzDQo+IGVpdGhlciBhIGNsZWFyIGRp
c2N1c3Npb24gcG9pbnQsIG9yIGEgY2xlYXIgZGlyZWN0aW9uIHRvIHdvcmsgdG93YXJkcy4NCg0K
SSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIHJhdGhlciBzdXJwcmlzZWQgdG8gZ2V0IF90aGlzXyBh
cyBhIHJlcGx5IGhlcmUsDQp3aGVuIHdlJ3ZlIGFscmVhZHkgc2tldGNoZWQgb3V0IHRoZSBjb3Jy
ZWN0IGFsdGVybmF0aXZlLiBEZXNwaXRlIG1lIG5vdA0KcGFydGljdWxhcmx5IGxpa2luZyBpdCwg
SSBkb24ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aA0KDQp1bmlvbiBfYWxpZ25lZChQQUdFX1NJ
WkUpIHRzc191bmlvbiB7DQogICAgIHN0cnVjdCBfX3BhY2tlZCB0c3Nfc3RydWN0IHsNCiAgICAg
ICAgIHVpbnQzMl90IDozMjsNCiAgICAgICAgIHVpbnQ2NF90IHJzcDAsIHJzcDEsIHJzcDI7DQog
ICAgICAgICB1aW50NjRfdCA6NjQ7DQogICAgICAgICAvKg0KICAgICAgICAgICogSW50ZXJydXB0
IFN0YWNrIFRhYmxlIGlzIDEtYmFzZWQgc28gdHNzLT5pc3RbMF0gY29ycmVzcG9uZHMgdG8gYW4g
SVNUDQogICAgICAgICAgKiB2YWx1ZSBvZiAxIGluIGFuIEludGVycnVwdCBEZXNjcmlwdG9yLg0K
ICAgICAgICAgICovDQogICAgICAgICB1aW50NjRfdCBpc3RbN107DQogICAgICAgICB1aW50NjRf
dCA6NjQ7DQogICAgICAgICB1aW50MTZfdCA6MTYsIGJpdG1hcDsNCiAgICAgfTsNCiAgICAgY2hh
ciBwYWRbUEFHRV9TSVpFXTsNCn07DQoNCkFuZCBzaW5jZSBpdCdzIGEgdGVjaG5pY2FsbHkgY29y
cmVjdCBzb2x1dGlvbiAocHJvdmlkaW5nIGJvdGggYSB0eXBlDQpjb3JyZWN0bHkgZGVzY3JpYmlu
ZyB0aGUgaGFyZHdhcmUgaW50ZXJmYWNlIGFuZCBvbmUgY29ycmVjdGx5IGRlc2NyaWJpbmcNCm91
ciBvd24gbmVlZHMpIHdpdGggbm8gYmV0dGVyIGFsdGVybmF0aXZlIGVpdGhlciBvZiB1cyBjYW4g
c2VlLCBJIHRoaW5rDQp0aGlzIChvciB3aGF0ZXZlciB2YXJpYXRpb24gb2YgaXQpIGlzIHRoZSB3
YXkgdG8gZ28uDQoNCkFzIHRvIHRoZSByZXN0IG9mIHlvdXIgcmFudDogSSBkaXNhZ3JlZSB0aGF0
IGEgcmV2aWV3ZXIgaGFzIHRvIGFsd2F5cw0Kc3VnZ2VzdCBob3cgdGhpbmdzIGFyZSB0byBiZSBk
b25lOyB0aGF0J3MgZGVzaXJhYmxlIHdoZXJlIHBvc3NpYmxlLA0KYnV0IHNpbXBseSBwb2ludGlu
ZyBvdXQgc29tZXRoaW5nIGlzIHdyb25nIHdpbGwgaGF2ZSB0byBkbyBpbiBjZXJ0YWluDQpjYXNl
cy4gSW4gdGhlIGNhc2UgaGVyZSwgd2hpY2ggaXMgYSBnb29kIGV4YW1wbGUgaW1vLCB0aGUgcG9p
bnQgb2YgbXkNCnJlc3BvbnNlIGlzIHRoYXQgZnJvbSBzaW1wbHkgbG9va2luZyBhdCB0aGUgcmVz
dWx0aW5nIGNvZGUgaXQgaXMNCnVuY2xlYXIgd2h5IF9laXRoZXJfIG9mIHRoZSB0d28gQUxJR04o
UEFHRV9TSVpFKSBoYXZlIGJlZW4gaW5zZXJ0ZWQuDQpUaGlzIGNhcnJpZXMgdGhlIHJpc2sgb2Yg
bGF0ZXIgc29tZW9uZSBsaWtlIG1lIGNvbWluZyBhbmQgZGVsZXRpbmcNCmV2ZXJ5dGhpbmcgdGhh
dCdzIHRoZXJlIHdpdGhvdXQgYXBwYXJlbnQgcmVhc29uIChzZWUgZS5nLiAwMWZlNGRhNjI0LA0K
YWxiZWl0IGlzdHIgaGF2aW5nIGRvbmUgc29tZXRoaW5nIG1vcmUgZXh0ZW5zaXZlIGF0IHNvbWUg
b3RoZXIgdGltZSwNCmJ1dCBJIGNhbid0IHNlZW0gdG8gYmUgYWJsZSB0byBzcG90IGl0KS4gSWYg
YW55dGhpbmcgaXQgc2hvdWxkIGJlIHlvdQ0KdG8gZXhwbGFpbiB3aHkgdGhleSBuZWVkIHRvIGJl
IHRoZXJlLiBBbmQgd2hpbGUgKGluIGEgd2F5KSB5b3UgZG8gc28NCihpbiB0aGUgZGVzY3JpcHRp
b24sIHRoZSBzYW1lIHBhc3NhZ2UgYXMgcmVmZXJlbmNlZCBhYm92ZSksIHRoZSByZWFzb24NCmlz
bid0IHJlYWxseSBhcyBzaW1wbGUgYXMgInN1Y2ggdGhhdCB0aGUgcmVzdWx0IGlzIHNhZmUgZXZl
biB3aXRoDQpvYmplY3RzIHNob3J0ZXIgdGhhbiBhIHBhZ2UgaW4gbGVuZ3RoIi4gSW5zdGVhZCB0
aGUgcmVhc29ucyBhY3R1YWxseQ0KZGlmZmVyIGZvciBib3RoIEFMSUdOKClzOiBJbiB0aGUgZmly
c3QgY2FzZSB3ZSBzaW1wbHkgd2FudCB0byBhdm9pZA0KX19wZXJfY3B1X3N0YXJ0IGxpdmluZyBu
ZWVkbGVzc2x5IGVhcmx5LiBJbiB0aGUgbGF0dGVyIG9uZSB5b3Ugd2FudCB0bw0KY29tcGVuc2F0
ZSBmb3Igc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGRvbmUgZWxzZXdoZXJlIChzZWUgYWJvdmUp
Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
