Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045EE82CA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 08:51:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPMEi-0007CP-Su; Tue, 29 Oct 2019 07:48:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D+bj=YW=amd.com=christian.koenig@srs-us1.protection.inumbo.net>)
 id 1iPMEh-0007CH-Ai
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 07:48:15 +0000
X-Inumbo-ID: 74933c2e-fa20-11e9-950d-12813bfff9fa
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.70.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74933c2e-fa20-11e9-950d-12813bfff9fa;
 Tue, 29 Oct 2019 07:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG4S9//ylz1ceq9yPZxzrK7dICgnwvTrPwBLVaImIr5nPRT9lGiiRfkigRowrQtnaaScg/NNrX1cL4OHSXAUUL3/ZViK+vKbKpmgTLmDr259UMCkWxRoA+R6yFAKvmg1xlrp3eHfUCYwUn5+O5t06YDFtWCJ+x6Oj3SuHFCZhuZ4SnKosQpEmKSj5KAHhyXufJgbDAUC+UkmeknOp+Zwedem3R9aBZ/5QlwkLBycWpLFWAxoAgdPyltoLxFV8FzRZz7oduDaOKeQ/h9ag1aXYcPBjkaRd1NGDl8VMK50UJDG6ce2LdZRlArHyqgOPmu9LJNTMDnMK0x2gtTLXPIQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovx/GECbri8xKG2F/INLphsq2e91+tDGLNATSDZyajw=;
 b=e++YzA1WUveA85hqC7FrGgOOtthSAVpTefVfDVTeilDbUQJ9HxoLnaV47M8wypij/FKCwRITcZsS1q6i96vKqMOpNx5ir0WTgPsKNCrHK1rIB1AxIxGkdkOlWDw6hSa6hegAw5TKQUue2+8zS0igK9M0viM6cPQXWjALDL1FT5DHizuYqCUraS/vB4ItIylFr6peIsBN0739GGCIv4EuHiepG7GZ7BRybAfV/3rCGz2yZPdMy+hKVbxH1vbOgQ6d4D6TsY47D8R7IjcPNdzGd/HFXCt/OwApZRq31wqlsr85vv6EG1pWIgq68WZi44vKMussprs1tEK/siiTVLTKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovx/GECbri8xKG2F/INLphsq2e91+tDGLNATSDZyajw=;
 b=0T2NfSbqGaEsd6SWRxLUIb4fKhoprF8q5vezN8F90vRB0St4ofPfJCH10m+yr4b00YLF7/lV4/KitLnhdFWwPXvUB4ghbBp7tWITSEWDlJFftVkYxcGX4vJSR9GG2RQURMv7RRhswvIxn6gYU0pzhTw4tb4r1FLOPpBzcnwC1oY=
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1425.namprd12.prod.outlook.com (10.168.228.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Tue, 29 Oct 2019 07:48:09 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::68e1:ddf5:df4c:b554]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::68e1:ddf5:df4c:b554%9]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 07:48:09 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Thread-Topic: [PATCH v2 07/15] drm/radeon: use mmu_range_notifier_insert
Thread-Index: AQHVjcvLd/t8yQo/O0yZj5NHdi38L6dxPsiA
Date: Tue, 29 Oct 2019 07:48:09 +0000
Message-ID: <e05cc822-bba8-a7f0-1b28-73ea10b9e52e@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-8-jgg@ziepe.ca>
In-Reply-To: <20191028201032.6352-8-jgg@ziepe.ca>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0102CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::37) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b90b127f-5a43-42ec-f73c-08d75c4457b1
x-ms-traffictypediagnostic: BN6PR12MB1425:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB14256CB40A04D03B2E8D863F83610@BN6PR12MB1425.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(66556008)(476003)(6512007)(6506007)(81156014)(229853002)(36756003)(66574012)(478600001)(25786009)(11346002)(486006)(71200400001)(6636002)(446003)(71190400001)(64756008)(66946007)(8936002)(66446008)(2616005)(6246003)(4326008)(14454004)(6486002)(256004)(2501003)(305945005)(76176011)(31696002)(5660300002)(81166006)(86362001)(8676002)(52116002)(7736002)(31686004)(386003)(102836004)(14444005)(186003)(6116002)(65956001)(65806001)(58126008)(110136005)(54906003)(7416002)(66476007)(316002)(46003)(2906002)(99286004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1425;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rStQDIGG1OK0BNx8aiEE+qpEMOKUfJIgT3zr9+In4f30mDfV+E4oiUuuTBQLUIAKRIeP7uQ0ne18xks7Gf35rHqxGzzwXh258TYOqWSQZI2n75uT1mIJxnQT0393TDZSU0o/UhL7lvqbC9c/V9m3GtlT4DKMkmAfORMEMbhWfdQPgymUU1979GMb5pm1cxI3DSm75I32p70QC9UAKg67lapmtvPgRnqtR85+30axY42s28BbJ40MR47BRJ5b/JFJrgbTSAOQeQZ4RGzCCMy+uy6JfQ41l6FdNx9yUrj6MWBUaWDv8FM9eO+2FwvN8hfEj/ABp9ZcECbPELag2pMBvbb2ljrvOYh/LKYdRoycXQviLOsmmKtY+0ghnBeQLreLqznk/UjJy4YxbtKmCx66p6du/LWK9SAPAfayfEZhWuktePmRmRjJBu6Ra472WMu3
Content-ID: <04E2642413F94A4B82660DD44C26B00A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90b127f-5a43-42ec-f73c-08d75c4457b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 07:48:09.6956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAjPBrqL+wwC9M760+CW5m4PSDnsxqNTBHqqUSksNm8Fapu5FroiIIYkX9mUgDyF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1425
Subject: Re: [Xen-devel] [PATCH v2 07/15] drm/radeon: use
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
Cc: Juergen Gross <jgross@suse.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gMjguMTAuMTkgdW0gMjE6MTAgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6DQo+IEZyb206IEph
c29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCj4NCj4gVGhlIG5ldyBBUEkgaXMgYW4g
ZXhhY3QgbWF0Y2ggZm9yIHRoZSBuZWVkcyBvZiByYWRlb24uDQo+DQo+IEZvciBzb21lIHJlYXNv
biByYWRlb24gdHJpZXMgdG8gcmVtb3ZlIG92ZXJsYXBwaW5nIHJhbmdlcyBmcm9tIHRoZQ0KPiBp
bnRlcnZhbCB0cmVlLCBidXQgaW50ZXJ2YWwgdHJlZXMgKGFuZCBtbXVfcmFuZ2Vfbm90aWZpZXJf
aW5zZXJ0KQ0KPiBzdXBwb3J0IG92ZXJsYXBwaW5nIHJhbmdlcyBkaXJlY3RseS4gU2ltcGx5IGRl
bGV0ZSBhbGwgdGhpcyBjb2RlLg0KPg0KPiBTaW5jZSB0aGlzIGRyaXZlciBpcyBtaXNzaW5nIGEg
aW52YWxpZGF0ZV9yYW5nZV9lbmQgY2FsbGJhY2ssIGJ1dA0KPiBzdGlsbCBjYWxscyBnZXRfdXNl
cl9wYWdlcygpLCBpdCBjYW5ub3QgYmUgY29ycmVjdCBhZ2FpbnN0IGFsbCByYWNlcy4NCj4NCj4g
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IERhdmlkIChDaHVu
TWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNvbT4NCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBQZXRyIEN2ZWsgPHBldHJjdmVrY3pAZ21haWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQoNClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICB8ICAgOSArLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMgfCAyMTkgKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDE3
NiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oDQo+IGluZGV4IGQ1OWIw
MDRmNjY5NTgzLi4yNzk1OWYzYWNlMTE1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb24uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5o
DQo+IEBAIC02OCw2ICs2OCwxMCBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9oYXNodGFibGUuaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvZG1hLWZlbmNlLmg+DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklH
X01NVV9OT1RJRklFUg0KPiArI2luY2x1ZGUgPGxpbnV4L21tdV9ub3RpZmllci5oPg0KPiArI2Vu
ZGlmDQo+ICsNCj4gICAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fYXBpLmg+DQo+ICAgI2luY2x1
ZGUgPGRybS90dG0vdHRtX2JvX2RyaXZlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9w
bGFjZW1lbnQuaD4NCj4gQEAgLTUwOSw4ICs1MTMsOSBAQCBzdHJ1Y3QgcmFkZW9uX2JvIHsNCj4g
ICAJc3RydWN0IHR0bV9ib19rbWFwX29iagkJZG1hX2J1Zl92bWFwOw0KPiAgIAlwaWRfdAkJCQlw
aWQ7DQo+ICAgDQo+IC0Jc3RydWN0IHJhZGVvbl9tbgkJKm1uOw0KPiAtCXN0cnVjdCBsaXN0X2hl
YWQJCW1uX2xpc3Q7DQo+ICsjaWZkZWYgQ09ORklHX01NVV9OT1RJRklFUg0KPiArCXN0cnVjdCBt
bXVfcmFuZ2Vfbm90aWZpZXIJbm90aWZpZXI7DQo+ICsjZW5kaWYNCj4gICB9Ow0KPiAgICNkZWZp
bmUgZ2VtX3RvX3JhZGVvbl9ibyhnb2JqKSBjb250YWluZXJfb2YoKGdvYmopLCBzdHJ1Y3QgcmFk
ZW9uX2JvLCB0Ym8uYmFzZSkNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX21uLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9tbi5jDQo+
IGluZGV4IGRiYWI5YTNhOTY5YjllLi5kM2Q0MWUyMGE2NDkyMiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9tbi5jDQo+IEBAIC0zNiwxMzEgKzM2LDUxIEBADQo+ICAgDQo+ICAgI2lu
Y2x1ZGUgInJhZGVvbi5oIg0KPiAgIA0KPiAtc3RydWN0IHJhZGVvbl9tbiB7DQo+IC0Jc3RydWN0
IG1tdV9ub3RpZmllcgltbjsNCj4gLQ0KPiAtCS8qIG9iamVjdHMgcHJvdGVjdGVkIGJ5IGxvY2sg
Ki8NCj4gLQlzdHJ1Y3QgbXV0ZXgJCWxvY2s7DQo+IC0Jc3RydWN0IHJiX3Jvb3RfY2FjaGVkCW9i
amVjdHM7DQo+IC19Ow0KPiAtDQo+IC1zdHJ1Y3QgcmFkZW9uX21uX25vZGUgew0KPiAtCXN0cnVj
dCBpbnRlcnZhbF90cmVlX25vZGUJaXQ7DQo+IC0Jc3RydWN0IGxpc3RfaGVhZAkJYm9zOw0KPiAt
fTsNCj4gLQ0KPiAgIC8qKg0KPiAtICogcmFkZW9uX21uX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQg
LSBjYWxsYmFjayB0byBub3RpZnkgYWJvdXQgbW0gY2hhbmdlDQo+ICsgKiByYWRlb25fbW5faW52
YWxpZGF0ZSAtIGNhbGxiYWNrIHRvIG5vdGlmeSBhYm91dCBtbSBjaGFuZ2UNCj4gICAgKg0KPiAg
ICAqIEBtbjogb3VyIG5vdGlmaWVyDQo+IC0gKiBAbW46IHRoZSBtbSB0aGlzIGNhbGxiYWNrIGlz
IGFib3V0DQo+IC0gKiBAc3RhcnQ6IHN0YXJ0IG9mIHVwZGF0ZWQgcmFuZ2UNCj4gLSAqIEBlbmQ6
IGVuZCBvZiB1cGRhdGVkIHJhbmdlDQo+ICsgKiBAcmFuZ2U6IHRoZSBWTUEgdW5kZXIgaW52YWxp
ZGF0aW9uDQo+ICAgICoNCj4gICAgKiBXZSBibG9jayBmb3IgYWxsIEJPcyBiZXR3ZWVuIHN0YXJ0
IGFuZCBlbmQgdG8gYmUgaWRsZSBhbmQNCj4gICAgKiB1bm1hcCB0aGVtIGJ5IG1vdmUgdGhlbSBp
bnRvIHN5c3RlbSBkb21haW4gYWdhaW4uDQo+ICAgICovDQo+IC1zdGF0aWMgaW50IHJhZGVvbl9t
bl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLA0KPiAtCQkJ
CWNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQ0KPiArc3RhdGljIGJvb2wg
cmFkZW9uX21uX2ludmFsaWRhdGUoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbW4sDQo+ICsJ
CQkJIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlLA0KPiArCQkJCSB1bnNp
Z25lZCBsb25nIGN1cl9zZXEpDQo+ICAgew0KPiAtCXN0cnVjdCByYWRlb25fbW4gKnJtbiA9IGNv
bnRhaW5lcl9vZihtbiwgc3RydWN0IHJhZGVvbl9tbiwgbW4pOw0KPiArCXN0cnVjdCByYWRlb25f
Ym8gKmJvID0gY29udGFpbmVyX29mKG1uLCBzdHJ1Y3QgcmFkZW9uX2JvLCBub3RpZmllcik7DQo+
ICAgCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9Ow0KPiAt
CXN0cnVjdCBpbnRlcnZhbF90cmVlX25vZGUgKml0Ow0KPiAtCXVuc2lnbmVkIGxvbmcgZW5kOw0K
PiAtCWludCByZXQgPSAwOw0KPiAtDQo+IC0JLyogbm90aWZpY2F0aW9uIGlzIGV4Y2x1c2l2ZSwg
YnV0IGludGVydmFsIGlzIGluY2x1c2l2ZSAqLw0KPiAtCWVuZCA9IHJhbmdlLT5lbmQgLSAxOw0K
PiAtDQo+IC0JLyogVE9ETyB3ZSBzaG91bGQgYmUgYWJsZSB0byBzcGxpdCBsb2NraW5nIGZvciBp
bnRlcnZhbCB0cmVlIGFuZA0KPiAtCSAqIHRoZSB0ZWFyIGRvd24uDQo+IC0JICovDQo+IC0JaWYg
KG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQ0KPiAtCQltdXRleF9sb2NrKCZy
bW4tPmxvY2spOw0KPiAtCWVsc2UgaWYgKCFtdXRleF90cnlsb2NrKCZybW4tPmxvY2spKQ0KPiAt
CQlyZXR1cm4gLUVBR0FJTjsNCj4gLQ0KPiAtCWl0ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0
KCZybW4tPm9iamVjdHMsIHJhbmdlLT5zdGFydCwgZW5kKTsNCj4gLQl3aGlsZSAoaXQpIHsNCj4g
LQkJc3RydWN0IHJhZGVvbl9tbl9ub2RlICpub2RlOw0KPiAtCQlzdHJ1Y3QgcmFkZW9uX2JvICpi
bzsNCj4gLQkJbG9uZyByOw0KPiAtDQo+IC0JCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpIHsNCj4gLQkJCXJldCA9IC1FQUdBSU47DQo+IC0JCQlnb3RvIG91dF91bmxv
Y2s7DQo+IC0JCX0NCj4gLQ0KPiAtCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgcmFk
ZW9uX21uX25vZGUsIGl0KTsNCj4gLQkJaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfbmV4dChpdCwg
cmFuZ2UtPnN0YXJ0LCBlbmQpOw0KPiArCWxvbmcgcjsNCj4gICANCj4gLQkJbGlzdF9mb3JfZWFj
aF9lbnRyeShibywgJm5vZGUtPmJvcywgbW5fbGlzdCkgew0KPiArCWlmICghYm8tPnRiby50dG0g
fHwgYm8tPnRiby50dG0tPnN0YXRlICE9IHR0X2JvdW5kKQ0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4g
ICANCj4gLQkJCWlmICghYm8tPnRiby50dG0gfHwgYm8tPnRiby50dG0tPnN0YXRlICE9IHR0X2Jv
dW5kKQ0KPiAtCQkJCWNvbnRpbnVlOw0KPiArCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gICANCj4gLQkJCXIgPSByYWRlb25f
Ym9fcmVzZXJ2ZShibywgdHJ1ZSk7DQo+IC0JCQlpZiAocikgew0KPiAtCQkJCURSTV9FUlJPUigi
KCVsZCkgZmFpbGVkIHRvIHJlc2VydmUgdXNlciBib1xuIiwgcik7DQo+IC0JCQkJY29udGludWU7
DQo+IC0JCQl9DQo+IC0NCj4gLQkJCXIgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXRfcmN1KGJvLT50
Ym8uYmFzZS5yZXN2LA0KPiAtCQkJCXRydWUsIGZhbHNlLCBNQVhfU0NIRURVTEVfVElNRU9VVCk7
DQo+IC0JCQlpZiAociA8PSAwKQ0KPiAtCQkJCURSTV9FUlJPUigiKCVsZCkgZmFpbGVkIHRvIHdh
aXQgZm9yIHVzZXIgYm9cbiIsIHIpOw0KPiAtDQo+IC0JCQlyYWRlb25fdHRtX3BsYWNlbWVudF9m
cm9tX2RvbWFpbihibywgUkFERU9OX0dFTV9ET01BSU5fQ1BVKTsNCj4gLQkJCXIgPSB0dG1fYm9f
dmFsaWRhdGUoJmJvLT50Ym8sICZiby0+cGxhY2VtZW50LCAmY3R4KTsNCj4gLQkJCWlmIChyKQ0K
PiAtCQkJCURSTV9FUlJPUigiKCVsZCkgZmFpbGVkIHRvIHZhbGlkYXRlIHVzZXIgYm9cbiIsIHIp
Ow0KPiAtDQo+IC0JCQlyYWRlb25fYm9fdW5yZXNlcnZlKGJvKTsNCj4gLQkJfQ0KPiArCXIgPSBy
YWRlb25fYm9fcmVzZXJ2ZShibywgdHJ1ZSk7DQo+ICsJaWYgKHIpIHsNCj4gKwkJRFJNX0VSUk9S
KCIoJWxkKSBmYWlsZWQgdG8gcmVzZXJ2ZSB1c2VyIGJvXG4iLCByKTsNCj4gKwkJcmV0dXJuIHRy
dWU7DQo+ICAgCX0NCj4gLQkNCj4gLW91dF91bmxvY2s6DQo+IC0JbXV0ZXhfdW5sb2NrKCZybW4t
PmxvY2spOw0KPiAtDQo+IC0JcmV0dXJuIHJldDsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIHZvaWQg
cmFkZW9uX21uX3JlbGVhc2Uoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tKQ0KPiAtew0KPiAtCXN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgcmFuZ2UgPSB7DQo+
IC0JCS5tbSA9IG1tLA0KPiAtCQkuc3RhcnQgPSAwLA0KPiAtCQkuZW5kID0gVUxPTkdfTUFYLA0K
PiAtCQkuZmxhZ3MgPSAwLA0KPiAtCQkuZXZlbnQgPSBNTVVfTk9USUZZX1VOTUFQLA0KPiAtCX07
DQo+IC0NCj4gLQlyYWRlb25fbW5faW52YWxpZGF0ZV9yYW5nZV9zdGFydChtbiwgJnJhbmdlKTsN
Cj4gLX0NCj4gLQ0KPiAtc3RhdGljIHN0cnVjdCBtbXVfbm90aWZpZXIgKnJhZGVvbl9tbl9hbGxv
Y19ub3RpZmllcihzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gLXsNCj4gLQlzdHJ1Y3QgcmFkZW9u
X21uICpybW47DQo+ICAgDQo+IC0Jcm1uID0ga3phbGxvYyhzaXplb2YoKnJtbiksIEdGUF9LRVJO
RUwpOw0KPiAtCWlmICghcm1uKQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gKwly
ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShiby0+dGJvLmJhc2UucmVzdiwgdHJ1ZSwgZmFs
c2UsDQo+ICsJCQkJICAgICAgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOw0KPiArCWlmIChyIDw9IDAp
DQo+ICsJCURSTV9FUlJPUigiKCVsZCkgZmFpbGVkIHRvIHdhaXQgZm9yIHVzZXIgYm9cbiIsIHIp
Ow0KPiAgIA0KPiAtCW11dGV4X2luaXQoJnJtbi0+bG9jayk7DQo+IC0Jcm1uLT5vYmplY3RzID0g
UkJfUk9PVF9DQUNIRUQ7DQo+IC0JcmV0dXJuICZybW4tPm1uOw0KPiAtfQ0KPiArCXJhZGVvbl90
dG1fcGxhY2VtZW50X2Zyb21fZG9tYWluKGJvLCBSQURFT05fR0VNX0RPTUFJTl9DUFUpOw0KPiAr
CXIgPSB0dG1fYm9fdmFsaWRhdGUoJmJvLT50Ym8sICZiby0+cGxhY2VtZW50LCAmY3R4KTsNCj4g
KwlpZiAocikNCj4gKwkJRFJNX0VSUk9SKCIoJWxkKSBmYWlsZWQgdG8gdmFsaWRhdGUgdXNlciBi
b1xuIiwgcik7DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCByYWRlb25fbW5fZnJlZV9ub3RpZmllcihz
dHJ1Y3QgbW11X25vdGlmaWVyICptbikNCj4gLXsNCj4gLQlrZnJlZShjb250YWluZXJfb2YobW4s
IHN0cnVjdCByYWRlb25fbW4sIG1uKSk7DQo+ICsJcmFkZW9uX2JvX3VucmVzZXJ2ZShibyk7DQo+
ICsJcmV0dXJuIHRydWU7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBtbXVf
bm90aWZpZXJfb3BzIHJhZGVvbl9tbl9vcHMgPSB7DQo+IC0JLnJlbGVhc2UgPSByYWRlb25fbW5f
cmVsZWFzZSwNCj4gLQkuaW52YWxpZGF0ZV9yYW5nZV9zdGFydCA9IHJhZGVvbl9tbl9pbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0LA0KPiAtCS5hbGxvY19ub3RpZmllciA9IHJhZGVvbl9tbl9hbGxvY19u
b3RpZmllciwNCj4gLQkuZnJlZV9ub3RpZmllciA9IHJhZGVvbl9tbl9mcmVlX25vdGlmaWVyLA0K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXJfb3BzIHJhZGVvbl9tbl9v
cHMgPSB7DQo+ICsJLmludmFsaWRhdGUgPSByYWRlb25fbW5faW52YWxpZGF0ZSwNCj4gICB9Ow0K
PiAgIA0KPiAgIC8qKg0KPiBAQCAtMTc0LDUxICs5NCwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG1tdV9ub3RpZmllcl9vcHMgcmFkZW9uX21uX29wcyA9IHsNCj4gICAgKi8NCj4gICBpbnQgcmFk
ZW9uX21uX3JlZ2lzdGVyKHN0cnVjdCByYWRlb25fYm8gKmJvLCB1bnNpZ25lZCBsb25nIGFkZHIp
DQo+ICAgew0KPiAtCXVuc2lnbmVkIGxvbmcgZW5kID0gYWRkciArIHJhZGVvbl9ib19zaXplKGJv
KSAtIDE7DQo+IC0Jc3RydWN0IG1tdV9ub3RpZmllciAqbW47DQo+IC0Jc3RydWN0IHJhZGVvbl9t
biAqcm1uOw0KPiAtCXN0cnVjdCByYWRlb25fbW5fbm9kZSAqbm9kZSA9IE5VTEw7DQo+IC0Jc3Ry
dWN0IGxpc3RfaGVhZCBib3M7DQo+IC0Jc3RydWN0IGludGVydmFsX3RyZWVfbm9kZSAqaXQ7DQo+
IC0NCj4gLQltbiA9IG1tdV9ub3RpZmllcl9nZXQoJnJhZGVvbl9tbl9vcHMsIGN1cnJlbnQtPm1t
KTsNCj4gLQlpZiAoSVNfRVJSKG1uKSkNCj4gLQkJcmV0dXJuIFBUUl9FUlIobW4pOw0KPiAtCXJt
biA9IGNvbnRhaW5lcl9vZihtbiwgc3RydWN0IHJhZGVvbl9tbiwgbW4pOw0KPiAtDQo+IC0JSU5J
VF9MSVNUX0hFQUQoJmJvcyk7DQo+IC0NCj4gLQltdXRleF9sb2NrKCZybW4tPmxvY2spOw0KPiAt
DQo+IC0Jd2hpbGUgKChpdCA9IGludGVydmFsX3RyZWVfaXRlcl9maXJzdCgmcm1uLT5vYmplY3Rz
LCBhZGRyLCBlbmQpKSkgew0KPiAtCQlrZnJlZShub2RlKTsNCj4gLQkJbm9kZSA9IGNvbnRhaW5l
cl9vZihpdCwgc3RydWN0IHJhZGVvbl9tbl9ub2RlLCBpdCk7DQo+IC0JCWludGVydmFsX3RyZWVf
cmVtb3ZlKCZub2RlLT5pdCwgJnJtbi0+b2JqZWN0cyk7DQo+IC0JCWFkZHIgPSBtaW4oaXQtPnN0
YXJ0LCBhZGRyKTsNCj4gLQkJZW5kID0gbWF4KGl0LT5sYXN0LCBlbmQpOw0KPiAtCQlsaXN0X3Nw
bGljZSgmbm9kZS0+Ym9zLCAmYm9zKTsNCj4gLQl9DQo+IC0NCj4gLQlpZiAoIW5vZGUpIHsNCj4g
LQkJbm9kZSA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCByYWRlb25fbW5fbm9kZSksIEdGUF9LRVJO
RUwpOw0KPiAtCQlpZiAoIW5vZGUpIHsNCj4gLQkJCW11dGV4X3VubG9jaygmcm1uLT5sb2NrKTsN
Cj4gLQkJCXJldHVybiAtRU5PTUVNOw0KPiAtCQl9DQo+IC0JfQ0KPiAtDQo+IC0JYm8tPm1uID0g
cm1uOw0KPiAtDQo+IC0Jbm9kZS0+aXQuc3RhcnQgPSBhZGRyOw0KPiAtCW5vZGUtPml0Lmxhc3Qg
PSBlbmQ7DQo+IC0JSU5JVF9MSVNUX0hFQUQoJm5vZGUtPmJvcyk7DQo+IC0JbGlzdF9zcGxpY2Uo
JmJvcywgJm5vZGUtPmJvcyk7DQo+IC0JbGlzdF9hZGQoJmJvLT5tbl9saXN0LCAmbm9kZS0+Ym9z
KTsNCj4gLQ0KPiAtCWludGVydmFsX3RyZWVfaW5zZXJ0KCZub2RlLT5pdCwgJnJtbi0+b2JqZWN0
cyk7DQo+IC0NCj4gLQltdXRleF91bmxvY2soJnJtbi0+bG9jayk7DQo+IC0NCj4gKwlpbnQgcmV0
Ow0KPiArDQo+ICsJYm8tPm5vdGlmaWVyLm9wcyA9ICZyYWRlb25fbW5fb3BzOw0KPiArCXJldCA9
IG1tdV9yYW5nZV9ub3RpZmllcl9pbnNlcnQoJmJvLT5ub3RpZmllciwgYWRkciwgcmFkZW9uX2Jv
X3NpemUoYm8pLA0KPiArCQkJCQljdXJyZW50LT5tbSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKw0KPiArCS8qDQo+ICsJICogRklYTUU6IHJhZGVvbiBhcHBlYXJzIHRvIGFs
bG93IGdldF91c2VyX3BhZ2VzIHRvIHJ1biBkdXJpbmcNCj4gKwkgKiBpbnZhbGlkYXRlX3Jhbmdl
X3N0YXJ0L2VuZCwgd2hpY2ggaXMgbm90IGEgc2FmZSB3YXkgdG8gcmVhZCB0aGUNCj4gKwkgKiBQ
VEVzLiBJdCBzaG91bGQgdXNlIHRoZSBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpIHNjaGVtZSBhcm91
bmQgdGhlDQo+ICsJICogZ2V0X3VzZXJfcGFnZXMgdG8gZW5zdXJlIHRoYXQgdGhlIFBURXMgYXJl
IHJlYWQgcHJvcGVybHkNCj4gKwkgKi8NCj4gKwltbXVfcmFuZ2VfcmVhZF9iZWdpbigmYm8tPm5v
dGlmaWVyKTsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtMjMxLDI3ICsxMjEs
OCBAQCBpbnQgcmFkZW9uX21uX3JlZ2lzdGVyKHN0cnVjdCByYWRlb25fYm8gKmJvLCB1bnNpZ25l
ZCBsb25nIGFkZHIpDQo+ICAgICovDQo+ICAgdm9pZCByYWRlb25fbW5fdW5yZWdpc3RlcihzdHJ1
Y3QgcmFkZW9uX2JvICpibykNCj4gICB7DQo+IC0Jc3RydWN0IHJhZGVvbl9tbiAqcm1uID0gYm8t
Pm1uOw0KPiAtCXN0cnVjdCBsaXN0X2hlYWQgKmhlYWQ7DQo+IC0NCj4gLQlpZiAoIXJtbikNCj4g
KwlpZiAoIWJvLT5ub3RpZmllci5tbSkNCj4gICAJCXJldHVybjsNCj4gLQ0KPiAtCW11dGV4X2xv
Y2soJnJtbi0+bG9jayk7DQo+IC0JLyogc2F2ZSB0aGUgbmV4dCBsaXN0IGVudHJ5IGZvciBsYXRl
ciAqLw0KPiAtCWhlYWQgPSBiby0+bW5fbGlzdC5uZXh0Ow0KPiAtDQo+IC0JbGlzdF9kZWwoJmJv
LT5tbl9saXN0KTsNCj4gLQ0KPiAtCWlmIChsaXN0X2VtcHR5KGhlYWQpKSB7DQo+IC0JCXN0cnVj
dCByYWRlb25fbW5fbm9kZSAqbm9kZTsNCj4gLQkJbm9kZSA9IGNvbnRhaW5lcl9vZihoZWFkLCBz
dHJ1Y3QgcmFkZW9uX21uX25vZGUsIGJvcyk7DQo+IC0JCWludGVydmFsX3RyZWVfcmVtb3ZlKCZu
b2RlLT5pdCwgJnJtbi0+b2JqZWN0cyk7DQo+IC0JCWtmcmVlKG5vZGUpOw0KPiAtCX0NCj4gLQ0K
PiAtCW11dGV4X3VubG9jaygmcm1uLT5sb2NrKTsNCj4gLQ0KPiAtCW1tdV9ub3RpZmllcl9wdXQo
JnJtbi0+bW4pOw0KPiAtCWJvLT5tbiA9IE5VTEw7DQo+ICsJbW11X3JhbmdlX25vdGlmaWVyX3Jl
bW92ZSgmYm8tPm5vdGlmaWVyKTsNCj4gKwliby0+bm90aWZpZXIubW0gPSBOVUxMOw0KPiAgIH0N
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
