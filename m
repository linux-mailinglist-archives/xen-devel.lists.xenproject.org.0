Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9E2E1D3
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 18:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW0zr-0000KU-5X; Wed, 29 May 2019 16:00:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hW0zp-0000HD-SO
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:00:09 +0000
X-Inumbo-ID: d32523f6-822a-11e9-9063-a7e0c47ab6b8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d32523f6-822a-11e9-9063-a7e0c47ab6b8;
 Wed, 29 May 2019 16:00:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 10:00:04 -0600
Message-Id: <5CEEAC8202000078002337F7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 10:00:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190529140744.5565-1-paul.durrant@citrix.com>
In-Reply-To: <20190529140744.5565-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] x86/hvm/hpet: avoid 'small' time diff
 test on resume
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

Pj4+IE9uIDI5LjA1LjE5IGF0IDE2OjA3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEl0IGFwcGVhcnMgdGhhdCBldmVuIDY0LWJpdCB2ZXJzaW9ucyBvZiBXaW5kb3dzIDEwLCB3
aGVuIG5vdCB1c2luZyBzeXRoLQo+IGV0aWMgdGltZXJzLCB3aWxsIHVzZSAzMi1iaXQgSFBFVCBu
b24tcGVyaW9kaWMgdGltZXJzLiBUaGVyZSBpcyBhIHRlc3QKPiBpbiBocGV0X3NldF90aW1lcigp
LCBzcGVjaWZpYyB0byAzMi1iaXQgdGltZXJzLCB0aGF0IHRyaWVzIHRvIGRpc2FtYmlndWF0ZQo+
IGJldHdlZW4gYSBjb21wYXJhdG9yIHZhbHVlIHRoYXQgaXMgaW4gdGhlIHBhc3QgYW5kIG9uZSB0
aGF0IGlzIHN1ZmZpY2llbnRseQo+IGZhciBpbiB0aGUgZnV0dXJlIHRoYXQgaXQgd3JhcHMuIFRo
aXMgaXMgZG9uZSBieSBhc3N1bWluZyB0aGF0IHRoZSBkZWx0YQo+IGJldHdlZW4gdGhlIG1haW4g
Y291bnRlciBhbmQgY29tcGFyYXRvciB3aWxsIGJlICdzbWFsbCcgWzFdLCBpZiB0aGUKPiBjb21w
YXJhdG9yIHZhbHVlIGlzIGluIHRoZSBwYXN0LiBVbmZvcnR1bmF0ZWx5LCBtb3JlIG9mdGVuIHRo
YW4gbm90LCB0aGlzCj4gaXMgbm90IHRoZSBjYXNlIGlmIHRoZSB0aW1lciBpcyBiZWluZyByZS1z
dGFydGVkIGFmdGVyIGEgbWlncmF0ZSBhbmQgc28KPiB0aGUgdGltZXIgaXMgc2V0IHRvIGZpcmUg
ZmFyIGluIHRoZSBmdXR1cmUgKGluIGV4Y2VzcyBvZiBhIG1pbnV0ZSBpbgo+IHNldmVyYWwgb2Jz
ZXJ2ZWQgY2FzZXMpIHJhdGhlciB0aGVuIHNldCB0byBmaXJlIGltbWVkaWF0ZWx5LiBUaGlzIGhh
cyBhCj4gcmF0aGVyIG9kZCBzeW1wdG9tIHdoZXJlIHRoZSBndWVzdCBjb25zb2xlIGlzIGFsaXZl
IGVub3VnaCB0byBiZSBhYmxlIHRvCj4gZGVhbCB3aXRoIG1vdXNlIHBvaW50ZXIgcmUtcmVuZGVy
aW5nLCBidXQgYW55IGtleWJvYXJkIGFjdGl2aXR5IG9yIG1vdXNlCj4gY2xpY2tzIHlpZWxkIG5v
IHJlc3BvbnNlLgo+IAo+IFRoaXMgcGF0Y2ggc2ltcGx5IGFkZHMgYW4gZXh0cmEgY2hlY2sgb2Yg
J2NyZWF0aW9uX2ZpbmlzaGVkJyBpbnRvCj4gaHBldF9zZXRfdGltZXIoKSBzbyB0aGF0IHRoZSAn
c21hbGwnIHRpbWUgdGVzdCBpcyBvbWl0dGVkIHdoZW4gdGhlIGZ1bmN0aW9uCj4gaXMgY2FsbGVk
IHRvIHJlc3RhcnQgdGltZXJzIGFmdGVyIG1pZ3JhdGlvbiwgYW5kIHRodXMgYW55IG5lZ2F0aXZl
IGRlbHRhCj4gY2F1c2VzIGEgdGltZXIgdG8gZmlyZSBpbW1lZGlhdGVseS4KPiAKPiBbMV0gVGhl
IG51bWJlciBvZiB0aWNrcyB0aGF0IGVxdWF0ZSB0byAwLjk3NjU2MjUgbWlsbGlzZWNvbmRzCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IEkgbm90aWNl
IHRoYXQgd2Ugc2VlbWluZ2x5IGRvbid0IGhhbmRsZSBtYWluIGNvdW50ZXIgd3JhcCBpbiB0aGUg
SFBFVCBjb2RlLgo+IFRoZSBzcGVjLiBzYXlzIHRoYXQgdGltZXJzIHNob3VsZCBmaXJlIGF0IHRo
ZSBwb2ludCB0aGUgY291bnRlciB3cmFwcyBhdCB0aGUKPiB0aW1lcidzIHdpZHRoLiBJIHRoaW5r
IHRoZSBuZWVkIGZvciB0aGUgJ3NtYWxsJyB0aW1lIHRlc3Qgd291bGQgZ28gYXdheSBpZgo+IHRo
aXMgd2FzIGltcGxlbWVudGVkLCBidXQgdGhhdCdzIGZvciBhbm90aGVyIGRheS4KCkZvciBwb3N0
ZXJpdHkgSSB3b3VsZCBoYXZlIGhvcGVkIHlvdSB3b3VsZCB1cGRhdGUgdGhpcyByZW1hcmsgYXMK
d2VsbC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
