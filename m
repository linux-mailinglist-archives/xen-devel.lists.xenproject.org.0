Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F38CDBCC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 08:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHMDY-0006OH-En; Mon, 07 Oct 2019 06:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHMDX-0006OC-3L
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 06:09:59 +0000
X-Inumbo-ID: 13a4a3fc-e8c9-11e9-97a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13a4a3fc-e8c9-11e9-97a3-12813bfff9fa;
 Mon, 07 Oct 2019 06:09:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 347A0AFB1;
 Mon,  7 Oct 2019 06:09:52 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
 <bcc3e784-45fb-03f2-9270-e89cda98b711@suse.com>
Message-ID: <fee20605-6624-ba83-bdfd-2b7d85c01a22@suse.com>
Date: Mon, 7 Oct 2019 08:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <bcc3e784-45fb-03f2-9270-e89cda98b711@suse.com>
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

T24gMDYuMTAuMTkgMjA6MDUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMDQuMTAuMTkgMTg6
MDksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDEwLzQvMTkgNDo0MCBQTSwgSsO8cmdlbiBH
cm/DnyB3cm90ZToKPj4+IE9uIDA0LjEwLjE5IDE3OjM3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
Pj4+IE9uIDEwLzQvMTkgNDowMyBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDQu
MTAuMTkgMTY6NTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+PiBPbiAxMC80LzE5IDM6NDMg
UE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+Pj4gT24gMDQuMTAuMTkgMTY6MzQsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDEwLzQvMTkgMzoyNCBQTSwgSsO8cmdlbiBHcm/D
nyB3cm90ZToKPj4+Pj4+Pj4+IE9uIDA0LjEwLjE5IDE2OjA4LCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ogo+Pj4+Pj4+Pj4+IE9uIDEwLzQvMTkgNzo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+
Pj4+Pj4+Pj4gc2NoZWRfdGlja19zdXNwZW5kKCkgYW5kIHNjaGVkX3RpY2tfcmVzdW1lKCkgc2hv
dWxkIG5vdCBjYWxsIHRoZQo+Pj4+Pj4+Pj4+PiBzY2hlZHVsZXIgc3BlY2lmaWMgdGltZXIgaGFu
ZGxlcnMgaW4gY2FzZSB0aGUgY3B1IHRoZXkgYXJlCj4+Pj4+Pj4+Pj4+IHJ1bm5pbmcgb24KPj4+
Pj4+Pj4+Pj4gaXMganVzdCBiZWluZyBtb3ZlZCB0byBvciBmcm9tIGEgY3B1cG9vbC4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gVXNlIGEgbmV3IHBlcmNwdSBsb2NrIGZvciB0aGF0IHB1cnBvc2Uu
Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBjYW4ndCB1c2UgdGhl
IHBjcHVfc2NoZWR1bGVfbG9jaygpIAo+Pj4+Pj4+Pj4+IGluc3RlYWQgb2YKPj4+Pj4+Pj4+PiBp
bnRyb2R1Y2luZyBhIG5ldyBvbmU/wqAgU29ycnkgaWYgdGhpcyBpcyBvYnZpb3VzLCBidXQgaXQn
cyBiZWVuIGEKPj4+Pj4+Pj4+PiB3aGlsZQo+Pj4+Pj4+Pj4+IHNpbmNlIEkgcG9rZWQgYXJvdW5k
IHRoaXMgY29kZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBMb2NrIGNvbnRlbnRpb24gd291bGQgYmUg
aGlnaGVyIGVzcGVjaWFsbHkgd2l0aCBjcmVkaXQyIHdoaWNoIGlzCj4+Pj4+Pj4+PiB1c2luZyBh
Cj4+Pj4+Pj4+PiBwZXItY29yZSBvciBldmVuIHBlci1zb2NrZXQgbG9jay4gV2UgZG9uJ3QgY2Fy
ZSBhYm91dCBvdGhlcgo+Pj4+Pj4+Pj4gc2NoZWR1bGluZwo+Pj4+Pj4+Pj4gYWN0aXZpdHkgaGVy
ZSwgYWxsIHdlIG5lZWQgaXMgYSBndWFyZCBhZ2FpbnN0IG91ciBwZXItY3B1IAo+Pj4+Pj4+Pj4g
c2NoZWR1bGVyCj4+Pj4+Pj4+PiBkYXRhIGJlaW5nIGNoYW5nZWQgYmVuZWF0aCBvdXIgZmVldC4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gSXMgdGhpcyBjb2RlIHJlYWxseSBiZWluZyBjYWxsZWQgc28gb2Z0
ZW4gdGhhdCB3ZSBuZWVkIHRvIHdvcnJ5IAo+Pj4+Pj4+PiBhYm91dAo+Pj4+Pj4+PiB0aGlzIGxl
dmVsIG9mIGNvbnRlbnRpb24/Cj4+Pj4+Pj4KPj4+Pj4+PiBJdHMgY2FsbGVkIGVhY2ggdGltZSBp
ZGxlIGlzIGVudGVyZWQgYW5kIGxlZnQgYWdhaW4uCj4+Pj4+Pj4KPj4+Pj4+PiBFc3BlY2lhbGx5
IHdpdGggY29yZSBzY2hlZHVsaW5nIHRoZXJlIGlzIGEgaGlnaCBwcm9iYWJpbGl0eSBvZgo+Pj4+
Pj4+IG11bHRpcGxlCj4+Pj4+Pj4gY3B1cyBsZWF2aW5nIGlkbGUgYXQgdGhlIHNhbWUgdGltZSBh
bmQgdGhlIHBlci1zY2hlZHVsZXIgbG9jayBiZWluZwo+Pj4+Pj4+IHVzZWQKPj4+Pj4+PiBpbiBw
YXJhbGxlbCBhbHJlYWR5Lgo+Pj4+Pj4KPj4+Pj4+IEhybSwgdGhhdCBkb2VzIHNvdW5kIHByZXR0
eSBiYWQuCj4+Pj4+Pgo+Pj4+Pj4+PiBXZSBhbHJlYWR5IGhhdmUgYSAqbG90KiBvZiBsb2Nrczsg
YW5kIGluIHRoaXMgY2FzZSB5b3UncmUgYWRkaW5nIGEKPj4+Pj4+Pj4gc2Vjb25kIGxvY2sgd2hp
Y2ggaW50ZXJhY3RzIHdpdGggdGhlIHBlci1zY2hlZHVsZXIgY3B1IGxvY2suwqAgVGhpcwo+Pj4+
Pj4+PiBqdXN0Cj4+Pj4+Pj4+IHNlZW1zIGxpa2UgYXNraW5nIGZvciB0cm91YmxlLgo+Pj4+Pj4+
Cj4+Pj4+Pj4gSW4gd2hpY2ggd2F5IGRvZXMgaXQgaW50ZXJhY3Qgd2l0aCB0aGUgcGVyLXNjaGVk
dWxlciBjcHUgbG9jaz8KPj4+Pj4+Pgo+Pj4+Pj4+PiBJIHdvbid0IE5hY2sgdGhlIHBhdGNoLCBi
dXQgSSBkb24ndCB0aGluayBJIHdvdWxkIGFjayBpdCB3aXRob3V0Cj4+Pj4+Pj4+IGNsZWFyCj4+
Pj4+Pj4+IGV2aWRlbmNlIHRoYXQgdGhlIGV4dHJhIGxvY2sgaGFzIGEgcGVyZm9ybWFuY2UgaW1w
cm92ZW1lbnQgdGhhdCdzCj4+Pj4+Pj4+IHdvcnRoCj4+Pj4+Pj4+IHRoZSBjb3N0IG9mIHRoZSBl
eHRyYSBjb21wbGV4aXR5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayBjb21wbGV4aXR5IGlzIGxv
d2VyIHRoaXMgd2F5LiBFc3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoZSAKPj4+Pj4+PiBwZXItCj4+
Pj4+Pj4gc2NoZWR1bGVyIGxvY2sgY2hhbmdpbmcgd2l0aCBtb3ZpbmcgYSBjcHUgdG8gb3IgZnJv
bSBhIGNwdXBvb2wuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIGtleSBhc3BlY3Qgb2YgdGhlIHBlci1zY2hl
ZHVsZXIgbG9jayBpcyB0aGF0IG9uY2UgeW91IGhvbGQgaXQsIAo+Pj4+Pj4gdGhlCj4+Pj4+PiBw
b2ludGVyIHRvIHRoZSBsb2NrIGNhbid0IGNoYW5nZS4KPj4+Pj4+Cj4+Pj4+PiBBZnRlciB0aGlz
IHBhdGNoLCB0aGUgZmFjdCByZW1haW5zIHRoYXQgc29tZXRpbWVzIHlvdSBuZWVkIHRvIGdyYWIg
Cj4+Pj4+PiBvbmUKPj4+Pj4+IGxvY2ssIHNvbWV0aW1lcyB0aGUgb3RoZXIsIGFuZCBzb21ldGlt
ZXMgYm90aC4KPj4+Pj4+Cj4+Pj4+PiBBbmQsIHRpY2tfc3VzcGVuZCgpIGxpdmVzIGluIHRoZSBw
ZXItc2NoZWR1bGVyIGNvZGUuwqAgRWFjaCBzY2hlZHVsZXIKPj4+Pj4+IGhhcwo+Pj4+Pj4gdG8g
cmVtZW1iZXIgdGhhdCB0aWNrX3N1c3BlbmQgYW5kIHRpY2tfcmVzdW1lIGhvbGQgYSBjb21wbGV0
ZWx5Cj4+Pj4+PiBkaWZmZXJlbnQgbG9jayB0byB0aGUgcmVzdCBvZiB0aGUgc2NoZWR1bGluZyBm
dW5jdGlvbnMuCj4+Pj4+Cj4+Pj4+IElzIHRoYXQgcmVhbGx5IHNvIGNyaXRpY2FsPyBUb2RheSBv
bmx5IGNyZWRpdDEgaGFzIHRpY2tfc3VzcGVuZCBhbmQKPj4+Pj4gdGlja19yZXN1bWUgaG9va3Ms
IGFuZCBib3RoIGFyZSByZWFsbHkgdmVyeSBzaW1wbGUuIEkgY2FuIGFkZCBhCj4+Pj4+IGNvbW1l
bnQgaW4gc2NoZWQtaWYuaCBpZiB5b3UgbGlrZS4KPj4+Pj4KPj4+Pj4gQW5kIHVwIHRvIG5vdyB0
aGVyZSB3YXMgbm8gbG9jayBhdCBhbGwgaW52b2x2ZWQgd2hlbiBjYWxsaW5nIHRoZW0uLi4KPj4+
Pj4KPj4+Pj4gSWYgeW91IHRoaW5rIHVzaW5nIHRoZSBub3JtYWwgc2NoZWR1bGVyIGxvY2sgaXMg
dG8gYmUgcHJlZmVycmVkIEknZAo+Pj4+PiBiZSBoYXBweSB0byBjaGFuZ2UgdGhlIHBhdGNoLiBC
dXQgSSBzaG91bGQgbWVudGlvbiBJIHdhcyBhbHJlYWR5Cj4+Pj4+IHBsYW5uaW5nIHRvIHJldmlz
aXQgdXNhZ2Ugb2YgdGhlIHNjaGVkdWxlciBsb2NrIGFuZCByZXBsYWNlIGl0IGJ5IHRoZQo+Pj4+
PiBuZXcgcGVyLWNwdSBsb2NrIHdoZXJlIGFwcHJvcHJpYXRlIChub3Qgc3VyZSBJJ2QgZmluZCBh
bnkgYXBwcm9wcmlhdGUKPj4+Pj4gcGF0aCBmb3IgcmVwbGFjZW1lbnQpLgo+Pj4+Cj4+Pj4gV2Vs
bCB0aGUgcmVhbGx5IGFubm95aW5nIHRoaW5nIGhlcmUgaXMgdGhhdCBhbGwgdGhlIG90aGVyIHNj
aGVkdWxlcnMgLS0KPj4+PiBpbiBwYXJ0aWN1bGFyLCBjcmVkaXQyLCB3aGljaCBhcyB5b3Ugc2F5
LCBpcyBkZXNpZ25lZCB0byBoYXZlIG11bHRpcGxlCj4+Pj4gcnVucXVldWVzIHNoYXJlIHRoZSBz
YW1lIGxvY2sgLS0gaGF2ZSB0byBncmFiICYgcmVsZWFzZSB0aGUgbG9jayAKPj4+PiBqdXN0IHRv
Cj4+Pj4gZmluZCBvdXQgdGhhdCB0aGVyZSdzIG5vdGhpbmcgdG8gZG8uCj4+Pj4KPj4+PiBBbmQg
ZXZlbiBjcmVkaXQxIGRvZXNuJ3QgZG8gYW55dGhpbmcgcGFydGljdWxhcmx5IGNsZXZlciAtLSBh
bGwgaXQgZG9lcwo+Pj4+IGlzIHN0b3AgYW5kIHN0YXJ0IGEgdGltZXIgYmFzZWQgb24gYSBzY2hl
ZHVsZXItZ2xvYmFsIGNvbmZpZ3VyYXRpb24uIAo+Pj4+IEFuZAo+Pj4+IHRoZSBzY2hlZHVsaW5n
IGxvY2sgaXMgZ3JhYmJlZCB0byBzd2l0Y2ggdG8gaWRsZSBhbnl3YXkuwqAgSXQgc2VlbXMgbGlr
ZQo+Pj4+IHdlIHNob3VsZCBiZSBhYmxlIHRvIGRvIHNvbWV0aGluZyBtb3JlIHNlbnNpYmxlLgo+
Pj4KPj4+IFllYWgsIEkgdGhvdWdodCB0aGUgc2FtZS4KPj4KPj4gSSBjYW4gdGhpbmsgb2YgYSBj
b3VwbGUgb2Ygb3B0aW9uczoKPj4KPj4gMS4gSGF2ZSBzY2hlZHVsZS5jIGNhbGwgcy0+dGlja18q
IHdoZW4gc3dpdGNoaW5nIHRvIC8gZnJvbSBpZGxlCj4+Cj4+IDIuIEdldCByaWQgb2Ygcy0+dGlj
a18qLCBhbmQgaGF2ZSBzY2hlZF9jcmVkaXQuYyBzdXNwZW5kIC8gcmVzdW1lIHRpY2tzCj4+IHdo
ZW4gc3dpdGNoaW5nIHRvIC8gZnJvbSBpZGxlIGluIGNzY2hlZF9zY2hlZHVsZSgpCj4+Cj4+IDMu
IEhhdmUgc2NoZWR1bGUuYyBzdXNwZW5kIC8gcmVzdW1lIHRpY2tzLCBhbmQgaGF2ZSBhbiBpbnRl
cmZhY2UgdGhhdAo+PiBhbGxvd3Mgc2NoZWR1bGVycyB0byBlbmFibGUgLyBkaXNhYmxlIHRoZW0u
Cj4+Cj4+IDQuIFJld29yayBzY2hlZF9jcmVkaXQgdG8gYmUgdGlja2xlc3MuCj4gCj4gSSdtIGdv
aW5nIHdpdGggMi4sIGFzIGl0IHdpbGwgaGF2ZSBtdWx0aXBsZSBhZHZhbnRhZ2VzOgo+IAo+IC0g
bm90IHZlcnkgaW50cnVzaXZlCj4gLSBrZWVwcyBjcmVkaXQgc3BlY2lmaWNzIGluIGNyZWRpdAo+
IC0gYWxsb3dzIHVzIHRvIGZpeCBhbiBleGlzdGluZyBidWcgaW4gY3JlZGl0OiBpZiB3ZSBoYXZl
IG9ubHkgb25lIGRvbWFpbgo+ICDCoCBydW5uaW5nIGluIGEgY3B1cG9vbCB3aXRoIGNyZWRpdCBz
Y2hlZHVsZXIgYW5kIHRoaXMgZG9tYWluIGlzIGNhcHBlZAo+ICDCoCB0b2RheSdzIGhhbmRsaW5n
IHdpbGwgZGlzYWJsZSB0aGUgY3JlZGl0IHRpY2sgaW4gaWRsZSBhbmQgdGhlcmUgd2lsbAo+ICDC
oCBiZSBub2JvZHkgdW5wYXVzaW5nIHRoZSB2Y3B1cyBvZiB0aGUgY2FwcGVkIGRvbWFpbi4KClRo
aXMgaXMgbm90IGFuIGlzc3VlLCBJIG1hbmFnZWQgdG8gbWl4IHVwIHRpbWVyIGFuZCBtYXN0ZXJf
dGltZXIgb2YgdGhlCmNyZWRpdCBzY2hlZHVsZXIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
