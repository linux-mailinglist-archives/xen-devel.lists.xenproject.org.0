Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB9F14BE59
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:13:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUNj-0004B3-Cd; Tue, 28 Jan 2020 17:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwUNh-0004Ay-Hy
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:10:29 +0000
X-Inumbo-ID: 1540a5c2-41f1-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1540a5c2-41f1-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 17:10:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwUNf-0005Yz-OH; Tue, 28 Jan 2020 17:10:27 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwUNf-0003IN-EP; Tue, 28 Jan 2020 17:10:27 +0000
Date: Tue, 28 Jan 2020 17:10:24 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200128171024.67seisrsywu5l5zi@debian>
References: <20200128122823.12920-1-pdurrant@amazon.com>
 <20200128122823.12920-2-pdurrant@amazon.com>
 <20200128134118.r3jyjtdzvgp457ho@debian>
 <4ba0fc3bd8854a34a5a46bf65fb99c22@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ba0fc3bd8854a34a5a46bf65fb99c22@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 1/2] docs/designs: Add a design document
 for non-cooperative live migration
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDM6NDc6MDJQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKWy4uLl0KPiAKPiA+ID4gK21lbW9yeSBwYWdlcyB3aGljaCBhcmUgc2hhcmVkIGJldHdl
ZW4gdGhlIHR3byBkb21haW5zLCBidXQgdGhpcyBjaGFubmVsCj4gPiBvZgo+ID4gPiArY29tbXVu
aWNhdGlvbiBpcyBnZW5lcmFsbHkgZXN0YWJsaXNoZWQgdXNpbmcgeGVuc3RvcmUgKHRoZSBzdG9y
ZQo+ID4gcHJvdG9jb2wKPiA+ID4gK2l0c2VsZiBiZWluZyBhbiBleGNlcHRpb24gdG8gdGhpcyBm
b3Igb2J2aW91cyBjaGlja2VuLWFuZC1lZ2cgcmVhc29ucykuCj4gPiA+ICsKPiA+ID4gK1R5cGlj
YWwgcHJvdG9jb2wgZXN0YWJsaXNobWVudCBpcyBiYXNlZCBvbiB1c2Ugb2YgdHdvIHNlcGFyYXRl
IHhlbnN0b3JlCj4gPiA+ICsqYXJlYXMqLiBJZiB3ZSBjb25zaWRlciBQViBkcml2ZXJzIGZvciB0
aGUgKm5ldGlmKiBwcm90b2NvbCAoaS5lLiBjbGFzcwo+ID4gdmlmKQo+ID4gPiArYW5kIGFzc3Vt
ZSB0aGUgZ3Vlc3QgaGFzIGRvbWlkIFgsIHRoZSBzZXJ2aWNlIGRvbWFpbiBoYXMgZG9taWQgWSwg
YW5kCj4gPiB0aGUgdmlmCj4gPiA+ICtoYXMgaW5kZXggWiB0aGVuIHRoZSBmcm9udGVuZCBhcmVh
IHdpbGwgcmVzaWRlIHVuZGVyIHRoZSBwYXJlbnQgbm9kZToKPiA+IAo+ID4gVGhlIHRlcm0gInBh
cmVudCIgc2hvd3MgdXAgZmlyc3QgdGltZSBpbiB0aGlzIGRvY3VtZW50LiBXaGF0IGRvZXMgaXQK
PiA+IG1lYW4gaW4gWGVuJ3MgY29udGV4dD8KPiA+IAo+IAoKPiBJJ2QgaG9wZSBpdCdzIHdlbGwg
a25vd24gdGhhdCB4ZW5zdG9yZSBpcyBoaWVyYXJjaGljYWwuIEkgY2FuIGFkZCBhCj4gc2hvcnQg
ZXhwbGFuYXRpb24gaWYgeW91IHRoaW5rIGl04oCZcyBuZWVkZWQuCgpJIHRoaW5rIGl0IGlzIGp1
c3QgbWUgLS0gSSBoYXZlIHJlY2VudGx5IGJlZW4gcmVhZGluZyBIeXBlci1WJ3MgVExGUyBmb3IK
ZmFyIHRvbyBsb25nLCB3aGljaCBzYXlzICJwYXJlbnQgcGFydGl0aW9uIiBldmVyeXdoZXJlLgoK
SXQgd291bGQgYmUgZ29vZCBpZiB5b3Ugc2F5ICJwYXJlbnQgeGVuc3RvcmUgbm9kZSIgb3Igc29t
ZXRoaW5nLCBidXQKdGhhdCdzIG5vdCBhIG11c3QgZm9yIG1lLiBZb3VyIGNsYXJpZmljYXRpb24g
aGVyZSBpcyBnb29kIGVub3VnaCBmb3IgbWUuCgpbLi4uXQo+ID4gPiArb2JqZWN0cyBhdCB0aGUg
cmVjZWl2aW5nIGVuZC4gT3RoZXJzLCBzdWNoIGFzIGdyYW50IHRhYmxlIHN0YXRlLCBjb3VsZAo+
ID4gPiArcG90ZW50aWFsbHkgaGFybWxlc3NseSBmb3JtIHBhcnQgb2YgYSBub3JtYWwgbWlncmF0
aW9uIHN0cmVhbS4KPiA+ID4gKwo+ID4gPiArKiAqICoKPiA+ID4gK1sxXSBQViBkcml2ZXJzIGFy
ZSBkZWVtZWQgdG8gYmUgaW5zdGFsbGVkIGlmIHRoZSBIVk0gcGFyYW1ldGVyCj4gPiA+ICsqSFZN
X1BBUkFNX0NBTExCQUNLX0lSUSogaGFzIGJlZW4gc2V0IHRvIGEgbm9uLXplcm8gdmFsdWUuCj4g
PiAKPiA+IEkgdGhpbmsgdGhpcyBpcyBqdXN0IGFuIGFwcHJveGltYXRpb24sIGJ1dCBpdCBzaG91
bGQgYmUgZ29vZCBlbm91Z2ggaW4KPiA+IHByYWN0aWNlLgo+ID4gCj4gCj4gVGhpcyBpcyBqdXN0
IGRlc2NyaXB0aW9uIG9mIHRoZSB0ZXN0IGFzIGl0IHN0YW5kcy4gUGVyc29uYWxseSBJIGRvbid0
Cj4gbGlrZSBpdCBiZWNhdXNlIEkgdGhpbmsgdGhlIGNhbGxiYWNrIHZpYSBzaG91bGQgYmUga2ls
bGVkIHdpdGggZmlyZSwKPiBidXQgYWxhcyBpdCBpcyBBQkkuIEhvd2V2ZXIgb3RoZXIgbWVjaGFu
aXNtcyBmb3IgZ3Vlc3RzIHRvIGdldCBldmVudHMKPiBub3RpZmljYXRpb25zIGluIEhWTSBndWVz
dHMgaGF2ZSBleGlzdGVkIGZvciBhIHdoaWxlIHNvIEkgd291bGRuJ3QKPiBhY3R1YWxseSB2aWV3
IGl0IGFzIGEgcmVsaWFibGUgdGVzdC4gRS5nLiBJIGNhbiBoYXBwaWx5IGF2b2lkCj4gcmVnaXN0
ZXJpbmcgdGhlIGNhbGxiYWNrIHZpYSBpbiB0aGUgV2luZG93cyBQViBkcml2ZXJzIHdpdGhvdXQg
bG9zcyBvZgo+IGZ1bmN0aW9uYWxpdHkuCgpBIG1vcmUgc29waGlzdGljYXRlZCB0ZXN0IHdvdWxk
IGJlIHRvIGFjdHVhbGx5IHdhdGNoIHhlbnN0b3JlIHRvIHNlZSBpZgp0aGVyZSBpcyBldmVyIGFu
eSBpbnRlcmFjdGlvbiBiZXR3ZWVuIGZyb250ZW5kIG9yIGJhY2tlbmQ/IFRoYXQgd291bGQKcmVx
dWlyZSBtb3JlIGNvZGUgZm9yIHN1cmUuLi4KCk9uIGEgcmVsYXRlZCBub3RlLCB0aGUgaHlwZXJ2
aXNvciBjYWxsYmFjayBtZWNoYW5pc20gaGFzIGluZmVjdGVkIG90aGVyCnR5cGUtMSBoeXBlcnZp
c29ycyAoSHlwZXItViwgQUNSTikgc28gaXQgaXMgdG9vIGxhdGUgdG8gY2hhbmdlIGFueXRoaW5n
Cm5vdy4uLgoKV2VpLgoKPiAKPiAgIFBhdWwKPiAKPiA+ID4gKwo+ID4gPiArWzJdIFNlZQo+ID4g
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2lu
Y2x1ZGUvcHVibGljL2lvL3gKPiA+IGVuYnVzLmgKPiA+ID4gKwo+ID4gPiArWzNdIFNlZQo+ID4g
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9ZG9jcy9z
cGVjcy9saWJ4Yy0KPiA+IG1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jCj4gPiA+ICsKPiA+ID4gK1s0
XSBTZWUKPiA+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Ymxv
YjtmPWRvY3Mvc3BlY3MvbGlieGwtCj4gPiBtaWdyYXRpb24tc3RyZWFtLnBhbmRvYwo+ID4gPiAr
Cj4gPiA+ICtbNV0gU2VlCj4gPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVu
LmdpdDthPWJsb2I7Zj1kb2NzL21pc2MveGVuc3RvcmUudHh0Cj4gPiA+ICsKPiA+ID4gK1s2XSBg
eGVuLWJsa2JhY2tgIGFuZCBgeGVuLW5ldGJhY2tgIGhhdmUgYWxyZWFkeSBiZWVuIG1vZGlmaWVk
IGluIExpbnV4Cj4gPiB0byBkbwo+ID4gPiArdGhpcy4KPiA+ID4gKwo+ID4gPiArWzddIFNlZSBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAt
Cj4gPiAwMS9tc2cwMDYzMi5odG1sCj4gPiA+ICsKPiA+ID4gLS0KPiA+ID4gMi4yMC4xCj4gPiA+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
