Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02640905F4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 18:37:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyfAx-0000ya-NC; Fri, 16 Aug 2019 16:34:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1kBP=WM=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyfAv-0000yS-Uy
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:34:01 +0000
X-Inumbo-ID: a69af11a-c043-11e9-b90c-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::601])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a69af11a-c043-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 16:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K82AWSbRY+Jf1kK66TfPCY+gZyFQk4nRfp6oa4yWUYko7gFioyTe8Oa9KylFOBmrAXK43pOy4UYPugRPPMZwZqHJFPOcRA0TM6hmaJOMeBVhakH3WExA1xpsdnHydBZ5PVKnLLinFxOmYVncqd8HV2ZCMrSigdKqSH9AMRtghi+pWaWs2SmZhxY+ftW/HcK7DSec8QX8jrNcOgbQ/w/4rJddJZWwLLSH551zAQW3eZDzI2XfLJHxzlGY0cNzMbRr66L8svHdsxx4AXMPqWqEQXXByn/C1FjvA0rC4W8hJd6F7MfNSuqp7qbl6cj0gGwDCYf6TcRF7lGcpiPYNda4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcTCg7DACWdi7lAP9hXbw6Zti1cSuKlcTSd6JxU9Fe8=;
 b=TeQCA15t8uSzcQWQZwnKYDNDosWxT2EXIaPan8P0TkqqNNBjBeePkaox2i8ncCYqoWC8RW0HfV4Y/bPJY1AnwA5P/YJOMJGnPbM1i0ivx2Q873ZnSxB/GJBCfGKm+fDAQBRJOGM7ZmHbYkc1bDcK8RctfVvOy7x6f+xTXtEsRSZkOBA8sGDYQcMgT1R527v1RwR4P9ZpoDrIgLRloRYvBfk02tpo4cUIFYmld4yL9Up5nXzkcCrGi4oWCRsDwp1Km8aft0k3kq0qG6Wh2hkNADyaqjx/LqkhWNkcpNlaYe7F5Ok7VqDuTWz9AA7ryGzpt8WCmO7eOdyjwoVqYkKI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcTCg7DACWdi7lAP9hXbw6Zti1cSuKlcTSd6JxU9Fe8=;
 b=G4aoxtRI6gTK2wduJ2lRFe5bMtw5mGWyNuUJgGUnhk2gYPvUUHZB6iKiYuPzQNPAWIzLeKqAZa+o6Vgoz304JK7IqiDLFeNSUtO9WIV2x9OJhYLChdibkekWjk2ajo+hgNrcpSxj+Zf7e8ZkUN+RwuTWaHSKbnPyH+x7MbNvVvwRG03Kmf8Uef+c/tBTfdjbv9LjSZJI3FTEijEzJUc4967MEVwY/nokFxIZLMIu70c7pdc514SZ897kqeYPj4lDiBm7jw+blxI9vBkOYri/OGUAhOePZnLiafqdb8niUSxxEO60l+2QMaBWVTsjVrMV+3SpYqEu6duZ58BAl/QlpQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0SPR01MB14.eurprd03.prod.outlook.com (52.134.87.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 16:33:59 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 16:33:59 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2] xen/arm: domain_build: Print the correct domain in
 dtb_load()
Thread-Index: AQHVU48ONo2MoESitEeN0SnmZLqftKb9+a8A
Date: Fri, 16 Aug 2019 16:33:59 +0000
Message-ID: <87wofdf4sp.fsf@epam.com>
References: <20190815172944.14163-1-julien.grall@arm.com>
In-Reply-To: <20190815172944.14163-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e6e5a48-c008-4c86-1311-08d722678a50
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0SPR01MB14; 
x-ms-traffictypediagnostic: AM0SPR01MB14:|AM0SPR01MB14:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0SPR01MB14CBF62D523BAD380BFF34E6AF0@AM0SPR01MB14.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(189003)(199004)(91956017)(64756008)(66946007)(66476007)(2616005)(81166006)(6486002)(66556008)(66446008)(8676002)(54906003)(14454004)(6436002)(81156014)(66066001)(486006)(71200400001)(6916009)(71190400001)(2906002)(8936002)(76116006)(86362001)(256004)(229853002)(6512007)(5660300002)(55236004)(80792005)(26005)(478600001)(102836004)(186003)(6246003)(6506007)(4326008)(53936002)(7736002)(305945005)(107886003)(446003)(99286004)(6116002)(11346002)(3846002)(25786009)(76176011)(476003)(316002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB14;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Av4Ex3ihaydmv+cx2FYyQUSAZUet0+IQmbu7YwUikB7D4HF0s38RNJiT6eLqWeFKRQFnWlmopFUTWCCPYPDzqEmo0s65s6uaJ1BdeUzTFqylTCeFDKvwyUfbeHnK9NC9ixFi7TDFMk65GwlBLrO1F9J7K0bzwncVj7vwJJOsX573ou8EmMGdJVQTiFx/++9Lv1sZEyuLGx4IxLzFNF+8utcYY/98eRytvPwSsI1v5RXjiPspz0IK+aXvZIv6nX9vN5pmfW1HNhTgq55j+ad3gzPZFA6ltrJbEpq3/0Q9JpZ1Iov8ZwMQFOo4f/yuWmOdD8mqF4ZgKcH8T2xsL2i97hrLNMHtbf5xOLqje1ckxmVhWQkm5rkP4Pqqb/VScpdz3T8HqeTfT0X8IfP/6Q/GmlxAg8E/joZ8HOZf8JNkW6M=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6e5a48-c008-4c86-1311-08d722678a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 16:33:59.2970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/EgLvTweoQoHBoAQRXYud4uNm0jSe1Ayqx5waYQlvEUImNnWyt+ZDxHADLDSDHSVDHgeqKmABxlCStI3NayIEMyz7ldpBgt0Msg0g12k44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB14
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: domain_build: Print the correct
 domain in dtb_load()
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IGR0Yl9sb2FkKCkgY2FuIGJlIGNhbGxlZCBieSBvdGhl
ciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9pZCBjb25mdXNpb24KPiBpbiB0aGUgbG9nLCBwcmlu
dCB0aGUgY29ycmVjdCBkb21haW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9k
eW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAg
ICAgICAgLSBGaXggdGhlIHNlY29uZCBwcmludCBpbiB0aGUgZnVuY3Rpb24gYXMgd2VsbC4KPiAt
LS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgOCArKysrKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Ywo+IGluZGV4IDRlNTFlMjI5MjcuLjEyNjM3NGY2MDMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4g
QEAgLTE3ODcsMTUgKzE3ODcsMTcgQEAgc3RhdGljIHZvaWQgX19pbml0IGR0Yl9sb2FkKHN0cnVj
dCBrZXJuZWxfaW5mbyAqa2luZm8pCj4gIHsKPiAgICAgIHVuc2lnbmVkIGxvbmcgbGVmdDsKPiAg
Cj4gLSAgICBwcmludGsoIkxvYWRpbmcgZG9tMCBEVEIgdG8gMHglIlBSSXBhZGRyIi0weCUiUFJJ
cGFkZHIiXG4iLAo+IC0gICAgICAgICAgIGtpbmZvLT5kdGJfcGFkZHIsIGtpbmZvLT5kdGJfcGFk
ZHIgKyBmZHRfdG90YWxzaXplKGtpbmZvLT5mZHQpKTsKPiArICAgIHByaW50aygiTG9hZGluZyAl
cGQgRFRCIHRvIDB4JSJQUklwYWRkciItMHglIlBSSXBhZGRyIlxuIiwKPiArICAgICAgICAgICBr
aW5mby0+ZCwga2luZm8tPmR0Yl9wYWRkciwKPiArICAgICAgICAgICBraW5mby0+ZHRiX3BhZGRy
ICsgZmR0X3RvdGFsc2l6ZShraW5mby0+ZmR0KSk7Cj4gIAo+ICAgICAgbGVmdCA9IGNvcHlfdG9f
Z3Vlc3RfcGh5c19mbHVzaF9kY2FjaGUoa2luZm8tPmQsIGtpbmZvLT5kdGJfcGFkZHIsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBraW5mby0+ZmR0LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmR0X3RvdGFsc2l6ZShr
aW5mby0+ZmR0KSk7Cj4gIAo+ICAgICAgaWYgKCBsZWZ0ICE9IDAgKQo+IC0gICAgICAgIHBhbmlj
KCJVbmFibGUgdG8gY29weSB0aGUgRFRCIHRvIGRvbTAgbWVtb3J5IChsZWZ0ID0gJWx1IGJ5dGVz
KVxuIiwgbGVmdCk7Cj4gKyAgICAgICAgcGFuaWMoIlVuYWJsZSB0byBjb3B5IHRoZSBEVEIgdG8g
JXBkIG1lbW9yeSAobGVmdCA9ICVsdSBieXRlcylcbiIsCj4gKyAgICAgICAgICAgICAga2luZm8t
PmQsIGxlZnQpOwo+ICAgICAgeGZyZWUoa2luZm8tPmZkdCk7Cj4gIH0KCgotLSAKVm9sb2R5bXly
IEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
