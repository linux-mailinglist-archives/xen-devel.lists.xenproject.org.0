Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4321110017
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:26:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic94L-00078G-St; Tue, 03 Dec 2019 14:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic94K-00077C-2g
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:22:24 +0000
X-Inumbo-ID: 525cf950-15d8-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 525cf950-15d8-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 14:22:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2187CB9C1;
 Tue,  3 Dec 2019 14:22:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
 <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
 <9fde1d45-d0fb-19f3-fa0c-609bf83e2347@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3bc762f5-3129-efd2-0916-825ff680f4e7@suse.com>
Date: Tue, 3 Dec 2019 15:22:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9fde1d45-d0fb-19f3-fa0c-609bf83e2347@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAxNToxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8xMi8yMDE5
IDEwOjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMTEuMjAxOSAyMTowMSwgSWdvciBE
cnV6aGluaW4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCj4+PiBAQCAtNTQsNyArNTQsNyBAQCBzdGF0
aWMgdW5zaWduZWQgaW50IGZvcmNlZF9jYXBzW05DQVBJTlRTXTsKPj4+ICAKPj4+ICBERUZJTkVf
UEVSX0NQVShib29sLCBmdWxsX2dkdF9sb2FkZWQpOwo+Pj4gIAo+Pj4gLXZvaWQgX19pbml0IHNl
dHVwX2NsZWFyX2NwdV9jYXAodW5zaWduZWQgaW50IGNhcCkKPj4+ICt2b2lkIHNldHVwX2NsZWFy
X2NwdV9jYXAodW5zaWduZWQgaW50IGNhcCkKPj4+ICB7Cj4+PiAgCWNvbnN0IHVpbnQzMl90ICpk
ZnM7Cj4+PiAgCXVuc2lnbmVkIGludCBpOwo+Pj4gQEAgLTgzLDcgKzgzLDcgQEAgdm9pZCBfX2lu
aXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+Pj4gIAl9Cj4+PiAgfQo+
Pj4gIAo+Pj4gLXZvaWQgX19pbml0IHNldHVwX2ZvcmNlX2NwdV9jYXAodW5zaWduZWQgaW50IGNh
cCkKPj4+ICt2b2lkIHNldHVwX2ZvcmNlX2NwdV9jYXAodW5zaWduZWQgaW50IGNhcCkKPj4+ICB7
Cj4+PiAgCWlmIChfX3Rlc3RfYW5kX3NldF9iaXQoY2FwLCBmb3JjZWRfY2FwcykpCj4+PiAgCQly
ZXR1cm47Cj4+IFRoZSB0d28gZnVuY3Rpb25zIGFyZSBkZWxpYmVyYXRlbHkgX19pbml0LCBhcyBh
bnkgY2FsbCB0byB0aGVtCj4+IHBvc3QtaW5pdCBpcyBub3QgZ29pbmcgdG8gdGFrZSBzeXN0ZW0t
d2lkZSBlZmZlY3QuCj4gCj4gQ3VycmVudCBleGFtcGxlIGRlbW9uc3RyYXRlcyB0aGUgY29udHJh
cnkuwqAgU2V0dGluZyBYODZfQlVHX0ZQVV9QVFJTIGF0Cj4gYW55IHBvaW50IHRocm91Z2ggdGhl
IHJ1bnRpbWUgb2YgWGVuIHdpbGwgY2F1c2UgdGhlIHNhZmUgYWN0aW9uIHRvIHN0YXJ0Cj4gaGFw
cGVuaW5nLgoKVGhpcyBpcyBiZWNhdXNlIG9mIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBfYW5k
XyBzcGVjaWZpYyB0byB0aGlzCm9uZSBmbGFnLiBJbiBnZW5lcmFsIHdoYXQgSSd2ZSBzYWlkIGFw
cGxpZXM7IG1ha2luZyB0aGVzZSBmdW5jdGlvbnMKbm9uLV9pbml0IHdpbGwgZ2l2ZSB0aGUgZmFs
c2UgaW1wcmVzc2lvbiB0aGF0IHRoZWlyIHVzZSBpdCBnb2luZyB0bwpoYXZlIGFuIGVmZmVjdCBp
biBnZW5lcmFsLiBJLmUuIGRvaW5nIGFzIHlvdSBzdWdnZXN0IHdvdWxkIGxheSB0aGUKZ3JvdW5k
d29yayBmb3IgZnV0dXJlIGJ1Z3MuIEFzIGFuIGFzaWRlLCByZWNhbGwgbXkgb2JqZWN0aW9uIHRv
IHVzZQp0aGUgeDg2X2NhcGFiaWxpdGllc1tdIG1hY2hpbmVyeSBmb3IgdGhpcyBlcnJhdHVtPyBZ
b3Ugd2FudGluZwpfX2luaXQgZHJvcHBlZCBoZXJlIGlzIGEgcmVzdWx0IG9mIHRoYXQgKGFzIEkg
d291bGQgY2FsbCBpdCkgYWJ1c2UuCgo+IERyb3BwaW5nIHRoaXMgY2FsbCBvbiB0aGUgbm9uLWJv
b3QgQ1BVcyBsZWFkcyB0byBhbiBpbnNlY3VyZQo+IGNvbmZpZ3VyYXRpb24gd2hpY2ggd2UncmUg
cGVyZmVjdGx5IGNhcGFibGUgb2Ygd29ya2luZyBhcm91bmQsIGFuZAo+IHRoZXJlZm9yZSBpc24n
dCBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uLgoKQSBwcmVyZXEgdG8gcmV0YWluaW5nIHRoZSBjYWxs
cyBvbiBBUHMgd291bGQgYmUgdG8gbWFrZSBub24tQlNQIHVzZQpvZiB0aGUgZnVuY3Rpb25zIGdl
bmVyYWxseSBzYWZlLiBPdGhlcndpc2UsIGlmIHlvdSB3YW50IHRvIHN1cHBvcnQKc3VjaCBhc3lt
bWV0cmljIGNvbmZpZ3VyYXRpb25zLCBjcHVfYnVnX2ZwdV9wdHJzIHdhbnRzIHRvIGJlCnN3aXRj
aGVkIHRvIGEgYm9vbCB2YXJpYWJsZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
