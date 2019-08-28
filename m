Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9689FB4A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 09:18:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2sA6-0005V2-Jd; Wed, 28 Aug 2019 07:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2sA4-0005Ux-Ms
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 07:14:32 +0000
X-Inumbo-ID: 7a4f5532-c963-11e9-ae43-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a4f5532-c963-11e9-ae43-12813bfff9fa;
 Wed, 28 Aug 2019 07:14:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0FC8AD35;
 Wed, 28 Aug 2019 07:14:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <61bcef1a-aa70-067f-b2a4-06580b00fe40@suse.com>
 <596e6cf6-ced2-1993-a7ff-7e865126730f@citrix.com>
 <965b2135-26b3-99d1-d5ea-9e8c69201ba7@suse.com>
 <89dc51a4-4db5-cd91-0d4a-4cf73eb0f80f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d649c22f-a6f5-bacc-bef6-f4bed7da97d0@suse.com>
Date: Wed, 28 Aug 2019 09:14:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <89dc51a4-4db5-cd91-0d4a-4cf73eb0f80f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86emul: support INVPCID
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 PaulDurrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAxOToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wOC8yMDE5
IDE2OjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMDguMjAxOSAxNzozMSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAxLzA3LzIwMTkgMTI6NTcsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPj4+PiBAQCAtOTEy
NCw2ICs5MTI2LDQ4IEBAIHg4Nl9lbXVsYXRlKAo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBB
U1NFUlQoIXN0YXRlLT5zaW1kX3NpemUpOwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPj4+PiAgwqDCoCArwqDCoMKgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZjM4LCAweDgyKTog
LyogaW52cGNpZCByZWcsbTEyOCAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2Y3B1X211c3RfaGF2
ZShpbnZwY2lkKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVh
LnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnZW5lcmF0ZV9l
eGNlcHRpb25faWYoIW1vZGVfcmluZzAoKSwgRVhDX0dQLCAwKTsKPj4+PiArCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmICggKHJjID0gb3BzLT5yZWFkKGVhLm1lbS5zZWcsIGVhLm1lbS5vZmYsIG1t
dmFscCwgMTYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGN0eHQpKSAhPSBYODZFTVVMX09LQVkgKQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZG9uZTsKPj4+Cj4+PiBUaGUgYWN0dWFsIGJlaGF2aW91ciBpbiBo
YXJkd2FyZSBpcyB0byBub3QgZXZlbiByZWFkIHRoZSBtZW1vcnkgb3BlcmFuZAo+Pj4gaWYgaXQg
aXMgdW51c2VkLsKgIFlvdSBjYW4gZGVtb25zdHJhdGUgdGhpcyBieSBkb2luZyBhbiBBTExfSU5D
X0dMT0JBTAo+Pj4gZmx1c2ggd2l0aCBhIG5vbi1jYW5vbmljYWwgbWVtb3J5IG9wZXJhbmQuCj4+
Cj4+IE9oLCB0aGF0J3Mgc29ydCBvZiB1bmV4cGVjdGVkLgo+IAo+IEl0IG1ha2VzIHNlbnNlIGFz
IGFuIG9wdGltaXNhdGlvbi7CoCBUaGVyZSBpcyBubyBwb2ludCBmZXRjaGluZyBhIG1lbW9yeQo+
IG9wZXJhbmQgaWYgeW91J3JlIG5vdCBnb2luZyB0byB1c2UgaXQuCj4gCj4gRnVydGhlcm1vcmUs
IGl0IGFsbW9zdCBjZXJ0YWlubHkgcmVkdWNlcyB0aGUgbWljcm9jb2RlIGNvbXBsZXhpdHkuCgpQ
cm9iYWJseS4gRm9yIGNvbXBhcmlzb24gSSBoYWQgYmVlbiB0aGlua2luZyBvZiAwLWJpdCBzaGlm
dHMgaW5zdGVhZCwKd2hpY2ggZG8gcmVhZCB0aGVpciBtZW1vcnkgb3BlcmFuZHMuIEV2ZW4gU0hM
RC9TSFJELCB3aGljaCBhdCBsZWFzdAp3aXRoIHNoaWZ0IGNvdW50IGluICVjbCBsb29rIHRvIGJl
IHVuaWZvcm1seSBtaWNyb2NvZGVkLCBhY2Nlc3MgdGhlaXIKbWVtb3J5IG9wZXJhbmQgaW4gdGhp
cyBjYXNlLgoKPj4+ICDCoCBJbiBwYXJ0aWN1bGFyLCBJIHdhcwo+Pj4gaW50ZW5kaW5nIHRvIHVz
ZSB0aGlzIGJlaGF2aW91ciB0byBzcGVlZCB1cCBoYW5kbGluZyBvZiBJTlZ7RVBULFZQSUR9Cj4+
PiB3aGljaCB0cmFwIHVuY29uZGl0aW9uYWxseS4KPj4KPj4gV2hpY2ggd291bGQgcmVxdWlyZSB0
aGUgb2JzZXJ2ZWQgYmVoYXZpb3IgdG8gYWxzbyBiZSB0aGUgU0RNCj4+IG1hbmRhdGVkIG9uZSwg
d291bGRuJ3QgaXQ/Cj4gCj4gSWYgeW91IHJlY2FsbCwgd2UgZGlzY3Vzc2VkIHRoaXMgd2l0aCBK
dW4gaW4gQnVkYXBlc3QuwqAgSGlzIG9waW5pb24gd2FzCj4gbm8gaW5zdHJ1Y3Rpb25zIGdvIG91
dCBvZiB0aGVpciB3YXkgdG8gY2hlY2sgcHJvcGVydGllcyB3aGljaCBkb24ndAo+IG1hdHRlciAt
IGl0IGlzIGp1c3QgdGhhdCBpdCBpcyBmYXIgbW9yZSBvYnZpb3VzIHdpdGggaW5zdHJ1Y3Rpb25z
IGxpa2UKPiB0aGVzZSB3aGVyZSB0aGUgY29tcGxleGl0eSBpcyBtdWNoIGdyZWF0ZXIuCj4gCj4g
Tm8gcHJvZHVjdGlvbiBzeXN0ZW1zIGFyZSBnb2luZyB0byByZWx5IG9uIGdldHRpbmcgZmF1bHRz
LCBiZWNhdXNlCj4gdGFraW5nIGEgZmF1bHQgZG9lc24ndCBwcm9kdWNlIHVzZWZ1bCB3b3JrLgoK
TWF5YmUgSSBtaXN1bmRlcnN0b29kIHlvdXIgZWFybGllciByZXBseSB0aGVuOiBJIHJlYWQgaXQg
dG8gbWVhbiB5b3UKd2FudCB0byBsZXZlcmFnZSBJTlZQQ0lEIG5vdCBmYXVsdGluZyBvbiAiYmFk
IiBtZW1vcnkgb3BlcmFuZHMgZm9yCmZsdXNoIHR5cGVzIG5vdCB1c2luZyB0aGUgbWVtb3J5IG9w
ZXJhbmQuIEJ1dCBwZXJoYXBzIHlvdSBtZXJlbHkKbWVhbnQgeW91IHdhbnQgdG8gbGV2ZXJhZ2Ug
dGhlIGluc24gbm90IF9hY2Nlc3NpbmdfIGl0cyBtZW1vcnkKb3BlcmFuZCBpbiB0aGlzIGNhc2U/
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
