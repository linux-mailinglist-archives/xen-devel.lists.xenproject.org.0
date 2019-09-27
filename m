Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC560C04BC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:58:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDorK-0002DQ-Bq; Fri, 27 Sep 2019 11:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDorI-0002DL-Q4
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:56:24 +0000
X-Inumbo-ID: d39598d2-e11d-11e9-bf31-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::61b]) by localhost (Halon) with ESMTPS
 id d39598d2-e11d-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 11:56:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdOWwx5XxxYzqyAmqKxvulDzT9xr6F3R4cWnIG5lBt+zjYUqdrsh1VWsz5s7/AVYzs6cOu3vGZpWJmLA/G2NM9q1AyxQWE5yAthUbyqZgpz4zgkXCqFEbQHjsjMAynB1GbmQS9/eyQIGdCLKtuF4YXcKMn2JTYsac1S30ZBhoxU3/CliYllSEMeDtFB4BuS//5/T5UtjZqCGU/wkgwfPD+UNuAQQoJETY2xZoL++GX9isR7Sq/9OkGjZoWAOX3N6XU97z4fW/0PFGuSkmewF4JVUhjYeqg0Q2emJVINztdlHiH85wBDMERxxXClnJlCsa3jBS4VVxXz33+ZjIhNrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnmANQSy8BM2aSSQHwa6/MFzJngV4gNSOeZUJjIVSOo=;
 b=fLsBAwisiPi5vAo502INSdmIvY54yccrB9NW2ZSQV2vKn/+dL2Vd4kKhWru6/GUINZrLAPc5cq1r8ngK6TQB85at82sLO4JKcjGO4cTJP3TowMDjBKXE4NK9kSdR6jqf6DyDqj4ZVpgQlNf3MpcbQygqmHaPBKWfFJjDjIdWvkVZLBRRuM5l0A0Hc/obl2hfQ/aUB8JafbgSgWRuvBWRQWnQtpYUB2n6Tr016OIN13kB/18HRenK2Pk648pncJCtAMGTsNuifezGwWeJwPYuLCuL4TAYe2WQtyzcqT4JRZ5QOyOrOcKrQ+xiSuz1huU9T/uOKsRR42wAQE7DmGjaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnmANQSy8BM2aSSQHwa6/MFzJngV4gNSOeZUJjIVSOo=;
 b=LeuzkbRag5TT7o2pj5E+H7aWGbwd5UxBTM52Du9WFfqnlFirSY8zK1DnuRAY6CdOPwRkN1rzz/4j9XkAq2UcV5s+xTldKitqAQuEg9HWcgN/lT6lxDc8OA7ELbmTD2yqMjlcHDKx6Chlh+JhB8X6/XhhnJuxKJmqlGPjynR6OII=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4066.eurprd03.prod.outlook.com (52.135.145.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 11:56:22 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 11:56:22 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmSz7FwOb+ZL0aIExPYLyfVU6c/a/SA
Date: Fri, 27 Sep 2019 11:56:21 +0000
Message-ID: <87v9te7y1m.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-5-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2391b700-a2f6-4335-7290-08d74341b72f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4066; 
x-ms-traffictypediagnostic: AM0PR03MB4066:|AM0PR03MB4066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB40668300A4AF8FFD5F91401DE6810@AM0PR03MB4066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(189003)(186003)(71200400001)(486006)(76176011)(91956017)(55236004)(6506007)(25786009)(14454004)(36756003)(102836004)(2906002)(6916009)(66446008)(66066001)(66556008)(476003)(66476007)(80792005)(64756008)(11346002)(316002)(7736002)(446003)(305945005)(2616005)(99286004)(81156014)(8676002)(81166006)(26005)(6116002)(3846002)(54906003)(76116006)(478600001)(86362001)(66946007)(6436002)(6486002)(6246003)(107886003)(4326008)(14444005)(6512007)(8936002)(5660300002)(71190400001)(256004)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4066;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /eRYo6crOTiJ81Ym7OkSjzy+u3gNWLQOtdgNFfNAHht6hh9D+cfgPsYfs5nBf2BaPL9m4oGS15KGUxz3TY9FcFJVlOau0aXFQYtBKqF7JcYpItmsf9Y4HDKKGXhIpnicKZi9H9C/ZvDB4ial63KyZYUtdws5AYwIyBpQtwKjUV78QW0sonK2euE/fK3AArOHuSvh9GmBjfeh8I87GIyo5YWwftZ9JBpsbLe/mZQLpbDdD02jN9j+cNsIRY9guifPKz1pgzc8dhpj/JCxQzmaXhGlU3kxc+PXbqOSYioZvD0j3o7y9uT2PRrvxMmdKsYVAdZ+2WJRox1jAoVdFQgEEQwiI4vE5QFMp/akgOvNBLY1QjjrTUt7KLAu2CautM9MRbTn+Wt6V3O63bb/1nw4N+6NzGgN3JypbZa0wcx29So=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2391b700-a2f6-4335-7290-08d74341b72f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:56:22.0470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 727jxjIakDhZTT/hIXMU86GoJu9hdx+4mtiGzUoUZSambU47IGl6tfpETbb3y5zpnoYQKWr+rk2BIyAzZAlI7fhLCNvrVucIxDXwVZlhm+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4066
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIFNTQkQgd29y
a2Fyb3VuZCBpcyByZS1lbmFibGVkIGZvciBYZW4gYWZ0ZXIgaW50ZXJydXB0cwo+IGFyZSB1bm1h
c2tlZC4gVGhpcyBtZWFucyB3ZSBtYXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29tZSBwYXJ0IG9mIHRo
ZQo+IGh5cGVydmlzb3IgaWYgYW4gaW50ZXJydXB0IGlzIHJlY2VpdmVkIGJlZm9yZSB0aGUgd29y
a2Fyb3VuZCBpcwo+IHJlLWVuYWJsZWQuCj4KPiBBcyB0aGUgcmVzdCBvZiBlbnRlcl9oeXBlcnZp
c29yX2Zyb21fZ3Vlc3QoKSBkb2VzIG5vdCByZXF1aXJlIHRvIGhhdmUKPiBpbnRlcnJ1cHRzIG1h
c2tlZCwgdGhlIGZ1bmN0aW9uIGlzIG5vdyBzcGxpdCBpbiB0d28gcGFydHM6Cj4gICAgIDEpIGVu
dGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycSgpIGNhbGxlZCB3aXRoIGludGVycnVwdHMK
PiAgICAgICAgbWFza2VkLgpJJ20gb2theSB3aXRoIHRoaXMgYXBwcm9hY2gsIGJ1dCBJIGRvbid0
IGxpa2UgbmFtZSBmb3IKZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKCkuIFJpZ2h0
IG5vdyBpdCBpcyBkb2luZyBleGFjdGx5IG9uZQp0aGluZyAtIG1pdGlnYXRlcyBTU0JELiBTbywg
bWF5YmUgbW9yZSBhcHByb3ByaWF0ZSBuYW1lIHdpbGwgYmUKc29tZXRoaW5nIGxpa2UgIm1pdGln
YXRlX3NzYmQoKSIgPwoKPiAgICAgMikgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkgY2Fs
bGVkIHdpdGggaW50ZXJydXB0cyB1bm1hc2tlZC4KPgo+IE5vdGUgdGhhdCB3aGlsZSBlbnRlcl9o
eXBlcnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoKSBkb2VzIG5vdCB1c2UgdGhlCj4gb24tc3RhY2sg
Y29udGV4dCByZWdpc3RlcnMsIGl0IGlzIHN0aWxsIHBhc3NlZCBhcyBwYXJhbWV0ZXIgdG8gbWF0
Y2ggdGhlCj4gcmVzdCBvZiB0aGUgQyBmdW5jdGlvbnMgY2FsbGVkIGZyb20gdGhlIGVudHJ5IHBh
dGguCkFzIEkgcG9pbnRlZCBpbiB0aGUgcHJldmlvdXMgZW1haWwsIGVudGVyX2h5cGVydmlzb3Jf
ZnJvbV9ndWVzdCgpIGRvZXMKbm90IHVzZSBvbi1zdGFjayByZWdpc3RlcnMgYXMgd2VsbC4KCj4g
Rml4ZXM6IGE3ODk4ZTRjNTkgKCJ4ZW4vYXJtOiBBZGQgQVJDSF9XT1JLQVJPVU5EXzIgc3VwcG9y
dCBmb3IgZ3Vlc3RzIikKPiBSZXBvcnRlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNv
dkBlcGFtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+Cj4gLS0tCj4KPiBOb3RlIHRoZSBBcm0zMiBjb2RlIGhhcyBub3QgYmVlbiBjaGFu
Z2VkIHlldC4gSSBhbSBhbHNvIG9wZW4gb24gdHVybgo+IGJvdGggZW50ZXJfaHlwZXJ2aXNvcl9m
cm9tX2d1ZXN0X25vaXJxKCkgYW5kIGVudGVyX2h5cGVydmlzb3JfZnJvbSgpCj4gdG8gZnVuY3Rp
b25zIG5vdCB0YWtpbmcgYW55IHBhcmFtZXRlcnMuClRoYXQgd291bGQgYmUgYXBwcm9wcmlhdGUg
aW4gbXkgb3Bpbmlvbi4KCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwgIDIg
KysKPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgfCAxNiArKysrKysrKysrKysrLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyBiL3hlbi9hcmNoL2FybS9hcm02
NC9lbnRyeS5TCj4gaW5kZXggOWVhZmFlNTE2Yi4uNDU4ZDEyZjE4OCAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRy
eS5TCj4gQEAgLTE3Myw2ICsxNzMsOCBAQAo+ICAgICAgICAgIEFMVEVSTkFUSVZFKCJibCBjaGVj
a19wZW5kaW5nX3ZzZXJyb3I7IGNibnogeDAsIDFmIiwKPiAgICAgICAgICAgICAgICAgICAgICAi
bm9wOyBub3AiLAo+ICAgICAgICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9S
X0VOVFJZX0VYSVQpCj4gKyAgICAgICAgbW92ICAgICB4MCwgc3AKPiArICAgICAgICBibCAgICAg
IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycQo+ICAgICAgICAgIG1zciAgICAgZGFp
ZmNsciwgXGlmbGFncwo+ICAgICAgICAgIG1vdiAgICAgeDAsIHNwCj4gICAgICAgICAgYmwgICAg
ICBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+IGluZGV4IDIwYmEzNGVjOTEuLjU4NDhk
ZDgzOTkgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiArKysgYi94ZW4vYXJj
aC9hcm0vdHJhcHMuYwo+IEBAIC0yMDA3LDE2ICsyMDA3LDI2IEBAIHN0YXRpYyBpbmxpbmUgYm9v
bCBuZWVkc19zc2JkX2ZsaXAoc3RydWN0IHZjcHUgKnYpCj4gIH0KPgo+ICAvKgo+IC0gKiBBY3Rp
b25zIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBhZnRlciBleGl0aW5nIHRoZSBndWVzdCBhbmQgYmVm
b3JlIGFueQo+IC0gKiByZXF1ZXN0IGZyb20gaXQgaXMgaGFuZGxlZC4KPiArICogQWN0aW9ucyB0
aGF0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgZXhpdGluZyB0aGUgZ3Vlc3QgYW5kIGJlZm9yZSB0
aGUKPiArICogaW50ZXJydXB0cyBhcmUgdW5tYXNrZWQuCj4gICAqLwo+IC12b2lkIGVudGVyX2h5
cGVydmlzb3JfZnJvbV9ndWVzdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiArdm9pZCBl
bnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpCj4gIHsKPiAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKPgo+ICAgICAgLyogSWYg
dGhlIGd1ZXN0IGhhcyBkaXNhYmxlZCB0aGUgd29ya2Fyb3VuZCwgYnJpbmcgaXQgYmFjayBvbi4g
Ki8KPiAgICAgIGlmICggbmVlZHNfc3NiZF9mbGlwKHYpICkKPiAgICAgICAgICBhcm1fc21jY2Nf
MV8xX3NtYyhBUk1fU01DQ0NfQVJDSF9XT1JLQVJPVU5EXzJfRklELCAxLCBOVUxMKTsKPiArfQo+
ICsKPiArLyoKPiArICogQWN0aW9ucyB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgZXhpdGlu
ZyB0aGUgZ3Vlc3QgYW5kIGJlZm9yZSBhbnkKPiArICogcmVxdWVzdCBmcm9tIGl0IGlzIGhhbmRs
ZWQuIERlcGVuZGluZyBvbiB0aGUgZXhjZXB0aW9uIHRyYXAsIHRoaXMgbWF5Cj4gKyAqIGJlIGNh
bGxlZCB3aXRoIGludGVycnVwdHMgdW5tYXNrZWQuCj4gKyAqLwo+ICt2b2lkIGVudGVyX2h5cGVy
dmlzb3JfZnJvbV9ndWVzdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiArewo+ICsgICAg
c3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Owo+Cj4gICAgICAvKgo+ICAgICAgICogSWYgd2UgcGVu
ZGVkIGEgdmlydHVhbCBhYm9ydCwgcHJlc2VydmUgaXQgdW50aWwgaXQgZ2V0cyBjbGVhcmVkLgoK
Ci0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
