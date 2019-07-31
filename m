Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B57C370
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 15:28:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsocN-0003uM-EG; Wed, 31 Jul 2019 13:26:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsocM-0003uF-7G
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:26:10 +0000
X-Inumbo-ID: bd68e8fa-b396-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd68e8fa-b396-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 13:26:09 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 13:26:00 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 13:12:48 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 13:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxje10bx7b2GUIts7EbFSb382bXfEBtwI4X0AnW/0XxAWbfFaUqABbQ4NgspoJ5by44uwAFrYuchT32cIXVxW/v6kdIKaK/LnDOTJqCingr/Re0nAbaj6usXu0vdYO7hiWv+in8HZcM+brsbEIJaMOczQi5AMbr4ez09OxvOEnr6JoYQrcLxeEgbIR4VqPED2QOiM5pdmhIVQioAKYm3o4/N1GCsMdqWSGXQpOnPL2+s6TwIhsYpsYfwPxJZV5kn8j8dd9jjqUJy4b44pOXIyVJyQw7dhi3eHzdy1EqD/BgXUjNAesbeq73hYuUKsXvLgkV95U7nwJttvSLwUaoqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KadQbO3H0TC3rIl5vamgujG2J6f9w99huopOR2Gx7NQ=;
 b=K7eEViS0D8+I7zQ8saiKhoJFfMOfQaywU6RnkHaRfBlSVQ/o5dtzmGKVqjt3JcvJczN3FW3C8xHcKP1jkqAdAeUNztv8LA+VAkI4wjc5cRq8YDsPhyqPnADRTV02KrezdWjuE8efgzLs4bTms8gHCNIA9yG7mCkp5G5Ul+Gxnq9pAJJE9yGwoswiFSDe3XGI6hra7E+jx3xivwZytO4flb3b5WlWeyIoRf5F0lylPi6wqkZ+tai78IC+hVdrb3xbE40OAvUirCHZkX2PhJqbmjrnc4XNmX4wcOtwZ7qUHzLoxVPoEeTHJMRLaqvp9xiuTdOfJgCS84Me0fPoIrtG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2843.namprd18.prod.outlook.com (20.179.51.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Wed, 31 Jul 2019 13:12:47 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 13:12:47 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 07/10] xen/nodemask: Drop nodes_{setall,
 clear}() and improve the initialisers
Thread-Index: AQHVR56HyQB8QNXYGkOiux3yNaWDSqbktAgA
Date: Wed, 31 Jul 2019 13:12:46 +0000
Message-ID: <0ec79656-2132-441e-99c6-2fcfb842ff99@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-8-andrew.cooper3@citrix.com>
 <3a6217c6-25d3-3882-99da-846a957d4c02@suse.com>
 <88cead08-46ab-7623-c01a-adfd7267e9e1@citrix.com>
In-Reply-To: <88cead08-46ab-7623-c01a-adfd7267e9e1@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR08CA0008.eurprd08.prod.outlook.com
 (2603:10a6:5:16::21) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bdd8c96-1a60-4cdf-39f1-08d715b8c7dd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2843; 
x-ms-traffictypediagnostic: DM6PR18MB2843:
x-microsoft-antispam-prvs: <DM6PR18MB28435CDFF350FE601BF504C1B3DF0@DM6PR18MB2843.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(53546011)(476003)(256004)(2616005)(71190400001)(2906002)(446003)(486006)(25786009)(6916009)(31686004)(71200400001)(11346002)(3846002)(80792005)(4326008)(6116002)(36756003)(31696002)(6246003)(68736007)(86362001)(102836004)(54906003)(316002)(478600001)(6486002)(14454004)(7736002)(66446008)(81156014)(81166006)(305945005)(229853002)(53936002)(99286004)(66066001)(66946007)(5660300002)(52116002)(6512007)(8676002)(64756008)(76176011)(66556008)(66476007)(6436002)(26005)(6506007)(8936002)(186003)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2843;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XjgyIqvnYmYmesonpeSoBTSqBwcRAI6CuWI/vF3c1qqDaFxUi9xr+z2MVaYr+ShLpAQT2o+JpMsHT5K4bM7Mhv7zvAf37JvwpKIsp9L7gtTtw6fB9XSA6JO9H3NlVJ3XxEwEfAUa5iFq6h8g4CxQe2PkARVbda+NrFHaNYCXVQwr4NkDA5LxB0XZ9uw47zfwOgMHTBPysWet8Nq7VfQTmwhOUL6UVmfD2Vn+YLQB0bUZYu4IDDpKRRrkB1GUenzsoRXnSQexnCsJWvqnVXYsOWt24hj2EgXJ/m1Px+oGzYEwH/SQFnqjrG2XqmOIuTZJ49c+r6TE4VR/elsJGSbA/CmChGki+zPLHahIxADcBJbEm3Rm/E5YqjyPdflf7CIsaQg+TrcF7oVJy9XGdov53dqmQWoP9wln33LM13po1ow=
Content-ID: <3ED70695F6F52C4BADC6FF3B4E3AF943@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdd8c96-1a60-4cdf-39f1-08d715b8c7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:12:47.0053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2843
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 07/10] xen/nodemask: Drop nodes_{setall,
 clear}() and improve the initialisers
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

T24gMzEuMDcuMjAxOSAxNDo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gSSBkb24ndCBzZWUg
YSB3YXkgdG8gYXZvaWQgZXhwYW5kaW5nIG5vZGUgdHdpY2UsIGJ1dCBnaXZlbiB0aGF0IGl0cyB3
cmFwcGVyIGlzIGluIEFMTF9DQVBTIGFuZCBvYnZpb3VzbHkgYSBtYWNyby4NCj4gDQo+IEZ1cnRo
ZXJtb3JlLCBleHBlcmltZW50aW5nIHdpdGggYSBkZWxpYmVyYXRlIGF0dGVtcHQgdG8gcHJvdm9r
ZSB0aGlzLCBJIGdvdA0KPiANCj4gbnVtYS5jOiBJbiBmdW5jdGlvbiDigJhudW1hX2luaXRtZW1f
aW5pdOKAmToNCj4gDQo+IC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5o
OjkwOjEwOiBlcnJvcjogbm9uY29uc3RhbnQgYXJyYXkgaW5kZXggaW4gaW5pdGlhbGl6ZXINCj4g
DQo+ICDCoMKgwqDCoMKgwqDCoMKgIFsobm9kZSkgLyBCSVRTX1BFUl9MT05HXSA9IDFVTCA8PCAo
KG5vZGUpICUgQklUU19QRVJfTE9ORynCoMKgwqDCoMKgIFwNCj4gDQo+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgXg0KPiANCj4gbnVtYS5jOjI3NDoyMzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmE5PREVNQVNLX09G4oCZDQo+IA0KPiAgwqDCoMKgwqAgbm9kZV9vbmxpbmVfbWFwID0gTk9E
RU1BU0tfT0YoZm9vKyspOw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+DQo+IA0KPiAvbG9jYWwveGVuLmdpdC94ZW4vaW5jbHVk
ZS94ZW4vbm9kZW1hc2suaDo5MDoxMDogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKA
mChhbm9ueW1vdXMpLmJpdHPigJkpDQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoCBbKG5vZGUpIC8g
QklUU19QRVJfTE9OR10gPSAxVUwgPDwgKChub2RlKSAlIEJJVFNfUEVSX0xPTkcpwqDCoMKgwqDC
oCBcDQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgIF4NCj4gDQo+IG51bWEuYzoyNzQ6MjM6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhOT0RFTUFTS19PRuKAmQ0KPiANCj4gIMKgwqDC
oMKgIG5vZGVfb25saW5lX21hcCA9IE5PREVNQVNLX09GKGZvbysrKTsNCj4gDQo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fg0KPiANCj4g
ZnJvbSBHQ0MgNi4zLCB3aGljaCBJIHRoaW5rIGNvdmVycyBldmVyeXRoaW5nIHdlIG5lZWQsIGFu
ZCB3aWxsIHByZXZlbnQgc2lkZSBlZmZlY3RzIGZyb20gZG91YmxlIGV4cGFuc2lvbiBpbiBwcmFj
dGljZS4NCg0KQWgsIHJpZ2h0LiBXaXRoIHRoaXMgbXkgUi1iIGFwcGxpZXMgdG8gdGhlIGNoYW5n
ZSBhcyBpcyAod2l0aCB0aGUNCmFkZGl0aW9uYWwgYWRqdXN0bWVudHMgZm9sZGVkIGluIHRoYXQg
eW91J3ZlIHBvaW50ZWQgb3V0KS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
