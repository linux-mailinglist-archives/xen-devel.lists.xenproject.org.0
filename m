Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69627C764
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113.241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNECp-0003k6-H1; Tue, 29 Sep 2020 11:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113.241; Tue, 29 Sep 2020 11:54:03 +0000
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
	id 1kNECp-0003jh-DV; Tue, 29 Sep 2020 11:54:03 +0000
Received: by outflank-mailman (input) for mailman id 113;
 Tue, 29 Sep 2020 11:54:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9rP=DG=amazon.co.uk=prvs=5346dc2db=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kNECn-0003jZ-Fu
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:54:01 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 465413f9-d0bc-42a9-b804-af7fb4dff2e3;
 Tue, 29 Sep 2020 11:54:00 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Sep 2020 11:53:45 +0000
Received: from EX13D32EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 49F7DA1CB2; Tue, 29 Sep 2020 11:53:39 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 29 Sep 2020 11:53:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 29 Sep 2020 11:53:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I9rP=DG=amazon.co.uk=prvs=5346dc2db=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kNECn-0003jZ-Fu
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:54:01 +0000
X-Inumbo-ID: 465413f9-d0bc-42a9-b804-af7fb4dff2e3
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 465413f9-d0bc-42a9-b804-af7fb4dff2e3;
	Tue, 29 Sep 2020 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601380441; x=1632916441;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=g0dQ6sj8v+0Vaz/rBZkhz998RNpY+DPeObGy6HWBHbE=;
  b=SHV96CKPfREZQK+koBzDcHGp/meFoXIiD0h1EkDSIvtsERylDXj3r+a2
   XbA1jSm/d8wGW+rn5DB/tnIUcd6D2uaa6W6iTqllylLZRyDiz14Urpwtk
   xpli1lNIuRQTkJE7uFHFMAWx2ETt7yR1G8Y9zT8hQSmV9UfuI9C0K4+9F
   0=;
X-IronPort-AV: E=Sophos;i="5.77,318,1596499200"; 
   d="scan'208";a="80120792"
Subject: RE: [PATCH v9 0/8] domain context infrastructure
Thread-Topic: [PATCH v9 0/8] domain context infrastructure
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 29 Sep 2020 11:53:45 +0000
Received: from EX13D32EUC004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS id 49F7DA1CB2;
	Tue, 29 Sep 2020 11:53:39 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 29 Sep 2020 11:53:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 29 Sep 2020 11:53:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Daniel De Graaf'
	<dgdegra@tycho.nsa.gov>, 'George Dunlap' <george.dunlap@citrix.com>, "'Ian
 Jackson'" <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
	'Julien Grall' <julien@xen.org>,
	=?utf-8?B?J01hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSc=?=
	<marmarek@invisiblethingslab.com>, =?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
	<roger.pau@citrix.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
	'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>, 'Wei Liu' <wl@xen.org>
Thread-Index: AQHWknRuHXFGg/c6C0CkM2JZfSFRjal4LpeAgAEhBgCABM4f0IABaTIQ
Date: Tue, 29 Sep 2020 11:53:38 +0000
Message-ID: <95e044b74cd545d984ec92e1d385d336@EX13D32EUC003.ant.amazon.com>
References: <20200924131030.1876-1-paul@xen.org>
 <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
 <001301d6933a$4409fda0$cc1df8e0$@xen.org>
 <CY4PR11MB005625159210BF9EBF024135FB350@CY4PR11MB0056.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR11MB005625159210BF9EBF024135FB350@CY4PR11MB0056.namprd11.prod.outlook.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZW5neWVsLCBUYW1hcyA8dGFt
YXMubGVuZ3llbEBpbnRlbC5jb20+DQo+IFNlbnQ6IDI4IFNlcHRlbWJlciAyMDIwIDE1OjE3DQo+
IFRvOiBwYXVsQHhlbi5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgJ0FuZHJldyBDb29wZXInIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgJ0RhbmllbCBEZQ0KPiBHcmFhZicgPGRnZGVncmFA
dHljaG8ubnNhLmdvdj47ICdHZW9yZ2UgRHVubGFwJyA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PjsgJ0lhbiBKYWNrc29uJw0KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47ICdKYW4gQmV1
bGljaCcgPGpiZXVsaWNoQHN1c2UuY29tPjsgJ0p1bGllbiBHcmFsbCcgPGp1bGllbkB4ZW4ub3Jn
PjsNCj4gJ01hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraScgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+OyAnUm9nZXIgUGF1IE1vbm7DqScNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgJ1N0ZWZhbm8gU3RhYmVsbGluaScgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyAnVm9sb2R5
bXlyIEJhYmNodWsnDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47ICdXZWkgTGl1JyA8
d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIHY5IDAvOF0gZG9t
YWluIGNvbnRleHQgaW5mcmFzdHJ1Y3R1cmUNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3Jp
Z2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2Vu
ZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+ID4gPiBIaSBQ
YXVsLA0KPiA+ID4gQ291bGQgeW91IHB1c2ggYSBnaXQgYnJhbmNoIHNvbWV3aGVyZSBmb3IgdGhp
cyBzZXJpZXM/IEkgd291bGQgbGlrZSB0bw0KPiA+ID4gc2VlIHRoaXMgYmVpbmcgaW50ZWdyYXRl
ZCB3aXRoIFZNIGZvcmtpbmcgYW5kIGlmIGl0cyBub3QgdG9vIG11Y2gNCj4gPiA+IGVmZm9ydCBq
dXN0IGNyZWF0ZSB0aGUgcGF0Y2ggZm9yIHRoYXQgc28gdGhhdCBpdCBjb3VsZCBiZSBhcHBlbmRl
ZCB0byB0aGUNCj4gPiBzZXJpZXMuDQo+ID4gPg0KPiA+DQo+ID4gSGkgVGFtYXMsDQo+ID4NCj4g
PiAgIERvbmUuIFNlZQ0KPiA+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9w
bGUvcGF1bGR1L3hlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMvaA0KPiA+IGVhZHMvZG9tYWluLXNh
dmUxNA0KPiA+DQo+ID4gICBDaGVlcnMsDQo+ID4NCj4gPiAgICAgUGF1bA0KPiANCj4gSGkgUGF1
bCwNCj4gSSBhZGRlZCBhIHNtYWxsIHBhdGNoIHRoYXQgd291bGQgc2F2ZSAmIGxvYWQgdGhlIFBW
IGNvbnRleHQgZnJvbSBvbmUgZG9tYWluIHRvIGFub3RoZXIgdGhhdCB3b3VsZCBiZQ0KPiBjYWxs
ZWQgZHVyaW5nIFZNIGZvcmtpbmcuIFBsZWFzZSB0YWtlIGEgbG9vayBhdA0KPiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL3RrbGVuZ3llbC94ZW4uZ2l0O2E9Y29tbWl0
ZGlmZjtoPTE4NDNjYTczMDJlNDE1MzE3ZmRiOWE2M2IzYTQNCj4gZDI5YTM4NWRjNzY2O2hwPTgx
NDkyOTZmZGY4MGM3MzcyN2U2MWNlYTZmZTMyNTFhZWNmOGIzMzMuIEkgY2FsbGVkIHRoZSBmdW5j
dGlvbiBjb3B5X3B2X2RvbWFpbmNvbnRleHQNCj4gZm9yIG5vdyBhcyB0aGF0IHNlZW1lZCBsaWtl
IHRoZSBtb3N0IGFwcHJvcHJpYXRlIGRlc2NyaXB0aW9uIGZvciBpdC4gUGxlYXNlIGxldCBtZSBr
bm93IGlmIHRoaXMgbG9va3MNCj4gZ29vZCB0byB5b3UuIEknbSBzdGlsbCB0ZXN0aW5nIGl0IGJ1
dCBpZiBldmVyeXRoaW5nIGNoZWNrcyBvdXQgaXQgd291bGQgYmUgbmljZSB0byBqdXN0IGFwcGVu
ZCB0aGlzDQo+IHBhdGNoIHRvIHlvdXIgc2VyaWVzLg0KDQpIaSBUYW1hcywNCg0KICBUaGUgY29k
ZSBzdHJ1Y3R1cmUgYXBwZWFycyB0byBiZSBvay4uLiBqdXN0IHNvbWUgY29zbWV0aWMgdHdlYWtz
Og0KDQotIEkgdGhpbmsgeW91IHNob3VsZCBjYWxsIHRoZSBmdW5jdGlvbiBzaW1wbHkgJ2NvcHlf
ZG9tYWluY29udGV4dCcgYXMgdGhlIGlkZWEgaXMgdGhhdCBhbGwgc3RhdGUgKGluY2x1ZGluZyB3
aGF0IGlzIG5vdyBpbiBodm0gY29udGV4dCkgd2lsbCBiZSBjb25zb2xpZGF0ZWQNCi0gVGhlIHBy
ZXZhaWxpbmcgc3R5bGUgaW4gZG9tY3RsLmMgQUZBSUNTIGlzIHRoYXQgYXNzaWdubWVudHMgYXJl
IG1vc3RseSBub3QgZG9uZSBpbnNpZGUgaWYgc3RhdGVtZW50cy4gUGVyc29uYWxseSBJIHRoaW5r
IHRoaXMgaXMgYSBnb29kIHRoaW5nLg0KDQogIE9uY2UgeW91IGhhdmUgc29tZXRoaW5nIHJlYWR5
IHRvIGdvIHRoZW4gSSdkIGJlIGhhcHB5IHRvIHRhZyBpdCBvbnRvIG15IHNlcmllcyBpZiBJIG5l
ZWQgdG8gZG8gYSB2MTAuLi4gYnV0IEknbSBjdXJyZW50bHkgaG9waW5nIHRoYXQgd29uJ3QgYmUg
bmVjZXNzYXJ5Lg0KDQogIENoZWVycywNCg0KICAgIFBhdWwNCg0KPiANCj4gVGhhbmtzLA0KPiBU
YW1hcw0K

