Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B22837FC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 16:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3042.8784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPRe2-0004BU-71; Mon, 05 Oct 2020 14:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3042.8784; Mon, 05 Oct 2020 14:39:18 +0000
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
	id 1kPRe2-0004B5-3j; Mon, 05 Oct 2020 14:39:18 +0000
Received: by outflank-mailman (input) for mailman id 3042;
 Mon, 05 Oct 2020 14:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kPRe0-0004B0-2a
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:39:16 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b77013d-0066-4491-b5c2-84c61d823308;
 Mon, 05 Oct 2020 14:39:15 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Oct 2020 14:39:08 +0000
Received: from EX13D32EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9B7A6A2461; Mon,  5 Oct 2020 14:39:06 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 14:39:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 14:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kPRe0-0004B0-2a
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:39:16 +0000
X-Inumbo-ID: 4b77013d-0066-4491-b5c2-84c61d823308
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4b77013d-0066-4491-b5c2-84c61d823308;
	Mon, 05 Oct 2020 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601908756; x=1633444756;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=KAQeIMBUHE6Z6owhx1JhCJzGoc3oNwrGfCoRsr/E4BM=;
  b=G5UqsYINf1rgyxdojoYXnSRgiwTA1CXkQir9sQH9CjxaBZpVdabXyWT6
   QuhZaM18LYGzbeGO9dQn+STXZ7jrf7+D4Kn2uru1NoPNRE8UcMhHjGzeR
   24Pf2GTIDcOoA3RiC8/qoUx5GxyFPK6b/TN35aQv1bCCs4nRfXKIEhAhC
   8=;
X-IronPort-AV: E=Sophos;i="5.77,338,1596499200"; 
   d="scan'208";a="81660280"
Subject: RE: [PATCH] ioreq: cope with server disappearing while I/O is pending
Thread-Topic: [PATCH] ioreq: cope with server disappearing while I/O is pending
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 05 Oct 2020 14:39:08 +0000
Received: from EX13D32EUC004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS id 9B7A6A2461;
	Mon,  5 Oct 2020 14:39:06 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 14:39:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 14:39:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Thread-Index: AQHWmyED9r+Q5zm9WU2AX5sFOgJgjKmJEd0AgAABGPA=
Date: Mon, 5 Oct 2020 14:39:05 +0000
Message-ID: <9a906f6740834ee9bca4c8108de79ff8@EX13D32EUC003.ant.amazon.com>
References: <20201005140817.1339-1-paul@xen.org>
 <84dea7c2-cd0e-c954-1bc7-80568e428ff4@citrix.com>
In-Reply-To: <84dea7c2-cd0e-c954-1bc7-80568e428ff4@citrix.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwNSBPY3RvYmVyIDIwMjAgMTU6MzANCj4g
VG86IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgSmFuIEJldWxpY2gNCj4gPGpiZXVsaWNoQHN1c2Uu
Y29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3
bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBbUEFUQ0hdIGlvcmVxOiBjb3Bl
IHdpdGggc2VydmVyIGRpc2FwcGVhcmluZyB3aGlsZSBJL08gaXMgcGVuZGluZw0KPiANCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0
aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiANCj4gT24gMDUvMTAvMjAyMCAxNTowOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPg0KPiA+IEN1cnJl
bnRseSwgaW4gdGhlIGV2ZW50IG9mIGFuIGlvcmVxIHNlcnZlciBiZWluZyBkZXN0cm95ZWQgd2hp
bGUgSS9PIGlzDQo+ID4gcGVuZGluZyBpbiB0aGUgYXR0YWNoZWQgZW11bGF0b3IsIGl0IGlzIHBv
c3NpYmxlIHRoYXQgaHZtX3dhaXRfZm9yX2lvKCkgd2lsbA0KPiA+IGRlcmVmZXJlbmNlIGEgcG9p
bnRlciB0byBhICdzdHJ1Y3QgaHZtX2lvcmVxX3ZjcHUnIG9yIHRoZSBpb3JlcSBzZXJ2ZXIncw0K
PiA+IHNoYXJlZCBwYWdlIGFmdGVyIGl0IGhhcyBiZWVuIGZyZWVkLg0KPiANCj4gSXQncyBub3Qg
bGVnaXRpbWF0ZSBmb3IgdGhlIHNoYXJlZCBwYWdlIHRvIGJlIGZyZWVkIHdoaWxlIFhlbiBpcyBz
dGlsbA0KPiB1c2luZyBpdC4NCj4gDQo+IEZ1cnRoZXJtb3JlLCB0aGlzIHBhdGNoIG9ubHkgY292
ZXJzIHRoZSBtb3N0IG9idmlvdXMgcGxhY2UgZm9yIHRoZSBidWcNCj4gdG8gbWFuaWZlc3QuICBJ
dCBkb2Vzbid0IGZpeCB0aGVtIGFsbCwgYXMgYSBpb3JlcSBzZXJ2ZXIgZGVzdHJveSBjYW4NCj4g
cmFjZSB3aXRoIGFuIGluLXByb2dyZXNzIGVtdWxhdGlvbiBhbmQgc3RpbGwgc3VmZmVyIGEgVUFG
Lg0KPiANCj4gDQo+IEFuIGV4dHJhIHJlZiBuZWVkcyBob2xkaW5nIG9uIHRoZSBzaGFyZWQgcGFn
ZSBiZXR3ZWVuIGFjcXVpcmVfcmVzb3VyY2UNCj4gYW5kIGRvbWFpbiBkZXN0cnVjdGlvbiwgdG8g
Y292ZXIgWGVuJ3MgdXNlIG9mIHRoZSBwYWdlLg0KPiANCg0KWWVzLCB0aGF0J3MgdHJ1ZS4NCg0K
PiBTaW1pbGFybHksIEkgZG9uJ3QgdGhpbmsgaXQgaXMgbGVnaXRpbWF0ZSBmb3IgaHZtX2lvcmVx
X3ZjcHUgdG8gYmUgZnJlZWQNCj4gd2hpbGUgcG90ZW50aWFsbHkgaW4gdXNlLiAgVGhlc2UgbmVl
ZCB0byBzdGljayBhcm91bmQgdW50aWwgZG9tYWluDQo+IGRlc3RydWN0aW9uIGFzIHdlbGwsIEkg
dGhpbmsuDQo+IA0KDQpUaGF0IHdvdWxkIGNvdmVyIHRoZSBwcm9ibGVtIHdpdGggdGhlIHN2IHBv
aW50ZXIsIEkgZ3Vlc3MgaXQgd291bGQgYmUgcG9zc2libGUgdG8gbWFyayB0aGUgc3RydWN0IHN0
YWxlIGFuZCB0aGVuIGZyZWUgaXQgd2hlbiAncGVuZGluZycgdHJhbnNpdGlvbnMgdG8gZmFsc2Uu
DQoNCj4gPiBUaGlzIHdpbGwgb25seSBvY2N1ciBpZiB0aGUgZW11bGF0b3IgKHdoaWNoIGlzIG5l
Y2Vzc2FyaWx5IHJ1bm5pbmcgaW4gYQ0KPiA+IHNlcnZpY2UgZG9tYWluIHdpdGggc29tZSBkZWdy
ZWUgb2YgcHJpdmlsZWdlKSBkb2VzIG5vdCBjb21wbGV0ZSBwZW5kaW5nIEkvTw0KPiA+IGR1cmlu
ZyB0ZWFyLWRvd24gYW5kIGlzIG5vdCBkaXJlY3RseSBleHBsb2l0YWJsZSBieSBhIGd1ZXN0IGRv
bWFpbi4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIGNhbGwgdG8gZ2V0X3BlbmRpbmdfdmNw
dSgpIGludG8gdGhlIGNvbmRpdGlvbiBvZiB0aGUNCj4gPiB3YWl0X29uX3hlbl9ldmVudF9jaGFu
bmVsKCkgbWFjcm8gdG8gdmVyaWZ5IHRoZSBjb250aW51ZWQgZXhpc3RlbmNlIG9mIHRoZQ0KPiA+
IGlvcmVxIHNlcnZlci4gU2hvdWxkIGl0IGRpc2FwcGVhciwgdGhlIGd1ZXN0IGRvbWFpbiB3aWxs
IGJlIGNyYXNoZWQuDQo+ID4NCj4gPiBOT1RFOiB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBtb2Rp
ZnkgdGhlIHRleHQgb24gb25lIGdkcHJpbnRrKCkgZm9yDQo+ID4gICAgICAgY29uc2lzdGVuY3kg
d2l0aCBvdGhlcnMuDQo+IA0KPiBJIGtub3cgdGhpcyBpcyB0YW5nZW50aWFsLCBidXQgYWxsIHRo
ZXNlIGdkcHJpbnRrKCkncyBuZWVkIHRvIGNoYW5nZSB0bw0KPiBncHJpbnRrKCkncywgc28gcmVs
ZWFzZSBidWlsZHMgcHJvdmlkZSBhdCBsZWFzdCBzb21lIGhpbnQgYXMgdG8gd2h5IHRoZQ0KPiBk
b21haW4gaGFzIGJlZW4gY3Jhc2hlZC4NCj4gDQoNClllcywgdGhhdCdzIGFsc28gYSBnb29kIHBv
aW50Lg0KDQpJIGd1ZXNzIHRoaXMgd2lsbCBwYXRjaCB3aWxsIHByb2JhYmx5IG5lZWQgdG8gYmVj
b21lIGEgc2VyaWVzLg0KDQogIFBhdWwNCg0KPiAoQW5kIEkgYWxzbyByZWFsbHkgbmVlZCB0byBm
aW5pc2ggb2ZmIG15IGRvbWFpbl9jcmFzaCgpIHBhdGNoIHRvIGZvcmNlDQo+IHRoaXMgZXZlcnl3
aGVyZS4pDQo+IA0KPiB+QW5kcmV3DQo=

