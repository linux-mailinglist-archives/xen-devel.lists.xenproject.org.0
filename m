Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80808BB92
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:32:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXn0-0001SC-0C; Tue, 13 Aug 2019 14:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FUCW=WJ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hxXmy-0001S7-Ho
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:28:40 +0000
X-Inumbo-ID: a41d53e8-bdd6-11e9-82d3-c34a96898c23
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::611])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a41d53e8-bdd6-11e9-82d3-c34a96898c23;
 Tue, 13 Aug 2019 14:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFwQ/BhpJZPf+5r5IIlfnc9SSTLIypwyEZkzZO7MHZ2palKl7eflbIJBebEY9lCY6iDVLhg5rniTeDlOKfW6dY3FdTXyr/DwJY6tDEqmphw0vlARFSmMKWHQCdCVNIbtCzZOyYMMI4CI5jilFs3fSxGf3lUCIm1cWxC48G8nKppQtOqVTMj3euZv3rQyNPXhimVufY7vGb5NgwjnxaDok9JQmPyMFqmcuh68kuxAMb6lJJlSylH/p2eXs+BCh24Yx3HbPTer+l4dFGufgG8T+4hvX4O6VPkik5GDZp8tA2KNJLtP89ne/xZyuU3D2KH4m8D6cG0GjcS/wA8fQT321Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIDXfLQsvyqREfwjbOa+ohMLkHq/EcPJ2jIZo4rU7/8=;
 b=jhVbmdlndTFlnujkddkGCxh3oo+I3kXXxQ9XcKB2UlZw2OOComO8EPCShRMuwVIOqNAe0bcPY0ktiodmIG9oT/f8IFbMAIcmWDSdpaO/y9xkyDi3kcTXa2BhifrQGU0RrX8KIjPhlya9lbrT1cLTr3/XU2DfvogflykqnovJJgXdAKYE9rOxknbiZE3RMTYb1hvviKyJQf5MXmuNeNIl/l7aPsGARGd42WVGjzuzHgzWOzFfqjC3m4BfHeAO8Kg/9AMoRlEzrUrDevl/2eNw+H7dLCpnls0bw3LHl0rA7PXjL7ClIa3mWTA3OwjIbymnRcQh5OqVS7HGwPl0YLmTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIDXfLQsvyqREfwjbOa+ohMLkHq/EcPJ2jIZo4rU7/8=;
 b=IexQKQ70xJNdKgelPl+IUHZ3Xp8bRBFqVw8jVt4oMkqBni2gT/+AE2p1M97eZHBCELJ1rft5bv7twOjdcL5FnjImCbbZwHvJsBl1KNfQCeJmgi8Cl/db2BZC8WD1N64c08Fh1lugb76oNmKYHuPNlex7o54XLuSdfsbKlm8YaWNf83/ouLsyH+puNrasVVCrxnLQ3wW7XFL15DAAuz0Oy5RGQ15ZZtATX3BMEkjoiNiWPzWWox4zu0u8u13WRcdLKpoW3GGdHNQirFxcD/n7G3s8H2G9nRzlU41lNf4+HbTtt5ha3wsQieCTnBMp5qiD4MjqmyhqAD8cyCiw/HqYMA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4596.eurprd03.prod.outlook.com (20.176.215.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 14:28:37 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 14:28:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 4/7] xen/arm: early_print_info print reserved_mem
Thread-Index: AQHVUV1RwGIKJ1SZ2E2034NZwxRA26b5JA4A
Date: Tue, 13 Aug 2019 14:28:37 +0000
Message-ID: <87d0h9gmwb.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-4-sstabellini@kernel.org>
In-Reply-To: <20190812222844.9636-4-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a0f0e3e-c4d5-4f57-e181-08d71ffa87b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4596; 
x-ms-traffictypediagnostic: AM0PR03MB4596:|AM0PR03MB4596:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4596B9CDDD417F07B3C1DAABE6D20@AM0PR03MB4596.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(80792005)(66066001)(6116002)(3846002)(2906002)(305945005)(7736002)(186003)(5660300002)(71190400001)(71200400001)(316002)(26005)(8676002)(54906003)(446003)(81156014)(66946007)(478600001)(2616005)(4326008)(6246003)(14454004)(6506007)(36756003)(55236004)(102836004)(6916009)(25786009)(256004)(8936002)(11346002)(81166006)(76176011)(6486002)(64756008)(66556008)(66476007)(99286004)(91956017)(86362001)(66446008)(6436002)(6512007)(76116006)(229853002)(486006)(476003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4596;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6zz/axiO2rinrF+3hL8kBg9w1N1pbPrEQXL9z3iaFCnoLplqH8hgSkDfdRBI5TxenDbTgRroD6k7uH/y0sk4SYVNiTKsHeQv0zSutL3jlk11oOUEH7EynEU3DZcUIRBek9gdwAWpeXUSLl0cgQEYLDOOSAQuSMp7RW4eieKheerFLY4I38lKyhliZX8uPX4wlDMScdtNiowW1hRUq2KpBdGdBgfbmjcm6MLS9RFQxH9XNgTvRYv3SkykJpdJ5+S3nxJcy2uJ2Xae2ZS2qzDIAuY5A8Gte4X1VcBWE3ceFeyiSwucJFkAC/hEG36eqQxsPYkPjqCMn1cKLLrKm/rNOhQ4goDx36HHz7kG4LEYtBZhfLnCNnuN5UhtFmSp2xssF/zxgSuT0gFto+yltU63fjQp6B8NJLN4Nd6Ns6RI4gU=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0f0e3e-c4d5-4f57-e181-08d71ffa87b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 14:28:37.3834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2Ncy2aPWsQ2YSPxJNiP4A8RhhR1Xm3I7pL/Ii5oRaQtHfk9IYrR5Bx1BzG0bU/46n/BxYCw5kUnVCxe2yKcaa4iFBsqqNGWp45iyhH1Wfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4596
Subject: Re: [Xen-devel] [PATCH v5 4/7] xen/arm: early_print_info print
 reserved_mem
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cgo+IEltcHJvdmUgZWFybHlfcHJpbnRfaW5mbyB0
byBhbHNvIHByaW50IHRoZSBiYW5rcyBzYXZlZCBpbgo+IGJvb3RpbmZvLnJlc2VydmVkX21lbS4g
UHJpbnQgdGhlbSByaWdodCBhZnRlciBSRVNWRCwgaW5jcmVhc2luZyB0aGUgc2FtZQo+IGluZGV4
Lgo+Cj4gU2luY2Ugd2UgYXJlIGF0IGl0LCBhbHNvIHN3aXRjaCB0aGUgZXhpc3RpbmcgUkVTVkQg
cHJpbnQgdG8gdXNlIHVuc2lnbmVkCj4gaW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJh
YmNodWsgPHZvbG9keW15ci5iYWJjaHVrQGVwYW0uY29tPgoKQnV0LCBwbGVhc2Ugc2VlIE5JVCBi
ZWxvdy4KCj4gLS0tCj4gQ2hhbmdlcyBpbiB2NToKPiAtIHN3aXRjaCB0byB1bnNpZ25lZAo+Cj4g
Q2hhbmdlcyBpbiB2NDoKPiAtIG5ldyBwYXRjaAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYm9vdGZk
dC5jIHwgMTEgKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIv
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IGluZGV4IDBiMGUyMmEzZDAuLjMyMTUzZTYyMDcgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKPiBAQCAtMzM3LDkgKzMzNywxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9z
Y2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LAo+ICBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJp
bnRfaW5mbyh2b2lkKQo+ICB7Cj4gICAgICBzdHJ1Y3QgbWVtaW5mbyAqbWkgPSAmYm9vdGluZm8u
bWVtOwo+ICsgICAgc3RydWN0IG1lbWluZm8gKm1lbV9yZXN2ID0gJmJvb3RpbmZvLnJlc2VydmVk
X21lbTsKPiAgICAgIHN0cnVjdCBib290bW9kdWxlcyAqbW9kcyA9ICZib290aW5mby5tb2R1bGVz
Owo+ICAgICAgc3RydWN0IGJvb3RjbWRsaW5lcyAqY21kcyA9ICZib290aW5mby5jbWRsaW5lczsK
PiAtICAgIGludCBpLCBucl9yc3ZkOwo+ICsgICAgdW5zaWduZWQgaW50IGksIGosIG5yX3JzdmQ7
Cj4gIAo+ICAgICAgZm9yICggaSA9IDA7IGkgPCBtaS0+bnJfYmFua3M7IGkrKyApCj4gICAgICAg
ICAgcHJpbnRrKCJSQU06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4gQEAgLTM2MSw5
ICszNjIsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9pZCkKPiAg
ICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAgLyogZmR0X2dldF9tZW1fcnN2IHJldHVy
bnMgbGVuZ3RoICovCj4gICAgICAgICAgZSArPSBzOwo+IC0gICAgICAgIHByaW50aygiIFJFU1ZE
WyVkXTogJSJQUklwYWRkciIgLSAlIlBSSXBhZGRyIlxuIiwKPiArICAgICAgICBwcmludGsoIiBS
RVNWRFsldV06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4gICAgICAgICAgICAgICAg
ICAgICAgIGksIHMsIGUpOwpOSVQ6IEkgc2VlIG5vIHJlYXNvbiwgd2h5IHRoaXMgcHJpbnRrIGlz
IHNwbGl0IGludG8gdHdvIGxpbmVzLCBhcyBuaWNlbHkgZml0cwppbnRvIG9uZSBsaW5lLgoKPiAg
ICAgIH0KPiArICAgIGZvciAoIGogPSAwOyBqIDwgbWVtX3Jlc3YtPm5yX2JhbmtzOyBqKyssIGkr
KyApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCIgUkVTVkRbJXVdOiAlIlBSSXBhZGRyIiAt
ICUiUFJJcGFkZHIiXG4iLCBpLAo+ICsgICAgICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFu
a1tqXS5zdGFydCwKPiArICAgICAgICAgICAgICAgICAgICAgbWVtX3Jlc3YtPmJhbmtbal0uc3Rh
cnQgKyBtZW1fcmVzdi0+YmFua1tqXS5zaXplIC0gMSk7Cj4gKyAgICB9Cj4gICAgICBwcmludGso
IlxuIik7Cj4gICAgICBmb3IgKCBpID0gMCA7IGkgPCBjbWRzLT5ucl9tb2RzOyBpKysgKQo+ICAg
ICAgICAgIHByaW50aygiQ01ETElORVslIlBSSXBhZGRyIl06JXMgJXNcbiIsIGNtZHMtPmNtZGxp
bmVbaV0uc3RhcnQsCgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
