Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120FC11A9F2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:30:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0AG-0000aT-LN; Wed, 11 Dec 2019 11:28:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SbsP=2B=amazon.com=prvs=241424563=hongyxia@srs-us1.protection.inumbo.net>)
 id 1if0AE-0000aO-N3
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:28:18 +0000
X-Inumbo-ID: 5463d5fc-1c09-11ea-8b0c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5463d5fc-1c09-11ea-8b0c-12813bfff9fa;
 Wed, 11 Dec 2019 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576063699; x=1607599699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ooQy9jkx/O3q7wrOIL62LeTlNPEErCGUh12N2raTSLo=;
 b=JzyUwK9vDRv8TCvfQwvtb9ZvItei0bt4L3fDZNKcg+Mu4kwHvB972Lj9
 pZN2FPlveQ4S49L17BH0YGIzPrWtjdY6ks+aVuHH9/mnJ9yA01Y4kiQXv
 LxlYqMT1lHsKv/CTCwq9swAXbGy8fkQ0DpZSFRTZFtEUIRKhej0gB22gt E=;
IronPort-SDR: 2iGtXygnFScfNVSiTocD3BH0DpxHBrv3OOAGVJsb7GFFtrel353fS8Z0tBKzMRBpet8jnIp4QI
 uUJPFjJGrL/g==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8079481"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 11 Dec 2019 11:28:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id CBBC3A06E1; Wed, 11 Dec 2019 11:28:16 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:28:16 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:28:15 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 11:28:15 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "Grall, Julien"
 <jgrall@amazon.com>
Thread-Topic: [PATCH v2 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVr21Mya/2xs4A+0SBttLhz9PjBqe0vI6AgAAL0QCAAATtAA==
Date: Wed, 11 Dec 2019 11:28:15 +0000
Message-ID: <eeb762add75c87db90a3c93a35a7f2149e81c6f7.camel@amazon.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
 <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
 <477a3393debd18473fd15a4ec28a31d76376d320.camel@amazon.com>
 <d365aecc-0611-dc17-d63c-850e0a3363da@amazon.com>
In-Reply-To: <d365aecc-0611-dc17-d63c-850e0a3363da@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
Content-ID: <A418E1BB98B3334C99B8247161CA331A@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTEyLTExIGF0IDExOjEwICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
IEhpIEhvbmd5YW4sDQo+IC4uLg0KPiANCj4gV2hpbGUgdGhpcyBpbnZvbHZlcyBtb3JlIGluc3Ry
dWN0aW9ucywgaG93IG9mdGVuIGRvIHdlIGV4cGVjdCB0aGUNCj4gY29kZSANCj4gdG8gYmUgY2Fs
bGVkPw0KPiANCj4gQ2hlZXJzLA0KPiANCg0KSSBkb24ndCBleHBlY3QgdGhpcyB0byBiZSBjYWxs
ZWQgdmVyeSBvZnRlbiBpbiB0aGUgY3VycmVudCBYZW4uDQpBbHRob3VnaCB3aXRoIGRpcmVjdCBt
YXAgcmVtb3ZhbCwgYSBsb3Qgb2YgdGhlIG1lbW9yeSBhbGxvY2F0aW9ucw0KKG1vc3RseSB4ZW5o
ZWFwIGFsbG9jYXRpb25zKSB3aWxsIGJlIG1hcHBlZCBhbmQgdW5tYXBwZWQgb24tZGVtYW5kIGFu
ZA0KdGhlcmUgaXMgYSBtdWNoIGhpZ2hlciBjaGFuZ2Ugb2YgbWVyZ2luZy9zaGF0dGVyaW5nLg0K
DQpIb3dldmVyLCB0aGUgc2VyaWVzIG1vdmVkIGFsbCBQVEVzIGZyb20geGVuaGVhcCB0byBkb21o
ZWFwLCBhbmQgd2UNCm1pZ2h0IHNlZSBvdGhlciB0aGluZ3MgbW92ZWQgdG8gZG9taGVhcCBpbiB0
aGUgZnV0dXJlLCBzbyB3ZSBtaWdodCBub3QNCmhhdmUgbWFueSB0aGluZ3MgbGVmdCBvbiB4ZW5o
ZWFwIGFueXdheS4NCg0KSG9uZ3lhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
