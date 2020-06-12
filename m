Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9FD1F776A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:45:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jji78-00011m-BN; Fri, 12 Jun 2020 11:44:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jji76-00011h-As
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:44:48 +0000
X-Inumbo-ID: 1d1e0fd4-aca2-11ea-bb8b-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d1e0fd4-aca2-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 11:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVWvr94iECSrBgP1XKVDtfN2VXY5QNtKHl6HqO6QYn0sYsaMjR7LUx0daRhJZbHLvX3xTJebWAfb2VbRtakhlA1+VlHaFmL5rPgT2KqQz7onL0vpb5EMaEEY6U9y7LE58YZrm+yBHeSVJk2TaR8serWm4Pz0brT9j4eMJPZ4BM8+6uOmxCWmfjgPITwVAdDfLmQpxyfOBTFODiVeXM8klTWxnerv99x5FQF4ir9g/SkXjEvPZk9/FqtqVTWFvX73eDVUTPzssodXznTDKsC0SxrRQB21SeM8n16quqkzGWkkYRBdEkItwXQHrHBgxPSjDJqIOQgdQW9orVpWCLhkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Gz/xmHoxfc8PueJfWRwnOwqibZCGk9Z1rCGf5aDaM=;
 b=cd1MSWtPT76R9MZFtWV4xEwXDzaPUQclJn2WnB5QakpEVfaGTZyoOKbQpYdEhhnb8OzG724UMkiZ+flt5Rry5LxN8N+F/zQRL3VaCFkFdHtrkdaddHYaddcxpN9bW2pLntezrDLY8IKckdHxL97DmvDZUyV/BrfLzSeSLN1tie8vSSrceQRkkWLIjc6zAgfJo3A2teL7NSHT//dMMSOZ/hXhQssXTX+B6Pr5nQ74tq7HHbSekcFqYiMfe82B/CLtUjQb7AyPTxgsZW3vlEmrYyXxMA7/dEUV3Xi6KSrOOmn4weiOJodpQf1xnDsFZfRUSWqeUxc0jxHzdyV7CgTWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Gz/xmHoxfc8PueJfWRwnOwqibZCGk9Z1rCGf5aDaM=;
 b=BKztKpjOi6JTEr22+eNYHFoI65CAFg3tew9Tlgopj4FmXEY92j5GoHa+3SIMLcpcFCMmUa51U3SiNbEUHTgaXp7R0jXL+dwBrV+1ZzDZwlX1WH4Iwps7z4sAhGum4q7jueSVXylTz6YA32OJcmjIggD/5Q/AZwdle3+EaqdrjRxrgZpesWqVBQbbtg3bM3VPChEf1PsU7xVK2Dqcqj5J0Fi1FbkNMSXJPWuzULy48oUgi4eXVTWGax6ZITCfkq030Kz96M3NQgF+ULroFVsaI0BQZvYvEM/Y0pL/NM9jhNW7P80Fp56vR+Otm0Tkhx4uw7QqOBuO6J1QHqhQzxLLzA==
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com (2603:10a6:8:c::18)
 by DB3PR0302MB3179.eurprd03.prod.outlook.com (2603:10a6:8:8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 12 Jun
 2020 11:44:44 +0000
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290]) by DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290%2]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 11:44:44 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZqjUa0CAgABx3AA=
Date: Fri, 12 Jun 2020 11:44:44 +0000
Message-ID: <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
In-Reply-To: <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ca7f2f8-2fa0-4ad1-a373-08d80ec60082
x-ms-traffictypediagnostic: DB3PR0302MB3179:
x-microsoft-antispam-prvs: <DB3PR0302MB317946152F8A33240BCBD34DE6810@DB3PR0302MB3179.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DHtvXvXOcyppYTxjz+kE3eSivme1ZyCqDgLnEg86EaUUcoqHj6yzPjw2hV5s5d4PW1Nox2Ren+KsA2JjnHbAAz3hOP4U2efNXbiCnkNUJZcf91plEXHoZCNiz3b+jFVCBjemcguh0pwC8nmk7+7VpYnla2eQ/l41vfxHvqkEoSl+1c2vKX68OGI7iFS9L1KWEKZFZc41zK2LmnRj845qEGxOYAKY2UCDm6fILivlvYzAzzY+VSlagQTSAL518C9bgMj5R5RW754WTA7gSHvOm0u9T4t+7/y/YbQmyJn4p+yzaMEWvmQ78Gr19mO8S33aYlbcdNcKdFmf1NlQN8jqmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0302MB3401.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(316002)(7416002)(54906003)(71200400001)(8936002)(110136005)(83380400001)(66574014)(6512007)(86362001)(8676002)(26005)(66446008)(186003)(66556008)(66946007)(64756008)(66476007)(5660300002)(478600001)(4326008)(91956017)(6486002)(76116006)(6506007)(53546011)(55236004)(2616005)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6oixNbLxf2+nEDdE85A8qxJpzXPDsjLg/lGNQJ4voK6zLE1sHDrDJoN37VVQyFU/mm2mWxvN4u+eM70SRPtREjCnHhiZmF1eBzX6pSP3zV6WXW0ox6eSo6opVWC3swyQPqFsZT83WdyAhAHXJAIBESgY9f/Y6xZysLy0WiqPw4p1cEL8wI2fjCYofk2NN+dtbb4TBdpLtkUHktD4bgmnx1DfU5wDi+QoFIjKc0bV3fy1RE92MlnYx+ymoFQlbSqm8rf/OARFSF3kRHlTTySUk+qLSmRjQcig/hCEUE1MvwUKV/xd4ZfzCesKjTvoVjtidyl7/hGlJyKdmdOUJ0946SaY1vQU9NAgxGAsNq2xReIPCIAkfK+cyzNZX8oX0PiEc1gxW8Vui5Jdon354oi9eO42q3go1vTdypd6Dfh/8JPXpfsydZeBvqkxw5ZIfdsvcNc65QCBLQed2b5n+pt3lHIxFhFAnCRXbjWmlnV+FNPnc1O8u2jbydcISfKHAxEJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD0E06FF62F0A9468DF92007D8EE948C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca7f2f8-2fa0-4ad1-a373-08d80ec60082
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 11:44:44.6720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6LYWMv1K13oqrIUfQxjxU1/3vnzmxicCDc+0HLb7dsFK7avOvG3CR/I4vDq8bcf4xMVkJTq95tKLxtgKw4mqhjG8PstBDo7taFqgolTJUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3179
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiBGcmksIDIwMjAtMDYtMTIgYXQgMDY6NTcgKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+IE9uIDEyLjA2LjIwIDAyOjIyLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4gPiBBcyBz
Y2hlZHVsZXIgY29kZSBub3cgY29sbGVjdHMgdGltZSBzcGVudCBpbiBJUlEgaGFuZGxlcnMgYW5k
IGluDQo+ID4gZG9fc29mdGlycSgpLCB3ZSBjYW4gcHJlc2VudCB0aG9zZSB2YWx1ZXMgdG8gdXNl
cnNwYWNlIHRvb2xzIGxpa2UNCj4gPiB4ZW50b3AsIHNvIHN5c3RlbSBhZG1pbmlzdHJhdG9yIGNh
biBzZWUgaG93IHN5c3RlbSBiZWhhdmVzLg0KPiA+IA0KPiA+IFdlIGFyZSB1cGRhdGluZyBjb3Vu
dGVycyBvbmx5IGluIHNjaGVkX2dldF90aW1lX2NvcnJlY3Rpb24oKSBmdW5jdGlvbg0KPiA+IHRv
IG1pbmltaXplIG51bWJlciBvZiB0YWtlbiBzcGlubG9ja3MuIEFzIGF0b21pY190IGlzIDMyIGJp
dCB3aWRlLCBpdA0KPiA+IGlzIG5vdCBlbm91Z2ggdG8gc3RvcmUgdGltZSB3aXRoIG5hbm9zZWNv
bmQgcHJlY2lzaW9uLiBTbyB3ZSBuZWVkIHRvDQo+ID4gdXNlIDY0IGJpdCB2YXJpYWJsZXMgYW5k
IHByb3RlY3QgdGhlbSB3aXRoIHNwaW5sb2NrLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jICAgICB8IDE3ICsrKysrKysrKysrKysrKysrDQo+
ID4gICB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAgMSArDQo+ID4gICB4ZW4vaW5jbHVk
ZS9wdWJsaWMvc3lzY3RsLmggfCAgNCArKystDQo+ID4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCAgICAgfCAgMiArKw0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY29y
ZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gPiBpbmRleCBhNzI5NGZmNWMzLi5lZTZi
MWQ5MTYxIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+ID4gKysr
IGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gPiBAQCAtOTUsNiArOTUsMTAgQEAgc3RhdGlj
IHN0cnVjdCBzY2hlZHVsZXIgX19yZWFkX21vc3RseSBvcHM7DQo+ID4gICANCj4gPiAgIHN0YXRp
YyBib29sIHNjaGVkdWxlcl9hY3RpdmU7DQo+ID4gICANCj4gPiArc3RhdGljIERFRklORV9TUElO
TE9DSyhzY2hlZF9zdGF0X2xvY2spOw0KPiA+ICtzX3RpbWVfdCBzY2hlZF9zdGF0X2lycV90aW1l
Ow0KPiA+ICtzX3RpbWVfdCBzY2hlZF9zdGF0X2h5cF90aW1lOw0KPiA+ICsNCj4gPiAgIHN0YXRp
YyB2b2lkIHNjaGVkX3NldF9hZmZpbml0eSgNCj4gPiAgICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAq
dW5pdCwgY29uc3QgY3B1bWFza190ICpoYXJkLCBjb25zdCBjcHVtYXNrX3QgKnNvZnQpOw0KPiA+
ICAgDQo+ID4gQEAgLTk5NCw5ICs5OTgsMjIgQEAgc190aW1lX3Qgc2NoZWRfZ2V0X3RpbWVfY29y
cmVjdGlvbihzdHJ1Y3Qgc2NoZWRfdW5pdCAqdSkNCj4gPiAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+ICAgICAgIH0NCj4gPiAgIA0KPiA+ICsgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkX3N0
YXRfbG9jaywgZmxhZ3MpOw0KPiA+ICsgICAgc2NoZWRfc3RhdF9pcnFfdGltZSArPSBpcnE7DQo+
ID4gKyAgICBzY2hlZF9zdGF0X2h5cF90aW1lICs9IGh5cDsNCj4gPiArICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnNjaGVkX3N0YXRfbG9jaywgZmxhZ3MpOw0KPiANCj4gUGxlYXNlIGRvbid0
IHVzZSBhIGxvY2suIEp1c3QgdXNlIGFkZF9zaXplZCgpIGluc3RlYWQgd2hpY2ggd2lsbCBhZGQN
Cj4gYXRvbWljYWxseS4NCg0KTG9va3MgbGlrZSBhcm0gZG9lcyBub3Qgc3VwcG9ydCA2NCBiaXQg
dmFyaWFibGVzLg0KDQpKdWxpZW4sIEkgYmVsaWV2ZSwgdGhpcyBpcyBhcm12NyBsaW1pdGF0aW9u
PyBTaG91bGQgYXJtdjggd29yayB3aXRoIDY0LQ0KYml0IGF0b21pY3M/DQoNCj4gPiArDQo+ID4g
ICAgICAgcmV0dXJuIGlycSArIGh5cDsNCj4gPiAgIH0NCj4gPiAgIA0KPiA+ICt2b2lkIHNjaGVk
X2dldF90aW1lX3N0YXRzKHVpbnQ2NF90ICppcnFfdGltZSwgdWludDY0X3QgKmh5cF90aW1lKQ0K
PiA+ICt7DQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsNCj4gPiArICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZzY2hlZF9zdGF0X2xvY2ssIGZsYWdzKTsNCj4gPiArICAgICppcnFf
dGltZSA9IHNjaGVkX3N0YXRfaXJxX3RpbWU7DQo+ID4gKyAgICAqaHlwX3RpbWUgPSBzY2hlZF9z
dGF0X2h5cF90aW1lOw0KPiA+ICsgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWRfc3Rh
dF9sb2NrLCBmbGFncyk7DQo+IA0KPiByZWFkX2F0b21pYygpIHdpbGwgZG8gdGhlIGpvYiB3aXRo
b3V0IGxvY2suDQoNClllcywgSSByZWFsbHkgd2FudCB0byB1c2UgYXRvbWljcyB0aGVyZS4gSnVz
dCBuZWVkIHRvIGNsYXJpZnkgNjQgYml0DQpzdXBwb3J0IG9uIEFSTS4NCg0KPiA+ICAgfQ0KPiA+
ICAgDQo+ID4gICAvKg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N5c2N0bC5jIGIveGVu
L2NvbW1vbi9zeXNjdGwuYw0KPiA+IGluZGV4IDFjNmE4MTc0NzYuLjAwNjgzYmM5M2YgMTAwNjQ0
DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vc3lz
Y3RsLmMNCj4gPiBAQCAtMjcwLDYgKzI3MCw3IEBAIGxvbmcgZG9fc3lzY3RsKFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkNCj4gPiAgICAgICAgICAgcGktPnNj
cnViX3BhZ2VzID0gMDsNCj4gPiAgICAgICAgICAgcGktPmNwdV9raHogPSBjcHVfa2h6Ow0KPiA+
ICAgICAgICAgICBwaS0+bWF4X21mbiA9IGdldF91cHBlcl9tZm5fYm91bmQoKTsNCj4gPiArICAg
ICAgICBzY2hlZF9nZXRfdGltZV9zdGF0cygmcGktPmlycV90aW1lLCAmcGktPmh5cF90aW1lKTsN
Cj4gPiAgICAgICAgICAgYXJjaF9kb19waHlzaW5mbyhwaSk7DQo+ID4gICAgICAgICAgIGlmICgg
aW9tbXVfZW5hYmxlZCApDQo+ID4gICAgICAgICAgIHsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvcHVibGljL3N5c2N0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oDQo+ID4g
aW5kZXggM2EwOGM1MTJlOC4uZjMyMDE0NGQ0MCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvc3lzY3RsLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgN
Cj4gPiBAQCAtMzUsNyArMzUsNyBAQA0KPiA+ICAgI2luY2x1ZGUgImRvbWN0bC5oIg0KPiA+ICAg
I2luY2x1ZGUgInBoeXNkZXYuaCINCj4gPiAgIA0KPiA+IC0jZGVmaW5lIFhFTl9TWVNDVExfSU5U
RVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMw0KPiA+ICsjZGVmaW5lIFhFTl9TWVNDVExfSU5URVJG
QUNFX1ZFUlNJT04gMHgwMDAwMDAxNA0KPiA+ICAgDQo+ID4gICAvKg0KPiA+ICAgICogUmVhZCBj
b25zb2xlIGNvbnRlbnQgZnJvbSBYZW4gYnVmZmVyIHJpbmcuDQo+ID4gQEAgLTExOCw2ICsxMTgs
OCBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyB7DQo+ID4gICAgICAgdWludDY0X2FsaWdu
ZWRfdCBzY3J1Yl9wYWdlczsNCj4gPiAgICAgICB1aW50NjRfYWxpZ25lZF90IG91dHN0YW5kaW5n
X3BhZ2VzOw0KPiA+ICAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgbWF4X21mbjsgLyogTGFyZ2VzdCBw
b3NzaWJsZSBNRk4gb24gdGhpcyBob3N0ICovDQo+ID4gKyAgICB1aW50NjRfYWxpZ25lZF90IGly
cV90aW1lOw0KPiA+ICsgICAgdWludDY0X2FsaWduZWRfdCBoeXBfdGltZTsNCj4gDQo+IFdvdWxk
IGh5cGZzIHdvcmssIHRvbz8gVGhpcyB3b3VsZCBhdm9pZCB0aGUgbmVlZCBmb3IgZXh0ZW5kaW5n
IGFub3RoZXINCj4gaHlwZXJjYWxsLg0KDQpHb29kIHBvaW50LiBJJ2xsIHRha2UgYSBsb29rIGF0
IHRoaXMgZnJvbSB0b29sc3RhY2sgc2lkZS4gSSBkaWRuJ3Qgc2VlDQphbnkgaHlwZnMgY2FsbHMg
aW4gdGhlIHhlbnRvcC4gQnV0IHRoaXMgaXMgYSBnb29kIHRpbWUgdG8gYmVnaW4gdXNpbmcNCml0
Lg0K

