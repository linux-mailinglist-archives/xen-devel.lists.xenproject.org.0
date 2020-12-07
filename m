Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591F2D0DF1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46122.81820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDgt-0005od-KB; Mon, 07 Dec 2020 10:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46122.81820; Mon, 07 Dec 2020 10:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDgt-0005oE-Gd; Mon, 07 Dec 2020 10:24:23 +0000
Received: by outflank-mailman (input) for mailman id 46122;
 Mon, 07 Dec 2020 10:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=og4e=FL=amazon.co.uk=prvs=60380b542=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kmDgs-0005mY-69
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:24:22 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95db8a9f-74d6-47ff-8392-343e496d73c4;
 Mon, 07 Dec 2020 10:24:16 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 07 Dec 2020 10:24:08 +0000
Received: from EX13D03EUC004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id EAFE0A1822; Mon,  7 Dec 2020 10:23:57 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 7 Dec 2020 10:23:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 7 Dec 2020 10:23:56 +0000
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
X-Inumbo-ID: 95db8a9f-74d6-47ff-8392-343e496d73c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1607336657; x=1638872657;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=U0bim6zkzxMacxlqZrtth4BZTZBryVs9GrfbNQCSqqs=;
  b=BEStf6gC7bTWmcUfks64ZRKP01yFKGFOPDFyFXe3mLTLhfny4JnPNOqt
   W6/173mOBaR2wyd4O3rox32/96EWeLB0UY6WeUBIbKwila5Vds9qA0O43
   kE6bzpKgimn/aUjLVDghW4nGwqWs7gnTG6lUc8EZ2W/S0qGcFd02K6RLy
   k=;
X-IronPort-AV: E=Sophos;i="5.78,399,1599523200"; 
   d="scan'208";a="69530302"
Subject: RE: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
Thread-Topic: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: "Elnikety, Eslam" <elnikety@amazon.com>, 'Ian Jackson'
	<iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Anthony PERARD'
	<anthony.perard@citrix.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
	'George Dunlap' <george.dunlap@citrix.com>, 'Stefano Stabellini'
	<sstabellini@kernel.org>, 'Christian Lindig' <christian.lindig@citrix.com>,
	'David Scott' <dave@recoil.org>, 'Volodymyr Babchuk'
	<Volodymyr_Babchuk@epam.com>, =?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQJzrCHAX/gquRkO4g65wfjgQBytUAJ7xs67Aj6rtzSoheWkIIAACFOAgAATywCAAPdoAIAACFeAgAAWa4CAACI7AIAEjX2AgAANTgCAAAL4gIAAALmQ
Date: Mon, 7 Dec 2020 10:23:56 +0000
Message-ID: <bba9cef29617481e8f88f9117e55ce76@EX13D32EUC003.ant.amazon.com>
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
 <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
 <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
 <c5537493-1a6f-cdc1-27dc-a34060e7efc5@suse.com>
 <63af7714-9c03-35b6-99a1-795b678b8032@xen.org>
 <93d4ff1c-9f8a-c318-50f8-add2820059d7@suse.com>
In-Reply-To: <93d4ff1c-9f8a-c318-50f8-add2820059d7@suse.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4+IEkndmUgZ29uZSBmcm9t
IHlvdSBzYXlpbmcgIllvdSByZWFsbHkgbmVlZCBhIHNvbHV0aW9uIHRoYXQgY2FuIHJlc3RvcmUN
Cj4gPj4gdGhlIG9sZCBWTSBlbnZpcm9ubWVudCwgYXQgbGVhc3QgdGVtcG9yYXJpbHksIGZvciB0
aGF0IGN1c3RvbWVyLiIgVGhlDQo+ID4+ICJ0ZW1wb3JhcmlseSIgdG8gbWUgaW1wbGllcyB0aGF0
IGl0IGlzIGF0IGxlYXN0IGFuIG9wdGlvbiB0byB0aWUgYQ0KPiA+PiBjZXJ0YWluIGd1ZXN0IHRv
IGEgY2VydGFpbiBYZW4gdmVyc2lvbiBmb3IgaW4tZ3Vlc3QgdXBncmFkaW5nIHB1cnBvc2VzLg0K
PiA+ICA+DQoNCk5vdCBuZWNlc3NhcmlseS4NCg0KPiA+PiBJZiB0aGUgZGVhbCB3aXRoIHRoZSBj
dXN0b21lciBkb2Vzbid0IGluY2x1ZGUgcnVubmluZyBvbiBhIGNlcnRhaW4gWGVuDQo+ID4+IHZl
cnNpb24sIEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNvdWxkIGhhdmUgbm9uLXRlbXBvcmFyeSBjb25z
ZXF1ZW5jZXMgdG8NCj4gPj4gdGhlIGNsb3VkIHByb3ZpZGVyLg0KPiA+DQo+ID4gSSB0aGluayBi
eSAieW91IiwgeW91IG1lYW4gUGF1bCBhbmQgbm90IG1lPw0KPiANCj4gT2gsIHJpZ2h0LCBJIGRp
ZG4ndCBwYXkgYXR0ZW50aW9uIHRvIHdobyB3cm90ZSB0aGF0IHRleHQuIFNvcnJ5Lg0KPiANCg0K
QnkgdGVtcG9yYXJ5IEkgbWVhbiB0aGF0IHdlIG1heSB3YW50IHRvIHRpbWUtbGltaXQgdHVybmlu
ZyBvZmYgYSBjZXJ0YWluIHBhcnQgb2YgdGhlIEFCVSBiZWNhdXNlLCB3aGlsc3QgaXQgaXMgcHJv
YmxlbWF0aWMgZm9yIHNvbWUgY3VzdG9tZXJzLCBpdCBjb3VsZCAoYW5kIGlzIGxpa2VseSB0bykg
aGF2ZSBtZWFzdXJhYmxlIGJlbmVmaXRzIHRvIG90aGVycy4gVGh1cyB5b3Uga2VlcCB0aGUgZmVh
dHVyZSBvZmYgb25seSB1bnRpbCBhbnkgY3VzdG9tZXJzIHJ1bm5pbmcgT1MgdGhhdCBoYXZlIHBy
b2JsZW1zIGhhdmUgdXBncmFkZWQgdGhlaXIgaW5zdGFsbGF0aW9ucy4NCg0KICBQYXVsDQoNCg==

