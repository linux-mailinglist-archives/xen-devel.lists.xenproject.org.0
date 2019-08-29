Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B83A150E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:39:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GrZ-0008MK-2O; Thu, 29 Aug 2019 09:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hcs9=WZ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i3GrX-0008ME-94
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:37:03 +0000
X-Inumbo-ID: 8dcce6c8-ca40-11e9-8980-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::720])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dcce6c8-ca40-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 09:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4xesQe38ZTlIsXHx9bZpMLrvyRV1GUFwfk7FOCPcXA6MEFnZpZye10xysH8FxyPtlWu5PDPyln9jYiEj/diUMhzc/eyVn+rJHWYZLnrnGP06+2hMgd4aKThq3ZvQ9OkPm9az6v2VecHY3KM9X57E+0Msmynde1edK9S6ji6Jw01nIShrZzuwAW77CnJoepHE2HWDCF93i19yuKe1rNcivTBTRwIHafMObK4sBEN670jCXfuUD8ezd1Mo+RSdzHT6XIaKk2zlX/s3q7PrpK98XV8Fx7+IyF73xdYA2RpRpdQKRSqQ7QaIjJ44c6OGeZx1Dh97WkOls1B7z+XenPyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEVe2bKK4ZR+fuc0earyn91eDMWCpgVTw4ncRElhXIk=;
 b=fQ/0P5DTemlespXKOqkMt9WovB8C64YyGHoXl8xp0cGTaLdIbbyey5+Eg0ZA7e8CYa4HH6bB5PoHhIdlFw9ukHW2HmifdTOzSOITd96FrM/0OoWjKosq9tgR9Vt4TfYwem5YN4m7o2vM3zoXd7Le2VtshJFro2HuVU5P+L6juJAimjY28BYszH2pmNaguok+2DRuPTX5O+fm9uTAiZBfK3Sms4CoN86zlYtexZw3gK/cddUXjys4J1SWXneYmN1OWS5YTul+jpkvbFpBeIEl4q/dSzrmO0IPDtCDQLomu1V5wGaxIASkMjlvXtINfZjaFZzM47/ltLOKQ7/M9tg4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEVe2bKK4ZR+fuc0earyn91eDMWCpgVTw4ncRElhXIk=;
 b=DMW/NHNM+m8hec4yaqiLJqcLcM623mjvyi2BXUThbUvqlr/Ezdf+kQw0cfUOwLukaiayLg36DHFRhJJaQtIxmqyuuU/hhkWSgMnRh00F+f3/7CgD11nRJ4ooIrU/W4fAvT9UzSK5oFTpUic0Ui1wjBHMB00Z8XaAtTsd6BFIgdg=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5830.eurprd02.prod.outlook.com (10.141.172.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Thu, 29 Aug 2019 09:37:00 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.013; Thu, 29 Aug 2019
 09:37:00 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] Partially revert "x86/mm: Clean IOMMU flags from
 p2m-pt code"
Thread-Index: AQHVXkb2wrZEPpiihUuDabdThgmHracR3gwA
Date: Thu, 29 Aug 2019 09:37:00 +0000
Message-ID: <0feb4654-7aaa-6902-13bf-97436c88668b@bitdefender.com>
References: <20190829084918.89608-1-roger.pau@citrix.com>
In-Reply-To: <20190829084918.89608-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0501CA0019.eurprd05.prod.outlook.com
 (2603:10a6:800:92::29) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 576772ed-5f54-4158-0f50-08d72c647142
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5830; 
x-ms-traffictypediagnostic: AM7PR02MB5830:|AM7PR02MB5830:
x-microsoft-antispam-prvs: <AM7PR02MB58301945CBF160818E7CB894ABA20@AM7PR02MB5830.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(189003)(2616005)(36756003)(305945005)(26005)(478600001)(6512007)(186003)(8936002)(6486002)(5660300002)(4744005)(102836004)(53546011)(76176011)(54906003)(6506007)(386003)(31686004)(71200400001)(476003)(71190400001)(316002)(66066001)(8676002)(229853002)(81156014)(81166006)(7736002)(25786009)(486006)(31696002)(99286004)(86362001)(110136005)(11346002)(66446008)(4326008)(446003)(52116002)(6116002)(256004)(2501003)(6246003)(66556008)(66946007)(2906002)(6436002)(64756008)(14454004)(3846002)(66476007)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5830;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RmxzGfwdpeDCTXTaa94bUspWPiKCA90Otpatr+1kmvNAdwZiblEXjzpOXUfYBwb0xwjE/476O2Uo9e3o+s+XolI1gEWiQPtQgWmovN0nL7xpuACW/pVjWChqAgjZF1HBQ7ENoiM+AxH/dFu8AWS2OHcucaG+RpNKgbYYej5Gvy5eaOVMz4PEo2+5Vlt+pn7eFNKtciq8waPV/vH9DCLVUtOpa072XUy7MdAa/Dq1wcr/WPDSKdyCr8RgENgYpG13fWVvXFS3mv3DYG5r+jlnkUA4lNxIUbNnKUQLXSLet+C52OzU+ZU1IxW6UVtYJCq08fxD7HTA7t9vQ/5JeaYYWTLqPwS3u/L+OC+jD7Izse6cGd0iX6Aur8m7RniCJ66e8VYsAxviKm0+uek3gZVg5AnnKCNibOGnHGbMFFrTbHY=
Content-ID: <9AA4D46DD4DAFD4F831FE8EF869A6BCB@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576772ed-5f54-4158-0f50-08d72c647142
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 09:37:00.6522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIOlHrE8/6f4ps8kqu/97c5KRAxaPvm0GEorZHqicFGk6/sA3AoM2DlKeDs02q4p1DdVR0I2ezIrRKwOC4x9YcdY3M1PXIoJb4vDCIBDeqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5830
Subject: Re: [Xen-devel] [PATCH v2] Partially revert "x86/mm: Clean IOMMU
 flags from p2m-pt code"
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

DQoNCk9uIDI5LjA4LjIwMTkgMTE6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhpcyBw
YXJ0aWFsbHkgcmV2ZXJ0cyBjb21taXQNCj4gODU0YTQ5YTc0ODZhMDJlZGFlNWIzZTUzNjE3YmFj
ZTUyNmU5YzFiMSBieSByZS1hZGRpbmcgdGhlIGxvZ2ljIHRoYXQNCj4gcHJvcGFnYXRlcyBjaGFu
Z2VzIHRvIHRoZSBkb21haW4gcGh5c21hcCBkb25lIGJ5IHAybV9wdF9zZXRfZW50cnkgaW50bw0K
PiB0aGUgaW9tbXUgcGFnZSB0YWJsZXMuIFdpdGhvdXQgdGhpcyBsb2dpYyBjaGFuZ2VzIHRvIHRo
ZSBndWVzdCBwaHlzbWFwDQo+IGFyZSBub3QgcHJvcGFnYXRlZCB0byB0aGUgaW9tbXUsIGxlYXZp
bmcgc3RhbGUgaW9tbXUgZW50cmllcyB0aGF0IGNhbg0KPiBsZWFrIGRhdGEsIG9yIGZhaWxpbmcg
dG8gYWRkIG5ldyBlbnRyaWVzLg0KPiANCj4gTm90ZSB0aGF0IHRoaXMgY29tbWl0IGRvZXNuJ3Qg
cmUtaW50cm9kdWNlIGlvbW11IGZsYWdzIHRvIHRoZSBjcHUgcGFnZQ0KPiB0YWJsZSBlbnRyaWVz
LCBzaW5jZSB0aGUgbG9naWMgdG8gYWRkL3JlbW92ZSBlbnRyaWVzIHRvIHRoZSBpb21tdSBwYWdl
DQo+IHRhYmxlcyBpcyBiYXNlZCBvbiB0aGUgcDJtIHR5cGUgYW5kIHRoZSBtZm4uDQo+IA0KPiBG
aXhlczogODU0YTQ5YTc0ODZhMDIgKCd4ODYvbW06IENsZWFuIElPTU1VIGZsYWdzIGZyb20gcDJt
LXB0IGNvZGUnKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gLS0tDQo+IENjOiBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSA8YWlzYWls
YUBiaXRkZWZlbmRlci5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgIC0gUmVt
b3ZlIHRoZSBzaGFyZS1wdCBicmFuY2gsIHRoZXJlJ3Mgbm8gc2hhcmluZyBvbiBBTUQgaGFyZHdh
cmUuDQo+IC0tLQ0KDQpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRk
ZWZlbmRlci5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
