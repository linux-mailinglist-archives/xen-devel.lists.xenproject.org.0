Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DAE1F7EE1
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 00:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjs7D-0006oq-VN; Fri, 12 Jun 2020 22:25:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjs7C-0006ol-Bt
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 22:25:34 +0000
X-Inumbo-ID: a079f5d8-acfb-11ea-bca7-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a079f5d8-acfb-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 22:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEZIO+R7d7d/2BWRQRvWV80PwxOpPlNJssH/K9zZN7HuABHVd+0Z7TNSxQfGUASNN5NDsRF2ZpaBGG4P1HUBo2ABM+NDMSY/G28xaPEGA835OdSWZpKdTZg22zSRzr4vL35k+L6njMd1+UKarSrSNwSJvbSNUxuZEanzp6x5NeUPC6ewQodmojw3kyPYh865MmPre6BRvxbCXe94bKh6Ty5HB+oZcNu13vhNcn3Y7+/w81eIxOmMuPJdTxMFky8bONBidaJp7prLeH74/wj2pkekDvQuUuA8wHUMC/hfWLFpnGodSILC3i5F88S+2ltvDvdR7Hu13BBe0F6dxiQSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swL4Ojj8gGjj5D3rZ9uED1BRECcyUb+YJ5SHAd6V9xk=;
 b=YQ+ixaOuhWjMVCydZziLI6aLTZBWJ6UIutkDfkG7m0nhsoKmzdOin3BIQIrV2mKghKna1SkGd46ZJqxlIH7P+JNErq57jqfJYAZ5yGO1vNOExUAlabMUimAsWjr4DlsV+HZMjAgfBfI183lOTxnW3Lk53s4v6OAGjwGbnFToMhIKQw6uALkfkjK6o0B2zp7nLVfeK8GW7j+p7ERnOVFKsXtFmWg65eWmnbjiwKML3mhz/Wva5ATxxVWoKDq5Aa3R0DpvqvRYz5GmknBfP2d3Y2z1yct4RCoPSx476O+eZ2/ChmJJRwBmfa1T8T7MGbtOyilNkD1rL7EtmIvTXzQh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swL4Ojj8gGjj5D3rZ9uED1BRECcyUb+YJ5SHAd6V9xk=;
 b=kEHttdGn30TOJsdMLloe6718yGHltVjdOdBDcPblMBBajTRYjbC1D/f2/yNa9enLSx24VHXoVZUS3EJG/I7uGUKljAUTtcdBNogNA3tpv0cv/Ec6Wn6iZaRN06Gww35PD91WeCEHJwJ67IiDLR2+VgaD5fYS1U1XbTTca02HkKgl3eMi/lppNj7R5NMxcMlWRNVOWzKtz/X7Q9WbStx5MO9agxImryCPN1w4OQwzpSI+yYyOy+Fl0JJyyVnk74g3XPY7x4x7vkQMbu0M7bZ4v/Wcx1NgPptMSpUubfIRpIgpSkof5kw36xxhiu9jH21Ck7PauE7dQYTD6unkBFKoeg==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB3341.eurprd03.prod.outlook.com
 (2603:10a6:803:25::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Fri, 12 Jun
 2020 22:25:29 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.025; Fri, 12 Jun 2020
 22:25:29 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "dfaggioli@suse.com" <dfaggioli@suse.com>, "jgross@suse.com"
 <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Topic: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Index: AQHWQE+STyWApsQdk0CG54zgwiPygKjUZV2AgAByxQCAAADXAIAAAQ+AgAANYwCAAIJ+gIAAJjcA
Date: Fri, 12 Jun 2020 22:25:29 +0000
Message-ID: <9e92fd70d92da18caa9e6345b4ce35b86f88605e.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
 <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
 <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
 <fcedf156-4ed6-c56a-482d-df2f867f7b3e@xen.org>
 <5bd54018f5e045816d25f686124395a1f27a2122.camel@epam.com>
 <51fce146-f2bd-6098-bef9-2fd925ec7f96@xen.org>
 <0fc7034d696bbc601ccf2bd563ef9fb435499eea.camel@suse.com>
In-Reply-To: <0fc7034d696bbc601ccf2bd563ef9fb435499eea.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 318ad227-28dc-4c0d-f249-08d80f1f838d
x-ms-traffictypediagnostic: VI1PR0302MB3341:
x-microsoft-antispam-prvs: <VI1PR0302MB334127B50DAA6923BC43206FE6810@VI1PR0302MB3341.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2Ipgixd8mdrMiimoSVechLOU2AIWqQK11ThPQAa4bDZFckmv3Ym6QCjD/SJMI7AeORZozZHNyEymXByj8nyonFUR7JYEC/f7Ut5s1JHEyEnXUfSUbkH9mUEaYiUlpqPmd5YWSFtXlr0hVTd4kjUP/nqwa/ZQUlX9b/xE0OzneSUaYRRUfhsfsNo0riuOhjSOaa2yFUMnHRsb0YQSqoiOepGbyFmTUXz+DzmGCvaOOSKOodzgDmn9IiGo0xgh2h0VLPlVdUcgTmNuOCrzQ8t7Ircwdi1zfjp0WtR+ZEA6Te4sUMmomJ74spAZlZj86e/i5j8sjnOX8JUCjXJfVvX3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(2616005)(54906003)(36756003)(186003)(316002)(478600001)(83380400001)(86362001)(4326008)(110136005)(6512007)(5660300002)(71200400001)(6506007)(66556008)(66476007)(55236004)(76116006)(91956017)(66446008)(64756008)(26005)(7416002)(66946007)(2906002)(6486002)(53546011)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8qaJUm8ELhwaJHjaV33s9uod8y42gBIYzZoOrRXWqZYT46Q7GA/RQYTruBLpxmnPJBn/Hq7mrxjH6J0azt5aVkOzdMYHSAFo82FvjmwiflRX77Z3L5IY0OQX38hTOEs3A1EQY/aiAUl752MwHbQKi1sYdDFyuK4R0yuIYuA9poA/HCrsNCd74rTyHnN3XB6StBIViTB1OjToHsiwSwUfP7XtEg4rcSmc+CcU6mXsOCJ2gBOP9kNhMqurizWL7aVFjfjPfFIKucy0hxQZr+7Ih2ghNV4wDbVTRL1CDtXlZk3gt+blmu3GRJOAVrb0jq/TgrPdcpnKkdwqit0ukyvw60L8xHNrylROxk6yupSWH5ETq94If8l6eOstgUS/66S0CXDHodQuv+unPgIf6cJrf9pHwCY9hG404fSxGt+15/yDGSw2qBzUcexiYR63V/uutyj3UxIO3Fmr8bXavYJYnEusgAuzfiZD6ctq2Md6+acu30PompxAQ+u3/uvwgQA9
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8EC8237F84EFC46990316E5ED644554@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318ad227-28dc-4c0d-f249-08d80f1f838d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 22:25:29.6636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5umR+ZDJjDo2i3jr7KliBImXwp4cSe+g23rO6EAGOQSSE27wQU+1lFjFg4zuSqSu21uggxNm/2t70pmQOf9nq69BAhD5zsVO09RrQWzjqKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3341
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
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGFyaW8sDQoNCk9uIEZyaSwgMjAyMC0wNi0xMiBhdCAyMjowOCArMDIwMCwgRGFyaW8gRmFn
Z2lvbGkgd3JvdGU6DQo+IE9uIEZyaSwgMjAyMC0wNi0xMiBhdCAxMzoyMSArMDEwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPiA+IE9uIDEyLzA2LzIwMjAgMTI6MzMsIFZvbG9keW15ciBCYWJjaHVr
IHdyb3RlOg0KPiA+ID4gT24gRnJpLCAyMDIwLTA2LTEyIGF0IDEyOjI5ICswMTAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6DQo+ID4gPiA+ID4gQmFzaWNhbGx5LCB0aGlzIHZhbHVlIGhvbGRzIHRpbWUg
c3BhbiBiZXR3ZWVuIGNhbGxzIHRvDQo+ID4gPiA+ID4gc2NoZWR1bGUoKS4gVGhpcw0KPiA+ID4g
PiA+IHZhcmlhYmxlIGdldHMgemVyb2VkIG91dCBldmVyeSB0aW1lIHNjaGVkdWxlciByZXF1ZXN0
cyBmb3IgdGltZQ0KPiA+ID4gPiA+IGFkanVzdG1lbnQgdmFsdWUuIFNvLCBpdCBzaG91bGQgbm90
IGRlcGVuZCBvbiB0b3RhbCBWTSBydW4NCj4gPiA+ID4gPiB0aW1lLg0KPiA+ID4gPiBUaGlzIGlz
IGFzc3VtaW5nIHRoYXQgdGhlIHNjaGVkdWxlciB3aWxsIGJlIGNhbGxlZC4gV2l0aCB0aGUgTlVM
TA0KPiA+ID4gPiBzY2hlZHVsZXIgaW4gcGxhY2UsIHRoZXJlIGlzIGEgZmFpciBjaGFuY2UgdGhp
cyBtYXkgbmV2ZXIgYmUNCj4gPiA+ID4gY2FsbGVkLg0KPiA+ID4gPiANCj4gWWVhaCwgdGhpcyBp
cyBhIGdvb2QgcG9pbnQuIEkgbWVhbiwgSSB3b3VsZG4ndCBiZSBzdXJlIGFib3V0ICJuZXZlciIs
DQo+IGFzIGV2ZW4gdGhlcmUsIHdlJ2QgcHJvYmFibHkgaGF2ZSBzb2Z0aXJxcywgdGFza2xldHMs
IGV0Yy4uLiBBbmQgSQ0KPiBzdGlsbCBoYXZlIHRvIGxvb2sgYXQgdGhlc2UgcGF0Y2hlcyBpbiBt
b3JlIGRldGFpbHMgdG8gZmlndXJlIG91dA0KPiBwcm9wZXJseSB3aGV0aGVyIHRoZXknZCBoZWxw
IGZvciB0aGlzLg0KDQpXZWxsLiBJIHRoaW5rLCBpdCBpcyBwb3NzaWJsZSB0byByZXNldCBjb3Vu
dGVycyB3aGVuIHdlIGFyZSBzd2l0Y2hpbmcNCnRvIGEgZGlmZmVyZW50IHNjaGVkdWxlci4gSnVz
dCBmb3IgY2FzZXMgbGlrZSB0aGF0Lg0KDQo+IEJ1dCBJJ2Qgc2F5IHRoYXQsIGluIGdlbmVyYWws
IHdlIHNob3VsZCBkZXBlbmQgb2YgdGhlIGZyZXF1ZW5jeSBvZiB0aGUNCj4gc2NoZWR1bGluZyBl
dmVudHMgYXMgZmV3IGFzIHBvc3NpYmxlLiBUaGVyZWZvcmUsIHVzaW5nIDY0IGJpdHMgZnJvbSB0
aGUNCj4gc3RhcnQgd291bGQgYmUgcHJlZmVycmFibGUgSU1PLg0KDQpJIHNob3VsZCBkb25lIHRo
YXQgY2FsY3VsYXRpb24gZWFybGllci4uLiBTbywgaXQgYXBwZWFycyB0aGF0IDMyIGJpdA0KY291
bnRlciBjYW4gY291bnQgdXAgdG8gNCBtZXJlIHNlY29uZHMuIEl0IHNob3VsZCBiZSBlbm91Z2h0
IGZvciBub3JtYWwNCmZsb3cuIEJ1dCBJJ20gYWdyZWUgd2l0aCB5b3UgLSA2NCBiaXRzIGxvb2tz
IG11Y2ggc2FmZXIuIA0KDQo+IA0KPiA+ID4gPiBTbyBJIHRoaW5rIHVzaW5nIGEgNjQtYml0IHZh
bHVlIGlzIGxpa2VseSBzYWZlci4NCj4gWWVwLg0KPiANCj4gPiA+IFdlbGwsIEkgd2FudGVkIHRv
IHVzZSA2NC1iaXQgdmFsdWUgaW4gdGhlIGZpcnN0IHBsYWNlLiBCdXQgSSBnb3QNCj4gPiA+IHRo
ZQ0KPiA+ID4gaW1wcmVzc2lvbiB0aGF0IGF0b21pY190IHN1cHBvcnRzIG9ubHkgMzItYml0IHZh
bHVlcy4gQXQgbGVhc3QsDQo+ID4gPiB0aGlzIGlzDQo+ID4gPiB3aGF0IEknbSBzZWVpbmcgaW4g
YXRvbWljLmgNCj4gPiA+IA0KPiA+ID4gQW0gSSB3cm9uZz8NCj4gPiANCj4gPiBUaGVyZSBpcyBu
byBhdG9taWM2NF90IHN1cHBvcnQgaW4gWGVuIHlldC4gSXQgc2hvdWxkbid0IGJlIHZlcnkgDQo+
ID4gZGlmZmljdWx0IHRvIGFkZCBzdXBwb3J0IGZvciBpdCBpZiB5b3UgcmVxdWlyZSB0aGVtLg0K
PiA+IA0KPiBDb29sISBUaGF0IHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0ZWQuIDotRA0KPiANCg0K
Q2VydGFpbmx5ISA6KQ0KDQpJIGJlbGlldmUsIHRoZXJlIHdpbGwgYmUgYW5vdGhlciB1c2VycyBm
b3IgYXRtaWM2NF90IGFzIHdlbGwuDQoNCg0K

