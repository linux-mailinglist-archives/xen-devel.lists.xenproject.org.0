Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05017BDDB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACjv-0001mv-0Q; Fri, 06 Mar 2020 13:10:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACjt-0001ho-Jg
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:10:05 +0000
X-Inumbo-ID: cb5ab6e0-5fab-11ea-a7cd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb5ab6e0-5fab-11ea-a7cd-12813bfff9fa;
 Fri, 06 Mar 2020 13:10:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17EABB217;
 Fri,  6 Mar 2020 13:10:04 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>,
 "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
Date: Fri, 6 Mar 2020 14:10:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
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
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzo1NywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIEZyaSwgMjAy
MC0wMy0wNiBhdCAxMzozNiArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFuZCBvZiBjb3Vy
c2UgdGhpcyBtZWFucyB5b3UncmUgaW50ZW5kaW5nIHRvIChhdCBsZWFzdAo+PiBwYXJ0aWFsbHkp
IHJlc3VycmVjdCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBkb21oZWFwIGFuZCB4ZW5oZWFwLAo+
PiB3aGljaCBpc24ndCBzYWlkIGFueXdoZXJlIGluIFBhdWwncyBzZXJpZXMsIEkgZG9uJ3QgdGhp
bmsuCj4gCj4gUmlnaHQuIFNlY3JldCBoaWRpbmcgbWFrZXMgdGhlIGRpc3RpbmN0aW9uICh4ZW5o
ZWFwIGlzIG1hcHBlZCwgZG9taGVhcAo+IGlzIG5vdCkgbW9zdGx5IGdvIGF3YXkuIFdlIGFyZSB0
YWxraW5nIGFib3V0IHJlc3RvcmluZyAqYSogZGlzdGluY3Rpb24KPiBiZXR3ZWVuIG9uZSB0eXBl
IG9mIHBhZ2UgKFhlbiBlcGhlbWVyYWwgcGFnZXMgd2hpY2ggZG9uJ3QgbmVlZCB0byBiZQo+IHBy
ZXNlcnZlZCBvdmVyIGxpdmUgdXBkYXRlKSBhbmQgYW5vdGhlciAobXVzdCBiZSBwcmVzZXJ2ZWQp
LCBidXQKPiB3aGV0aGVyIHRoYXQgc2hvdWxkIHN0aWxsIGJlIGNhbGxlZCAieGVuaGVhcCIgdnMu
ICJkb21oZWFwIiwgZGVzcGl0ZQo+IHRoZSBtYXNzaXZlIHBhcmFsbGVscywgaXNuJ3QgZW50aXJl
bHkgY2xlYXIuCj4gCj4+ICBJZiB0aGlzCj4+IGlzIGEgc3VmZmljaWVudGx5IGNvcnJlY3QgdW5k
ZXJzdGFuZGluZyBvZiBtaW5lLCB0aGVuIG9uIG9uZSBoYW5kCj4+IEkgc3RhcnQgc2VlaW5nIHRo
ZSBwb2ludCBvZiB0aGUgY29udmVyc2lvbiBQYXVsIHdhbnRzIHRvIG1ha2UsIGJ1dAo+PiBvdG9o
IHRoaXMgdGhlbiBmZWVscyBhIGxpdHRsZSBsaWtlIG1ha2luZyB0aGUgMm5kIHN0ZXAgYmVmb3Jl
IHRoZQo+PiAxc3QuCj4gCj4gCj4gV2hhdCB3b3VsZCB5b3Ugc3VnZ2VzdCBpcyB0aGUgZmlyc3Qg
c3RlcD8KCkVzdGFibGlzaGluZyBvZiB3aGF0IHRoZSBuZXcgc2VwYXJhdGlvbiBydWxlIGFuZCBt
ZWNoYW5pc20gaXMgZ29pbmcKdG8gYmUgKG5vIG1hdHRlciBob3cgdGhlIHR3byByZXN1bHRpbmcg
cGllY2VzIGFyZSBnb2luZyB0byBiZQpuYW1lZCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
