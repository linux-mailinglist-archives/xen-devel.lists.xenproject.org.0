Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F03C7FA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadX4-000168-Ne; Tue, 11 Jun 2019 09:57:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hadX3-000163-6y
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:57:33 +0000
X-Inumbo-ID: 545a2f5e-8c2f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 545a2f5e-8c2f-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 09:57:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 03:57:31 -0600
Message-Id: <5CFF7B080200007800236EBD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 03:57:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5CF0F1410200007800233D67@prv1-mh.provo.novell.com>
 <887c1848-9961-463e-c072-65926a8a8b5f@citrix.com>
In-Reply-To: <887c1848-9961-463e-c072-65926a8a8b5f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] x86/traps: guard top-of-stack reads
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDE5OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAxMDoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni90cmFwcy5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4+IEBAIC00
ODQsMTYgKzQ4NCwyMyBAQCBzdGF0aWMgdm9pZCBfc2hvd190cmFjZSh1bnNpZ25lZCBsb25nIHNw
Cj4+ICAKPj4gIHN0YXRpYyB2b2lkIHNob3dfdHJhY2UoY29uc3Qgc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MpCj4+ICB7Cj4+IC0gICAgdW5zaWduZWQgbG9uZyAqc3AgPSBFU1BfQkVGT1JFX0VY
Q0VQVElPTihyZWdzKTsKPj4gKyAgICB1bnNpZ25lZCBsb25nICpzcCA9IEVTUF9CRUZPUkVfRVhD
RVBUSU9OKHJlZ3MpLCB0b3MgPSAwOwo+PiAgCj4+ICAgICAgcHJpbnRrKCJYZW4gY2FsbCB0cmFj
ZTpcbiIpOwo+PiAgCj4gCj4gLyogUHJvYmUgdGhlIHN0YWNrIGZvciByZWFkYWJpbGl0eS4gKi8K
ClRoYXQncyBub3QgYW4gYXBwcm9wcmlhdGUgY29tbWVudCBmb3IgdGhpcyBjb2RlIGZyYWdtZW50
LCBhdCBsZWFzdApub3Qgd2l0aCBteSAobm9uLW5hdGl2ZSkgdW5kZXJzdGFuZGluZyBvZiAicHJv
YmUiLiBUbyBtZSB0aGUgdmVyYgpkb2VzIG5vdCBpbmNsdWRlIHJlYWRpbmcgYWN0dWFsIGRhdGEs
IHlldCB0aGF0J3Mgd2hhdCB3ZSBkbyBoZXJlLgpJZiBhbnl0aGluZyBpcyBuZWVkZWQgYXQgYWxs
LCB0aGVuIG1heWJlICJHdWFyZGVkIHJlYWQgb2YgdGhlIHN0YWNrCnRvcCI/Cgo+PiArICAgIGFz
bSAoICIxOiBtb3YgJTIsJTA7IDI6XG4iCj4+ICsgICAgICAgICAgIi5wdXNoc2VjdGlvbiAuZml4
dXAsXCJheFwiXG4iCj4+ICsgICAgICAgICAgIjM6IHhvciAlazEsJWsxOyBqbXAgMmJcbiIKPiAK
PiBDYW4gd2UgdXNlIHNvbWUgbmFtZWQgcGFyYW1ldGVycywgc28gdGhlIGFzbSBjYW4gYWN0dWFs
bHkgYmUgZm9sbG93ZWQ/CgpTdXJlLiBJIGRpZCBjb25zaWRlciBkb2luZyBzbywgYnV0IHRoZW4g
dGhvdWdodCB0aGUgb25lIGhlcmUgd291bGQKYmUgc2ltcGxlIGVub3VnaC4KCj4gQWxzbywgeW91
IGNhbid0IGRvIHRoaXMgYnkgemVyb2luZyBzcCwgYmVjYXVzZSBpdCBhbGlhc2VzIHdpdGggInNw
IHdhcwo+IGF0IHplcm8gYW5kIHJlYWRhYmxlIi4gIEEgYmV0dGVyIG9wdGlvbiB3b3VsZCBiZSB0
byBnZXQgYW4gZXhwbGljaXQKPiBmYXVsdCBib29sZWFuIG91dCBvZiB0aGUgYXNtLgoKSG1tLCB0
aGlzIHdhcyBhY3R1YWxseSBkZWxpYmVyYXRlOiBBIHplcm8gJXJzcCBpcyBhIGNsZWFyIHNpZ24g
b2YgdGhlCnN0YWNrIGJlaW5nIGJhZCwgYW5kIGJldHRlciBub3QgZ2V0dGluZyBkdW1wZWQgZnJv
bS4KCj4+IEBAIC01MDEsMTIgKzUwOCwxNSBAQCBzdGF0aWMgdm9pZCBzaG93X3RyYWNlKGNvbnN0
IHN0cnVjdCBjcHVfCj4+ICAgICAgICogcmV0dXJuIGFkZHJlc3M7IHByaW50IGl0IGFuZCBza2lw
IHBhc3Qgc28gX3Nob3dfdHJhY2UoKSBkb2Vzbid0IHByaW50Cj4+ICAgICAgICogaXQgYWdhaW4u
Cj4+ICAgICAgICovCj4+IC0gICAgZWxzZQo+PiArICAgIGVsc2UgaWYgKCBzcCApCj4+ICAgICAg
ewo+PiAtICAgICAgICBwcmludGsoIiAgIFs8JXA+XSAlcFNcbiIsIF9wKCpzcCksIF9wKCpzcCkp
Owo+PiArICAgICAgICBwcmludGsoIiAgIFs8JXA+XSAlcFNcbiIsIF9wKHRvcyksIF9wKHRvcykp
Owo+PiAgICAgICAgICBzcCsrOwo+PiAgICAgIH0KPj4gIAo+PiArICAgIGlmICggIXNwICkKPj4g
KyAgICAgICAgcmV0dXJuOwo+IAo+IEFsb25nIHdpdGggdGhlIGFsaWFzIG1lbnRpb25lZCBhYm92
ZSwgdGhpcyBhbHNvIGhhcyBhIGJvdW5kYXJ5IGNhc2Ugd2hlbgo+IHNwIGlzIC04LCBkdWUgdG8g
dGhlIHNwKysgYWJvdmUuCgpIbW0sIHllcywgdW50aWwgdGhlIG5leHQgcGF0Y2guCgo+IEl0IHdv
dWxkIHByb2JhYmx5IGJlIGJldHRlciB0byBmaXQgYW4KPiAKPiBlbHNlIGlmICggZmF1bHQgKQo+
IHsKPiAgICAgcHJpbnRrKCIgICBbRmF1bHQgb24gYWNjZXNzXVxuIik7Cj4gICAgIHJldHVybjsK
PiB9Cj4gCj4gaW50byB0aGUgbWlkZGxlIG9mIHRoZSBleGlzdGluZyBpZi9lbHNlLgoKV2VsbCwg
b2theSwgSSdsbCBhZGQgc3VjaCBhIHNlcGFyYXRlIGJvb2xlYW4gdGhlbi4gSSB3YW50ZWQgdG8g
YXZvaWQKZnVydGhlciBoYW1wZXJpbmcgcmVhZGFiaWxpdHkgb2YgdGhlIGFzbSgpLi4uCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
