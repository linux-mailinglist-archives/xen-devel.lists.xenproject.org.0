Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064F109F43
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:28:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZars-0002FC-58; Tue, 26 Nov 2019 13:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2sx=ZS=amazon.com=prvs=226091ee5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZarq-0002F7-Ib
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:26:58 +0000
X-Inumbo-ID: 6bd1b0fc-1050-11ea-83b8-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd1b0fc-1050-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574774818; x=1606310818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eu+xv4ntjCWqkWhcyA3QzN8S0nXdQJztcJndsC8JwTM=;
 b=hNOvYF3ObD7vGCVJcEMwSMUpwdwfiIjihupAmHdixDVED4fy37GDOsEb
 iDfPmfatsfMRaXdKwzH7B/KT38aP9NXGICre75Ne9307aCzp1embhujnh
 IjgS1sQC4TCzGr2XvakL7NtdtQNTdAW6999f1EQbCl8CF93i6XdERHw8b A=;
IronPort-SDR: SoVTulobd4UPjs8cHBQPldBSSK7zeiFl34zyBPRYJnKYwMgT2ol8FGbYymmVU9o0tOxGtPcrO5
 fpnQEgDzJH+g==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="4951028"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Nov 2019 13:26:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id C24DDA222B; Tue, 26 Nov 2019 13:26:51 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 13:26:50 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 13:26:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 13:26:50 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: George Dunlap <george.dunlap@citrix.com>, Paul Durrant <pdurrant@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
Thread-Index: AQHVmim/PqWwzQhzO0ayjIqIEVnr3KedZXMAgAARN4CAAAauUA==
Date: Tue, 26 Nov 2019 13:26:49 +0000
Message-ID: <fd50674c8f3c433093a92439c6778f8f@EX13D32EUC003.ant.amazon.com>
References: <20191113135330.1209-1-pdurrant@amazon.com>
 <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
 <cce5aa9a-6d3d-49ac-b633-21eaa1fcbd69@citrix.com>
In-Reply-To: <cce5aa9a-6d3d-49ac-b633-21eaa1fcbd69@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDI2IE5vdmVtYmVyIDIwMTkgMTI6MzINCj4g
VG86IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAZ21haWwuY29tPjsgRHVycmFudCwgUGF1bCA8cGR1
cnJhbnRAYW1hem9uLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+
OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UN
Cj4gRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIGRvbWFpbl9jcmVhdGU6IGhvbm91ciBnbG9iYWwN
Cj4gZ3JhbnQvbWFwdHJhY2sgZnJhbWUgbGltaXRzLi4uDQo+IA0KPiBPbiAxMS8yNi8xOSAxMToz
MCBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IE9uIFdlZCwgMTMgTm92IDIwMTkgYXQgMTM6
NTUsIFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+
IC4uLndoZW4gdGhlaXIgdmFsdWVzIGFyZSBsYXJnZXIgdGhhbiB0aGUgcGVyLWRvbWFpbiBjb25m
aWd1cmVkIGxpbWl0cy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPg0KPiA+PiAtLS0NCj4gPj4gQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGV1LmNpdHJpeC5jb20+DQo+ID4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4NCj4gPj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gPj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IENjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+DQo+ID4+IENjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4+IENjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPg0KPiA+Pg0KPiA+PiBBZnRlciBtaW5pbmcgdGhyb3VnaCBjb21taXRzIGl0IGlz
IHN0aWxsIHVuY2xlYXIgdG8gbWUgZXhhY3RseSB3aGVuIFhlbg0KPiA+PiBzdG9wcGVkIGhvbm91
cmluZyB0aGUgZ2xvYmFsIHZhbHVlcywgYnV0IEkgcmVhbGx5IHRoaW5rIHRoaXMgY29tbWl0DQo+
IHNob3VsZA0KPiA+PiBiZSBiYWNrLXBvcnRlZCB0byBzdGFibGUgdHJlZXMgYXMgaXQgd2FzIGEg
YmVoYXZpb3VyYWwgY2hhbmdlIHRoYXQgY2FuDQo+ID4+IGNhdXNlIGRvbVVzIHRvIGZhaWwgaW4g
bm9uLW9idmlvdXMgd2F5cy4NCj4gPg0KPiA+IEFueSBvdGhlciBvcGluaW9ucyBvbiB0aGlzPyBB
RkFJQ1QgcXVlc3Rpb25zIGlzIHN0aWxsIG9wZW46DQo+ID4NCj4gPiAtIERvIHdlIGNvbnNpZGVy
IG5vdCBob25vdXJpbmcgdGhlIGNvbW1hbmQgbGluZSB2YWx1ZXMgdG8gYmUgYQ0KPiA+IHJlZ3Jl
c3Npb24gKHNpbmNlIGRvbVVzIHRoYXQgd291bGQgaGF2ZSB3b3JrZWQgYmVmb3JlIHdpbGwgbm8g
bG9uZ2VyDQo+ID4gd29yayBhZnRlciBhIGJhc2ljIHVwZ3JhZGUgb2YgWGVuKT8NCj4gDQo+IFRo
aXMgd291bGQgYmUgYSBiaXQgZWFzaWVyIHRvIGZvcm0gYSAicG9saWN5IiBvcGluaW9uIG9uIChv
ciBwZXJoYXBzDQo+IGFsdGVybmF0ZSBzb2x1dGlvbnMgdG8pIGlmIG1vcmUgb2YgdGhlIHNpdHVh
dGlvbiB3ZXJlIG91dGxpbmVkIGhlcmUuDQo+IA0KPiBJcyB0aGUgcHJvYmxlbSB0aGF0IHRoZSBw
ZXItZG9tYWluIGNvbmZpZyBpcyBhbHdheXMgc2V0LCBhbmQgZG9lc24ndA0KPiB0YWtlIHRoZSBo
eXBlcnZpc29yLXNldCBjb25maWcgaW50byBhY2NvdW50PyAgV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvDQo+IG1vZGlmeSB0aGUgdG9vbHN0YWNrIHRvIHVzZSB0aGUgaHlwZXJ2aXNvciB2YWx1ZSBp
ZiBpdCdzIG5vdCBzZXQ/DQo+IA0KPiBJbiBmYWN0LCBpdCBsb29rcyBraW5kIG9mIGxpa2UgdGhp
bmdzIGFyZSBzY3Jld2VkIHVwIGFueXdheSAtLSB0aGUNCj4gImRlZmF1bHQiIHZhbHVlIG9mIG1h
eF9ncmFudF9mcmFtZXMsIGlmIG5vIHZhbHVlIGlzIHNwZWNpZmllZCwgaXMgc2V0IGluDQo+IHhs
LmMuICBJZiB0aGF0IHdlcmUgdGhlIGJlaGF2aW9yIHdlIHdhbnRlZCwgaXQgc2hvdWxkIGJlIHNl
dCBpbiBsaWJ4bC5jLg0KPiANCj4gQnV0IGl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGl0IHNob3VsZCBi
ZSB0ZXJyaWJseSBkaWZmaWN1bHQgdG8gZ2V0IGEgInVzZQ0KPiB0aGUgZGVmYXVsdCIgc2VudGlu
ZWwgdmFsdWUgcGFzc2VkIGluIHRvIFhlbiwgc3VjaCB0aGF0Og0KPiANCj4gMS4gUGVvcGxlIHdo
byBkb24ndCBkbyBhbnl0aGluZyB3aWxsIGdldCB0aGUgZGVmYXVsdCBjdXJyZW50bHkgc3BlY2lm
aWVkDQo+IGluIHhsLmMNCj4gDQo+IDIuIFBlb3BsZSB3aG8gc2V0IHRoZSB2YWx1ZSBvbiB0aGUg
WGVuIGNvbW1hbmQtbGluZSBhbmQgZG9uJ3Qgc2V0DQo+IGFueXRoaW5nIGluIHRoZSBndWVzdCBj
b25maWcgZmlsZSB3aWxsIGdldCB0aGUgWGVuIGNvbW1hbmQtbGluZSB2YWx1ZQ0KPiANCj4gMy4g
UGVvcGxlIHdobyBzZXQgdGhlIHZhbHVlIGluIHRoZSBjb25maWcgZmlsZSB3aWxsIGdldCB0aGUg
dmFsdWUgdGhleQ0KPiBzcGVjaWZpZWQgKHJlZ2FyZGxlc3Mgb2YgdGhlIGdsb2JhbCBzZXR0aW5n
KS4NCj4gDQo+IElzIHRoYXQgdGhlIGJlaGF2aW91ciB5b3UnZCBsaWtlIHRvIHNlZSwgUGF1bD8N
Cg0KSSB0aGluayB0aGUgb3JkZXIgc2hvdWxkIGJlOg0KDQpJZiBzZXQgaW4geGwuY2ZnID0+IHVz
ZSB0aGF0LCBlbHNlDQpJZiBzZXQgaW4geGwuY29uZiA9PiB1c2UgdGhhdCwgZWxzZQ0KVXNlIHRo
ZSBjb21tYW5kIGxpbmUvZGVmYXVsdCB2YWx1ZQ0KDQpJLmUuIHRoZSB1bHRpbWF0ZSB2YWx1ZSBz
aG91bGQgYmUgc2V0IGluIFhlbiAoYW5kIHBvc3NpYmx5IG92ZXJyaWRkZW4gYnkgdGhlIGNvbW1h
bmQgbGluZSkgYW5kIG5vdCBoYXJkY29kZWQgYXQgYW55IG90aGVyIGxheWVyLg0KDQpUaGVyZSBp
cyBhbHNvIHRoZSBpc3N1ZSBvZiBsaW1pdHMgYnV0IEkgZ3Vlc3MgdGhlIHJhdGlvbmFsZSB0aGVy
ZSBzaG91bGQgYmU6IElmIGEgdmFsdWUgKmlzKiBzcGVjaWZpZWQgdGhlbiBpdCBzaG91bGQgbm90
IGV4Y2VlZCB0aGUgdmFsdWUgc2V0IGluIFhlbi4NCg0KRG9lcyB0aGF0IHNvdW5kIHJpZ2h0Pw0K
DQogIFBhdWwNCg0KDQo+IA0KPiAgLUdlb3JnZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
