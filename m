Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2226173411
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:31:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bwq-0008Er-PZ; Fri, 28 Feb 2020 09:28:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7bwo-0008Em-Ek
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:28:42 +0000
X-Inumbo-ID: b42ae106-5a0c-11ea-98e0-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b42ae106-5a0c-11ea-98e0-12813bfff9fa;
 Fri, 28 Feb 2020 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582882120; x=1614418120;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=csZn8KXtYw3p/rW+kpQgfgW8/G2BrwUuJegoibmoKyo=;
 b=FN9N2cXW3gkgGHAKGIKWQA3sXMP0P/CnAsvn+xu6nsBGOS9D6AXU4AlQ
 YqXUUOpgTmathDl4bjpsZJCGKQqFvdfW+Wtxb9LRGICHp7GmD9APl9L/j
 JLoY/cesceXOaO24YPaI+uTZ+q9J/H9iKgpfEk6w4ZZUOGVfxEpli9m3Z w=;
IronPort-SDR: Y8xBmhWhsDH9doYZLOkubvRXjNubsJ6Fs/u6CsppviQq0FmSzuy4lqQK+bYOXsbfc8LEbOGr+z
 chCgvWmfkTxw==
X-IronPort-AV: E=Sophos;i="5.70,495,1574121600"; d="scan'208";a="19693225"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 28 Feb 2020 09:28:38 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2DA05A29EA; Fri, 28 Feb 2020 09:28:35 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 09:28:35 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 09:28:34 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 28 Feb 2020 09:28:34 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 2/3] libxl: make creation of xenstore suspend
 event channel node optional
Thread-Index: AQHV7L8OAa72gx1kykG6FoNe6b1rq6gvp3YAgACu9rA=
Date: Fri, 28 Feb 2020 09:28:34 +0000
Message-ID: <ff397422acb84e0a93bede1b742bf822@EX13D32EUC003.ant.amazon.com>
References: <20200226160848.1854-1-pdurrant@amazon.com>
 <20200226160848.1854-3-pdurrant@amazon.com>
 <4ad6fe4e-40bd-7a04-54d2-38edb56346e9@xen.org>
In-Reply-To: <4ad6fe4e-40bd-7a04-54d2-38edb56346e9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.91]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/3] libxl: make creation of xenstore
 suspend event channel node optional
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAyNyBGZWJydWFyeSAyMDIwIDIyOjUyDQo+IFRvOiBEdXJyYW50
LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsg
SWFuIEphY2tzb24NCj4gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvM10gbGlieGw6IG1h
a2UgY3JlYXRpb24gb2YgeGVuc3RvcmUNCj4gc3VzcGVuZCBldmVudCBjaGFubmVsIG5vZGUgb3B0
aW9uYWwNCj4gDQo+IEhpLA0KPiANCj4gT24gMjYvMDIvMjAyMCAxNjowOCwgUGF1bCBEdXJyYW50
IHdyb3RlOg0KPiA+IFRoZSBwdXJwb3NlIGFuZCBzZW1hbnRpY3Mgb2YgdGhlIG5vZGUgYXJlIGV4
cGxhaW5lZCBpbg0KPiA+IHhlbnN0b3JlLXBhdGhzLnBhbmRvYyBbMV0uIEl0IHdhcyBvcmlnaW5h
bGx5IGludHJvZHVjZWQgaW4geGVuZCBieQ0KPiBjb21taXQNCj4gPiAxNzYzNmY0N2E0NzQgIlRl
YWNoIHhjX3NhdmUgdG8gdXNlIGV2ZW50LWNoYW5uZWwtYmFzZWQgZG9tYWluIHN1c3BlbmQgaWYN
Cj4gPiBhdmFpbGFibGUuIi4gTm90ZSB0aGF0LCBiZWNhdXNlLCB0aGUgdG9wLWxldmVsIGZyb250
ZW5kICdkZXZpY2UnIG5vZGUNCj4gd2FzDQo+ID4gY3JlYXRlZCB3cml0YWJsZSBieSB0aGUgZ3Vl
c3QgaW4geGVuZCwgdGhlcmUgd2FzIG5vIG5lZWQgdG8gZXhwbGljaXRseQ0KPiA+IGNyZWF0ZSB0
aGUgJ3N1c3BlbmQtZXZlbnQtY2hhbm5lbCcgbm9kZSBhcyB3cml0YWJsZSBub2RlLg0KPiA+DQo+
ID4gSG93ZXZlciwgbGlieGwgY3JlYXRlcyB0aGUgJ2RldmljZScgbm9kZSBhcyByZWFkLW9ubHkg
YnkgdGhlIGd1ZXN0IGFuZA0KPiBzbw0KPiA+IGV4cGxpY2l0IGNyZWF0aW9uIG9mIHRoZSAnc3Vz
cGVuZC1ldmVudC1jaGFubmVsJyBub2RlIGlzIG5lY2Vzc2FyeSB0bw0KPiBtYWtlDQo+ID4gaXQg
dXNhYmxlLiBUaGlzIHVuZm9ydHVuYXRlbHkgaGFzIHRoZSBzaWRlLWVmZmVjdCBvZiBtYWtpbmcg
c29tZSBvbGQNCj4gPiBXaW5kb3dzIFBWIGRyaXZlcnMgWzJdIGNlYXNlIHRvIGZ1bmN0aW9uLiBU
aGlzIGlzIGJlY2F1c2UgdGhleSBzY2FuIHRoZQ0KPiB0b3ANCj4gPiBsZXZlbCAnZGV2aWNlJyBu
b2RlLCBmaW5kIHRoZSAnc3VzcGVuZCcgbm9kZSBhbmQgZXhwZWN0IGl0IHRvIGNvbnRhaW4NCj4g
dGhlDQo+ID4gdXN1YWwgc3ViLW5vZGVzIGRlc2NyaWJpbmcgYSBQViBmcm9udGVuZC4gV2hlbiB0
aGlzIGlzIGZvdW5kIG5vdCB0byBiZQ0KPiB0aGUNCj4gPiBjYXNlLCBlbnVtZXJhdGlvbiBjZWFz
ZXMgYW5kIChiZWNhdXNlIHRoZSAnc3VzcGVuZCcgbm9kZSBpcyBvYnNlcnZlZA0KPiBiZWZvcmUN
Cj4gPiB0aGUgJ3ZiZCcgbm9kZSkgbm8gc3lzdGVtIGRpc2sgaXMgZW51bWVyYXRlZC4gV2luZG93
cyB3aWxsIHRoZW4gY3Jhc2gNCj4gd2l0aA0KPiA+IGJ1Z2NoZWNrIGNvZGUgMHg3Qi4NCj4gPg0K
PiA+IFRoaXMgcGF0Y2ggYWRkcyBhIGJvb2xlYW4gJ3N1c3BlbmRfZXZlbnRfY2hhbm5lbCcgZmll
bGQgaW50bw0KPiA+IGxpYnhsX2NyZWF0ZV9pbmZvIHRvIGNvbnRyb2wgd2hldGhlciB0aGUgeGVu
c3RvcmUgbm9kZSBpcyBjcmVhdGVkIGFuZCBhDQo+ID4gc2ltaWxhcmx5IG5hbWVkIG9wdGlvbiBp
biB4bC5jZmcgd2hpY2gsIGZvciBjb21wYXRpYmlsaXR5IHdpdGggcHJldmlvdXMNCj4gPiBsaWJ4
bCBiZWhhdmlvdXIsIGRlZmF1bHRzIHRvIHRydWUuDQo+ID4NCj4gPiBbMV0NCj4gaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9ZG9jcy9taXNjL3hlbnN0
b3JlLQ0KPiBwYXRocy5wYW5kb2M7aGI9SEVBRCNsMTc3DQo+ID4gWzJdIGh0dHBzOi8vYWNjZXNz
LnJlZGhhdC5jb20vZG9jdW1lbnRhdGlvbi9lbi0NCj4gdXMvcmVkX2hhdF9lbnRlcnByaXNlX2xp
bnV4LzUvaHRtbC9wYXJhLQ0KPiB2aXJ0dWFsaXplZF93aW5kb3dzX2RyaXZlcnNfZ3VpZGUvc2Vj
dC1wYXJhLQ0KPiB2aXJ0dWFsaXplZF93aW5kb3dzX2RyaXZlcnNfZ3VpZGUtDQo+IGluc3RhbGxp
bmdfYW5kX2NvbmZpZ3VyaW5nX3RoZV9wYXJhX3ZpcnR1YWxpemVkX2RyaXZlcnMtDQo+IGluc3Rh
bGxpbmdfdGhlX3BhcmFfdmlydHVhbGl6ZWRfZHJpdmVycw0KPiA+DQo+ID4gTk9URTogV2hpbGUg
YWRkaW5nIHRoZSBuZXcgTElCWExfSEFWRV9DUkVBVEVJTkZPX1NVU1BFTkRfRVZFTlRfQ0hBTk5F
TA0KPiA+ICAgICAgICBkZWZpbml0aW9uIGludG8gbGlieGwuaCwgdGhpcyBwYXRjaCBjb3JyZWN0
cyB0aGUgcHJldmlvdXMgc3RhbnphDQo+ID4gICAgICAgIHdoaWNoIGVycm9uZW91c2x5IGltcGxp
ZXMgaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gaXMgYSBmdW5jdGlvbi4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPiAtLS0NCj4g
PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+ID4gQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+ICAgZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAg
IHwgIDcgKysrKysrKw0KPiA+ICAgdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgIHwgMTMgKysr
KysrKysrKysrLQ0KPiA+ICAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgIHwgMTIgKysrKysr
KysrLS0tDQo+ID4gICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgfCAgMSArDQo+ID4gICB0
b29scy94bC94bF9wYXJzZS5jICAgICAgICAgfCAgMyArKysNCj4gDQo+IFlvdSBtYXkgd2FudCB0
byB1cGRhdGUgeGVuc3RvcmUtcGF0aHMucGFuZG9jIGFzIHRoZSBkb2N1bWVudCBtZW50aW9uIHRo
ZQ0KPiBub2RlIHdpbGwgYmUgY3JlYXRlZCBieSB0aGUgdG9vbHN0YWNrLg0KPiANCg0KVGhlIGRv
YyBhbHJlYWR5IHNheXMgdGhhdDoNCg0KLS0tLS0NCiMjIyMgfi9kZXZpY2Uvc3VzcGVuZC9ldmVu
dC1jaGFubmVsID0gIiJ8RVZUQ0hOIFt3XQ0KIA0KVGhlIGRvbWFpbidzIHN1c3BlbmQgZXZlbnQg
Y2hhbm5lbC4gVGhlIHRvb2xzdGFjayB3aWxsIGNyZWF0ZSB0aGlzDQpwYXRoIHdpdGggYW4gZW1w
dHkgdmFsdWUgd2hpY2ggdGhlIGd1ZXN0IG1heSBjaG9vc2UgdG8gb3ZlcndyaXRlLg0KLS0tLS0N
Cg0KPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiBiL2RvY3Mv
bWFuL3hsLmNmZy41LnBvZC5pbg0KPiA+IGluZGV4IDBjYWQ1NjEzNzUuLjVmNDc2ZjFlMWQgMTAw
NjQ0DQo+ID4gLS0tIGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluDQo+ID4gKysrIGIvZG9jcy9t
YW4veGwuY2ZnLjUucG9kLmluDQo+ID4gQEAgLTY2OCw2ICs2NjgsMTMgQEAgZmlsZS4NCj4gPg0K
PiA+ICAgPWJhY2sNCj4gPg0KPiA+ICs9aXRlbSBCPHN1c3BlbmRfZXZlbnRfY2hhbm5lbD1CT09M
RUFOPg0KPiA+ICsNCj4gPiArQ3JlYXRlIHRoZSB4ZW5zdG9yZSBwYXRoIGZvciB0aGUgZG9tYWlu
J3Mgc3VzcGVuZCBldmVudCBjaGFubmVsLiBUaGUNCj4gPiArZXhpc3RlbmNlIG9mIHRoaXMgcGF0
aCBjYW4gY2F1c2UgcHJvYmxlbXMgd2l0aCBvbGRlciBQViBkcml2ZXJzIHJ1bm5pbmcNCj4gPiAr
aW4gdGhlIGd1ZXN0LiBJZiB0aGlzIG9wdGlvbiBpcyBub3Qgc3BlY2lmaWVkIHRoZW4gaXQgd2ls
bCBkZWZhdWx0IHRvDQo+ID4gK0I8dHJ1ZT4uDQo+IA0KPiBJbiB0aGUgbmV4dCBwYXRjaCB5b3Ug
YXJlIGdvaW5nIHRvIG1ha2UgZGV2aWNlLyBydy4gRG8geW91IHNlZSBhbnkgaXNzdWUNCj4gd2l0
aCBqdXN0IG5vdCBjcmVhdGluZyB0aGUgbm9kZSBmb3IgZXZlcnlvbmU/IEFyZSBQViBkcml2ZXJz
IGFsbG93ZWQgdG8NCj4gYXNzdW1lIGEgbm9kZSB3aWxsIGJlIHByZXNlbnQ/DQoNCldlbGwgdGhh
dCdzIHRoZSBwcm9ibGVtLiBTb21lIG9mIHRoZW0gbWF5IGhhdmUgYmVjb21lIGFjY3VzdG9tZWQg
dG8gaXQgYmVpbmcgcHJlc2VudC4gQWxzbyB0aGUgZG9jdW1lbnRhdGlvbiBkb2VzIHNheSBpdCBp
cyBjcmVhdGVkIGJ5IHRoZSB0b29sc3RhY2sgKGJ1dCBub3Qgd2hlbikuIFBlcmhhcHMgSSBzaG91
bGQgdXBkYXRlIHRoZSBkb2MgdG8gc2F5IHRoZSB0b29sc3RhY2sgKm1heSogY3JlYXRlIHRoaXMg
cGF0aCB3aGVuIHRoZSBkb21haW4gaXMgY3JlYXRlZC4NCg0KPiANCj4gTXkga25vd2xlZGdlIG9m
IHhlbnN0b3JlIGlzIGxpbWl0ZWQsIHNvIEkgdGhvdWdodCBJIHdvdWxkIGFzayB0aGUNCj4gcXVl
c3Rpb25zIHRvIHVuZGVyc3RhbmQgYSBiaXQgbW9yZSBob3cgc3RhYmxlIHRoZSBBQkkgaXMgbWVh
bnQgdG8gYmUuIDopLg0KDQpTdGFibGU/IFRoYXQnbGwgYmUgdGhlIGRheSA6LSkNCg0KICBQYXVs
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
