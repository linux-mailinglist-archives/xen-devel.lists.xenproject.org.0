Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C875320EE25
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 08:13:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jq9WA-0008UL-3H; Tue, 30 Jun 2020 06:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuA8=AL=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jq9W8-0008UG-RS
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 06:13:17 +0000
X-Inumbo-ID: c82a6752-ba98-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c82a6752-ba98-11ea-b7bb-bc764e2007e4;
 Tue, 30 Jun 2020 06:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI+5iJI7bVggoSGXeuI2UylzrQGYOwzhAY0t+7Xj3gBd0+Oj8kwFdUC63wwdXWaMz7lctjkpG6kb3ugY6rvIlW0BQyhugTXAnBpElY8o0fepUjo8kCm/HFWDh86TZ/D2MnB3vLERUM972hKTDXrTgvwH20LbgYZySoXf97ZAv5fZ3b5jcTsF705fZctBDXYVUmBXP342m3z56YKU1qEweG3fe6BLG30+Ekhm1ZxKS+8vfSMaje4zLKc4Dc0N5whmJYzFosEz+oYkuWg2HlAEzp2qU+9tu86wuWg0mbWRVPRNKOGwAoWFt/+SrI1UD4EVrrboSJfiBQ7sV2jfwfSFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61vwN2V36GBMz5mPLFU4NiZAqYGrODMeIOVzsgiE85w=;
 b=lMJHq0EuRi6qNpo6qCFBLXOJc2/TkGt5LtWVMHP6r7k3EpcKfWGrs+MkqffL98fBvlEQMkdgtfFO/CgppoVMroG17Z7jiW5DMStlHN7SGPMzQ/zfs8y9E7yxyPwF50AOZ1niY3RI0knvWanxDy3mIpg98Ysab3Jx9qE9i0LrHoOHCDMZpYqwvVAcMHsT86HZcVrdghXIib60HJfLN2O41Ny1tVi333xremXLSWwGYDLtCWzcMxTL7V2uNJDiXYej9kXZE8BoQIe0n9rgK/5rfc1y5ojHnW2LyLZsZG38Rjsezg86isl3t5S8/ED3G25dLQVe/EKvEB4FY1E9YxbVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61vwN2V36GBMz5mPLFU4NiZAqYGrODMeIOVzsgiE85w=;
 b=Ok/h4mF2NNC1LSclaZqiM3uUPBr92r4wYKwizp7z1Ic9yUBJaZtt4MwxPHWUsHQqp3PRTZ2EDe/2nuUhhJ6WHirvid2mFjsFbpu5UXq35VzH6rMJZqlqPxkIX21RzcwFRGsKPkOqjwaNjvMYH1f0F7yDddkrtZVhW7Ksu6xvRW4Edxv+gmHAhEG0p4t9jXG5qehPRUni3HyjcLNTqNR6BqqBKgpI3BrBLA6j+5zEggt+8vzKUPwon04Qvie1XtZFzyPRgaSWc28VJXCoI8CZ9BQXgZDPja6d27sPoKA+lUEP9P24/Y9TAK0CV+Qref9meZDTphceOfBuNitHz7cJXg==
Received: from DB7PR03MB3993.eurprd03.prod.outlook.com (2603:10a6:5:38::26) by
 DBBPR03MB5414.eurprd03.prod.outlook.com (2603:10a6:10:d8::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.24; Tue, 30 Jun 2020 06:13:13 +0000
Received: from DB7PR03MB3993.eurprd03.prod.outlook.com
 ([fe80::e500:29a2:9c1a:bdfe]) by DB7PR03MB3993.eurprd03.prod.outlook.com
 ([fe80::e500:29a2:9c1a:bdfe%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 06:13:12 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] xen/displif: Protocol version 2
Thread-Topic: [PATCH 1/2] xen/displif: Protocol version 2
Thread-Index: AQHWLoWtcyE1H7HtP020nOg+0Ywa4ajvaVUAgAGEr4A=
Date: Tue, 30 Jun 2020 06:13:12 +0000
Message-ID: <e6266bcc-fe03-f1cd-2a0f-40f128813b78@epam.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-2-andr2000@gmail.com>
 <84d975e3-0cea-becb-f505-856368a63fb7@suse.com>
In-Reply-To: <84d975e3-0cea-becb-f505-856368a63fb7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57d80ae7-5901-42e3-50e3-08d81cbcab76
x-ms-traffictypediagnostic: DBBPR03MB5414:
x-microsoft-antispam-prvs: <DBBPR03MB5414FC4601A28E7DB9159586E76F0@DBBPR03MB5414.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ow76W9sF7wbpSUjRpdEaMx43LZ3i4ZFZQP/Xtq3Jrr2mR59NvAeOjKyQkckMltcYlxV66pcxdufFJ3JNcL3vKPz65v0UGn673MCdGZLuRjvPotVXyCDDu3FdqBHZvXPwbHbR8WL0b9+nEicqHHacvD+tHlcMe9OqF17X5SzWcvRg1Xz+x/ChvsmVosDPONm4OUZx4NBCWgO1ZDvWMRHQtgkCE1VfKRjqNorWIUC0h+8NeNf0RBh0SgYbcawfAt1ep0+5iSMVZY7oN8hWt23xPthb/iYwL3mxqfjeamrwxwQdoEi+X9gxO5BbDQL6TmswbU1xCtSsN3S/KmGl9R9yjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR03MB3993.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(31686004)(5660300002)(66476007)(66556008)(6512007)(8936002)(53546011)(2616005)(66446008)(66946007)(64756008)(6506007)(76116006)(86362001)(91956017)(478600001)(6486002)(31696002)(83380400001)(2906002)(36756003)(316002)(26005)(8676002)(110136005)(71200400001)(186003)(66574015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: JsgkQC0z861VS9OQSq/P017xls4QyqQPdCQ4ymB2X59tj/0tjHBrLdLRhcdlE2mt0dYbRLvXeFE8oFpyhkwwd0ZTwjZqG1KeKpNLmymU3JEPxZpQvlhZ5kADpFSnLlB5FBVrzl3ZOTtB0sntMO35qqhXR926aLGX7Yaohgm9fvmbSXrkEC+mSYcBcqNU87PfwEj775mbXDyKAihvzdAUQBjczyhy3D7Hpicq78PTntLsNCEL1o0/GjN2n0Od6l+T3HZQVeNKp0wIQhpFn8wXUljQ7xhoEnBpJfsKWlhiU+ROEocxBoejRouoQmELN1uY3tckht47G5w9mHlMLf5dtv4XgWMfc/rVGX9s+e0CGHpZws5a6lXOpGqrT83S8hq7ROtxBFYf2/b8qlKd8XoWxXSS5rfsEVKoweyQvRYphxgjUU6Qt3wukzvN09nshC48YjKsBd0CxkL4rn0/fYmkSkE6yvg093P0ckzAIKJOUsE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B43E7B62C4AF734389B23E0741C29E2F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3993.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d80ae7-5901-42e3-50e3-08d81cbcab76
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 06:13:12.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WAbxOPvO/MnL7pSMoQclDjaKdbZFVhcLP6tktqhVn5j11gQwHQ5kSmmXHWlqTSwkFp/1DipJgRhq9FHhSw50Nqe2m9mcNGt3VH2sUQaM/IShSATwYRanlxy7yx5yZhh0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5414
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8yOS8yMCAxMDowMiBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMjAuMDUuMjAg
MTE6MDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IDEuIENoYW5nZSBwcm90b2NvbCB2ZXJzaW9uIGZyb20gc3RyaW5nIHRvIGludGVnZXINCj4+DQo+
PiBWZXJzaW9uIHN0cmluZywgd2hpY2ggaXMgaW4gZmFjdCBhbiBpbnRlZ2VyLCBpcyBoYXJkIHRv
IGhhbmRsZSBpbiB0aGUNCj4+IGNvZGUgdGhhdCBzdXBwb3J0cyBkaWZmZXJlbnQgcHJvdG9jb2wg
dmVyc2lvbnMuIFRvIHNpbXBsaWZ5IHRoYXQNCj4+IG1ha2UgdGhlIHZlcnNpb24gYW4gaW50ZWdl
ci4NCj4+DQo+PiAyLiBQYXNzIGJ1ZmZlciBvZmZzZXQgd2l0aCBYRU5ESVNQTF9PUF9EQlVGX0NS
RUFURQ0KPj4NCj4+IFRoZXJlIGFyZSBjYXNlcyB3aGVuIGRpc3BsYXkgZGF0YSBidWZmZXIgaXMg
Y3JlYXRlZCB3aXRoIG5vbi16ZXJvDQo+PiBvZmZzZXQgdG8gdGhlIGRhdGEgc3RhcnQuIEhhbmRs
ZSBzdWNoIGNhc2VzIGFuZCBwcm92aWRlIHRoYXQgb2Zmc2V0DQo+PiB3aGlsZSBjcmVhdGluZyBh
IGRpc3BsYXkgYnVmZmVyLg0KPj4NCj4+IDMuIEFkZCBYRU5ESVNQTF9PUF9HRVRfRURJRCBjb21t
YW5kDQo+Pg0KPj4gQWRkIGFuIG9wdGlvbmFsIHJlcXVlc3QgZm9yIHJlYWRpbmcgRXh0ZW5kZWQg
RGlzcGxheSBJZGVudGlmaWNhdGlvbg0KPj4gRGF0YSAoRURJRCkgc3RydWN0dXJlIHdoaWNoIGFs
bG93cyBiZXR0ZXIgY29uZmlndXJhdGlvbiBvZiB0aGUNCj4+IGRpc3BsYXkgY29ubmVjdG9ycyBv
dmVyIHRoZSBjb25maWd1cmF0aW9uIHNldCBpbiBYZW5TdG9yZS4NCj4+IFdpdGggdGhpcyBjaGFu
Z2UgY29ubmVjdG9ycyBtYXkgaGF2ZSBtdWx0aXBsZSByZXNvbHV0aW9ucyBkZWZpbmVkDQo+PiB3
aXRoIHJlc3BlY3QgdG8gZGV0YWlsZWQgdGltaW5nIGRlZmluaXRpb25zIGFuZCBhZGRpdGlvbmFs
IHByb3BlcnRpZXMNCj4+IG5vcm1hbGx5IHByb3ZpZGVkIGJ5IGRpc3BsYXlzLg0KPj4NCj4+IElm
IHRoaXMgcmVxdWVzdCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBiYWNrZW5kIHRoZW4gdmlzaWJs
ZSBhcmVhDQo+PiBpcyBkZWZpbmVkIGJ5IHRoZSByZWxldmFudCBYZW5TdG9yZSdzICJyZXNvbHV0
aW9uIiBwcm9wZXJ0eS4NCj4+DQo+PiBJZiBiYWNrZW5kIHByb3ZpZGVzIGV4dGVuZGVkIGRpc3Bs
YXkgaWRlbnRpZmljYXRpb24gZGF0YSAoRURJRCkgd2l0aA0KPj4gWEVORElTUExfT1BfR0VUX0VE
SUQgcmVxdWVzdCB0aGVuIEVESUQgdmFsdWVzIG11c3QgdGFrZSBwcmVjZWRlbmNlDQo+PiBvdmVy
IHRoZSByZXNvbHV0aW9ucyBkZWZpbmVkIGluIFhlblN0b3JlLg0KPj4NCj4+IDQuIEJ1bXAgcHJv
dG9jb2wgdmVyc2lvbiB0byAyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4g
wqAgeGVuL2luY2x1ZGUvcHVibGljL2lvL2Rpc3BsaWYuaCB8IDgzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9p
by9kaXNwbGlmLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vZGlzcGxpZi5oDQo+PiBpbmRleCBj
YzVkZTljYjFmMzUuLjRkNDNiYTUwNzhjOCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9pby9kaXNwbGlmLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9kaXNwbGlm
LmgNCj4+IEBAIC0zOCw3ICszOCw3IEBADQo+PiDCoMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFByb3RvY29sIHZlcnNpb24NCj4+ICoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKg0KPj4gwqDCoCAqLw0KPj4gLSNkZWZpbmUgWEVORElTUExfUFJPVE9D
T0xfVkVSU0lPTsKgwqDCoMKgICIxIg0KPj4gKyNkZWZpbmUgWEVORElTUExfUFJPVE9DT0xfVkVS
U0lPTsKgwqDCoMKgIDINCj4NCj4gVGhpcyBpcyBub3QgdmVyeSBuaWNlIHJlZ2FyZGluZyBjb21w
YXRpYmlsaXR5Lg0KPg0KPiBDYW4ndCB5b3UgYWRkIGEgbmV3IG1hY3JvIGZvciB0aGUgaW50ZWdl
ciB2YWx1ZT8NCg0KV2UgY2FuIGxlYXZlIGl0IGFzIGlzLCBlLmcuIGRlZmluZSBYRU5ESVNQTF9Q
Uk9UT0NPTF9WRVJTSU9OIGFzICIyIiwNCg0Kc28gd2UgZG8gbm90IGJyZWFrIHRoZSBleGlzdGlu
ZyB1c2Vycy4gVGhlbiBpZiBldmVyeSB1c2VyIG9mIHRoZSBoZWFkZXIgaGFzDQoNCml0cyBsb2Nh
bCBjb3B5ICh0aGlzIGlzIHdoYXQgd2Ugbm93IHVzZSBpbiB0aGUgZGlzcGxheSBiYWNrZW5kKSwg
dGhlbiB0aGF0DQpsb2NhbCBjb3B5IGNhbiBiZSBjaGFuZ2VkIGluIGEgd2F5IHN1aXRhYmxlIGZv
ciB0aGUgY29uY3JldGUgdXNlciwgZS5nLiAiMiINCg0KcmVkZWZpbmVkIHRvIDIuIFRoaXMgY2Fu
bm90IGJlIGRvbmUgKD8pIGZvciB0aGUgTGludXggS2VybmVsIHRob3VnaC4NCg0KT3Igd2UgY2Fu
IGhhdmUNCg0KI2RlZmluZSBYRU5ESVNQTF9QUk9UT0NPTF9WRVJTSU9OwqDCoMKgwqAgIjIiDQoN
CiNkZWZpbmUgWEVORElTUExfUFJPVE9DT0xfVkVSU0lPTl9JTlTCoCAyDQoNCkp1cmdlbiwgd2hh
dCdzIHlvdXIgcHJlZmVyZW5jZSBoZXJlPw0KDQo+DQo+IEFuZCBwbGVhc2UgYWRkIGNvbW1lbnRz
IGZ1cnRoZXIgZG93biB3aGljaCBhZGRpdGlvbnMgYXJlIHJlbGF0ZWQgdG8NCj4gdGhlIG5ldyB2
ZXJzaW9uLg0KSSB3aWxsIGFmdGVyIHRoZSByZXZpZXcgaXMgZG9uZSBhbmQgb3RoZXIgY29tbWVu
dHMgYXJlIGZpeGVkDQo+DQo+DQo+IEp1ZXJnZW4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHIN
Cg==

