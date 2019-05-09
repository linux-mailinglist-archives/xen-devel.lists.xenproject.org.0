Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFAB189D4
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 14:34:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOiCy-00086c-OG; Thu, 09 May 2019 12:31:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOiCx-00086R-4B
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:31:31 +0000
X-Inumbo-ID: 5d38002a-7256-11e9-a427-a37dc03d7857
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d38002a-7256-11e9-a427-a37dc03d7857;
 Thu, 09 May 2019 12:31:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 06:31:26 -0600
Message-Id: <5CD41D9C020000780022D259@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 06:31:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
 <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
 <5CD4141D020000780022D1F5@prv1-mh.provo.novell.com>
 <5fba2297-128c-5015-abb3-7dedd768b8d2@suse.com>
In-Reply-To: <5fba2297-128c-5015-abb3-7dedd768b8d2@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA5LjA1LjE5IGF0IDE0OjAzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OS8wNS8yMDE5IDEzOjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDkuMDUuMTkgYXQg
MTI6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMDkvMDUvMjAxOSAxMjowNCwg
R2VvcmdlIER1bmxhcCB3cm90ZToKPj4+PiBPbiA1LzkvMTkgNjozMiBBTSwgSnVlcmdlbiBHcm9z
cyB3cm90ZToKPj4+Pj4gT24gMDgvMDUvMjAxOSAxODoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+Pj4+IE9uIDUvNi8xOSA3OjU2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+IElu
c3RlYWQgb2YgdXNpbmcgdGhlIFNDSEVEX09QKCkgbWFjcm8gdG8gY2FsbCB0aGUgZGlmZmVyZW50
IHNjaGVkdWxlcgo+Pj4+Pj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdyYXBwZXJz
IGZvciB0aGF0IHB1cnBvc2UuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBzZWVtcyBsaWtlIGEg
Z3JlYXQgaWRlYS4gIE9uZSBtaW5vciBjb21tZW50Li4uCj4+Pj4+Pgo+Pj4+Pj4+ICtzdGF0aWMg
aW5saW5lIGludCBzY2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4+Pj4gK3sKPj4+
Pj4+PiArICAgIEFTU0VSVChzLT5pbml0KTsKPj4+Pj4+PiArICAgIHJldHVybiBzLT5pbml0KHMp
Owo+Pj4+Pj4+ICt9Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRf
ZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArICAgIEFTU0VS
VChzLT5kZWluaXQpOwo+Pj4+Pj4+ICsgICAgcy0+ZGVpbml0KHMpOwo+Pj4+Pj4+ICt9Cj4+Pj4+
Pgo+Pj4+Pj4gSSB0aGluayB0aGVzZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClzLiAgVGhlc2Ug
YXJlbid0IGhvdCBwYXRocywgYW5kIGlmCj4+Pj4+PiB3ZSBkbyBzb21laG93IGhpdCB0aGlzIHNp
dHVhdGlvbiBpbiBwcm9kdWN0aW9uLCAxKSBpdCdzIHNhZmVyIHRvCj4+Pj4+PiBCVUdfT04oKSB0
aGFuIGRlcmVmZXJlbmNpbmcgTlVMTCwgYW5kIDIpIHlvdSdsbCBnZXQgYSBtb3JlIGhlbHBmdWwg
ZXJyb3IKPj4+Pj4+IG1lc3NhZ2UuCj4+Pj4+Cj4+Pj4+IE9ubHkgZm9yIHRob3NlIDIgaW5zdGFu
Y2VzIGFib3ZlPyBPciB3b3VsZCB5b3UgbGlrZSBCVUdfT04oKSBpbnN0ZWFkIG9mCj4+Pj4+IEFT
U0VSVCgpIGluIHRoZSBvdGhlciBhZGRlZCBpbmxpbmVzLCB0b28gKG1heWJlIG5vdCBmb3IgcGlj
a19jcHUsIGJ1dAo+Pj4+PiBlLmcuIHRoZSBvbmVzIGluIGZyZWVfKikgPwo+Pj4+Cj4+Pj4gV2h5
IG5vdCBmb3IgcGlja19jcHUoKT8gIEl0J3MgdGhlIHNhbWUgYmFzaWMgbG9naWMgLS0gaW4gcHJv
ZHVjdGlvbiwgaWYKPj4+PiBpdCAqaXMqIE5VTEwsIHRoZW4geW91J2xsIGVpdGhlciBjcmFzaCB3
aXRoIGEgc2VnZmF1bHQsIG9yIHN0YXJ0Cj4+Pj4gZXhlY3V0aW5nIGFuIGV4cGxvaXQuICBNdWNo
IGJldHRlciB0byBCVUdfT04oKS4KPj4+Cj4+PiBwaWNrX2NwdSBpcyBjYWxsZWQgcmF0aGVyIG9m
dGVuLCBzbyBtYXliZSB3ZSBzaG91bGQgYXZvaWQgYWRkaXRpb25hbAo+Pj4gdGVzdHMuCj4+Pgo+
Pj4gSG1tLCB0aGlua2luZyBtb3JlIGFib3V0IGl0OiB3aHkgZG9uJ3Qgd2UganVzdCBkcm9wIHRo
b3NlIEFTU0VSVC9CVUdfT04KPj4+IGZvciBtYW5kYXRvcnkgZnVuY3Rpb25zIGFuZCB0ZXN0IHRo
ZW0gd2hlbiBkb2luZyB0aGUgZ2xvYmFsX2luaXQoKSBsb29wCj4+PiBvdmVyIGFsbCBzY2hlZHVs
ZXJzLiBXZSBjb3VsZCBqdXN0IHJlamVjdCBzY2hlZHVsZXJzIHdpdGggbWlzc2luZwo+Pj4gZnVu
Y3Rpb25zLgo+PiAKPj4gVGhpcyB3b3VsZCBpbXBseSBwb2ludGVycyBjYW4ndCBiZSB6YXBwZWQg
b2ZmIHRoZSBzdHJ1Y3R1cmVzLgo+PiBJTU8gdGhpcyB3b3VsZCByZXF1aXJlLCBhcyBtaW5pbWFs
IChsYW5ndWFnZSBsZXZlbCkgcHJvdGVjdGlvbiwKPj4gdGhhdCBhbGwgaW5zdGFuY2VzIG9mIHN0
cnVjdCBzY2hlZHVsZXIgYmUgY29uc3QsIHdoaWNoIGRvZXNuJ3QKPj4gbG9vayBkb2FibGUgd2l0
aG91dCBzb21lIGZ1cnRoZXIgcmV3b3JrCj4gCj4gVGhleSBhcmUgY29uc3QgYWxyZWFkeS4KPiAK
PiBUaGUgZGVmYXVsdCBzY2hlZHVsZXIncyBzdHJ1Y3QgaXMgY29waWVkIHRvIGEgbm9uLWNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIKPiBpbiBzY2hlZHVsZXJfaW5pdCgpLgoKRXhhY3RseSwgYW5kIHRo
ZW4gd2UgaGF2ZSB0aGluZ3MgbGlrZQoKc3RhdGljIGludApydF9pbml0KHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcykKewogICAgLi4uCiAgICBvcHMtPnNjaGVkX2RhdGEgPSBwcnY7CgpJLmUuIGl0IHdv
dWxkIGJlIHF1aXRlIGVhc3kgZm9yIGEgc3BlY2lmaWMgc2NoZWR1bGVyIHRvIHphcCBvbmUgb3Ig
bW9yZQpvZiBpdHMgcG9pbnRlcnMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
