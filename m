Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC8114F23
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:39:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAzF-0005Gw-8F; Fri, 06 Dec 2019 10:37:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dcuz=Z4=amazon.com=prvs=23659da55=pdurrant@srs-us1.protection.inumbo.net>)
 id 1idAzD-0005G1-Pb
 for xen-devel@lists.xen.org; Fri, 06 Dec 2019 10:37:23 +0000
X-Inumbo-ID: 62dd746a-1814-11ea-b4e9-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62dd746a-1814-11ea-b4e9-bc764e2007e4;
 Fri, 06 Dec 2019 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575628644; x=1607164644;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EpxBibim7DS2Qm7fjMDdYzu0Cez3UAw7fgJ9tqJRmxI=;
 b=QQ+j8zs+E1CLHoUxQ/wZDc73bc42aY4JQyLVilfIDmXMpbk7jjnd8osl
 FxlJ4pWNiUt5GH1dq9HKQlTqcNMKjWgN7arbxQfyo87pLIqPqOIGjRR+i
 hAaOHaUys4c3qUsk69YCdpebJgR1e06kdg2ZFQ+UHECCU3VR1mfdjWojk A=;
IronPort-SDR: 7M2HBkl3JwWRROZPiwxawxak1uFDvLxZ+ImdIuER7+eAH8zLjbtSS4gtRa1bOd4bkuQDudk901
 VkZkgR/FjmGA==
X-IronPort-AV: E=Sophos;i="5.69,284,1571702400"; 
   d="scan'208";a="3576677"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 06 Dec 2019 10:37:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id AAEF12416E5; Fri,  6 Dec 2019 10:37:10 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 10:37:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 10:37:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Dec 2019 10:37:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List
 <xen-devel@lists.xen.org>
Thread-Topic: [Xen-devel] Xen 4.14 and future work
Thread-Index: AQHVqUqk5MCo/aOaTki8kF6hi2B7FKerr2YAgAE/XfA=
Date: Fri, 6 Dec 2019 10:37:09 +0000
Message-ID: <73cb39eee3c6433da306625ea3262697@EX13D32EUC003.ant.amazon.com>
References: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
 <de0fca0f-06f7-dcdf-0a55-4fda6bc0d1fa@citrix.com>
In-Reply-To: <de0fca0f-06f7-dcdf-0a55-4fda6bc0d1fa@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.53]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Xen 4.14 and future work
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gQW5kcmV3IENv
b3Blcg0KPiBTZW50OiAwNSBEZWNlbWJlciAyMDE5IDE1OjMxDQo+IFRvOiBYZW4tZGV2ZWwgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBY
ZW4gNC4xNCBhbmQgZnV0dXJlIHdvcmsNCj4gDQo+IE9uIDAyLzEyLzIwMTkgMTk6NTEsIEFuZHJl
dyBDb29wZXIgd3JvdGU6DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBOb3cgdGhhdCA0LjEzIGlzIG9u
IGl0cyB3YXkgb3V0IG9mIHRoZSBkb29yLCBpdCBpcyB0aW1lIHRvIGxvb2sgdG8NCj4gPiBvbmdv
aW5nIHdvcmsuDQo+IA0KW3NuaXBdDQoNCi9tZSByZW1lbWJlcnMgc29tZXRoaW5nIGVsc2UuLi4N
Cg0KSVNUUiB3b3JrIHdhcyBiZWluZyBkb25lIHRvIHJlcGxhY2UgbWluaW9zIHN0dWJkb21zIHdp
dGggc29tZXRoaW5nIG1vcmUgbW9kZXJuLiBJcyB0aGlzIGNvbnRpbnVpbmc/IEFGQUlLIHdlIGFy
ZSByZWFsbHkgb25seSBrZWVwaW5nIHFlbXUgdHJhZCBhbGl2ZSBmb3Igc3R1YmRvbXMgYW5kIGl0
IHdvdWxkIGJlIG5pY2UgaWYgd2UgY291bGQgZmluYWxseSByZXRpcmUgaXQuDQoNCiAgUGF1bA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
