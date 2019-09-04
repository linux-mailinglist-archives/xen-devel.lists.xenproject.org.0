Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A2A835E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:08:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Uxq-0007tv-7s; Wed, 04 Sep 2019 13:04:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MQog=W7=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i5Uxo-0007to-Hc
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:04:44 +0000
X-Inumbo-ID: 8f8c6c80-cf14-11e9-b299-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f8c6c80-cf14-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 13:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI4GiRG2VTHHXjO5LubAwxDzTNCXaLrSLF5diWZpfIu2H/Vn3bf2cx4apNwYkjxUTrDgImPVqJ7Q2M+EuexMkpznQVtXNtmILlug6uFrrjCw6ySYMHO8SXyBihMK127Nb1QHKnx3OkBY344x2krNj2Z0m3VUzC2xj3fJr9CPrv5ctNjvbLl9zrz3HL+hrZrwxxFfbx7vpSC9lCpXOW6lKLmFO6iULMIJ6uyvJDFiO0Q+R1yrHjpMjwwLrzrs8IPxX+FZlmT7QF0O8TMoGrliyIXkH0Tz/EwmPKsmRj3XzuqX2LxNYAJZUiBJtklZrxdltVsFnJI9rNqth9Ipr0zwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aejMxFIf6kHldZFk12AtA6N7cRWzt3bbP2YNZ+fBK8E=;
 b=B77dMFN5TpCaB814QwQ5uH8qPFJGSIySiyf0zGWXHLbmBB/ca7SDFTz1+/ARfdKGiFvHd/1kJOMUA/p1azlYchbmSyXT9/S6qfh6RxwLiTiFeh+m/0SveaFo/RsMGbjUnfOzSpU6Dgh1wGWUZ83wTPOS20eKyj6Czdessu/YHWqS6AXf45bI1A70vFaJtooblCUBemG/okXBHBFzn4WkwDPkbr3NY9Aem4uAGMAG9+F6aWfyQfZGB0LiACgXyuRB9lzPo0TApMUb0Mtz7o5Oa8oKaumh2dMEH6/CTdpmvfs55RJgxVaRIxp3dbAwhACDVLN42Gi4BaeZSkIr8SZF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aejMxFIf6kHldZFk12AtA6N7cRWzt3bbP2YNZ+fBK8E=;
 b=vKsQMol86oLyVvmNPPacGx4j90TVE7kJXDQS7luCcOn9aRokicgLyCk1oRta0pBvNVBaTT1MaoqDOZ0u9D2+/z8LptJr0HBHHje114/HG+WagMYGudwXnTbnJnWbuV/n0cj2BAIibBufdBv8GzUY2GsnNVWeOuPxGWAm23nWTH0=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5752.eurprd02.prod.outlook.com (10.141.171.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Wed, 4 Sep 2019 13:04:41 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 13:04:41 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v1] x86/altp2m: Add hypercall to create a new view and
 set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqcaHHgAgAGBDgD//9RLAIAADgGA
Date: Wed, 4 Sep 2019 13:04:41 +0000
Message-ID: <f7034f7b-95a2-474a-913b-99665f1ddc2d@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
 <813b92ae-0f4a-22ec-db30-6c43be246708@suse.com>
In-Reply-To: <813b92ae-0f4a-22ec-db30-6c43be246708@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:101:16::29) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2680d9f5-2c0c-4145-716b-08d731387305
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5752; 
x-ms-traffictypediagnostic: AM7PR02MB5752:|AM7PR02MB5752:|AM7PR02MB5752:
x-microsoft-antispam-prvs: <AM7PR02MB575244196138EAE55637E042ABB80@AM7PR02MB5752.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(396003)(366004)(136003)(51444003)(189003)(199004)(229853002)(26005)(11346002)(6486002)(478600001)(14454004)(6246003)(446003)(6916009)(102836004)(86362001)(53936002)(31696002)(186003)(66476007)(66446008)(64756008)(66946007)(66556008)(31686004)(6116002)(3846002)(4326008)(14444005)(6512007)(76176011)(386003)(53546011)(8676002)(81166006)(6436002)(99286004)(36756003)(52116002)(71190400001)(71200400001)(2906002)(7416002)(256004)(316002)(66066001)(54906003)(6506007)(5660300002)(486006)(476003)(2616005)(8936002)(7736002)(305945005)(81156014)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5752;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JMqOaVHefdS7FwYQPyfIKBeFNotbVrp9JeT1w0oP20iszSCw4PXsWZFDJ7dXpjoUrqw1/ADGitMhzSEhkpmiNpdWfYFrGrsIfwlDapVlC2xDQHfgJZUnUfy4MGvqLREtsvJFQ+KKU92m0AW7KGIeSSfl7u6Qxj541GPw6pRR7hj+D2EfJW3BeJZVddd9leGgnxg+VeDfCvPp97p5qkaZ3w08QFFvW1nKKVOevGks6o0fSONulhPnwHEc9pizlTM+Kq3kNVqnA65bVsZgu6lWjc7ZqSdyuyRHCzlB1RvHDQn08VA9pfOT/mwXwQh/pK+Fpn3yi5snVcGRbwAlEHNyuEGoQYYL7P2Thm6SqmyCG77eGx1j7f/RQF08CVfJ6xJLpdyGJ0gz/BISmQBcEH/ybEprX4ulM3vQY3t7afvuSdo=
Content-ID: <C66C336598B4C64BBB18D8C125548D1F@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2680d9f5-2c0c-4145-716b-08d731387305
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 13:04:41.5862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oGXSeGHn+mf6+cMRnbB35xqz1KqBfm74AKUJUzMuEI7nDVfXp3x2yJCRbQr27/c5KTLihJCPMh+TJX4lC0cuFRV4OYRVigum8SVIMvMGiJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5752
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA0LjA5LjIwMTkgMTU6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wOS4y
MDE5IDEzOjUxLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MDMuMDkuMjAxOSAxODo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDIuMDkuMjAxOSAx
MDoxMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IEBAIC0xMzU1LDYgKzEz
NTUsMjMgQEAgdm9pZCBwMm1faW5pdF9hbHRwMm1fZXB0KHN0cnVjdCBkb21haW4gKmQsIHVuc2ln
bmVkIGludCBpKQ0KPj4+PiAgICAgICAgZXB0ID0gJnAybS0+ZXB0Ow0KPj4+PiAgICAgICAgZXB0
LT5tZm4gPSBwYWdldGFibGVfZ2V0X3BmbihwMm1fZ2V0X3BhZ2V0YWJsZShwMm0pKTsNCj4+Pj4g
ICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbaV0gPSBlcHQtPmVwdHA7DQo+Pj4+ICsNCj4+Pj4g
KyAgICBpZiAoIHNldF9zdmUgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgdW5zaWduZWQg
bG9uZyBnZm4gPSAwLCBtYXhfZ3BmbiA9IGRvbWFpbl9nZXRfbWF4aW11bV9ncGZuKGQpOw0KPj4+
PiArDQo+Pj4+ICsgICAgICAgIGZvciggOyBnZm4gPCBtYXhfZ3BmbjsgKytnZm4gKQ0KPj4+PiAr
ICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAgICBtZm5fdCBtZm47DQo+Pj4+ICsgICAgICAgICAg
ICBwMm1fYWNjZXNzX3QgYTsNCj4+Pj4gKyAgICAgICAgICAgIHAybV90eXBlX3QgdDsNCj4+Pj4g
Kw0KPj4+PiArICAgICAgICAgICAgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkocDJtLCBfZ2Zu
KGdmbiksICZtZm4sICZ0LCAmYSwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEFQMk1HRVRfcXVlcnkpOw0KPj4+PiArICAgICAgICAgICAgcDJtLT5zZXRfZW50
cnkocDJtLCBfZ2ZuKGdmbiksIG1mbiwgUEFHRV9PUkRFUl80SywgdCwgYSwgdHJ1ZSk7DQo+Pj4+
ICsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+PiArICAgIH0NCj4+Pj4gICAgfQ0KPj4+DQo+Pj4gSG93
IGxvbmcgaXMgdGhpcyBsb29wIGdvaW5nIHRvIHRha2UgZm9yIGEgaHVnZSBndWVzdD8gSU9XIGhv
dw0KPj4+IGNvbWUgdGhlcmUncyBubyBwcmVlbXB0aW9uIGluIGhlcmUsIG9yIHNvbWUgb3RoZXIg
bWVjaGFuaXNtDQo+Pj4gdG8gYm91bmQgZXhlY3V0aW9uIHRpbWU/DQo+Pg0KPj4gQmVjYXVzZSB0
aGlzIGlzIGRvbmUgZm9yIHRoZSBpbml0aWFsaXphdGlvbiBvZiBhIG5ldyB2aWV3IGFuZCB0aGUg
cDJtIGlzDQo+PiBsb2NrZWQuDQo+IA0KPiBXZWxsLCB0aGlzIG1ha2VzIGhhbmRsaW5nIHRoaXMg
dGhlIHdheSB5b3Ugd2FudCBpdCBjbG9zZSB0bw0KPiBpbXBvc3NpYmxlLCBidXQgaXMgbm90IGFu
IGFyZ3VtZW50IGFnYWluc3QgdGhlIG5lZWQgZm9yIHByZWVtcHRpb24NCj4gaGVyZS4gSnVzdCBs
aWtlIGl0IGhhZCB0dXJuZWQgb3V0IHRvIGJlIHVucmVhc29uYWJsZSB0bw0KPiBwcmVlbXB0aXZl
bHkgaGFuZGxlIG90aGVyIFAyTSBhZGp1c3RtZW50cyAod2hpY2ggaXMgd2h5DQo+IHAybS1lcHQu
YzpyZXNvbHZlX21pc2NvbmZpZygpIGFuZCBwMm0tcHQuYzpkb19yZWNhbGMoKSBnb3QNCj4gaW50
cm9kdWNlZCksIEknbSBhZnJhaWQgeW91J2xsIGhhdmUgdG8gdXNlIHNvbWUgb3RoZXIgdGVjaG5p
cXVlDQo+IGhlcmUgKHBvc3NpYmx5IGJ1aWxkaW5nIG9uIHRvcCBvZiB0aGUgbWVudGlvbmVkIGZ1
bmN0aW9ucykuDQo+IA0KDQpJIHRoaW5rIHRoYXQgdGhlIG1lY2hhbmlzbSBmcm9tIHAybV9zZXRf
bWVtX2FjY2Vzc19tdWx0aSgpIGNhbiBzdWl0IHRoaXMgDQpjYXNlLCBzdGFydCB0aGUgbG9vcCwg
c2V0ICxpZihoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpKSByYyA9IA0KbmV4dF91bnNldF9nZm47
DQoNCkFuZCBmb3IgdGhpcyB0byB3b3JrIGl0IHNob3VsZCBoYXZlIGEgbmV3ICJzdGFydF9nZm4i
IHBhcmFtZXRlciBzbyB0aGUgDQpjYWxsZXIgY2FuIGlzc3VlIG11bHRpcGxlIGh5cGVyY2FsbHMg
dW50aWwgZ2ZuID09IG1heF9nZm4uDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
