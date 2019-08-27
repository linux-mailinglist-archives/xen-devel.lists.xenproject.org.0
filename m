Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4A9DF0C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 09:49:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2WCD-0004ok-Lo; Tue, 27 Aug 2019 07:47:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2WCC-0004ob-7C
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 07:47:16 +0000
X-Inumbo-ID: e2cb2480-c89e-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2cb2480-c89e-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 07:47:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 639A6AD89;
 Tue, 27 Aug 2019 07:47:14 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <450c0778-97d0-18fa-f819-344bbdd64332@suse.com>
Date: Tue, 27 Aug 2019 09:47:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
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
 'StefanoStabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Tamas K Lengyel' <tamas@tklengyel.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Alexandru Isaila' <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDguMjAxOSAxODoyNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+IFtzbmlwXQo+Pj4KPj4+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBhdWwg
RHVycmFudCB3cm90ZToKPj4+PiBOT1RFOiBUaGlzIHBhdGNoIHdpbGwgY2F1c2UgYSBzbWFsbCBh
bW91bnQgb2YgZXh0cmEgcmVzb3VyY2UgdG8gYmUgdXNlZAo+Pj4+ICAgICAgICAgdG8gYWNjb21t
b2RhdGUgSU9NTVUgcGFnZSB0YWJsZXMgdGhhdCBtYXkgbmV2ZXIgYmUgdXNlZCwgc2luY2UgdGhl
Cj4+Pj4gICAgICAgICBwZXItZG9tYWluIElPTU1VIGZsYWcgZW5hYmxlIGZsYWcgaXMgY3VycmVu
dGx5IHNldCB0byB0aGUgdmFsdWUKPj4+PiAgICAgICAgIG9mIHRoZSBnbG9iYWwgaW9tbXVfZW5h
YmxlIGZsYWcuIEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGFkZCBhbgo+Pj4+ICAgICAgICAgb3B0
aW9uIHRvIHRoZSB0b29sc3RhY2sgdG8gYWxsb3cgaXQgdG8gYmUgdHVybmVkIG9mZiBpZiB0aGVy
ZSBpcwo+Pj4+ICAgICAgICAgbm8gaW50ZW50aW9uIHRvIGFzc2lnbiBwYXNzdGhyb3VnaCBoYXJk
d2FyZSB0byB0aGUgZG9tYWluLgo+Pj4KPj4+IEluIHBhcnRpY3VsYXIgaWYgdGhlIGRlZmF1bHQg
b2YgdGhpcyBpcyBnb2luZyB0byBiZSAidHJ1ZSIgKEkKPj4+IGRpZG4ndCBsb29rIGF0IHRoYXQg
cGF0Y2ggeWV0LCBidXQgdGhlIHdvcmRpbmcgYWJvdmUgbWFrZXMgbWUKPj4+IGFzc3VtZSBzbyks
IGluIGF1dG8tYmFsbG9vbmluZyBtb2RlIHdpdGhvdXQgc2hhcmVkIHBhZ2UgdGFibGVzCj4+PiBt
b3JlIG1lbW9yeSBzaG91bGQgaW1vIGJlIGJhbGxvb25lZCBvdXQgb2YgRG9tMCBub3cuIEl0IGhh
cwo+Pj4gYWx3YXlzIGJlZW4gYSBidWcgdGhhdCBJT01NVSBwYWdlIHRhYmxlcyB3ZXJlbid0IGFj
Y291bnRlZCBmb3IsCj4+PiBidXQgaXQgd291bGQgYmVjb21lIGV2ZW4gbW9yZSBwcm9taW5lbnQg
dGhlbi4KPj4KPj4gVWx0aW1hdGVseSwgb25jZSB0aGUgd2hvbGUgc2VyaWVzIGlzIGFwcGxpZWQs
IHRoZW4gbm90aGluZyBtdWNoIHNob3VsZCBjaGFuZ2UgZm9yIHRob3NlIHNwZWNpZnlpbmcKPj4g
cGFzc3Rocm91Z2ggaC93IGluIGFuIHhsLmNmZy4gVGhlIG1haW4gZGlmZmVyZW5jZSB3aWxsIGJl
IHRoYXQgaC93IGNhbm5vdCBiZSBwYXNzZWQgdGhyb3VnaCB0byBhCj4+IGRvbWFpbiB0aGF0IHdh
cyBub3Qgb3JpZ2luYWxseSBjcmVhdGVkIHdpdGggSU9NTVUgcGFnZXRhYmxlcy4KPj4gV2l0aCBw
YXRjaGVzIGFwcGxpZWQgdXAgdG8gdGhpcyBwb2ludCB0aGVuLCB5ZXMsIGV2ZXJ5IGRvbWFpbiB3
aWxsIGdldCBJT01NVSBwYWdlIHRhYmxlcy4gSSBndWVzcyBJJ2xsCj4+IHRha2UgYSBsb29rIGF0
IHRoZSBhdXRvLWJhbGxvb25pbmcgY29kZSBhbmQgc2VlIHdoYXQgbmVlZHMgdG8gYmUgZG9uZS4K
Pj4KPiAKPiBPaywgSSd2ZSBoYWQgYSBsb29rLi4uCj4gCj4gSSBjb3VsZCBtYWtlIGEgcm91Z2gg
Y2FsY3VsYXRpb24gaW4gbGlieGxfZG9tYWluX25lZWRfbWVtb3J5KCkgYmFzZWQgb24KPiB0aGUg
ZG9tYWluJ3MgbWF4X21lbWtiIGFuZCBhbiBhc3N1bXB0aW9uIG9mIGEgNCBsZXZlbCB0cmFuc2xh
dGlvbiB3aXRoCj4gNTEyIFBURXMgcGVyIGxldmVsLCBvciB3b3VsZCBwcmVmZXIgc3VjaCBndWVz
dGltYXRpb24gdG8gYmUgb3ZlcnJpZGFibGUKPiB1c2luZyBhbiB4bC5jZmcgcGFyYW1ldGVyIGlu
IGEgYnJvYWRseSBzaW1pbGFyIHdheSB0byBzaGFkb3dfbWVta2I/CgpJJ3ZlIGFsd2F5cyBiZWVu
IHRoaW5raW5nIHRoYXQgZm9yIHRoZSBub24tc2hhcmVkIGNhc2UgdGhlIGFtb3VudApyZXNlcnZl
ZCBmb3IgcGFnZSB0YWJsZXMgY291bGQgc2ltcGx5IGJlIGRvdWJsZWQuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
