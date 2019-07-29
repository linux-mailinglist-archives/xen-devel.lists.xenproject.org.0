Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C378FA9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:43:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7m1-0000oP-Jc; Mon, 29 Jul 2019 15:41:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs7m0-0000oD-QD
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:41:16 +0000
X-Inumbo-ID: 4a8aa954-b217-11e9-80bc-531c9d3388f8
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a8aa954-b217-11e9-80bc-531c9d3388f8;
 Mon, 29 Jul 2019 15:41:12 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:41:10 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:21:02 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4gQ76nVYo93hVcnOdFAd4jWFd13aVMPiFAmxto0wzEESxcxI40GWMREUe5OWoG5Z5xLUcrfGEt8RjV9cgkAZGF97lnjwhR/Qd9L8sj0K69vf6cYGmhWB9TUJAuGZgmdKQr5sEakJAc5bmXWDlsoge+fStvMivZqdtR3sauAsLNYPIvxI5EZai8lwh6y6DUSNOqLLbsiINZdlVl2kJWmwJLyA1hLQOT9Qk5pOrRiRA3ZyQcWZTIKN35xerYpCrjsTXmnXCp8dnaqmHCz7AG3oAxTo1692Naiir9d+tr+cNIXMCiE7QAiQggDsxTGA5vEjBHSFcTyAj62FPiLV3+KWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwucnqhauOikk1CSZaS5ZU1/Jszs0O/R6BKJer6Fbsw=;
 b=dIFOzP4vKCZ23s0uodpF3YFG+TwZBu0DeWdCc2/USezcYzGCBtGfiIJ6lQHDASfe+uuwjo1fW+CgWLcb41AfqiN9KRWBVELvW2rH+Jp5BC35R0e9JTeNxPX27Ci08FMO5ggXMH/ZB3HJIzS0PmOGlRVOe/zK3/HRd6ftHrHGqDh4wuXaQGcCGRDR1e8rHkvuWh5saMW18rI3owb2RiUB/0ahH01ehvgIweuNyxCYYUqhujnN9NgfnDU2BcG2g+HZBSToh93p+gOED5ni1ZpazH6fo6RXZNLkHZ81ujgcUXNH24QgJXIUgqEr618OJgJ/AGsVklXTFkCaFXuFz3ATEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.137.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 15:21:00 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:21:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v2 6/6] x86/domain: remove the 's3_integrity' flag
Thread-Index: AQHVQu5nDUlAdGLDd0ODUxYDEP6roqbhvI+A
Date: Mon, 29 Jul 2019 15:21:00 +0000
Message-ID: <9250abf4-dbb4-33ce-3ebe-43b087ca029c@suse.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-7-paul.durrant@citrix.com>
In-Reply-To: <20190725133920.40673-7-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:4:29::11) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 102792b9-aadf-417d-2c49-08d714385cf6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB341014EDF726EC005709CFA7B3DD0@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(189003)(199004)(81156014)(81166006)(76176011)(8676002)(8936002)(386003)(102836004)(52116002)(6486002)(66946007)(80792005)(54906003)(6512007)(3846002)(25786009)(6506007)(53546011)(53936002)(6116002)(4744005)(256004)(66556008)(64756008)(66446008)(71200400001)(31696002)(86362001)(2906002)(99286004)(66476007)(71190400001)(68736007)(229853002)(6436002)(7736002)(31686004)(26005)(305945005)(11346002)(186003)(316002)(486006)(36756003)(476003)(2616005)(4326008)(66066001)(6916009)(478600001)(446003)(14454004)(6246003)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R6qNO6krxeFzLt8Et6tQ4mFOoDqniMLlgya5GskWVpLcpxnQl1q09Q/Du+4aJBPqbjjJgNdDxRC24YchC7mkJe6xswJxl8xMK+Yufd6kvjI7Q/AZWc9g0yGH+6zQU+YCLiDnj1pV9OFqZs4wyfSPqeQahXYoB9Ok6quvleanho9ZP9tn05iAEToGJ/ghBOR5y92XgbTEE73xVPfb64twcNIOmZ4aQUkRdiSOJ0AEYBGt+fSH/qs5BmXdfaPq9SQo0Vp8H27TyT2sVoPNWqO+RUJJ1FggF9NdoMF1L3tx3n+6twcMJ1epE0f16Jm2TeyhsJ/ZiFNi2/WAo4fHVVUsStb9qQrVJjI8bLt61SzwQU8BJMlgLgpKL9aVe3jGXgH0U6xun+qviFmu+7YdnzrYg6fThtue6rYDQjkYNjz7MmM=
Content-ID: <458D0FC2541A2C468A42C49B2EE53EB1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 102792b9-aadf-417d-2c49-08d714385cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:21:00.7974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86/domain: remove the
 's3_integrity' flag
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
Cc: Wei Liu <wl@xen.org>, Shane Wang <shane.wang@intel.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gang Wei <gang.wei@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBUaGUgZmxhZyBpcyBu
b3QgbmVlZGVkIHNpbmNlIHRoZSBkb21haW4gJ29wdGlvbnMnIGNhbiBub3cgYmUgdGVzdGVkDQo+
IGRpcmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQoNCkkgbWF5IGJlIGFza2luZyBhIGxpdHRsZSBtdWNoLCBhcyBpdCdz
IG5vdCBkaXJlY3RseSByZWxhdGVkIHRvDQp3aGF0IHlvdSB3YW50IHRvIGRvIGhlcmUsIGJ1dCBz
aW5jZSBUQk9PVCBoYXMgYSBzZXBhcmF0ZSBjb25maWcNCm9wdGlvbiwgcmVqZWN0aW5nIGJvZ3Vz
IHVzZSBvZiBDREZfczNfaW50ZWdyaXR5IGFnYWluIGluDQphcmNoX3Nhbml0aXNlX2RvbWFpbl9j
b25maWcoKSB3b3VsZCBiZSBhIHVzZWZ1bCBhdWdtZW50YXRpb24NCmhlcmUuIElmIHlvdSBkb24n
dCB3YW50IHRvIGRvIHNvLCB0aGVuIGZlZWwgZnJlZSB0byBhZGQNClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpvbiB0aGUgcGF0Y2ggYXMgaW4gaXRzIGN1cnJl
bnQgc2hhcGUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
