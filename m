Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826607DCD7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 15:52:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBSU-0001IR-97; Thu, 01 Aug 2019 13:49:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LBr6=V5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1htBSS-0001IM-Kr
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 13:49:28 +0000
X-Inumbo-ID: 2ccfeb33-b463-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.48]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ccfeb33-b463-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 13:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByIqoupHgtlvWNO8Cj7Ytv3tumFX39jdW38nv61wkwXEx2TXqemf8aK3WnCnaKlOrhEqpJboB86T9gLxYuBj7hn4Iqr98Ht5AT/ni5FQ3cB2bIzzF01F8glxweASwPefa0DiHmak57xzPgGmfNqI7KW5PyP7dAR02bYLtqM9yuabRwfFdM9NpX+BfOrHhF9b4sKooJ5ndaYVzxq5p+JMqBHkFawPfjaw0CY2DLPTMuksbclMr53H27g/LKZrImcZisVOOmodlcDWznNX0dvCkX/2h1H1g1HPfKMKULZ7swzfEE9jTJB/enTIv6hdPTP1B0CRVuRwFb8oL4L/Bl5Rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srst0aj1z5WjrIAT2hmn+aqxcd9LY0Mrq8AdLvWWq1E=;
 b=GPQ75Ch7YAlUiUF2t8i3eDr7qv4VoTcHk8q9pBFow058MJNzMnAe8kizCYm0rCHImB9d44Aqw7oxfUo1HRN55iFUbEiWaoeZ18yMC0W2u/G7Pd8dgDD0WfAe/mNrAly89nr97MLVvlroFwRoH657RNpmhBzkwHrK8pRW8urIE2uAMoaW8Gsbec+864WvuxYfeFSBzDrUjUMo8JUj9LIiXpVG6M8HceLAlaT050HYfT3tyG7AaNE31QCoWftLOgQ+70G4jtaiEsYmLL5Fmo48qZGrqh5oXt7aAX1x+/zNNQdxLntMFfiQA9Y+vreGzEMFJDY/uS+mDM9apHuAjmsDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srst0aj1z5WjrIAT2hmn+aqxcd9LY0Mrq8AdLvWWq1E=;
 b=EyE2hu6xUKO1K47ohqAlea+N1ii2M8rfvHMUx+c42p3cDIqfvgOKSrn0HVe9TuMfpie0xFbmxtd/G2zZs79ue4KQV+rL/sTppWQI10KX3eBHEiirC1xqAYKpvShXwYbKiBsYDsqXMTxp9wLoSFenmhSbV56jIj9Q2dnCPBtlGWCXg7ULl/vhWkHp8ux6KXOG/fTGmdRyemdE6XulCn/559pF84DvrK4WZyqwFIBaUDKMApScN9/bTHOsCRWiisPL87/v+bAAmusvoZBFhmo/JwL8Dj05+kw0jvO3dML7X+kn1M6rDBSaFybFeBu6+SgtUnqllDOs+Y8p8PJPHBEBxA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6049.eurprd03.prod.outlook.com (10.255.29.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 13:49:23 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 13:49:23 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH v5 2/2] xen/arm: consolidate make_timer_node and
 make_timer_domU_node
Thread-Index: AQHVSGFtHm/XQtiLI0+V1CdTguQh+6bmTxUA
Date: Thu, 1 Aug 2019 13:49:23 +0000
Message-ID: <87zhktgfml.fsf@epam.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com>
In-Reply-To: <20190801120452.6814-3-viktor.mitin.19@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68fc9b5c-b54e-49ae-a0e3-08d716870fc5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6049; 
x-ms-traffictypediagnostic: AM0PR03MB6049:|AM0PR03MB6049:
x-microsoft-antispam-prvs: <AM0PR03MB60498922A9DF0B36FAB027A3E6DE0@AM0PR03MB6049.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(2906002)(66946007)(76116006)(91956017)(4326008)(316002)(66446008)(54906003)(107886003)(3846002)(2616005)(476003)(486006)(6246003)(86362001)(80792005)(446003)(64756008)(6916009)(6116002)(5660300002)(256004)(11346002)(66556008)(66476007)(66066001)(81156014)(81166006)(186003)(26005)(8676002)(229853002)(7736002)(6486002)(14454004)(71190400001)(68736007)(25786009)(6512007)(71200400001)(76176011)(478600001)(55236004)(8936002)(102836004)(36756003)(6436002)(305945005)(99286004)(53936002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6049;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DAZpmLrv47W0iAIm36++GzK4k7cBIoqkzNYfYelVkz5BeFnjc+9pv+ZcX3/CcDybJuWb9K7RZxAxc+YTAVU3e9joWE4gapjAWV/iB+ZDlZC1HLNj7vRnWkQ7v6G+oGNg1kj7zviPJ5LaXM8hPk4Fqm8T5dgox7JLRxXqTCyOBZVdXWwwCchCt8VYxj2Z7T27/GculG4Lq+jhMqswXOHidybdQBzWzzXSxbrrC81Lc+H7tpz2Ys/xzS1/EJXkb6TgQwTKbgi0r7l+9JifhyZ0+dlabj0wO3eMtJkSP/3GFkISmgNK1OSoj0k0uVZZcATmY6RCXCcCWL90twEaNCgDPti03YV7PPN//dFWw+sp37Y/77OQPYeDXWGU8nOZXszvFgG3uy8I/R7kcsbpH4sbyPcGVOEeoKEDpmo74gX7UK4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fc9b5c-b54e-49ae-a0e3-08d716870fc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 13:49:23.5881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6049
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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

ClZpa3RvciBNaXRpbiB3cml0ZXM6Cgo+IEZ1bmN0aW9ucyBtYWtlX3RpbWVyX25vZGUgYW5kIG1h
a2VfdGltZXJfZG9tVV9ub2RlIGFyZSBxdWl0ZSBzaW1pbGFyLgo+IFNvIGl0IGlzIGJldHRlciB0
byBjb25zb2xpZGF0ZSB0aGVtIHRvIGF2b2lkIGRpc2NyZXBhbmN5Lgo+IFRoZSBtYWluIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgZnVuY3Rpb25zIGlzIHRoZSB0aW1lciBpbnRlcnJ1cHRzIHVzZWQu
Cj4KPiBLZWVwIHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxlIGFzIGl0IGlzIHNp
bXBsZXIuCj4gTWVhbiBkbyBub3QgY29weSBwbGF0Zm9ybSdzICdjb21wYXRpYmxlJyBwcm9wZXJ0
eSBpbnRvIGh3ZG9tCj4gZGV2aWNlIHRyZWUsIGluc3RlYWQgc2V0IGVpdGhlciBhcm0sYXJtdjct
dGltZXIgb3IgYXJtLGFybXY4LXRpbWVyLAo+IGRlcGVuZGluZyBvbiB0aGUgcGxhdGZvcm0gdHlw
ZS4KSXQgaXMgaGFyZCB0byBwYXJzZSB0aGUgbGFzdCBzZW50ZW5jZS4gV2hhdCBhYm91dCAiS2Vl
cCB0aGUgZG9tVSB2ZXJzaW9uCmZvciB0aGUgY29tcGF0aWJsZSBhcyBpdCBpcyBzaW1wbGVyOiBk
byBub3QgY29weSBwbGF0Zm9ybSdzCidjb21wYXRpYmxlJyBwcm9wZXJ0eSBpbnRvIGh3ZG9tIGRl
dmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRoZXIKYXJtLGFybXY3LXRpbWVyIG9yIGFybSxhcm12
OC10aW1lciwgZGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSB0eXBlLiIgPwoKCj4gS2VlcCB0aGUg
aHcgdmVyc2lvbiBmb3IgdGhlIGNsb2NrIGFzIGl0IGlzIHJlbGV2YW50IGZvciB0aGUgYm90aCBj
YXNlcy4KPgo+IFRoZSBuZXcgZnVuY3Rpb24gaGFzIGNoYW5nZWQgcHJvdG90eXBlIGR1ZSB0byBm
ZHRfcHJvcGVydHlfaW50ZXJydXB0cwo+ICAgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBr
ZXJuZWxfaW5mbyAqa2luZm8pCj4KPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0
aW5AZXBhbS5jb20+Cj4gLS0tCj4gdjQgdXBkYXRlczoKPiAgICB1cGRhdGVkICJLZWVwIHRoZSBk
b21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxlIGFzIGl0IGlzIHNpbXBsZXIiCj4KPiB2NSB1
cGRhdGVzOgo+ICAgICAtIGNoYW5nZWQgJ2tlcHQnIHRvICdrZWVwJywgZXRjLgo+ICAgICAtIHJl
bW92ZWQgZW1wdHkgbGluZQo+ICAgICAtIHVwZGF0ZWQgaW5kZW50YXRpb24gb2YgcGFyYW1ldGVy
cyBpbiBmdW5jdGlvbnMgY2FsbHMKPiAgICAgLSBmaXhlZCBOSVRzCj4gICAgIC0gdXBkYXRlZCBj
b21taXQgbWVzc2FnZQo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMDYg
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
OSBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRl
eCBiYzdkMTdkZDJjLi41ODU0MjEzMGNhIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC05NzMs
MTAgKzk3Myw4IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+ICAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPiAg
ICAgIH07Cj4gICAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldjsKPiAtICAgIHUzMiBsZW47
Cj4gLSAgICBjb25zdCB2b2lkICpjb21wYXRpYmxlOwo+ICAgICAgaW50IHJlczsKPiAtICAgIHVu
c2lnbmVkIGludCBpcnE7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaXJxW01BWF9USU1FUl9QUEldOwpB
cyBJIHNhaWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIHlvdSBhcmUgd2FzdGluZyBzdGFjayBz
cGFjZQp0aGVyZS4gQWxzbywgdGhpcyBpcyBtaXNsZWFkaW5nLiBXaGVuIEkgc2VlIGFycmF5IG9m
IDQgaXRlbXMsIEkgZXhwZWN0CnRoYXQgYWxsIDQgaXRlbXMgd2lsbCBiZSB1c2VkLiBCdXQgeW91
IGFyZSB1c2luZyBvbmx5IDMsIHNvIGl0IGxlYWRzIHRvCnR3byBjb25jbHVzaW9uczogZWl0aGVy
IHlvdSBtYWRlIGEgbWlzdGFrZSwgb3IgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQKaXQgaGFwcGVu
aW5nLiBFaXRoZXIgb3B0aW9uIGlzIGJhZC4KCj4gICAgICBnaWNfaW50ZXJydXB0X3QgaW50cnNb
M107Cj4gICAgICB1MzIgY2xvY2tfZnJlcXVlbmN5Owo+ICAgICAgYm9vbCBjbG9ja192YWxpZDsK
PiBAQCAtOTkwLDM1ICs5ODgsNDkgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2Rl
KGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4gICAgICAgICAgcmV0dXJuIC1GRFRf
RVJSX1hFTihFTk9FTlQpOwo+ICAgICAgfQo+Cj4gLSAgICBjb21wYXRpYmxlID0gZHRfZ2V0X3By
b3BlcnR5KGRldiwgImNvbXBhdGlibGUiLCAmbGVuKTsKPiAtICAgIGlmICggIWNvbXBhdGlibGUg
KQo+IC0gICAgewo+IC0gICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgIkNhbid0IGZpbmQgY29t
cGF0aWJsZSBwcm9wZXJ0eSBmb3IgdGltZXIgbm9kZVxuIik7Cj4gLSAgICAgICAgcmV0dXJuIC1G
RFRfRVJSX1hFTihFTk9FTlQpOwo+IC0gICAgfQo+IC0KPiAgICAgIHJlcyA9IGZkdF9iZWdpbl9u
b2RlKGZkdCwgInRpbWVyIik7Cj4gICAgICBpZiAoIHJlcyApCj4gICAgICAgICAgcmV0dXJuIHJl
czsKPgo+IC0gICAgcmVzID0gZmR0X3Byb3BlcnR5KGZkdCwgImNvbXBhdGlibGUiLCBjb21wYXRp
YmxlLCBsZW4pOwo+IC0gICAgaWYgKCByZXMgKQo+IC0gICAgICAgIHJldHVybiByZXM7Cj4gLQo+
IC0gICAgLyogVGhlIHRpbWVyIElSUSBpcyBlbXVsYXRlZCBieSBYZW4uIEl0IGFsd2F5cyBleHBv
c2VzIGFuIGFjdGl2ZS1sb3cKPiAtICAgICAqIGxldmVsLXNlbnNpdGl2ZSBpbnRlcnJ1cHQgKi8K
PiAtCj4gLSAgICBpcnEgPSB0aW1lcl9nZXRfaXJxKFRJTUVSX1BIWVNfU0VDVVJFX1BQSSk7Cj4g
LSAgICBkdF9kcHJpbnRrKCIgIFNlY3VyZSBpbnRlcnJ1cHQgJXVcbiIsIGlycSk7Cj4gLSAgICBz
ZXRfaW50ZXJydXB0KGludHJzWzBdLCBpcnEsIDB4ZiwgRFRfSVJRX1RZUEVfTEVWRUxfTE9XKTsK
PiArICAgIGlmICggIWlzXzY0Yml0X2RvbWFpbihraW5mby0+ZCkgKQo+ICsgICAgewo+ICsgICAg
ICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9zdHJpbmcoZmR0LCAiY29tcGF0aWJsZSIsICJhcm0sYXJt
djctdGltZXIiKTsKPiArICAgICAgICBpZiAoIHJlcyApCj4gKyAgICAgICAgICAgIHJldHVybiBy
ZXM7Cj4gKyAgICB9Cj4gKyAgICBlbHNlCj4gKyAgICB7Cj4gKyAgICAgICAgcmVzID0gZmR0X3By
b3BlcnR5X3N0cmluZyhmZHQsICJjb21wYXRpYmxlIiwgImFybSxhcm12OC10aW1lciIpOwo+ICsg
ICAgICAgIGlmICggcmVzICkKPiArICAgICAgICAgICAgcmV0dXJuIHJlczsKPiArICAgIH0KCkJv
dGggY2FzZXMgYmVhciB0aGUgc2FtZSBwaWVjZSBvZiBjb2RlOgogICAgIGlmICggcmVzICkKICAg
ICAgICAgICByZXR1cm4gcmVzOwoKWW91IGNhbiBtb3ZlIGl0IG91dCBvZiBvdXRlciAiaWYiLiBU
aGlzIHdpbGwgbWFrZSBjb2RlIHNob3J0ZXIgYW5kCnNpbXBsZXIuCgo+Cj4gLSAgICBpcnEgPSB0
aW1lcl9nZXRfaXJxKFRJTUVSX1BIWVNfTk9OU0VDVVJFX1BQSSk7Cj4gLSAgICBkdF9kcHJpbnRr
KCIgIE5vbiBzZWN1cmUgaW50ZXJydXB0ICV1XG4iLCBpcnEpOwo+IC0gICAgc2V0X2ludGVycnVw
dChpbnRyc1sxXSwgaXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Cj4gKyAgICAvKgo+
ICsgICAgICogVGhlIHRpbWVyIElSUSBpcyBlbXVsYXRlZCBieSBYZW4uCj4gKyAgICAgKiBJdCBh
bHdheXMgZXhwb3NlcyBhbiBhY3RpdmUtbG93IGxldmVsLXNlbnNpdGl2ZSBpbnRlcnJ1cHQKPiAr
ICAgICAqLwpNaXNzaW5nIGZ1bGwgc3RvcCBhdCB0aGUgZW5kIG9mIHRoZSBsYXN0IHNlbnRlbmNl
LgoKPgo+IC0gICAgaXJxID0gdGltZXJfZ2V0X2lycShUSU1FUl9WSVJUX1BQSSk7Cj4gLSAgICBk
dF9kcHJpbnRrKCIgIFZpcnQgaW50ZXJydXB0ICV1XG4iLCBpcnEpOwo+IC0gICAgc2V0X2ludGVy
cnVwdChpbnRyc1syXSwgaXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Cj4gKyAgICBp
ZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihraW5mby0+ZCkgKQo+ICsgICAgewo+ICsgICAgICAgIGly
cVtUSU1FUl9QSFlTX1NFQ1VSRV9QUEldID0gdGltZXJfZ2V0X2lycShUSU1FUl9QSFlTX1NFQ1VS
RV9QUEkpOwo+ICsgICAgICAgIGlycVtUSU1FUl9QSFlTX05PTlNFQ1VSRV9QUEldID0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZXJfZ2V0X2lycShUSU1FUl9QSFlT
X05PTlNFQ1VSRV9QUEkpOwo+ICsgICAgICAgIGlycVtUSU1FUl9WSVJUX1BQSV0gPSB0aW1lcl9n
ZXRfaXJxKFRJTUVSX1ZJUlRfUFBJKTsKPiArICAgIH0KPiArICAgIGVsc2UKPiArICAgIHsKPiAr
ICAgICAgICBpcnFbVElNRVJfUEhZU19TRUNVUkVfUFBJXSA9IEdVRVNUX1RJTUVSX1BIWVNfU19Q
UEk7Cj4gKyAgICAgICAgaXJxW1RJTUVSX1BIWVNfTk9OU0VDVVJFX1BQSV0gPSBHVUVTVF9USU1F
Ul9QSFlTX05TX1BQSTsKPiArICAgICAgICBpcnFbVElNRVJfVklSVF9QUEldID0gR1VFU1RfVElN
RVJfVklSVF9QUEk7Cj4gKyAgICB9Cj4gKyAgICBkdF9kcHJpbnRrKCIgIFNlY3VyZSBpbnRlcnJ1
cHQgJXVcbiIsIGlycVtUSU1FUl9QSFlTX1NFQ1VSRV9QUEldKTsKPiArICAgIHNldF9pbnRlcnJ1
cHQoaW50cnNbMF0sIGlycVtUSU1FUl9QSFlTX1NFQ1VSRV9QUEldLAo+ICsgICAgICAgICAgICAg
ICAgICAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Cj4gKyAgICBkdF9kcHJpbnRrKCIgIE5v
biBzZWN1cmUgaW50ZXJydXB0ICV1XG4iLCBpcnFbVElNRVJfUEhZU19OT05TRUNVUkVfUFBJXSk7
Cj4gKyAgICBzZXRfaW50ZXJydXB0KGludHJzWzFdLCBpcnFbVElNRVJfUEhZU19OT05TRUNVUkVf
UFBJXSwKPiArICAgICAgICAgICAgICAgICAgMHhmLCBEVF9JUlFfVFlQRV9MRVZFTF9MT1cpOwo+
ICsgICAgZHRfZHByaW50aygiICBWaXJ0IGludGVycnVwdCAldVxuIiwgaXJxW1RJTUVSX1ZJUlRf
UFBJXSk7Cj4gKyAgICBzZXRfaW50ZXJydXB0KGludHJzWzJdLCBpcnFbVElNRVJfVklSVF9QUEld
LCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7CldoeSBhcmUgeW91IHVzaW5nIHBsYWluIGlu
ZGV4ZXMgZm9yIGludHJzW10gYW5kIGVudW1zIGZvciBpcnFbXT8KCj4KPiAgICAgIHJlcyA9IGZk
dF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCBpbnRycywgMyk7Cj4gICAgICBpZiAoIHJlcyAp
Cj4gQEAgLTE2MDMsNDYgKzE2MTUsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX2dpY19kb21V
X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQo+ICAgICAgfQo+ICB9Cj4K
PiAtc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9kb21VX25vZGUoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwgdm9pZCAqZmR0KQo+IC17Cj4gLSAgICBpbnQgcmVzOwo+IC0gICAgZ2ljX2ludGVy
cnVwdF90IGludHJzWzNdOwo+IC0KPiAtICAgIHJlcyA9IGZkdF9iZWdpbl9ub2RlKGZkdCwgInRp
bWVyIik7Cj4gLSAgICBpZiAoIHJlcyApCj4gLSAgICAgICAgcmV0dXJuIHJlczsKPiAtCj4gLSAg
ICBpZiAoICFpc182NGJpdF9kb21haW4oZCkgKQo+IC0gICAgewo+IC0gICAgICAgIHJlcyA9IGZk
dF9wcm9wZXJ0eV9zdHJpbmcoZmR0LCAiY29tcGF0aWJsZSIsICJhcm0sYXJtdjctdGltZXIiKTsK
PiAtICAgICAgICBpZiAoIHJlcyApCj4gLSAgICAgICAgICAgIHJldHVybiByZXM7Cj4gLSAgICB9
Cj4gLSAgICBlbHNlCj4gLSAgICB7Cj4gLSAgICAgICAgcmVzID0gZmR0X3Byb3BlcnR5X3N0cmlu
ZyhmZHQsICJjb21wYXRpYmxlIiwgImFybSxhcm12OC10aW1lciIpOwo+IC0gICAgICAgIGlmICgg
cmVzICkKPiAtICAgICAgICAgICAgcmV0dXJuIHJlczsKPiAtICAgIH0KPiAtCj4gLSAgICBzZXRf
aW50ZXJydXB0KGludHJzWzBdLCBHVUVTVF9USU1FUl9QSFlTX1NfUFBJLCAweGYsIERUX0lSUV9U
WVBFX0xFVkVMX0xPVyk7Cj4gLSAgICBzZXRfaW50ZXJydXB0KGludHJzWzFdLCBHVUVTVF9USU1F
Ul9QSFlTX05TX1BQSSwgMHhmLCBEVF9JUlFfVFlQRV9MRVZFTF9MT1cpOwo+IC0gICAgc2V0X2lu
dGVycnVwdChpbnRyc1syXSwgR1VFU1RfVElNRVJfVklSVF9QUEksIDB4ZiwgRFRfSVJRX1RZUEVf
TEVWRUxfTE9XKTsKPiAtCj4gLSAgICByZXMgPSBmZHRfcHJvcGVydHkoZmR0LCAiaW50ZXJydXB0
cyIsIGludHJzLCBzaXplb2YgKGludHJzWzBdKSAqIDMpOwo+IC0gICAgaWYgKCByZXMgKQo+IC0g
ICAgICAgIHJldHVybiByZXM7Cj4gLQo+IC0gICAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0
LCAiaW50ZXJydXB0LXBhcmVudCIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVT
VF9QSEFORExFX0dJQyk7Cj4gLSAgICBpZiAocmVzKQo+IC0gICAgICAgIHJldHVybiByZXM7Cj4g
LQo+IC0gICAgcmVzID0gZmR0X2VuZF9ub2RlKGZkdCk7Cj4gLQo+IC0gICAgcmV0dXJuIHJlczsK
PiAtfQo+IC0KPiAgI2lmZGVmIENPTkZJR19TQlNBX1ZVQVJUX0NPTlNPTEUKPiAgc3RhdGljIGlu
dCBfX2luaXQgbWFrZV92cGwwMTFfdWFydF9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHZv
aWQgKmZkdCkKPiAgewo+IEBAIC0xNzQ4LDcgKzE3MjAsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBw
cmVwYXJlX2R0Yl9kb21VKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2lu
Zm8pCj4gICAgICBpZiAoIHJldCApCj4gICAgICAgICAgZ290byBlcnI7Cj4KPiAtICAgIHJldCA9
IG1ha2VfdGltZXJfZG9tVV9ub2RlKGQsIGtpbmZvLT5mZHQpOwo+ICsgICAgcmV0ID0gbWFrZV90
aW1lcl9ub2RlKGtpbmZvKTsKPiAgICAgIGlmICggcmV0ICkKPiAgICAgICAgICBnb3RvIGVycjsK
CgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
