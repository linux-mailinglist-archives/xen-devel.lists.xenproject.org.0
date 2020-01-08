Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D644134EDA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 22:28:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipIoi-0000hS-07; Wed, 08 Jan 2020 21:24:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T63C=25=amazon.com=prvs=2690668c3=anchalag@srs-us1.protection.inumbo.net>)
 id 1ipIog-0000hN-83
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 21:24:38 +0000
X-Inumbo-ID: 46246d5c-325d-11ea-b1f0-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46246d5c-325d-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578518678; x=1610054678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OYjFFo0DrFCWzOOz/gny+i2vR66GYQHB2pkG1xclaIo=;
 b=Nz90dVaLeJMtBGsjakplNF5juTnrtiva5w2gST4Rr8RqP7DgrOQCabKz
 KwhnCj7EvKTASwKfKrShOwAHw3plrJWgXTmGnWJiySV0CMBu66GvJadzv
 wqYez/M9W/0DPqxMv03dfvps2ZzmbGt0KWXiGK4UiSOC+FYWWcjGcnXYy Y=;
IronPort-SDR: pEvaeQmguSuyTaI/dz/YeUORvZXYn05WOkURz0oliguYx//z58wUrptZSkzkMPSfNKtLeXWNlj
 Vptfrbuz+gvw==
X-IronPort-AV: E=Sophos;i="5.69,411,1571702400"; d="scan'208";a="11513237"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 08 Jan 2020 21:24:35 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 95D21C5B6F; Wed,  8 Jan 2020 21:24:33 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 8 Jan 2020 21:24:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 8 Jan 2020 21:24:17 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 8 Jan 2020 21:24:17 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id DE4FD40E78; Wed,  8 Jan 2020 21:24:17 +0000 (UTC)
Date: Wed, 8 Jan 2020 21:24:17 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20200108212417.GA22381@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200107234420.GA18738@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <877e22ezv6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877e22ezv6.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH V2 09/11] xen: Clear IRQD_IRQ_STARTED
 flag during shutdown PIRQs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: konrad.wilk@oracle.co, eduval@amazon.com, peterz@infradead.org,
 x86@kernel.org, linux-mm@kvack.org, axboe@kernel.dk, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, len.brown@intel.com,
 linux-pm@vger.kernel.org, anchalag@amazon.com, bp@alien8.de,
 boris.ostrovsky@oracle.com, jgross@suse.com, netdev@vger.kernel.org,
 fllinden@amazon.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDQ6MjM6MjVQTSArMDEwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IEFuY2hhbCBBZ2Fyd2FsIDxhbmNoYWxhZ0BhbWF6b24uY29tPiB3cml0ZXM6Cj4g
Cj4gPiBzaHV0ZG93bl9waXJxIGlzIGludm9rZWQgZHVyaW5nIGhpYmVybmF0aW9uIHBhdGggYW5k
IGhlbmNlCj4gPiBQSVJRcyBzaG91bGQgYmUgcmVzdGFydGVkIGR1cmluZyByZXN1bWUuCj4gPiBC
ZWZvcmUgdGhpcyBjb21taXQnMDIwZGI5ZDNjMWRjMGEnIHhlbi9ldmVudHM6IEZpeCBpbnRlcnJ1
cHQgbG9zdAo+ID4gZHVyaW5nIGlycV9kaXNhYmxlIGFuZCBpcnFfZW5hYmxlIHN0YXJ0dXBfcGly
cSB3YXMgYXV0b21hdGljYWxseQo+ID4gY2FsbGVkIGR1cmluZyBpcnFfZW5hYmxlIGhvd2V2ZXIs
IGFmdGVyIHRoaXMgY29tbWl0IHBpcnEncyBkaWQgbm90Cj4gPiBnZXQgZXhwbGljaXRseSBzdGFy
dGVkIG9uY2UgcmVzdW1lZCBmcm9tIGhpYmVybmF0aW9uLgo+ID4KPiA+IGNoaXAtPmlycV9zdGFy
dHVwIGlzIGNhbGxlZCBvbmx5IGlmIElSUURfSVJRX1NUQVJURUQgaXMgdW5zZXQgZHVyaW5nCj4g
PiBpcnFfc3RhcnR1cCBvbiByZXN1bWUuIFRoaXMgZmxhZyBnZXRzIGNsZWFyZWQgYnkgZnJlZV9p
cnEtPmlycV9zaHV0ZG93bgo+ID4gZHVyaW5nIHN1c3BlbmQuIGZyZWVfaXJxKCkgbmV2ZXIgZ2V0
cyBleHBsaWNpdGx5IGNhbGxlZCBmb3IgaW9hcGljLWVkZ2UKPiA+IGFuZCBpb2FwaWMtbGV2ZWwg
aW50ZXJydXB0cyBhcyByZXNwZWN0aXZlIGRyaXZlcnMgZG8gbm90aGluZyBkdXJpbmcKPiA+IHN1
c3BlbmQvcmVzdW1lLiBTbyB3ZSBzaHV0IHRoZW0gZG93biBleHBsaWNpdGx5IGluIHRoZSBmaXJz
dCBwbGFjZSBpbgo+ID4gc3lzY29yZV9zdXNwZW5kIHBhdGggdG8gY2xlYXIgSVJRPD5ldmVudCBj
aGFubmVsIG1hcHBpbmcuIHNodXRkb3duX3BpcnEKPiA+IGJlaW5nIGNhbGxlZCBleHBsaWNpdGx5
IGR1cmluZyBzdXNwZW5kIGRvZXMgbm90IGNsZWFyIHRoaXMgZmxhZ3MsIGhlbmNlCj4gPiAuaXJx
X2VuYWJsZSBpcyBjYWxsZWQgaW4gaXJxX3N0YXJ0dXAgZHVyaW5nIHJlc3VtZSBpbnN0ZWFkIGFu
ZCBwaXJxJ3MKPiA+IG5ldmVyIHN0YXJ0IHVwLgo+IAo+IFdoYXQ/IAo+IAo+ID4gK3ZvaWQgaXJx
X3N0YXRlX2Nscl9zdGFydGVkKHN0cnVjdCBpcnFfZGVzYyAqZGVzYykKPiA+ICB7Cj4gPiAgCWly
cWRfY2xlYXIoJmRlc2MtPmlycV9kYXRhLCBJUlFEX0lSUV9TVEFSVEVEKTsKPiA+ICB9Cj4gPiAr
RVhQT1JUX1NZTUJPTF9HUEwoaXJxX3N0YXRlX2Nscl9zdGFydGVkKTsKPiAKPiBUaGlzIGlzIGNv
cmUgaW50ZXJuYWwgc3RhdGUgYW5kIG5vdCBzdXBwb3NlZCB0byBiZSBmaWRkbGVkIHdpdGggYnkK
PiBkcml2ZXJzLgo+IAo+IGlycV9jaGlwIGhhcyBpcnFfc3VzcGVuZC9yZXN1bWUvcG1fc2h1dGRv
d24gY2FsbGJhY2tzIGZvciBhIHJlYXNvbi4KPgpJIGFncmVlLCBhcyBpdHMgbWVudGlvbmVkIGlu
IHRoZSBwcmV2aW91cyBwYXRjaCB7W1JGQyBQQVRDSCBWMiAwOC8xMV19IHRoaXMgaXMgCm9uZSB3
YXkgb2YgZXhwbGljaXRseSBzaHV0dGluZyBkb3duIGxlZ2FjeSBkZXZpY2VzIHdpdGhvdXQgaW50
cm9kdWNpbmcgdG9vIG11Y2ggCmNvZGUgZm9yIGVhY2ggb2YgdGhlIGxlZ2FjeSBkZXZpY2VzLiAu
IGZvciBlZy4gaW4gY2FzZSBvZiBmbG9wcHkgdGhlcmUgCmlzIG5vIHN1c3BlbmQvZnJlZXplIGhh
bmRsZXIgd2hpY2ggc2hvdWxkIGhhdmUgZG9uZSB0aGUgbmVlZGZ1bC4KLgpFaXRoZXIgd2UgaW1w
bGVtZW50IHRoZW0gZm9yIGFsbCB0aGUgbGVnYWN5IGRldmljZXMgdGhhdCBoYXZlIHRoZW0gbWlz
c2luZyBvcgpleHBsaWNpdGx5IHNodXRkb3duIHBpcnFzLiBJIGhhdmUgY2hvb3NlbiBsYXRlciBm
b3Igc2ltcGxpY2l0eS4gSSB1bmRlcnN0YW5kCnRoYXQgaWRlYWxseSB3ZSBzaG91bGQgZW5hYmxl
L2Rpc2FibGUgZGV2aWNlcyBpbnRlcnJ1cHRzIGluIHN1c3BlbmQvcmVzdW1lIApkZXZpY2VzIGJ1
dCB0aGF0IHJlcXVpcmVzIGFkZGluZyBjb2RlIGZvciBkb2luZyB0aGF0IHRvIGZldyBkcml2ZXJz
W2FuZCBJIG1heQpub3Qga25vdyBhbGwgb2YgdGhlbSBlaXRoZXJdCgpOb3cgSSBkaXNjb3ZlcmVk
IGR1cmluZyB0aGUgZmxvdyBpbiBoaWJlcm5hdGlvbl9wbGF0Zm9ybV9lbnRlciB1bmRlciByZXN1
bWUgCmRldmljZXMgdGhhdCBmb3Igc3VjaCBkZXZpY2VzIGlycV9zdGFydHVwIGlzIGNhbGxlZCB3
aGljaCBjaGVja3MgZm9yIApJUlFEX0lSUV9TVEFSVEVEIGZsYWcgYW5kIGJhc2VkIG9uIHRoYXQg
aXQgY2FsbHMgaXJxX2VuYWJsZSBvciBpcnFfc3RhcnR1cC4KVGhleSBhcmUgb25seSByZXN0YXJ0
ZWQgaWYgdGhlIGZsYWcgaXMgbm90IHNldCB3aGljaCBpcyBjbGVhcmVkIGR1cmluZyBzaHV0ZG93
bi4gCnNodXRkb3duX3BpcnEgZG9lcyBub3QgZG8gdGhhdC4gT25seSBtYXNraW5nL3VubWFza2lu
ZyBvZiBldnRjaG4gZG9lcyBub3Qgd29yayAKYXMgcGlycSBuZWVkcyB0byBiZSByZXN0YXJ0ZWQu
Cnhlbi1waXJxLmVuYWJsZV9pcnEgaXMgY2FsbGVkIHJhdGhlciB0aGFuIHN0cmF0dXBfcGlycS4g
T24gcmVzdW1lIGlmIHRoZXNlIHBpcnFzCmFyZSBub3QgcmVzdGFydGVkIGluIHRoaXMgY2FzZSBB
Q1BJIFNDSSBpbnRlcnJ1cHRzLCBJIGRvIG5vdCBzZWUgcmVjZWl2aW5nIAphbnkgaW50ZXJydXB0
cyB1bmRlciBjYXQgL3Byb2MvaW50ZXJydXB0cyBldmVuIHRob3VnaCBob3N0IGtlZXBzIGdlbmVy
YXRpbmcgClM0IEFDUEkgZXZlbnRzLiAKRG9lcyB0aGF0IG1ha2VzIHNlbnNlPwoKVGhhbmtzLApB
bmNoYWwKPiBUaGFua3MsCj4gCj4gICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
