Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C69120F57
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 17:26:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igtA0-0001Ci-De; Mon, 16 Dec 2019 16:23:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1igt9z-0001Cd-1g
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 16:23:51 +0000
X-Inumbo-ID: 711ea666-2020-11ea-93ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 711ea666-2020-11ea-93ce-12813bfff9fa;
 Mon, 16 Dec 2019 16:23:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43EF2B229;
 Mon, 16 Dec 2019 16:23:49 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>, axboe@kernel.dk,
 konrad.wilk@oracle.com, roger.pau@citrix.com
References: <20191216161549.26976-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2ad62cc8-ae78-6087-f277-923dc076383a@suse.com>
Date: Mon, 16 Dec 2019 17:23:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191216161549.26976-1-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 2/4] xen/blkback: Squeeze page pools if
 a memory pressure is detected
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
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 pdurrant@amazon.com, sj38.park@gmail.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMTkgMTc6MTUsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gT24gTW9uLCAxNiBEZWMg
MjAxOSAxNTozNzoyMCArMDEwMCBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmNvbT4gd3Jv
dGU6Cj4gCj4+IE9uIE1vbiwgMTYgRGVjIDIwMTkgMTM6NDU6MjUgKzAxMDAgU2VvbmdKYWUgUGFy
ayA8c2pwYXJrQGFtYXpvbi5jb20+IHdyb3RlOgo+Pgo+Pj4gRnJvbTogU2VvbmdKYWUgUGFyayA8
c2pwYXJrQGFtYXpvbi5kZT4KPj4+Cj4gWy4uLl0KPj4+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2sveGVuYnVzLmMKPj4+ICsrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVu
YnVzLmMKPj4+IEBAIC04MjQsNiArODI0LDI0IEBAIHN0YXRpYyB2b2lkIGZyb250ZW5kX2NoYW5n
ZWQoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPj4+ICAgfQo+Pj4gICAKPj4+ICAgCj4+PiAr
LyogT25jZSBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZCwgc3F1ZWV6ZSBmcmVlIHBhZ2Ug
cG9vbHMgZm9yIGEgd2hpbGUuICovCj4+PiArc3RhdGljIHVuc2lnbmVkIGludCBidWZmZXJfc3F1
ZWV6ZV9kdXJhdGlvbl9tcyA9IDEwOwo+Pj4gK21vZHVsZV9wYXJhbV9uYW1lZChidWZmZXJfc3F1
ZWV6ZV9kdXJhdGlvbl9tcywKPj4+ICsJCWJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLCBpbnQs
IDA2NDQpOwo+Pj4gK01PRFVMRV9QQVJNX0RFU0MoYnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMs
Cj4+PiArIkR1cmF0aW9uIGluIG1zIHRvIHNxdWVlemUgcGFnZXMgYnVmZmVyIHdoZW4gYSBtZW1v
cnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQiKTsKPj4+ICsKPj4+ICsvKgo+Pj4gKyAqIENhbGxiYWNr
IHJlY2VpdmVkIHdoZW4gdGhlIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZC4KPj4+ICsgKi8K
Pj4+ICtzdGF0aWMgdm9pZCByZWNsYWltX21lbW9yeShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2
KQo+Pj4gK3sKPj4+ICsJc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUgPSBkZXZfZ2V0X2RydmRhdGEo
JmRldi0+ZGV2KTsKPj4+ICsKPj4+ICsJYmUtPmJsa2lmLT5idWZmZXJfc3F1ZWV6ZV9lbmQgPSBq
aWZmaWVzICsKPj4+ICsJCW1zZWNzX3RvX2ppZmZpZXMoYnVmZmVyX3NxdWVlemVfZHVyYXRpb25f
bXMpOwo+Pgo+PiBUaGlzIGNhbGxiYWNrIG1pZ2h0IHJhY2Ugd2l0aCAneGVuX2Jsa2JrX3Byb2Jl
KCknLiAgVGhlIHJhY2UgY291bGQgcmVzdWx0IGluCj4+IF9fTlVMTCBkZXJlZmVyZW5jaW5nX18s
IGFzICd4ZW5fYmxrYmtfcHJvYmUoKScgc2V0cyAnLT5ibGtpZicgYWZ0ZXIgaXQgbGlua3MKPj4g
J2JlJyB0byB0aGUgJ2RldicuICBQbGVhc2UgX2Rvbid0IG1lcmdlXyB0aGlzIHBhdGNoIG5vdyEK
Pj4KPj4gSSB3aWxsIGRvIG1vcmUgdGVzdCBhbmQgc2hhcmUgcmVzdWx0cy4gIE1lYW53aGlsZSwg
aWYgeW91IGhhdmUgYW55IG9waW5pb24sCj4+IHBsZWFzZSBsZXQgbWUga25vdy4KPiAKPiBOb3Qg
b25seSAnLT5ibGtpZicsIGJ1dCAnYmUnIGl0c2VsZiBhbHNvIGNvdWxlIGJlIGEgTlVMTC4gIEFz
IHNpbWlsYXIKPiBjb25jdXJyZW5jeSBpc3N1ZXMgY291bGQgYmUgaW4gb3RoZXIgZHJpdmVycyBp
biB0aGVpciB3YXksIEkgc3VnZ2VzdCB0byBjaGFuZ2UKPiB0aGUgcmVjbGFpbSBjYWxsYmFjayAo
Jy0+cmVjbGFpbV9tZW1vcnknKSB0byBiZSBjYWxsZWQgZm9yIGVhY2ggZHJpdmVyIGluc3RlYWQK
PiBvZiBlYWNoIGRldmljZS4gIFRoZW4sIGVhY2ggZHJpdmVyIGNvdWxkIGJlIGFibGUgdG8gZGVh
bCB3aXRoIGl0cyBjb25jdXJyZW5jeQo+IGlzc3VlcyBieSBpdHNlbGYuCgpIbW0sIEkgZG9uJ3Qg
bGlrZSB0aGF0LiBUaGlzIHdvdWxkIG5lZWQgdG8gYmUgY2hhbmdlZCBiYWNrIGluIGNhc2Ugd2UK
YWRkIHBlci1ndWVzdCBxdW90YS4KCldvdWxkbid0IGEgZ2V0X2RldmljZSgpIGJlZm9yZSBjYWxs
aW5nIHRoZSBjYWxsYmFjayBhbmQgYSBwdXRfZGV2aWNlKCkKYWZ0ZXJ3YXJkcyBhdm9pZCB0aGF0
IHByb2JsZW0/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
