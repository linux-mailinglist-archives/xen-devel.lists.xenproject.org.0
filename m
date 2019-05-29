Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDA2DEAA
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 15:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVylK-0004SH-MD; Wed, 29 May 2019 13:37:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVylK-0004SC-1L
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:37:02 +0000
X-Inumbo-ID: d43edd5e-8216-11e9-b93d-ff782418468a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d43edd5e-8216-11e9-b93d-ff782418468a;
 Wed, 29 May 2019 13:36:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 07:36:56 -0600
Message-Id: <5CEE8AF5020000780023373F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 07:36:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190529130948.5314-1-paul.durrant@citrix.com>
In-Reply-To: <20190529130948.5314-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/hvm/hpet: avoid 'small' time diff test
 on resume
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDE1OjA5LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEkgbm90aWNlIHRoYXQgd2Ugc2VlbWluZ2x5IGRvbid0IGhhbmRsZSBtYWluIGNvdW50ZXIg
d3JhcCBpbiB0aGUgSFBFVCBjb2RlLgo+IFRoZSBzcGVjLiBzYXlzIHRoYXQgdGltZXJzIHNob3Vs
ZCBmaXJlIGF0IHRoZSBwb2ludCB0aGUgY291bnRlciB3cmFwcyBhdCB0aGUKPiB0aW1lcidzIHdp
ZHRoLiBJIHRoaW5rIHRoZSBuZWVkIGZvciB0aGUgJ3NtYWxsJyB0aW1lIHRlc3Qgd291bGQgZ28g
YXdheSBpZgo+IHRoaXMgd2FzIGltcGxlbWVudGVkLCBidXQgdGhhdCdzIGZvciBhbm90aGVyIGRh
eS4KCk9oLCBpbmRlZWQuIEkgd2Fzbid0IGV2ZW4gKGFjdGl2ZWx5KSBhd2FyZSBvZiB0aGlzLiAo
SSBoYXZlbid0IGJlZW4gYWJsZSB0bwpzcG90IGEgc3RhdGVtZW50IHRvIHRoaXMgZWZmZWN0IHRo
b3VnaCBmb3Igd3JhcHBpbmcgb2YgYSA2NC1iaXQgdGltZXIsIGp1c3QKMzItYml0IG9uZXMuKQoK
PiBAQCAtMjczLDEwICsyNzMsMTMgQEAgc3RhdGljIHZvaWQgaHBldF9zZXRfdGltZXIoSFBFVFN0
YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4sCj4gICAgICAgKiBEZXRlY3QgdGltZSB2YWx1ZXMgc2V0
IGluIHRoZSBwYXN0LiBUaGlzIGlzIGhhcmQgdG8gZG8gZm9yIDMyLWJpdAo+ICAgICAgICogY29t
cGFyYXRvcnMgYXMgdGhlIHRpbWVyIGRvZXMgbm90IGhhdmUgdG8gYmUgc2V0IHRoYXQgZmFyIGlu
IHRoZSBmdXR1cmUKPiAgICAgICAqIGZvciB0aGUgY291bnRlciBkaWZmZXJlbmNlIHRvIHdyYXAg
YSAzMi1iaXQgc2lnbmVkIGludGVnZXIuIFdlIGZ1ZGdlCj4gLSAgICAgKiBieSBsb29raW5nIGZv
ciBhICdzbWFsbCcgdGltZSB2YWx1ZSBpbiB0aGUgcGFzdC4KPiArICAgICAqIGJ5IGxvb2tpbmcg
Zm9yIGEgJ3NtYWxsJyB0aW1lIHZhbHVlIGluIHRoZSBwYXN0LiBIb3dldmVyLCBpZiB3ZQo+ICsg
ICAgICogYXJlIHJlc3VtaW5nIGZyb20gc3VzcGVuZCwgdHJlYXQgYW55IHdyYXAgYXMgcGFzdCBz
aW5jZSB0aGUgdmFsdWUKPiArICAgICAqIGlzIHVubGlrZWx5IHRvIGJlICdzbWFsbCcuCj4gICAg
ICAgKi8KCiJyZXN1bWluZyIgYW5kICJzdXNwZW5kIiBhcmUgYXQgYmVzdCBhbWJpZ3VvdXMgLSB0
byBtZSB0aGUgdGVybXMKcmVsYXRlIG1vcmUgdG8gQUNQSSBTLXN0YXRlcyB0aGFuIHRvIG1pZ3Jh
dGUvc2F2ZS9yZXN0b3JlLiBDb3VsZApJIGdldCB5b3UgdG8gYWdyZWUgdG8gdXNpbmcgInJlc3Rv
cmluZyBhZnRlciBtaWdyYXRpb24iIG9yIHNvbWUgc3VjaD8KCldpdGggdGhpcyBpbiBtaW5kIC0g
aXMgYSBuZXcgYm9vbCBwYXJhbWV0ZXIgbmVlZGVkIGF0IGFsbD8gQ2FuJ3QgeW91Cmluc3RlYWQg
a2V5IHRoaXMgb2ZmIG9mIHZocGV0X2RvbWFpbihoKS0+Y3JlYXRpb25fZmluaXNoZWQ/Cgo+ICAg
ICAgaWYgKCAoaW50NjRfdClkaWZmIDwgMCApCj4gLSAgICAgICAgZGlmZiA9ICh0aW1lcl9pc18z
MmJpdChoLCB0bikgJiYgKC1kaWZmID4gSFBFVF9USU5ZX1RJTUVfU1BBTikpCj4gKyAgICAgICAg
ZGlmZiA9ICh0aW1lcl9pc18zMmJpdChoLCB0bikgJiYgKC1kaWZmID4gSFBFVF9USU5ZX1RJTUVf
U1BBTikgJiYKPiArICAgICAgICAgICAgICAgICFyZXN1bWUpCgpMb2dpY2FsbHkgSSB3b3VsZCBz
ZWUgdGhlIG5ldyBwYXJ0IG9mIHRoZSBjb25kaXRpb24gZ28gZmlyc3QsIGJ1dCB0aGF0J3MKcmVh
bGx5IG1pbm9yIGFzIGFsbCB0aHJlZSBjaGVja3MgYXJlIHN1ZmZpY2llbnRseSBjaGVhcC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
