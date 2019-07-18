Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0BC6D04F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7gv-0007yU-4q; Thu, 18 Jul 2019 14:47:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho7gt-0007yP-Nb
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:47:27 +0000
X-Inumbo-ID: f20fafae-a96a-11e9-810b-67da4cb8da93
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f20fafae-a96a-11e9-810b-67da4cb8da93;
 Thu, 18 Jul 2019 14:47:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 14:47:20 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 14:47:05 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 14:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fecFBCme1XeaMUDvqfgSVvg6QOnjtJjTQ4qQOlGIZE5l+8CBeAXo6c8N21MTZJgAadaBkrA0kFPEjkTYxlkKx66EyqLu1LK3dGD6R3LFFtou5t+w3jjfCpdBkvkK0fEHupQKKSek8xXtK20vwiOd+fXiMUWn7bWawoJ8gRb0TwybEaZZ8yORONzbkcF2/FmAM0Mz/PWvXub9Ts3DvB5Mho5FQDo+uYxaFW3iQJ6PJDCUNTUc2WoYbSQhg0cnjluCHCjq5hi5jxGnl6gRuQ+XOqMngj+XRWiVWmgZoWwnE3p7rtyJ2Zv4XB81up3vLSI22qpc2fcLJigGPYt3UxPEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxGAyCl4LoV/obkF9cFCgym/ZXmayu0eiXUPjHQydhc=;
 b=g8Ov4X4IoUIFTX5jsT7zJs5wukNeny2FH/ZKQbX/sGI5wfdTwxTElWXmEfJV+xUbZ+z5g+7WOkO0gIutGy93BzUkEKn0KbVPwiPBW3f2pCNmkRFLJq01mouM9GOwYU9LOg4Yp06yi6zijAn4TmAzAJ05B+vBpi1HyJOsQKDyxAxY7FukC64LS1hueG0kN4HFEWsact/RxckU73Vze0WOKYi2wkx3AfpAMcAsyy42badyhQYjtkC+2STprvBLezRayYsCAwDGD6+ptJXFYJfh6ztKqJwDUjP+rPBGktOy8HEfPBV8v4vdZF+4//bSDnU9JScjSDlO+PRxfnu1TPMk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2538.namprd18.prod.outlook.com (20.179.105.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 14:47:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 14:47:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
Thread-Index: AQHVPNaoMN4/6VqHlEm91bwrx18tx6bQMluAgAAkhnuAAARMgIAAAL3BgAAFHgCAAAROh4AACw0AgAACMMeAAAMOAA==
Date: Thu, 18 Jul 2019 14:47:03 +0000
Message-ID: <92678567-f9d1-aea4-52e8-d9e1fb6c12e2@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
 <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
 <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
 <f3fc709b-d959-07f3-c047-a1da24816e09@suse.com>
 <CABfawhkvmiUoRLJaiCU4RwNpCRpcqRthTW9xZ0NLc6CCbS8-uQ@mail.gmail.com>
In-Reply-To: <CABfawhkvmiUoRLJaiCU4RwNpCRpcqRthTW9xZ0NLc6CCbS8-uQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::22)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe0f557d-4736-4120-17bc-08d70b8ecc1e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2538; 
x-ms-traffictypediagnostic: DM6PR18MB2538:
x-microsoft-antispam-prvs: <DM6PR18MB2538B1083B7572B0F4FEB43FB3C80@DM6PR18MB2538.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(189003)(199004)(66556008)(66476007)(66446008)(64756008)(80792005)(81166006)(81156014)(8936002)(31696002)(26005)(446003)(2906002)(186003)(476003)(2616005)(86362001)(66066001)(305945005)(66946007)(71190400001)(6486002)(11346002)(71200400001)(478600001)(99286004)(8676002)(54906003)(316002)(7736002)(5660300002)(68736007)(6246003)(6116002)(3846002)(6436002)(486006)(25786009)(53936002)(229853002)(256004)(102836004)(76176011)(14454004)(6916009)(36756003)(52116002)(53546011)(6506007)(386003)(4326008)(6512007)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2538;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q4ekAzl3kAYSl3zK3pDcfGgVxwx7/pi5BcZ7w7ojXoDjzXhATYe67anuJE1FdLYuetLeZVy2hbD8kODw4Z7vI+z/s8XB4mn20SJnwYObpPNZjLOlZ51SWVqOLVnbqV0KxtA/4CvKSNy9lFJflHdugY5LtH38p1cfaSGf88XQv8hLmRqJGKk3lAY1kF9BSZcDzSmirBRFbJ1WF+eFqqZeAlv8o1YDPm+0eOWftB3ZliCKwFrV4AropGHmvvmQcFtccIFrWnBARxks+ssKVQO8uxprwksXMrzDAAkGXpRiKYDLAWWvDoU7IVf/i9aGwapD07PIDPV/wJgYBMvVe3haB06X9S19kD4+HTML9QLbiMXj8/w8Zm0vXDPnBSzcDclQCJp0eTuNloTVi+A6xMY0yvRBr72up5mkifN5kOutVac=
Content-ID: <BCE2315B8E0A7A4E960B50B470F6D626@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0f557d-4736-4120-17bc-08d70b8ecc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 14:47:03.5679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2538
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNjozNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCA4OjI4IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+PiBPbiAxOC4wNy4yMDE5IDE1OjQ3LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4g
SSBmZWVsIGxpa2Ugd2UgYXJlIGdvaW5nIGluIGNpcmNsZXMgYW5kIGhhdmluZyB0aGUgc2FtZSBj
b252ZXJzYXRpb25zDQo+Pj4gb3ZlciBhbmQgb3ZlciB3aXRob3V0IHJlYWxseSBtYWtpbmcgYW55
IGhlYWR3YXkuIFlvdSBpbnRyb2R1Y2VkDQo+Pj4gZ3JhYmJpbmcgdGhlIGJyb2tlbiBleHRyYSBy
ZWZlcmVuY2UgaW4gMDUwMmUwYWRhZTIuIEl0IGlzIGFuZCB3YXMNCj4+PiBhY3R1YWxseSB1bm5l
ZWRlZCB0byBzdGFydCB3aXRoIGlmIHRoZSBwcm9wZXIgc29sdXRpb24gd2FzIHB1dCBpbg0KPj4+
IHBsYWNlLCB3aGljaCBpcyB3aGF0IHRoaXMgcGF0Y2ggZG9lcywgcmVvcmRlcmluZyB0aGluZ3Mu
DQo+Pg0KPj4gSSdtIG5vdCBjb21wbGFpbmluZyBhYm91dCB0aGUgY2hhbmdlczsgSSdkIG1lcmVs
eSBsaWtlIHRoZSBkZXNjcmlwdGlvbg0KPj4gc3RhdGUgd2h5IHRoZXkncmUgbmVlZGVkLg0KPiAN
Cj4gT0suDQo+IA0KPj4+IEl0J3MgcG9zc2libGUgdGhlcmUgYXJlIG90aGVyIGluc3RhbmNlcyB3
aGVyZSB0aGlzIG1heSBzdGlsbCBiZQ0KPj4+IGJyb2tlbi4gUmlnaHQgbm93IEkgb25seSBoYXZl
IGJhbmR3aWR0aCB0byB0ZXN0IGFuZCBmaXggdGhlIHBhdGhzIEkNCj4+PiB1c2UuIElmIHRoYXQn
cyB1bmFjY2VwdGFibGUgSSdtIGhhcHB5IHRvIGNvbnRpbnVlIGRldmVsb3BtZW50IGluIG15DQo+
Pj4gcHJpdmF0ZSBmb3JrIGFuZCBsZWF2ZSB0aGluZ3MgYXMtaXMgdXBzdHJlYW0uDQo+Pg0KPj4g
U2ltaWxhcmx5LCBpZiB0aGVyZSBhcmUgbGltaXRhdGlvbnMgLSBmaW5lLiBCdXQgcGxlYXNlIHNh
eSBzbyBpbiB0aGUNCj4+IGRlc2NyaXB0aW9uLCB0byBhdm9pZCBnaXZpbmcgdGhlIGltcHJlc3Np
b24gdGhhdCB0aGUgaXNzdWVzIGhhdmUgYmVlbg0KPj4gdGFrZW4gY2FyZSBvZiBhbHRvZ2V0aGVy
Lg0KPiANCj4gRmFpciBlbm91Z2guDQoNCkFuZCBidHcgLSBpZiB5b3UganVzdCBzZW50IGFuIHVw
ZGF0ZWQgZGVzY3JpcHRpb24sIEkgdGhpbmsgSSdkIGNvbW1pdA0KdGhpcyB3aXRob3V0IGZ1cnRo
ZXIgd2FpdGluZyBmb3IgR2VvcmdlIHRvIGZpbmQgdGltZSB0byBldmVudHVhbGx5IGFjaw0KaXQu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
