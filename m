Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627D520EFAF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 09:40:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqArf-0006xJ-7N; Tue, 30 Jun 2020 07:39:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuA8=AL=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jqArd-0006xE-UM
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 07:39:34 +0000
X-Inumbo-ID: d4ad1a5e-baa4-11ea-85cf-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4ad1a5e-baa4-11ea-85cf-12813bfff9fa;
 Tue, 30 Jun 2020 07:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZVDP+oGMllMHaNhD6Rb8oy0A1jqb83/hn/FX0GiK8m0kl76D8raFpKhxw9F+hthMZIT0avKBEg86pTvdmWMCz8BbmFI+rX5/cxIeqrQIXh/j3cARRy6+Hgtm1CZXLpGvGW2KloDBh15LnRWab16W5+l1EmdDtnTPOLQpQn1y00+ZX/zUWcOmt8xnAqIyfLUwdL/wnFHGUc57mvQxkQei9Bs+wA4WdE1W0zX4LctNY9iwLWtnD30fZz4FLxnCdRrZ2UkUaYL/HjccevQtnADHxuG1ZogxMO8JolloYwVWF85ODGdfth+w/XHrxSna4mpHF8MRuVmVqqORga8xzJuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMJAFR1JjL+CbT7kzT03kNDIMEYU4+z+Z9sUa8/Y0tQ=;
 b=WFRYS6qnEn1rg9fbNBmeeHGoIeYsC/tOpAox1ylxXAAb2UHYlJzi/6I4wbJWvs+WCPuKvI3C+i1Uj+HDWoqGyuGla4DEQmlL9fi+5C9vHXMXPBIpP4Xc/ZQ1ysKc+lX0R/RFVEzB8KBfckV9ls4GZg4Syc64EyfZupwdZ63mHn/LhX1h57O8GGNcA5r2/FH7buz01x3vk5Oebaz1A0H1oJajhHkF729win7myY/8meblNURlLDDG48Nb1NP4LJLXj9gWN6hUTPg8EVpV2Dzne4qYqwYvqwDesLregXcZM/RALKVavUeIt+v16co4Z9aJ8Rh7NtzHOABFZCLUSUZshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMJAFR1JjL+CbT7kzT03kNDIMEYU4+z+Z9sUa8/Y0tQ=;
 b=qrIQuQKews2Kov9qX21GBRTKdIa5cCJHz8gvlD+W3BvrcGgtc0Wt7bIqOwh+lcvYsK4lW3l0SuxMYZcggiXIfo5ACcpTEVarQAA4O6MoSs5spRMhdoYnRSBvZJ2MmM27FXP1l3MA6Ks6+Vdqp2djOSHUVUGMPUE1N0oQRHxDUSELaqLgjCa7IzRiBsIK5m0oXWI0EOQJ9Rz4h6VcBPrM0WmNKo5ecZW5jE8+AcA5PlVkL4VUT6bywAGitI4XZOI1bFqzX+22Jyco88PhqIFmspsABavPjzgrp8RhA2xPpJGVWtQ1hmjLhv08fIShxGM8lTy3NSc/avgEP6hnG/xRqw==
Received: from DB7PR03MB3993.eurprd03.prod.outlook.com (2603:10a6:5:38::26) by
 DB8PR03MB5963.eurprd03.prod.outlook.com (2603:10a6:10:ee::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Tue, 30 Jun 2020 07:39:27 +0000
Received: from DB7PR03MB3993.eurprd03.prod.outlook.com
 ([fe80::e500:29a2:9c1a:bdfe]) by DB7PR03MB3993.eurprd03.prod.outlook.com
 ([fe80::e500:29a2:9c1a:bdfe%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 07:39:27 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] xen/displif: Protocol version 2
Thread-Topic: [PATCH 1/2] xen/displif: Protocol version 2
Thread-Index: AQHWLoWtcyE1H7HtP020nOg+0Ywa4ajvaVUAgAGEr4CAAA4xgIAAAaAAgAAF5ICAAAJjgA==
Date: Tue, 30 Jun 2020 07:39:27 +0000
Message-ID: <24252f32-ef40-0daf-a585-36cb00f149d0@epam.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-2-andr2000@gmail.com>
 <84d975e3-0cea-becb-f505-856368a63fb7@suse.com>
 <e6266bcc-fe03-f1cd-2a0f-40f128813b78@epam.com>
 <bbee8578-ee3c-f249-8c80-c2e47fc72ce0@suse.com>
 <80bfd713-9556-42d7-6bf7-dee85fdf8c10@gmail.com>
 <9150a2ad-7c08-1f93-674a-963341bf0ece@suse.com>
In-Reply-To: <9150a2ad-7c08-1f93-674a-963341bf0ece@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44a96f0c-3b04-43e6-6e7a-08d81cc8b7bb
x-ms-traffictypediagnostic: DB8PR03MB5963:
x-microsoft-antispam-prvs: <DB8PR03MB5963036DF65CC3792034879EE76F0@DB8PR03MB5963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uxnLF1RDrz7a8HcstAB022on/1RItWDflJkXuH2XajhGGkx7fH4WjvEf+mHg81/q8lNa6Pso2vGEkTry6vXObhXlH5LcFsJM8cuf60wfe2MUm5u7ck5KwUPvOKw1RC9HaVyJUzbPMSadzDBTl2W/lPZGGThDteTBs9BDBu7APKlbKsT6Cb6V6dUT8sLEq5ox8gu/JeaWWZ7deppppkah05p9t7tuLl+leYW2UojuAga/hBx2vhHtbVRn4uOllO8MM/4Ve9xalzqRl8/jxswLzJkr5jEmA7ijezZGDt9krXvN9w7GbgxhoMMFBkG1ZQLo+pmVlnCJHNE0WHRdk8Cfsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR03MB3993.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(5660300002)(31696002)(2616005)(31686004)(478600001)(53546011)(83380400001)(36756003)(66574015)(316002)(6486002)(64756008)(66446008)(2906002)(66476007)(66946007)(6506007)(8676002)(76116006)(8936002)(66556008)(6512007)(91956017)(71200400001)(186003)(110136005)(86362001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6ZAANq/hNUEhW6QjlTRY7GIRoREHaVIIwyPLTzGzwXzSJKg77p8r2/rIDvCnfgQ9t/6PvkZlsa8qO+j+KyduIjj1sVE3cYMrprW1y/2v8go07qom2CIGtvSHkSqtnvbeFMrsPB9lk2puP0yhe56K3TqBIkjRS9etbqPyBGTuLEpMN7i5NNWbYyweBiUQqjcIU330lnXISJkeuCKlDwCoPw7dkfmmV48Jyf8xu2RVsi5BHGMsjqHRTgh5fXYQ+cUgoMhH15jvwZ3BwutCxyTp6IhTrTmALwAaKDxlOMQsCJfLpwwxN7KwHKtW/tXX1opn7IxUPrbsS1TsaEHdSvHhodhnmgE1kfX7DZHbmPEz6ygC83q+K8LicVYe2dsRc7y2ybYvKVONPoNzN5PvfZ9dBLFBvz2YHP91EboIqu3bobPweo85UGy89ld2GjHVaY8hNozI+CmKRVChflgJ+FO3wewKxFqKUPkE1VmAGoZbIns=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C89B515506B9CA489C0A63475D2B317C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3993.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a96f0c-3b04-43e6-6e7a-08d81cc8b7bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 07:39:27.3896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNkDTMKpUT5+2gvE7kr55RJHD5+gtnBkOzaoFcWkvPsSFfjVLtCYcC/IfnqIe28cbE9ddKa1eecP5eoEEBzj0z+U7PvkhWgOSl/Mj4xUEB+Wxk3gJpSrAQOKXWp0vxwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5963
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

T24gNi8zMC8yMCAxMDozMCBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMzAuMDYuMjAg
MDk6MDksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gNi8zMC8yMCAxMDow
MyBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAzMC4wNi4yMCAwODoxMywgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDYvMjkvMjAgMTA6MDIgQU0sIErDvHJn
ZW4gR3Jvw58gd3JvdGU6DQo+Pj4+PiBPbiAyMC4wNS4yMCAxMTowNCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gMS4gQ2hhbmdl
IHByb3RvY29sIHZlcnNpb24gZnJvbSBzdHJpbmcgdG8gaW50ZWdlcg0KPj4+Pj4+DQo+Pj4+Pj4g
VmVyc2lvbiBzdHJpbmcsIHdoaWNoIGlzIGluIGZhY3QgYW4gaW50ZWdlciwgaXMgaGFyZCB0byBo
YW5kbGUgaW4gdGhlDQo+Pj4+Pj4gY29kZSB0aGF0IHN1cHBvcnRzIGRpZmZlcmVudCBwcm90b2Nv
bCB2ZXJzaW9ucy4gVG8gc2ltcGxpZnkgdGhhdA0KPj4+Pj4+IG1ha2UgdGhlIHZlcnNpb24gYW4g
aW50ZWdlci4NCj4+Pj4+Pg0KPj4+Pj4+IDIuIFBhc3MgYnVmZmVyIG9mZnNldCB3aXRoIFhFTkRJ
U1BMX09QX0RCVUZfQ1JFQVRFDQo+Pj4+Pj4NCj4+Pj4+PiBUaGVyZSBhcmUgY2FzZXMgd2hlbiBk
aXNwbGF5IGRhdGEgYnVmZmVyIGlzIGNyZWF0ZWQgd2l0aCBub24temVybw0KPj4+Pj4+IG9mZnNl
dCB0byB0aGUgZGF0YSBzdGFydC4gSGFuZGxlIHN1Y2ggY2FzZXMgYW5kIHByb3ZpZGUgdGhhdCBv
ZmZzZXQNCj4+Pj4+PiB3aGlsZSBjcmVhdGluZyBhIGRpc3BsYXkgYnVmZmVyLg0KPj4+Pj4+DQo+
Pj4+Pj4gMy4gQWRkIFhFTkRJU1BMX09QX0dFVF9FRElEIGNvbW1hbmQNCj4+Pj4+Pg0KPj4+Pj4+
IEFkZCBhbiBvcHRpb25hbCByZXF1ZXN0IGZvciByZWFkaW5nIEV4dGVuZGVkIERpc3BsYXkgSWRl
bnRpZmljYXRpb24NCj4+Pj4+PiBEYXRhIChFRElEKSBzdHJ1Y3R1cmUgd2hpY2ggYWxsb3dzIGJl
dHRlciBjb25maWd1cmF0aW9uIG9mIHRoZQ0KPj4+Pj4+IGRpc3BsYXkgY29ubmVjdG9ycyBvdmVy
IHRoZSBjb25maWd1cmF0aW9uIHNldCBpbiBYZW5TdG9yZS4NCj4+Pj4+PiBXaXRoIHRoaXMgY2hh
bmdlIGNvbm5lY3RvcnMgbWF5IGhhdmUgbXVsdGlwbGUgcmVzb2x1dGlvbnMgZGVmaW5lZA0KPj4+
Pj4+IHdpdGggcmVzcGVjdCB0byBkZXRhaWxlZCB0aW1pbmcgZGVmaW5pdGlvbnMgYW5kIGFkZGl0
aW9uYWwgcHJvcGVydGllcw0KPj4+Pj4+IG5vcm1hbGx5IHByb3ZpZGVkIGJ5IGRpc3BsYXlzLg0K
Pj4+Pj4+DQo+Pj4+Pj4gSWYgdGhpcyByZXF1ZXN0IGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGJh
Y2tlbmQgdGhlbiB2aXNpYmxlIGFyZWENCj4+Pj4+PiBpcyBkZWZpbmVkIGJ5IHRoZSByZWxldmFu
dCBYZW5TdG9yZSdzICJyZXNvbHV0aW9uIiBwcm9wZXJ0eS4NCj4+Pj4+Pg0KPj4+Pj4+IElmIGJh
Y2tlbmQgcHJvdmlkZXMgZXh0ZW5kZWQgZGlzcGxheSBpZGVudGlmaWNhdGlvbiBkYXRhIChFRElE
KSB3aXRoDQo+Pj4+Pj4gWEVORElTUExfT1BfR0VUX0VESUQgcmVxdWVzdCB0aGVuIEVESUQgdmFs
dWVzIG11c3QgdGFrZSBwcmVjZWRlbmNlDQo+Pj4+Pj4gb3ZlciB0aGUgcmVzb2x1dGlvbnMgZGVm
aW5lZCBpbiBYZW5TdG9yZS4NCj4+Pj4+Pg0KPj4+Pj4+IDQuIEJ1bXAgcHJvdG9jb2wgdmVyc2lv
biB0byAyLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+IC0tLQ0KPj4+
Pj4+IMKgwqAgeGVuL2luY2x1ZGUvcHVibGljL2lvL2Rpc3BsaWYuaCB8IDgzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLQ0KPj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDgwIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvcHVibGljL2lvL2Rpc3BsaWYuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9k
aXNwbGlmLmgNCj4+Pj4+PiBpbmRleCBjYzVkZTljYjFmMzUuLjRkNDNiYTUwNzhjOCAxMDA2NDQN
Cj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vZGlzcGxpZi5oDQo+Pj4+Pj4gKysr
IGIveGVuL2luY2x1ZGUvcHVibGljL2lvL2Rpc3BsaWYuaA0KPj4+Pj4+IEBAIC0zOCw3ICszOCw3
IEBADQo+Pj4+Pj4gwqDCoMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFByb3RvY29sIHZlcnNpb24NCj4+Pj4+PiAqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioNCj4+Pj4+PiDCoMKgwqAgKi8NCj4+Pj4+PiAtI2RlZmluZSBYRU5ESVNQTF9QUk9UT0NP
TF9WRVJTSU9OwqDCoMKgwqAgIjEiDQo+Pj4+Pj4gKyNkZWZpbmUgWEVORElTUExfUFJPVE9DT0xf
VkVSU0lPTsKgwqDCoMKgIDINCj4+Pj4+DQo+Pj4+PiBUaGlzIGlzIG5vdCB2ZXJ5IG5pY2UgcmVn
YXJkaW5nIGNvbXBhdGliaWxpdHkuDQo+Pj4+Pg0KPj4+Pj4gQ2FuJ3QgeW91IGFkZCBhIG5ldyBt
YWNybyBmb3IgdGhlIGludGVnZXIgdmFsdWU/DQo+Pj4+DQo+Pj4+IFdlIGNhbiBsZWF2ZSBpdCBh
cyBpcywgZS5nLiBkZWZpbmUgWEVORElTUExfUFJPVE9DT0xfVkVSU0lPTiBhcyAiMiIsDQo+Pj4+
DQo+Pj4+IHNvIHdlIGRvIG5vdCBicmVhayB0aGUgZXhpc3RpbmcgdXNlcnMuIFRoZW4gaWYgZXZl
cnkgdXNlciBvZiB0aGUgaGVhZGVyIGhhcw0KPj4+Pg0KPj4+PiBpdHMgbG9jYWwgY29weSAodGhp
cyBpcyB3aGF0IHdlIG5vdyB1c2UgaW4gdGhlIGRpc3BsYXkgYmFja2VuZCksIHRoZW4gdGhhdA0K
Pj4+PiBsb2NhbCBjb3B5IGNhbiBiZSBjaGFuZ2VkIGluIGEgd2F5IHN1aXRhYmxlIGZvciB0aGUg
Y29uY3JldGUgdXNlciwgZS5nLiAiMiINCj4+Pj4NCj4+Pj4gcmVkZWZpbmVkIHRvIDIuIFRoaXMg
Y2Fubm90IGJlIGRvbmUgKD8pIGZvciB0aGUgTGludXggS2VybmVsIHRob3VnaC4NCj4+Pj4NCj4+
Pj4gT3Igd2UgY2FuIGhhdmUNCj4+Pj4NCj4+Pj4gI2RlZmluZSBYRU5ESVNQTF9QUk9UT0NPTF9W
RVJTSU9OwqDCoMKgwqAgIjIiDQo+Pj4+DQo+Pj4+ICNkZWZpbmUgWEVORElTUExfUFJPVE9DT0xf
VkVSU0lPTl9JTlTCoCAyDQo+Pj4+DQo+Pj4+IEp1cmdlbiwgd2hhdCdzIHlvdXIgcHJlZmVyZW5j
ZSBoZXJlPw0KPj4+DQo+Pj4gSSB3b3VsZCBwcmVmZXIgdGhlIGxhdHRlciwgYXMgaXQgYXZvaWRz
IHRoZSBuZWVkIHRvIG1vZGlmeSB0aGUgaGVhZGVyDQo+Pj4gd2hlbiBjb3B5aW5nIGl0IHRvIGEg
bG9jYWwgcHJvamVjdC4NCj4+Pg0KPj4gT2ssIEknbGwgaGF2ZSAyIGRlZmluaXRpb25zIHRoZW4N
Cj4+DQo+PiBBbnl0aGluZyBlbHNlIChiZXNpZGUgdGhlIGNvbW1lbnRzIG9uIG5ldyBmdW5jdGlv
bmFsaXR5KSBJIGNhbiBhZGQvY2hhbmdlDQo+Pg0KPj4gYmVmb3JlIHNlbmRpbmcgdjIgb2YgdGhl
IHBhdGNoPw0KPg0KPiBJIHdvdWxkIGhhdmUgc2FpZCBzby4gOi0pDQoNClRoYW5rIHlvdSwNCg0K
dGhlIHNlcmllcyBhbHNvIGhhcyBhIHBhdGNoIGZvciBsaWJnbnR0YWIuIERvIHlvdSB3YW50IG1l
IHRvIHNlbmQgdGhlIHByb3RvY29sIHBhdGNoDQoNCnNlcGFyYXRlbHkgb3Igc2hvdWxkIHdlIHdh
aXQgZm9yIElhbiBhbmQgV2VpIHRvIHJldmlldz8gVGhlc2UgY2hhbmdlcyBhcmUgcmVsYXRlZCwN
Cg0KdGh1cyBJIHNlbnQgdGhlbiB0b2doZXRlcg0KDQo+DQo+DQo+IEp1ZXJnZW4NCg0KVGhhbmsg
eW91LA0KDQpPbGVrc2FuZHINCg==

