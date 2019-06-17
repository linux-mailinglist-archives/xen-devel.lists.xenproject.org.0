Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF4B49412
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 23:35:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hczEr-0006gQ-AJ; Mon, 17 Jun 2019 21:32:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5L+D=UQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hczEq-0006gL-4e
 for xen-devel@lists.xen.org; Mon, 17 Jun 2019 21:32:28 +0000
X-Inumbo-ID: 666abbd0-9147-11e9-8980-bc764e045a96
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (unknown
 [40.107.68.56]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 666abbd0-9147-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCOUtOJuZN62jsOMrW9T0UfQkCAS8rHPG0DksmDoGp4=;
 b=NirQqEPbRMy0c7bDHaSTm0kQ5Ib6Ko4tdGq16UvCdaLBIhdzIvtv3IntoTOJbkCvklf2/YCqm5SUzRlCW1qRW1xz1+UAbgHBfPPQAxW2EHLLn/mxXpQVt7HoqMMeFFlHUPwESw2DA3gSOTWBfvWySrTrEOtYJL03a4ZfxDR6w/E=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3770.namprd12.prod.outlook.com (10.255.172.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Mon, 17 Jun 2019 21:32:24 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 21:32:24 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
Thread-Index: AQHU5XeM504EUMjU30KXwgaAbNMDuaaE4HYAgBv85YA=
Date: Mon, 17 Jun 2019 21:32:24 +0000
Message-ID: <20190617213221.GB11864@amd.com>
References: <20190328150426.7295-1-brian.woods@amd.com>
 <A38EA0E1-3AB5-4816-82C5-8540D28D3D1B@gmail.com>
In-Reply-To: <A38EA0E1-3AB5-4816-82C5-8540D28D3D1B@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR0101CA0031.prod.exchangelabs.com (2603:10b6:4:28::44)
 To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61084d2a-ca56-4d27-e706-08d6f36b4961
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3770; 
x-ms-traffictypediagnostic: DM6PR12MB3770:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <DM6PR12MB377080219278C6E7E028CD33E5EB0@DM6PR12MB3770.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(39860400002)(396003)(376002)(199004)(189003)(7736002)(11346002)(305945005)(5660300002)(478600001)(6436002)(8936002)(81166006)(14454004)(8676002)(6916009)(68736007)(81156014)(2906002)(229853002)(86362001)(1076003)(6512007)(6486002)(316002)(6306002)(966005)(72206003)(256004)(71190400001)(71200400001)(66446008)(52116002)(3846002)(6116002)(64756008)(66066001)(25786009)(4326008)(6246003)(66946007)(73956011)(66556008)(66476007)(53936002)(33656002)(99286004)(102836004)(446003)(2616005)(476003)(1411001)(561944003)(6506007)(53546011)(26005)(386003)(76176011)(36756003)(486006)(186003)(14444005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3770;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mBZLCxikvhf7aHIEzfIbgrNosbOkidUbo/xJjnIWR7YveWJu5sDmGgF+bIx/v+UHQremVwGcwwxLfbmkTbxNhZltVAPiOeCjpeQShjO+pGLMBKwJCqRl+8x5anXOIXwnBaCnL+0Ik92wjVZM07EFR1xm2hkIhSHNsolEek6XwsVUAboKwXbPoZB1KslvoVmM8CB3WT0/ZexsbcBcrjzcfUkpRlIUF3k2BhqLI6tQt9XnR0rkAGS/PF4ZnQ2/Rt+MkF3NjNhWKG5tpiI2gzhxQi3ukIU6lFoYp+N+P7ychpHr5mKjPJBAFm34OZbE6oxPKrKs2s59Jt94YpnRfswLzBI/tWzMeHSS+tltfkJV5GYa8jMFJjISZPQsaJ9dTSvOSF+vPdFO5o+ZlPqh/V1/XP9cWp5AF31hvX5jn6eGq08=
Content-ID: <3D7F43B75BC141449C4676AABA3D8F77@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61084d2a-ca56-4d27-e706-08d6f36b4961
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 21:32:24.0935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3770
Subject: Re: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
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
Cc: Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Woods, Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMTA6MDg6MTJQTSAtMDQwMCwgUmljaCBQZXJzYXVkIHdy
b3RlOgo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPiBPbiBNYXIgMjgsIDIwMTksIGF0IDEx
OjA0LCBXb29kcywgQnJpYW4gPEJyaWFuLldvb2RzQGFtZC5jb208bWFpbHRvOkJyaWFuLldvb2Rz
QGFtZC5jb20+PiB3cm90ZToKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgc3VwcG9ydCBhbmQg
ZW5hYmxlbWVudCBmb3IgbXdhaXQgb24gQU1EIE5hcGxlcwo+IGFuZCBSb21lIHByb2Nlc3NvcnMu
ICBOZXdlciBBTUQgcHJvY2Vzc29ycyBzdXBwb3J0IG13YWl0LCBidXQgb25seSBmb3IKPiBjMSwg
YW5kIGZvciBjMiBoYWx0IGlzIHVzZWQuICBUaGUgbXdhaXQtaWRsZSBkcml2ZXIgaXMgbW9kaWZp
ZWQgdG8gYmUKPiBhYmxlIHRvIHVzZSBib3RoIG13YWl0IGFuZCBoYWx0IGZvciBpZGxpbmcuCj4g
Cj4gV291bGQgeW91IG1pbmQgaWYgSSBjcmVhdGUgYSBYZW4gUHJvamVjdCBKSVJBIHRpY2tldCwg
b3IgYSB3aWtpIHBhZ2UsIHRvIHRyYWNrIHJlcXVpcmVtZW50cyBhbmQgaW1wbGVtZW50YXRpb25z
IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCBzZXJpZXM/CgpZb3UgY2FuLCBidXQgSSBkb3VidCB0aGlz
IHBhdGNoIHNlcmllcyB3aWxsIGdvIGFueXdoZXJlIHNpbmNlIEphbiB3YXMKY29tcGxldGVseSBv
cHBvc2VkIHRvIGFkZGluZyB0aGlzIHRvIHRoZSBtd2FpdC1pZGxlLmMgZmlsZSBzaW5jZSBpdApp
bmNsdWRlZCBoYWx0IGZvciBDMi4gIFNpbmNlIHRoZW4sIEphbiBoYXMgcmVsZWFzZWQgc29tZSBv
dGhlciBwYXRjaGVzCndoaWNoIGhhdmUgZ290dGVuIHJldmlld3MvY29tbWVudHMgc28uCgo+IEZy
b20gdGhlIGluaXRpYWwgdGhyZWFkIFsxXToKPiBPbiBjZXJ0YWluIEFNRCBmYW1pbGllcyB0aGF0
IHN1cHBvcnQgbXdhaXQsIG9ubHkgYzEgY2FuIGJlIHJlYWNoZWQgYnkKPiArICogbXdhaXQgYW5k
IHRvIHJlYWNoIGMyLCBoYWx0IGhhcyB0byBiZSB1c2VkLgo+ICsgKi8KPiArI2RlZmluZSBDUFVJ
RExFX0ZMQUdfVVNFX0hBTFQgICAgICAgIDB4Mgo+IAo+IENvdWxkIHlvdSBwb2ludCB1cyBhdCB3
aGVyZSBpbiB0aGUgbWFudWFscyB0aGlzIGJlaGF2aW9yIGlzIGRlc2NyaWJlZD8KPiBXaGlsZSBQ
TSBWb2wgMiBoYXMgYSBjaGFwdGVyIHRhbGtpbmcgYWJvdXQgUC1zdGF0ZXMsIEkgY2FuJ3Qgc2Vl
bSB0bwo+IGZpbmQgYW55IG1lbnRpb24gb2YgQy1zdGF0ZXMgdGhlcmUuCgpUZWNobmljYWxseSBJ
IHNob3VsZCBjbGFpcmZ5LiAgWW91IGNhbiByZWFjaCBDMSBhbmQgQzIgdmlhIHN5c2lvIGFuZAph
Y3BpIGFzIHdlbGwuICBCdXQgbXdhaXQgb25seSB1c2VzIEMxLiAgSGFsdCAoYWZ0ZXIgYSB0aW1l
ciBhbmQgYQp0cmFuc2l0aW9uIHN0YXRlKSwgYXNzdW1pbmcgQzIgaXMgZW5hYmxlZCwgZG9lcyBw
dXQgdGhlIENQVSBpbiBDMi4KClNhZGx5IHRoaXMgaXNuJ3QgZG9jdW1lbnRlZCB3ZWxsLCAoZXZl
biBpbiB0aGUgTkRBIGRvY3MpLCBidXQgdGhlCmRvY3VtZW50YXRpb24geW91J2QgYmUgbG9va2lu
ZyBmb3IgaXMgdGhlIE5EQSBQUFIuICBTYWRseSB0aGUgcHVibGljClBQUiBkb2Vzbid0IGluY2x1
ZGUgaXQuCgo+IElJUkMgaXQncyBpbiB0aGUgTkRBIFBQUiBhbmQgaW50ZXJuYWxseSBpdCdzIGlu
IHNvbWUgb3RoZXIgZG9jdW1lbnRzLgo+IFdlIGRvbid0IGhhdmUgc3VwcG9ydCB0byB1c2UgbXdh
aXQgd2hpbGUgaW4gQ0M2IGR1ZSB0byBjYWNoZXMgYmVpbmcKPiB0dXJuZWQgb2ZmIGV0Yy4gIElm
IHdlIGRpZCBoYXZlIG13YWl0IHN1cG9ydCBmb3IgQ0M2LCB3ZSdkIHVzZSB0aGF0IGhlcmUKPiAo
YmFzaWNhbGx5IG1pcnJvcmluZyBJbnRlbCkuICBTYWRseSBJIGRvbid0IHRoaW5rIHdlIGhhdmUg
YW55IHB1YmxpYwo+IGluZm9ybWF0aW9uIGRpcmVjdGx5IGRldGFpbGluZyB0aGlzIGluZm9ybWF0
aW9uLgoKTm9uZSB0aGF0IEkga25vdyBvZi4KCj4gQ2FuIHRoaXMgYmUgZG9jdW1lbnRlZCBpbiB0
aGUgcGF0Y2ggY29tbWVudCwgb3IgYW4gQU1ELXNwZWNpZmljIHBhZ2Ugb24gd2lraS54ZW5wcm9q
ZWN0Lm9yZzxodHRwOi8vd2lraS54ZW5wcm9qZWN0Lm9yZz4/ICBJdCdzIGEgcmVxdWlyZW1lbnQv
aW5wdXQgdG8gYWxsIHBvc3NpYmxlIGltcGxlbWVudGF0aW9ucy4KPiAKPiBGcm9tIGEgY29tbWVu
dCBpbiB0aGUgQXByaWwgMjAxOCBMaW51eCBwYXRjaCBieSBZYXplbiBbMl06Cj4gPiB4ODYvc21w
Ym9vdDogRG9uJ3QgdXNlIG13YWl0X3BsYXlfZGVhZCgpIG9uIEFNRCBzeXN0ZW1zCj4gPiBSZWNl
bnQgQU1EIHN5c3RlbXMgc3VwcG9ydCB1c2luZyBNV0FJVCBmb3IgQzEgc3RhdGUuIEhvd2V2ZXIs
IE1XQUlUIHdpbGwKPiA+IG5vdCBhbGxvdyBkZWVwZXIgY3N0YXRlcyB0aGFuIEMxIG9uIGN1cnJl
bnQgc3lzdGVtcy4KPiA+Cj4gPiBwbGF5X2RlYWQoKSBleHBlY3RzIHRvIHVzZSB0aGUgZGVlcGVz
dCBzdGF0ZSBhdmFpbGFibGUuICBUaGUgZGVlcGVzdCBzdGF0ZQo+ID4gYXZhaWxhYmxlIG9uIEFN
RCBzeXN0ZW1zIGlzIHJlYWNoZWQgdGhyb3VnaCBTeXN0ZW1JTyBvciBIQUxULiBJZiBNV0FJVCBp
cwo+ID4gYXZhaWxhYmxlLCBpdCBpcyBwcmVmZXJyZWQgb3ZlciB0aGUgb3RoZXIgbWV0aG9kcywg
c28gdGhlIENQVSBuZXZlciByZWFjaGVzCj4gPiB0aGUgZGVlcGVzdCBwb3NzaWJsZSBzdGF0ZS4K
PiA+Cj4gPiBEb24ndCB0cnkgdG8gdXNlIE1XQUlUIHRvIHBsYXlfZGVhZCgpIG9uIEFNRCBzeXN0
ZW1zLiBJbnN0ZWFkLCB1c2UgQ1BVSURMRQo+ID4gdG8gZW50ZXIgdGhlIGRlZXBlc3Qgc3RhdGUg
YWR2ZXJ0aXNlZCBieSBmaXJtd2FyZS4gSWYgQ1BVSURMRSBpcyBub3QKPiA+IGF2YWlsYWJsZSB0
aGVuIGZhbGxiYWNrIHRvIEhBTFQuCj4gCj4gRm9yIHRoZSB0aWNrZXQvd2lraTogd2hhdCBhcmUg
dGhlIGV4cGVjdGVkIGJlbmVmaXRzIG9mIHRoZSBwcm9wb3NlZCBYZW4gY2hhbmdlPyAgV291bGQg
aXQgcmVkdWNlIGlkbGUgcG93ZXIgY29uc3VtcHRpb24gb24gUnl6ZW4gMTAwMC8yMDAwLzMwMDA/
IEVweWMgMzAwMC83MDAwPyBBbnkgc2FtcGxlIGRhdGEgYXZhaWxhYmxlIGZvciBpZGxlIHBvd2Vy
IGJlZm9yZS9hZnRlciB0aGUgdjIgcGF0Y2g/CgpTaW5jZSBYZW4gdXNlcyBIQUxUIGJlIGRlZmF1
bHQsIGl0IHdvdWxkIGJlIGEgcGVyZm9ybWFuY2UgZmVhdHVyZSwKc2luY2UgaXQgd291bGQgdXNl
IEhBTFQvQzIgZm9yIEFMTCBpZGxlLiAgbXdhaXQgaGFzIGEgbXVjaCBiZXR0ZXIKcmVzcG9uc2Ug
dGltZSBmcm9tIGJlaW5nIHdva2VuIHVwIChhdCB0aGUgY29zdCBwb3dlcikuCgo+IEZyb20gYSB0
aHJlYWQgWzNdIHBvc3RlZCBieSBKYW4gdGhpcyB3ZWVrLCAieDg2L0FNRDogbWFrZSBDLXN0YXRl
IGhhbmRsaW5nIGluZGVwZW5kZW50IG9mIERvbTAiOgo+ID4gVGhlIDNyZCBwYXRjaCBpcyBteSBj
b3VudGVycHJvcG9zYWwgdG8gQnJpYW4ncyBpbnRlbmRlZCBhYnVzZSAoYXMgSSB3b3VsZCBjYWxs
IGl0KSBvZiB0aGUgbXdhaXQtaWRsZSBkcml2ZXIuCj4gCj4gRG8gd2UgbmVlZCBhIG5ldywgcGF0
Y2gtaW5kZXBlbmRlbnQsIHRocmVhZCBmb3IgY29udmVyZ2VuY2Ugb2YgY2FuZGlkYXRlIGltcGxl
bWVudGF0aW9ucyB3aGljaCBhZGRyZXNzIHRoZSByZXF1aXJlbWVudHMgKGRvY3VtZW50ZWQgaW4g
dGlja2V0L3dpa2kpPyAgU2hvdWxkIGRpc2N1c3Npb24gbW92ZSBmcm9tIHRoZSBpbml0aWFsIHRo
cmVhZCBbMV0gdG8gdGhlIGNvdW50ZXItcHJvcG9zYWwgdGhyZWFkIFszXT8gIE9yIHRoaXMgdGhy
ZWFkPwo+IAo+IFJpY2gKClllcywgdGhhdCdzIEphbidzIHBhdGNoIEkgd2FzIHRhbGtpbmcgYWJv
dXQgYmVmb3JlLiAgR2xhZCB0byBrbm93IHRoZQpjbGVhbmVzdCBzb2x1dGlvbiB3aXRoIHRoZSBs
ZWFzdCBjb2RlIGR1cGxpY2F0aW9uIGFuZCBhIHNpbmdsZSBwYXRoCmZvciBJbnRlbCBhbmQgQU1E
IHdhcyBjb25zaWRlcmVkIGFidXNlLgoKPiBbMV0gaHR0cHM6Ly9saXN0cy5ndC5uZXQveGVuL2Rl
dmVsLzU0NTY4OAo+IAo+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90aXAvdGlwLmdpdC9jb21taXQvP2g9eDg2LXVyZ2VudC1mb3ItbGludXMmaWQ9
ZGE2ZmE3ZWY2N2YwNzEwOGExYjBjYjlmZDllN2ZjYWFiZDM5YzA1MTxodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdC9jb21taXQvP2g9eDg2
LXVyZ2VudC1mb3ItbGludXMmaWQ9ZGE2ZmE3ZWY2N2YwNzEwOGExYjBjYjlmZDllN2ZjYWFiZDM5
YzA1MSZ1dG1fc291cmNlPWFuej4KPiAKPiBbM10gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21zZzAxODk0Lmh0bWwKPiAKCi0tIApC
cmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
