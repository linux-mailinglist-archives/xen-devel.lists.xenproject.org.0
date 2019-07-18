Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163756CC4A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:49:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2yb-0007ta-T9; Thu, 18 Jul 2019 09:45:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho2ya-0007tV-SD
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:45:24 +0000
X-Inumbo-ID: c2a5367e-a940-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2a5367e-a940-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 09:45:23 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 09:45:21 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 09:44:39 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 09:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbTeirvFQIw3fR0ER6HxQlCdWIHvBAyCUafQ12uk0px4ons1R45ECaLe/7XpX+m8Zlbc56589dNBgQRi4WiPM6FoZgqSQGxzbAxYuxBsDA01lCdimqPhv8fZDjA4J8DkwuFjSQhaqdlaQSvwMV7D82RfQjb96SAWpoNUxlDFNJRVaOC8fwDVjE/YHqsLcuxtPGyw8XSSeg3CWCnOj0yYtXWxWbyogfagFF6lRwpWksLuO57O+0T4pIxz0CTt4hapRE4/+TfgbG5XDt5BMhh6D0OlBM9N+r8ayEYY7BJYfpJ6GWBUQRFRtNBtY8hCPFBXCjEmoZ0sopRbPy8s5TwLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSXj0y82A/SDvEMxObhhXwLJsHteODUzinN4KXh1D+I=;
 b=kDHzTKmYIAftwSjrFFAH9DxROvMbQxa9bpJivmNMJLVisCMoDgAA8sziq2exEFGoOfjnj4xI353Tbc9Rx8JQur1wtZAjse7kH5DLy/XLD+eM61QgRnnOaol/yPoyl15u0S6m6mHo+YDp+UzuYLSiD861nMO2G46dlGIcVwpBd/TLI8E0axn0Z4R+IwNwiaEzQ2BGtZ4STetC8msiPc1O9aVVlqDIvTZ5EdMy22j2fCiQVl1oh8uVg9rGJIGgICynST3zwbfrCp/zwCQqh0NjVlk+MBsyXaIx0NkVstkiuyhbY7yvZrjhXHdn+R/U3xGV8wOkyAWtnzrYiq0xlO0xsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3035.namprd18.prod.outlook.com (20.179.107.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 09:44:37 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 09:44:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH RFC] x86emul: unconditionally deliver #UD for LWP insns
Thread-Index: AQHVPGrBPWLzciEO+UWYWtF8DkKtbabOsLCmgAAXhYCAAEPuFoABMBuA///h3y2AAAPdAA==
Date: Thu, 18 Jul 2019 09:44:37 +0000
Message-ID: <69caf94f-6d18-465f-bf7d-2eefabcdf1ff@suse.com>
References: <d7b10cdc-b33a-0297-458d-1bad42727fa0@suse.com>
 <18e7f37f-826e-0671-9d2c-1a33b1d1d6f3@citrix.com>
 <798637b0-2b1c-9ca0-43af-408868072eaf@suse.com>
 <20c99768-6677-c322-8a4c-cdcaefff8f02@citrix.com>
 <e5fe058b-cdba-bc41-0241-f038785a93e7@suse.com>
 <51b8414f-f8ee-7eae-bf47-84267520dd9e@citrix.com>
In-Reply-To: <51b8414f-f8ee-7eae-bf47-84267520dd9e@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0046.eurprd03.prod.outlook.com
 (2603:10a6:5:2a::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d5b0768-9650-412b-af47-08d70b648c3f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3035; 
x-ms-traffictypediagnostic: DM6PR18MB3035:
x-microsoft-antispam-prvs: <DM6PR18MB30351116BC60ACA943532EE9B3C80@DM6PR18MB3035.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(199004)(189003)(14454004)(186003)(25786009)(6246003)(66066001)(54906003)(26005)(31686004)(64756008)(229853002)(66446008)(66556008)(6116002)(8936002)(99286004)(81156014)(52116002)(5660300002)(102836004)(7736002)(53936002)(36756003)(80792005)(3846002)(68736007)(305945005)(81166006)(66946007)(478600001)(71200400001)(71190400001)(4326008)(386003)(486006)(316002)(53546011)(6506007)(11346002)(446003)(476003)(6486002)(31696002)(2616005)(256004)(86362001)(6436002)(2906002)(76176011)(6916009)(8676002)(6512007)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3035;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TCN9She942sytjHFCDWCMemfPVSdFXkKr+TWtJFt9gTSaKwXsdGBJdxcp8MTb2nqBNQezKMKyFTv55lKBDru+xgqGlwYieQFiiE1GdEkuXfJLp9KG13lp6yeit8JyMud/x1142QjxiQ3OLsc8tjKwzY4QjV1Az9djI/RCTIbIqccbBvIdqn3WOUFOK6ZZkZsbB77mMyn8toIm1wdFUO3AXZ9TzpTVuAB59Qksp+ASaae/pm/BsInDMM/9P2OFLCWrNCHT4x6OEkvmuUWLPOia/RFQ1O+dyV7TpBrzHWBdaJLsEnDFkOAamJv/XSa6Zvxj47BkUUqWlixNf0pG6+Duh1iW75LzFMPo50UXsjMixIYsBWR2he8OFHx3XuK5Hj3xplP6YjGY6H7C5SQEL8JEQGMLwg6GQf3JO0juYiHse4=
Content-ID: <152C536CC9C7844695CBF82C834DB4DA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5b0768-9650-412b-af47-08d70b648c3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:44:37.5442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3035
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

T24gMTguMDcuMjAxOSAxMTozMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTgvMDcvMjAx
OSAxMDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNy4wNy4yMDE5IDE5OjA5LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE3LzA3LzIwMTkgMTQ6MDcsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAxNy4wNy4yMDE5IDEzOjQyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gT24gMTcvMDcvMjAxOSAwNzo0MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gV2l0aCBB
TUQgYXBwYXJlbnRseSBoYXZpbmcgYWJhbmRvbmVkIFhPUCBlbmNvZGVkIGluc25zLCBhbm90aGVy
IG9wdGlvbg0KPj4+Pj4+IHdvdWxkIHNlZW0gdG8gYmUgdG8gc2ltcGx5IHdpcmUgYWxsIHVucmVj
b2duaXplZCBvbmVzIGludG8gI1VEIChyYXRoZXINCj4+Pj4+PiB0aGVuIHJldHVybmluZyBVTklN
UExFTUVOVEVEL1VOUkVDT0dOSVpFRCkuDQo+Pj4+PiBUaGVyZSBhcmUgc3RpbGwgc29tZSBYT1Ag
aW5zdHJ1Y3Rpb25zIHdoaWNoIGFjdHVhbGx5IHdvcmsgb24gRmFtMTdoDQo+Pj4+PiBwcm9jZXNz
b3JzLCBpZiB5b3UgaWdub3JlIENQVUlEIGFuZCBnbyBibGluZGx5IGV4ZWN1dGluZy4NCj4+Pj4+
DQo+Pj4+PiBHaXZlbiBubyBvZmZpY2lhbCBzdGF0ZW1lbnQgdGhhdCBYT1AgaXMgZGVhZCwgSSdk
IGtlZXAgdGhlIHN1cHBvcnQgd2UNCj4+Pj4+IGN1cnJlbnRseSBoYXZlLg0KPj4+PiBUaGVuIG15
IHJlbWFyayB3YXNuJ3QgY2xlYXIgZW5vdWdoOiBJJ20gbm90IHN1Z2dlc3RpbmcgdG8gcmlwIG91
dA0KPj4+PiBYT1AgaW5zbiBzdXBwb3J0IHdlIGhhdmUuIEknbSBpbnN0ZWFkIGNvbnNpZGVyaW5n
IHdoZXRoZXIgdG8gd2lyZQ0KPj4+PiBhbGwgdW5zdXBwb3J0ZWQgWE9QIGVuY29kaW5ncyBpbnRv
ICNVRCAocmF0aGVyIHRoYW4gcmV0dXJuDQo+Pj4+IFVOSU1QTEVNRU5URUQvVU5SRUNPR05JWkVE
IGZvciB0aGVtKSwgbm90IGp1c3QgdGhlIExXUCBvbmVzLg0KPj4+IEFoLCBpbiB3aGljaCBjYXNl
LCBuby7CoCBUdXJuaW5nIGFsbCB1bmtub3duIGluc3RydWN0aW9ucyBpbnRvDQo+Pj4gRVhDRVBU
SU9OLyNVRCB3aWxsIGJyZWFrIGludHJvc3BlY3Rpb24sIHdoaWNoIHVzZXMgVU5SRUNPR05JU0VE
IHRvIGNvdmVyDQo+Pj4gdGhlIGdhcHMgaW4gdGhlIGVtdWxhdG9yIGJ5IHNpbmdsZS1zdGVwcGlu
ZyB0aGUgdmNwdS4NCj4+IEJ1dCB0aGVyZSBhcmUgbm8gZ2FwczoNCj4gDQo+IFtGXVhTQVZFIGV0
IGFsLCBWVC14LCBTVk0gdG8gbmFtZSBzZXZlcmFsIGdhcHMuDQo+IA0KPiBOb3QgdG8gbWVudGlv
biBydW5uaW5nIGN1cnJlbnQgdmVyc2lvbnMgb2YgWGVuIG9uIG5ld2VyIGhhcmR3YXJlLg0KDQpO
b25lIG9mIHRoZXNlIGFyZSBYT1AgZW5jb2RlZC4gSSd2ZSBuZXZlciBiZWVuIGNvbnNpZGVyaW5n
IHRvIHdpcmUNCmV2ZXJ5dGhpbmcgaW50byAjVUQuDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
