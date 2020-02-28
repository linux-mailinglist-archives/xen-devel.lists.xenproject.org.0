Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A489173CAE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:17:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iH1-0005c1-NC; Fri, 28 Feb 2020 16:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7iH0-0005bw-B0
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:13:58 +0000
X-Inumbo-ID: 5243c2a8-5a45-11ea-ad76-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5243c2a8-5a45-11ea-ad76-bc764e2007e4;
 Fri, 28 Feb 2020 16:13:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34FD4ACC2;
 Fri, 28 Feb 2020 16:13:56 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdb97977-2bae-5067-623d-76409fa643a2@suse.com>
Date: Fri, 28 Feb 2020 17:14:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-5-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEludHJvZHVjZSBh
IHNwZWNpZmljIGZsYWcgdG8gcmVxdWVzdCBhIEhWTSBndWVzdCBUTEIgZmx1c2gsIHdoaWNoIGlz
Cj4gYW4gQVNJRC9WUElEIHRpY2tsZSB0aGF0IGZvcmNlcyBhIGxpbmVhciBUTEIgZmx1c2ggZm9y
IGFsbCBIVk0gZ3Vlc3RzLgoKSGVyZSBhbmQgYmVsb3csIHdoYXQgZG8geW91IG1lYW4gYnkgImxp
bmVhciI/IEkgZ3Vlc3MgeW91IG1lYW4KVExCcyBob2xkaW5nIHRyYW5zbGF0aW9ucyBmcm9tIGd1
ZXN0IGxpbmVhciB0byBndWVzdCBwaHlzaWNhbCwKYnV0IEkgdGhpbmsgdGhpcyBjb3VsZCBkbyB3
aXRoIHRoZW4gYWxzbyBzYXlpbmcgc28sIGV2ZW4gaWYgaXQncwptb3JlIHdvcmRzLgoKPiBUaGlz
IHdhcyBwcmV2aW91c2x5IHVuY29uZGl0aW9uYWxseSBkb25lIGluIGVhY2ggcHJlX2ZsdXNoIGNh
bGwsIGJ1dAo+IHRoYXQncyBub3QgcmVxdWlyZWQ6IEhWTSBndWVzdHMgbm90IHVzaW5nIHNoYWRv
dyBkb24ndCByZXF1aXJlIGxpbmVhcgo+IFRMQiBmbHVzaGVzIGFzIFhlbiBkb2Vzbid0IG1vZGlm
eSB0aGUgZ3Vlc3QgcGFnZSB0YWJsZXMgaW4gdGhhdCBjYXNlCj4gKGllOiB3aGVuIHVzaW5nIEhB
UCkuCgpUaGlzIGV4cGxhaW5zIHRoZSBjb3JyZWN0bmVzcyBpbiBvbmUgZGlyZWN0aW9uLiBXaGF0
IGFib3V0IHRoZQpyZW1vdmFsIG9mIHRoaXMgZnJvbSB0aGUgc3dpdGNoX2NyM19jcjQoKSBwYXRo
PyBBbmQgd2hhdCBhYm91dApvdXIgc2FmZXR5IGFzc3VtcHRpb25zIGZyb20gdGhlIHRpY2tpbmcg
b2YgdGxiZmx1c2hfY2xvY2ssCndoZXJlIHdlIHRoZW4gaW1wbHkgdGhhdCBwYWdlcyBlLmcuIGFi
b3V0IHRvIGJlIGZyZWVkIGNhbid0CmhhdmUgYW55IHRyYW5zbGF0aW9ucyBsZWZ0IGluIGFueSBU
TEJzIGFueW1vcmU/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAo+IEBAIC0xMDUsNiArMTA1LDggQEAg
dm9pZCBzd2l0Y2hfY3IzX2NyNCh1bnNpZ25lZCBsb25nIGNyMywgdW5zaWduZWQgbG9uZyBjcjQp
Owo+ICAjZGVmaW5lIEZMVVNIX1ZDUFVfU1RBVEUgMHgxMDAwCj4gICAvKiBGbHVzaCB0aGUgcGVy
LWNwdSByb290IHBhZ2UgdGFibGUgKi8KPiAgI2RlZmluZSBGTFVTSF9ST09UX1BHVEJMIDB4MjAw
MAo+ICsgLyogRmx1c2ggYWxsIEhWTSBndWVzdHMgbGluZWFyIFRMQiAodXNpbmcgQVNJRC9WUElE
KSAqLwo+ICsjZGVmaW5lIEZMVVNIX0dVRVNUU19UTEIgMHg0MDAwCgpGb3Igb25lLCB0aGUgImFs
bCIgaXMgcHJldHR5IG1pc2xlYWRpbmcuIEEgc2luZ2xlIHN1Y2ggcmVxdWVzdApkb2Vzbid0IGRv
IHRoaXMgZm9yIGFsbCB2Q1BVLXMgb2YgYWxsIEhWTSBndWVzdHMsIGRvZXMgaXQ/IEknbQphbHNv
IHN0cnVnZ2xpbmcgd2l0aCB0aGUgJ1MnIGluICJHVUVTVFMiIC0gd2h5IGlzIGl0IG5vdCBqdXN0
CiJHVUVTVCI/IEkgYWRtaXQgdGhlIG5hbWVzIG9mIHRoZSBpbnZvbHZlZCBmdW5jdGlvbnMKKGh2
bV9mbHVzaF9ndWVzdF90bGJzKCksIGh2bV9hc2lkX2ZsdXNoX2NvcmUoKSkgYXJlIHNvbWV3aGF0
Cm1pc2xlYWRpbmcsIGFzIHRoZXkgZG9uJ3QgYWN0dWFsbHkgZG8gYW55IGZsdXNoaW5nLCB0aGV5
IG1lcmVseQphcnJhbmdlIGZvciB3aGF0IGlzIGluIHRoZSBUTEIgdG8gbm8gbG9uZ2VyIGJlIGFi
bGUgdG8gYmUgdXNlZCwKc28gZ2l2aW5nIHRoaXMgYSBzdWl0YWJsZSBuYW1lIGlzICJoaXN0b3Jp
Y2FsbHkiIGNvbXBsaWNhdGVkLgpXaGF0IGlmIHdlIGRpZCBhd2F5IHdpdGggdGhlIGh2bV9mbHVz
aF9ndWVzdF90bGJzKCkgd3JhcHBlciwKbmFtaW5nIHRoZSBjb25zdGFudCBoZXJlIHRoZW4gYWZ0
ZXIgaHZtX2FzaWRfZmx1c2hfY29yZSgpLCBlLmcuCkZMVVNIX0FTSURfQ09SRT8KCkkgYWxzbyB0
aGluayB0aGlzIGNvbnN0YW50IG1pZ2h0IGJldHRlciBiZSB6ZXJvIHdoZW4gIUhWTS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
