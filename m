Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0474B5D7C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 08:41:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iATYJ-00049Q-Jm; Wed, 18 Sep 2019 06:34:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iATYI-000492-KF
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 06:34:58 +0000
X-Inumbo-ID: 6dc6abae-d9de-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dc6abae-d9de-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 06:34:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C9E7AEAC;
 Wed, 18 Sep 2019 06:34:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
Date: Wed, 18 Sep 2019 08:34:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxOToxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNi8wOS8yMDE5
IDEwOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gWEVEIGNvbW1pdCAxYjJmZDk0NDI1ICgiVXBk
YXRlIE1PVlNYRCB0byBtb2Rlcm4gYmVoYXZpb3IiKSBwb2ludHMgb3V0Cj4+IHRoYXQgYXMgb2Yg
U0RNIHJldiAwNjQgTU9WU1hEIGlzIHNwZWNpZmllZCB0byByZWFkIG9ubHkgMTYgYml0cyBmcm9t
Cj4+IG1lbW9yeSAob3IgcmVnaXN0ZXIpIHdoZW4gdXNlZCB3aXRob3V0IFJFWC5XIGFuZCB3aXRo
IG9wZXJhbmQgc2l6ZQo+PiBvdmVycmlkZS4gU2luY2UgdGhlIHVwcGVyIDE2IGJpdHMgb2YgdGhl
IHZhbHVlIHJlYWQgd29uJ3QgYmUgdXNlZAo+PiBhbnl3YXkgaW4gdGhpcyBjYXNlLCBtYWtlIHRo
ZSBlbXVsYXRpb24gdW5pZm9ybWx5IGZvbGxvdyB0aGlzIG1vcmUKPj4gY29tcGF0aWJsZSBiZWhh
dmlvciB3aGVuIG5vdCBlbXVsYXRpbmcgYW4gQU1ELWxpa2UgQ1BVLCBhdCB0aGUgcmlzawo+PiBv
ZiBtaXNzaW5nIGFuIGV4Y2VwdGlvbiB3aGVuIGVtdWxhdGluZyBvbi9mb3Igb2xkZXIgaGFyZHdh
cmUgKHRoZQo+PiBib3VuZGFyeSBhdCBTYW5keUJyaWRnZSBub3RlZCBpbiBzYWlkIGNvbW1pdCBs
b29rcyBxdWVzdGlvbmFibGUgLSBJJ3ZlCj4+IG9ic2VydmVkIHRoZSAibmV3IiBiZWhhdmlvciBh
bHNvIG9uIFdlc3RtZXJlKS4KPiAKPiBBTUQgZG9jdW1lbnRzIHRoaXMgaW5zdHJ1Y3Rpb24gaGFz
IGFsd2F5cyB1c2luZyBhbiA4IG9yIDE2Yml0IHNvdXJjZQo+IG9wZXJhbmQuCgpIYXZlIHlvdSBt
aXhlZCB1cCBNT1ZTWCB3aXRoIE1PVlNYRD8gQm90aCBoYXZlIHNlcGFyYXRlIHBhZ2VzIGluCkFN
RCdzIGRvYywgYnV0IGEgY29tbW9uIHBhZ2UgaW4gSW50ZWwncy4KCj4gVGhlcmUgYXJlIGNvcm5l
ciBjYXNlcyB3aGljaCB3ZSBjYW4ndCBwb3NzaWJseSByZWFzb25hYmx5IGNvcGUgd2l0aC7CoAo+
IGUuZy4gSXQgaXMgbW9kZWwgc3BlY2lmaWMgYXMgdG8gd2hldGhlciBVRDAgdGFrZXMgYSBNb2RS
TSBieXRlIG9yIG5vdCwKPiBhbmQgSSdsbCBub3RlIHRoYXQgdGhlIGxhdGVzdCByZXZpc2lvbiAo
My4zMSkgb2YgQVBNIFZvbDIgY2xhcmlmaWVzIGluCj4gVGFibGUgOC04Ogo+IAo+ICJUaGlzIHJl
ZmxlY3RzIHRoZSByZWxhdGl2ZSBwcmlvcml0eSBmb3IgZmF1bHRzIGVuY291bnRlcmVkIHdoZW4K
PiBmZXRjaGluZyB0aGUgZmlyc3QgYnl0ZSBvZiBhbiBpbnN0cnVjdGlvbi4gSW4gdGhlIGZldGNo
aW5nIGFuZCBkZWNvZGluZwo+IG9mIHN1YnNlcXVlbnQgYnl0ZXMgb2YgYW4gaW5zdHJ1Y3Rpb24s
IGlmIHRob3NlIGJ5dGVzIHNwYW4gdGhlIHNlZ21lbnQKPiBsaW1pdCBvciBjcm9zcyBpbnRvIGEg
bm9uLWV4ZWN1dGFibGUgb3Igbm90LXByZXNlbnQgcGFnZSwgdGhlIGZldGNoIHdpbGwKPiByZXN1
bHQgaW4gYSAjR1AoMCkgZmF1bHQgb3IgI1BGIGFzIGFwcHJvcHJpYXRlLCBwcmV2ZW50aW5nIHRo
b3NlIGJ5dGVzCj4gZnJvbSBiZWluZyBhY2Nlc3NlZC4gSG93ZXZlciwgaWYgdGhlIGluc3RydWN0
aW9uIGNhbiBiZSBkZXRlcm1pbmVkIHRvIGJlCj4gaW52YWxpZCBiYXNlZCBqdXN0IG9uIHRoZSBi
eXRlcyBwcmVjZWRpbmcgdGhhdCBib3VuZGFyeSwgYSAjVUQgZmF1bHQgbWF5Cj4gdGFrZSBwcmlv
cml0eS4gVGhpcyBiZWhhdmlvciBpcyBtb2RlbC1kZXBlbmRlbnQuIgo+IAo+IHNvIHdlIGhhdmUg
bm8gaG9wZSBvZiBnZXR0aW5nIG1vZGVsLWFjY3VyYXRlIGZhdWx0IGJlaGF2aW91ci4KCkhvdyBp
cyBVRDAgcmVsZXZhbnQgaGVyZT8gQW5kIHdhcyB0aGUgcmVtYWluZGVyIG9mIHRoZSBhYm92ZSBw
ZXJoYXBzCm1lYW50IHRvIGJlIGluIHJlc3BvbnNlIHRvIHRoZSBBUlBMIGFkanVzdG1lbnQsIGRl
c2NyaWJlZCBiZWxvdz8gSWYKc28sIEkgc3RpbGwgd291bGRuJ3Qga25vdyB3aGF0IHRvIHRha2Ug
ZnJvbSBpdCBhcyBmYXIgYXMgdGhpcyBwYXRjaApnb2VzLgoKPj4gV2hpbGUgdG91Y2hpbmcgdGhp
cyBjb2RlIEkgYWxzbyBub3RpY2VkIHRoYXQgI1VEIG91dHNpZGUgb2YgcHJvdGVjdGVkCj4+IG1v
ZGUgZ2V0cyByYWlzZWQgZm9yIEFSUEwgb25seSBhZnRlciBoYXZpbmcgcmVhZCB0aGUgbWVtb3J5
IG9wZXJhbmQgLQo+PiBjb3JyZWN0IHRoaXMgYXR0aGUgc2FtZSB0aW1lIGJ5IG1vdmluZyB1cCB0
aGUgcmVzcGVjdGl2ZSBjb25zdHJ1Y3QuCj4gCj4gYXQgdGhlLgoKRml4ZWQuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
