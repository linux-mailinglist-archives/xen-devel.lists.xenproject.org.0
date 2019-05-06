Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A514941
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:01:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNcGS-0002zP-Cb; Mon, 06 May 2019 11:58:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNcGQ-0002zK-Q1
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 11:58:34 +0000
X-Inumbo-ID: 452be96a-6ff6-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 452be96a-6ff6-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 11:58:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 05:58:31 -0600
Message-Id: <5CD02161020000780022C257@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 05:58:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415*1*jgross@suse.com>
 <20190506065644.7415*46*jgross@suse.com>
 <5CCFF6F1020000780022C12B@suse.com>
 <ac57c420-a72e-7570-db8f-27e4693c2755@suse.com>
 <5CD005E7020000780022C1B5@suse.com>
 <869f9821-3f9d-3d75-ef65-30135824fc69@suse.com>
In-Reply-To: <869f9821-3f9d-3d75-ef65-30135824fc69@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDEyOjIwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ni8wNS8yMDE5IDEyOjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkgYXQg
MTE6MjMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMDYvMDUvMjAxOSAxMDo1Nywg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gLiBZZXQgdGhlbiBJJ20gYSBsaXR0bGUgcHV6emxlZCBi
eSBpdHMgdXNlIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pj4+IEdlbmVyYWxseSBJIHRoaW5r
IGZvcl9lYWNoX2NwdSgpIHVzZXMgaW4gX19pbml0IGZ1bmN0aW9ucyBhcmUKPj4+PiBwcm9ibGVt
YXRpYywgYXMgdGhleSB0aGVuIHJlcXVpcmUgZnVydGhlciBjb2RlIGVsc2V3aGVyZSB0bwo+Pj4+
IGRlYWwgd2l0aCBob3Qtb25saW5pbmcuIEEgcHJlLVNNUC1pbml0Y2FsbCBwbHVzIHVzZSBvZiBD
UFUKPj4+PiBub3RpZmllcnMgaXMgdHlwaWNhbGx5IG1vcmUgYXBwcm9wcmlhdGUuCj4+Pgo+Pj4g
QW5kIHRoYXQgd2FzIG1lbnRpb25lZCBpbiB0aGUgY292ZXIgbGV0dGVyOiBjcHUgaG90cGx1ZyBp
cyBub3QgeWV0Cj4+PiBoYW5kbGVkIChoZW5jZSB0aGUgUkZDIHN0YXR1cyBvZiB0aGUgc2VyaWVz
KS4KPj4+Cj4+PiBXaGVuIGNwdSBob3RwbHVnIGlzIGJlaW5nIGFkZGVkIGl0IG1pZ2h0IGJlIGFw
cHJvcHJpYXRlIHRvIHN3aXRjaCB0aGUKPj4+IHNjaGVtZSBhcyB5b3Ugc3VnZ2VzdGVkLiBSaWdo
dCBub3cgdGhlIGN1cnJlbnQgc29sdXRpb24gaXMgbXVjaCBtb3JlCj4+PiBzaW1wbGUuCj4+IAo+
PiBJIHNlZSAoSSBkaWQgbm90aWNlIHRoZSBjb3ZlciBsZXR0ZXIgcmVtYXJrLCBidXQgbWFuYWdl
ZCB0byBub3QKPj4gaG9ub3IgaXQgd2hlbiB3cml0aW5nIHRoZSByZXBseSksIGJ1dCBJJ20gdW5j
b252aW5jZWQgaWYgaW5jdXJyaW5nCj4+IG1vcmUgY29kZSBjaHVybiBieSBub3QgZGVhbGluZyB3
aXRoIHRoaW5ncyB0aGUgImR5bmFtaWMiIHdheQo+PiByaWdodCBhd2F5IGlzIGluZGVlZCB0aGUg
Im1vcmUgc2ltcGxlIiAob3ZlcmFsbCkgc29sdXRpb24uCj4gCj4gRXNwZWNpYWxseSB3aXRoIGhv
dHBsdWcgdGhpbmdzIGFyZSBiZWNvbWluZyBtb3JlIGNvbXBsaWNhdGVkOiBJJ2QgbGlrZQo+IHRv
IGhhdmUgdGhlIGZpbmFsIHZlcnNpb24gZmFsbCBiYWNrIHRvIHNtYWxsZXIgZ3JhbnVsYXJpdGll
cyBpbiBjYXNlCj4gZS5nLiB0aGUgdXNlciBoYXMgc2VsZWN0ZWQgc29ja2V0IHNjaGVkdWxpbmcg
YW5kIHR3byBzb2NrZXRzIGhhdmUKPiBkaWZmZXJlbnQgbnVtYmVycyBvZiBjb3Jlcy4gV2l0aCBo
b3RwbHVnIHN1Y2ggYSBzaXR1YXRpb24gbWlnaHQgYmUKPiBkaXNjb3ZlcmVkIG9ubHkgd2l0aCBz
b21lIGRvbVVzIGFscmVhZHkgcnVubmluZywgc28gaG93IHNob3VsZCB3ZQo+IHJlYWN0IGluIHRo
YXQgY2FzZT8gRG9pbmcgcGFuaWMoKSBpcyBubyBvcHRpb24sIHNvIGVpdGhlciB3ZSByZWplY3QK
PiBvbmxpbmluZyB0aGUgYWRkaXRpb25hbCBzb2NrZXQsIG9yIHdlIGFkYXB0IGJ5IGR5bmFtaWNh
bGx5IG1vZGlmeWluZyB0aGUKPiBzY2hlZHVsaW5nIGdyYW51bGFyaXR5LiBXaXRob3V0IHRoYXQg
YmVpbmcgZGlzY3Vzc2VkIEkgZG9uJ3QgdGhpbmsgaXQKPiBtYWtlcyBzZW5zZSB0byBwdXQgYSBs
b3QgZWZmb3J0IGludG8gYSBzb2x1dGlvbiB3aGljaCBpcyBnb2luZyB0byBiZQo+IHJlamVjdGVk
IGluIHRoZSBlbmQuCgpIbW0sIHdoZXJlJ3MgdGhlIHN5bW1ldHJ5IHJlcXVpcmVtZW50IGNvbWlu
ZyBmcm9tPyBTb2NrZXQKc2NoZWR1bGluZyBzaG91bGQgbWVhbiBhcyBtYW55IHZDUFUtcyBvbiBv
bmUgc29ja2V0IGFzIHRoZXJlCmFyZSBjb3JlcyAqIHRocmVhZHM7IHNpbWlsYXJseSBjb3JlIHNj
aGVkdWxpbmcgKG51bWJlciBvZiB0aHJlYWRzKS4KU3RhdGljYWxseSBwYXJ0aXRpb25pbmcgZG9t
YWlucyB3b3VsZCBzZWVtIGFuIGludGVybWVkaWF0ZSBzdGVwCmF0IGJlc3Qgb25seSBhbnl3YXks
IGFzIHRoYXQgcmVxdWlyZXMgKG9uIGF2ZXJhZ2UpIGxlYXZpbmcgbW9yZQpyZXNvdXJjZXMgKGNv
cmVzL3RocmVhZHMpIGlkbGUgdGhhbiB3aXRoIGEgZHluYW1pYyBwYXJ0aXRpb25pbmcKbW9kZWwu
CgpBcyB0byB5b3VyIHNwZWNpZmljIHF1ZXN0aW9uIGhvdyB0byByZWFjdDogU2luY2UgYnJpbmdp
bmcgb25saW5lCmEgZnVsbCBuZXcgc29ja2V0IGltcGxpZXMgYnJpbmdpbmcgb25saW5lIGFsbCBp
dHMgY29yZXMgLyB0aHJlYWRzIG9uZQpieSBvbmUgYW55d2F5LCBhICJ0b28gc21hbGwiIHNvY2tl
dCBpbiB5b3VyIHNjaGVtZSB3b3VsZApzaW1wbHkgcmVzdWx0IGluIHRoZSBzb2NrZXQgcmVtYWlu
aW5nIHVudXNlZCB1bnRpbCAiZW5vdWdoIgpjb3Jlcy90aHJlYWRzIGhhdmUgYXBwZWFyZWQuIFNp
bWlsYXJseSB0aGUgc29ja2V0IHdvdWxkIGdvCm91dCBvZiB1c2UgYXMgc29vbiBhcyBvbmUgb2Yg
aXRzIGNvcmVzL3RocmVhZHMgZ2V0cyBvZmZsaW5lZC4KT2J2aW91c2x5IHRoaXMgZW5kcyB1cCBw
cm9ibGVtYXRpYyBmb3IgdGhlIGxhc3QgdXNhYmxlIHNvY2tldC4KCkJ1dCB3aXRoIHRoZSBzdGF0
aWMgcGFydGl0aW9uaW5nIHlvdSBkZXNjcmliZSBJIGFsc28gY2FuJ3QgcmVhbGx5CnNlZSBob3cg
Inhlbi1ocHRvb2wgc210LWRpc2FibGUiIGlzIGdvaW5nIHRvIHdvcmsuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
