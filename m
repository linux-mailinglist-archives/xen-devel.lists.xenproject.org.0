Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A320D2C3FA0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37672.70135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtdO-0007bI-DT; Wed, 25 Nov 2020 12:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37672.70135; Wed, 25 Nov 2020 12:10:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtdO-0007at-9G; Wed, 25 Nov 2020 12:10:54 +0000
Received: by outflank-mailman (input) for mailman id 37672;
 Wed, 25 Nov 2020 12:10:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1khtdN-0007an-Cy
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:10:53 +0000
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8631f98b-f719-4fcd-8240-a13d22d6d25d;
 Wed, 25 Nov 2020 12:10:52 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 25 Nov 2020 12:10:45 +0000
Received: from EX13D03EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id ED823A18B5; Wed, 25 Nov 2020 12:10:43 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 12:10:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 12:10:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
	id 1khtdN-0007an-Cy
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:10:53 +0000
X-Inumbo-ID: 8631f98b-f719-4fcd-8240-a13d22d6d25d
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8631f98b-f719-4fcd-8240-a13d22d6d25d;
	Wed, 25 Nov 2020 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1606306253; x=1637842253;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=bt8fTJDW8RhOtdLh62gbZQ9TL1jIRpogBwkQWBdfsT0=;
  b=pQjSktm9U/xpLoqUcdP7n9fy45eMjycC7yDKJKs1mq0acPGC7LbYEDOA
   owwPJW3Em7+9eTqhpu1eoE73TYHjij7Hun4IWG9OLsI3XWJWprNKZM7mZ
   T8RzwUFbobRWbkP3tXiAdnTbZRtV5WcyrXHm1xB8FLon0gzy/KQIFpVTh
   4=;
X-IronPort-AV: E=Sophos;i="5.78,368,1599523200"; 
   d="scan'208";a="90794913"
Subject: RE: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
Thread-Topic: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 25 Nov 2020 12:10:45 +0000
Received: from EX13D03EUC004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS id ED823A18B5;
	Wed, 25 Nov 2020 12:10:43 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 12:10:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 12:10:43 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
CC: "Elnikety, Eslam" <elnikety@amazon.com>, 'Christian Lindig'
	<christian.lindig@citrix.com>, 'David Scott' <dave@recoil.org>, 'Ian Jackson'
	<iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Andrew Cooper'
	<andrew.cooper3@citrix.com>, 'George Dunlap' <george.dunlap@citrix.com>,
	'Julien Grall' <julien@xen.org>, 'Stefano Stabellini'
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Thread-Index: AQHWwpaPMlIHtWtagUGiOXvRZvLCO6nYkyyAgAAe6YCAAAtbAIAAA6Jg
Date: Wed, 25 Nov 2020 12:10:42 +0000
Message-ID: <5bcac7a166d2476187ed5bab9e84e506@EX13D32EUC003.ant.amazon.com>
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
 <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
 <009001d6c31b$a1eaeef0$e5c0ccd0$@xen.org>
 <3ab33c4e-56af-5690-32b8-a89c5e27761b@suse.com>
In-Reply-To: <3ab33c4e-56af-5690-32b8-a89c5e27761b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI1IE5vdmVtYmVyIDIwMjAgMTE6NTENCj4gVG86IHBhdWxA
eGVuLm9yZw0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgRWxu
aWtldHksIEVzbGFtIDxlbG5pa2V0eUBhbWF6b24uY29tPjsgJ0NocmlzdGlhbiBMaW5kaWcnDQo+
IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+OyAnRGF2aWQgU2NvdHQnIDxkYXZlQHJlY29p
bC5vcmc+OyAnSWFuIEphY2tzb24nIDxpd2pAeGVucHJvamVjdC5vcmc+Ow0KPiAnV2VpIExpdScg
PHdsQHhlbi5vcmc+OyAnQW5kcmV3IENvb3BlcicgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyAnR2VvcmdlIER1bmxhcCcNCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47ICdKdWxpZW4g
R3JhbGwnIDxqdWxpZW5AeGVuLm9yZz47ICdTdGVmYW5vIFN0YWJlbGxpbmknDQo+IDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCB2NCAxLzNdIGRvbWN0bDogaW50cm9kdWNlIGEgbmV3
IGRvbWFpbiBjcmVhdGUgZmxhZywNCj4gWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvLCAuLi4N
Cj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhl
IG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDI1LjExLjIwMjAgMTI6MTAsIFBhdWwgRHVycmFudCB3
cm90ZToNCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBT
ZW50OiAyNSBOb3ZlbWJlciAyMDIwIDA5OjIwDQo+ID4+DQo+ID4+IE9uIDI0LjExLjIwMjAgMjA6
MTcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4NCj4gPj4+DQo+ID4+PiAuLi50byBjb250cm9sIHRoZSB2aXNpYmlsaXR5
IG9mIHRoZSBGSUZPIGV2ZW50IGNoYW5uZWwgb3BlcmF0aW9ucw0KPiA+Pj4gKEVWVENITk9QX2lu
aXRfY29udHJvbCwgRVZUQ0hOT1BfZXhwYW5kX2FycmF5LCBhbmQgRVZUQ0hOT1Bfc2V0X3ByaW9y
aXR5KSB0bw0KPiA+Pj4gdGhlIGd1ZXN0Lg0KPiA+Pj4NCj4gPj4+IFRoZXNlIG9wZXJhdGlvbnMg
d2VyZSBhZGRlZCB0byB0aGUgcHVibGljIGhlYWRlciBpbiBjb21taXQgZDJkNTBjMmYzMDhmDQo+
ID4+PiAoImV2dGNobjogYWRkIEZJRk8tYmFzZWQgZXZlbnQgY2hhbm5lbCBBQkkiKSBhbmQgdGhl
IGZpcnN0IGltcGxlbWVudGF0aW9uDQo+ID4+PiBhcHBlYXJlZCBpbiB0aGUgdHdvIHN1YnNlcXVl
bnQgY29tbWl0czogZWRjODg3MmFlYjRhICgiZXZ0Y2huOiBpbXBsZW1lbnQNCj4gPj4+IEVWVENI
Tk9QX3NldF9wcmlvcml0eSBhbmQgYWRkIHRoZSBzZXRfcHJpb3JpdHkgaG9vayIpIGFuZCA4ODkx
MDA2MWVjNjENCj4gPj4+ICgiZXZ0Y2huOiBhZGQgRklGTy1iYXNlZCBldmVudCBjaGFubmVsIGh5
cGVyY2FsbHMgYW5kIHBvcnQgb3BzIikuIFByaW9yIHRvDQo+ID4+PiB0aGF0LCBhIGd1ZXN0IGlz
c3VpbmcgdGhvc2Ugb3BlcmF0aW9ucyB3b3VsZCByZWNlaXZlIGEgcmV0dXJuIHZhbHVlIG9mDQo+
ID4+PiAtRU5PU1lTIChub3QgaW1wbGVtZW50ZWQpIGZyb20gWGVuLiBHdWVzdHMgYXdhcmUgb2Yg
dGhlIEZJRk8gb3BlcmF0aW9ucyBidXQNCj4gPj4+IHJ1bm5pbmcgb24gYW4gb2xkZXIgKHByZS00
LjQpIFhlbiB3b3VsZCBmYWxsIGJhY2sgdG8gdXNpbmcgdGhlIDItbGV2ZWwgZXZlbnQNCj4gPj4+
IGNoYW5uZWwgaW50ZXJmYWNlIHVwb24gc2VlaW5nIHRoaXMgcmV0dXJuIHZhbHVlLg0KPiA+Pj4N
Cj4gPj4+IFVuZm9ydHVuYXRlbHkgdGhlIHVuY29udHJvbGFibGUgYXBwZWFyYW5jZSBvZiB0aGVz
ZSBuZXcgb3BlcmF0aW9ucyBpbiBYZW4gNC40DQo+ID4+PiBvbndhcmRzIGhhcyBpbXBsaWNhdGlv
bnMgZm9yIGhpYmVybmF0aW9uIG9mIHNvbWUgTGludXggZ3Vlc3RzLiBEdXJpbmcgcmVzdW1lDQo+
ID4+PiBmcm9tIGhpYmVybmF0aW9uLCB0aGVyZSBhcmUgdHdvIGtlcm5lbHMgaW52b2x2ZWQ6IHRo
ZSAiYm9vdCIga2VybmVsIGFuZCB0aGUNCj4gPj4+ICJyZXN1bWUiIGtlcm5lbC4gVGhlIGd1ZXN0
IGJvb3Qga2VybmVsIG1heSBkZWZhdWx0IHRvIHVzZSBGSUZPIG9wZXJhdGlvbnMgYW5kDQo+ID4+
PiBpbnN0cnVjdCBYZW4gdmlhIEVWVENITk9QX2luaXRfY29udHJvbCB0byBzd2l0Y2ggZnJvbSAy
LWxldmVsIHRvIEZJRk8uIE9uIHRoZQ0KPiA+Pj4gb3RoZXIgaGFuZCwgdGhlIHJlc3VtZSBrZXJu
ZWwga2VlcHMgYXNzdW1pbmcgMi1sZXZlbCwgYmVjYXVzZSBpdCB3YXMgaGliZXJuYXRlZA0KPiA+
Pj4gb24gYSB2ZXJzaW9uIG9mIFhlbiB0aGF0IGRpZCBub3Qgc3VwcG9ydCB0aGUgRklGTyBvcGVy
YXRpb25zLg0KPiA+Pg0KPiA+PiBBbmQgdGhlIGFsdGVybmF0aXZlIG9mIHRoZSBib290IGtlcm5l
bCBpc3N1aW5nIEVWVENITk9QX3Jlc2V0IGhhcw0KPiA+PiBvdGhlciB1bndhbnRlZCBjb25zZXF1
ZW5jZXMuIE1heWJlIHdvcnRoIG1lbnRpb25pbmcgaGVyZSwgYXMNCj4gPj4gb3RoZXJ3aXNlIHRo
aXMgd291bGQgbG9vayBsaWtlIHRoZSBvYnZpb3VzIHdheSB0byByZXR1cm4gdG8gMi1sZXZlbA0K
PiA+PiBtb2RlPw0KPiA+Pg0KPiA+PiBBbHNvLCB3aHkgY2FuJ3QgdGhlIGJvb3Qga2VybmVsIGJl
IGluc3RydWN0ZWQgdG8gYXZvaWQgZW5nYWdpbmcNCj4gPj4gRklGTyBtb2RlPw0KPiA+Pg0KPiA+
DQo+ID4gQm90aCBvZiB0aG9zZSBhcmUsIG9mIGNvdXJzZSwgdmlhYmxlIGFsdGVybmF0aXZlcyBp
ZiB0aGUgZ3Vlc3QgY2FuIGJlDQo+ID4gbW9kaWZpZWQuIFRoZSBwcm9ibGVtIHdlIG5lZWQgdG8g
d29yayBhcm91bmQgaXMgZ3Vlc3QgdGhhdCBhcmUgYWxyZWFkeQ0KPiA+IG91dCB0aGVyZSBhbmQg
Y2Fubm90IGJlIHVwZGF0ZWQuDQo+IA0KPiBNYWtpbmcgdXNlIG9mIEVWVENITk9QX3Jlc2V0IGlu
ZGVlZCB3b3VsZCByZXF1aXJlIGEgY2hhbmdlIHRvIHRoZQ0KPiBrZXJuZWwuIEJ1dCBMaW51eCBo
YXMgYSBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIHN1cHByZXNzIHVzZSBvZg0KPiBGSUZPIGV2ZW50
IGNoYW5uZWxzLCBzbyBJIGNhbid0IHNlZSB3aHkgdGhlIGJvb3Qga2VybmVsIGNvdWxkbid0DQo+
IGJlIHBhc3NlZCB0aGlzIGZsYWcgd2l0aG91dCBhbnkgbW9kaWZpY2F0aW9uIHRvIHRoZSBiaW5h
cnkuDQo+IA0KDQpJJ20gc3VyZSB0aGF0IHdhcyBjb25zaWRlcmVkIGFuZCBmb3VuZCBub3QgdG8g
YmUgZmVhc2libGUgaW4gb3VyIHVzZS1jYXNlLiAoTGlrZWx5IHRoZSBjb21tYW5kIGxpbmUgaXMg
YXMgbXVjaCBiYWtlZCBpbnRvIHRoZSBndWVzdCBpbWFnZSBhcyB0aGUga2VybmVsIGl0c2VsZiku
DQoNCj4gPj4+IFRvIG1haW50YWluIGNvbXBhdGliaWxpdHkgaXQgaXMgbmVjZXNzYXJ5IHRvIG1h
a2UgWGVuIGJlaGF2ZSBhcyBpdCBkaWQNCj4gPj4+IGJlZm9yZSB0aGUgbmV3IG9wZXJhdGlvbnMg
d2VyZSBhZGRlZCBhbmQgaGVuY2UgdGhlIGNvZGUgaW4gdGhpcyBwYXRjaCBlbnN1cmVzDQo+ID4+
PiB0aGF0LCBpZiBYRU5fRE9NQ1RMX0NERl9kaXNhYmxlX2ZpZm8gaXMgc2V0LCB0aGUgRklGTyBl
dmVudCBjaGFubmVsIG9wZXJhdGlvbnMNCj4gPj4+IHdpbGwgYWdhaW4gcmVzdWx0IGluIC1FTk9T
WVMgYmVpbmcgcmV0dXJuZWQgdG8gdGhlIGd1ZXN0Lg0KPiA+Pg0KPiA+PiBBcmUgdGhlcmUgaW5k
ZWVkIGRlcGVuZGVuY2llcyBvbiB0aGUgcHJlY2lzZSByZXR1cm4gdmFsdWUgYW55d2hlcmU/DQo+
ID4+IElmIHNvLCB0aGUgZ2VuZXJhbGx5IGluYXBwcm9wcmlhdGUgdXNlIChkb19ldmVudF9jaGFu
bmVsX29wKCkncw0KPiA+PiBkZWZhdWx0IGNhc2UgcmVhbGx5IHdvdWxkIGFsc28gbmVlZCBzd2l0
Y2hpbmcpIHdvdWxkIHdhbnQgYSBicmllZg0KPiA+PiBjb21tZW50LCBzbyBpdCdsbCBiZSB1bmRl
cnN0b29kIGJ5IHJlYWRlcnMgdGhhdCB0aGlzIGlzbid0IGNvZGUgdG8NCj4gPj4gZGVyaXZlIG90
aGVyIGNvZGUgZnJvbS4gSWYgbm90LCAtRVBFUk0gb3IgLUVBQ0NFUyBwZXJoYXBzPw0KPiA+Pg0K
PiA+DQo+ID4gVGhlIHBhdGNoLCBhcyBzdGF0ZWQsIGlzIHJldmVydGluZyBiZWhhdmlvdXIgYW5k
IHNvIHRoZSAtRU5PU1lTIHJlYWxseQ0KPiA+IG5lZWRzIHRvIHN0YXkgc2luY2UgaXQgaXMgZXNz
ZW50aWFsbHkgQUJJIG5vdy4gSSBhbSBub3QgYXdhcmUgb2YgZ3Vlc3QNCj4gPiBjb2RlIHRoYXQg
d2lsbCwgaW4gZmFjdCwgZGllIGlmIGl0IHNlZXMgLUVQRVJNIG9yIC1FQUNDRVMgaW5zdGVhZCBi
dXQNCj4gPiB0aGVyZSBtYXkgYmUgc3VjaCBjb2RlLiBUaGUgb25seSBzYWZlIHRoaW5nIHRvIGRv
IGlzIHRvIG1ha2UgdGhpbmdzDQo+ID4gbG9vayBsaWtlIHRoZSB1c2VkIHRvLg0KPiANCj4gSSBk
b24ndCB0aGluayBzcGVjaWZpYyBlcnJvciBjb2RlcyBjYW4gYmUgY29uc2lkZXJlZCAiQUJJIi4g
Tm90DQo+IHRoZSBsZWFzdCBiZWNhdXNlLCBpZiB0aGVyZSBhcmUgbXVsdGlwbGUgY2F1c2VzIGZv
ciBhbiBlcnJvciwgaXQNCj4gb3VnaHQgdG8gYmUgdW5kZWZpbmVkIHdoaWNoIGVycm9yIGdldHMg
cmV0dXJuZWQuIEEgZ3Vlc3Qgbm90DQo+IGZhbGxpbmcgYmFjayB0byAyLWxldmVsIG9uIF9hbnlf
IGVycm9yIGhlcmUgaXMgYmFzaWNhbGx5IHNldHRpbmcNCj4gaXRzZWxmIHVwIGZvciBldmVudHVh
bCBmYWlsdXJlIGJlY2F1c2Ugb2YgZS5nLiBnZXR0aW5nIGJhY2sNCj4gLUVOT01FTS4gT3Igc29t
ZW9uZSBkZWNpZGluZyB0byBhZGQgYW4gWFNNIGNoZWNrIHRvIHRoZSBmdW5jdGlvbi4NCj4gDQoN
CkknbSBub3QgZGlzYWdyZWVpbmcgdGhhdCBkZXBlbmRpbmcgb24gLUVOT1NZUyBpcyBhIGJhZCBp
ZGVhIGJ1dCwgYmVmb3JlIEZJRk8gY2FtZSBhbG9uZywgdGhhdCdzIHdoYXQgdGhlIGd1ZXN0IHdv
dWxkIHNlZSBhbmQgdGhhdCBpcyB3aGF0IGl0IG91Z2h0IHRvIHNlZSBhZ2FpbiBpZiB3ZSB3YW50
IHRvIHRydWx5IG9ic2N1cmUgdGhlIGludGVyZmFjZSAod2hpY2ggaXMgdGhlIHN0YXRlZCBhaW0g
aGVyZSkuDQoNCj4gQXMgc2FpZCwgSSdtIG9mIHRoZSBvcGluaW9uIHRoYXQgdGhlIG90aGVyIC1F
Tk9TWVMgb3VnaHQgdG8gYmUNCj4gcmVwbGFjZWQgYXMgd2VsbCwgd2hpY2ggb2YgY291cnNlIHdv
dWxkIGJlIHByZWNsdWRlZCBpZiB0aGlzIHdhcw0KPiBjb25zaWRlcmVkICJBQkkiLg0KPiANCg0K
SW5kZWVkLg0KDQogIFBhdWwNCg0KPiBKYW4NCg==

