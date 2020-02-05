Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8243152769
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 09:13:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izFkz-0008SH-SO; Wed, 05 Feb 2020 08:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izFky-0008S8-5D
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 08:09:56 +0000
X-Inumbo-ID: e42e087c-47ee-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e42e087c-47ee-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 08:09:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABA1BAD9F;
 Wed,  5 Feb 2020 08:09:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <cd3d95e9-7305-539c-a6e3-babd226eaea4@suse.com>
 <8a2beec3-1be3-e1f8-89bc-dde28a16eea0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5943032d-c38d-82e5-f62f-9cb1213d9217@suse.com>
Date: Wed, 5 Feb 2020 09:09:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8a2beec3-1be3-e1f8-89bc-dde28a16eea0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/7] x86/HVM: implement memory read
 caching for insn emulation
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAyMDo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMS8wMS8yMDIw
IDE2OjQ0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVEJEOiBJbiBwcmluY2lwbGUgdGhlIGNhY2hp
bmcgaGVyZSB5aWVsZHMgdW5uZWNlc3NhcnkgdGhlIG9uZSB1c2VkIGZvcgo+PiAgICAgIGluc24g
Ynl0ZXMgKHZpby0+bW1pb19pbnNueyxfYnl0ZXN9LiBIb3dldmVyLCB0byBzZWVkIHRoZSBjYWNo
ZQo+PiAgICAgIHdpdGggdGhlIGRhdGEgU1ZNIG1heSBoYXZlIG1hZGUgYXZhaWxhYmxlLCB3ZSdk
IGhhdmUgdG8gYWxzbyBrbm93Cj4+ICAgICAgdGhlIGNvcnJlc3BvbmRpbmcgR1BBLiBJdCdzIG5v
dCBzYWZlLCBob3dldmVyLCB0byByZS13YWxrIHRoZSBwYWdlCj4+ICAgICAgdGFibGVzIHRvIGZp
bmQgb3V0LCBhcyB0aGUgcGFnZSB0YWJsZXMgbWF5IGhhdmUgY2hhbmdlZCBpbiB0aGUKPj4gICAg
ICBtZWFudGltZS4gVGhlcmVmb3JlIEkgZ3Vlc3Mgd2UgbmVlZCB0byBrZWVwIHRoZSBkdXBsaWNh
dGUKPj4gICAgICBmdW5jdGlvbmFsaXR5IGZvciBub3cuIEEgcG9zc2libGUgc29sdXRpb24gdG8g
dGhpcyBjb3VsZCBiZSB0byB1c2UKPj4gICAgICBhIHBoeXNpY2FsLWFkZHJlc3MtYmFzZWQgY2Fj
aGUgZm9yIHBhZ2UgdGFibGUgYWNjZXNzZXMgKGFuZCBsb29raW5nCj4+ICAgICAgZm9yd2FyZCBh
bHNvIGUuZy4gU1ZNL1ZNWCBpbnNuIGVtdWxhdGlvbiksIGFuZCBhIGxpbmVhci1hZGRyZXNzLQo+
PiAgICAgIGJhc2VkIG9uZSBmb3IgYWxsIG90aGVyIHJlYWRzLgo+IAo+IFNwbGl0dGluZyBjYWNo
aW5nIGxpa2UgdGhhdCB3aWxsIHJlLWludHJvZHVjZSB0aGUgc2FtZSBidWdzIEkgcG9pbnRlZAo+
IG91dCBpbiBlYXJsaWVyIHJldmlzaW9ucyBvZiB0aGlzIHNlcmllcy7CoCBJdCBpcyBub3QgY29y
cmVjdCB0byBoYXZlCj4gbXVsdGlwbGUgKGFuZCB0aGVyZWZvcmUsIG5vbi1jb2hlcmVudCkgY2Fj
aGVzIG9mIG1lbW9yeS4KPiAKPiBUaGUgQU1EIGluc3RydWN0aW9uIHN0cmVhbSBieXRlcyBzdXBw
b3J0IGlzIGJ5IG5vIG1lYW5zIHBlcmZlY3QgZWl0aGVyLsKgCj4gSXQgZG9lc24ndCBmdW5jdGlv
biBwcm9wZXJseSB3aGVuIFNNQVAgaXMgYWN0aXZlIChFcnJhdHVtICMxMDk2KSwgd2hpY2gKPiBp
cyBhY3R1YWxseSBjYXVzZWQgYnkgdGhlIGluc3RydWN0aW9uIHN0cmVhbSBiZWluZyByZS1mZXRj
aGVkIGF0IHZtZXhpdAo+IHRpbWUsIHdpdGggYSBkYXRhIHNpZGUgYWNjZXNzIChoZW5jZSB0aGUg
aW50ZXJhY3Rpb24gd2l0aCBTTUFQKS4KCkkndmUgbG9va2VkIGludG8gdGhpcyBzb21lIG1vcmUs
IGFuZCBJJ20gYWZyYWlkIHRoZSB0ZXh0IGlzIHRvbwphbWJpZ3VvdXMgdG8gZHJhdyBjb25jbHVz
aW9ucyBhcyB0byBwb3NzaWJsZSBhY3Rpb25zIG9uIG91cgpwYXJ0LiBJdCBtZW50aW9ucyBhICJH
dWVzdEluc3RyQnl0ZXMgZmllbGQgb2YgdGhlIFZNQ0IiLCBidXQgdGhlClBNIGRvZXNuJ3QgdXNl
IHN1Y2ggbmFtaW5nIGFmYWljcy4gSGVuY2UgaXQncyBub3QgY2xlYXIgd2hldGhlcgp0aGUgZW50
aXJlIDE2LWJ5dGUgYmxvY2sgaXMgbWVhbnQsIG9yIGp1c3QgdGhlIGhpZ2ggMTIwIGJpdHMgb2YK
aXQuIEluIHRoZSBmb3JtZXIgY2FzZSB3ZSdyZSBmaW5lLCBidXQgaW4gdGhlIGxhdHRlciBjYXNl
IHdlJ2QKbWlzdGFrZW5seSB1c2UgdGhlIHplcm9zIGFuZCBpbnRlcnByZXQgdGhlbSBhcyAiYWRk
ICVhbCwgKCVyYXgpIgooaW4gNjQtYml0IGd1ZXN0IG1vZGUsIGRpZmZlcmVudCBtZW1vcnkgYWRk
cmVzcyBpbiBvdGhlcnMpLCBhbmQKaGVuY2Ugd2UnZCBuZWVkIHRvIHN1cHByZXNzIHNldHRpbmcg
b3IgdXNlIG9mCnYtPmFyY2guaHZtLnN2bS5jYWNoZWRfaW5zbl9sZW4uIChUaGUgdXNlZCB3b3Jk
aW5nIGNvbWVzIGNsb3Nlcgp0byB0aGUgbGF0dGVyIGNhc2UsIHdpdGggdGhlIFZNQ0IgZmllbGQg
YXQgMHhEMCBkZXNjcmliZWQgYXMKIk51bWJlciBvZiBieXRlcyBmZXRjaGVkIiBhbmQgdGhlbiAi
R3Vlc3QgaW5zdHJ1Y3Rpb24gYnl0ZXMiLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
