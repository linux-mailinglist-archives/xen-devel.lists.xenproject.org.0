Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC84207B8
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:12:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRG9A-0004jS-Ua; Thu, 16 May 2019 13:10:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRG99-0004jM-La
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:10:07 +0000
X-Inumbo-ID: eb344070-77db-11e9-b0f8-77609edac8e9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb344070-77db-11e9-b0f8-77609edac8e9;
 Thu, 16 May 2019 13:10:04 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 07:10:03 -0600
Message-Id: <5CDD612A020000780022FB22@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 07:10:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-25-jgross@suse.com>
 <5CDD557D020000780022FA32@suse.com>
 <5fe18121-19de-b6d3-bc77-dc68b6221165@suse.com>
In-Reply-To: <5fe18121-19de-b6d3-bc77-dc68b6221165@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 24/45] xen: let vcpu_create() select
 processor
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

Pj4+IE9uIDE2LjA1LjE5IGF0IDE0OjQ2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Ni8wNS8yMDE5IDE0OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkgYXQg
MDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+IEBAIC0zMTQsMTQgKzMx
NCw0MiBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX2l0ZW0gKnNjaGVkX2FsbG9jX2l0ZW0oc3RydWN0
IHZjcHUgKnYpCj4+PiAgICAgIHJldHVybiBOVUxMOwo+Pj4gIH0KPj4+ICAKPj4+IC1pbnQgc2No
ZWRfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQo+Pj4g
K3N0YXRpYyB1bnNpZ25lZCBpbnQgc2NoZWRfc2VsZWN0X2luaXRpYWxfY3B1KHN0cnVjdCB2Y3B1
ICp2KQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKPj4+ICsg
ICAgbm9kZWlkX3Qgbm9kZTsKPj4+ICsgICAgY3B1bWFza190IGNwdXM7Cj4+IAo+PiBUbyBiZSBo
b25lc3QsIEknbSBub3QgaGFwcHkgdG8gc2VlIG5ldyBvbi1zdGFjayBpbnN0YW5jZXMgb2YKPj4g
Y3B1bWFza190IGFwcGVhci4gU2VlaW5nIC4uLgo+PiAKPj4+ICsgICAgY3B1bWFza19jbGVhcigm
Y3B1cyk7Cj4+PiArICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGQtPm5vZGVfYWZmaW5p
dHkgKQo+Pj4gKyAgICAgICAgY3B1bWFza19vcigmY3B1cywgJmNwdXMsICZub2RlX3RvX2NwdW1h
c2sobm9kZSkpOwo+Pj4gKyAgICBjcHVtYXNrX2FuZCgmY3B1cywgJmNwdXMsIGNwdXBvb2xfZG9t
YWluX2NwdW1hc2soZCkpOwo+Pj4gKyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdXMpICkKPj4+
ICsgICAgICAgIGNwdW1hc2tfY29weSgmY3B1cywgY3B1cG9vbF9kb21haW5fY3B1bWFzayhkKSk7
Cj4+IAo+PiAuLi4gdGhpcyBmYWxsYmFjayB5b3UgdXNlIGFueXdheSwgaXMgdGhlcmUgYW55IGlz
c3VlIHdpdGggaXQgYWxzbwo+PiBzZXJ2aW5nIHRoZSBjYXNlIHdoZXJlIHphbGxvY19jcHVtYXNr
X3ZhcigpIGZhaWxzPwo+IAo+IEVpdGhlciB0aGF0LCBvcjoKPiAKPiAtIGp1c3QgZmFpbCB0byBj
cmVhdGUgdGhlIHZjcHUgaW4gdGhhdCBjYXNlLCBhcyBjaGFuY2VzIGFyZSByYXRoZXIKPiAgIGhp
Z2ggZS5nLiB0aGUgZm9sbG93aW5nIGFyY2hfdmNwdV9jcmVhdGUoKSB3aWxsIGZhaWwgYW55d2F5
CgpBaCwgcmlnaHQsIHRoaXMgaXMgZm9yIHZDUFUgY3JlYXRpb24gb25seSBhbnl3YXkuCgo+IC0g
dGFrZSB0aGUgc2NoZWR1bGluZyBsb2NrIGFuZCB1c2UgY3B1bWFza19zY3JhdGNoCj4gLSAoYWIp
dXNlIG9uZSBvZiB0aGUgYXZhaWxhYmxlIGNwdW1hc2tzIGluIHN0cnVjdCBzY2hlZF91bml0IHdo
aWNoCj4gICBhcmUgbm90IGluIHVzZSB5ZXQKPiAKPiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIHVz
aW5nIGNwdW1hc2tfc2NyYXRjaC4KCkknbSBhY3R1YWxseSBmaW5lIHdpdGggYW55IG9mIHRoZSB2
YXJpYW50cywgaW5jbHVkaW5nIHRoYXQgb2Ygc2ltcGx5CnJldHVybmluZyAtRU5PTUVNLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
