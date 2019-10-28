Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D6E7078
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:33:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3ES-0005iq-4N; Mon, 28 Oct 2019 11:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP3EQ-0005il-P5
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 11:30:42 +0000
X-Inumbo-ID: 5e7ef4c8-f976-11e9-94f3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e7ef4c8-f976-11e9-94f3-12813bfff9fa;
 Mon, 28 Oct 2019 11:30:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CBCEAFF0;
 Mon, 28 Oct 2019 11:30:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
 <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
Date: Mon, 28 Oct 2019 12:30:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxMjoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8xMC8yMDE5
IDExOjExLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMTAuMjAxOSAxMjowOCwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IE9uIDI4LzEwLzIwMTkgMDk6MDYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI4LjEwLjIwMTkgMDk6NTYsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+IENv
bnZlcnRpbmcgYSBndWVzdCBmcm9tIFBWIHRvIFBWLWluLVBWSCBtYWtlcyB0aGUgZ3Vlc3QgdG8g
aGF2ZSAzODRrCj4+Pj4+IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVzdCdzIGJh
bGxvb24gZHJpdmVyLiBUaGlzIGhhcHBlbnMKPj4+Pj4gYmVjYXVzZSBYZW4gdW5jb25kaXRpb25h
bGx5IHJlc2VydmVzIDY0MGsgLSAxTSByZWdpb24gaW4gRTgyMCBkZXNwaXRlCj4+Pj4+IHRoZSBm
YWN0IHRoYXQgaXQncyByZWFsbHkgYSB1c2FibGUgUkFNIGluIFBWSCBib290IG1vZGUuCj4+Pj4g
VGhpcyBpcyBhIFBWSCBwcm9wZXJ0eSBhY2NvcmRpbmcgdG8geW91ciBkZXNjcmlwdGlvbiBhbmQg
YWNjb3JkaW5nCj4+Pj4gdG8gbXkgdW5kZXJzdGFuZGluZy4gV2h5IHdvdWxkIHlvdSB0aGVuIC4u
Lgo+Pj4+Cj4+Pj4+IEZpeCB0aGlzIGJ5IHNraXBwaW5nIHRoZSByZWdpb24gdHlwZSBjaGFuZ2Ug
Zm9yIHB2LXNoaW0gbW9kZS4KPj4+PiAuLi4gYWx0ZXIgYmVoYXZpb3IgZm9yIHNoaW0gbW9kZSBv
bmx5LCByYXRoZXIgdGhhbiB3aGVuIGJvb3RlZCBpbgo+Pj4+IFBWSCBtb2RlIGluIGdlbmVyYWw/
Cj4+PiBUaGlzIGlzIGp1c3QgbWUgYmVpbmcgY2F1dGlvdXMuCj4+Pgo+Pj4gTXkgb3JpZ2luYWwg
ZW1haWwgZG9lcyBoYXZlIHRoaXMgdGV4dCBhZnRlciAtLS0KPj4+ICJUaGUgY29uZGl0aW9uIGNh
biBiZSByZWxheGVkIHRvIGJlIGp1c3QgIXB2aF9ib290IGlmIHRoZXJlIGFyZSBubwo+Pj4gcGxh
bnMgdG8gc3VwcG9ydCBWR0EgTU1JTyAvIFJPTXMgZm9yIFBWSCBndWVzdHMuIgo+PiBJIGRvdWJ0
IGVtdWxhdGVkIG9uZXMgYXJlIGludGVuZGVkIHRvIGJlIHN1cHBvcnRlZCwgYnV0IG9mCj4+IGNv
dXJzZSBhIGdyYXBoaWNzIGNhcmQgY291bGQgYmUgcGFzc2VkIHRocm91Z2guIElpcmMgcGFzc3Ro
cm91Z2gKPj4gaXMgYSBwZW5kaW5nIHdvcmsgaXRlbSBzdGlsbCBhbnl3YXkgZm9yIFBWSCwgc28g
ZGVhbGluZyB3aXRoIHRoZQo+PiBjYXNlIHJpZ2h0IG5vdyBtYXkgbm90IGV2ZW4gYmUgbmVjZXNz
YXJ5Lgo+IAo+IFRoZSBidWcgaXMgWGVuIGJsaW5kbHkgcHJlc3VtaW5nIHRoYXQgYSBtaXNzaW5n
IGhvbGUgIm11c3QgYmUgYSBmaXJtd2FyZQo+IGJ1ZyIuCj4gCj4gSSBjYW4gYmVsaWV2ZSB0aGF0
IHRoZXJlIG1heSBoYXZlIGJlZW4gc3lzdGVtcyBkZWNhZGVzIGFnbyB3aGljaCBnb3QKPiB0aGlz
IHdyb25nLCBidXQgdGJoIEkgZG91YnQgaXQgYXBwbGllcyB0byA2NGJpdC1jYXBhYmxlIHN5c3Rl
bXMsCj4gY29uc2lkZXJpbmcgaG93IHN0YW5kYXJkaXNlZCB0aGluZ3Mgd2VyZSBieSB0aGVuLgo+
IAo+IEknZCBqdXN0IGRlbGV0ZSB0aGlzIHdob2xlIHBpZWNlIG9mIGxvZ2ljIGFuZCBjYWxsIGl0
IGRvbmUuCgpXZWxsLCBJIGNvdWxkIHNlZSB1c2UgYmVpbmcgbGVzcyBhZ2dyZXNzaXZlIGhlcmUs
IGJ1dCBmaXJtd2FyZSAoaWYKdGhlcmUgaXMgZmlybXdhcmUsIGkuZS4gZXZlcnl0aGluZyBleGNl
cHQgUFZIKSBjbGFpbWluZyB0aGVyZSB0bwpiZSBSQU0gaW1tZWRpYXRlbHkgYmVsb3cgdGhlIDFN
IGJvdW5kYXJ5IGlzIGEgcHJldHR5IGdvb2Qgc2lnbiBvZgpzb21ldGhpbmcgYmVpbmcgd3Jvbmcu
IFRoZXJlIF9vdWdodF8gdG8gYmUgUk9NIGF0IHRoYXQgYWRkcmVzcy4KT3RvaCB0aGVyZSB3ZXJl
IGV2ZW4gd2F5cyBpbiBvbGRlciBjaGlwc2V0cyB0byBtYWtlIFJBTSBhcHBlYXIgYXQKYWRkcmVz
cyByYW5nZXMgbm90IHVzZWQgYnkgb3B0aW9uIFJPTXMsIHNvIHRoZSBsb2dpYyB3ZSBjdXJyZW50
bHkKaGF2ZSBnb2VzIHRvbyBmYXIgcG90ZW50aWFsbHkgZXZlbiBvbiBiYXJlIG1ldGFsLgoKU28g
d2hpbGUgSSdtIGFsbCBmb3IgcmVsYXhpbmcsIEkgZG9uJ3QgdGhpbmsgSSBjYW4gc3VwcG9ydApv
dXRyaWdodCBkZWxldGlvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
