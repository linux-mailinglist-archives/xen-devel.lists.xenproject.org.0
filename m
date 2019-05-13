Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E21B272
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 11:12:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ6xw-0005X5-RL; Mon, 13 May 2019 09:09:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQ6xu-0005Wv-Ml
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 09:09:46 +0000
X-Inumbo-ID: d86b9d96-755e-11e9-badf-2bd73af80e00
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d86b9d96-755e-11e9-badf-2bd73af80e00;
 Mon, 13 May 2019 09:09:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 03:09:42 -0600
Message-Id: <5CD93453020000780022E024@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 03:09:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D38D020000780022CD00@prv1-mh.provo.novell.com>
 <20190513090404.62dixltthugwz76w@Air-de-Roger>
In-Reply-To: <20190513090404.62dixltthugwz76w@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 01/12] x86/IRQ: deal with
 move-in-progress state in fixup_irqs()
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

Pj4+IE9uIDEzLjA1LjE5IGF0IDExOjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA3OjAzOjA5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGUgZmxhZyBiZWluZyBzZXQgbWF5IHByZXZlbnQgYWZmaW5pdHkgY2hhbmdlcywg
YXMgdGhlc2Ugb2Z0ZW4gaW1wbHkKPj4gYXNzaWdubWVudCBvZiBhIG5ldyB2ZWN0b3IuIFdoZW4g
dGhlcmUncyBubyBwb3NzaWJsZSBkZXN0aW5hdGlvbiBsZWZ0Cj4+IGZvciB0aGUgSVJRLCB0aGUg
Y2xlYXJpbmcgb2YgdGhlIGZsYWcgbmVlZHMgdG8gaGFwcGVuIHJpZ2h0IGZyb20KPj4gZml4dXBf
aXJxcygpLgo+PiAKPj4gQWRkaXRpb25hbGx5IF9hc3NpZ25faXJxX3ZlY3RvcigpIG5lZWRzIHRv
IGF2b2lkIHNldHRpbmcgdGhlIGZsYWcgd2hlbgo+PiB0aGVyZSdzIG5vIG9ubGluZSBDUFUgbGVm
dCBpbiB3aGF0IGdldHMgcHV0IGludG8gLT5hcmNoLm9sZF9jcHVfbWFzay4KPj4gVGhlIG9sZCB2
ZWN0b3IgY2FuIGJlIHJlbGVhc2VkIHJpZ2h0IGF3YXkgaW4gdGhpcyBjYXNlLgo+PiAKPj4gQWxz
byBleHRlbmQgdGhlIGxvZyBtZXNzYWdlIGFib3V0IGJyb2tlbiBhZmZpbml0eSB0byBpbmNsdWRl
IHRoZSBuZXcKPj4gYWZmaW5pdHkgYXMgd2VsbCwgYWxsb3dpbmcgdG8gbm90aWNlIGlzc3VlcyB3
aXRoIGFmZmluaXR5IGNoYW5nZXMgbm90Cj4+IGFjdHVhbGx5IGhhdmluZyB0YWtlbiBwbGFjZS4g
U3dhcCB0aGUgaWYvZWxzZS1pZiBvcmRlciB0aGVyZSBhdCB0aGUKPj4gc2FtZSB0aW1lIHRvIHJl
ZHVjZSB0aGUgYW1vdW50IG9mIGNvbmRpdGlvbnMgY2hlY2tlZC4KPj4gCj4+IEF0IHRoZSBzYW1l
IHRpbWUgcmVwbGFjZSB0d28gb3BlbiBjb2RlZCBpbnN0YW5jZXMgb2YgdGhlIG5ldyBoZWxwZXIK
Pj4gZnVuY3Rpb24uCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gCj4gVGhhbmtzLAo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4+IEBAIC01MTcsMTIgKzUzMSwyMSBA
QCBuZXh0Ogo+PiAgICAgICAgICAvKiBGb3VuZCBvbmUhICovCj4+ICAgICAgICAgIGN1cnJlbnRf
dmVjdG9yID0gdmVjdG9yOwo+PiAgICAgICAgICBjdXJyZW50X29mZnNldCA9IG9mZnNldDsKPj4g
LSAgICAgICAgaWYgKG9sZF92ZWN0b3IgPiAwKSB7Cj4+IC0gICAgICAgICAgICBkZXNjLT5hcmNo
Lm1vdmVfaW5fcHJvZ3Jlc3MgPSAxOwo+PiAtICAgICAgICAgICAgY3B1bWFza19jb3B5KGRlc2Mt
PmFyY2gub2xkX2NwdV9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrKTsKPj4gKwo+PiArICAgICAg
ICBpZiAoIG9sZF92ZWN0b3IgPiAwICkKPiAKPiBNYXliZSB5b3UgY291bGQgdXNlIHZhbGlkX2ly
cV92ZWN0b3IgaGVyZSwgb3IgY29tcGFyZSBhZ2FpbnN0Cj4gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVE
PwoKTm90IGluIHRoaXMgcGF0Y2gsIGJ1dCBJJ2QgbGlrZSB0byB3aWRlbiB0aGUgdXNlIG9mIHZh
bGlkX2lycV92ZWN0b3IoKQpzdWJzZXF1ZW50bHksIHdoaWNoIHdvdWxkIGxpa2VseSBhbHNvIGlu
Y2x1ZGUgdGhpcyBjYXNlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
