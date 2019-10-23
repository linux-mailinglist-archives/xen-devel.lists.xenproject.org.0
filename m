Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E89E1861
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 12:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNEH6-0002y7-EI; Wed, 23 Oct 2019 10:53:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNEH5-0002y2-J6
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 10:53:55 +0000
X-Inumbo-ID: 621d4932-f583-11e9-947c-12813bfff9fa
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 621d4932-f583-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 10:53:53 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 23 Oct 2019 10:52:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 23 Oct 2019 10:43:52 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 23 Oct 2019 10:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeUChSyrR7utSUEj4hSs2EMurr9iQJQv5nH0RqU7BfrfXVmTqIySTra9E2ILbRqbAjdKQH48aSjXycBm1vYjVXDYyye8ZPjJogTNizmNFrPuDTYKDW1PLosBFbIX2hr1LxktJW3/HTZiKQUHipCUbav9oYHsaKtjiNVTk+HGkQCZ52owjvBZDp6xRfxNrPuwsTf7sRaC4S6KlzGvg9la4nNTXAqNSnJaBEDkIBz+q15/lLyNqhAfPDGXJ2YX8x7pE+KWR4r5cjsyG4MRuSTLvPnuJ7HCyWjWRcNIQlX98O7U1DuftbiXCeRUdTE9Qqh+9aYLmzSWN9pZKRTJk5uJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkwYLPOvg/lwDPQ8kJhCPSXH/JHFRxYuxjd1LcFi+oA=;
 b=UeO0/jKf17+ZOpoWb6yMcTHl+VVcRqFEXV+WNjV/mcXk2BkKZ3N745amX9ZKjmfe17Yr/4zlWum9iTcBr4UwuNNX02/rKmO7Kb35fBD0yxW3cJIg8NCSv96/KOPN1Fum0K0KdL815fAAzbMEXeporAGzASWJEFNNe1sDkkOYjOSzzz/af1uzjmV1qtO6OiQDyVvYbicLIqbALvj6DnCGBbTXekYi6ctcaAtTFgj83H6ctkmkc37AjEOqXi0svj8AJriSNzcgxEcKeJcar54Vnqh0ZS1thqjQHy51s9Bj9dSSUBEuX2IV1L5xXW8LARyrzHUgeXhA6sdKPBAusvBCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB2734.namprd18.prod.outlook.com (20.178.255.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Wed, 23 Oct 2019 10:43:51 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::c546:8c10:b4bd:999c]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::c546:8c10:b4bd:999c%3]) with mapi id 15.20.2347.030; Wed, 23 Oct 2019
 10:43:51 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH] xen/typesafe: Force helpers to be always_inline
Thread-Index: AQHVd8ORtTnoazZJSEasgW/UXMplwqdFmUiAgACtjZiAAN1GgIADl3G3gARYpwCAFfydgIADB+SAgAACnICAABK3AA==
Date: Wed, 23 Oct 2019 10:43:50 +0000
Message-ID: <39f097d8-c315-e256-fa92-c1eda3e590eb@suse.com>
References: <20190930191610.27545-1-andrew.cooper3@citrix.com>
 <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
 <41d5ccea-b58c-ed3b-5cc8-8966d2850125@citrix.com>
 <d2d26eef-521a-02b6-68b1-5477530c8901@suse.com>
 <b4258bee-ba9d-80af-93f7-db01db3f2d57@citrix.com>
 <b2d49e5d-3350-d7f6-6bf2-8a2082e8fc80@suse.com>
 <ca6590c7-42bb-a20c-b848-9b6fcfd6624c@citrix.com>
 <cb954231-e37d-2d12-9356-862f1f0e38ed@suse.com>
 <dcd9f869-f2bf-0665-d6c0-d03cdfcf7896@citrix.com>
In-Reply-To: <dcd9f869-f2bf-0665-d6c0-d03cdfcf7896@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::23) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51aeea94-d92c-465e-646a-08d757a5e43f
x-ms-traffictypediagnostic: MN2PR18MB2734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB2734547418CA4ACF68A90B2CB36B0@MN2PR18MB2734.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(71200400001)(71190400001)(8676002)(25786009)(86362001)(316002)(14454004)(54906003)(80792005)(66066001)(31686004)(26005)(102836004)(81156014)(6506007)(81166006)(2616005)(53546011)(386003)(5660300002)(476003)(486006)(186003)(256004)(52116002)(76176011)(11346002)(446003)(66476007)(66556008)(66446008)(6246003)(64756008)(6116002)(3846002)(7416002)(8936002)(66946007)(99286004)(305945005)(7736002)(4326008)(2906002)(31696002)(6486002)(36756003)(6916009)(6512007)(6436002)(478600001)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2734;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DtTnR5Wk4SgVulJImqmmX5u2/QnrGK0inHooGni81pXcxO5MYtN+GX7Lne6rcqaPO6NVzv5bzE27RR6YPk/DmhFVE/r7PGuAasd3JIH/wP+GqGvD+I/Pvs+wfgoS8rl2DmGmNhwmvFTCzgUhCiWNAvLHqg1YUQbupEKaROT5Oxkwg5d59SJiwpTgf09Y8Q/qs8KtQvw1LKqY8tgSuAF/Rg81JXSzFpY8nQneJGlWzKunxaFHxrlsbm1g5XdN3PxeIWoolys+DxY/hPL8WvmE7u7dm3plC7WMMO8yYPVlAbW9N3B51sEIIICZE8G9GoJJRwmGKN/h1cRV7IX4HuphQmKGgBq+wp2zxZgFdrOwx/hmfQtOmY13cfVLZT1TsHqn01u27RXt9fCez0FTsofavK2idzIrojSqBLvEH++aATPQlQDFxFOH4IqSqtbB4tfZ
Content-ID: <97D62442BF5A2E4D9CE6424D9D087172@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aeea94-d92c-465e-646a-08d757a5e43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 10:43:50.9573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fc2l55/otiPc9O3VxQ+J+qC98hdr7luLcitr2waKNVu/VEr0djK4+sbMROgSM1Xjk1pIJnoo5d62iKi8EhUigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2734
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be
 always_inline
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
Cc: Juergen Gross <JGross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxMTozNywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gMTAvMjMvMTkg
ODoyNyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMS4xMC4yMDE5IDEzOjEwLCBHZW9y
Z2UgRHVubGFwIHdyb3RlOg0KPj4+IExldCdzIGRvIGEgY29zdC1iZW5lZml0cyBhbmFseXNpcyBv
ZiBhbHdheXNfaW5saW5lIHZzIGNsYW5nX2lubGluZS4NCj4+Pg0KPj4+IEZvciBlYWNoIGZ1dHVy
ZSBnY2MgdmVyc2lvbiwgZWl0aGVyIGl0IHdpbGwgY2hvb3NlIHRvIGlubGluZSB0aGlzDQo+Pj4g
ZnVuY3Rpb24gd2l0aCB0aGUgYGlubGluZWAga2V5IHdvcmQgb3Igbm90Lg0KPj4+DQo+Pj4gMS4g
VXNlIGFsd2F5c19pbmxpbmUNCj4+PiAgMWEuIGdjYyB3b3VsZCBoYXZlIGRvbmUgaW5saW5lIGFu
eXdheS4gIE5vIGNvc3QuDQo+Pj4gIDFiLiBnY2Mgd291bGQgbm90IGhhdmUgaW5saW5lZCBpdC4g
IGFsd2F5c19pbmxpbmUgdGFrZXMgZWZmZWN0IGFuZA0KPj4+IHRoZXJlJ3Mgbm8gY29zdC4NCj4+
PiAyLiBVc2UgY2xhbmdfaW5saW5lDQo+Pj4gIDJhLiBnY2Mgd291bGQgaGF2ZSBkb25lIGlubGlu
ZSBhbnl3YXkuICBObyBjb3N0Lg0KPj4+ICAyYi4gZ2NjIGRvZXNuJ3QgaW5saW5lIGl0LiAgV2Ug
aGF2ZSByYW5kb20gYnVncywgYSBkaXNjdXNzaW9uLCB0aGVuIGENCj4+PiBwYXRjaCB0byBzL2Ns
YW5nX2lubGluZS9hbHdheXNfaW5saW5lL2c7Lg0KPj4+DQo+Pj4gSU9XLCBJIG9ubHkgc2VlIGEg
Y29zdCBoZXJlIHRvIDIsIGFuZCBubyBiZW5lZml0Lg0KPj4NCj4+IFRoZSBiZW5lZml0IG9mIDIg
d291bGQgYmUgdGhlIGVhc2llciB3YXkgb2YgaWRlbnRpZnlpbmcgd2hhdCB3YXMNCj4+IGNoYW5n
ZWQganVzdCBmb3IgY2xhbmcncyBzYWtlLCBwZXJoYXBzIHdpdGggdGhlIHNpbXBsZSBnb2FsIG9m
DQo+PiByZXZlcnRpbmcgdGhlIHdob2xlIGxvdCB3aXRob3V0IGhhdmluZyB0byBmaXNoIG91dCBh
bGwgdGhlIGluZGl2aWR1YWwNCj4+IGNvbW1pdHMgdGhhdCBtYXkgYWNjdW11bGF0ZSBvdmVyIHRp
bWUuDQo+IA0KPiBCdXQgdGhleSB3ZXJlbid0IGRvbmUgZm9yIGNsYW5nJ3Mgc2FrZTsgdGhleSB3
ZXJlIGRvbmUgZm9yIHN5bWJvbCBjbGFzaA0KPiBzYWtlLiAgSWYgc29tZSBmdXR1cmUgdmVyc2lv
biBvZiBnY2MgaGFwcGVuZWQgdG8gbm90IGlubGluZSB0aGVzZSwgdGhlbg0KPiB3ZSdkIGdldCB0
aGUgc2FtZSBwcm9ibGVtLg0KPiANCj4gU28gaWYgeW91IHdhbnQgdG8gdGFrZSB0aGlzIGFwcHJv
YWNoLCBJJ2Qgc2F5IG1ha2UgdGhlIG5hbWVzIHNvbWV0aGluZw0KPiBsaWtlLCBgaW5saW5lX3N5
bWJvbF9jbGFzaGAuICBUaGF0IHRlbGxzIGZ1dHVyZSBwZW9wbGUgZXhhY3RseSB3aGF0DQo+IG5l
ZWRzIHRvIGJlIGRvbmUgdG8gc3dpdGNoIHRoZW0gYmFjayB0byAiYmFyZSIgaW5saW5lOyBhbmQg
aWYgd2UgbmV2ZXINCj4gZ2V0IGFyb3VuZCB0byBmaXhpbmcgdGhlIHN5bWJvbCBjbGFzaCBpc3N1
ZSwgdGhlbiBpdCB3aWxsIHByZXZlbnQgZ2NjDQo+IGZyb20gImRldmVsb3BpbmciIHRoaXMgaXNz
dWUgYXMgd2VsbC4NCg0KT2gsIHllcywgZ29vZCBwb2ludC4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
