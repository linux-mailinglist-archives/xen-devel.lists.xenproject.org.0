Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554979078
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:13:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8Eu-0007VO-8j; Mon, 29 Jul 2019 16:11:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs8Es-0007V3-Tv
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:11:06 +0000
X-Inumbo-ID: 75c04986-b21b-11e9-bc63-838c6afdb72b
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75c04986-b21b-11e9-bc63-838c6afdb72b;
 Mon, 29 Jul 2019 16:11:03 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 16:11:01 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:50:23 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:50:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iu5igqKkuj4rQhTPJoARK7u4KaBav7Qdv0yV5/qkS7WXvuor6+3M7MLBYTvLHEJxtfb3hjXMXRCb/ZKwTn6765HYGYNOCWF0ACvhALuwmAXnfiTWbxRm7SKnbGf6xmJUZ/SjX3xEd4QeXJ+e2upTRVtv8iDMUjum8AIl8rktS8r44oy/eiMQbAW5cDq6WipmQCfxsnrR2CxpZDpFsnv2Phj7bM5mXtuuXewz/UvUT/vyqTThqXJOaq7dLDIlo18NA41TneZik3U6lYgebmzfJ/CzDICHp1MkMsEFnMwtX90yZWqcNXQybs8ZGK2HADON4zDWLHMx3DqrKXOsxnXUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60jr+6vyTpEDn58BUICNaPoSHGniugTTPsIpVsaMwFo=;
 b=Fvhcb+cfG8l9I++CEHTkYJLs9bTyPpvFuguytvyMnlXLZ/xe02OG6lcSGA7C9hsHr2+b+8npK/Kwh+O8MDw0Blyzi0OjDjzfOE3Klxx9FQrwdQBNuy5EN0dhnjb/k/FTDLUb6VBoXD9OQ29kSt24STB0Yiopt3ksOE0w+Bp4jdEIdouhZF6pzvMZP7VACvBRcX2GjlbW1vmRQY+DXcpb4UoE8R896gCtCeUy+pZjjGOQAnU+YB78f7NsDIpKajncIPGflrpulARvnbvOn4RVgyn8E1A8WlS97Z2C82udMXPRxP+7IN74lR7PkCBx3EnQ8rEO504bAu3PaC+tJR2/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3380.namprd18.prod.outlook.com (10.255.139.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 15:50:22 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:50:22 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 02/10] xen/bitmap: Drop
 {bitmap,cpumask,nodes}_shift_{left,right}()
Thread-Index: AQHVRgbp3jiDr8CqHE2akaxC8H9eqabhvpKA
Date: Mon, 29 Jul 2019 15:50:22 +0000
Message-ID: <4b6afda2-d882-1d2c-1d1f-3f3b29506f36@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0065.eurprd03.prod.outlook.com
 (2603:10a6:4:54::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e0fcba-3185-4850-f7bf-08d7143c770e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3380; 
x-ms-traffictypediagnostic: BY5PR18MB3380:
x-microsoft-antispam-prvs: <BY5PR18MB33803347199A64A306FE2224B3DD0@BY5PR18MB3380.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(7736002)(478600001)(14454004)(8676002)(5660300002)(54906003)(4744005)(6436002)(4326008)(256004)(8936002)(6512007)(6246003)(305945005)(53936002)(81166006)(66066001)(81156014)(36756003)(186003)(68736007)(71200400001)(71190400001)(66446008)(64756008)(66556008)(66476007)(446003)(66946007)(316002)(80792005)(6486002)(76176011)(3846002)(486006)(6506007)(25786009)(386003)(53546011)(99286004)(476003)(2616005)(2906002)(31686004)(26005)(86362001)(11346002)(102836004)(229853002)(6116002)(52116002)(6916009)(31696002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3380;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SbGd9/9cy+AplJ6jAmakJd3ANe1BP5lRU2bD9cD83rR6IM9xeR3FxT96JkM7C9VBuBM4+zxFDE+9MifQXJTj1SbYyy7hOK7HXaYEH3Enz6Wqbd41X0bESyoB+c8MkZI7TWJrAkBTkaIxinvW2vSPPSSJcVH4+mOxFH5AnnDIVjSu5xHYJZtkc1CqNMNbzrDdwGBNykiSAstXBGWZjqPyTYhzKApLly8M8Rr7EUqQG0GskRFa81AfiQvG959tbVPZaNlc0/0LHwXLaZa77tfCAbm+VQr+3q6iz+hEXaNQYsBevZTlnEKPQZjbNArq4f5jq1ip0fijsKsXufLxx+gwvFbix2uBueAB0wqrx2hbe51dp6Z4Psu27FT96XR2AUuf8xca83meDsgudfFu9tO1tZg4ZLN92Nke+amopjuhABM=
Content-ID: <772351D643353145BF48B533EF1CEB59@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e0fcba-3185-4850-f7bf-08d7143c770e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:50:22.5716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3380
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 02/10] xen/bitmap: Drop {bitmap, cpumask,
 nodes}_shift_{left, right}()
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

T24gMjkuMDcuMjAxOSAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlc2Ugb3BlcmF0
aW9ucyBoYXZlIG5ldmVyIGJlZW4gdXNlZCBpbiBYZW4gc2luY2UgdGhlaXIgaW50cm9kdWN0aW9u
LCBhbmQgaXQNCj4gZG9lc24ndCBzZWVtIGxpa2VseSB0aGF0IHRoZXkgd2lsbCBpbiB0aGUgZnV0
dXJlLg0KPiANCj4gQmxvYXQtby1tZXRlciByZXBvcnRzIHRoYXQgdGhleSBhcmVuJ3QgdGhlIHNt
YWxsZWQgd2hlbiBjb21waWxlZCwgZWl0aGVyLg0KDQoic21hbGxlc3QiPw0KDQo+ICAgIGFkZC9y
ZW1vdmU6IDAvMiBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvLTgxNCAoLTgxNCkNCj4gICAg
RnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcg
ICBkZWx0YQ0KPiAgICBfX2JpdG1hcF9zaGlmdF9sZWZ0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAzNjYgICAgICAgLSAgICAtMzY2DQo+ICAgIF9fYml0bWFwX3NoaWZ0X3JpZ2h0ICAgICAgICAg
ICAgICAgICAgICAgICAgIDQ0OCAgICAgICAtICAgIC00NDgNCj4gICAgVG90YWw6IEJlZm9yZT0z
MzIzNzMwLCBBZnRlcj0zMzIyOTE2LCBjaGcgLTAuMDIlDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUsDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
