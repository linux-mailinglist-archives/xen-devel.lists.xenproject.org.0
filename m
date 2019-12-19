Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A904126351
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 14:19:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihvf1-0008KN-Hs; Thu, 19 Dec 2019 13:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihvez-0008KI-Qy
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 13:16:09 +0000
X-Inumbo-ID: b85a9d62-2261-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b85a9d62-2261-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576761369; x=1608297369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qsGbyb0+BZrPLSZvHwSxRXzQXLptOBgCY6VR0Az7+jA=;
 b=ZLQBVlopW5kGFYnvJyFx1llVdwYTI/Dz0Zpa20/J4dbwawHGfCphFqaR
 NHfFG2NmJT5NaWM59EC9Diq0qWYt9lOgChzbuOrvzs4MtZrk9xz/6WfG+
 P9j/St5W2kULOKzgXFIuI5YgI/6pSvK+KVQCLX1YUTHwV7adODG03AnE4 Q=;
IronPort-SDR: SMCYxszZVe/okKyxGGC3yzJRJ3X22HkaiOClhazJpHmFRQRu7cm++8aikpimVdIzeiO+nZyOaZ
 TiNYe8KbLrwQ==
X-IronPort-AV: E=Sophos;i="5.69,332,1571702400"; 
   d="scan'208";a="6052912"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 19 Dec 2019 13:15:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 633A7A2DD3; Thu, 19 Dec 2019 13:15:55 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 19 Dec 2019 13:15:54 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 13:15:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 13:15:53 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/save: reserve HVM save record numbers that have
 been consumed...
Thread-Index: AQHVtmSJnEe7ujCptU+cy1ctVJs22afBX3kAgAAD9+CAAAp6gIAAAO7A
Date: Thu, 19 Dec 2019 13:15:53 +0000
Message-ID: <5bf5afe2cfa043b0b3e3b27011400668@EX13D32EUC003.ant.amazon.com>
References: <20191219120455.13357-1-pdurrant@amazon.com>
 <7afa5fe6-e293-a017-ce97-9aac00cc3691@citrix.com>
 <38c8b0ddf76b497893a5bd52150423c7@EX13D32EUC003.ant.amazon.com>
 <12d3bb9d-a075-6135-5925-87b9b72644df@citrix.com>
In-Reply-To: <12d3bb9d-a075-6135-5925-87b9b72644df@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/save: reserve HVM save record
 numbers that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxOSBEZWNlbWJlciAyMDE5IDEzOjA4DQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHg4Ni9zYXZlOiByZXNlcnZlIEhWTSBz
YXZlIHJlY29yZCBudW1iZXJzIHRoYXQNCj4gaGF2ZSBiZWVuIGNvbnN1bWVkLi4uDQo+IA0KPiBP
biAxOS8xMi8yMDE5IDEyOjM3LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KPiA+PiBTZW50OiAxOSBEZWNlbWJlciAyMDE5IDEyOjE2DQo+ID4+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1DQo+IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHg4Ni9zYXZlOiByZXNl
cnZlIEhWTSBzYXZlIHJlY29yZCBudW1iZXJzIHRoYXQNCj4gPj4gaGF2ZSBiZWVuIGNvbnN1bWVk
Li4uDQo+ID4+DQo+ID4+IE9uIDE5LzEyLzIwMTkgMTI6MDQsIFBhdWwgRHVycmFudCB3cm90ZToN
Cj4gPj4+IC4uLmZvciBwYXRjaGVzIG5vdCAoeWV0KSB1cHN0cmVhbS4NCj4gPj4+DQo+ID4+PiBU
aGlzIHBhdGNoIGlzIHNpbXBseSBhZGRpbmcgYSBjb21tZW50IHRvIHJlc2VydmUgc2F2ZSByZWNv
cmQgbnVtYmVyDQo+ID4+IHNwYWNlDQo+ID4+PiB0byBhdm9pZCB0aGUgcmlzayBvZiBjbGFzaGVz
IGJldHdlZW4gZXhpc3RlbnQgZG93bnN0cmVhbSBjaGFuZ2VzIG1hZGUNCj4gYnkNCj4gPj4+IEFt
YXpvbiBhbmQgZnV0dXJlIHVwc3RyZWFtIGNoYW5nZXMgd2hpY2ggbWF5IGJlIGluY29tcGF0aWJs
ZS4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+DQo+ID4+PiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPj4+
IC0tLQ0KPiA+Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+IENj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+Pj4gQ2M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4+Pg0KPiA+Pj4gdjI6
DQo+ID4+PiAgLSBSZWR1Y2UgcGF0Y2ggdG8ganVzdCBhIGNvbW1lbnQNCj4gPj4+IC0tLQ0KPiA+
Pj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc2F2ZS5oIHwgMiArKw0KPiA+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgNCj4gPj4gYi94ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaA0KPiA+Pj4gaW5kZXggYjJhZDNmY2Q3NC4u
YjNkNDQ1YWNmNyAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4
Ni9odm0vc2F2ZS5oDQo+ID4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvaHZt
L3NhdmUuaA0KPiA+Pj4gQEAgLTYzOSw2ICs2MzksOCBAQCBzdHJ1Y3QgaHZtX21zciB7DQo+ID4+
Pg0KPiA+Pj4gICNkZWZpbmUgQ1BVX01TUl9DT0RFICAyMA0KPiA+Pj4NCj4gPj4+ICsvKiBSYW5n
ZSAyMiAtIDQwIHJlc2VydmVkIGZvciBBbWF6b24gKi8NCj4gPj4gV2hhdCBhYm91dCAyMSBhbmQg
MjI/wqAgQW5kIHdoZXJlIGRvZXMgdGhlIGFjdHVhbCBudW1iZXIgc3RvcCwgYmVjYXVzZQ0KPiA+
PiBiYXNlZCBvbiB2MSwgaXRzIG5vdCA0MC4NCj4gPj4NCj4gPiBUaGUgcmFuZ2UgaXMgaW5jbHVz
aXZlIChtYXliZSB0aGF0J3Mgbm90IG9idmlvdXM/KS4gRm9yIHNvbWUgcmVhc29uIDIxDQo+IHdh
cyBza2lwcGVkIGJ1dCB3aHkgZG8geW91IHNheSB0aGUgdG9wIGlzIG5vdCA0MD8gVGhhdCB3YXMg
d2hhdCBJIHNldA0KPiBIVk1fU0FWRV9DT0RFX01BWCB0byBpbiB2MS4NCj4gDQo+IFlvdSBhbHNv
IHNhaWQgdGhhdCBpbmNsdWRlZCBwcm9zcGVjdGl2ZSBoZWFkcm9vbSwgd2hpY2ggZGVmaW5pdGVs
eSBpc24ndA0KPiBmYWlyIHRvIHJlc2VydmUgZm9yIEFCSSBicmVha2FnZSByZWFzb25zLg0KPiAN
Cj4gV2hpY2ggbnVtYmVycyBoYXZlIGFjdHVhbGx5IGJlZW4gYWxsb2NhdGVkPw0KPiANCg0KVGhl
IHByb2JsZW0gaXMgdGhhdCBJIGRvbid0IHlldCBrbm93IGZvciBzdXJlLiBJIGhhdmUgZGVmaW5p
dGVseSBzZWVuIHBhdGNoZXMgdXNpbmcgMjIgdGhydSAzNC4gSXQgaXMgKnByb2JhYmx5KiBzYWZl
IHRvIHJlc3RyaWN0IHRvIHRoYXQgYnV0IGRvZXMgaXQgcmVhbGx5IGNvc3QgdGhhdCBtdWNoIG1v
cmUgdG8gcmVzZXJ2ZSBzb21lIGV4dHJhIHNwYWNlIGp1c3QgaW4gY2FzZT8gSS5lLiBpZiBzb21l
b25lIGVsc2UgYWRkcyA0MSB2cy4gMzUgaXMgaXQgZ29pbmcgdG8gbWFrZSBtdWNoIG9mIGEgZGlm
ZmVyZW5jZT8NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
