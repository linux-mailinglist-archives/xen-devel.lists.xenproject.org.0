Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3384299
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 04:45:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvBt3-0001IS-Qf; Wed, 07 Aug 2019 02:41:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGdM=WD=renesas.com=yoshihiro.shimoda.uh@srs-us1.protection.inumbo.net>)
 id 1hvBt2-0001IN-BQ
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 02:41:12 +0000
X-Inumbo-ID: cf5dd5a1-b8bc-11e9-8980-bc764e045a96
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [40.107.141.121]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf5dd5a1-b8bc-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 02:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWJguT9fW3f1X+ckcG7z2V5nP6YvA5WY3ul0k4snXXRy3nblg6o2BRcoWLPIoTMRPbPXiF0Z1qU3SOS8aurezEjoBPf0GHhJpo90oGsXkuHhqRIr15DK5Dl9N8hLRU9ND6mMb+88fpys4THMdFaYV3wRauJxdm797Jb0gUCxckjuT9KChlfmsULXI1Nbg0wBNZzVStGMBBHY2MXZerrh8c/azUKsr3B5qz1OnfbLGdcPSzDSH8+ntlradEu1pO5qetEVE9Dfu275XFchvf9/ITp0ty18OJ+dmaEtNzMsolaiGjpOvzHCuFqbVYKixjhH4jHiDsuB53PHrAGAgTSzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVYBMbuQtxzRqk4wwCAWx5Yz4pcOyup1Wchjdb16UCg=;
 b=WlnT6Vx3JCJEpE9lfj1hI8ccE54UFoa08dOV5xm8IVvMgrKBU++vwwtNpu7fIgsYqcpipY2XAQH2Vse3oXRzzOC9pIuP/4dAXXEBceQK3uV35TateH07xFZNhFHzyBCgzoMag62WzcaVweEUupxB4KppLn5oGxaNKtFB5Z90/m8eRMisw+Zs2S2u+nFKqYjOPoz8lSzz3Cqpp1A5TZ6QgnugCLGw+y5DWekXRZSALVJzgWTOM+5H0Ex3TX3wGhSas7UQVvHy0JP7o40zmn/vLzD/GAjvM/Af7qNCUcqM19q25DZ9CeXQp6QJOZ496ODd1t55ymPPlvObCIIpGnG0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVYBMbuQtxzRqk4wwCAWx5Yz4pcOyup1Wchjdb16UCg=;
 b=U8jYMDpQs41/PKSAl7PeEp3F6jpXl7CegHOgyuCyF4RYukrAcIjKUT0kuOZY79NqmCK5SFSuahiYgQY1O3FhTchuqmy4bhl1rdIn47iPCpd/5AyaAwSMUkSy4l5IHf9wh0wGPT/H6kXqv7GyFxLSejk+evaEW4wc0Vr0HgVWQtA=
Received: from OSBPR01MB4536.jpnprd01.prod.outlook.com (20.179.180.215) by
 OSBPR01MB2824.jpnprd01.prod.outlook.com (52.134.252.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 02:41:06 +0000
Received: from OSBPR01MB4536.jpnprd01.prod.outlook.com
 ([fe80::106b:32d9:ab57:e8f3]) by OSBPR01MB4536.jpnprd01.prod.outlook.com
 ([fe80::106b:32d9:ab57:e8f3%3]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:41:06 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA support
Thread-Index: AQHVSVDyIlUrtkBxi0Kon+v5VwnGjKbu/2/g
Date: Wed, 7 Aug 2019 02:41:06 +0000
Message-ID: <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85031b32-8072-4780-5a8c-08d71ae0b26e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:OSBPR01MB2824; 
x-ms-traffictypediagnostic: OSBPR01MB2824:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB28244CB1E3F530FF9FE706A7D8D40@OSBPR01MB2824.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(316002)(55016002)(110136005)(229853002)(74316002)(4326008)(7736002)(102836004)(54906003)(7696005)(5024004)(33656002)(66066001)(14454004)(8676002)(305945005)(26005)(99286004)(14444005)(71190400001)(186003)(256004)(6436002)(53936002)(81156014)(76176011)(6306002)(2906002)(6506007)(9686003)(3846002)(52536014)(86362001)(478600001)(68736007)(66446008)(66476007)(66556008)(64756008)(71200400001)(6116002)(5660300002)(25786009)(6246003)(66946007)(486006)(30864003)(446003)(2501003)(76116006)(476003)(11346002)(8936002)(81166006)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2824;
 H:OSBPR01MB4536.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EtO/n9RIAtlVwhJX1j8S5vN3okfiezShtOn1uEhMR0TLtHLu8G1lxK9QGj/e/YNjasKzSfIxHLF/x/A9MvJPYs/ofifcC6Ytz7yciDS0QTLXlHLWQaFAsVdfVuDDs/bgzTsqhQ+oz5EKLTHErk99Jyt566/6F9uh3AyNqO00e5EogU4teQz+lRGCfuyBJ0TX8h5OoLqRFoTW0o4BJF3seKq7RsGvVOb1pQ4aY6tS3kKffnCDS/McWEvFZ08ytausfsN4NbAlVuAyEwDcWswvBDxVt3kTKeoO8/mZ0N0bnlj3GCqDgcb0ZdWJxSGMcbCaBe03B8y4JbvO9N6xsRkdBNovgJU6KLpkgG2bUNVviEkyIVHUbOSvBJGoOMLsa9u4Klmwzo7023egBJ0P7/aYStgogYHgjvmKDK21TS4r0v8=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85031b32-8072-4780-5a8c-08d71ae0b26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:41:06.2918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2824
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLXNhbiwKCkkgY2FuIGFjY2VzcyB0aGUgZGF0YXNoZWV0IG9mIHRoaXMgaGFy
ZHdhcmUsIHNvIHRoYXQgSSByZXZpZXdlZCB0aGlzIHBhdGNoLgpJJ20gbm90IGZhbWlsYXIgYWJv
dXQgWGVuIGRldmVsb3BtZW50IHJ1bHVzLCBzbyB0aGF0IHNvbWUgY29tbWVudHMgbWlnaHQKYmUg
bm90IGdvb2QgZml0LiBJZiBzbywgcGxlYXNlIGlnbm9yZSA6KQoKPiBGcm9tOiBPbGVrc2FuZHIg
VHlzaGNoZW5rbywgU2VudDogU2F0dXJkYXksIEF1Z3VzdCAzLCAyMDE5IDE6NDAgQU0KPiAKPiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gCj4gVGhlIElQTU1VLVZNU0EgaXMgVk1TQS1jb21wYXRpYmxlIEkvTyBNZW1vcnkgTWFuYWdl
bWVudCBVbml0IChJT01NVSkKPiB3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFu
ZCBhY2Nlc3MgcHJvdGVjdGlvbiBmdW5jdGlvbmFsaXRpZXMKPiB0byBwcm9jZXNzaW5nIHVuaXRz
IGFuZCBpbnRlcmNvbm5lY3QgbmV0d29ya3MuCj4gCj4gUGxlYXNlIG5vdGUsIGN1cnJlbnQgZHJp
dmVyIGlzIHN1cHBvc2VkIHRvIHdvcmsgb25seSB3aXRoIG5ld2VzdAo+IEdlbjMgU29DcyByZXZp
c2lvbnMgd2hpY2ggSVBNTVUgaGFyZHdhcmUgc3VwcG9ydHMgc3RhZ2UgMiB0cmFuc2xhdGlvbgoK
VGhpcyBzaG91bGQgYmUgIlItQ2FyIEdlbjMgU29DcyIsIGluc3RlYWQgb2YgIkdlbjMgU29DcyIu
Cgo+IHRhYmxlIGZvcm1hdCBhbmQgaXMgYWJsZSB0byB1c2UgQ1BVJ3MgUDJNIHRhYmxlIGFzIGlz
IGlmIG9uZSBpcwo+IDMtbGV2ZWwgcGFnZSB0YWJsZSAodXAgdG8gNDAgYml0IElQQSkuCj4gCj4g
VGhlIG1ham9yIGRpZmZlcmVuY2VzIGNvbXBhcmUgdG8gdGhlIExpbnV4IGRyaXZlciBhcmU6Cj4g
Cj4gMS4gU3RhZ2UgMS9TdGFnZSAyIHRyYW5zbGF0aW9uLiBMaW51eCBkcml2ZXIgc3VwcG9ydHMg
U3RhZ2UgMQo+IHRyYW5zbGF0aW9uIG9ubHkgKHdpdGggU3RhZ2UgMSB0cmFuc2xhdGlvbiB0YWJs
ZSBmb3JtYXQpLiBJdCBtYW5hZ2VzCj4gcGFnZSB0YWJsZSBieSBpdHNlbGYuIEJ1dCBYZW4gZHJp
dmVyIHN1cHBvcnRzIFN0YWdlIDIgdHJhbnNsYXRpb24KPiAod2l0aCBTdGFnZSAyIHRyYW5zbGF0
aW9uIHRhYmxlIGZvcm1hdCkgdG8gYmUgYWJsZSB0byBzaGFyZSB0aGUgUDJNCj4gd2l0aCB0aGUg
Q1BVLiBTdGFnZSAxIHRyYW5zbGF0aW9uIGlzIGFsd2F5cyBieXBhc3NlZCBpbiBYZW4gZHJpdmVy
Lgo+IAo+IFNvLCBYZW4gZHJpdmVyIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgd2l0aCBuZXdlc3Qg
R2VuMyBTb0MgcmV2aXNpb25zIG9ubHkKClNhbWUgaGVyZS4KCj4gKEgzIEVTMy4wLCBNMyBFUzMu
MCwgZXRjLikgd2hpY2ggSVBNTVUgSC9XIHN1cHBvcnRzIHN0YWdlIDIgdHJhbnNsYXRpb24KCkFj
Y29yZGluZyB0byB0aGUgbGF0ZXN0IG1hbnVhbCwgTTMgRVMzLjAgaXMgbmFtZWQgYXMgIk0zLVcr
Ii4KCj4gdGFibGUgZm9ybWF0LgoKPHNuaXA+Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
aXBtbXUtdm1zYS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi5hMzRh
OGY4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9p
cG1tdS12bXNhLmMKPiBAQCAtMCwwICsxLDEzNDIgQEAKPiArLyoKPiArICogeGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwo+ICsgKgo+ICsgKiBEcml2ZXIgZm9yIHRoZSBS
ZW5lc2FzIElQTU1VLVZNU0EgZm91bmQgaW4gUi1DYXIgR2VuMyBTb0NzLgo+ICsgKgo+ICsgKiBU
aGUgSVBNTVUtVk1TQSBpcyBWTVNBLWNvbXBhdGlibGUgSS9PIE1lbW9yeSBNYW5hZ2VtZW50IFVu
aXQgKElPTU1VKQo+ICsgKiB3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBh
Y2Nlc3MgcHJvdGVjdGlvbiBmdW5jdGlvbmFsaXRpZXMKPiArICogdG8gcHJvY2Vzc2luZyB1bml0
cyBhbmQgaW50ZXJjb25uZWN0IG5ldHdvcmtzLgo+ICsgKgo+ICsgKiBQbGVhc2Ugbm90ZSwgY3Vy
cmVudCBkcml2ZXIgaXMgc3VwcG9zZWQgdG8gd29yayBvbmx5IHdpdGggbmV3ZXN0IEdlbjMgU29D
cwo+ICsgKiByZXZpc2lvbnMgd2hpY2ggSVBNTVUgaGFyZHdhcmUgc3VwcG9ydHMgc3RhZ2UgMiB0
cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQgYW5kCj4gKyAqIGlzIGFibGUgdG8gdXNlIENQVSdzIFAy
TSB0YWJsZSBhcyBpcy4KPiArICoKPiArICogQmFzZWQgb24gTGludXgncyBJUE1NVS1WTVNBIGRy
aXZlciBmcm9tIFJlbmVzYXMgQlNQOgo+ICsgKiAgICBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2Eu
YwoKU28sIEkgdGhpbmsgdGhlIExpbnV4J3MgQ29weXJpZ2h0cyBzaG91bGQgYmUgZGVzY3JpYmVk
IGhlcmUuCgo+ICsgKiB5b3UgY2FuIGZvdW5kIGF0Ogo+ICsgKiAgICB1cmw6IGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ob3Jtcy9yZW5lc2FzLWJzcC5naXQK
PiArICogICAgYnJhbmNoOiB2NC4xNC43NS1sdHNpL3JjYXItMy45LjYKPiArICogICAgY29tbWl0
OiBlMjA2ZWI1YjgxYTYwZTY0YzM1ZmJjM2E5OTliMWEwZGIyYjk4MDQ0Cj4gKyAqIGFuZCBYZW4n
cyBTTU1VIGRyaXZlcjoKPiArICogICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
Ywo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTYtMjAxOSBFUEFNIFN5c3RlbXMgSW5jLgo+
ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yCj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRp
dGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYwo+ICsgKiBMaWNlbnNlLCB2ZXJzaW9uIDIs
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgo+ICsgKgo+ICsg
KiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKPiArICogR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiArICogTGljZW5zZSBhbG9u
ZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy8+LgoKSSBkb24ndCBrbm93IHRoYXQgWGVuIGxpY2Vuc2UgZGVzY3JpcHRpb24gcnVsZSwg
YnV0IHNpbmNlIGEgZmV3IHNvdXJjZSBmaWxlcyBoYXZlClNQRFgtTGljZW5zZS1JZGVudGlmaWVy
LCBjYW4gd2UgYWxzbyB1c2UgaXQgb24gdGhlIGRyaXZlcj8KCj4gKyAqLwo+ICsKPiArI2luY2x1
ZGUgPHhlbi9kZWxheS5oPgo+ICsjaW5jbHVkZSA8eGVuL2Vyci5oPgo+ICsjaW5jbHVkZSA8eGVu
L2lycS5oPgo+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPgo+ICsjaW5jbHVkZSA8eGVuL2xpc3QuaD4K
CkkgZG9uJ3Qga25vdyB0aGF0IFhlbiBwYXNzdGhyb3VnaCBkcml2ZXIgcnVsZSB0aG91Z2gsIGRv
ZXNuJ3QgaGVyZSBuZWVkCiNpbmNsdWRlIDx4ZW4vaW9tbXUuaD4/IChUaGUgeGVuL3NjaGVkLmgg
c2VlbXMgdG8gaGF2ZSBpdCBzbyB0aGF0Cm5vIGNvbXBpbGUgZXJyb3IgaGFwcGVucyB0aG91Z2gu
KQoKPHNuaXA+Cj4gKy8qIFJlZ2lzdGVycyBEZWZpbml0aW9uICovCj4gKyNkZWZpbmUgSU1fQ1RY
X1NJWkUgICAgMHg0MAo+ICsKPiArI2RlZmluZSBJTUNUUiAgICAgICAgICAgICAgICAweDAwMDAK
PiArLyoKPiArICogVGhlc2UgZmllbGRzIGFyZSBpbXBsZW1lbnRlZCBpbiBJUE1NVS1NTSBvbmx5
LiBTbywgY2FuIGJlIHNldCBmb3IKPiArICogUm9vdCBJUE1NVSBvbmx5Lgo+ICsgKi8KPiArI2Rl
ZmluZSBJTUNUUl9WQTY0ICAgICAgICAgICAoMSA8PCAyOSkKPiArI2RlZmluZSBJTUNUUl9UUkUg
ICAgICAgICAgICAoMSA8PCAxNykKPiArI2RlZmluZSBJTUNUUl9BRkUgICAgICAgICAgICAoMSA8
PCAxNikKPiArI2RlZmluZSBJTUNUUl9SVFNFTF9NQVNLICAgICAoMyA8PCA0KQo+ICsjZGVmaW5l
IElNQ1RSX1JUU0VMX1NISUZUICAgIDQKPiArI2RlZmluZSBJTUNUUl9UUkVOICAgICAgICAgICAo
MSA8PCAzKQo+ICsvKgo+ICsgKiBUaGVzZSBmaWVsZHMgYXJlIGNvbW1vbiBmb3IgYWxsIElQTU1V
IGRldmljZXMuIFNvLCBjYW4gYmUgc2V0IGZvcgo+ICsgKiBDYWNoZSBJUE1NVXMgYXMgd2VsbC4K
PiArICovCj4gKyNkZWZpbmUgSU1DVFJfSU5URU4gICAgICAgICAgKDEgPDwgMikKPiArI2RlZmlu
ZSBJTUNUUl9GTFVTSCAgICAgICAgICAoMSA8PCAxKQo+ICsjZGVmaW5lIElNQ1RSX01NVUVOICAg
ICAgICAgICgxIDw8IDApCj4gKyNkZWZpbmUgSU1DVFJfQ09NTU9OX01BU0sgICAgKDcgPDwgMCkK
PiArCj4gKyNkZWZpbmUgSU1DQUFSICAgICAgICAgICAgICAgMHgwMDA0Cj4gKwo+ICsjZGVmaW5l
IElNVFRCQ1IgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDgKPiArI2RlZmluZSBJTVRUQkNS
X0VBRSAgICAgICAgICAgICAgICAgICAgKDEgPDwgMzEpCj4gKyNkZWZpbmUgSU1UVEJDUl9QTUIg
ICAgICAgICAgICAgICAgICAgICgxIDw8IDMwKQo+ICsjZGVmaW5lIElNVFRCQ1JfU0gxX05PTl9T
SEFSRUFCTEUgICAgICAoMCA8PCAyOCkKPiArI2RlZmluZSBJTVRUQkNSX1NIMV9PVVRFUl9TSEFS
RUFCTEUgICAgKDIgPDwgMjgpCj4gKyNkZWZpbmUgSU1UVEJDUl9TSDFfSU5ORVJfU0hBUkVBQkxF
ICAgICgzIDw8IDI4KQo+ICsjZGVmaW5lIElNVFRCQ1JfU0gxX01BU0sgICAgICAgICAgICAgICAo
MyA8PCAyOCkKPiArI2RlZmluZSBJTVRUQkNSX09SR04xX05DICAgICAgICAgICAgICAgKDAgPDwg
MjYpCj4gKyNkZWZpbmUgSU1UVEJDUl9PUkdOMV9XQl9XQSAgICAgICAgICAgICgxIDw8IDI2KQo+
ICsjZGVmaW5lIElNVFRCQ1JfT1JHTjFfV1QgICAgICAgICAgICAgICAoMiA8PCAyNikKPiArI2Rl
ZmluZSBJTVRUQkNSX09SR04xX1dCICAgICAgICAgICAgICAgKDMgPDwgMjYpCj4gKyNkZWZpbmUg
SU1UVEJDUl9PUkdOMV9NQVNLICAgICAgICAgICAgICgzIDw8IDI2KQo+ICsjZGVmaW5lIElNVFRC
Q1JfSVJHTjFfTkMgICAgICAgICAgICAgICAoMCA8PCAyNCkKPiArI2RlZmluZSBJTVRUQkNSX0lS
R04xX1dCX1dBICAgICAgICAgICAgKDEgPDwgMjQpCj4gKyNkZWZpbmUgSU1UVEJDUl9JUkdOMV9X
VCAgICAgICAgICAgICAgICgyIDw8IDI0KQo+ICsjZGVmaW5lIElNVFRCQ1JfSVJHTjFfV0IgICAg
ICAgICAgICAgICAoMyA8PCAyNCkKPiArI2RlZmluZSBJTVRUQkNSX0lSR04xX01BU0sgICAgICAg
ICAgICAgKDMgPDwgMjQpCj4gKyNkZWZpbmUgSU1UVEJDUl9UU1oxX01BU0sgICAgICAgICAgICAg
ICgxZiA8PCAxNikKCkF0IHRoZSBtb21lbnQsIG5vIG9uZSB1c2VzIGl0IHRob3VnaCwgdGhpcyBz
aG91bGQgYmUgKDB4MWYgPDwgMTYpLgoKPHNuaXA+CisvKiBYZW4gSU9NTVUgb3BzICovCj4gK3N0
YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlwbW11X2lvdGxiX2ZsdXNoX2FsbChzdHJ1Y3QgZG9tYWlu
ICpkKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgaXBtbXVfdm1zYV94ZW5fZG9tYWluICp4ZW5fZG9tYWlu
ID0gZG9tX2lvbW11KGQpLT5hcmNoLnByaXY7Cj4gKwo+ICsgICAgaWYgKCAheGVuX2RvbWFpbiB8
fCAheGVuX2RvbWFpbi0+cm9vdF9kb21haW4gKQo+ICsgICAgICAgIHJldHVybiAwOwo+ICsKPiAr
ICAgIHNwaW5fbG9jaygmeGVuX2RvbWFpbi0+bG9jayk7CgpJcyBsb2NhbCBpcnEgaXMgYWxyZWFk
eSBkaXNhYmxlZCBoZXJlPwpJZiBubywgeW91IHNob3VsZCB1c2Ugc3Bpbl9sb2NrX2lycXNhdmUo
KSBiZWNhdXNlIHRoZSBpcG1tdV9pcnEoKSBhbHNvCmdldHMgdGhlIGxvY2suCiMgVG8gYmUgaG9u
ZXN0LCBpbiBub3JtYWwgY2FzZSwgYW55IGlycSBvbiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
bgojIHNob3VsZCBub3QgaGFwcGVuIHRob3VnaC4KCj4gKyAgICBpcG1tdV90bGJfaW52YWxpZGF0
ZSh4ZW5fZG9tYWluLT5yb290X2RvbWFpbik7Cj4gKyAgICBzcGluX3VubG9jaygmeGVuX2RvbWFp
bi0+bG9jayk7Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArCjxzbmlwPgo+ICtzdGF0aWMg
aW50IGlwbW11X2Fzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTggZGV2Zm4sIHN0cnVj
dCBkZXZpY2UgKmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGZsYWcpCj4gK3sKPiArICAgIHN0cnVjdCBpcG1tdV92bXNhX3hlbl9kb21haW4gKnhlbl9kb21h
aW4gPSBkb21faW9tbXUoZCktPmFyY2gucHJpdjsKPiArICAgIHN0cnVjdCBpcG1tdV92bXNhX2Rv
bWFpbiAqZG9tYWluOwo+ICsgICAgaW50IHJldDsKPiArCj4gKyAgICBpZiAoICF4ZW5fZG9tYWlu
ICkKPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICBpZiAoICF0b19pcG1tdShk
ZXYpICkKPiArICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiArCj4gKyAgICBzcGluX2xvY2soJnhl
bl9kb21haW4tPmxvY2spOwoKU2FtZSBoZXJlLgoKPiArICAgIC8qCj4gKyAgICAgKiBUaGUgSVBN
TVUgY29udGV4dCBmb3IgdGhlIFhlbiBkb21haW4gaXMgbm90IGFsbG9jYXRlZCBiZWZvcmVoYW5k
Cj4gKyAgICAgKiAoYXQgdGhlIFhlbiBkb21haW4gY3JlYXRpb24gdGltZSksIGJ1dCBvbiBkZW1h
bmQgb25seSwgd2hlbiB0aGUgZmlyc3QKPiArICAgICAqIG1hc3RlciBkZXZpY2UgYmVpbmcgYXR0
YWNoZWQgdG8gaXQuCj4gKyAgICAgKiBDcmVhdGUgUm9vdCBJUE1NVSBkb21haW4gd2hpY2ggY29u
dGV4dCB3aWxsIGJlIG1hcHBlZCB0byB0aGlzIFhlbiBkb21haW4KPiArICAgICAqIGlmIG5vdCBl
eGl0cyB5ZXQuCj4gKyAgICAgKi8KPiArICAgIGlmICggIXhlbl9kb21haW4tPnJvb3RfZG9tYWlu
ICkKPiArICAgIHsKPiArICAgICAgICBkb21haW4gPSBpcG1tdV9hbGxvY19yb290X2RvbWFpbihk
KTsKPiArICAgICAgICBpZiAoIElTX0VSUihkb21haW4pICkKPiArICAgICAgICB7Cj4gKyAgICAg
ICAgICAgIHJldCA9IFBUUl9FUlIoZG9tYWluKTsKPiArICAgICAgICAgICAgZ290byBvdXQ7Cj4g
KyAgICAgICAgfQo+ICsKPiArICAgICAgICB4ZW5fZG9tYWluLT5yb290X2RvbWFpbiA9IGRvbWFp
bjsKPiArICAgIH0KPiArCj4gKyAgICBpZiAoIHRvX2RvbWFpbihkZXYpICkKPiArICAgIHsKPiAr
ICAgICAgICBkZXZfZXJyKGRldiwgIkFscmVhZHkgYXR0YWNoZWQgdG8gSVBNTVUgZG9tYWluXG4i
KTsKPiArICAgICAgICByZXQgPSAtRUVYSVNUOwo+ICsgICAgICAgIGdvdG8gb3V0Owo+ICsgICAg
fQo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBNYXN0ZXIgZGV2aWNlcyBiZWhpbmQgdGhlIHNhbWUg
Q2FjaGUgSVBNTVUgY2FuIGJlIGF0dGFjaGVkIHRvIHRoZSBzYW1lCj4gKyAgICAgKiBDYWNoZSBJ
UE1NVSBkb21haW4uCj4gKyAgICAgKiBCZWZvcmUgY3JlYXRpbmcgbmV3IElQTU1VIGRvbWFpbiBj
aGVjayB0byBzZWUgaWYgdGhlIHJlcXVpcmVkIG9uZQo+ICsgICAgICogYWxyZWFkeSBleGlzdHMg
Zm9yIHRoaXMgWGVuIGRvbWFpbi4KPiArICAgICAqLwo+ICsgICAgZG9tYWluID0gaXBtbXVfZ2V0
X2NhY2hlX2RvbWFpbihkLCBkZXYpOwo+ICsgICAgaWYgKCAhZG9tYWluICkKPiArICAgIHsKPiAr
ICAgICAgICAvKiBDcmVhdGUgbmV3IElQTU1VIGRvbWFpbiB0aGlzIG1hc3RlciBkZXZpY2Ugd2ls
bCBiZSBhdHRhY2hlZCB0by4gKi8KPiArICAgICAgICBkb21haW4gPSBpcG1tdV9hbGxvY19jYWNo
ZV9kb21haW4oZCk7Cj4gKyAgICAgICAgaWYgKCBJU19FUlIoZG9tYWluKSApCj4gKyAgICAgICAg
ewo+ICsgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRvbWFpbik7Cj4gKyAgICAgICAgICAgIGdv
dG8gb3V0Owo+ICsgICAgICAgIH0KPiArCj4gKyAgICAgICAgLyogQ2hhaW4gbmV3IElQTU1VIGRv
bWFpbiB0byB0aGUgWGVuIGRvbWFpbi4gKi8KPiArICAgICAgICBsaXN0X2FkZCgmZG9tYWluLT5s
aXN0LCAmeGVuX2RvbWFpbi0+Y2FjaGVfZG9tYWlucyk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0
ID0gaXBtbXVfYXR0YWNoX2RldmljZShkb21haW4sIGRldik7Cj4gKyAgICBpZiAoIHJldCApCj4g
KyAgICB7Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBEZXN0cm95IENhY2hlIElQTU1VIGRv
bWFpbiBvbmx5IGlmIHRoZXJlIGFyZSBubyBtYXN0ZXIgZGV2aWNlcwo+ICsgICAgICAgICAqIGF0
dGFjaGVkIHRvIGl0Lgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGlmICggIWRvbWFpbi0+cmVm
Y291bnQgKQo+ICsgICAgICAgICAgICBpcG1tdV9mcmVlX2NhY2hlX2RvbWFpbihkb21haW4pOwo+
ICsgICAgfQo+ICsgICAgZWxzZQo+ICsgICAgewo+ICsgICAgICAgIGRvbWFpbi0+cmVmY291bnQr
KzsKPiArICAgICAgICBzZXRfZG9tYWluKGRldiwgZG9tYWluKTsKPiArICAgIH0KPiArCj4gK291
dDoKPiArICAgIHNwaW5fdW5sb2NrKCZ4ZW5fZG9tYWluLT5sb2NrKTsKPiArCj4gKyAgICByZXR1
cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGlwbW11X2RlYXNzaWduX2RldmljZShzdHJ1
Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArICAgIHN0cnVjdCBpcG1t
dV92bXNhX3hlbl9kb21haW4gKnhlbl9kb21haW4gPSBkb21faW9tbXUoZCktPmFyY2gucHJpdjsK
PiArICAgIHN0cnVjdCBpcG1tdV92bXNhX2RvbWFpbiAqZG9tYWluID0gdG9fZG9tYWluKGRldik7
Cj4gKwo+ICsgICAgaWYgKCAhZG9tYWluIHx8IGRvbWFpbi0+ZCAhPSBkICkKPiArICAgIHsKPiAr
ICAgICAgICBkZXZfZXJyKGRldiwgIk5vdCBhdHRhY2hlZCB0byAlcGRcbiIsIGQpOwo+ICsgICAg
ICAgIHJldHVybiAtRVNSQ0g7Cj4gKyAgICB9Cj4gKwo+ICsgICAgc3Bpbl9sb2NrKCZ4ZW5fZG9t
YWluLT5sb2NrKTsKClNhbWUgaGVyZS4KCj4gKyAgICBpcG1tdV9kZXRhY2hfZGV2aWNlKGRvbWFp
biwgZGV2KTsKPiArICAgIHNldF9kb21haW4oZGV2LCBOVUxMKTsKPiArICAgIGRvbWFpbi0+cmVm
Y291bnQtLTsKPiArCj4gKyAgICAvKgo+ICsgICAgICogRGVzdHJveSBDYWNoZSBJUE1NVSBkb21h
aW4gb25seSBpZiB0aGVyZSBhcmUgbm8gbWFzdGVyIGRldmljZXMKPiArICAgICAqIGF0dGFjaGVk
IHRvIGl0Lgo+ICsgICAgICovCj4gKyAgICBpZiAoICFkb21haW4tPnJlZmNvdW50ICkKPiArICAg
ICAgICBpcG1tdV9mcmVlX2NhY2hlX2RvbWFpbihkb21haW4pOwo+ICsKPiArICAgIHNwaW5fdW5s
b2NrKCZ4ZW5fZG9tYWluLT5sb2NrKTsKPiArCj4gKyAgICByZXR1cm4gMDsKPiArfQo8c25pcD4K
PiArc3RhdGljIHZvaWQgX19od2RvbV9pbml0IGlwbW11X2lvbW11X2h3ZG9tX2luaXQoc3RydWN0
IGRvbWFpbiAqZCkKPiArewo+ICsgICAgLyogU2V0IHRvIGZhbHNlIG9wdGlvbnMgbm90IHN1cHBv
cnRlZCBvbiBBUk0uICovCj4gKyAgICBpZiAoIGlvbW11X2h3ZG9tX2luY2x1c2l2ZSApCj4gKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJpcG1tdTogbWFwLWluY2x1c2l2ZSBkb20wLWlv
bW11IG9wdGlvbiBpcyBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7Cj4gKyAgICBpb21tdV9od2Rv
bV9pbmNsdXNpdmUgPSBmYWxzZTsKPiArICAgIGlmICggaW9tbXVfaHdkb21fcmVzZXJ2ZWQgPT0g
MSApCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJpcG1tdTogbWFwLXJlc2VydmVk
IGRvbTAtaW9tbXUgb3B0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgb24gQVJNXG4iKTsKPiArICAgIGlv
bW11X2h3ZG9tX3Jlc2VydmVkID0gMDsKPiArCj4gKyAgICBhcmNoX2lvbW11X2h3ZG9tX2luaXQo
ZCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGlwbW11X2lvbW11X2RvbWFpbl90ZWFyZG93bihz
dHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgaXBtbXVfdm1zYV94ZW5fZG9tYWlu
ICp4ZW5fZG9tYWluID0gZG9tX2lvbW11KGQpLT5hcmNoLnByaXY7Cj4gKwo+ICsgICAgaWYgKCAh
eGVuX2RvbWFpbiApCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgIHNwaW5fbG9jaygmeGVu
X2RvbWFpbi0+bG9jayk7CgpTYW1lIGhlcmUuCgo+ICsgICAgLyoKPiArICAgICAqIERlc3Ryb3kg
Um9vdCBJUE1NVSBkb21haW4gd2hpY2ggY29udGV4dCBpcyBtYXBwZWQgdG8gdGhpcyBYZW4gZG9t
YWluCj4gKyAgICAgKiBpZiBleGl0cy4KPiArICAgICAqLwo+ICsgICAgaWYgKCB4ZW5fZG9tYWlu
LT5yb290X2RvbWFpbiApCj4gKyAgICAgICAgaXBtbXVfZnJlZV9yb290X2RvbWFpbih4ZW5fZG9t
YWluLT5yb290X2RvbWFpbik7Cj4gKwo+ICsgICAgc3Bpbl91bmxvY2soJnhlbl9kb21haW4tPmxv
Y2spOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBXZSBhc3N1bWUgdGhhdCBhbGwgbWFzdGVyIGRl
dmljZXMgaGF2ZSBhbHJlYWR5IGJlZW4gZGV0YWNoZWQgZnJvbQo+ICsgICAgICogdGhpcyBYZW4g
ZG9tYWluIGFuZCB0aGVyZSBtdXN0IGJlIG5vIGFzc29jaWF0ZWQgQ2FjaGUgSVBNTVUgZG9tYWlu
cwo+ICsgICAgICogaW4gdXNlLgo+ICsgICAgICovCj4gKyAgICBBU1NFUlQobGlzdF9lbXB0eSgm
eGVuX2RvbWFpbi0+Y2FjaGVfZG9tYWlucykpOwoKSSB0aGluayB0aGlzIHNob3VsZCBiZSBpbiB0
aGUgc3BpbiBsb2NrIGhlbGQgYnkgJnhlbl9kb21haW4tPmxvY2suCgo+ICsgICAgeGZyZWUoeGVu
X2RvbWFpbik7Cj4gKyAgICBkb21faW9tbXUoZCktPmFyY2gucHJpdiA9IE5VTEw7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIGlwbW11X2lvbW11X29wcyA9Cj4gK3sK
PiArICAgIC5pbml0ICAgICAgICAgICAgPSBpcG1tdV9pb21tdV9kb21haW5faW5pdCwKPiArICAg
IC5od2RvbV9pbml0ICAgICAgPSBpcG1tdV9pb21tdV9od2RvbV9pbml0LAo+ICsgICAgLnRlYXJk
b3duICAgICAgICA9IGlwbW11X2lvbW11X2RvbWFpbl90ZWFyZG93biwKPiArICAgIC5pb3RsYl9m
bHVzaCAgICAgPSBpcG1tdV9pb3RsYl9mbHVzaCwKPiArICAgIC5pb3RsYl9mbHVzaF9hbGwgPSBp
cG1tdV9pb3RsYl9mbHVzaF9hbGwsCj4gKyAgICAuYXNzaWduX2RldmljZSAgID0gaXBtbXVfYXNz
aWduX2RldmljZSwKPiArICAgIC5yZWFzc2lnbl9kZXZpY2UgPSBpcG1tdV9yZWFzc2lnbl9kZXZp
Y2UsCj4gKyAgICAubWFwX3BhZ2UgICAgICAgID0gYXJtX2lvbW11X21hcF9wYWdlLAo+ICsgICAg
LnVubWFwX3BhZ2UgICAgICA9IGFybV9pb21tdV91bm1hcF9wYWdlLAo+ICsgICAgLmFkZF9kZXZp
Y2UgICAgICA9IGlwbW11X2FkZF9kZXZpY2UsCj4gK307Cj4gKwo+ICsvKiBSQ0FSIEdFTjMgcHJv
ZHVjdCBhbmQgY3V0IGluZm9ybWF0aW9uLiAqLwoKIlItQ2FyIEdlbjMgU29DcyIgaXMgYmV0dGVy
IHRoYW4gIlJDQVIgR0VOMyIuCgo+ICsjZGVmaW5lIFJDQVJfUFJPRFVDVF9NQVNLICAgIDB4MDAw
MDdGMDAKPiArI2RlZmluZSBSQ0FSX1BST0RVQ1RfSDMgICAgICAweDAwMDA0RjAwCj4gKyNkZWZp
bmUgUkNBUl9QUk9EVUNUX00zICAgICAgMHgwMDAwNTIwMAoKQXQgbGVhc3QsIEkgdGhpbmsgd2Ug
c2hvdWxkIGJlIE0zVywgaW5zdGVhZCBvZiBNMy4KIyBGWUksIE0zLVcgYW5kIE0zLVcrIGFyZSB0
aGUgc2FtZSB2YWx1ZS4KCjxzbmlwPgoKQmVzdCByZWdhcmRzLApZb3NoaWhpcm8gU2hpbW9kYQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
