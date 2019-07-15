Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C8B69480
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:52:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2In-0006mu-SY; Mon, 15 Jul 2019 14:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn2Il-0006Wk-OH
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:50:03 +0000
X-Inumbo-ID: d0f23d44-a70f-11e9-a9fd-4b4dfd81e5ac
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0f23d44-a70f-11e9-a9fd-4b4dfd81e5ac;
 Mon, 15 Jul 2019 14:50:02 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 14:49:58 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 14:49:54 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 14:49:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCESqpAYBKX0Jz6vSyC+mEbdss5oq9QKNAMuxERWvILKb7Q8S3ysPHZPZFURbPmeSExk1XJAwlIptqbmqYdUD2rPxNnNRRG3KmfZVYYpBAsz2D8YGOEc40YJsRRug5l7VyawQkVHpx9zCzm+stWh028U531Un/DYNW3+FYUTYeTeYfx1KczFuDgveWt+hTcSRMXdIdQ9MXAmRFQbOSpADr3smPlohAuMCiheExCDshh9EgM/L/+NNRmnKfuwM67+7a0IHkz7uWM/NWDAm5+du4BC7Ycm7KlDGAxNJO+rvD1CHTRa0wADK67rOZ+q51JcyNpRyDXUrPXH77yxqw/CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9e8m5854mWRdHGopLVWRx/yYhevthV8e86pLnzLoSw=;
 b=bx8bxlyAY7p1g0B7jv+Pp2TZLEBa623b/93JTIxCN7Bqw4KQg+g+nD+ZKPRK/jqXKTkn1EfwpHlA+vAl501g8AD4anXgKH7dforaBhn1eZbMxTrBZJzk3cpV6XhKgpPFmslTPbLVUsqExpy1zz8H7qJfstJtBkd+CwZi02MrEyehRfH0VWV4Sil4ZiumTR7lraYZTT9RmY6ZhWry3qtjHtFIYm9A9/mu5F+gk0wFO5DtlPYpBvErX3wHRX4RSZaA7+rzM96x8MvvEQlnpitjrBvwBCAMtSyRZpp7AsKy8c5Qd9A8fYsdyEGDZHpgvt41eP8MsO7OWJCTvb2RV7WSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2490.namprd18.prod.outlook.com (20.179.105.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 14:49:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:49:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Thread-Topic: [PATCH] x86/dom0-build: fix build with clang5
Thread-Index: AQHVOxeAOJS35VCb3EmrxBvoPUkIQKbLwZ0ugAABSAA=
Date: Mon, 15 Jul 2019 14:49:52 +0000
Message-ID: <e629b9aa-a450-b582-fc4a-c7613e3e59a0@suse.com>
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
 <CABfawhmHFWEQ36S6M0+M+Ls1fFJpvHRCN6+Q4Mn0_DrFQjOVPg@mail.gmail.com>
 <07f476c6-2f65-c6a6-7b80-9700816cbd54@suse.com>
 <CABfawhmDky6=sHsXRAD36Tz=kW5=rQSk9bb5Un3cxaO+6y55uQ@mail.gmail.com>
In-Reply-To: <CABfawhmDky6=sHsXRAD36Tz=kW5=rQSk9bb5Un3cxaO+6y55uQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0022.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d1392ca-63e9-48b7-f0da-08d70933b1c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2490; 
x-ms-traffictypediagnostic: DM6PR18MB2490:
x-microsoft-antispam-prvs: <DM6PR18MB24902127E6C907EC13C7D4CEB3CF0@DM6PR18MB2490.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(26005)(80792005)(386003)(186003)(229853002)(2906002)(31686004)(6116002)(3846002)(2616005)(52116002)(76176011)(99286004)(446003)(11346002)(486006)(53546011)(102836004)(6916009)(476003)(6506007)(66476007)(66066001)(66446008)(64756008)(66556008)(68736007)(66946007)(7736002)(5660300002)(25786009)(478600001)(6436002)(36756003)(81166006)(4326008)(53936002)(8936002)(81156014)(71200400001)(71190400001)(54906003)(31696002)(316002)(14444005)(86362001)(256004)(6512007)(6246003)(6486002)(305945005)(8676002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2490;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O2+meOtAeOv2J9dIPMhRdBBavQyzWXOj8LsQk2FZPyZti2ilVchW2vbdgoOY+V4L0rLdxWBKQ3Yv+4g2dJr6jIF2qr5KQzTLhRuURnCrlvmnEmaB5AL4qE3TInnT3rfRHFgp++ARwzIWVONlESaodODRsDeFY+movNmqopFR7oWAN0cILNdWmBRhyW08+BFU6jMjlZGsvX28p+AhUL62hV9skodiP02ZLXsIeRV9wX2/kihMQSxxXPjdzrlF28swnzpZaotpiMmUGCpjjdowj0WOgr5bplRgX3/LLFBeue1IDA4D0mif9M9CXGhUqW0tMVgc3NZ1Z08kLOgJq6p9DQBTrc8Lyhco55ei8DY0UWHQB0O/h/BYFRemz08Dft3kuYmuFPyVNB5yOLVle1CA63m270y0UklK3QHHLbstoT4=
Content-ID: <2069F4D1FF906C40B2B205334DDA943E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1392ca-63e9-48b7-f0da-08d70933b1c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:49:52.9360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2490
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxNjo0NCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBNb24sIEp1
bCAxNSwgMjAxOSBhdCA4OjEzIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMTUuMDcuMjAxOSAxNTo0MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0K
Pj4+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDQ6MzYgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gV2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBf
TUVNIGNsYW5nNSBwcm9kdWNlcw0KPj4+Pg0KPj4+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBlcnJv
cjogdXNlIG9mIGxvZ2ljYWwgJyYmJyB3aXRoIGNvbnN0YW50IG9wZXJhbmQgWy1XZXJyb3IsLVdj
b25zdGFudC1sb2dpY2FsLW9wZXJhbmRdDQo+Pj4+ICAgICAgICBpZiAoICFkb20wX21lbV9zZXQg
JiYgQ09ORklHX0RPTTBfTUVNWzBdICkNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBe
ICB+fn5+fn5+fn5+fn5+fn5+fn4NCj4+Pj4gZG9tMF9idWlsZC5jOjM0NDoyNDogbm90ZTogdXNl
ICcmJyBmb3IgYSBiaXR3aXNlIG9wZXJhdGlvbg0KPj4+PiAgICAgICAgaWYgKCAhZG9tMF9tZW1f
c2V0ICYmIENPTkZJR19ET00wX01FTVswXSApDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn4NCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAmDQo+Pj4+IGRvbTBfYnVpbGQu
YzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBjb25zdGFudCB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0K
Pj4+PiAgICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApDQo+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4+
IDEgZXJyb3IgZ2VuZXJhdGVkLg0KPj4+Pg0KPj4+PiBPYnZpb3VzbHkgbmVpdGhlciBvZiB0aGUg
dHdvIHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVyZS4gT2RkbHkNCj4+Pj4gZW5vdWdoIHN3
YXBwaW5nIHRoZSBvcGVyYW5kcyBvZiB0aGUgJiYgaGVscHMsIHdoaWxlIGUuZy4gY2FzdGluZyBv
cg0KPj4+PiBwYXJlbnRoZXNpemluZyBkb2Vzbid0LiBBbm90aGVyIHdvcmthYmxlIHZhcmlhbnQg
bG9va3MgdG8gYmUgdGhlIHVzZSBvZg0KPj4+PiAhISBvbiB0aGUgY29uc3RhbnQuDQo+Pj4+DQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IEknbSBvcGVuIHRvIGdvaW5nIHRoZSAhISBvciB5ZXQgc29tZSBkaWZmZXJlbnQg
cm91dGUuIE5vIG1hdHRlciB3aGljaA0KPj4+PiBvbmUgd2UgY2hvb3NlLCBJJ20gYWZyYWlkIGl0
IGlzIGdvaW5nIHRvIHJlbWFpbiBndWVzc3dvcmsgd2hhdCBuZXdlcg0KPj4+PiAoYW5kIGZ1dHVy
ZSkgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbCBjaG9rZSBvbi4NCj4+Pg0KPj4+IElzIGRpc2FibGlu
ZyB0aGUgY2hlY2sgaXRzZWxmIG5vdCBhbiBvcHRpb24/IFNlZW1zIHRvIG1lIHRvIGJlIGEgbW9y
ZQ0KPj4+IHNlbnNpYmxlIG9wdGlvbiB0aGVuIGhhY2tpbmcgYXJvdW5kIGl0Lg0KPj4NCj4+IEhv
dyB3b3VsZCB5b3UgZW52aXNpb24gdG8gZGlzYWJsZSB0aGUgY2hlY2s/IEl0J3MgdGhlcmUgZm9y
IGEgcmVhc29uDQo+PiBhZnRlciBhbGwuDQo+IA0KPiBCeSBwYXNzaW5nIC1Xbm8tY29uc3RhbnQt
bG9naWNhbC1vcGVyYW5kIHRvIHRoZSBjb21waWxlci4gSXQgbG9va3MNCj4gbGlrZSBhIGNoZWNr
IGZvciBhIG5vbi1jb21tb24gc2l0dWF0aW9uIHdoaWNoIGV2aWRlbnRseSBYZW4gdXNlcywgc28N
Cj4gd2hhdCdzIHRoZSBwb2ludCBvZiBrZWVwaW5nIGl0IGJ1dCBoYWNraW5nIGFyb3VuZCB3aXRo
IGl0IHdpdGggdHJpY2tzDQo+IHRoYXQgYXJlIGZyYWdpbGU/DQoNCk9oLCBzbyB5b3UgbWVhbnQg
ZGlzYWJsaW5nIHRoZSBjb21waWxlciB3YXJuaW5nLiBUaGF0IG1heSBiZSBhbiBvcHRpb24sDQpi
dXQgSSB3b3VsZG4ndCByb3V0aW5lbHkgc3VnZ2VzdCBzdWNoIGFzIG9mdGVuIGJlc2lkZXMgdW5o
ZWxwZnVsDQppbnN0YW5jZXMgdGhlcmUgYXJlIGFsc28gaGVscGZ1bCBvbmVzLg0KDQpKYW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
