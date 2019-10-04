Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDBCBF8B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:43:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPhC-0004jt-74; Fri, 04 Oct 2019 15:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGPhA-0004jn-GG
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:40:40 +0000
X-Inumbo-ID: 508fe348-e6bd-11e9-975c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 508fe348-e6bd-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:40:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01897B157;
 Fri,  4 Oct 2019 15:40:37 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
 <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
 <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
 <7a90d9d6-9af2-47ed-eaed-480dfb2e72f6@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <17e45c30-9d62-94f0-c77e-26e2532b3f69@suse.com>
Date: Fri, 4 Oct 2019 17:40:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a90d9d6-9af2-47ed-eaed-480dfb2e72f6@citrix.com>
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

T24gMDQuMTAuMTkgMTc6MzcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvNC8xOSA0OjAz
IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAwNC4xMC4xOSAxNjo1NiwgR2VvcmdlIER1
bmxhcCB3cm90ZToKPj4+IE9uIDEwLzQvMTkgMzo0MyBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToK
Pj4+PiBPbiAwNC4xMC4xOSAxNjozNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4gT24gMTAv
NC8xOSAzOjI0IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMTAuMTkgMTY6
MDgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+Pj4gT24gMTAvNC8xOSA3OjQwIEFNLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+PiBzY2hlZF90aWNrX3N1c3BlbmQoKSBhbmQgc2NoZWRf
dGlja19yZXN1bWUoKSBzaG91bGQgbm90IGNhbGwgdGhlCj4+Pj4+Pj4+IHNjaGVkdWxlciBzcGVj
aWZpYyB0aW1lciBoYW5kbGVycyBpbiBjYXNlIHRoZSBjcHUgdGhleSBhcmUKPj4+Pj4+Pj4gcnVu
bmluZyBvbgo+Pj4+Pj4+PiBpcyBqdXN0IGJlaW5nIG1vdmVkIHRvIG9yIGZyb20gYSBjcHVwb29s
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBVc2UgYSBuZXcgcGVyY3B1IGxvY2sgZm9yIHRoYXQgcHVycG9z
ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IElzIHRoZXJlIGEgcmVhc29uIHdlIGNhbid0IHVzZSB0aGUgcGNw
dV9zY2hlZHVsZV9sb2NrKCkgaW5zdGVhZCBvZgo+Pj4+Pj4+IGludHJvZHVjaW5nIGEgbmV3IG9u
ZT/CoCBTb3JyeSBpZiB0aGlzIGlzIG9idmlvdXMsIGJ1dCBpdCdzIGJlZW4gYQo+Pj4+Pj4+IHdo
aWxlCj4+Pj4+Pj4gc2luY2UgSSBwb2tlZCBhcm91bmQgdGhpcyBjb2RlLgo+Pj4+Pj4KPj4+Pj4+
IExvY2sgY29udGVudGlvbiB3b3VsZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3aXRoIGNyZWRpdDIg
d2hpY2ggaXMKPj4+Pj4+IHVzaW5nIGEKPj4+Pj4+IHBlci1jb3JlIG9yIGV2ZW4gcGVyLXNvY2tl
dCBsb2NrLiBXZSBkb24ndCBjYXJlIGFib3V0IG90aGVyIHNjaGVkdWxpbmcKPj4+Pj4+IGFjdGl2
aXR5IGhlcmUsIGFsbCB3ZSBuZWVkIGlzIGEgZ3VhcmQgYWdhaW5zdCBvdXIgcGVyLWNwdSBzY2hl
ZHVsZXIKPj4+Pj4+IGRhdGEgYmVpbmcgY2hhbmdlZCBiZW5lYXRoIG91ciBmZWV0Lgo+Pj4+Pgo+
Pj4+PiBJcyB0aGlzIGNvZGUgcmVhbGx5IGJlaW5nIGNhbGxlZCBzbyBvZnRlbiB0aGF0IHdlIG5l
ZWQgdG8gd29ycnkgYWJvdXQKPj4+Pj4gdGhpcyBsZXZlbCBvZiBjb250ZW50aW9uPwo+Pj4+Cj4+
Pj4gSXRzIGNhbGxlZCBlYWNoIHRpbWUgaWRsZSBpcyBlbnRlcmVkIGFuZCBsZWZ0IGFnYWluLgo+
Pj4+Cj4+Pj4gRXNwZWNpYWxseSB3aXRoIGNvcmUgc2NoZWR1bGluZyB0aGVyZSBpcyBhIGhpZ2gg
cHJvYmFiaWxpdHkgb2YgbXVsdGlwbGUKPj4+PiBjcHVzIGxlYXZpbmcgaWRsZSBhdCB0aGUgc2Ft
ZSB0aW1lIGFuZCB0aGUgcGVyLXNjaGVkdWxlciBsb2NrIGJlaW5nIHVzZWQKPj4+PiBpbiBwYXJh
bGxlbCBhbHJlYWR5Lgo+Pj4KPj4+IEhybSwgdGhhdCBkb2VzIHNvdW5kIHByZXR0eSBiYWQuCj4+
Pgo+Pj4+PiBXZSBhbHJlYWR5IGhhdmUgYSAqbG90KiBvZiBsb2NrczsgYW5kIGluIHRoaXMgY2Fz
ZSB5b3UncmUgYWRkaW5nIGEKPj4+Pj4gc2Vjb25kIGxvY2sgd2hpY2ggaW50ZXJhY3RzIHdpdGgg
dGhlIHBlci1zY2hlZHVsZXIgY3B1IGxvY2suwqAgVGhpcyBqdXN0Cj4+Pj4+IHNlZW1zIGxpa2Ug
YXNraW5nIGZvciB0cm91YmxlLgo+Pj4+Cj4+Pj4gSW4gd2hpY2ggd2F5IGRvZXMgaXQgaW50ZXJh
Y3Qgd2l0aCB0aGUgcGVyLXNjaGVkdWxlciBjcHUgbG9jaz8KPj4+Pgo+Pj4+PiBJIHdvbid0IE5h
Y2sgdGhlIHBhdGNoLCBidXQgSSBkb24ndCB0aGluayBJIHdvdWxkIGFjayBpdCB3aXRob3V0IGNs
ZWFyCj4+Pj4+IGV2aWRlbmNlIHRoYXQgdGhlIGV4dHJhIGxvY2sgaGFzIGEgcGVyZm9ybWFuY2Ug
aW1wcm92ZW1lbnQgdGhhdCdzIHdvcnRoCj4+Pj4+IHRoZSBjb3N0IG9mIHRoZSBleHRyYSBjb21w
bGV4aXR5Lgo+Pj4+Cj4+Pj4gSSB0aGluayBjb21wbGV4aXR5IGlzIGxvd2VyIHRoaXMgd2F5LiBF
c3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoZSBwZXItCj4+Pj4gc2NoZWR1bGVyIGxvY2sgY2hhbmdp
bmcgd2l0aCBtb3ZpbmcgYSBjcHUgdG8gb3IgZnJvbSBhIGNwdXBvb2wuCj4+Pgo+Pj4gVGhlIGtl
eSBhc3BlY3Qgb2YgdGhlIHBlci1zY2hlZHVsZXIgbG9jayBpcyB0aGF0IG9uY2UgeW91IGhvbGQg
aXQsIHRoZQo+Pj4gcG9pbnRlciB0byB0aGUgbG9jayBjYW4ndCBjaGFuZ2UuCj4+Pgo+Pj4gQWZ0
ZXIgdGhpcyBwYXRjaCwgdGhlIGZhY3QgcmVtYWlucyB0aGF0IHNvbWV0aW1lcyB5b3UgbmVlZCB0
byBncmFiIG9uZQo+Pj4gbG9jaywgc29tZXRpbWVzIHRoZSBvdGhlciwgYW5kIHNvbWV0aW1lcyBi
b3RoLgo+Pj4KPj4+IEFuZCwgdGlja19zdXNwZW5kKCkgbGl2ZXMgaW4gdGhlIHBlci1zY2hlZHVs
ZXIgY29kZS7CoCBFYWNoIHNjaGVkdWxlciBoYXMKPj4+IHRvIHJlbWVtYmVyIHRoYXQgdGlja19z
dXNwZW5kIGFuZCB0aWNrX3Jlc3VtZSBob2xkIGEgY29tcGxldGVseQo+Pj4gZGlmZmVyZW50IGxv
Y2sgdG8gdGhlIHJlc3Qgb2YgdGhlIHNjaGVkdWxpbmcgZnVuY3Rpb25zLgo+Pgo+PiBJcyB0aGF0
IHJlYWxseSBzbyBjcml0aWNhbD8gVG9kYXkgb25seSBjcmVkaXQxIGhhcyB0aWNrX3N1c3BlbmQg
YW5kCj4+IHRpY2tfcmVzdW1lIGhvb2tzLCBhbmQgYm90aCBhcmUgcmVhbGx5IHZlcnkgc2ltcGxl
LiBJIGNhbiBhZGQgYQo+PiBjb21tZW50IGluIHNjaGVkLWlmLmggaWYgeW91IGxpa2UuCj4+Cj4+
IEFuZCB1cCB0byBub3cgdGhlcmUgd2FzIG5vIGxvY2sgYXQgYWxsIGludm9sdmVkIHdoZW4gY2Fs
bGluZyB0aGVtLi4uCj4+Cj4+IElmIHlvdSB0aGluayB1c2luZyB0aGUgbm9ybWFsIHNjaGVkdWxl
ciBsb2NrIGlzIHRvIGJlIHByZWZlcnJlZCBJJ2QKPj4gYmUgaGFwcHkgdG8gY2hhbmdlIHRoZSBw
YXRjaC4gQnV0IEkgc2hvdWxkIG1lbnRpb24gSSB3YXMgYWxyZWFkeQo+PiBwbGFubmluZyB0byBy
ZXZpc2l0IHVzYWdlIG9mIHRoZSBzY2hlZHVsZXIgbG9jayBhbmQgcmVwbGFjZSBpdCBieSB0aGUK
Pj4gbmV3IHBlci1jcHUgbG9jayB3aGVyZSBhcHByb3ByaWF0ZSAobm90IHN1cmUgSSdkIGZpbmQg
YW55IGFwcHJvcHJpYXRlCj4+IHBhdGggZm9yIHJlcGxhY2VtZW50KS4KPiAKPiBXZWxsIHRoZSBy
ZWFsbHkgYW5ub3lpbmcgdGhpbmcgaGVyZSBpcyB0aGF0IGFsbCB0aGUgb3RoZXIgc2NoZWR1bGVy
cyAtLQo+IGluIHBhcnRpY3VsYXIsIGNyZWRpdDIsIHdoaWNoIGFzIHlvdSBzYXksIGlzIGRlc2ln
bmVkIHRvIGhhdmUgbXVsdGlwbGUKPiBydW5xdWV1ZXMgc2hhcmUgdGhlIHNhbWUgbG9jayAtLSBo
YXZlIHRvIGdyYWIgJiByZWxlYXNlIHRoZSBsb2NrIGp1c3QgdG8KPiBmaW5kIG91dCB0aGF0IHRo
ZXJlJ3Mgbm90aGluZyB0byBkby4KPiAKPiBBbmQgZXZlbiBjcmVkaXQxIGRvZXNuJ3QgZG8gYW55
dGhpbmcgcGFydGljdWxhcmx5IGNsZXZlciAtLSBhbGwgaXQgZG9lcwo+IGlzIHN0b3AgYW5kIHN0
YXJ0IGEgdGltZXIgYmFzZWQgb24gYSBzY2hlZHVsZXItZ2xvYmFsIGNvbmZpZ3VyYXRpb24uIEFu
ZAo+IHRoZSBzY2hlZHVsaW5nIGxvY2sgaXMgZ3JhYmJlZCB0byBzd2l0Y2ggdG8gaWRsZSBhbnl3
YXkuICBJdCBzZWVtcyBsaWtlCj4gd2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gc29tZXRoaW5nIG1v
cmUgc2Vuc2libGUuCgpZZWFoLCBJIHRob3VnaHQgdGhlIHNhbWUuCgo+IAo+IC9tZSBpcyBzdGls
bCB0aGlua2luZwoKSSB0aGluayB3ZSBzaG91bGRuJ3QgcnVzaCB0aGF0IGluLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
