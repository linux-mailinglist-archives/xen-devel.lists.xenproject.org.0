Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D417586E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 11:34:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8iMC-0001PH-K4; Mon, 02 Mar 2020 10:31:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8iMB-0001PC-Bu
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 10:31:27 +0000
X-Inumbo-ID: f8444cf4-5c70-11ea-b472-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8444cf4-5c70-11ea-b472-bc764e2007e4;
 Mon, 02 Mar 2020 10:31:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7284FAD2B;
 Mon,  2 Mar 2020 10:31:25 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-5-roger.pau@citrix.com>
 <cdb97977-2bae-5067-623d-76409fa643a2@suse.com>
 <20200228165048.GE24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c81eb9d7-56f8-47aa-8551-da971b7d7c75@suse.com>
Date: Mon, 2 Mar 2020 11:31:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228165048.GE24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxNzo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwNToxNDowNVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gVGhpcyB3YXMgcHJl
dmlvdXNseSB1bmNvbmRpdGlvbmFsbHkgZG9uZSBpbiBlYWNoIHByZV9mbHVzaCBjYWxsLCBidXQK
Pj4+IHRoYXQncyBub3QgcmVxdWlyZWQ6IEhWTSBndWVzdHMgbm90IHVzaW5nIHNoYWRvdyBkb24n
dCByZXF1aXJlIGxpbmVhcgo+Pj4gVExCIGZsdXNoZXMgYXMgWGVuIGRvZXNuJ3QgbW9kaWZ5IHRo
ZSBndWVzdCBwYWdlIHRhYmxlcyBpbiB0aGF0IGNhc2UKPj4+IChpZTogd2hlbiB1c2luZyBIQVAp
Lgo+Pgo+PiBUaGlzIGV4cGxhaW5zIHRoZSBjb3JyZWN0bmVzcyBpbiBvbmUgZGlyZWN0aW9uLiBX
aGF0IGFib3V0IHRoZQo+PiByZW1vdmFsIG9mIHRoaXMgZnJvbSB0aGUgc3dpdGNoX2NyM19jcjQo
KSBwYXRoPwo+IAo+IEFGQUlDVCB0aGF0J3MgbmV2ZXIgdXNlZCBieSBzaGFkb3cgY29kZSB0byBt
b2RpZnkgY3IzIG9yIGNyNCwgYW5kCj4gaGVuY2UgZG9lc24ndCByZXF1aXJlIGEgZ3Vlc3QgbGlu
ZWFyIFRMQiBmbHVzaC4KClhTQS0yOTQgdGVsbHMgbWUgdG8gYmUgdmVyeSBjb25zZXJ2YXRpdmUg
aGVyZS4gSXQgaXMgbm90IG5lY2Vzc2FyaWx5CnRoZSBkaXJlY3QgdXNlIGJ5IHNoYWRvdyBjb2Rl
IHRoYXQgbWF0dGVyczsgdG9nZ2xlX2d1ZXN0XyooKSBpc24ndAp1c2VkIGRpcmVjdGx5IGJ5IGl0
LCBlaXRoZXIuCgo+PiBBbmQgd2hhdCBhYm91dAo+PiBvdXIgc2FmZXR5IGFzc3VtcHRpb25zIGZy
b20gdGhlIHRpY2tpbmcgb2YgdGxiZmx1c2hfY2xvY2ssCj4+IHdoZXJlIHdlIHRoZW4gaW1wbHkg
dGhhdCBwYWdlcyBlLmcuIGFib3V0IHRvIGJlIGZyZWVkIGNhbid0Cj4+IGhhdmUgYW55IHRyYW5z
bGF0aW9ucyBsZWZ0IGluIGFueSBUTEJzIGFueW1vcmU/Cj4gCj4gSSdtIHNsaWdodGx5IGNvbmZ1
c2VkLiBUaGF0IGZsdXNoIG9ubHkgYWZmZWN0cyBIVk0gZ3Vlc3RzIGxpbmVhciBUTEIsCj4gYW5k
IGhlbmNlIGlzIG5vdCB1bmRlciBYZW4gY29udHJvbCB1bmxlc3Mgc2hhZG93IG1vZGUgaXMgdXNl
ZC4gUGFnZXMKPiB0byBiZSBmcmVlZCBpbiB0aGUgSEFQIGNhc2UgbmVlZCB0byBiZSBmbHVzaGVk
IGZyb20gdGhlIEVQVC9OUFQsIGJ1dAo+IHdoZXRoZXIgdGhlcmUgYXJlIHJlZmVyZW5jZXMgbGVm
dCBpbiB0aGUgZ3Vlc3QgVExCIHRvIHBvaW50IHRvIHRoYXQKPiBnZm4gcmVhbGx5IGRvZXNuJ3Qg
bWF0dGVyIHRvIFhlbiBhdCBhbGwsIHNpbmNlIHRoZSBndWVzdCBpcyBpbiBmdWxsCj4gY29udHJv
bCBvZiBpdCdzIE1NVSBhbmQgVExCIGluIHRoYXQgY2FzZS4KCkFoIHllcywgc29ycnksIEkgcHJv
YmFibHkgZGlkbid0IGdldCBteSB0aGlua2luZyByaWdodCBhcm91bmQKY29tYmluZWQgbWFwcGlu
Z3MgYW5kIHdoZW4gdGhleSBnZXQgaW52YWxpZGF0ZWQuCgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9mbHVzaHRsYi5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxi
LmgKPj4+IEBAIC0xMDUsNiArMTA1LDggQEAgdm9pZCBzd2l0Y2hfY3IzX2NyNCh1bnNpZ25lZCBs
b25nIGNyMywgdW5zaWduZWQgbG9uZyBjcjQpOwo+Pj4gICNkZWZpbmUgRkxVU0hfVkNQVV9TVEFU
RSAweDEwMDAKPj4+ICAgLyogRmx1c2ggdGhlIHBlci1jcHUgcm9vdCBwYWdlIHRhYmxlICovCj4+
PiAgI2RlZmluZSBGTFVTSF9ST09UX1BHVEJMIDB4MjAwMAo+Pj4gKyAvKiBGbHVzaCBhbGwgSFZN
IGd1ZXN0cyBsaW5lYXIgVExCICh1c2luZyBBU0lEL1ZQSUQpICovCj4+PiArI2RlZmluZSBGTFVT
SF9HVUVTVFNfVExCIDB4NDAwMAo+Pgo+PiBGb3Igb25lLCB0aGUgImFsbCIgaXMgcHJldHR5IG1p
c2xlYWRpbmcuIEEgc2luZ2xlIHN1Y2ggcmVxdWVzdAo+PiBkb2Vzbid0IGRvIHRoaXMgZm9yIGFs
bCB2Q1BVLXMgb2YgYWxsIEhWTSBndWVzdHMsIGRvZXMgaXQ/Cj4gCj4gSXQga2luZCBvZiBkb2Vz
IGJlY2F1c2UgaXQgdGlja2xlcyB0aGUgcENQVSBBU0lEL1ZQSUQgZ2VuZXJhdGlvbiBJRCwKPiBz
byBhbnkgdkNQVSBzY2hlZHVsZWQgb24gdGhlIHNlbGVjdGVkIHBDUFVzIHdpbGwgZ2V0IGEgbmV3
IEFTSUQvVlBJRAo+IGFsbG9jYXRlZCBhbmQgdGh1cyBhIGNsZWFuIFRMQi4KPiAKPj4gSSdtCj4+
IGFsc28gc3RydWdnbGluZyB3aXRoIHRoZSAnUycgaW4gIkdVRVNUUyIgLSB3aHkgaXMgaXQgbm90
IGp1c3QKPj4gIkdVRVNUIj8gCj4gCj4gQW55IGd1ZXN0IHZDUFVzIHJ1bm5pbmcgb24gdGhlIHNl
bGVjdGVkIHBDUFVzIHdpbGwgZ2V0IGEgbmV3IEFTSUQvVlBJRAo+IElEIGFuZCB0aHVzIGEgY2xl
YW4gVExCLgoKUmlnaHQsIEkgc2VlLiBZZXQgLi4uCgo+PiBJIGFkbWl0IHRoZSBuYW1lcyBvZiB0
aGUgaW52b2x2ZWQgZnVuY3Rpb25zCj4+IChodm1fZmx1c2hfZ3Vlc3RfdGxicygpLCBodm1fYXNp
ZF9mbHVzaF9jb3JlKCkpIGFyZSBzb21ld2hhdAo+PiBtaXNsZWFkaW5nLCBhcyB0aGV5IGRvbid0
IGFjdHVhbGx5IGRvIGFueSBmbHVzaGluZywgdGhleSBtZXJlbHkKPj4gYXJyYW5nZSBmb3Igd2hh
dCBpcyBpbiB0aGUgVExCIHRvIG5vIGxvbmdlciBiZSBhYmxlIHRvIGJlIHVzZWQsCj4+IHNvIGdp
dmluZyB0aGlzIGEgc3VpdGFibGUgbmFtZSBpcyAiaGlzdG9yaWNhbGx5IiBjb21wbGljYXRlZC4K
Pj4gV2hhdCBpZiB3ZSBkaWQgYXdheSB3aXRoIHRoZSBodm1fZmx1c2hfZ3Vlc3RfdGxicygpIHdy
YXBwZXIsCj4+IG5hbWluZyB0aGUgY29uc3RhbnQgaGVyZSB0aGVuIGFmdGVyIGh2bV9hc2lkX2Zs
dXNoX2NvcmUoKSwgZS5nLgo+PiBGTFVTSF9BU0lEX0NPUkU/Cj4gCj4gSSdtIG5vdCBvcHBvc2Vk
IHRvIHJlbmFtaW5nLiBUaGUgY29tbWVudCBiZWZvcmUgdGhlIGRlZmluaXRpb24gd2FzCj4gYWxz
byBtZWFudCB0byBjbGFyaWZ5IGl0J3MgdXNhZ2UsIGFuZCBoZW5jZSB0aGUgZXhwbGljaXQgbWVu
dGlvbiBvZgo+IEFTSUQvVlBJRC4KCi4uLiB0aGVyZSdzIGFsc28gb25lIG1vcmUgYXJndW1lbnQg
Zm9yIHJlbmFtaW5nOiBUaGUgcHJlc2VudApuYW1lIGRvZXNuJ3QgY29udmV5IGF0IGFsbCB0aGF0
IHRoaXMgb3BlcmF0aW9uIGlzIEhWTS1vbmx5CihpLmUuIFBWIGd1ZXN0cyB3b3VsZG4ndCBoYXZl
IHRoZWlyIFRMQnMgW2FzIGZhciBhcyBvbmUgY2FuCmNhbGwgdGhlbSAidGhlaXIiXSBmbHVzaGVk
KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
