Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D8C764F7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:59:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqyqg-0005Gq-Cb; Fri, 26 Jul 2019 11:57:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hqyqf-0005Ge-3N
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:57:21 +0000
X-Inumbo-ID: 84619ec9-af9c-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::628])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 84619ec9-af9c-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 11:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ausmyPgZs0Jrr6m8zX211SdWMh+o9zYiQWKTRIu9EcuF3I7I0FEnIEJmNNM//bP/OneIevYl+K0r+g4FCZ8+ep4UEun94XyVGZso1yu6L46nXbG0zQO1Yxep5kO/Q5L0EU+HZQkXDyUQSDkiJrZqxHtwgKsdCN8jLT9Lvp9G5mbMzAcL+01L/Arb4stCCOu4fqO/WBptnnVff+Rs68Sz+qfrnX+tgrMzotxolZK1vNGJ8mh3F3W9JL/4qyiJzuMLb3OCY1ig5gGhFrqxqHOr7zIHbN7nb311Fu9VP7IHD9WWsXGcze5IC3+SPban/pHqvN6lFKFny3LAxGYT8mjwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8j+OKnia7KLKv/5ekfhitxRdw1WuvpTQvpWj/VSDU=;
 b=chlHiM3l/U0OfnI7JEXrhWkHBIe0sfboSqFkKfy0T8WpGN1ETOcMrTwTSqpOJ4Nk+0IMQ27Lhl9fzAo3Wbl9piBaaYgLHfbwZOb4j47TXHQzbTWzdt40Gf32I0HX8x969FN7FVYrkMFqJYgdLVioLnZXWGRm5q8qSa5tm3s39H8T23Xn28/OMcqRVk8+3hCvdoZgyGMQTWRrX/hzya2C43rOHMf9NeteUmyJbOc2PCpu5cDT2YaG82UCvFqadwwsU8z5uLM2LhE22rM1Di6usgq3XezHUrZ53m1dhc9T8nckTUudQE83zKC9j2oXutfazMPPPxCoQV20YJII8Qehtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8j+OKnia7KLKv/5ekfhitxRdw1WuvpTQvpWj/VSDU=;
 b=OT2cNvPL8+KNDS3qhXwT/NJDSRlNT2BGUZLKrC/llf6nb76LgFIpeVn3KVxaL3GMQ8VOn0JYmFvVGRn9JFlxBkLPY3+dNTaE6BqI8UVsdm1Ljr5ASKKubPHbAzhVeK1aQiAzhuF6Ws5KmKkuEHjVKo+QgVOLH8PPE9Vfmxk/VcN0yYFOqoPZfUz9/TO81tgfdICmPRGoN3lf+q9Q61KbQx19CpDmO4j96DLn2utcy6FejZ1tnmC+TcmykoOmvXA8K5042y59adWIpts4WLtBYUuYRHbmQyKqMiqrzoqriROf8gJzyq5T3RaA4Yp8IPZPOAR1vS1bFA8o8yy5VcwTPA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4018.eurprd03.prod.outlook.com (52.135.148.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 11:57:17 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 11:57:17 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH] xen/arm: extend fdt_property_interrupts
Thread-Index: AQHVQ5DIG4Wp10DIaUKStsgLLIvpgKbcy2UA
Date: Fri, 26 Jul 2019 11:57:16 +0000
Message-ID: <87sgqthuud.fsf@epam.com>
References: <20190726090124.26444-1-viktor.mitin.19@gmail.com>
In-Reply-To: <20190726090124.26444-1-viktor.mitin.19@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0b1a586-b489-426f-6e14-08d711c067e2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4018; 
x-ms-traffictypediagnostic: AM0PR03MB4018:
x-microsoft-antispam-prvs: <AM0PR03MB40188E4D6C9A6C137620D6BDE6C00@AM0PR03MB4018.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(199004)(189003)(6116002)(229853002)(6916009)(486006)(76116006)(66476007)(66556008)(64756008)(91956017)(66066001)(66446008)(36756003)(76176011)(71190400001)(80792005)(6512007)(11346002)(6506007)(6486002)(6436002)(26005)(99286004)(102836004)(71200400001)(66946007)(107886003)(81156014)(186003)(305945005)(55236004)(4326008)(54906003)(25786009)(81166006)(2906002)(6246003)(3846002)(68736007)(316002)(256004)(8676002)(8936002)(14454004)(2616005)(446003)(476003)(53936002)(86362001)(7736002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4018;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K3A1L1J6XkB45zeX2AMZjru/vxMOQy9Dsivp+eLCj3FuP2vSmZp/myZpo//6BIEoREW2mzkrIfXFHdqGu91UurIYQ6ag6zdk0tYx/UxBsgKvT2+shANeMtfGQf630E8yyvcEBKPkaSSNeM8pBJJVCBfilAX8lxkyBGFsJ1CcMrTB9Q/GJNV/h6MTFx/Y42vJdqfUADUs35pOhn+YLtyjTUhjYsXIWB/YaLodqVmHnf/ow4EgpkbGfI+aD5TGR1qsvJTCDW4FH6Ld1sD5rDuT3CsQvAZUCwiwNR5I12UESJRMjyS1M8ry04wACe98zFyukjPq3u+ZpFdDy6TG9q7of/KzmxDhYx9BIqkhxpbCOo9EHK8Cpe8lRNVJO86N9ZwH6ms7wiSEAvz6D25MwJVz8ktsiHOOdjAxr7T3T9rmcjM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b1a586-b489-426f-6e14-08d711c067e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:57:16.9380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4018
Subject: Re: [Xen-devel] [PATCH] xen/arm: extend fdt_property_interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIFZpa29yLAoKVmlrdG9yIE1pdGluIHdyaXRlczoKCj4geGVuL2FybTogZXh0ZW5kIGZk
dF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhlcgo+IGRvbWFpbiB0aGFuIHRo
ZSBod2RvbQoKSXQgaXMgdW5jbGVhciB3aGF0IHByb2JsZW0geW91IGFyZSBmYWNpbmcuIENvdWxk
IHlvdSBwbGVhc2UgZWxhYm9yYXRlCmNvbW1pdCBtZXNzYWdlPwoKQWxzbywgbG9va3MgbGlrZSB5
b3VyIGNvbW1pdCBtZXNzYWdlIGlzIGZvcm1hdHRlZCBpbmNvcnJlY3RseS4KCj4gVGVzdGVkIHdp
dGggYWFyY2g2NCBxZW11IGRvbTAgYW5kIGRvbTBsZXNzIGJvb3QuCj4KPiBTdWdnZXN0ZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlr
dG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBhbS5jb20+Cj4KPiAtLS0KPiBTZWUgZGlzY3Vzc2lv
biBpbiBtYWlsOgo+IFtQQVRDSF0geGVuL2FybTogbWVyZ2UgbWFrZV90aW1lcl9ub2RlIGFuZCBt
YWtlX3RpbWVyX2RvbVVfbm9kZQo+Cj4KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwg
MjIgKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCA0Yzg0MDQxNTVh
Li41ZjY4NjAzMzkyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC02MjEsMTcgKzYyMSwxOSBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0X2ludGVycnVwdChnaWNfaW50ZXJydXB0X3QgaW50ZXJy
dXB0LAo+ICAgKiAgImludGVycnVwdHMiOiBjb250YWlucyB0aGUgbGlzdCBvZiBpbnRlcnJ1cHRz
Cj4gICAqICAiaW50ZXJydXB0LXBhcmVudCI6IGxpbmsgdG8gdGhlIEdJQwo+ICAgKi8KPiAtc3Rh
dGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHModm9pZCAqZmR0LCBnaWNfaW50
ZXJydXB0X3QgKmludHIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIG51bV9pcnEpCj4gK3N0YXRpYyBpbnQgX19pbml0IGZkdF9wcm9wZXJ0eV9p
bnRlcnJ1cHRzKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnaWNfaW50ZXJydXB0X3QgKmludHIsIHVuc2lnbmVkIG51bV9pcnEp
Cldyb25nIGluZGVudGF0aW9uIHRoZXJlLgoKPiAgewo+ICAgICAgaW50IHJlczsKPiArICAgIHVp
bnQzMl90IHBoYW5kbGUgPSBpc19oYXJkd2FyZV9kb21haW4oa2luZm8tPmQpID8gClRoZXJlIGlz
IGV4dHJhIHNwYWNlIGF0IEVPTC4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHRfaW50ZXJy
dXB0X2NvbnRyb2xsZXItPnBoYW5kbGUgOiBHVUVTVF9QSEFORExFX0dJQzsKPiAgCj4gLSAgICBy
ZXMgPSBmZHRfcHJvcGVydHkoZmR0LCAiaW50ZXJydXB0cyIsIGludHIsIHNpemVvZiAoaW50clsw
XSkgKiBudW1faXJxKTsKPiArICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShraW5mby0+ZmR0LCAiaW50
ZXJydXB0cyIsIApUaGVyZSBpcyBleHRyYSBzcGFjZSBhdCBFT0wuCgoKPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnRyLCBzaXplb2YgKGludHJbMF0pICogbnVtX2lycSk7Cj4gICAgICBpZiAo
IHJlcyApCj4gICAgICAgICAgcmV0dXJuIHJlczsKPiAgCj4gLSAgICByZXMgPSBmZHRfcHJvcGVy
dHlfY2VsbChmZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGR0X2ludGVycnVwdF9jb250cm9sbGVyLT5waGFuZGxlKTsKPiArICAgIHJlcyA9IGZk
dF9wcm9wZXJ0eV9jZWxsKGtpbmZvLT5mZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwgcGhhbmRsZSk7
Cj4gIAo+ICAgICAgcmV0dXJuIHJlczsKPiAgfQo+IEBAIC03MzMsNyArNzM1LDcgQEAgc3RhdGlj
IGludCBfX2luaXQgbWFrZV9oeXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAg
ICAqICBUT0RPOiBIYW5kbGUgcHJvcGVybHkgdGhlIGNwdW1hc2s7Cj4gICAgICAgKi8KPiAgICAg
IHNldF9pbnRlcnJ1cHQoaW50ciwgZC0+YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lSUV9UWVBF
X0xFVkVMX0xPVyk7Cj4gLSAgICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhmZHQsICZp
bnRyLCAxKTsKPiArICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCAmaW50
ciwgMSk7Cj4gICAgICBpZiAoIHJlcyApCj4gICAgICAgICAgcmV0dXJuIHJlczsKPiAgCj4gQEAg
LTk2MCw4ICs5NjIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9naWNfbm9kZShjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQsCj4gICAgICByZXR1cm4gcmVzOwo+ICB9Cj4gIAo+
IC1zdGF0aWMgaW50IF9faW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCwgdm9pZCAqZmR0KQo+ICtzdGF0aWMgaW50IF9faW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qg
c3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKPiAgewo+ICsgICAgdm9pZCAqZmR0ID0ga2luZm8t
PmZkdDsKPiArCj4gICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aW1l
cl9pZHNbXSBfX2luaXRjb25zdCA9Cj4gICAgICB7Cj4gICAgICAgICAgRFRfTUFUQ0hfQ09NUEFU
SUJMRSgiYXJtLGFybXY3LXRpbWVyIiksCj4gQEAgLTEwMTYsNyArMTAyMCw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpm
ZHQpCj4gICAgICBkdF9kcHJpbnRrKCIgIFZpcnQgaW50ZXJydXB0ICV1XG4iLCBpcnEpOwo+ICAg
ICAgc2V0X2ludGVycnVwdChpbnRyc1syXSwgaXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xP
Vyk7Cj4gIAo+IC0gICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0LCBpbnRycywg
Myk7Cj4gKyAgICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhraW5mbywgaW50cnMsIDMp
Owo+ICAgICAgaWYgKCByZXMgKQo+ICAgICAgICAgIHJldHVybiByZXM7Cj4gIAo+IEBAIC0xMzc3
LDcgKzEzODEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgaWYgKCBkZXZpY2VfZ2V0X2Ns
YXNzKG5vZGUpID09IERFVklDRV9HSUMgKQo+ICAgICAgICAgIHJldHVybiBtYWtlX2dpY19ub2Rl
KGQsIGtpbmZvLT5mZHQsIG5vZGUpOwo+ICAgICAgaWYgKCBkdF9tYXRjaF9ub2RlKHRpbWVyX21h
dGNoZXMsIG5vZGUpICkKPiAtICAgICAgICByZXR1cm4gbWFrZV90aW1lcl9ub2RlKGQsIGtpbmZv
LT5mZHQpOwo+ICsgICAgICAgIHJldHVybiBtYWtlX3RpbWVyX25vZGUoa2luZm8pOwo+ICAKPiAg
ICAgIC8qIFNraXAgbm9kZXMgdXNlZCBieSBYZW4gKi8KPiAgICAgIGlmICggZHRfZGV2aWNlX3Vz
ZWRfYnkobm9kZSkgPT0gRE9NSURfWEVOICkKCgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBB
TQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
