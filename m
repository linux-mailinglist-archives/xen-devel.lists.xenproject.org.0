Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C404219C6A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 13:21:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP3Wu-0000jG-U4; Fri, 10 May 2019 11:17:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP3Wt-0000jB-Jx
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 11:17:31 +0000
X-Inumbo-ID: 32882cb5-7315-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32882cb5-7315-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 11:17:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 05:17:28 -0600
Message-Id: <5CD55DC6020000780022D799@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 05:17:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415*1*jgross@suse.com>
 <20190506065644.7415*46*jgross@suse.com>
 <5CCFF6F1020000780022C12B@suse.com>
 <ac57c420*a72e*7570*db8f*27e4693c2755@suse.com>
 <5CD005E7020000780022C1B5@prv1*mh.provo.novell.com>
 <f7692c11-ab14-4d7d-4b7a-72e9c58e8f30@suse.com>
 <5CD53C1C020000780022D706@suse.com>
 <46968660-ea39-1ee0-2aee-c4a22f135ddb@suse.com>
In-Reply-To: <46968660-ea39-1ee0-2aee-c4a22f135ddb@suse.com>
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

Pj4+IE9uIDEwLjA1LjE5IGF0IDExOjAwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
MC8wNS8yMDE5IDEwOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDguMDUuMTkgYXQg
MTY6MzYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMDYvMDUvMjAxOSAxMjowMSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMDYuMDUuMTkgYXQgMTE6MjMsIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBBbmQgdGhhdCB3YXMgbWVudGlvbmVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXI6IGNwdSBob3RwbHVnIGlzIG5vdCB5ZXQKPj4+Pj4gaGFuZGxlZCAoaGVuY2UgdGhl
IFJGQyBzdGF0dXMgb2YgdGhlIHNlcmllcykuCj4+Pj4+Cj4+Pj4+IFdoZW4gY3B1IGhvdHBsdWcg
aXMgYmVpbmcgYWRkZWQgaXQgbWlnaHQgYmUgYXBwcm9wcmlhdGUgdG8gc3dpdGNoIHRoZQo+Pj4+
PiBzY2hlbWUgYXMgeW91IHN1Z2dlc3RlZC4gUmlnaHQgbm93IHRoZSBjdXJyZW50IHNvbHV0aW9u
IGlzIG11Y2ggbW9yZQo+Pj4+PiBzaW1wbGUuCj4+Pj4KPj4+PiBJIHNlZSAoSSBkaWQgbm90aWNl
IHRoZSBjb3ZlciBsZXR0ZXIgcmVtYXJrLCBidXQgbWFuYWdlZCB0byBub3QKPj4+PiBob25vciBp
dCB3aGVuIHdyaXRpbmcgdGhlIHJlcGx5KSwgYnV0IEknbSB1bmNvbnZpbmNlZCBpZiBpbmN1cnJp
bmcKPj4+PiBtb3JlIGNvZGUgY2h1cm4gYnkgbm90IGRlYWxpbmcgd2l0aCB0aGluZ3MgdGhlICJk
eW5hbWljIiB3YXkKPj4+PiByaWdodCBhd2F5IGlzIGluZGVlZCB0aGUgIm1vcmUgc2ltcGxlIiAo
b3ZlcmFsbCkgc29sdXRpb24uCj4+Pgo+Pj4gSSBoYXZlIHN0YXJ0ZWQgdG8gYWRkcmVzcyBjcHUg
b24vb2ZmbGluaW5nIG5vdy4KPj4+Cj4+PiBUaGVyZSBhcmUgbXVsdGlwbGUgZGVzaWduIGRlY2lz
aW9ucyB0byB0YWtlLgo+Pj4KPj4+IDEuIEludGVyYWN0aW9uIGJldHdlZW4gc2NoZWQtZ3JhbiBh
bmQgc210IGJvb3QgcGFyYW1ldGVycwo+Pj4gMi4gSW50ZXJhY3Rpb24gYmV0d2VlbiBzY2hlZC1n
cmFuIGFuZCB4ZW4taHB0b29sIHNtdCBzd2l0Y2hpbmcKPj4+IDMuIEludGVyYWN0aW9uIGJldHdl
ZW4gc2NoZWQtZ3JhbiBhbmQgc2luZ2xlIGNwdSBvbi9vZmZsaW5pbmcKPj4+Cj4+PiBSaWdodCBu
b3cgYW55IGd1ZXN0IHdvbid0IHNlZSBhIGRpZmZlcmVuY2UgcmVnYXJkaW5nIHNjaGVkLWdyYW4K
Pj4+IHNlbGVjdGlvbi4gVGhpcyBtZWFucyB3ZSBkb24ndCBoYXZlIHRvIHRoaW5rIGFib3V0IHBv
dGVudGlhbCBtaWdyYXRpb24KPj4+IHJlc3RyaWN0aW9ucy4gVGhpcyBtaWdodCBjaGFuZ2UgaW4g
ZnV0dXJlIHdoZW4gd2Ugd2FudCB0byBlbmFibGUgdGhlCj4+PiBndWVzdCB0byBlLmcuIHVzZSBj
b3JlIHNjaGVkdWxpbmcgdGhlbXNlbHZlcyBpbiBvcmRlciB0byBtaXRpZ2F0ZQo+Pj4gYWdhaW5z
dCBzaWRlIGNoYW5uZWwgYXR0YWNrcyB3aXRoaW4gdGhlIGd1ZXN0Lgo+Pj4KPj4+IFRoZSBtb3N0
IHNpbXBsZSBzb2x1dGlvbiB3b3VsZCBiZSAoYW5kIEknZCBsaWtlIHRvIHNlbmQgb3V0IFYxIG9m
IG15Cj4+PiBzZXJpZXMgd2l0aCB0aGF0IGltcGxlbWVudGVkKToKPj4+Cj4+PiBzY2hlZC1ncmFu
PWNvcmUgYW5kIHNjaGVkLWdyYW49c29ja2V0IGRvbid0IGFsbG93IGR5bmFtaWNhbCBzd2l0Y2hp
bmcKPj4+IG9mIHNtdCB2aWEgeGVuLWhwdG9vbC4KPj4+Cj4+PiBXaXRoIHNjaGVkLWdyYW49Y29y
ZSBvciBzY2hlZC1ncmFuPXNvY2tldCBvZmZsaW5pbmcgYSBzaW5nbGUgY3B1IHJlc3VsdHMKPj4+
IGluIG1vdmluZyB0aGUgY29tcGxldGUgY29yZSBvciBzb2NrZXQgdG8gY3B1cG9vbF9mcmVlX2Nw
dXMgYW5kIHRoZW4KPj4+IG9mZmxpbmluZyBmcm9tIHRoZXJlLiBPbmx5IGNvbXBsZXRlIGNvcmVz
L3NvY2tldHMgY2FuIGJlIG1vdmVkIHRvIGFueQo+Pj4gY3B1cG9vbC4gV2hlbiBvbmxpbmluZyBh
IGNwdSBpdCBpcyBhZGRlZCB0byBjcHVwb29sX2ZyZWVfY3B1cyBhbmQgaWYKPj4+IHRoZSBjb3Jl
L3NvY2tldCBpcyBjb21wbGV0ZWx5IG9ubGluZSBpdCB3aWxsIGF1dG9tYXRpY2FsbHkgYmUgYWRk
ZWQgdG8KPj4+IFBvb2wtMCAoYXMgdG9kYXkgYW55IHNpbmdsZSBvbmxpbmVkIGNwdSkuCj4+IAo+
PiBXZWxsLCB0aGlzIGlzIGluIGxpbmUgd2l0aCB3aGF0IHdhcyBkaXNjdXNzZWQgb24gdGhlIGNh
bGwgeWVzdGVyZGF5LCBzbwo+PiBJIHRoaW5rIGl0J3MgYW4gYWNjZXB0YWJsZSBpbml0aWFsIHN0
YXRlIHRvIGVuZCB1cCBpbi4gQWxiZWl0LCBqdXN0IGZvcgo+PiBjb21wbGV0ZW5lc3MsIEknbSBu
b3QgY29udmluY2VkIHRoZXJlJ3Mgbm8gdXNlIGZvciAic210LXtkaXMsZW59YWJsZSIKPj4gYW55
bW9yZSB3aXRoIGNvcmUtYXdhcmUgc2NoZWR1bGluZyBpbXBsZW1lbnRlZCBqdXN0IGluIFhlbiAt
IGl0Cj4+IG1heSBzdGlsbCBiZSBjb25zaWRlcmVkIHVzZWZ1bCBhcyBsb25nIGFzIHdlIGRvbid0
IGV4cG9zZSBwcm9wZXIKPj4gdG9wb2xvZ3kgdG8gZ3Vlc3RzLCBmb3IgdGhlbSB0byBiZSBhYmxl
IHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyLgo+IAo+IEFzIHRoZSBleHRyYSBjb21wbGV4aXR5IGZv
ciBzdXBwb3J0aW5nIHRoYXQgaXMgc2lnbmlmaWNhbnQgSSdkIGxpa2UgdG8KPiBhdCBsZWFzdCBw
b3N0cG9uZSBpdC4KClVuZGVyc3Rvb2QuCgo+IEFuZCB3aXRoIHRoZSAobGF0ZXIpIGludHJvZHVj
dGlvbiBvZiBwZXItY3B1cG9vbAo+IHNtdCBvbi9vZmYgSSBndWVzcyB0aGlzIHdvdWxkIGJlIGV2
ZW4gbGVzcyBpbXBvcnRhbnQuCgpMaWtlbHksIHNpbmNlIHBvb2xzIHRoZW1zZWx2ZXMgY2FuIGJl
IGNyZWF0ZWQgYW5kIGRlc3Ryb3llZApkeW5hbWljYWxseS4gQXQgdGhhdCBwb2ludCB0aGlzIHdv
dWxkIGJhc2ljYWxseSBiZSBhIG1vcmUKZmluZS1ncmFpbmVkIHNtdC17ZW4sZGlzfWFibGUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
