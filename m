Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31761E70A8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:43:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3Or-0006rD-5S; Mon, 28 Oct 2019 11:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP3Oq-0006r7-2r
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 11:41:28 +0000
X-Inumbo-ID: df488ab4-f977-11e9-8aca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df488ab4-f977-11e9-8aca-bc764e2007e4;
 Mon, 28 Oct 2019 11:41:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0064B291;
 Mon, 28 Oct 2019 11:41:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
 <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
 <7a4dc34f-a817-e2ee-5ded-407ffc86db22@citrix.com>
 <d901c775-4122-6c37-c3c8-2ace1a6251ad@suse.com>
 <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1660a65-8881-3010-487e-ff932ee9f764@suse.com>
Date: Mon, 28 Oct 2019 12:41:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1d35b969-c1c4-d58c-abc7-ae6865c9577a@citrix.com>
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

T24gMjguMTAuMjAxOSAxMjozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8xMC8yMDE5
IDExOjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMTAuMjAxOSAxMjoxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI4LzEwLzIwMTkgMTE6MTEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI4LjEwLjIwMTkgMTI6MDgsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+IE9u
IDI4LzEwLzIwMTkgMDk6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjguMTAuMjAx
OSAwOTo1NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+Pj4+PiBDb252ZXJ0aW5nIGEgZ3Vlc3Qg
ZnJvbSBQViB0byBQVi1pbi1QVkggbWFrZXMgdGhlIGd1ZXN0IHRvIGhhdmUgMzg0awo+Pj4+Pj4+
IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVzdCdzIGJhbGxvb24gZHJpdmVyLiBU
aGlzIGhhcHBlbnMKPj4+Pj4+PiBiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2ZXMg
NjQwayAtIDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKPj4+Pj4+PiB0aGUgZmFjdCB0aGF0IGl0
J3MgcmVhbGx5IGEgdXNhYmxlIFJBTSBpbiBQVkggYm9vdCBtb2RlLgo+Pj4+Pj4gVGhpcyBpcyBh
IFBWSCBwcm9wZXJ0eSBhY2NvcmRpbmcgdG8geW91ciBkZXNjcmlwdGlvbiBhbmQgYWNjb3JkaW5n
Cj4+Pj4+PiB0byBteSB1bmRlcnN0YW5kaW5nLiBXaHkgd291bGQgeW91IHRoZW4gLi4uCj4+Pj4+
Pgo+Pj4+Pj4+IEZpeCB0aGlzIGJ5IHNraXBwaW5nIHRoZSByZWdpb24gdHlwZSBjaGFuZ2UgZm9y
IHB2LXNoaW0gbW9kZS4KPj4+Pj4+IC4uLiBhbHRlciBiZWhhdmlvciBmb3Igc2hpbSBtb2RlIG9u
bHksIHJhdGhlciB0aGFuIHdoZW4gYm9vdGVkIGluCj4+Pj4+PiBQVkggbW9kZSBpbiBnZW5lcmFs
Pwo+Pj4+PiBUaGlzIGlzIGp1c3QgbWUgYmVpbmcgY2F1dGlvdXMuCj4+Pj4+Cj4+Pj4+IE15IG9y
aWdpbmFsIGVtYWlsIGRvZXMgaGF2ZSB0aGlzIHRleHQgYWZ0ZXIgLS0tCj4+Pj4+ICJUaGUgY29u
ZGl0aW9uIGNhbiBiZSByZWxheGVkIHRvIGJlIGp1c3QgIXB2aF9ib290IGlmIHRoZXJlIGFyZSBu
bwo+Pj4+PiBwbGFucyB0byBzdXBwb3J0IFZHQSBNTUlPIC8gUk9NcyBmb3IgUFZIIGd1ZXN0cy4i
Cj4+Pj4gSSBkb3VidCBlbXVsYXRlZCBvbmVzIGFyZSBpbnRlbmRlZCB0byBiZSBzdXBwb3J0ZWQs
IGJ1dCBvZgo+Pj4+IGNvdXJzZSBhIGdyYXBoaWNzIGNhcmQgY291bGQgYmUgcGFzc2VkIHRocm91
Z2guIElpcmMgcGFzc3Rocm91Z2gKPj4+PiBpcyBhIHBlbmRpbmcgd29yayBpdGVtIHN0aWxsIGFu
eXdheSBmb3IgUFZILCBzbyBkZWFsaW5nIHdpdGggdGhlCj4+Pj4gY2FzZSByaWdodCBub3cgbWF5
IG5vdCBldmVuIGJlIG5lY2Vzc2FyeS4KPj4+IFRoZSBidWcgaXMgWGVuIGJsaW5kbHkgcHJlc3Vt
aW5nIHRoYXQgYSBtaXNzaW5nIGhvbGUgIm11c3QgYmUgYSBmaXJtd2FyZQo+Pj4gYnVnIi4KPj4+
Cj4+PiBJIGNhbiBiZWxpZXZlIHRoYXQgdGhlcmUgbWF5IGhhdmUgYmVlbiBzeXN0ZW1zIGRlY2Fk
ZXMgYWdvIHdoaWNoIGdvdAo+Pj4gdGhpcyB3cm9uZywgYnV0IHRiaCBJIGRvdWJ0IGl0IGFwcGxp
ZXMgdG8gNjRiaXQtY2FwYWJsZSBzeXN0ZW1zLAo+Pj4gY29uc2lkZXJpbmcgaG93IHN0YW5kYXJk
aXNlZCB0aGluZ3Mgd2VyZSBieSB0aGVuLgo+Pj4KPj4+IEknZCBqdXN0IGRlbGV0ZSB0aGlzIHdo
b2xlIHBpZWNlIG9mIGxvZ2ljIGFuZCBjYWxsIGl0IGRvbmUuCj4+IFdlbGwsIEkgY291bGQgc2Vl
IHVzZSBiZWluZyBsZXNzIGFnZ3Jlc3NpdmUgaGVyZSwgYnV0IGZpcm13YXJlIChpZgo+PiB0aGVy
ZSBpcyBmaXJtd2FyZSwgaS5lLiBldmVyeXRoaW5nIGV4Y2VwdCBQVkgpIGNsYWltaW5nIHRoZXJl
IHRvCj4+IGJlIFJBTSBpbW1lZGlhdGVseSBiZWxvdyB0aGUgMU0gYm91bmRhcnkgaXMgYSBwcmV0
dHkgZ29vZCBzaWduIG9mCj4+IHNvbWV0aGluZyBiZWluZyB3cm9uZy4gVGhlcmUgX291Z2h0XyB0
byBiZSBST00gYXQgdGhhdCBhZGRyZXNzLgo+PiBPdG9oIHRoZXJlIHdlcmUgZXZlbiB3YXlzIGlu
IG9sZGVyIGNoaXBzZXRzIHRvIG1ha2UgUkFNIGFwcGVhciBhdAo+PiBhZGRyZXNzIHJhbmdlcyBu
b3QgdXNlZCBieSBvcHRpb24gUk9Ncywgc28gdGhlIGxvZ2ljIHdlIGN1cnJlbnRseQo+PiBoYXZl
IGdvZXMgdG9vIGZhciBwb3RlbnRpYWxseSBldmVuIG9uIGJhcmUgbWV0YWwuCj4+Cj4+IFNvIHdo
aWxlIEknbSBhbGwgZm9yIHJlbGF4aW5nLCBJIGRvbid0IHRoaW5rIEkgY2FuIHN1cHBvcnQKPj4g
b3V0cmlnaHQgZGVsZXRpb24uCj4gCj4gRm9yIG5vdywgaG93IGFib3V0IGNwdV9oYXNfaHlwZXJ2
aXNvciA/Cj4gCj4gV2hhdGV2ZXIgdGhlIHZpcnR1YWwgZW52aXJvbm1lbnQsIHdlIHNob3VsZCB0
cnVzdCB0aGUgcHJvdmlkZWQgbWVtb3J5IG1hcC4KCkhtbSwgeWVzLCB0aGlzIHNvdW5kcyByZWFz
b25hYmxlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
