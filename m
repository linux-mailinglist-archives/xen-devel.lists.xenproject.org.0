Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DDEC823
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 18:51:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQb2I-0003Vu-OM; Fri, 01 Nov 2019 17:48:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zpbT=YZ=mellanox.com=jgg@srs-us1.protection.inumbo.net>)
 id 1iQb2H-0003Vp-Eq
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 17:48:33 +0000
X-Inumbo-ID: d095ef10-fccf-11e9-9569-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d095ef10-fccf-11e9-9569-12813bfff9fa;
 Fri, 01 Nov 2019 17:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F616PnDasdRhilz2Kc6qSBSImWwZldAPBk2MoucstrbO33xqeD34L+gHY1s6qonatRhw1WSWiK7h9DuvBWDXbxq855BA3gO33b9rt6iu6agzY10GvNpgYIZ8IvhNSaCQ0q4CJCYlatlk3IPuGwRlb4ne8o8f9XzUvEvDb/efSa1xU0Ea94EzZD6z+FKXFP+5ZfUs8P9FC+0Mi3eI/pdwJwgGv7AHx2pmeGBnbdc2EnCmjelCwG9xIbTmb160RQ4SDrBfQqG6kYG55LextOJOs+zzzo3gF7SSonV3t1UAsi4KpZvb3uJdY2g7OWab/oNEfuPHq/nfyMXnx0hAAmJkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxvmHyR/kc6JFGRvJosAQPdPJXSBBjtnI1g5Hj/KEws=;
 b=ZoAnhDjBJTbNwVGnmwyYuReLO2RrvGVYijtVfaFg5FgFS2pzak35WpWAMS4V6zCmCy+VFSOOzUEfOzwjcUTyMMtZCHKbhkkl5x1uSFbrO047Fd8lXwTUG9m7PG+QZDNZ7CsLTLOlpZgz8JsELyGRmhaVer9JA1JCMxFvb2td9nnV7YfQUlSloyw6NSoP4lUMRMJ8v1XMkTckdTOYv/NUyVMUYg5HvYjFJ335qVkuvuHc1d1IOmRYct5sz9xmQXdUmnelW0PoM+9yW55H9PKdgKPXB9NHe+t0tXDCIVdtasinaSOrMWjiJTUfoN1sPQgOi84W5ql3mAmPRyd+Dgon3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxvmHyR/kc6JFGRvJosAQPdPJXSBBjtnI1g5Hj/KEws=;
 b=FvCWpY72ABDpFQg0glTnf9M5C7IHGwioTuTcCLUyFHeA6BAjgMHR03MjEIJg8H+IAB5wnw1c2HwmRifd+QG6uEk9HEISlC1BnqJp0kWmwElDZDXEazhp0eygF6B/V/oNtW2amsmRxkgE/8LvPXsasIb+c3J21i+SnXWqdF4PJQI=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6142.eurprd05.prod.outlook.com (20.178.127.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 17:48:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 17:48:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
Thread-Index: AQHVjcvKV253DVP8r0WB5NYgPgZcBadzahyAgAMzaQA=
Date: Fri, 1 Nov 2019 17:48:27 +0000
Message-ID: <20191101174824.GP22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <0355257f-6a3a-cdcd-d206-aec3df97dded@oracle.com>
In-Reply-To: <0355257f-6a3a-cdcd-d206-aec3df97dded@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:408:4c::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: afffd79b-5541-4515-1c81-08d75ef3b36e
x-ms-traffictypediagnostic: VI1PR05MB6142:
x-microsoft-antispam-prvs: <VI1PR05MB6142BEADE6CA4E316572CDF1CF620@VI1PR05MB6142.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(189003)(199004)(305945005)(66066001)(1076003)(71200400001)(6436002)(316002)(76176011)(52116002)(14454004)(478600001)(81156014)(6486002)(99286004)(4326008)(81166006)(8936002)(2906002)(8676002)(5660300002)(229853002)(186003)(26005)(54906003)(36756003)(66446008)(66556008)(64756008)(256004)(5024004)(6512007)(7416002)(6916009)(2616005)(476003)(446003)(11346002)(486006)(25786009)(386003)(102836004)(3846002)(66476007)(6506007)(71190400001)(6116002)(86362001)(7736002)(33656002)(6246003)(53546011)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6142;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWvQLHUb+Zb2MqMU27umQP6TPY+fVpmmlSrKM8hH4imTr1ThxhA8raoNuDVUeuUxvxntgq+OmEuZ+t/7fvl9DVZRKB75KG+Jeu8NSpkVYXGspFpszg7aubns7VxCPp45sZo/s2pmsiIYnOltwEnCaRSFIl3ydCLIpm4K5dhy3UUlDhRlKwyPncZJJ/LJk8JgH6eyYCTUJ7z1mSWDCLqOLZjFO2o4QdtyXsGOvclRAHx1BWuF8QrkPWmbnwYs/wjOAQ5OASWMOcS2JBEr7NhAmOeWjyJ8vvcj/De69djZUrsvoZBiVsifdkAfcvqVg2M8hnNZZl3cM4q9gVss9e/BJS+f8lF3zJBdI3P7cBz1Ht+w+Vydm3jA4kJzvEY5eYXUsLkadiQ0GLTjosKDBmIOXPbwsjRDM4OjinlqfIIEkC6F4YEPStpj3SCDgclJRgs2
x-ms-exchange-transport-forked: True
Content-ID: <2C63294D1F7ACD45826E5FDF1BD65982@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afffd79b-5541-4515-1c81-08d75ef3b36e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 17:48:28.0304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyKI+02UfkBQHTmFxuAfM6DkrkNGORrCrDW6vdZJ4IdeeO8yWCAvE76jBUBTuwWTulA1i4/hktSr4WPCk2XMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6142
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMTI6NTU6MzdQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDEwLzI4LzE5IDQ6MTAgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+
IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+Cj4gPiBnbnRkZXYg
c2ltcGx5IHdhbnRzIHRvIG1vbml0b3IgYSBzcGVjaWZpYyBWTUEgZm9yIGFueSBub3RpZmllciBl
dmVudHMsCj4gPiB0aGlzIGNhbiBiZSBkb25lIHN0cmFpZ2h0Zm9yd2FyZGx5IHVzaW5nIG1tdV9y
YW5nZV9ub3RpZmllcl9pbnNlcnQoKSBvdmVyCj4gPiB0aGUgVk1BJ3MgVkEgcmFuZ2UuCj4gPgo+
ID4gVGhlIG5vdGlmaWVyIHNob3VsZCBiZSBhdHRhY2hlZCB1bnRpbCB0aGUgb3JpZ2luYWwgVk1B
IGlzIGRlc3Ryb3llZC4KPiA+Cj4gPiBJdCBpcyB1bmNsZWFyIGlmIGFueSBvZiB0aGlzIGlzIGV2
ZW4gc2FuZSwgYnV0IGF0IGxlYXN0IGEgbG90IG9mIGR1cGxpY2F0ZQo+ID4gY29kZSBpcyByZW1v
dmVkLgo+IAo+IEkgZGlkbid0IGhhdmUgYSBjaGFuY2UgdG8gbG9vayBhdCB0aGUgcGF0Y2ggaXRz
ZWxmIHlldCBidXQgYXMgYSBoZWFkcy11cAo+IC0tLSBpdCBjcmFzaGVzIGRvbTAuCgpUaGFua3Mg
Qm9yaXMuIEkgc3BlbnQgYSBiaXQgb2YgdGltZSBhbmQgZ290IGEgVk0gcnVubmluZyB3aXRoIGEg
eGVuCjQuOSBoeXBlcnZpc29yIGFuZCBhIGtlcm5lbCB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzLiBJ
dCBhIHVidW50dSBiaW9uaWMKVk0gd2l0aCB0aGUgZGlzdHJvJ3MgeGVuIHN0dWZmLgoKQ2FuIHlv
dSBnaXZlIHNvbWUgZ3VpZGFuY2UgaG93IHlvdSBtYWRlIGl0IGNyYXNoPyBJIHNlZSB0aGUgVk0K
YXV0b2xvYWRlZCBnbnRkZXY6CgpNb2R1bGUgICAgICAgICAgICAgICAgICBTaXplICBVc2VkIGJ5
Cnhlbl9nbnRkZXYgICAgICAgICAgICAgMjQ1NzYgIDIKeGVuX2V2dGNobiAgICAgICAgICAgICAx
NjM4NCAgMQp4ZW5mcyAgICAgICAgICAgICAgICAgIDE2Mzg0ICAxCnhlbl9wcml2Y21kICAgICAg
ICAgICAgMjQ1NzYgIDE2IHhlbmZzCgpBbmQgbHNvZiBzYXlzIHNldmVyYWwgeGVuIHByb2Nlc3Nl
cyBoYXZlIHRoZSBjaGFyZGV2IG9wZW46Cgp4ZW5zdG9yZWQgIDgxOSAgICAgICAgICAgICAgICAg
cm9vdCAgIDEzdSAgICAgIENIUiAgICAgICAgICAgICAgMTAsNTMgICAgICAwdDAgICAgICAxOTU5
NSAvZGV2L3hlbi9nbnRkZXYKeGVuY29uc29sICA4NTcgICAgICAgICAgICAgICAgIHJvb3QgICAg
OHUgICAgICBDSFIgICAgICAgICAgICAgIDEwLDUzICAgICAgMHQwICAgICAgMTk1OTUgL2Rldi94
ZW4vZ250ZGV2CnhlbmNvbnNvbCAgODU3IDg2MCAgICAgICAgICAgICByb290ICAgIDh1ICAgICAg
Q0hSICAgICAgICAgICAgICAxMCw1MyAgICAgIDB0MCAgICAgIDE5NTk1IC9kZXYveGVuL2dudGRl
dgoKQnV0IG5vIGNyYXNoaW5nLi4KCkhvd2V2ZXIsIEkgd2Fzbid0IGFibGUgdG8gZ2V0IG15IHVz
dWFsIGRlYnVnIGtlcm5lbCAuY29uZmlnIHRvIGJvb3QKd2l0aCB0aGUgeGVuIGh5cGVydmlzb3Is
IGl0IGNyYXNoZXMgb24gZWFybHkgYm9vdCB3aXRoOgoKKFhFTikgRG9tMCBoYXMgbWF4aW11bSA4
IFZDUFVzCihYRU4pIFNjcnViYmluZyBGcmVlIFJBTSBvbiAxIG5vZGVzIHVzaW5nIDggQ1BVcwoo
WEVOKSAuZG9uZS4KKFhFTikgSW5pdGlhbCBsb3cgbWVtb3J5IHZpcnEgdGhyZXNob2xkIHNldCBh
dCAweDEwMDAgcGFnZXMuCihYRU4pIFN0ZC4gTG9nbGV2ZWw6IEFsbAooWEVOKSBHdWVzdCBMb2ds
ZXZlbDogQWxsCihYRU4pICoqKiBTZXJpYWwgaW5wdXQgLT4gRE9NMCAodHlwZSAnQ1RSTC1hJyB0
aHJlZSB0aW1lcyB0byBzd2l0Y2ggaW5wdXQgdG8gWGVuKQooWEVOKSBGcmVlZCA0NjhrQiBpbml0
IG1lbW9yeQooWEVOKSBkMHYwIFVuaGFuZGxlZCBwYWdlIGZhdWx0IGZhdWx0L3RyYXAgWyMxNCwg
ZWM9MDAwMl0KKFhFTikgUGFnZXRhYmxlIHdhbGsgZnJvbSBmZmZmZmJmZmYwNDgwZmJlOgooWEVO
KSAgTDRbMHgxZjddID0gMDAwMDAwMDAwMDAwMDAwMCBmZmZmZmZmZmZmZmZmZmZmCihYRU4pIGRv
bWFpbl9jcmFzaF9zeW5jIGNhbGxlZCBmcm9tIGVudHJ5LlM6IGZhdWx0IGF0IGZmZmY4MmQwODAz
NDhhMDYgZW50cnkubyNjcmVhdGVfYm91bmNlX2ZyYW1lKzB4MTM1LzB4MTVmCihYRU4pIERvbWFp
biAwICh2Y3B1IzApIGNyYXNoZWQgb24gY3B1IzA6CihYRU4pIC0tLS1bIFhlbi00LjkuMiAgeDg2
XzY0ICBkZWJ1Zz1uICAgTm90IHRhaW50ZWQgXS0tLS0KKFhFTikgQ1BVOiAgICAwCihYRU4pIFJJ
UDogICAgZTAzMzpbPGZmZmZmZmZmODJiOWY3MzE+XQooWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAw
MDAyOTYgICBFTTogMSAgIENPTlRFWFQ6IHB2IGd1ZXN0IChkMHYwKQooWEVOKSByYXg6IGZmZmZm
YmZmZjA0ODBmYmUgICByYng6IDAwMDAwMDAwMDAwMDAwMDAgICByY3g6IDAwMDAwMDAwYzAwMDAx
MDEKKFhFTikgcmR4OiAwMDAwMDAwMGZmZmZmZmZmICAgcnNpOiBmZmZmZmZmZjg0MDI2MDAwICAg
cmRpOiBmZmZmZmZmZjgyY2I0YTIwCihYRU4pIHJicDogZmZmZmZmZmY4MjQwN2ZmOCAgIHJzcDog
ZmZmZmZmZmY4MjQwN2RhMCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSByOTogIDAwMDAw
MDAwMDAwMDAwMDAgICByMTA6IDAwMDAwMDAwMDAwMDAwMDAgICByMTE6IDAwMDAwMDAwMDAwMDAw
MDAKKFhFTikgcjEyOiAwMDAwMDAwMDAwMDAwMDAwICAgcjEzOiAxZmZmZmZmZmYwNDgwZmJlICAg
cjE0OiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIHIxNTogMDAwMDAwMDAwMDAwMDAwMCAgIGNyMDog
MDAwMDAwMDA4MDA1MDAzYiAgIGNyNDogMDAwMDAwMDAwMDM1MDZlMAooWEVOKSBjcjM6IDAwMDAw
MDAwMzQwMjcwMDAgICBjcjI6IGZmZmZmYmZmZjA0ODBmYmUKKFhFTikgZnNiOiAwMDAwMDAwMDAw
MDAwMDAwICAgZ3NiOiBmZmZmZmZmZjgyYjYxMDAwICAgZ3NzOiAwMDAwMDAwMDAwMDAwMDAwCihY
RU4pIGRzOiAwMDAwICAgZXM6IDAwMDAgICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6IGUwMmIg
ICBjczogZTAzMwoKV2hpY2ggaXMgc3VyZWx5IHNvbWUgLmNvbmZpZyBpc3N1ZSwgYnV0IEkgZGlk
bid0IGZpZ3VyZSBvdXQgd2hhdC4KCkphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
