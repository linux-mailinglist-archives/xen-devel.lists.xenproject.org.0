Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7427C9D3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127.277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEWF-0005pd-5R; Tue, 29 Sep 2020 12:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127.277; Tue, 29 Sep 2020 12:14:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEWF-0005pE-22; Tue, 29 Sep 2020 12:14:07 +0000
Received: by outflank-mailman (input) for mailman id 127;
 Tue, 29 Sep 2020 12:14:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9rP=DG=amazon.co.uk=prvs=5346dc2db=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kNEWD-0005p9-Sp
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:14:06 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8563773-f56d-428b-8abb-9b031138a5f3;
 Tue, 29 Sep 2020 12:14:04 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Sep 2020 12:14:01 +0000
Received: from EX13D32EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id D03CDA18FC; Tue, 29 Sep 2020 12:13:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 29 Sep 2020 12:13:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 29 Sep 2020 12:13:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I9rP=DG=amazon.co.uk=prvs=5346dc2db=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kNEWD-0005p9-Sp
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:14:06 +0000
X-Inumbo-ID: c8563773-f56d-428b-8abb-9b031138a5f3
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c8563773-f56d-428b-8abb-9b031138a5f3;
	Tue, 29 Sep 2020 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601381645; x=1632917645;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=//VIcoPdjIm4iS51UlWUKdBIlwgTEnf2YjgVsoAj/u4=;
  b=utxxwL5v8CWNVU/ZAhGqmpwgjdCtlHBkTIsFChwJ1o8AsHbHXKkTqUVT
   uh21SksimFAk9eanNRj5dkzGWBBE6sxh/XkLeMeGEk7MLIAyUSh3WQxZU
   t9r6SVsGffEAzgM3NudGt3z+dYltj4M5SQjHUicluuIb+Ggr3pfy+SMgR
   Y=;
X-IronPort-AV: E=Sophos;i="5.77,318,1596499200"; 
   d="scan'208";a="80129930"
Subject: RE: [PATCH v9 0/8] domain context infrastructure
Thread-Topic: [PATCH v9 0/8] domain context infrastructure
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 29 Sep 2020 12:14:01 +0000
Received: from EX13D32EUC004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS id D03CDA18FC;
	Tue, 29 Sep 2020 12:13:56 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 29 Sep 2020 12:13:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 29 Sep 2020 12:13:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
CC: "Lengyel, Tamas" <tamas.lengyel@intel.com>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Thread-Index: AQHWknRuHXFGg/c6C0CkM2JZfSFRjal4LpeAgAEhBgCABM4f0IABaTIQgAAF3gCAAAFPkA==
Date: Tue, 29 Sep 2020 12:13:55 +0000
Message-ID: <86d27d8a28d741d1bdc8c76b2b36598b@EX13D32EUC003.ant.amazon.com>
References: <20200924131030.1876-1-paul@xen.org>
 <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
 <001301d6933a$4409fda0$cc1df8e0$@xen.org>
 <CY4PR11MB005625159210BF9EBF024135FB350@CY4PR11MB0056.namprd11.prod.outlook.com>
 <95e044b74cd545d984ec92e1d385d336@EX13D32EUC003.ant.amazon.com>
 <CABfawhm1prNdjAatv=kVvR=n=DqvJ=x85U_8bBdoW_CoL5w2CA@mail.gmail.com>
In-Reply-To: <CABfawhm1prNdjAatv=kVvR=n=DqvJ=x85U_8bBdoW_CoL5w2CA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzLmsubGVuZ3llbEBnbWFpbC5jb20+DQo+IFNlbnQ6IDI5IFNlcHRlbWJlciAyMDIwIDEzOjA2
DQo+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiBMZW5n
eWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+OyBwYXVsQHhlbi5vcmc7IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3DQo+IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pjsg
R2VvcmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ow0KPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgTWFyZWsgTWFyY3p5a293c2tp
LUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSRTogW0VYVEVS
TkFMXSBbUEFUQ0ggdjkgMC84XSBkb21haW4gY29udGV4dCBpbmZyYXN0cnVjdHVyZQ0KPiANCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiANCj4gT24gVHVlLCBTZXAgMjksIDIwMjAgYXQgNzo1NCBBTSBEdXJyYW50LCBQ
YXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTGVuZ3llbCwgVGFtYXMgPHRhbWFzLmxlbmd5
ZWxAaW50ZWwuY29tPg0KPiA+ID4gU2VudDogMjggU2VwdGVtYmVyIDIwMjAgMTU6MTcNCj4gPiA+
IFRvOiBwYXVsQHhlbi5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+ID4g
Q2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47ICdBbmRyZXcgQ29vcGVy
JyA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47ICdEYW5pZWwgRGUNCj4gPiA+IEdyYWFmJyA8
ZGdkZWdyYUB0eWNoby5uc2EuZ292PjsgJ0dlb3JnZSBEdW5sYXAnIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+OyAnSWFuIEphY2tzb24nDQo+ID4gPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47ICdKYW4gQmV1bGljaCcgPGpiZXVsaWNoQHN1c2UuY29tPjsgJ0p1bGllbiBHcmFsbCcgPGp1
bGllbkB4ZW4ub3JnPjsNCj4gPiA+ICdNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2knIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPjsgJ1JvZ2VyIFBhdSBNb25uw6knDQo+ID4gPiA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyAnU3RlZmFubyBTdGFiZWxsaW5pJyA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47ICdWb2xvZHlteXIgQmFiY2h1aycNCj4gPiA+IDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT47ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz4NCj4gPiA+IFN1YmplY3Q6IFJFOiBb
RVhURVJOQUxdIFtQQVRDSCB2OSAwLzhdIGRvbWFpbiBjb250ZXh0IGluZnJhc3RydWN0dXJlDQo+
ID4gPg0KPiA+ID4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBv
ZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiA+ID4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUuDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+ID4gSGkgUGF1bCwN
Cj4gPiA+ID4gPiBDb3VsZCB5b3UgcHVzaCBhIGdpdCBicmFuY2ggc29tZXdoZXJlIGZvciB0aGlz
IHNlcmllcz8gSSB3b3VsZCBsaWtlIHRvDQo+ID4gPiA+ID4gc2VlIHRoaXMgYmVpbmcgaW50ZWdy
YXRlZCB3aXRoIFZNIGZvcmtpbmcgYW5kIGlmIGl0cyBub3QgdG9vIG11Y2gNCj4gPiA+ID4gPiBl
ZmZvcnQganVzdCBjcmVhdGUgdGhlIHBhdGNoIGZvciB0aGF0IHNvIHRoYXQgaXQgY291bGQgYmUg
YXBwZW5kZWQgdG8gdGhlDQo+ID4gPiA+IHNlcmllcy4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+
ID4gPiBIaSBUYW1hcywNCj4gPiA+ID4NCj4gPiA+ID4gICBEb25lLiBTZWUNCj4gPiA+ID4gaHR0
cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9wYXVsZHUveGVuLmdpdDthPXNo
b3J0bG9nO2g9cmVmcy9oDQo+ID4gPiA+IGVhZHMvZG9tYWluLXNhdmUxNA0KPiA+ID4gPg0KPiA+
ID4gPiAgIENoZWVycywNCj4gPiA+ID4NCj4gPiA+ID4gICAgIFBhdWwNCj4gPiA+DQo+ID4gPiBI
aSBQYXVsLA0KPiA+ID4gSSBhZGRlZCBhIHNtYWxsIHBhdGNoIHRoYXQgd291bGQgc2F2ZSAmIGxv
YWQgdGhlIFBWIGNvbnRleHQgZnJvbSBvbmUgZG9tYWluIHRvIGFub3RoZXIgdGhhdCB3b3VsZA0K
PiBiZQ0KPiA+ID4gY2FsbGVkIGR1cmluZyBWTSBmb3JraW5nLiBQbGVhc2UgdGFrZSBhIGxvb2sg
YXQNCj4gPiA+DQo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvdGts
ZW5neWVsL3hlbi5naXQ7YT1jb21taXRkaWZmO2g9MTg0M2NhNzMwMmU0MTUzMTdmZGI5YTYzYjNh
NA0KPiA+ID4gZDI5YTM4NWRjNzY2O2hwPTgxNDkyOTZmZGY4MGM3MzcyN2U2MWNlYTZmZTMyNTFh
ZWNmOGIzMzMuIEkgY2FsbGVkIHRoZSBmdW5jdGlvbg0KPiBjb3B5X3B2X2RvbWFpbmNvbnRleHQN
Cj4gPiA+IGZvciBub3cgYXMgdGhhdCBzZWVtZWQgbGlrZSB0aGUgbW9zdCBhcHByb3ByaWF0ZSBk
ZXNjcmlwdGlvbiBmb3IgaXQuIFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzDQo+IGxvb2tzDQo+
ID4gPiBnb29kIHRvIHlvdS4gSSdtIHN0aWxsIHRlc3RpbmcgaXQgYnV0IGlmIGV2ZXJ5dGhpbmcg
Y2hlY2tzIG91dCBpdCB3b3VsZCBiZSBuaWNlIHRvIGp1c3QgYXBwZW5kDQo+IHRoaXMNCj4gPiA+
IHBhdGNoIHRvIHlvdXIgc2VyaWVzLg0KPiA+DQo+ID4gSGkgVGFtYXMsDQo+ID4NCj4gPiAgIFRo
ZSBjb2RlIHN0cnVjdHVyZSBhcHBlYXJzIHRvIGJlIG9rLi4uIGp1c3Qgc29tZSBjb3NtZXRpYyB0
d2Vha3M6DQo+ID4NCj4gPiAtIEkgdGhpbmsgeW91IHNob3VsZCBjYWxsIHRoZSBmdW5jdGlvbiBz
aW1wbHkgJ2NvcHlfZG9tYWluY29udGV4dCcgYXMgdGhlIGlkZWEgaXMgdGhhdCBhbGwgc3RhdGUN
Cj4gKGluY2x1ZGluZyB3aGF0IGlzIG5vdyBpbiBodm0gY29udGV4dCkgd2lsbCBiZSBjb25zb2xp
ZGF0ZWQNCj4gDQo+IFN1cmUsIEkgd2Fzbid0IGVudGlyZWx5IGNsZWFyIGFib3V0IHdoZXRoZXIg
dGhpcyB3aWxsIGJlIGxpbWl0ZWQgdG8gUFYNCj4gY29udGV4dCBvciBpZiBpdCB3aWxsIGV2ZW50
dWFsbHkgYWRkIHRoZSBodm0gc3R1ZmYgdG9vLiBSaWdodCBub3cgSQ0KPiBzdGlsbCB3b3VsZCBo
YXZlIHRvIGRvIHRoYXQgc2VwYXJhdGVseS4NCj4gDQo+ID4gLSBUaGUgcHJldmFpbGluZyBzdHls
ZSBpbiBkb21jdGwuYyBBRkFJQ1MgaXMgdGhhdCBhc3NpZ25tZW50cyBhcmUgbW9zdGx5IG5vdCBk
b25lIGluc2lkZSBpZg0KPiBzdGF0ZW1lbnRzLiBQZXJzb25hbGx5IEkgdGhpbmsgdGhpcyBpcyBh
IGdvb2QgdGhpbmcuDQo+IA0KPiBJIHRoaW5rIGl0IGN1dHMgZG93biBvbiBmdW5jdGlvbiBzaXpl
cyB3aGVuIGFsbCB0aGF0IGlzIGJlaW5nIGRvbmUNCj4gYWZ0ZXIgYW4gYXNzaWdtZW50IGlzIGEg
TlVMTC1jaGVjay4gTm8gbmVlZCBmb3IgYSBzZXBhcmF0ZSBsaW5lIGZvciBpdA0KPiBidXQgSSBh
bHNvIGRvbid0IGNhcmUgdGhhdCBtdWNoLiBTbyBpZiBpdCdzIG1vcmUgaW1wb3J0YW50IHRvIHdo
b2V2ZXINCj4gbWFpbnRhaW5zIHRoaXMgdG8ga2VlcCB0aGUgc3R5bGUgY29uc2lzdGVudCBpbiB0
aGlzIHJlZ2FyZCBJIGNhbg0KPiBjaGFuZ2UgaXQuDQo+IA0KPiA+DQo+ID4gICBPbmNlIHlvdSBo
YXZlIHNvbWV0aGluZyByZWFkeSB0byBnbyB0aGVuIEknZCBiZSBoYXBweSB0byB0YWcgaXQgb250
byBteSBzZXJpZXMgaWYgSSBuZWVkIHRvIGRvIGENCj4gdjEwLi4uIGJ1dCBJJ20gY3VycmVudGx5
IGhvcGluZyB0aGF0IHdvbid0IGJlIG5lY2Vzc2FyeS4NCj4gDQo+IEkgdGhpbmsgSSdsbCB3YWl0
IHVudGlsIEhWTSBjb250ZXh0IGlzIGluY2x1ZGVkIGluIHRoZSBmcmFtZXdvcmsgYXMNCj4gd2Vs
bCBzbyB0aGF0IHdlIGNhbiBqdXN0IHN3aXRjaCBvdmVyIGV2ZXJ5dGhpbmcgYXQgb25jZS4NCj4g
DQoNCkl0IG1heSBiZSBhIHdoaWxlIGJlZm9yZSBJIGhhdmUgZXZlcnl0aGluZyBtb3ZlZCBvdmVy
IHNvIHlvdSBtYXkgc3RpbGwgd2FudCB0byBnbyBhaGVhZCB3aXRoIHRoaXMgcGF0Y2ggaWYgdGhl
IGRlbGF5IGlzIGxpa2VseSB0byBibG9jayB0aGluZ3MuIEFsc28sIHdpdGhvdXQgdGhpcyBJIGFz
c3VtZSBhbnkgcmVjb3JkcyBJIHBvcnQgb3ZlciBmcm9tIEhWTSBjb250ZXh0IChhbmQgaGVuY2Ug
cmVtb3ZlIHRoZSBzYXZlIGNvZGUpIGFyZSBnb2luZyB0byBjYXVzZSBicmVha2FnZSBmb3IgVk0g
Zm9ya2luZz8NCg0KICBQYXVsDQoNCj4gVGFtYXMNCg==

