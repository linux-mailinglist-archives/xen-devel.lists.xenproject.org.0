Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C9688D0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:18:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmzsj-00022J-Fm; Mon, 15 Jul 2019 12:15:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmzsh-00022E-Nl
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:14:59 +0000
X-Inumbo-ID: 2178d62b-a6fa-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2178d62b-a6fa-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 12:14:58 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 12:14:48 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 12:14:07 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 12:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKQikdSopA2Rp6FartZJN4eCCewqDGzP5dno9RjXiXX/q8HaQyNmW9CKxIQuGxLjgKYbh4SFwRTsDff/i0EHVVL7s6a5Uq0hyv+8n7zr4B/ZyvhG/nB3RhNEaUfPhyTpl0fmgX0H6ismQu4AYmimbBJAS3Mu2vPagPZTqZonFGNyEFiD79Xepdvd6vYpAOuQEYxs6YDoWcFElnGtxPCFjGciMw7oT6Xi01GrpCVoYxuLgZmcuCPtniHyCKofmfqcZPuHPFEgf975kB19Sxp9/zWo5vqtEcNWHwbU1ceb1IyfhfTgxeKXqFK/pIeWxhfmnRBWLD+kCq8DcDNJiJwi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDl55K9XGFTALK6CiL7udQxBv/supUIys3SD6iwDe3I=;
 b=PXMKLW4cFg8E8KxaWxcKWvzf2Z92LHN1SChQqCe8HOANofuJmTLqNoo2nj6BpUbRv/Ym+N23Hp3GXVdG2oEP0/F6cThXaqBkpu8aNd43eE4bdO2qESY/JoYi1jUXsQHgH8uKcNYB9tp2ZjoUJmGrmh3YtGed4rpeyz1g+ABvPye3ij43zLarIS6sBJh8Weud60D3ROv1LR7N00xHXR9tniaZlP9ztNqSKvnlgS18mFVXQQZwj4lkNB3NwU/C/aoVzEb/VZV+cadAHAFQixzsjMyte2Y23DNdeUbcRTObtmNW1JULGuYNzXre7j3yTXurq5CBYoU0nyI/3gGvMwnt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3035.namprd18.prod.outlook.com (20.179.107.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 12:14:07 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 12:14:07 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2] xen/mm.h: add helper function to test-and-clear
 _PGC_allocated
Thread-Index: AQHVOu5JruoXiXL6K0+SvpwJHZPvbabLRrMAgAAngBD//+7QAIAAJ+2wgAASxAA=
Date: Mon, 15 Jul 2019 12:14:07 +0000
Message-ID: <782fcb5c-3511-7c8e-93cb-febefc176c1d@suse.com>
References: <20190715091756.39065-1-paul.durrant@citrix.com>
 <1bdac424-c50e-309a-7a5b-125dbebf4a06@suse.com>
 <4a5720ffb5304255a58a83011bf02aa0@AMSPEX02CL03.citrite.net>
 <cc854558-db7a-9098-6dc8-ca3936a18355@suse.com>
 <78c70a2ccd39416dbfc1999ae7f0f524@AMSPEX02CL03.citrite.net>
In-Reply-To: <78c70a2ccd39416dbfc1999ae7f0f524@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::15) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06e021b7-17a2-434c-e7ba-08d7091def5b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3035; 
x-ms-traffictypediagnostic: DM6PR18MB3035:
x-microsoft-antispam-prvs: <DM6PR18MB3035F9655DC3A404785DC52BB3CF0@DM6PR18MB3035.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(476003)(11346002)(446003)(4744005)(478600001)(4326008)(31686004)(99286004)(102836004)(68736007)(2616005)(71200400001)(71190400001)(386003)(6506007)(66066001)(53546011)(52116002)(26005)(7736002)(66446008)(229853002)(81156014)(81166006)(66556008)(66476007)(186003)(8676002)(6436002)(64756008)(66946007)(6246003)(5660300002)(53936002)(6486002)(76176011)(14454004)(36756003)(80792005)(316002)(305945005)(256004)(6512007)(8936002)(31696002)(6116002)(3846002)(6916009)(486006)(25786009)(86362001)(2906002)(54906003)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3035;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BrpRhiTeB+Ig9jKTf2ClAPHFV3C2mItjnBcu2w4DB1u+CFVKsLuG+TdVhYNCXMum+J0F4O67CSwLP5yyEmUzYT5tITuXrXjtptnAwGCueXN5+skbtCTflqvuNH9xUHoe7mFbpJAd+vxkfI/GBlug8YHXT18TFGicCaWW82DDKKEXCgzxgT2ZLBzObtu4qb+qJWDwUJOXnrfQ5gK+PznRD6HjYtJ3d7e7AcRqn4zyPBKBeX/wvy5fjgdel/fFObf3GTExUxPX9+2BHe2WovIRTVmoLtqU1yCpC/gqvCeu0xKH+nX1LZexQ0AoyOl3XZo3Fpw80cVI4tyLdpKtVgoKANoiCKULY3xaa94vkxoKxHgu5U1h2WbSFivJn4uYFZSK28ZmHZhgmcOmio1bQ1C21/m42UwKatlRbe51hY2rBoo=
Content-ID: <5CCA669480646940840B31CC989DAB45@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e021b7-17a2-434c-e7ba-08d7091def5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 12:14:07.3182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3035
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxMzowOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMTUgSnVseSAyMDE5IDExOjQ0DQo+
Pg0KPj4gV2VsbCwgdGhlIHByb2JsZW0gaXMgdGhhdCBJIGRvbid0IGZlZWwgd2VsbCBhZGp1c3Rp
bmcgd2hhdCBhIG5hdGl2ZQ0KPj4gRW5nbGlzaCBzcGVha2luZyBwZXJzb24gaGFzIHdyaXR0ZW4u
DQo+IA0KPiBPay4gSG93IGFib3V0Li4uDQo+IA0KPiAiVGhpcyBwYXRjaCBhZGRzIGEgaGVscGVy
IGZ1bmN0aW9uLCBwdXRfcGFnZV9hbGxvY19yZWYoKSwgdG8gcmVwbGFjZQ0KPiBhbGwgdGhlIG9w
ZW4tY29kZWQgdGVzdC1hbmQtY2xlYXIvcHV0X3BhZ2Ugb2NjdXJyZW5jZXMuIFRoYXQgaGVscGVy
DQo+IGZ1bmN0aW9uIGluY29ycG9yYXRlcyBhIGNoZWNrIHRoYXQgYW4gYWRkaXRpb25hbCBwYWdl
IHJlZmVyZW5jZSBpcw0KPiBoZWxkIGFuZCB3aWxsIEJVRygpIGlmIGl0IGlzIG5vdC4iDQoNClNv
dW5kcyBnb29kLiBJJ2xsIHJlY29yZCB0aGlzIGZvciBtZXJnaW5nIGluIGlmIG5vIG90aGVyIG5l
ZWQgZm9yIGENCnYzIGFyaXNlcy4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
