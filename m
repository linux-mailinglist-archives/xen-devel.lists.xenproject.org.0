Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFBD1FFC74
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 22:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm15k-0001DD-Dh; Thu, 18 Jun 2020 20:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e1t=77=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jm15i-0001D8-DD
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 20:24:54 +0000
X-Inumbo-ID: c3ed96fa-b1a1-11ea-bca7-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3ed96fa-b1a1-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 20:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRXjcZREO5np5G9LlJHR4XgjxIPHfVbgc3JktwIpWth+6/c3GThfQZdOS11Bgmu4dRGaJdYrAD/xHrmsU4jTzpIKIgYh35V8GpE1QTEjpYE6otAB2MYoAIdNkRH8p0j22V+dPYiz8t7bgU7herUZEBHemRH/1vIILbckVDHCGbfeNBXZdZF2vv0oP6EcdAKQtBtr5Ti5sd0s1DcMzjUNFMSe5clDK3X7t6debEJ4leMaJKnu4dwKiuAo1htEDn4BJB2HMtoMW4ODoUOITFyv/ZWF8TERlHUGLfDWh/0pQRnc0UWF00BkvztlBFoQQzou8YhhXuv/v7C38cvyMrs0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na25ahuFea09fEF4sXKL6wV565mkcRkDMhGmlR1U5HY=;
 b=nsi/c8etmavMETBhjOsVfAk31CajvD1AmYegegwhoIsx9V1n6Cp4RPlB2dnPhgIowUM7sG/xZ/uEgpge7Uk9DJWm5Ks5aZQrhWehiwGVwxuUjvejlf82Ymy4zDJrM6ZdlNbukZTpWc70OCCsBC8DFSVwkwz0DBO+csdBDoXzvbHAGgANfnpd1gCfH4u6siiX0TQCJViDP42ZSd20GxOj4mfuNn0RG8SKycCmon3rVU8Yj9Mr3UhD8+hSHvDP4ZPstLICWEKR2gNmeKgFh7/kVoKanvDDUWT87voXMbQtd4keyDzI+UtRFX+C1EbOofgV952SJXEE0Hh7l7vl4WTS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na25ahuFea09fEF4sXKL6wV565mkcRkDMhGmlR1U5HY=;
 b=4v+uTtSy1j/FcqtDlc4x2TmyYYhoz7RTm3yANEvtERRTUnA4zKiB2ggduKWuREfR5CILCM6bAB/IHau7+1rlrgR6wyDGSrhNTNkCndEvh8ApEZWXeUYvZ7cT3Ymra+Pyzh3GgJMPlpypkY6LNj77PnUNLDLFGaIKh1653pED4f1PsNTHw5qS6d/enyIRweMmDoV2iOtU/71fT4q3f0AITeJyRdZ9Spaynb5a+k0cYIYYpxkzCfo9c+theE7oHGhg4xq9JJ05PUlv1lLgEc0rsBAGk34/hzetsLb1ZsxbT1uZHfA7MZj5ejynQ2mUf06qTc577YrCQq6hJKO7+h99hw==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB4032.eurprd03.prod.outlook.com (2603:10a6:803:72::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 20:24:49 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3088.028; Thu, 18 Jun 2020
 20:24:49 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZqjUa0CAgABx3ACAABDmgIAJ7mUA
Date: Thu, 18 Jun 2020 20:24:48 +0000
Message-ID: <87imfo2kbz.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
 <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org>
In-Reply-To: <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1752c83-c660-41e2-0263-08d813c5a68d
x-ms-traffictypediagnostic: VI1PR03MB4032:
x-microsoft-antispam-prvs: <VI1PR03MB40323CD62AC511FDBE567F8BE69B0@VI1PR03MB4032.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:318;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTgmo/5KzS0Kbn82zkeyEXZVDVU+s3OGv+GxMJC2TPLzpBFBrULUXmFm53UXXPKkHa4CPEY44K8RqjFUtcf/1WT4w3RN1hxrs4wr7IDOqmP8DWqY3G5PjwYIc47eJ+Tm+l8D7alD0BhcJ0N6JDk7iiwz0TbnkholmS4QttG8AsSBXu9WZJMe9SPP66I8Bzp+asgIEMlnfUvQQrVRK9EW5UnY/Mwxji9/H9GYVWMWukfgRNbHswKkn83VCYF3LPJChFmlTBIx83Jd/Z2/e7izYP0gGsIndgeklrQytI8RtujbH8bXJzci31+59i8n/j1s9pbBGmSGbMgNzgjnNh9slA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(66574015)(83380400001)(71200400001)(91956017)(66946007)(6486002)(66476007)(66446008)(76116006)(6512007)(4326008)(5660300002)(86362001)(64756008)(66556008)(6506007)(6916009)(7416002)(2906002)(8936002)(53546011)(316002)(2616005)(54906003)(478600001)(186003)(8676002)(36756003)(26005)(55236004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8UAF4QMc6VytnRD2mlFEE0cLDr8YYdpoNN/8fTn9e0WOfYWw0X9IxeqwF4CDBWmFwXToIblf8e3Cg7bKyK27emUNaEAhzi5tmAtURHnTne8XdnKRv9TNA6Hj5OQWuzVZTksqbFPpHofFUD1t6+fkx28CC63w9ZEurkabjUf7X1y+HEIkLs7FwsIl1PyxqF5Yyu/x3/0CSxxm6ZzD1N4hWTzgaF2rLMq/mgd3zQtcpOeWWRXbvkZIV1k69JIrvIYMChJKh9xyT0nxq6dac7dzH9FXoSe+TiZBzkoXoD7mD/sCBCQGED9uPPXB5DjkU5K99qMg5ONZTD20LN+/QLxPALwnFIKXFf1D6x1IGuelQP6x87G8NialIatuS0eE3RteWJp4jKhUmS2nR32TRX3UtHpeQhqecORbkZwQ4/xfzMuViGw069o45kW1VakjZjPOxs9eKesVJSiC+x0GZCN51gM51Ov+x0ZzjNyvoVKfvC8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <01167F0B1A3DC244895F53C795BEFD81@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1752c83-c660-41e2-0263-08d813c5a68d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:24:48.7194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8ww+lKZ2rT1R9HySn85dHPlFNvWbUSMpy5p6UYuA7i2URxGaJ4D/N4mKbaWZA4P5WBnjQPMt39H8BHIieOXJq1WnOb1WsxsiiRwS+VBa8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4032
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpIaSBKdWxpZW4sDQoNCkp1bGllbiBHcmFsbCB3cml0ZXM6DQoNCj4gSGkgVm9sb2R5bXlyLA0K
Pg0KPiBPbiAxMi8wNi8yMDIwIDEyOjQ0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+DQo+
PiBPbiBGcmksIDIwMjAtMDYtMTIgYXQgMDY6NTcgKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+Pj4gT24gMTIuMDYuMjAgMDI6MjIsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4+PiBB
cyBzY2hlZHVsZXIgY29kZSBub3cgY29sbGVjdHMgdGltZSBzcGVudCBpbiBJUlEgaGFuZGxlcnMg
YW5kIGluDQo+Pj4+IGRvX3NvZnRpcnEoKSwgd2UgY2FuIHByZXNlbnQgdGhvc2UgdmFsdWVzIHRv
IHVzZXJzcGFjZSB0b29scyBsaWtlDQo+Pj4+IHhlbnRvcCwgc28gc3lzdGVtIGFkbWluaXN0cmF0
b3IgY2FuIHNlZSBob3cgc3lzdGVtIGJlaGF2ZXMuDQo+Pj4+DQo+Pj4+IFdlIGFyZSB1cGRhdGlu
ZyBjb3VudGVycyBvbmx5IGluIHNjaGVkX2dldF90aW1lX2NvcnJlY3Rpb24oKSBmdW5jdGlvbg0K
Pj4+PiB0byBtaW5pbWl6ZSBudW1iZXIgb2YgdGFrZW4gc3BpbmxvY2tzLiBBcyBhdG9taWNfdCBp
cyAzMiBiaXQgd2lkZSwgaXQNCj4+Pj4gaXMgbm90IGVub3VnaCB0byBzdG9yZSB0aW1lIHdpdGgg
bmFub3NlY29uZCBwcmVjaXNpb24uIFNvIHdlIG5lZWQgdG8NCj4+Pj4gdXNlIDY0IGJpdCB2YXJp
YWJsZXMgYW5kIHByb3RlY3QgdGhlbSB3aXRoIHNwaW5sb2NrLg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+
Pj4+IC0tLQ0KPj4+PiAgICB4ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyAgICAgfCAxNyArKysrKysr
KysrKysrKysrKw0KPj4+PiAgICB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAgMSArDQo+
Pj4+ICAgIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8ICA0ICsrKy0NCj4+Pj4gICAgeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICAgIHwgIDIgKysNCj4+Pj4gICAgNCBmaWxlcyBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+
IGluZGV4IGE3Mjk0ZmY1YzMuLmVlNmIxZDkxNjEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9jb21t
b24vc2NoZWQvY29yZS5jDQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+
IEBAIC05NSw2ICs5NSwxMCBAQCBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBfX3JlYWRfbW9zdGx5
IG9wczsNCj4+Pj4gICAgICAgc3RhdGljIGJvb2wgc2NoZWR1bGVyX2FjdGl2ZTsNCj4+Pj4gICAg
K3N0YXRpYyBERUZJTkVfU1BJTkxPQ0soc2NoZWRfc3RhdF9sb2NrKTsNCj4+Pj4gK3NfdGltZV90
IHNjaGVkX3N0YXRfaXJxX3RpbWU7DQo+Pj4+ICtzX3RpbWVfdCBzY2hlZF9zdGF0X2h5cF90aW1l
Ow0KPj4+PiArDQo+Pj4+ICAgIHN0YXRpYyB2b2lkIHNjaGVkX3NldF9hZmZpbml0eSgNCj4+Pj4g
ICAgICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCBjb25zdCBjcHVtYXNrX3QgKmhhcmQsIGNv
bnN0IGNwdW1hc2tfdCAqc29mdCk7DQo+Pj4+ICAgIEBAIC05OTQsOSArOTk4LDIyIEBAIHNfdGlt
ZV90IHNjaGVkX2dldF90aW1lX2NvcnJlY3Rpb24oc3RydWN0DQo+Pj4+IHNjaGVkX3VuaXQgKnUp
DQo+Pj4+ICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+PiAgICAgICAgfQ0KPj4+PiAgICArICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZF9zdGF0X2xvY2ssIGZsYWdzKTsNCj4+Pj4gKyAgICBz
Y2hlZF9zdGF0X2lycV90aW1lICs9IGlycTsNCj4+Pj4gKyAgICBzY2hlZF9zdGF0X2h5cF90aW1l
ICs9IGh5cDsNCj4+Pj4gKyAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZF9zdGF0X2xv
Y2ssIGZsYWdzKTsNCj4+Pg0KPj4+IFBsZWFzZSBkb24ndCB1c2UgYSBsb2NrLiBKdXN0IHVzZSBh
ZGRfc2l6ZWQoKSBpbnN0ZWFkIHdoaWNoIHdpbGwgYWRkDQo+Pj4gYXRvbWljYWxseS4NCj4+DQo+
PiBMb29rcyBsaWtlIGFybSBkb2VzIG5vdCBzdXBwb3J0IDY0IGJpdCB2YXJpYWJsZXMuID4NCj4+
IEp1bGllbiwgSSBiZWxpZXZlLCB0aGlzIGlzIGFybXY3IGxpbWl0YXRpb24/IFNob3VsZCBhcm12
OCB3b3JrIHdpdGggNjQtDQo+PiBiaXQgYXRvbWljcz8NCj4NCj4gNjQtYml0IGF0b21pY3MgY2Fu
IHdvcmsgb24gYm90aCBBcm12NyBhbmQgQXJtdjggOikuIEl0IGp1c3QgaGF2ZW4ndA0KPiBiZWVu
IHBsdW1iZWQgeWV0Lg0KPg0KPiBJIGFtIGhhcHB5IHRvIHdyaXRlIGEgcGF0Y2ggaWYgeW91IG5l
ZWQgYXRvbWljNjRfdCBvciBldmVuIGEgNjQtYml0DQo+IGFkZF9zaXplZCgpLg0KDQpMb29rcyBs
aWtlIEknbGwgbmVlZCB0aGlzIHBhdGNoLiBTbywgaWYgeW91IHN0aWxsIGhhdmUgdGltZSwgaXQg
d2lsbCBiZQ0KZ3JlYXQsIGlmIHlvdSdsbCB3cml0ZSBpdC4NCg0KLS0gDQpWb2xvZHlteXIgQmFi
Y2h1ayBhdCBFUEFN

