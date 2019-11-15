Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CDFE193
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:36:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdc6-0006KB-Sc; Fri, 15 Nov 2019 15:34:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVdc5-0006Jf-LD
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:34:21 +0000
X-Inumbo-ID: 6473144a-07bd-11ea-a276-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6473144a-07bd-11ea-a276-12813bfff9fa;
 Fri, 15 Nov 2019 15:34:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1E479B1CF;
 Fri, 15 Nov 2019 15:34:20 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <1573828317.2460.0@crc.id.au>
 <c8ee22b9-5823-a362-4ca3-e7bcec105b99@citrix.com>
 <fd43f974-5915-c2d5-a019-ec1adc8597b3@suse.com>
 <35ea5459-fbe7-a2f1-0fb5-40408fad13ab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8d4c82e-48ca-3f14-a804-64b00506f602@suse.com>
Date: Fri, 15 Nov 2019 16:34:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <35ea5459-fbe7-a2f1-0fb5-40408fad13ab@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxNjozMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAz
OjI3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTUuMTEuMjAxOSAxNjowNSwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IEZUUiwgcGxlYXNlIGF2b2lkIHRvcC1wb3N0aW5nLiA6LSkKPj4+
Cj4+PiBPbiAxMS8xNS8xOSAyOjMxIFBNLCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cj4+Pj4gSnVzdCBy
ZWdhcmRpbmcgdGhlIHVzZSBvZiBhIHN5c3RlbSBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byB0dXJu
IHRoaXMKPj4+PiBmZWF0dXJlIC8gYnVnZml4IC8gaGFjayBvbiBhbmQgb2ZmIC0gdGhpcyB3b3Vs
ZCBwcm9iYWJseSBicmVhayBzdGFydGluZwo+Pj4+IHRoZSBWTSB2aWEgdGhlIHhlbmRvbWFpbnMg
c2NyaXB0Lgo+Pj4+Cj4+Pj4gSWYgdGhlIFZNIGRlZmluaXRpb24gaXMgaW4gL2V0Yy94ZW4vYXV0
by8sIHRoZW4gdGhlcmUgd291bGQgYmUgbm90aGluZwo+Pj4+IHRvIHNldCB0aGUgZW52aXJvbm1l
bnQgdmFyaWFibGUgYmVmb3JlIHRoZSBWTSBpcyBsYXVuY2hlZCAtIGhlbmNlIGl0Cj4+Pj4gd291
bGQgbm90IGJlIGFwcGxpZWQgYW5kIGEgZ3Vlc3QgY3Jhc2ggd291bGQgb2NjdXIuLi4KPj4+Pgo+
Pj4+IERlcGVuZGluZyBvbiB0aGUgVk0ncyBzZXR0aW5ncywgdGhpcyB3b3VsZCBlaXRoZXIgY29u
dGludWUgdG8gc3RhcnQgJgo+Pj4+IGNyYXNoIC0gb3IganVzdCBzdG9wIGFnYWluIHVudGlsIGl0
IGNvdWxkIGJlIHN0YXJ0ZWQgd2l0aCB0aGUgRU5WIHZhcmlhYmxlLgo+Pj4KPj4+IFJpZ2h0LiAg
U28gYSBjb3VwbGUgb2Ygb3B0aW9uczoKPj4+Cj4+PiAxLiBVc2VycyBvZiB4ZW5kb21haW5zIGNv
dWxkIHNldCB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgaW4gdGhlaXIKPj4+IHhlbmRvbWFpbnMg
c2NyaXB0Cj4+Pgo+Pj4gMi4gV2UgY291bGQgYWRkIGEgeGwuY2ZnIG9wdGlvbi4gIFVua25vd24g
eGwuY2ZnIGVudHJpZXMgYXJlIGlnbm9yZWQKPj4+IChmb3IgYmV0dGVyIG9yIGZvciB3b3JzZSk7
IGluIHRoZSBmdXR1cmUsIHdoZW4gdGhlICJmYWtlIGh0IiB0aGluZyBpcwo+Pj4gcmVwbGFjZWQs
IHdlIGNhbiBlaXRoZXIgY29udGludWUgaWdub3JpbmcgaXQsIG9yIGdpdmUgYSB1c2VmdWwgZXJy
b3IKPj4+IG1lc3NhZ2Ugc2F5aW5nIGhvdyBpdCBzaG91bGQgYmUgY2hhbmdlZC4KPj4+Cj4+PiAy
YS4gIFdlIGNvdWxkIGhhdmUgdGhlIGNvbmZpZyBvcHRpb24gKnJlcGxhY2UqIHRoZSBlbnZpcm9u
bWVudCB2YXJpYWJsZTsKPj4+IGluIHdoaWNoIGNhc2Ugd2UnZCBsZWF2ZSBsaWJ2aXJ0IHVzZXJz
IGhpZ2ggYW5kIGRyeQo+Pj4KPj4+IDJiLiBXZSBjb3VsZCBoYXZlIHRoZSBjb25maWcgb3B0aW9u
IGNhdXNlIHhsIHRvICpzZXQqIHRoZSBlbnZpcm9ubWVudAo+Pj4gdmFyaWFibGUsIHdoaWNoIHNo
b3VsZCBjb250aW51ZSB0byBhbGxvdyBvdGhlciB0b29sc3RhY2tzIChldmVuIHRob3NlCj4+PiBu
b3QgdXNpbmcgbGlieGwpIHRvIHBvdGVudGlhbGx5IHdvcmsgYXJvdW5kIHRoZSBpc3N1ZS4KPj4K
Pj4gQW5kIGhvdyB3b3VsZCBhbnkgb2YgdGhlc2UgYWxsb3cgdG8gZGVhbCB3aXRoIGhldGVyb2dl
bmVvdXMgc2V0cyBvZgo+PiBndWVzdHM/Cj4gCj4gQXJlIHlvdSBwZXJoYXBzIGNvbmZ1c2luZyAn
eGwuY2ZnJyAod2hpY2ggaXMgdGhlIHBlci1kb21haW4KPiBjb25maWd1cmF0aW9uIGZpbGUpIHdp
dGggJ3hsLmNvbmYnICh3aGljaCBpcyB0aGUgc3lzdGVtLXdpZGUKPiBjb25maWd1cmF0aW9uIGZp
bGUpPwoKT2gsIGluZGVlZCBJIHdhcy4gSSdtIG5vdCB1c2VkIHRvIGFueSBzdWZmaXhlcyBvbiBk
b21haW4gY29uZmlnCmZpbGVzLiBJJ20gc29ycnkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
