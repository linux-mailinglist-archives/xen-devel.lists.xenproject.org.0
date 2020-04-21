Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C11B252D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 13:36:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQrB5-0004fm-Gy; Tue, 21 Apr 2020 11:34:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pWK=6F=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jQrB3-0004ff-TS
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 11:34:58 +0000
X-Inumbo-ID: 1f2bbe90-83c4-11ea-83d8-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f2bbe90-83c4-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 11:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT8rlgSniTOLPbn6PLuOc5HBNs4tPLo2opmh3ypPqT96N3vDwxfzOFBeuzYC3sQJ5LFvtdFSoWk6B+/+v3YKRga7UTmJZGX2aGr9SDuvV2YqmUvkAjT9YKWeaqj0Y5FzeveRywsKx4iITeXLrQNWDkDOk+67nIFv4eYdaGHW3OHzIeG+G5JGoSccL2aOy6ZyzyuZ8nQv0EFODnWHzI+5KrvT7+rg427ihSnawyiUWuxIrj9LJZX69vSPRwle5VMqBmTZPvRZHVov4JkDeWT32C0nWTrsmVHP629yFqfwNcz6JhUx6XDvd0J+OY/ucwi4HaughIjCDZJcS9RkpH5svA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErhIsr6nFzZAhpsCBTew5GcZqhDzEM9a0zUDFOef73c=;
 b=UTgyvoZnG3UxsPfu1vzMXzfvvxLfUOkFSWxS+iU829724sitvfNjTU2N9cTNVCFuqJZJRJvimS3LjAj6P/sdBbTzaGJldpVweomxBsK7yD5Gj58tI1s44cfUvUAXn2dBR710b4Z88JDHtHn+lX3lKO2IQ794Q4reJJif8UCP5cGKNjhhSoWkXO4EKSexpwj7cHHZQNvPgi8MxZy8gCbNF/7Gq4JXpPPFZfPG1n0z9jUgfqi8FWhv1NBxnbfPzSIuT+fAUrJj2iXCFam0H9CUVZcswS3OU4gJnd2qJIER3HA+yNht0OgHfzh8Q8K9Y9P/K2IGGyPBOJyKk25MKvQFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErhIsr6nFzZAhpsCBTew5GcZqhDzEM9a0zUDFOef73c=;
 b=Ls0yTPY/Q4dhlgwQiq6BAF0fOPPLZZ5+uNbjXpM1sWm+kbdmNE5gKDEMidhHMW3xWag1wISKjm5ABUli5P9fXTDoRTxofrzk5EUbRhvPZgSnhVL8eP6jjE+IhK3Xmh+X9QPk0qzJms0pzlAboE33aSxWpJxlERwdNmq6DtfwaI0=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4672.eurprd03.prod.outlook.com (2603:10a6:803:5e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 11:34:53 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::4144:ba6b:18cd:af5c]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::4144:ba6b:18cd:af5c%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 11:34:53 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Topic: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Index: AQHWF8n8HYXBbl5N3kSvZpSjxllEBqiDciuA
Date: Tue, 21 Apr 2020 11:34:53 +0000
Message-ID: <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com>
References: <20200421104522.GA86681@mwanda>
In-Reply-To: <20200421104522.GA86681@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7510d33f-d8a7-4207-7ead-08d7e5e802c0
x-ms-traffictypediagnostic: VI1PR03MB4672:
x-microsoft-antispam-prvs: <VI1PR03MB467219CFA5E165EB519A94F9E7D50@VI1PR03MB4672.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(36756003)(186003)(2906002)(76116006)(31696002)(478600001)(6512007)(6916009)(31686004)(6486002)(5660300002)(86362001)(54906003)(4326008)(53546011)(6506007)(66946007)(64756008)(66556008)(2616005)(66476007)(66446008)(81156014)(8936002)(26005)(316002)(8676002)(71200400001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/t49k4dydozIpZmJDDMSMx+09QzOYMeb1HIJ5ztefBVFB3AhkFKN9xtvX3cws7hC2E9ggWJGZD683KNHD6Q+0e2dBeDpMz1fsUSfW46RrYCUwvrG9V9p0vNkTTQOz9Js2enxz9WH8pKAg4N1coNQS9oZJD1mvy/T1C1kZnkby0OIMjwyyPpMuu5LkMfwT17hOMV1ctokI0eF31BUFSUm7YDFIsMj6mwfnA17hg70yq6M121XBhvOLlYbQ3lFydeRKkOWPO1zEbCi56P3Jm0eP9dpU+Er4HHwbY69ERHqbsyT5n/BUEOLxyIRvySzg1nKVdby+NroNoL63xvCiSmVvu1+h8itOWpLgjtgAaWT5yva5coD2+58nU/WB7ZK+lxRGgWbZeU5hov3FJHl+4eIFzT/LbslPhkZEVHVsRjoOUSi0dtDaclW2qqofpJs4G3
x-ms-exchange-antispam-messagedata: 6jSJmebMBwMRvLIkc69lHGdGqElXKPrTZQgL59k3o8DLVBX9k5w3Di5OVpVZXJY+5oSdrLpO2ZLKPZ2laEaEJ7K9hfh7o9aVK2DwCnJz3gXQ2GutoDm5UMVQ1tBQMPa7gTLmJ761eeudOes+W+zXSeYdCZfPcgrvNhCpD/LP91RhnbDKUAFd6c4xtTbN9ByOV8WQn7isjshauDsu3fjz6+PFiJlwzZ+lhWTZfe7U5rW9tUjE5rtZmaTzz+0qI+UDgbRkVx4XksYt22zrz64ZAGgvKW+1ni0g9k3IeLiP1Thfj6LPXHuDjtQxJvhtRc+qJbF06cqJ30ORDZWb8awaQ4fbuEe2si3wXEKviSP178jg4IbgNY6Vr8FRTYD4bVrpLjqBC0rES1J0FazchFANk61FEy4Whfxx1kvvitNpelknx2eE5EAjMDlwh01HajQ1za2xdyN7ng5saYta8vgEDQ6TXIDAXhiwSro6Grgz+5SBlz+24fCmtXdMzme0EMYrWyQl/9md+G1DmvqciuQ2n+WE1aZutJPp/QZnvEarDsqUKQPLCmjJxthdKIUr+jighWLQ2NmpyOD8+QzNPuiaX1O9PgkyWbHd5jlu1Sa4AE9yta/kgYnJ3wnOu+J9MmVo+GcZe1EQ7jBIIFLVnCnS1pM5VJefK/1QLYlFAmw/S9WUmOfRJMdnhzJGNlXEHeYSiXY4cFFQgl5v14s4nZebEWigJbbYGNMYmUAZ5lj6xGi8GW2FvVlxtFfwYv5GEgRlOs2d018Lifnq0qZZh4/RRFKfUioWORmRrcl9Pl0U9ls=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F53AA9BC003B44BAFE1919709B1AB56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7510d33f-d8a7-4207-7ead-08d7e5e802c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 11:34:53.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FiiQ2z03w/fkjEBeEHmh6+i8ShxTJdKoNHDKTGksb6qavfzZrLcjpWkgIKqlERAQhznBnqSxBBUO9ABYG6o1G3aGqXVZ9YzakxDFzHzFexjHTh0YAXf0ynLpZCXWcipe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4672
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
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yMS8yMCAxMzo0NSwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGkgS2VybmVsIEphbml0
b3JzLA0KSGkNCj4NCj4gSGVyZSBpcyBhbm90aGVyIGlkZWEgdGhhdCBzb21lb25lIGNvdWxkIHdv
cmsgb24sIGZpeGluZyB0aGUNCj4gSVNfRVJSX09SX05VTEwoKSBjaGVja3MgaW4gdGhlIHhlbiBk
cml2ZXIuDQo+DQo+IFRoZSBwYXRjaCBjNTc1YjdlZWI4OWY6ICJkcm0veGVuLWZyb250OiBBZGQg
c3VwcG9ydCBmb3IgWGVuIFBWDQo+IGRpc3BsYXkgZnJvbnRlbmQiIGZyb20gQXByIDMsIDIwMTgs
IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljDQo+IGNoZWNrZXIgd2FybmluZzoNCj4NCj4g
CWRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYzoxNDAgeGVuX2RybV9mcm9u
dF9nZW1fY3JlYXRlKCkNCj4gCXdhcm46IHBhc3NpbmcgemVybyB0byAnRVJSX0NBU1QnDQo+DQo+
IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPiAgICAgMTMzICBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKnhlbl9kcm1fZnJvbnRfZ2VtX2NyZWF0ZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LA0KPiAgICAgMTM0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSkNCj4gICAgIDEzNSAgew0KPiAgICAgMTM2ICAgICAg
ICAgIHN0cnVjdCB4ZW5fZ2VtX29iamVjdCAqeGVuX29iajsNCj4gICAgIDEzNw0KPiAgICAgMTM4
ICAgICAgICAgIHhlbl9vYmogPSBnZW1fY3JlYXRlKGRldiwgc2l6ZSk7DQo+ICAgICAxMzkgICAg
ICAgICAgaWYgKElTX0VSUl9PUl9OVUxMKHhlbl9vYmopKQ0KPiAgICAgMTQwICAgICAgICAgICAg
ICAgICAgcmV0dXJuIEVSUl9DQVNUKHhlbl9vYmopOw0KPg0KPiBUaGlzIHdhcm5pbmcgaXMgb2xk
IGFuZCBpdCdzIGFjdHVhbGx5IHRoZSByZXN1bHQgb2YgYSBidWcgSSBoYWQgaW4gbXkNCj4gZGV2
ZWwgdmVyc2lvbiBvZiBTbWF0Y2ggeWVzdGVyZGF5LiAgeGVuX29iaiBjYW4ndCByZWFsbHkgYmUg
TlVMTCwgYnV0DQo+IGlmIGl0IHdlcmUgdGhlbiB0aGUgY2FsbGVyIHdvdWxkIHJldHVybiBzdWNj
ZXNzIHdoaWNoIHdvdWxkIHByb2JhYmx5DQo+IGNyZWF0ZSBzb21lIGlzc3Vlcy4NCj4NCj4gV2hl
biBhIGZ1bmN0aW9uIHJldHVybnMgYm90aCBlcnJvciBwb2ludGVycyBhbmQgTlVMTCB0aGVuIE5V
TEwgaXMgYQ0KPiBzcGVjaWFsIGNhc2Ugb2Ygc3VjY2Vzcy4gIExpa2Ugc2F5IHlvdSBoYXZlOiAg
InAgPSBzdGFydF9mZWF0dXJlKCk7Ii4NCj4gSWYgdGhlcmUgaXMgYW4gYWxsb2NhdGlvbiBmYWls
dXJlLCB0aGVuIHRoZSBjb2RlIHNob3VsZCByZXR1cm4gLUVOT01FTQ0KPiBhbmQgdGhlIHdob2xl
IHRoaW5nIHNob3VsZCBmYWlsLiAgQnV0IGlmIHRoZSBmZWF0dXJlIGlzIG9wdGlvbmFsIGFuZA0K
PiB0aGUgdXNlciBoYXMgZGlzYWJsZWQgaXQgaW4gdGhlIGNvbmZpZyB0aGVuIHdlIHJldHVybiBO
VUxMIGFuZCB0aGUNCj4gY2FsbGVyIGhhcyB0byBiZSBhYmxlIHRvIGFjY2VwdCB0aGF0LiAgVGhl
cmUgYXJlIGEgbG90IG9mIHRoZXNlDQo+IElTX0VSUl9PUl9OVUxMKCkgY2hlY2tzIGluIHRoZSB4
ZW4gZHJpdmVyLi4uDQo+DQo+IFRoZSBvbmUgaGVyZSBpcyBjbGVhcmx5IGJ1Z2d5IGJlY2F1c2Ug
cmV0dXJuaW5nIE5VTEwgd291bGQgbGVhZCB0byBhDQo+IHJ1biB0aW1lIGZhaWx1cmUuICBBbGwg
dGhlc2UgSVNfRVJSX09SX05VTEwoKSBzaG91bGQgYmUgY2hlY2tlZCBhbmQNCj4gcHJvYmFibHkg
Y2hhbmdlZCB0byBqdXN0IElTX0VSUigpLg0KPg0KPiBUaGlzIHNvcnQgb2YgY2hhbmdlIGlzIHBy
b2JhYmx5IGNoYW5nZSBpcyBwcm9iYWJseSBlYXNpZXN0IGlmIHlvdSBidWlsZA0KPiB0aGUgU21h
dGNoIERCIGFuZCB5b3UgY2FuIGNoZWNrIGlmIFNtYXRjaCB0aGlua3MgdGhlIGZ1bmN0aW9ucyBy
ZXR1cm4NCj4gTlVMTC4NCj4NCj4gfi9zbWF0Y2gvc21hdGNoX2RhdGEvZGIvc21kYi5weSByZXR1
cm5fc3RhdGVzIGdlbV9jcmVhdGUgfCBncmVwIElOVEVSTkFMDQo+IGRyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9nZW0uYyB8IGdlbV9jcmVhdGUgfCA1OCB8ICAoLTQwOTUpLSgtMSkg
fCAgICAgIElOVEVSTkFMIHwgIC0xIHwgICAgICAgICAgICAgICAgICAgICAgfCBzdHJ1Y3QgeGVu
X2dlbV9vYmplY3QqKCopKHN0cnVjdCBkcm1fZGV2aWNlKiwgdWxvbmcpIHwNCj4gZHJpdmVycy9n
cHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgZ2VtX2NyZWF0ZSB8IDYyIHwgNDA2NTAz
NTg5Nzg0OTMwMzA0MCB8ICAgICAgSU5URVJOQUwgfCAgLTEgfCAgICAgICAgICAgICAgICAgICAg
ICB8IHN0cnVjdCB4ZW5fZ2VtX29iamVjdCooKikoc3RydWN0IGRybV9kZXZpY2UqLCB1bG9uZykg
fA0KPiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMgfCBnZW1fY3JlYXRl
IHwgNjYgfCA0MDY1MDM1ODk3ODQ5MzAzMDQwIHwgICAgICBJTlRFUk5BTCB8ICAtMSB8ICAgICAg
ICAgICAgICAgICAgICAgIHwgc3RydWN0IHhlbl9nZW1fb2JqZWN0KigqKShzdHJ1Y3QgZHJtX2Rl
dmljZSosIHVsb25nKSB8DQo+IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0u
YyB8IGdlbV9jcmVhdGUgfCA2OCB8IDAsKC00MDk1KS0oLTEpIHwgICAgICBJTlRFUk5BTCB8ICAt
MSB8ICAgICAgICAgICAgICAgICAgICAgIHwgc3RydWN0IHhlbl9nZW1fb2JqZWN0KigqKShzdHJ1
Y3QgZHJtX2RldmljZSosIHVsb25nKSB8DQo+DQo+IFNtYXRjaCB0aGlua3MgdGhhdCBnZW1fY3Jl
YXRlKCkgc29tZXRpbWVzIHJldHVybnMgTlVMTCBvciBlcnJvciBwb2ludGVycw0KPiBidXQgdGhh
dCdzIGJlY2F1c2Ugb2YgYSBidWcgaW4gdGhlIHVucmVsZWFzZWQgdmVyc2lvbiBvZiBTbWF0Y2gg
YW5kDQo+IGJlY2F1c2UgZ2VtX2NyZWF0ZSgpIHVzZXMgSVNfRVJSX09SX05VTEwoKS4NCj4NCj4g
ICAgIDE0MQ0KPiAgICAgMTQyICAgICAgICAgIHJldHVybiAmeGVuX29iai0+YmFzZTsNCj4gICAg
IDE0MyAgfQ0KPg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQoNClRoYW5rIHlvdSBmb3Ig
dGhlIHJlcG9ydCwgSSB3aWxsIHRyeSB0byBmaW5kIHNvbWUgdGltZSB0byBsb29rIGludG8gdGhp
cyANCmFuZCBjb21lIHVwIHdpdGggZml4ZXMuDQoNCkNvdWxkIHlvdSBwbGVhc2UgKHByb2JhYmx5
IG9mZi1saXN0KSBpbnN0cnVjdCBtZSBvciBnaXZlIGFueSBwb2ludGVycyB0byANCmhvdyB0byBy
ZXByb2R1Y2UNCg0KdGhlIHJlc3VsdHMgb2YgdGhlIGFuYWx5emVyIHNob3duIGFib3ZlPw0KDQpU
aGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

