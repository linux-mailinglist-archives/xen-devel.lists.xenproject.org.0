Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016621F7764
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:38:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jji10-0008Vr-AG; Fri, 12 Jun 2020 11:38:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jji0y-0008Vi-PB
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:38:28 +0000
X-Inumbo-ID: 3b22919a-aca1-11ea-bb8b-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b22919a-aca1-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 11:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahvu33HQTfnRNpCyULoCeK1K10X5cHGey7EzQpPvIlA0iQ7Law5+Ud9IfBreBRq6j8r/vBKmiviF/lU0Ow1nIG7yQ3LMlL2+ZTBSye+pc4xu5WBVCL7M1Da7ewjf56Vl7gm06LkRiSliPRF0KCHP6jcbZA19GxT1qm2tk7otwWHGQk//VQjh0Akt1GoSVurcZQlMxm74iguMMXr55skb/3p1MCZtuJdMcMwQpTBE0DPEBbEozhov0+95qo7nkfa8gT40iqbhNL4I0qVJNjG8V4Z/ucHF9mHyBQ8jvpRLCdSRUEdSIarjGv7U+CsWnFvIsCQywsM7WT9djk2v+Hz3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKr01J6bycECPR64sbz8JtTVBqlGyFTxjcHpxmtJoH8=;
 b=DxlFi2xzPeCDA44Czx2OkpTPvqlaVoXUtcHp45jmlEuN6Q7aH8aWKVCsvjCJbgBC4OHAOyn3k0f1NUl5xM9IyB1X/JsU7NGfYhKHZ8RmXytz2raGmB5vJ7aRE8ceSeZrkcUX71z2I7mHMuIiWCmPKTkKl1jeAl0JatTiQKxN0pONSizgKqXAWYE/pXrfjtqJ5ezyd9YKyVfGipBKxBWgYRZCW2urYL0NwzVTvIClNahQiK0yN8hzKSfJKsogRVVty2PocmhpGcrEGV1I3V0zpzfnxts7M+qyAVpU7FTX39gZMtJo6v82y9z1FEoshj5iIqGvLKIsC29FeGxsTayiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKr01J6bycECPR64sbz8JtTVBqlGyFTxjcHpxmtJoH8=;
 b=yx61UnoKBvxdRnPj0acob6NLKWna2DCMFVP9htm25dGtNLS6rzJ9KhUGT0oh5usXAn8f+HY5g6YfCfui2rPM1U9GzziKsJm1CBYiLNAq5CR2lLYMB/9ouesu6rtBpIHe0tXfs+yHNPjRLRrf2cnKROO84SzL5XhmTxXnz25RrKDf+1qdjZEuvRC6rNL1FEjPX4xWzFvX2YgsN8UbTrJib2eDm9RGMLbxVZnma7CF/mLxx49EZtZX0BXBNjKJJUwvqPehO09Ntj3raH5qiaSEhcV1xhy+ugQKHQr2csGUHDcgITqiDcJWgmh/tdQbIZ6XSYRtD+ZmKW+gU7sq+reyNA==
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com (2603:10a6:8:c::18)
 by DB3PR0302MB3179.eurprd03.prod.outlook.com (2603:10a6:8:8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 12 Jun
 2020 11:38:26 +0000
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290]) by DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290%2]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 11:38:26 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 3/6] sched, credit2: improve scheduler fairness
Thread-Topic: [RFC PATCH v1 3/6] sched, credit2: improve scheduler fairness
Thread-Index: AQHWQE+TBfX1MPdkGkC6vJ7ur/uY5KjUaaaAgABxsoA=
Date: Fri, 12 Jun 2020 11:38:25 +0000
Message-ID: <33db319c8a533fc08b168d24c329533516d14f8b.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-4-volodymyr_babchuk@epam.com>
 <bb7c8689-d247-0d28-088b-4774ebcdc345@suse.com>
In-Reply-To: <bb7c8689-d247-0d28-088b-4774ebcdc345@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 650e596b-7086-4b28-2358-08d80ec51ebf
x-ms-traffictypediagnostic: DB3PR0302MB3179:
x-microsoft-antispam-prvs: <DB3PR0302MB3179007593EA73F120BDD1C8E6810@DB3PR0302MB3179.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rSxtq09RgQX/TpnoejsGXugjREM30U8k6PVO6/IJpZc9KV29/QBmLgCegpxUFtcwEfb3ZADtruVkzc9ZSeGqKLUlKWoNVS5e+jo4bFiTs1fpiNtWaQg/OhY7UwRHDGHdqUvIHD1vADhzAfrwhnDniYnM6RisNV5ZqjfdM84f1A1O5LasQM2UI2JF+TdM9Po02inXQLZq7ZLnkh1OLbVngnZZAhjANKEzeOkLFSeK1PqICZ0/hk5D0uipWPQqTP2VAg4dObZ5No/sP5HmXgiucu1a5/+QZwb9A4F8SCZlPStiAHtsaYcFdBXmQTmp1g2xiY0QgSO1ljNLsdcUSunL1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0302MB3401.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(66476007)(64756008)(186003)(66446008)(66556008)(66946007)(6506007)(53546011)(76116006)(2906002)(36756003)(55236004)(2616005)(6486002)(478600001)(5660300002)(91956017)(4326008)(8936002)(83380400001)(66574014)(6512007)(110136005)(316002)(54906003)(71200400001)(8676002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vgTqayEqzPRk8/ORF52czRcd+qc8LFbkygctvCjYbodEiKgXbh8xKrOCV6g5FkDGXfv6eXoWGoWbgYuxUYGZNZc+kSR0032rMYIHV5aIObLUUJctNlqX4DczCjJWU4mOy8L3QKLjrEpDz90nQhysAOeKJSZgibVx+GjvWMbNC35f62+uxHJwWhr9xelSsU3xJbUvY3N/uRpDIoEFm/aqUXSzanuuKw2Zs1xWpVsPbCIgvxP0M7emjNWE7xIUO03s7fC3pg/V5aRnjz8yulPC6br7ZmLsryLFDO/sb9g3YC8aCfSnYfgnFUcjdAECTax1x1j+CvRsOzE2tTuj8coNdkE1IJcQbEnIcMHYQtOjY7NjlpamguU3fCaKqXk+jrj58cWxL6K3C+le4sjpVDjI3qBVsHvgPfShzKgM0ALrdw0p8hXHsiyX0wQvre7kL3Nq+Vo9KUDNjW8LWPy+vtZWCN5Gj743OBG6ZXwXPWZB1yTry1ePP+se4oUB7aEXaOcn
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <67629A311D269745AF796C203D32BDC8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650e596b-7086-4b28-2358-08d80ec51ebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 11:38:25.9654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOm/2U+pBr5r+s8igHAasxjU8Cc0Qd6cFuJJ0f+OzeANAeRDxvFgebUVp2LeRuuevS1y2wkXWBLpJJwbnAGwr+enso/i+t1G6xQhz5HsEMY=
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
Cc: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTA2LTEyIGF0IDA2OjUxICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAxMi4wNi4yMCAwMjoyMiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+ID4gTm93IHdl
IGNhbiBtYWtlIGNvcnJlY3Rpb25zIGZvciBzY2hlZHVsaW5nIHVuaXQgcnVuIHRpbWUsIGJhc2Vk
IG9uDQo+ID4gZGF0YSBnYXRoZXJlZCBpbiBwcmV2aW91cyBwYXRjaGVzLiBUaGlzIGluY2x1ZGVz
IHRpbWUgc3BlbnQgaW4gSVJRDQo+ID4gaGFuZGxlcnMgYW5kIHRpbWUgc3BlbnQgZm9yIGh5cGVy
dmlzb3IgaG91c2VrZWVwaW5nIHRhc2tzLiBUaG9zZSB0aW1lDQo+ID4gc3BhbnMgbmVlZHMgdG8g
YmUgZGVkdWNlZCBmcm9tIGEgdG90YWwgcnVuIHRpbWUuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBh
ZGRzIHNjaGVkX2dldF90aW1lX2NvcnJlY3Rpb24oKSBmdW5jdGlvbiB3aGljaCByZXR1cm5zDQo+
ID4gdGltZSBjb3JyZWN0aW9uIHZhbHVlLiBUaGlzIHZhbHVlIHNob3VsZCBiZSBzdWJ0cmFjdGVk
IGJ5IGEgc2NoZWR1bGVyDQo+ID4gaW1wbGVtZW50YXRpb24gZnJvbSBhIHRvdGFsIHZDUFUvc2hj
ZWRfdW5pdCBydW4gdGltZS4NCj4gPiANCj4gPiBUT0RPOiBNYWtlIHRoZSBjb3JyZXNwb25kaW5n
IGNoYW5nZXMgdG8gYWxsIG90aGVyIHNjaGVkdWxlcnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPg0KPiA+IC0t
LQ0KPiA+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgICAgfCAyMyArKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAgeGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMgfCAgMiArLQ0KPiA+ICAg
eGVuL2NvbW1vbi9zY2hlZC9wcml2YXRlLmggfCAxMCArKysrKysrKysrDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
Yw0KPiA+IGluZGV4IGQ1OTc4MTFmZWYuLmE3Mjk0ZmY1YzMgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0K
PiA+IEBAIC05NzQsNiArOTc0LDI5IEBAIHZvaWQgdmNwdV9lbmRfaHlwX3Rhc2soc3RydWN0IHZj
cHUgKnYpDQo+ID4gICAjaWZuZGVmIE5ERUJVRw0KPiA+ICAgICAgIHYtPmluX2h5cF90YXNrID0g
ZmFsc2U7DQo+ID4gICAjZW5kaWYNCj4gPiArDQo+ID4gK3NfdGltZV90IHNjaGVkX2dldF90aW1l
X2NvcnJlY3Rpb24oc3RydWN0IHNjaGVkX3VuaXQgKnUpDQo+ID4gK3sNCj4gPiArICAgIHVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+ID4gKyAgICBpbnQgaXJxLCBoeXA7DQo+IA0KPiBVc2luZyAiaXJx
IiBmb3IgYSB0aW1lIHZhbHVlIGlzIG1pc2xlYWRpbmcgSU1PLg0KDQpZZXMsIHlvdSBhcmUgcmln
aHQuIEknbGwgcmVuYW1lIHRoaXMgdmFyaWFibGVzIHRvIGlycV90aW1lIGFuZA0KaHlwX3RpbWUu
IA0KDQo+ID4gKw0KPiA+ICsgICAgd2hpbGUgKCB0cnVlICkNCj4gPiArICAgIHsNCj4gPiArICAg
ICAgICBpcnEgPSBhdG9taWNfcmVhZCgmdS0+aXJxX3RpbWUpOw0KPiA+ICsgICAgICAgIGlmICgg
bGlrZWx5KCBpcnEgPT0gYXRvbWljX2NtcHhjaGcoJnUtPmlycV90aW1lLCBpcnEsIDApKSApDQo+
ID4gKyAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgfQ0KPiANCj4gSnVzdCB1c2UgYXRvbWlj
X3hjaGcoKT8NCg0KVGhhbmtzLiBJIHNvbWVob3cgbWlzc2VkIHRoaXMgbWFjcm8uDQoNCj4gPiAr
DQo+ID4gKyAgICB3aGlsZSAoIHRydWUgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGh5cCA9
IGF0b21pY19yZWFkKCZ1LT5oeXBfdGltZSk7DQo+ID4gKyAgICAgICAgaWYgKCBsaWtlbHkoIGh5
cCA9PSBhdG9taWNfY21weGNoZygmdS0+aHlwX3RpbWUsIGh5cCwgMCkpICkNCj4gPiArICAgICAg
ICAgICAgYnJlYWs7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIGlycSArIGh5
cDsNCj4gDQo+IEFoLCBJIGRpZG4ndCBsb29rIGludG8gdGhpcyBwYXRjaCB1bnRpbCBub3cuDQo+
IA0KPiBZb3UgY2FuIHJlcGxhY2UgbXkgY29tbWVudHMgYWJvdXQgb3ZlcmZsb3cgb2YgYW4gaW50
IGZvciBwYXRjaGVzIDEgYW5kIDINCj4gd2l0aDoNCj4gDQo+ICAgIFBsZWFzZSBtb2RpZnkgdGhl
IGNvbW1lbnQgYWJvdXQgbm90IG92ZXJmbG93aW5nIGhpbnRpbmcgdG8gdGhlIHZhbHVlDQo+ICAg
IGJlaW5nIHJlc2V0IHdoZW4gbWFraW5nIHNjaGVkdWxpbmcgZGVjaXNpb25zLg0KDQpXaWxsIGRv
Lg0KDQo+IEFuZCB0aGlzIChvZiBjb3Vyc2UpIG5lZWRzIHRvIGJlIGhhbmRsZWQgaW4gYWxsIG90
aGVyIHNjaGVkdWxlcnMsIHRvby4NCj4gDQoNClllcywgdGhlIHBsYW4gaXMgdG8gY2FsbCB0aGlz
IGZ1bmN0aW9uIGluIGFsbCBzY2hlZHVsZXJzLiBJIHNraXBwZWQNCnRoaXMgaW4gUkZDLCBiZWNh
dXNlIEkgd2FudGVkIHRvIGRpc2N1c3MgdGhlIGdlbmVyYWwgYXBwcm9jaC4gSSdsbCBhZGQNCnN1
cHBvcnQgZm9yIGFsbCBvdGhlciBzY2hlZHVsZXJzIGluIHRoZSBuZXh0IHZlcnNpb24uDQo=

