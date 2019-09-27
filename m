Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C16C073C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:24:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDr7j-00052n-VQ; Fri, 27 Sep 2019 14:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDr7i-00052f-8I
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:21:30 +0000
X-Inumbo-ID: 185b7ce8-e132-11e9-97fb-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::626]) by localhost (Halon) with ESMTPS
 id 185b7ce8-e132-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 14:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCyRYLaZrYxBjYpS3qxk1/OkfMJ8SkLo3spZHRISnNfg8uSG2L8XpW3T9IHDhhS7hXWnJ55O88REvBrpmli19TV9970BP7Pgyz4+nUSKi5DHNhsSpA5soZrXQaNh6xzm1WRYut/GpBqAsN08lJCkTfzqkF5xmzNc7BXjek6W2OXF6R7Ulj7Vn5jikUU+TZH1pDssbd7/FzPt0RsBDc/qAF5lnmc0E6HRRIHZKFKMjf0M2g9dqCeZaI8AZi8U47peCdHLZVH1N9TRmyPDuwLmZTC/wZyJDd35z/H8oVB6ygXjFnuUHBl5j+trTgjj85JzLAXYEohvbluyfDCwjcW4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=615WPEoj1t/gIKY2fQJRF0wV4q32+RDWIoszVYLTgyU=;
 b=jVpP6vbUBA1K+92dx8WWCevXCW03PbtuZM1Y4NRMK8r+QGHKD19YsQmNjj7Wwyo8VPR6dHRFMvcFOb5/zIG62YOogzg52LUum0uXy8PIjiLRbXismztwqrhvZOnygF7416Rd9GFNbjqpegNFS9RwLp2bvGTyX2nQLzPP+NVHu33Znf9+VcBhFx2ckDr0B9otFAHJ4XxEjVt+BpkT+B+1nUd71Eh07rnGHkapklH+BpENmumIKaeuhu2uj3rqweB2dQI/jDiOU+ZYV4hAhQYAahhuoBpZqGelvcWEFiIt/IV1A5vvVsBvfdsuVqxXWnzb3D/YT9d1HKog+zK3+G3Acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=615WPEoj1t/gIKY2fQJRF0wV4q32+RDWIoszVYLTgyU=;
 b=A8+1HvYHpZ8DwesIndouxeTfe3TrqKqY0pVa9ZjOjCAHGyPSPPlGeyoSSyXJ34GFzBU+Jce8Oz+eW9qQ94RY1Vp8ZwLGaABLYAtsxCXMAi+XVfAz8tSvz0nenbalQe9VSOIEG9KBNuWehvHHEqRDyH++0A2Focah/mt3pVUWv7w=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4849.eurprd03.prod.outlook.com (20.178.21.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 14:21:27 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 14:21:27 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmSz7FwOb+ZL0aIExPYLyfVU6c/a/SAgAAHRoCAAATGAIAACkYAgAAExICAAAqUgIAAAuAA
Date: Fri, 27 Sep 2019 14:21:27 +0000
Message-ID: <87lfu995w9.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
 <df6b891c-2670-47d9-ae0d-223161edc225@arm.com> <87muep984i.fsf@epam.com>
 <8bc36926-a00f-d20b-c3b2-12491ed576de@arm.com>
In-Reply-To: <8bc36926-a00f-d20b-c3b2-12491ed576de@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b450fe2a-9f46-4e10-8376-08d74355fbdc
x-ms-traffictypediagnostic: AM0PR03MB4849:|AM0PR03MB4849:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4849FB379DEC278CA7982936E6810@AM0PR03MB4849.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(51444003)(199004)(189003)(2616005)(4326008)(36756003)(11346002)(107886003)(6916009)(5660300002)(99286004)(486006)(66066001)(6512007)(186003)(55236004)(71190400001)(102836004)(7736002)(26005)(71200400001)(8936002)(6116002)(3846002)(478600001)(229853002)(66446008)(64756008)(76176011)(66556008)(6246003)(14454004)(446003)(8676002)(6506007)(25786009)(305945005)(53546011)(86362001)(80792005)(81156014)(66946007)(6486002)(6436002)(76116006)(66476007)(81166006)(476003)(256004)(2906002)(316002)(54906003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4849;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bbxEMxAbiaPhK83romtFQ/gmn8v/cPdZiHSdye/LWAL2s5lDEVzPR8qxSuYSgBbnKzxyXsrHQr3RzEO/OjXxkYgDJmsGn0lNYGWqHneSpWEruBCIUEynzDdEbWolf3bxtNHuK+VsynmOD4Ty1I4RSIMOu7cgu4uyTLDjVfVrmiwKCzyy8T/Aj1yzobMsfC0fygF3kD/k5wmoQLulqetwA8AbS9LGqbbDxsPCUD6lc10rF/Wj7RGxlZ+hdFVuslBHzNRWWWluzN2jqHhr0BZ/XyzbJPNH1z54m+o8Io+n8iyzm57c4LukfVbAyG7NjVjxa0WnC1J6/xMn1M+PsBv8Y5SDKRhmktfPeMBgVyO5SovRWuF56XPDMVrgH52CDLWgYYQKdr4axW034lXkiz8RtOEwNztHjna6+2VYSTVKIuQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b450fe2a-9f46-4e10-8376-08d74355fbdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 14:21:27.1899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hc4/G7F/jKx0WPrpLnjazJoWzuKhfxNaZ9ntRKI6Y2lly0JstHhj7nbxslH1PjB7RsotWOTgut2xtUZmw3X0iB70zif/C9vYpb/zxuW89Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4849
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDI3LzA5LzIwMTkgMTQ6MzMsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4gT24gMjcvMDkvMjAxOSAx
MzozOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoK
Pj4+Pj4gT24gMjcvMDkvMjAxOSAxMjo1NiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+
PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4+Pj4KPj4+Pj4+PiBBdCB0aGUgbW9tZW50LCBTU0JE
IHdvcmthcm91bmQgaXMgcmUtZW5hYmxlZCBmb3IgWGVuIGFmdGVyIGludGVycnVwdHMKPj4+Pj4+
PiBhcmUgdW5tYXNrZWQuIFRoaXMgbWVhbnMgd2UgbWF5IGVuZCB1cCB0byBleGVjdXRlIHNvbWUg
cGFydCBvZiB0aGUKPj4+Pj4+PiBoeXBlcnZpc29yIGlmIGFuIGludGVycnVwdCBpcyByZWNlaXZl
ZCBiZWZvcmUgdGhlIHdvcmthcm91bmQgaXMKPj4+Pj4+PiByZS1lbmFibGVkLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gQXMgdGhlIHJlc3Qgb2YgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkgZG9lcyBu
b3QgcmVxdWlyZSB0byBoYXZlCj4+Pj4+Pj4gaW50ZXJydXB0cyBtYXNrZWQsIHRoZSBmdW5jdGlv
biBpcyBub3cgc3BsaXQgaW4gdHdvIHBhcnRzOgo+Pj4+Pj4+ICAgICAgICAxKSBlbnRlcl9oeXBl
cnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoKSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHRzCj4+Pj4+Pj4g
ICAgICAgICAgIG1hc2tlZC4KPj4+Pj4+IEknbSBva2F5IHdpdGggdGhpcyBhcHByb2FjaCwgYnV0
IEkgZG9uJ3QgbGlrZSBuYW1lIGZvcgo+Pj4+Pj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0
X25vaXJxKCkuIFJpZ2h0IG5vdyBpdCBpcyBkb2luZyBleGFjdGx5IG9uZQo+Pj4+Pj4gdGhpbmcg
LSBtaXRpZ2F0ZXMgU1NCRC4gU28sIG1heWJlIG1vcmUgYXBwcm9wcmlhdGUgbmFtZSB3aWxsIGJl
Cj4+Pj4+PiBzb21ldGhpbmcgbGlrZSAibWl0aWdhdGVfc3NiZCgpIiA/Cj4+Pj4+Cj4+Pj4+IElm
IEkgd2FudGVkIHRvIGNhbGwgaXQgbWl0aWdhdGVfc3NiZCgpIEkgd291bGQgaGF2ZSBpbXBsZW1l
bnRlZAo+Pj4+PiBjb21wbGV0ZWx5IGRpZmZlcmVudGx5LiBUaGUgcmVhc29uIGl0IGlzIGxpa2Ug
dGhhdCBpcyBiZWNhdXNlIHdlIG1heQo+Pj4+PiBuZWVkIG1vcmUgY29kZSB0byBiZSBhZGRlZCBo
ZXJlIGluIHRoZSBmdXR1cmUgKEkgaGF2ZSBBbmRyaWkncyBzZXJpZXMKPj4+Pj4gaW4gbWluZCku
IFNvIEkgd291bGQgcmF0aGVyIGF2b2lkIGEgZnVydGhlciByZW5hbWluZyBsYXRlciBvbiBhbmQg
c29tZQo+Pj4+PiByZXdvcmsuCj4+Pj4gRmFpciBlbm91Z2gKPj4+Pgo+Pj4+Pgo+Pj4+PiBSZWdh
cmRpbmcgdGhlIG5hbWUsIHRoaXMgaXMgYSBzcGxpdCBvZgo+Pj4+PiBlbnRlcl9oeXBlcnZpc29y
X2Zyb21fZ3Vlc3QoKS4gSGVuY2UsIHdoeSB0aGUgZmlyc3QgcGF0aCBpcyB0aGUKPj4+Pj4gc2Ft
ZS4gVGhlIG5vaXJxIG1lcmVseSBoZWxwIHRoZSB1c2VyIHRvIGtub3cgd2hhdCB0byBleHBlY3Qu
IFRoaXMgaXMKPj4+Pj4gYmV0dGVyIG9mIHlldCBhbiBfXyB2ZXJzaW9uLiBGZWVsIGZyZWUgdG8g
c3VnZ2VzdCBhIGJldHRlciBzdWZmaXguCj4+Pj4gSSdtIGJhZCBhdCBuYW1pbmcgdGhpbmdzIDop
Cj4+Pgo+Pj4gTWUgdG9vIDspLgo+Pj4KPj4+Pgo+Pj4+IEkgdW5kZXJzdGFuZCB0aGF0IGlzIHR3
byBoYWx2ZXMgb2Ygb25lIGZ1bmN0aW9uLiBCdXQgZnVuY19uYW1lX25vaXJxKCkKPj4+PiBwYXR0
ZXJuIGlzIHdpZGVseSB1c2VkIGZvciBvdGhlciBjYXNlOiB3aGVuIHdlIGhhdmUgZnVuY19uYW1l
X25vaXJxKCkKPj4+PiBmdW5jdGlvbiBhbmQgc29tZSBmdW5jX25hbWUoKSB0aGF0IGRpc2FibGVz
IGludGVycnVwdHMgbGlrZSB0aGlzOgo+Pj4+Cj4+Pj4gdm9pZCBmdW5jX25hbWUoKQo+Pj4+IHsK
Pj4+PiAgICAgICAgICAgZGlzYWJsZV9pcnFzKCk7Cj4+Pj4gICAgICAgICAgIGZ1bmNfbmFtZV9u
b2lycSgpOwo+Pj4+ICAgICAgICAgICBlbmFibGVfaXJxcygpOwo+Pj4+IH0KPj4+Pgo+Pj4+IEkg
bGlrZSBwcmluY2lwbGUgb2YgbGVhc3Qgc3VycHJpc2UsIHNvIGl0IGlzIGJldHRlciB0byB1c2Ug
c29tZSBvdGhlcgo+Pj4+IG5hbWluZyBwYXR0ZXJuIHRoZXJlLgo+Pj4KPj4+IEkgY2FuJ3QgZmlu
ZCBhbnkgZnVuY3Rpb24gc3VmZml4ZWQgd2l0aCBfbm9pcnEgaW4gWGVuLiBTbyBJIGRvbid0Cj4+
PiB0aGluayB0aGlzIHdvdWxkIGJlIGEgbWFqb3IgaXNzdWUgaGVyZS4KPj4gWWVzLCB0aGVyZSBh
cmUgbm8gc3VjaCBmdW5jdGlvbnMgaW4gWGVuLiBCdXQgaXQgbWF5IGNvbmZ1c2UgZGV2ZWxvcGVy
cwo+PiB3aG8gY29tZSBmcm9tIGFub3RoZXIgcHJvamVjdHMuCj4KPiBXZWxsLCBlYWNoIHByb2pl
Y3RzIGhhdmUgdGhlaXIgb3duIHN0eWxlLiBTbyB0aGVyZSBhcmUgYWx3YXlzIHNvbWUKPiBhZGFw
dGF0aW9ucyBuZWVkZWQgdG8gbW92ZSB0byBhIG5ldyBwcm9qZWN0LiBXaGF0IG1hdHRlcnMgaXMg
dGhlCj4gZG9jdW1lbnRhdGlvbiBjbGFyaWZpZXMgd2hhdCBpcyB0aGUgZXhhY3QgdXNlLiBCdXQu
Li4KPgo+Pgo+Pj4+Cj4+Pj4gbWF5YmUgc29tZXRoaW5nIGxpa2UgZW50ZXJfaHlwZXJ2aXNvcl9m
cm9tX2d1ZXN0X3B0MSgpIGFuZAo+Pj4+IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wdDIo
KT8KPj4+IEhtbW0sIGl0IHJlbWluZHMgbWUgdW5pIHdoZW4gd2UgaGFkIHRvIGxpbWl0IGZ1bmN0
aW9uIHNpemUgdG8gMjAgbGluZXMgOikuCj4+Pgo+Pj4gSSBjaG9zZSBfbm9pcnEgYmVjYXVzZSB0
aGUgb3RoZXIgbmFtZSBJIGhhZCBpbiBtaW5kIHdhcyBxdWl0ZQo+Pj4gdmVyYm9zZS4gSSB3YXMg
dGhpbmtpbmc6Cj4+PiBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3RfYmVmb3JlX2ludGVycnVw
dHMoKS4KPj4gQSB3YXMgdGhpbmtpbmcgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhpcyB0b28uCj4+
IFdoYXQgYWJvdXQgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X3ByZWlycSgpPwo+Cj4gLi4u
IHRoaXMgd291bGQgYmUgaW5kZWVkIGJldHRlci4KCj4+Cj4+IEkgdGhpbmsgdGhhdCAiX3ByZSIg
YmV0dGVyIHNob3dzIHRoZSByZWxhdGlvbiB0bwo+PiBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vl
c3QoKQo+Pgo+Pj4KPj4+Pgo+Pj4+IE9yIG1heWJlLCB3ZSBzaG91bGQgbm90IHNwbGl0IHRoZSBm
dW5jdGlvbiBhdCBhbGw/IEluc3RlYWQsIHdlIGVuYWJsZQo+Pj4+IGludGVycnVwdHMgcmlnaHQg
aW4gdGhlIG1pZGRsZSBvZiBpdC4KPj4+Cj4+PiBJIHRob3VnaHQgYWJvdXQgdGhpcyBidXQgSSBk
aWRuJ3QgbXVjaCBsaWtlIHRoZSByZXN1bHRpbmcgY29kZS4KPj4+Cj4+PiBUaGUgaW5zdHJ1Y3Rp
b24gdG8gdW5tYXNrIGludGVycnVwdHMgcmVxdWlyZXMgdG8gdGFrZSBhbiBpbW1lZGlhdGUKPj4+
IChpbmRpY2F0ZXMgd2hpY2ggaW50ZXJydXB0cyB0byB1bm1hc2spLiBBcyBub3QgYWxsIHRoZSB0
cmFwcyByZXF1aXJlCj4+PiB0byB1bm1hc2sgdGhlIHNhbWUgaW50ZXJydXB0cywgd2Ugd291bGQg
ZW5kIHVwIHRvIGhhdmUgdG8gYSBidW5jaCBvZgo+Pj4gaWYgaW4gdGhlIGNvZGUgdG8gc2VsZWN0
IHRoZSByaWdodCB1bm1hc2tpbmcuCj4+IEFoLCB5ZXMsIHRoaXMgaXMgdGhlIHByb2JsZW0uIFdl
IGNhbiBwcm92aWRlIGNhbGxiYWNrIHRvCj4+IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdCgp
Lgo+Cj4gSSBhbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IHRoaXMuIERvIHlvdSBtZWFuIGEg
Y2FsbGJhY2sgdGhhdCB3aWxsCj4gdW5tYXNrIHRoZSBpbnRlcnJ1cHRzPwpZZXMuIFlvdSBjYW4g
cGFzcyBmdW5jdGlvbiBwb2ludGVyIHRvIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdCgpLiBU
bwphIGZ1bmN0aW9uLCB0aGF0IHdpbGwgdW5tYXNrIHRoZSBpbnRlcnJ1cHRzLiBJJ20gc3VyZSB0
aGF0IGd1ZXN0X3ZlY3RvcgptYWNybyBjYW4gZ2VuZXJhdGUgaXQgZm9yIHlvdS4gU29tZXRoaW5n
IGxpa2UgdGhpczoKCiAgICAgICAgLm1hY3JvICBndWVzdF92ZWN0b3IgY29tcGF0LCBpZmxhZ3Ms
IHRyYXAsIHNhdmVfeDBfeDE9MQogICAgICAgIGVudHJ5ICAgaHlwPTAsIGNvbXBhdD1cY29tcGF0
LCBzYXZlX3gwX3gxPVxzYXZlX3gwX3gxCiAgICAgICAgLyoKICAgICAgICAgKiBUaGUgdlNFcnJv
ciB3aWxsIGJlIGNoZWNrZWQgd2hpbGUgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJ
VAogICAgICAgICAqIGlzIG5vdCBzZXQuIElmIGEgdlNFcnJvciB0b29rIHBsYWNlLCB0aGUgaW5p
dGlhbCBleGNlcHRpb24gd2lsbCBiZQogICAgICAgICAqIHNraXBwZWQuIEV4aXQgQVNBUAogICAg
ICAgICAqLwogICAgICAgIEFMVEVSTkFUSVZFKCJibCBjaGVja19wZW5kaW5nX3ZzZXJyb3I7IGNi
bnogeDAsIDFmIiwKICAgICAgICAgICAgICAgICAgICAibm9wOyBub3AiLAogICAgICAgICAgICAg
ICAgICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCiAgICAgICAgbGRyICAg
ICB4MCwgPTFmCiAgICAgICAgYmwgICAgICBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QKICAg
ICAgICBtb3YgICAgIHgwLCBzcAogICAgICAgIGJsICAgICAgZG9fdHJhcF9cdHJhcAogICAgICAg
IGIgICAgICAgMWYKMjoKICAgICAgICBtc3IgICAgIGRhaWZjbHIsIFxpZmxhZ3MKICAgICAgICBy
ZXQKMToKICAgICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9XGNvbXBhdAogICAgICAgIC5lbmRt
CgoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
