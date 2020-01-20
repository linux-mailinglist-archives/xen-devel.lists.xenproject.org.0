Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882961427B9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 11:00:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itToU-0004AH-8S; Mon, 20 Jan 2020 09:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0TSi=3J=amazon.co.uk=prvs=281953620=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itToS-0004AC-Bo
 for xen-devel@lists.xen.org; Mon, 20 Jan 2020 09:57:40 +0000
X-Inumbo-ID: 4aa9e8ae-3b6b-11ea-b93e-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aa9e8ae-3b6b-11ea-b93e-12813bfff9fa;
 Mon, 20 Jan 2020 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579514259; x=1611050259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1BFTdwklbUEwh9gP73wqa6wz5DTdWljG9F9QU+/lBOc=;
 b=DgEhsdTu6TIELDJ0sNTQPMEPe2/HtudUBTeTaLPBB2sNgbE8bsH1KbNU
 YUfe2LISGDgd7drtbiw+jNcI/Jm1MgxPdZq4mfrTZr1Cc39fReysXCigW
 1VfBJ1XJxUnAaJ9UWAlY1IpKN8fLo+mwuv25T6iWZTkUTOYAkOcX3F8ML c=;
IronPort-SDR: QIR22JsUhIRzdBg3564qZT0wOM0mSHV7uNMKqUlE/h6NZAxgPtsQPF7wgKGBTgm8ELdsZEnme9
 BoJe7hxnZkAw==
X-IronPort-AV: E=Sophos;i="5.70,341,1574121600"; d="scan'208";a="19725194"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 20 Jan 2020 09:57:27 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id E859AA237F; Mon, 20 Jan 2020 09:57:26 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 20 Jan 2020 09:57:26 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 20 Jan 2020 09:57:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 20 Jan 2020 09:57:25 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 1/2] xsm: add config option for denied
 string
Thread-Index: AQHVzVXU4ybTXIs76kKE2VMrchUlQKfzU6sAgAABU7A=
Date: Mon, 20 Jan 2020 09:57:25 +0000
Message-ID: <bad73b880c5346ef981d3a94cee7808b@EX13D32EUC003.ant.amazon.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <cf500c2a-3ec1-6d66-6170-f3bbc606f3bb@suse.com>
In-Reply-To: <cf500c2a-3ec1-6d66-6170-f3bbc606f3bb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.154]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 1/2] xsm: add config option for denied
 string
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMjAgSmFudWFyeSAyMDIwIDA5OjUxDQo+IFRvOiBTZXJnZXkgRHlhc2xpIDxz
ZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbkB4ZW4ub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47
DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBEb3VnIEdvbGRz
dGVpbg0KPiA8Y2FyZG9lQGNhcmRvZS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZzsgRGFu
aWVsIERlIEdyYWFmDQo+IDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+OyBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCB2MyAxLzJdIHhzbTogYWRkIGNvbmZpZyBvcHRpb24gZm9yIGRlbmllZA0KPiBzdHJpbmcNCj4g
DQo+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkgd3JvdGU6DQo+ID4gU2lnbmVk
LW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPg0KPiANCj4g
SW4gcHJpbmNpcGxlDQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IA0KPiBCdXQgSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBub24tZW1wdHkg
ZGVzY3JpcHRpb24sIGF0DQo+IGxlYXN0IHRvIHJlYXNvbiB3aHkgdGhlIG9wdGlvbiBhZGRpdGlv
biBpcyBkZWVtZWQgdXNlZnVsLg0KPiANCj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4g
PiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gPiBAQCAtMjM2LDYgKzIzNiwxNCBAQCBjaG9p
Y2UNCj4gPiAgCQlib29sICJTSUxPIiBpZiBYU01fU0lMTw0KPiA+ICBlbmRjaG9pY2UNCj4gPg0K
PiA+ICtjb25maWcgWFNNX0RFTklFRF9TVFJJTkcNCj4gPiArCXN0cmluZyAieGVuX3ZlcnNpb24g
ZGVuaWVkIHN0cmluZyINCj4gDQo+IEkgZ3Vlc3MgaW5zZXJ0aW5nICJoeXBlcmNhbGwiIGludG8g
dGhpcyBwcm9tcHQgd291bGQgc2V0IGJldHRlcg0KPiBjb250ZXh0IHdpdGhvdXQgbmVlZGluZyB0
byByZXNvcnQgdG8gdGhlIGhlbHAgdGV4dCwgaS5lLg0KPiAieGVuX3ZlcnNpb24gaHlwZXJjYWxs
IGRlbmllZCBzdHJpbmciLiBUaG91Z2h0cz8NCj4NCg0KInhlbl92ZXJzaW9uIGh5cGVyY2FsbCBk
ZW5pZWQgaW5mb3JtYXRpb24gcmVwbGFjZW1lbnQgc3RyaW5nIj8NCg0KSXQncyBub3QgbGlrZSB0
aGUgaHlwZXJjYWxsIGFzIGEgd2hvbGUgaXMgYmVpbmcgZGVuaWVkLCBhZnRlciBhbGwuDQoNCiAg
UGF1bA0KDQogDQo+IEphbg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
