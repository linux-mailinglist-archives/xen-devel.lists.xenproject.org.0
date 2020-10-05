Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289F2832F1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2904.8298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMZO-0005Q3-J5; Mon, 05 Oct 2020 09:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2904.8298; Mon, 05 Oct 2020 09:14:10 +0000
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
	id 1kPMZO-0005Pc-Fn; Mon, 05 Oct 2020 09:14:10 +0000
Received: by outflank-mailman (input) for mailman id 2904;
 Mon, 05 Oct 2020 09:14:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kPMZN-0005PT-1n
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:14:09 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f57f70e7-b0c6-4a96-8246-396bbefc26c9;
 Mon, 05 Oct 2020 09:14:08 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Oct 2020 09:14:07 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id B4BCBA0460; Mon,  5 Oct 2020 09:14:05 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 09:14:04 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 09:14:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kPMZN-0005PT-1n
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:14:09 +0000
X-Inumbo-ID: f57f70e7-b0c6-4a96-8246-396bbefc26c9
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f57f70e7-b0c6-4a96-8246-396bbefc26c9;
	Mon, 05 Oct 2020 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601889249; x=1633425249;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=ip993wRWsklUdrvJKBBrCrWudN+UV+bDYZ1jj5g8XPQ=;
  b=s6n0KDRPSWcWT/W27GNdk6ZBTUvzs4B1+JpbncESwsnhbwntk1DWAkIq
   2GgGB60xMLIIBg1oEDeskkkZL2CFKSdGd3vMWiJGG+TO1XHIHLu12Lw4l
   S2F3tSj3Zy+Joe2/enw9P7kzhN7J5NJhrEdwrDvmdlLmZn9qnmxlflj3R
   4=;
X-IronPort-AV: E=Sophos;i="5.77,338,1596499200"; 
   d="scan'208";a="57755502"
Subject: RE: [PATCH v9 4/8] docs/specs: add missing definitions to
 libxc-migration-stream
Thread-Topic: [PATCH v9 4/8] docs/specs: add missing definitions to libxc-migration-stream
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 05 Oct 2020 09:14:07 +0000
Received: from EX13D32EUC002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
	by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS id B4BCBA0460;
	Mon,  5 Oct 2020 09:14:05 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 09:14:04 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 09:14:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwKSrMFxAhJ0Esapd/NkMA==
Date: Mon, 5 Oct 2020 09:14:03 +0000
Message-ID: <f9c14acb769f433c95b46f9837ca8205@EX13D32EUC003.ant.amazon.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-5-paul@xen.org>
 <fda9ae6f-e55f-2e62-44a9-acf4e6e2d09e@citrix.com>
In-Reply-To: <fda9ae6f-e55f-2e62-44a9-acf4e6e2d09e@citrix.com>
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
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwMiBPY3RvYmVyIDIwMjAgMjM6NDINCj4g
VG86IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBS
RTogW0VYVEVSTkFMXSBbUEFUQ0ggdjkgNC84XSBkb2NzL3NwZWNzOiBhZGQgbWlzc2luZyBkZWZp
bml0aW9ucyB0byBsaWJ4Yy1taWdyYXRpb24tc3RyZWFtDQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVt
YWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0g
dGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0KPiBP
biAyNC8wOS8yMDIwIDE0OjEwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gRnJvbTogUGF1bCBE
dXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+DQo+ID4gVGhlIFNUQVRJQ19EQVRBX0VO
RCwgWDg2X0NQVUlEX1BPTElDWSBhbmQgWDg2X01TUl9QT0xJQ1kgcmVjb3JkIHR5cGVzIGhhdmUN
Cj4gPiBzZWN0aW9ucyBleHBsYWluaW5nIHdoYXQgdGhleSBhcmUgYnV0IHRoZWlyIHZhbHVlcyBh
cmUgbm90IGRlZmluZWQuIEluZGVlZA0KPiA+IHRoZWlyIHZhbHVlcyBhcmUgZGVmaW5lZCBhcyAi
UmVzZXJ2ZWQgZm9yIGZ1dHVyZSBtYW5kYXRvcnkgcmVjb3Jkcy4iDQo+ID4NCj4gPiBBbHNvLCB0
aGUgc3BlYyByZXZpc2lvbiBpcyBhZGp1c3RlZCB0byBtYXRjaCB0aGUgbWlncmF0aW9uIHN0cmVh
bSB2ZXJzaW9uDQo+ID4gYW5kIGFuIEVORCByZWNvcmQgaXMgYWRkZWQgdG8gdGhlIGRlc2NyaXB0
aW9uIG9mIGEgJ3R5cGljYWwgc2F2ZSByZWNvcmQgZm9yDQo+ID4gYW5kIHg4NiBIVk0gZ3Vlc3Qu
Jw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPg0KPiA+IEZpeGVzOiA2ZjcxYjViMTUwNiAoImRvY3MvbWlncmF0aW9uIFNwZWNpZnkgbWln
cmF0aW9uIHYzIGFuZCBTVEFUSUNfREFUQV9FTkQiKQ0KPiA+IEZpeGVzOiBkZGQyNzNkODg2MyAo
ImRvY3MvbWlncmF0aW9uOiBTcGVjaWZ5IFg4Nl97Q1BVSUQsTVNSfV9QT0xJQ1kgcmVjb3JkcyIp
DQo+IA0KPiBPb3BzIHNvcnJ5LiAgSSBzd2VhciBJIGhhZCB0aGVzZSBhdCBvbmUgcG9pbnQuICBJ
IGNhbiBvbmx5IHByZXN1bWUgaXQNCj4gZ290IHN3YWxsb3dlZCBieSBhIHJlYmFzZSBhdCBzb21l
IHBvaW50Lg0KPiANCg0KQ2FuIEkgdGFrZSB0aGF0IGFzIGFuIFItYj8NCg0KICBQYXVsDQoNCj4g
fkFuZHJldw0K

