Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7816C0E9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:36:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZQG-00032B-RK; Tue, 25 Feb 2020 12:34:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6ZQF-000325-I7
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:34:47 +0000
X-Inumbo-ID: 34ca9cfa-57cb-11ea-92ea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34ca9cfa-57cb-11ea-92ea-12813bfff9fa;
 Tue, 25 Feb 2020 12:34:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BE8CDAE48;
 Tue, 25 Feb 2020 12:34:45 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-7-dwmw2@infradead.org>
 <3821a29a-7d60-c18b-71dd-12ed3c5b708d@suse.com>
 <519b73bb-2db3-75e4-db81-3781c462290e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44f074ee-b47c-0c20-02d8-8bee1557e503@suse.com>
Date: Tue, 25 Feb 2020 13:34:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <519b73bb-2db3-75e4-db81-3781c462290e@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/8] x86/setup: simplify handling of
 initrdidx when no initrd present
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxNDozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIxLzAyLzIwMjAg
MTY6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMS4wMi4yMDIwIDAxOjMzLCBEYXZpZCBX
b29kaG91c2Ugd3JvdGU6Cj4+PiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNv
LnVrPgo+Pj4KPj4+IFJlbW92ZSBhIHRlcm5hcnkgb3BlcmF0b3IgdGhhdCBtYWRlIG15IGJyYWlu
IGh1cnQuCj4+Cj4+IFBlcnNvbmFsbHkgSSdkIHByZWZlciB0aGUgY29kZSB0byBzdGF5IGFzIGlz
LCBidXQgaWYgQW5kcmV3IGFncmVlcwo+PiB3aXRoIHRoaXMgYmVpbmcgYW4gaW1wcm92ZW1lbnQs
IHRoZW4gSSBhbHNvIHdvdWxkbid0IHdhbnQgdG8gc3RhbmQKPj4gaW4gdGhlIHdheS4gSWYgaXQg
aXMgdG8gZ28gaW4gSSBoYXZlIGEgZmV3IHNtYWxsIGFkanVzdG1lbnQgcmVxdWVzdHM6Cj4+Cj4+
PiBSZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIHNpbXBsZXIgdGhhdCBtYWtlcyBpdCBzb21ld2hh
dCBjbGVhcmVyIHRoYXQKPj4+IHRoZSBjaGVjayBmb3IgaW5pdHJkaWR4IDwgbWJpLT5tb2RzX2Nv
dW50IGlzIGJlY2F1c2UgbWJpLT5tb2RzX2NvdW50Cj4+PiBpcyB3aGF0IGZpbmRfZmlyc3RfYml0
KCkgd2lsbCByZXR1cm4gd2hlbiBpdCBkb2Vzbid0IGZpbmQgYW55dGhpbmcuCj4+Cj4+IEVzcGVj
aWFsbHkgaW4gbGlnaHQgb2YgdGhlIHJlY2VudCBYU0EtMzA3IEknZCBsaWtlIHRvIGFzayB0aGF0
IHdlCj4+IGF2b2lkIGltcHJlY2lzZSBzdGF0ZW1lbnRzIGxpa2UgdGhpczogQWZhaWN0IGZpbmRf
Zmlyc3RfYml0KCkgbWF5Cj4+IGFsc28gdmFsaWRseSByZXR1cm4gYW55IHZhbHVlIGxhcmdlciB0
aGFuIHRoZSBwYXNzZWQgaW4gYml0bWFwCj4+IGxlbmd0aC4KPiAKPiBJcyBpdD8gSSB0aG91Z2gg
dGhhdCBhbGwgdGhlIGNhbGxlcnMgYXJlIG5vdyByZXR1cm5pbmcgJ3NpemUnIGluIGFsbCB0aGUg
Cj4gZXJyb3IgY2FzZXMuCgpUYWtpbmcgKHBhcnQgb2YpIHRoZSB4ODYgZXhhbXBsZToKCj4jZGVm
aW5lIGZpbmRfbmV4dF9iaXQoYWRkciwgc2l6ZSwgb2ZmKSAoeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICAgIHVuc2lnbmVkIGludCByX187ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICBjb25zdCB1bnNpZ25l
ZCBsb25nICphX18gPSAoYWRkcik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gICAgdW5zaWduZWQgaW50IHNfXyA9IChzaXplKTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgIHVuc2lnbmVkIGludCBvX18gPSAob2ZmKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICBpZiAo
IG9fXyA+PSBzX18gKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgIHJfXyA9IHNfXzsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAoKVGhpcyBpcyB3aGF0IGRpZCBnZXQg
YWRqdXN0ZWQsIGd1YXJhbnRlZWluZyAic2l6ZSIgdG8gYmUgcmV0dXJuZWQgZm9yCnRvbyBsYXJn
ZSBhbiAib2Zmc2V0Ii4KCj4gICAgZWxzZSBpZiAoIF9fYnVpbHRpbl9jb25zdGFudF9wKHNpemUp
ICYmIHNfXyA8PSBCSVRTX1BFUl9MT05HICkgICAgICAgICAgXAo+ICAgICAgICByX18gPSBvX18g
KyBfX3NjYW5iaXQoKihjb25zdCB1bnNpZ25lZCBsb25nICopKGFfXykgPj4gb19fLCBzX18pOyAg
IFwKCllldCB0aGlzIHdhcyAoZGVsaWJlcmF0ZWx5KSBsZWZ0IHVudG91Y2hlZC4gV2l0aG91dCBz
X18gZ2V0dGluZwpyZXBsYWNlZCBieSBzX18gLSBvX18gaXQgbWF5IHN0aWxsIHByb2R1Y2UgYSB2
YWx1ZSBsYXJnZXIgdGhhbgoic2l6ZSIsIHRob3VnaC4KCkZ1cnRoZXIsIGV2ZW4gaWYgYWxsIGN1
cnJlbnQgaW1wbGVtZW50YXRpb25zIG9iZXllZCBieSB0aGUgbW9yZQpzdHJpY3QgcnVsZSwgdGhp
cyBzdGlsbCB3b3VsZG4ndCBtZWFuIGNhbGxlcnMgYXJlIGFjdHVhbGx5IHBlcm1pdHRlZAp0byBh
c3N1bWUgc3VjaC4gVGhlIG1vcmUgc3RyaWN0IHJ1bGUgd291bGQgdGhlbiBhbHNvIG5lZWQgdG8g
YmUKd3JpdHRlbiBkb3duLCBzdWNoIHRoYXQgaXQgd29uJ3QgZ2V0IHZpb2xhdGVkIGFnYWluIGlu
IHRoZSBmdXR1cmUKKGJ5IGNoYW5nZXMgdG8gYW4gZXhpc3RpbmcgYXJjaCdzIGltcGxlbWVudGF0
aW9uLCBvciBieSBhIG5ldyBwb3J0KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
