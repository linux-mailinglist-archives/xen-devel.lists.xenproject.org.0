Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2D01B9D5
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQClP-0007rU-Dv; Mon, 13 May 2019 15:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQClO-0007rO-Ib
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:21:14 +0000
X-Inumbo-ID: bcc3b978-7592-11e9-b5b5-376786e66dc7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcc3b978-7592-11e9-b5b5-376786e66dc7;
 Mon, 13 May 2019 15:21:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:21:10 -0600
Message-Id: <5CD98B61020000780022E3D8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:21:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D545020000780022CD3D@prv1-mh.provo.novell.com>
 <20190513113223.pyvrp6nrhbczgbjj@Air-de-Roger>
In-Reply-To: <20190513113223.pyvrp6nrhbczgbjj@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 06/12] x86/IRQ: consolidate use of
 ->arch.cpu_mask
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

Pj4+IE9uIDEzLjA1LjE5IGF0IDEzOjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA3OjEwOjI5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9pb19hcGljLmMKPj4gQEAgLTY4MCw3ICs2ODAsNyBAQCB2b2lkIC8qX19pbml0Ki8gc2V0dXBf
aW9hcGljX2Rlc3Qodm9pZCkKPj4gICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4gICAgICAg
ICAgICAgIGlycSA9IHBpbl8yX2lycShpcnFfZW50cnksIGlvYXBpYywgcGluKTsKPj4gICAgICAg
ICAgICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOwo+PiAtICAgICAgICAgICAgQlVHX09OKGNw
dW1hc2tfZW1wdHkoZGVzYy0+YXJjaC5jcHVfbWFzaykpOwo+PiArICAgICAgICAgICAgQlVHX09O
KCFjcHVtYXNrX2ludGVyc2VjdHMoZGVzYy0+YXJjaC5jcHVfbWFzaywgJmNwdV9vbmxpbmVfbWFw
KSk7Cj4gCj4gSSB3b25kZXIgaWYgbWF5YmUgeW91IGNvdWxkIGluc3RlYWQgZG86Cj4gCj4gaWYg
KCBjcHVtYXNrX2ludGVyc2VjdHMoZGVzYy0+YXJjaC5jcHVfbWFzaywgJmNwdV9vbmxpbmVfbWFw
KSApCj4gICAgIHNldF9pb2FwaWNfYWZmaW5pdHlfaXJxKGRlc2MsIGRlc2MtPmFyY2guY3B1X21h
c2spOwo+IGVsc2UKPiAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gCj4gSSBndWVzcyBpZiB0
aGUgSVJRIGlzIGluIHVzZSBieSBYZW4gaXRzZWxmIHRoZSBmYWlsdXJlIG91Z2h0IHRvIGJlCj4g
ZmF0YWwuCgpBbmQgaW1vIGFsc28gd2hlbiBpdCdzIGFub3RoZXIgb25lICh1c2VkIGJ5IERvbTAp
LiBJaXJjIHdlIGdldApoZXJlIG9ubHkgZHVyaW5nIERvbTAgYm9vdCAodGhlIGNvbW1lbnRlZCBv
dXQgX19pbml0IHNlcnZpbmcgYXMKYSBoaW50KS4gSGVuY2UgSSB0aGluayBCVUdfT04oKSBpcyBi
ZXR0ZXIgaW4gdGhpcyBjYXNlIHRoYW4gYW55CmZvciBvZiBhc3NlcnRpb24uCgo+PiBAQCAtMjIz
MiwxMSArMjIzMSwxNyBAQCBpbnQgaW9fYXBpY19zZXRfcGNpX3JvdXRpbmcgKGludCBpb2FwaWMs
Cj4+ICAgICAgICAgIHJldHVybiB2ZWN0b3I7Cj4+ICAgICAgZW50cnkudmVjdG9yID0gdmVjdG9y
Owo+PiAgCj4+IC0gICAgY3B1bWFza19jb3B5KCZtYXNrLCBUQVJHRVRfQ1BVUyk7Cj4+IC0gICAg
LyogRG9uJ3QgY2hhbmNlIGVuZGluZyB1cCB3aXRoIGFuIGVtcHR5IG1hc2suICovCj4+IC0gICAg
aWYgKGNwdW1hc2tfaW50ZXJzZWN0cygmbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzaykpCj4+IC0g
ICAgICAgIGNwdW1hc2tfYW5kKCZtYXNrLCAmbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzayk7Cj4+
IC0gICAgU0VUX0RFU1QoZW50cnksIGxvZ2ljYWwsIGNwdV9tYXNrX3RvX2FwaWNpZCgmbWFzaykp
Owo+PiArICAgIGlmIChjcHVtYXNrX2ludGVyc2VjdHMoZGVzYy0+YXJjaC5jcHVfbWFzaywgVEFS
R0VUX0NQVVMpKSB7Cj4+ICsgICAgICAgIGNwdW1hc2tfdCAqbWFzayA9IHRoaXNfY3B1KHNjcmF0
Y2hfY3B1bWFzayk7Cj4+ICsKPj4gKyAgICAgICAgY3B1bWFza19hbmQobWFzaywgZGVzYy0+YXJj
aC5jcHVfbWFzaywgVEFSR0VUX0NQVVMpOwo+PiArICAgICAgICBTRVRfREVTVChlbnRyeSwgbG9n
aWNhbCwgY3B1X21hc2tfdG9fYXBpY2lkKG1hc2spKTsKPj4gKyAgICB9IGVsc2Ugewo+PiArICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUiAiSVJRJWQ6IG5vIHRhcmdldCBDUFUgKCUqcGIgdnMgJSpw
YilcbiIsCj4+ICsgICAgICAgICAgICAgICBpcnEsIG5yX2NwdV9pZHMsIGNwdW1hc2tfYml0cyhk
ZXNjLT5hcmNoLmNwdV9tYXNrKSwKPj4gKyAgICAgICAgICAgICAgIG5yX2NwdV9pZHMsIGNwdW1h
c2tfYml0cyhUQVJHRVRfQ1BVUykpOwo+PiArICAgICAgICBkZXNjLT5zdGF0dXMgfD0gSVJRX0RJ
U0FCTEVEOwo+PiArICAgIH0KPiAKPiBIbSwgcGFydCBvZiB0aGlzIGZpbGUgZG9lc24ndCBzZWVt
IHRvIHVzZSBYZW4gY29kaW5nIHN0eWxlLCBidXQgdGhlCj4gY2h1bmsgeW91IGFkZCBiZWxvdyBk
b2VzIHVzZSBpdC4gQW5kIHRoZXJlIGFyZSBmdW5jdGlvbnMgKGxpa2UKPiBtYXNrX2FuZF9hY2tf
bGV2ZWxfaW9hcGljX2lycSB0aGF0IHNlZW0gdG8gdXNlIGEgbWl4IG9mIGNvZGluZwo+IHN0eWxl
cykuCj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQncyB0aGUgcG9saWN5IGhlcmUsIHNob3VsZCBuZXcg
Y2h1bmtzIGZvbGxvdyBYZW4ncwo+IGNvZGluZyBzdHlsZT8KCldlbGwsIEkndmUgZGVjaWRlZCB0
byBtYXRjaCBzdXJyb3VuZGluZyBjb2RlJ3Mgc3R5bGUsIHVudGlsIHRoZSBmaWxlCmdldHMgbW9y
cGhlZCBpbnRvIGNvbnNpc3RlbnQgc2hhcGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
