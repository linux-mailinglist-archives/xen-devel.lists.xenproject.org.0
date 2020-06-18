Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37451FFEAB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:35:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm43m-0000MF-G5; Thu, 18 Jun 2020 23:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e1t=77=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jm43l-0000MA-EU
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:35:05 +0000
X-Inumbo-ID: 55a21aca-b1bc-11ea-8496-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.69]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55a21aca-b1bc-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 23:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXFfk1wvERFgGd+1UXPIcRuwwKox+YOZZEncHUdP1ip3r0asBZLNw5mYmklN1glYZRHTQZWecqVrakBKeC2IfLjAKZJALaeg5yI9t5QgOxm1zb/6MvgoBK+UpaPFO2rTSn5up2Nqcnuqwb3hgiHMpqFWSSNh0VOlSsbIKbIDXLsZX3a4tfkmrg0jVMcHZZv5UkuDRwn95zbzNg5/caqDaus4Ce4wGE/HSY5Vzok/SdbPzSQgf3qX2EUKM+mdwYAWsgG6i5MzcPcXPXrGhPDM3outljvUtE/iO/0SFcJW1B/6HyoED6xmucH0HS/RVewcizb2xIT57M6LJcnlTnpywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8+Q+jf5xbjTFhRDwE6iSTk5EhgelitcYhnPXcVkZmQ=;
 b=nKYnyoZX4yj0mLmLa0g2ZlNlePGg0hh90sll626enLZY7VkG8V1SefBl/PipDUgbu3cABH2spUuZddZ0Sb+KwL6vyeqMOPnMeyWae1+8KcMhFOf5h3B/rUo5eiWFQBb/WI11sjiFbu9+wwxnZzbm5UrRVEtcxVRgVT0nOjbGkJrjQrX0k7gXu0DXXfcaowVpzegQUWzZfnwN/4H8XoZkzRd213ox5OGL1qDwoQjA8QjDOuOZirHHgyHszqexr+/DgNeRXb9+Cd2A93f+38xXz+1cVACCy+ubqmUehkbL4sfjGsseYKotqUsK3Qwyo+2t7DMIZ96i14Dh9NsMf51HqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8+Q+jf5xbjTFhRDwE6iSTk5EhgelitcYhnPXcVkZmQ=;
 b=Pin5fmLU2RFWyU+K2YaFBFb5/MH0wxlBkj1rzVecJwRnuC4yXDYM3IyetCHYmulRvp0se9NdO8KLyL7+L3BnY8PSG4zSuDO1odr0uk+Kq3KbZX4LqlwzZRayAYRH4S0kr7z3hKXD315OOqf2kruaEMJMc20MgQeLVsW3sXnqUa6dzD17q0wca8uqeUJevkXUMby4zKabvnRuN+G2kRV8LXX4y7LH9p6Alv7rGE2IscgqIaMorjepY7a8KAfd0hHua5qWBL461TDNM18kQnMuepKYrrc0D4Ut/jOHiZT634nj2uACen9Y70L6pwcnpJ5v53ZwDb6fGICkp+Tn84+u+g==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB5005.eurprd03.prod.outlook.com (2603:10a6:803:b7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 23:35:02 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3088.028; Thu, 18 Jun 2020
 23:35:02 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZqjUa0CAgABx3ACAABDmgIAJ7mUAgAACzoCAADJXgA==
Date: Thu, 18 Jun 2020 23:35:02 +0000
Message-ID: <87wo440wyi.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
 <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org> <87imfo2kbz.fsf@epam.com>
 <CAJ=z9a1h1RN8EAkxZ6AY-Xw_Dcx5f80XP+Pj4RwR8PensaBTLQ@mail.gmail.com>
In-Reply-To: <CAJ=z9a1h1RN8EAkxZ6AY-Xw_Dcx5f80XP+Pj4RwR8PensaBTLQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2159aba7-9564-4816-b06d-08d813e03928
x-ms-traffictypediagnostic: VI1PR03MB5005:
x-microsoft-antispam-prvs: <VI1PR03MB50053D4F3EDC72ECFEE7ED2CE69B0@VI1PR03MB5005.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HTnX3Rys3st1K4mBkhmiDkcaIiJZtPGXWhWJsRdkPJ0EptLgf8op/CMMxB476cZQrvLT/oaKSzlBDOLcLZ78OhiBGu+MMx5aUa7MNPx9FRft1Y6ry1NJA+ReKAetlHVuoj7sQsLMWFjQLy57WY1Wvdls4+cp0BXhMgYejlWB1y1H7i/PVRuh3anVNY+rXmcQupKY0QibPZDpJICgSJRSrqK9by4fJv6SNpgTf52sAgHxRGHGhxWIq7MyBVNXHWvEuvutrSsLOg/uPzjueZth7e3CVMpInzMjzqqUgKh11pYmT2bVU+gFlqYFpbSsx+9ozCY0MXnAskT5KkayCcY8Qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(478600001)(76116006)(91956017)(86362001)(66946007)(54906003)(316002)(2616005)(66446008)(6512007)(64756008)(66556008)(66476007)(66574015)(6486002)(2906002)(6506007)(53546011)(7416002)(83380400001)(26005)(186003)(55236004)(8676002)(71200400001)(4326008)(6916009)(36756003)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uou9zL+D+E8fkdqpQh75gGzaJh57env37euLuqzV/1WYcwGAR+7NUZGSBlSfOGYAxptxq3WcJe667Mdeso+6wRoQzICHIEyropbXuoInTL5YQJfSPI1OH7fIwvKzlRujB4yQoNhzTcSqPe1nyFkopuYqjTQxH2Xj01EmQUPgKgkwGKV3yWjN2aMtw5JPGUkKxatokVXq4u+0j3CzRumT1wlZzCsPVvhVb3fmJjdaM7KzGi/aHeTkwalxTX1O3r4dXnZ7g4jYqFAaGTlnCfF6KEumtv3W7Hbby24K/DifU8eiaM0OiPdLm8sLntG5ca1OsrvllN2xRnGywmtGAaJEXCvNi9bZMdKEwn5tFzh1kV1kzdmU+aaE058xLKzgGsJjrg7dNn8xswqeAQV5b5Rc1DcfnQyUIYfr/wFyBSoboVyWSrDRNaiA3sqsMiq74QgWl/OzQ1I2mloZhyITZZeSPCOMydGqegCBDixSeqhBZv8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33BF8E2B4F17D4EA593740F2FFEB2D9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2159aba7-9564-4816-b06d-08d813e03928
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 23:35:02.4165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVd/1xv/oaaNNZ5IXzZvocdEjOKM8YG/Zh0u139DPz8xry8YE3Ngs3/vZ1YByHA667bcW5ZRa2aVoZZNA+vkrBz4l15fsJB9KxKBLKw6ZvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB5005
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

DQpIaSBKdWxpZW4sDQoNCkp1bGllbiBHcmFsbCB3cml0ZXM6DQoNCj4gT24gVGh1LCAxOCBKdW4g
MjAyMCBhdCAyMToyNCwgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVw
YW0uY29tPiB3cm90ZToNCj4+DQo+Pg0KPj4gSGkgSnVsaWVuLA0KPj4NCj4+IEp1bGllbiBHcmFs
bCB3cml0ZXM6DQo+Pg0KPj4gPiBIaSBWb2xvZHlteXIsDQo+PiA+DQo+PiA+IE9uIDEyLzA2LzIw
MjAgMTI6NDQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4gPj4NCj4+ID4+IE9uIEZyaSwg
MjAyMC0wNi0xMiBhdCAwNjo1NyArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+ID4+PiBP
biAxMi4wNi4yMCAwMjoyMiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiA+Pj4+IEFzIHNj
aGVkdWxlciBjb2RlIG5vdyBjb2xsZWN0cyB0aW1lIHNwZW50IGluIElSUSBoYW5kbGVycyBhbmQg
aW4NCj4+ID4+Pj4gZG9fc29mdGlycSgpLCB3ZSBjYW4gcHJlc2VudCB0aG9zZSB2YWx1ZXMgdG8g
dXNlcnNwYWNlIHRvb2xzIGxpa2UNCj4+ID4+Pj4geGVudG9wLCBzbyBzeXN0ZW0gYWRtaW5pc3Ry
YXRvciBjYW4gc2VlIGhvdyBzeXN0ZW0gYmVoYXZlcy4NCj4+ID4+Pj4NCj4+ID4+Pj4gV2UgYXJl
IHVwZGF0aW5nIGNvdW50ZXJzIG9ubHkgaW4gc2NoZWRfZ2V0X3RpbWVfY29ycmVjdGlvbigpIGZ1
bmN0aW9uDQo+PiA+Pj4+IHRvIG1pbmltaXplIG51bWJlciBvZiB0YWtlbiBzcGlubG9ja3MuIEFz
IGF0b21pY190IGlzIDMyIGJpdCB3aWRlLCBpdA0KPj4gPj4+PiBpcyBub3QgZW5vdWdoIHRvIHN0
b3JlIHRpbWUgd2l0aCBuYW5vc2Vjb25kIHByZWNpc2lvbi4gU28gd2UgbmVlZCB0bw0KPj4gPj4+
PiB1c2UgNjQgYml0IHZhcmlhYmxlcyBhbmQgcHJvdGVjdCB0aGVtIHdpdGggc3BpbmxvY2suDQo+
PiA+Pj4+DQo+PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlt
eXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4+ID4+Pj4gLS0tDQo+PiA+Pj4+ICAgIHhlbi9jb21tb24v
c2NoZWQvY29yZS5jICAgICB8IDE3ICsrKysrKysrKysrKysrKysrDQo+PiA+Pj4+ICAgIHhlbi9j
b21tb24vc3lzY3RsLmMgICAgICAgICB8ICAxICsNCj4+ID4+Pj4gICAgeGVuL2luY2x1ZGUvcHVi
bGljL3N5c2N0bC5oIHwgIDQgKysrLQ0KPj4gPj4+PiAgICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCAgICAgfCAgMiArKw0KPj4gPj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4+ID4+Pj4NCj4+ID4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+ID4+Pj4gaW5kZXgg
YTcyOTRmZjVjMy4uZWU2YjFkOTE2MSAxMDA2NDQNCj4+ID4+Pj4gLS0tIGEveGVuL2NvbW1vbi9z
Y2hlZC9jb3JlLmMNCj4+ID4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+ID4+
Pj4gQEAgLTk1LDYgKzk1LDEwIEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWR1bGVyIF9fcmVhZF9tb3N0
bHkgb3BzOw0KPj4gPj4+PiAgICAgICBzdGF0aWMgYm9vbCBzY2hlZHVsZXJfYWN0aXZlOw0KPj4g
Pj4+PiAgICArc3RhdGljIERFRklORV9TUElOTE9DSyhzY2hlZF9zdGF0X2xvY2spOw0KPj4gPj4+
PiArc190aW1lX3Qgc2NoZWRfc3RhdF9pcnFfdGltZTsNCj4+ID4+Pj4gK3NfdGltZV90IHNjaGVk
X3N0YXRfaHlwX3RpbWU7DQo+PiA+Pj4+ICsNCj4+ID4+Pj4gICAgc3RhdGljIHZvaWQgc2NoZWRf
c2V0X2FmZmluaXR5KA0KPj4gPj4+PiAgICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIGNv
bnN0IGNwdW1hc2tfdCAqaGFyZCwgY29uc3QgY3B1bWFza190ICpzb2Z0KTsNCj4+ID4+Pj4gICAg
QEAgLTk5NCw5ICs5OTgsMjIgQEAgc190aW1lX3Qgc2NoZWRfZ2V0X3RpbWVfY29ycmVjdGlvbihz
dHJ1Y3QNCj4+ID4+Pj4gc2NoZWRfdW5pdCAqdSkNCj4+ID4+Pj4gICAgICAgICAgICAgICAgYnJl
YWs7DQo+PiA+Pj4+ICAgICAgICB9DQo+PiA+Pj4+ICAgICsgICAgc3Bpbl9sb2NrX2lycXNhdmUo
JnNjaGVkX3N0YXRfbG9jaywgZmxhZ3MpOw0KPj4gPj4+PiArICAgIHNjaGVkX3N0YXRfaXJxX3Rp
bWUgKz0gaXJxOw0KPj4gPj4+PiArICAgIHNjaGVkX3N0YXRfaHlwX3RpbWUgKz0gaHlwOw0KPj4g
Pj4+PiArICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkX3N0YXRfbG9jaywgZmxhZ3Mp
Ow0KPj4gPj4+DQo+PiA+Pj4gUGxlYXNlIGRvbid0IHVzZSBhIGxvY2suIEp1c3QgdXNlIGFkZF9z
aXplZCgpIGluc3RlYWQgd2hpY2ggd2lsbCBhZGQNCj4+ID4+PiBhdG9taWNhbGx5Lg0KPj4gPj4N
Cj4+ID4+IExvb2tzIGxpa2UgYXJtIGRvZXMgbm90IHN1cHBvcnQgNjQgYml0IHZhcmlhYmxlcy4g
Pg0KPj4gPj4gSnVsaWVuLCBJIGJlbGlldmUsIHRoaXMgaXMgYXJtdjcgbGltaXRhdGlvbj8gU2hv
dWxkIGFybXY4IHdvcmsgd2l0aCA2NC0NCj4+ID4+IGJpdCBhdG9taWNzPw0KPj4gPg0KPj4gPiA2
NC1iaXQgYXRvbWljcyBjYW4gd29yayBvbiBib3RoIEFybXY3IGFuZCBBcm12OCA6KS4gSXQganVz
dCBoYXZlbid0DQo+PiA+IGJlZW4gcGx1bWJlZCB5ZXQuDQo+PiA+DQo+PiA+IEkgYW0gaGFwcHkg
dG8gd3JpdGUgYSBwYXRjaCBpZiB5b3UgbmVlZCBhdG9taWM2NF90IG9yIGV2ZW4gYSA2NC1iaXQN
Cj4+ID4gYWRkX3NpemVkKCkuDQo+Pg0KPj4gTG9va3MgbGlrZSBJJ2xsIG5lZWQgdGhpcyBwYXRj
aC4gU28sIGlmIHlvdSBzdGlsbCBoYXZlIHRpbWUsIGl0IHdpbGwgYmUNCj4+IGdyZWF0LCBpZiB5
b3UnbGwgd3JpdGUgaXQuDQo+DQo+IEkgb2ZmZXJlZCBoZWxwIGZvciBlaXRoZXIgdGhlIGF0b21p
YzY0X3Qgb3IgdGhlIGFkZF9zaXplZCgpLiBDYW4geW91DQo+IGNvbmZpcm0gd2hpY2ggb25lIHlv
dSBuZWVkPw0KDQpZZXMsIHNvcnJ5LiBJIGhhZCBhdG9taWM2NF90IGluIG1pbmQuDQoNCi0tIA0K
Vm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQ==

