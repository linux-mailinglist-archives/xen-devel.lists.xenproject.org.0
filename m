Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2005858E5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 06:08:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvZgL-0004ba-Fe; Thu, 08 Aug 2019 04:05:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tN1y=WE=renesas.com=yoshihiro.shimoda.uh@srs-us1.protection.inumbo.net>)
 id 1hvZgK-0004bV-HO
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 04:05:40 +0000
X-Inumbo-ID: c73889ea-b991-11e9-8980-bc764e045a96
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe9c::722])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c73889ea-b991-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 04:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQV69Q7FHjkfw6qTZw3mkiZZZypCVy8S5S/P5WWaZZzbbX3YMcArjOchstte9cuCcgG5N2a4piDp4THqQWspc5UQ4Y/P2Cdd3GCfUOKW/SEf+MwstUBzMhlOEYawQUeqYoMWHIQxtxcblc27JJRhhGUqaFp8H9UGP6toW5zE5P6IDZP44Hlo6JoC0AYpxbMqJIhxZQdwbxVPGLOblVmv6TlFLNMmUMkTnxUUgNlpnxC/j31+/fOqWntJOwnfYzone/UUuMKKnQo6GwW4tMkimsF4PRmjeqtJlw6I0mqNV6N1HOwIpnI/F7j/xdmIJiuW/403HQgZ+BYLX2iKMioFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V734lPgN3t4UwAEpLrqrVRXqA4vjflQ+UxXyH9eOstY=;
 b=TSs0gYXnTEIkzomMhZKvoP0Ce8dXqb+WeJcSY1kfB9aPGUH17zYJEmhWWhWf/7bFr36zY5ZkXRubUijUbG4wIFj9727iSt8ubAd6xUG4VCqIKMsZdqgNp6oeoOAz2Ir2iXRtKLHYrYUKa6TNgyn0+YsmS0XSehKeCNPkozfUifNPuaAAU+zhQiD+qWg2XJeRXTxXX1ckYrbu09/nJ/qfj2IKJeAafcjUXXShPMBNDyxjP8nCJL0ffOmbQuL24XV0g9TFYT3CthsGbZ14jSt5HLRYumWMArzZNPkWKRxGSFXogRhmQDNns3JTiKszFxCAFxX0gHzyHczrFx3gScq44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V734lPgN3t4UwAEpLrqrVRXqA4vjflQ+UxXyH9eOstY=;
 b=FO1L4lgRLrI9JkCLW2lYwBu8l5sOxseiipn555CE4OAmmtbv49aumZriRX2Oamjb4ksi5ylncN/IyTDaQvdliwahbaFhj3U0OYfKeu1ZvIy87athOkvtFLwkeENSPSNnwwYcqkT75bMhSAdTu1kDfQXjcIVCp331BYe7PzX1LNc=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3437.jpnprd01.prod.outlook.com (20.178.138.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Thu, 8 Aug 2019 04:05:35 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 04:05:35 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA support
Thread-Index: AQHVSVDyIlUrtkBxi0Kon+v5VwnGjKbu/2/ggADgoICAAMffgA==
Date: Thu, 8 Aug 2019 04:05:35 +0000
Message-ID: <TYAPR01MB45449B73E017835EABF0D38ED8D70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
In-Reply-To: <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5812708a-9aba-446b-7b1b-08d71bb5aa38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TYAPR01MB3437; 
x-ms-traffictypediagnostic: TYAPR01MB3437:
x-microsoft-antispam-prvs: <TYAPR01MB34370536D7543AA43708C665D8D70@TYAPR01MB3437.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(478600001)(486006)(2906002)(6246003)(229853002)(110136005)(76116006)(71190400001)(66476007)(66446008)(55016002)(66556008)(66946007)(6436002)(71200400001)(33656002)(476003)(446003)(14454004)(54906003)(9686003)(66066001)(11346002)(256004)(2501003)(25786009)(14444005)(6506007)(305945005)(74316002)(26005)(7736002)(102836004)(186003)(6116002)(4326008)(86362001)(3846002)(64756008)(99286004)(52536014)(7696005)(8936002)(76176011)(316002)(81156014)(53936002)(8676002)(81166006)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB3437;
 H:TYAPR01MB4544.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xkdYU8DPdDqtxbwCxTRWU3Y+/Yb5WfufBZsvbfg9JC09f+UjJYAPIAJ9IZsn3NoLQ7h2wgdASzJwNFaP0ye4oqRMLUCwB1TAFtY9KaB5GiApuVlc/k1qhvpzJS6fKWv6ADv4dqOHjt+rLCQ6+bnSLvIT1uGLB/vaYUj5EVP4wYEzoxXs09tS4DfXFg9jR8yqjjp4y0lrd/JWrwHLvd6lUw2K4QAdw4HTHiEQCP3pn68lgsWwDRxPbBuaLcXo1YhDM+nwOmzCOIcPZo8QJ8qD9OYL/TJL4i0wVWtE5ZZG4l8GSGYKy+uKo2XUEbJRWumJVtJ65z0V30oM5Vj5XoM96TnSB1TYYr3XpTieD0RK9Z1OqVyYzL2jyZ+pzucmKZ9rNzLdvUcDiNuI2HuGLN4P/5kDeULMTvTJ1MJI1NEwsr4=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5812708a-9aba-446b-7b1b-08d71bb5aa38
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 04:05:35.3124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +WjRlDo3q5abvkcW77dq+tDsCFny8n2uNpHvsg1PZ6Fau+J1bDkRisOnpkybfHOLylXYaujgTkrLLw2slUlKMccVwSKz9xLXH9IzgYBQndhUP4zUIHE/EkNyXS/NAXIy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3437
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

SGkgT2xla3NhbmRyLXNhbiwNCg0KPiBGcm9tOiBPbGVrc2FuZHIsIFNlbnQ6IFRodXJzZGF5LCBB
dWd1c3QgOCwgMjAxOSAxOjAxIEFNDQo+IA0KPiANCj4gSGksIFNoaW1vZGEtc2FuLg0KPiANCj4g
VGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQpZb3UncmUgd2VsY29tZS4NCg0KPHNuaXA+DQo+
ID4gKy8qIFhlbiBJT01NVSBvcHMgKi8NCj4gPj4gK3N0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlw
bW11X2lvdGxiX2ZsdXNoX2FsbChzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+PiArew0KPiA+PiArICAg
IHN0cnVjdCBpcG1tdV92bXNhX3hlbl9kb21haW4gKnhlbl9kb21haW4gPSBkb21faW9tbXUoZCkt
PmFyY2gucHJpdjsNCj4gPj4gKw0KPiA+PiArICAgIGlmICggIXhlbl9kb21haW4gfHwgIXhlbl9k
b21haW4tPnJvb3RfZG9tYWluICkNCj4gPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+ID4+ICsNCj4g
Pj4gKyAgICBzcGluX2xvY2soJnhlbl9kb21haW4tPmxvY2spOw0KPiA+IElzIGxvY2FsIGlycSBp
cyBhbHJlYWR5IGRpc2FibGVkIGhlcmU/DQo+ID4gSWYgbm8sIHlvdSBzaG91bGQgdXNlIHNwaW5f
bG9ja19pcnFzYXZlKCkgYmVjYXVzZSB0aGUgaXBtbXVfaXJxKCkgYWxzbw0KPiA+IGdldHMgdGhl
IGxvY2suDQo+IA0KPiANCj4gTm8sIGl0IGlzIG5vdCBkaXNhYmxlZC4gQnV0LCBpcG1tdV9pcnEo
KSB1c2VzIGFub3RoZXIgbW11LT5sb2NrLiBTbywgSQ0KPiB0aGluaywgdGhlcmUgd29uJ3QgYmUg
YSBkZWFkbG9jay4NCj4gDQo+IE9yIEkgcmVhbGx5IG1pc3NlZCBzb21ldGhpbmc/DQoNCllvdSdy
ZSBjb3JyZWN0LiBJIGRpZG4ndCByZWFsaXplZCB0aGF0IGlwbW11X2lycSgpIHVzZWQgYW5vdGhl
ciBtbXUtPmxvY2suDQoNCj4gSWYgd2Ugd29ycnkgYWJvdXQgaXBtbXVfdGxiX2ludmFsaWRhdGUo
KSB3aGljaCBpcyBjYWxsZWQgaGVyZSAodG8NCj4gcGVyZm9ybSBhIGZsdXNoIGJ5IHJlcXVlc3Qg
ZnJvbSBQMk0gY29kZSwgd2hpY2ggbWFuYWdlcyBhIHBhZ2UgdGFibGUpDQo+IGFuZCBmcm9tIHRo
ZSBpcnEgaGFuZGxlciAodG8gcGVyZm9ybSBhIGZsdXNoIHRvIHJlc3VtZSBhZGRyZXNzDQo+IHRy
YW5zbGF0aW9uKSwgSSBjb3VsZCB1c2UgYSB0YXNrbGV0IHRvIHNjaGVkdWxlIGlwbW11X3RsYl9p
bnZhbGlkYXRlKCkNCj4gZnJvbSB0aGUgaXJxIGhhbmRsZXIgdGhlbi4gVGhpcyB3YXkgd2Ugd291
bGQgZ2V0IHRoaXMgc2VyaWFsaXplZC4gV2hhdA0KPiBkbyB5b3UgdGhpbms/DQoNCkkganVzdCBj
b25jZXJuZWQgYWJvdXQgYSBkZWFkLWxvY2sgaXNzdWUgYnkgcmVjdXJzaXZlIHNwaW4gbG9ja3Mu
DQpTbywgY2FsbGluZyBpcG1tdV90bGJfaW52YWxpZGF0ZSgpIGhlcmUgaXMgT0ssIEkgdGhpbmsu
DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
