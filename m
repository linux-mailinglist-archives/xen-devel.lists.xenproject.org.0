Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A695A17BE4A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:26:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACx2-0003PR-9D; Fri, 06 Mar 2020 13:23:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACx0-0003PK-RU
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:23:38 +0000
X-Inumbo-ID: aefb11bf-5fad-11ea-a7d2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aefb11bf-5fad-11ea-a7d2-12813bfff9fa;
 Fri, 06 Mar 2020 13:23:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9C7EAE0D;
 Fri,  6 Mar 2020 13:23:35 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <007f01d5f3b9$110d20b0$33276210$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
Date: Fri, 6 Mar 2020 14:23:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <007f01d5f3b9$110d20b0$33276210$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 wl@xen.org, konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4gU2VudDogMDYgTWFy
Y2ggMjAyMCAxMzoxMAo+PiBUbzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3Jn
PjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+PiBDYzogc3N0YWJlbGxp
bmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7IHdsQHhlbi5vcmc7IGtvbnJhZC53aWxrQG9y
YWNsZS5jb207Cj4+IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb207IGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbTsgeGVuLQo+PiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgVm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20KPj4gU3ViamVjdDogUmU6
IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzJdIGRvbWFpbjogdXNlIFBHQ19leHRyYSBkb21oZWFwIHBh
Z2UgZm9yIHNoYXJlZF9pbmZvCj4+Cj4+IE9uIDA2LjAzLjIwMjAgMTM6NTcsIERhdmlkIFdvb2Ro
b3VzZSB3cm90ZToKPj4+IE9uIEZyaSwgMjAyMC0wMy0wNiBhdCAxMzozNiArMDEwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4gQW5kIG9mIGNvdXJzZSB0aGlzIG1lYW5zIHlvdSdyZSBpbnRlbmRp
bmcgdG8gKGF0IGxlYXN0Cj4+Pj4gcGFydGlhbGx5KSByZXN1cnJlY3QgdGhlIGRpc3RpbmN0aW9u
IGJldHdlZW4gZG9taGVhcCBhbmQgeGVuaGVhcCwKPj4+PiB3aGljaCBpc24ndCBzYWlkIGFueXdo
ZXJlIGluIFBhdWwncyBzZXJpZXMsIEkgZG9uJ3QgdGhpbmsuCj4+Pgo+Pj4gUmlnaHQuIFNlY3Jl
dCBoaWRpbmcgbWFrZXMgdGhlIGRpc3RpbmN0aW9uICh4ZW5oZWFwIGlzIG1hcHBlZCwgZG9taGVh
cAo+Pj4gaXMgbm90KSBtb3N0bHkgZ28gYXdheS4gV2UgYXJlIHRhbGtpbmcgYWJvdXQgcmVzdG9y
aW5nICphKiBkaXN0aW5jdGlvbgo+Pj4gYmV0d2VlbiBvbmUgdHlwZSBvZiBwYWdlIChYZW4gZXBo
ZW1lcmFsIHBhZ2VzIHdoaWNoIGRvbid0IG5lZWQgdG8gYmUKPj4+IHByZXNlcnZlZCBvdmVyIGxp
dmUgdXBkYXRlKSBhbmQgYW5vdGhlciAobXVzdCBiZSBwcmVzZXJ2ZWQpLCBidXQKPj4+IHdoZXRo
ZXIgdGhhdCBzaG91bGQgc3RpbGwgYmUgY2FsbGVkICJ4ZW5oZWFwIiB2cy4gImRvbWhlYXAiLCBk
ZXNwaXRlCj4+PiB0aGUgbWFzc2l2ZSBwYXJhbGxlbHMsIGlzbid0IGVudGlyZWx5IGNsZWFyLgo+
Pj4KPj4+PiAgSWYgdGhpcwo+Pj4+IGlzIGEgc3VmZmljaWVudGx5IGNvcnJlY3QgdW5kZXJzdGFu
ZGluZyBvZiBtaW5lLCB0aGVuIG9uIG9uZSBoYW5kCj4+Pj4gSSBzdGFydCBzZWVpbmcgdGhlIHBv
aW50IG9mIHRoZSBjb252ZXJzaW9uIFBhdWwgd2FudHMgdG8gbWFrZSwgYnV0Cj4+Pj4gb3RvaCB0
aGlzIHRoZW4gZmVlbHMgYSBsaXR0bGUgbGlrZSBtYWtpbmcgdGhlIDJuZCBzdGVwIGJlZm9yZSB0
aGUKPj4+PiAxc3QuCj4+Pgo+Pj4KPj4+IFdoYXQgd291bGQgeW91IHN1Z2dlc3QgaXMgdGhlIGZp
cnN0IHN0ZXA/Cj4+Cj4+IEVzdGFibGlzaGluZyBvZiB3aGF0IHRoZSBuZXcgc2VwYXJhdGlvbiBy
dWxlIGFuZCBtZWNoYW5pc20gaXMgZ29pbmcKPj4gdG8gYmUgKG5vIG1hdHRlciBob3cgdGhlIHR3
byByZXN1bHRpbmcgcGllY2VzIGFyZSBnb2luZyB0byBiZQo+PiBuYW1lZCkuCj4+Cj4gCj4gV291
bGQgeW91IGJlIG9rIHdpdGggYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0PwoKTm90IHN1cmUuIEl0
IHdvdWxkIGNlcnRhaW5seSBoZWxwIGlmIHRoZSBjb3ZlciBsZXR0ZXIgYXQgbGVhc3QKbWVudGlv
bmVkIG90aGVyIHJlbGF0ZWQgYXNwZWN0cyBsaWtlIHRoaXMgb25lLgoKPiBNeSBhaW0gaXMgdG8g
bWFrZSB0aGUgc2VwYXJhdGlvbiBhYnVuZGFudGx5IG9idmlvdXMgYnkgZ2V0dGluZyByaWQKPiBv
ZiBzaGFyZWQgeGVuaGVhcCBwYWdlcyAoZm9yIG5vbi1zeXN0ZW0gZG9tYWlucyBhdCBsZWFzdCkg
YnV0IEkKPiBjYW4ndCBkbyB0aGF0IGJlZm9yZSBjb252ZXJ0aW5nIHNoYXJlZF9pbmZvIGFuZCBn
cmFudCBzaGFyZWQvc3RhdHVzCj4gZnJhbWVzIHRvIGRvbWhlYXAuCgpGb2xsb3dpbmcgRGF2aWQn
cyB2YXJpb3VzIHJlcGxpZXMgLSBpbnN0ZWFkIG9mIGdvaW5nIHRoaXMgcm91dGUgb2YKcmVwbGFj
aW5nIHRoZSBzaGFyaW5nIG9mIHhlbmhlYXAgcGFnZXMgYnkgZGlmZmVyZW50IGxvZ2ljLCB0aGUK
c2FtZSBvdWdodCB0byBiZSBhY2hpZXZhYmxlIGJ5IG1ha2luZyB0aGUgYmFja2luZyBhbGxvY2F0
aW9ucyBjb21lCmZyb20gdGhlIGNvcnJlY3QgcG9vbD8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
