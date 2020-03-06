Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5B17BD5E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:58:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACW1-0007tY-1x; Fri, 06 Mar 2020 12:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACVz-0007tT-F2
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:55:43 +0000
X-Inumbo-ID: c8dce8c3-5fa9-11ea-a7c8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8dce8c3-5fa9-11ea-a7c8-12813bfff9fa;
 Fri, 06 Mar 2020 12:55:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 832C6ACA1;
 Fri,  6 Mar 2020 12:55:40 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <6e43af74fbdb712d7b9785c1cffdc43aadfafb3c.camel@infradead.org>
 <3ba861ec-bba0-1ea0-1faa-4de98cdf7eca@suse.com>
 <50fbf26e4de5ac14ab74ea3af7add1baff077a78.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a88fc33-f4a6-1865-fe5d-48c7cdba3565@suse.com>
Date: Fri, 6 Mar 2020 13:55:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <50fbf26e4de5ac14ab74ea3af7add1baff077a78.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzozNywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIEZyaSwgMjAy
MC0wMy0wNiBhdCAxMzoyNSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFuZCBsaWtlbHkg
aW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZXMsIGRldmljZSB0YWJsZXMsIGV0Yy4gSSBkb24ndAo+
PiBoYXZlIGEgY2xlYXIgcGljdHVyZSBvbiBob3cgeW91IHdhbnQgdG8gZGVsaW5lYXRlIG9uZXMg
aW4gdXNlIGluIGFueQo+PiBzdWNoIHdheSBmcm9tIG9uZXMgaW5kZWVkIGZyZWUgdG8gcmUtdXNl
Lgo+IAo+IFJpZ2h0LiBUaGUgc29sdXRpb24gdGhlcmUgaXMgdHdvLWZvbGQ6Cj4gCj4gRm9yIHBh
Z2VzIGluIHRoZSBnZW5lcmFsIHBvcHVsYXRpb24gKG91dHNpZGUgdGhlIHJlc2VydmVkIGJvb3Rt
ZW0pLCB0aGUKPiByZXNwb25zaWJpbGl0eSBsaWVzIHdpdGggdGhlIG5ldyBYZW4uIEFzIGl0IHBy
b2Nlc3NlcyB0aGUgbGl2ZSB1cGRhdGUKPiBpbmZvcm1hdGlvbiB0aGF0IGl0IHJlY2VpdmVzIGZy
b20gdGhlIG9sZCBYZW4sIGl0IG11c3QgbWFyayB0aG9zZSBwYWdlcwo+IGFzIGluLXVzZSBzbyB0
aGF0IGl0IGRvZXNuJ3QgYXR0ZW1wdCB0byBhbGxvY2F0ZSB0aGVtLgo+IAo+IFRoYXQncyB3aGF0
IHRoaXMgYnVnZml4IHBhdmVzIHRoZSB3YXkgZm9yIOKAlCBpdCBhdm9pZHMgcHV0dGluZyAqYmFk
Kgo+IHBhZ2VzIGludG8gdGhlIGJ1ZGR5IGFsbG9jYXRvciwgYnkgc2V0dGluZyB0aGUgcGFnZSBz
dGF0ZSBiZWZvcmUgdGhlCj4gcGFnZSBpcyBzZWVuIGJ5IGluaXRfaGVhcF9wYWdlcygpLCBhbmQg
bWFraW5nIGluaXRfaGVhcF9wYWdlcygpIHNraXAKPiB0aGUgcGFnZXMgbWFya2VkIGFzIGJyb2tl
bi4KPiAKPiBJdCdzIHRyaXZpYWwsIHRoZW4sIHRvIG1ha2UgaW5pdF9oZWFwX3BhZ2VzKCkgKmFs
c28qIHNraXAgcGFnZXMgd2hpY2gKPiBnZXQgbWFya2VkIGFzICJhbHJlYWR5IGluIHVzZSIgd2hl
biB3ZSBwcm9jZXNzIHRoZSBsaXZlIHVwZGF0ZSBkYXRhLgo+IAo+IAo+IFRoZSBzZWNvbmQgcGFy
dCwgYXMgZGlzY3Vzc2VkLCBpcyB0aGF0IHRoZSBvbGQgWGVuIG11c3Qgbm90IHB1dCBhbnkgb2YK
PiB0aG9zZSAibmVlZHMgdG8gYmUgcHJlc2VydmVkIiBwYWdlcyBpbnRvIHRoZSByZXNlcnZlZCBi
b290bWVtIHJlZ2lvbi4KPiAKPiBUaGF0J3Mgd2hhdCBQYXVsIGlzIHdvcmtpbmcgb24uIFdlIHN0
b3Agc2hhcmluZyB4ZW5oZWFwIHBhZ2VzIHRvCj4gZG9tYWlucywgd2hpY2ggaXMgcGFydCBvZiBp
dCDigJQgYnV0ICphbHNvKiB3ZSBuZWVkIHRvIHVzZSB0aGUgcmlnaHQKPiBhbGxvY2F0aW9uIGZv
ciBhbnkgSU9NTVUgcGFnZSB0YWJsZXMgYW5kIElSUSByZW1hcHBpbmcgdGFibGVzIHdoaWNoCj4g
bmVlZCB0byBiZSBwcmVzZXJ2ZWQsIGV0Yy4gCgpJJ20gc29ycnksIGJ1dCB0aGlzIGRvZXNuJ3Qg
cmVhbGx5IG1ha2UgdGhpbmdzIG11Y2ggbW9yZSBjbGVhci4KRnVydGhlciB1cCB5b3Ugc2F5ICJB
cyBpdCBwcm9jZXNzZXMgdGhlIGxpdmUgdXBkYXRlIGluZm9ybWF0aW9uCi4uLiIsIGkuZS4gdGhh
dCdzIGEgY2FzZSB3aGVyZSB5b3UgZ2V0IHBvc2l0aXZlIGluZGljYXRpb24gdGhhdCBhCnBhZ2Ug
aXMgaW4gdXNlLiBZb3UgYWxzbyBoYXZlIHRoYXQgcmVzZXJ2ZWQgcmVnaW9uLCB3aGVyZSBvbGQg
WGVuCnByb21pc2VzIHRvIG5vdCBwdXQgYW55dGhpbmcgdGhhdCBuZWVkcyB0byBzdXJ2aXZlLiAo
SXQgcmVtYWlucwp1bmNsZWFyIHdoYXQgZXhhY3QgZm9ybSBhbmQgc2hhcGUgdGhpcyBpcyBtZWFu
dCB0byB0YWtlLCBhcyBJCmhvcGUgeW91IGRvbid0IG1lYW4gdG8gcmUtaW50cm9kdWNlIGEgWGVu
IGhlYXAgd2l0aCBzdGF0aWMKYm91bmRhcmllcywgZW50aXJlbHkgZGlzdGluY3QgZnJvbSB0aGUg
ZG9tYWluIGhlYXAuKSBCdXQgdGhlCnNpdHVhdGlvbiBmb3IgYWxsIG90aGVyIHBhZ2VzIHJlbWFp
bnMgcmF0aGVyIG5lYnVsb3VzIHRvIG1lLiBZZXQKYnkgYSBjZXJ0YWluIHBvaW50IGluIHRpbWUg
bmV3IFhlbiB3aWxsIHdhbnQgdG8gdGFrZSBjb250cm9sIG9mCmFsbCBtZW1vcnksIGkuZS4ga25v
dyBvZiB0aGUgdXNlZCAob3Igbm90KSBzdGF0dXMgb2YgYWxsIHBhZ2VzCmluIHRoZSBzeXN0ZW0u
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
