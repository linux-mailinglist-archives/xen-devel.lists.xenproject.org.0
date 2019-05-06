Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F914A91
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 15:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNdK4-0001hT-D7; Mon, 06 May 2019 13:06:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNdK3-0001hO-Jc
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 13:06:23 +0000
X-Inumbo-ID: bb178336-6fff-11e9-bb86-f3ed2b5438e4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb178336-6fff-11e9-bb86-f3ed2b5438e4;
 Mon, 06 May 2019 13:06:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 07:06:15 -0600
Message-Id: <5CD03142020000780022C2F6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 07:06:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF0F0200007800229EBC@prv1-mh.provo.novell.com>
 <20190506114809.56e2sl4z6w2z4na2@Air-de-Roger>
In-Reply-To: <20190506114809.56e2sl4z6w2z4na2@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 5/9] x86/IRQ: fix locking around vector
 management
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDEzOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjI1OjAzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBBbGwgb2YgX197YXNzaWduLGJpbmQsY2xlYXJ9X2lycV92ZWN0b3IoKSBtYW5pcHVs
YXRlIHN0cnVjdCBpcnFfZGVzYwo+PiBmaWVsZHMsIGFuZCBoZW5jZSBvdWdodCB0byBiZSBjYWxs
ZWQgd2l0aCB0aGUgZGVzY3JpcHRvciBsb2NrIGhlbGQgaW4KPj4gYWRkaXRpb24gdG8gdmVjdG9y
X2xvY2suIFRoaXMgaXMgY3VycmVudGx5IHRoZSBjYXNlIGZvciBvbmx5Cj4+IHNldF9kZXNjX2Fm
ZmluaXR5KCkgYW5kIGRlc3Ryb3lfaXJxKCksIHdoaWNoIGFsc28gY2xhcmlmaWVzIHdoYXQgdGhl
Cj4gCj4gQUZBSUNUIHNldF9kZXNjX2FmZmluaXR5IGlzIGNhbGxlZCBmcm9tIHNldF9pb2FwaWNf
YWZmaW5pdHlfaXJxIHdoaWNoIGluCj4gdHVybiBpcyBjYWxsZWQgZnJvbSBzZXR1cF9pb2FwaWNf
ZGVzdCB3aXRob3V0IGhvbGRpbmcgdGhlIGRlc2MgbG9jay4KPiBJcyB0aGlzIGZpbmUgYmVjYXVz
ZSB0aGF0J3Mgb25seSB1c2VkIGEgYm9vdCB0aW1lPwoKTm8sIHRoaXMgaXNuJ3QgZmluZSwgYW5k
IGl0J3MgYWxzbyBub3Qgb25seSBjYWxsZWQgYXQgYm9vdCB0aW1lLiBJCnNpbXBseSBkaWRuJ3Qg
c3BvdCB0aGlzIGNhc2Ugb2YgZnVuY3Rpb24gcmUtdXNlIC0gSSBoYWQgY29tZSB0bwp0aGUgY29u
Y2x1c2lvbiB0aGF0IGFsbCBjYWxscyB0byBzZXRfZGVzY19hZmZpbml0eSgpIHdvdWxkIGNvbWUK
dGhyb3VnaCB0aGUgLnNldF9hZmZpbml0eSBob29rIHBvaW50ZXJzIChvciBoYXBwZW4gc3VmZmlj
aWVudGx5CmVhcmx5KS4KClZULWQncyBhZGp1c3RfaXJxX2FmZmluaXR5KCkgaGFzIGEgc2ltaWxh
ciBpc3N1ZS4KCkF0IGJvb3QgdGltZSBhbG9uZSB3b3VsZCBiZSBpbnN1ZmZpY2llbnQgYW55d2F5
LiBOb3QgdGFraW5nCmxvY2tzIGNhbiBvbmx5IGJlIHNhZmUgcHJpb3IgdG8gYnJpbmdpbmcgdXAg
QVBzOyBhbnkgbGF0ZXIKc2tpcHBpbmcgb2YgbG9ja2luZyB3b3VsZCBhdCBsZWFzdCByZXF1aXJl
IGFkZGl0aW9uYWwganVzdGlmaWNhdGlvbi4KCj4+IG5lc3RpbmcgYmVoYXZpb3IgYmV0d2VlbiB0
aGUgbG9ja3MgaGFzIHRvIGJlLiBSZWZsZWN0IHRoZSBuZXcKPj4gZXhwZWN0YXRpb24gYnkgaGF2
aW5nIHRoZXNlIGZ1bmN0aW9ucyBhbGwgdGFrZSBhIGRlc2NyaXB0b3IgYXMKPj4gcGFyYW1ldGVy
IGluc3RlYWQgb2YgYW4gaW50ZXJydXB0IG51bWJlci4KPj4gCj4+IERyb3Agb25lIG9mIHRoZSB0
d28gbGVhZGluZyB1bmRlcnNjb3JlcyBmcm9tIGFsbCB0aHJlZSBmdW5jdGlvbnMgYXQKPj4gdGhl
IHNhbWUgdGltZS4KPj4gCj4+IFRoZXJlJ3Mgb25lIGNhc2UgbGVmdCB3aGVyZSBkZXNjcmlwdG9y
cyBnZXQgbWFuaXB1bGF0ZWQgd2l0aCBqdXN0Cj4+IHZlY3Rvcl9sb2NrIGhlbGQ6IHNldHVwX3Zl
Y3Rvcl9pcnEoKSBhc3N1bWVzIGl0cyBjYWxsZXIgdG8gYWNxdWlyZQo+PiB2ZWN0b3JfbG9jaywg
YW5kIGhlbmNlIGNhbid0IGl0c2VsZiBhY3F1aXJlIHRoZSBkZXNjcmlwdG9yIGxvY2tzICh3cm9u
Zwo+PiBsb2NrIG9yZGVyKS4gSSBkb24ndCBjdXJyZW50bHkgc2VlIGhvdyB0byBhZGRyZXNzIHRo
aXMuCj4gCj4gQ2FuIHlvdSB0YWtlIHRoZSBkZXNjIGxvY2sgYW5kIHZlY3RvciBsb2NrIGZvciBl
YWNoIGlycSBpbiB0aGUgc2Vjb25kCj4gbG9vcCBvZiBzZXR1cF92ZWN0b3JfaXJxIGFuZCByZW1v
dmUgdGhlIHZlY3RvciBsb2NraW5nIGZyb20gdGhlIGNhbGxlcj8KPiAKPiBUaGF0IG1pZ2h0IGJl
IGluZWZmaWNpZW50LCBidXQgaXQncyBqdXN0IGRvbmUgZm9yIENQVSBpbml0aWFsaXphdGlvbi4K
PiAKPiBBRkFJQ1QgdGhlIGZpcnN0IGxvb3Agb2Ygc2V0dXBfdmVjdG9yX2lycSBkb2Vzbid0IHJl
cXVpcmUgYW55IGxvY2tpbmcKPiBzaW5jZSBpdCdzIHBlci1jcHUgaW5pdGlhbGl6YXRpb24uCgpJ
dCdzIG5vdCBzbyBtdWNoIHRoZSBmaXJzdCBsb2NrIGFmYWljdC4gSXQncyB0aGUgY29tYmluZWQg
YWN0aW9uIG9mCmNhbGxpbmcgdGhpcyBmdW5jdGlvbiBhbmQgc2V0dGluZyB0aGUgb25saW5lIGJp
dCB3aGljaCBuZWVkcyB0aGUKbG9jayBoZWxkIGFyb3VuZCBpdC4gSS5lLiB0aGUgZnVuY3Rpb24g
c2V0dGluZyBiaXRzIGluIHZhcmlvdXMKZGVzY3JpcHRvcnMnIENQVSBtYXNrcyAoYW5kIHRoZSB0
cmFja2luZyBvZiB0aGUgdmVjdG9yIC0+IElSUQpyZWxhdGlvbnNoaXBzKSBoYXMgdG8gYmUgYXRv
bWljICh0byB0aGUgb3V0c2lkZSB3b3JsZCkgd2l0aCB0aGUKc2V0dGluZyBvZiB0aGUgQ1BVJ3Mg
Yml0IGluIGNwdV9vbmxpbmVfbWFwLgoKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IAo+IENoYW5nZSBsb29rcyBnb29kIHRvIG1lOgo+IAo+IFJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywg
YnV0IEknbGwgbm90IGFkZCB0aGlzIGZvciBub3csIGdpdmVuIHRoZSBmdXJ0aGVyIGxvY2tpbmcg
dG8KYmUgYWRkZWQgYXMgcGVyIGFib3ZlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
