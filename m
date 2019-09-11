Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C1AF427
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 04:10:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7s26-0000BR-6G; Wed, 11 Sep 2019 02:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=umse=XG=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1i7s24-0000BM-Rc
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 02:06:57 +0000
X-Inumbo-ID: d35aa4da-d438-11e9-b299-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d35aa4da-d438-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 02:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5Mqi76CBH/tBwzVthZs3NSasHK/C2vAyfXH2o7BJrezXhmCbh0LE6/qSasXEM+JvF1lgfs3a1jQXqeD2LCAAA1ETOILZnYkN2db2Avwpzj1/y9ef687z4E+HQnOL2WVTji/aQNmaNwcJegRFcjjSP6yhZSgjO1AxyRGAq0DHHiNqLVlmq9Pzxp08rzGGzvkzKdN1BcKFGL89u0CrDs9sA56zI/g8giDAW/X7f6K9CO+V23ez8PL5QI4A03NRHu62jvuKxPB9ewirIkc1RgiGLHS9FKKhj0mG7RmGDELg/Pews4vt3Rpw3BPkGBz1HWN7f30lEBzzHpQa9yRxY3b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb2ETKokaVuDE1uKPXbrgkE2B1D+6xetfdMOqm4EtKg=;
 b=eos7EqPa9fvNwxx7ehFz6FXWXl8c+G0+vR2JC9+51GjpNDOKQxpCyzd88KJCNAajMBQuT8ETSS/0JSEj43uF1sIyE2pVqsxo3vpZW7D13mVz2EDbrRna8BcP/cKUW27Jsuf1LLsgFwbh6xAU6Fog5CfBR5pL5AqJ14Z0Z/DEPZEjrDemEBauCgDuw+6T0A78hGZZAsd1NF+Ry0rRLU6Q5vTKP55UgO1itggFBKA9KIPY4EvkM8POjZMycEsTlaJvwZxe75ylhdtx9dshfiXU9UL6l19a3CUrifL954budWlkdwG/DIw/R05RXXgCCwuy352lePNv/8Jh/OHfTIep+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb2ETKokaVuDE1uKPXbrgkE2B1D+6xetfdMOqm4EtKg=;
 b=H0VT7tgjJ8TqdjEQQQwLWKCxpgZ08BHMBbVh7NCh2TK7sdSfpVWz2Fcq0SgzxEbtGoxvfdefFHUDWbqq+IkoCR5y4vec3MOOWDdwKf7VTwA1BmrijjlqDd9kzv2NMATfqVQ2W0nwWDXojkDnuuFYn0uq0lH+ec014MKYL4VXTf4=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5874.eurprd04.prod.outlook.com (20.178.202.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 02:06:52 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::6ca2:ec08:2b37:8ab8]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::6ca2:ec08:2b37:8ab8%6]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 02:06:52 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Christoph Hellwig
 <hch@infradead.org>
Thread-Topic: [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVXtqjidV/KwEkYkeguLx++Vlcn6cTXzGAgAAFLoCAASjiAIARPvgQ
Date: Wed, 11 Sep 2019 02:06:52 +0000
Message-ID: <AM0PR04MB448166E527EF4ABFCE3DD59688B10@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
 <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
 <20190830085807.GA15771@infradead.org>
 <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfbcc44e-9097-4ba8-ce07-08d7365cb690
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB5874; 
x-ms-traffictypediagnostic: AM0PR04MB5874:|AM0PR04MB5874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5874D796A60C52FFD1D2366F88B10@AM0PR04MB5874.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(199004)(189003)(25786009)(55016002)(6246003)(99286004)(64756008)(14444005)(256004)(14454004)(66556008)(316002)(110136005)(66476007)(76116006)(6436002)(5660300002)(54906003)(71190400001)(71200400001)(66946007)(4326008)(446003)(11346002)(86362001)(7696005)(81156014)(26005)(229853002)(8676002)(44832011)(486006)(81166006)(9686003)(53936002)(102836004)(186003)(33656002)(6506007)(76176011)(7416002)(8936002)(3846002)(6116002)(52536014)(478600001)(7736002)(2906002)(74316002)(305945005)(66066001)(476003)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5874;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V9e56MdmfhrL12xVzH3HILbv6Mrfh1jSINf/mHizV5nkF4ENRj098CCy8rWa69wtRHMd8ZHWt9gsmQnMbKfwOdKvNjzqj2TX0+O9d2IA+EKYzt+d0zlXSWBvPbFbXkK4ogIehFUTs+SoPck1GWPrdmLPysZve20zE7dbS1YgzX937TIjU/l2BgAQ/UPB6EMcDL3GwYBoqlEywCVIY8fMfj7RKR0VtBa9zUiWwVJxuklYJHKIXHrEbvNtFROGUvGjSSFslHNiRmxD8tLu5cvCqJe5txzGIQFsYwf8O5DW2gWJndXhlbgGB/kCNKCMPaLHWxlvXlkiyBxyCpvK3gOn62U1F3Xjwfp6zRRPs5WmMB53FAKqxOzjYV5IKmbY4w7KBGmq1TyR+r3NhLYehyZphYsuORoqkjJTdfx82vtg50o=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbcc44e-9097-4ba8-ce07-08d7365cb690
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 02:06:52.2489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gb4CdVNsDOVnmBcZI4lucbV8xCi1CohTHtaa5Bzzn7MOFuDp1ZdPC7igttbLETKoLgezarKpfvlvR1ESRi3ANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5874
Subject: Re: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Julien Grall <Julien.Grall@arm.com>, dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, nd <nd@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyXSBhcm06IHhlbjogbW06IHVzZSBfX0dQRl9ETUEzMiBm
b3IgYXJtNjQKPiAKPiArIEp1ZXJnZW4sIEJvcmlzCj4gCj4gT24gRnJpLCAzMCBBdWcgMjAxOSwg
Q2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBDYW4gd2UgdGFrZSBhIHN0ZXAgYmFjayBhbmQg
ZmlndXJlIG91dCB3aGF0IHdlIHdhbnQgdG8gZG8gaGVyZT8KPiA+Cj4gPiBBRkFJQ1MgdGhpcyBm
dW5jdGlvbiBhbGxvY2F0ZXMgbWVtb3J5IGZvciB0aGUgc3dpb3RsYi14ZW4gYnVmZmVyLCBhbmQK
PiA+IHRoYXQgbWVhbnMgaXQgbXVzdCBiZSA8PSAzMi1iaXQgYWRkcmVzc2FibGUgdG8gc2F0aXNm
eSB0aGUgRE1BIEFQSQo+ID4gZ3VhcmFudGVlcy4gIFRoYXQgbWVhbnMgd2UgZ2VuZXJhbGx5IHdh
bnQgdG8gdXNlIEdGUF9ETUEzMgo+IGV2ZXJ5d2hlcmUKPiA+IHRoYXQgZXhpc3RzLCBidXQgb24g
c3lzdGVtcyB3aXRoIG9kZCB6b25lcyB3ZSBtaWdodCB3YW50IHRvIGRpcCBpbnRvCj4gPiBHRlBf
RE1BLiAgVGhpcyBhbHNvIG1lYW5zIHN3aW90bGIteGVuIGRvZXNuJ3QgYWN0dWFsbHkgZG8gdGhl
IHJpZ2h0Cj4gPiB0aGluZyBvbiB4ODYgYXQgdGhlIG1vbWVudC4gIFNvIHNob3VsZG4ndCB3ZSBq
dXN0IGhhdmUgb25lIGNvbW1vbgo+ID4gcm91dGluZSBpbiBzd2lvdGxiLXhlbi5jIHRoYXQgY2hl
Y2tzIGlmIHdlIGhhdmUgQ09ORklHX1pPTkVfRE1BMzIgc2V0LAo+ID4gdGhlbiB0cnkgR0ZQX0RN
QTMyLCBhbmQgaWYgbm90IGNoZWNrIGlmIENPTkZJR19aT05FX0RNQSBpcyBzZXQgYW5kCj4gPiB0
aGVuIHRyeSB0aGF0LCBlbHNlIGRlZmF1bHQgdG8gR0ZQX0tFUk5FTD8KPiAKPiBZZXMsIGZvciBB
Uk0vQVJNNjQgaXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UgZ2l2ZW4gdGhhdCBkb20wIGlzIDE6MSBt
YXBwZWQKPiAocHNldWRvLXBoeXNpY2FsID09IHBoeXNpY2FsKS4gIEknbGwgbGV0IEp1ZXJnZW4g
YW5kIEJvcmlzIGNvbW1lbnQgb24gdGhlIHg4Ngo+IHNpZGUgb2YgdGhpbmdzLCBidXQgb24geDg2
IFBWIERvbTAgaXMgbm90IDE6MSBtYXBwZWQgc28KPiBHRlBfRE1BMzIgaXMgcHJvYmFibHkgbm90
IG1lYW5pbmdmdWwuCgpJZiB3ZSBvbmx5IHRha2UgQVJNL0FSTTY0LCBzbyBjb3VsZCB0aGUgZm9s
bG93aW5nIHBhdGNoIGJlIG9rPwoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJj
aC9hcm0veGVuL21tLmMKaW5kZXggZDMzYjc3ZTlhZGQzLi5lNWE2YTczYjJlMDYgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL3hlbi9tbS5jCisrKyBiL2FyY2gvYXJtL3hlbi9tbS5jCkBAIC0yOCw3ICsy
OCwxMSBAQCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9mcmVlX3BhZ2VzKHVuc2lnbmVk
IGludCBvcmRlcikKCiAgICAgICAgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsKICAg
ICAgICAgICAgICAgIGlmIChyZWctPmJhc2UgPCAocGh5c19hZGRyX3QpMHhmZmZmZmZmZikgewor
I2lmZGVmIENPTkZJR19aT05FX0RNQTMyCisgICAgICAgICAgICAgICAgICAgICAgIGZsYWdzIHw9
IF9fR0ZQX0RNQTMyOworI2Vsc2UKICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgfD0gX19H
RlBfRE1BOworI2VuZGlmCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAg
ICAgICAgfQogICAgICAgIH0KClRoYW5rcywKUGVuZy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
