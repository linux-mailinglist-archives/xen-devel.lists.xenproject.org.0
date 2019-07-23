Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9B718BC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:53:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpuFK-0002MH-8b; Tue, 23 Jul 2019 12:50:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpuFI-0002MC-Pz
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:50:20 +0000
X-Inumbo-ID: 6caf6d6a-ad48-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6caf6d6a-ad48-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 12:50:18 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 12:50:07 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 12:47:05 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 12:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB94eq17yzPhJLF+R21O6wsfQiqDHGOQgmUX6c7j9KxVytr8t7qMlEqlYcXIxlYmh2t7nf25+TPJASFA6+2GX2uM67EZm+RtxtXCZ4wNXvIwUnQGoa6P7+0nUBFNsSChSMChwHK6Fsh9kkrkA3HzgBhSmyNWz4FBTFkYT2FHU7Sbd3fd/IGfsU1WbuZpIZwpIy7EEqTo6yyzfO8d+n/iOl9LTXfo9+CITJzqETJZNlUjmyPeOsMloTueTg4PrwhUcw8GdZdiaQ9AVCImVimaCFZrgfvOviy2zO/1Kv+nQRqFglEO18PPp5INBfggieQa6zRcLEtDodzF/AHDB17x7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54M3dujgMHnxh/MCBah6W/LF5K/PgcbtiC0jq4LGJUw=;
 b=OZM+Yvg990Q33rViEEzELwWKSHKe66mbJz6y9UvCySRU9Sw4xtn9dZG16ViCJ4lB2Aghc1cnv7SDvRJotPjk0y5oXdUC476jvMb4WRN6E86dP8zVtZDCZSRU030Bi8TUEs5C5Bd2xhZCpujyE3kcYLkGxZSlkRtAlFG8npYKZjej9v5tl/22uorxMf6HLlHjbM7Kf+Wsn1Zm0Jvhi3Q7dgwOaBe28+Kbn6k3K+Dp3DOh2X+MdWmCyGpkO9sBF9QYwAPzFquoEr/0rby+1an4IeCfE1GTtbjnWzVRtywSgX8XNBLJ9zEIzolBFzKSxWe+pfrKmxtY3fRKdXv30ZKacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2906.namprd18.prod.outlook.com (20.179.49.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 12:47:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 12:47:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2] x86/p2m: fix non-translated handling of iommu mappings
Thread-Index: AQHVQVRariXxqV/J3UKg/S7dHXhtWKbYJsIA
Date: Tue, 23 Jul 2019 12:47:03 +0000
Message-ID: <41fc5ed3-fa0d-81c1-642a-39ab5337d55f@suse.com>
References: <20190723124343.75872-1-roger.pau@citrix.com>
In-Reply-To: <20190723124343.75872-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c8feb43-0388-4109-e0ef-08d70f6bdc92
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2906; 
x-ms-traffictypediagnostic: DM6PR18MB2906:
x-microsoft-antispam-prvs: <DM6PR18MB290617F4A2F6F790B7248E0BB3C70@DM6PR18MB2906.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(6512007)(66556008)(66446008)(64756008)(66476007)(8936002)(53936002)(25786009)(81166006)(81156014)(7736002)(6436002)(36756003)(6246003)(86362001)(99286004)(6916009)(305945005)(2616005)(2906002)(5660300002)(229853002)(8676002)(4326008)(31696002)(66066001)(80792005)(478600001)(68736007)(4744005)(6506007)(52116002)(486006)(6116002)(76176011)(54906003)(446003)(71200400001)(11346002)(476003)(31686004)(6486002)(66946007)(102836004)(316002)(71190400001)(26005)(53546011)(256004)(14454004)(186003)(3846002)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2906;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 07JRr5cbu6o1XIug7hSz2i8ZHT6XFcvYsmU9i3xJSvjlM8oslCTnKi/PSOD8w9v7yfHzPwEPPcNcq03GPLTHCoQaz8Qqgtj3MueVngxcTDeTTAOurun8P4KN3uuK8NXuFeHpSNxu6f4iiW144dkfXkDsW4QEqYPSHGBHDN7j1zFOLjqSOmvqPjB63bAeSaJgdrzdRBT9L2V/tCVHb+3tkPslq7gSaEik7AfhuXTXTxppDRn+2UE1c2KG+Mk24inccnPP25dfj4eJsILpSaDbZkWMTO4+jW78qLgXnM0XFTnN8YJuAynb560LpnpMXT0CLYXZCcxxMOGCAkf0cbPWCtHE8wc99dKX+yO70hyWTTfcJZRxQqznjZ/m0YtBnxt76KZMtPn5sVLZFu7AGdWl9J4F3pLyuPzGmJVbeQ/b5/k=
Content-ID: <79B855153CB0F74AB87790C0222E6DB0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8feb43-0388-4109-e0ef-08d70f6bdc92
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 12:47:03.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2906
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/p2m: fix non-translated handling of
 iommu mappings
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, WeiLiu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNDo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGUgY3VycmVu
dCB1c2FnZSBvZiBuZWVkX2lvbW11X3B0X3N5bmMgaW4gcDJtIGZvciBub24tdHJhbnNsYXRlZA0K
PiBndWVzdHMgaXMgd3JvbmcgYmVjYXVzZSBpdCBkb2Vzbid0IGNvcnJlY3RseSBoYW5kbGUgYSBy
ZWxheGVkIFBWDQo+IGhhcmR3YXJlIGRvbWFpbiwgdGhhdCBoYXMgbmVlZF9zeW5jIHNldCB0byBm
YWxzZSwgYnV0IHN0aWxsIG5lZWQNCj4gZW50cmllcyB0byBiZSBhZGRlZCBmcm9tIGNhbGxzIHRv
IHtzZXQvY2xlYXJ9X2lkZW50aXR5X3AybV9lbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
