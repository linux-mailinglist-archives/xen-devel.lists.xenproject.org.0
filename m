Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779C9165B0E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:03:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4idI-0006mi-8V; Thu, 20 Feb 2020 10:00:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/BCT=4I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j4idG-0006md-W3
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:00:35 +0000
X-Inumbo-ID: d4bc29d4-53c7-11ea-84f2-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.119]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4bc29d4-53c7-11ea-84f2-12813bfff9fa;
 Thu, 20 Feb 2020 10:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/jVrw1a2auDNG8AEjboVmp0cNUoQoqh6QXkyLWJ/lvAXBQUiIlkwWYJFwwoVe6tN3mVRwNfZCUev3Oo+vOnGs6cIWqN35urGFnf5bED4/QdJXwypx+DdSjkS89L1xequyFcRqBEHeDzpqpSYSuFrkql2Kg+pY80njeMqTSSux2aSvXQ5Y8+7WrfIulbvRqhSuPAA51Mx+UDgXIMnaheV6wNIBPY8DsBDjMQzqQp2SYKdbGp4YE453aMMFoTZj8bIuDYKJ7CBJOf8PQSm6XJ9ogRypO/We+1RCEhsmBBsRw/hz60JQqKrvusBsai0Qa6YmKD5PQljQc2nR8BSGhQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMztn245XkEhzXSFM7UoGhi4z2rEDnI3mGuOXSMDBow=;
 b=NG4LKdNeeQ82/eWXSJp8aF+F+pncIeJMybss4XVFw+tqoCVA1yaMEaA59GbqCNSn8defsPMrOhAJLuSPzl0ZtlB/+6BnYhua+R2jyylcSUBYuxO7e1lg/0eh5OtznqG3VhyYG6Z+/fu41i11G51QAw94OXufw1QNeBReLW6dQ9xGDFIOHpp6bzMKzlmVx8TNTEMwRc5hj+FuKc/uZahvQMV17oyjPHbvBbz/igZA1ECm9Brj2I8X/UcSsYXrTJ/H5NG/+ifo44iJxZQEC37EZgZNUmuiu5yrxmL7y8sDwzqtLbwwHqnMumavuuz+MqAIRE4xefVQRGCjhMKuvaMxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMztn245XkEhzXSFM7UoGhi4z2rEDnI3mGuOXSMDBow=;
 b=UXm+sNapKNkNObCfhhWpLFVlfzAY4I85H0TB9Qak3JXYHnC2qAZl4MA2a1qDAUIhq6icdIbX/UXIv1a7plZc69cDca72nwM14iL89mfsuYXpKnE/08stSxNwjUEbVKrEwhtWkUcmzw2KNsiZvg5ebjBJKt+t91JmiFVMqinQ6ec=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3175.eurprd02.prod.outlook.com (10.170.222.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.34; Thu, 20 Feb 2020 10:00:00 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 10:00:00 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR06CA0081.eurprd06.prod.outlook.com (2603:10a6:208:fa::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Thu, 20 Feb 2020 09:59:58 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V3] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV5wWKuFf2vClElk6nKYx34YpPrKgivhiAgAEc4IA=
Date: Thu, 20 Feb 2020 09:59:59 +0000
Message-ID: <1b42e2e2-1559-9014-1022-e5d5bf65eaa6@bitdefender.com>
References: <20200219091811.9689-1-aisaila@bitdefender.com>
 <6ec21fc9-a4fc-58b3-d823-8bdb291a22ac@suse.com>
In-Reply-To: <6ec21fc9-a4fc-58b3-d823-8bdb291a22ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0081.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::22) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6633a9a-5ca4-43b1-b148-08d7b5eba5aa
x-ms-traffictypediagnostic: DB6PR02MB3175:|DB6PR02MB3175:
x-microsoft-antispam-prvs: <DB6PR02MB3175AB0ABB88CFCC7A8F2ADAAB130@DB6PR02MB3175.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(396003)(136003)(366004)(199004)(189003)(5660300002)(86362001)(6916009)(71200400001)(4326008)(81156014)(66446008)(64756008)(66476007)(66946007)(31686004)(478600001)(8936002)(8676002)(81166006)(2906002)(66556008)(31696002)(16526019)(2616005)(956004)(316002)(53546011)(186003)(26005)(6486002)(54906003)(36756003)(52116002)(7416002)(16576012);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3175;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YhsZd0p6BZEwjgykBY1jFrWOpVTlYaLXXTRwY68SC1EnT/OhicGnJs38ZZqbwCDJqBoH2+vxUoSQX9x7uHSSehNOonbQAgzzrMYtXPUVSRPgM94xeQVtQA7LCPFITSIHo4uZBp8DB9o8clw5vQDeHBY/y+kdSwFEdQJ7sbaQbfQOyfPZ0ew4mhmTqDXQZrtg0CRMqwHJy6d/n8R9JvpLCP9Hhe+lB6kYSeG1w9xp+hZ5G/b7D2wt0dxXNZ7rfoqQMLxV0tcADfecc1SF1vX164NwBuDw+6XEsghxCVWKISKDz4ACZPCV2tSGN+b/5w/Kd/uqqb9xMrutv6aHPicTPYQY1ERaizW63mcS43G9oBwYOEO31YjV63lECBEmzldyM7Oo+vR3o2rVRR75t4tkNak6Um0982t7EoO9Yq3qCzlA2nmfn4F8SQiJXcBxH760
x-ms-exchange-antispam-messagedata: GQ9sFw9D2pkmAGtLNHfix9TDsxEx4BaBBdSxbzNwjD/1Muu/fc9ElL9KlCaaXQn1DZuPW5HzxvDGAvnPLAO217AyIt9GUV7JVshaq3RKNnBk34UTe/pH3y4pmb5Zc85cha427FdXKsPSLum/lqd7qg==
x-ms-exchange-transport-forked: True
Content-ID: <425D8F6BE63EB94498E42E5E37841230@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6633a9a-5ca4-43b1-b148-08d7b5eba5aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 09:59:59.9072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25oi1ibzeYgQlnzyT/hHyv74253Sl73QezQNiFcnWPCgV+ueygfx04obBzc6qRBc7R3/K86YPc9IiYUZbecM/r2zYH1AQQzxT0CoIJPHL/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3175
Subject: Re: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE5LjAyLjIwMjAgMTk6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wMi4y
MDIwIDEwOjE4LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC00ODM1LDYg
KzQ4MzYsMjMgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+PiAgICAgICAgICAgYnJlYWs7
DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJp
bGl0eToNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdWludDE2X3QgYWx0cDJtX2lkeCA9IGEudS5z
ZXRfdmlzaWJpbGl0eS5hbHRwMm1faWR4Ow0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBhLnUuc2V0
X3Zpc2liaWxpdHkucGFkICkNCj4+ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7DQo+PiArICAg
ICAgICBlbHNlIGlmICggIWFsdHAybV9hY3RpdmUoZCkgKQ0KPj4gKyAgICAgICAgICAgIHJjID0g
LUVPUE5PVFNVUFA7DQo+PiArICAgICAgICBlbHNlIGlmICggYS51LnNldF92aXNpYmlsaXR5LnZp
c2libGUgKQ0KPj4gKyAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX3dvcmtpbmdfZXB0cFthbHRw
Mm1faWR4XSA9DQo+PiArICAgICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJt
X2lkeF07DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1f
d29ya2luZ19lcHRwW2FsdHAybV9pZHhdID0NCj4+ICsgICAgICAgICAgICAgICAgbWZuX3goSU5W
QUxJRF9NRk4pOw0KPiANCj4gRG9uJ3QgeW91IG5lZWQgdG8gYm91bmRzIGNoZWNrIHRoZSBpbmRl
eCBiZWZvcmUgaXRzIHVzZT8NCg0KVW5sZXNzIHdlIHdhbnQgYSBpbmRleCBvdXQgb2YgYm91bmRz
IGZyb20gdGhlIHVzZXIuIFNvcnJ5IGZvciBub3QgaGF2aW5nIA0KdGhhdCwgSSB3aWxsIGFkZCBh
ICJhbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgDQpNQVhfRVBUUCld
IiBpbiBwbGFjZSBmb3IgdGhlIG5leHQgdmVyc2lvbi4NCg0KPiBBbmQNCj4gc2hvdWxkbid0IHlv
dSByZXR1cm4gYW4gZXJyb3IgYWxzbyBmb3IgaW4tcmFuZ2Ugb25lcyB3aGljaA0KPiBhcmVuJ3Qg
YWN0dWFsbHkgdmFsaWQ/DQpUaGF0IGlzIGEgZ29vZCB0aGluZy4gTWF5YmUgLUVJTlZBTCBjb3Vs
ZCBmaXQgdGhpcz8NCg0KQW5kIHRvZ2V0aGVyIHdpdGggdGhlIGJvdW5kcyBjaGVjayBpdCB3aWxs
IGVuZCB1cCBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQppZiAoICFhbHRwMm1faWR4IDwgMCB8fCBh
bHRwMm1faWR4ID49IA0KbWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJtKSwgTUFYX0VQ
VFApIHx8IA0KYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1BWF9F
UFRQKV0gPT0gDQptZm5feChJTlZBTElEX01GTikgKQ0KDQpyZXR1cm4gLUVJTlZBTDsNCg0KQW5k
IGxvb2tpbmcgYWdhaW4sIGl0IGNvdWxkIGJlIGNvdXBsZWQgd2l0aCB0aGUgYS51LnNldF92aXNp
YmlsaXR5LnBhZC4NCg0KVGhhbmtzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
