Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6012F6FD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:06:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKke-0001G2-3D; Fri, 03 Jan 2020 11:04:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inKkd-0001Fx-BU
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:04:19 +0000
X-Inumbo-ID: c9564f36-2e18-11ea-a448-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9564f36-2e18-11ea-a448-12813bfff9fa;
 Fri, 03 Jan 2020 11:04:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62546AC0C;
 Fri,  3 Jan 2020 11:04:17 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall@gmail.com>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
 <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
 <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <751bc20c-7c85-d7b1-c3e7-f2a1e77b60a5@suse.com>
Date: Fri, 3 Jan 2020 12:05:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxMTo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI3
LzEyLzIwMTkgMTI6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyNy4xMi4yMDE5IDEyOjI3
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBKYW4sCj4+Pgo+Pj4gT24gRnJpLCAyNyBEZWMg
MjAxOSwgMDk6MjIgSmFuIEJldWxpY2gsIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4+IE9uIDIzLjEyLjIwMTkgMTg6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGkgSmFu
LAo+Pj4+Pgo+Pj4+PiBPbiAyMC8xMi8yMDE5IDE0OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4+IFRoZXJlJ3MgYmVlbiBlZmZlY3RpdmVseSBubyB1c2Ugb2YgdGhlIGZpZWxkIGZvciBIVk0u
Cj4+Pj4+Pgo+Pj4+Pj4gQWxzbyBzaHJpbmsgdGhlIGZpZWxkIHRvIHVuc2lnbmVkIGludCwgZXZl
biBpZiB0aGlzIGRvZXNuJ3QgaW1tZWRpYXRlbHkKPj4+Pj4+IHlpZWxkIGFueSBzcGFjZSBiZW5l
Zml0IGZvciB0aGUgc3RydWN0dXJlIGl0c2VsZi4gVGhlIHJlc3VsdGluZyAzMi1iaXQKPj4+Pj4+
IHBhZGRpbmcgc2xvdCBjYW4gZXZlbnR1YWxseSBiZSB1c2VkIGZvciBzb21lIG90aGVyIGZpZWxk
LiBUaGUgY2hhbmdlIGluCj4+Pj4+PiBzaXplIG1ha2VzIGFjY2Vzc2VzIHNsaWdodGx5IG1vcmUg
ZWZmaWNpZW50IHRob3VnaCwgYXMgbm8gUkVYLlcgcHJlZml4Cj4+Pj4+PiBpcyBnb2luZyB0byBi
ZSBuZWVkZWQgYW55bW9yZSBvbiB0aGUgcmVzcGVjdGl2ZSBpbnNucy4KPj4+Pj4+Cj4+Pj4+PiBN
aXJyb3IgdGhlIEhWTSBzaWRlIGNoYW5nZSBoZXJlIChkcm9wcGluZyBvZiBzZXR0aW5nIHRoZSBm
aWVsZCB0bwo+Pj4+Pj4gVkdDRl9vbmxpbmUpIGFsc28gdG8gQXJtLCBvbiB0aGUgYXNzdW1wdGlv
biB0aGF0IGl0IHdhcyBjbG9uZWQgbGlrZQo+Pj4+Pj4gdGhpcyBvcmlnaW5hbGx5LiBWR0NGX29u
bGluZSByZWFsbHkgc2hvdWxkIHNpbXBseSBhbmQgY29uc2lzdGVudGx5IGJlCj4+Pj4+PiB0aGUg
Z3Vlc3QgdmlldyBvZiB0aGUgaW52ZXJzZSBvZiBWUEZfZG93biwgYW5kIGhlbmNlIG5lZWRzIHJl
cHJlc2VudGluZwo+Pj4+Pj4gb25seSBpbiB0aGUgZ2V0L3NldCB2Q1BVIGNvbnRleHQgaW50ZXJm
YWNlcy4KPj4+Pj4KPj4+Pj4gQnV0IHZQU0NJIGlzIGp1c3QgYSB3cmFwcGVyIHRvIGdldC9zZXQg
dkNQVSBjb250ZXh0IGludGVyZmFjZXMuIFlvdXIKPj4+Pj4gY2hhbmdlcyBiZWxvdyB3aWxsIGNs
ZWFybHkgYnJlYWsgYnJpbmctdXAgb2Ygc2Vjb25kYXJ5IHZDUFVzIG9uIEFybS4KPj4+Pj4KPj4+
Pj4gVGhpcyBpcyBiZWNhdXNlIGFyY2hfc2V0X2d1ZXN0X2luZm8oKSB3aWxsIHJlbHkgb24gdGhp
cyBmbGFnIHRvCj4+Pj4+IGNsZWFyL3NldCBWUEZfZG93biBpbiB0aGUgcGF1c2UgZmxhZ3MuCj4+
Pj4+Cj4+Pj4+IFNvIEkgdGhpbmsgdGhlIGxpbmUgaW4gYXJtL3Zwc2NpLmMgc2hvdWxkIGJlIGxl
ZnQgYWxvbmUuCj4+Pj4KPj4+PiBPaCwgSSBzZWUgLSBJIGRpZG4ndCBub3RpY2UgdGhpcyAoYWIp
dXNlIGRlc3BpdGUgLi4uCj4+Pj4KPj4+Cj4+PiBPdXQgb2YgSW50ZXJlc3QsIHdoeSBkbyB5b3Ug
dGhpbmsgaXQgaXMgYW4gYWJ1c2UgaGVyZSBhbmQgbm90IGluIHRoZQo+Pj4gdG9vbHN0YWNrPwo+
Pj4KPj4+IEhvdyBkbyB5b3Ugc3VnZ2VzdCB0byBpbXByb3ZlIGl0PyBJIGNhbiBhZGQgaXQgaW4g
bXkgaW1wcm92ZW1lbnQgbGlzdCBmb3IKPj4+IEFybS4KPj4KPj4gT2gsICJhYnVzZSIgd2FzIGFi
b3V0IHRoZSBhcmNoX3NldF9ndWVzdF9pbmZvKCkgdXNlLCBub3QgdGhlIHVzZSBvZgo+PiB0aGUg
ZmxhZyBieSB0aGUgdG9vbCBzdGFjay4KPiAKPiBJIG1heSBoYXZlIHJlYWQgaW5jb3JyZWN0bHkg
eW91ciBlLW1haWwsIGFsdGhvdWdoIEkgdGhpbmsgbXkgcXVlc3Rpb25zIAo+IGFib3V0IHdoeSB0
aGlzIGlzIGFuIGFidXNlIGFuZCBob3cgZG8geW91IHN1Z2dlc3QgdG8gaW1wcm92ZSBhcmUgc3Rp
bGwgCj4gcmVsZXZhbnQuCgphcmNoX3NldF9pbmZvX2d1ZXN0KCkgaXMgaW50ZW5kZWQgdG8gYmUg
dXNlZCBmb3IgZXhhY3RseSBvbmUgcHVycG9zZQotIHZDUFUgY29udGV4dCBpbml0aWFsaXphdGlv
biB2aWEgaHlwZXJjYWxsLiBXaXRoIHRoaXMsIGFuZCBfd2l0aG91dF8KbWUga25vd2luZyBhbnl0
aGluZyBhYm91dCBQU0NJLCBpdCBfbG9va3NfIHRvIG1lIHRvIGJlIGFuIGFidXNlLiBJJ2QKZXhw
ZWN0IHRoZXJlIHRvIGJlIHNvbWV0aGluZyBpbiB4ODYgdGhhdCBjb3VsZCBiZSB1c2VkIGZvcgpj
b21wYXJpc29uLCBhbmQgd2hhdGV2ZXIgdGhhdCBpcyAtIGl0IGRvZXNuJ3QgbmVlZCBhIHNpbWls
YXIgZXh0cmEKdXNlIG9mIGFyY2hfc2V0X2luZm9fZ3Vlc3QoKS4gKEFzIGEgcmVzdWx0LCBJIGRv
bid0IHNlZSBob3cgSSBjb3VsZApyZWFzb25hYmx5IGdpdmUgYSBjb25jcmV0ZSBzdWdnZXN0aW9u
IHRvd2FyZHMgaW1wcm92ZW1lbnQuIEluIGZhY3QgSQptYXkgYmUgZW50aXJlbHkgd3Jvbmcgd2l0
aCBteSBmZWVsaW5nIG9mIHRoaXMgYmVpbmcgYW4gYWJ1c2UgaW4gdGhlCmZpcnN0IHBsYWNlLikK
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
