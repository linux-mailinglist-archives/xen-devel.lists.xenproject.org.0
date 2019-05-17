Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFAA21552
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 10:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRY7y-0001hN-J6; Fri, 17 May 2019 08:22:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRY7w-0001hG-Vj
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 08:22:05 +0000
X-Inumbo-ID: d951484c-787c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d951484c-787c-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 08:22:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 02:22:02 -0600
Message-Id: <5CDE6F29020000780022FF9B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 02:22:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415****1****jgross@suse.com>
 <20190506065644.7415****43****jgross@suse.com>
 <5CDD6005020000780022FA9A@suse.com>
 <074965f8*b20f*9dc3*2729*7f3c4793b38d@suse.com>
 <5CDD7693020000780022FC59@suse.com>
 <7bfa4c94-ccf1-0b3c-6f92-d4f87b591961@suse.com>
 <5CDE5B4E020000780022FEFC@suse.com>
 <8bd2ca73-c9a7-beab-e067-956dfa9d0948@suse.com>
In-Reply-To: <8bd2ca73-c9a7-beab-e067-956dfa9d0948@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 42/45] xen/sched: add fall back to
 idle vcpu when scheduling item
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

Pj4+IE9uIDE3LjA1LjE5IGF0IDA5OjQ4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Ny8wNS8yMDE5IDA4OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTcuMDUuMTkgYXQg
MDc6MTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMTYvMDUvMjAxOSAxNjo0MSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTYuMDUuMTkgYXQgMTU6NTEsIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBBcyB3aXRoIGNvcmUgc2NoZWR1bGluZyB3ZSBjYW4gYmUg
c3VyZSB0aGUgb3RoZXIgdGhyZWFkIGlzIGFjdGl2ZQo+Pj4+PiAob3RoZXJ3aXNlIHdlIHdvdWxk
IHNjaGVkdWxlIHRoZSBpZGxlIGl0ZW0pIGFuZCBob3BpbmcgZm9yIHNhdmluZyBwb3dlcgo+Pj4+
PiBieSB1c2luZyBtd2FpdCBpcyBtb290Lgo+Pj4+Cj4+Pj4gU2F2aW5nIHBvd2VyIG1heSBiZSBp
bmRpcmVjdCwgYnkgdGhlIENQVSByZS1hcnJhbmdpbmcKPj4+PiByZXNvdXJjZSBhc3NpZ25tZW50
IGJldHdlZW4gdGhyZWFkcyB3aGVuIG9uZSBnb2VzIGlkbGUuCj4+Pj4gSSBoYXZlIG5vIGlkZWEg
d2hldGhlciB0aGV5IGRvIHRoaXMgd2hlbiBlbnRlcmluZyBDMSwgb3IKPj4+PiBvbmx5IHdoZW4g
ZW50ZXJpbmcgZGVlcGVyIEMgc3RhdGVzLgo+Pj4KPj4+IFNETSBWb2wuIDMgY2hhcHRlciA4LjEw
LjEgIkhMVCBpbnN0cnVjdGlvbiI6Cj4+Pgo+Pj4gIkhlcmUgc2hhcmVkIHJlc291cmNlcyB0aGF0
IHdlcmUgYmVpbmcgdXNlZCBieSB0aGUgaGFsdGVkIGxvZ2ljYWwKPj4+IHByb2Nlc3NvciBiZWNv
bWUgYXZhaWxhYmxlIHRvIGFjdGl2ZSBsb2dpY2FsIHByb2Nlc3NvcnMsIGFsbG93aW5nIHRoZW0K
Pj4+IHRvIGV4ZWN1dGUgYXQgZ3JlYXRlciBlZmZpY2llbmN5LiIKPj4gCj4+IFRvIGJlIGhvbmVz
dCwgdGhpcyBpcyB0byBicm9hZC9nZW5lcmljIGEgc3RhdGVtZW50IHRvIGZ1bGx5Cj4+IHRydXN0
IGl0LCBqdWRnaW5nIGZyb20gb3RoZXIgYXJlYXMgb2YgdGhlIFNETS4gQW5kIHRoZW4sIGFzCj4+
IHBlciBhYm92ZSwgd2hhdCBhYm91dCB0aGUgc29ja2V0IGdyYW51bGFyaXR5IGNhc2U/IFB1dHRp
bmcKPj4gZW50aXJlbHkgaWRsZSBjb3JlcyB0byBzbGVlcCBpcyBzdXJlbHkgd29ydGh3aGlsZT8K
PiAKPiBZZXMsIEkgYXNzdW1lIGl0IGlzLiBPVE9IIHRoaXMgbWlnaHQgYWZmZWN0IGNvbnRleHQg
c3dpdGNoZXMgYmFkbHkKPiBhcyB0aGUgcmVhY3Rpb24gdGltZSBmb3IgdGhlIGNvb3JkaW5hdGVk
IHN3aXRjaCB3aWxsIHJpc2UuIE1heWJlIGEKPiBnb29kIHJlYXNvbiBmb3IgYW5vdGhlciBzdWIt
b3B0aW9uPwoKV2hpbGUgSSBhZ3JlZSB0aGF0IGZpbmUgZ3JhaW5lZCBjb250cm9sIGlzIHVzZWZ1
bCwgSSdtIHNlZWluZyBhbgppbmNyZWFzaW5nIHJpc2sgb2YgdGhlcmUgZ29pbmcgdG8gYmUgdG9v
IG1hbnkgY29udHJvbHMgdG8gYWN0dWFsbHkKYmUgY2VydGFpbiBpbiB0aGUgZW5kIHRoYXQgYWxs
IHBvc3NpYmxlIGNvbWJpbmF0aW9ucyB3b3JrCmNvcnJlY3RseS4KCj4+Pj4gQW5kIGFueXdheSAt
IEknbSBzdGlsbCBub25lIHRoZSB3aXNlciBhcyB0byB0aGUgdi0+aXNfdXJnZW50Cj4+Pj4gcmVs
YXRpb25zaGlwLgo+Pj4KPj4+IFdpdGggdi0+aXNfdXJnZW50IHNldCB0b2RheSdzIGlkbGUgbG9v
cCB3aWxsIGRyb3AgaW50byBkZWZhdWx0X2lkbGUoKS4KPj4+IEkgY2FuIHJlbW92ZSB0aGlzIHNl
bnRlbmNlIGluIGNhc2UgaXQgaXMganVzdCBjb25mdXNpbmcuCj4+IAo+PiBJJ2QgcHJlZmVyIGlm
IHRoZSBjb25uZWN0aW9uIHdvdWxkIGJlY29tZSBtb3JlIG9idmlvdXMuIE9uZQo+PiBuZWVkcyB0
byBnbyBmcm9tIC0+aXNfdXJnZW50IHZpYSAtPnVyZ2VudF9jb3VudCB0bwo+PiBzY2hlZF9oYXNf
dXJnZW50X3ZjcHUoKSB0byBmaW5kIHdoZXJlIHRoZSBkZXNjcmliZWQKPj4gYmVoYXZpb3IgcmVh
bGx5IGxpdmVzLgo+PiAKPj4gV2hhdCdzIHdvcnNlIHRob3VnaDogVGhpcyB3b24ndCB3b3JrIGFz
IGludGVuZGVkIG9uIEFNRAo+PiBhdCBhbGwuIEkgZG9uJ3QgdGhpbmsgaXQncyBjb3JyZWN0IHRv
IGZhbGwgYmFjayB0byBkZWZhdWx0X2lkbGUoKSBpbgo+PiB0aGlzIGNhc2UuIEluc3RlYWQgc2No
ZWRfaGFzX3VyZ2VudF92Y3B1KCkgcmV0dXJuaW5nIHRydWUKPj4gc2hvdWxkIGFtb3VudCB0byB0
aGUgc2FtZSBlZmZlY3QgYXMgbWF4X2NzdGF0ZSBiZWluZyBzZXQKPj4gdG8gMS4gVGhlcmUncwo+
PiAoYSkgbm8gcmVhc29uIG5vdCB0byB1c2UgTVdBSVQgb24gSW50ZWwgQ1BVcyBpbiB0aGlzIGNh
c2UsCj4+IGlmIE1XQUlUIGNhbiBlbnRlciBDMSwgYW5kCj4+IChiKSBhIHN0cm9uZyBuZWVkIHRv
IHVzZSBNV0FJVCBvbiAoYXQgbGVhc3QpIEFNRCBGYW0xNywKPj4gb3IgZWxzZSBpdCB3b24ndCBi
ZSBDMSB0aGF0IGdldHMgZW50ZXJlZC4KPj4gSSdsbCBzZWUgYWJvdXQgbWFraW5nIGEgcGF0Y2gg
aW4gZHVlIGNvdXJzZS4KPiAKPiBUaGFua3MuIFdvdWxkIHlvdSBtaW5kIGRvaW5nIGl0IGluIGEg
d2F5IHRoYXQgdGhlIGNhbGxlciBjYW4gc3BlY2lmeQo+IG1heF9jc3RhdGU/IFRoaXMgd291bGQg
cmVtb3ZlIHRoZSBuZWVkIHRvIGNhbGwgc2NoZWRfaGFzX3VyZ2VudF92Y3B1KCkKPiBkZWVwIGRv
d24gdGhlIGlkbGUgaGFuZGxpbmcgYW5kIEkgY291bGQgcmUtdXNlIGl0IGZvciBteSBwdXJwb3Nl
LgoKSG1tLCB0byBiZSBob25lc3QgSSdtIG5vdCBmYW5jeWluZyBnaXZpbmcgYSBwYXJhbWV0ZXIg
dG8KZGVmYXVsdF9pZGxlKCksIHBtX2lkbGUoKSwgYW5kIGZyaWVuZHMuIENvbmNlcHR1YWxseSBp
dCBpcyBub3QKdGhlIGJ1c2luZXNzIG9mIHRoZSBjYWxsZXJzIHRvIGNvbnRyb2wgdGhlIEMgc3Rh
dGVzIHRvIGJlIHVzZWQuCgpXaGF0IGFib3V0IHRoZSBvcHBvc2l0ZTogWW91IHNpbXBseSBtYXJr
IGlkbGUgKHYpQ1BVcyBpbgpxdWVzdGlvbiBhcyAidXJnZW50IiwgdGh1cyBhY2hpZXZpbmcgdGhl
IGludGVuZGVkIGVmZmVjdCBhcwp3ZWxsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
