Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA1F581E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 21:21:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTAit-0007TZ-6R; Fri, 08 Nov 2019 20:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rAIK=ZA=mellanox.com=jgg@srs-us1.protection.inumbo.net>)
 id 1iTAir-0007TT-IJ
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 20:19:09 +0000
X-Inumbo-ID: 046376f6-0265-11ea-9631-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 046376f6-0265-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 20:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Shdek16O9havtmmpIcPaNy0nMjZfNtQaHnmv+kvg/zzjzztNUaGgl1VsRdeq/KNBNTQRjBr818Vd0dP8mO2p23Czwmoo86E9VJKjBC6jj+vKWn8LHRsWTwugeQWpl1xb3iHxxo2MIWB0vdSOGvZ1aqZAykHdr8EJxzIfJ4W1aZ1cEj+fvIF8eqcML0FNRiDLHFexCl1xB4epfXyAxP/S8LMXsvQDMNomOFf7HSnZetVx5IyqNl3y8SpGzLip+8746qOCx3x8/MmkzDN+dd6SKbr4VQwJSr73+rx9oVXLFpsJHMd/K1umckOcmuNOiUkp8q4qo5bC3BtM0KhxUDbapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXu1ftVqG84gk5mWA7L5dB+kOrKG7FI6r7w4CIV8Itk=;
 b=MGYWJDnlvTn0sIKQR+dsdqrnUNFRANEz4K7x0IqHSOPhf0oO2BIskWi1K/FHugxhKZMZR8BZTw+PIKMIMZ1ph5fYYl83tsMlwgr02LOXo7ozU+Pp8AFFR+jt68kCxMDgJcynDz3UWahoCwMj8yoJf/KwUrOjCxj5BvhzOTppaNaKgl9dyZX6HiQnTDxL/fbc8hGHGuBRFJUoh+tQSQcbUf7ayrD4YV9y3KmiZLfdu/sYRjCWqAp0JeGrxZxkVPB4kzM+N3flwJBHMyGs74zdGxj1B+zgK6m+9/NMVTVX3RyGNWZCA/RVKx6QnLCulYXhQa+8/511dbtaepYVLnHr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXu1ftVqG84gk5mWA7L5dB+kOrKG7FI6r7w4CIV8Itk=;
 b=ejgWWnujEWLXP8SwiCcM0J9Vwypgncc+gaz/AMmBR4H+8/wWlaLJF03Oxp1iRjfzGDFTxyJOr0bcCHxxNrWp2GOZfF5+tR35fgI0GE0lN77VapkhH6kfHskDINvWNALckCrkexkVSMMYb98nDgQHbecF4TCECeoQ80PZfWGP7H0=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5215.eurprd05.prod.outlook.com (20.178.9.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 20:19:06 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 20:19:06 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Thread-Topic: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVjcvJYOye0EiwZkisYK74G5bmhqd+54eAgAAdRYCAAS6QAIAADtYAgAA6K4CAABioAIABMugA
Date: Fri, 8 Nov 2019 20:19:06 +0000
Message-ID: <20191108201902.GM21728@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107020807.GA747656@redhat.com> <20191107201102.GC21728@mellanox.com>
 <20191107210408.GA4716@redhat.com> <20191108003219.GD21728@mellanox.com>
 <20191108020034.GA470884@redhat.com>
In-Reply-To: <20191108020034.GA470884@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:405:75::31) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b986b512-2b45-41d3-b746-08d76488e780
x-ms-traffictypediagnostic: VI1PR05MB5215:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5215A383E16B61C1949A18AFCF7B0@VI1PR05MB5215.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(316002)(99286004)(386003)(486006)(305945005)(66446008)(7736002)(229853002)(2616005)(71200400001)(6246003)(71190400001)(86362001)(476003)(6506007)(102836004)(26005)(1076003)(6436002)(66556008)(7416002)(76176011)(64756008)(66946007)(6916009)(446003)(6512007)(6306002)(54906003)(186003)(5660300002)(14444005)(256004)(11346002)(52116002)(6486002)(66476007)(6116002)(81156014)(81166006)(25786009)(8676002)(33656002)(4326008)(66066001)(36756003)(3846002)(2906002)(478600001)(8936002)(966005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5215;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: deARcU8CVWe9irQLX8J1FwM7UgKWuCcJuxHyyVmGNZwHSq7P575eWWnZVkV/JtA7nzbny3mhni67QSL5gFP9LUS0WgE/FQiVk+qXiL9GI52Jrui8uS9mMQgyu9iXRiqGi/HhSL7kuAd+QP3xYNI1HmLMD6ZC/BTWar4l9Ob2Q8pVojuwvk1d0DbD9HiRnKNUHwqaouBstOWCBYjxoQuBQtC4nzmswKIrFIM1dXStrjFtpNzZTU1zwQwlg5gqDNA7EOLyX19cclPKL5IvLOfgr8NISyDtqPNJgS4fw69ym6ql+bmRM6Yt1Cx9WiAZTxmfKQV79m1HirPVTdBLrIzZafXeyDjLg1Cj+yJ9bQeNsMynCjtPTzhCHHFD9sjznCw7R3UQFCeyZp4Bf8STfOuT70HlwYk5O1iKB101C0xkaOdP1DMhKdbvXJuKGDO5Bs5chT65xcMj2J89t1mdhvzsk0Y/RXQrznwk1X90hs4srjg=
x-ms-exchange-transport-forked: True
Content-ID: <4A274D8A173AC34180928F1E00490803@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b986b512-2b45-41d3-b746-08d76488e780
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 20:19:06.0725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8CdqcksxZm0V0FsWFGI1qc0P7nV5ILTdo+MvFOiFbnxSrDdSkJm+yyhgv9ItjaUuzBBxRkxXIQTO3pxa5dmtNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5215
Subject: Re: [Xen-devel] [PATCH v2 02/15] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MDA6MzRQTSAtMDUwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBGcmksIE5vdiAwOCwgMjAxOSBhdCAxMjozMjoyNUFNICswMDAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNDowNDowOFBNIC0w
NTAwLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAw
ODoxMTowNlBNICswMDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBO
b3YgMDYsIDIwMTkgYXQgMDk6MDg6MDdQTSAtMDUwMCwgSmVyb21lIEdsaXNzZSB3cm90ZToKPiA+
ID4gPiAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEV4dHJhIGNyZWRpdDogSU1ITywgdGhpcyBj
bGVhcmx5IGRlc2VydmVzIHRvIGFsbCBiZSBpbiBhIG5ldyBtbXVfcmFuZ2Vfbm90aWZpZXIuaAo+
ID4gPiA+ID4gPiBoZWFkZXIgZmlsZSwgYnV0IEkga25vdyB0aGF0J3MgZXh0cmEgd29yay4gTWF5
YmUgbGF0ZXIgYXMgYSBmb2xsb3ctdXAgcGF0Y2gsCj4gPiA+ID4gPiA+IGlmIGFueW9uZSBoYXMg
dGhlIHRpbWUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSByYW5nZSBub3RpZmllciBzaG91bGQg
Z2V0IHRoZSBldmVudCB0b28sIGl0IHdvdWxkIGJlIGEgd2FzdGUsIGkgdGhpbmsgaXQgaXMKPiA+
ID4gPiA+IGFuIG92ZXJzaWdodCBoZXJlLiBUaGUgcmVsZWFzZSBldmVudCBpcyBmaW5lIHNvIE5B
SyB0byB5b3Ugc2VwYXJhdGUgZXZlbnQuIEV2ZW50Cj4gPiA+ID4gPiBpcyByZWFsbHkgYW4gaGVs
cGVyIGZvciBub3RpZmllciBpIGhhZCBhIHNldCBvZiBwYXRjaCBmb3Igbm91dmVhdSB0byBsZXZl
cmFnZQo+ID4gPiA+ID4gdGhpcyBpIG5lZWQgdG8gcmVzdWNpdGUgdGhlbS4gU28gbm8gbmVlZCB0
byBzcGxpdCB0aGluZywgaSB3b3VsZCBqdXN0IGZvcndhcmQKPiA+ID4gPiA+IHRoZSBldmVudCBp
ZSBhZGQgZXZlbnQgdG8gbW11X3JhbmdlX25vdGlmaWVyX29wcy5pbnZhbGlkYXRlKCkgaSBmYWls
ZWQgdG8gY2F0Y2gKPiA+ID4gPiA+IHRoYXQgaW4gdjEgc29ycnkuCj4gPiA+ID4gCj4gPiA+ID4g
SSB0aGluayB3aGF0IHlvdSBtZWFuIGlzIGFscmVhZHkgZG9uZT8KPiA+ID4gPiAKPiA+ID4gPiBz
dHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyX29wcyB7Cj4gPiA+ID4gCWJvb2wgKCppbnZhbGlkYXRl
KShzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4sCj4gPiA+ID4gCQkJICAgY29uc3Qgc3Ry
dWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UsCj4gPiA+ID4gCQkJICAgdW5zaWduZWQgbG9u
ZyBjdXJfc2VxKTsKPiA+ID4gCj4gPiA+IFllcyBpdCBpcyBzb3JyeSwgaSBnb3QgY29uZnVzZSB3
aXRoIG1tdV9yYW5nZV9ub3RpZmllciBhbmQgbW11X25vdGlmaWVyX3JhbmdlIDopCj4gPiA+IEl0
IGlzIGFsbW9zdCBhIHBhbHluZHJvbWUgc3RydWN0dXJlIDspCj4gPiAKPiA+IExldHMgY2hhbmdl
IHRoZSBuYW1lIHRoZW4sIHRoaXMgaXMgY2xlYXJseSBub3Qgd29ya2luZy4gSSdsbCByZWZsb3cK
PiA+IGV2ZXJ5dGhpbmcgdG9tb3Jyb3cKPiAKPiBTZW1hbnRpYyBwYXRjaCB0byBkbyB0aGF0IHJ1
biBmcm9tIHlvdXIgbGludXgga2VybmVsIGRpcmVjdG9yeSB3aXRoIHlvdXIgcGF0Y2gKPiBhcHBs
aWVkICh5b3UgY2FuIHJ1biBpdCBvbmUgcGF0Y2ggYWZ0ZXIgdGhlIG90aGVyIGFuZCB0aGUgZ2l0
IGNvbW1pdCAtYSAtLWZpeHVwIEhFQUQpCj4gCj4gc3BhdGNoIC0tc3AtZmlsZSBuYW1lLW9mLXRo
ZS1maWxlLWJlbG93IC0tZGlyIC4gLS1hbGwtaW5jbHVkZXMgLS1pbi1wbGFjZQo+IAo+ICU8IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+IEBACj4gQEAKPiBzdHJ1Y3QKPiAtbW11X3JhbmdlX25vdGlmaWVyCj4gK21tdV9p
bnRlcnZhbF9ub3RpZmllcgo+IAo+IEBACj4gQEAKPiBzdHJ1Y3QKPiAtbW11X3JhbmdlX25vdGlm
aWVyCj4gK21tdV9pbnRlcnZhbF9ub3RpZmllcgo+IHsuLi59Owo+IAo+IC8vIENoYW5nZSBtcm4g
bmFtZSB0byBtbXVfaW4KPiBAQAo+IHN0cnVjdCBtbXVfaW50ZXJ2YWxfbm90aWZpZXIgKm1ybjsK
PiBAQAo+IC1tcm4KPiArbW11X2luCj4gCj4gQEAKPiBpZGVudGlmaWVyIGZuOwo+IEBACj4gZm4o
Li4uLCAKPiAtc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllciAqbXJuLAo+ICtzdHJ1Y3QgbW11
X2ludGVydmFsX25vdGlmaWVyICptbXVfaW4sCj4gLi4uKSB7Li4ufQo+IAo+IFlvdSBuZWVkIGNv
Y2NpbmVsbGUgKHdoaWNoIHByb3ZpZGVzIHNwYXRjaCkuIEl0IGlzIHVudGVzdGVkIGJ1dCBpdCBz
aG91bGQgd29yawo+IGFsc28gaSBjb3VsZCBub3QgY29tZSB1cCB3aXRoIGEgbmljZSBuYW1lIHRv
IHVwZGF0ZSBtcm4gYXMgbWluIGlzIHdheSB0b28KPiBjb25mdXNpbmcuIElmIHlvdSBoYXZlIGJl
dHRlciBuYW1lIGZlZWwgZnJlZSB0byB1c2UgaXQuCgpJIHVzZWQgJ21uaScgYXMgd2UgYWxyZWFk
eSB1c2UgJ21uJyB0byByZWZlciB0byB0aGUgbm90aWZpZXIsIGFuZAonbW11X2luJyBsb29rcyBs
aWtlIHNvbWUgaW5wdXQgcGFyYW1ldGVyIG9yIHNvbWV0aGluZwoKSXQgbW9zdGx5IHdvcmtlZCwg
bG90cyBvZiBjb21tZW50cyB0byBmaXggbWFudWFsbHkgdGhvdWdoOgoKaHR0cHM6Ly9naXRodWIu
Y29tL2pndW50aG9ycGUvbGludXgvY29tbWl0cy9tbXVfbm90aWZpZXIKClRoYW5rcywKSmFzb24K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
