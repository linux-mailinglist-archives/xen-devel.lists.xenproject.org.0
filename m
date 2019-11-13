Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307FFB63C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 18:19:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUwF9-00005H-4j; Wed, 13 Nov 2019 17:15:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=59Tz=ZF=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iUwF7-00005B-RT
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 17:15:46 +0000
X-Inumbo-ID: 399d072e-0639-11ea-9631-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 399d072e-0639-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 17:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHPRns9cBkCpb5s6aZ/YKvmW3jpmWbZ3WFb3HJ+a35/kvrQeoMOLvLxpUMkHlBO+PvZ7D40jwQNNDKC4x7IufVq0ffx9WQaRJ5twXQ+R6Uof83VAAXNmcLFUg/YEwsIhUgDkc5MztMDO0vSg7RTwP9vJTAzG3s2YhdDfEcRO+/rKA6PRq9oLZAgDbVs47bl8qNdHgvif2EyV0DrjQGK2NnctydIelWMzxT66Ln4iuDOywl8FZWRWxqNzp4v8Srt0/nfFx+yTgZMmBRtYKhTirHannkCS5qP6APYoLeM40HRTvnuKIhSTKWZ6GEuxEXd0gUZt6TAtROqEStqtlpHUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiAg/dRECPTdF0WmKyL48YQKwpWRDbSai1e5Tc7+nSg=;
 b=RaKdbHU95oYToKlwsAwx8YzkhQh+Q4FSysvEw6wxxi/nuPEBvS2QSmaWWNYnfSc/t7aNzub8yGkD+uCWfyj4Uv8QHx9bFAczw/Z6ms6eEixSSAewEh3Rch+/XUyLuDLopITPwaABItO1pqd+kAYeKjg9LuSEZjWuB9400P8pHR+8I3bly7/8oY3DRlDCRKHwLvxRK8By5oxK3+8x89p0G0fvYN0j2Dhet3QNSgsR+Cv38Ke3HIoUhfIi4ICnV0+qjLQEQlTabVHx6c/KJ2pq9CH0g+BtpH4u/FY7BEeWZpfqmsjgFbFtQd6csfoLgteG0khMYcM6qYdYzGF7dUFrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiAg/dRECPTdF0WmKyL48YQKwpWRDbSai1e5Tc7+nSg=;
 b=iz0gBl19Qs/I/eHhY/9UGvXEA6FWexW+NHU4kgmUth3g7tUyK0r43eNmLQ6ap44RUogqfaX8+SpGBaYpJWUteywTssE3JlNjZRXgCWShE4KncGsx5lZKVFvE8fkfu+K88OYlGphtjzNtJf/8zSbTRDZxj/SRM9pF95aA2r6XQPA=
Received: from VI1PR03MB3711.eurprd03.prod.outlook.com (52.134.23.12) by
 VI1PR03MB4222.eurprd03.prod.outlook.com (20.177.49.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 13 Nov 2019 17:15:42 +0000
Received: from VI1PR03MB3711.eurprd03.prod.outlook.com
 ([fe80::6d07:a394:76bb:3c02]) by VI1PR03MB3711.eurprd03.prod.outlook.com
 ([fe80::6d07:a394:76bb:3c02%5]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 17:15:42 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "joculator@gmail.com" <joculator@gmail.com>, "jbeulich@suse.com"
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
Thread-Index: AQHVlINpq/WqWBMLtEGyFFz1SWBMp6d+RJSAgABv4gCAAJ06AIAKEU4A
Date: Wed, 13 Nov 2019 17:15:41 +0000
Message-ID: <8337bf4b07903b75a6690880e58ca117e9c08a47.camel@epam.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
 <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
 <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
In-Reply-To: <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.141.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 898f47b7-cb03-4064-a057-08d7685d1cfa
x-ms-traffictypediagnostic: VI1PR03MB4222:|VI1PR03MB4222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB42222D084478E5102606BEFFF4760@VI1PR03MB4222.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(189003)(199004)(36756003)(55236004)(6506007)(53546011)(102836004)(76176011)(446003)(11346002)(2616005)(476003)(186003)(486006)(99286004)(26005)(80792005)(8676002)(305945005)(7416002)(76116006)(7736002)(91956017)(8936002)(256004)(81166006)(81156014)(14444005)(66066001)(118296001)(6116002)(3846002)(14454004)(966005)(6246003)(6512007)(6306002)(2501003)(4326008)(2906002)(478600001)(25786009)(5660300002)(110136005)(71190400001)(71200400001)(54906003)(229853002)(66556008)(64756008)(66446008)(66476007)(66946007)(316002)(86362001)(6436002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB4222;
 H:VI1PR03MB3711.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q27fB1fBk/pbkFrw9vG6URN4QVgEw11usm4uvqJ/QHqR9kElHjYSoW/fRtDmFFIVs66Mj2wzS3aEl17k+Xzzu1zXcO1neAqty0j923J6iONT6iospRHRiFHo/hleCaYY6/fG5uPB64FCr9EYLQlfw8zXHIPd69NHliNAd3yRvIv3NWumpI8fmTFC3ZgRJesFLpGbJH9G7i0c+j6kV+lu6UB8i1TrMgCPm3bXIjVq2GZV4skejbAbWD87jlDGiBuGOOhlSkAEf8EQlAfqsIuiKmtueLFdJ70dE66bTKjAaxIuSSECIHVQZC7RmZGXA3TxWGvw4XgPvT+iU6PDbWHmesnP0T58OG31jnLUXKjtz7VqMd7jcQ3y33booagBPKOgnWU2WXPqZSy6qukss4mrtv7o3PKWh70mGr2Hp/WxQdq5eRdHfJHgOTOEq0bqzBRZ
Content-ID: <FFA5E952656CC24AAE95B505AFB4B3D4@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898f47b7-cb03-4064-a057-08d7685d1cfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 17:15:42.2169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVWOhwyVAwuHjMf36XK0pGEUIJVJ27Z5cBou02k5fYhxZp3BhBrk85VAiPWovKW9oUVpf/STmZL3mn15xtZKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4222
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLA0KDQpTb3JyeSBmb3IgZGVsYXllZCByZXBseQ0KDQpPbiBUaHUsIDIwMTktMTEtMDcg
YXQgMDg6MzEgKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMS4yMDE5IDIzOjA4
LCBBcnRlbSBNeWdhaWV2IHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgNDoyOCBQ
TSBKYW4gQmV1bGljaCA8DQo+ID4gamJldWxpY2hAc3VzZS5jb20NCj4gPiA+IHdyb3RlOg0KPiA+
ID4gT24gMDYuMTEuMjAxOSAxMDoxOSwgQW5kcmlpIEFuaXNvdiB3cm90ZToNCj4gPiA+ID4gLS0t
IGEvQ29uZmlnLm1rDQo+ID4gPiA+ICsrKyBiL0NvbmZpZy5taw0KPiA+ID4gPiBAQCAtMjIxLDcg
KzIyMSw5IEBAIENGTEFHUyArPSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzDQo+ID4gPiA+IA0K
PiA+ID4gPiAgJChjYWxsIGNjLW9wdGlvbi1hZGQsSE9TVENGTEFHUyxIT1NUQ0MsLVdkZWNsYXJh
dGlvbi1hZnRlci0NCj4gPiA+ID4gc3RhdGVtZW50KQ0KPiA+ID4gPiAgJChjYWxsIGNjLW9wdGlv
bi1hZGQsQ0ZMQUdTLENDLC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50KQ0KPiA+ID4gPiAr
aWZuZXEgKCQoYXJtZHMpLHkpDQo+ID4gPiA+ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1Ms
Q0MsLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSkNCj4gPiA+ID4gK2VuZGlmDQo+ID4gPiA+
ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVduby11bnVzZWQtbG9jYWwtdHlwZWRl
ZnMpDQo+ID4gPiA+IA0KPiA+ID4gPiAgTERGTEFHUyArPSAkKGZvcmVhY2ggaSwgJChFWFRSQV9M
SUIpLCAtTCQoaSkpDQo+ID4gPiANCj4gPiA+IC4uLiB0aGlzIHdvdWxkIGJlIG5lY2Vzc2FyeS4N
Cj4gPiANCj4gPiBJIGFtIHZlcnkgc29ycnksIHRoaXMgcGF0Y2ggZG9lcyBub3QgaGF2ZSBhIHBy
b3BlciBkZXNjcmlwdGlvbg0KPiA+IGluZGVlZC4NCj4gPiANCj4gPiBGb3IgdGhpcyBwYXJ0aWN1
bGFyIGNoYW5nZSAtIGFybSBjbGFuZyBkb2VzIG5vdCB1bmRlc3RhbmQNCj4gPiAtV25vLXVudXNl
ZC1idXQtc2V0LXZhcmlhYmxlDQo+ID4gb3B0aW9uIGF0IGFsbCwgdGhhdCBpcyB3aHkgaXQgaXMg
dW5kZXIgISQoYXJtZHMpDQo+IA0KPiBCdXQgYXZvaWRpbmcgdG8gYWRkIG9wdGlvbnMgd2hpY2gg
dGhlIGNvbXBpbGVyIGRvZXNuJ3QgdW5kZXJzdGFuZA0KPiBpcyB0aGUgcHVycG9zZSBvZiB1c2lu
ZyBjYy1vcHRpb24tYWRkLCByYXRoZXIgdGhhbiBibGluZGx5DQo+IGFkZGluZw0KPiB0aGVtIHRv
IENGTEFHUy4gV2hhdCBhbSBJIG1pc3NpbmcgaGVyZT8NCg0KWW91IGFyZSByaWdodCwgdGhlIHNj
cmlwdCBzaGFsbCBjaGVjayB0aGUgY29tcGlsZXIgb3B0aW9uIGFuZCBhdm9pZA0KaW5jbHVkaW5n
IGl0IHRvIENGTEFHUy4gQnV0IGFybWNsYW5nIHJlcXVpcmUgJy0tdGFyZ2V0PS4uLicgdG8gYmUN
CnNwZWNpZmllZCBpbiBvcmRlciB0byBvcGVyYXRlIHByb3Blcmx5LCBhbmQgdGhlIHByb3BlciBm
aXggc2hhbGwgYmUNCnNvbWV0aGluZyBsaWtlIHRoaXMgKGluc3RlYWQgb2YgJ2lmbmVxJyBoYWNr
IGFib3ZlKToNCg0KZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5taw0KaW5kZXggMDE0
ODdhNy4uYWJlOGU0NCAxMDA2NDQNCi0tLSBhL0NvbmZpZy5taw0KKysrIGIvQ29uZmlnLm1rDQpA
QCAtMTA3LDcgKzEwNyw3IEBAIGNjLW9wdGlvbiA9ICQoc2hlbGwgaWYgdGVzdCAteiAiYGVjaG8g
J3ZvaWQqcD0xOycgfCBcDQogIyBVc2FnZTogJChjYWxsIGNjLW9wdGlvbi1hZGQgQ0ZMQUdTLEND
LC1tYXJjaD13aW5jaGlwLWM2KQ0KIGNjLW9wdGlvbi1hZGQgPSAkKGV2YWwgJChjYWxsIGNjLW9w
dGlvbi1hZGQtY2xvc3VyZSwkKDEpLCQoMiksJCgzKSkpDQogZGVmaW5lIGNjLW9wdGlvbi1hZGQt
Y2xvc3VyZQ0KLSAgICBpZm5lcSAoJCQoY2FsbCBjYy1vcHRpb24sJCQoJCgyKSksJCgzKSxuKSxu
KQ0KKyAgICBpZm5lcSAoJCQoY2FsbCBjYy1vcHRpb24sJCQoJCgyKSAkKDEpKSwkKDMpLG4pLG4p
DQogICAgICAgICAkKDEpICs9ICQoMykNCiAgICAgZW5kaWYNCiBlbmRlZg0KDQpzbyB0aGF0IENG
TEFHUyB0aGF0IGFyZSBhbHJlYWR5IGRlZmluZWQgYW5kIGluY2x1ZGUgJy0tdGFyZ2V0PS4uLicN
Cm9wdGlvbiBmcm9tIGNvbmZpZy9hcm0qLm1rIGFyZSBwYXNzZWQgdG8gY29tcGlsZXIgdG8gbWFr
ZSBpdCBoYXBweS4gSQ0KYW0gbm90IHN1cmUgaWYgdGhpcyBicmVha3MgYW55dGhpbmcgZWxzZSBz
byBkZWNpZGVkIHRvIGdvIHdpdGggdWdseQ0KJ2lmbmVxJyBoYWNrIGFuZCBjaGVjayBob3cgdGhp
cyBjYW4gYmUgc29sdmVkIGxhdGVyIG9uLg0KDQo+IEphbg0KPiANCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlz
dA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gDQo+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVsX187IUs2ZG1HQ0VhYjR1ZUpnIW1mQUtVZkdEblJQZ05Ia3NNbGZmYUxycHR1
N2RlbWtMSEFwYTNTVHNIUlNLeW9IbnVzWWJDTHpoTGpEOEtfdnBGdyQNCj4gIA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
