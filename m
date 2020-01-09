Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10E1355DC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 10:34:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipU9C-00042y-OK; Thu, 09 Jan 2020 09:30:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipU9C-00042t-3R
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 09:30:34 +0000
X-Inumbo-ID: a99cde22-32c2-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a99cde22-32c2-11ea-a985-bc764e2007e4;
 Thu, 09 Jan 2020 09:30:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 087FDBD20;
 Thu,  9 Jan 2020 09:30:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
 <cfee6317-36dc-05d6-1887-da0a5ce9428f@citrix.com>
 <38cdc276-d41a-9e79-3f0a-8836ebe9a125@suse.com>
 <6d9ebd8d-3b71-c88a-9786-b4fb66905982@citrix.com>
 <1c071c0b-4dce-671a-4225-19765a7f56e7@suse.com>
 <4d1b6581-c619-c535-0e2b-969724339886@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <442509ed-00f8-2c2a-b16f-20aa1aea8dc0@suse.com>
Date: Thu, 9 Jan 2020 10:30:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4d1b6581-c619-c535-0e2b-969724339886@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8wMS8yMDIw
IDE2OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDguMDEuMjAyMCAxNzoxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA4LzAxLzIwMjAgMTE6MzgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEFzIHNhaWQgLSBJJ20gZ29pbmcgdG8gdHJ5IHRvIG5vdCBzdGFuZCBpbiB0aGUgd2F5
IG9mIHlvdSByZS0KPj4+PiBhcnJhbmdpbmcgdGhpcywgYnV0Cj4+Pj4gLSB0aGUgbmV3IGNvZGUg
c2hvdWxkIG5vdCBicmVhayBzaWxlbnRseSB3aGVuIChpbiBwYXJ0aWN1bGFyKQo+Pj4+ICAgbDJf
Ym9vdG1hcFtdIGNoYW5nZXMKPj4+IFdoYXQgcHJhY3RpY2FsIGNoYW5nZXMgZG8geW91IHRoaW5r
IGNvdWxkIGJlIGRvbmUgaGVyZT/CoCBJIGNhbid0IHNwb3QKPj4+IGFueSB3aGljaCB3b3VsZCBi
ZSBoZWxwZnVsLgo+Pj4KPj4+IEEgQlVJTERfQlVHX09OKCkgZG9lc24ndCB3b3JrLsKgIFRoZSBt
b3N0IGxpa2VseSBjYXNlIGZvciBzb21ldGhpbmcgZ29pbmcKPj4+IHdyb25nIGhlcmUgaXMgYW4g
ZWRpdCB0byB4ODZfNjQuUyBhbmQgbm8gZXF1aXZhbGVudCBlZGl0IHRvIHBhZ2UuaCwKPj4+IHdo
aWNoIGEgQlVJTERfQlVHX09OKCkgd291bGRuJ3Qgc3BvdC7CoCBoZWFkLlMgc2ltaWxhcmx5IGhh
cyBubyB1c2VmdWwKPj4+IHByb3RlY3Rpb25zIHdoaWNoIGNvdWxkIGJlIGFkZGVkLgo+PiBXZWxs
LCB0aGUgZnVuZGFtZW50YWwgYXNzdW1wdGlvbiBpcyB0aGF0IHRoZSAuUyBmaWxlcyBhbmQgdGhl
Cj4+IEMgZGVjbGFyYXRpb24gb2YgbD9fYm9vdG1hcFtdIGFyZSBrZXB0IGluIHN5bmMuIE5vIEJV
SUxEX0JVR19PTigpCj4+IGNhbiBjb3ZlciBhIG1pc3Rha2UgbWFkZSB0aGVyZS4gQnV0IHJhdGhl
ciB0aGFuIHVzaW5nIHRoZSBsaXRlcmFsCj4+IDQgYXMgeW91IGRpZCwgYW4gQVJSQVlfU0laRSgp
IGNvbnN0cnVjdCBzaG91bGQgYmUgdXNhYmxlIHRvIGVpdGhlcgo+PiByZXBsYWNlIGl0LCBvciBh
bWVuZCBpdCB3aXRoIGEgQlVJTERfQlVHX09OKCkuCj4gCj4gWW91IGFyZSBhd2FyZSB0aGF0IEFS
UkFZX1NJWkUobDJfYm9vdG1hcCkgaXMgMjA0OCBhbmQKPiBBUlJBWV9TSVpFKGwzX2Jvb3RtYXAp
IGlzIDUxMiwgbmVpdGhlciBvZiB3aGljaCB3b3VsZCBiZSBjb3JyZWN0IGhlcmU/CgpZZXMsIEkg
YW0gKHdoaWNoIGlzIHdoeSBJIGFkZGVkICJjb25zdHJ1Y3QiKS4gRGl2aWRpbmcgYnkKTDxuPl9Q
QUdFVEFCTEVfRU5UUklFUyB3b3VsZCBiZSBvbmUgb3B0aW9uLiBJbiBwYXJ0aWN1bGFyIGZvcgps
Ml9ib290bWFwIGRlY2xhcmluZyBhdCBhcyBbNF1bTDJfUEFHRVRBQkxFX0VOVFJJRVNdIHdvdWxk
IGJlCmFub3RoZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
