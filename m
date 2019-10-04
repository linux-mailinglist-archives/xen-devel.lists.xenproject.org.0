Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C855CBF73
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:40:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPdx-0003qO-LF; Fri, 04 Oct 2019 15:37:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T2rb=X5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iGPdw-0003q9-F0
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:37:20 +0000
X-Inumbo-ID: d484589d-e6bc-11e9-975c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d484589d-e6bc-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570203431;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Gyw8957JYIJgwIE6RU4BM9tq5B4UGg9TrbnQ9QK3ves=;
 b=R7WfAWX18FW4DEWlcCT5V7ncXj7oX43I4o5yv+yzU+Oc37fWNS0Fp8ex
 vN3CHI55gIFzYgfs5Ljo+8FvYT5jSGUdtqsW2KnWmFIJGs0j6XabqhOcy
 mH63+H0JbeuHw9emWe/CZ6UndmGKh9qSUCq/5ugsNlDukHc+LdHbWnNi0 E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xsjz0XYE7w70JOt+hgrpd5GRLqwBNCnFwg9emeEOEJ443w1pPlyv5uhEWJQuQqhGDGCv3hEhEA
 wYXKaI9NY/RfWz08ch/p6c8IlKRv5MlyM24qRfoLvplXO3GG7PsbrG3QGdlmN23goILKQpWgzp
 m1RQFNASyy5ttP2Gk6lKgjuroErxTPYs2/LQvKacqPXlb1QuVd9vB0asj6Cu5+pBVbJRyQfWey
 T+q7QYpajvDBO2guBjSVJJOWmizEz4qdOsJj72d+EXU+/cKlpy9ptiLX6ZubzdZalclS00UmuJ
 lhA=
X-SBRS: 2.7
X-MesageID: 6734689
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6734689"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
 <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
 <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <7a90d9d6-9af2-47ed-eaed-480dfb2e72f6@citrix.com>
Date: Fri, 4 Oct 2019 16:37:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvNC8xOSA0OjAzIFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDA0LjEwLjE5IDE2
OjU2LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMC80LzE5IDM6NDMgUE0sIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4xMC4xOSAxNjozNCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+PiBPbiAxMC80LzE5IDM6MjQgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+IE9uIDA0
LjEwLjE5IDE2OjA4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4gT24gMTAvNC8xOSA3OjQw
IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+IHNjaGVkX3RpY2tfc3VzcGVuZCgpIGFu
ZCBzY2hlZF90aWNrX3Jlc3VtZSgpIHNob3VsZCBub3QgY2FsbCB0aGUKPj4+Pj4+PiBzY2hlZHVs
ZXIgc3BlY2lmaWMgdGltZXIgaGFuZGxlcnMgaW4gY2FzZSB0aGUgY3B1IHRoZXkgYXJlCj4+Pj4+
Pj4gcnVubmluZyBvbgo+Pj4+Pj4+IGlzIGp1c3QgYmVpbmcgbW92ZWQgdG8gb3IgZnJvbSBhIGNw
dXBvb2wuCj4+Pj4+Pj4KPj4+Pj4+PiBVc2UgYSBuZXcgcGVyY3B1IGxvY2sgZm9yIHRoYXQgcHVy
cG9zZS4KPj4+Pj4+Cj4+Pj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBjYW4ndCB1c2UgdGhlIHBj
cHVfc2NoZWR1bGVfbG9jaygpIGluc3RlYWQgb2YKPj4+Pj4+IGludHJvZHVjaW5nIGEgbmV3IG9u
ZT/CoCBTb3JyeSBpZiB0aGlzIGlzIG9idmlvdXMsIGJ1dCBpdCdzIGJlZW4gYQo+Pj4+Pj4gd2hp
bGUKPj4+Pj4+IHNpbmNlIEkgcG9rZWQgYXJvdW5kIHRoaXMgY29kZS4KPj4+Pj4KPj4+Pj4gTG9j
ayBjb250ZW50aW9uIHdvdWxkIGJlIGhpZ2hlciBlc3BlY2lhbGx5IHdpdGggY3JlZGl0MiB3aGlj
aCBpcwo+Pj4+PiB1c2luZyBhCj4+Pj4+IHBlci1jb3JlIG9yIGV2ZW4gcGVyLXNvY2tldCBsb2Nr
LiBXZSBkb24ndCBjYXJlIGFib3V0IG90aGVyIHNjaGVkdWxpbmcKPj4+Pj4gYWN0aXZpdHkgaGVy
ZSwgYWxsIHdlIG5lZWQgaXMgYSBndWFyZCBhZ2FpbnN0IG91ciBwZXItY3B1IHNjaGVkdWxlcgo+
Pj4+PiBkYXRhIGJlaW5nIGNoYW5nZWQgYmVuZWF0aCBvdXIgZmVldC4KPj4+Pgo+Pj4+IElzIHRo
aXMgY29kZSByZWFsbHkgYmVpbmcgY2FsbGVkIHNvIG9mdGVuIHRoYXQgd2UgbmVlZCB0byB3b3Jy
eSBhYm91dAo+Pj4+IHRoaXMgbGV2ZWwgb2YgY29udGVudGlvbj8KPj4+Cj4+PiBJdHMgY2FsbGVk
IGVhY2ggdGltZSBpZGxlIGlzIGVudGVyZWQgYW5kIGxlZnQgYWdhaW4uCj4+Pgo+Pj4gRXNwZWNp
YWxseSB3aXRoIGNvcmUgc2NoZWR1bGluZyB0aGVyZSBpcyBhIGhpZ2ggcHJvYmFiaWxpdHkgb2Yg
bXVsdGlwbGUKPj4+IGNwdXMgbGVhdmluZyBpZGxlIGF0IHRoZSBzYW1lIHRpbWUgYW5kIHRoZSBw
ZXItc2NoZWR1bGVyIGxvY2sgYmVpbmcgdXNlZAo+Pj4gaW4gcGFyYWxsZWwgYWxyZWFkeS4KPj4K
Pj4gSHJtLCB0aGF0IGRvZXMgc291bmQgcHJldHR5IGJhZC4KPj4KPj4+PiBXZSBhbHJlYWR5IGhh
dmUgYSAqbG90KiBvZiBsb2NrczsgYW5kIGluIHRoaXMgY2FzZSB5b3UncmUgYWRkaW5nIGEKPj4+
PiBzZWNvbmQgbG9jayB3aGljaCBpbnRlcmFjdHMgd2l0aCB0aGUgcGVyLXNjaGVkdWxlciBjcHUg
bG9jay7CoCBUaGlzIGp1c3QKPj4+PiBzZWVtcyBsaWtlIGFza2luZyBmb3IgdHJvdWJsZS4KPj4+
Cj4+PiBJbiB3aGljaCB3YXkgZG9lcyBpdCBpbnRlcmFjdCB3aXRoIHRoZSBwZXItc2NoZWR1bGVy
IGNwdSBsb2NrPwo+Pj4KPj4+PiBJIHdvbid0IE5hY2sgdGhlIHBhdGNoLCBidXQgSSBkb24ndCB0
aGluayBJIHdvdWxkIGFjayBpdCB3aXRob3V0IGNsZWFyCj4+Pj4gZXZpZGVuY2UgdGhhdCB0aGUg
ZXh0cmEgbG9jayBoYXMgYSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCB0aGF0J3Mgd29ydGgKPj4+
PiB0aGUgY29zdCBvZiB0aGUgZXh0cmEgY29tcGxleGl0eS4KPj4+Cj4+PiBJIHRoaW5rIGNvbXBs
ZXhpdHkgaXMgbG93ZXIgdGhpcyB3YXkuIEVzcGVjaWFsbHkgY29uc2lkZXJpbmcgdGhlIHBlci0K
Pj4+IHNjaGVkdWxlciBsb2NrIGNoYW5naW5nIHdpdGggbW92aW5nIGEgY3B1IHRvIG9yIGZyb20g
YSBjcHVwb29sLgo+Pgo+PiBUaGUga2V5IGFzcGVjdCBvZiB0aGUgcGVyLXNjaGVkdWxlciBsb2Nr
IGlzIHRoYXQgb25jZSB5b3UgaG9sZCBpdCwgdGhlCj4+IHBvaW50ZXIgdG8gdGhlIGxvY2sgY2Fu
J3QgY2hhbmdlLgo+Pgo+PiBBZnRlciB0aGlzIHBhdGNoLCB0aGUgZmFjdCByZW1haW5zIHRoYXQg
c29tZXRpbWVzIHlvdSBuZWVkIHRvIGdyYWIgb25lCj4+IGxvY2ssIHNvbWV0aW1lcyB0aGUgb3Ro
ZXIsIGFuZCBzb21ldGltZXMgYm90aC4KPj4KPj4gQW5kLCB0aWNrX3N1c3BlbmQoKSBsaXZlcyBp
biB0aGUgcGVyLXNjaGVkdWxlciBjb2RlLsKgIEVhY2ggc2NoZWR1bGVyIGhhcwo+PiB0byByZW1l
bWJlciB0aGF0IHRpY2tfc3VzcGVuZCBhbmQgdGlja19yZXN1bWUgaG9sZCBhIGNvbXBsZXRlbHkK
Pj4gZGlmZmVyZW50IGxvY2sgdG8gdGhlIHJlc3Qgb2YgdGhlIHNjaGVkdWxpbmcgZnVuY3Rpb25z
Lgo+IAo+IElzIHRoYXQgcmVhbGx5IHNvIGNyaXRpY2FsPyBUb2RheSBvbmx5IGNyZWRpdDEgaGFz
IHRpY2tfc3VzcGVuZCBhbmQKPiB0aWNrX3Jlc3VtZSBob29rcywgYW5kIGJvdGggYXJlIHJlYWxs
eSB2ZXJ5IHNpbXBsZS4gSSBjYW4gYWRkIGEKPiBjb21tZW50IGluIHNjaGVkLWlmLmggaWYgeW91
IGxpa2UuCj4gCj4gQW5kIHVwIHRvIG5vdyB0aGVyZSB3YXMgbm8gbG9jayBhdCBhbGwgaW52b2x2
ZWQgd2hlbiBjYWxsaW5nIHRoZW0uLi4KPiAKPiBJZiB5b3UgdGhpbmsgdXNpbmcgdGhlIG5vcm1h
bCBzY2hlZHVsZXIgbG9jayBpcyB0byBiZSBwcmVmZXJyZWQgSSdkCj4gYmUgaGFwcHkgdG8gY2hh
bmdlIHRoZSBwYXRjaC4gQnV0IEkgc2hvdWxkIG1lbnRpb24gSSB3YXMgYWxyZWFkeQo+IHBsYW5u
aW5nIHRvIHJldmlzaXQgdXNhZ2Ugb2YgdGhlIHNjaGVkdWxlciBsb2NrIGFuZCByZXBsYWNlIGl0
IGJ5IHRoZQo+IG5ldyBwZXItY3B1IGxvY2sgd2hlcmUgYXBwcm9wcmlhdGUgKG5vdCBzdXJlIEkn
ZCBmaW5kIGFueSBhcHByb3ByaWF0ZQo+IHBhdGggZm9yIHJlcGxhY2VtZW50KS4KCldlbGwgdGhl
IHJlYWxseSBhbm5veWluZyB0aGluZyBoZXJlIGlzIHRoYXQgYWxsIHRoZSBvdGhlciBzY2hlZHVs
ZXJzIC0tCmluIHBhcnRpY3VsYXIsIGNyZWRpdDIsIHdoaWNoIGFzIHlvdSBzYXksIGlzIGRlc2ln
bmVkIHRvIGhhdmUgbXVsdGlwbGUKcnVucXVldWVzIHNoYXJlIHRoZSBzYW1lIGxvY2sgLS0gaGF2
ZSB0byBncmFiICYgcmVsZWFzZSB0aGUgbG9jayBqdXN0IHRvCmZpbmQgb3V0IHRoYXQgdGhlcmUn
cyBub3RoaW5nIHRvIGRvLgoKQW5kIGV2ZW4gY3JlZGl0MSBkb2Vzbid0IGRvIGFueXRoaW5nIHBh
cnRpY3VsYXJseSBjbGV2ZXIgLS0gYWxsIGl0IGRvZXMKaXMgc3RvcCBhbmQgc3RhcnQgYSB0aW1l
ciBiYXNlZCBvbiBhIHNjaGVkdWxlci1nbG9iYWwgY29uZmlndXJhdGlvbi4gQW5kCnRoZSBzY2hl
ZHVsaW5nIGxvY2sgaXMgZ3JhYmJlZCB0byBzd2l0Y2ggdG8gaWRsZSBhbnl3YXkuICBJdCBzZWVt
cyBsaWtlCndlIHNob3VsZCBiZSBhYmxlIHRvIGRvIHNvbWV0aGluZyBtb3JlIHNlbnNpYmxlLgoK
L21lIGlzIHN0aWxsIHRoaW5raW5nCgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
