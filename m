Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220BE4B216
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 08:26:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdTxg-000462-Dz; Wed, 19 Jun 2019 06:20:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdTxe-00045w-3J
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 06:20:46 +0000
X-Inumbo-ID: 5e7bb0db-925a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5e7bb0db-925a-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 06:20:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 00:20:43 -0600
Message-Id: <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 00:20:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
 <20190618172245.GA16087@amd.com>
In-Reply-To: <20190618172245.GA16087@amd.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE5OjIyLCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDY6NDI6MzNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxMC4wNi4xOSBhdCAxODoyOCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IE9uIDIzLzA1LzIwMTkgMTM6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+
PiA+PiBUQkQ6IENhbiB3ZSBzZXQgbG9jYWxfYXBpY190aW1lcl9jMl9vayB0byB0cnVlPyBJIGNh
bid0IHNlZW0gdG8gZmluZCBhbnkKPj4gPj4gICAgICBzdGF0ZW1lbnQgaW4gdGhlIEJLREcgLyBQ
UFIgYXMgdG8gd2hldGhlciB0aGUgTEFQSUMgdGltZXIgY29udGludWVzCj4+ID4+ICAgICAgcnVu
bmluZyBpbiBDQzYuCj4+ID4gCj4+ID4gVGhpcyBvdWdodCB0byBiZSBlYXN5IHRvIGRldGVybWlu
ZS4gIEdpdmVuIHRoZSBkZXNjcmlwdGlvbiBvZiBDQzYKPj4gPiBmbHVzaGluZyB0aGUgY2FjaGUg
YW5kIHBvd2VyIGdhdGluZyB0aGUgY29yZSwgSSdkIHNheSB0aGVyZSBpcyBhCj4+ID4gcmVhc29u
YWJsZSBjaGFuY2UgdGhhdCB0aGUgTEFQSUMgdGltZXIgc3RvcHMgaW4gQ0M2Lgo+PiAKPj4gQnV0
ICJyZWFzb25hYmxlIGNoYW5jZSIgaXNuJ3QgZW5vdWdoIGZvciBteSB0YXN0ZSBoZXJlLiBBbmQg
ZnJvbQo+PiB3aGF0IHlvdSBkZWR1Y2UsIHRoZSBhbnN3ZXIgdG8gdGhlIHF1ZXN0aW9uIHdvdWxk
IGJlICJubyIsIGFuZAo+PiBoZW5jZSBzaW1wbHkgbm8gY2hhbmdlIHRvIGJlIG1hZGUgYW55d2hl
cmUuIChJIGRvIHRoaW5rIHRob3VnaAo+PiB0aGF0IGl0J3MgbW9yZSBjb21wbGljYXRlZCB0aGFu
IHRoaXMsIGJlY2F1c2UgaWlyYyBtdWNoIGFsc28gZGVwZW5kcwo+PiBvbiB3aGF0IHRoZSBmaXJt
d2FyZSBhY3R1YWxseSBkb2VzLikKPiAKPiBUaGUgTEFQSUMgdGltZXIgbmV2ZXIgc3RvcHMgb24g
dGhlIGN1cnJlbnRseSBwbGF0Zm9ybXMgKE5hcGxlcyBhbmQKPiBSb21lKS4gIFRoaXMgaXMgYSBr
bm93bGVkZ2FibGUgSFcgZW5naW5lZXIgc28uCgpUaGFua3MgLSBJJ3ZlIHRha2VuIG5vdGUgdG8g
c2V0IHRoZSB2YXJpYWJsZSBhY2NvcmRpbmdseSB0aGVuLgoKPj4gPj4gVEJEOiBXZSBtYXkgd2Fu
dCB0byB2ZXJpZnkgdGhhdCBITFQgaW5kZWVkIGlzIGNvbmZpZ3VyZWQgdG8gZW50ZXIgQ0M2Lgo+
PiA+IAo+PiA+IEkgY2FuJ3QgYWN0dWFsbHkgc3BvdCBhbnl0aGluZyB3aGljaCB0YWxrcyBhYm91
dCBITFQgZGlyZWN0bHkuICBUaGUKPj4gPiBjbG9zZXN0IEkgY2FuIHBvc3QgaXMgQ0ZPSCAoY2Fj
aGUgZmx1c2ggb24gaGFsdCkgd2hpY2ggaXMgYW4KPj4gPiBhdXRvLXRyYW5zaXRpb24gZnJvbSBD
QzEgdG8gQ0M2IGFmdGVyIGEgc3BlY2lmaWMgdGltZW91dCwgYnV0IHRoZQo+PiA+IHdvcmRpbmcg
c3VnZ2VzdHMgdGhhdCBtd2FpdCB3b3VsZCBhbHNvIHRha2UgdGhpcyBwYXRoLgo+PiAKPj4gV2Vs
bCwgSSBoYWQgY29tZSBhY3Jvc3MgYSBzZWN0aW9uIGRlc2NyaWJpbmcgaG93IEhMVCBjYW4gYmUK
Pj4gY29uZmlndXJlZCB0byBiZSB0aGUgc2FtZSBhY3Rpb24gYXMgdGhlIEkvTyBwb3J0IHJlYWQg
ZnJvbSBvbmUKPj4gb2YgdGhlIHRocmVlIHBvcnRzIGludm9sdmVkIGluIEMtc3RhdGUgbWFuYWdl
bWVudAo+PiAoQ1N0YXRlQmFzZUFkZHIrMC4uLjIpLiBCdXQgSSBjYW4ndCBzZWVtIHRvIGZpbmQg
dGhpcyBhZ2Fpbi4KPj4gCj4+IEFzIHRvIE1XQUlUIGJlaGF2aW5nIHRoZSBzYW1lLCBJIGRvbid0
IHRoaW5rIEkgY2FuIHNwb3QgcHJvb2YKPj4gb2YgeW91ciBpbnRlcnByZXRhdGlvbiBvciBwcm9v
ZiBvZiBCcmlhbidzLgo+IAo+IEl0J3Mgbm90IHJlYWxseSBkb2N1bWVudGVkIGNsZWFybHkuICBJ
IGdvdCBteSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBIVwo+IGVuZ2luZWVycy4gIEkndmUgYWxyZWFk
eSBwb3N0ZWQgd2hhdCBpbmZvcm1hdGlvbiBJIGtub3cgc28gSSB3b24ndAo+IHJlcGVhdCBpdC4K
CkF0IGxlYXN0IGEgcG9pbnRlciB0byB3aGVyZSB5b3UgaGFkIHN0YXRlZCB0aGlzIHdvdWxkIGhh
dmUgYmVlbgpuaWNlLiBJaXJjIHRoZXJlJ3Mgbm8gcHJvbW90aW9uIGludG8gQ0M2IGluIHRoYXQg
Y2FzZSwgaW4gY29udHJhc3QKdG8gQW5kcmV3J3MgcmVhZGluZyBvZiB0aGUgZG9jLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
