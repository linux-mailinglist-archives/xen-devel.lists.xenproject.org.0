Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B4FB253
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:14:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtNE-0005u5-QT; Wed, 13 Nov 2019 14:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3r5a=ZF=amazon.com=prvs=213cc4842=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iUtNC-0005u0-LS
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:11:54 +0000
X-Inumbo-ID: 8b58b46a-061f-11ea-9631-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b58b46a-061f-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573654314; x=1605190314;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xj/yV+vlN+f8sDhM0+j5rmtPQg4etfDr9lk8Jgnq3ng=;
 b=iGOgMXDrRhRW5tesa4R8t+2rVfswxTwiGaIfTBtCZQi9O2XJxH5GpZvn
 NMK3I1zhZaS+VnCoYjC4DqGGZcyu/VBFg4AoRq/136gi5Xxgb24S7hgW+
 ByjeMXe82zjN8OYK5Q8MHsEgDQz3cf0sZXr0Z+V10msz7dijLy2bSC4xG Q=;
IronPort-SDR: Bf4i+Ka76O37RGqPa+sJ/bleA2nkHGeIio1BkQfklaBvovP9AhTDwD9OWUWP8aQ93vR49TS1yQ
 VMf5kDk42xlw==
X-IronPort-AV: E=Sophos;i="5.68,300,1569283200"; 
   d="scan'208";a="4206010"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 13 Nov 2019 14:11:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 07261A22E3; Wed, 13 Nov 2019 14:11:52 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 14:11:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 14:11:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 13 Nov 2019 14:11:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
Thread-Index: AQHVmijmkXyX3G407UypjXtu2UKVEKeJImIAgAAA7EA=
Date: Wed, 13 Nov 2019 14:11:48 +0000
Message-ID: <824ceb5657bd4630a808929863131d4e@EX13D32EUC003.ant.amazon.com>
References: <20191113134729.1121-1-pdurrant@amazon.com>
 <ef11eba3-4643-fa7f-2598-6a9a04c2ec77@citrix.com>
In-Reply-To: <ef11eba3-4643-fa7f-2598-6a9a04c2ec77@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxMyBOb3ZlbWJlciAyMDE5IDE0OjA1DQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIGRvbWFp
bl9jcmVhdGU6IGhvbm91ciBnbG9iYWwNCj4gZ3JhbnQvbWFwdHJhY2sgZnJhbWUgbGltaXRzLi4u
DQo+IA0KPiBPbiAxMy8xMS8yMDE5IDEzOjQ3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4u
d2hlbiB0aGVpciB2YWx1ZXMgYXJlIGxhcmdlciB0aGFuIHRoZSBwZXItZG9tYWluIGNvbmZpZ3Vy
ZWQgbGltaXRzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPg0KPiA+IC0tLQ0KPiA+IEFmdGVyIG1pbmluZyB0aHJvdWdoIGNvbW1pdHMg
aXQgaXMgc3RpbGwgdW5jbGVhciB0byBtZSBleGFjdGx5IHdoZW4gWGVuDQo+ID4gc3RvcHBlZCBo
b25vdXJpbmcgdGhlIGdsb2JhbCB2YWx1ZXMsIGJ1dCBJIHJlYWxseSB0aGluayB0aGlzIGNvbW1p
dA0KPiBzaG91bGQNCj4gPiBiZSBiYWNrLXBvcnRlZCB0byBzdGFibGUgdHJlZXMgYXMgaXQgd2Fz
IGEgYmVoYXZpb3VyYWwgY2hhbmdlIHRoYXQgY2FuDQo+ID4gY2F1c2UgZG9tVXMgdG8gZmFpbCBp
biBub24tb2J2aW91cyB3YXlzLg0KPiANCj4gLTEuwqAgT3ZlcnJpZGluZyB0b29sc3RhY2sgc2V0
dGluZ3MgbGlrZSB0aGlzIGlzIHRoZSBzYW1lIGtpbmQgb2YgImJhZCINCj4gYXMgc2lsZW50bHkg
Y29udmVydGluZyBIQVAgPT4gU2hhZG93Lg0KPiANCj4gSW4gcGFydGljdWxhciwgdGhpcyBicmVh
a3Mgb25lIG9mIHBvaW50cyBvZiB0aGUgb3JpZ2luYWwgcGVyLWRvbWFpbiB3b3JrDQo+IHRvIGRl
bGliZXJhdGVseSBhbGxvdyBzdHViIHhlbnN0b3JlZCB0byBiZSBjb25maWd1cmVkIHdpdGggdGlu
eQ0KPiBncmFudC9tYXB0cmFjayB0YWJsZXMuDQoNCk9rLCBidXQgSU1PIHN1YnRseSBicmVha2lu
ZyBkb21VcyBpbiB0aGUgcHJvY2VzcyBpcyBub3QgcmVhbGx5IGFjY2VwdGFibGUgYmVoYXZpb3Vy
Lg0KDQo+IA0KPiBZb3UgYWxzbyBicmVhayB0aGUgc2V0dGluZyBvZiB0aGVzZSBwYXJhbWV0ZXJz
IGluIHhsLmNvbmYuDQoNCk5vIEkgZG9uJ3QuIHhsLmNvbmYgY2FuIHN0aWxsIGluY3JlYXNlIHZh
bHVlcyBvdmVyIHRoZSBjb21tYW5kIGxpbmUuDQoNCj4gDQo+IEknbSBub3QgZGVmZW5kaW5nIGhv
dyB0aGUgaW50ZXJmYWNlIGNoYW5nZWQgc3VidGx5L3VuZXhwZWN0ZWQ7IHRoYXQgd2FzDQo+IGJh
ZCBhbmQgd2Ugc2hvdWxkIGhhdmUgZG9uZSBiZXR0ZXIsIGJ1dCB0aGlzIGNoYW5nZSBpcyBqdXN0
IGFzIGJhZCBpbg0KPiB0aGUgb3Bwb3NpdGUgZGlyZWN0aW9uLg0KPiANCj4gVGhlIHdheSB0byBm
aXggdGhpcyBpcyB0byBwbHVtYiB0aGUgWGVuIGRlZmF1bHQgcGFyYW1ldGVycyB0aG91Z2ggc28N
Cj4gdGhhdCwgaW4gdGhlIGFic2VuY2Ugb2YgYW55IGV4cGxpY2l0IGNvbmZpZ3VyYXRpb24gKHZt
LmNmZyBvciB4bC5jb25mKSwNCj4gbGlieGwgY2FuIHRoZW4gdXNlICJ4ZW4gY21kbGluZSIgYXMg
YSBzb3VyY2Ugb2YgY29uZmlndXJhdGlvbiwgYmVmb3JlDQo+IGZhbGxpbmcgYmFjayB0byBoYXJk
Y29kZWQgbnVtYmVycy4NCj4gDQoNCkkgYWdyZWUgdGhhdCBpcyB0aGUgYmVzdCB3YXkgdG8gZml4
IGl0LCBidXQgbm90IHNvIGVhc3kgdG8gYmFja3BvcnQuIFNvIG15IHByb3Bvc2FsICh2aWEgZW1h
aWwgYSBmZXcgZGF5cyBhZ28pIHdhcyB0aGF0IHJlZ3Jlc3Npb25zIGFyZSBmaXhlZCBpbW1lZGlh
dGVseSBpbiB0aGlzIHdheSBhbmQgdGhlbiBhICpwcm9wZXIqIGZpeCBpcyBkb25lIG1vdmluZyBm
b3J3YXJkLCB3aGljaCBJIHNoYWxsIGJhc2UgdXBvbiBKdWVyZ2VuJ3MgcGF0Y2hlcyB3aGljaCBz
aG91bGQgYWxsb3cgZWFzeSByZXRyaWV2YWwgb2YgdGhlIGNvbW1hbmQgbGluZSB2YWx1ZXMuDQoN
CiAgUGF1bA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
