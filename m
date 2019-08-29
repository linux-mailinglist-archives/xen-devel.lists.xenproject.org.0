Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC7A0FAC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 04:49:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3AS9-0007Wv-6w; Thu, 29 Aug 2019 02:46:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TWs0=WZ=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1i3AS7-0007Wp-ND
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 02:46:23 +0000
X-Inumbo-ID: 2e7880c6-ca07-11e9-ae52-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e7880c6-ca07-11e9-ae52-12813bfff9fa;
 Thu, 29 Aug 2019 02:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqCu8U1A+GXYYZpOYMCDpqB2hyLinidfIqmhnhr2jSanMqYheCvkZWxtcjeKzKPiIGGnykwOIIfsPC/fIPlm9JiS636uNbXruUpbYjt8w5fL15wnAn0Z2MlRIExkFvtbRqegVx37B6kLxhxMFY0L5+oaidRXhVmKtCYpKSNvj3gp7A4d3jI8ug/Wlr1fmez7ftVDVTbS40bKyV1ORF4u+45Cvsk6K/vG0Z9YbkAep/SypytdL/0qaZwxixXSzmLosWtS8xSl0HP5XmoL1ivwGDYiL9BvApvd2eWWLldRtL2Zqqc1vQ9YZiS9drLs/enlhsCzraQXXPLYMd+jIf5kSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yWf7L2gQzxVkG10y4VJ/kAw1LB+1I9uUe7/qn1cW9k=;
 b=MVrKqjI4WnYfsRjbXxK/pwI/fo0UV0hpnYdZb7SHoVYRkSVG0UrznuvB07BNiiWtfy16pTOzT71kgtDTgNsgbpO7TRJWl1Djhy87UI4YDb63txaQkYTRjs8b9aY0HDZ7gQaFDmKri96ldPqLBy4CI5p/fOuk7Eje/JLY6U1saKj7aSn+ObO0c3Cbyh5Lufwq6Y1VgvyLiudBWaSQfveSzOnAvzrHxUgZDLQp2Lg1B7E3HiAPMp1O1R/9lyxbdP4BCn6d9gDB2JJEkE4Cfg7XBIOrbs1t0oJUzc+SYZ12PCvSuL5+9f8B+4hgdN/A4qihsNqj6+16QV5pZRQrfDYUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yWf7L2gQzxVkG10y4VJ/kAw1LB+1I9uUe7/qn1cW9k=;
 b=ovX/byAg0iQraa8vGDPlGZ8d9bChc2OqZn1aWR9Sa+FdNSHcDkmOphtV+uq8VJJz8ww/mnOkDlsHdMQjY/OcRJgfCsWQc0W3Ma/8JfR8R4as5xMW231q0iR0U6m2zvlKUoiFP34rcM+egvkt64bv03b+9y6Ylm9TTylIyfYne9I=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6755.eurprd04.prod.outlook.com (20.179.252.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 02:46:19 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::5d98:e1f4:aa72:16b4]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::5d98:e1f4:aa72:16b4%4]) with mapi id 15.20.2178.023; Thu, 29 Aug 2019
 02:46:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVNi9zmpVhxJk2Z0aPUBEkePn3c6cPOA8AgADZ48CAARk7AIAAkAzw
Date: Thu, 29 Aug 2019 02:46:19 +0000
Message-ID: <AM0PR04MB4481C44313C450F8994AF4BC88A20@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190709083729.11135-1-peng.fan@nxp.com>
 <d70b3a5c-647c-2147-99be-4572f76e898b@arm.com>
 <AM0PR04MB4481386D2C54AEA6987E1B1588A30@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.1908281103290.25361@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908281103290.25361@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 596f9668-4705-49bb-9296-08d72c2b1207
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6755; 
x-ms-traffictypediagnostic: AM0PR04MB6755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6755ACAF082E66E4713A9B9C88A20@AM0PR04MB6755.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(189003)(199004)(8936002)(229853002)(256004)(8676002)(81156014)(14444005)(81166006)(33656002)(53546011)(76176011)(6506007)(26005)(7696005)(305945005)(7736002)(2906002)(186003)(102836004)(86362001)(74316002)(316002)(99286004)(66066001)(54906003)(478600001)(66556008)(76116006)(66946007)(66476007)(66446008)(6916009)(64756008)(446003)(11346002)(476003)(486006)(44832011)(6116002)(3846002)(53936002)(4326008)(25786009)(5660300002)(52536014)(6436002)(6246003)(14454004)(55016002)(71190400001)(71200400001)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6755;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M7WCWBDde4fnhsUfpj10HINnZWIgIbFH3vb/+2AcdMw0TFUHPn3Wtz4cyNfCh9eB9ePlLsWODe4Z9bGGPvVLDEFjPP16YoxRzjkI7TvOZuCOwIY/w6SElGIPoLtyJGK69eFxMSU5IHSGSBUZtSr1BdTmR/tt+RX+eZCbE1DDWABVqDbglBfvEP6Z9UjWjJoDUw5KrnJ6bQXSDNqFeA1VsYC9lhnjwr2Tf+OJpHCP4k30d/bZ924y9p9HBS8kAOx4B9YrufxSOZA5LsjutIIfEw2PyL4Oznaa5/pR6frtS1pzkz45BoX4J69xJiHSQX/GirYirEuP8svi0NCL4C/6PfOQLo2hhTYFNIcX9FepNn8htLPpjL2169XwJDVI6O/YjtRn4HH8xwoK2Hzus5LFBtcRJh3b1KGCturXxzd/VVs=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596f9668-4705-49bb-9296-08d72c2b1207
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 02:46:19.3067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGv0b5yeEGah/DAXfPnLLlVHLdM5gS5+ubmK6samYq2+clZQQD+FOMJVfY17GIX8F90v8qKmIVCTEDUQcMoRgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6755
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
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gYXJtOiB4ZW46IG1tOiB1c2UgX19H
UEZfRE1BMzIgZm9yIGFybTY0Cj4gCj4gT24gV2VkLCAyOCBBdWcgMjAxOSwgUGVuZyBGYW4gd3Jv
dGU6Cj4gPiBIaSBSb2JpbiwKPiA+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTogeGVu
OiBtbTogdXNlIF9fR1BGX0RNQTMyIGZvciBhcm02NAo+ID4gPgo+ID4gPiBPbiAwOS8wNy8yMDE5
IDA5OjIyLCBQZW5nIEZhbiB3cm90ZToKPiA+ID4gPiBhcm02NCBzaGFyZXMgc29tZSBjb2RlIHVu
ZGVyIGFyY2gvYXJtL3hlbiwgaW5jbHVkaW5nIG1tLmMuCj4gPiA+ID4gSG93ZXZlciBaT05FX0RN
QSBpcyByZW1vdmVkIGJ5IGNvbW1pdAo+ID4gPiA+IGFkNjdmNWE2NTQ1KCJhcm02NDogcmVwbGFj
ZSBaT05FX0RNQSB3aXRoIFpPTkVfRE1BMzIiKS4KPiA+ID4gPiBTbyB0byBBUk02NCwgbmVlZCB1
c2UgX19HRlBfRE1BMzIuCj4gCj4gSGkgUGVuZywKPiAKPiBTb3JyeSBmb3IgYmVpbmcgc28gbGF0
ZSBpbiByZXBseWluZywgdGhpcyBlbWFpbCBnb3QgbG9zdCBpbiB0aGUgbm9pc2UuCj4gCj4gCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPiA+ID4g
LS0tCj4gPiA+ID4gICBhcmNoL2FybS94ZW4vbW0uYyB8IDIgKy0KPiA+ID4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9hcm0veGVuL21tLmMgaW5kZXgKPiA+
ID4gPiBlMWQ0NGI5MDNkZmMuLmE5NWU3NmQxOGJmOSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNo
L2FybS94ZW4vbW0uYwo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gPiA+ID4gQEAg
LTI3LDcgKzI3LDcgQEAgdW5zaWduZWQgbG9uZwo+ID4gPiA+IHhlbl9nZXRfc3dpb3RsYl9mcmVl
X3BhZ2VzKHVuc2lnbmVkCj4gPiA+ID4gaW50IG9yZGVyKQo+ID4gPiA+Cj4gPiA+ID4gICAJZm9y
X2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsKPiA+ID4gPiAgIAkJaWYgKHJlZy0+YmFzZSA8
IChwaHlzX2FkZHJfdCkweGZmZmZmZmZmKSB7Cj4gPiA+ID4gLQkJCWZsYWdzIHw9IF9fR0ZQX0RN
QTsKPiA+ID4gPiArCQkJZmxhZ3MgfD0gX19HRlBfRE1BIHwgX19HRlBfRE1BMzI7Cj4gPiA+Cj4g
PiA+IEdpdmVuIHRoZSBkZWZpbml0aW9uIG9mIEdGUF9aT05FX0JBRCwgSSdtIG5vdCBzdXJlIHRo
aXMgY29tYmluYXRpb24KPiA+ID4gb2YgZmxhZ3MgaXMgc3RyaWN0bHkgdmFsaWQsIGJ1dCByYXRo
ZXIgaXMgaW1wbGljaXRseSByZWxpYW50IG9uIG9ubHkKPiA+ID4gb25lIG9mIHRob3NlIHpvbmVz
IGV2ZXIgYWN0dWFsbHkgZXhpc3RpbmcuIEFzIHN1Y2gsIGl0IHNlZW1zIGxpYWJsZQo+ID4gPiB0
byBibG93IHVwIGlmIHRoZSBwbGFucyB0byBhZGQgWk9ORV9ETUEgdG8gYXJtNjRbMV0gZ28gYWhl
YWQuCj4gPgo+ID4gSG93IGFib3V0IHRoaXMsIG9yIGRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9u
cz8KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5j
IGluZGV4Cj4gPiBkMzNiNzdlOWFkZDMuLmY2MWMyOWE0NDMwZiAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvYXJtL3hlbi9tbS5jCj4gPiArKysgYi9hcmNoL2FybS94ZW4vbW0uYwo+ID4gQEAgLTI4LDcg
KzI4LDExIEBAIHVuc2lnbmVkIGxvbmcgeGVuX2dldF9zd2lvdGxiX2ZyZWVfcGFnZXModW5zaWdu
ZWQKPiA+IGludCBvcmRlcikKPiA+Cj4gPiAgICAgICAgIGZvcl9lYWNoX21lbWJsb2NrKG1lbW9y
eSwgcmVnKSB7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKHJlZy0+YmFzZSA8IChwaHlzX2FkZHJf
dCkweGZmZmZmZmZmKSB7Cj4gPiArI2lmZGVmIENPTkZJR19BUk02NAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZmxhZ3MgfD0gX19HRlBfRE1BMzI7ICNlbHNlCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBmbGFncyB8PSBfX0dGUF9ETUE7Cj4gPiArI2VuZGlmCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgIH0K
PiAKPiBZZXMgSSB0aGluayB0aGlzIGlzIHRoZSB3YXkgdG8gZ28sIGJ1dCB3ZSBhcmUgdHJ5aW5n
IG5vdCB0byBhZGQgYW55ICNpZmRlZgo+IENPTkZJR19BUk02NCB1bmRlciBhcmNoL2FybS4gTWF5
YmUgeW91IGNvdWxkIGludHJvZHVjZSBhIHN0YXRpYyBpbmxpbmUKPiBmdW5jdGlvbiB0byBzZXQg
R0ZQX0RNQToKPiAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fc2V0X2dmcF9kbWEoZ2ZwX3Qg
KmZsYWdzKQo+IAo+IGl0IGNvdWxkIGJlIGltcGxlbWVudGVkIHVuZGVyIGFyY2gvYXJtL2luY2x1
ZGUvYXNtL3hlbi9wYWdlLmggZm9yIGFybQo+IGFuZCB1bmRlciBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL3hlbi9wYWdlLmggZm9yIGFybTY0IHVzaW5nIF9fR0ZQX0RNQQo+IGZvciB0aGUgZm9ybWVy
IGFuZCBfX0dGUF9ETUEzMiBmb3IgdGhlIGxhdHRlci4KClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0
aW9uLiBJJ2xsIHVzZSB0aGlzIGluIFYyLgoKVGhhbmtzLApQZW5nLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
