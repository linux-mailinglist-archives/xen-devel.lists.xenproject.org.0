Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BDF1AC03B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 13:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP33Z-0000ZL-Hs; Thu, 16 Apr 2020 11:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP33Y-0000ZF-9P
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 11:51:44 +0000
X-Inumbo-ID: a48843d2-7fd8-11ea-9e09-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a48843d2-7fd8-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587037904; x=1618573904;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=bACNbQMGENTkXIxTumUp47YWOAp6aIX03GFXjMekIbA=;
 b=bbg7rhvBRznWgCoAW8eekgYmFCHKwCvfNcbCn0wCBcs/rUylsIjibNg9
 GVBqMBZWJ002T1TA1Iwa5uAr/cBo8YoYNrXfysFh2XePnVpyMchrst8T4
 sCOWKY3B5uB9Rh8R1J1MUSpUxj6uybX0klxkx8G0AZF4ufdsWQt8BT+IJ c=;
IronPort-SDR: CNJL5/AFrLs5MJ4zmIq6+n+nX8ujjn7E/3RrjS5S/AX34BQucokVI7I6lI5575p02uCL7uu94F
 AYMnnRAGDxNA==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="27174727"
Subject: Re: [XTF 4/4] setup: Setup PV console for HVM guests on xen >4.2
Thread-Topic: [XTF 4/4] setup: Setup PV console for HVM guests on xen >4.2
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 16 Apr 2020 11:51:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7071EA1E31; Thu, 16 Apr 2020 11:51:30 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 11:51:30 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 11:51:29 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1497.006;
 Thu, 16 Apr 2020 11:51:29 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Index: AQHWE9NHjcoqxUtZ/EiL7nmmqxalz6h7ji0AgAAU5gA=
Date: Thu, 16 Apr 2020 11:51:28 +0000
Message-ID: <82FE157A-310D-4D4E-9D87-F04DE2E6B26E@amazon.com>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-5-wipawel@amazon.de>
 <e1e910a7-ed94-46e9-6987-fecdd704e104@citrix.com>
In-Reply-To: <e1e910a7-ed94-46e9-6987-fecdd704e104@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.70]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C9E6F85DC83994F9D27CE4DE1E781AD@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Semel <phentex@amazon.de>, "julien@xen.org" <julien@xen.org>,
 "paul@xen.org" <paul@xen.org>, "semelpaul@gmail.com" <semelpaul@gmail.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDE2LiBBcHIgMjAyMCwgYXQgMTI6MzYsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5h
dGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMTYvMDQvMjAyMCAx
MDo0MSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6DQo+PiBAQCAtMjcyLDkgKzI3NCwyMyBA
QCB2b2lkIGFyY2hfc2V0dXAodm9pZCkNCj4+IA0KPj4gICAgIGluaXRfaHlwZXJjYWxscygpOw0K
Pj4gDQo+PiAtICAgIGlmICggIWlzX2luaXRkb21haW4oKSApDQo+PiArICAgIHhlbl92ZXJzaW9u
ID0gaHlwZXJjYWxsX3hlbl92ZXJzaW9uKFhFTlZFUl92ZXJzaW9uLCBOVUxMKTsNCj4+ICsgICAg
aWYgKCB2ZXJzaW9uICkNCj4+ICsgICAgICAgICp2ZXJzaW9uID0geGVuX3ZlcnNpb247DQo+PiAr
DQo+PiArICAgIC8qDQo+PiArICAgICAqIFRoZSBzZXR1cF9wdl9jb25zb2xlIGZ1bmN0aW9uIHJl
Z2lzdGVycyBhIHdyaXRpbmcgZnVuY3Rpb24NCj4+ICsgICAgICogdGhhdCBtYWtlcyBodm0gZ3Vl
c3RzIGNyYXNoIG9uIFhlbiA0LjINCj4gDQo+IFRoaXMgY29tbWVudCBpbiBwYXJ0aWN1bGFyIGlz
IHJhdGhlciBjb25jZXJuaW5nLiAgRXZlbiBpZiB0aGVyZSBpcyBhDQo+IGNvbmZpZ3VyYXRpb24g
aXNzdWUgaW4gNC4yIHN0b3BwaW5nIHRoZSBQViBjb25zb2xlIGZyb20gYmVpbmcgd2lyZWQgdXAN
Cj4gcHJvcGVybHksIG5vdGhpbmcgaW52b2x2ZWQgaW4gdHJhbnNtaXR0aW5nIG9uIHRoZSBjb25z
b2xlIHNob3VsZCBjcmFzaA0KPiB0aGUgZ3Vlc3QuDQo+IA0KDQpJIGFtIGFnYWluIGEgbGl0dGxl
IHNob3J0IG9uIGRldGFpbHMgaGVyZS4gTWF5YmUgUGF1bCBjb3VsZCBjaGltZSBpbi4NCkJ1dCwg
SSB2YWd1YWx5IHJlbWVtYmVyIGl0IHdhcyBzb21ldGhpbmcgYWJvdXQgdGhlIGluaXRfcHZfY29u
c29sZSgp4oCZczoNCg0KICAgIGlmICggcG9ydCA+PSAoc2l6ZW9mKHNoYXJlZF9pbmZvLmV2dGNo
bl9wZW5kaW5nKSAqIENIQVJfQklUKSApDQogICAgICAgIHBhbmljKCJldnRjaG4gJXUgb3V0IG9m
IGV2dGNobl9wZW5kaW5nW10gcmFuZ2VcbiIsIHBvcnQpOw0KDQo+IH5BbmRyZXcNCg0KDQpCZXN0
IFJlZ2FyZHMsDQpQYXdlbCBXaWVjem9ya2lld2ljeg0Kd2lwYXdlbEBhbWF6b24uY29tDQoKCgpB
bWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDEx
NyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhh
biBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBI
UkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


