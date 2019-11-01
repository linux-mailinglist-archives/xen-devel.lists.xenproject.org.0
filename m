Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8EEC8F4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 20:19:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQcQO-00035O-LL; Fri, 01 Nov 2019 19:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zpbT=YZ=mellanox.com=jgg@srs-us1.protection.inumbo.net>)
 id 1iQcQM-00035J-SW
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 19:17:30 +0000
X-Inumbo-ID: 3eba9a3e-fcdc-11e9-956d-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3eba9a3e-fcdc-11e9-956d-12813bfff9fa;
 Fri, 01 Nov 2019 19:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7aRjwc6kVYlnjJg0Ay/cisXSCZAkhS4snLwk92bt9BQSVIsZJJvzcFLRYkDHBIRuxpCaAqV2Yl553WuhbdaY0rDUp7VuYlwaKw5R/xHoflvztChddAZZnmK94Iwumvi+xAYvxFvVtSgaHeLuY+KTHWnYXq10Or+VfIyA9nLmIAAgSyCAQfCuCtRxtEY66QWOtUubLPxAqiybfO3oTJrUiN0HW2B0nb2yHZanMs0dnxjGZrWTdWuMqK0rQGRsFh0RDaSTwnw82rAGNXOIhlm9q2xKs2U5upHxcJfYZYUeGGX6aBldYmqxLJfNlc0ck3eRssk2wYUF34AkqypIjktFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vzaubDtUDNP/lIo74ytTn2jiceW13gp+6YIJsrIIhA=;
 b=XcawuRoZ8Eyr1QvyOAX64OEyWdHeveZRZgRBmVMuJs3rCwIORJwVE2OJ5yP5EqtLCVP6hXKfYdb6UiSo92ybKut2eXtcqnlecjNV4Uz6HjaqQLcnZJgyDv9sLj56DdkL1sZYb9J4At6xvPWdOLKqT2f6GyKrlrsd5bQOK/b9CUWrnGlb9GXugFBqX+gqmf56F0a/udLNPh/GCLD1keeN5D8hNxhN/wK07+ZJrsfeH0Ccx4jbNFg/4b9Ep7uEXwCBHiI/xlIshGDSWGIwWCSW+t9dIemtALOWCvUz+FSOm2Taa3uJngZUTrrLws+ZAs9S7l4+0re0UIyPOAZOH2bb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vzaubDtUDNP/lIo74ytTn2jiceW13gp+6YIJsrIIhA=;
 b=MD6Q3Cf5eGFkd80S6c8Qp6q6E8MWwPWGCkbmN6wJzkr5lZuehFA5EGtV2tcUds3SONmqbte8CtNr/7r47QAPETMoh/zpIuRXTsKvsVfebu5HwpEJJcBddZcyy/a5XqfrLzOkOXVfhS5bqC0bxa730NtZD9FqMaJGSzpOkXsidZ0=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3293.eurprd05.prod.outlook.com (10.175.244.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Fri, 1 Nov 2019 19:17:27 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 19:17:27 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
Thread-Index: AQHVjcvKV253DVP8r0WB5NYgPgZcBadzahyAgAMzaQCAABG1AIAAByiA
Date: Fri, 1 Nov 2019 19:17:27 +0000
Message-ID: <20191101191723.GT22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <0355257f-6a3a-cdcd-d206-aec3df97dded@oracle.com>
 <20191101174824.GP22766@mellanox.com>
 <14f96c2e-ee04-5b1a-fc32-2db1487df399@oracle.com>
In-Reply-To: <14f96c2e-ee04-5b1a-fc32-2db1487df399@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR19CA0003.namprd19.prod.outlook.com
 (2603:10b6:208:178::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ebc8093-78da-4744-13e7-08d75f0021dc
x-ms-traffictypediagnostic: VI1PR05MB3293:
x-microsoft-antispam-prvs: <VI1PR05MB32932D848D35EE73CDACEA5ECF620@VI1PR05MB3293.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(199004)(189003)(305945005)(6916009)(7416002)(186003)(64756008)(6436002)(6486002)(7736002)(66556008)(66946007)(2906002)(66476007)(2616005)(86362001)(229853002)(5660300002)(26005)(11346002)(476003)(446003)(102836004)(66446008)(8936002)(81166006)(486006)(81156014)(25786009)(8676002)(54906003)(33656002)(6246003)(5024004)(76176011)(14454004)(6512007)(71190400001)(66066001)(6116002)(99286004)(256004)(3846002)(4326008)(52116002)(1076003)(6506007)(53546011)(386003)(36756003)(14444005)(478600001)(71200400001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3293;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fSlSY7hCY9Q7BmauGFQSMsk0zKjuAauK4ZzMstrTfQ3zJeGmEL4qhMRyS+4WkTdK3btWXPh04Lcj3U33mSYZPfYzGrOOFXUJWnPk9kBGm2PPxEy4AQjFMtQoMxvKsL12L+HrR1UCwqFmnGwT1shLo3uA5AYx8GG5gTI5yCZYRYPac4GCAlyj0eGQJRdhGz8SBAfrmXQmPVgvmWfccOi86lqQ3HnWHbIYkAzYM63I2Eri708M/f2439XARJPQlftr5+qt5YJ0MOd3mnq48YxcPA6Kj2ueYgiZE1aVRB8GGNu4XzBzp3PqczMPZbgk/Klsve0xbvoj/cgzFScCHEB74eZRV676vH9QYmQEqSq/t4fjUQ2rfU71arRZYipRAYMgVC+8aaCH9QKlGrvzTRVp6iRQRFDkN+SZQk4E3k5ycx7m6O2bULYq39Uf1NgUau0+
x-ms-exchange-transport-forked: True
Content-ID: <18553814D461244CA039C5C384EE49D3@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebc8093-78da-4744-13e7-08d75f0021dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:17:27.1712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxUeovUvghjC4HW/Rwc15VCds4SMw74yHkiedwxpYW6v2wfry4534u7+72twT6C5M8UUHnmLIolaKMtnXCAZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3293
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

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDI6NTE6NDZQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDExLzEvMTkgMTo0OCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4g
T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMTI6NTU6MzdQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+ID4+IE9uIDEwLzI4LzE5IDQ6MTAgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToK
PiA+Pj4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4+Pgo+ID4+
PiBnbnRkZXYgc2ltcGx5IHdhbnRzIHRvIG1vbml0b3IgYSBzcGVjaWZpYyBWTUEgZm9yIGFueSBu
b3RpZmllciBldmVudHMsCj4gPj4+IHRoaXMgY2FuIGJlIGRvbmUgc3RyYWlnaHRmb3J3YXJkbHkg
dXNpbmcgbW11X3JhbmdlX25vdGlmaWVyX2luc2VydCgpIG92ZXIKPiA+Pj4gdGhlIFZNQSdzIFZB
IHJhbmdlLgo+ID4+Pgo+ID4+PiBUaGUgbm90aWZpZXIgc2hvdWxkIGJlIGF0dGFjaGVkIHVudGls
IHRoZSBvcmlnaW5hbCBWTUEgaXMgZGVzdHJveWVkLgo+ID4+Pgo+ID4+PiBJdCBpcyB1bmNsZWFy
IGlmIGFueSBvZiB0aGlzIGlzIGV2ZW4gc2FuZSwgYnV0IGF0IGxlYXN0IGEgbG90IG9mIGR1cGxp
Y2F0ZQo+ID4+PiBjb2RlIGlzIHJlbW92ZWQuCj4gPj4gSSBkaWRuJ3QgaGF2ZSBhIGNoYW5jZSB0
byBsb29rIGF0IHRoZSBwYXRjaCBpdHNlbGYgeWV0IGJ1dCBhcyBhIGhlYWRzLXVwCj4gPiBUaGFu
a3MgQm9yaXMuIEkgc3BlbnQgYSBiaXQgb2YgdGltZSBhbmQgZ290IGEgVk0gcnVubmluZyB3aXRo
IGEgeGVuCj4gPiA0LjkgaHlwZXJ2aXNvciBhbmQgYSBrZXJuZWwgd2l0aCB0aGlzIHBhdGNoIHNl
cmllcy4gSXQgYSB1YnVudHUgYmlvbmljCj4gPiBWTSB3aXRoIHRoZSBkaXN0cm8ncyB4ZW4gc3R1
ZmYuCj4gPgo+ID4gQ2FuIHlvdSBnaXZlIHNvbWUgZ3VpZGFuY2UgaG93IHlvdSBtYWRlIGl0IGNy
YXNoPyAKPiAKPiBJdCBjcmFzaGVzIHRyeWluZyB0byBkZXJlZmVyZW5jZSBtcm4tPm9wcy0+aW52
YWxpZGF0ZSBpbgo+IG1uX2l0cmVlX2ludmFsaWRhdGUoKSB3aGVuIGEgZ3Vlc3QgZXhpdHMuCj4g
Cj4gSSBkb24ndCB0aGluayB5b3UndmUgaW5pdGlhbGl6ZWQgbm90aWZpZXIgb3BzLiBJIGRvbid0
IHNlZSB5b3UgdXNpbmcKPiBnbnRkZXZfbW11X29wcyBhbnl3aGVyZS4KClNvIHdlaXJkIHRoZSBj
b21waWxlciBkaWRuJ3QgY29tcGxhaW4gYWJvdXQgYW4gdW51c2VkIHN0YXRpYy4uLgoKQnV0IHll
cywgdGhpcyBpcyBhIG1pc3Rha2UsIGl0IHNob3VsZCBiZToKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9nbnRkZXYuYyBiL2RyaXZlcnMveGVuL2dudGRldi5jCmluZGV4IDM3YjI3ODg1N2FkODA3
Li4wY2EzNTQ4NWZkMzg2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LmMKKysrIGIv
ZHJpdmVycy94ZW4vZ250ZGV2LmMKQEAgLTEwMTEsNiArMTAxMSw3IEBAIHN0YXRpYyBpbnQgZ250
ZGV2X21tYXAoc3RydWN0IGZpbGUgKmZsaXAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQog
CiAJaWYgKHVzZV9wdGVtb2QpIHsKIAkJbWFwLT52bWEgPSB2bWE7CisJCW1hcC0+bm90aWZpZXIu
b3BzID0gJmdudGRldl9tbXVfb3BzOwogCQllcnIgPSBtbXVfcmFuZ2Vfbm90aWZpZXJfaW5zZXJ0
X2xvY2tlZCgKIAkJCSZtYXAtPm5vdGlmaWVyLCB2bWEtPnZtX3N0YXJ0LAogCQkJdm1hLT52bV9l
bmQgLSB2bWEtPnZtX3N0YXJ0LCB2bWEtPnZtX21tKTsKClRoYW5rcywKSmFzb24KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
