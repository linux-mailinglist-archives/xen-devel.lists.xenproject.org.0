Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C819E66
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:43:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5md-0005uV-Du; Fri, 10 May 2019 13:41:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5mc-0005uO-Kl
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:41:54 +0000
X-Inumbo-ID: 5e42ce0d-7329-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5e42ce0d-7329-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:41:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 07:41:51 -0600
Message-Id: <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 07:41:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
In-Reply-To: <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
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

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjM0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IEBAIC0xMDMwLDE5
ICsxMDMxLDE5IEBAIGxvbmcgcDJtX3B0X2F1ZGl0X3AybShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
KQo+Pj4gICAgICAgICAgICAgICAgICAgLyogY2hlY2sgZm9yIDFHQiBzdXBlciBwYWdlICovCj4+
PiAgICAgICAgICAgICAgICAgICBpZiAoIGwzZV9nZXRfZmxhZ3MobDNlW2kzXSkgJiBfUEFHRV9Q
U0UgKQo+Pj4gICAgICAgICAgICAgICAgICAgewo+Pj4gLSAgICAgICAgICAgICAgICAgICAgbWZu
ID0gbDNlX2dldF9wZm4obDNlW2kzXSk7Cj4+PiAtICAgICAgICAgICAgICAgICAgICBBU1NFUlQo
bWZuX3ZhbGlkKF9tZm4obWZuKSkpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgbWZuID0gbDNl
X2dldF9tZm4obDNlW2kzXSk7Cj4+PiArICAgICAgICAgICAgICAgICAgICBBU1NFUlQobWZuX3Zh
bGlkKG1mbikpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgIC8qIHdlIGhhdmUgdG8gY292ZXIg
NTEyeDUxMiA0SyBwYWdlcyAqLwo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZvciAoIGkyID0g
MDsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpMiA8IChMMl9QQUdFVEFCTEVfRU5U
UklFUyAqIEwxX1BBR0VUQUJMRV9FTlRSSUVTKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpMisrKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgIHsKPj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICBtMnBmbiA9IGdldF9ncGZuX2Zyb21fbWZuKG1mbitpMik7Cj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgbTJwZm4gPSBnZXRfcGZuX2Zyb21fbWZuKG1mbl9hZGQobWZuLCBp
MikpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIG0ycGZuICE9IChnZm4gKyBp
MikgKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICB7Cj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwbWJhZCsrOwo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
Mk1fUFJJTlRLKCJtaXNtYXRjaDogZ2ZuICUjbHggLT4gbWZuICUjbHgiCj4+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2ZuK2kyLCBt
Zm4raTIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAyTV9QUklOVEsoIm1pc21h
dGNoOiBnZm4gJSNseCAtPiBtZm4gJSJQUklfbWZuIiBnZm4gJSNseFxuIiwKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm4gKyBpMiwgbWZuX3gobWZuX2FkZCht
Zm4sIGkyKSksCj4+IAo+PiBJIHRoaW5rIHRoZSBzaG9ydGVyIG1mbl94KG1mbikgKyBpMiB3b3Vs
ZCBiZSBwcmVmZXJhYmxlIGhlcmUgKGFuZAo+PiBzaW1pbGFybHkgYmVsb3cpLgo+IAo+IEkgdGhv
dWdodCBhYm91dCBpdCwgYnV0IEkgd2FudGVkIHRvIGtlZXAgdGhlIHR5cGVzYWZlIGFzIGZhciBh
cyBwb3NzaWJsZS4gCj4gQW55d2F5LCB0aGF0J3MgeDg2IGNvZGUgc28gdGhhdCdzIHlvdXIgY2Fs
bC4KCkdlb3JnZSdzIGluIHRoaXMgY2FzZS4KCj4+PiBAQCAtMjc5NSw1NCArMjc5NSw1NCBAQCB2
b2lkIGF1ZGl0X3AybShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4gICAgICAgc3Bpbl9sb2NrKCZkLT5w
YWdlX2FsbG9jX2xvY2spOwo+Pj4gICAgICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQt
PnBhZ2VfbGlzdCApCj4+PiAgICAgICB7Cj4+PiAtICAgICAgICBtZm4gPSBtZm5feChwYWdlX3Rv
X21mbihwYWdlKSk7Cj4+PiArICAgICAgICBtZm4gPSBwYWdlX3RvX21mbihwYWdlKTsKPj4+ICAg
Cj4+PiAtICAgICAgICBQMk1fUFJJTlRLKCJhdWRpdGluZyBndWVzdCBwYWdlLCBtZm49JSNseFxu
IiwgbWZuKTsKPj4+ICsgICAgICAgIFAyTV9QUklOVEsoImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1m
bj0lIlBSSV9tZm4iXG4iLCBtZm5feChtZm4pKTsKPj4+ICAgCj4+PiAgICAgICAgICAgb2QgPSBw
YWdlX2dldF9vd25lcihwYWdlKTsKPj4+ICAgCj4+PiAgICAgICAgICAgaWYgKCBvZCAhPSBkICkK
Pj4+ICAgICAgICAgICB7Cj4+PiAtICAgICAgICAgICAgUDJNX1BSSU5USygid3Jvbmcgb3duZXIg
JSNseCAtPiAlcCgldSkgIT0gJXAoJXUpXG4iLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
bWZuLCBvZCwgKG9kP29kLT5kb21haW5faWQ6LTEpLCBkLCBkLT5kb21haW5faWQpOwo+Pj4gKyAg
ICAgICAgICAgIFAyTV9QUklOVEsoIndyb25nIG93bmVyICUiUFJJX21mbiIgLT4gJXAoJXUpICE9
ICVwKCV1KVxuIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIG1mbl94KG1mbiksIG9kLCAo
b2Q/b2QtPmRvbWFpbl9pZDotMSksIGQsIGQtPmRvbWFpbl9pZCk7Cj4+IAo+PiBQbGVhc2UgYmUg
Y2FyZWZ1bCBub3QgdG8gZHJvcCAweCBwcmVmaXhlcyBmcm9tIHRoZSByZXN1bHRpbmcgb3V0cHV0
Cj4+ICh3aGljaCBhcmUgYW4gZWZmZWN0IG9mIHRoZSAjIGZsYWcgdGhhdCB5b3UgZGVsZXRlKSwg
YXQgbGVhc3Qgd2hlbgo+PiBsb2cgbWVzc2FnZXMgY29udGFpbiBhIG1peCBvZiBoZXggYW5kIGRl
YyBudW1iZXJzLiAoSSBhbSwgYnR3LAo+PiBub3QgY29udmluY2VkIHRoYXQgc3dpdGNoaW5nIHRv
IFBSSV9tZm4gaGVyZSBpcyBoZWxwZnVsLikKPiAKPiBMYXN0IHRpbWUgSSBrZWVwZWQgJSMgZm9y
IE1GTiwgSSBoYXZlIGJlZW4gYXNrZWQgdG8gcmVtb3ZlIHRoZSAjLiBJIHByZWZlciAKPiBoYXZp
bmcgMHggZm9yIGFsbCB0aGUgaGV4LCBhbmQgSSBhbSBoYXBweSB0byBiZSBrZWVwIGFzIGlzLiBC
dXQgSSB3b3VsZCBsaWtlIGEgCj4gYml0IG9mIGNvbnNpc3RlbmN5IG9uIHRoZSB3YXkgd2UgcHJp
bnQgTUZOLi4uCgpXZWxsLCAiJSMiUFJJX21mbiBpcyBib2d1cyAoYmVjYXVzZSBvZiB0aGUgY29t
YmluYXRpb24gd2l0aCB0aGUKbWluaW11bSB3aWR0aCBzcGVjaWZpY2F0aW9uKSwgc28gaXQgb3Vn
aHQgdG8gYmUgIiUjbHgiIG9yICIweCUiUFJJX21mbi4KSGF2ZSB5b3UgcmVhbGx5IGJlZW4gYXNr
ZWQgZm9yIHNvbWV0aGluZyBlbHNlPyBJZiBzbywgYW5kIGlmIGl0IHdhcyBtZSwKdGhlbiBJIGFw
b2xvZ2l6ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
