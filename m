Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6C12606C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:05:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtYv-0003St-Ux; Thu, 19 Dec 2019 11:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihtYv-0003So-3k
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:01:45 +0000
X-Inumbo-ID: f139bc5c-224e-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f139bc5c-224e-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576753304; x=1608289304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=82/C5FBJ5BbPt2MHbgh/bRvCNyV/is7bPx0VFNhon4M=;
 b=uUigZIQRV0RLYVhf40fo60ANvn5FtnrkNlllN0hRIaNU+SUU6+UaEE1g
 unsS+ACcUQvLsCxWpsiCU+DxQd3qO06WrRdXAND2nDnANnVZa79WbUt5Y
 ODrGUUKxMecBJhSC30Eg0crtBQ9GGM/xj2xZm3sAAeq7FVgkhswwOVjUB s=;
IronPort-SDR: H19Wg5QjcWrBKNLBIGCXIf9NPETTTyeqwVtYIEjnU06znZaBLzPsMkjJ0W4FDUo/vGATq/ewga
 7C0TmatiFO0w==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; d="scan'208";a="14441262"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Dec 2019 11:01:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 80F3AA1965; Thu, 19 Dec 2019 11:01:32 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:01:31 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:01:31 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 11:01:30 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] x86/save: reserve HVM save record numbers that have been
 consumed...
Thread-Index: AQHVtb2HD8UZZLEQMEaUpPbPmxeuyqfBQ9SAgAAHzMA=
Date: Thu, 19 Dec 2019 11:01:30 +0000
Message-ID: <c60bde045e234e8aa38cffb17bf07516@EX13D32EUC003.ant.amazon.com>
References: <20191218160926.12538-1-pdurrant@amazon.com>
 <56e0a08f-bad9-f3ca-0e65-8b75de19f37c@suse.com>
In-Reply-To: <56e0a08f-bad9-f3ca-0e65-8b75de19f37c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE5IERlY2VtYmVyIDIwMTkgMTA6MzMNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHg4Ni9zYXZlOiByZXNlcnZlIEhWTSBz
YXZlIHJlY29yZCBudW1iZXJzIHRoYXQgaGF2ZQ0KPiBiZWVuIGNvbnN1bWVkLi4uDQo+IA0KPiBP
biAxOC4xMi4yMDE5IDE3OjA5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaA0KPiA+IEBAIC02MzksMTAgKzYzOSwxMiBAQCBzdHJ1
Y3QgaHZtX21zciB7DQo+ID4NCj4gPiAgI2RlZmluZSBDUFVfTVNSX0NPREUgIDIwDQo+ID4NCj4g
PiArLyogUmFuZ2UgMjIgLSA0MCByZXNlcnZlZCBmb3IgQW1hem9uICovDQo+ID4gKw0KPiA+ICAv
Kg0KPiA+ICAgKiBMYXJnZXN0IHR5cGUtY29kZSBpbiB1c2UNCj4gPiAgICovDQo+ID4gLSNkZWZp
bmUgSFZNX1NBVkVfQ09ERV9NQVggMjANCj4gPiArI2RlZmluZSBIVk1fU0FWRV9DT0RFX01BWCA0
MA0KPiANCj4gSSdtIG5vdCBvdmVybHkgaGFwcHkgdG8gc2VlIHRoZSByZXNwZWN0aXZlIGluLVhl
biBhcnJheSBkb3VibGUgaXRzDQo+IHNpemUgZm9yIG5vIHVzZSBhdCBhbGwuIEkgYWxzbyBkb24n
dCB0aGluayBvdXQtb2YtdHJlZSBleHRlbnNpb25zDQo+IHNob3VsZCBoYXZlIGJlZW4gYWRkZWQg
dXNpbmcgbnVtYmVycyBjb25zZWN1dGl2ZSB0byB0aGUgdXBzdHJlYW0NCj4gb25lcy4gSW5zdGVh
ZCwgYW4gQW1hem9uIHJhbmdlIHNob3VsZCBoYXZlIGJlZW4gcGlja2VkIGhpZ2ggdXAgaW4NCj4g
dGhlIG51bWJlciBzcGFjZSAoZS5nLiB3aXRoIHRoZSB1cHBlciBieXRlIGJlaW5nIEFTQ0lJICdB
JykuDQo+IA0KDQpUb3RhbGx5IGFncmVlZCwgYnV0IHdlIGRvbid0IGhhdmUgYSB0aW1lIG1hY2hp
bmUgaGFuZHkuDQoNCiAgUGF1bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
