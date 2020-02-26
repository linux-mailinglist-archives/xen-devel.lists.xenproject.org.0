Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D916F9DC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 09:41:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6sCQ-0001Wy-WE; Wed, 26 Feb 2020 08:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6sCP-0001W5-67
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 08:37:45 +0000
X-Inumbo-ID: 41cf4aba-5873-11ea-aba8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41cf4aba-5873-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 08:37:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7A70ACE1;
 Wed, 26 Feb 2020 08:37:42 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-7-dwmw2@infradead.org>
 <3821a29a-7d60-c18b-71dd-12ed3c5b708d@suse.com>
 <519b73bb-2db3-75e4-db81-3781c462290e@xen.org>
 <44f074ee-b47c-0c20-02d8-8bee1557e503@suse.com>
 <863e5864-5aef-3fde-9433-bc4f8bd19eb2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddea05a7-645f-42d5-43f7-ddf008cdb9cb@suse.com>
Date: Wed, 26 Feb 2020 09:37:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <863e5864-5aef-3fde-9433-bc4f8bd19eb2@xen.org>
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAwODoxMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI1LzAyLzIwMjAg
MTI6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBGdXJ0aGVyLCBldmVuIGlmIGFsbCBjdXJyZW50
IGltcGxlbWVudGF0aW9ucyBvYmV5ZWQgYnkgdGhlIG1vcmUKPj4gc3RyaWN0IHJ1bGUsIHRoaXMg
c3RpbGwgd291bGRuJ3QgbWVhbiBjYWxsZXJzIGFyZSBhY3R1YWxseSBwZXJtaXR0ZWQKPj4gdG8g
YXNzdW1lIHN1Y2guIFRoZSBtb3JlIHN0cmljdCBydWxlIHdvdWxkIHRoZW4gYWxzbyBuZWVkIHRv
IGJlCj4+IHdyaXR0ZW4gZG93biwgc3VjaCB0aGF0IGl0IHdvbid0IGdldCB2aW9sYXRlZCBhZ2Fp
biBpbiB0aGUgZnV0dXJlCj4+IChieSBjaGFuZ2VzIHRvIGFuIGV4aXN0aW5nIGFyY2gncyBpbXBs
ZW1lbnRhdGlvbiwgb3IgYnkgYSBuZXcgcG9ydAo+IAo+IFRvIGJlIGhvbmVzdCwgdGhlIHJ1bGUg
c2hvdWxkIGJlIHdyaXR0ZW4gZG93biBpbiBhbnkgY2FzZS4gVGhlIGN1cnJlbnQgCj4gb25lIGlz
IG5vdCBuZWNlc3NhcmlseSBhbiBvYnZpb3VzIG9uZSBhbmQgYWxzbyBkaWZmZXIgZnJvbSB3aGF0
IExpbnV4IAo+IGZvbGtzIGNhbiBleHBlY3QuCgpJIHRoaW5rIHdlIHNob3VsZCBzdGljayB0byB0
aGUgbW9yZSByZWxheGVkIHJ1bGUgaW4gYW55IGV2ZW50LCB1bmxlc3MKdGhlcmUncyBhIHN0cm9u
ZyByZWFzb24gdG8gZW5mb3JjZSB0aGUgbW9yZSBzdHJpY3Qgb25lLiBNdWNoIChidXQgbm90CmFs
bCkgb2YgTGludXggY29kZSBsb29rcyB0byBhc3N1bWUgdGhlIG1vcmUgcmVsYXhlZCBydWxlIHRv
bywgbGlrZWx5CmFsc28gZm9yIGhpc3RvcmljYWwgcmVhc29ucyAod2hlbiB0aGUgaW1wbGVtZW50
YXRpb24gb24gZS5nLiB4ODYtNjQKc3RpbGwgZm9sbG93ZWQgdGhlIG1vcmUgcmVsYXhlZCBtb2Rl
bCkuCgo+IFJlZ2FyZGluZyBmdXR1cmUgcG9ydCwgdGhlIG51bWJlciBvZiBhcmNoaXRlY3R1cmVz
IGluIExpbnV4IHVzaW5nIGN1c3RvbSAKPiBiaXRvcHMgYXJlIGZhaXJseSBsaW1pdGVkIChBRkFJ
Q1Qgb25seSBhcm0zMiBhbmQgdW5pY29yZTMyKS4gQWxsIHRoZSAKPiByZXN0IChpbmNsdWRpbmcg
eDg2KSB1c2luZyBhIGdlbmVyaWMgaW1wbGVtZW50YXRpb24uCj4gCj4gT24gWGVuLCBBcm02NCBp
cyBhbHJlYWR5IHVzaW5nIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uLiBJcyB0aGVyZSBhbnkg
Cj4gcGFydGljdWxhciBjb25jZXJuIHRvIHVzZSBpdCBmb3IgeDg2IGFzIHdlbGw/CgpBY2NvcmRp
bmcgdG8gdGhlIChvdmVyIDEwIHllYXJzIG9sZCkgY29tbWl0IHVwZGF0aW5nIExpbnV4IHg4NiB0
aGlzCndheSwgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gd2FzIGV2ZW4gZmFzdGVyLiBJZiB0
aGF0IHdhcyB0aGUKY2FzZSB0b2RheSBhbmQgZm9yIG91ciBpbXBsZW1lbnRhdGlvbiBhcyB3ZWxs
LCB0aGVuIEkgdGhpbmsgaXQKd291bGQgYmUgdmVyeSBuaWNlIGlmIHdlIHVwZGF0ZWQuIElmLCBv
dG9oLCBkYXRhIGlzbid0IGFzIGNsZWFyLAp0aGVuIGZ1cnRoZXIgY29uc2lkZXJhdGlvbiBtYXkg
YmUgbmVlZGVkLiBBbmRyZXcsIGRvIHlvdSBoYXZlIGFueQp0aG91Z2h0cyBlaXRoZXIgd2F5PwoK
PiBJZiBub3QsIEkgY2FuIHB1bGwgYSBwYXRjaCB0byB1c2UgdGhlIGdlbmVyaWMgaW1wbGVtZW50
YXRpb24gb24gCj4geDg2L2FybTMyLiBUaGlzIHdvdWxkIHNvbHZlIHRoZSBkaXNjcmVucGFuY2ll
cyBpbiBmaW5kXypfYml0IAo+IGltcGxlbWVudGF0aW9ucy4KClRoaXMgaXMgb3J0aG9nb25hbCB0
byB0aGUgaXNzdWUgZGlzY3Vzc2VkIC0gYXMgc2FpZCwgSSB0aGluayBjb2RlCnVzaW5nIHRoZSBm
dW5jdGlvbnMgd291bGQgc3RpbGwgYmV0dGVyIGFzc3VtZSB0aGUgbW9yZSByZWxheGVkIG1vZGVs
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
