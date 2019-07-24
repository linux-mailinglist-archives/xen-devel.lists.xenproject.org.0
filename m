Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F04C72E0B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:47:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFhm-0004Ng-OK; Wed, 24 Jul 2019 11:45:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqFhl-0004Nb-Lh
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:45:09 +0000
X-Inumbo-ID: 7b633da9-ae08-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7b633da9-ae08-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 11:45:08 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 11:44:57 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 11:43:46 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 11:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVgZQtwC7VyBAbYsQsMcbvxNzsL8pF06O4rNO6WjM+xEGgIda8EEsGd3ljr7KQ+ppTDzHpnIvndrgqPsgyghEYv60GEZM1+lHYFplL6kjhK6M5iZDtrChXayw/snf2Dr5U7S5yzyHbEeiQ0+LK86M8kWRh1uOI9lpiIi8Uftg8U4qbz3XtADukEGZMPraza1IjLnRNLBchk2xqh3eEvnqPJCjhZ7hqcw+K3A2xXZDD2rQGDbljmZ7WmLeFFmVkoq1g5Peb8aXmnMrzaEMwq2ZLWia1X2Xmo44eENPpKqW7o2N37y8HRzq85xk1qjO10bmebHjcAHUKNP7lgjvTcZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Jlwj4NM4Pv+fL5pSOmVK8lexr2Kt0oK90yuqt3KXlo=;
 b=Dw4s5jHydGSpGYMOhdxNWWGmmSyP6l9kfZViZMHgLMiLkU+2lrpsE4mpvPCsp1ieZ0d38Ew7SX4F0aBoGxSyzT2vQd/i8Lr+0ZY8Z5sBVzjIH3V4xV8RtFDUUGfC203RQYE4EwEKeQ4MdMEAZCVmtDIkjQcRWjbR9GiKNv14pPyZCri1O9BkPYHTBb33n+dtu+VxdzStb1gnE9F2a8eRyyULE/UNemD9i+xqMnQeXvHM8Irv6OAaNHaCJhpyf0lZN0LfqvX4QEAPaB8X6NgoZptHNsPRMcWTzTz4hieVjr/bdSggDbTJ7wB4Zv5hZFj2vLXNyhLeewD4EgSb32Q08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3411.namprd18.prod.outlook.com (10.255.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 11:43:45 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 11:43:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] x86/pv: Move async_exception_cleanup() into
 pv/iret.c
Thread-Index: AQHVQZEPVYSOd4hduEm4xew4+ZUIfabZkFYAgAAL4HuAAAq5gA==
Date: Wed, 24 Jul 2019 11:43:45 +0000
Message-ID: <c7ccdec2-50dd-c8f1-4fbe-9d9041e562f8@suse.com>
References: <20190723195830.4524-1-andrew.cooper3@citrix.com>
 <c52559d1-2deb-c821-c482-ddab59a1a78f@suse.com>
 <51d76f4b-ebe0-35d2-9b71-4ea3da5300b4@citrix.com>
In-Reply-To: <51d76f4b-ebe0-35d2-9b71-4ea3da5300b4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0042.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::28) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79272125-a045-40cc-3d57-08d7102c2f49
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3411; 
x-ms-traffictypediagnostic: BY5PR18MB3411:
x-microsoft-antispam-prvs: <BY5PR18MB341198B3648AE6E0649A2971B3C60@BY5PR18MB3411.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(6916009)(8676002)(31696002)(478600001)(6116002)(86362001)(6436002)(6486002)(486006)(31686004)(4326008)(99286004)(76176011)(3846002)(54906003)(316002)(68736007)(14454004)(25786009)(80792005)(66066001)(6512007)(2906002)(256004)(102836004)(26005)(6246003)(229853002)(386003)(305945005)(476003)(52116002)(66446008)(186003)(66476007)(5660300002)(64756008)(8936002)(36756003)(446003)(7736002)(71200400001)(11346002)(66946007)(53546011)(81166006)(71190400001)(81156014)(53936002)(2616005)(6506007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3411;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yO0Ooe3KPVrfaAq2TrKtNY+Dn89dLy2YOj00KaLxxIpcq59+SDmhy0A0+5SSWHM268AkKtBUx55+ciqm5zwLx6/n/ledwDibKv5grmNeGoykUQK8jfgeTD5KCVPy/YApqpng2r4C3P/Cb8x3M0SsqfC4ilnWg9ibNF011I2nYTvtyAWlNPhcuD+ZDpviOEe/mkyOeiXyR6pewsoKDoleZ5DR6ATrd+x62Nqp9Q3LAYwko/Mf1BVbJOJw6gk4oSgVH3te7ZbEyCgx3Q5CPs5be4zOYps+4tCg2BLijfFnGpGbxt6sfcvofHePJXE3xUAPiBkTBWGpRbg83uPSSgGj7Zx2ufc8ALFynKfP+xtVhVoXoVcvHn6RHt4dQiczijMP2vy7VKl5SEYJF3b29QQf9+3T2JTDvAFTTRkmDlDClJA=
Content-ID: <4EED84EC1E44CE4687E068F4354341AA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 79272125-a045-40cc-3d57-08d7102c2f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 11:43:45.6267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3411
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/pv: Move async_exception_cleanup() into
 pv/iret.c
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
Cc: Juergen Gross <JGross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxMzowNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjQvMDcvMjAx
OSAxMToyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMy4wNy4yMDE5IDIxOjU4LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IEFsbCBjYWxsZXJzIGFyZSBpbiBwdi9pcmV0LmMuICBNb3Zl
IHRoZSBmdW5jdGlvbiBhbmQgbWFrZSBpdCBzdGF0aWMuDQo+Pj4NCj4+PiBFdmVuIGJlZm9yZSB0
aGUgcGlubmluZyBjbGVhbnVwLCB0aGVyZSB3YXMgbm90aGluZyB3aGljaCBpcyBzcGVjaWZpYyB0
bw0KPj4+IG9wZXJhdGluZyBvbiBjdXJyLCBzbyByZW5hbWUgdGhlIHZhcmlhYmxlIGJhY2sgdG8g
di4NCj4+IEknbSBub3QgaW4gZnVsbCBhZ3JlZW1lbnQgd2l0aCB0aGlzOiBUaGUgaW1wbGljYXRp
b24gaGVyZSB3YXMgKGFuZCBhZmFpY3QNCj4+IHN0aWxsIGlzKSB0aGF0IHVzZXMgb2YgLyB1cGRh
dGVzIHRvIGludm9sdmVkIHZDUFUgZmllbGRzIGFyZSByYWNlIGZyZWUueg0KPj4gRmVlbCBmcmVl
IHRvIGFkZCBteSBhY2sgaWYgeW91IHJldmVydCBiYWNrIHRvIGN1cnIuIE90aGVyd2lzZSBJJ2Qg
Zmlyc3QNCj4+IGxpa2UgdG8gaGVhciB5b3VyIGNvbnRyYXJ5IG9waW5pb24uDQo+IA0KPiBXZSBz
dGlsbCBjYWxsIHRoaXMgdiBpbiBwbGVudHkgb2Ygb3RoZXIgY2FzZXMuDQoNCkFuZCB3ZSBzdGls
bCBjYWxsICJjdXJyIiAidiIgaW4gbWFueSBjYXNlcyB3aGVyZSB3ZSBzaG91bGRuJ3QuIEkgdGhp
bmsNCml0IGlzIGhlbHBmdWwgdG8ga25vdyB3aGVuIHRoZXJlIGFyZSBzdWNoIGFzc3VtcHRpb25z
LCAuLi4NCg0KPiBJZiBpdCB3YW50ZWQgdG8gYmUgc3RyaWN0bHkgbGltaXRlZCB0byBjdXJyZW50
IHRoZW4gaXQgc2hvdWxkDQo+IEFTU0VSVChjdXJyID09IGN1cnJlbnQpIGFzIGl0IGRvZXNuJ3Qg
ZGVyaXZlIGN1cnIgaXRzZWxmLCBidXQgd2l0aCB0aGUNCj4gbW92ZSBhbmQgYmVpbmcgc3RhdGlj
LCB0aGlzIGlzIHZlcnkgb2J2aW91c2x5IGEgcG9pbnRsZXNzIGNoZWNrLCBnaXZlbg0KPiB0aGUg
dHdvIGNhbGxlcnMuDQoNCi4uLiBldmVuIHdoZW4gaXQncyBvbmx5IGEgc3RhdGljIGhlbHBlci4N
Cg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
