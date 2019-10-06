Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED0CD885
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2019 20:09:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHAuN-0008RZ-Pf; Sun, 06 Oct 2019 18:05:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PE/n=X7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHAuM-0008RU-98
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2019 18:05:26 +0000
X-Inumbo-ID: ddfcea3a-e863-11e9-9798-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddfcea3a-e863-11e9-9798-12813bfff9fa;
 Sun, 06 Oct 2019 18:05:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0831CAC84;
 Sun,  6 Oct 2019 18:05:23 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
 <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
 <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
 <7a90d9d6-9af2-47ed-eaed-480dfb2e72f6@citrix.com>
 <17e45c30-9d62-94f0-c77e-26e2532b3f69@suse.com>
 <cb8ae861-7898-cf0d-a3c1-cadcf35251f0@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bcc3e784-45fb-03f2-9270-e89cda98b711@suse.com>
Date: Sun, 6 Oct 2019 20:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cb8ae861-7898-cf0d-a3c1-cadcf35251f0@citrix.com>
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

T24gMDQuMTAuMTkgMTg6MDksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvNC8xOSA0OjQw
IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAwNC4xMC4xOSAxNzozNywgR2VvcmdlIER1
bmxhcCB3cm90ZToKPj4+IE9uIDEwLzQvMTkgNDowMyBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToK
Pj4+PiBPbiAwNC4xMC4xOSAxNjo1NiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4gT24gMTAv
NC8xOSAzOjQzIFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMTAuMTkgMTY6
MzQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+Pj4gT24gMTAvNC8xOSAzOjI0IFBNLCBKw7xy
Z2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwNC4xMC4xOSAxNjowOCwgR2VvcmdlIER1bmxh
cCB3cm90ZToKPj4+Pj4+Pj4+IE9uIDEwLzQvMTkgNzo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90
ZToKPj4+Pj4+Pj4+PiBzY2hlZF90aWNrX3N1c3BlbmQoKSBhbmQgc2NoZWRfdGlja19yZXN1bWUo
KSBzaG91bGQgbm90IGNhbGwgdGhlCj4+Pj4+Pj4+Pj4gc2NoZWR1bGVyIHNwZWNpZmljIHRpbWVy
IGhhbmRsZXJzIGluIGNhc2UgdGhlIGNwdSB0aGV5IGFyZQo+Pj4+Pj4+Pj4+IHJ1bm5pbmcgb24K
Pj4+Pj4+Pj4+PiBpcyBqdXN0IGJlaW5nIG1vdmVkIHRvIG9yIGZyb20gYSBjcHVwb29sLgo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVXNlIGEgbmV3IHBlcmNwdSBsb2NrIGZvciB0aGF0IHB1cnBvc2Uu
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSXMgdGhlcmUgYSByZWFzb24gd2UgY2FuJ3QgdXNlIHRoZSBw
Y3B1X3NjaGVkdWxlX2xvY2soKSBpbnN0ZWFkIG9mCj4+Pj4+Pj4+PiBpbnRyb2R1Y2luZyBhIG5l
dyBvbmU/wqAgU29ycnkgaWYgdGhpcyBpcyBvYnZpb3VzLCBidXQgaXQncyBiZWVuIGEKPj4+Pj4+
Pj4+IHdoaWxlCj4+Pj4+Pj4+PiBzaW5jZSBJIHBva2VkIGFyb3VuZCB0aGlzIGNvZGUuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IExvY2sgY29udGVudGlvbiB3b3VsZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3
aXRoIGNyZWRpdDIgd2hpY2ggaXMKPj4+Pj4+Pj4gdXNpbmcgYQo+Pj4+Pj4+PiBwZXItY29yZSBv
ciBldmVuIHBlci1zb2NrZXQgbG9jay4gV2UgZG9uJ3QgY2FyZSBhYm91dCBvdGhlcgo+Pj4+Pj4+
PiBzY2hlZHVsaW5nCj4+Pj4+Pj4+IGFjdGl2aXR5IGhlcmUsIGFsbCB3ZSBuZWVkIGlzIGEgZ3Vh
cmQgYWdhaW5zdCBvdXIgcGVyLWNwdSBzY2hlZHVsZXIKPj4+Pj4+Pj4gZGF0YSBiZWluZyBjaGFu
Z2VkIGJlbmVhdGggb3VyIGZlZXQuCj4+Pj4+Pj4KPj4+Pj4+PiBJcyB0aGlzIGNvZGUgcmVhbGx5
IGJlaW5nIGNhbGxlZCBzbyBvZnRlbiB0aGF0IHdlIG5lZWQgdG8gd29ycnkgYWJvdXQKPj4+Pj4+
PiB0aGlzIGxldmVsIG9mIGNvbnRlbnRpb24/Cj4+Pj4+Pgo+Pj4+Pj4gSXRzIGNhbGxlZCBlYWNo
IHRpbWUgaWRsZSBpcyBlbnRlcmVkIGFuZCBsZWZ0IGFnYWluLgo+Pj4+Pj4KPj4+Pj4+IEVzcGVj
aWFsbHkgd2l0aCBjb3JlIHNjaGVkdWxpbmcgdGhlcmUgaXMgYSBoaWdoIHByb2JhYmlsaXR5IG9m
Cj4+Pj4+PiBtdWx0aXBsZQo+Pj4+Pj4gY3B1cyBsZWF2aW5nIGlkbGUgYXQgdGhlIHNhbWUgdGlt
ZSBhbmQgdGhlIHBlci1zY2hlZHVsZXIgbG9jayBiZWluZwo+Pj4+Pj4gdXNlZAo+Pj4+Pj4gaW4g
cGFyYWxsZWwgYWxyZWFkeS4KPj4+Pj4KPj4+Pj4gSHJtLCB0aGF0IGRvZXMgc291bmQgcHJldHR5
IGJhZC4KPj4+Pj4KPj4+Pj4+PiBXZSBhbHJlYWR5IGhhdmUgYSAqbG90KiBvZiBsb2NrczsgYW5k
IGluIHRoaXMgY2FzZSB5b3UncmUgYWRkaW5nIGEKPj4+Pj4+PiBzZWNvbmQgbG9jayB3aGljaCBp
bnRlcmFjdHMgd2l0aCB0aGUgcGVyLXNjaGVkdWxlciBjcHUgbG9jay7CoCBUaGlzCj4+Pj4+Pj4g
anVzdAo+Pj4+Pj4+IHNlZW1zIGxpa2UgYXNraW5nIGZvciB0cm91YmxlLgo+Pj4+Pj4KPj4+Pj4+
IEluIHdoaWNoIHdheSBkb2VzIGl0IGludGVyYWN0IHdpdGggdGhlIHBlci1zY2hlZHVsZXIgY3B1
IGxvY2s/Cj4+Pj4+Pgo+Pj4+Pj4+IEkgd29uJ3QgTmFjayB0aGUgcGF0Y2gsIGJ1dCBJIGRvbid0
IHRoaW5rIEkgd291bGQgYWNrIGl0IHdpdGhvdXQKPj4+Pj4+PiBjbGVhcgo+Pj4+Pj4+IGV2aWRl
bmNlIHRoYXQgdGhlIGV4dHJhIGxvY2sgaGFzIGEgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgdGhh
dCdzCj4+Pj4+Pj4gd29ydGgKPj4+Pj4+PiB0aGUgY29zdCBvZiB0aGUgZXh0cmEgY29tcGxleGl0
eS4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIGNvbXBsZXhpdHkgaXMgbG93ZXIgdGhpcyB3YXkuIEVz
cGVjaWFsbHkgY29uc2lkZXJpbmcgdGhlIHBlci0KPj4+Pj4+IHNjaGVkdWxlciBsb2NrIGNoYW5n
aW5nIHdpdGggbW92aW5nIGEgY3B1IHRvIG9yIGZyb20gYSBjcHVwb29sLgo+Pj4+Pgo+Pj4+PiBU
aGUga2V5IGFzcGVjdCBvZiB0aGUgcGVyLXNjaGVkdWxlciBsb2NrIGlzIHRoYXQgb25jZSB5b3Ug
aG9sZCBpdCwgdGhlCj4+Pj4+IHBvaW50ZXIgdG8gdGhlIGxvY2sgY2FuJ3QgY2hhbmdlLgo+Pj4+
Pgo+Pj4+PiBBZnRlciB0aGlzIHBhdGNoLCB0aGUgZmFjdCByZW1haW5zIHRoYXQgc29tZXRpbWVz
IHlvdSBuZWVkIHRvIGdyYWIgb25lCj4+Pj4+IGxvY2ssIHNvbWV0aW1lcyB0aGUgb3RoZXIsIGFu
ZCBzb21ldGltZXMgYm90aC4KPj4+Pj4KPj4+Pj4gQW5kLCB0aWNrX3N1c3BlbmQoKSBsaXZlcyBp
biB0aGUgcGVyLXNjaGVkdWxlciBjb2RlLsKgIEVhY2ggc2NoZWR1bGVyCj4+Pj4+IGhhcwo+Pj4+
PiB0byByZW1lbWJlciB0aGF0IHRpY2tfc3VzcGVuZCBhbmQgdGlja19yZXN1bWUgaG9sZCBhIGNv
bXBsZXRlbHkKPj4+Pj4gZGlmZmVyZW50IGxvY2sgdG8gdGhlIHJlc3Qgb2YgdGhlIHNjaGVkdWxp
bmcgZnVuY3Rpb25zLgo+Pj4+Cj4+Pj4gSXMgdGhhdCByZWFsbHkgc28gY3JpdGljYWw/IFRvZGF5
IG9ubHkgY3JlZGl0MSBoYXMgdGlja19zdXNwZW5kIGFuZAo+Pj4+IHRpY2tfcmVzdW1lIGhvb2tz
LCBhbmQgYm90aCBhcmUgcmVhbGx5IHZlcnkgc2ltcGxlLiBJIGNhbiBhZGQgYQo+Pj4+IGNvbW1l
bnQgaW4gc2NoZWQtaWYuaCBpZiB5b3UgbGlrZS4KPj4+Pgo+Pj4+IEFuZCB1cCB0byBub3cgdGhl
cmUgd2FzIG5vIGxvY2sgYXQgYWxsIGludm9sdmVkIHdoZW4gY2FsbGluZyB0aGVtLi4uCj4+Pj4K
Pj4+PiBJZiB5b3UgdGhpbmsgdXNpbmcgdGhlIG5vcm1hbCBzY2hlZHVsZXIgbG9jayBpcyB0byBi
ZSBwcmVmZXJyZWQgSSdkCj4+Pj4gYmUgaGFwcHkgdG8gY2hhbmdlIHRoZSBwYXRjaC4gQnV0IEkg
c2hvdWxkIG1lbnRpb24gSSB3YXMgYWxyZWFkeQo+Pj4+IHBsYW5uaW5nIHRvIHJldmlzaXQgdXNh
Z2Ugb2YgdGhlIHNjaGVkdWxlciBsb2NrIGFuZCByZXBsYWNlIGl0IGJ5IHRoZQo+Pj4+IG5ldyBw
ZXItY3B1IGxvY2sgd2hlcmUgYXBwcm9wcmlhdGUgKG5vdCBzdXJlIEknZCBmaW5kIGFueSBhcHBy
b3ByaWF0ZQo+Pj4+IHBhdGggZm9yIHJlcGxhY2VtZW50KS4KPj4+Cj4+PiBXZWxsIHRoZSByZWFs
bHkgYW5ub3lpbmcgdGhpbmcgaGVyZSBpcyB0aGF0IGFsbCB0aGUgb3RoZXIgc2NoZWR1bGVycyAt
LQo+Pj4gaW4gcGFydGljdWxhciwgY3JlZGl0Miwgd2hpY2ggYXMgeW91IHNheSwgaXMgZGVzaWdu
ZWQgdG8gaGF2ZSBtdWx0aXBsZQo+Pj4gcnVucXVldWVzIHNoYXJlIHRoZSBzYW1lIGxvY2sgLS0g
aGF2ZSB0byBncmFiICYgcmVsZWFzZSB0aGUgbG9jayBqdXN0IHRvCj4+PiBmaW5kIG91dCB0aGF0
IHRoZXJlJ3Mgbm90aGluZyB0byBkby4KPj4+Cj4+PiBBbmQgZXZlbiBjcmVkaXQxIGRvZXNuJ3Qg
ZG8gYW55dGhpbmcgcGFydGljdWxhcmx5IGNsZXZlciAtLSBhbGwgaXQgZG9lcwo+Pj4gaXMgc3Rv
cCBhbmQgc3RhcnQgYSB0aW1lciBiYXNlZCBvbiBhIHNjaGVkdWxlci1nbG9iYWwgY29uZmlndXJh
dGlvbi4gQW5kCj4+PiB0aGUgc2NoZWR1bGluZyBsb2NrIGlzIGdyYWJiZWQgdG8gc3dpdGNoIHRv
IGlkbGUgYW55d2F5LsKgIEl0IHNlZW1zIGxpa2UKPj4+IHdlIHNob3VsZCBiZSBhYmxlIHRvIGRv
IHNvbWV0aGluZyBtb3JlIHNlbnNpYmxlLgo+Pgo+PiBZZWFoLCBJIHRob3VnaHQgdGhlIHNhbWUu
Cj4gCj4gSSBjYW4gdGhpbmsgb2YgYSBjb3VwbGUgb2Ygb3B0aW9uczoKPiAKPiAxLiBIYXZlIHNj
aGVkdWxlLmMgY2FsbCBzLT50aWNrXyogd2hlbiBzd2l0Y2hpbmcgdG8gLyBmcm9tIGlkbGUKPiAK
PiAyLiBHZXQgcmlkIG9mIHMtPnRpY2tfKiwgYW5kIGhhdmUgc2NoZWRfY3JlZGl0LmMgc3VzcGVu
ZCAvIHJlc3VtZSB0aWNrcwo+IHdoZW4gc3dpdGNoaW5nIHRvIC8gZnJvbSBpZGxlIGluIGNzY2hl
ZF9zY2hlZHVsZSgpCj4gCj4gMy4gSGF2ZSBzY2hlZHVsZS5jIHN1c3BlbmQgLyByZXN1bWUgdGlj
a3MsIGFuZCBoYXZlIGFuIGludGVyZmFjZSB0aGF0Cj4gYWxsb3dzIHNjaGVkdWxlcnMgdG8gZW5h
YmxlIC8gZGlzYWJsZSB0aGVtLgo+IAo+IDQuIFJld29yayBzY2hlZF9jcmVkaXQgdG8gYmUgdGlj
a2xlc3MuCgpJJ20gZ29pbmcgd2l0aCAyLiwgYXMgaXQgd2lsbCBoYXZlIG11bHRpcGxlIGFkdmFu
dGFnZXM6CgotIG5vdCB2ZXJ5IGludHJ1c2l2ZQotIGtlZXBzIGNyZWRpdCBzcGVjaWZpY3MgaW4g
Y3JlZGl0Ci0gYWxsb3dzIHVzIHRvIGZpeCBhbiBleGlzdGluZyBidWcgaW4gY3JlZGl0OiBpZiB3
ZSBoYXZlIG9ubHkgb25lIGRvbWFpbgogICBydW5uaW5nIGluIGEgY3B1cG9vbCB3aXRoIGNyZWRp
dCBzY2hlZHVsZXIgYW5kIHRoaXMgZG9tYWluIGlzIGNhcHBlZAogICB0b2RheSdzIGhhbmRsaW5n
IHdpbGwgZGlzYWJsZSB0aGUgY3JlZGl0IHRpY2sgaW4gaWRsZSBhbmQgdGhlcmUgd2lsbAogICBi
ZSBub2JvZHkgdW5wYXVzaW5nIHRoZSB2Y3B1cyBvZiB0aGUgY2FwcGVkIGRvbWFpbi4KCldpbGwg
c2VuZCBwYXRjaGVzIHNvb24uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
