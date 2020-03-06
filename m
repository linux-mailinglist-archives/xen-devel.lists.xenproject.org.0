Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0EA17BCC8
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:32:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAC6n-0004kI-GQ; Fri, 06 Mar 2020 12:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAC6m-0004kD-2k
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:29:40 +0000
X-Inumbo-ID: 25a6d0b2-5fa6-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25a6d0b2-5fa6-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 12:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 99388B25A;
 Fri,  6 Mar 2020 12:29:38 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <6e43af74fbdb712d7b9785c1cffdc43aadfafb3c.camel@infradead.org>
 <aa18335ad92d47d7bd34fb4719da0e2e@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1b07e09-809c-ae87-20c7-b0a25ee5dbd0@suse.com>
Date: Fri, 6 Mar 2020 13:29:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aa18335ad92d47d7bd34fb4719da0e2e@EX13D32EUC003.ant.amazon.com>
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
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMjo1OSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQu
b3JnPgo+PiBTZW50OiAwNiBNYXJjaCAyMDIwIDExOjUzCj4+IFRvOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+OyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4+
IENjOiBqdWxpZW5AeGVuLm9yZzsgYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgc3N0YWJlbGxp
bmlAa2VybmVsLm9yZzsga29ucmFkLndpbGtAb3JhY2xlLmNvbTsKPj4gVm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb207IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb207IHdsQHhlbi5vcmc7IGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbTsgeGVuLQo+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
PiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXVtQQVRDSCAyLzJdIGRvbWFpbjogdXNlIFBHQ19leHRy
YSBkb21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZvCj4+Cj4+IE9uIEZyaSwgMjAyMC0wMy0wNiBh
dCAxMjozNyArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBJJ3ZlIHN0YXJ0ZWQgbG9va2lu
ZyBhdCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgUGF1bCdzIHNlcmllcywgYnV0IEknbQo+Pj4gc3Rp
bGwgc3RydWdnbGluZyB0byBzZWUgdGhlIHBpY3R1cmU6IFRoZXJlJ3Mgbm8gdHJ1ZSBkaXN0aW5j
dGlvbgo+Pj4gYmV0d2VlbiBYZW4gaGVhcCBhbmQgZG9tYWluIGhlYXAgb24geDg2LTY0IChleGNl
cHQgb24gdmVyeSBsYXJnZQo+Pj4gc3lzdGVtcykuIFRoZXJlZm9yZSBpdCBpcyB1bmNsZWFyIHRv
IG1lIHdoYXQgInRob3NlIHBhZ2VzIiBpcyBhY3R1YWxseQo+Pj4gcmVmZXJyaW5nIHRvIGFib3Zl
LiBTdXJlbHkgbmV3IFhlbiBjYW4ndCBiZSBnaXZlbiBhbnkgcGFnZXMgaW4gdXNlCj4+PiBfaW4g
YW55IHdheV8gYnkgb2xkIFhlbiwgbm8gbWF0dGVyIHdoZXRoZXIgaXQncyBvbmVzIGFzc2lnbmVk
IHRvCj4+PiBkb21haW5zLCBvciBvbmVzIHVzZWQgaW50ZXJuYWxseSB0byAob2xkKSBYZW4uCj4+
Cj4+IE9sZCBhbmQgbmV3IFhlbiBkbyBub3QgY29leGlzdC4gVGhlcmUgaXMgYSBrZXhlYyAodmlh
IGtleGVjX3JlbG9jLlMgYW5kCj4+IHB1cmdhdG9yeSkgZnJvbSBvbGQgdG8gbmV3Lgo+Pgo+PiBU
aGVyZSBhcmUgc29tZSBwYWdlcyB3aGljaCBuZXcgWGVuIE1VU1QgTk9UIHNjcmliYmxlIG9uLCBi
ZWNhdXNlIHRoZXkKPj4gYWN0dWFsbHkgYmVsb25nIHRvIHRoZSBkb21haW5zIGJlaW5nIHByZXNl
cnZlZC4gVGhhdCBpbmNsdWRlcyB0aGUgRVBUCj4+IChvciBhdCBsZWFzdCBJT01NVSkgcGFnZSB0
YWJsZXMuCj4+Cj4+IEkgc3VwcG9zZSBuZXcgWGVuIGFsc28gbXVzdG4ndCBzY3JpYmJsZSBvbiB0
aGUgcGFnZXMgaW4gd2hpY2ggb2xkIFhlbgo+PiBoYXMgcGxhY2VkIHRoZSBtaWdyYXRpb24gaW5m
b3JtYXRpb24gZm9yIHRob3NlIGRvbWFpbnMgZWl0aGVyLiBBdAo+PiBsZWFzdCwgbm90IHVudGls
IGl0J3MgY29uc3VtZWQgdGhlIGRhdGEuCj4+Cj4+IEFueXRoaW5nIGVsc2UsIGhvd2V2ZXIsIGlz
IGZpbmUgZm9yIG5ldyBYZW4gdG8gc2NyaWJibGUgb24uIEZhaXJseSBtdWNoCj4+IGFueXRoaW5n
IHRoYXQgdGhlIG9sZCBYZW4gaGFkIGFsbG9jYXRlZCBmcm9tIGl0cyB4ZW5oZWFwIChhbmQgbm90
Cj4+IHN1YnNlcXVlbnRseSBzaGFyZWQgdG8gYSBndWVzdCwgcXYpIGlzIG5vIGxvbmdlciByZXF1
aXJlZCBhbmQgY2FuIGJlCj4+IHRyZWF0ZWQgYXMgZnJlZSBtZW1vcnkgYnkgdGhlIG5ldyBYZW4s
IHdoaWNoIG5vdyBvd25zIHRoZSBtYWNoaW5lLgo+Pgo+IAo+IC4uLiBzbyBnZXR0aW5nIHJpZCBv
ZiBzaGFyZWQgeGVuaGVhcCBwYWdlcyBhbHRvZ2V0aGVyIGp1c3QgbWFrZXMgbGlmZSBlYXNpZXIu
CgpIb3cgZG8geW91IHRlbGwgcGFnZXMgaW4gdXNlIGJ5IGRvbWFpbnMgZnJvbSBvbmVzIGZyZWUg
dG8gcmUtdXNlPwpCZWNhdXNlIG9mIHRoZSBvdmVybG9hZGluZyBvZiBzdHJ1Y3QgcGFnZV9pbmZv
LCBJIGV4cGVjdCB5b3UgY2FuJ3QKanVkZ2UgYnkganVzdCBsb29raW5nIGF0IGEgcGFnZSdzIHN0
cnVjdCBwYWdlX2luZm8gaW5zdGFuY2UuIEFyZQp5b3UgcGVla2luZyBpbnRvIHRoZSBtaWdyYXRp
b24gc3RyZWFtcyBmb3IgdGhlIGRvbWFpbnMgdG8gY29sbGVjdAphbGwgdGhlIHBhZ2VzPyBBbmQg
YXJlIHlvdSB3YWxraW5nIElPTU1VIHN0cnVjdHVyZXMgdG8gY29sbGVjdCB0aGUKb25lcyB1c2Vk
IGZvciBidXQgbm90IGFjY2Vzc2libGUgYnkgdGhlIGRvbWFpbnM/CgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
