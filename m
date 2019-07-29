Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A27178CAB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Zl-0005ID-Ql; Mon, 29 Jul 2019 13:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs5Zj-0005Ho-Pn
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:20:27 +0000
X-Inumbo-ID: a02d53a2-b203-11e9-b5b4-eb5c3a497ce6
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a02d53a2-b203-11e9-b5b4-eb5c3a497ce6;
 Mon, 29 Jul 2019 13:20:26 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 13:20:24 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 13:00:33 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 13:00:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMb5+MIWmP27NgATKK9zLLkbRK+gnOBNOd90g8gqh5uTu/xZTHKOduJNA5sl+AJuQ49dJpFEktrifFJZgOoLnVgVf3t9HaF1yXZWFM6HOzN+FQ2xDglRNQr+bLm/rPQz3TM8UcfofPENYfSNiWyVQ+ABOwhIVIl97qpxPi+B3acfHMIDoKGWkzA2Yvo9pXt0AQ72oFsfo4Q0ND3B58js2muC51GXlotxlmwfPPOqjlELJI/azsLkUCvC7CVW3col9YuplP34jxPzGafBLYjffPAVDnZEatrANm1aNQSHwaWCtbZqHHpH7iFOM4Ap6Labj1eoWF9v57F6uaTe5soysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAcvOlVixIpJOznT3Upakt5gxGX8bBKER6/IjZ8kdsI=;
 b=OBOmB2Frg+88GwP18P4TYs2DCAX+aKP6l0+rtC4K3hBRD/IFA7A452+aSYjl81S4s+YuJYMBsE+bIXsApChMhEqA0zTcONWIBCYlowHyJGVAt68T0p0sZbnbKd5ooZhQuXX0R9Ajj11zAM4aVgF6X15Yb9PLZYGmu+ztU9jFkSg1kloROa7/bBWWRwsI7fFC2abavekEW/JiEH68/6JD0gqWpQaCMrvHAndjAcksUVDkFEGoViMncvidb2n6D7j/cqB+yWgZRcCX7Y9Yyy5ltWiS4sdjICWxnIhJmkLcdCz7y90mPKj2Q5vdeH7L2heaKuOLG6+fY2GPxp0KogbsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 13:00:32 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 13:00:32 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
Thread-Index: AQHVQ/aLJfmONJuXtEOXa2NkIvPAfabhkz+A
Date: Mon, 29 Jul 2019 13:00:32 +0000
Message-ID: <9c5c9972-801a-e01a-171e-bcabde79eb6f@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-5-andrew.cooper3@citrix.com>
In-Reply-To: <20190726210854.6408-5-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::23)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9337c55e-59b4-41a5-80ec-08d71424bd0d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB3363690C83C0C6BF328E4CC5B3DD0@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(186003)(52116002)(6436002)(8676002)(81156014)(66066001)(4744005)(256004)(6486002)(76176011)(71200400001)(71190400001)(8936002)(26005)(81166006)(53936002)(102836004)(478600001)(6246003)(386003)(6506007)(53546011)(446003)(36756003)(11346002)(31686004)(68736007)(99286004)(305945005)(7736002)(6512007)(66476007)(486006)(5660300002)(476003)(229853002)(14454004)(25786009)(86362001)(66556008)(66446008)(64756008)(66946007)(316002)(6916009)(2906002)(54906003)(80792005)(3846002)(2616005)(31696002)(6116002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VmgixR4hWuozghE9lI8nDOUcBoHAfpHJ4XfUaBATsZkrALhGdS5FwDH8Xlvj3/KMFR7ZTP6u0Jv+zot2IaPMFIxucAX9EDR0+koOtCmK/VrKBGCu6by0Gb7Q+8GmMCLRCwVDm8Y5J99ZTELKNpkcUbKlpMmZMwsO056pMjdjWeF3zIY0yN6+ko0jEiu74/tuqOtWJ1OmD15QNM6goxQ+pXJVvEAScKiiplXwkrxrdDFrNS7Qu9XvN4aR5xSyPyN4dcnB6jZKyKJfas9I1AYxiWvKwhG6y7yHKWVsi2esXE4Wxwk3Iv9mfyz7KAC6MfCorMWtgrlMqeh0e5rB6uWwTJf+f0nBLKmN22StvEmcTCEma0hamN+0sOZILb3uN5oCAcAp0c9pFpvqgRk7t1JXvB98SITdoS78vTMGdn+xIRI=
Content-ID: <10CBB10882FAC04DAE6267EEDAAA7029@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9337c55e-59b4-41a5-80ec-08d71424bd0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 13:00:32.2299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAyMzowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3BlcmNwdS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaA0KPiBA
QCAtMyw2ICszLDEyIEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGFzbS9wZXJjcHUuaD4NCj4gICAN
Cj4gKyNkZWZpbmUgREVDTEFSRV9QRVJfQ1BVKHR5cGUsIG5hbWUpIFwNCj4gKyAgICBleHRlcm4g
X190eXBlb2ZfXyh0eXBlKSBwZXJfY3B1X18gIyMgbmFtZQ0KPiArDQo+ICsjZGVmaW5lIF9fREVG
SU5FX1BFUl9DUFUoYXR0ciwgdHlwZSwgbmFtZSkgXA0KPiArICAgIGF0dHIgX190eXBlb2ZfXyh0
eXBlKSBwZXJfY3B1XyAjIyBuYW1lDQo+ICsNCj4gICAvKg0KPiAgICAqIFNlcGFyYXRlIG91dCB0
aGUgdHlwZSwgc28gKGludFszXSwgZm9vKSB3b3Jrcy4NCj4gICAgKg0KDQpCeSBtb3ZpbmcgdGhp
bmdzIGhlcmUgeW91IHJlbmRlciBzdGFsZSB0aGUgcmVtYWluZGVyIG9mIHRoZQ0KY29tbWVudCBp
biBjb250ZXh0IGFib3ZlOiBObyBwZXItYXJjaCBzeW1ib2wgbmFtZSBwcmVmaXggaXMgZ29pbmcN
CnRvIGJlIHBvc3NpYmxlIGFueW1vcmUuIEknbSBub3QgYWdhaW5zdCBpdCwgYnV0IHRoaXMgY29t
bWVudA0Kd291bGQgdGhlbiB3YW50IGFkanVzdGluZy4gV2hhdCdzIG5vdCBpbW1lZGlhdGVseSBj
bGVhciB0byBtZSBpcw0Kd2hldGhlciB0aGUgdHdvLXN0YWdlIGNvbmNhdGVuYXRpb24gb2YgYW4g
dW5kZXJzY29yZSBlYWNoIGlzIHRoZW4NCnN0aWxsIG5lY2Vzc2FyeS4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
