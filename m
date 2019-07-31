Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382807BDAF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 11:49:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hslBs-0002ES-Bg; Wed, 31 Jul 2019 09:46:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hslBr-0002EM-6g
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 09:46:35 +0000
X-Inumbo-ID: 126a376c-b378-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 126a376c-b378-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 09:46:33 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 09:46:28 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 09:30:52 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 09:30:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/XA1Pvo6JCxiT4xdtOgIzpcClw+bPyp2DBAsbSDx6KlnpwHxSAadWB4+t3jnWPbS219fbrAJ4LFkvzOcyIay71WSMjihul9N2nuvU6/5SaJKyQrD3UUY6i0KLflj8ClpX8DtISYT5Jw4H7pA6qzS5fiElEON3exQN729+v6MjgMG3HTBfHsggW3dMMS55a/MXdclVHd2FGUMCsKWiGizg+9MOdar4uXZtI7aopIcnTcY4meT9vhRTQR6U/9FJpLPcDhAKGZgUWX0kzsUDrUjX8aDguuc2h+5B23DNff7TnkFPRESYKfpaGgEf+yujNwg9To6vYQeXaR4GEvbec9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCiFNgdGUjCIkVMxHJ+vosTGrmQ/JoAwuqDOhDRywvU=;
 b=X9wbwJNq06HC++v5VQni9/a7ltS51bF3HlKmoBaSv49kglpL5f7PqTSr9bmaVWEcAq9nTJsm0uVOaA08edRW/GXq2oDjiDdqGAYBjudRpmYk0rjdxb9SqyyabYnU+X15eUGbLeto1zjt0yiiOA8Od3KT57a8DBQIyJdf9qIBdmNZkxNCtsV4BbCvNbh3zxGFx/fAPOiV7GZoJ/gUUo+2IUPQ9VPJmq4U1gpWgaGHq8Pc7oXZm5JkkIpcFTA2RcXaVjJ50Uba2dsm4WXF4Z8vh4/a1snPe/LDWcZvjnvJJ0er8n6SzaCKUvsuf0XqFIwY5tTw6lu5Kxpt9D2ywNYx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2380.namprd18.prod.outlook.com (20.179.71.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Wed, 31 Jul 2019 09:30:50 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 09:30:50 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik
 <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAADYpIAABBtqgAACZwCAAAP3BYAAA38agAQHi4CABvFPpYAA9HeAgAAG9myAAAjUAA==
Date: Wed, 31 Jul 2019 09:30:50 +0000
Message-ID: <b7d2ee89-9a75-424d-a1c5-78e0a60b9479@suse.com>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <f2d4b51f-b2b1-abad-8040-ad5de26f5b5b@citrix.com>
 <CAMmSBy909uERFmH9=pMqpZkr=Bb7-TVMZiFRarvzV57+=QcK8w@mail.gmail.com>
 <bf7515bb-3c4c-59e1-557a-d3f0106c5609@citrix.com>
 <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
 <81416abc-e5f5-76de-a34a-87412e125e64@citrix.com>
 <CAMmSBy8kJbt8wdJ2u+nO+FXphtNrdikOeKtMJ6tu45hDv8OeQQ@mail.gmail.com>
 <4646f3e8-6291-7d98-2550-8ab207ac675e@suse.com>
 <CAMmSBy9LTN8LjLGyfTO9g80OdP4ew0ZHj1GGFfAkt5oAKEHPKA@mail.gmail.com>
 <52afea81-33d3-7120-af72-2987bb634f08@suse.com>
 <f161e7b4-38a2-c3a3-4a04-167c3631db8c@citrix.com>
In-Reply-To: <f161e7b4-38a2-c3a3-4a04-167c3631db8c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:6:14::35) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa60173d-8c1b-4ca5-a1ee-08d71599c6d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2380; 
x-ms-traffictypediagnostic: DM6PR18MB2380:
x-microsoft-antispam-prvs: <DM6PR18MB23805038F11BF4794E99A3A6B3DF0@DM6PR18MB2380.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(199004)(189003)(31686004)(7736002)(6116002)(305945005)(107886003)(2616005)(3846002)(446003)(71200400001)(68736007)(71190400001)(5660300002)(6246003)(25786009)(11346002)(14454004)(52116002)(102836004)(4326008)(76176011)(386003)(6506007)(53546011)(99286004)(26005)(8936002)(186003)(31696002)(36756003)(486006)(86362001)(53936002)(256004)(80792005)(66066001)(81166006)(6486002)(2906002)(81156014)(478600001)(476003)(54906003)(229853002)(66946007)(6512007)(110136005)(6436002)(8676002)(66556008)(64756008)(66446008)(66476007)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2380;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VQeJrPp/f5Xu4T/loQWY4SHo+EfV8REUcj1DAw385DWrXxra91I5xfQ9pANr8EeliyTWuk+weEVgfB3mS93dDM44pfqJYNtU4dNhSieTRn2Ku3EiPJnTPXFigNIKULSB6KlUV9Fv6aGygutr5/i3eKm03rcOUINuaKPvq3quI88flxouhPpCXXpLg93gkJ7YIlO8k6LXXlLUjd65tXZiQqiezxu8keSrnW79bUjRb/Qe0LJtSCstBcVRVgwujZPrWcpfTzTkamXWFSvvfMn6oRlf/wiToe+nPa0JU6PAIB54LGRr/1+rYODUilqxTpeSklYY23q6ZC2SNz921p78Ou8Qsh7WG4zadxai6HwhopgqBHXgU51pQ+T4ULt66a6CDrulotwh/sge+2KvMJJWZKi8sAXf6E5XZzLeMRYJ+IQ=
Content-ID: <69F4E8A597749840838242FD9EFE9F6B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa60173d-8c1b-4ca5-a1ee-08d71599c6d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 09:30:50.7740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2380
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDcuMjAxOSAxMDo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzEvMDcvMjAx
OSAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAzMC4wNy4yMDE5IDE5OjU2LCBSb21h
biBTaGFwb3NobmlrIHdyb3RlOg0KPj4+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDE6MDYgQU0g
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4gT24gMjMuMDcuMjAx
OSAyMDoyNSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToNCj4+Pj4+IEludGVyZXN0aW5nbHkgZW5v
dWdoLCBhZGRpbmcgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmc9MSBBTkQgaW9tbXU9ZGVidWcNCj4+
Pj4+IGJvb3RlZCB0aGUgc3lzdGVtIGp1c3QgZmluZS4NCj4+Pj4gQnR3IChJJ3ZlIG5vdGljZWQg
dGhpcyBvbmx5IG5vdykgLSBhcmUgeW91IHNheWluZyB3aXRob3V0ICJpb21tdT1kZWJ1ZyINCj4+
Pj4gdGhlIGJveCBkb2VzIF9ub3RfIGJvb3QgZmluZSwgZGVzcGl0ZSB0aGUgb3RoZXIgb3B0aW9u
Pw0KPj4+IFllcy4gQnV0IGl0IG1hZGUgc2Vuc2UgdG8gbWUgc2luY2UgaW9tbXU9ZGVidWcgKGFz
IHBlciB5b3VyDQo+Pj4gZXhwbGFuYXRpb24pIG92ZXJ3aGVsbXMgdGhlIENQVSBhbmQgSSBndWVz
cyBhZGRpbmcNCj4+PiBpb21tdV9pbmNsdXNpdmVfbWFwcGluZz0xIGF2b2lkcyB0aGUgY29kZSBw
YXRoIHRoYXQgZG9lcyBpdD8NCj4+IEknbSBhZnJhaWQgSSBkb24ndCBmb2xsb3c6IE15IHF1ZXN0
aW9uIHdhcyB3aGV0aGVyDQo+PiAiaW9tbXVfaW5jbHVzaXZlX21hcHBpbmc9MSIgYWxvbmUgd291
bGQgbm90IGFsbG93IHRoZSBib3ggdG8gYm9vdC4NCj4+IFdpdGhvdXQgImlvbW11PWRlYnVnIiB0
aGVyZSdzIG5vIGV4Y2Vzc2l2ZSBsb2dnaW5nIGFmYWljdCwgbm8NCj4+IG1hdHRlciB3aGF0IG90
aGVyIElPTU1VIG9wdGlvbnMgeW91IHVzZS4NCj4gDQo+IFdpdGhvdXQgaW5jbHVzaXZlIG1hcHBp
bmdzLCB0aGUgc3lzdGVtIGJvb3RzIGJ1dCB0aGUgc2NyZWVuIGlzIGp1bmsgYW5kDQo+IHRoZXJl
IGFyZSBETUEgZmF1bHRzIGFsbCBvdmVyIHRoZSBwbGFjZS7CoCBXaXRoIGluY2x1c2l2ZSBtYXBw
aW5ncywgaXQNCj4gYWxsICJ3b3JrcyIgZmluZS4NCj4gDQo+IFdpdGggZGVidWcgZW5hYmxlZCwg
dGhlIERNQSBmYXVsdHMgYXJlIHNwYXQgb3V0IHRvIHRoZSBjb25zb2xlIGZvciBhDQo+IHNob3J0
IHdoaWxlLCB1bnRpbCBhbiBBUElDIGVycm9yIG9jY3VycyBhbmQgdGhlIHN5c3RlbSB3ZWRnZXMg
Y29tcGxldGVseS4NCg0KUmlnaHQgLSB0aGUgdmVyYm9zaXR5IF93aXRoXyAiaW9tbXU9ZGVidWci
IG1heSBiZSBhIHByb2JsZW0uIEhlbmNlIG1lDQp3b25kZXJpbmcgd2hldGhlciB0aGUgc3lzdGVt
IGluZGVlZCB3b3VsZG4ndCBib290IF93aXRob3V0XyB0aGF0IG9wdGlvbi4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
