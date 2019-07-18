Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027B6CBCC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:23:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2ZR-0005Q6-4V; Thu, 18 Jul 2019 09:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho2ZP-0005Q0-JT
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:19:23 +0000
X-Inumbo-ID: 1f0be316-a93d-11e9-b852-8fb43a44fe23
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f0be316-a93d-11e9-b852-8fb43a44fe23;
 Thu, 18 Jul 2019 09:19:19 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 09:19:18 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 09:18:43 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 09:18:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAmY2Cyd6WWbZM9fKuj79U9L9v/Ef7Gd+zCp7IJP5JDZNqy7loCqU7l6LccBHFNOvSjzqgl/EJbQMGoLYbd4HMImhQhMEXJ3Sexo80A/WOLv4NtFxGmX/6xXkOs40jUCsSa+0icKGtVbqJSMtFEX6Ao2SYJB8TJtqOp0kbS5kwO6PuxqVouAZGiqP+11esVlb3EbQjf3SJGAjz9RXt532ODkbqCCT7cWjierLnP24i9zRoOZg3O3XUBf53uWnGci7AjvNmL5j1I7Q/6JNApMB0tWaaP7vUn60/cwrD8picxj1srfVZux1CwsWOgR4RvGSnL5JkRqg1f1CGVDC4Ft6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLRyAB8ZiMFmtZUqy5KjrKGhl53zqB/C0Qnex8YiPo4=;
 b=g51BoxY8lQLCfuWb3Ms8avhPg5FxSIOE6KzMXYtDVfzPiRchvIUmWkpfa5wBNO4Q4RATUS5xQ/kCVYvIkSoxuZMNyxuW6NpE+Jc8GgS1puzTTdsRjgYMtgp26KVTJz1egxYM5CIplypphw9ElFDDf0fQ3Ye6NdzHKYNfRZ3Bl5EUmuUguDVJc468x2MAy4dAWCc+bpX3QE0wKDgKrEIS5ga4vA6d4CuFsGfdrg97u3tyxdhHQ5VTtoKDbj78b+ZLcXS4VrlJre9UFi34Tutme9xfjhJR5j0n+FlxKft0I+XnHAFGKa5DKeH7Ueu6tpvsHfznimj+H2Dp5O+yz0i26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2714.namprd18.prod.outlook.com (20.179.51.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 09:18:41 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 09:18:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH RFC] x86emul: unconditionally deliver #UD for LWP insns
Thread-Index: AQHVPGrBPWLzciEO+UWYWtF8DkKtbabOsLCmgAAXhYCAAEPuFoABDpSA
Date: Thu, 18 Jul 2019 09:18:41 +0000
Message-ID: <e5fe058b-cdba-bc41-0241-f038785a93e7@suse.com>
References: <d7b10cdc-b33a-0297-458d-1bad42727fa0@suse.com>
 <18e7f37f-826e-0671-9d2c-1a33b1d1d6f3@citrix.com>
 <798637b0-2b1c-9ca0-43af-408868072eaf@suse.com>
 <20c99768-6677-c322-8a4c-cdcaefff8f02@citrix.com>
In-Reply-To: <20c99768-6677-c322-8a4c-cdcaefff8f02@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:6::25)
 To DM6PR18MB3401.namprd18.prod.outlook.com (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c3fd7b9-a9fd-4af8-329d-08d70b60ecdf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2714; 
x-ms-traffictypediagnostic: DM6PR18MB2714:
x-microsoft-antispam-prvs: <DM6PR18MB2714DD99063C17C5094C62B7B3C80@DM6PR18MB2714.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(80792005)(7736002)(99286004)(66066001)(68736007)(305945005)(8936002)(316002)(52116002)(2616005)(186003)(446003)(476003)(26005)(11346002)(102836004)(64756008)(14454004)(66556008)(6512007)(8676002)(81156014)(53936002)(386003)(54906003)(66946007)(66446008)(81166006)(2906002)(3846002)(6116002)(66476007)(36756003)(31696002)(25786009)(6486002)(478600001)(256004)(6916009)(86362001)(6436002)(71190400001)(229853002)(486006)(76176011)(71200400001)(5660300002)(53546011)(6506007)(31686004)(6246003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2714;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GymY4ez1G9zlgwRB4zMsBFx5071JEyBPUas5W1HNhR4x/xZ7h65e2Nby5Owc/AGFMF3AdKdDO/zG/kGj3HoF5Cs3UOYZ1zCcyeAspcWW/ZzVSHgCadC0eqpKT0xzRB26zwxhzUqKwNaQ2B9beqR7qrNkP1+xiU2cTwYRk1gOJBWUKKz4zcmD0Um+pTtIsL4kWbKLr3kKA6NEgyI2qOuDgeZL7v/GrxvoRVIZoh/iPp7l6mRYfYyVnuWyCd8uwTLQ+ytqABRj3aQJJ0B+EUYqsP68+E7b5DTfveZfUsKdsYU5rgnfyPQxhI6OFVMSTW/r1qwUcd1Pmfv86hocTNuTCVn9UZD9qYe9fKIKlr5xg8XFNjXiv5HTC9eObXq6r0svckFbQ1SchgV5sARdICuaVpGdU/pKm9TsBzvooueLnnk=
Content-ID: <01D4C32ADC1B3B42A5403648890F3289@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3fd7b9-a9fd-4af8-329d-08d70b60ecdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:18:41.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2714
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH RFC] x86emul: unconditionally deliver #UD
 for LWP insns
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxOTowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDcvMjAx
OSAxNDowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNy4wNy4yMDE5IDEzOjQyLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE3LzA3LzIwMTkgMDc6NDIsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBXaXRoIEFNRCBhcHBhcmVudGx5IGhhdmluZyBhYmFuZG9uZWQgWE9QIGVuY29k
ZWQgaW5zbnMsIGFub3RoZXIgb3B0aW9uDQo+Pj4+IHdvdWxkIHNlZW0gdG8gYmUgdG8gc2ltcGx5
IHdpcmUgYWxsIHVucmVjb2duaXplZCBvbmVzIGludG8gI1VEIChyYXRoZXINCj4+Pj4gdGhlbiBy
ZXR1cm5pbmcgVU5JTVBMRU1FTlRFRC9VTlJFQ09HTklaRUQpLg0KPj4+IFRoZXJlIGFyZSBzdGls
bCBzb21lIFhPUCBpbnN0cnVjdGlvbnMgd2hpY2ggYWN0dWFsbHkgd29yayBvbiBGYW0xN2gNCj4+
PiBwcm9jZXNzb3JzLCBpZiB5b3UgaWdub3JlIENQVUlEIGFuZCBnbyBibGluZGx5IGV4ZWN1dGlu
Zy4NCj4+Pg0KPj4+IEdpdmVuIG5vIG9mZmljaWFsIHN0YXRlbWVudCB0aGF0IFhPUCBpcyBkZWFk
LCBJJ2Qga2VlcCB0aGUgc3VwcG9ydCB3ZQ0KPj4+IGN1cnJlbnRseSBoYXZlLg0KPj4gVGhlbiBt
eSByZW1hcmsgd2Fzbid0IGNsZWFyIGVub3VnaDogSSdtIG5vdCBzdWdnZXN0aW5nIHRvIHJpcCBv
dXQNCj4+IFhPUCBpbnNuIHN1cHBvcnQgd2UgaGF2ZS4gSSdtIGluc3RlYWQgY29uc2lkZXJpbmcg
d2hldGhlciB0byB3aXJlDQo+PiBhbGwgdW5zdXBwb3J0ZWQgWE9QIGVuY29kaW5ncyBpbnRvICNV
RCAocmF0aGVyIHRoYW4gcmV0dXJuDQo+PiBVTklNUExFTUVOVEVEL1VOUkVDT0dOSVpFRCBmb3Ig
dGhlbSksIG5vdCBqdXN0IHRoZSBMV1Agb25lcy4NCj4gDQo+IEFoLCBpbiB3aGljaCBjYXNlLCBu
by7CoCBUdXJuaW5nIGFsbCB1bmtub3duIGluc3RydWN0aW9ucyBpbnRvDQo+IEVYQ0VQVElPTi8j
VUQgd2lsbCBicmVhayBpbnRyb3NwZWN0aW9uLCB3aGljaCB1c2VzIFVOUkVDT0dOSVNFRCB0byBj
b3Zlcg0KPiB0aGUgZ2FwcyBpbiB0aGUgZW11bGF0b3IgYnkgc2luZ2xlLXN0ZXBwaW5nIHRoZSB2
Y3B1Lg0KDQpCdXQgdGhlcmUgYXJlIG5vIGdhcHM6IFRoZSBvbmx5IG9uZXMgd2UgZGlkbid0IGNv
dmVyIChhZmFpaykgd2VyZSB0aGUNCkxXUCBvbmVzLCBhbmQgdGhvc2Ugd291bGQgZ2V0IG1hZGUg
cmFpc2UgI1VEIGJ5IHRoZSBwYXRjaCBoZXJlIGFueXdheS4NCklmIHRoZXJlIGFyZSByZWFsbHkg
b3Bjb2RlcyB3aGVyZSAidW5yZWNvZ25pemVkIiBpcyByZWxldmFudCwgdGhlbiB3ZQ0Kc2hvdWxk
IHNwZWNpYWwgY2FzZSBfdGhvc2VfIGltbywgcmF0aGVyIHRoYW4gbGVhdmluZyBhbiBvcGNvZGUg
c3BhY2UNCndoaWNoIGFwcGFyZW50bHkgd29uJ3Qgc2VlIGZ1cnRoZXIgZXh0ZW5zaW9ucyBhbGwg
Z28gdGhlICJ1bnJlY29nbml6ZWQiDQpyb3V0ZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
