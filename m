Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D426BB3B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 13:18:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnhvH-0004I0-CU; Wed, 17 Jul 2019 11:16:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fL=VO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnhvF-0004Ht-Eb
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 11:16:33 +0000
X-Inumbo-ID: 53f31b8d-a884-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::70b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 53f31b8d-a884-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 11:16:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRzAZBpZNM8saxmXvmEDYbhV+H8vw7Qf/C6Csyn0cBdjLtVnlikGca6xM9ZTVYzlAubC31UYTH9No83MzVlgIBWv3V3ClsLhfc5VE3lt2tJeOB6uk2KQI5ETTZZRPp2cPAD1ke+2IFU5e9VTlgSiXpsSk3aMBtIrA7BIY3pDhBwsBZWEHHzF2Zx5PiC7v3Si7tbnKSzM9NVwvpC9zWPuk2NIliU4XOqW5o6KjpZ6ZfwpnZg5XYZRdKD/ZgB2PJLdoMY1UfY/Jsa5ZCCKU5jjzROUREPi0jauctS4wn9Ia+z0wMWWK9/CNJV0VYbFxZlSlmqjie88GfeRHh2zA29Kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WllnVQqdshB2QkHiF2w+WXD7/Gh+7Ex67LLQMfkJ26E=;
 b=Dts2Y3FXZhkzESG8E0L35FI/0Ka88h05PnNJAOW1QuWaTXSpNNtvyzYm3JvxPOQKJhHh2THuyQYtcHpQBKUgqZQEvduUsHoSdS6vcqIKcmfdwASiUeCE1twhQSmA3zgD70XRVcuVQw8Bk13xeVCAMsVEQNghaIL2Nnx9OXR2M5n8lydsKpYZUwWB/wvuQy+0HFyg4RsqIVRuahZWAE0Vik61DR2QiE/GxFWg0iXYf3IkW7XAGJuyPOqo6R0wTjvT1Za9wSWsz924oEdLzL9jzwBJHWtEYbRMSdhAbJ5kSrXiI9LTxNYrieuTZRgWGZT69GifJmr47bms4lWsOyYzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WllnVQqdshB2QkHiF2w+WXD7/Gh+7Ex67LLQMfkJ26E=;
 b=m2iDzXmqontotJSkizqx7b/NdD1RckdtXGe4N0h+qI1uNP01XCpX5zXCJnP3fKYvadYfM56/76m8FjgCzsfNtR7HZf6qVbXlYLYrrEzQw/b5pXwtaqchAaToNpBdcyERmkejFwcD2y+Eznor8avXdvWrIPhZQHWqaa1pVzVoTAM=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2800.eurprd02.prod.outlook.com (10.171.102.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Wed, 17 Jul 2019 11:16:29 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 11:16:29 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 08/10] xen-access: Use getopt_long for cmdline parsing
Thread-Index: AQHVO/jrQ620r87RgkWuDapalToWG6bOqjSA
Date: Wed, 17 Jul 2019 11:16:29 +0000
Message-ID: <7d490284-745a-b8cf-4254-f7379731d6c7@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <2f0d996d9fde04c1a12cee7a1cb58486cf7788d6.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <2f0d996d9fde04c1a12cee7a1cb58486cf7788d6.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::17) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f252ab5-0443-42f2-75b8-08d70aa83705
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2800; 
x-ms-traffictypediagnostic: VI1PR0202MB2800:|VI1PR0202MB2800:
x-microsoft-antispam-prvs: <VI1PR0202MB2800DE872336A89FD37EBCE3ABC90@VI1PR0202MB2800.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(346002)(366004)(376002)(189003)(199004)(2501003)(31686004)(54906003)(5660300002)(99286004)(186003)(102836004)(6436002)(4326008)(26005)(386003)(53546011)(71190400001)(66066001)(14454004)(71200400001)(558084003)(446003)(11346002)(66446008)(66946007)(64756008)(66556008)(316002)(110136005)(229853002)(36756003)(6506007)(66476007)(31696002)(478600001)(53936002)(2616005)(7736002)(476003)(6486002)(305945005)(256004)(68736007)(81156014)(81166006)(76176011)(8676002)(52116002)(6246003)(6116002)(25786009)(486006)(2906002)(8936002)(3846002)(86362001)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2800;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vc4rmtzUMi2nEosdzTRLI/1CHbxFSfYtPcZs90Cfe1vXnkevmx7V95WxU8IhCPOrD6D0QrFUXszgNc+CYvh8c7AcSXCLtGCPFzDlMS5okLlYvsdkirV6zaxJZCLkAirKfU0N0/n86y5HHxshlZhqRgYdfJySQoTmf/Oe2cE7pMAhFj6xUIJjpkegRJCl6InrTHczoxghKsf7cJKLCBwmXvncKjAGlGIz621VXWotop6bQyaYRwoMYGgyWNSQXZTBa5Yz3e6nnK3mDb8pc7rtlZA2/ZjbkUfUWKBYptwYNedfk2tF3PS44c6hXY1QKglYGnLW/9J/RQ/AFzw0cAHfXsqjKcUjwKfRgfD8rYeT1XCAofngRZuehM0jfJ/57Y1y6IJNzpz+1e75CtzoUUzfhVtIPsGtXoCqhVCwuzLIoBc=
Content-ID: <CFBFD0DDB0ED8840A5E20EA1A6B82336@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f252ab5-0443-42f2-75b8-08d70aa83705
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 11:16:29.1704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2800
Subject: Re: [Xen-devel] [PATCH v2 08/10] xen-access: Use getopt_long for
 cmdline parsing
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE2LjA3LjIwMTkgMjA6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4gVGhpcyBz
aW1wbGlmaWVzIHRoZSBjb21tYW5kIGxpbmUgcGFyc2luZyBsb2dpYyBhbmQgbWFrZXMgaXQgZWFz
aWVyIHRvDQo+IGFkZCBuZXcgdGVzdCBwYXJhbWV0ZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
UGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
