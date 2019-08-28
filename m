Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0097A0572
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 16:59:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zMi-0001Du-Ex; Wed, 28 Aug 2019 14:56:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OwEj=WY=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i2zMg-0001Dp-Sn
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 14:56:02 +0000
X-Inumbo-ID: f3034750-c9a3-11e9-ae47-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.128]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3034750-c9a3-11e9-ae47-12813bfff9fa;
 Wed, 28 Aug 2019 14:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4dyI6Ajhex8atPsiCUzvrNlmUNMZI8kp7yeOKb9vbI3TFCfabpfRBPkBt1WC7QqtbesVKgbCvddLP3Qq+E6zFraCW7Bt4OEkdkPgVpJ4oOMM7C420uZju4rYgRoXeHbjn+NxLSgdQvwEBlM3fYsUi51haf77V3WRqBz/+Ubgia6qOKyRJn5hSjNl2g3FF2+j6/IRthnPfJcI3aWLzCWk4RtNrvnFYrJEgBm9OBqVSUowUDNIlxVFRQmpyos/BXOltIldIkdu+7fOLYcxgv7hmTnhxng4wRjckktoCHtZatmCbHIv3NtQ45BFG8cPiR+2+gplYvj8YfXjd4c36rCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwkRkVLBCfw5zxUMbosXmY43M8wm6bWOO0yPpXbqO04=;
 b=isr73xO1YBBCN0MvqIAR/hZjs1NLWkxs9HyDPXWOecO+fiyym3zAQb53N2/n8mUbr4RvlRWA97cCshh6HYYjdy6PixWTGux+K7Z/Uv0Mk5GIp4GlGRAzAwCDP7Ed+5QQVd6Z5GtQ/Am9CDvhmPHroWPLoyH97jD1bI4KMOo9pQZGu5YvnXyld5vIn0OjtG10IVEe4g34VPD/f9Wb1G66g8ldinxHkHGMy1bDRzucZT4S9r6FaFMp6vnc4QHewLJcgdN9+I0mu/ohmhepd2Ya0UiTghfx6OabBqmaMjh7GFhJwnUJJLy7exq8HvfEx7aPLtazxaqKwpCqnO/PA9Rq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwkRkVLBCfw5zxUMbosXmY43M8wm6bWOO0yPpXbqO04=;
 b=uYgdqFEIt5scJuMhr4I9r3X8M06Qc/uf1ZunJIYlV5VAadtu5ytkVXkkUUs5OR5EvwEF4JErRyQqiwe2oeqPKQpXsVJnjAOT7nozDJMBc92MjLH0lMeqSPkZqawIPGt1SHHCKgVdLLYCEBtrfESPfu1ue6vdcykyhO/pU6yofoM=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5847.eurprd02.prod.outlook.com (10.255.191.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 14:55:59 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 14:55:59 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Partially revert "x86/mm: Clean IOMMU flags from p2m-pt
 code"
Thread-Index: AQHVXaVJC+w2xU9Svk+xPjPNc6UznKcQphkA
Date: Wed, 28 Aug 2019 14:55:58 +0000
Message-ID: <c016345d-a216-9d26-fe19-59001d3cb766@bitdefender.com>
References: <20190828133229.86085-1-roger.pau@citrix.com>
In-Reply-To: <20190828133229.86085-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::22) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bf43925-69c0-48b6-b07d-08d72bc7d635
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5847; 
x-ms-traffictypediagnostic: AM7PR02MB5847:|AM7PR02MB5847:
x-microsoft-antispam-prvs: <AM7PR02MB5847485FACF24A2125C358EAABA30@AM7PR02MB5847.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(26005)(256004)(110136005)(2906002)(305945005)(186003)(76176011)(52116002)(486006)(2501003)(446003)(4744005)(31686004)(8676002)(81156014)(81166006)(25786009)(99286004)(386003)(6246003)(11346002)(102836004)(53546011)(6506007)(2616005)(7736002)(4326008)(6486002)(6436002)(8936002)(476003)(53936002)(6512007)(478600001)(229853002)(6116002)(71200400001)(71190400001)(86362001)(3846002)(66476007)(66446008)(64756008)(66556008)(66946007)(66066001)(5660300002)(36756003)(316002)(14454004)(31696002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5847;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LC3Fm6p5Y5iCTWcto1HGVJlWT4GnWw6pUhy0zHMcmxnHwzItHiD2iSBt+pifOT9eAX5j1T31uZaPiHyGVVhBwnG4R0urcRQizPAkOxZcNmxbp/GMMtlXQCapAEiyntUp2I7kpFGxE1d6bxlKzxT/GQaZME6Yzm6WvMGfwkioGQ77kWuHfxJpaAW7eF6pPTcHFhtVQHbDiKkvyY2CUNjIZUz/MKtRGSgvV/wUqGYB0Y444/lWuGgdYeIdcLxDoYGx/gycY8VrF+gpj6MVWF1gq4OcpWo+iRH9LXePtMrbaqCBTsKpCCorItL09y7AM8xQt69DwiGrVDGjleNBJ8caNU11dCyWs5xiuPrUN1UXv/dKJq0dSTnE0z/Ge5X0iZczyfAYKcy3NpdGFHPL1hM94WEaYhx+MjxBcLGi5vLgXc0=
Content-ID: <6F0E0844C6768247A3715DC856F32F6B@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf43925-69c0-48b6-b07d-08d72bc7d635
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 14:55:59.0184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mftCHTMX5KTKNpHfc7oKz7iWlpry05XuWnniWw1zZ0u67JeRNUAcMCjxb/5V9QXpw4oGQ/E+XB8nW2wr0J3NKZdrbL04dZgefaDO3iEwFEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5847
Subject: Re: [Xen-devel] [PATCH] Partially revert "x86/mm: Clean IOMMU flags
 from p2m-pt code"
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI4LjA4LjIwMTkgMTY6MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhpcyBw
YXJ0aWFsbHkgcmV2ZXJ0cyBjb21taXQNCj4gODU0YTQ5YTc0ODZhMDJlZGFlNWIzZTUzNjE3YmFj
ZTUyNmU5YzFiMSBieSByZS1hZGRpbmcgdGhlIGxvZ2ljIHRoYXQNCj4gcHJvcGFnYXRlcyBjaGFu
Z2VzIHRvIHRoZSBkb21haW4gcGh5c21hcCBkb25lIGJ5IHAybV9wdF9zZXRfZW50cnkgaW50bw0K
PiB0aGUgaW9tbXUgcGFnZSB0YWJsZXMuIFdpdGhvdXQgdGhpcyBsb2dpYyBjaGFuZ2VzIHRvIHRo
ZSBndWVzdCBwaHlzbWFwDQo+IGFyZSBub3QgcHJvcGFnYXRlZCB0byB0aGUgaW9tbXUsIGxlYXZp
bmcgc3RhbGUgaW9tbXUgZW50cmllcyB0aGF0IGNhbg0KPiBsZWFrIGRhdGEsIG9yIGZhaWxpbmcg
dG8gYWRkIG5ldyBlbnRyaWVzLg0KPiANCj4gTm90ZSB0aGF0IHRoaXMgY29tbWl0IGRvZXNuJ3Qg
cmUtaW50cm9kdWNlIGlvbW11IGZsYWdzIHRvIHRoZSBjcHUgcGFnZQ0KPiB0YWJsZSBlbnRyaWVz
LCBzaW5jZSB0aGUgbG9naWMgdG8gYWRkL3JlbW92ZSBlbnRyaWVzIHRvIHRoZSBpb21tdSBwYWdl
DQo+IHRhYmxlcyBpcyBiYXNlZCBvbiB0aGUgcDJtIHR5cGUgYW5kIHRoZSBtZm4uDQoNClRoaXMg
c291bmRzIGdvb2QgYnV0IGlzIGl0IHN0aWxsIHNhZmUgdG8gdXNlIHRoZSBJT01NVSBmbGFnIHNw
YWNlIHdpdGggDQphbm90aGVyIHB1cnBvc2U/DQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
