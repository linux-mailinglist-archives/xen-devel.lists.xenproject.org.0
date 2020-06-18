Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9901FE928
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 04:59:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlklR-0008EQ-GG; Thu, 18 Jun 2020 02:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e1t=77=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jlklP-0008EL-Lc
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 02:58:51 +0000
X-Inumbo-ID: a2874dfe-b10f-11ea-ba39-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2874dfe-b10f-11ea-ba39-12813bfff9fa;
 Thu, 18 Jun 2020 02:58:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6JMS3ze7Iw3W5InMQIZ1L0etn1zLdCy8bIYoNAgJgLdtSPssEFqlz3nHZeelUM0g1SvyB8TLdDCQpx6PEHNuCxLd6G4UqDrvuSWsHQzYCP4YUR2+iBl7tUcJHTTDEKve/gINKWQv+PGKLOyeM5teAx8YVNy0Bu7nUfC/pbrLRrhU25nruSEc4GzuzxmrY7n7OZmiPcNTYg/h7jS3ZC/YTAXkoIUlek/BLfbpTLDjlKqQA6kJXnBgKjdxMjXus3Ea8nxg4ATCC5sfILIwFpFuN2poRkz8zDM7eB3C2zIijURv4ch6/MYxB8iAvkw2p7oYoo/2b0YbMmtQgGv4ltqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEcOKTTivdcI/+SmPUGs4eCU2VxuzFEADnyOKg3Ucm0=;
 b=bT/UFjE0uf3aqkr/tO1E+8OpdnAMPv0vetuR5xnuZrTJ1eF/VDhE/wHnBBVBSjaBTxwblC48RYb8Ohk1eJehnHa8cogJAiOOpi5SJHlqBjIeu++q/N4mMDUGPuJWyYTrhtZVJxsOVConLOMUE8Wv9+V9hNprZF56VDVisysnXbDpc8rRKd0X8N1rgUaZscRDeV1K8F5JGwufXMt7vORlNPfFjDGZ8jFJcIbz2/2LY0+53Xwdl35IajBjXIlbD+05+pRV0DBVzDFsb9XEEkHgIfYcZBPHmrvreDpusDNpVFcrXMWN+rc/RFUS0qNaFy6z15bCcfdfvAbcSQ61yLJ+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEcOKTTivdcI/+SmPUGs4eCU2VxuzFEADnyOKg3Ucm0=;
 b=EjzRCcz0O4B1CjZHFkd5Aod1c2Mm5UvIYnI5f+ctbZWMSFWh3o5Mu1XaDmBi8ZnelW1LQTtMjNf/4/MtVTQh6yBZZ37jMvFHNaIo6TGujYQhxkK36TLWGK3vJq7UxzVpWL6c0+8kllkjD/ZCwAQ3jHemf1uEICmKy4rfOBg81PYI63ASh5bqy41SbM2NH3+I6yASJTc3Vvt+zedladzJApabQoHX31WJhgBXncWUV7zxCJ7uCVmpnBHAjlzv3gJiYqrKqyI7vkcymHuPW50XaDbGF7ha5cxO5gPEzNqMmtyTSqnz5wP0dXk7zH1d4VR5lhWm57sDEqsKEepu6AvPxg==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB4624.eurprd03.prod.outlook.com (2603:10a6:803:60::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 02:58:46 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3088.028; Thu, 18 Jun 2020
 02:58:46 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Topic: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
Thread-Index: AQHWQE+Tib/gTK49mk6bUudd1VvXZqjUa0CAgAB+fACAAANFAIAALvMAgAB0vgCAAISmAIAHosuA
Date: Thu, 18 Jun 2020 02:58:46 +0000
Message-ID: <87tuz92i6y.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
 <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
 <78910b5c27a3711726d53e931feb075c5cc4a64c.camel@suse.com>
 <bb2449e47c3bb97b004dac8b58123aba8452ccaf.camel@epam.com>
 <b4e35492-6ccc-c7a1-36e9-0239f01c4eb4@suse.com>
In-Reply-To: <b4e35492-6ccc-c7a1-36e9-0239f01c4eb4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cf8f49c-22ca-42c7-8192-08d8133384d1
x-ms-traffictypediagnostic: VI1PR03MB4624:
x-microsoft-antispam-prvs: <VI1PR03MB462445D01522D950293A5621E69B0@VI1PR03MB4624.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: isDQoQ4ijE+oHEIS87f9y4cl3SGrTy87KRuKTSrI6GNheZ7WXcwpwBZ4cuRyH/Rgmgra1AzpgZJEQRCCMGrPfi2Wx7mPxfwZxw0WfoKui05qkCI3yAbYLo5P7iU0WdpdT91J8I+gB6qRHUZ0bHkb6cvzyjUkvB/tu0ef7zm649bbm0vXaKnvlS5DahnsGKpN0DtNA781nlJYcLhOxDALlokvjcDEyD3cNsV0Rk9+JOzoIJOb7NkVaTfoVndTQdtSbb7uIkUfJ3wWKdtI7QZwsuTBC0IswBeU8JDv6AYxw67Nl0GDCmrp6IdDmAk9ZiUV9Ff2hJVEZsmKRnFl2RPwCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(86362001)(36756003)(2616005)(6512007)(71200400001)(6486002)(5660300002)(4326008)(478600001)(53546011)(7416002)(8676002)(66574015)(6916009)(66556008)(64756008)(8936002)(76116006)(91956017)(316002)(66946007)(186003)(54906003)(26005)(2906002)(55236004)(66476007)(66446008)(83380400001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bgKKR0kMMS1BgA29u1AHmXRY6ylfRgI1w+T6uyvl6ypSjePLC5eWr9PHOI8H5eNdeFBAeioLjd7WTorEZEsRj04fk2FaUAIjRdSR0gQ4+5ZSPeGIbbAG5NUEK1GHN2XKUud41ai+/VKDtPTf8y0XyMlP+yLuSIyPzFsuHOdfTUvmh9qAIgHC0zqhPyYaB4ZLZLpFkqJBmgw1OhZQC81POH0TmbJivNzvMHjzMfWbpjGUuPeARdwikMYpLAcjslptBrvtf/n4GYyEykpU6DQmbtNAe2qVUKYyzvTzDXFSaLEwfBNhvcCHngZvYp65qk9vC1ESgyq2JSoUwzsTI9QZnc62dSgHdLT2A4eBhrsMm0BGkmISsyC3+2z57nYJwHMYZrnI/jBn4uJB9Jz0UdrSxNKtsSeSC7jjJGE3q3Ze9yvrHO1mg5saUT82E0m0ByEw4bpO7f5LoIu4cvqDJkTeCnyVESoNQk2+6IHJKrHvWXY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF319116AB58D349BAACE4D38C00DDDC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf8f49c-22ca-42c7-8192-08d8133384d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 02:58:46.4118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8x8Id5VXW7l5pB7dwIvHy4p0vvBCXQEuTrDrD2jum1x0zqYjQ8bm7qCYa8vNvixTuyWxVLv92UEDjKSjdHE19BWVbI8XFLE8rYoLv7E2pGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4624
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
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpIaSBKw7xyZ2VuLA0KDQpKw7xyZ2VuIEdyb8OfIHdyaXRlczoNCg0KPiBPbiAxMy4wNi4yMCAw
MDoyNywgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBPbiBGcmksIDIwMjAtMDYtMTIgYXQg
MTc6MjkgKzAyMDAsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOg0KPj4+IE9uIEZyaSwgMjAyMC0wNi0x
MiBhdCAxNDo0MSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4gT24gMTIuMDYuMjAg
MTQ6MjksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IE9uIDEyLzA2LzIwMjAgMDU6NTcsIErD
vHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+Pj4gT24gMTIuMDYuMjAgMDI6MjIsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOg0KPj4+Pj4+PiBAQCAtOTk0LDkgKzk5OCwyMiBAQCBzX3RpbWVfdCBzY2hl
ZF9nZXRfdGltZV9jb3JyZWN0aW9uKHN0cnVjdA0KPj4+Pj4+PiBzY2hlZF91bml0ICp1KQ0KPj4+
Pj4+PiAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4+Pj4gICAgICAgIH0NCj4+Pj4+Pj4gKyAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWRfc3RhdF9sb2NrLCBmbGFncyk7DQo+Pj4+Pj4+ICsg
ICAgc2NoZWRfc3RhdF9pcnFfdGltZSArPSBpcnE7DQo+Pj4+Pj4+ICsgICAgc2NoZWRfc3RhdF9o
eXBfdGltZSArPSBoeXA7DQo+Pj4+Pj4+ICsgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2No
ZWRfc3RhdF9sb2NrLCBmbGFncyk7DQo+Pj4+Pj4NCj4+Pj4+PiBQbGVhc2UgZG9uJ3QgdXNlIGEg
bG9jay4gSnVzdCB1c2UgYWRkX3NpemVkKCkgaW5zdGVhZCB3aGljaCB3aWxsDQo+Pj4+Pj4gYWRk
DQo+Pj4+Pj4gYXRvbWljYWxseS4NCj4+Pj4+DQo+Pj4+PiBJZiB3ZSBleHBlY3Qgc2NoZWRfZ2V0
X3RpbWVfY29ycmVjdGlvbiB0byBiZSBjYWxsZWQgY29uY3VycmVudGx5DQo+Pj4+PiB0aGVuIHdl
DQo+Pj4+PiB3b3VsZCBuZWVkIHRvIGludHJvZHVjZSBhdG9taWM2NF90IG9yIGEgc3BpbiBsb2Nr
Lg0KPj4+Pg0KPj4+PiBPciB3ZSBjb3VsZCB1c2UgcGVyY3B1IHZhcmlhYmxlcyBhbmQgYWRkIHRo
ZSBjcHUgdmFsdWVzIHVwIHdoZW4NCj4+Pj4gZmV0Y2hpbmcgdGhlIHZhbHVlcy4NCj4+Pj4NCj4+
PiBZZXMsIGVpdGhlciBwZXJjcHUgb3IgYXRvbWljIGxvb2tzIG11Y2ggYmV0dGVyIHRoYW4gbG9j
a2luZywgdG8gbWUsIGZvcg0KPj4+IHRoaXMuDQo+Pg0KPj4gTG9va3MgbGlrZSB3ZSBnb2luZyB0
byBoYXZlIGF0b21pYzY0X3QgYWZ0ZXIgYWxsLiBTbywgSSdsbCBwcmVmZXIgdG8gdG8NCj4+IHVz
ZSBhdG9taWNzIHRoZXJlLg0KPg0KPiBQZXJmb3JtYW5jZSB3b3VsZCBiZSBiZXR0ZXIgdXNpbmcg
cGVyY3B1IHZhcmlhYmxlcywgYXMgdGhvc2Ugd291bGQgYXZvaWQNCj4gdGhlIGNhY2hlbGluZSBt
b3ZlZCBiZXR3ZWVuIGNwdXMgYSBsb3QuDQoNCkkgc2VlLiBCdXQgZG9uJ3Qgd2UgbmVlZCBsb2Nr
aW5nIGluIHRoaXMgY2FzZT8gSSBjYW4gc2VlIHNjZW5hcmlvLCB3aGVuDQpvbmUgcENQVSB1cGRh
dGVzIG93biBjb3VudGVycyB3aGlsZSBhbm90aGVyIHBDUFUgaXMgcmVhZGluZyB0aGVtLg0KDQpJ
SVJDLCBBUk12OCBndWFyYW50ZWVzIHRoYXQgNjQgYml0IHJlYWQgb2YgYWxpZ25lZCBkYXRhIHdv
dWxkIGJlDQpjb25zaXN0ZW50LiAiQ29uc2lzdGVudCIgaW4gdGhlIHNlbnNlIHRoYXQsIGZvciBl
eGFtcGxlLCB3ZSB3b3VsZCBub3QNCnNlZSBsb3dlciAzMiBiaXRzIG9mIHRoZSBuZXcgdmFsdWUg
YW5kIHVwcGVyIDMyIGJpdHMgb2YgdGhlIG9sZCB2YWx1ZS4NCg0KSSBjYW4ndCBzYXkgZm9yIHN1
cmUgYWJvdXQgQVJNdjcgYW5kIGFib3V0IHg4Ni4NCg0KLS0gDQpWb2xvZHlteXIgQmFiY2h1ayBh
dCBFUEFN

