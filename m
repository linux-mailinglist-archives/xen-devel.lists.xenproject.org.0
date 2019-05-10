Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D020219EAB
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:05:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP66q-0008AP-ON; Fri, 10 May 2019 14:02:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP66p-00089f-1X
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:02:47 +0000
X-Inumbo-ID: 48b01129-732c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48b01129-732c-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 14:02:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 08:02:44 -0600
Message-Id: <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 08:02:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
 <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
In-Reply-To: <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjQ2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wNS4x
OSBhdCAxNTozNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDEwLzA1LzIw
MTkgMTQ6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0
LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiBAQCAtMTAzMCwxOSArMTAzMSwx
OSBAQCBsb25nIHAybV9wdF9hdWRpdF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSkKPj4+Pj4g
QEAgLTI3OTUsNTQgKzI3OTUsNTQgQEAgdm9pZCBhdWRpdF9wMm0oc3RydWN0IGRvbWFpbiAqZCwK
Pj4+Pj4gICAgICAgIHNwaW5fbG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKPj4+Pj4gICAgICAg
IHBhZ2VfbGlzdF9mb3JfZWFjaCAoIHBhZ2UsICZkLT5wYWdlX2xpc3QgKQo+Pj4+PiAgICAgICAg
ewo+Pj4+PiAtICAgICAgICBtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7Cj4+Pj4+ICsg
ICAgICAgIG1mbiA9IHBhZ2VfdG9fbWZuKHBhZ2UpOwo+Pj4+PiAgICAKPj4+Pj4gLSAgICAgICAg
UDJNX1BSSU5USygiYXVkaXRpbmcgZ3Vlc3QgcGFnZSwgbWZuPSUjbHhcbiIsIG1mbik7Cj4+Pj4+
ICsgICAgICAgIFAyTV9QUklOVEsoImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1mbj0lIlBSSV9tZm4i
XG4iLCBtZm5feChtZm4pKTsKPj4+Pj4gICAgCj4+Pj4+ICAgICAgICAgICAgb2QgPSBwYWdlX2dl
dF9vd25lcihwYWdlKTsKPj4+Pj4gICAgCj4+Pj4+ICAgICAgICAgICAgaWYgKCBvZCAhPSBkICkK
Pj4+Pj4gICAgICAgICAgICB7Cj4+Pj4+IC0gICAgICAgICAgICBQMk1fUFJJTlRLKCJ3cm9uZyBv
d25lciAlI2x4IC0+ICVwKCV1KSAhPSAlcCgldSlcbiIsCj4+Pj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgIG1mbiwgb2QsIChvZD9vZC0+ZG9tYWluX2lkOi0xKSwgZCwgZC0+ZG9tYWluX2lkKTsK
Pj4+Pj4gKyAgICAgICAgICAgIFAyTV9QUklOVEsoIndyb25nIG93bmVyICUiUFJJX21mbiIgLT4g
JXAoJXUpICE9ICVwKCV1KVxuIiwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3go
bWZuKSwgb2QsIChvZD9vZC0+ZG9tYWluX2lkOi0xKSwgZCwgZC0+ZG9tYWluX2lkKTsKPj4+Pgo+
Pj4+IFBsZWFzZSBiZSBjYXJlZnVsIG5vdCB0byBkcm9wIDB4IHByZWZpeGVzIGZyb20gdGhlIHJl
c3VsdGluZyBvdXRwdXQKPj4+PiAod2hpY2ggYXJlIGFuIGVmZmVjdCBvZiB0aGUgIyBmbGFnIHRo
YXQgeW91IGRlbGV0ZSksIGF0IGxlYXN0IHdoZW4KPj4+PiBsb2cgbWVzc2FnZXMgY29udGFpbiBh
IG1peCBvZiBoZXggYW5kIGRlYyBudW1iZXJzLiAoSSBhbSwgYnR3LAo+Pj4+IG5vdCBjb252aW5j
ZWQgdGhhdCBzd2l0Y2hpbmcgdG8gUFJJX21mbiBoZXJlIGlzIGhlbHBmdWwuKQo+Pj4KPj4+IExh
c3QgdGltZSBJIGtlZXBlZCAlIyBmb3IgTUZOLCBJIGhhdmUgYmVlbiBhc2tlZCB0byByZW1vdmUg
dGhlICMuIEkgcHJlZmVyCj4+PiBoYXZpbmcgMHggZm9yIGFsbCB0aGUgaGV4LCBhbmQgSSBhbSBo
YXBweSB0byBiZSBrZWVwIGFzIGlzLiBCdXQgSSB3b3VsZCBsaWtlIGEKPj4+IGJpdCBvZiBjb25z
aXN0ZW5jeSBvbiB0aGUgd2F5IHdlIHByaW50IE1GTi4uLgo+PiAKPj4gV2VsbCwgIiUjIlBSSV9t
Zm4gaXMgYm9ndXMgKGJlY2F1c2Ugb2YgdGhlIGNvbWJpbmF0aW9uIHdpdGggdGhlCj4+IG1pbmlt
dW0gd2lkdGggc3BlY2lmaWNhdGlvbiksIHNvIGl0IG91Z2h0IHRvIGJlICIlI2x4IiBvciAiMHgl
IlBSSV9tZm4uCj4+IEhhdmUgeW91IHJlYWxseSBiZWVuIGFza2VkIGZvciBzb21ldGhpbmcgZWxz
ZT8gSWYgc28sIGFuZCBpZiBpdCB3YXMgbWUsCj4+IHRoZW4gSSBhcG9sb2dpemUuCj4gCj4gSSBh
bSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBib2d1cy4gVGhlIHRoaW5nIGlzIHVzaW5nIGRpZmZlcmVu
dCBmb3JtYXQgZm9yIHRoZSBNRk4gCj4gbWFrZXMgaXQgZGlmZmljdWx0IHRvIHJlYWQgYSBtZXNz
YWdlIHdpdGhvdXQgbG9va2luZyBmb3JtYXQgc3RyaW5nLgoKV2UgbG9vayB0byBiZSBpbiBhZ3Jl
ZW1lbnQgdGhhdCB0aGVyZSBzaG91bGQgYmUgYSAweCBwcmVmaXggaGVyZS4KV2hhdCBJJ20gYXNr
aW5nIGZvciBpcyB0byBhdm9pZCB0aGUgdmFsdWUgbG9nZ2VkIHRvIGRlLWdlbmVyYXRlIGludG8K
YSAzLWRpZ2l0IG9uZSAoMHg/Pz8pIHdoZW4gYSBmaXZlIGRpZ2l0IG9uZSBpcyBtZWFudCAoc2Vl
IFBSSV9tZm4pLgpOb3QgdG8gc3BlYWsgb2YgdGhlIGZ1cnRoZXIgaW5jb25zaXN0ZW50IHN0cmlu
ZyB0aGF0IHdvdWxkIGJlIGxvZ2dlZApmb3IgTUZOIDAuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
