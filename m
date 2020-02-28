Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B18173DD5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 18:02:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7j0A-0002F2-NG; Fri, 28 Feb 2020 17:00:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7j09-0002Ex-KR
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 17:00:37 +0000
X-Inumbo-ID: d6429bab-5a4b-11ea-99b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6429bab-5a4b-11ea-99b5-12813bfff9fa;
 Fri, 28 Feb 2020 17:00:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C05AAF0D;
 Fri, 28 Feb 2020 17:00:35 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa482834-7454-9fcb-2aed-86f4c01b134e@suse.com>
Date: Fri, 28 Feb 2020 18:00:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-8-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzZSBYZW4ncyBM
MCBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCBpbiBvcmRlciB0byBwZXJmb3JtIGZsdXNoZXMu
Cj4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9ybWFuY2Ugb2YgVExCIGZsdXNoZXMg
d2hlbiBydW5uaW5nCj4gd2l0aCBhIGhpZ2ggYW1vdW50IG9mIHZDUFVzIGFzIGEgWGVuIGd1ZXN0
LCBhbmQgaXMgc3BlY2lhbGx5IGltcG9ydGFudAo+IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUu
Cj4gCj4gVGhlIGZvbGxvd2luZyBmaWd1cmVzIGFyZSBmcm9tIGEgUFYgZ3Vlc3QgcnVubmluZyBg
bWFrZSAtajMyIHhlbmAgaW4KPiBzaGltIG1vZGUgd2l0aCAzMiB2Q1BVcyBhbmQgSEFQLgo+IAo+
IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFuZDoKPiByZWFsCTRtMzUuOTczcwo+IHVz
ZXIJNG0zNS4xMTBzCj4gc3lzCTM2bTI0LjExN3MKPiAKPiBVc2luZyBMMCBhc3Npc3RlZCBmbHVz
aDoKPiByZWFsICAgIDFtMi41OTZzCj4gdXNlciAgICA0bTM0LjgxOHMKPiBzeXMgICAgIDVtMTYu
Mzc0cwo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBhZGRzIGEgbmV3IGhvb2sgdG8gaHlwZXJ2aXNv
cl9vcHMgc28gb3RoZXIKPiBlbmxpZ2h0ZW5tZW50cyBjYW4gYWxzbyBpbXBsZW1lbnQgc3VjaCBh
c3Npc3RlZCBmbHVzaCBqdXN0IGJ5IGZpbGxpbmcKPiB0aGUgaG9vay4gTm90ZSB0aGF0IHRoZSBY
ZW4gaW1wbGVtZW50YXRpb24gY29tcGxldGVseSBpZ25vcmVzIHRoZQo+IGRpcnR5IENQVSBtYXNr
IGFuZCB0aGUgbGluZWFyIGFkZHJlc3MgcGFzc2VkIGluLCBhbmQgYWx3YXlzIHBlcmZvcm1zIGEK
PiBnbG9iYWwgVExCIGZsdXNoIG9uIGFsbCB2Q1BVcy4KClRoaXMgaXNuJ3QgYmVjYXVzZSBvZiBh
biBpbXBsZW1lbnRhdGlvbiBjaG9pY2Ugb2YgeW91cnMsIGJ1dCBiZWNhdXNlCm9mIGhvdyBIVk1P
UF9mbHVzaF90bGJzIHdvcmtzLiBJIHRoaW5rIHRoZSBzdGF0ZW1lbnQgc2hvdWxkIHNvbWVob3cK
ZXhwcmVzcyB0aGlzLiBJIGFsc28gdGhpbmsgaXQgd2FudHMgY2xhcmlmeWluZyB0aGF0IHVzaW5n
IHRoZQpoeXBlcmNhbGwgaXMgaW5kZWVkIGZhc3RlciBldmVuIGluIHRoZSBjYXNlIG9mIHNpbmds
ZS1wYWdlLCBzaW5nbGUtCkNQVSBmbHVzaCAod2hpY2ggSSBzdXNwZWN0IG1heSBub3QgYmUgdGhl
IGNhc2UgZXNwZWNpYWxseSBhcyB2Q1BVCmNvdW50IGdyb3dzKS4gVGhlIHN0YXRzIGFib3ZlIHBy
b3ZlIGEgcG9zaXRpdmUgb3ZlcmFsbCBlZmZlY3QsIGJ1dAp0aGV5IGRvbid0IHNheSB3aGV0aGVy
IHRoZSBlZmZlY3QgY291bGQgYmUgZXZlbiBiaWdnZXIgYnkgYmVpbmcgYXQKbGVhc3QgYSBsaXR0
bGUgc2VsZWN0aXZlLgoKPiBAQCAtNzMsNiArNzQsMTUgQEAgdm9pZCBfX2luaXQgaHlwZXJ2aXNv
cl9lODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQo+ICAgICAgICAgIG9wcy5lODIwX2Zp
eHVwKGU4MjApOwo+ICB9Cj4gIAo+ICtpbnQgaHlwZXJ2aXNvcl9mbHVzaF90bGIoY29uc3QgY3B1
bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBvcmRlcikKPiArewo+ICsgICAgaWYgKCBvcHMuZmx1c2hfdGxiICkKPiAr
ICAgICAgICByZXR1cm4gYWx0ZXJuYXRpdmVfY2FsbChvcHMuZmx1c2hfdGxiLCBtYXNrLCB2YSwg
b3JkZXIpOwo+ICsKPiArICAgIHJldHVybiAtRU5PU1lTOwo+ICt9CgpQbGVhc2Ugbm8gbmV3IC1F
Tk9TWVMgYW55d2hlcmUgKGV4Y2VwdCBpbiBuZXcgcG9ydHMnIHRvcCBsZXZlbApoeXBlcmNhbGwg
aGFuZGxlcnMpLgoKPiBAQCAtMjU2LDYgKzI1NywxNiBAQCB2b2lkIGZsdXNoX2FyZWFfbWFzayhj
b25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLCB1bnNpZ25lZCBpbnQgZmxhZ3Mp
Cj4gICAgICBpZiAoIChmbGFncyAmIH5GTFVTSF9PUkRFUl9NQVNLKSAmJgo+ICAgICAgICAgICAh
Y3B1bWFza19zdWJzZXQobWFzaywgY3B1bWFza19vZihjcHUpKSApCj4gICAgICB7Cj4gKyAgICAg
ICAgaWYgKCBjcHVfaGFzX2h5cGVydmlzb3IgJiYKPiArICAgICAgICAgICAgICEoZmxhZ3MgJiB+
KEZMVVNIX1RMQiB8IEZMVVNIX1RMQl9HTE9CQUwgfCBGTFVTSF9WQV9WQUxJRCB8Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICBGTFVTSF9PUkRFUl9NQVNLKSkgJiYKPiArICAgICAgICAgICAg
ICFoeXBlcnZpc29yX2ZsdXNoX3RsYihtYXNrLCB2YSwgKGZsYWdzIC0gMSkgJiBGTFVTSF9PUkRF
Ul9NQVNLKSApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBpZiAoIHRsYl9jbGtfZW5hYmxl
ZCApCj4gKyAgICAgICAgICAgICAgICB0bGJfY2xrX2VuYWJsZWQgPSBmYWxzZTsKCldoeSBkb2Vz
IHRoaXMgbmVlZCBkb2luZyBoZXJlPyBDb3VsZG4ndCBYZW4gZ3Vlc3Qgc2V0dXAgY29kZQpjbGVh
ciB0aGUgZmxhZz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
