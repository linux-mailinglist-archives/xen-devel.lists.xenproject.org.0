Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE618116CD3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:03:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHjV-0002qp-OW; Mon, 09 Dec 2019 12:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieHjU-0002qk-5X
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:01:44 +0000
X-Inumbo-ID: aaf03ff8-1a7b-11ea-88e7-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaf03ff8-1a7b-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575892904; x=1607428904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XvRR7gQY2FQJatuw/ophADlxtuoMusOU93AHjmf9lGY=;
 b=oybjfxfCv7PSTdkGnD1iiMGgAMMifi+32iWjBWqXnZ1fU7fwTNwXnQnn
 g2ja/QcgQnHiowCHKnJxicWJKKmpWanRcr+ry9KCTIDKAtFZ0Hstx/igY
 ImC3/7u0vRtrJ8hkLMI8qlmwtZDX2GKB+8RPwU/0zR0u5x+tjBvR0l1ZI s=;
IronPort-SDR: PmvwQo4VnzBLjfnNJGwXkqt+n4PosgQshR9n6DuHBw9xplP0Z4ts5Y/FFs9acKdrfrJ6NRwsV0
 BEcmp/w7sxmQ==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="7663811"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 09 Dec 2019 12:01:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id E58CB240AF1; Mon,  9 Dec 2019 12:01:39 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:01:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:01:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 12:01:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEsBA=
Date: Mon, 9 Dec 2019 12:01:38 +0000
Message-ID: <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
In-Reply-To: <20191209113926.GS980@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTE6MzkKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuCj4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47Cj4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3
aGVuIHN0YXRlIGlzIGZvcmNlZCB0bwo+IGNsb3NlZAo+IAo+IE9uIFRodSwgRGVjIDA1LCAyMDE5
IGF0IDAyOjAxOjIxUE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IE9ubHkgZm9yY2Ug
c3RhdGUgdG8gY2xvc2VkIGluIHRoZSBjYXNlIHdoZW4gdGhlIHRvb2xzdGFjayBtYXkgbmVlZCB0
bwo+ID4gY2xlYW4gdXAuIFRoaXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNoZWNraW5nIHdoZXRoZXIg
dGhlIHN0YXRlIGluIHhlbnN0b3JlCj4gPiBoYXMgYmVlbiBzZXQgdG8gY2xvc2luZyBwcmlvciB0
byBkZXZpY2UgcmVtb3ZhbC4KPiAKPiBJJ20gbm90IHN1cmUgSSBzZWUgdGhlIHBvaW50IG9mIHRo
aXMsIEkgd291bGQgZXhwZWN0IHRoYXQgYSBmYWlsdXJlIHRvCj4gcHJvYmUgb3IgdGhlIHJlbW92
YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVuYnVzIHN0YXRlIGFzCj4gY2xvc2Vk
LCB3aGljaCBpcyBjb25zaXN0ZW50IHdpdGggdGhlIGFjdHVhbCBkcml2ZXIgc3RhdGUuCj4gCj4g
Q2FuIHlvdSBleHBsYWluIHdoYXQncyB0aGUgYmVuZWZpdCBvZiBsZWF2aW5nIGEgZGV2aWNlIHdp
dGhvdXQgYQo+IGRyaXZlciBpbiBzdWNoIHVua25vd24gc3RhdGU/Cj4gCgpJZiBwcm9iZSBmYWls
cyB0aGVuIEkgdGhpbmsgaXQgc2hvdWxkIGxlYXZlIHRoZSBzdGF0ZSBhbG9uZS4gSWYgdGhlIHN0
YXRlIGlzIG1vdmVkIHRvIGNsb3NlZCB0aGVuIGJhc2ljYWxseSB5b3UganVzdCBraWxsZWQgdGhh
dCBjb25uZWN0aW9uIHRvIHRoZSBndWVzdCAoYXMgdGhlIGZyb250ZW5kIHdpbGwgbm9ybWFsbHkg
Y2xvc2UgZG93biB3aGVuIGl0IHNlZXMgdGhpcyBjaGFuZ2UpIHNvLCBpZiB0aGUgcHJvYmUgZmFp
bHVyZSB3YXMgZHVlIHRvIGEgYnVnIGluIGJsa2JhY2sgb3IsIGUuZy4sIGEgdHJhbnNpZW50IHJl
c291cmNlIGlzc3VlIHRoZW4gaXQncyBnYW1lIG92ZXIgYXMgZmFyIGFzIHRoYXQgZ3Vlc3QgZ29l
cy4KVGhlIHVsdGltYXRlIGdvYWwgaGVyZSBpcyBQViBiYWNrZW5kIHJlLWxvYWQgdGhhdCBpcyBj
b21wbGV0ZWx5IHRyYW5zcGFyZW50IHRvIHRoZSBndWVzdC4gTW9kaWZ5aW5nIGFueXRoaW5nIGlu
IHhlbnN0b3JlIGNvbXByb21pc2VzIHRoYXQgc28gd2UgbmVlZCB0byBiZSBjYXJlZnVsLgoKICBQ
YXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
