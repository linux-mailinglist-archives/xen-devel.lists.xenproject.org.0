Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0032E92F4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 23:17:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPZl7-0007Hy-Sm; Tue, 29 Oct 2019 22:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OMAA=YW=amd.com=felix.kuehling@srs-us1.protection.inumbo.net>)
 id 1iPZl5-0007Ht-W0
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 22:14:36 +0000
X-Inumbo-ID: 7c66334c-fa99-11e9-bbab-bc764e2007e4
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4c::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c66334c-fa99-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 22:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOsOvBFyvDMV8zmYf9QDeOJMAxGsGgP9Ax6y/MbTQ9EEhToDYm5mMg9nk0jNZOXJA6EHxRigbHqBK97ZPev5aHEkDdcDD1O30MF/bWQfUrPuXC8x6v67VLmVyxPUi47Pwf7WnOQD6JEL5HSMwKJcNZtGaE2AQ4jD9GPuqD22Gzb4SN9zWhJ7X41bCB6uLfOjAgcM6U246SWQa8nCVuvI0rfMJXlgXzl7vf/SDfrcKjdRj3MrN88kHc5ySkP1wZnZGiyyp7s4Gn2MC0zcYv7jD0yDDuv0I7WuyB3EUgSEzIGC3SuQy8P7Adg60d8dGokN8w5tiEm7GgqlxXYZt3XVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDUuPOr+FQUxhDLyOKJlJqvrFEBSV0lmxPbWlSbQJHI=;
 b=WaDOHtlTAzxfMG11/LGetH0gUKQfbtbGslVBm3Hlx7afvwf33h19Ti6TRR2Q74SEFv0PgqY0wjzlkEmzM96ACg2MOaQiYelgJv9vVOk9D3I5sCfXNp2cJHHvJBPr1XhV29rL5+b4Ef+4OXxLU9QZXIXpC82wGI3eOJ5JgirgEhms1JxanPh7iOSv6SWT4gl0n6Zt5hTbRql+cNk5C/QzeoBcrHi9FasMSP4qbyHTK3cczVC/LhLSBzyWDrEzG2vL+S3BpJP5/VC+PVtfIPOkARW8ESF1zJHLVKfSP0DfCfiq7c/GwPzh/QSe/epOunhZyXPAXzju6MFdDnENzM+DcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDUuPOr+FQUxhDLyOKJlJqvrFEBSV0lmxPbWlSbQJHI=;
 b=nyrrYEVr9YeXAf6+4L2p6mpkyGwP4T22AAZxXRbeBecQg8fqNspjPPtHtN7DZTTYxC4+ei5VohVMk4BUgEKhR9CUK9p5wXekx3lWYGKAAFyygVaXZsHjtxSm0+7wrmybz+7qPqE7gJC5v3pmT54XObdGfmoE24MiCXc13z/3GcM=
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3579.namprd12.prod.outlook.com (20.178.31.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Tue, 29 Oct 2019 22:14:30 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede%4]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 22:14:30 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>
Thread-Topic: [PATCH v2 13/15] drm/amdgpu: Use mmu_range_insert instead of
 hmm_mirror
Thread-Index: AQHVjc0+mWAYy8WQNUexAnZPCB1Zv6dyMNmA
Date: Tue, 29 Oct 2019 22:14:29 +0000
Message-ID: <6c511ee9-4cbf-bd33-e720-f2d2b5c3c28b@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-14-jgg@ziepe.ca>
In-Reply-To: <20191028201032.6352-14-jgg@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 93cf01a7-c9f2-469e-2ea5-08d75cbd5e3c
x-ms-traffictypediagnostic: DM6PR12MB3579:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB35793B8E5FC8E57E99E632F092610@DM6PR12MB3579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:469;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(30864003)(99286004)(6116002)(3846002)(36756003)(5660300002)(229853002)(486006)(2501003)(6436002)(31696002)(8936002)(446003)(476003)(52116002)(2616005)(11346002)(86362001)(25786009)(6506007)(386003)(53546011)(102836004)(26005)(76176011)(71190400001)(71200400001)(66574012)(186003)(2906002)(64756008)(256004)(14444005)(5024004)(66446008)(66946007)(66556008)(58126008)(110136005)(54906003)(66476007)(478600001)(14454004)(305945005)(6486002)(4326008)(31686004)(7416002)(66066001)(65956001)(65806001)(6246003)(7736002)(8676002)(81166006)(81156014)(6512007)(316002)(4001150100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3579;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xUD9Jb3T4hlvZjNQOIZu4q/N2X+c9T+sVN5P88jeOZ/jxvt+q8U2uaIJEX9hxPlyiZa1nRGixSD0/xy8Z1Ixn8A/QHdCUCd2CWhosiCcDADnKS+/bSSShNtjG7niF+IGYdYm1xt8mMlRHf/P/u8+3nisKVNWjggiAOTyqZZ8Cga5OT+UiiwyJMHzRcgTHCXT7yj5GX4SmsrdOm4QQR+OHyyez4muz38GfO5PUg7MOm8ePrr08q5Y7w2qbaNASz/9iRhrtkA05QW1bVo9nzATzyCHmW+HfJhkCkfq+fWVivLEjwOrAQT/suUDIagPIevJjzUjTksR4sYSNsI1wf8qOGfNdfZUum7MK0VPsNuXcIVwtiApe83kQ2UTBE4213wqUxoWzgAYk10R02G3hQdOLPxtXq369FFiiUd4PFlcH2HW6fjsD4oREC1/lmu6hd46
Content-ID: <C97ED99E12BE4048A2D5ECC05D2611FE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cf01a7-c9f2-469e-2ea5-08d75cbd5e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 22:14:29.8379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3BmFKej61A3woUW6HcBvAjMeeh36q4cdWu/aA2L0nbOVLXEA/hMWGZ2hBh0Nzr3yzvLQkLEySQz/xZMAlKWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3579
Subject: Re: [Xen-devel] [PATCH v2 13/15] drm/amdgpu: Use mmu_range_insert
 instead of hmm_mirror
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
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMC0yOCA0OjEwIHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gRnJvbTog
SmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPg0KPiBSZW1vdmUgdGhlIGludGVy
dmFsIHRyZWUgaW4gdGhlIGRyaXZlciBhbmQgcmVseSBvbiB0aGUgdHJlZSBtYWludGFpbmVkIGJ5
DQo+IHRoZSBtbXVfbm90aWZpZXIgZm9yIGRlbGl2ZXJpbmcgbW11X25vdGlmaWVyIGludmFsaWRh
dGlvbiBjYWxsYmFja3MuDQo+DQo+IEZvciBzb21lIHJlYXNvbiBhbWRncHUgaGFzIGEgdmVyeSBj
b21wbGljYXRlZCBhcnJhbmdlbWVudCB3aGVyZSBpdCB0cmllcw0KPiB0byBwcmV2ZW50IGR1cGxp
Y2F0ZSBlbnRyaWVzIGluIHRoZSBpbnRlcnZhbF90cmVlLCB0aGlzIGlzIG5vdCBuZWNlc3Nhcnks
DQo+IGVhY2ggYW1kZ3B1X2JvIGNhbiBiZSBpdHMgb3duIHN0YW5kIGFsb25lIGVudHJ5LiBpbnRl
cnZhbF90cmVlIGFscmVhZHkNCj4gYWxsb3dzIGR1cGxpY2F0ZXMgYW5kIG92ZXJsYXBzIGluIHRo
ZSB0cmVlLg0KPg0KPiBBbHNvLCB0aGVyZSBpcyBubyBuZWVkIHRvIHJlbW92ZSBlbnRyaWVzIHVw
b24gYSByZWxlYXNlIGNhbGxiYWNrLCB0aGUNCj4gbW11X3JhbmdlIEFQSSBzYWZlbHkgYWxsb3dz
IG9iamVjdHMgdG8gcmVtYWluIHJlZ2lzdGVyZWQgYmV5b25kIHRoZQ0KPiBsaWZldGltZSBvZiB0
aGUgbW0uIFRoZSBkcml2ZXIgb25seSBoYXMgdG8gc3RvcCB0b3VjaGluZyB0aGUgcGFnZXMgZHVy
aW5nDQo+IHJlbGVhc2UuDQo+DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+IENjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91QGFtZC5jb20+DQo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICB8ICAgMiArDQo+ICAgLi4uL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgICA1ICstDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgIHwgICAxICsNCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyAgICAgICAgfCAzNDEgKysrKy0tLS0tLS0t
LS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmggICAgICAg
IHwgICA0IC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0Lmgg
ICAgfCAgMTMgKy0NCj4gICA2IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDI4MiBk
ZWxldGlvbnMoLSkNCltzbmlwXQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X21uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4u
Yw0KPiBpbmRleCAzMWQ0ZGViNWQyOTQ4NC4uNGZmZDdiOTBmNGQ5MDcgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQpbc25pcF0NCj4gQEAgLTUwLDY2ICs1MCw2
IEBADQo+ICAgI2luY2x1ZGUgImFtZGdwdS5oIg0KPiAgICNpbmNsdWRlICJhbWRncHVfYW1ka2Zk
LmgiDQo+ICAgDQo+IC0vKioNCj4gLSAqIHN0cnVjdCBhbWRncHVfbW5fbm9kZQ0KPiAtICoNCj4g
LSAqIEBpdDogaW50ZXJ2YWwgbm9kZSBkZWZpbmluZyBzdGFydC1sYXN0IG9mIHRoZSBhZmZlY3Rl
ZCBhZGRyZXNzIHJhbmdlDQo+IC0gKiBAYm9zOiBsaXN0IG9mIGFsbCBCT3MgaW4gdGhlIGFmZmVj
dGVkIGFkZHJlc3MgcmFuZ2UNCj4gLSAqDQo+IC0gKiBNYW5hZ2VzIGFsbCBCT3Mgd2hpY2ggYXJl
IGFmZmVjdGVkIG9mIGEgY2VydGFpbiByYW5nZSBvZiBhZGRyZXNzIHNwYWNlLg0KPiAtICovDQo+
IC1zdHJ1Y3QgYW1kZ3B1X21uX25vZGUgew0KPiAtCXN0cnVjdCBpbnRlcnZhbF90cmVlX25vZGUJ
aXQ7DQo+IC0Jc3RydWN0IGxpc3RfaGVhZAkJYm9zOw0KPiAtfTsNCj4gLQ0KPiAtLyoqDQo+IC0g
KiBhbWRncHVfbW5fZGVzdHJveSAtIGRlc3Ryb3kgdGhlIEhNTSBtaXJyb3INCj4gLSAqDQo+IC0g
KiBAd29yazogcHJldmlvdXNseSBzaGVkdWxlZCB3b3JrIGl0ZW0NCj4gLSAqDQo+IC0gKiBMYXp5
IGRlc3Ryb3lzIHRoZSBub3RpZmllciBmcm9tIGEgd29yayBpdGVtDQo+IC0gKi8NCj4gLXN0YXRp
YyB2b2lkIGFtZGdwdV9tbl9kZXN0cm95KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gLXsN
Cj4gLQlzdHJ1Y3QgYW1kZ3B1X21uICphbW4gPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGFt
ZGdwdV9tbiwgd29yayk7DQo+IC0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbW4tPmFk
ZXY7DQo+IC0Jc3RydWN0IGFtZGdwdV9tbl9ub2RlICpub2RlLCAqbmV4dF9ub2RlOw0KPiAtCXN0
cnVjdCBhbWRncHVfYm8gKmJvLCAqbmV4dF9ibzsNCj4gLQ0KPiAtCW11dGV4X2xvY2soJmFkZXYt
Pm1uX2xvY2spOw0KPiAtCWRvd25fd3JpdGUoJmFtbi0+bG9jayk7DQo+IC0JaGFzaF9kZWwoJmFt
bi0+bm9kZSk7DQo+IC0JcmJ0cmVlX3Bvc3RvcmRlcl9mb3JfZWFjaF9lbnRyeV9zYWZlKG5vZGUs
IG5leHRfbm9kZSwNCj4gLQkJCQkJICAgICAmYW1uLT5vYmplY3RzLnJiX3Jvb3QsIGl0LnJiKSB7
DQo+IC0JCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShibywgbmV4dF9ibywgJm5vZGUtPmJvcywg
bW5fbGlzdCkgew0KPiAtCQkJYm8tPm1uID0gTlVMTDsNCj4gLQkJCWxpc3RfZGVsX2luaXQoJmJv
LT5tbl9saXN0KTsNCj4gLQkJfQ0KPiAtCQlrZnJlZShub2RlKTsNCj4gLQl9DQo+IC0JdXBfd3Jp
dGUoJmFtbi0+bG9jayk7DQo+IC0JbXV0ZXhfdW5sb2NrKCZhZGV2LT5tbl9sb2NrKTsNCj4gLQ0K
PiAtCWhtbV9taXJyb3JfdW5yZWdpc3RlcigmYW1uLT5taXJyb3IpOw0KPiAtCWtmcmVlKGFtbik7
DQo+IC19DQo+IC0NCj4gLS8qKg0KPiAtICogYW1kZ3B1X2htbV9taXJyb3JfcmVsZWFzZSAtIGNh
bGxiYWNrIHRvIG5vdGlmeSBhYm91dCBtbSBkZXN0cnVjdGlvbg0KPiAtICoNCj4gLSAqIEBtaXJy
b3I6IHRoZSBITU0gbWlycm9yIChtbSkgdGhpcyBjYWxsYmFjayBpcyBhYm91dA0KPiAtICoNCj4g
LSAqIFNoZWR1bGUgYSB3b3JrIGl0ZW0gdG8gbGF6eSBkZXN0cm95IEhNTSBtaXJyb3IuDQo+IC0g
Ki8NCj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9obW1fbWlycm9yX3JlbGVhc2Uoc3RydWN0IGhtbV9t
aXJyb3IgKm1pcnJvcikNCj4gLXsNCj4gLQlzdHJ1Y3QgYW1kZ3B1X21uICphbW4gPSBjb250YWlu
ZXJfb2YobWlycm9yLCBzdHJ1Y3QgYW1kZ3B1X21uLCBtaXJyb3IpOw0KPiAtDQo+IC0JSU5JVF9X
T1JLKCZhbW4tPndvcmssIGFtZGdwdV9tbl9kZXN0cm95KTsNCj4gLQlzY2hlZHVsZV93b3JrKCZh
bW4tPndvcmspOw0KPiAtfQ0KPiAtDQo+ICAgLyoqDQo+ICAgICogYW1kZ3B1X21uX2xvY2sgLSB0
YWtlIHRoZSB3cml0ZSBzaWRlIGxvY2sgZm9yIHRoaXMgbm90aWZpZXINCj4gICAgKg0KPiBAQCAt
MTMzLDE1NyArNzMsODYgQEAgdm9pZCBhbWRncHVfbW5fdW5sb2NrKHN0cnVjdCBhbWRncHVfbW4g
Km1uKQ0KPiAgIH0NCj4gICANCj4gICAvKioNCj4gLSAqIGFtZGdwdV9tbl9yZWFkX2xvY2sgLSB0
YWtlIHRoZSByZWFkIHNpZGUgbG9jayBmb3IgdGhpcyBub3RpZmllcg0KPiAtICoNCj4gLSAqIEBh
bW46IG91ciBub3RpZmllcg0KPiAtICovDQo+IC1zdGF0aWMgaW50IGFtZGdwdV9tbl9yZWFkX2xv
Y2soc3RydWN0IGFtZGdwdV9tbiAqYW1uLCBib29sIGJsb2NrYWJsZSkNCj4gLXsNCj4gLQlpZiAo
YmxvY2thYmxlKQ0KPiAtCQlkb3duX3JlYWQoJmFtbi0+bG9jayk7DQo+IC0JZWxzZSBpZiAoIWRv
d25fcmVhZF90cnlsb2NrKCZhbW4tPmxvY2spKQ0KPiAtCQlyZXR1cm4gLUVBR0FJTjsNCj4gLQ0K
PiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+IC0vKioNCj4gLSAqIGFtZGdwdV9tbl9yZWFkX3Vu
bG9jayAtIGRyb3AgdGhlIHJlYWQgc2lkZSBsb2NrIGZvciB0aGlzIG5vdGlmaWVyDQo+IC0gKg0K
PiAtICogQGFtbjogb3VyIG5vdGlmaWVyDQo+IC0gKi8NCj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9t
bl9yZWFkX3VubG9jayhzdHJ1Y3QgYW1kZ3B1X21uICphbW4pDQo+IC17DQo+IC0JdXBfcmVhZCgm
YW1uLT5sb2NrKTsNCj4gLX0NCj4gLQ0KPiAtLyoqDQo+IC0gKiBhbWRncHVfbW5faW52YWxpZGF0
ZV9ub2RlIC0gdW5tYXAgYWxsIEJPcyBvZiBhIG5vZGUNCj4gKyAqIGFtZGdwdV9tbl9pbnZhbGlk
YXRlX2dmeCAtIGNhbGxiYWNrIHRvIG5vdGlmeSBhYm91dCBtbSBjaGFuZ2UNCj4gICAgKg0KPiAt
ICogQG5vZGU6IHRoZSBub2RlIHdpdGggdGhlIEJPcyB0byB1bm1hcA0KPiAtICogQHN0YXJ0OiBz
dGFydCBvZiBhZGRyZXNzIHJhbmdlIGFmZmVjdGVkDQo+IC0gKiBAZW5kOiBlbmQgb2YgYWRkcmVz
cyByYW5nZSBhZmZlY3RlZA0KPiArICogQG1ybjogdGhlIHJhbmdlIChtbSkgaXMgYWJvdXQgdG8g
dXBkYXRlDQo+ICsgKiBAcmFuZ2U6IGRldGFpbHMgb24gdGhlIGludmFsaWRhdGlvbg0KPiAgICAq
DQo+ICAgICogQmxvY2sgZm9yIG9wZXJhdGlvbnMgb24gQk9zIHRvIGZpbmlzaCBhbmQgbWFyayBw
YWdlcyBhcyBhY2Nlc3NlZCBhbmQNCj4gICAgKiBwb3RlbnRpYWxseSBkaXJ0eS4NCj4gICAgKi8N
Cj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9tbl9pbnZhbGlkYXRlX25vZGUoc3RydWN0IGFtZGdwdV9t
bl9ub2RlICpub2RlLA0KPiAtCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+IC0JCQkJ
ICAgICAgdW5zaWduZWQgbG9uZyBlbmQpDQo+ICtzdGF0aWMgYm9vbCBhbWRncHVfbW5faW52YWxp
ZGF0ZV9nZngoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuLA0KPiArCQkJCSAgICAgY29u
c3Qgc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpDQo+ICAgew0KPiAtCXN0cnVjdCBh
bWRncHVfYm8gKmJvOw0KPiArCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gY29udGFpbmVyX29mKG1y
biwgc3RydWN0IGFtZGdwdV9ibywgbm90aWZpZXIpOw0KPiArCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7DQo+ICAgCWxvbmcgcjsNCj4g
ICANCj4gLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJvLCAmbm9kZS0+Ym9zLCBtbl9saXN0KSB7DQo+
IC0NCj4gLQkJaWYgKCFhbWRncHVfdHRtX3R0X2FmZmVjdF91c2VycHRyKGJvLT50Ym8udHRtLCBz
dGFydCwgZW5kKSkNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCXIgPSBkbWFfcmVzdl93YWl0
X3RpbWVvdXRfcmN1KGJvLT50Ym8uYmFzZS5yZXN2LA0KPiAtCQkJdHJ1ZSwgZmFsc2UsIE1BWF9T
Q0hFRFVMRV9USU1FT1VUKTsNCj4gLQkJaWYgKHIgPD0gMCkNCj4gLQkJCURSTV9FUlJPUigiKCVs
ZCkgZmFpbGVkIHRvIHdhaXQgZm9yIHVzZXIgYm9cbiIsIHIpOw0KPiAtCX0NCj4gKwkvKiBGSVhN
RTogSXMgdGhpcyBuZWNlc3Nhcnk/ICovDQo+ICsJaWYgKCFhbWRncHVfdHRtX3R0X2FmZmVjdF91
c2VycHRyKGJvLT50Ym8udHRtLCByYW5nZS0+c3RhcnQsDQo+ICsJCQkJCSAgcmFuZ2UtPmVuZCkp
DQo+ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICsJaWYgKCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxv
Y2thYmxlKHJhbmdlKSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygm
YWRldi0+bm90aWZpZXJfbG9jayk7DQo+ICsJciA9IGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3Uo
Ym8tPnRiby5iYXNlLnJlc3YsIHRydWUsIGZhbHNlLA0KPiArCQkJCSAgICAgIE1BWF9TQ0hFRFVM
RV9USU1FT1VUKTsNCj4gKwltdXRleF91bmxvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KPiAr
CWlmIChyIDw9IDApDQo+ICsJCURSTV9FUlJPUigiKCVsZCkgZmFpbGVkIHRvIHdhaXQgZm9yIHVz
ZXIgYm9cbiIsIHIpOw0KPiArCXJldHVybiB0cnVlOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyX29wcyBhbWRncHVfbW5fZ2Z4X29wcyA9IHsN
Cj4gKwkuaW52YWxpZGF0ZSA9IGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeCwNCj4gK307DQo+ICsN
Cj4gICAvKioNCj4gLSAqIGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4IC0gY2FsbGJhY2sg
dG8gbm90aWZ5IGFib3V0IG1tIGNoYW5nZQ0KPiArICogYW1kZ3B1X21uX2ludmFsaWRhdGVfaHNh
IC0gY2FsbGJhY2sgdG8gbm90aWZ5IGFib3V0IG1tIGNoYW5nZQ0KPiAgICAqDQo+IC0gKiBAbWly
cm9yOiB0aGUgaG1tX21pcnJvciAobW0pIGlzIGFib3V0IHRvIHVwZGF0ZQ0KPiAtICogQHVwZGF0
ZTogdGhlIHVwZGF0ZSBzdGFydCwgZW5kIGFkZHJlc3MNCj4gKyAqIEBtcm46IHRoZSByYW5nZSAo
bW0pIGlzIGFib3V0IHRvIHVwZGF0ZQ0KPiArICogQHJhbmdlOiBkZXRhaWxzIG9uIHRoZSBpbnZh
bGlkYXRpb24NCj4gICAgKg0KPiAtICogQmxvY2sgZm9yIG9wZXJhdGlvbnMgb24gQk9zIHRvIGZp
bmlzaCBhbmQgbWFyayBwYWdlcyBhcyBhY2Nlc3NlZCBhbmQNCj4gLSAqIHBvdGVudGlhbGx5IGRp
cnR5Lg0KPiArICogV2UgdGVtcG9yYXJpbHkgZXZpY3QgdGhlIEJPIGF0dGFjaGVkIHRvIHRoaXMg
cmFuZ2UuIFRoaXMgbmVjZXNzaXRhdGVzDQo+ICsgKiBldmljdGluZyBhbGwgdXNlci1tb2RlIHF1
ZXVlcyBvZiB0aGUgcHJvY2Vzcy4NCj4gICAgKi8NCj4gLXN0YXRpYyBpbnQNCj4gLWFtZGdwdV9t
bl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsDQo+IC0JCQkg
ICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICp1cGRhdGUpDQo+ICtzdGF0aWMg
Ym9vbCBhbWRncHVfbW5faW52YWxpZGF0ZV9oc2Eoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAq
bXJuLA0KPiArCQkJCSAgICAgY29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2Up
DQo+ICAgew0KPiAtCXN0cnVjdCBhbWRncHVfbW4gKmFtbiA9IGNvbnRhaW5lcl9vZihtaXJyb3Is
IHN0cnVjdCBhbWRncHVfbW4sIG1pcnJvcik7DQo+IC0JdW5zaWduZWQgbG9uZyBzdGFydCA9IHVw
ZGF0ZS0+c3RhcnQ7DQo+IC0JdW5zaWduZWQgbG9uZyBlbmQgPSB1cGRhdGUtPmVuZDsNCj4gLQli
b29sIGJsb2NrYWJsZSA9IG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUodXBkYXRlKTsNCj4g
LQlzdHJ1Y3QgaW50ZXJ2YWxfdHJlZV9ub2RlICppdDsNCj4gLQ0KPiAtCS8qIG5vdGlmaWNhdGlv
biBpcyBleGNsdXNpdmUsIGJ1dCBpbnRlcnZhbCBpcyBpbmNsdXNpdmUgKi8NCj4gLQllbmQgLT0g
MTsNCj4gLQ0KPiAtCS8qIFRPRE8gd2Ugc2hvdWxkIGJlIGFibGUgdG8gc3BsaXQgbG9ja2luZyBm
b3IgaW50ZXJ2YWwgdHJlZSBhbmQNCj4gLQkgKiBhbWRncHVfbW5faW52YWxpZGF0ZV9ub2RlDQo+
IC0JICovDQo+IC0JaWYgKGFtZGdwdV9tbl9yZWFkX2xvY2soYW1uLCBibG9ja2FibGUpKQ0KPiAt
CQlyZXR1cm4gLUVBR0FJTjsNCj4gLQ0KPiAtCWl0ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0
KCZhbW4tPm9iamVjdHMsIHN0YXJ0LCBlbmQpOw0KPiAtCXdoaWxlIChpdCkgew0KPiAtCQlzdHJ1
Y3QgYW1kZ3B1X21uX25vZGUgKm5vZGU7DQo+IC0NCj4gLQkJaWYgKCFibG9ja2FibGUpIHsNCj4g
LQkJCWFtZGdwdV9tbl9yZWFkX3VubG9jayhhbW4pOw0KPiAtCQkJcmV0dXJuIC1FQUdBSU47DQo+
IC0JCX0NCj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGNvbnRhaW5lcl9vZihtcm4sIHN0cnVj
dCBhbWRncHVfYm8sIG5vdGlmaWVyKTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOw0KPiAgIA0KPiAtCQlub2RlID0gY29udGFp
bmVyX29mKGl0LCBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGl0KTsNCj4gLQkJaXQgPSBpbnRlcnZh
bF90cmVlX2l0ZXJfbmV4dChpdCwgc3RhcnQsIGVuZCk7DQo+ICsJLyogRklYTUU6IElzIHRoaXMg
bmVjZXNzYXJ5PyAqLw0KPiArCWlmICghYW1kZ3B1X3R0bV90dF9hZmZlY3RfdXNlcnB0cihiby0+
dGJvLnR0bSwgcmFuZ2UtPnN0YXJ0LA0KPiArCQkJCQkgIHJhbmdlLT5lbmQpKQ0KPiArCQlyZXR1
cm4gdHJ1ZTsNCj4gICANCj4gLQkJYW1kZ3B1X21uX2ludmFsaWRhdGVfbm9kZShub2RlLCBzdGFy
dCwgZW5kKTsNCj4gLQl9DQo+ICsJaWYgKCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJh
bmdlKSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiAgIA0KPiAtCWFtZGdwdV9tbl9yZWFkX3VubG9j
ayhhbW4pOw0KPiArCW11dGV4X2xvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KPiArCWFtZGdw
dV9hbWRrZmRfZXZpY3RfdXNlcnB0cihiby0+a2ZkX2JvLCBiby0+bm90aWZpZXIubW0pOw0KPiAr
CW11dGV4X3VubG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7DQo+ICAgDQo+IC0JcmV0dXJuIDA7
DQo+ICsJcmV0dXJuIHRydWU7DQo+ICAgfQ0KPiAgIA0KPiAtLyoqDQo+IC0gKiBhbWRncHVfbW5f
c3luY19wYWdldGFibGVzX2hzYSAtIGNhbGxiYWNrIHRvIG5vdGlmeSBhYm91dCBtbSBjaGFuZ2UN
Cj4gLSAqDQo+IC0gKiBAbWlycm9yOiB0aGUgaG1tX21pcnJvciAobW0pIGlzIGFib3V0IHRvIHVw
ZGF0ZQ0KPiAtICogQHVwZGF0ZTogdGhlIHVwZGF0ZSBzdGFydCwgZW5kIGFkZHJlc3MNCj4gLSAq
DQo+IC0gKiBXZSB0ZW1wb3JhcmlseSBldmljdCBhbGwgQk9zIGJldHdlZW4gc3RhcnQgYW5kIGVu
ZC4gVGhpcw0KPiAtICogbmVjZXNzaXRhdGVzIGV2aWN0aW5nIGFsbCB1c2VyLW1vZGUgcXVldWVz
IG9mIHRoZSBwcm9jZXNzLiBUaGUgQk9zDQo+IC0gKiBhcmUgcmVzdG9ydGVkIGluIGFtZGdwdV9t
bl9pbnZhbGlkYXRlX3JhbmdlX2VuZF9oc2EuDQo+IC0gKi8NCj4gLXN0YXRpYyBpbnQNCj4gLWFt
ZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfaHNhKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsDQo+
IC0JCQkgICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICp1cGRhdGUpDQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllcl9vcHMgYW1kZ3B1X21uX2hzYV9v
cHMgPSB7DQo+ICsJLmludmFsaWRhdGUgPSBhbWRncHVfbW5faW52YWxpZGF0ZV9oc2EsDQo+ICt9
Ow0KPiArDQo+ICtzdGF0aWMgaW50IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXMoc3RydWN0IGht
bV9taXJyb3IgKm1pcnJvciwNCj4gKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJf
cmFuZ2UgKnVwZGF0ZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBhbWRncHVfbW4gKmFtbiA9IGNvbnRh
aW5lcl9vZihtaXJyb3IsIHN0cnVjdCBhbWRncHVfbW4sIG1pcnJvcik7DQo+IC0JdW5zaWduZWQg
bG9uZyBzdGFydCA9IHVwZGF0ZS0+c3RhcnQ7DQo+IC0JdW5zaWduZWQgbG9uZyBlbmQgPSB1cGRh
dGUtPmVuZDsNCj4gLQlib29sIGJsb2NrYWJsZSA9IG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2Fi
bGUodXBkYXRlKTsNCj4gLQlzdHJ1Y3QgaW50ZXJ2YWxfdHJlZV9ub2RlICppdDsNCj4gICANCj4g
LQkvKiBub3RpZmljYXRpb24gaXMgZXhjbHVzaXZlLCBidXQgaW50ZXJ2YWwgaXMgaW5jbHVzaXZl
ICovDQo+IC0JZW5kIC09IDE7DQo+IC0NCj4gLQlpZiAoYW1kZ3B1X21uX3JlYWRfbG9jayhhbW4s
IGJsb2NrYWJsZSkpDQo+IC0JCXJldHVybiAtRUFHQUlOOw0KPiAtDQo+IC0JaXQgPSBpbnRlcnZh
bF90cmVlX2l0ZXJfZmlyc3QoJmFtbi0+b2JqZWN0cywgc3RhcnQsIGVuZCk7DQo+IC0Jd2hpbGUg
KGl0KSB7DQo+IC0JCXN0cnVjdCBhbWRncHVfbW5fbm9kZSAqbm9kZTsNCj4gLQkJc3RydWN0IGFt
ZGdwdV9ibyAqYm87DQo+IC0NCj4gLQkJaWYgKCFibG9ja2FibGUpIHsNCj4gLQkJCWFtZGdwdV9t
bl9yZWFkX3VubG9jayhhbW4pOw0KPiAtCQkJcmV0dXJuIC1FQUdBSU47DQo+IC0JCX0NCj4gLQ0K
PiAtCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGl0KTsN
Cj4gLQkJaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfbmV4dChpdCwgc3RhcnQsIGVuZCk7DQo+IC0N
Cj4gLQkJbGlzdF9mb3JfZWFjaF9lbnRyeShibywgJm5vZGUtPmJvcywgbW5fbGlzdCkgew0KPiAt
CQkJc3RydWN0IGtnZF9tZW0gKm1lbSA9IGJvLT5rZmRfYm87DQo+IC0NCj4gLQkJCWlmIChhbWRn
cHVfdHRtX3R0X2FmZmVjdF91c2VycHRyKGJvLT50Ym8udHRtLA0KPiAtCQkJCQkJCSBzdGFydCwg
ZW5kKSkNCj4gLQkJCQlhbWRncHVfYW1ka2ZkX2V2aWN0X3VzZXJwdHIobWVtLCBhbW4tPm1tKTsN
Cj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAtCWFtZGdwdV9tbl9yZWFkX3VubG9jayhhbW4pOw0KPiAr
CWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZSh1cGRhdGUpKQ0KPiArCQlyZXR1cm4g
ZmFsc2U7DQoNClRoaXMgc2hvdWxkIHJldHVybiAtRUFHQUlOLiBOb3Qgc3VyZSBpdCBtYXR0ZXJz
IG11Y2gsIGJlY2F1c2UgdGhpcyB3aG9sZSANCmZ1bmN0aW9uIGRpc2FwcGVhcnMgaW4gdGhlIG5l
eHQgY29tbWl0IGluIHRoZSBzZXJpZXMuIEl0IHNlZW1zIHRvIGJlIA0Kb25seSB2ZXN0aWdpYWwg
YXQgdGhpcyBwb2ludC4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQo+ICAgDQo+ICsJZG93bl9y
ZWFkKCZhbW4tPmxvY2spOw0KPiArCXVwX3JlYWQoJmFtbi0+bG9jayk7DQo+ICAgCXJldHVybiAw
Ow0KPiAgIH0NCj4gICANCj4gQEAgLTI5NSwxMiArMTY0LDEwIEBAIGFtZGdwdV9tbl9zeW5jX3Bh
Z2V0YWJsZXNfaHNhKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsDQo+ICAgDQo+ICAgc3RhdGlj
IHN0cnVjdCBobW1fbWlycm9yX29wcyBhbWRncHVfaG1tX21pcnJvcl9vcHNbXSA9IHsNCj4gICAJ
W0FNREdQVV9NTl9UWVBFX0dGWF0gPSB7DQo+IC0JCS5zeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxl
cyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4LA0KPiAtCQkucmVsZWFzZSA9IGFtZGdw
dV9obW1fbWlycm9yX3JlbGVhc2UNCj4gKwkJLnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzID0g
YW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlcywNCj4gICAJfSwNCj4gICAJW0FNREdQVV9NTl9UWVBF
X0hTQV0gPSB7DQo+IC0JCS5zeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9z
eW5jX3BhZ2V0YWJsZXNfaHNhLA0KPiAtCQkucmVsZWFzZSA9IGFtZGdwdV9obW1fbWlycm9yX3Jl
bGVhc2UNCj4gKwkJLnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzID0gYW1kZ3B1X21uX3N5bmNf
cGFnZXRhYmxlcywNCj4gICAJfSwNCj4gICB9Ow0KPiAgIA0KPiBAQCAtMzI3LDcgKzE5NCw4IEBA
IHN0cnVjdCBhbWRncHVfbW4gKmFtZGdwdV9tbl9nZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsDQo+ICAgCX0NCj4gICANCj4gICAJaGFzaF9mb3JfZWFjaF9wb3NzaWJsZShhZGV2LT5tbl9o
YXNoLCBhbW4sIG5vZGUsIGtleSkNCj4gLQkJaWYgKEFNREdQVV9NTl9LRVkoYW1uLT5tbSwgYW1u
LT50eXBlKSA9PSBrZXkpDQo+ICsJCWlmIChBTURHUFVfTU5fS0VZKGFtbi0+bWlycm9yLmhtbS0+
bW11X25vdGlmaWVyLm1tLA0KPiArCQkJCSAgYW1uLT50eXBlKSA9PSBrZXkpDQo+ICAgCQkJZ290
byByZWxlYXNlX2xvY2tzOw0KPiAgIA0KPiAgIAlhbW4gPSBremFsbG9jKHNpemVvZigqYW1uKSwg
R0ZQX0tFUk5FTCk7DQo+IEBAIC0zMzcsMTAgKzIwNSw4IEBAIHN0cnVjdCBhbWRncHVfbW4gKmFt
ZGdwdV9tbl9nZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCX0NCj4gICANCj4g
ICAJYW1uLT5hZGV2ID0gYWRldjsNCj4gLQlhbW4tPm1tID0gbW07DQo+ICAgCWluaXRfcndzZW0o
JmFtbi0+bG9jayk7DQo+ICAgCWFtbi0+dHlwZSA9IHR5cGU7DQo+IC0JYW1uLT5vYmplY3RzID0g
UkJfUk9PVF9DQUNIRUQ7DQo+ICAgDQo+ICAgCWFtbi0+bWlycm9yLm9wcyA9ICZhbWRncHVfaG1t
X21pcnJvcl9vcHNbdHlwZV07DQo+ICAgCXIgPSBobW1fbWlycm9yX3JlZ2lzdGVyKCZhbW4tPm1p
cnJvciwgbW0pOw0KPiBAQCAtMzY5LDEwMCArMjM1LDMzIEBAIHN0cnVjdCBhbWRncHVfbW4gKmFt
ZGdwdV9tbl9nZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgICogQGJvOiBhbWRn
cHUgYnVmZmVyIG9iamVjdA0KPiAgICAqIEBhZGRyOiB1c2VycHRyIGFkZHIgd2Ugc2hvdWxkIG1v
bml0b3INCj4gICAgKg0KPiAtICogUmVnaXN0ZXJzIGFuIEhNTSBtaXJyb3IgZm9yIHRoZSBnaXZl
biBCTyBhdCB0aGUgc3BlY2lmaWVkIGFkZHJlc3MuDQo+ICsgKiBSZWdpc3RlcnMgYSBtbXVfbm90
aWZpZXIgZm9yIHRoZSBnaXZlbiBCTyBhdCB0aGUgc3BlY2lmaWVkIGFkZHJlc3MuDQo+ICAgICog
UmV0dXJucyAwIG9uIHN1Y2Nlc3MsIC1FUlJOTyBpZiBhbnl0aGluZyBnb2VzIHdyb25nLg0KPiAg
ICAqLw0KPiAgIGludCBhbWRncHVfbW5fcmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHVu
c2lnbmVkIGxvbmcgYWRkcikNCj4gICB7DQo+IC0JdW5zaWduZWQgbG9uZyBlbmQgPSBhZGRyICsg
YW1kZ3B1X2JvX3NpemUoYm8pIC0gMTsNCj4gLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOw0KPiAtCWVudW0gYW1kZ3B1X21uX3R5cGUg
dHlwZSA9DQo+IC0JCWJvLT5rZmRfYm8gPyBBTURHUFVfTU5fVFlQRV9IU0EgOiBBTURHUFVfTU5f
VFlQRV9HRlg7DQo+IC0Jc3RydWN0IGFtZGdwdV9tbiAqYW1uOw0KPiAtCXN0cnVjdCBhbWRncHVf
bW5fbm9kZSAqbm9kZSA9IE5VTEwsICpuZXdfbm9kZTsNCj4gLQlzdHJ1Y3QgbGlzdF9oZWFkIGJv
czsNCj4gLQlzdHJ1Y3QgaW50ZXJ2YWxfdHJlZV9ub2RlICppdDsNCj4gLQ0KPiAtCWFtbiA9IGFt
ZGdwdV9tbl9nZXQoYWRldiwgdHlwZSk7DQo+IC0JaWYgKElTX0VSUihhbW4pKQ0KPiAtCQlyZXR1
cm4gUFRSX0VSUihhbW4pOw0KPiAtDQo+IC0JbmV3X25vZGUgPSBrbWFsbG9jKHNpemVvZigqbmV3
X25vZGUpLCBHRlBfS0VSTkVMKTsNCj4gLQlpZiAoIW5ld19ub2RlKQ0KPiAtCQlyZXR1cm4gLUVO
T01FTTsNCj4gLQ0KPiAtCUlOSVRfTElTVF9IRUFEKCZib3MpOw0KPiAtDQo+IC0JZG93bl93cml0
ZSgmYW1uLT5sb2NrKTsNCj4gLQ0KPiAtCXdoaWxlICgoaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJf
Zmlyc3QoJmFtbi0+b2JqZWN0cywgYWRkciwgZW5kKSkpIHsNCj4gLQkJa2ZyZWUobm9kZSk7DQo+
IC0JCW5vZGUgPSBjb250YWluZXJfb2YoaXQsIHN0cnVjdCBhbWRncHVfbW5fbm9kZSwgaXQpOw0K
PiAtCQlpbnRlcnZhbF90cmVlX3JlbW92ZSgmbm9kZS0+aXQsICZhbW4tPm9iamVjdHMpOw0KPiAt
CQlhZGRyID0gbWluKGl0LT5zdGFydCwgYWRkcik7DQo+IC0JCWVuZCA9IG1heChpdC0+bGFzdCwg
ZW5kKTsNCj4gLQkJbGlzdF9zcGxpY2UoJm5vZGUtPmJvcywgJmJvcyk7DQo+IC0JfQ0KPiAtDQo+
IC0JaWYgKCFub2RlKQ0KPiAtCQlub2RlID0gbmV3X25vZGU7DQo+ICsJaWYgKGJvLT5rZmRfYm8p
DQo+ICsJCWJvLT5ub3RpZmllci5vcHMgPSAmYW1kZ3B1X21uX2hzYV9vcHM7DQo+ICAgCWVsc2UN
Cj4gLQkJa2ZyZWUobmV3X25vZGUpOw0KPiAtDQo+IC0JYm8tPm1uID0gYW1uOw0KPiAtDQo+IC0J
bm9kZS0+aXQuc3RhcnQgPSBhZGRyOw0KPiAtCW5vZGUtPml0Lmxhc3QgPSBlbmQ7DQo+IC0JSU5J
VF9MSVNUX0hFQUQoJm5vZGUtPmJvcyk7DQo+IC0JbGlzdF9zcGxpY2UoJmJvcywgJm5vZGUtPmJv
cyk7DQo+IC0JbGlzdF9hZGQoJmJvLT5tbl9saXN0LCAmbm9kZS0+Ym9zKTsNCj4gKwkJYm8tPm5v
dGlmaWVyLm9wcyA9ICZhbWRncHVfbW5fZ2Z4X29wczsNCj4gICANCj4gLQlpbnRlcnZhbF90cmVl
X2luc2VydCgmbm9kZS0+aXQsICZhbW4tPm9iamVjdHMpOw0KPiAtDQo+IC0JdXBfd3JpdGUoJmFt
bi0+bG9jayk7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gbW11X3JhbmdlX25vdGlm
aWVyX2luc2VydCgmYm8tPm5vdGlmaWVyLCBhZGRyLA0KPiArCQkJCQkgYW1kZ3B1X2JvX3NpemUo
Ym8pLCBjdXJyZW50LT5tbSk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiAtICogYW1kZ3B1X21u
X3VucmVnaXN0ZXIgLSB1bnJlZ2lzdGVyIGEgQk8gZm9yIEhNTSBtaXJyb3IgdXBkYXRlcw0KPiAr
ICogYW1kZ3B1X21uX3VucmVnaXN0ZXIgLSB1bnJlZ2lzdGVyIGEgQk8gZm9yIG5vdGlmaWVyIHVw
ZGF0ZXMNCj4gICAgKg0KPiAgICAqIEBibzogYW1kZ3B1IGJ1ZmZlciBvYmplY3QNCj4gICAgKg0K
PiAtICogUmVtb3ZlIGFueSByZWdpc3RyYXRpb24gb2YgSE1NIG1pcnJvciB1cGRhdGVzIGZyb20g
dGhlIGJ1ZmZlciBvYmplY3QuDQo+ICsgKiBSZW1vdmUgYW55IHJlZ2lzdHJhdGlvbiBvZiBtbXUg
bm90aWZpZXIgdXBkYXRlcyBmcm9tIHRoZSBidWZmZXIgb2JqZWN0Lg0KPiAgICAqLw0KPiAgIHZv
aWQgYW1kZ3B1X21uX3VucmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8pDQo+ICAgew0KPiAt
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRl
dik7DQo+IC0Jc3RydWN0IGFtZGdwdV9tbiAqYW1uOw0KPiAtCXN0cnVjdCBsaXN0X2hlYWQgKmhl
YWQ7DQo+IC0NCj4gLQltdXRleF9sb2NrKCZhZGV2LT5tbl9sb2NrKTsNCj4gLQ0KPiAtCWFtbiA9
IGJvLT5tbjsNCj4gLQlpZiAoYW1uID09IE5VTEwpIHsNCj4gLQkJbXV0ZXhfdW5sb2NrKCZhZGV2
LT5tbl9sb2NrKTsNCj4gKwlpZiAoIWJvLT5ub3RpZmllci5tbSkNCj4gICAJCXJldHVybjsNCj4g
LQl9DQo+IC0NCj4gLQlkb3duX3dyaXRlKCZhbW4tPmxvY2spOw0KPiAtDQo+IC0JLyogc2F2ZSB0
aGUgbmV4dCBsaXN0IGVudHJ5IGZvciBsYXRlciAqLw0KPiAtCWhlYWQgPSBiby0+bW5fbGlzdC5u
ZXh0Ow0KPiAtDQo+IC0JYm8tPm1uID0gTlVMTDsNCj4gLQlsaXN0X2RlbF9pbml0KCZiby0+bW5f
bGlzdCk7DQo+IC0NCj4gLQlpZiAobGlzdF9lbXB0eShoZWFkKSkgew0KPiAtCQlzdHJ1Y3QgYW1k
Z3B1X21uX25vZGUgKm5vZGU7DQo+IC0NCj4gLQkJbm9kZSA9IGNvbnRhaW5lcl9vZihoZWFkLCBz
dHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGJvcyk7DQo+IC0JCWludGVydmFsX3RyZWVfcmVtb3ZlKCZu
b2RlLT5pdCwgJmFtbi0+b2JqZWN0cyk7DQo+IC0JCWtmcmVlKG5vZGUpOw0KPiAtCX0NCj4gLQ0K
PiAtCXVwX3dyaXRlKCZhbW4tPmxvY2spOw0KPiAtCW11dGV4X3VubG9jaygmYWRldi0+bW5fbG9j
ayk7DQo+ICsJbW11X3JhbmdlX25vdGlmaWVyX3JlbW92ZSgmYm8tPm5vdGlmaWVyKTsNCj4gKwli
by0+bm90aWZpZXIubW0gPSBOVUxMOw0KPiAgIH0NCj4gICANCj4gICAvKiBmbGFncyB1c2VkIGJ5
IEhNTSBpbnRlcm5hbCwgbm90IHJlbGF0ZWQgdG8gQ1BVL0dQVSBQVEUgZmxhZ3MgKi8NCltzbmlw
XQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
