Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED99C04A4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:53:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDolv-0001pQ-0D; Fri, 27 Sep 2019 11:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDolt-0001pK-6H
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:50:49 +0000
X-Inumbo-ID: 0b703d4e-e11d-11e9-97fb-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::605]) by localhost (Halon) with ESMTPS
 id 0b703d4e-e11d-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 11:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nItuDXEbRuQXv8W5q6WxLNyk6Pvc1EDvRR6eG8QbzKs1mKsx+dQNlzddZy1b0QXZzwKchWlHfviTp4G7BFopMfIolWXp1v/DFhIq728kdJK+Vn0O+488w7DmUWE8eAxCXF8b8Suf0hET2zN0VAZLzbLhHdFRwBRwAmu1JyJpIVEnkoSNfTMhmL/vf7pOS47ZDt81ZO/+1lSRJsiXmVJfUEqhIf3PEeOFAeMe7y8JqeBU7X8pctjvZ8Z3jfcBLLyufm8LYQRFf3pObnpoVUi+ZUA7Qyu4r4ddZ5KcJ30Phe9Yd6Tnqq8UuF41R6ay9j7onj4nZlfgxVZG1BKkotameg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtQ60bsOsIosOOffnP6lOR7+sfAtlMOac6AR6rbiaIY=;
 b=jrBPOosafz8tz++tVl1xuFBSmf7NoWAqTSjCGY1EtOf5Zt9M+2Q6EIjWvADNHworiVASiUEBPy2pJhBLEMC5jk+rcOvdIL5eWacClzs6uCZ5XcgyZvL2CvpHGT2mUqWsaGOWk7FVTlA+q7jHEq/IFeSzmPC7t5NfCbIplzryymog7vyqyRP74iIEd6xomH7D9Y8tZiwHokzP6MNafo1+/M6z/ip+s4Z/asbK4z8aZJyUf/YHhddEKsvOGXZxBWaA0nVxukPNuohD14KM5/uFtTZwfl4S+f91lJDo0rKu8XthxeyDk2Tg5vdeIH7QdMTpd+qJWaru9rjG3Ela04Dtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtQ60bsOsIosOOffnP6lOR7+sfAtlMOac6AR6rbiaIY=;
 b=UHUVp/JKTOWBI55jrbf35/RG97Gq8iOeE84B0Gj782M5/nsPnirjpopdhAZ+r0sAfU9J/o8oAgi/ez6ufc6EVeiRHsQ/UeG1FbpnTjjcaei13FVSjqUWA4BLI5I0akEelwbl/EkRxAwix5vKhCFhQEFUsGjRfiUKblPjr69pi/w=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5828.eurprd03.prod.outlook.com (20.179.39.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 11:50:45 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 11:50:45 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 05/10] xen/arm: alternative: Remove unused
 parameter for alternative_if_not_cap
Thread-Index: AQHVdJmTi9yvxhZTwkmjCGEisiAocqc/amMA
Date: Fri, 27 Sep 2019 11:50:45 +0000
Message-ID: <87zhiq7yaz.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-6-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-6-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7762b010-d95d-4351-59b7-08d74340ee9f
x-ms-traffictypediagnostic: AM0PR03MB5828:|AM0PR03MB5828:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB582849D72DAD58E36ABF57D8E6810@AM0PR03MB5828.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(25786009)(3846002)(6116002)(2906002)(6512007)(229853002)(256004)(6436002)(6486002)(80792005)(486006)(36756003)(478600001)(54906003)(316002)(5660300002)(55236004)(186003)(26005)(102836004)(76116006)(91956017)(4326008)(66476007)(66446008)(64756008)(66556008)(66946007)(66066001)(2616005)(446003)(11346002)(476003)(14454004)(6506007)(99286004)(76176011)(71200400001)(8936002)(71190400001)(8676002)(81156014)(81166006)(107886003)(6246003)(86362001)(305945005)(7736002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5828;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHLrNgYqyZLM0pXiR1qYMmlLaHM2YfmOUbhONl1CLKNLPft56qr4pC1Z68zvzOK1H6KsYa38enGxYxDqRuyt3eRpaMjwt27uCHgKiERhDUKosZKpPbnfv9X++CBLcSzwWKBat7KMzfA9QfRBJoUp/ExgDoxNx+jGkDOhcs+d/Zm+E7XMCNfmTPu+QkwalkR+r5lbrxsM6tJ82SOByorvIdqlzkBSFFqWCGqsbaTPMCNU0VTTfPlX5BDECFjmBamrMRjj1nMu7xByVxF/F7xcnct4UTfkvFCAXJVDvONqCf39HRQqq4VrsTmVsXd8BmJLmkW94ytvW6nEi0Ceenuk8J5a/7H0lovbyfiOkXxaG7LiFam1aQyeTjw2i+sDOLYS5VLigkLEdBIz2S8SmmerJp1RSEjR2YZ/GUh0N9zV9xU=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7762b010-d95d-4351-59b7-08d74340ee9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:50:45.5413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQezQpIz6JFQadPejA2BZlXAYWLJsnn2IkwC4aRpbfYaWTrKT3jzl3+xrV4PzsJV8StpQJHItqpfCQ0tXwuOGJwjfHCFSXOX28tZRLtxxVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5828
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 05/10] xen/arm: alternative:
 Remove unused parameter for alternative_if_not_cap
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
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IFRoZSBtYWNybyBhbHRlcm5hdGl2ZV9pZl9ub3RfY2Fw
IGlzIHRha2luZyB0d28gcGFyYW1ldGVycy4gVGhlIHNlY29uZAo+IHBhcmFtZXRlciBpcyBuZXZl
ciB1c2VkIGFuZCBpdCBpcyBoYXJkIHRvIHNlZSBob3cgdGhpcyBjYW4gYmUgdXNlZAo+IGNvcnJl
Y3RseSBhcyBpdCBpcyBvbmx5IHByb3RlY3RpbmcgdGhlIGFsdGVybmF0aXZlIHNlY3Rpb24gbWFn
aWMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15ci5iYWJjaHVrQGVwYW0u
Y29tPgoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9hbHRlcm5hdGl2ZS5oIHwgNCArLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZlLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL2FsdGVybmF0aXZlLmgKPiBpbmRleCBkZWRiNmRkMDAxLi4yODMwYTZkYTJkIDEw
MDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYWx0ZXJuYXRpdmUuaAo+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vYWx0ZXJuYXRpdmUuaAo+IEBAIC0xMTYsMTMgKzExNiwxMSBAQCBp
bnQgYXBwbHlfYWx0ZXJuYXRpdmVzKGNvbnN0IHN0cnVjdCBhbHRfaW5zdHIgKnN0YXJ0LCBjb25z
dCBzdHJ1Y3QgYWx0X2luc3RyICplbgo+ICAgKiBUaGUgY29kZSB0aGF0IGZvbGxvd3MgdGhpcyBt
YWNybyB3aWxsIGJlIGFzc2VtYmxlZCBhbmQgbGlua2VkIGFzCj4gICAqIG5vcm1hbC4gVGhlcmUg
YXJlIG5vIHJlc3RyaWN0aW9ucyBvbiB0aGlzIGNvZGUuCj4gICAqLwo+IC0ubWFjcm8gYWx0ZXJu
YXRpdmVfaWZfbm90IGNhcCwgZW5hYmxlID0gMQo+IC0JLmlmIFxlbmFibGUKPiArLm1hY3JvIGFs
dGVybmF0aXZlX2lmX25vdCBjYXAKPiAgCS5wdXNoc2VjdGlvbiAuYWx0aW5zdHJ1Y3Rpb25zLCAi
YSIKPiAgCWFsdGluc3RydWN0aW9uX2VudHJ5IDY2MWYsIDY2M2YsIFxjYXAsIDY2MmYtNjYxZiwg
NjY0Zi02NjNmCj4gIAkucG9wc2VjdGlvbgo+ICA2NjE6Cj4gLQkuZW5kaWYKPiAgLmVuZG0KPiAg
Cj4gIC8qCgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
