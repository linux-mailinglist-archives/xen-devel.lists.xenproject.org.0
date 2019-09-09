Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456DAD7DF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7HlU-0000ZQ-O5; Mon, 09 Sep 2019 11:23:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cFqR=XE=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i7HlT-0000ZL-0R
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:23:23 +0000
X-Inumbo-ID: 3ab72554-d2f4-11e9-ac0a-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.94]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ab72554-d2f4-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOuOAz/g9pCRee91HDaDfjxa0/GK0iLJ6G9P7F539fug6JF6O1AziomgylpBI2yH/ztHBFJRBABscQdToHKE652JLmzH1xNVx/mbFfoDWpl4Ey4xkhIDCbIjg35rdHcQJwkp5zzBT+ZWkrm3X3WeXpuJj+vU02U8fFuugWEtqyQlsN14+I1cpX5yeUXaQ1PmsKqRj7SrNvDf6FBVRaZKkGIubDmFU2K8zGkUCLpOEGLZ/xj8UtSFPWAYk9/O6D6CGkdtVegKarKHB+6neK23590O3ZXrrRKVFb8SIVNh6lYT3SGqO7u8BRbAY3tGeORlZGbe5+vXxedayDtFPwsjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd7DfyOVo6OStIuT1k3YptRZPoQFW52UTj17mJG5Exw=;
 b=JZ4+EUvckHBDzzKAcokHN1dRTSpDYPdmVQ0vsN+04K9NwpnchStEX70s11xyT3H6TaFRv94kvbR63xPPoN5YvBEQ83XftCI42R6gNl4Lij+zJysClYFSyd87uNLs6fbiFnLXcdRsLGZHEnSebc6VyRyTmLaSJW4KoJGP3DMtUM+kW6O7c1F3CHjr1YyK1Pi2Fr+bbrtmCCBw61uQwC/1bEzXHQpN9eV+gTSsk0f/hWyHgxYjIM/iwVuFsewz96WxHZhAICNc6NtQQIf3Qyfpddy2vYBaktZxZ7Dfc3o6RUoslKqPPtBLiB0VMF/A1Gt3btMN5dYV47H6Vq6FBljZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd7DfyOVo6OStIuT1k3YptRZPoQFW52UTj17mJG5Exw=;
 b=QE9soIw0vCO1gCvWZz37piT6inEzdo7kztaKxOBE4smXNlX7NdITuRwtBniOgib3trRBrZbONMXmcojsQnBbxShCihVoSAZWpRWBIxXg69+/t+5kgshpS0FOd1w+DMqYIN8utQMQuG6WA7n5jJbq05oyuJtjw3u3xQycnFaAgCY=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5800.eurprd02.prod.outlook.com (10.141.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 11:23:19 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 11:23:19 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVYmAUwzAuH5cfgUOJUZVAs8B/2acez52AgASJFgD//9szgIAANjGA///Q5gCAAAI2gA==
Date: Mon, 9 Sep 2019 11:23:19 +0000
Message-ID: <43ee49a9-23dc-495f-3cf2-7c75b7576e9d@bitdefender.com>
References: <20190903140112.18806-1-aisaila@bitdefender.com>
 <569c7674-4c6e-765a-4071-884bca7d0412@suse.com>
 <7fca65bb-8936-b8c9-80df-3be4675c7b42@bitdefender.com>
 <047d5951-c922-8111-aa39-2bb0bebc5721@suse.com>
 <749faa64-7b23-0149-ca0f-00ebd2754943@bitdefender.com>
 <9de8e959-139b-29cd-c4b4-24713106f71f@suse.com>
In-Reply-To: <9de8e959-139b-29cd-c4b4-24713106f71f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::39) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 355a3e3f-cb33-4e2f-5522-08d735181e14
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5800; 
x-ms-traffictypediagnostic: AM7PR02MB5800:|AM7PR02MB5800:|AM7PR02MB5800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB58006A99725A69ED624D890CABB70@AM7PR02MB5800.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(136003)(366004)(346002)(51914003)(199004)(189003)(6916009)(14454004)(86362001)(54906003)(8676002)(102836004)(99286004)(476003)(316002)(2616005)(81156014)(186003)(76176011)(31696002)(6436002)(26005)(486006)(256004)(25786009)(4326008)(6486002)(36756003)(71200400001)(66446008)(305945005)(229853002)(64756008)(66946007)(81166006)(52116002)(2906002)(5660300002)(386003)(6506007)(53546011)(7736002)(3846002)(6116002)(66066001)(11346002)(6246003)(53936002)(478600001)(6512007)(66476007)(446003)(31686004)(8936002)(66556008)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5800;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DgF6pM0LrqdRi1aacJQUlT2UphmT7XM9OTShUer5YSkMYlxybAtaXzgXmwtqMaTdkfu6JMF31k1E4hTYDNwB5OoaJrEG0F0Yt738RNpMc6OvqEsbMk0iROD7xLJ86Z7AL5bx9N8IXEtUglTh5ABfT5nNvFvV578HemnfoBlCE6j6V43UCOALNpFdSR6p6C59TJ14qyMyt+7t4b0EQgQv8j4SdoV3iHMxSbMKy6d14xe9KIUwsUeGrl+1RsgwS3k1CP2OnFGAvhP/4p2vhPCNOvAeg//qHYoW+sL2NvHgR/fi8TlclVxO4y3JAvtrVKTxLJUcUY5vwBk6dvdz7Kzx9RiUJ6IRlHSdSuGkZBXczqm2LdrVfre5LBR3/1GifMlvMgKKHH2t3QCAKC1/R1UkAFoze6IvfdW790A7E8hlYSA=
Content-ID: <6C261D9BBF81D84FB776D5506D7DA574@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355a3e3f-cb33-4e2f-5522-08d735181e14
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 11:23:19.7391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7kakocCBJlvmud+2XBLOWr+QdOkfzwHC+ZVsy8pGJV3CAFtVJ0OmqYsJ8XUJKf/TI2jKuE6kll6ni+bDZMWoibVWpy+NjDCzCDwW5il6UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5800
Subject: Re: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA5LjA5LjIwMTkgMTQ6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wOS4y
MDE5IDEzOjAzLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MDkuMDkuMjAxOSAxMzo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDkuMDkuMjAxOSAx
MjowMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IE9uIDA2LjA5LjIwMTkg
MTg6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDMuMDkuMjAxOSAxNjowMSwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+Pj4gICAgICAgICB9DQo+Pj4+Pj4gKyAg
ICAvKiBDaGVjayBpZiBlbnkgdm1fZXZlbnQgd2FzIHNlbnQgKi8NCj4+Pj4+DQo+Pj4+PiAiYW55
IiBhbmQgcGxlYXNlIGFkZCBibGFuayBsaW5lIGFoZWFkIG9mIHlvdXIgYWRkaXRpb24uDQo+Pj4+
DQo+Pj4+IEkgd2lsbCBjb3JyZWN0IHRoaXMuDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4+ICsgICAgaWYg
KCBlcnIgKQ0KPj4+Pj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4+Pj4NCj4+Pj4+IEFuZCB3YWl0
IC0gd2h5IGRvZXMgdGhpcyBzaXQgYWZ0ZXIgdGhlIGxvb3A/IElzIHRoYXQgYSByZS1iYXNpbmcN
Cj4+Pj4+IG1pc3Rha2UgZnJvbSB3aGVuIHlvdSBoYWQgcHV0IG9uIHRvcCBvZiBteSB1bmNvbW1p
dHRlZCBwYXRjaD8NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBkb25lIHRvIHNraXAgdGhlIG1hcHBpbmcg
cGFydCBkb3duIHRoZSBsaW5lLiBJZiB0aGVyZSBpcyBhbg0KPj4+PiBlcnJvciB0aGVuIHdlIGhh
dmUgdG8gcmV0dXJuIF9pdF8gYW5kIG5vdCB0aGUgbWFwcGluZy4NCj4+Pg0KPj4+IEJ1dCBhZnRl
ciByZS1iYXNpbmcgeW91IGNvdWxkIChhbmQgaGVuY2UgaW1vIHNob3VsZCkgImdvdG8gb3V0Ig0K
Pj4+IHJpZ2h0IGZyb20gdGhlIGNvZGUgYmxvYiB5b3UgYWRkIHRvIHRoZSBsb29wLiBXaGljaCB3
b3VsZCB0aGVuDQo+Pj4gYWxzbyBlbGltaW5hdGUgdGhlIG5lZWQgZm9yIG90aGVyICJlcnIiIHJl
bGF0ZWQgYWRqdXN0bWVudHMgeW91DQo+Pj4gbWFrZS4NCj4+Pg0KPj4NCj4+IFNvIHlvdSB3YW50
IG1lIHRvIGhhdmUgdGhpcyBwYXRjaCBiYXNlIG9uIHlvdXIgKHg4Ni9IVk06IGNvcnJlY3QNCj4+
IGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkgZm9yIG11bHRpLXBhZ2UgY2FzZSkgcGF0Y2guDQo+
IA0KPiBObywgZXhwbGljaXRseSBub3QuIFRoZSAicmUtYmFzaW5nIiBJIHVzZWQgYWJvdmUgd2Fz
IHJlZmVycmluZyB0bw0KPiB5b3UgaGF2ZSBtb3ZlZCBhd2F5IGZyb20gYmFzaW5nIHlvdXIgcGF0
Y2ggb24gbWluZS4NCj4gDQoNCk9rLCBJIG1pc3VuZGVyc3Rvb2QsIHRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uLCBJIHdpbGwgaGF2ZSB0aGUgcGF0Y2ggDQptb2RpZmllZCBhcyBJIHBvc3RlZC4N
Cg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
