Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197EE6BB4B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 13:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnhxQ-0004OA-QR; Wed, 17 Jul 2019 11:18:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fL=VO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnhxP-0004O4-Op
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 11:18:47 +0000
X-Inumbo-ID: a45fa1ee-a884-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.117]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a45fa1ee-a884-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 11:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCI4XSu6Msg2ljJ6lV4OuJdUNHEaeMftvJ/GoFhivxh2tPBv1cWC3li5U+yY4gV159UgAMXtSIiTUq2ZmhhlWQQJsxX1d4L/M0//xpRC1y7/WElVplMEDzwOKUVINu3QXB3QxVo5LUfSkNSS7tL6voQ66ckWG8EXkfs0wW6kWl2jKNgyJZso927XFUWLQnzfOA4uVtdhBcWZfJVIV0KKwZBsPTWbJY6Vdm5bH7mzUHv2ZqmERM8kTXZwcSIPgJNcorNPIUzsTFT7QZ4u/B5IEFUADzn7aBJ4bpmCPRIXZw+W3DJP/V4RVto4xFmsQ7W4YrTy/KDQup2ioxUaqnTMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqujeDuvTx1Mi7Mci7WJEuzDzR6W9k10KxA7oNgKZeM=;
 b=I2nEmbRCfI9e2FxXoOCkuPAfUDCCXP0ahhZ/DahOFSInAiWhmN8OaBhAR1SigPPEM5H/J/N6wwQMuX+c0rJO14DmuKYzKkNRaFqd2Vw6Nb4usLKWXoI4zl/XxiwjBfa/oF9OB9cA55kl4BvLLz7fSMt6uMM1ovtKiEcqUEsYP0NDbEwe13F5rx4bwSQkALi+5/yldVCDBziy/p8ubUn9/UVNi53dEiz+n4fFyZ7LQJy7+7IsHlBwZZtm+GrgNSUD9aZGplUCuLPA7s2HGpAFE1ehzW2tNgLKrUxZYouRNc9AWVIMNcVZSEByGedMXeFredes4VnaSgpm3cvUF8xg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqujeDuvTx1Mi7Mci7WJEuzDzR6W9k10KxA7oNgKZeM=;
 b=Cg06R7hcqSr9U4pxg/qt+C5Zq3bgJlwNm5al9sgKBuXRoTrYWH5icYJvcwkrrZQx0bU/MnnPNIq67o8HhORnahS76pJUbqmKGHg3K9U+0xJT+dMjozhdV3w8E3+XqRBUSrGyPX/pvGa94MjrvTxW+wLm8kOIlesR0IaCiZEwrwY=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2846.eurprd02.prod.outlook.com (10.171.108.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 11:18:44 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 11:18:44 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 09/10] xen-access: Code cleanup
Thread-Index: AQHVO/j1cCd73Jvy2UmKWS1UDA2KJ6bOqtUA
Date: Wed, 17 Jul 2019 11:18:44 +0000
Message-ID: <c3acf5b5-7e6e-c679-02ed-58bfeda573c4@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <96ce48a99eb224291d99c946d19f051b4ab668b6.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <96ce48a99eb224291d99c946d19f051b4ab668b6.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::21) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86462c3b-d507-47c4-4869-08d70aa887b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2846; 
x-ms-traffictypediagnostic: VI1PR0202MB2846:|VI1PR0202MB2846:
x-microsoft-antispam-prvs: <VI1PR0202MB2846D4956A6E5FD63D7446FEABC90@VI1PR0202MB2846.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(396003)(39860400002)(366004)(189003)(199004)(486006)(476003)(31696002)(316002)(6486002)(25786009)(26005)(14444005)(256004)(68736007)(6512007)(102836004)(31686004)(66476007)(11346002)(446003)(66446008)(66556008)(2906002)(2616005)(6506007)(64756008)(386003)(71190400001)(71200400001)(86362001)(2501003)(53546011)(66946007)(5660300002)(36756003)(76176011)(3846002)(6116002)(305945005)(66066001)(7736002)(558084003)(81156014)(81166006)(8676002)(110136005)(54906003)(6436002)(14454004)(8936002)(99286004)(478600001)(52116002)(186003)(229853002)(53936002)(6246003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2846;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wCUKalECbnrmTHWT1mcdqmqlwPmS7A87HFqtSbIJADuSPkUFIgDm4pAT7mTxXIl+U/+/05Ty14XqEC7WIAR1PO0WVPueg3keCzhlWqwL4a43v+DXlHlPukuNlQcD5uWXhiTmwR1oDY6smnBn93kbm/xhKAaEadYaMwnUklT6xv/vlu+Bh8tnY7Yjz2mx06SexgBBJI2e9Bgq3X/ytLcpXy5ZF4tzy7WERwln5weQE0+z0iDc6L8z8D5ltZ0xhzeVZm3NUtB1FmCsGG5CCvw1+sZ0RAfDlFAfocv1H7npTlOd8n0+KNtk5S9x1MT5YdSRBmFllQKy3zOhdsLK+J8MWIr0s6QFnurQZAtMuToRwTyNvnnAWfJc0DjAysoIVTUrv140SjmJxkdg1Iu0KWUewwXjQy6fr0fEFCuuyLHrN6k=
Content-ID: <D92D938F711C704BB4CF040AF1FDA610@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86462c3b-d507-47c4-4869-08d70aa887b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 11:18:44.5538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2846
Subject: Re: [Xen-devel] [PATCH v2 09/10] xen-access: Code cleanup
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

DQoNCk9uIDE2LjA3LjIwMTkgMjA6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4gQ2xlYW51
cCB4ZW4tYWNjZXNzIGNvZGUgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBYRU4gc3R5bGUgZ3VpZGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVm
ZW5kZXIuY29tPg0KDQpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRk
ZWZlbmRlci5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
