Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B4E818AF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubey-0005tf-Bd; Mon, 05 Aug 2019 12:00:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hubew-0005tV-Pw
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:00:14 +0000
X-Inumbo-ID: 9493a7f1-b778-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9493a7f1-b778-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 12:00:13 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 12:00:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 11:57:56 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 11:57:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQzFYr4pXFnEFlN6og2O1sLSABog107KKoNB+s1NgAQd2844VCVyaVWaurzko2vxY86cgtVX5x+cx5oZ/rw6PEcI9MnrlwD9yz8SpQ3mw0uODS+UKtU6BD1FxO7XLBH7gKCW9WojWrqg89yvRyS3Tg5x1fyuti3YIeTq05TxHh0d5CVZ5nK6wn+QOPnmr8kOsPAjBTzBLoI5AbTHGJBVjWHsIadQoxmMWO7N1f7U60IhUikNItfGaYcRogfGprR6D6UJkDKsjWWoHvqsSEGHX11ENdeLGhK2Vvw5y5ol2vEfXDmWI0uBpyOxcZXGXY1IYcFJK1PAHP6Ozy7r05Dv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxxAf586JfdUHX4B5/i9L5eA/KwlO6fT29mMg78/EL8=;
 b=QNe7CyECpMqVpIzTNxpttD6PpYXhZQfPLmet9MZrJ/8w6gA77HsYpTgXmteGVewhtozRflTJEQ35zuNfwKZQn/QR1cczeL8N5+EGk84SNRJxwaIaOuOfWa7XADE/8m5Bt9ZeRyvAnGNLFDn01B74o/RY/1ww78nZfqy+Kq+trN/DN2gDgJ2PEn0y+6oeP7IolENnsbxluavIHM0TQEMZ9pqioKLRAaJImjbokYL/b0xn+iCM6v+jXez1cLcqml6jvI8Kzltb9i6AeTbRk25pEoodFmMp6Q11QlRPrFIyUczW1FGxINZmwGuBrJvevWNyyMKYmJ/HnVrFWqYrNbQcTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3261.namprd18.prod.outlook.com (10.255.237.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 11:57:56 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 11:57:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2] x86/shim: Refresh pvshim_defconfig
Thread-Index: AQHVS4RUyeLtJu//lk+KvYEIvy5LHKbscv+A
Date: Mon, 5 Aug 2019 11:57:55 +0000
Message-ID: <3f38a78f-464c-8189-4650-1bd32784695b@suse.com>
References: <20190805115232.28002-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190805115232.28002-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0139.eurprd07.prod.outlook.com
 (2603:10a6:207:8::25) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf859eb4-d8df-41d4-9ea8-08d7199c2723
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3261; 
x-ms-traffictypediagnostic: MN2PR18MB3261:
x-microsoft-antispam-prvs: <MN2PR18MB326141EF9B624252E1B0D235B3DA0@MN2PR18MB3261.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(189003)(199004)(6436002)(31696002)(8936002)(66066001)(7736002)(11346002)(53936002)(305945005)(3846002)(6246003)(25786009)(52116002)(8676002)(36756003)(68736007)(6116002)(6916009)(446003)(316002)(6512007)(558084003)(478600001)(4326008)(99286004)(102836004)(486006)(31686004)(53546011)(6506007)(386003)(76176011)(14454004)(71200400001)(86362001)(71190400001)(54906003)(6486002)(2616005)(229853002)(476003)(256004)(80792005)(66476007)(66556008)(64756008)(66446008)(186003)(2906002)(66946007)(26005)(5660300002)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3261;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /GvnfoshhPyF+v5yKtBDg/xExsbU6CMUnmSnZl8qnuljMJszrEUo9I+r1nawteAXjiE1XBkvaNgfcfoUJIGMOSZC9zlWzvzAJv9u/5sWGRpmHqcgc+6bikG6+o+DKmuvn2CqN/xNmWwo2rRZ0lsjwJZSqVI7/AD5XJLXSEoUz9KAW1JhgT4tPZgalmW432zIvNIPoNha97tWL9XAE3s776KJCzODxKnBNU+dfKt64NGT7t+tYu7iaDzDMdd1b6SUgBCPRyE/4+ej+3//sm7/EYc/wTh9DDEo6ZCkkF2dcVXfUTrVWi+ADarBXii1xyDlhCRbGT+LqGJEpXDUrNDCnHE7NQWrmWFwas2VUgJCsWHTGoB2HJ9Xn/eiQCnyGMQweud8Upf5eMI2dYJnAlmQnfc9ePnXaX3dPL0umYOjB9k=
Content-ID: <58E379A89A420C4BA0B73FACEF3AC12B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf859eb4-d8df-41d4-9ea8-08d7199c2723
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 11:57:55.9742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3261
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/shim: Refresh pvshim_defconfig
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxMzo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gKiBBZGQgYSBkZXBl
bmRlbmN5IHNvIHRoZSBzaGltIGdldHMgcmVidWlsdCB3aGVuIHB2c2hpbV9kZWZjb25maWcgY2hh
bmdlcy4NCj4gKiBEZWZhdWx0IHRvIHRoZSBOVUxMIHNjaGVkdWxlciBub3cgdGhhdCBpdCB3b3Jr
cyB3aXRoIHZjcHUgb25saW5lL29mZmxpbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
