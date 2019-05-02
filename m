Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5028D1141B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 09:26:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM65c-0002x9-C6; Thu, 02 May 2019 07:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM65b-0002x3-En
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 07:25:07 +0000
X-Inumbo-ID: 63d09d6c-6cab-11e9-8498-c7e9d8c7eec1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63d09d6c-6cab-11e9-8498-c7e9d8c7eec1;
 Thu, 02 May 2019 07:24:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 01:24:57 -0600
Message-Id: <5CCA9B49020000780022B043@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 01:24:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
 <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
 <5CC8646F020000780022A89E@prv1-mh.provo.novell.com>
 <b6b753ed-baa3-832f-5d40-e26d0a25a36a@citrix.com>
In-Reply-To: <b6b753ed-baa3-832f-5d40-e26d0a25a36a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDE4OjAzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzMwLzE5IDQ6MDYgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4w
NC4xOSBhdCAxNjo0MywgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiA0
LzMwLzE5IDk6NDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDMwLjA0LjE5IGF0
IDEwOjI4LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgQXByIDMw
LCAyMDE5IGF0IDE6MTUgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToK
Pj4+Pj4+IEkndmUgb3V0bGluZWQgYSBzb2x1dGlvbiBhbHJlYWR5OiBNYWtlIGEgbWVtLXNoYXJp
bmcgcHJpdmF0ZSB2YXJpYW50Cj4+Pj4+PiBvZiBwYWdlX3ssdW59bG9jaygpLCBkZXJpdmVkIGZy
b20gdGhlIFBWIG9uZXMgKGJ1dCB3aXRoIHBpZWNlcwo+Pj4+Pj4gZHJvcHBlZCB5b3UgZG9uJ3Qg
d2FudC9uZWVkKS4KPj4+Pj4KPj4+Pj4gV2VsbCwgdGhhdCdzIHdoYXQgSSBhbHJlYWR5IGRpZCBo
ZXJlIGluIHRoaXMgcGF0Y2guIE5vPwo+Pj4+Cj4+Pj4gTm8gLSB5b3UndmUgcmV0YWluZWQgYSBz
aGFyZWQgX3BhZ2Vfeyx1bn1sb2NrKCksIHdoZXJlYXMgbXkKPj4+PiBzdWdnZXN0aW9uIHdhcyB0
byBoYXZlIGEgY29tcGxldGVseSBpbmRlcGVuZGVudCBwYWlyIG9mCj4+Pj4gZnVuY3Rpb25zIGlu
IG1lbV9zaGFyaW5nLmMuIFRoZSBvbmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBWCj4+Pj4gYW5k
IEhWTSB3b3VsZCB0aGVuIGJlIHRoZSBQR1RfbG9ja2VkIGZsYWcuCj4+Pgo+Pj4gQnV0IGl0IHdh
c24ndCBvYnZpb3VzIHRvIG1lIGhvdyB0aGUgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBhY3R1YWwg
bG9jawo+Pj4gZnVuY3Rpb24gd291bGQgYmUgYmUgZGlmZmVyZW50LiAgQW5kIHRoZXJlJ3Mgbm8g
cG9pbnQgaW4gaGF2aW5nIHR3bwo+Pj4gaWRlbnRpY2FsIGltcGxlbWVudGF0aW9uczsgaW4gZmFj
dCwgaXQgd291bGQgYmUgaGFybWZ1bC4KPj4gCj4+IFRoZSBtYWluIGRpZmZlcmVuY2Ugd291bGQg
YmUgdGhlIG9uZSB0aGF0IFRhbWFzIGlzIGFmdGVyIC0gbm90Cj4+IGRvaW5nIHRoZSBjaGVja2lu
ZyB0aGF0IHdlIGRvIGZvciBQVi4gV2hldGhlciBvdGhlciBiaXRzIGNvdWxkCj4+IGJlIGRyb3Bw
ZWQgZm9yIGEgbWVtLXNoYXJpbmcgc3BlY2lhbCB2YXJpYW50IEkgZG9uJ3Qga25vdyAoeWV0KS4K
PiAKPiBUaGUgImNoZWNraW5nIiBiZWluZyB0aGF0IHRoZSB0eXBlIGNvdW50IGRvZXNuJ3QgZ28g
dG8gMD8KPiAKPiBJdCdzIG5vdCBqdXN0IHBhZ2VfbG9jaygpIHRoYXQgZG9lcyB0aGF0IGNoZWNr
aW5nOyBpdCdzIGFsc28KPiBfcHV0X3BhZ2VfdHlwZSgpLiAgV2UgY2FuJ3QgcmVhbGx5IGNoYW5n
ZSBvbmUgYnV0IGxlYXZlIHRoZSBvdGhlciBhbG9uZS4KCk5vLCBJIG1lYW4gdGhlIGV4dHJhIGRl
YnVnIGNoZWNraW5nIChjdXJyZW50X2xvY2tlZF9wYWdlXyooKSkuClNlZSBoaXMgcGF0Y2ggYXMg
dG8gd2hhdCBoZSBrZWVwcyBmb3IgbWVtLXNoYXJpbmcsIGFuZCB3aGF0IGhlCmRyb3BzLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
