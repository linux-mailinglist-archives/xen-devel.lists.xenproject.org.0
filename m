Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AAA306148
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76275.137571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4o3W-0003eI-BC; Wed, 27 Jan 2021 16:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76275.137571; Wed, 27 Jan 2021 16:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4o3W-0003ds-7J; Wed, 27 Jan 2021 16:52:34 +0000
Received: by outflank-mailman (input) for mailman id 76275;
 Wed, 27 Jan 2021 16:52:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VX0j=G6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l4o3U-0003dn-5U
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:52:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13bc8e1c-4fce-4889-ac31-6f0314d724da;
 Wed, 27 Jan 2021 16:52:31 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 13bc8e1c-4fce-4889-ac31-6f0314d724da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611766351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WgdyDG90oeBXwUU/+HmgLD8LTuItN8BaVe5Im/WS/NA=;
  b=bqEvVyZAPVTC+uTTQseXP2LUG+ykAYISmnqgo3pkTWX8rKM5Z42dApen
   JCaVKg9BO1AD334MJ5/voC59Zo1vQdua3oP9K3XO9he9oobBK7CGhWKZL
   ylNXcXUP63h53A0+ZJUA0XmubboFfeOvZrfVY8+qHbYVjUZVpuYEvW1bT
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LAgSsF5QRFnB9TgASM9wwVOXFV+KVt8dI/ZaFpesEQqyTueJS69BkHQ4IlAFl/l3ZgqCnC4RmH
 s0xK0M2G+oOJ00vqmZjp/FOEbvQxhYFZi5+l85fgtr9fXdWMS0Xu6RBNZoP5lyJU/yk19KB2BZ
 /tN/nHxS7Uvwa4I8uAwT+KMv0aLwsdtIJJxOWhsC1fIdyh/0bUeZnQyQeay/KVxwNKyFerZF6/
 y9yIUtrrneD4gtuec0TqWHxzIBf3ZlMGz8ys4D+9opxipbszAvjFVBMMdIgm7M2d6SqlBn0U2e
 ffs=
X-SBRS: 5.2
X-MesageID: 36025645
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="36025645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhoODZRTKr76O0yCIw44ZhlYTqowh8AFfA8mFMbaKhm1yaUH4izjb7qBA8WEAW2hyA+mv3cao+JLreUddB78rUKR2iHxTteRLRoPbH4yyiq+CwRt+UPLRsbI0hHG/p8a4N2pdT8S2EAupd21nYU0tJdCzK3NzXjfHQk3Gc9L0/eJ755q7kPeI74/XSq2DSx/yYA1xHEHtihkBOJ7AfCKuUUVG0nKcyoVYthpCmV4bhlmAObCAeCzIlltpK8o6ioqU+c/tGtIzQWbnMY58PegHcH7H7vGdW1/4Ikgcm0B6sKpB4fCJm5NV6UCH7YzeE5qODhZOOuJn7gsVTZ0L5crSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgdyDG90oeBXwUU/+HmgLD8LTuItN8BaVe5Im/WS/NA=;
 b=knsk/Rmyx2mxeY0vlFwFLujCcKpTVviSidz2XwGGdJT7wKCYYvdQVVivV/fX2nDbUwtOqjaIPyzb0WITrbQ2+gT/BL80GssxnL7Hy8HIremGUMfIIEmeTNJYkEV5BMRT6EmO++T3us7hLCVKFCV7iHEiN5AWNKlAOGIEy1XVLSW0ToUO+vHkXFK09nUsQYVMj2CuO5geatihDAWAUNd9a9l5V4lp27nOeaGhrPk1TEUR89wJJOVZwEJct8T4l/GrjJCVOJSHbJ/Dd4h222g2x/mYDnqHm4fz7NNl8wxKmkbdS2WYjNnWT0FuD4tlUI6b7HFKCMzIlQsaukmXxyn8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgdyDG90oeBXwUU/+HmgLD8LTuItN8BaVe5Im/WS/NA=;
 b=so+rbH8d2Cpud/daOqzr1eDoa/aQbzw8fDX4MHjCbpRQGPz3zSVD18DbE1JmOOw6KCFcxu7THdLdUV01HzURajMZ6ZiL6KR/q0RbH2+g0P+Q2ilKVc8X6q7wbCSJ08g/zHx816GPdRKt13iVeyRfXKZlOq+Wn60+RzQOLRf+W+M=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Manuel
 Bouyer" <bouyer@antioche.eu.org>
Subject: Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more
 messages]
Thread-Topic: [PATCH] Fix error: array subscript has type 'char' [and 1 more
 messages]
Thread-Index: AQHW9LPLLE/yNMSfZ0ieExDVLla+Qqo7iUyAgAAeRYCAAAL2gIAABaeA
Date: Wed, 27 Jan 2021 16:52:28 +0000
Message-ID: <0280E0D7-5094-4D89-A938-C9270260C927@citrix.com>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
 <20210114122912.GA2522@antioche.eu.org>
 <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
 <20210114141615.GA9157@mail.soc.lip6.fr>
 <20210126174415.GA21858@mail.soc.lip6.fr>
 <24592.22685.67161.585056@mariner.uk.xensource.com>
 <2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
 <27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
 <24593.28738.216430.891500@mariner.uk.xensource.com>
 <d3796603-20a7-2c81-a446-0d0a75cd52d5@suse.com>
 <24593.37649.81543.442376@mariner.uk.xensource.com>
 <2bdd894f-e966-7943-c5ec-fe45ef7227e7@suse.com>
In-Reply-To: <2bdd894f-e966-7943-c5ec-fe45ef7227e7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a179633-010a-4276-444d-08d8c2e3ee3a
x-ms-traffictypediagnostic: PH0PR03MB5814:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB581407F7FE737F25F97FEB5899BB9@PH0PR03MB5814.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hA3TLOKfB57qsa8avlrRLsVZJ/AMRoYG8jHmS0W/Oz3W99M/7/s6BBCZTa+Dlhpe4HuZF42ky1AgS5wdoi3JqN/3Nii0jeME0BAK9TuwF7W/iBPggmb/18TXhplp/gbrmDR9cKWQiKMuAn/ZCuCb+e4dUfaYoBxri9eINIJHI1xC8/gZyNTv4HBh1skRQBaUL3M7mciI2M5ek2oCODQkQV8Fv2REEH8CW9T7K/3ELh8v++97aTGuKo+myNXi1FapMbDTa56mQ1IzfXUil1x1MxDuWdGOmsnIQQNDItNuJzslQlAqtx1neXF7Y8XQ9qSzL4/Uw5+mfqlO6feWxSA6Wz4XQq8ZtdRYgjr7MbdLwdnnvL45IsDcaPaaf6U1MejAa/Mg9Bs5PGRtkNAC2WyZvybhJ6RzJy/++T2IL4DF9ixMGx6CeL9ngsX8b2p4PHynZvyRT05hUS7YJVgDZ3Tee2TwaITfmFFOjwThZE5ssMvUopmAqotsSZDuLklUkun3weUnStP9LK9271yyAnsZYA3ZI/Or/p8u+GiBZdd7MvXsLIG8+2j83ZrgUOwOQUIJfJ9pVbLX4cY0PJmQbwh+rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(66946007)(76116006)(91956017)(66446008)(8936002)(64756008)(71200400001)(36756003)(66476007)(8676002)(5660300002)(66556008)(33656002)(6486002)(2906002)(4326008)(15650500001)(83380400001)(26005)(6916009)(2616005)(54906003)(6512007)(316002)(478600001)(86362001)(53546011)(6506007)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YXA1VlE1ekpHOElXdUp0dkJ4Y2IwdVI3WTdsY0JzdFArYVE4ckNJd3RrbFIy?=
 =?utf-8?B?YVFIL0dwNjU1YVFMWGdrblpvS1BqbGtjRS8zSUhEMHlUaGkzQWRHRFU3ZlU4?=
 =?utf-8?B?bnBXRmhyTDNETFZUd0V6L2Z2N3I0MjJTa3UrVmpFM2pBamZidXN3SE1CN1Q3?=
 =?utf-8?B?U0FzaDg1S1FXa0dkN1M0cWpxVFB5a1hzNStiaEZSUWVxN0ZYbXRyanVrM3B2?=
 =?utf-8?B?ajFHREhrZkYrOW9JR1N0djJNRVA4K0J5dkNQWTRoTzBwSVJDRktRbTFuUlJN?=
 =?utf-8?B?ZmxrY21RSE94TDJXcGJadlNQRXN3dEtEMGNkNHFvRSs3WmQzM1lIRjYvT2JG?=
 =?utf-8?B?MytxRzJ2UWg5MllKRC9QT2ZpL1BsMk9SM3IrdHpNaVdVdVNsc3BLSkZGUjBo?=
 =?utf-8?B?SkdNWGVoZGNpcDYrVElZNmZSTjRZTnM5TnAzTGs4a3V2endMa3MvYmhGSVFF?=
 =?utf-8?B?UlREU05ZSmVlNGRzRUFXQTFKUHloKzlLbnd6SnA1Y0Z4RThUVHJCSXM0bXFH?=
 =?utf-8?B?SlFqdEJmMFliOEZISzA4MWJCdjNlWS82Q0lsR3pHbkxodVF0RE5Tb3oyb25o?=
 =?utf-8?B?Y0JkWWwzMTFCcDNWcFowZHA2MkFPckdoMUxobEozMlBOek10d2txT0NaM3V2?=
 =?utf-8?B?by9yWldDR0t6ZEgyNythREJiOE5hOXVtaW5sSkxtNkpPU1hsclRGZGE2TGlo?=
 =?utf-8?B?N0NOMk5ITkYwcW5PWjIrd2xkdVo1RHh1TEhIVkt1UmM0OXNCMjMvYzJpTUt6?=
 =?utf-8?B?QmpZVHQyWVMzL1hlL2NHSE41eEcyNk4wV1RUMnlDS3F4ck5oRVVldnVLWjBm?=
 =?utf-8?B?Qk5DTXoxM2NlRU1WRTQ3TDNVZnNydFdaVEhjV3l6VURCMWpWRUF6bURvcVRJ?=
 =?utf-8?B?V29oSVVlRE1JdGw4M3VHTU9QazczZWFBU2lzbUxxUHlMMG1QRmVMWEQvZDI2?=
 =?utf-8?B?enlUZFJWMnFiT3FZOXVtdFpSbCt4cmZnTkhSa0tTa09qQnRVUjNsdUhsSGwv?=
 =?utf-8?B?QlNVZVRySHNsYmlPdnlRUk5EWW1QL3VqM2ozYUZObHFWMzc2eW9TRkVPQnJH?=
 =?utf-8?B?dnY5TnFWbk9RdjFEY25Bc01OZC9QQm5SQmdyeEIrZlNIT1lDTHArcHFSdGZS?=
 =?utf-8?B?Y1FEeFk3QUJVL2d6dkU3MlA5ckRsRDZOQ0x4ckJ3NHVYNll2SGh2T0pPS0x5?=
 =?utf-8?B?UFJyc2lmMFdLbGlGTlc0RFA3V1FFU0lUVWdtdWUxNDQvaXNqUlQvS2tzbW5n?=
 =?utf-8?B?dFA2Z3N0ME9wbVZ2aVZKYzVyZm02TUx6Nk8zaDhuWmhMUFd2ZUw4RjZOd1NB?=
 =?utf-8?B?V3FHNmtHMEN0bWU0WnpnVEE1MEpIWGZXUm9yVGtOdjhTQWVNem1pajJ0eXM4?=
 =?utf-8?B?NXRIMEFSUkdESCtDNjJrdnpMdFFqc205bVRRSlQ3Mm5TWEhuc2IvbWJmaUhm?=
 =?utf-8?B?ZVorcUc4U05WZldBNkNLc0xSdkZqYm5CL1Y1QkNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F741E17890D1E743BD42DDF6254D6374@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a179633-010a-4276-444d-08d8c2e3ee3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 16:52:28.2120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyDRD3rbqD9115SSQytyc3180UsoX05HuJrfy4oR5k55APynBYrjykEwlReb+1kSOcD/9C9tV0UTXgfpAwbSGYveZA2MLPBRZ3IRX3X6irA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5814
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSmFuIDI3LCAyMDIxLCBhdCA0OjMyIFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjcuMDEuMjAyMSAxNzoyMSwgSWFuIEphY2tzb24g
d3JvdGU6DQo+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENIXSBGaXggZXJyb3I6IGFy
cmF5IHN1YnNjcmlwdCBoYXMgdHlwZSAnY2hhcicgW2FuZCAxIG1vcmUgbWVzc2FnZXNdIik6DQo+
Pj4gSSBkb24ndCB0aGluayBJJ3ZlIGV2ZXIgY29tZSBhY3Jvc3MgdGhhdCBwYXJ0IG9mIGEgcGxh
dGZvcm0NCj4+PiBBUEkvQUJJIHNwZWMuIEluc3RlYWQgbXkgdW5kZXJzdGFuZGluZyBzbyBmYXIg
d2FzIHRoYXQgZ29vZA0KPj4+IHBsYXRmb3JtIGhlYWRlcnMgd291bGQgYmUgaWdub3JhbnQgb2Yg
dGhlIHVzZXIncyBjaG9pY2Ugb2YNCj4+PiBjaGFyJ3Mgc2lnbmVkLW5lc3MgKHdoZXJldmVyIGNv
bXBpbGVycyBvZmZlciBzdWNoIGEgY2hvaWNlLA0KPj4+IGJ1dCBJIHRoaW5rIGFsbCB0aGF0IEkn
dmUgZXZlciB3b3JrZWQgd2l0aCBkaWQpLiBBdCB0aGUgdmVyeQ0KPj4+IGxlYXN0IGdjYydzIGRv
YyBkb2Vzbid0IHdhcm4gYWJvdXQgYW55IHBvc3NpYmxlDQo+Pj4gaW5jb21wYXRpYmlsaXRpZXMg
cmVzdWx0aW5nIGZyb20gdXNlIG9mIC1mc2lnbmVkLWNoYXIgb3INCj4+PiAtZnVuc2lnbmVkLWNo
YXIgKG9yIHRoZWlyIGJpdGZpZWxkIGVxdWl2YWxlbnRzLCBmb3IgdGhhdA0KPj4+IG1hdHRlciku
DQo+PiANCj4+IFdlbGwsIEkndmUgY29uc2lkZXJlZCB0aGlzIGFuZCBJIHN0aWxsIGRvbid0IHRo
aW5rIGNoYW5naW5nIHRvDQo+PiAtZnVuc2lnbmVkLWNoYXIgaXMgZ29vZCBpZGVhLg0KPj4gDQo+
PiBBcmUgeW91IE9LIHdpdGggbWUgY2hlY2tpbmcgaW4gdGhlIGN1cnJlbnQgcGF0Y2ggb3Igc2hv
dWxkIEkgYXNrIHRoZQ0KPj4gb3RoZXIgY29tbWl0dGVycyBmb3IgYSBzZWNvbmQgb3BpbmlvbiA/
DQo+IA0KPiBGb3IgdGhlIGNoYW5nZXMgdG8gdG9vbHMvIGl0J3MgcmVhbGx5IHVwIHRvIHlvdS4g
Rm9yIHRoZSBjaGFuZ2UNCj4gdG8geGVuL3Rvb2xzL3N5bWJvbHMuYyBJIGNvdWxkIGxpdmUgd2l0
aCBpdCAoZm9yIGJlaW5nIHVzZXINCj4gc3BhY2UgY29kZSksIGJ1dCBJIHN0aWxsIHRoaW5rIGFk
ZGluZyBjYXN0cyBpbiBzdWNoIGEgcGxhY2UgaXMNCj4gbm90IG5lY2Vzc2FyaWx5IHNldHRpbmcg
YSBnb29kIHByZWNlZGVudC4gU28gZm9yIHRoaXMgb25lIEknZA0KPiBpbmRlZWQgYXBwcmVjaWF0
ZSBnZXR0aW5nIGFub3RoZXIgb3Bpbmlvbi4NCg0KTXkgdGhvdWdodHM6DQoNCiogT24gdGhlIHdo
b2xlLCB0aGUgcmlzayBvZiBhbiBpbmNvbXBhdGliaWxpdHkgd2l0aCBzeXN0ZW0gaGVhZGVycyBk
b2VzIHNlZW0gaGlnaGVyIHRoYW4gdGhlIHJpc2sgb2YgY2FzdGluZyBhIHZhbHVlIHdoaWNoIGlz
IGtub3duIG5vdCB0byBiZSBFT0YNCg0KKiBTdWNoIGEgY2hhbmdlIGRvZXNu4oCZdCBzZWVtIGxp
a2UgdGhlIGtpbmQgb2YgdGhpbmcgd2Ugc2hvdWxkIGFzayBNYW51ZWwgdG8gZG8sIHdoZW4gYSBz
aW1wbGVyIGNoYW5nZSB3aWxsIGRvIHRoZSB0cmljaw0KDQoqIEF0IGFueSByYXRlIGl0IGRvZXNu
4oCZdCBzZWVtIGxpa2UgYSBnb29kIHRoaW5nIHRvIGV4cGVyaW1lbnQgd2l0aCBpbiB0aGUgd2Vl
ayBiZWZvcmUgdGhlIGZlYXR1cmUgZnJlZXplLg0KDQogLUdlb3JnZQ==

