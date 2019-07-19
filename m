Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725656E8C8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 18:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoVjK-0002w7-NB; Fri, 19 Jul 2019 16:27:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoVjJ-0002w2-NH
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 16:27:33 +0000
X-Inumbo-ID: 18c81190-aa42-11e9-b574-9ba569ccdd00
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18c81190-aa42-11e9-b574-9ba569ccdd00;
 Fri, 19 Jul 2019 16:27:30 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 16:27:23 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 16:27:18 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 16:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1KUb/ofWVPis249TQfFjXBPBovmprHblo5birEsLavhGpp2P+rNXoTaAzgKskEJ+JSzo7KQ/w45553GBBwgGS1PHvpBWGoG8OhuRsjScAaU+EuE6St2n55BCwoS182E1vpU6bWTUqBLQr3F80vmt9RdwAG4y+Xn8K6Uy0QQBn0kU81jFujGsXXia5cosLiHAhX4ZZ59n0RcQeuoO9aJkUecNjFjGyvT2x1E4GFyiYrJojXpfhM6FOk9bmgfVZgVZiF2R0ObBs3UFXdpv/Ou6hT5PVotp+avmp5FOYShNoLp1RPu70APIKS0EjHrSgviTGMQX7Z7J39dFITHqGQIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/kizGlzRxv2XOOifzXNA8nKsGkSokYId/UCM/67wDo=;
 b=JeAaCYDi7Q162tEDLq/NrzzAmZCC6t4YgVwQxDXj86GUtSKZhOmxZZGcRhB/8wbBmiA3nS7GxsLF98R+2T2A+U5TlmLWkwVS0315rcHEJ35AXVZ1NpadsrzDybq2w0S/XlDb+XbBo3ex+tYYs7xbmzc3yE6F+aM7BX3FioLJVloezqc/h7qGJe5c6q0ZL02jtO7UXxqVX+sceSZkUxM/41AaLnRymz6hrDXohUFVrzrBpGpnz8aCoM5sm32pTL4leT6f0yxXOIfinXFN32fDLP5NfzB4eA3SojJ7RZGufnDlDbKKAbIDVVOQ3cqQY+gtgzeIbFwWk8cDKlI0dHwOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3337.namprd18.prod.outlook.com (10.255.174.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 16:27:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 16:27:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 02/14] AMD/IOMMU: use bit field for
 extended feature register
Thread-Index: AQHVO/SBPI6DYZWl7E6KQgqsoIfCTKbSJLKcgAABCYA=
Date: Fri, 19 Jul 2019 16:27:16 +0000
Message-ID: <b9a4e144-38bd-633c-c462-4ff772de8355@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <38c3d885-2edb-d450-c6e5-bc476b679bf6@suse.com>
 <a5207722-4276-7e87-7866-f36a5cb30e75@citrix.com>
In-Reply-To: <a5207722-4276-7e87-7866-f36a5cb30e75@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0da618c1-1158-4792-d0be-08d70c65f6bb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3337; 
x-ms-traffictypediagnostic: DM6PR18MB3337:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB33372E2E3ECB8E9E31BD7325B3CB0@DM6PR18MB3337.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(199004)(3846002)(25786009)(36756003)(31696002)(14444005)(256004)(6116002)(86362001)(80792005)(446003)(11346002)(186003)(26005)(6916009)(229853002)(476003)(2616005)(102836004)(31686004)(52116002)(76176011)(81166006)(2906002)(14454004)(81156014)(6506007)(386003)(53546011)(486006)(5660300002)(66446008)(71190400001)(71200400001)(6246003)(66476007)(53936002)(4326008)(8936002)(305945005)(7736002)(66556008)(66066001)(4744005)(66946007)(99286004)(478600001)(6436002)(6486002)(966005)(68736007)(8676002)(64756008)(54906003)(316002)(6512007)(6306002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3337;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IG9xWAq2Fa3jESc+vgaBrYSnmXydwrcE7pmC/NpY1spPkt48wkBgvbKFNHzyELnkrUw9bhpCWYhAoxQGRseTTd4ofE9+TlUZUCZ88DWpbtOYj7CPyD1KzeocZRcyljM79g7pFbSHGDJCUTjvNeibbsncTD+Q0G0QvuFl6yTc6zxGyarDh5r8jZg2R7V16AMnUQjXbamu3zkAMmDDqezaMtQ2W5bxuj1k1LPxI+jV/GNNUZ/f8tSfgUoErCvB1dmbcWCntCfDLT4UXxzMMnPvQANKOSKjZK86RvQTM7BgIMTDSCWrXicU7mYuMz6wvK66v1U9oHBI7zQwkAz0s5fP5P1RkfqBaV75NwJyCT16sj6IAtSSmaslBazG1Ye/0afDH6kKie6G6BrkgICQhyyHR6vltpQzwbWDIbg1hKV8boA=
Content-ID: <9DE05D81F398934D8D5DA13C68BD3547@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da618c1-1158-4792-d0be-08d70c65f6bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 16:27:17.0006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3337
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 02/14] AMD/IOMMU: use bit field for
 extended feature register
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxODoyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxNzozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBUaGlzIGFsc28gdGFrZXMgY2FyZSBvZiBz
ZXZlcmFsIG9mIHRoZSBzaGlmdCB2YWx1ZXMgd3JvbmdseSBoYXZpbmcgYmVlbg0KPj4gc3BlY2lm
aWVkIGFzIGhleCByYXRoZXIgdGhhbiBkZWMuDQo+Pg0KPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkg
YW5kDQo+PiAtIHJlcGxhY2UgYSByZWFkbCgpIHBhaXIgYnkgYSBzaW5nbGUgcmVhZHEoKSwNCj4+
IC0gYWRkIGZ1cnRoZXIgZmllbGRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IENJIGlzIGhhcHB5IHRoaXMgdGltZSBhcm91bmQu
DQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVu
L3BpcGVsaW5lcy83MTk0MjE5Mw0KDQpIdXJyYXkuDQoNCj4gQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClRoYW5rcy4NCg0KPiBidXQgYXMgYSB3
YXJuaW5nLCBJJ20gc3RpbGwgY2VydGFpbiB0aGF0IEZFQVQoKSBpcyBhIGZyYWdpbGUsIGFuZCB3
aWxsDQo+IGJlIGxpYWJsZSB0byBicmVhayBvbiBmdXR1cmUgY29tcGlsZXJzLCBzZWVpbmcgYXMg
dGhhdCBzZWVtIHRvIGJlIHRoZQ0KPiB0cmVuZCBmb3IgZGlhZ25vc3RpY3MuDQoNClRoZXJlJ3Mg
YSBjZXJ0YWluIHJpc2ssIHllcy4NCg0KPiBJJ20gYWxzbyB1bnN1cmUgd2hldGhlciBpdCB3b3Jr
cyBjb3JyZWN0bHkgb24gc2lnbmVkIGZpZWxkcy4NCg0KSSdtIHN1cmUgaXQgd291bGRuJ3QsIGJ1
dCBJIGRvbid0IHNlZSBhbnkgc2lnbmVkIGZpZWxkcyBhcHBlYXJpbmcNCnRoZXJlLg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
