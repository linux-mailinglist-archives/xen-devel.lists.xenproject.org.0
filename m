Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277610B252
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:21:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZz5a-0007BW-2z; Wed, 27 Nov 2019 15:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZz5Y-0007BR-91
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:18:44 +0000
X-Inumbo-ID: 332d022c-1129-11ea-a55d-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 332d022c-1129-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574867924; x=1606403924;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L13A0pYC9WSkERh6YQToSIgtWa7fk4Pz3/e1hwLOMq0=;
 b=qo0UwFJpEmPZu7k61r6JG34bDddrhQV3I27ldagwVYjReZXObRnqlJIK
 c3XvupimM9rs9Fj9IHcQodo+zrVhLd93A98KzPbgJX7jpBzaQfhul6LzW
 ybF+mvVQiS/BOKLB9xfxSMOCaEnvqUFZXIgBpuSbE1bEsYy67l4ezhoTT o=;
IronPort-SDR: sM5/YsN85viJSogGpaRK3DIErD/YJBoA7ieMz7ta/dg+BF5G4c5qBLAi5IfkJQW9aTh5HVM2o+
 YJLJnENsJIjw==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; 
   d="scan'208";a="6605850"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Nov 2019 15:18:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id C9D49A18E5; Wed, 27 Nov 2019 15:18:41 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 15:18:41 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 15:18:40 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 15:18:40 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86 / iommu: set up a scratch page in the quarantine
 domain
Thread-Index: AQHVn5tNaK/V9YZGKk+zattii3WhUKebk5SAgAOXSpA=
Date: Wed, 27 Nov 2019 15:18:40 +0000
Message-ID: <01af44ec07cf464cba555114555ed75f@EX13D32EUC003.ant.amazon.com>
References: <20191120120859.1846-1-pdurrant@amazon.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D60E9FD@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D60E9FD@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86 / iommu: set up a scratch page in the
 quarantine domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaWFuLCBLZXZpbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IDI1IE5vdmVtYmVyIDIwMTkgMDg6MjINCj4gVG86IER1
cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6
IFJFOiBbUEFUQ0hdIHg4NiAvIGlvbW11OiBzZXQgdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlIHF1
YXJhbnRpbmUNCj4gZG9tYWluDQo+IA0KPiA+IEZyb206IFBhdWwgRHVycmFudCBbbWFpbHRvOnBk
dXJyYW50QGFtYXpvbi5jb21dDQo+ID4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyMCwgMjAx
OSA4OjA5IFBNDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgaW9tbXVfb3Ag
dG8gZmFjaWxpdGF0ZSBhIHBlci1pbXBsZW1lbnRhdGlvbg0KPiA+IHF1YXJhbnRpbmUgc2V0IHVw
LCBhbmQgdGhlbiBmdXJ0aGVyIGNvZGUgZm9yIHg4NiBpbXBsZW1lbnRhdGlvbnMNCj4gPiAoYW1k
IGFuZCB2dGQpIHRvIHNldCB1cCBhIHJlYWQvd3JvdGUgc2NyYXRjaCBwYWdlIHRvIHNlcnZlIGFz
IHRoZQ0KPiBzb3VyY2UvDQo+ID4gdGFyZ2V0IGZvciBhbGwgRE1BIHdoaWxzdCBhIGRldmljZSBp
cyBhc3NpZ25lZCB0byBkb21faW8uDQo+ID4NCj4gPiBUaGUgcmVhc29uIGZvciBkb2luZyB0aGlz
IGlzIHRoYXQgc29tZSBoYXJkd2FyZSBtYXkgY29udGludWUgdG8gcmUtdHJ5DQo+ID4gRE1BLCBk
ZXNwaXRlIEZMUiwgaW4gdGhlIGV2ZW50IG9mIGFuIGVycm9yLiBIYXZpbmcgYSBzY3JhdGNoIHBh
Z2UgbWFwcGVkDQo+ID4gd2lsbCBhbGxvdyBwZW5kaW5nIERNQSB0byBkcmFpbiBhbmQgdGh1cyBx
dWllc2NlIHN1Y2ggYnVnZ3kgaGFyZHdhcmUuDQo+IA0KPiB0aGVuIHRoZXJlIGlzIG5vIGRpYWdu
b3N0aWNzIGF0IGFsbCBzaW5jZSBhbGwgZmF1bHRzIGFyZSBxdWllc2NlbnQgbm93Li4uDQo+IHdo
eSBkbyB3ZSB3YW50IHRvIHN1cHBvcnQgc3VjaCBidWdneSBoYXJkd2FyZT8gSXMgaXQgYmV0dGVy
IHRvIG1ha2UNCj4gaXQgYW4gZGVmYXVsdC1vZmYgb3B0aW9uIHNpbmNlIGJ1Z2d5IGlzIHN1cHBv
c2VkIHRvIG5pY2hlIGNhc2U/DQoNCkkgZ3Vlc3MgaXQgY291bGQgYmUgYSBjb21tYW5kIGxpbmUg
b3B0aW9uLi4uIHBlcmhhcHMgbWFraW5nIHRoZSBuZXcgJ2lvbW11PXF1YXJhbnRpbmUnIGJvb2xl
YW4gaW50byBzb21ldGhpbmcgbW9yZSBjb21wbGV4LCBidXQgSSdtIG5vdCBzdXJlIGl0J3MgcmVh
bGx5IHdvcnRoIGl0LiBQZXJoYXBzIGEgY29tcGlsZSB0aW1lIG9wdGlvbiB3b3VsZCBiZSBiZXR0
ZXI/DQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
