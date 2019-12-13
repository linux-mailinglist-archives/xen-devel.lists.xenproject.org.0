Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189611E4B8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:33:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifl13-0006M5-Vv; Fri, 13 Dec 2019 13:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifl13-0006Lt-81
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:29:57 +0000
X-Inumbo-ID: a6f16e70-1dac-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6f16e70-1dac-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576243797; x=1607779797;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YEjES+AC89Bf2he2k+y7TN3zywA4vmS/kIr/FskqQ2c=;
 b=KTUgi18r54DeJMPGG96o21wFuY36g1fNbhQv/nnj1zRruYrM0c5c+F0o
 pf4dAzzdn/M7TylEpBStppoZFLRXFwT/h/L3ueJfnZBLieikejl6VUoYc
 8XA0DhnEOu3GtPgNrjY6KocyiYeJusbx+hMvcAIP/LlTwB6rQ2OYi0k1C w=;
IronPort-SDR: EdKxOHGi2krmjiHv/DWDeqEC+fd0Fl0HPOLglEgFZ03lDGgO3yiZBaHEzJb6qGebcLfJ+/TZ2F
 t8pxKFdahBww==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; d="scan'208";a="13346169"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Dec 2019 13:29:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 88CF6C0B05; Fri, 13 Dec 2019 13:29:39 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:29:38 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:29:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 13:29:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHVsbjPOKxBmvZx1kKO+dWiu2kwqKe4DvUQ
Date: Fri, 13 Dec 2019 13:29:37 +0000
Message-ID: <ccddbcf10d734cdbaf494a55ad4f6d06@EX13D32EUC003.ant.amazon.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <d48d495dc3ab4ba1869221be36fac343@EX13D32EUC003.ant.amazon.com>
 <7f6254b6-a19a-5bf8-0ba7-e0b2479c868b@suse.com>
In-Reply-To: <7f6254b6-a19a-5bf8-0ba7-e0b2479c868b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMTkgMTM6MjYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IEtldmluDQo+IFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBLb25yYWQgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47DQo+IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9y
Zz47DQo+IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJd
IElPTU1VOiBtYWtlIERNQSBjb250YWlubWVudCBvZiBxdWFyYW50aW5lZCBkZXZpY2VzDQo+IG9w
dGlvbmFsDQo+IA0KPiBPbiAxMy4xMi4yMDE5IDE0OjEyLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhl
bi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSmFu
DQo+ID4+IEJldWxpY2gNCj4gPj4gU2VudDogMTMgRGVjZW1iZXIgMjAxOSAxMjo1Mw0KPiA+PiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47DQo+
ID4+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBH
cmFsbA0KPiA+PiA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFk
IFdpbGsNCj4gPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Ow0KPiA+PiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Ow0KPiA+PiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4g
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0gg
djJdIElPTU1VOiBtYWtlIERNQSBjb250YWlubWVudCBvZg0KPiBxdWFyYW50aW5lZA0KPiA+PiBk
ZXZpY2VzIG9wdGlvbmFsDQo+ID4+DQo+ID4+IENvbnRhaW5pbmcgc3RpbGwgaW4gZmxpZ2h0IERN
QSB3YXMgaW50cm9kdWNlZCB0byB3b3JrIGFyb3VuZCBjZXJ0YWluDQo+ID4+IGRldmljZXMgLyBz
eXN0ZW1zIGhhbmdpbmcgaGFyZCB1cG9uIGhpdHRpbmcgYW4gSU9NTVUgZmF1bHQuIFBhc3NpbmcN
Cj4gPj4gdGhyb3VnaCAoc3VjaCkgZGV2aWNlcyAob24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVu
dGx5IGluc2VjdXJlIChhcw0KPiA+PiBndWVzdHMgY291bGQgZWFzaWx5IGFycmFuZ2UgZm9yIElP
TU1VIGZhdWx0cyB0byBvY2N1cikuIERlZmF1bHRpbmcgdG8NCj4gPj4gYSBtb2RlIHdoZXJlIGFk
bWlucyBtYXkgbm90IGV2ZW4gYmVjb21lIGF3YXJlIG9mIGlzc3VlcyB3aXRoIGRldmljZXMNCj4g
Y2FuDQo+ID4+IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFibGUuIFRoZXJlZm9yZSBjb252ZXJ0IHRo
aXMgbW9kZSBvZiBvcGVyYXRpb24gdG8NCj4gPj4gYW4gb3B0aW9uYWwgb25lLCBub3Qgb25lIGVu
YWJsZWQgYnkgZGVmYXVsdC4NCj4gPj4NCj4gPj4gVGhpcyBpbnZvbHZlcyByZXN1cnJlY3Rpbmcg
Y29kZSBjb21taXQgZWEzODg2NzgzMWRhICgieDg2IC8gaW9tbXU6IHNldA0KPiA+PiB1cCBhIHNj
cmF0Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBkb21haW4iKSBkaWQgcmVtb3ZlLCBpbiBhIHNs
aWdodGx5DQo+ID4+IGV4dGVuZGVkIGFuZCBhYnN0cmFjdGVkIGZhc2hpb24uIEhlcmUsIGluc3Rl
YWQgb2YgcmVpbnRyb2R1Y2luZyBhDQo+IHByZXR0eQ0KPiA+PiBwb2ludGxlc3MgdXNlIG9mICJn
b3RvIiBpbiBkb21haW5fY29udGV4dF91bm1hcCgpLCBhbmQgaW5zdGVhZCBvZg0KPiBtYWtpbmcN
Cj4gPj4gdGhlIGZ1bmN0aW9uIChhdCBsZWFzdCB0ZW1wb3JhcmlseSkgaW5jb25zaXN0ZW50LCB0
YWtlIHRoZSBvcHBvcnR1bml0eQ0KPiA+PiBhbmQgcmVwbGFjZSB0aGUgb3RoZXIgc2ltaWxhcmx5
IHBvaW50bGVzcyAiZ290byIgYXMgd2VsbC4NCj4gPj4NCj4gPj4gSW4gb3JkZXIgdG8ga2V5IHRo
ZSByZS1pbnN0YXRlZCBieXBhc3NlcyBvZmYgb2YgdGhlcmUgKG5vdCkgYmVpbmcgYQ0KPiByb290
DQo+ID4+IHBhZ2UgdGFibGUgdGhpcyBmdXJ0aGVyIHJlcXVpcmVzIG1vdmluZyB0aGUgYWxsb2Nh
dGVfZG9tYWluX3Jlc291cmNlcygpDQo+ID4+IGludm9jYXRpb24gZnJvbSByZWFzc2lnbl9kZXZp
Y2UoKSB0byBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpDQo+IChvcg0KPiA+PiBlbHNl
IHJlYXNzaWduX2RldmljZSgpIHdvdWxkIGFsbG9jYXRlIGEgcm9vdCBwYWdlIHRhYmxlIGFueXdh
eSk7IHRoaXMNCj4gaXMNCj4gPj4gYmVuaWduIHRvIHRoZSBzZWNvbmQgY2FsbGVyIG9mIHRoZSBs
YXR0ZXIgZnVuY3Rpb24uDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gLS0tDQo+ID4+IEFzIGZhciBhcyA0LjEzIGlzIGNvbmNl
cm5lZCwgSSBndWVzcyBpZiB3ZSBjYW4ndCBjb21lIHRvIGFuIGFncmVlbWVudA0KPiA+PiBoZXJl
LCB0aGUgb25seSBvdGhlciBvcHRpb24gaXMgdG8gcmV2ZXJ0IGVhMzg4Njc4MzFkYSBmcm9tIHRo
ZSBicmFuY2gsDQo+ID4+IGZvciBoYXZpbmcgYmVlbiBjb21taXR0ZWQgcHJlbWF0dXJlbHkgKEkn
bSBub3Qgc28gbXVjaCB3b3JyaWVkIGFib3V0DQo+IHRoZQ0KPiA+PiBtYXN0ZXIgYnJhbmNoLCB3
aGVyZSB3ZSBoYXZlIGFtcGxlIHRpbWUgdW50aWwgNC4xNCkuIFdoYXQgSSBzdXJlbHkgd2FudA0K
PiA+PiB0byBzZWUgdXMgYXZvaWQgaXMgYSBiYWNrIGFuZCBmb3J0aCBpbiBiZWhhdmlvciBvZiBy
ZWxlYXNlZCB2ZXJzaW9ucy4NCj4gPj4gKE5vdGUgdGhhdCA0LjEyLjIgaXMgc2ltaWxhcmx5IGJs
b2NrZWQgb24gYSBkZWNpc2lvbiBlaXRoZXIgd2F5IGhlcmUuKQ0KPiA+Pg0KPiA+PiBJJ20gaGFw
cHkgdG8gdGFrZSBiZXR0ZXIgc3VnZ2VzdGlvbnMgdG8gcmVwbGFjZSAiZnVsbCIuDQo+ID4NCj4g
PiBIb3cgYWJvdXQgc2ltcGx5ICJzaW5rIiwgc2luY2UgdGhhdCdzIHdoYXQgaXQgZG9lcz8NCj4g
DQo+IEJ1dCBpdCdzIG5vdCByZWFsbHkgYSAic2luayIsIGFzIHdlIHN0aWxsIGZhdWx0IHdyaXRl
cyAod2hpY2ggaXMgdGhlDQo+IG9ubHkgdGhpbmcgSSBjYW4gc2VlIHRvIGJlICJzdW5rIiBpZiBJ
J20gZ2V0dGluZyB0aGUgbWVhbmluZyBvZiB0aGUNCj4gd29yZCByaWdodCkuDQo+IA0KPiA+PiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ID4+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gPj4gQEAgLTMwLDEzICszMCwxNyBAQCBib29sX3Qg
X19pbml0ZGF0YSBpb21tdV9lbmFibGUgPSAxOw0KPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkg
aW9tbXVfZW5hYmxlZDsNCj4gPj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGZvcmNlX2lvbW11Ow0K
PiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfdmVyYm9zZTsNCj4gPj4gLWJvb2wgX19y
ZWFkX21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gdHJ1ZTsNCj4gPj4gIGJvb2xfdCBfX3JlYWRf
bW9zdGx5IGlvbW11X2lnZnggPSAxOw0KPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVf
c25vb3AgPSAxOw0KPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gMTsN
Cj4gPj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2ludHJlbWFwID0gMTsNCj4gPj4gIGJv
b2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2NyYXNoX2Rpc2FibGU7DQo+ID4+DQo+ID4+ICsjZGVm
aW5lIElPTU1VX3F1YXJhbnRpbmVfbm9uZSAgMA0KPiA+PiArI2RlZmluZSBJT01NVV9xdWFyYW50
aW5lX2Jhc2ljIDENCj4gPj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9mdWxsICAyDQo+ID4+
ICt1aW50OF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfcXVhcmFudGluZSA9IElPTU1VX3F1YXJhbnRp
bmVfYmFzaWM7DQo+ID4NCj4gPiBJZiB3ZSBoYXZlICdJT01NVV9xdWFyYW50aW5lX3NpbmsnIGlu
c3RlYWQgb2YgJ0lPTU1VX3F1YXJhbnRpbmVfZnVsbCcsDQo+ID4gdGhlbiBob3cgYWJvdXQgJ0lP
TU1VX3F1YXJhbnRpbmVfd3JpdGVfZmF1bHQnIGluc3RlYWQgb2YNCj4gPiAnSU9NTVVfcXVhcmFu
dGluZV9iYXNpYyc/DQo+IA0KPiBXaHkgIndyaXRlX2ZhdWx0Ij8gRXZlbiBpbiAiZnVsbCIgbW9k
ZSB5b3Ugb25seSBhdm9pZCByZWFkIGZhdWx0cw0KPiBhaXVpIChzZWUgYWxzbyBhYm92ZSkuIFNv
IGlmIGFueXRoaW5nICJ3cml0ZV9mYXVsdCIgd291bGQgYmUgYQ0KPiByZXBsYWNlbWVudCBmb3Ig
ImZ1bGwiOyAiYmFzaWMiIGNvdWxkIGJlIHJlcGxhY2VkIGJ5IGp1c3QgImZhdWx0Ig0KPiB0aGVu
Lg0KDQpTb3JyeSwgeWVzLCBJIGhhZCB0aGluZ3MgdGhlIHdyb25nIHdheSByb3VuZC4gImZhdWx0
IiBhbmQgIndyaXRlX2ZhdWx0IiBzb3VuZCBnb29kLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
