Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410C73353
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 18:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJiu-0008QN-U3; Wed, 24 Jul 2019 16:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqJit-0008QI-I2
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 16:02:35 +0000
X-Inumbo-ID: 6feba778-ae2c-11e9-99b1-c3f570de1b21
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6feba778-ae2c-11e9-99b1-c3f570de1b21;
 Wed, 24 Jul 2019 16:02:32 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 16:02:18 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 15:58:58 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 15:58:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwgm6oqVx1SKWWsGWwBwaqVjbI2pmZC0gXd/mosROHGoUUjeZWNnHoHD0e6HljHrSTa2smwbekNKnnpdRVWuB03XQOIBi7lPddoYfYltXKu1wtSjgxmwdQgyH4qyhc4DPizOl4geMDOtrCo3kYXQmgqRk2gUXxrR3e1NNaADmQ5XzoPUNAQjxgWNlluEkjuRJv5eR1CaxFpKU9UVyg1qso/5ZfHnb3w00LPcSTOOzA/FogcLYVO0ooQz3Sep1gvDZI1QZZOdGcoOBG1UbnfV2KtMk02EcIN3cqDffnotj2aO9/6VwelvCTZsuY5STcqVsJ4bgt2ysXYAzUlcGXhybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7ELMERmrKvy+HHg/iFFp3qIiD9gI057VJoMfHR9w8Y=;
 b=mkRahdSTHHxJwxUolpVDYtZT5bd+WmkMwIFrL+TMqVO3Skiw2CYLJ+rX3yJvP52iqrEa3ybk+eXMcVRTsg4gLZs9nNyyF5bU7bXCftXbLLDV183qSfC25247AedCNDbjOaHlwI2HLpOVLS8rDvMrORDpqyRXMPA6lY5vdO44RAM7LDh8SSUwm+do38EP+zR97XdG4fYZBitUSODzDnlp6Yn5tCo9eteFOzVUuo/mP/mdx9ipNM79bV4gJzCngwRJaw88tFyBzUAj4ErzW2Nycw6pbumk3XVmrrJpmS+w9sfjiJ9sluFrH2PsYL42goahPtk3JuDEDAlALyK5Gxv9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3265.namprd18.prod.outlook.com (10.255.138.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 15:58:57 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 15:58:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v3 1/2] x86/mm: Clean IOMMU flags from p2m-pt code
Thread-Index: AQHVO84pz4B9FlJLi0aoJloWZR7W5abZ+cOA
Date: Wed, 24 Jul 2019 15:58:57 +0000
Message-ID: <625b2018-0db4-b9b9-2ab6-ebbbf44fcfef@suse.com>
References: <20190716120056.1723-1-aisaila@bitdefender.com>
In-Reply-To: <20190716120056.1723-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:6:1::43)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1da7cc50-14ec-4186-5918-08d7104fd5b0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3265; 
x-ms-traffictypediagnostic: BY5PR18MB3265:
x-microsoft-antispam-prvs: <BY5PR18MB32655001521C8AF896832823B3C60@BY5PR18MB3265.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(199004)(189003)(446003)(71190400001)(71200400001)(6916009)(6246003)(7736002)(305945005)(53546011)(6506007)(386003)(186003)(4326008)(3846002)(6116002)(229853002)(6512007)(14444005)(256004)(6486002)(2616005)(476003)(11346002)(486006)(81156014)(81166006)(68736007)(76176011)(478600001)(8936002)(86362001)(80792005)(31686004)(66066001)(54906003)(36756003)(316002)(25786009)(5660300002)(99286004)(4744005)(66476007)(66556008)(64756008)(66446008)(66946007)(31696002)(26005)(6436002)(2906002)(102836004)(53936002)(8676002)(14454004)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3265;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tORqmv4zDXzeMKVUlGF3UvRRCOy2FFXY3Eb9HNlknkIFOsQKt1MMgNILTpWzNzdsNXF1nNgorFBCHDVMFiTVGajWJ7jn8+RCGWmUAlXZUSdF6TRPaPeXt9TUkZqUe7YHaKD0FfZTkV84CD+yJAfm/TwCdT7I0sVwdSOTFNlXXrg61yoUWY2dIzrjU1M9tXGh9js0MzOIJoUTGd96rerBcoHyxH9bAj1LQjh0CIMheQBm3ltEKZX24OBRJtCbmvsXWL+8qMTGUfh2y5aJYVt41akijNZrLPMTd1HNWIFYdVBY2JAv+G9N63uR4lAO11JC8FSAjd0k+/zKw+lNZa1HHQMiCYO3weC6h1/LQThsmtNa1/iQFmNlXHF2+o4PfjL9ovTPo9a2P1Vi2wbyNMEZn/zk13D2BMbazg7MAyrldJs=
Content-ID: <485B1D77FC59934692F18B24EB83E4D6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da7cc50-14ec-4186-5918-08d7104fd5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 15:58:57.1898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3265
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: Clean IOMMU flags from
 p2m-pt code
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
Cc: "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNDowMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IEF0
IHRoaXMgbW9tZW50IElPTU1VIHB0IHNoYXJpbmcgaXMgZGlzYWJsZWQgYnkgY29tbWl0IFsxXS4N
Cj4gDQo+IFRoaXMgcGF0Y2ggYWltcyB0byBjbGVhciB0aGUgSU9NTVUgaGFwIHNoYXJlIHN1cHBv
cnQgYXMgaXQgd2lsbCBub3QgYmUNCj4gdXNlZCBpbiB0aGUgZnV0dXJlLiBCeSBkb2luZyB0aGlz
IHRoZSBJT01NVSBiaXRzIHVzZWQgaW4gcHRlWzUyOjU4XSBjYW4NCj4gYmUgdXNlZCBpbiBvdGhl
ciB3YXlzLg0KPiANCj4gWzFdIGMyYmEzZGIzMWVmMmQ5ZjFlNDBlN2I2YzE2Y2YzYmUzZDY3MWQ1
NTUNCj4gDQo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRl
ZmVuZGVyLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
