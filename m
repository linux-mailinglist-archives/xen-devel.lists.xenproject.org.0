Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA21779ED
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:07:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j996W-0002J2-Gh; Tue, 03 Mar 2020 15:05:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j996U-0002Ix-SM
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:05:03 +0000
X-Inumbo-ID: 5ba60ef0-5d60-11ea-94a0-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba60ef0-5d60-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583247902; x=1614783902;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=0eQVWSwjK90ip9SbMLihLwKOBYomvE7U/7FkGKuEzxY=;
 b=Kce3+yTUPlYXggpJGUf1Y+vZxSL4FsaCGKUtxcDbZQz9rRPeFXETPs0u
 ZM8ZnwcXRwufx/4a3+DPiCrLNbcamDt/DRQY+rKsb65TDyxTBGRyVfGiH
 2AzGd+z7eNchAT3Aec5IoFWeiRqzppqlI0/w21FtPUcVZ45y6gXicaADM 4=;
IronPort-SDR: ue02eudSWRqBLLF2D22reuWDktv/ucEh90Yi9mKW9WGKudhoK2d//ywNNuHy21phhBJndGxrlF
 1t6HTzVY91gA==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="19819777"
Thread-Topic: [PATCH v5 1/4] x86/HVM: cancel emulation when register state got
 altered
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 03 Mar 2020 15:04:50 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id B5AA224B108; Tue,  3 Mar 2020 15:04:48 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 15:04:48 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 15:04:46 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 15:04:46 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHV8Wkv/qeFOBaHw06fC2/Sp89AXag28DGAgAAE4YCAAAIYsA==
Date: Tue, 3 Mar 2020 15:04:46 +0000
Message-ID: <c04b4aaaf4854c51b9f0e0504822ace0@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
 <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
 <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
 <bd5988b9966b403991f4059216bfb93e@EX13D32EUC003.ant.amazon.com>
 <e98154a1-425d-028c-bb93-42fa7d6aa75e@suse.com>
 <43df2a9116d2448592b27dff7f4792d8@EX13D32EUC003.ant.amazon.com>
 <a881e4b3-0cc5-31e9-83f8-31084ba7f66f@suse.com>
In-Reply-To: <a881e4b3-0cc5-31e9-83f8-31084ba7f66f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIE1hcmNoIDIwMjAgMTQ6NTcNCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVu
Lm9yZz47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSRTogW0VYVEVS
TkFMXVtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbCBlbXVsYXRpb24gd2hlbiByZWdpc3Rl
ciBzdGF0ZSBnb3QgYWx0ZXJlZA0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMDMuMDMuMjAyMCAx
NTo0NCwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50
OiAwMyBNYXJjaCAyMDIwIDE0OjM0DQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBh
bWF6b24uY28udWs+DQo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFu
ZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaQ0KPiA+PiBMaXUgPHdsQHhlbi5vcmc+
OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gPj4gU3ViamVjdDogUkU6IFtFWFRFUk5B
TF1bUEFUQ0ggdjUgMS80XSB4ODYvSFZNOiBjYW5jZWwgZW11bGF0aW9uIHdoZW4NCj4gPj4gcmVn
aXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQNCj4gPj4NCj4gPj4gQ0FVVElPTjogVGhpcyBlbWFpbCBv
cmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QNCj4gPj4g
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRo
ZSBzZW5kZXIgYW5kIGtub3cNCj4gPj4gdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPj4NCj4gPj4N
Cj4gPj4NCj4gPj4gT24gMDMuMDMuMjAyMCAxNToyNSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4g
Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAwMyBNYXJjaCAyMDIwIDE0OjIxDQo+
ID4+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gPj4+PiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+ID4+Pj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47DQo+ID4+IFdlaQ0KPiA+Pj4+IExpdSA8d2xAeGVuLm9yZz47IFBhdWwgRHVy
cmFudCA8cGF1bEB4ZW4ub3JnPg0KPiA+Pj4+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdW1hlbi1k
ZXZlbF0gW1BBVENIIHY1IDEvNF0geDg2L0hWTTogY2FuY2VsDQo+ID4+Pj4gZW11bGF0aW9uIHdo
ZW4gcmVnaXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQNCj4gPj4+Pg0KPiA+Pj4+IE9uIDAzLjAzLjIw
MjAgMTQ6MTYsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0Bs
aXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+ID4+Pj4gSmFuDQo+ID4+Pj4+PiBC
ZXVsaWNoDQo+ID4+Pj4+PiBTZW50OiAwMyBNYXJjaCAyMDIwIDEwOjE3DQo+ID4+Pj4+PiBUbzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+Pj4+PiBDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4+Pj4+
IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBQYXVsIER1cnJh
bnQNCj4gPj4+PiA8cGF1bEB4ZW4ub3JnPg0KPiA+Pj4+Pj4gU3ViamVjdDogW0VYVEVSTkFMXVtY
ZW4tZGV2ZWxdIFtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbA0KPiA+PiBlbXVsYXRpb24N
Cj4gPj4+Pj4+IHdoZW4gcmVnaXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQNCj4gPj4+Pj4+DQo+ID4+
Pj4+PiBSZS1leGVjdXRpb24gKGFmdGVyIGhhdmluZyByZWNlaXZlZCBkYXRhIGZyb20gYSBkZXZp
Y2UgbW9kZWwpIHJlbGllcw0KPiA+PiBvbg0KPiA+Pj4+Pj4gdGhlIHNhbWUgcmVnaXN0ZXIgc3Rh
dGUgc3RpbGwgYmVpbmcgaW4gcGxhY2UgYXMgaXQgd2FzIHdoZW4gdGhlDQo+ID4+IHJlcXVlc3QN
Cj4gPj4+Pj4+IHdhcyBmaXJzdCBzZW50IHRvIHRoZSBkZXZpY2UgbW9kZWwuIFRoZXJlZm9yZSB2
Q1BVIHN0YXRlIGNoYW5nZXMNCj4gPj4+Pj4+IGVmZmVjdGVkIGJ5IHJlbW90ZSBzb3VyY2VzIG5l
ZWQgdG8gcmVzdWx0IGluIG5vIGF0dGVtcHQgb2YgcmUtDQo+ID4+Pj4gZXhlY3V0aW9uLg0KPiA+
Pj4+Pj4gSW5zdGVhZCB0aGUgcmV0dXJuZWQgZGF0YSBpcyB0byBzaW1wbHkgYmUgaWdub3JlZC4N
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBOb3RlIHRoYXQgYW55IHN1Y2ggYXN5bmNocm9ub3VzIHN0YXRl
IGNoYW5nZXMgaGFwcGVuIHdpdGggdGhlIHZDUFUgYXQNCj4gPj4+Pj4+IGxlYXN0IHBhdXNlZCAo
cG90ZW50aWFsbHkgZG93biBhbmQvb3Igbm90IG1hcmtlZCAtPmlzX2luaXRpYWxpc2VkKSwNCj4g
Pj4gc28NCj4gPj4+Pj4+IHRoZXJlJ3Mgbm8gaXNzdWUgd2l0aCBmaWRkbGluZyB3aXRoIHJlZ2lz
dGVyIHN0YXRlIGJlaGluZCB0aGUNCj4gPj4gYWN0aXZlbHkNCj4gPj4+Pj4+IHJ1bm5pbmcgZW11
bGF0b3IncyBiYWNrLiBIZW5jZSB0aGUgbmV3IGZ1bmN0aW9uIGRvZXNuJ3QgbmVlZCB0bw0KPiA+
Pj4+Pj4gc3luY2hyb25pemUgd2l0aCB0aGUgY29yZSBlbXVsYXRpb24gbG9naWMuDQo+ID4+Pj4+
Pg0KPiA+Pj4+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+Pj4+Pg0KPiA+Pj4+PiBOZWVkIHdlIGJlIGNvbmNlcm5lZCB3aXRoIGFu
eSBwYWdlLXNwbGl0IEkvTyBoZXJlPyBUaGF0IG1heSBtYW5pZmVzdA0KPiA+PiBhcw0KPiA+Pj4+
PiB0d28gc2VwYXJhdGUgZW11bGF0aW9ucyBhbmQgQUZBSUNUIGl0IHdvdWxkIGJlIHBvc3NpYmxl
IGZvciBvbmx5IHRoZQ0KPiA+Pj4+PiBzZWNvbmQgcGFydCB0byBiZSBhYm9ydGVkIGJ5IHRoaXMg
Y2hhbmdlLg0KPiA+Pj4+DQo+ID4+Pj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgZS5nLiBJTklUIGlz
IHJlY29nbml6ZWQgb25seSBvbiBpbnNuIGJvdW5kYXJpZXMuDQo+ID4+Pj4gSS5lLiB0aGlzIG1h
eSBub3QgYmUgdGhhdCBkaWZmZXJlbnQgZnJvbSByZWFsIGhhcmR3YXJlIGJlaGF2aW9yLiBfSWZf
DQo+ID4+Pj4gd2Ugd2VyZSB0byB0YWtlIGNhcmUgb2YgdGhpcywgaG93IHdvdWxkIHlvdSBlbnZp
c2lvbiB1bmRvaW5nIHRoZQ0KPiA+Pj4+IGZpcnN0IHBhcnQgb2Ygc3VjaCBhbiBhY2Nlc3MsIG1v
c3Qgbm90YWJseSB3aGVuIHRoZSBhY2Nlc3MgaGFzIHNpZGUNCj4gPj4+PiBlZmZlY3RzPw0KPiA+
Pj4NCj4gPj4+IEkgd2Fzbid0IHRoaW5raW5nIG9mIHVuZG9pbmcuLi4gSSB3YXMgbW9yZSB0aGlu
a2luZyB0aGF0IHZjcHVfcGF1c2UoKQ0KPiA+Pj4gb3VnaHQgdG8gZGVmZXIgdW50aWwgYW4gaW4t
cHJvZ3Jlc3MgZW11bGF0aW9uIGhhcyBmdWxseSBjb21wbGV0ZWQuDQo+ID4+DQo+ID4+IEhtbSwg
YXQgdGhlIGZpcnN0IGdsYW5jZSB0aGlzIGxvb2tzIHVnbHkvZnJhZ2lsZSB0byBhcnJhbmdlIGZv
ci4gSSdtDQo+ID4+IGhhdmluZyBhIGhhcmQgdGltZSB0aGlua2luZyBvZiBhIHJvdWdoIHNrZXRj
aCBvZiBob3cgc3VjaCBjb3VsZCBiZQ0KPiA+PiBtYWRlIHdvcmssIGluIHBhcnRpY3VsYXIgd2l0
aG91dCBibG9ja2luZyB0aGUgdmNwdV9wYXVzZSgpIGl0c2VsZg0KPiA+PiBmb3IgdG9vIGxvbmcu
DQo+ID4+DQo+ID4NCj4gPiBJZiB0aGUgdmNwdSBpcyBhdCB0aGUgbWVyY3kgb2YgYW4gZXh0ZXJu
YWwgZW11bGF0b3IgaXQgY291bGQgdGFrZSBhDQo+ID4gd2hpbGUuIEkgY2FuJ3QgcmVhbGx5IHRo
aW5rIG9mIGEgd2F5IHRvIGF2b2lkIHRoYXQgdGhvdWdoLiBNYXliZQ0KPiA+IHBhdXNpbmcgYXQg
YSBub24tYXJjaGl0ZWN0dXJhbCBib3VuZGFyeSBpcyBvayBoZXJlIHRob3VnaC4NCj4gDQo+IFdl
bGwsIGF0IHRoZSB2ZXJ5IGxlYXN0IEknZCBjYWxsIGl0IGdvb2QgZW5vdWdoIHVudGlsIHdlIGNh
biB0aGluaw0KPiBvZiBhIHNlbnNpYmxlIHdheSB0byBkZWFsIHdpdGggdGhpcy4NCj4gDQoNCk9r
LiBZb3UgY2FuIGhhdmUgbXkgUi1iIG9uIHRoaXMgb25lIHRoZW4uDQoNCiAgUGF1bA0KDQo+IEph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
