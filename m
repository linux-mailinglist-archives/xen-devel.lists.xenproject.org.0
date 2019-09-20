Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF0B888E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 02:29:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB6jk-0002s2-9s; Fri, 20 Sep 2019 00:25:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zmhn=XP=renesas.com=yoshihiro.shimoda.uh@srs-us1.protection.inumbo.net>)
 id 1iB6ji-0002rx-8f
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 00:25:22 +0000
X-Inumbo-ID: 1fa8dc34-db3d-11e9-978d-bc764e2007e4
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe9c::701])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fa8dc34-db3d-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 00:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRrKtjHpUNya4NZHObfwmi0fbLo9ZpSIJoCtIqph7hR2cdk/kUdKQkpu56rysotYTAdyqV6wftLERzPF7VohOwIdRDDGhaQlBf1WmFUY9CirEsPCe1KVU/mGLAL7qUp0eZ/LK/PZ1M0MKJrC389bpeBVrkFjwGzyocNhmdw8eA02hj5g97EdqF/ka5x1mkBzOq/7/6eCyxDwcl2d174puPqE3k+svZfQvluyGlaTqM+AyXnz1yba96dfkLK+ysRaFwTP135DI5l8VLFpOh+siDvyiVV4zdzyakyhiX+PwrWsX1MFiS8ASXWTyGqZL4rA6vftw/GZ52bG3OdUXTBvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxSyRGPZrkDR69Yq6weO9qPiSoK5MFjQaIqBLiS+/tE=;
 b=kXUoC/RU3iLeAVUQPeH0QD/otYut9fs5pFMV2uDVT5U3Yqn+PCFg4ffoSaWm050MJwdq2F9C28ScI8Ph/CWDULFOWvk8zCi804eAmfbcVeLE/gdVmzfj2sqmW3JJWADuFlmXn61piLYlYw2ZCLSInYlqriVvJpeIEE18U7PbNFF7YPBLjYbIYQY8s/2Aw0A6Gsv6rHGgqGpYHP2S9hY/iVbCsbcb+g3OfTi4222zFqjHS+PEerVti1wkTTAufTf7Ir5fRyxl6R4QVvslhsqqkZvJfwQHwhpIj3YztBRuAlVov6v9JFZk7poE5zp2DCdsA5Bc8ZlKN3FafmuOIUbEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxSyRGPZrkDR69Yq6weO9qPiSoK5MFjQaIqBLiS+/tE=;
 b=f4k216aWLffP1PEjlIL6+bAdtHu8zZRM3U5gWgLW/IPXp2l6swASw7F/Yq5XN3b2oQIQkG4m8RVGuCTo3K9OuscDWInQyrG9hbgG/3COIxUgEf/7t1szF9MabrcQiJrUa3VsTmz2fIqAMSDLKGrhgJzxTUiIqE+aLEAoKKkfJjM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3645.jpnprd01.prod.outlook.com (20.178.137.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Fri, 20 Sep 2019 00:25:16 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2263.023; Fri, 20 Sep 2019
 00:25:16 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V4 8/8] iommu/arm: Add Renesas IPMMU-VMSA support
Thread-Index: AQHVakj4hQ0JtlRx20yRMZkPw2WqFKczvnEg
Date: Fri, 20 Sep 2019 00:25:16 +0000
Message-ID: <TYAPR01MB4544A71B2ED0B7265F17FA45D8880@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6926be2e-e5a3-4f48-2fa1-08d73d6102f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:TYAPR01MB3645; 
x-ms-traffictypediagnostic: TYAPR01MB3645:
x-microsoft-antispam-prvs: <TYAPR01MB3645DF25DFF8786205EF1C1CD8880@TYAPR01MB3645.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(316002)(76116006)(86362001)(55236004)(81166006)(2501003)(81156014)(478600001)(8676002)(256004)(14444005)(2906002)(66946007)(99286004)(25786009)(6246003)(6506007)(74316002)(52536014)(66446008)(7736002)(102836004)(26005)(66556008)(66476007)(11346002)(446003)(64756008)(66066001)(229853002)(5660300002)(76176011)(305945005)(55016002)(6116002)(33656002)(3846002)(476003)(110136005)(14454004)(71200400001)(9686003)(4326008)(486006)(7696005)(8936002)(54906003)(71190400001)(186003)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB3645;
 H:TYAPR01MB4544.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZQtgn697RJO7C8Gjzdg89ThkNogz77VyxWxQ1ZYVbLAWmnGBZPj8jT6uAEs46rF63hiNW47xZKXmS4WsxrewKc7gN+fXHO6p2vl5sJ7ibJBrfKb1Fhz3WqdP00jPELGp5DbWEqW5gqD1V+acwOjPLJSRB1+OBQ6jX6V71ujSO1nnvfrBds1KF/qq0P3bmWI3XS0WkTdjbKkDKJKRyGp5jJY+B/Vp7bbMwDJF9KYb2OOsGyZDUJnXhmoDPX28Pgzl7ayGkhk/U6wL9CeUEY+nfr6adbgM4kjNM3tJHPzq3S71FvDx5sAl6mNT1HNYy7ZmK0MZwyDEQPi3qZxzyl4sHPFp0yW7khvM3yJb2mZ0Lxc+kMrzfk2z1fJJeJSJMUPf5LX1rUf3U2YHa5vuyhznGCtN9FS/AHk266sXDiJuAyY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6926be2e-e5a3-4f48-2fa1-08d73d6102f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 00:25:16.5831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J7U24nvmnBwEbCLxaWkUohYEUjcIs/LdgcCOxgUkXjuEG8A0MTqwF8dVbT2ViaeULJBO6ZZ82lgqU8ObiU9qqSR34znCI4hammd3PbXEGAKhmIYTvXYDT23rWaVJG+Th
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3645
Subject: Re: [Xen-devel] [PATCH V4 8/8] iommu/arm: Add Renesas IPMMU-VMSA
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLXNhbiwKCj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28sIFNlbnQ6IFNh
dHVyZGF5LCBTZXB0ZW1iZXIgMTQsIDIwMTkgMTI6MzUgQU0KPiAKPiBGcm9tOiBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gCj4gVGhlIElQTU1V
LVZNU0EgaXMgVk1TQS1jb21wYXRpYmxlIEkvTyBNZW1vcnkgTWFuYWdlbWVudCBVbml0IChJT01N
VSkKPiB3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBhY2Nlc3MgcHJvdGVj
dGlvbiBmdW5jdGlvbmFsaXRpZXMKPiB0byBwcm9jZXNzaW5nIHVuaXRzIGFuZCBpbnRlcmNvbm5l
Y3QgbmV0d29ya3MuCj4gCj4gUGxlYXNlIG5vdGUsIGN1cnJlbnQgZHJpdmVyIGlzIHN1cHBvc2Vk
IHRvIHdvcmsgb25seSB3aXRoIG5ld2VzdAo+IFItQ2FyIEdlbjMgU29DcyByZXZpc2lvbnMgd2hp
Y2ggSVBNTVUgaGFyZHdhcmUgc3VwcG9ydHMgc3RhZ2UgMiB0cmFuc2xhdGlvbgo+IHRhYmxlIGZv
cm1hdCBhbmQgaXMgYWJsZSB0byB1c2UgQ1BVJ3MgUDJNIHRhYmxlIGFzIGlzIGlmIG9uZSBpcwo+
IDMtbGV2ZWwgcGFnZSB0YWJsZSAodXAgdG8gNDAgYml0IElQQSkuCj4gCj4gVGhlIG1ham9yIGRp
ZmZlcmVuY2VzIGNvbXBhcmUgdG8gdGhlIExpbnV4IGRyaXZlciBhcmU6Cj4gCj4gMS4gU3RhZ2Ug
MS9TdGFnZSAyIHRyYW5zbGF0aW9uLiBMaW51eCBkcml2ZXIgc3VwcG9ydHMgU3RhZ2UgMQo+IHRy
YW5zbGF0aW9uIG9ubHkgKHdpdGggU3RhZ2UgMSB0cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQpLiBJ
dCBtYW5hZ2VzCj4gcGFnZSB0YWJsZSBieSBpdHNlbGYuIEJ1dCBYZW4gZHJpdmVyIHN1cHBvcnRz
IFN0YWdlIDIgdHJhbnNsYXRpb24KPiAod2l0aCBTdGFnZSAyIHRyYW5zbGF0aW9uIHRhYmxlIGZv
cm1hdCkgdG8gYmUgYWJsZSB0byBzaGFyZSB0aGUgUDJNCj4gd2l0aCB0aGUgQ1BVLiBTdGFnZSAx
IHRyYW5zbGF0aW9uIGlzIGFsd2F5cyBieXBhc3NlZCBpbiBYZW4gZHJpdmVyLgo+IAo+IFNvLCBY
ZW4gZHJpdmVyIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgd2l0aCBuZXdlc3QgUi1DYXIgR2VuMyBT
b0MgcmV2aXNpb25zCj4gb25seSAoSDMgRVMzLjAsIE0zLVcrLCBldGMuKSB3aGljaCBJUE1NVSBI
L1cgc3VwcG9ydHMgc3RhZ2UgMiB0cmFuc2xhdGlvbgo+IHRhYmxlIGZvcm1hdC4KPiAKPiAyLiBB
QXJjaDY0IHN1cHBvcnQuIExpbnV4IGRyaXZlciB1c2VzIFZNU0F2OC0zMiBtb2RlLCB3aGlsZSBY
ZW4gZHJpdmVyCj4gZW5hYmxlcyBBcm12OCBWTVNBdjgtNjQgbW9kZSB0byBjb3ZlciB1cCB0byA0
MCBiaXQgaW5wdXQgYWRkcmVzcy4KPiAKPiAzLiBDb250ZXh0IGJhbmsgKHNldHMgb2YgcGFnZSB0
YWJsZSkgdXNhZ2UuIEluIFhlbiwgZWFjaCBjb250ZXh0IGJhbmsgaXMKPiBtYXBwZWQgdG8gb25l
IFhlbiBkb21haW4uIFNvLCBhbGwgZGV2aWNlcyBiZWluZyBwYXNzIHRocm91Z2hlZCB0byB0aGUK
PiBzYW1lIFhlbiBkb21haW4gc2hhcmUgdGhlIHNhbWUgY29udGV4dCBiYW5rLgo+IAo+IDQuIElQ
TU1VIGRldmljZSB0cmFja2luZy4gSW4gWGVuLCBhbGwgSU9NTVUgZGV2aWNlcyBhcmUgbWFuYWdl
ZAo+IGJ5IHNpbmdsZSBkcml2ZXIgaW5zdGFuY2UuIFNvLCBkcml2ZXIgdXNlcyBnbG9iYWwgbGlz
dCB0byBrZWVwIHRyYWNrCj4gb2YgcmVnaXN0ZXJlZCBJUE1NVSBkZXZpY2VzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFt
LmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogWW9z
aGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPgoKVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guIEkgaGF2ZSByZXZpZXdlZCB0aGlzIHBhdGNoIGFib3V0IHRoZSBJ
UE1NVSBoYXJkd2FyZSBiaXRzLApzbywKClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IFtmb3IgdGhlIElQTU1VIEgvVyBiaXRz
XQoKQmVzdCByZWdhcmQsCllvc2hpaGlybyBTaGltb2RhCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
