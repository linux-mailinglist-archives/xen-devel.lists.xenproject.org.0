Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD64116B0F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:31:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGI7-0000E2-TC; Mon, 09 Dec 2019 10:29:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieGI6-0000Du-Nr
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:29:22 +0000
X-Inumbo-ID: c34e6492-1a6e-11ea-87bb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c34e6492-1a6e-11ea-87bb-12813bfff9fa;
 Mon, 09 Dec 2019 10:29:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCE12AD18;
 Mon,  9 Dec 2019 10:29:20 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>
References: <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
 <20191209102347.17337-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7a1dfa22-1108-602f-68ff-ed30a18c1d3d@suse.com>
Date: Mon, 9 Dec 2019 11:29:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209102347.17337-1-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
 memory pressure
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
Cc: linux-block@vger.kernel.org, sj38.park@gmail.com, pdurrant@amazon.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTE6MjMsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gT24gICBNb24sIDkgRGVj
IDIwMTkgMTA6Mzk6MDIgKzAxMDAgIEp1ZXJnZW4gPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4g
Cj4+IE9uIDA5LjEyLjE5IDA5OjU4LCBTZW9uZ0phZSBQYXJrIHdyb3RlOgo+Pj4gRWFjaCBgYmxr
aWZgIGhhcyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcuICBUaGUgc2l6
ZSBvZgo+Pj4gdGhlIHBvb2wgc3RhcnRzIGZyb20gemVybyBhbmQgYmUgaW5jcmVhc2VkIG9uIGRl
bWFuZCB3aGlsZSBwcm9jZXNzaW5nCj4+PiB0aGUgSS9PIHJlcXVlc3RzLiAgSWYgY3VycmVudCBJ
L08gcmVxdWVzdHMgaGFuZGxpbmcgaXMgZmluaXNoZWQgb3IgMTAwCj4+PiBtaWxsaXNlY29uZHMg
aGFzIHBhc3NlZCBzaW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFu
ZAo+Pj4gc2hyaW5rcyB0aGUgcG9vbCB0byBub3QgZXhjZWVkIHRoZSBzaXplIGxpbWl0LCBgbWF4
X2J1ZmZlcl9wYWdlc2AuCj4+Pgo+Pj4gVGhlcmVmb3JlLCBgYmxrZnJvbnRgIHJ1bm5pbmcgZ3Vl
c3RzIGNhbiBjYXVzZSBhIG1lbW9yeSBwcmVzc3VyZSBpbiB0aGUKPj4+IGBibGtiYWNrYCBydW5u
aW5nIGd1ZXN0IGJ5IGF0dGFjaGluZyBhIGxhcmdlIG51bWJlciBvZiBibG9jayBkZXZpY2VzIGFu
ZAo+Pj4gaW5kdWNpbmcgSS9PLgo+Pgo+PiBJJ20gaGF2aW5nIHByb2JsZW1zIHRvIHVuZGVyc3Rh
bmQgaG93IGEgZ3Vlc3QgY2FuIGF0dGFjaCBhIGxhcmdlIG51bWJlcgo+PiBvZiBibG9jayBkZXZp
Y2VzIHdpdGhvdXQgdGhvc2UgaGF2aW5nIGJlZW4gY29uZmlndXJlZCBieSB0aGUgaG9zdCBhZG1p
bgo+PiBiZWZvcmUuCj4+Cj4+IElmIHRob3NlIGRldmljZXMgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQs
IGRvbTAgc2hvdWxkIGJlIHJlYWR5IGZvciB0aGF0Cj4+IG51bWJlciBvZiBkZXZpY2VzLCBlLmcu
IGJ5IGhhdmluZyBlbm91Z2ggc3BhcmUgbWVtb3J5IGFyZWEgZm9yIGJhbGxvb25lZAo+PiBwYWdl
cy4KPiAKPiBBcyBtZW50aW9uZWQgaW4gdGhlIG9yaWdpbmFsIG1lc3NhZ2UgYXMgYmVsb3csIGFk
bWluaXN0cmF0b3JzIF9jYW5fIGF2b2lkIHRoaXMKPiBwcm9ibGVtLCBidXQgZmluZGluZyB0aGUg
b3B0aW1hbCBjb25maWd1cmF0aW9uIGlzIGhhcmQsIGVzcGVjaWFsbHkgaWYgdGhlCj4gbnVtYmVy
IG9mIHRoZSBndWVzdHMgaXMgbGFyZ2UuCj4gCj4gCVN5c3RlbSBhZG1pbmlzdHJhdG9ycyBjYW4g
YXZvaWQgc3VjaCBwcm9ibGVtYXRpYyBzaXR1YXRpb25zIGJ5IGxpbWl0aW5nCj4gCXRoZSBtYXhp
bXVtIG51bWJlciBvZiBkZXZpY2VzIGVhY2ggZ3Vlc3QgY2FuIGF0dGFjaC4gIEhvd2V2ZXIsIGZp
bmRpbmcKPiAJdGhlIG9wdGltYWwgbGltaXQgaXMgbm90IHNvIGVhc3kuICBJbXByb3BlciBzZXQg
b2YgdGhlIGxpbWl0IGNhbgo+IAlyZXN1bHRzIGluIHRoZSBtZW1vcnkgcHJlc3N1cmUgb3IgYSBy
ZXNvdXJjZSB1bmRlcnV0aWxpemF0aW9uLgoKVGhpcyBzb3VuZHMgYXMgaWYgdGhlIGFkbWluIHdv
dWxkIHNldCBhIGRldmljZSBsaW1pdC4gQnV0IGl0IGlzIHRoZQpvdGhlciB3YXkgcm91bmQ6IFRo
ZSBhZG1pbiBuZWVkcyB0byBjb25maWd1cmUgZWFjaCBwb3NzaWJsZSBkZXZpY2UKd2l0aCBhbGwg
cGFyYW1ldGVycyAoZS5nLiBiYWNraW5nIGRvbTAgcmVzb3VyY2UpIGZvciBlbmFibGluZyB0aGUK
ZnJvbnRlbmQgdG8gdXNlIGl0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
