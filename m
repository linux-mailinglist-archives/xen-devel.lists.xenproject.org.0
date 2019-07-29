Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7378E63
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6xD-0003cs-K9; Mon, 29 Jul 2019 14:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs6xB-0003ch-VA
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:48:45 +0000
X-Inumbo-ID: f50ac4fc-b20f-11e9-9a02-130ecc1b941d
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f50ac4fc-b20f-11e9-9a02-130ecc1b941d;
 Mon, 29 Jul 2019 14:48:42 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 14:48:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 14:27:06 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 14:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYkc+c+r7A7odw9vrHrGkuJ6n6HRcVG75PZtsXcgPbiRNarAxgIP90lzgzEMBL64N/pvk2L/GHWEhdUnKL2uHx1cvE06B69GL5po9AsMaFip/CIeAy1cnhYfpTzv19tZ5FCbAxW1XW84Umi9lN3B2miKUjw5y2/fE2vypx0eqhFIg6fQ8xPy5VGVijbup2VyvK4LUSdVwG9nUXmXSBRFUmTwLDIHQr/T+/ja9zNU8e2wYOX3LXkclab60u71a9hZhrNA7EOdCQFFOK4pNHpWSI+FlHeq+hsGd0Bx8gE9gCiCTjVtkwHx635OZUgnO71lp3eoyCyNjTBk1Lyoig9kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOpwW9z4opfiTO8f5UeO3lfmqrWbYXmX5gbm6IfLmj4=;
 b=CGM0OBcLKGLNycT709UKFWvzmqAgw42UuF5edDrDK0fHXs972bwByc+hLnjaFZ2UWU0Uc3+fc9u0UiMJQhadN89Qi7EKfpo/7L9ipxokZabrHPnKjQkzwHHwL5wBVHwssUHKpB44oSKXHymL3gzJtZr+XL9QwEFfWJt9w9I0ehXIUyVmKcHxGTNgWmGsu8lqeQW/Ir/JM16EDqROaC0JKZ6isjRLjzEjGUGt8kQeDMLmqzngRMiyurM+WT4nPv4tUsJQqaho273uuteIQNtA/OsSoXqwyvt9Eo/LLPjr00CViGkzQbUhv9t9mnAXzs27spGds/giYtnPCSwekWQFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.137.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 14:27:05 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 14:27:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v2 2/6] domain: remove 'guest_type' field (and enum
 guest_type)
Thread-Index: AQHVQu51p3+tO9+a50epDLWv6WiT+6bhrXwA
Date: Mon, 29 Jul 2019 14:27:05 +0000
Message-ID: <511f03cb-4ac3-da1b-ac54-8a8ab231f7c4@suse.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-3-paul.durrant@citrix.com>
In-Reply-To: <20190725133920.40673-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0032.eurprd02.prod.outlook.com
 (2603:10a6:6:15::45) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f2c8666-7e8d-450e-d839-08d71430d494
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB3410DCE5E401ABC5AAA57093B3DD0@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:86;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(81166006)(81156014)(76176011)(8676002)(8936002)(102836004)(52116002)(386003)(66946007)(54906003)(3846002)(25786009)(6512007)(80792005)(6506007)(53546011)(53936002)(6116002)(7416002)(4744005)(6486002)(256004)(66556008)(64756008)(66446008)(71200400001)(31696002)(71190400001)(86362001)(99286004)(2906002)(66476007)(68736007)(229853002)(6436002)(7736002)(31686004)(26005)(305945005)(11346002)(186003)(316002)(486006)(2616005)(36756003)(476003)(4326008)(66066001)(6916009)(478600001)(446003)(14454004)(5660300002)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5suq/cnHaDQE8OpdZ+iWaYIQmy2pF4FCL/xIpWVH5nqBHkU/Ez1BDQX6txrrf0kjUNwK1ZvVLGgvTi1TnT7Mf5+Wd5YNGMOAT2KMzbnSASg37pEt4c4mBF3t4f3lJpWhyPN4XRvRoICk1SlLmuZkoj6GDwpFSK+dqByPPtKojuipLKtPkEukZOqfV5kMylfP1lj3ay6tW8LHPrwr1iph/xGYpF409QpheE+4hOmMGlN5W6Sm+w6T/qdZkyQNT1IbFwpMiGkpJvf/e8H0ZOpjFOgxGTYtGhxMtMJeM27LPVSI3HUDkn4qcbLovvHdATaepeI2LRQTjFSNdTktn+rsUrT570bstZvUlVg4kyiPAi1ENYx1Y8Y/L8LyhfAuefj3bpG3miHFDbUYNMXP6yPvbDG7z4/xbyZUwKoFlGFFL6U=
Content-ID: <C31815F32480984BAB6DE62539F92F60@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2c8666-7e8d-450e-d839-08d71430d494
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 14:27:05.5163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/6] domain: remove 'guest_type' field
 (and enum guest_type)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBAQCAtOTE2LDggKzkx
MCw4IEBAIHZvaWQgd2F0Y2hkb2dfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7DQo+
ICAgDQo+ICAgc3RhdGljIGlubGluZSBib29sIGlzX3B2X2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQ0KPiAgIHsNCj4gLSAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFYpDQo+IC0g
ICAgICAgICAgID8gZXZhbHVhdGVfbm9zcGVjKGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9w
dikgOiBmYWxzZTsNCj4gKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFYpICYmDQo+ICsg
ICAgICAgICFldmFsdWF0ZV9ub3NwZWMoZC0+b3B0aW9ucyAmIFhFTl9ET01DVExfQ0RGX2h2bV9n
dWVzdCk7DQoNCkkgdGhpbmsgdGhlICEgc2hvdWxkIG1vdmUgaW5zaWRlIGV2YWx1YXRlX25vc3Bl
YygpLiBXaXRoIHRoaXMgKHdoaWNoDQpjYW4gYmUgZWFzaWx5IGRvbmUgd2hpbGUgY29tbWl0dGlu
ZywgaWYgbm8gb3RoZXIgbmVlZCBmb3IgYSB2MyBhcmlzZXMpDQoNClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
