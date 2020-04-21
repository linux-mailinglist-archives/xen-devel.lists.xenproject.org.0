Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED41B26CE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:54:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQsQ2-0003gx-8I; Tue, 21 Apr 2020 12:54:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pWK=6F=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jQsQ1-0003gr-0r
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:54:29 +0000
X-Inumbo-ID: 3b8c5fc6-83cf-11ea-9133-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b8c5fc6-83cf-11ea-9133-12813bfff9fa;
 Tue, 21 Apr 2020 12:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfpFCwh6dzF1GIRAHtgAxrYms+56O2LpPxoqnDNwbtH41xhxkOE++E+J99KFZDyW11T5DIlpC/Bs7TqinKM+7cb1RHSK8EL+BbnC4TkWN5LM96Y5NjkGSDA1M7Xta1O+XU1JPxOmnNTGykHWewgWxCuNYSz3SoeJmhXFNDBFoUikNW+2Mnkm66RaqsneZXSjpuMevwgZ/wGkt7Qnrt1QUhguweb4BbPVq2Sax6v8O7pqDc0er+PYpVQfFa2lnkhupKar2B46DYM2EXt/03xLPlVkltpoiG6Y3ExXCyzN36AHKBI/OQYCdL4uIWwPD7T2+/JbEvVCG56dD7K4KgvE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUhg6+PXb/gGujyhRwvnR9ociJ+Z2CmlNEGwIq3yeOw=;
 b=UHUITyKSMjaUhXjOYXzMlfoPW6o/mbraMS7poFXpvh5NUAzL4LryYpsaKSVPuh5akA1NLQGj52lnXFpvoYmrNTOUOqhqwBfmd+UPc302wakFgMy1R3dPOYJ+3PwG0nzpY8xNSrpP/0WFCAYw6WFQ7OvGHkkgepRAWuONFv8riI5LisZg+AN89OclOa2VM7FrFxZ9epbFZJu3U1Z/XdxC5JDePCDJ3mpCktMjg+2u4gcMlel0A0Rfi7zzuDhqEkvYYgG+zt5z4Tf8r2Cm/y4FQwqiMpue+FOTGXv1k0qC24EIK5H9gRlSsmdkOkoF8ye1qofbdyPVsrdP+xeIIVAcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUhg6+PXb/gGujyhRwvnR9ociJ+Z2CmlNEGwIq3yeOw=;
 b=aOynohSb8lsBTth6zphGhsjl01We1Aktb+8wnuf9YHP2WiLIoUNthwzEbjVxN0FuCPD9o4y1FITxxRXHwIVNmfCFnqjre27TAa6cugAoNUic22OhxNaafVKmvPTTME3cPXdAxB+WAeDhXABzYCl/gpua/9ldmZkYhHQwTfZkv7Y=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4638.eurprd03.prod.outlook.com (2603:10a6:803:56::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 12:54:25 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::4144:ba6b:18cd:af5c]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::4144:ba6b:18cd:af5c%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 12:54:25 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Topic: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Index: AQHWF8n8HYXBbl5N3kSvZpSjxllEBqiDciuAgAAEjwCAABGqgA==
Date: Tue, 21 Apr 2020 12:54:25 +0000
Message-ID: <ea900230-25fb-2b2c-c29c-535bc44c16c7@epam.com>
References: <20200421104522.GA86681@mwanda>
 <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com> <20200421115112.GB2682@kadam>
In-Reply-To: <20200421115112.GB2682@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ff24d75-22a8-4608-dc2b-08d7e5f31f25
x-ms-traffictypediagnostic: VI1PR03MB4638:
x-microsoft-antispam-prvs: <VI1PR03MB46387F4F64934B85BA19B1E5E7D50@VI1PR03MB4638.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(53546011)(6506007)(81156014)(26005)(71200400001)(31696002)(2616005)(6916009)(36756003)(8676002)(8936002)(4326008)(6512007)(76116006)(6486002)(66446008)(64756008)(66556008)(66476007)(66946007)(31686004)(5660300002)(4744005)(498600001)(2906002)(86362001)(54906003)(186003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jPDIJMa/O3aW3FbM7CJtSKA44MS1sCI3knoZ/ZAu65lUseH9CgW7/POnSaJ9kqsx06mUG9yMrFUE6iJglt4VfI3Ssp5yKtJ64g++DSqk9VXNqVYPzQAW4Fn2Ld19hxL94MyStbwK/0cZquyrNLszI/2k4ojyskHbiqRea0U8evB+h8gAncbOzM1MJEoaSH9ND8BFoz71jqag5smcisuSkWpI/09CPHYL5VXQ3nj+5OXzE6kEr3eSAbKxuQFVHBKJPHaevvR/2qj8PkrehY+42g15Sd2folWDYMBfT4x2KvsiSqVVMy2FVqned3mIcZbW7lCfAAHmqNOFK3/Qe+KRQXIasyjKXdZya6W40Ev+Sc0/VaBSw6Wk9108UsGuDARzCwE7WaHGx26gL0wv6MXkQzNk8Egp0Hbf15QW5fJcPsxLBTUujqbB2FlgdjUIy/vM
x-ms-exchange-antispam-messagedata: lvdipXn0Pnvdy7cPNQiavWOWht++FlJx6qCFRwZ+/i7XG2SVxojT5DROy6kg3JhK87dVfMZUDZRtl5bM0kQnayK4vH43S8sy72TUGiM9kUgVB/DjhVJjakFBhFVpLRL+SYfy5jTVGI56T3tqwQxRweHlz92SXgwyisr5uWdAfcM5i7PovdtYnx85QWaJnCopvQiBHk4KuFg3/kgikkoxeffKsCbkrj28FHIxVbw0EendVE7stfwQ3QBlIF2O+aQmYUPE2o339x70M289UuKp5JALe6Mxf06r1Hcb97JdO8GR3eJ+Ejhxn+bDTtSOVZWCHpwYqnNBhQxkLbu6GySHkk5xJRnB9IC93R0O9kpzDZLwyQxj4NQgeCV/1M2buIMr0x0HKqzBlJZ843/ieojTE78Rv7dY3rASUSQHh9x8p9jEXpv0PODaDKYVM7wNdI/1XFgc8wZVw0SbiVjHKUqBzuOmBtEzVbhIo6GTzTTbInVOvmvL1nPQZBoeM4NoelL3GifmWvWApMTEiy7BsZ6wkE30mfhk4rrK2Laym3Q1U06nQQLPIvuuDF46znLpONSoRbSprnQpsVD9usQX1kIbkL5MqEung5UG0REVsExZgvdXlSQ82wKw+bcPRpp9KPwRBDTZhFh0cYDlkw2D2kvbMhogjpsl67N4IbYhXVV7Uta4BPnsA2+qCm0wYodbL1h40d8mjDdZgKCpRsw+byIXsDs31nPOrF6bi8WY8L8TzFaqzP5dkrS20P/L9DYR2JN5+RDBoi7xeLrGTvBJcb2t0tT94GcpZDOKDPQVmXnKssw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <77FB5B472DD20940A15971BEA76ADB7D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff24d75-22a8-4608-dc2b-08d7e5f31f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 12:54:25.7183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xm/TJ3X1CQ7fy/lFfyB/TNKmyGPWc32Ue3no4BT1WGpTia1mICueKp2pv4JbpYbFUxTifjj65Yt2NjwkG/b5+sHv8yZNRXZxjKyQrl20mzI/84kRJzsTLxlBLUg96Je
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4638
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yMS8yMCAxNDo1MSwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSXQgdHVybnMgb3V0IHRo
ZXJlIGFyZW4ndCB0aGF0IG1hbnkgb2YgdGhlc2UgaW4geGVuLg0KPg0KPiAkIGdyZXAgSVNfRVJS
X09SX05VTEwgZHJpdmVycy9ncHUvZHJtL3hlbi8gLVJuDQo+IGRyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYzo2MzogICAgIGlmIChJU19FUlJfT1JfTlVMTChmYikpDQo+IGRy
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYzo4NjogICAgIGlmIChJU19FUlJf
T1JfTlVMTCh4ZW5fb2JqKSkNCj4gZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dl
bS5jOjEyMDogICAgaWYgKElTX0VSUl9PUl9OVUxMKHhlbl9vYmotPnBhZ2VzKSkgew0KPiBkcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmM6MTM5OiAgICBpZiAoSVNfRVJSX09S
X05VTEwoeGVuX29iaikpDQo+IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0u
YzoxOTc6ICAgIGlmIChJU19FUlJfT1JfTlVMTCh4ZW5fb2JqKSkNCj4gZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250LmM6NDAzOiAgICAgICAgaWYgKElTX0VSUl9PUl9OVUxMKG9iaikp
IHsNCj4NCj4gVGhleSdyZSBhbGwgd3JvbmcsIGJlY2F1c2UgaWYgdGhlIHBvaW50ZXIgd2FzIHJl
YWxseSBOVUxMIHRoZW4gaXQncw0KPiBub3QgaGFuZGxlZCBjb3JyZWN0bHkgYW5kIHdvdWxkIGV2
ZW50dWFsbHkgbGVhZCB0byBhIHJ1bnRpbWUgZmFpbHVyZS4NCj4NCj4gTm9ybWFsbHkgU21hdGNo
IGlzIHNtYXJ0IGVub3VnaCB0byBrbm93IHRoYXQgdGhlIHBvaW50ZXIgaXNuJ3QgTlVMTCBzbw0K
PiBpdCBkb2Vzbid0IGdlbmVyYXRlIGEgd2FybmluZyBidXQgeWVzdGVyZGF5IEkgaW50cm9kdWNl
ZCBhIGJ1ZyBpbiBTbWF0Y2gNCj4gYnkgbWlzdGFrZS4gIEl0J3MgZml4ZWQgbm93Lg0KPg0KPiBy
ZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQo+DQpUaGFuayB5b3UsDQoNCkknbGwgaGF2ZSBhIGxv
b2sgYXQgdGhvc2UNCg==

