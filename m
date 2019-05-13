Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC341B98B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:08:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCWa-000634-LF; Mon, 13 May 2019 15:05:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCWY-00062z-Vf
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:05:55 +0000
X-Inumbo-ID: 9893e296-7590-11e9-8a41-c31f281df919
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9893e296-7590-11e9-8a41-c31f281df919;
 Mon, 13 May 2019 15:05:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:05:50 -0600
Message-Id: <5CD987C9020000780022E3AF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:05:45 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
 <20190513134821.pomwew6vmtibxvem@Air-de-Roger>
 <5CD97CD8020000780022E2AA@prv1-mh.provo.novell.com>
 <20190513144518.lrijyr232hjchrvj@Air-de-Roger>
In-Reply-To: <20190513144518.lrijyr232hjchrvj@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 07/12] x86/IRQ: fix locking around vector
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

Pj4+IE9uIDEzLjA1LjE5IGF0IDE2OjQ1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDA4OjE5OjA0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTMuMDUuMTkgYXQgMTU6NDgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTA6NTlBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jCj4+ID4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+
ID4+IEBAIC0yMTM0LDExICsyMTM0LDE2IEBAIHN0YXRpYyB2b2lkIGFkanVzdF9pcnFfYWZmaW5p
dHkoc3RydWN0IGEKPj4gPj4gICAgICB1bnNpZ25lZCBpbnQgbm9kZSA9IHJoc2EgPyBweG1fdG9f
bm9kZShyaHNhLT5wcm94aW1pdHlfZG9tYWluKQo+PiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA6IE5VTUFfTk9fTk9ERTsKPj4gPj4gICAgICBjb25zdCBjcHVtYXNrX3QgKmNwdW1h
c2sgPSAmY3B1X29ubGluZV9tYXA7Cj4+ID4+ICsgICAgc3RydWN0IGlycV9kZXNjICpkZXNjOwo+
PiA+PiAgCj4+ID4+ICAgICAgaWYgKCBub2RlIDwgTUFYX05VTU5PREVTICYmIG5vZGVfb25saW5l
KG5vZGUpICYmCj4+ID4+ICAgICAgICAgICBjcHVtYXNrX2ludGVyc2VjdHMoJm5vZGVfdG9fY3B1
bWFzayhub2RlKSwgY3B1bWFzaykgKQo+PiA+PiAgICAgICAgICBjcHVtYXNrID0gJm5vZGVfdG9f
Y3B1bWFzayhub2RlKTsKPj4gPj4gLSAgICBkbWFfbXNpX3NldF9hZmZpbml0eShpcnFfdG9fZGVz
YyhkcmhkLT5pb21tdS0+bXNpLmlycSksIGNwdW1hc2spOwo+PiA+PiArCj4+ID4+ICsgICAgZGVz
YyA9IGlycV90b19kZXNjKGRyaGQtPmlvbW11LT5tc2kuaXJxKTsKPj4gPj4gKyAgICBzcGluX2xv
Y2tfaXJxKCZkZXNjLT5sb2NrKTsKPj4gPiAKPj4gPiBJIHdvdWxkIHVzZSB0aGUgaXJxc2F2ZS9p
cnFyZXN0b3JlIHZhcmlhbnRzIGhlcmUgZm9yIGV4dHJhIHNhZmV0eS4KPj4gCj4+IEhtbSwgbWF5
YmUuIEJ1dCBJIHRoaW5rIHdlJ3JlIGluIGJpZ2dlciB0cm91YmxlIGlmIElSUXMgaW5kZWVkCj4+
IGVuZGVkIHVwIGVuYWJsZWQgYXQgYW55IG9mIHRoZSB0d28gcG9pbnRzIHdoZXJlIHRoaXMgZnVu
Y3Rpb24KPj4gZ2V0cyBjYWxsZWQuCj4gCj4gSSB0aGluayBJJ20gbWlzcmVhZGluZyB0aGUgYWJv
dmUsIGJ1dCBpZiB5b3UgZXhwZWN0Cj4gYWRqdXN0X2lycV9hZmZpbml0eSB0byBhbHdheXMgYmUg
Y2FsbGVkIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCB1c2luZwo+IHNwaW5fdW5sb2NrX2lycSBp
cyB3cm9uZyBhcyBpdCB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlcyBpbnRlcnJ1cHRzLgoKT29wcyAt
IHMvZW5hYmxlZC9kaXNhYmxlZC8gaW4gbXkgZWFybGllciByZXBseS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
