Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D01F7753
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:30:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhta-00086G-0d; Fri, 12 Jun 2020 11:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjhtY-000857-Ik
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:30:48 +0000
X-Inumbo-ID: 279f0230-aca0-11ea-bb8b-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 279f0230-aca0-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 11:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtMhAL8pw8bcVYheruZOFjZc9EAsG6mA48ETm+00qG75RO/G6PhaUjZav6nkdWIiYhy7UceWiRRvZ5FBgH3zzPFrq19sMbBdHqbD1giHgc4KVkdjDV5prXwPe/pdaaAkZBgYaHby7+E+bo3l2TdDoMbQAHpjnQJDaONs3oESDOR+u4hDCGB8GTJBw6zY2d/8EgAyCYe4hVTJLiJwIOIgryS5oQwpV7wgDx6fscxSJNDy+w4OGFLX0gkSQ6Y57yAQWIDT6Y+DLPGPu5/qqrhlJRzAm9QfLX+LHr1KeKswHYVN6uI7Uhb3UZS8imcKGVsLvbY0jX1fcvBQyQGENTe6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iB5UzSHH1KgP6PRHIhObGC20xwVLHX64wBQq/sIm64=;
 b=c9Q9l+4QvbkXsHC6wKl9pZsQAb34dBW4ZLwNcV1wGSep9UW4evcNRSJc697fi/AlygJuZf8gopvo9HTWlJ1FRIIjtjK+Nq1S8j96o4Rr70vE1ILBRuDsy35KJJV6+u0Q/r7sNGaXSKhSeKBjI8E7RxJKpqpDa5mWbyLi3GJAuRbDVleB0tC5k2+BhNJ82BiHts+ib8lZFB/BrHexIH7Q7CC+aQWQ7dpwvv2fvJ4QhIjb1IiVeecEcleggfKiFEAUhsGM1zvzGnR1FswtK1x7gtrgwhNSC/TaWKa8lcMqBX29o73reINKHlkYFRWWZ2K/Yv7hKNj8pVpGJ26BP3udqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iB5UzSHH1KgP6PRHIhObGC20xwVLHX64wBQq/sIm64=;
 b=eK6bGRnKpZ+AD6Q7uJekBASZttAMTUFdIGPULLkYrCXp6BCQH0jlatcj6GnQZKKPzTPG7eS1HVqB17CBaV2x9i8FbREr/pDHeP3xdJBaP3/AcBPlPCp/N3SqFS8zJ8j1rAarwDgBHcAve8w0zRBsBzofobNoKjoNHFpubcSQVktAxDt28oOWB4Iraa9W5uratleLOt62NJOy5ia4G3d/H5YlNfqJ3A39oEcfoeeUaJZkt6JC3j78Jq91aoDISl1nSwAYl0tSLVnFrgqOuVqdN4j/YFaEcug7vqJntSFAB4QuKgSufuRiyIZq3D2eMck+xSuurNPiEj4psZjTW8XcLg==
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com (2603:10a6:8:c::18)
 by DB3PR0302MB3340.eurprd03.prod.outlook.com (2603:10a6:8:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 11:30:43 +0000
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290]) by DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290%2]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 11:30:43 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Topic: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Index: AQHWQE+SUtF98x/3akmRxwBff1s+m6jUZ0iAgABx6YA=
Date: Fri, 12 Jun 2020 11:30:43 +0000
Message-ID: <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
In-Reply-To: <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2339c945-0e71-4dd0-02a1-08d80ec40b39
x-ms-traffictypediagnostic: DB3PR0302MB3340:
x-microsoft-antispam-prvs: <DB3PR0302MB3340FCD36039557E88180807E6810@DB3PR0302MB3340.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oHULeZ5t4MkjP07ntMTMXjVsH7zKCzW1/DR+z3kWgONAPThf2VFEpSYRnA3G9WpFbySVXmYYWf/h50WLl5hJ/f6KBtTKfNRySZrI6GlZdXLQQAg/n3HB4PDuCWJQWMEiCyB/jiUSTLHmddVDbYkNp7CF2l94ns8VJN1mUJ1SMAK7ZYkgmhjC/DCuzkW/tjmMtd1Gd5CeBKATiQcgHSUgCYOk4s1/DiNdpkpOJQFGFS+2UnWIZp5h7ZhI9Y9JBXle6G8tIwhgbZ90AEnr/4gpG77NmoEhkmM+3Tnh56POxt2CEeLf3IAoBzv+/8+guEs3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0302MB3401.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(7416002)(110136005)(86362001)(66574014)(8936002)(83380400001)(54906003)(4326008)(316002)(66556008)(91956017)(55236004)(66476007)(64756008)(6486002)(478600001)(186003)(76116006)(6512007)(26005)(6506007)(66446008)(53546011)(5660300002)(8676002)(2616005)(66946007)(36756003)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HGnGGEZ+7w+QizcvsXFnMRFoisWKog8YUAPN0GxydwzoPiXtKffKcw2SyExz3Mg7esVYGUmJK6hR/Lkj5i2R3dNkWJS7/QzDbLJ2kcN7qtB2tUAaMpkmUEbTgVq5v5iI+DR71GS0IEuV4+MKWQVFqjIj0AG2ViApDJtgWD1lXG1rH1GZFO73FsW7MBi4o8OMG7WBaj9GfGYpxwZh85BT9zHxXUsEt+0ManxKvabt1EjV7PrjCND7RZIq7pA+q/fhpYgxv8M81Y/J8ZG+hXncHCooYLdCzXiXlwTNCwXnetagpC72NMnjFaj75QVXWUAABf6V1kADjgwVYa4SnxHe+VCy41ql2BMorjy/uDk9kHswlT9FO0SAWPE8kTqEsnYnsSlxmrkYbnYhnyO1zmgdQJpPxDmO0u9LOnQU0yqCoTR0WUIgDpBYzqRPkmCpIV7Pm72oqA+n5IJuq/W8+F2VNNyjYx4zse41AyajJvPt+OQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C61D6B8CB185B4984FBA165D3861FF6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2339c945-0e71-4dd0-02a1-08d80ec40b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 11:30:43.6740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAqnVCJyfuR49pAiQh+r8U+lnpwHVRFa9r+TZcIG9xbVly8PTQR+M9aqrkTYCDeBBmghQbt29rzCI2RrLf7NScdTQwcKVKmRgJrat4uYKU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3340
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
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTA2LTEyIGF0IDA2OjQzICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAxMi4wNi4yMCAwMjoyMiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+ID4gK3ZvaWQg
dmNwdV9lbmRfaHlwX3Rhc2soc3RydWN0IHZjcHUgKnYpDQo+ID4gK3sNCj4gPiArICAgIGludCBk
ZWx0YTsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGlzX2lkbGVfdmNwdSh2KSApDQo+ID4gKyAgICAg
ICAgcmV0dXJuOw0KPiA+ICsNCj4gPiArICAgIEFTU0VSVCh2LT5pbl9oeXBfdGFzayk7DQo+ID4g
Kw0KPiA+ICsgICAgLyogV2UgYXNzdW1lIHRoYXQgaHlwZXJ2aXNvciB0YXNrIHRpbWUgd2lsbCBu
b3Qgb3ZlcmZsb3cgaW50ICovDQo+IA0KPiBUaGlzIHdpbGwgZGVmaW5pdGVseSBoYXBwZW4gZm9y
IGxvbmcgcnVubmluZyBWTXMuIFBsZWFzZSB1c2UgYSA2NC1iaXQNCj4gdmFyaWFibGUuDQo+IA0K
DQpJdCBpcyBub3Qgc3Vwb3NlZCB0byBob2xkIGxvbmcgdGltZSBzcGFucywgYXMgSSBkZXNjcmli
ZWQgaW4gdGhlIHJlcGx5DQp0byBwcmV2aW91cyBlbWFpbC4NCg0KPiA+ICsgICAgZGVsdGEgPSBO
T1coKSAtIHYtPmh5cF9lbnRyeV90aW1lOw0KPiA+ICsgICAgYXRvbWljX2FkZChkZWx0YSwgJnYt
PnNjaGVkX3VuaXQtPmh5cF90aW1lKTsNCj4gPiArDQo+ID4gKyNpZm5kZWYgTkRFQlVHDQo+ID4g
KyAgICB2LT5pbl9oeXBfdGFzayA9IGZhbHNlOw0KPiA+ICsjZW5kaWYNCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgIC8qDQo+ID4gICAgKiBEbyB0aGUgYWN0dWFsIG1vdmVtZW50IG9mIGFuIHVuaXQgZnJv
bSBvbGQgdG8gbmV3IENQVS4gTG9ja3MgZm9yICpib3RoKg0KPiA+ICAgICogQ1BVcyBuZWVkcyB0
byBoYXZlIGJlZW4gdGFrZW4gYWxyZWFkeSB3aGVuIGNhbGxpbmcgdGhpcyENCj4gPiBAQCAtMjYx
NSw2ICsyNjQ2LDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkNCj4gPiAgIA0KPiA+ICAg
ICAgIFNDSEVEX1NUQVRfQ1JBTksoc2NoZWRfcnVuKTsNCj4gPiAgIA0KPiA+ICsgICAgdmNwdV9l
bmRfaHlwX3Rhc2soY3VycmVudCk7DQo+ID4gICAgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVz
X3JjdWxvY2spOw0KPiA+ICAgDQo+ID4gICAgICAgbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19p
cnEoY3B1KTsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zb2Z0aXJxLmMgYi94ZW4vY29t
bW9uL3NvZnRpcnEuYw0KPiA+IGluZGV4IDA2M2U5M2NiZTMuLjAzYTI5Mzg0ZDEgMTAwNjQ0DQo+
ID4gLS0tIGEveGVuL2NvbW1vbi9zb2Z0aXJxLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3NvZnRp
cnEuYw0KPiA+IEBAIC03MSw3ICs3MSw5IEBAIHZvaWQgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFz
KHZvaWQpDQo+ID4gICB2b2lkIGRvX3NvZnRpcnEodm9pZCkNCj4gPiAgIHsNCj4gPiAgICAgICBB
U1NFUlRfTk9UX0lOX0FUT01JQygpOw0KPiA+ICsgICAgdmNwdV9iZWdpbl9oeXBfdGFzayhjdXJy
ZW50KTsNCj4gPiAgICAgICBfX2RvX3NvZnRpcnEoMCk7DQo+ID4gKyAgICB2Y3B1X2VuZF9oeXBf
dGFzayhjdXJyZW50KTsNCj4gDQo+IFRoaXMgd29uJ3Qgd29yayBmb3Igc2NoZWR1bGluZy4gY3Vy
cmVudCB3aWxsIGVpdGhlciBoYXZlIGNoYW5nZWQsDQo+IG9yIGluIHg4NiBjYXNlIF9fZG9fc29m
dGlycSgpIG1pZ2h0IGp1c3Qgbm90IHJldHVybi4gWW91IG5lZWQgdG8NCj4gaGFuZGxlIHRoYXQg
Y2FzZSBleHBsaWNpdGx5IGluIHNjaGVkdWxlKCkgKHlvdSBkaWQgdGhhdCBmb3IgdGhlDQo+IG9s
ZCB2Y3B1LCBidXQgZm9yIHRoZSBjYXNlIHNjaGVkdWxlKCkgaXMgcmV0dXJuaW5nIHlvdSBuZWVk
IHRvDQo+IGNhbGwgdmNwdV9iZWdpbl9oeXBfdGFzayhjdXJyZW50KSB0aGVyZSkuDQo+IA0KDQpX
ZWxsLCB0aGlzIGlzIG9uZSBvZiBxdWVzdGlvbnMsIEkgd2FudGVkIHRvIGRpc2N1c3MuIEkgY2Vy
dGFpbmx5IG5lZWQNCnRvIGNhbGwgdmNwdV9iZWdpbl9oeXBfdGFzayhjdXJyZW50KSBhZnRlciBj
b250ZXh0IHN3aXRjaC4gQnV0IHdoYXQgaXQNCmlzIHRoZSByaWdodCBwbGFjZT8gSWYgbXkgdW5k
ZXJzdGFuaW5nIGlzIHJpZ2h0LCBjb2RlIG9uIHg4NiBwbGF0Zm9ybQ0Kd2lsbCBuZXZlciByZWFj
aCB0aGlzIHBvaW50LiBPciBJJ20gd3JvbmcgdGhlcmU/DQoNCg0K

