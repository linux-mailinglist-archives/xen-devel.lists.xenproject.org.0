Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A0164D53
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 19:08:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TiJ-0004RD-8s; Wed, 19 Feb 2020 18:04:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4hFX=4H=amazon.com=prvs=311daad46=anchalag@srs-us1.protection.inumbo.net>)
 id 1j4TiH-0004R3-Pj
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 18:04:45 +0000
X-Inumbo-ID: 4ed27808-5342-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ed27808-5342-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582135486; x=1613671486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3Zqh9Z5ArCKT5eh3kytqNR+atJTyGLoFKV/QsPjClkg=;
 b=lH2rupTOJymR4WSs4/i0nFmQigGTmc6GRkYVw5DAKnIk6l4GcXptV573
 a96BpskBq+8VNmUSvmAV1r5W6TlIzf0i7B+nXYyhdZotcDUwKqPTa1T8L
 LKFN4UmxZIitM8IEtaBg4Y6VFGmaQFWXJaGISeT8UTqcO2xbwrJGhr4aC g=;
IronPort-SDR: SWoQO1RFkW7rgd2CL4S62O3VarDPqWQrz58ohCj8J+VHKH9cgFWDywhjXDZn2lMphuLg99bCok
 LxZKOSkF49jw==
X-IronPort-AV: E=Sophos;i="5.70,461,1574121600"; d="scan'208";a="27530192"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Feb 2020 18:04:42 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 170F4A268C; Wed, 19 Feb 2020 18:04:40 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 19 Feb 2020 18:04:25 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 19 Feb 2020 18:04:25 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 19 Feb 2020 18:04:24 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id DFEB5403C0; Wed, 19 Feb 2020 18:04:24 +0000 (UTC)
Date: Wed, 19 Feb 2020 18:04:24 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>,
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <axboe@kernel.dk>,
 <davem@davemloft.net>, <rjw@rjwysocki.net>, <len.brown@intel.com>,
 <pavel@ucw.cz>, <peterz@infradead.org>, <eduval@amazon.com>,
 <sblbir@amazon.com>, <anchalag@amazon.com>, <xen-devel@lists.xenproject.org>, 
 <vkuznets@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>, <fllinden@amaozn.com>,
 <benh@kernel.crashing.org>
Message-ID: <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200217100509.GE4679@Air-de-Roger>
 <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200218091611.GN4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218091611.GN4679@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, tglx@linutronix.de, sstabellini@kernel.org, fllinden@amaozn.com,
 kamatam@amazon.com, mingo@redhat.com, xen-devel@lists.xenproject.org,
 sblbir@amazon.com, axboe@kernel.dk, konrad.wilk@oracle.com, bp@alien8.de,
 boris.ostrovsky@oracle.com, jgross@suse.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6MTY6MTFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMTowNTo1M1BNICswMDAwLCBBbmNo
YWwgQWdhcndhbCB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDExOjA1OjA5QU0g
KzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIw
IGF0IDExOjI1OjM0UE0gKzAwMDAsIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOgo+ID4gPiA+IEZyb206
IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6b24uY29tCj4gPiA+ID4gCj4gPiA+ID4gQWRk
IGZyZWV6ZSwgdGhhdyBhbmQgcmVzdG9yZSBjYWxsYmFja3MgZm9yIFBNIHN1c3BlbmQgYW5kIGhp
YmVybmF0aW9uCj4gPiA+ID4gc3VwcG9ydC4gQWxsIGZyb250ZW5kIGRyaXZlcnMgdGhhdCBuZWVk
cyB0byB1c2UgUE1fSElCRVJOQVRJT04vUE1fU1VTUEVORAo+ID4gPiA+IGV2ZW50cywgbmVlZCB0
byBpbXBsZW1lbnQgdGhlc2UgeGVuYnVzX2RyaXZlciBjYWxsYmFja3MuCj4gPiA+ID4gVGhlIGZy
ZWV6ZSBoYW5kbGVyIHN0b3BzIGEgYmxvY2stbGF5ZXIgcXVldWUgYW5kIGRpc2Nvbm5lY3QgdGhl
Cj4gPiA+ID4gZnJvbnRlbmQgZnJvbSB0aGUgYmFja2VuZCB3aGlsZSBmcmVlaW5nIHJpbmdfaW5m
byBhbmQgYXNzb2NpYXRlZCByZXNvdXJjZXMuCj4gPiA+ID4gVGhlIHJlc3RvcmUgaGFuZGxlciBy
ZS1hbGxvY2F0ZXMgcmluZ19pbmZvIGFuZCByZS1jb25uZWN0IHRvIHRoZQo+ID4gPiA+IGJhY2tl
bmQsIHNvIHRoZSByZXN0IG9mIHRoZSBrZXJuZWwgY2FuIGNvbnRpbnVlIHRvIHVzZSB0aGUgYmxv
Y2sgZGV2aWNlCj4gPiA+ID4gdHJhbnNwYXJlbnRseS4gQWxzbywgdGhlIGhhbmRsZXJzIGFyZSB1
c2VkIGZvciBib3RoIFBNIHN1c3BlbmQgYW5kCj4gPiA+ID4gaGliZXJuYXRpb24gc28gdGhhdCB3
ZSBjYW4ga2VlcCB0aGUgZXhpc3Rpbmcgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzIGZvcgo+ID4g
PiA+IFhlbiBzdXNwZW5kIHdpdGhvdXQgbW9kaWZpY2F0aW9uLiBCZWZvcmUgZGlzY29ubmVjdGlu
ZyBmcm9tIGJhY2tlbmQsCj4gPiA+ID4gd2UgbmVlZCB0byBwcmV2ZW50IGFueSBuZXcgSU8gZnJv
bSBiZWluZyBxdWV1ZWQgYW5kIHdhaXQgZm9yIGV4aXN0aW5nCj4gPiA+ID4gSU8gdG8gY29tcGxl
dGUuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tIFhlbiAoeGVuc3RvcmUpIGlu
aXRpYXRlZCBzdXNwZW5zaW9uLCBhcyBpbiB0aGF0Cj4gPiA+IGNhc2UgTGludXggZG9lc24ndCBm
bHVzaCB0aGUgcmluZ3Mgb3IgZGlzY29ubmVjdHMgZnJvbSB0aGUgYmFja2VuZC4KPiA+IFllcywg
QUZBSUsgaW4geGVuIGluaXRpYXRlZCBzdXNwZW5zaW9uIGJhY2tlbmQgdGFrZXMgY2FyZSBvZiBp
dC4gCj4gCj4gTm8sIGluIFhlbiBpbml0aWF0ZWQgc3VzcGVuc2lvbiBiYWNrZW5kIGRvZXNuJ3Qg
dGFrZSBjYXJlIG9mIGZsdXNoaW5nCj4gdGhlIHJpbmdzLCB0aGUgZnJvbnRlbmQgaGFzIGEgc2hh
ZG93IGNvcHkgb2YgdGhlIHJpbmcgY29udGVudHMgYW5kIGl0Cj4gcmUtaXNzdWVzIHRoZSByZXF1
ZXN0cyBvbiByZXN1bWUuCj4gClllcywgSSBtZWFudCBzdXNwZW5zaW9uIGluIGdlbmVyYWwgd2hl
cmUgYm90aCB4ZW5zdG9yZSBhbmQgYmFja2VuZCBrbm93cwpzeXN0ZW0gaXMgZ29pbmcgdW5kZXIg
c3VzcGVuc2lvbiBhbmQgbm90IGZsdXNoaW5nIG9mIHJpbmdzLiBUaGF0IGhhcHBlbnMKaW4gZnJv
bnRlbmQgd2hlbiBiYWNrZW5kIGluZGljYXRlcyB0aGF0IHN0YXRlIGlzIGNsb3NpbmcgYW5kIHNv
IG9uLgpJIG1heSBoYXZlIHdyaXR0ZW4gaXQgaW4gd3JvbmcgY29udGV4dC4KPiA+ID4gPiArc3Rh
dGljIGludCBibGtmcm9udF9mcmVlemUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKPiA+ID4g
PiArewo+ID4gPiA+ICsJdW5zaWduZWQgaW50IGk7Cj4gPiA+ID4gKwlzdHJ1Y3QgYmxrZnJvbnRf
aW5mbyAqaW5mbyA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOwo+ID4gPiA+ICsJc3RydWN0
IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm87Cj4gPiA+ID4gKwkvKiBUaGlzIHdvdWxkIGJlIHJl
YXNvbmFibGUgdGltZW91dCBhcyB1c2VkIGluIHhlbmJ1c19kZXZfc2h1dGRvd24oKSAqLwo+ID4g
PiA+ICsJdW5zaWduZWQgaW50IHRpbWVvdXQgPSA1ICogSFo7Cj4gPiA+ID4gKwlpbnQgZXJyID0g
MDsKPiA+ID4gPiArCj4gPiA+ID4gKwlpbmZvLT5jb25uZWN0ZWQgPSBCTEtJRl9TVEFURV9GUkVF
WklORzsKPiA+ID4gPiArCj4gPiA+ID4gKwlibGtfbXFfZnJlZXplX3F1ZXVlKGluZm8tPnJxKTsK
PiA+ID4gPiArCWJsa19tcV9xdWllc2NlX3F1ZXVlKGluZm8tPnJxKTsKPiA+ID4gPiArCj4gPiA+
ID4gKwlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnJfcmluZ3M7IGkrKykgewo+ID4gPiA+ICsJCXJp
bmZvID0gJmluZm8tPnJpbmZvW2ldOwo+ID4gPiA+ICsKPiA+ID4gPiArCQlnbnR0YWJfY2FuY2Vs
X2ZyZWVfY2FsbGJhY2soJnJpbmZvLT5jYWxsYmFjayk7Cj4gPiA+ID4gKwkJZmx1c2hfd29yaygm
cmluZm8tPndvcmspOwo+ID4gPiA+ICsJfQo+ID4gPiA+ICsKPiA+ID4gPiArCS8qIEtpY2sgdGhl
IGJhY2tlbmQgdG8gZGlzY29ubmVjdCAqLwo+ID4gPiA+ICsJeGVuYnVzX3N3aXRjaF9zdGF0ZShk
ZXYsIFhlbmJ1c1N0YXRlQ2xvc2luZyk7Cj4gPiA+IAo+ID4gPiBBcmUgeW91IHN1cmUgdGhpcyBp
cyBzYWZlPwo+ID4gPiAKPiA+IEluIG15IHRlc3RpbmcgcnVubmluZyBtdWx0aXBsZSBmaW8gam9i
cywgb3RoZXIgdGVzdCBzY2VuYXJpb3MgcnVubmluZwo+ID4gYSBtZW1vcnkgbG9hZGVyIHdvcmtz
IGZpbmUuIEkgZGlkIG5vdCBjYW1lIGFjcm9zcyBhIHNjZW5hcmlvIHRoYXQgd291bGQKPiA+IGhh
dmUgZmFpbGVkIHJlc3VtZSBkdWUgdG8gYmxrZnJvbnQgaXNzdWVzIHVubGVzcyB5b3UgY2FuIHN1
Z2VzdCBzb21lPwo+IAo+IEFGQUlDVCB5b3UgZG9uJ3Qgd2FpdCBmb3IgdGhlIGluLWZsaWdodCBy
ZXF1ZXN0cyB0byBiZSBmaW5pc2hlZCwgYW5kCj4ganVzdCByZWx5IG9uIGJsa2JhY2sgdG8gZmlu
aXNoIHByb2Nlc3NpbmcgdGhvc2UuIEknbSBub3Qgc3VyZSBhbGwKPiBibGtiYWNrIGltcGxlbWVu
dGF0aW9ucyBvdXQgdGhlcmUgY2FuIGd1YXJhbnRlZSB0aGF0Lgo+IAo+IFRoZSBhcHByb2FjaCB1
c2VkIGJ5IFhlbiBpbml0aWF0ZWQgc3VzcGVuc2lvbiBpcyB0byByZS1pc3N1ZSB0aGUKPiBpbi1m
bGlnaHQgcmVxdWVzdHMgd2hlbiByZXN1bWluZy4gSSBoYXZlIHRvIGFkbWl0IEkgZG9uJ3QgdGhp
bmsgdGhpcwo+IGlzIHRoZSBiZXN0IGFwcHJvYWNoLCBidXQgSSB3b3VsZCBsaWtlIHRvIGtlZXAg
Ym90aCB0aGUgWGVuIGFuZCB0aGUgUE0KPiBpbml0aWF0ZWQgc3VzcGVuc2lvbiB1c2luZyB0aGUg
c2FtZSBsb2dpYywgYW5kIGhlbmNlIEkgd291bGQgcmVxdWVzdAo+IHRoYXQgeW91IHRyeSB0byBy
ZS11c2UgdGhlIGV4aXN0aW5nIHJlc3VtZSBsb2dpYyAoYmxrZnJvbnRfcmVzdW1lKS4KPiAKPiA+
ID4gSSBkb24ndCB0aGluayB5b3Ugd2FpdCBmb3IgYWxsIHJlcXVlc3RzIHBlbmRpbmcgb24gdGhl
IHJpbmcgdG8gYmUKPiA+ID4gZmluaXNoZWQgYnkgdGhlIGJhY2tlbmQsIGFuZCBoZW5jZSB5b3Ug
bWlnaHQgbG9vc2UgcmVxdWVzdHMgYXMgdGhlCj4gPiA+IG9uZXMgb24gdGhlIHJpbmcgd291bGQg
bm90IGJlIHJlLWlzc3VlZCBieSBibGtmcm9udF9yZXN0b3JlIEFGQUlDVC4KPiA+ID4gCj4gPiBB
RkFJVSwgYmxrX21xX2ZyZWV6ZV9xdWV1ZS9ibGtfbXFfcXVpZXNjZV9xdWV1ZSBzaG91bGQgdGFr
ZSBjYXJlIG9mIG5vIHVzZWQKPiA+IHJlcXVlc3Qgb24gdGhlIHNoYXJlZCByaW5nLiBBbHNvLCB3
ZSBJIHdhbnQgdG8gcGF1c2UgdGhlIHF1ZXVlIGFuZCBmbHVzaCBhbGwKPiA+IHRoZSBwZW5kaW5n
IHJlcXVlc3RzIGluIHRoZSBzaGFyZWQgcmluZyBiZWZvcmUgZGlzY29ubmVjdGluZyBmcm9tIGJh
Y2tlbmQuCj4gCj4gT2gsIHNvIGJsa19tcV9mcmVlemVfcXVldWUgZG9lcyB3YWl0IGZvciBpbi1m
bGlnaHQgcmVxdWVzdHMgdG8gYmUKPiBmaW5pc2hlZC4gSSBndWVzcyBpdCdzIGZpbmUgdGhlbi4K
PiAKT2suCj4gPiBRdWllc2NpbmcgdGhlIHF1ZXVlIHNlZW1lZCBhIGJldHRlciBvcHRpb24gaGVy
ZSBhcyB3ZSB3YW50IHRvIG1ha2Ugc3VyZSBvbmdvaW5nCj4gPiByZXF1ZXN0cyBkaXNwYXRjaGVz
IGFyZSB0b3RhbGx5IGRyYWluZWQuCj4gPiBJIHNob3VsZCBhY2NlcHQgdGhhdCBzb21lIG9mIHRo
ZXNlIG5vdGlvbiBpcyBib3Jyb3dlZCBmcm9tIGhvdyBudm1lIGZyZWV6ZS91bmZyZWV6ZSAKPiA+
IGlzIGRvbmUgYWx0aG91Z2ggaXRzIG5vdCBhcHBsZSB0byBhcHBsZSBjb21wYXJpc29uLgo+IAo+
IFRoYXQncyBmaW5lLCBidXQgSSB3b3VsZCBzdGlsbCBsaWtlIHRvIHJlcXVlc3RzIHRoYXQgeW91
IHVzZSB0aGUgc2FtZQo+IGxvZ2ljIChhcyBtdWNoIGFzIHBvc3NpYmxlKSBmb3IgYm90aCB0aGUg
WGVuIGFuZCB0aGUgUE0gaW5pdGlhdGVkCj4gc3VzcGVuc2lvbi4KPiAKPiBTbyB5b3UgZWl0aGVy
IGFwcGx5IHRoaXMgZnJlZXplL3VuZnJlZXplIHRvIHRoZSBYZW4gc3VzcGVuc2lvbiAoYW5kCj4g
ZHJvcCB0aGUgcmUtaXNzdWluZyBvZiByZXF1ZXN0cyBvbiByZXN1bWUpIG9yIGFkYXB0IHRoZSBz
YW1lIGFwcHJvYWNoCj4gYXMgdGhlIFhlbiBpbml0aWF0ZWQgc3VzcGVuc2lvbi4gS2VlcGluZyB0
d28gY29tcGxldGVseSBkaWZmZXJlbnQKPiBhcHByb2FjaGVzIHRvIHN1c3BlbnNpb24gLyByZXN1
bWUgb24gYmxrZnJvbnQgaXMgbm90IHN1aXRhYmxlIGxvbmcKPiB0ZXJtLgo+IApJIGFncmVlIHdp
dGggeW91IG9uIG92ZXJoYXVsIG9mIHhlbiBzdXNwZW5kL3Jlc3VtZSB3cnQgYmxrZnJvbnQgaXMg
YSBnb29kCmlkZWEgaG93ZXZlciwgSU1PIHRoYXQgaXMgYSB3b3JrIGZvciBmdXR1cmUgYW5kIHRo
aXMgcGF0Y2ggc2VyaWVzIHNob3VsZCAKbm90IGJlIGJsb2NrZWQgZm9yIGl0LiBXaGF0IGRvIHlv
dSB0aGluaz8KPiBUaGFua3MsIFJvZ2VyLgo+IApUaGFua3MsCkFuY2hhbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
