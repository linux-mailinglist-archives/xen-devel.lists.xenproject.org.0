Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43F9DF1A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 09:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2WDf-0004v1-17; Tue, 27 Aug 2019 07:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2WDd-0004up-2J
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 07:48:45 +0000
X-Inumbo-ID: 17489be8-c89f-11e9-ae2d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17489be8-c89f-11e9-ae2d-12813bfff9fa;
 Tue, 27 Aug 2019 07:48:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CD0FAF2A;
 Tue, 27 Aug 2019 07:48:42 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
 <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1036f3e-a2a4-306b-d37b-190936978ce5@suse.com>
Date: Tue, 27 Aug 2019 09:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, 'JulienGrall' <julien.grall@arm.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Alexandru Isaila' <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDguMjAxOSAxMTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50Cj4+IFNlbnQ6IDEyIEF1
Z3VzdCAyMDE5IDE3OjI2Cj4+IFRvOiAnSmFuIEJldWxpY2gnIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4gQ2M6ICdQZXRyZSBQaXJjYWxhYnUnIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47ICdT
dGVmYW5vIFN0YWJlbGxpbmknIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsKPj4gJ1dlaSBMaXUn
IDx3bEB4ZW4ub3JnPjsgJ1JhenZhbiBDb2pvY2FydScgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20+OyAnS29ucmFkIFJ6ZXN6dXRlayBXaWxrJwo+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcp
IDx0aW1AeGVuLm9yZz47Cj4+IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNv
bT47ICdKdWxpZW4gR3JhbGwnIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47ICdUYW1hcyBLIExlbmd5
ZWwnCj4+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNp
dHJpeC5jb20+OyAnQWxleGFuZHJ1IElzYWlsYScKPj4gPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
PjsgJ3hlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZycgPHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz47Cj4+ICdWb2xvZHlteXJCYWJjaHVrJyA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDMvNl0gcmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29u
c3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzCj4+Cj4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+PiBbc25pcF0KPj4+Pgo+Pj4+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBhdWwgRHVy
cmFudCB3cm90ZToKPj4+Pj4gTk9URTogVGhpcyBwYXRjaCB3aWxsIGNhdXNlIGEgc21hbGwgYW1v
dW50IG9mIGV4dHJhIHJlc291cmNlIHRvIGJlIHVzZWQKPj4+Pj4gICAgICAgICB0byBhY2NvbW1v
ZGF0ZSBJT01NVSBwYWdlIHRhYmxlcyB0aGF0IG1heSBuZXZlciBiZSB1c2VkLCBzaW5jZSB0aGUK
Pj4+Pj4gICAgICAgICBwZXItZG9tYWluIElPTU1VIGZsYWcgZW5hYmxlIGZsYWcgaXMgY3VycmVu
dGx5IHNldCB0byB0aGUgdmFsdWUKPj4+Pj4gICAgICAgICBvZiB0aGUgZ2xvYmFsIGlvbW11X2Vu
YWJsZSBmbGFnLiBBIHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBhZGQgYW4KPj4+Pj4gICAgICAgICBv
cHRpb24gdG8gdGhlIHRvb2xzdGFjayB0byBhbGxvdyBpdCB0byBiZSB0dXJuZWQgb2ZmIGlmIHRo
ZXJlIGlzCj4+Pj4+ICAgICAgICAgbm8gaW50ZW50aW9uIHRvIGFzc2lnbiBwYXNzdGhyb3VnaCBo
YXJkd2FyZSB0byB0aGUgZG9tYWluLgo+Pj4+Cj4+Pj4gSW4gcGFydGljdWxhciBpZiB0aGUgZGVm
YXVsdCBvZiB0aGlzIGlzIGdvaW5nIHRvIGJlICJ0cnVlIiAoSQo+Pj4+IGRpZG4ndCBsb29rIGF0
IHRoYXQgcGF0Y2ggeWV0LCBidXQgdGhlIHdvcmRpbmcgYWJvdmUgbWFrZXMgbWUKPj4+PiBhc3N1
bWUgc28pLCBpbiBhdXRvLWJhbGxvb25pbmcgbW9kZSB3aXRob3V0IHNoYXJlZCBwYWdlIHRhYmxl
cwo+Pj4+IG1vcmUgbWVtb3J5IHNob3VsZCBpbW8gYmUgYmFsbG9vbmVkIG91dCBvZiBEb20wIG5v
dy4gSXQgaGFzCj4+Pj4gYWx3YXlzIGJlZW4gYSBidWcgdGhhdCBJT01NVSBwYWdlIHRhYmxlcyB3
ZXJlbid0IGFjY291bnRlZCBmb3IsCj4+Pj4gYnV0IGl0IHdvdWxkIGJlY29tZSBldmVuIG1vcmUg
cHJvbWluZW50IHRoZW4uCj4+Pgo+Pj4gVWx0aW1hdGVseSwgb25jZSB0aGUgd2hvbGUgc2VyaWVz
IGlzIGFwcGxpZWQsIHRoZW4gbm90aGluZyBtdWNoIHNob3VsZCBjaGFuZ2UgZm9yIHRob3NlIHNw
ZWNpZnlpbmcKPj4+IHBhc3N0aHJvdWdoIGgvdyBpbiBhbiB4bC5jZmcuIFRoZSBtYWluIGRpZmZl
cmVuY2Ugd2lsbCBiZSB0aGF0IGgvdyBjYW5ub3QgYmUgcGFzc2VkIHRocm91Z2ggdG8gYQo+Pj4g
ZG9tYWluIHRoYXQgd2FzIG5vdCBvcmlnaW5hbGx5IGNyZWF0ZWQgd2l0aCBJT01NVSBwYWdldGFi
bGVzLgo+Pj4gV2l0aCBwYXRjaGVzIGFwcGxpZWQgdXAgdG8gdGhpcyBwb2ludCB0aGVuLCB5ZXMs
IGV2ZXJ5IGRvbWFpbiB3aWxsIGdldCBJT01NVSBwYWdlIHRhYmxlcy4gSSBndWVzcwo+PiBJJ2xs
Cj4+PiB0YWtlIGEgbG9vayBhdCB0aGUgYXV0by1iYWxsb29uaW5nIGNvZGUgYW5kIHNlZSB3aGF0
IG5lZWRzIHRvIGJlIGRvbmUuCj4+Pgo+Pgo+PiBPaywgSSd2ZSBoYWQgYSBsb29rLi4uCj4+Cj4+
IEkgY291bGQgbWFrZSBhIHJvdWdoIGNhbGN1bGF0aW9uIGluIGxpYnhsX2RvbWFpbl9uZWVkX21l
bW9yeSgpIGJhc2VkIG9uIHRoZSBkb21haW4ncyBtYXhfbWVta2IgYW5kIGFuCj4+IGFzc3VtcHRp
b24gb2YgYSA0IGxldmVsIHRyYW5zbGF0aW9uIHdpdGggNTEyIFBURXMgcGVyIGxldmVsLCBvciB3
b3VsZCBwcmVmZXIgc3VjaCBndWVzdGltYXRpb24gdG8gYmUKPj4gb3ZlcnJpZGFibGUgdXNpbmcg
YW4geGwuY2ZnIHBhcmFtZXRlciBpbiBhIGJyb2FkbHkgc2ltaWxhciB3YXkgdG8gc2hhZG93X21l
bWtiPwo+Pgo+IAo+IEkgdGhpbmsgSSdtIGdvaW5nIHRvIHNheSBubyB0byB0aGlzIGFueXdheSBz
aW5jZSwgYXMgeW91IHNheSwgdGhlIG92ZXJoZWFkIGFzIG5ldmVyIGJlZW4gYWNjb3VudGVkIGZv
ciBhbmQgaGF2aW5nIHRvIG1ha2UgYXNzdW1wdGlvbnMgYWJvdXQgdGhlIElPTU1VIHRhYmxlIHN0
cnVjdHVyZSBpcyBub3QgdmVyeSBhdHRyYWN0aXZlLiBHaXZlbiB0aGF0IGFueSBpc3N1ZSBpcyBn
b2luZyB0byBiZSB0cmFuc2llbnQgKGkuZS4gdW50aWwgcGF0Y2ggIzYgaXMgY29tbWl0dGVkKSBJ
IGRvbid0IHRoaW5rIGZpeGluZyBhdXRvLWJhbGxvb25pbmcgb3VnaHQgdG8gYmUgaW4gc2NvcGUg
Zm9yIHRoaXMgc2VyaWVzLgoKSSdtIGFmcmFpZCBJIGRpc2FncmVlOiBUaGUgc2VyaWVzIGV4dGVu
ZHMgYSBwcmUtZXhpc3RpbmcgcHJvYmxlbQphZmZlY3Rpbmcgc29tZSBndWVzdHMgdG8gYWxsIG9u
ZXMgKGF0IGxlYXN0IGJ5IGRlZmF1bHQpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
