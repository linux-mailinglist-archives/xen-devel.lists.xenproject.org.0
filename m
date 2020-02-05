Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C741E15356C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:41:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNhk-0007AI-DY; Wed, 05 Feb 2020 16:39:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izNhi-0007AD-DM
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:39:06 +0000
X-Inumbo-ID: 05c9231c-4836-11ea-9157-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05c9231c-4836-11ea-9157-12813bfff9fa;
 Wed, 05 Feb 2020 16:39:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F02BAFA5;
 Wed,  5 Feb 2020 16:39:04 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
 <4cf07838-40ff-a941-159a-263c9305b89d@suse.com>
 <c2e44382-18b1-f62e-a2a8-98974c040069@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40359ffc-13b3-daee-4456-99a461c26de7@suse.com>
Date: Wed, 5 Feb 2020 17:38:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <c2e44382-18b1-f62e-a2a8-98974c040069@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] sysctl: use xmalloc_array() for
 XEN_SYSCTL_page_offline_op
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxNTozNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA1LzAyLzIwMjAg
MTM6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGlzIG1vcmUgcm9idXN0IHRoYW4gdGhl
IHJhdyB4bWFsbG9jX2J5dGVzKCkuCj4+Cj4+IEFsc28gYWRkIGEgc2FuaXR5IGNoZWNrIG9uIHRo
ZSBpbnB1dCBwYWdlIHJhbmdlLgo+IAo+IEl0IGZlZWxzIHRvIG1lIHRoYXQgdGhlIGNvbW1pdCBt
ZXNzYWdlL3RpdGxlIHNob3VsZCBmb2N1cyBvbiB0aGUgc2FuaXR5IAo+IGNoZWNrLiBUaGUgeG1h
bGxvY19hcnJheSgpIGlzIGp1c3QgYSBjbGVhbnVwIGlzICJsZXNzIGltcG9ydGFudCIuCgpCdXQg
aXQgbm90IGJlaW5nIHRoZXJlIHdvdWxkIGdlbmVyYWxseSBqdXN0IHJlc3VsdCBpbiAtRU5PTUVN
CmR1ZSB0byB0aGUgeG1hbGxvY18uLi4oKSBmYWlsaW5nIChsZWF2aW5nIGFzaWRlIG92ZXJmbG93
IG5vdAphY2NvdW50ZWQgZm9yIGluIHRoZSBvbGQgY29kZSksIHdoaWNoIGJ5IHRoZSBuZXcgY2hl
Y2sganVzdApnZXRzIGNoYW5nZWQgaW50byB0aGUgbW9yZSBhcHBsaWNhYmxlIC1FSU5WQUwuIEkg
dmlldyB0aGUKY2hhbmdlZCBjYWxsZWQgb3V0IGluIHRoZSB0aXRsZSBhcyBtb3JlIGltcG9ydGFu
dC4KCkphbgoKPj4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYwo+PiArKysgYi94ZW4vY29tbW9u
L3N5c2N0bC5jCj4+IEBAIC0xODcsMTMgKzE4NywxNyBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlCj4+ICAgICAgICAgICB1aW50MzJfdCAqc3RhdHVzLCAqcHRyOwo+
PiAgICAgICAgICAgbWZuX3QgbWZuOwo+PiAgIAo+PiArICAgICAgICByZXQgPSAtRUlOVkFMOwo+
PiArICAgICAgICBpZiAoIG9wLT51LnBhZ2Vfb2ZmbGluZS5lbmQgPCBvcC0+dS5wYWdlX29mZmxp
bmUuc3RhcnQgKQo+PiArICAgICAgICAgICAgYnJlYWs7Cj4+ICsKPj4gICAgICAgICAgIHJldCA9
IHhzbV9wYWdlX29mZmxpbmUoWFNNX0hPT0ssIG9wLT51LnBhZ2Vfb2ZmbGluZS5jbWQpOwo+PiAg
ICAgICAgICAgaWYgKCByZXQgKQo+PiAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgIAo+PiAtICAg
ICAgICBwdHIgPSBzdGF0dXMgPSB4bWFsbG9jX2J5dGVzKCBzaXplb2YodWludDMyX3QpICoKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG9wLT51LnBhZ2Vfb2ZmbGluZS5lbmQg
LQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wLT51LnBhZ2Vfb2ZmbGlu
ZS5zdGFydCArIDEpKTsKPj4gKyAgICAgICAgcHRyID0gc3RhdHVzID0geG1hbGxvY19hcnJheSh1
aW50MzJfdCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAob3AtPnUu
cGFnZV9vZmZsaW5lLmVuZCAtCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9wLT51LnBhZ2Vfb2ZmbGluZS5zdGFydCArIDEpKTsKPj4gICAgICAgICAgIGlmICggIXN0
YXR1cyApCj4+ICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfV0FS
TklORywgIk91dCBvZiBtZW1vcnkgZm9yIHBhZ2Ugb2ZmbGluZSBvcFxuIik7Cj4+Cj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
