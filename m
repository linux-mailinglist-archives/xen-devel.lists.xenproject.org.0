Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2A69502
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:55:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2LC-0006y0-BB; Mon, 15 Jul 2019 14:52:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn2LB-0006xv-Ed
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:52:33 +0000
X-Inumbo-ID: 2bc36296-a710-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2bc36296-a710-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:52:32 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 14:52:29 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 14:52:25 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 14:52:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewglK3Q6+VFLqLMc0t1yH2CZsFqeF6Kb9aIqdr86OboHkxTpp4Q2+d85pksCYDIYcFkGHH9al56G8KLzSuiaSyw72apY/SmKG44ot6ShTbL5AfE+DlHB73zzgL8uS8cNgcHuV8Sc81ssKQSTReqzBGFMLApdsZ4RpA8ecmLJVGZzR3ecxMW1drN3j3Ch6VPkJf8XneqMkiNBqjN3zhXM9VXzfHrIh1TOGWWqaJcvP/q4zkgHRH7Mj+AvXk4NxuuLikTvmebESd9dl/PThGgVdAtelXK5i96gWruGeLksb3ES0rKAkQS1rSN6juA88sJA+heTbfLzckEuBCu7hBSfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+wcDz/51UmXXCRfmEMacYHthVquY4iawNoBVScczLo=;
 b=dMdohp90iMpmsnJrPkF+Xbd5fNw90xhOVdAEaMQJPqIJRW3+RmWxy6zXxFdfzzBfrcqpl8+02wM1kRKREPmZfC2NI01z25NF96W5RKNNH5HVeDGOP7f8enjySSrx99ryzfjLzecm3tJbAIgJpMgy1kLx69mAjdLAgKdLX51r9IehUB0Vwt0KTYS1NgbxqE4LPKCtuedL4NFaLFgTyTuDWUHW+hAjVpSDYW2T4Jcgo2GTbGsmFfzdTVZYxudO17PP+5QwLrfu4Jybi92d25gk0UsxP0w1vKHE6HAKNYiMGX+6l/NS1uVxVsKFXFjegerQak06qYzQBJbfn8EbRARVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2809.namprd18.prod.outlook.com (20.179.50.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 14:52:24 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:52:24 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Xen on Distros
Thread-Index: AQHVOxdKPvpxo6u4BUiqE8VCaQqJKabLu4AAgAAFgTSAAAKcAA==
Date: Mon, 15 Jul 2019 14:52:23 +0000
Message-ID: <35d77bc2-8d17-8686-c08e-211973ce49e5@suse.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
 <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
 <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
In-Reply-To: <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::21) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7489683f-f2a3-4e00-cb27-08d709340bca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2809; 
x-ms-traffictypediagnostic: DM6PR18MB2809:
x-microsoft-antispam-prvs: <DM6PR18MB2809429B4FF2C0F55469B837B3CF0@DM6PR18MB2809.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(189003)(199004)(446003)(561944003)(26005)(52116002)(2616005)(186003)(66066001)(76176011)(66556008)(66476007)(66946007)(64756008)(53546011)(6506007)(80792005)(2906002)(66446008)(31686004)(36756003)(11346002)(99286004)(386003)(102836004)(31696002)(486006)(6116002)(3846002)(4326008)(7736002)(86362001)(25786009)(5660300002)(6916009)(8676002)(81156014)(81166006)(14454004)(14444005)(256004)(71190400001)(71200400001)(6512007)(53936002)(478600001)(6246003)(68736007)(476003)(6436002)(316002)(8936002)(305945005)(6486002)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2809;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AWs1w840a4sMpcfsfjWXvQjluxa9mIUlk7oskIQbbglmrXoTZ4damO5Nc5yJMxCOLOi1NX8pP+hT/FbSIs+NgZHiBgrQxsJNJjnGFSSyAGpBujLfz2K+Hd9oUdjSE2FNFnZhBupYsr4Q54s9dXFr2rfr2Fr4YmJf7PIdzzjl6vrJf9CTqAuMUX5oz3EN2DaLCYSSxOT1yGWu1XgHZeJ9VW3EqoeFC/eGkqrJTavD9zum+TXRShRBPBoVU58LVypPoxO3JhrIfoTel4PIyQ8fpjiGdTMPJNJpd1vJQOTiaalm2iJjcLUxRgZpQqQ/wbAabx8pmKDRbfsmJdUwHacEL64FLhjndTFoVozvsmZ/Fiyk5miU1zyTS8INHQr7WBK9V8fKp/i9oo6QTlgNv3xYDsYn5N430zyq3C1NR6U0x/A=
Content-ID: <07962449FF05D04DA958CAAD3A76D05D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7489683f-f2a3-4e00-cb27-08d709340bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:52:23.8742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2809
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxNjo0MiwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gNy8xNS8xOSAz
OjIzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE1LjA3LjIwMTkgMTY6MTEsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6DQo+Pj4gVGhlcmUgd2FzIGEgbG9uZyBkaXNjdXNzaW9uIGFib3V0IHNl
Y3VyaXR5IHBhdGNoZXMsIHdpdGggdGhlIGdlbmVyYWwNCj4+PiBwcm9wb3NhbCBiZWluZyB0aGF0
IHdlIHNob3VsZCBjdXQgYSBwb2ludCByZWxlYXNlIGZvciBldmVyeSBzZWN1cml0eSBpc3N1ZS4N
Cj4+DQo+PiBJbnRlcmVzdGluZy4gTG9va3MgbGlrZSBpbiBwb2xpdGljcyB0aGF0IHVudGlsIGEg
ZGVjaXNpb24gZml0cyBwZW9wbGUNCj4+IHRoZXkga2VlcCByZS1yYWlzaW5nIHRoZSBwb2ludC4g
SWlyYyBvbiBhIHByaW9yIG1lZXRpbmcgKEJ1ZGFwZXN0PykNCj4+IHdlIGhhZCBzZXR0bGVkIG9u
IGNvbnRpbnVpbmcgd2l0aCB0aGUgY3VycmVudCBzY2hlbWUuIFdlcmUgdGhlcmUgYW55DQo+PiBu
ZXcgYXJndW1lbnRzIHRvd2FyZHMgdGhpcyBhbHRlcm5hdGl2ZSBtb2RlbD8NCj4gDQo+IFdlbGwg
SSBkb24ndCBrbm93IGlmIHRoZXJlIHdlcmUgYW55IG5ldyBhcmd1bWVudHMgYmVjYXVzZSBJIGRv
bid0DQo+IGltbWVkaWF0ZWx5IHJlbWVtYmVyIHRoZSBvbGQgZGlzY3Vzc2lvbi4gIERvIHdlIGhh
dmUgYSBzdW1tYXJ5IG9mIHRoZQ0KPiBkaXNjdXNzaW9uIGluIEJ1ZGFwZXN0LCB3aXRoIGl0cyBj
b25jbHVzaW9ucywgYW55d2hlcmU/DQoNCkkgZG9uJ3QgcmVjYWxsIGlmIHN1aXRhYmxlIG5vdGVz
IHdlcmUgdGFrZW4gYmFjayB0aGVuOyBhcyBpbmRpY2F0ZWQNCkknbSBub3QgZXZlbiBzdXJlIHdo
aWNoIG1lZXRpbmcgaXQgd2FzIGF0Lg0KDQo+IFRoZSBiYXNpYyBpZGVhIHdhcyB0aGF0Og0KPiAN
Cj4gMS4gTW9zdCBkaXN0cm9zIC8gcGFja2FnZXJzIGFyZSBnb2luZyB0byB3YW50IHRvIGRvIGFu
IGltbWVkaWF0ZSByZWxlYXNlDQo+IGFueXdheS4NCj4gDQo+IDIuIERpc3Ryb3MgZ2VuZXJhbGx5
IHNlZW1lZCB0byBiZSByZWJhc2luZyBvbiB0b3Agb2Ygc3RhZ2luZyBhcyBzb29uIGFzDQo+IHRo
ZSBYU0Egd2VudCBvdXQgYW55d2F5IChhbmQgSVNUUiB0aGlzIGJlaW5nIHRoZSByZWNvbW1lbmVk
ZWQgY291cnNlIG9mDQo+IGFjdGlvbikNCj4gDQo+IFNvIGZvciBhbGwgaW50ZW50cyBhbmQgcHVy
cG9zZXMsIHdlIGhhdmUgc29tZXRoaW5nIHdoaWNoIGlzLCBpbiBmYWN0LCBhDQo+IHJlbGVhc2U7
IGFsbCBpdCdzIG1pc3NpbmcgaXMgYSBzaWduZWQgdGFnIGFuZCBhIHRhcmJhbGwuDQo+IA0KPiBP
YnZpb3VzbHkgdGhlcmUgYXJlIHRlc3RpbmcgaW1wbGljYXRpb25zIHRoYXQgd291bGQgbmVlZCB0
byBiZSBzb3J0ZWQNCj4gb3V0IGJlZm9yZSB0aGlzIGNvdWxkIGJlY29tZSBhIHJlYWxpdHkuDQo+
IA0KPiBJbiBhbnkgY2FzZSwgdGhlIGJhbGwgaXMgaW4gdGhlIGNvdXJ0IG9mICJWT0xVTlRFRVIi
IHRvIHdyaXRlIHVwIGENCj4gY29uY3JldGUgcHJvcG9zYWwgd2hpY2ggY291bGQgYmUgZGlzY3Vz
c2VkLiAgWW91J2xsIGJlIGFibGUgdG8gcmFpc2UgYWxsDQo+IHlvdXIgY29uY2VybnMgYXQgdGhh
dCBwb2ludCBpZiB5b3Ugd2FudCAoYWx0aG91Z2ggaGF2aW5nIGEgc2tldGNoIHdvdWxkDQo+IG9m
IGNvdXJzZSBiZSBoZWxwZnVsIGZvciB3aG9ldmVyIGlzIHdyaXRpbmcgc3VjaCBhIHByb3Bvc2Fs
KS4NCg0KU3VyZSAtIEkgcmVhbGl6ZWQgc29vbiBhZnRlciBoYXZpbmcgc2VudCB0aGUgaW5pdGlh
bCByZXBseSB0aGF0IHBlcmhhcHMNCnRoaXMgd2FzIHRoZSB3cm9uZyBjb250ZXh0IGluIHRoZSBm
aXJzdCBwbGFjZSB0byByYWlzZSBteSBxdWVzdGlvbi4NCg0KSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
