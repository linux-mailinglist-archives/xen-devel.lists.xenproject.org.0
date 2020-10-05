Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6028394A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 17:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3046.8808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPSAX-0007o2-6T; Mon, 05 Oct 2020 15:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3046.8808; Mon, 05 Oct 2020 15:12:53 +0000
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
	id 1kPSAX-0007nd-2u; Mon, 05 Oct 2020 15:12:53 +0000
Received: by outflank-mailman (input) for mailman id 3046;
 Mon, 05 Oct 2020 15:12:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kPSAW-0007nW-1h
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 15:12:52 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bf775a7-4d0f-4e07-b266-b51f9f745295;
 Mon, 05 Oct 2020 15:12:51 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Oct 2020 15:12:48 +0000
Received: from EX13D32EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id EFB47A1F2B; Mon,  5 Oct 2020 15:12:45 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 15:12:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 15:12:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kPSAW-0007nW-1h
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 15:12:52 +0000
X-Inumbo-ID: 3bf775a7-4d0f-4e07-b266-b51f9f745295
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3bf775a7-4d0f-4e07-b266-b51f9f745295;
	Mon, 05 Oct 2020 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601910772; x=1633446772;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=4l27yO1IeWJA/+w+mViJgIDkDXvYifoOIMTJABip2Oc=;
  b=mi3v7yRs3rmjcDW/sBHihx6pCx/85z8OzLNQC0Rb8hxH/+C167CdXnwC
   jvD5zWXLVjyEIcbzoyisjg3ZoBeC7g5D85O5HdzTWo6xj+bmVxwAZJ+pD
   RNeWNCCdkd7OguJlv3rtAjGYBqXrngu6wC4pLkLpWEd0EC7IfH+NmUssg
   o=;
X-IronPort-AV: E=Sophos;i="5.77,338,1596499200"; 
   d="scan'208";a="57848308"
Subject: RE: [PATCH] ioreq: cope with server disappearing while I/O is pending
Thread-Topic: [PATCH] ioreq: cope with server disappearing while I/O is pending
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 05 Oct 2020 15:12:48 +0000
Received: from EX13D32EUC004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS id EFB47A1F2B;
	Mon,  5 Oct 2020 15:12:45 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 15:12:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 15:12:44 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Thread-Index: AQHWmyED9r+Q5zm9WU2AX5sFOgJgjKmJFSOAgAAEE8A=
Date: Mon, 5 Oct 2020 15:12:44 +0000
Message-ID: <4435a8a32e4347a29c18b792d7755633@EX13D32EUC003.ant.amazon.com>
References: <20201005140817.1339-1-paul@xen.org>
 <ea27f64b-deea-a80e-ed05-e4a6dd8e11f9@xen.org>
In-Reply-To: <ea27f64b-deea-a80e-ed05-e4a6dd8e11f9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAwNSBPY3RvYmVyIDIwMjAgMTU6NDINCj4gVG86IFBhdWwgRHVy
cmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENj
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3
bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBbUEFUQ0hdIGlvcmVxOiBjb3Bl
IHdpdGggc2VydmVyIGRpc2FwcGVhcmluZyB3aGlsZSBJL08gaXMgcGVuZGluZw0KPiANCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0
aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiANCj4gSGkgUGF1bCwNCj4gDQo+IE9uIDA1LzEwLzIwMjAgMTU6MDgsIFBhdWwgRHVy
cmFudCB3cm90ZToNCj4gPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
DQo+ID4NCj4gPiBDdXJyZW50bHksIGluIHRoZSBldmVudCBvZiBhbiBpb3JlcSBzZXJ2ZXIgYmVp
bmcgZGVzdHJveWVkIHdoaWxlIEkvTyBpcw0KPiA+IHBlbmRpbmcgaW4gdGhlIGF0dGFjaGVkIGVt
dWxhdG9yLCBpdCBpcyBwb3NzaWJsZSB0aGF0IGh2bV93YWl0X2Zvcl9pbygpIHdpbGwNCj4gPiBk
ZXJlZmVyZW5jZSBhIHBvaW50ZXIgdG8gYSAnc3RydWN0IGh2bV9pb3JlcV92Y3B1JyBvciB0aGUg
aW9yZXEgc2VydmVyJ3MNCj4gPiBzaGFyZWQgcGFnZSBhZnRlciBpdCBoYXMgYmVlbiBmcmVlZC4N
Cj4gDQo+IFNvIHRoZSBJT1JFUSBjb2RlIHdpbGwgY2FsbCBkb21haW5fcGF1c2UoKSBiZWZvcmUg
ZGVzdHJveWluZyB0aGUgSU9SRVEuDQo+IA0KPiBBIHZDUFUgY2FuIG9ubHkgYmUgZGVzY2hlZHVs
ZWQgaW4gaHZtX3dhaXRfZm9yX2lvKCkgZnJvbQ0KPiB3YWl0X29uX3hlbl9ldmVudF9jaGFubmVs
KCkuIEFGQUlLLCB3ZSB3b3VsZCBzY2hlZHVsZSBhIG5ldyB2Q1BVIChvcg0KPiBpZGxlKSB3aGVu
IHRoaXMgaGFwcGVucy4NCj4gDQo+IE9uIHg4NiwgdGhlIHNjaGVkdWxlKCkgZnVuY3Rpb24gd2ls
bCBub3QgcmV0dXJuIGFmdGVyIGNvbnRleHQgc3dpdGNoLg0KPiBUaGVyZWZvcmUuLi4NCj4gDQo+
ID4gVGhpcyB3aWxsIG9ubHkgb2NjdXIgaWYgdGhlIGVtdWxhdG9yICh3aGljaCBpcyBuZWNlc3Nh
cmlseSBydW5uaW5nIGluIGENCj4gPiBzZXJ2aWNlIGRvbWFpbiB3aXRoIHNvbWUgZGVncmVlIG9m
IHByaXZpbGVnZSkgZG9lcyBub3QgY29tcGxldGUgcGVuZGluZyBJL08NCj4gPiBkdXJpbmcgdGVh
ci1kb3duIGFuZCBpcyBub3QgZGlyZWN0bHkgZXhwbG9pdGFibGUgYnkgYSBndWVzdCBkb21haW4u
DQo+IA0KPiAuLi4gSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBjYW4gaGFwcGVuIG9uIHg4Ni4gRG8g
eW91IG1pbmQgcHJvdmlkaW5nIGFuDQo+IGV4YW1wbGU/DQoNCk1heWJlIEknbSBtaXNzaW5nIHNv
bWV0aGluZywgYnV0IEkgY2FuJ3Qgc2VlIGFueXRoaW5nIHRoYXQgd291bGQgcHJldmVudCB3YWl0
X2Zyb21feGVuX2V2ZW50X2NoYW5uZWwoKSByZXR1cm5pbmcgYWZ0ZXIgdGhlIGlvcmVxIHNlcnZl
ciBoYXMgYmVlbiBkZXN0cm95ZWQ/IFRoZSBkb21haW4gaXMgb25seSBwYXVzZWQgd2hpbHN0IGRl
c3RydWN0aW9uIGlzIGluIHByb2dyZXNzIGJ1dCBib3RoICdzdicgYW5kICdwJyB3aWxsIGJlIG9u
LXN0YWNrIGFuZCB0aHVzLCBhcyBzb29uIGFzIHRoZSBkb21haW4gaXMgdW5wYXVzZWQgYWdhaW4s
IGNvdWxkIGJlIHN1YmplY3QgdG8gVUFGLg0KDQogIFBhdWwNCg0KPiANCj4gTm90ZSB0aGF0IG9u
IEFybSwgdGhlIHNjaGVkdWxlKCkgZnVuY3Rpb24gd2lsbCByZXR1cm4gYWZ0ZXIgY29udGV4dA0K
PiBzd2l0Y2guIFNvIHRoZSBwcm9ibGVtIHlvdSBkZXNjcmliZSBpcyB0aGVyZSBmcm9tIGFuIGFy
Y2gtYWdub3N0aWMgUG9WLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxs
DQo=

