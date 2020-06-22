Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9AB203885
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:57:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMwL-0001ra-3J; Mon, 22 Jun 2020 13:56:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+IWF=AD=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jnMwK-0001rV-8f
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:56:48 +0000
X-Inumbo-ID: 35c2e3f2-b490-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35c2e3f2-b490-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 13:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjnlQGT/4MyDDRhMG7nIDtyNWZUrrTTJxm2pSio3Zp2MA5J685t3VgoSE4cX6u8Jc7Go0lmunweqAkSF9SIq8digfnVnmqD4On/2uiIEsATKuneEhUcmQbRmzvsnAqK9FqBUIIQzQH96yqu5Qxsas72COZ4hCPFqoak0h1683U4OchzNVIL06H9cYbeD7tdLBtxrFrrGCX6V45Wt0x5SADkv0f1pCVeXTNR/HDvP3/CYfSpjdBmbgVAqfxkkSKDcB3ecNR9U36qrOsElZAQr8JbDT4k1oyCt9Pm+POs/8hTkO4ZI9z0jWMUWewk24uIHKgWfgLWdCqQYYRvPqGVv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVOvB/yzooCwwq6oZQ6CQdZJZH/l+WZowYVZ+GbFVzw=;
 b=fo5FhVZbBz2hXogf1hqb7bwmTjRsaGjjwjcGNLLVZTf7uQRPR94PriN3la89c/K8ApUnRqHH7PrebhN3nk7txaf/1U9Ujxynnl69JTPGIiRy/QyWaJyGuSwk5G4fpnazAYkrtAfTSjejnWXSrNu0Ngxvn1FJzx89MG4kAdE/h6MlAwkzqU683sT016OFJxwxsExMWafbXpZVQVwg8JjF+JSDeWpph1HXiPWMzykC+/i+boC6IrFheCMErtm1cGlSYFLQJY62osgnZR87BAV9HO4O6SZynqfNGA4vMxTmvYlpLO6aS3D6fAYgv2QSOZZPc3DiC0RvyA2tMvrQh5fPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVOvB/yzooCwwq6oZQ6CQdZJZH/l+WZowYVZ+GbFVzw=;
 b=FmL3DEUgSNybcl3hVdO2YnrWXJ2DplMssYZCXgFu5l86jkA4Pnd3GItBgIAzRybOrSidljNtnJ8+wEXgBK3m5Qkpsi860TqJ4yMd/SRPlcgvWjPJ3x9rdxFEUYBm898yDAOIU2LRwM2KUcPuKxMZVlhRgs5iP7z44T3nyaJUvQlO2VtvYLkI0OaMwCY2Y7bB3YjsncMqVmvl6hTAahdfSSmhavPrW837HVx57LxZw0Rk1obv4WoYdW+lJ5c1RdDOh1f1Or42EsUBhq9/OpTN4y9N98T/KhHa4GkgYFdx4sOvgmwpTGTEj35j1rkjit6jxfmZbKlsxTYWsikBMnJSkQ==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4927.eurprd03.prod.outlook.com (2603:10a6:803:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:56:44 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:56:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Oleksandr Andrushchenko
 <andr2000@gmail.com>, Julien Grall <julien.grall.oss@gmail.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAOXggIAABCWAgAABUwCAAAIogIAAAeMAgAACtYCAAAPKgIAEvpiA
Date: Mon, 22 Jun 2020 13:56:44 +0000
Message-ID: <e0148721-7889-0b77-2f99-568a6150a101@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
 <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
 <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
 <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
 <424cfbdc-0744-fcf7-5bb4-52aca2357df7@epam.com>
 <b3e805ef-fb0d-308c-57fb-e7b78f82a786@xen.org>
 <e40308c0-6a0e-a32c-b36e-ef0620a9b9a9@gmail.com>
In-Reply-To: <e40308c0-6a0e-a32c-b36e-ef0620a9b9a9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.245.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b6bf3f4-be3d-4bdf-569c-08d816b41962
x-ms-traffictypediagnostic: VI1PR03MB4927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB4927B3096237A90E90546386E7970@VI1PR03MB4927.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LGh05987MNo91Cd6mcI+mdaKDDatMHI55V2hMw5VYFGUB0EmKNBDkgEEQkh84PlapfX02T85VBwuGI1LnCt4GLEOj429/f/W/1LwwaelM0dCeiFR3Zf7Gby7mGyrIDuKmgvxaaL1BptobCQtChhf8VpJg/yoDDoYQOJffVRO15pf+3CU6asbKFarTpRBFBbAU9GFP+Zpgwlw9YefgbaeMWG/MhabsBtgOMcRus+SvOks7p1hxR3Nz381LJwqKx35uy4n50uZPSf/EQNvApcGI6KIjAcsX3NuYH55QmzmNOCYhkHk4Fy3QSxL+zGJZ91k+mw9SCpLgWG3HD8H5U4mLmGhAglW2Vkk7nmwC/4BC8a/Vt/1g7lVVITZgpllI9NC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(2616005)(6486002)(86362001)(8936002)(31696002)(8676002)(5660300002)(64756008)(66446008)(66476007)(83380400001)(91956017)(71200400001)(66946007)(76116006)(66556008)(186003)(6506007)(4326008)(26005)(55236004)(2906002)(6512007)(31686004)(53546011)(478600001)(7416002)(110136005)(36756003)(316002)(54906003)(98474003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iVL/gZKcIrY2CqEo2epl7N6rui8qQvG4k7UWmFvNJIDAXPUVB7zaI8olaSyd+UeLMA/Oe9edKjLj6zm/8i98eUWdg4mU4N9s39UNkNNxyCmsH422GnDQOYWEN2RTQ1LRymeDs5K9VYJJ/YvRoBMI99JNvd+w8j2a8qmcCGKKLa2XkoPprEVMRsdk8guzs/WA5tn6pD+f3ZLQ3y48zH8xSpHPBdI0aVso0rjfjJ8z0vroQGYGazXwKxbQHahOg86AglVcXuArKGsdXXx4XUeQ2L9EKfsb0wzL6dSOkMYYjYv4R3SfBgBzMw7hLE2m2TOg/MtHrHWW0nmLlLCVWflN2xeEWi4e9NqFm7YEaWAnYGLLeG5f26CV7XJIFLP4tjFAL5d4uD//bOk/IUIGvaVFjsMn3K1HZ7Ji5ucLa2rTiTyZiyIqxylJPzyjtrzo8qUtgopMHEK55XNSSCfE7ri4XMp3CYuYy9ep1VwHz4L2xWX8/6/2KT92k1QWkPLYSsO5
Content-Type: text/plain; charset="utf-8"
Content-ID: <12290F8468A9B4409B4EC1C19812689E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6bf3f4-be3d-4bdf-569c-08d816b41962
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 13:56:44.7535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/fmxxRyeuXBn8yR4GgOVSC9UKS+IKb459N41KPvq4TVNbtUcdHZVTftXGn9oO3lNgAGGdKhTvOuDOl+h0TUU5FiXWrNDNz90w1FUNLi/80ti29Ja8FoGdYQLihIiQx0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4927
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzE5LzIwIDQ6MjkgUE0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPiBP
biA2LzE5LzIwIDQ6MTUgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMTkv
MDYvMjAyMCAxNDowNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4NCj4+PiBP
biA2LzE5LzIwIDM6NTkgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+DQo+
Pj4+IE9uIDE5LzA2LzIwMjAgMTM6NTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0K
Pj4+Pj4gT24gNi8xOS8yMCAzOjQ3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4gVGhl
eSB3aWxsIG5vdCBiZSBhdmFpbGFibGUgZnJvbSB0aGUgZmR0LCBidXQgeW91IGNhbiByZXRyaWV2
ZSB0aGVtIHdpdGggYW4gaHlwZXJ2aXNvciBjYWxsIChzZWUgSFZNX1BBUkFNX1NUT1JFX1BGTiwg
SFZNX1BBUkFNX0NPTlNPTEVfUEZOKS4NCj4+Pj4+IFllcywgYW5kIGl0IHVzZWQgaW4gdGhlIHJl
bGV2YW50IHBpZWNlcyBvZiBjb2RlIChoeXAgY2FsbHMpDQo+Pj4+Pj4gT25lIHF1ZXN0aW9uIHRo
b3VnaCwgd2h5IGRvIHlvdSBuZWVkIHRvIG1hcCB0aGVtIGluIGFkdmFuY2U/IENvdWxkbid0IHlv
dSBtYXAgdGhlbSBvbiBkZW1hbmQ/DQo+Pj4+Pg0KPj4+Pj4gV2VsbCwgd2UgbmVlZCB0byBhdCBs
ZWFzdCBlc3RpbWF0ZSB0aGUgcGdfdGFibGUgc2l6ZSBzbyB3ZSBjYW4gcmVzZXJ2ZSBhbmQgYWxs
b2NhdGUgbWVtb3J5IGxhdGVyLA0KPj4+Pg0KPj4+PiBPaCwgc28gVS1ib290IGRvZXNuJ3Qgc3Vw
cG9ydCBydW50aW1lIHBhZ2UtdGFibGUgdGFibGUgYWxsb2NhdGlvbi4gSXMgdGhhdCByaWdodD8N
Cj4+PiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZyBubywgd2UgcHJvdmlkZSBhIG1lbW9yeSBtYXAg
YW5kIHRoZSB0YWJsZXMgYXJlIGFsbG9jYXRlZCBiZWZvcmVoYW5kDQo+Pg0KPj4gT2sgOiguDQo+
Pg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IHNvIEkgaGF2ZSB0byBwcm92aWRlIG1lbW9yeSByYW5nZSBm
cm9tIGVpdGhlciBieSBjb2RpbmcgYSBjb25zdGFudCBvciBsb29raW5nIGludG8gdGhlIGRldnRy
ZWUgYXQNCj4+Pj4+DQo+Pj4+PiBoeXBlcnZpc29yIHsgcmVnID0gPD47IH0uIEl0IGlzIGEgYml0
IHRyaWNreSB0aG91Z2gNCj4+Pj4NCj4+Pj4gTG9va2luZyBmb3IgYSBub2RlIGluIHRoZSBkZXZp
Y2UtdHJlZSBzaG91bGRuJ3QgYmUgdG9vIGRpZmZpY3VsdCBnaXZlbiB0aGF0IHlvdSBoYXZlIGZk
dF8qIGF2YWlsYWJsZS4NCj4+Pj4NCj4+Pj4gSG93ZXZlciwgcGxlYXNlIG5vdCB0aGF0IDxyZWc+
IGRvZXNuJ3QgcmVmZXIgdG8gdGhlIGd1ZXN0IG1hZ2ljIHBhZ2VzLiBJbnN0ZWFkLCBpdCBwcm92
aWRlcyBhIHJlZ2lvbiB5b3UgY2FuIHVzZSBmb3IgbWFwcGluZyB0aGUgZ3JhbnQtdGFibGUgZnJh
bWVzDQo+Pj4NCj4+PiBJbmRlZWQsIHRoaXMgaXMgaW4gbXkgY2FzZSAweDM4MDAwMDAwLCBidXQg
dGhlIG1hZ2ljIGlzIGF0IDB4MzkwMDAwMDANCj4+Pg0KPj4+IFNvLCBJIG5lZWQgdGhlIG1lbW9y
eSByYW5nZSBzZXQgdXAgYmVmb3JlaGFuZCwgYnV0IEkgY2FuJ3QgYXMgdGhlcmUgaXMgbm8gY3V0
ZSB3YXkgdG8gZ2V0IHRoYXQuDQo+Pj4NCj4+PiBPZiBjb3Vyc2UsIEkgY2FuIGlzc3VlIGEgaHlw
IGNhbGwgdG8gZ2V0IEhWTV9QQVJBTV9DT05TT0xFX1BGTiBhbmQgdXNlIGl0IGFzIHRoZSBiYXNl
IGFkZHJlc3MsDQo+Pj4NCj4+PiBidXQgdGhpcyBzbWVsbHMgbGlrZSBhIGhhY2suIEkgY2FuIGNh
bGwgb3RoZXIgSFZNX1BBUkFNXyB0byBnZXQgdGhlaXIgcGZucyBhbmQgc2V0IHVwIHRoZSBtZW1v
cnkgcmVnaW9ucywNCj4+Pg0KPj4+IGJ1dCB0aGlzIGxvb2tzIGEgYml0IHdlaXJkLg0KPj4NCj4+
IFdoeSBpcyBpdCB3ZWlyZD8gSW4gZ2VuZXJhbCwgeW91IG9ubHkgd2FudCB0byBtYXAgZXhhY3Rs
eSB3aGF0IHlvdSBuZWVkLiBOb3QgbGVzcywgbm90IG1vcmUuDQo+Pg0KPj4gSW4geW91ciBzaXR1
YXRpb24sIHlvdSBvbmx5IGNhcmUgYWJvdXQgdHdvIHBhZ2VzLCB0aGUgY29uc29sZSBwYWdlIGFu
ZCB0aGUgeGVuc3RvcmUgcGFnZS4gVGhlIHJlc3Qgc2hvdWxkbid0IGJlIG1hcHBlZC4NCj4gT2ss
IHNvIEknbGwgdHJ5IGdldCBwZm5zIGZvciBIVk1fUEFSQU1fQ09OU09MRV9QRk4gKyBYRU5TVE9S
RV9QRk5fT0ZGU0VUIHZpYSBoeXAgY2FsbCBhbmQgbWFwIHRob3NlDQo+Pg0KPj4+IEkgbmVlZCB0
aGF0IGNvbnN0YW50IGJhZGx5IDspDQo+Pg0KPj4gTm8geW91IGRvbid0IDspLg0KDQpXZSBoYXZl
IG1hbmFnZWQgdG8gbWFrZSB1c2Ugb2YgdGhlIHJlbGV2YW50IGh5cGVyY2FsbHMgdG8gZ2V0IHRo
ZSBQRk5zLCBidXQgZm9yIHRoYXQNCg0Kd2UgbmVlZCB0byBtYWludGFpbiB0aGUgY2FjaGVzIGFz
IHRoaXMgaGFwcGVucyAodGhlIGNhbGxzKSB3aGVuIE1NVSBpcyBub3QgeWV0DQoNCnNldHVwIGFu
ZCBpcyBpbiB0aGUgcHJvY2VzcyBvZi4NCg0KPj4NCj4+IENoZWVycywNCj4+DQo+IFRoYW5rcyBm
b3IgaGVscGluZyB3aXRoIHRoaXM=

