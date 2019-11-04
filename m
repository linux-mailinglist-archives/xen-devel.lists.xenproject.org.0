Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE549EE48E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 17:21:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRf3v-0003ym-9t; Mon, 04 Nov 2019 16:18:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iRf3t-0003yh-S6
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 16:18:37 +0000
X-Inumbo-ID: c10b14a2-ff1e-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c10b14a2-ff1e-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 16:18:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E80B7AB8F;
 Mon,  4 Nov 2019 16:18:35 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20191104135812.2314-1-jgross@suse.com>
 <40cba9d9-24b0-3141-4ba8-02e03049f1bf@suse.com>
 <acaf58cb-47f2-7e7e-f25d-ff83ae8a8066@suse.com>
 <b1171c0c-7928-d7a1-7bdc-e3f18f67eaac@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e6b8fcc2-2e2c-60f8-e68c-972cc7951e6b@suse.com>
Date: Mon, 4 Nov 2019 17:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b1171c0c-7928-d7a1-7bdc-e3f18f67eaac@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/events: remove event handling recursion
 detection
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMTkgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjExLjIwMTkgMTY6
MDksIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA0LjExLjE5IDE1OjM1LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA0LjExLjIwMTkgMTQ6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gX194ZW5fZXZ0Y2huX2RvX3VwY2FsbCgpIGNvbnRhaW5zIGd1YXJkcyBhZ2FpbnN0IGJlaW5n
IGNhbGxlZAo+Pj4+IHJlY3Vyc2l2ZWx5LiBUaGlzIG1lY2hhbmlzbSB3YXMgaW50cm9kdWNlZCBp
biB0aGUgZWFybHkgcHZvcHMgdGltZXMKPj4+PiAoa2VybmVsIDIuNi4yNikgd2hlbiB0aGVyZSB3
ZXJlIHN0aWxsIFhlbiB2ZXJzaW9ucyBhcm91bmQgbm90IGhvbm9yaW5nCj4+Pj4gZGlzYWJsZWQg
aW50ZXJydXB0cyBmb3Igc2VuZGluZyBldmVudHMgdG8gcHYgZ3Vlc3RzLgo+Pj4+Cj4+Pj4gVGhp
cyB3YXMgY2hhbmdlZCBpbiBYZW4gMy4wLCB3aGljaCBpcyBtdWNoIG9sZGVyIHRoYW4gYW55IFhl
biB2ZXJzaW9uCj4+Pj4gc3VwcG9ydGVkIGJ5IHRoZSBrZXJuZWwsIHNvIHRoZSByZWN1cnNpb24g
ZGV0ZWN0aW9uIGNhbiBiZSByZW1vdmVkLgo+Pj4KPj4+IFdvdWxkIHlvdSBtaW5kIHBvaW50aW5n
IG91dCB3aGljaCBleGFjdCBjaGFuZ2UocykgdGhpcyB3YXMod2VyZSk/Cj4+Cj4+IExpbnV4IGtl
cm5lbDogMjI5NjY0YmVlNjEyNmUwMWY4NjYyOTc2YTVmZTJlNzk4MTNiNzdjOAo+PiBYZW46IGQ4
MjYzZThkYmFmNWVmMTQ0NWJlZTA2NjIxNDNhMGZjYjZkNDM0NjYKPiAKPiBBcmUgeW91IHN1cmUg
YWJvdXQgdGhlIGxhdHRlciwgdG91Y2hpbmcgb25seSBoZWFkZXIgZmlsZXMgdW5kZXJuZWF0aAo+
IHhlbi8sIGFuZCB0aGVyZSBtb3N0bHkgcHVibGljIGludGVyZmFjZSBvbmVzPwoKTm8sIHlvdSBh
cmUgcmlnaHQsIHRoaXMgd2FzIGEgZmFsc2UgaW50ZXJwcmV0YXRpb24gb2YgbWluZS4KCj4gCj4+
PiBJdCBoYWQgYWx3YXlzIGJlZW4gbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSByZWN1cnNpb24g
ZGV0ZWN0aW9uCj4+PiB3YXMgbWFpbmx5IHRvIGd1YXJkIGFnYWluc3QgZHJpdmVycyByZS1lbmFi
bGluZyBpbnRlcnJ1cHRzCj4+PiB0cmFuc2llbnRseSBpbiB0aGVpciBoYW5kbGVycyAod2hpY2gg
aW4gdHVybiBtYXkgbm8gbG9uZ2VyIGJlIGFuCj4+PiBpc3N1ZSBpbiBtb2Rlcm4gTGludXgga2Vy
bmVscykuCj4+Cj4+IFRoaXMgd291bGQgaGF2ZSBiZWVuIGRvYWJsZSB3aXRoIGEgc2ltcGxlIGJv
b2wuIFRoZSBtb3JlIGNvbXBsZXgKPj4geGNoZyBiYXNlZCBsb2dpYyB3YXMgSU1PIGZvciByZWN1
cnNpb24gZGV0ZWN0aW9uIGF0IGFueSBwb2ludC4KPiAKPiBXZWxsLCB0aGUgcmVzcGVjdGl2ZSBY
ZW5vTGludXggYy9zIDEzMDk4IGhhcyBubyBtZW50aW9uIG9mIHRoaXMsIGkuZS4KPiBpdCBzaW1w
bHkgbGVhdmVzIG9wZW4gd2hhdCB0aGUgYWN0dWFsIHJlYXNvbiB3YXM6Cj4gCj4gIltMSU5VWF0g
RGlzYWxsb3cgbmVzdGVkIGV2ZW50IGRlbGl2ZXJ5Lgo+IAo+ICAgVGhpcyBlbGltaW5hdGVzIHRo
ZSByaXNrIG9mIG92ZXJmbG93aW5nIHRoZSBrZXJuZWwgc3RhY2sgYW5kIGlzIGEKPiAgIHJlYXNv
bmFibGUgcG9saWN5IGdpdmVuIHRoYXQgd2UgaGF2ZSBubyBjb25jZXB0IG9mIHByaW9yaXRpZXMg
YW1vbmcKPiAgIGV2ZW50IHNvdXJjZXMuIgoKRm9yIFhlbm9MaW51eCBpdCBtYWtlcyBhdCBsZWFz
dCBhIGxpdHRsZSBiaXQgc2Vuc2UsIGFzIGludGVycnVwdHMKd2VyZSBlbmFibGVkIGR1cmluZyBj
YWxscyBvZiBzb21lIGhhbmRsZXJzIEFGQUlLLiBUaGUgY29tcGxleGl0eSBpcwpyYXRoZXIgc3Ry
YW5nZSwgdGhvdWdoLCBhcyB0aGUgYm9vbCB3b3VsZCBoYXZlIGJlZW4gbXVjaCBlYXNpZXIgdG8K
dW5kZXJzdGFuZC4KCkknbGwgYWRhcHQgdGhlIGNvbW1pdCBtZXNzYWdlLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
