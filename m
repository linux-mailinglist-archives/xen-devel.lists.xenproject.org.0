Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC78B6B21
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:54:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAf2S-0006A1-G8; Wed, 18 Sep 2019 18:50:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAf2R-00069w-Db
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:50:51 +0000
X-Inumbo-ID: 3b532d0c-da45-11e9-a337-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b532d0c-da45-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 18:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAtyTEIVaax5cIRG/jOlISmCzulHeQjB4SGjU6Xd1diji9y2Q4FkWvB49rdL5NJPTtyupjO0arRERBdcSyjZljBolf+3MpPgKa9fV9m17D4rq3YaelfQ+2ZszuCrfNQTZCNvdUjBkSyf5u9D7BUCdShj+J1pQsty/1BwNUnMUM3xkHZijM9W37SCD34dwKPYjev3rHJeTS4K3lcVBu9lfZMzSaqMWihcDWgCYPeSwn8XbWjz41G0nt8bRc1Gw5SHCW4jl45dnX/aQHbyZWiIuHkYVz7dGmH+Cx9ZPia2yK60iUQhmgwf8WWH0Evr0B2ZRM/8QzIppT1KE9LEJDkmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ili6GR/gqyWQWG2AoYUt7R83ZmHOeSQjsJ8GDuCqVY=;
 b=ao294wguwSrP3JRgN/SmCAmSQv0/6f5/QyRdMxj7d2GO5tFy7QuC44YmmRS4KCI7H0vGxLKTku3ipvPgU55Q4zSH5h7CVPrwyVnvSVqu7/9nFDzXz+qtccqVgyOpIgA3VD01WcNXR49IoRSAJvX7iHw50yfBa+6jHum3D7EvYzc+s7e9ffaAzTDXD2guVRgoAgkPisQinovg1Z1NpXrK2agi23aXBVKkw2f6ITC7sL2MJ9OuIXe23SLsGCTi/Zz34OPstWg4QQR+Z2Pt7/0/rsRQ7wCUegKZKp0w/CRKEYJUFDoCUpgo8UUGuBYloVo3zPxz4cPGRNwkxpy9HsrSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ili6GR/gqyWQWG2AoYUt7R83ZmHOeSQjsJ8GDuCqVY=;
 b=FSkI45OeToFBL3titnjEWbBoJ1XUrZPl78nWdFHUoqJU5DfEGrn02ozBD+tKR30dDoastIE8xdmqckMyj98/4Ce237ciLt+clKNMSXMmyZWEhCpMwhx3OaVH5DFJTtUUe7lOtmhVHT2NQRi5YuMCzNDg5qA9nB0TwHOOZoO4TLg=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5761.eurprd03.prod.outlook.com (20.179.252.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 18:50:48 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 18:50:48 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 0/6] arch/arm: optee: fix TODOs and change status to
 "Tech Preview"
Thread-Index: AQHVblH8i61pl6vNQkm74GnHH+XmdA==
Date: Wed, 18 Sep 2019 18:50:48 +0000
Message-ID: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b7ae7ec-4e87-4357-7e2b-08d73c691ef5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5761; 
x-ms-traffictypediagnostic: AM0PR03MB5761:|AM0PR03MB5761:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM0PR03MB5761D6910F838C545022CB77E68E0@AM0PR03MB5761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(66476007)(6116002)(478600001)(14454004)(66446008)(80792005)(2616005)(55236004)(8936002)(966005)(6306002)(66066001)(5660300002)(2501003)(81156014)(305945005)(7736002)(81166006)(66556008)(8676002)(256004)(71200400001)(14444005)(71190400001)(99286004)(54906003)(1076003)(86362001)(26005)(6512007)(5640700003)(2906002)(186003)(102836004)(3846002)(64756008)(76116006)(2351001)(91956017)(6506007)(25786009)(486006)(7416002)(66946007)(36756003)(476003)(4326008)(316002)(6436002)(6486002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5761;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2kA26dy8I6cDEyevFLlN70l0l6NdU/TmK+QekVxznfeQjfAB0gIwnGGWF5AAWwXZWmROm0fCPabQMvdvg41/tg8dwawp96Y+zfwiI3UidmvYazTpwBpT8Znk2UwkG+EmkQX05nquX+csVzOKgRcHB1XXy2/pmhlHgTMsoehIeKq++AfV0drXMP2aLaRKBraZPkmXDNgMlt/Gsp0RErYWXmHtOYGWDkD0VteP6uzmeJKHlyQpDRXIoUPY4TtS4xwoTgg76zQGcugig5uLAKin8MUteGOfsLtZYvm1YHEIO1uitypBMH+DM4YguR7g0182/3G/Ualo6Et8T42fZLa5gLBRt7ZmcQoNauQIXTQ+VvqNdX5fB5fxv3rUUajWp8proAlt8Ab+sThywEtgAEeVgcV6mQzujSGMYR3wZYr/wEc=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7ae7ec-4e87-4357-7e2b-08d73c691ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 18:50:48.3533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Cp7ACO/aYcLnHrE2FI7qAwHQb2KP96vfFaGSmf8gYVkze4WlxKMQv79GUibuSvnxVgsiEmQ0t4w42e0z2EWUoBE6lwaFbKBhCmKmF3+p88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5761
Subject: [Xen-devel] [PATCH v2 0/6] arch/arm: optee: fix TODOs and change
 status to "Tech Preview"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGlzIGlzIHRoZSBzZWNvbmQgdmVyc2lvbiBmb3IgbWF0dXJpbmcgdGhlIE9QLVRF
RSBtZWRpYXRvci4KCkNoYW5nZXMgYWxzbyBjYW4gYmUgcHVsbGVkIGZyb20gWzJdLgoKQ2hhbmdl
cyBmcm9tIHYxOgogLSBBZGRlZCBwYXRjaCB0aGF0IHVwZGF0ZXMgU1VQUE9SVC5tZAogLSBJbnN0
ZWFkIG9mIHJlbW92aW5nICJleHBlcmltZW50YWwiIHN0YXR1cyBJIGNoYW5nZWQgaXQgdG8gIlRl
Y2ggUHJldmlldyIKIC0gT3RoZXIgY2hhbmdlcyBhcmUgZGVzY3JpYmVkIGluIHRoZSBjb3JyZXNw
b25kaW5nIHBhdGNoZXMKCkNvdmVyIGxldHRlciBmb3IgdjE6CgpUaGlzIHBhdGNoIHNlcmllcyBm
aXhlcyB2YXJpb3VzIHVuZmluaXNoZWQgaXRlbXMgaW4gdGhlIE9QLVRFRSBtZWRpYXRvci4KTW9z
dGx5IHRoaXMgaXMgYWJvdXQgbGltaXRpbmcgcmVzb3VyY2VzIHRoYXQgZ3Vlc3QgY2FuIGNvbnN1
bWUuIFRoaXMKaW5jbHVkZXMgYm90aCBtZW1vcnkgYW5kIHRpbWUgLSBob3cgbWFueSBidWZmZXJz
IGd1ZXN0IGNhbiBzaGFyZSB3aXRoCk9QLVRFRSAodGhpcyB1c2VzIFhlbiBtZW1vcnkpIGFuZCB3
aGVuIG1lZGlhdG9yIHNob3VsZCBwcmVlbXB0IGl0c2VsZiwKdG8gbWFrZSBzdXJlIHRoYXQgZ3Vl
c3QgZG9lcyBub3Qgc3RyZXNzIHNjaGVkdWxpbmcuCgpBcGFydCBmcm9tIHRoaXMsIHRoZXJlIHdl
cmUgb25lIGNhc2UsIHdoZW4gbWVkaWF0b3IncyBhY3Rpb25zIG1pZ2h0IGxlYWQKdG8gbWVtb3J5
IGxlYWsgaW4gYSBnb29kLWJlaGF2aW5nIGd1ZXN0LiBUbyBmaXggdGhpcyBpc3N1ZSBJIGhhZCB0
bwpleHRlbmQgbWVkaWF0b3IgbG9naWMsIHNvIG5vdyBpdCBjYW4gaXNzdWUgUlBDIHJlcXVlc3Rz
IHRvIGd1ZXN0IGluIHRoZQpzYW1lIHdheSwgYXMgT1AtVEVFIGRvZXMgdGhpcy4gVGhpcyBpcyB1
c2VmdWwgZmVhdHVyZSwgYmVjYXVzZSBpdAphbGxvd3MgdG8gcHJlZW1wdCBtZWRpYXRvciBkdXJp
bmcgbG9uZyBvcGVyYXRpb25zLiBTbywgaW4gdGhlIGZ1dHVyZQppdCB3aWxsIGJlIHBvc3NpYmxl
IHRvIHJlbW92ZSBzaGFyZWQgYnVmZmVyIHNpemUgbGltaXRhdGlvbiwgYmVjYXVzZQptZWRpYXRv
ciBjYW4gcHJlZW1wdCBzZWxmIGR1cmluZyBidWZmZXIgdHJhbnNsYXRpb24uCgpUaGlzIHBhdGNo
IHNlcmllcyBjYW4gYmUgcHVsbGVkIGZyb20gWzFdLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9s
b3JjL3hlbi90cmVlL29wdGVlM192MQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2xvcmMveGVuL3Ry
ZWUvb3B0ZWUzX3YyCgoKVm9sb2R5bXlyIEJhYmNodWsgKDYpOgogIHhlbi9hcm06IG9wdGVlOiBp
bXBvc2UgbGltaXQgb24gc2hhcmVkIGJ1ZmZlciBzaXplCiAgeGVuL2FybTogb3B0ZWU6IGNoZWNr
IGZvciBwcmVlbXB0aW9uIHdoaWxlIGZyZWVpbmcgc2hhcmVkIGJ1ZmZlcnMKICB4ZW4vYXJtOiBv
cHRlZTogbGltaXQgbnVtYmVyIG9mIHNoYXJlZCBidWZmZXJzCiAgeGVuL2FybTogb3B0ZWU6IGhh
bmRsZSBzaGFyZWQgYnVmZmVyIHRyYW5zbGF0aW9uIGVycm9yCiAgU1VQUE9SVC5tZDogRGVzY3Jp
YmUgT1AtVEVFIG1lZGlhdG9yCiAgeGVuL2FybTogb3B0ZWU6IHVwZGF0ZSBkZXNjcmlwdGlvbiBp
biBLY29uZmlnCgogU1VQUE9SVC5tZCAgICAgICAgICAgICAgIHwgICA0ICsKIHhlbi9hcmNoL2Fy
bS90ZWUvS2NvbmZpZyB8ICAxMiArLQogeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIHwgMjU5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAy
MTMgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
