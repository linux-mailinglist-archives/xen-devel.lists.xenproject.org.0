Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14363734A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:47:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqnr-0000E5-TA; Thu, 06 Jun 2019 11:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYqnp-0000DT-Tn
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:43:29 +0000
X-Inumbo-ID: 4afd5a30-8850-11e9-91eb-630fd056b9f7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4afd5a30-8850-11e9-91eb-630fd056b9f7;
 Thu, 06 Jun 2019 11:43:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 05:43:24 -0600
Message-Id: <5CF8FC580200007800235E9A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 05:43:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
 <562b4893-82eb-2ae6-3945-f80fdcc8c7a8@citrix.com>
 <5CF8CC0F0200007800235C8C@prv1-mh.provo.novell.com>
 <f75089a8-7493-0e20-15c3-8a8771219d53@citrix.com>
In-Reply-To: <f75089a8-7493-0e20-15c3-8a8771219d53@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] x86/IRQ: bail early from
 irq_guest_eoi_timer_fn() when nothing is in flight
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDEzOjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMDYvMjAxOSAwOToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1
LjA2LjE5IGF0IDE5OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAwOC8wNS8yMDE5IDEzOjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBAQCAtMTEzMCw4ICsx
MTMwLDEwIEBAIHN0YXRpYyB2b2lkIGlycV9ndWVzdF9lb2lfdGltZXJfZm4odm9pZAo+Pj4+ICAg
ICAgICAgIH0KPj4+PiAgICAgIH0KPj4+PiAgCj4+Pj4gLSAgICBpZiAoIGFjdGlvbi0+aW5fZmxp
Z2h0ICE9IDAgKQo+Pj4+IC0gICAgICAgIGdvdG8gb3V0Owo+Pj4+ICsgICAgaWYgKCBhY3Rpb24t
PmluX2ZsaWdodCApCj4+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcKPj4+PiAr
ICAgICAgICAgICAgICAgIklSUSVkOiAlZCBoYW5kbGVycyBzdGlsbCBpbiBmbGlnaHQgYXQgZm9y
Y2VkIEVPSVxuIiwKPj4+PiArICAgICAgICAgICAgICAgZGVzYy0+aXJxLCBhY3Rpb24tPmluX2Zs
aWdodCk7Cj4+PiBBRkFDSVQsIHRoaXMgY29uZGl0aW9uIGNhbiBiZSB0cmlnZ2VyZWQgYnkgYSBi
dWdneS9tYWxpY2lvdXMgZ3Vlc3QsIGJ5Cj4+PiBpdCBzaW1wbHkgaWdub3Jpbmcgb3IgbWFza2lu
ZyB0aGUgbGluZSBpbnRlcnJ1cHQgYXQgdGhlIHZJTy1BUElDLgo+PiBJIGRvbid0IHRoaW5rIGl0
IGNhbiwgbm8uIE9yIGVsc2UgdGhlIEFTU0VSVF9VTlJFQUNIQUJMRSgpIGJlbG93Cj4+IGhlcmUg
d291bGQgYmUgaW52YWxpZCB0byBhZGQuCj4gCj4gV2hpY2ggQVNTRVJUX1VOUkVBQ0hBQkxFKCkg
PyAgSSBrbm93IFJvZ2VyIGFza2VkIGZvciBvbmUsIGJ1dCBJIGRvbid0Cj4gc2VlIGl0IGFueXdo
ZXJlIGluIHRoZSBjb2RlLgoKQmVjYXVzZSBzbyBmYXIgdGhlcmUgd2FzIG5vIHJlYWwgcmVhc29u
IHRvIHJlLXBvc3QuIEl0J3MgcmlnaHQgaGVyZSwKYXMgUm9nZXIgZGlkIGFzayBmb3IsIGFuZCBh
cyBJIGRpZCAoaGVzaXRhbnRseSkgYWdyZWU6CgogICAgaWYgKCBhY3Rpb24tPmluX2ZsaWdodCAp
CiAgICB7CiAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcKICAgICAgICAgICAgICAgIklS
USV1OiAlZC8lZCBoYW5kbGVyKHMpIHN0aWxsIGluIGZsaWdodCBhdCBmb3JjZWQgRU9JXG4iLAog
ICAgICAgICAgICAgICBpcnEsIGFjdGlvbi0+aW5fZmxpZ2h0LCBhY3Rpb24tPm5yX2d1ZXN0cyk7
CiAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CiAgICB9Cgo+Pj4gVGhlIG1lc3NhZ2Ugd291
bGQgYmUgZmFyIG1vcmUgdXNlZnVsIGlmIGl0IGlkZW50aWZpZWQgdGhlIGRvbWFpbiBpbgo+Pj4g
cXVlc3Rpb24sIHdoaWNoIGxvb2tzIGxpa2UgaXQgY2FuIGJlIG9idGFpbmVkIGZyb20gdGhlIG1p
ZGRsZSBvZiB0aGUgbG9vcC4KPj4gVGhhdCB2ZXJ5IGxvb3AgaGFzIGp1c3QgdGFrZW4gY2FyZSBv
ZiBkZWNyZW1lbnRpbmcgLT5pbl9mbGlnaHQgZm9yCj4+IGFsbCBzdWNoIGd1ZXN0cy4KPj4KPj4g
QWxzbyBub3RlIHRoYXQgdGhlcmUgY291bGQgYmUgbW9yZSB0aGFuIG9uZSBvZmZlbmRpbmcgZG9t
YWluLCBmb3IKPj4gc2hhcmVkIElSUXMuIFBsdXMgdGhlIGxvb3AgeW91J3JlIHJlZmVycmluZyB0
byBjYW4gc3BlY2lmaWNhbGx5IF9ub3RfCj4+IGJlIHVzZWQgZm9yIGlkZW50aWZ5aW5nIHRoZSBk
b21haW4ocyksIGJlY2F1c2UgZm9yIHRoZSBvbmVzCj4+IHByb2Nlc3NlZCB0aGVyZSB3ZSBfZGlk
XyBkZWNyZW1lbnQgLT5pbl9mbGlnaHQuIElmIHRoaXMgbWVzc2FnZQo+PiBnZXRzIGxvZ2dlZCwg
d2Ugc2ltcGx5IGhhdmUgbm8gaWRlYSB3aHkgLT5pbl9mbGlnaHQgaXMgX3N0aWxsXyBub24tCj4+
IHplcm8uIFRoaXMgY291bGQgYmUgYSBCVUdfT04oKSwgYnV0IGl0IHNlZW1zIG1vcmUgaW4gbGlu
ZSB3aXRoIG91cgo+PiBnZW5lcmFsIGlkZWEgb2YgaG93IHdlIHdvdWxkIGxpa2UgdG8gZGVhbCB3
aXRoIHN1Y2ggY2FzZXMgdG8gdHJ5Cj4+IGFuZCBrZWVwIHRoZSBzeXN0ZW0gcnVubmluZyBoZXJl
IGluIHJlbGVhc2UgYnVpbGRzLgo+IAo+IE9rIC0gbGV0cyBnbyB3aXRoIHRoaXMgZm9yIG5vdy4g
IEl0IGlzIGEgbmV0IGltcHJvdmVtZW50LCBhbmQgd2UgY2FuCj4gZXZhbHVhdGUgdGhlIGd1ZXN0
LXRyaWdnZXJhYmlsaXR5IGF0IGEgbGF0ZXIgcG9pbnQuCj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MgbXVjaC4gSSdsbCBh
c3N1bWUgdGhpcyBob2xkcyBhbHNvIGZvciB0aGUgYWRqdXN0bWVudHMKcmVxdWVzdGVkIGJ5IFJv
Z2VyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
