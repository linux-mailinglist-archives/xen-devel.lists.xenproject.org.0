Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964C0905C9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 18:30:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyf5j-0008QN-BB; Fri, 16 Aug 2019 16:28:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1kBP=WM=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyf5h-0008QH-M2
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:28:37 +0000
X-Inumbo-ID: e547acec-c042-11e9-b90c-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e547acec-c042-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 16:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diWQR9TEt3UYS9+2tT9lEhJN+ff9B5sdFzmATTwNoRknwtI+iB/uRLDhks+N4DPbpNMua/4Evg6dNpSj7eGmSu3laBBqnHqj3f7UOJeFcR4KLRuGy+R7WBvYb0DQs24KLFk66/OR+oMiu0PmPI4U0cbw0OlJhtVVHBtWUBbDeH6aPAK+0cmBiRyHp/7TJzVgdJ9NBIklRKmFOwmiVCYf4PL++2nl0HfdfxqZfLj3yLIDDTMCWrUPVNVArnQwZnmGadG/ZQJ43aEgBYhrkEN0TF6Gu8T6CaAIDYmfwbQHbKZxlXXEvvjzuZBB856U+VhxL++TLu6YuN6IKvDd6NGemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsmwJZhtnZbR933P2DLguPI28TYxlsPumvnnFcU4UOk=;
 b=fygQV/ZVAsZBgbRq195nNFprmaOTd/07Nx4Z5j1Dtz7zhyxGZT3vdhVrC2pcSSmze2KkClb+58Jz7AL+CNUtHpASftgnu/UzPV28VLDUTKoUIvPOHas2VwmivkszLxno4smJJOE1W0Dgo6PR3A6o/XuBmHtytEP47a5r2b55BtY3tTPVZwMYpj5JElcFjmbK55Ro70bGgjTvsqwQImrO6mS20NJZPkmTmiEFTwAmknHNQkL/QMbsidUUqF9CgRrVdzx7HvskWjEQYcRDKv60UrS8Mwvzftju6Yi24nZnAwNuduDnDRX9eBFs1n7gQRMYw7bfhmkRAfIH6BN5WB9nMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsmwJZhtnZbR933P2DLguPI28TYxlsPumvnnFcU4UOk=;
 b=WUBlIgaNammkJL4GDUGPWtCRbuY5ZDAGS14ayxm1uxkIUDFCzWxzLhg3Io+dt1P5oTjit4G6rCV8bswZt3rQK+jqgXm+RrV19+g4ZY99HQErh9FwTKkBrSj8RQqQ22RgD/vgfDUqDdIKCLSvV/2zwZS4wKxdVzbLkS6csS4qifVXnOsnsKKo9UWgWHB9adFUPFvBK6wWZBimqxxD3/c8MU+rv82koJ5OiIJLkptoczfih8yKGOXMK3AJwcBvSu+Ymtr4Ktpf/rfr+CFW6SKIXRu7OADFRsM6EozR7tpUzWGPZemEmF/g0OJO7KqMCaiGp27Df4EipcuR1/wV0cPVSQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4337.eurprd03.prod.outlook.com (20.177.41.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Fri, 16 Aug 2019 16:28:34 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 16:28:34 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/arm: domain_build: Remove redundant check in
 make_vpl011_uart_node()
Thread-Index: AQHVU6LQhgr4s3/gv0qSGrHMU43t3Kb9+AMA
Date: Fri, 16 Aug 2019 16:28:34 +0000
Message-ID: <871rxlgjm7.fsf@epam.com>
References: <20190815195114.31148-1-julien.grall@arm.com>
In-Reply-To: <20190815195114.31148-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84dd9e5f-f2fd-4d92-d062-08d72266c8aa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4337; 
x-ms-traffictypediagnostic: AM0PR03MB4337:|AM0PR03MB4337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB43377982751321B44A8C4531E6AF0@AM0PR03MB4337.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(81156014)(2906002)(81166006)(66446008)(476003)(316002)(99286004)(76116006)(6506007)(8676002)(305945005)(80792005)(11346002)(446003)(102836004)(76176011)(54906003)(86362001)(3846002)(478600001)(486006)(36756003)(6116002)(53936002)(26005)(5660300002)(64756008)(6916009)(256004)(6486002)(186003)(6246003)(55236004)(2616005)(6512007)(229853002)(107886003)(71200400001)(4744005)(8936002)(14454004)(25786009)(66946007)(66066001)(7736002)(66556008)(66476007)(71190400001)(6436002)(91956017)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4337;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Wk/5FbxDUzUL/sf84M2VOh1509U1ckH9A2zHZR59xvy0/akqMb6+U5hoXXGHCf92ub1VM6HwnITpdEe3ONpcfcpJWTthEK+x/aQbpWZLApFT/krJVYA1lU1bDgI9JYy41TFUh6uwYQcWB3SpEwImKR0oUuxjeltpQLIVwjkUINK9MoI9x9c80n8a5w8y9qFoks+3fqy1LjrhBd+hOeqtCMqmFGNLaSpQnod5stA30ZlpZhyXllB2x2W9SLNE5YmP8CHJoIuB8aCl2LExmky5elI49kHypez/XO1yB7dl8cR5on1Dhmb3uJYIeLUjG+XnzLQDPnK39WqkFXbz3vFwQNRd4NuAxKYHVpHAzMWC2YuVIWIRuqVE5pwzyaT6AD9Zw33BySJJlLZh8JwLnEjdsVNMXSljVhTI9Ixtm+OtvMY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dd9e5f-f2fd-4d92-d062-08d72266c8aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 16:28:34.3523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubxfWNSoXIwEnro/Ly1Gz3xirGfXPetGKm2i9wEwJUFemSmOec2XhzFRRISA/+q31b/5/6J+9T7OQgJZCN9AFgWxZLP51lIASoM75aCLOtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4337
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Remove redundant
 check in make_vpl011_uart_node()
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE5vbmUgb2YgdGhlIGNvZGUgc2lu
Y2UgdGhlIGxhc3QgY2hlY2sgb2YgcmVzIG1vZGlmeSB0aGUgdmFsdWUuIFNvIHRoZQo+IGNoZWNr
IGNhbiBiZSByZW1vdmVkLgo+Cj4gQ292ZXJpdHktSUQ6IDE0NzY4MjQKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5
bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPiAtLS0KPiAgeGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IGNmOWZmYmMz
NjAuLjE3MzU0NGQ4YzUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTE2MjksOCArMTYyOSw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdnBsMDExX3VhcnRfbm9kZShjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkLCB2b2lkICpmZHQpCj4gICAgICBkdF9jaGlsZF9zZXRfcmFuZ2UoJmNlbGxzLCBH
VUVTVF9ST09UX0FERFJFU1NfQ0VMTFMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgR1VFU1Rf
Uk9PVF9TSVpFX0NFTExTLCBHVUVTVF9QTDAxMV9CQVNFLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdVRVNUX1BMMDExX1NJWkUpOwo+IC0gICAgaWYgKCByZXMgKQo+IC0gICAgICAgIHJldHVy
biByZXM7Cj4gKwo+ICAgICAgcmVzID0gZmR0X3Byb3BlcnR5KGZkdCwgInJlZyIsIHJlZywgc2l6
ZW9mKHJlZykpOwo+ICAgICAgaWYgKCByZXMgKQo+ICAgICAgICAgIHJldHVybiByZXM7CgoKLS0g
ClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
