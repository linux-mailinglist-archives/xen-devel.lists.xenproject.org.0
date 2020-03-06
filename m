Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB917BCAB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:27:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAC2c-0004aZ-UA; Fri, 06 Mar 2020 12:25:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAC2b-0004aU-BK
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:25:21 +0000
X-Inumbo-ID: 8b4caf5b-5fa5-11ea-a7bf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b4caf5b-5fa5-11ea-a7bf-12813bfff9fa;
 Fri, 06 Mar 2020 12:25:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49294B1CE;
 Fri,  6 Mar 2020 12:25:19 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ba861ec-bba0-1ea0-1faa-4de98cdf7eca@suse.com>
Date: Fri, 6 Mar 2020 13:25:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6e43af74fbdb712d7b9785c1cffdc43aadfafb3c.camel@infradead.org>
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

T24gMDYuMDMuMjAyMCAxMjo1MiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIEZyaSwgMjAy
MC0wMy0wNiBhdCAxMjozNyArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEkndmUgc3RhcnRl
ZCBsb29raW5nIGF0IHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBQYXVsJ3Mgc2VyaWVzLCBidXQgSSdt
Cj4+IHN0aWxsIHN0cnVnZ2xpbmcgdG8gc2VlIHRoZSBwaWN0dXJlOiBUaGVyZSdzIG5vIHRydWUg
ZGlzdGluY3Rpb24KPj4gYmV0d2VlbiBYZW4gaGVhcCBhbmQgZG9tYWluIGhlYXAgb24geDg2LTY0
IChleGNlcHQgb24gdmVyeSBsYXJnZQo+PiBzeXN0ZW1zKS4gVGhlcmVmb3JlIGl0IGlzIHVuY2xl
YXIgdG8gbWUgd2hhdCAidGhvc2UgcGFnZXMiIGlzIGFjdHVhbGx5Cj4+IHJlZmVycmluZyB0byBh
Ym92ZS4gU3VyZWx5IG5ldyBYZW4gY2FuJ3QgYmUgZ2l2ZW4gYW55IHBhZ2VzIGluIHVzZQo+PiBf
aW4gYW55IHdheV8gYnkgb2xkIFhlbiwgbm8gbWF0dGVyIHdoZXRoZXIgaXQncyBvbmVzIGFzc2ln
bmVkIHRvCj4+IGRvbWFpbnMsIG9yIG9uZXMgdXNlZCBpbnRlcm5hbGx5IHRvIChvbGQpIFhlbi4K
PiAKPiBPbGQgYW5kIG5ldyBYZW4gZG8gbm90IGNvZXhpc3QuIFRoZXJlIGlzIGEga2V4ZWMgKHZp
YSBrZXhlY19yZWxvYy5TIGFuZAo+IHB1cmdhdG9yeSkgZnJvbSBvbGQgdG8gbmV3Lgo+IAo+IFRo
ZXJlIGFyZSBzb21lIHBhZ2VzIHdoaWNoIG5ldyBYZW4gTVVTVCBOT1Qgc2NyaWJibGUgb24sIGJl
Y2F1c2UgdGhleQo+IGFjdHVhbGx5IGJlbG9uZyB0byB0aGUgZG9tYWlucyBiZWluZyBwcmVzZXJ2
ZWQuIFRoYXQgaW5jbHVkZXMgdGhlIEVQVAo+IChvciBhdCBsZWFzdCBJT01NVSkgcGFnZSB0YWJs
ZXMuCgpBbmQgbGlrZWx5IGludGVycnVwdCByZW1hcHBpbmcgdGFibGVzLCBkZXZpY2UgdGFibGVz
LCBldGMuIEkgZG9uJ3QKaGF2ZSBhIGNsZWFyIHBpY3R1cmUgb24gaG93IHlvdSB3YW50IHRvIGRl
bGluZWF0ZSBvbmVzIGluIHVzZSBpbiBhbnkKc3VjaCB3YXkgZnJvbSBvbmVzIGluZGVlZCBmcmVl
IHRvIHJlLXVzZS4KCkphbgoKPiBJIHN1cHBvc2UgbmV3IFhlbiBhbHNvIG11c3RuJ3Qgc2NyaWJi
bGUgb24gdGhlIHBhZ2VzIGluIHdoaWNoIG9sZCBYZW4KPiBoYXMgcGxhY2VkIHRoZSBtaWdyYXRp
b24gaW5mb3JtYXRpb24gZm9yIHRob3NlIGRvbWFpbnMgZWl0aGVyLiBBdAo+IGxlYXN0LCBub3Qg
dW50aWwgaXQncyBjb25zdW1lZCB0aGUgZGF0YS4KPiAKPiBBbnl0aGluZyBlbHNlLCBob3dldmVy
LCBpcyBmaW5lIGZvciBuZXcgWGVuIHRvIHNjcmliYmxlIG9uLiBGYWlybHkgbXVjaAo+IGFueXRo
aW5nIHRoYXQgdGhlIG9sZCBYZW4gaGFkIGFsbG9jYXRlZCBmcm9tIGl0cyB4ZW5oZWFwIChhbmQg
bm90Cj4gc3Vic2VxdWVudGx5IHNoYXJlZCB0byBhIGd1ZXN0LCBxdikgaXMgbm8gbG9uZ2VyIHJl
cXVpcmVkIGFuZCBjYW4gYmUKPiB0cmVhdGVkIGFzIGZyZWUgbWVtb3J5IGJ5IHRoZSBuZXcgWGVu
LCB3aGljaCBub3cgb3ducyB0aGUgbWFjaGluZS4KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
