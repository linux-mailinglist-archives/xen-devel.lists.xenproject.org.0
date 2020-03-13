Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B6184D8E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 18:25:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCo0Q-0007la-Ur; Fri, 13 Mar 2020 17:21:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYyZ=46=amazon.com=prvs=334600f4a=anchalag@srs-us1.protection.inumbo.net>)
 id 1jCo0O-0007lV-PA
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 17:21:52 +0000
X-Inumbo-ID: 20bcd661-654f-11ea-b35c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20bcd661-654f-11ea-b35c-12813bfff9fa;
 Fri, 13 Mar 2020 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1584120112; x=1615656112;
 h=date:from:to:cc:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to:subject;
 bh=bTuPsH7AF4MczqLCOh4ZEWM4t7cj+3gohQ8SR0U6ZXw=;
 b=jmMDqFmzm+9YbQBvvRNiBZyu7RwggOAuhrmoh+aZWV0rXlndnI5aMUfl
 +n/csb4gO+gAR45HAG9h836XaPznUFmUwRTcqOcH4jrWweGQPsSqu8c2/
 ryrA45btubCNtL2ALgh7MzoBYkme4oULhm8eTDwqGPikxenntFIS9jhvN U=;
IronPort-SDR: JW0cZ6rA9C70JpjTu+PtridNwuuUyQx4+YAlmckpbYjwnpZvKgcj3PB0wM5zdrP6sQS5NG8AAW
 DPJzO9ciY+lw==
X-IronPort-AV: E=Sophos;i="5.70,549,1574121600"; d="scan'208";a="31080865"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Mar 2020 17:21:48 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6BED5A24C5; Fri, 13 Mar 2020 17:21:41 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Mar 2020 17:21:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 17:21:25 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 13 Mar 2020 17:21:24 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 9ECD140348; Fri, 13 Mar 2020 17:21:24 +0000 (UTC)
Date: Fri, 13 Mar 2020 17:21:24 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200313172124.GB8513@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200221142445.GZ4679@Air-de-Roger>
 <20200306184033.GA25358@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200309095245.GY24458@Air-de-Roger.citrite.net>
 <FA688A68-5372-4757-B075-A69A45671CB9@amazon.com>
 <20200312090435.GK24449@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312090435.GK24449@Air-de-Roger.citrite.net>
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
 sblbir@amazon.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 anchalag@amazon.com, bp@alien8.de, boris.ostrovsky@oracle.com, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMTA6MDQ6MzVBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9m
IHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLgo+IAo+IAo+IAo+IE9uIFdlZCwgTWFyIDExLCAyMDIwIGF0IDEwOjI1OjE1UE0gKzAw
MDAsIEFnYXJ3YWwsIEFuY2hhbCB3cm90ZToKPiA+IEhpIFJvZ2VyLAo+ID4gSSBhbSB0cnlpbmcg
dG8gdW5kZXJzdGFuZCB5b3VyIGNvbW1lbnRzIG9uIGluZGlyZWN0IGRlc2NyaXB0b3JzIHNwZWNp
YWxseSB3aXRob3V0IHBvbGx1dGluZyB0aGUgbWFpbGluZyBsaXN0IGhlbmNlIGVtYWlsaW5nIHlv
dSBwZXJzb25hbGx5Lgo+IAo+IElNTyBpdCdzIGJldHRlciB0byBzZW5kIHRvIHRoZSBtYWlsaW5n
IGxpc3QuIFRoZSBpc3N1ZXMgb3IgcXVlc3Rpb25zCj4geW91IGhhdmUgYWJvdXQgaW5kaXJlY3Qg
ZGVzY3JpcHRvcnMgY2FuIGJlIGhlbHBmdWwgdG8gb3RoZXJzIGluIHRoZQo+IGZ1dHVyZS4gSWYg
dGhlcmUncyBubyBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gcGxlYXNlIHNlbmQgdG8gdGhlCj4g
bGlzdCBuZXh0IHRpbWUuCj4gCj4gRmVlbCBmcmVlIHRvIGZvcndhcmQgdGhpcyByZXBseSB0byB0
aGUgbGlzdCBhbHNvLgo+ClN1cmUgbm8gcHJvYmxlbSBhdCBhbGwuCj4gPiBIb3BlIHRoYXQncyBv
ayBieSB5b3UuICBQbGVhc2Ugc2VlIG15IHJlc3BvbnNlIGlubGluZS4KPiA+Cj4gPiAgICAgT24g
RnJpLCBNYXIgMDYsIDIwMjAgYXQgMDY6NDA6MzNQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwgd3Jv
dGU6Cj4gPiAgICAgPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAwMzoyNDo0NVBNICswMTAwLCBS
b2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gICAgID4gPiBPbiBGcmksIEZlYiAxNCwgMjAyMCBh
dCAxMToyNTozNFBNICswMDAwLCBBbmNoYWwgQWdhcndhbCB3cm90ZToKPiA+ICAgICA+ID4gPiAg
IGJsa2Zyb250X2dhdGhlcl9iYWNrZW5kX2ZlYXR1cmVzKGluZm8pOwo+ID4gICAgID4gPiA+ICAg
LyogUmVzZXQgbGltaXRzIGNoYW5nZWQgYnkgYmxrX21xX3VwZGF0ZV9ucl9od19xdWV1ZXMoKS4g
Ki8KPiA+ICAgICA+ID4gPiAgIGJsa2lmX3NldF9xdWV1ZV9saW1pdHMoaW5mbyk7Cj4gPiAgICAg
PiA+ID4gQEAgLTIwNDYsNiArMjA2Myw5IEBAIHN0YXRpYyBpbnQgYmxraWZfcmVjb3ZlcihzdHJ1
Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKPiA+ICAgICA+ID4gPiAgICAgICAgICAga2lja19wZW5k
aW5nX3JlcXVlc3RfcXVldWVzKHJpbmZvKTsKPiA+ICAgICA+ID4gPiAgIH0KPiA+ICAgICA+ID4g
Pgo+ID4gICAgID4gPiA+ICsgaWYgKGZyb3plbikKPiA+ICAgICA+ID4gPiArICAgICAgICAgcmV0
dXJuIDA7Cj4gPiAgICAgPiA+Cj4gPiAgICAgPiA+IEkgaGF2ZSB0byBhZG1pdCBteSBtZW1vcnkg
aXMgZnV6enkgaGVyZSwgYnV0IGRvbid0IHlvdSBuZWVkIHRvCj4gPiAgICAgPiA+IHJlLXF1ZXVl
IHJlcXVlc3RzIGluIGNhc2UgdGhlIGJhY2tlbmQgaGFzIGRpZmZlcmVudCBsaW1pdHMgb2YgaW5k
aXJlY3QKPiA+ICAgICA+ID4gZGVzY3JpcHRvcnMgcGVyIHJlcXVlc3QgZm9yIGV4YW1wbGU/Cj4g
PiAgICAgPiA+Cj4gPiAgICAgPiA+IE9yIGRvIHdlIGV4cGVjdCB0aGF0IHRoZSBmcm9udGVuZCBp
cyBhbHdheXMgZ29pbmcgdG8gYmUgcmVzdW1lZCBvbiB0aGUKPiA+ICAgICA+ID4gc2FtZSBiYWNr
ZW5kLCBhbmQgdGh1cyBmZWF0dXJlcyB3b24ndCBjaGFuZ2U/Cj4gPiAgICAgPiA+Cj4gPiAgICAg
PiBTbyB0byB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24gYmV0dGVyIGhlcmUsIEFGQUlVIHRoZSAg
bWF4aW11bSBudW1iZXIgb2YgaW5kaXJlY3QKPiA+ICAgICA+IGdyZWZzIGlzIGZpeGVkIGJ5IHRo
ZSBiYWNrZW5kLCBidXQgdGhlIGZyb250ZW5kIGNhbiBpc3N1ZSByZXF1ZXN0cyB3aXRoIGFueQo+
ID4gICAgID4gbnVtYmVyIG9mIGluZGlyZWN0IHNlZ21lbnRzIGFzIGxvbmcgYXMgaXQncyBsZXNz
IHRoYW4gdGhlIG51bWJlciBwcm92aWRlZCBieQo+ID4gICAgID4gdGhlIGJhY2tlbmQuIFNvIGJ5
IHlvdXIgcXVlc3Rpb24geW91IG1lYW4gdGhpcyBtYXggbnVtYmVyIG9mIE1BWF9JTkRJUkVDVF9T
RUdNRU5UUwo+ID4gICAgID4gMjU2IG9uIGJhY2tlbmQgY2FuIGNoYW5nZSA/Cj4gPgo+ID4gICAg
IFllcywgbnVtYmVyIG9mIGluZGlyZWN0IGRlc2NyaXB0b3JzIHN1cHBvcnRlZCBieSB0aGUgYmFj
a2VuZCBjYW4KPiA+ICAgICBjaGFuZ2UsIGJlY2F1c2UgeW91IG1vdmVkIHRvIGEgZGlmZmVyZW50
IGJhY2tlbmQsIG9yIGJlY2F1c2UgdGhlCj4gPiAgICAgbWF4aW11bSBzdXBwb3J0ZWQgYnkgdGhl
IGJhY2tlbmQgaGFzIGNoYW5nZWQuIEl0J3MgYWxzbyBwb3NzaWJsZSB0bwo+ID4gICAgIHJlc3Vt
ZSBvbiBhIGJhY2tlbmQgdGhhdCBoYXMgbm8gaW5kaXJlY3QgZGVzY3JpcHRvcnMgc3VwcG9ydCBh
dCBhbGwuCj4gPgo+ID4gQUZBSVUsIHRoZSBjb2RlIGZvciByZXF1ZXVpbmcgdGhlIHJlcXVlc3Rz
IGlzIG9ubHkgZm9yIHhlbiBzdXNwZW5kL3Jlc3VtZS4gVGhlc2UgcmVxdWVzdCBpbiB0aGUgcXVl
dWUgYXJlCj4gPiBzYW1lIHRoYXQgZ2V0cyBhZGRlZCB0byBxdWV1ZWxpc3QgaW4gYmxrZnJvbnRf
cmVzdW1lLiBBbHNvLCBldmVuIGlmIGluZGlyZWN0IGRlc2NyaXB0b3JzIGNoYW5nZSBvbiByZXN1
bWUsCj4gPiB0aGV5IGp1c3QgbmVlZCB0byBiZSBicm9hZGNhc3RlZCB0byBmcm9udGVuZCBhbmQg
d2hpY2ggbWVhbnMgd2UgY291bGQganVzdCBtZWFuIHRoYXQgYSByZXF1ZXN0IGNhbiBwcm9jZXNz
Cj4gPiBtb3JlIGRhdGEuCj4gCj4gT3IgbGVzcyBkYXRhLiBZb3UgY291bGQgbGVnaXRpbWF0ZWx5
IG1pZ3JhdGUgZnJvbSBhIGhvc3QgdGhhdCBoYXMKPiBpbmRpcmVjdCBkZXNjcmlwdG9ycyB0byBv
bmUgd2l0aG91dCwgaW4gd2hpY2ggY2FzZSByZXF1ZXN0cyB3b3VsZCBuZWVkCj4gdG8gYmUgc21h
bGxlciB0byBmaXQgdGhlIHJpbmcgc2xvdHMuCj4gCj4gPiBXZSBkbyBzZXR1cCBpbmRpcmVjdCBk
ZXNjcmlwdG9ycyBvbiBmcm9udCBlbmQgb24gYmxraWZfcmVjb3ZlciBiZWZvcmUgcmV0dXJuaW5n
IGFuZCBxdWV1ZSBsaW1pdHMgYXJlCj4gPiBzZXR1cCBhY2NvcmRpbmdseS4KPiA+IEFtIEkgbWlz
c2luZyBhbnl0aGluZyBoZXJlPwo+IAo+IENhbGxpbmcgYmxraWZfcmVjb3ZlciBzaG91bGQgdGFr
ZSBjYXJlIG9mIGl0IEFGQUlDVC4gQXMgaXQgcmVzZXRzIHRoZQo+IHF1ZXVlIGxpbWl0cyBhY2Nv
cmRpbmcgdG8gdGhlIGRhdGEgYW5ub3VuY2VkIG9uIHhlbnN0b3JlLgo+IAo+IEkgdGhpbmsgSSBn
b3QgY29uZnVzZWQsIHVzaW5nIGJsa2lmX3JlY292ZXIgc2hvdWxkIGJlIGZpbmUsIHNvcnJ5Lgo+
IApPay4gVGhhbmtzIGZvciBjb25maXJtaW5nLiBJIHdpbGwgZml4dXAgb3RoZXIgc3VnZ2VzdGlv
bnMgaW4gdGhlIHBhdGNoIGFuZCBzZW5kCm91dCBhIHY0Lgo+ID4KPiA+ICAgICA+ID4gPiBAQCAt
MjYyNSw2ICsyNjcxLDYyIEBAIHN0YXRpYyB2b2lkIGJsa2lmX3JlbGVhc2Uoc3RydWN0IGdlbmRp
c2sgKmRpc2ssIGZtb2RlX3QgbW9kZSkKPiA+ICAgICA+ID4gPiAgIG11dGV4X3VubG9jaygmYmxr
ZnJvbnRfbXV0ZXgpOwo+ID4gICAgID4gPiA+ICB9Cj4gPiAgICAgPiA+ID4KPiA+ICAgICA+ID4g
PiArc3RhdGljIGludCBibGtmcm9udF9mcmVlemUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikK
PiA+ICAgICA+ID4gPiArewo+ID4gICAgID4gPiA+ICsgdW5zaWduZWQgaW50IGk7Cj4gPiAgICAg
PiA+ID4gKyBzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2
LT5kZXYpOwo+ID4gICAgID4gPiA+ICsgc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm87
Cj4gPiAgICAgPiA+ID4gKyAvKiBUaGlzIHdvdWxkIGJlIHJlYXNvbmFibGUgdGltZW91dCBhcyB1
c2VkIGluIHhlbmJ1c19kZXZfc2h1dGRvd24oKSAqLwo+ID4gICAgID4gPiA+ICsgdW5zaWduZWQg
aW50IHRpbWVvdXQgPSA1ICogSFo7Cj4gPiAgICAgPiA+ID4gKyBpbnQgZXJyID0gMDsKPiA+ICAg
ICA+ID4gPiArCj4gPiAgICAgPiA+ID4gKyBpbmZvLT5jb25uZWN0ZWQgPSBCTEtJRl9TVEFURV9G
UkVFWklORzsKPiA+ICAgICA+ID4gPiArCj4gPiAgICAgPiA+ID4gKyBibGtfbXFfZnJlZXplX3F1
ZXVlKGluZm8tPnJxKTsKPiA+ICAgICA+ID4gPiArIGJsa19tcV9xdWllc2NlX3F1ZXVlKGluZm8t
PnJxKTsKPiA+ICAgICA+ID4KPiA+ICAgICA+ID4gRG9uJ3QgeW91IG5lZWQgdG8gYWxzbyBkcmFp
biB0aGUgcXVldWUgYW5kIG1ha2Ugc3VyZSBpdCdzIGVtcHR5Pwo+ID4gICAgID4gPgo+ID4gICAg
ID4gYmxrX21xX2ZyZWV6ZV9xdWV1ZSBhbmQgYmxrX21xX3F1aWVzY2VfcXVldWUgc2hvdWxkIHRh
a2UgY2FyZSBvZiBydW5uaW5nIEhXIHF1ZXVlcyBzeW5jaHJvbm91c2x5Cj4gPiAgICAgPiBhbmQg
bWFraW5nIHN1cmUgYWxsIHRoZSBvbmdvaW5nIGRpc3BhdGNoZXMgaGF2ZSBmaW5pc2hlZC4gRGlk
IEkgdW5kZXJzdGFuZCB5b3VyIHF1ZXN0aW9uIHJpZ2h0Pwo+ID4KPiA+ICAgICBDYW4geW91IHBs
ZWFzZSBhZGQgc29tZSBjaGVjayB0byB0aGF0IGVuZD8gKGllOiB0aGF0IHRoZXJlIGFyZSBubwo+
ID4gICAgIHBlbmRpbmcgcmVxdWVzdHMgb24gYW55IHF1ZXVlPykKPiA+Cj4gPiBXZWxsIGEgY2hl
Y2sgdG8gc2VlIGlmIHRoZXJlIGFyZSBhbnkgdW5jb25zdW1lZCByZXNwb25zZXMgY291bGQgYmUg
ZG9uZS4KPiA+IEkgaGF2ZW4ndCBjb21lIGFjcm9zcyB1c2UgY2FzZSBpbiBteSB0ZXN0aW5nIHdo
ZXJlIHRoaXMgZmFpbGVkIGJ1dCBtYXliZSB0aGVyZSBhcmUgb3RoZXIKPiA+IHNldHVwcyB0aGF0
IG1heSBjYXVzZSBpc3N1ZSBoZXJlLgo+IAo+IFRoYW5rcyEgSXQncyBtb3N0bHkgdG8gYmUgb24g
dGhlIHNhZmUgc2lkZSBpZiB3ZSBleHBlY3QgdGhlIHF1ZXVlcyBhbmQKPiByaW5ncyB0byBiZSBm
dWxseSBkcmFpbmVkLgo+IApBQ0suCj4gUm9nZXIuClRoYW5rcywKQW5jaGFsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
