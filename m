Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416979E442
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Xle-0000Iu-To; Tue, 27 Aug 2019 09:27:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQqY=WX=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1i2Xlc-0000IN-V3
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:27:57 +0000
X-Inumbo-ID: f2d933ea-c8ac-11e9-8980-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2d933ea-c8ac-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGZxb0FVie3J918HVdVjOgvP+zsGEZRhXX8mo0hWvcFghHynBJcsDhd+N6sqEzZ6Ld6klZfEgJGe8OYrcuNPF7HjP6MQN2fVH4PsQkB4EnEn5Pc7W3CaIN4WB8BZOCg3I4gCEbzkikMpm2UqfOUptWvXL1qdKEdYVP3K19jSQ0/Ny5wI48NbOG6w9nMtUeeAvXqTTWZ8OVxyVvO9LauxtKoLqEISstrEJj/X3O172+b6FnpLpJL8Nntp0D3cb28eKICgaRnsvsgIZ7w8sjhHOQ1BJRrQ7PWl7rHshM25rge1r8+iZGLLI3gDZtYlEyshuL/4AHtvmOl5oyC5ctHqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5MZyXFTtEtFKMu7SJdyOkMnL8vRhRWLKC4eUU4WjJY=;
 b=jW73TuF/ru85gA1MhyHV0vXMzO0j7r2/XIheu+gxiYAWjO5pGBDcInaE/lIvEeL2uxaQ2Q1crj49WNoL+A84lwbvVqYQqSbd0+dhaH2KBmnJAntGZ1SU3gQOPbznxV6TSsF5kBSaLM3atVG9QmLG+xzK2WQ4GzGrtGZdRG8a5sdsgVwpZ4+nyjfQYFroVlxWE/0ILPmABkoAAjtC1jSZYVjZp9MbyQLBrPo6CGZVsKBDQULed9YyRlyk3VPa+XimesjMbhHGPtRbwwJbdVlwcUz6/hrTKPGPT1E/lmpC671TZXdMthZRL0gCSvicq+oDLGH7FUVHV5Ayq/RlkpgCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5MZyXFTtEtFKMu7SJdyOkMnL8vRhRWLKC4eUU4WjJY=;
 b=JoD1ut+8RDQDTnsHnjVqx/pjhLBe3gPAhaMoAUYOGKv/DeKSkHE7TNEmEKhcMLZSJqFefAb548NPm4ixi8Z+JcXXfRmvSkchwVnZYr3F323UcyXG3tABDrG5wqN8T7EpVE2zJL2pklBho7fjv0arbRcBi63kuhkZSGB6R12Dbwg=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6866.eurprd04.prod.outlook.com (52.132.213.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 09:27:53 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::5d98:e1f4:aa72:16b4]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::5d98:e1f4:aa72:16b4%4]) with mapi id 15.20.2178.022; Tue, 27 Aug 2019
 09:27:53 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "julien.grall@arm.com" <julien.grall@arm.com>
Thread-Topic: [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVNi9zmpVhxJk2Z0aPUBEkePn3c6bXnoowgDdoLuA=
Date: Tue, 27 Aug 2019 09:27:53 +0000
Message-ID: <AM0PR04MB44818BB69CAD35DC989A416988A00@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190709083729.11135-1-peng.fan@nxp.com>
 <AM0PR04MB448135E1B2C85F0B6029F7B788C70@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB448135E1B2C85F0B6029F7B788C70@AM0PR04MB4481.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc080c13-9b1e-40b2-3565-08d72ad0d678
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6866; 
x-ms-traffictypediagnostic: AM0PR04MB6866:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6866743A9FE5324CDF3C0CA288A00@AM0PR04MB6866.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:269;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(199004)(189003)(8936002)(6436002)(6116002)(55016002)(316002)(486006)(14454004)(476003)(44832011)(5660300002)(8676002)(66946007)(25786009)(3846002)(7736002)(33656002)(446003)(11346002)(6246003)(4326008)(54906003)(53936002)(2906002)(64756008)(66556008)(66476007)(76116006)(66446008)(2201001)(76176011)(186003)(99286004)(71190400001)(71200400001)(256004)(14444005)(102836004)(478600001)(26005)(6506007)(86362001)(7696005)(2501003)(9686003)(4744005)(81156014)(81166006)(110136005)(229853002)(305945005)(74316002)(52536014)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6866;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9QXx9L9rNlHM7/lOH+iTscQowqdPjE4Czy1EsEVzsUei/tEJ3Hsq499xiK4GeaL00Wsv+ORuZv6BR+VtSLHP39Fw08sQyxnie1k59YfPpmErU7RqyrLUAutEJF0OuBszqKBSEFenX2Dlj/0jLca+g0CI2QFWgg2l031sgLhxHYU9d1lnNwdlMoy564j3q+clSBIBWVAC0I2PKw+imiSgSZGvGT2zrJHWzu/2tIdaftcZFL0/9FLLbmFnqcrV/T4Sema5+zNdVnV4XnM60cofS1iRg8N8vd2V7SrwJUHappsEOz578lKEnoZirMdQA+jj0ly0JPqdyPp7mFsBj/JomT9eoPr9UK/XLlmfTElImkRF5hjKtAKrYUTWbZUwIoY74IeytXw5ciBaDFKq8xBhj1jP4P0LnHy0dVKa5I/m4WU=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc080c13-9b1e-40b2-3565-08d72ad0d678
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 09:27:53.5241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxGjywD07xFcFfzd7xOcNbeHc1X/ez3EkQ7GDLLnWUZbkGS7d9mq4tlHFr6tQgULxYJE4dXoVjNQz9lyRhNzTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866
Subject: Re: [Xen-devel] [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZyBhZ2Fpbi4uCgorSnVsaWVuCgo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGFybTogeGVuOiBt
bTogdXNlIF9fR1BGX0RNQTMyIGZvciBhcm02NAo+IAo+IEhpIFJ1c3NlbGwsIFN0ZWZhbm8KPiAK
PiA+IFN1YmplY3Q6IFtQQVRDSF0gYXJtOiB4ZW46IG1tOiB1c2UgX19HUEZfRE1BMzIgZm9yIGFy
bTY0Cj4gCj4gQW55IGNvbW1lbnRzPwo+IAo+ID4KPiA+IGFybTY0IHNoYXJlcyBzb21lIGNvZGUg
dW5kZXIgYXJjaC9hcm0veGVuLCBpbmNsdWRpbmcgbW0uYy4KPiA+IEhvd2V2ZXIgWk9ORV9ETUEg
aXMgcmVtb3ZlZCBieSBjb21taXQKPiA+IGFkNjdmNWE2NTQ1KCJhcm02NDogcmVwbGFjZSBaT05F
X0RNQSB3aXRoIFpPTkVfRE1BMzIiKS4KPiA+IFNvIHRvIEFSTTY0LCBuZWVkIHVzZSBfX0dGUF9E
TUEzMi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvYXJtL3hlbi9tbS5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jIGluZGV4Cj4gPiBlMWQ0NGI5MDNkZmMu
LmE5NWU3NmQxOGJmOSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4gPiArKysg
Yi9hcmNoL2FybS94ZW4vbW0uYwo+ID4gQEAgLTI3LDcgKzI3LDcgQEAgdW5zaWduZWQgbG9uZyB4
ZW5fZ2V0X3N3aW90bGJfZnJlZV9wYWdlcyh1bnNpZ25lZAo+IGludAo+ID4gb3JkZXIpCj4gPgo+
ID4gIAlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewo+ID4gIAkJaWYgKHJlZy0+YmFz
ZSA8IChwaHlzX2FkZHJfdCkweGZmZmZmZmZmKSB7Cj4gPiAtCQkJZmxhZ3MgfD0gX19HRlBfRE1B
Owo+ID4gKwkJCWZsYWdzIHw9IF9fR0ZQX0RNQSB8IF9fR0ZQX0RNQTMyOwo+ID4gIAkJCWJyZWFr
Owo+ID4gIAkJfQo+ID4gIAl9Cj4gCj4gVGhhbmtzLAo+IFBlbmcuCgpUaGFua3MsClBlbmcuCgo+
IAo+ID4gLS0KPiA+IDIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
