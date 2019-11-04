Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C338EE397
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:21:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRe8r-0006X2-CF; Mon, 04 Nov 2019 15:19:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRe8q-0006Wv-35
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:19:40 +0000
X-Inumbo-ID: 84000f34-ff16-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84000f34-ff16-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 15:19:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B00BDB3B1;
 Mon,  4 Nov 2019 15:19:37 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191104135812.2314-1-jgross@suse.com>
 <40cba9d9-24b0-3141-4ba8-02e03049f1bf@suse.com>
 <acaf58cb-47f2-7e7e-f25d-ff83ae8a8066@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1171c0c-7928-d7a1-7bdc-e3f18f67eaac@suse.com>
Date: Mon, 4 Nov 2019 16:19:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <acaf58cb-47f2-7e7e-f25d-ff83ae8a8066@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMjAxOSAxNjowOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4xMS4xOSAx
NTozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjExLjIwMTkgMTQ6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBfX3hlbl9ldnRjaG5fZG9fdXBjYWxsKCkgY29udGFpbnMgZ3VhcmRz
IGFnYWluc3QgYmVpbmcgY2FsbGVkCj4+PiByZWN1cnNpdmVseS4gVGhpcyBtZWNoYW5pc20gd2Fz
IGludHJvZHVjZWQgaW4gdGhlIGVhcmx5IHB2b3BzIHRpbWVzCj4+PiAoa2VybmVsIDIuNi4yNikg
d2hlbiB0aGVyZSB3ZXJlIHN0aWxsIFhlbiB2ZXJzaW9ucyBhcm91bmQgbm90IGhvbm9yaW5nCj4+
PiBkaXNhYmxlZCBpbnRlcnJ1cHRzIGZvciBzZW5kaW5nIGV2ZW50cyB0byBwdiBndWVzdHMuCj4+
Pgo+Pj4gVGhpcyB3YXMgY2hhbmdlZCBpbiBYZW4gMy4wLCB3aGljaCBpcyBtdWNoIG9sZGVyIHRo
YW4gYW55IFhlbiB2ZXJzaW9uCj4+PiBzdXBwb3J0ZWQgYnkgdGhlIGtlcm5lbCwgc28gdGhlIHJl
Y3Vyc2lvbiBkZXRlY3Rpb24gY2FuIGJlIHJlbW92ZWQuCj4+Cj4+IFdvdWxkIHlvdSBtaW5kIHBv
aW50aW5nIG91dCB3aGljaCBleGFjdCBjaGFuZ2UocykgdGhpcyB3YXMod2VyZSk/Cj4gCj4gTGlu
dXgga2VybmVsOiAyMjk2NjRiZWU2MTI2ZTAxZjg2NjI5NzZhNWZlMmU3OTgxM2I3N2M4Cj4gWGVu
OiBkODI2M2U4ZGJhZjVlZjE0NDViZWUwNjYyMTQzYTBmY2I2ZDQzNDY2CgpBcmUgeW91IHN1cmUg
YWJvdXQgdGhlIGxhdHRlciwgdG91Y2hpbmcgb25seSBoZWFkZXIgZmlsZXMgdW5kZXJuZWF0aAp4
ZW4vLCBhbmQgdGhlcmUgbW9zdGx5IHB1YmxpYyBpbnRlcmZhY2Ugb25lcz8KCj4+IEl0IGhhZCBh
bHdheXMgYmVlbiBteSB1bmRlcnN0YW5kaW5nIHRoYXQgdGhlIHJlY3Vyc2lvbiBkZXRlY3Rpb24K
Pj4gd2FzIG1haW5seSB0byBndWFyZCBhZ2FpbnN0IGRyaXZlcnMgcmUtZW5hYmxpbmcgaW50ZXJy
dXB0cwo+PiB0cmFuc2llbnRseSBpbiB0aGVpciBoYW5kbGVycyAod2hpY2ggaW4gdHVybiBtYXkg
bm8gbG9uZ2VyIGJlIGFuCj4+IGlzc3VlIGluIG1vZGVybiBMaW51eCBrZXJuZWxzKS4KPiAKPiBU
aGlzIHdvdWxkIGhhdmUgYmVlbiBkb2FibGUgd2l0aCBhIHNpbXBsZSBib29sLiBUaGUgbW9yZSBj
b21wbGV4Cj4geGNoZyBiYXNlZCBsb2dpYyB3YXMgSU1PIGZvciByZWN1cnNpb24gZGV0ZWN0aW9u
IGF0IGFueSBwb2ludC4KCldlbGwsIHRoZSByZXNwZWN0aXZlIFhlbm9MaW51eCBjL3MgMTMwOTgg
aGFzIG5vIG1lbnRpb24gb2YgdGhpcywgaS5lLgppdCBzaW1wbHkgbGVhdmVzIG9wZW4gd2hhdCB0
aGUgYWN0dWFsIHJlYXNvbiB3YXM6CgoiW0xJTlVYXSBEaXNhbGxvdyBuZXN0ZWQgZXZlbnQgZGVs
aXZlcnkuCgogVGhpcyBlbGltaW5hdGVzIHRoZSByaXNrIG9mIG92ZXJmbG93aW5nIHRoZSBrZXJu
ZWwgc3RhY2sgYW5kIGlzIGEKIHJlYXNvbmFibGUgcG9saWN5IGdpdmVuIHRoYXQgd2UgaGF2ZSBu
byBjb25jZXB0IG9mIHByaW9yaXRpZXMgYW1vbmcKIGV2ZW50IHNvdXJjZXMuIgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
