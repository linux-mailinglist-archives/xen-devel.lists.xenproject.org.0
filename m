Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692FFCBE84
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGP7E-0000Or-5x; Fri, 04 Oct 2019 15:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGP7D-0000Om-2g
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:03:31 +0000
X-Inumbo-ID: 1f3f13d6-e6b8-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f3f13d6-e6b8-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 15:03:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05ADDADFB;
 Fri,  4 Oct 2019 15:03:28 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
 <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
Date: Fri, 4 Oct 2019 17:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMTkgMTY6NTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvNC8xOSAzOjQz
IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAwNC4xMC4xOSAxNjozNCwgR2VvcmdlIER1
bmxhcCB3cm90ZToKPj4+IE9uIDEwLzQvMTkgMzoyNCBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToK
Pj4+PiBPbiAwNC4xMC4xOSAxNjowOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4gT24gMTAv
NC8xOSA3OjQwIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gc2NoZWRfdGlja19zdXNw
ZW5kKCkgYW5kIHNjaGVkX3RpY2tfcmVzdW1lKCkgc2hvdWxkIG5vdCBjYWxsIHRoZQo+Pj4+Pj4g
c2NoZWR1bGVyIHNwZWNpZmljIHRpbWVyIGhhbmRsZXJzIGluIGNhc2UgdGhlIGNwdSB0aGV5IGFy
ZSBydW5uaW5nIG9uCj4+Pj4+PiBpcyBqdXN0IGJlaW5nIG1vdmVkIHRvIG9yIGZyb20gYSBjcHVw
b29sLgo+Pj4+Pj4KPj4+Pj4+IFVzZSBhIG5ldyBwZXJjcHUgbG9jayBmb3IgdGhhdCBwdXJwb3Nl
Lgo+Pj4+Pgo+Pj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBjYW4ndCB1c2UgdGhlIHBjcHVfc2No
ZWR1bGVfbG9jaygpIGluc3RlYWQgb2YKPj4+Pj4gaW50cm9kdWNpbmcgYSBuZXcgb25lP8KgIFNv
cnJ5IGlmIHRoaXMgaXMgb2J2aW91cywgYnV0IGl0J3MgYmVlbiBhIHdoaWxlCj4+Pj4+IHNpbmNl
IEkgcG9rZWQgYXJvdW5kIHRoaXMgY29kZS4KPj4+Pgo+Pj4+IExvY2sgY29udGVudGlvbiB3b3Vs
ZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3aXRoIGNyZWRpdDIgd2hpY2ggaXMgdXNpbmcgYQo+Pj4+
IHBlci1jb3JlIG9yIGV2ZW4gcGVyLXNvY2tldCBsb2NrLiBXZSBkb24ndCBjYXJlIGFib3V0IG90
aGVyIHNjaGVkdWxpbmcKPj4+PiBhY3Rpdml0eSBoZXJlLCBhbGwgd2UgbmVlZCBpcyBhIGd1YXJk
IGFnYWluc3Qgb3VyIHBlci1jcHUgc2NoZWR1bGVyCj4+Pj4gZGF0YSBiZWluZyBjaGFuZ2VkIGJl
bmVhdGggb3VyIGZlZXQuCj4+Pgo+Pj4gSXMgdGhpcyBjb2RlIHJlYWxseSBiZWluZyBjYWxsZWQg
c28gb2Z0ZW4gdGhhdCB3ZSBuZWVkIHRvIHdvcnJ5IGFib3V0Cj4+PiB0aGlzIGxldmVsIG9mIGNv
bnRlbnRpb24/Cj4+Cj4+IEl0cyBjYWxsZWQgZWFjaCB0aW1lIGlkbGUgaXMgZW50ZXJlZCBhbmQg
bGVmdCBhZ2Fpbi4KPj4KPj4gRXNwZWNpYWxseSB3aXRoIGNvcmUgc2NoZWR1bGluZyB0aGVyZSBp
cyBhIGhpZ2ggcHJvYmFiaWxpdHkgb2YgbXVsdGlwbGUKPj4gY3B1cyBsZWF2aW5nIGlkbGUgYXQg
dGhlIHNhbWUgdGltZSBhbmQgdGhlIHBlci1zY2hlZHVsZXIgbG9jayBiZWluZyB1c2VkCj4+IGlu
IHBhcmFsbGVsIGFscmVhZHkuCj4gCj4gSHJtLCB0aGF0IGRvZXMgc291bmQgcHJldHR5IGJhZC4K
PiAKPj4+IFdlIGFscmVhZHkgaGF2ZSBhICpsb3QqIG9mIGxvY2tzOyBhbmQgaW4gdGhpcyBjYXNl
IHlvdSdyZSBhZGRpbmcgYQo+Pj4gc2Vjb25kIGxvY2sgd2hpY2ggaW50ZXJhY3RzIHdpdGggdGhl
IHBlci1zY2hlZHVsZXIgY3B1IGxvY2suwqAgVGhpcyBqdXN0Cj4+PiBzZWVtcyBsaWtlIGFza2lu
ZyBmb3IgdHJvdWJsZS4KPj4KPj4gSW4gd2hpY2ggd2F5IGRvZXMgaXQgaW50ZXJhY3Qgd2l0aCB0
aGUgcGVyLXNjaGVkdWxlciBjcHUgbG9jaz8KPj4KPj4+IEkgd29uJ3QgTmFjayB0aGUgcGF0Y2gs
IGJ1dCBJIGRvbid0IHRoaW5rIEkgd291bGQgYWNrIGl0IHdpdGhvdXQgY2xlYXIKPj4+IGV2aWRl
bmNlIHRoYXQgdGhlIGV4dHJhIGxvY2sgaGFzIGEgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgdGhh
dCdzIHdvcnRoCj4+PiB0aGUgY29zdCBvZiB0aGUgZXh0cmEgY29tcGxleGl0eS4KPj4KPj4gSSB0
aGluayBjb21wbGV4aXR5IGlzIGxvd2VyIHRoaXMgd2F5LiBFc3BlY2lhbGx5IGNvbnNpZGVyaW5n
IHRoZSBwZXItCj4+IHNjaGVkdWxlciBsb2NrIGNoYW5naW5nIHdpdGggbW92aW5nIGEgY3B1IHRv
IG9yIGZyb20gYSBjcHVwb29sLgo+IAo+IFRoZSBrZXkgYXNwZWN0IG9mIHRoZSBwZXItc2NoZWR1
bGVyIGxvY2sgaXMgdGhhdCBvbmNlIHlvdSBob2xkIGl0LCB0aGUKPiBwb2ludGVyIHRvIHRoZSBs
b2NrIGNhbid0IGNoYW5nZS4KPiAKPiBBZnRlciB0aGlzIHBhdGNoLCB0aGUgZmFjdCByZW1haW5z
IHRoYXQgc29tZXRpbWVzIHlvdSBuZWVkIHRvIGdyYWIgb25lCj4gbG9jaywgc29tZXRpbWVzIHRo
ZSBvdGhlciwgYW5kIHNvbWV0aW1lcyBib3RoLgo+IAo+IEFuZCwgdGlja19zdXNwZW5kKCkgbGl2
ZXMgaW4gdGhlIHBlci1zY2hlZHVsZXIgY29kZS4gIEVhY2ggc2NoZWR1bGVyIGhhcwo+IHRvIHJl
bWVtYmVyIHRoYXQgdGlja19zdXNwZW5kIGFuZCB0aWNrX3Jlc3VtZSBob2xkIGEgY29tcGxldGVs
eQo+IGRpZmZlcmVudCBsb2NrIHRvIHRoZSByZXN0IG9mIHRoZSBzY2hlZHVsaW5nIGZ1bmN0aW9u
cy4KCklzIHRoYXQgcmVhbGx5IHNvIGNyaXRpY2FsPyBUb2RheSBvbmx5IGNyZWRpdDEgaGFzIHRp
Y2tfc3VzcGVuZCBhbmQKdGlja19yZXN1bWUgaG9va3MsIGFuZCBib3RoIGFyZSByZWFsbHkgdmVy
eSBzaW1wbGUuIEkgY2FuIGFkZCBhCmNvbW1lbnQgaW4gc2NoZWQtaWYuaCBpZiB5b3UgbGlrZS4K
CkFuZCB1cCB0byBub3cgdGhlcmUgd2FzIG5vIGxvY2sgYXQgYWxsIGludm9sdmVkIHdoZW4gY2Fs
bGluZyB0aGVtLi4uCgpJZiB5b3UgdGhpbmsgdXNpbmcgdGhlIG5vcm1hbCBzY2hlZHVsZXIgbG9j
ayBpcyB0byBiZSBwcmVmZXJyZWQgSSdkCmJlIGhhcHB5IHRvIGNoYW5nZSB0aGUgcGF0Y2guIEJ1
dCBJIHNob3VsZCBtZW50aW9uIEkgd2FzIGFscmVhZHkKcGxhbm5pbmcgdG8gcmV2aXNpdCB1c2Fn
ZSBvZiB0aGUgc2NoZWR1bGVyIGxvY2sgYW5kIHJlcGxhY2UgaXQgYnkgdGhlCm5ldyBwZXItY3B1
IGxvY2sgd2hlcmUgYXBwcm9wcmlhdGUgKG5vdCBzdXJlIEknZCBmaW5kIGFueSBhcHByb3ByaWF0
ZQpwYXRoIGZvciByZXBsYWNlbWVudCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
