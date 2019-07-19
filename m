Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8976E074
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 07:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoL3N-0004EU-5a; Fri, 19 Jul 2019 05:03:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoL3L-0004EP-0q
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 05:03:31 +0000
X-Inumbo-ID: 8bddacfe-a9e2-11e9-a173-7b1f8c426c0a
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bddacfe-a9e2-11e9-a173-7b1f8c426c0a;
 Fri, 19 Jul 2019 05:03:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05777AECB;
 Fri, 19 Jul 2019 05:03:27 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-7-jgross@suse.com>
 <577676c68cd9ab1019f7bcfe9c746641d838b6dc.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3ae3c4bb-6fce-0e3b-4a3f-73c64d0917ae@suse.com>
Date: Fri, 19 Jul 2019 07:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <577676c68cd9ab1019f7bcfe9c746641d838b6dc.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/60] xen/sched: move per-vcpu scheduler
 private data pointer to sched_unit
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
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMTkgMDA6NTIsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAxOS0w
NS0yOCBhdCAxMjozMiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhpcyBwcmVwYXJl
cyBtYWtpbmcgdGhlIGRpZmZlcmVudCBzY2hlZHVsZXJzIHZjcHUgYWdub3N0aWMuCj4+Cj4gT2ss
IGJ1dCB0aGUgc2NoZWR1bGVyIHByaXZhdGUgZGF0YSBpcywgYWN0dWFsbHksIGZvciBhbGwgdGhl
Cj4gc2NoZWR1bGVycywgcGVyLXZjcHUgc2NoZWR1bGVyIGRhdGEgc3VjaCBhcywgZm9yIGluc3Rh
bmNlLAo+IHN0cnVjdCBjc2NoZWQyX3ZjcHUuCj4gCj4gQWZ0ZXIgdGhpcyBwYXRjaCB3ZSBoYXZl
IChzdGlja2luZyB0byBDcmVkaXQyIGFzIGFuIGV4YW1wbGUpCj4gY3NjaGVkMl92Y3B1IGFsbG9j
YXRlZCBieSBhIGZ1bmN0aW9uIGNhbGxlZCBjc2NoZWQyX2FsbG9jX3ZkYXRhKCkgYnV0Cj4gc3Rv
cmVkIG9uIGEgcGVyLXNjaGVkX3VuaXQgYmFzaXMuCj4gCj4gU2ltaWxhcmx5LCB3ZSBoYXZlIGFu
IGFjY2Vzc29yIG1ldGhvZCBjYWxsZWQgY3NjaGVkMl92Y3B1KCkgd2hpY2gKPiByZXR1cm5zIHRo
ZSBzdHJ1Y3QgY3NjaGVkMl92Y3B1IHdoaWNoIHdhcyBzdG9yZWQgaW4gdGhlIHBlci11bml0Cj4g
cHJpdmF0ZSBzcGFjZS4KPiAKPiBCdXQgc2hvdWxkbid0IHRoZW4gdGhlIHN0cnVjdCBiZSBjYWxs
ZWQgY3NjaGVkMl91bml0LCBhbmQgY2l0ZWQKPiBmdW5jdGlvbnMgYmUgY2FsbGVkIGNzY2hlZDJf
YWxsb2NfdWRhdGEoKSBhbmQgY3NjaGVkMl91bml0KCk/Cj4gTm93LCBJIGtub3cgdGhhdCB0aGVz
ZSB0cmFuc2Zvcm1hdGlvbiBoYXBwZW4gbGF0ZXIgaW4gdGhlIHNlcmllcy4KPiBBbmQsIHRoaXMg
dGltZSwgSSdtIG5vdCBhc2tpbmcgdG8gY29uc29saWRhdGUgdGhlIHBhdGNoZXMuCj4gCj4gSG93
ZXZlcjoKPiAtIGNhbiB0aGUgY2hhbmdlbG9nIG9mIHRoaXMgcGF0Y2ggYmUgYSBsaXR0bGUgbW9y
ZSBleHBsaWNpdCwgbm90IG9ubHkKPiAgICBpbmZvcm1pbmcgdGhhdCB0aGlzIGlzIGEgcHJlcGFy
YXRvcnkgcGF0Y2gsIGJ1dCBhbHNvIGV4cGxhaW5pbmcKPiAgICBicmllZmx5IHRoZSB0ZW1wb3Jh
cnkgaW5jb25jaXN0ZW5jeQoKU3VyZS4KCj4gLSBjb3VsZCB0aGUgcGF0Y2hlcyB0aGF0IGRlYWwg
d2l0aCB0aGlzIGJlIGdyb3VwZWQgdG9nZXRoZXIsIHNvIHRoYXQKPiAgICB0aGV5IGFyZSBjbG9z
ZSB0byBlYWNoIG90aGVyIGluIHRoZSBzZXJpZXMgKGUuZy4sIHRoaXMgcGF0Y2gsIHRoZQo+ICAg
IHJlbmFtaW5nIGh1bmtzIG9mIHBhdGNoIDEwIGFuZCBwYXRjaGVzIHRoYXQgYXJlIGN1cnJlbnRs
eSAyMCB0byAyNCk/Cj4gICAgT3IgYXJlIHRoZXJlIGRlcGVuZGVuY2llcyB0aGF0IEkgYW0gbm90
IGNvbnNpZGVyaW5nPwoKVGhlcmUgYXJlIHNvbWUgcGF0Y2hlcyB3aGljaCBjb3VsZCBiZSByZW9y
ZGVyZWQsIGJ1dCBJJ20gbm90IHN1cmUgdGhlCm5lZWRlZCB3b3JrIGlzIHdvcnRoIGl0LiBCeSBt
b3ZpbmcgdGhlIHBhdGNoZXMgeW91IG5hbWVkIGNsb3NlciB0byBlYWNoCm90aGVyIHRoZXJlIHdp
bGwgYmUgb3RoZXIgY2xvc2VseSByZWxhdGVkIHBhdGNoZXMgcmlwcGVkIGFwYXJ0IGZyb20KZWFj
aCBvdGhlci4KCkluIHRoZSBlbmQgaXQgd2lsbCBtYWtlIG5vIHNlbnNlIHRvIGFwcGx5IG9ubHkg
c29tZSBwYXRjaGVzIG9mIHRoZSBtYWluCnNlcmllcy4gVGhlIGh1Z2UgYW1vdW50IG9mIHBhdGNo
ZXMgaXMgbWVhbnQgb25seSB0byBtYWtlIHJldmlldyBlYXNpZXIuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
