Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA514B0D1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 09:24:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwM8g-0003MB-1G; Tue, 28 Jan 2020 08:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwM8d-0003M5-WD
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 08:22:24 +0000
X-Inumbo-ID: 4f6e50d6-41a7-11ea-b45d-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f6e50d6-41a7-11ea-b45d-bc764e2007e4;
 Tue, 28 Jan 2020 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580199744; x=1611735744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TTEknUI52A1KP+30S5Fzp0eq9PMMBPLZ/7OlPoPYMcw=;
 b=NshjCowztqg5LMrMrF2SKdGOLJWLwROG6g7L1jcravguKXflMB5+oF1O
 UeXxVjnyLh1MwRSSYuYpDZbAiH63EShG4MOiEtLyd7B5UyAbiiQZx52X9
 NnCqReDxI631Ibl3LdV3paFkpkpCnFp+X9QawwWY7ByWHGFhbha57Cj23 c=;
IronPort-SDR: 65Qf7SZpZzZjtsqYEMWJBCSjvpIdY5yB3SDMj3y08ew3BCJprgT6+6RfM3VJa6yfx29n4rTCfs
 cFKDSwL/wC1g==
X-IronPort-AV: E=Sophos;i="5.70,373,1574121600"; d="scan'208";a="14527297"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 28 Jan 2020 08:22:23 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id A1284282247; Tue, 28 Jan 2020 08:22:20 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 08:22:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 08:22:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 08:22:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4 4/7] x86 / vmx: move teardown from domain_destroy()...
Thread-Index: AQHV0stToU3XWFihckWnvNDidkGTgaf/wG4AgAAAtDA=
Date: Tue, 28 Jan 2020 08:22:18 +0000
Message-ID: <feb92ac6511b4517a3c78cf49d182165@EX13D32EUC003.ant.amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-5-pdurrant@amazon.com>
 <20130b6d-4428-6045-7e84-cd3b55d04ca8@suse.com>
In-Reply-To: <20130b6d-4428-6045-7e84-cd3b55d04ca8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 4/7] x86 / vmx: move teardown from
 domain_destroy()...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyMCAwODoxNQ0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Ow0KPiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNC83XSB4ODYgLyB2bXg6
IG1vdmUgdGVhcmRvd24gZnJvbQ0KPiBkb21haW5fZGVzdHJveSgpLi4uDQo+IA0KPiBPbiAyNC4w
MS4yMDIwIDE2OjMxLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4uIHRvIGRvbWFpbl9yZWxp
bnF1aXNoX3Jlc291cmNlcygpLg0KPiA+DQo+ID4gVGhlIHRlYXJkb3duIGNvZGUgZnJlZXMgdGhl
IEFQSUN2IHBhZ2UuIFRoaXMgZG9lcyBub3QgbmVlZCB0byBiZSBkb25lDQo+IGxhdGUNCj4gPiBz
byBkbyBpdCBpbiBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSByYXRoZXIgdGhhbiBkb21h
aW5fZGVzdHJveSgpLg0KPiANCj4gRm9yIHRoZSBub3JtYWwgZG9tYWluIGRlc3RydWN0aW9uIHBh
dGggdGhpcyBpcyBmaW5lLiBGb3IgdGhlIGVycm9yIHBhdGgNCj4gb2YgZG9tYWluX2NyZWF0ZSgp
LCBob3dldmVyLCB0aGlzIHdpbGwgbGVhayB0aGUgcGFnZSwgYXMgaW4gdGhpcyBjYXNlDQo+IGh2
bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSB3b24ndCBiZSBjYWxsZWQuDQoNCldlbGwg
aXQncyByZWFsbHkgYXJjaF9kb21haW5fY3JlYXRlKCkgdGhhdCdzIGF0IGZhdWx0IGJ1dCwgeWVz
IHRoYXQgbmVlZHMgZml4aW5nLg0KDQo+IEknbSBhZnJhaWQgdGhlcmUNCj4gYWxyZWFkeSBpcyBh
IHNpbWlsYXIgaXNzdWUgd2l0aCBlLmcuIHZpcmlkaWFuX2RvbWFpbl9kZWluaXQoKS4gSSBndWVz
cw0KPiBJJ2xsIG1ha2UgYSBwYXRjaC4NCj4gDQoNCk9rLCB0aGFua3MuDQoNCiAgUGF1bA0KDQo+
IEphbg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+DQo+ID4gLS0tDQo+ID4gQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVs
LmNvbT4NCj4gPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+ID4gQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4gPiBDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiBD
YzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPiA+DQo+ID4gdjQ6
DQo+ID4gICAtIE5ldyBpbiB2NCAoZGlzYWdncmVnYXRlZCBmcm9tIHYzIHBhdGNoICMzKQ0KPiA+
IC0tLQ0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDQgKystLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMNCj4gPiBpbmRleCBiMjYyZDM4YTdjLi42MDZmM2RjMmViIDEwMDY0NA0KPiA+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMNCj4gPiBAQCAtNDE5LDcgKzQxOSw3IEBAIHN0YXRpYyBpbnQgdm14X2RvbWFp
bl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAg
fQ0KPiA+DQo+ID4gLXN0YXRpYyB2b2lkIHZteF9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPiA+ICtzdGF0aWMgdm9pZCB2bXhfZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0
cnVjdCBkb21haW4gKmQpDQo+ID4gIHsNCj4gPiAgICAgIGlmICggIWhhc192bGFwaWMoZCkgKQ0K
PiA+ICAgICAgICAgIHJldHVybjsNCj4gPiBAQCAtMjI0MCw3ICsyMjQwLDcgQEAgc3RhdGljIHN0
cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgX19pbml0ZGF0YQ0KPiB2bXhfZnVuY3Rpb25fdGFibGUg
PSB7DQo+ID4gICAgICAuY3B1X3VwX3ByZXBhcmUgICAgICAgPSB2bXhfY3B1X3VwX3ByZXBhcmUs
DQo+ID4gICAgICAuY3B1X2RlYWQgICAgICAgICAgICAgPSB2bXhfY3B1X2RlYWQsDQo+ID4gICAg
ICAuZG9tYWluX2luaXRpYWxpc2UgICAgPSB2bXhfZG9tYWluX2luaXRpYWxpc2UsDQo+ID4gLSAg
ICAuZG9tYWluX2Rlc3Ryb3kgICAgICAgPSB2bXhfZG9tYWluX2Rlc3Ryb3ksDQo+ID4gKyAgICAu
ZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzID0gdm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291
cmNlcywNCj4gPiAgICAgIC52Y3B1X2luaXRpYWxpc2UgICAgICA9IHZteF92Y3B1X2luaXRpYWxp
c2UsDQo+ID4gICAgICAudmNwdV9kZXN0cm95ICAgICAgICAgPSB2bXhfdmNwdV9kZXN0cm95LA0K
PiA+ICAgICAgLnNhdmVfY3B1X2N0eHQgICAgICAgID0gdm14X3NhdmVfdm1jc19jdHh0LA0KPiA+
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
