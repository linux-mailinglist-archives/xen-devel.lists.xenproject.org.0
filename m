Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124C14EFFB
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:45:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYQt-0002GL-Cc; Fri, 31 Jan 2020 15:42:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixYQs-0002GG-6L
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:42:10 +0000
X-Inumbo-ID: 3cc23d58-4440-11ea-8bda-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cc23d58-4440-11ea-8bda-12813bfff9fa;
 Fri, 31 Jan 2020 15:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580485327; x=1612021327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fhxe4kN+gdSIodP3xotcC8pqHOJtXMgussNf0wSuDCM=;
 b=DH15jK9UgbPe1BtSzMne3W71kJr/+zgexgfBDklfaPIjSqvO96BXcHtX
 qXytVenQrz7FO8Lz+mHEeJNIRaqqwGotnUIhM6km7k1sHIeXnmpQvO/hB
 LJMoRCzVpjxbtzckQCgbwiUzpPT/q2oa+k+usor1QPjKyuHzAP4jETVwz U=;
IronPort-SDR: lVn0v/WDV4OWGKXQHX6EIsq6odnWGZYwOdmmO3sWSXPzgHVUD6Krw7PXq6pMcxM2q3RhpPZe0E
 Iqi3Adez2ahw==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="15645415"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 31 Jan 2020 15:42:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 037FBA1E67; Fri, 31 Jan 2020 15:42:04 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 15:42:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 15:42:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 15:42:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>
Thread-Topic: [PATCH v8 2/4] add a domain_tot_pages() helper function
Thread-Index: AQHV132q3dH9I4+EGUirmAaSnjJ2uagEu56AgAAmLUCAAAjVEA==
Date: Fri, 31 Jan 2020 15:42:03 +0000
Message-ID: <f95732086caf4fbdb21c18c6336d1de7@EX13D32EUC003.ant.amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-3-pdurrant@amazon.com>
 <7395a51b-7c7e-585f-bac1-a395cb5ba520@suse.com>
 <4b76be790d8345c18a5d1e0b1e41a18d@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <4b76be790d8345c18a5d1e0b1e41a18d@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.12]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v8 2/4] add a domain_tot_pages() helper
 function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gRHVycmFudCwg
UGF1bA0KPiBTZW50OiAzMSBKYW51YXJ5IDIwMjAgMTU6MTkNCj4gVG86IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgR2VvcmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+OyB4ZW4tDQo+
IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2OCAyLzRdIGFk
ZCBhIGRvbWFpbl90b3RfcGFnZXMoKSBoZWxwZXINCj4gZnVuY3Rpb24NCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4gU2VudDogMzEgSmFudWFyeSAyMDIwIDEyOjUzDQo+ID4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT47IElhbg0KPiA+IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsNCj4gS29ucmFkDQo+ID4gUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPiA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz47IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPg0KPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjggMi80XSBhZGQgYSBkb21haW5fdG90X3BhZ2VzKCkgaGVscGVyIGZ1bmN0aW9u
DQo+ID4NCj4gPiBPbiAzMC4wMS4yMDIwIDE1OjU3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4g
PiB2ODoNCj4gPiA+ICAtIE5ldyBpbiB2OA0KPiA+ID4gLS0tDQo+ID4gPiAgeGVuL2FyY2gveDg2
L2RvbWFpbi5jICAgICAgICAgICB8ICAyICstDQo+ID4gPiAgeGVuL2FyY2gveDg2L21tLmMgICAg
ICAgICAgICAgICB8ICA2ICsrKy0tLQ0KPiA+ID4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMg
ICAgICAgfCAxMCArKysrKy0tLS0tDQo+ID4gPiAgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21t
b24uYyB8ICAyICstDQo+ID4gPiAgeGVuL2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICB8ICAy
ICstDQo+ID4gPiAgeGVuL2FyY2gveDg2L251bWEuYyAgICAgICAgICAgICB8ICAyICstDQo+ID4g
PiAgeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICB8IDI1ICsrKysrKysrKysrKystLS0t
LS0tLS0tLS0NCj4gPiA+ICB4ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMgICAgICAgIHwgIDIgKy0N
Cj4gPiA+ICB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiA+ICB4
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgIHwgIDQgKystLQ0KPiA+ID4gIHhlbi9jb21t
b24va2V5aGFuZGxlci5jICAgICAgICAgfCAgMiArLQ0KPiA+ID4gIHhlbi9jb21tb24vbWVtb3J5
LmMgICAgICAgICAgICAgfCAgNCArKy0tDQo+ID4gPiAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMg
ICAgICAgICB8IDE1ICsrKysrKysrLS0tLS0tLQ0KPiA+ID4gIHhlbi9pbmNsdWRlL3B1YmxpYy9t
ZW1vcnkuaCAgICAgfCAgNCArKy0tDQo+ID4gPiAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAg
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiA+ID4gIDE1IGZpbGVzIGNoYW5n
ZWQsIDYwIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gRnJvbSB0aGlz
LCB3aXRoIHRoZSBjb21tZW50IHlvdSBhZGQgbmV4dCB0byB0aGUgc3RydWN0IGZpZWxkLCBhbmQN
Cj4gPiB3aXRoIHlvdXIgcmVwbHkgeWVzdGVyZGF5LCB3aGF0IGFib3V0IHRoZSB1c2VzIGluDQo+
ID4gLSBhcmNoL2FybS9hcm02NC9kb21jdGwuYzpzd2l0Y2hfbW9kZSgpLA0KPiANCj4gVEJIIEkn
bSBub3Qgc3VyZSB3aXRoIHRoYXQgb25lLiBJdCBsb29rcyB0byBtZSBsaWtlIGl0IG5lZWRzIHRv
IGNoZWNrDQo+IHdoZXRoZXIgdGhlIGRvbWFpbiBoYXMgKmFueSogbWVtb3J5IGFzc2lnbmVkLiBQ
ZXJoYXBzIGNoZWNraW5nIHBhZ2VfbGlzdA0KPiB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlLiBQ
ZXJoYXBzIEp1bGllbiBjYW4gY29tbWVudD8NCj4gDQoNCkhhdmluZyBjaGF0dGVkIHRvIEp1bGll
biwgdGhlIGFpbSBvZiBjaGVja2luZyB0b3RfcGFnZXMgaGVyZSBpcyB0byB0ZXN0IHdoZXRoZXIg
dGhlIGRvbWFpbiBpcyBuZXdseSBjcmVhdGVkLCBpbiB3aGljaCBjYXNlIHVzaW5nIGRvbWFpbl90
b3RfcGFnZXMoKSBpcyB0aGUgYXBwcm9wcmlhdGUgdGhpbmcgdG8gZG8uDQoNCiAgUGF1bA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
