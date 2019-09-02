Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5EFA4F86
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 09:07:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4gOX-0005Ev-CW; Mon, 02 Sep 2019 07:04:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uV20=W5=renesas.com=yoshihiro.shimoda.uh@srs-us1.protection.inumbo.net>)
 id 1i4gOV-0005Eq-F4
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 07:04:55 +0000
X-Inumbo-ID: f54170e6-cd4f-11e9-ae9f-12813bfff9fa
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [40.107.141.119]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f54170e6-cd4f-11e9-ae9f-12813bfff9fa;
 Mon, 02 Sep 2019 07:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyjZxJL4bV+pZeTVbSF0jKGWLmL4fVdFIGD5Nmr+ZctKpYfXK/LlfQi1J0cE7NCN9mzGGrEFXLa6vCbzaWstRyHrycbiZKJuCh6Ipz/fogHp9gJUQNtiOpBLfM4bCHDiP9ULeQ/iVhdf8Amy7U/XAwbDMVsUAKjRrWpz+OeGxJAeoncbmH4difpaUXe2W81tdh6AW81601/FUVBa16LyIZi17s6SoCRtxZsgJ93fwiIDnSQlV47jYa7r7F31IbvnkcYX3xqLMwZgbIpXnhSc+s02nO3aH3Z1r8obYbtlsr8sCAhPz+XX07i4I4z8MWeN6/iWogkZUj1+PNFPufz57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe8HEKIduy/B8EmuxK/1QG+QIG12O7UaoJ0ZczrW/2U=;
 b=dWU0EOli8u6awrW3YVeOWy1sbxDEOzpFSFl7Gp1kvuj5IVzMA2K/bE/WF4k+ShtdtFGkOUv4w+okylObwKzPeqMg9u/wA5+zrFb16BicAppwuPm/qH7N9/Vuv9w81QpdD44hTLJh26esETuZlnQOnVihB2tnygdAbgAkmFfMckAEggsZ8OdWOSKs37OSq60ipIcrHjlilOYxPJly4+IE5eBTXmHHyZFSP0wbmrZlR9G5VlXR9TErQ6AHHS7fEzilhTYh2t9/XtAzzIGIlzymAT5ZkDyINzwQtsEJLOiI43gtkb6vRyreEd8N+FWbMBiIm2COzRmjjuXk1Q96b8y7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe8HEKIduy/B8EmuxK/1QG+QIG12O7UaoJ0ZczrW/2U=;
 b=pLp4u7tlSg6QC0PNIcAgh9aTVnngvcmbkyHPbhRFupMdZvG8zC3MmmcVWzG1dB7DSLjb286I0cDyyX9UbHhWJlL8Q8PM1konwFcnmIJqg8vK4S43VlO7DdxOp0lgOuEegy/sWGrabdEvcpeMcq7i7Jn0+BaGyxyRgzRxzzgDFAM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4029.jpnprd01.prod.outlook.com (20.178.139.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 07:04:49 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.021; Mon, 2 Sep 2019
 07:04:49 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA support
Thread-Index: AQHVV4KHnFAZbwg7rk6F2A7t010DiKcR2U9wgAAoZwCABggPYA==
Date: Mon, 2 Sep 2019 07:04:49 +0000
Message-ID: <TYAPR01MB454477F3AC979748BAA02D99D8BE0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
 <TYAPR01MB4544A44A2BDFADD533AF6D1AD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <1fef0ad1-3aaf-de88-262d-da0f5ae3f510@gmail.com>
In-Reply-To: <1fef0ad1-3aaf-de88-262d-da0f5ae3f510@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01f37bf1-2bf2-4ce2-df4c-08d72f73d846
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TYAPR01MB4029; 
x-ms-traffictypediagnostic: TYAPR01MB4029:
x-microsoft-antispam-prvs: <TYAPR01MB4029E9DF593C1C727C8CE8B2D8BE0@TYAPR01MB4029.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(199004)(189003)(102836004)(26005)(9686003)(2906002)(33656002)(14454004)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(186003)(52536014)(7696005)(6116002)(3846002)(54906003)(110136005)(4744005)(316002)(76176011)(6506007)(478600001)(66066001)(8676002)(81166006)(446003)(11346002)(81156014)(476003)(8936002)(305945005)(74316002)(7736002)(486006)(5660300002)(86362001)(229853002)(25786009)(99286004)(256004)(55016002)(71200400001)(71190400001)(4326008)(53936002)(2501003)(6246003)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB4029;
 H:TYAPR01MB4544.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GW1p35H8348KVyWl9dKB8MS70cT3lQc3oIK4bcKtWwbJxpJHX5C2W9KJuGLXvwFtPtr74Lh6aKqs3XEEYr9FcUQcCINO27+h6PBo9EL6BQyF4/suaApJEZgFY7uFcP0FyiKKV9iIr9LggJ6YyHmqQDRO4rkaWM8q9aHT1vGGqHFpfSNzxRr4ULY+U3HhivTMoB7ZYCuiIl0QSTljp9I8L8xS5WPuyyM8BZXSUKsg0mJg4k1Ncsm6QdD5Vf993hDb0Ie/kSfrEfoWtTYSh9yPUnf17G0dcnefTfa34XdWadiV6YEO2gu9nuA6AqDg0ZNtWl1UDCUqZGVmWyMGD9hvbJqy0SBG3ZEO9O/MUqQZvvjETny8HI4NtN4oCXwu6rhZ/mDIqBkxt445qIAzAt/xMBd7p8CNGjWrVtwBr7tfUW4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f37bf1-2bf2-4ce2-df4c-08d72f73d846
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 07:04:49.1462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnvOu0jlH0spcfZkGqVww1Tw7cXb32wfn6AipouAlYOePuvEqg/I25dEgNn/Uh6e5AqIca8f8Ck8FzsXZzMjkV00kbVvWrL/pKKfeDN+Loa7dn0A3Q1SjyDM4n1yGmDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4029
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
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

SGkgT2xla3NhbmRyLXNhbiwNCg0KPiBGcm9tOiBPbGVrc2FuZHIsIFNlbnQ6IFRodXJzZGF5LCBB
dWd1c3QgMjksIDIwMTkgNzo1NiBQTQ0KPHNuaXA+DQo+ID4gQWJvdXQgdGhpcyBoYXJkd2FyZSBo
YW5kbGluZywgdGhpcyBwYXRjaCBzZWVtcyBnb29kIHRvIG1lLiBCdXQsIHNpbmNlDQo+ID4gSSdt
IG5vdCBmYW1pbGlhciBhYm91dCBYZW4gcGFzc3Rocm91Z2ggZnJhbWV3b3JrLCBJIHRoaW5rIEkg
Y2Fubm90DQo+ID4gYWRkIG15IFJldmlld2VkLWJ5IHRhZyBpbnRvIHRoaXMgcGF0Y2guIFdoYXQg
ZG8geW91IHRoaW5rPw0KPiANCj4gSSBhbSBub3QgY29tcGxldGVseSBzdXJlIHJlZ2FyZGluZyB0
aGF0LCBidXQgSSBoYXZlIHNlZW4gY2FzZXMgd2hlbiB0aGUNCj4gcGVvcGxlIGdpdmUgdGhlaXIg
Ui1iIG5vdCBmb3IgdGhlIGVudGlyZSBwYXRjaCwgYnV0IGZvciBhIHBhcnQgb2YgaXQuDQo+IA0K
PiBFc3BlY2lhbGx5LCB3aGVuIHBhdGNoIHRvdWNoZXMgbWFueSBzdWItc3lzdGVtcy9hcmNocy4g
V291bGQgeW91IG1pbmQgaWYNCj4gSSBzcGVjaWZ5IHdoYXQgeW91ciBSLWIgY292ZXJzPyAtPiBb
Zm9yIHRoZSBJUE1NVSBIL1cgYml0c10NCg0KSSBnb3QgaXQuIFdoZW4geW91IHN1Ym1pdCB2NCBw
YXRjaCwgSSdsbCByZXZpZXcgYW5kIHNlbmQgc3VjaCBhIHRhZy4NCg0KQmVzdCByZWdhcmRzLA0K
WW9zaGloaXJvIFNoaW1vZGENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
