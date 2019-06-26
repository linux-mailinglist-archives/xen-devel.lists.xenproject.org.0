Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DF56F1B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 18:49:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgB4V-0005lt-1u; Wed, 26 Jun 2019 16:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4dBd=UZ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hgB4T-0005li-OA
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 16:46:57 +0000
X-Inumbo-ID: 014c2cee-9832-11e9-ad4f-870dec521a28
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (unknown
 [40.107.78.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 014c2cee-9832-11e9-ad4f-870dec521a28;
 Wed, 26 Jun 2019 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j/C79CApX07klxUG8EpWUGaBU9YtbLevX42ko5d2H4=;
 b=uljiElA+7ZKpqy0DqLSDNsSRVDubVnOGjCf58Hn9xg4oR/kHtaIYiOChnZhvfI/JCel+ARx9oouLVjqyII7N1q3LKzWxY0tCr5ShCtKAz2My+nCJmmXD+yPGaWphrir062z42XBwIbIz6HwwgaktmeIa4YNCJwkVmGTVKlsSBss=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3738.namprd12.prod.outlook.com (10.255.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 16:46:54 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653%7]) with mapi id 15.20.2008.018; Wed, 26 Jun 2019
 16:46:54 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2] AMD/IOMMU: don't "add" IOMMUs
Thread-Index: AQHVGs8xs0csJ+BTiEupAg5BYQq55aauAEEAgABHooA=
Date: Wed, 26 Jun 2019 16:46:53 +0000
Message-ID: <20190626164650.GA8299@amd.com>
References: <5CF660D50200007800235060@prv1-mh.provo.novell.com>
 <7ade78af-578a-3614-8f1e-f378c5cf7184@citrix.com>
In-Reply-To: <7ade78af-578a-3614-8f1e-f378c5cf7184@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:805:8e::19) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc4d44fe-e23c-47e0-fd74-08d6fa55e4b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3738; 
x-ms-traffictypediagnostic: DM6PR12MB3738:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB37386A0A6DB505B659BF1F7BE5E20@DM6PR12MB3738.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(376002)(366004)(39860400002)(199004)(189003)(305945005)(71200400001)(71190400001)(66946007)(52116002)(6506007)(102836004)(386003)(6512007)(66066001)(76176011)(2616005)(33656002)(316002)(229853002)(72206003)(53546011)(6306002)(966005)(486006)(478600001)(476003)(6436002)(6916009)(186003)(14454004)(26005)(54906003)(3846002)(6486002)(11346002)(68736007)(36756003)(8676002)(81166006)(4326008)(86362001)(446003)(81156014)(73956011)(64756008)(66556008)(66476007)(4744005)(256004)(2906002)(6116002)(1076003)(25786009)(8936002)(6246003)(5660300002)(7736002)(53936002)(99286004)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3738;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TQragLMYppNll19f8aBtCR2AgTt7fZXjdWGBdS2gV1Ne93vgXJv0BbK4eNDXC5xomJYamRDFffLxRgTGACM4jUX+8DQaCIEbT4qr1tp+yNoEOsgGAM4j7e527yqbWDiPzW0S0ki3Tr6XSwrSikA5cgQcOleFxj0X0xrFH7rHzDInPJPc9prPlMFOcIGKwE7GGbzPDnvH0SuyPqCWBNjuv7lHlUEHdygc2VPH7hTdkW7SM+M7RwLI8fx/gIe2ytYYjfrpnbwksay5U8YNoCjXWbif8lmNckeH7iiMRAe/I2PzNS8HWRfZJfCv9ua6Wn6BRjEpJwYGOb6sPA3T/7MgkAiOsVk7nt8tmLLrNkyFK6WbHtXfqpA1H48l8gFiqCPq77qC/lznPkU0Lc5Uvcb/lJ8Rpvv/kY5Y7a14KZZkE2k=
Content-ID: <D1CD7D57508E4947A4AE3D4157E97492@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4d44fe-e23c-47e0-fd74-08d6fa55e4b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 16:46:53.8461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3738
Subject: Re: [Xen-devel] [PATCH v2] AMD/IOMMU: don't "add" IOMMUs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDE6MzA6MjhQTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gT24gMDQvMDYvMjAxOSAxMzoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBGb3IgZmlu
ZF9pb21tdV9mb3JfZGV2aWNlKCkgdG8gY29uc2lzdGVudGx5IChpbmRlcGVuZGVudCBvZiBBQ1BJ
IHRhYmxlcykKPiA+IHJldHVybiBOVUxMIGZvciB0aGUgUENJIGRldmljZXMgY29ycmVzcG9uZGlu
ZyB0byBJT01NVXMsIG1ha2Ugc3VyZQo+ID4gSU9NTVVzIGRvbid0IGdldCBtYXBwZWQgdG8gdGhl
bXNlbHZlcyBieSBpdnJzX21hcHBpbmdzW10uCj4gPgo+ID4gV2hpbGUgYW1kX2lvbW11X2FkZF9k
ZXZpY2UoKSB3b24ndCBiZSBjYWxsZWQgZm9yIElPTU1VcyBmcm9tCj4gPiBwY2lfYWRkX2Rldmlj
ZSgpLCBhcyBJT01NVXMgaGF2ZSBnb3QgbWFya2VkIHIvbywKPiA+IF9zZXR1cF9od2RvbV9wY2lf
ZGV2aWNlcygpIGNhbGxzIHRoZXJlIG5ldmVydGhlbGVzcy4gQXZvaWQgaXNzdWluZyB0aGUKPiA+
IGJvZ3VzIGRlYnVnZ2luZyBvbmx5ICJObyBpb21tdSBmb3IgLi4uOyBjYW5ub3QgYmUgaGFuZGVk
IHRvIC4uLiIgbG9nCj4gPiBtZXNzYWdlIGFzIHdlbGwgYXMgdGhlIG5vbi1kZWJ1Z2dpbmcgInNl
dHVwIC4uLiBmb3IgLi4uIGZhaWxlZCAoLTE5KSIKPiA+IG9uZS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQnJpYW4gV29v
ZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWwKCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
