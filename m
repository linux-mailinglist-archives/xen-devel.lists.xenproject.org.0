Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30891EF38D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 03:35:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRocn-0001kf-6h; Tue, 05 Nov 2019 02:31:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cj+1=Y5=mellanox.com=jgg@srs-us1.protection.inumbo.net>)
 id 1iRocl-0001ka-UW
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 02:31:16 +0000
X-Inumbo-ID: 567fc258-ff74-11e9-a190-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 567fc258-ff74-11e9-a190-12813bfff9fa;
 Tue, 05 Nov 2019 02:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6T8ZDZCa0l7TqARLqpUnP2WA+rkJ7MKKSBPo97L7ijY6iBwWIXwecihxwgnyYODpzPI0hOKme5LGTXAh1WZxdWzg1/1cXFsnzQ4gdd1gzGAm5BXJP8PDwTb2NY6JptTs1L55RJrOLsQq4QbiZnss5ALGhye9kQnp1hALdyWIy55VrSilMXPZF2CIGYaAOWzenF/uc1jmKesCJcQ4UqdVKbUOtLkzjssh8fCLDJ80j71RYDIwfN8FJTaQeVSUvtMH6f1Mls4AARjMf852FYsDnKkPjKV43lQawMcAxTQDmlBtsowJUS7IM1N/SBET4xADRmPUgRXtsRW3RhOdGw7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+7IscvhUZj8/JgUgTQRqK5pwqwTaSdwn71ra60cQpg=;
 b=GZ5hV82Td+nLE4WXjRiU/4YkN9lZPKC4FUvMFwkq1OFscb6XTkbrH8Dj81+Ex9xAP4cqwHiYsC4jm0Ezo0gnqf18cpT5JGsAqsMdQy3J/I+6qOPxKQc6T8FSFpqLIoNQ6fRa+LCOOM1+OdYHAhzJiUBNLtIN9kadIiEKzloaRH0AGxwMhT+qtRIeKVnRSZ5JLH1XvyFnFlOq1rqn9UlsvlV5TfLLdpPsL8lt2wnTJl9ealPRMUbTJUQ/F7Cql6l0tB/LHfLbuHRIyWUnZv9PAzLkZTL3c7wW29lbIzBvkoyYQx/3HseId/Sf1MoEQZ82qAtwBWdTFpIK7TIqPKR4aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+7IscvhUZj8/JgUgTQRqK5pwqwTaSdwn71ra60cQpg=;
 b=gngE79Bvs6Y7fWPbu2HwcUVZXIRq+STpf3YQMv6nnYymT/BpwH991WBvAH3txZKcL2qiSyKK7iokps6gruyEskBHs+G68r4Y7WYvM2J8qUwCuYacdFwMx4j/Rsre1M4Oz19ZpuimvqIII12/PGfhl5Sn5V2sKpby2C8EVxA1wU4=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4973.eurprd05.prod.outlook.com (20.177.52.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 02:31:12 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 02:31:12 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
Thread-Index: AQHVjcvKV253DVP8r0WB5NYgPgZcBad7m8uAgABKxgA=
Date: Tue, 5 Nov 2019 02:31:12 +0000
Message-ID: <20191105023108.GN22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <3938b588-c6c5-3bd1-8ea9-47e4d5b2045c@oracle.com>
In-Reply-To: <3938b588-c6c5-3bd1-8ea9-47e4d5b2045c@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:c0::36) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5aff1ba-e389-4613-96b3-08d761983919
x-ms-traffictypediagnostic: VI1PR05MB4973:
x-microsoft-antispam-prvs: <VI1PR05MB4973FE948FB772C4420372EFCF7E0@VI1PR05MB4973.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(36756003)(6486002)(256004)(52116002)(486006)(14444005)(478600001)(86362001)(14454004)(186003)(305945005)(7416002)(2906002)(102836004)(7736002)(6116002)(26005)(66476007)(66556008)(66446008)(64756008)(66946007)(76176011)(11346002)(99286004)(71190400001)(316002)(2616005)(71200400001)(8936002)(6436002)(33656002)(3846002)(25786009)(6916009)(6506007)(53546011)(386003)(66066001)(6512007)(81166006)(446003)(229853002)(54906003)(4326008)(81156014)(6246003)(5660300002)(1076003)(476003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4973;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vBZ0Z2NhVzsjJAe7Kq9mS/lVT87prjRY2DebHQtJLF8qghumsbIK3H9j8SO5o9fRUHiDj4VrpWRspleFcQEM/exPW99z+IuP8gqlla+63kdrBW88TKbquJmgA6qGVWIPYh9wMiekbatqIReFH3LF66Qg20Oo26z+uEoyRtEdqPvPRoNgTV3Pd6hqVMX4MdMBlFJpshWk0Z8fucylMQgeAUbEZ46pUaaz1mXI430lroI5SQ3jYp/3WvSgOr9aLqwFg8Hhvig3+KCaaS5G++dwOVy4/xNG/Swl4kR5pVVDkbD2VlNVK8NjsBFRMPfuFdClo/rob/sGbRw6HbEn/mhc7rylSKwPO2pVON6XMKiPL7VWwbM36Hs00yub8qItDx8QrLh06/VvDEkaQgAPe3It7rfei9KmuGwOlFIxkYQDqQnfppA1iusicblqmMJldO24
x-ms-exchange-transport-forked: True
Content-ID: <27A5E315F0FBE349AC48D47C02A20B09@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5aff1ba-e389-4613-96b3-08d761983919
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 02:31:12.3841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4a6UsdCOfg0iur9gbQw05+LLww53hTdCx+jkPZ/cAoDUgl4GRRDrh+zIq3jbBkkF7kv+st9bYwT7/EoofKpRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4973
Subject: Re: [Xen-devel] [PATCH v2 09/15] xen/gntdev: use
 mmu_range_notifier_insert
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDU6MDM6MzFQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDEwLzI4LzE5IDQ6MTAgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+
IEBAIC00NDUsMTcgKzQzOCw5IEBAIHN0YXRpYyB2b2lkIGdudGRldl92bWFfY2xvc2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiAgCXN0cnVjdCBnbnRkZXZfcHJpdiAqcHJpdiA9IGZp
bGUtPnByaXZhdGVfZGF0YTsKPiA+ICAKPiA+ICAJcHJfZGVidWcoImdudGRldl92bWFfY2xvc2Ug
JXBcbiIsIHZtYSk7Cj4gPiAtCWlmICh1c2VfcHRlbW9kKSB7Cj4gPiAtCQkvKiBJdCBpcyBwb3Nz
aWJsZSB0aGF0IGFuIG1tdSBub3RpZmllciBjb3VsZCBiZSBydW5uaW5nCj4gPiAtCQkgKiBjb25j
dXJyZW50bHksIHNvIHRha2UgcHJpdi0+bG9jayB0byBlbnN1cmUgdGhhdCB0aGUgdm1hIHdvbid0
Cj4gPiAtCQkgKiB2YW5pc2hpbmcgZHVyaW5nIHRoZSB1bm1hcF9ncmFudF9wYWdlcyBjYWxsLCBz
aW5jZSB3ZSB3aWxsCj4gPiAtCQkgKiBzcGluIGhlcmUgdW50aWwgdGhhdCBjb21wbGV0ZXMuIFN1
Y2ggYSBjb25jdXJyZW50IGNhbGwgd2lsbAo+ID4gLQkJICogbm90IGRvIGFueSB1bm1hcHBpbmcs
IHNpbmNlIHRoYXQgaGFzIGJlZW4gZG9uZSBwcmlvciB0bwo+ID4gLQkJICogY2xvc2luZyB0aGUg
dm1hLCBidXQgaXQgbWF5IHN0aWxsIGl0ZXJhdGUgdGhlIHVubWFwX29wcyBsaXN0Lgo+ID4gLQkJ
ICovCj4gPiAtCQltdXRleF9sb2NrKCZwcml2LT5sb2NrKTsKPiA+ICsJaWYgKHVzZV9wdGVtb2Qg
JiYgbWFwLT52bWEgPT0gdm1hKSB7Cj4gCj4gCj4gSXMgaXQgcG9zc2libGUgZm9yIG1hcC0+dm1h
IG5vdCB0byBiZSBlcXVhbCB0byB2bWE/CgpJdCBjb3VsZCBiZSBOVUxMIGF0IGxlYXN0IGlmIHVz
ZV9wdGVtb2QgaXMgbm90IHNldC4KCk90aGVyd2lzZSwgSSdtIG5vdCBzdXJlLCB0aGUgY29uZnVz
aW5nIGJpdCBpcyB0aGF0IHRoZSBtYXAgY29tZXMgZnJvbQpoZXJlOgoKICAgICAgICBtYXAgPSBn
bnRkZXZfZmluZF9tYXBfaW5kZXgocHJpdiwgaW5kZXgsIGNvdW50KTsKCkl0IGxvb2tzIGxpa2Ug
dGhlIGludGVudCBpcyB0aGF0IHRoZSBtYXAtPnZtYSBpcyBhbHdheXMgc2V0IHRvIHRoZQpvbmx5
IHZtYSB0aGF0IGhhcyB0aGUgbWFwIGFzIHByaXZhdGVfZGF0YS4KClNvLCBJIHN1cHBvc2UgaXQg
Y2FuIGJlIHJlbGF4ZWQgdG8gYSBudWxsIHRlc3QgYW5kIGEgV0FSTl9PTiB0aGF0IGl0Cmhhc24n
dCBjaGFuZ2VkPwoKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
