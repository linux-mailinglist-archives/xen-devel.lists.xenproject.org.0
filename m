Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356CB146EC2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 17:58:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuflb-0001jT-0S; Thu, 23 Jan 2020 16:55:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuflZ-0001jO-Ih
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 16:55:37 +0000
X-Inumbo-ID: 2d08ff38-3e01-11ea-be8c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d08ff38-3e01-11ea-be8c-12813bfff9fa;
 Thu, 23 Jan 2020 16:55:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 665FCAD6C;
 Thu, 23 Jan 2020 16:55:35 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <59bdc31b9fcffc92c5a8817aeba8eaa2de75a43c.1579628566.git.tamas.lengyel@intel.com>
 <f95e2a51-b866-dc6e-aa10-d81a3f5fd2c3@citrix.com>
 <CABfawhmFrebRs47jQQ_8r2aMsjyWDZH=DLnVuniD3sporPN=rQ@mail.gmail.com>
 <45e5cb4e-9c82-4085-8909-eddfe20124f1@citrix.com>
 <1e2b8d8b-ef88-1a13-15a4-42e2a4a649b3@suse.com>
 <74130c0a-073f-e882-51da-a523c705d2b5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7bd47991-e3d5-0399-8e30-81ab6f1e0846@suse.com>
Date: Thu, 23 Jan 2020 17:55:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <74130c0a-073f-e882-51da-a523c705d2b5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 10/18] x86/mem_sharing: Convert
 MEM_SHARING_DESTROY_GFN to a bool
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxNzo0MiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzIzLzIwIDQ6
MzcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyMy4wMS4yMDIwIDE3OjMyLCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOgo+Pj4gT24gMS8yMy8yMCA0OjIzIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4+Pj4gT24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgOToxNCBBTSBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiAxLzIxLzIwIDU6
NDkgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+IE1FTV9TSEFSSU5HX0RFU1RST1lf
R0ZOIGlzIHVzZWQgb24gdGhlICdmbGFncycgYml0ZmllbGQgZHVyaW5nIHVuc2hhcmluZy4KPj4+
Pj4+IEhvd2V2ZXIsIHRoZSBiaXRmaWVsZCBpcyBub3QgdXNlZCBmb3IgYW55dGhpbmcgZWxzZSwg
c28ganVzdCBjb252ZXJ0IGl0IHRvIGEKPj4+Pj4+IGJvb2wgaW5zdGVhZC4KPj4+Pj4+Cj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29t
Pgo+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+
Pj4KPj4+Pj4gQnV0IGlzIHRoZXJlIGEgcGFydGljdWxhciBhZHZhbnRhZ2UgdG8gZ2V0dGluZyBy
aWQgb2YgdGhlIGJpdGZpZWxkPwo+Pj4+Pgo+Pj4+PiBZb3UncmUgdGhlIG1haW50YWluZXIsIHNv
IGl0J3MgeW91ciBkZWNpc2lvbiBvZiBjb3Vyc2UuICBCdXQgaWYgaXQgd2VyZQo+Pj4+PiBtZSBJ
J2QgbGVhdmUgaXQgYXMgYSBiaXRmaWVsZCBzbyB0aGF0IGFsbCB0aGUgYml0ZmllbGQgY29kZSBp
cyB0aGVyZSBpZgo+Pj4+PiBpdCdzIG5lZWRlZCBpbiB0aGUgZnV0dXJlLiAgRmxpcHBpbmcgaXQg
dG8gYSBib29sLCB3aXRoIHRoZSByaXNrIG9mCj4+Pj4+IGZsaXBwaW5nIGl0IGJhY2sgdG8gYSBi
aXRmaWVsZCBsYXRlciwgc2VlbXMgbGlrZSBwb2ludGxlc3MgY2h1cm4gdG8gbWUuCj4+Pj4+Cj4+
Pj4+IChBbHRob3VnaCBwZXJoYXBzIHRoZSByZWFzb24gd2lsbCBiZWNvbWUgZXZpZGVudCBieSB0
aGUgdGltZSBJIGdldCB0bwo+Pj4+PiB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuKQo+Pj4+Cj4+Pj4g
UHJvdmlkZWQgaXRzIGJlZW4gbWFueSB5ZWFycyBzaW5jZSB0aGlzIGNvZGUgaGFzIGJlZW4gYWRk
ZWQgd2l0aCBubwo+Pj4+IG5lZWQgZm9yIGFueSBleHRyYSBiaXRzLCBhbmQgd2l0aCBubyBleHBl
Y3RhdGlvbnMgdGhhdCB0aGlzIHdvdWxkCj4+Pj4gY2hhbmdlIGFueSB0aW1lIHNvb24sIEkgd291
bGRuJ3Qgd29ycnkgYWJvdXQgdGhhdC4gVHJ1ZSwgdGhlcmUgaXMgdmVyeQo+Pj4+IGxpdHRsZSBk
aWZmZXJlbmNlIGJldHdlZW4ga2VlcGluZyB0aGUgY29kZSBhcy1pcyB2cyBjb252ZXJ0aW5nIGl0
IHRvCj4+Pj4gYm9vbCwgYnV0IElNSE8gaXQgbWFrZXMgdGhlIGNvZGUgZWFzaWVyIHRvIGZvbGxv
dyB3aXRob3V0IHlvdQo+Pj4+IHdvbmRlcmluZyB3aGF0IG1pZ2h0IGJlIHRob3NlIG5vbi1leGlz
dGVudCBzaXR1YXRpb25zIHRoYXQgd2FycmFudGVkCj4+Pj4gaXQgdG8gYmUgYSBiaXRtYXAgdG8g
YmVnaW4gd2l0aC4KPj4+Cj4+PiBJdCdzIGRlZmluaXRlbHkgYSBqdWRnZW1lbnQgY2FsbCwgYW5k
IEkgY2FuIHNlZSB3aGVyZSB5b3UncmUgY29taW5nCj4+PiBmcm9tLiAgTGlrZSBJIHNhaWQsIGlm
IGl0IHdlcmUgbWUgSSdkIGxlYXZlIGl0LCBidXQgaXQncyBub3QuIDotKSAgIEp1c3QKPj4+IHdh
bnRlZCB0byByYWlzZSB0aGUgaXNzdWUgYXMgSSB3YXMgZ29pbmcgdGhyb3VnaC4gIEknZCBBY2sg
aXQgYnV0IHlvdSd2ZQo+Pj4gYWxyZWFkeSBnb3QgYW4gUi1iLgo+Pgo+PiBVbnRpbCB5b3VyIHBy
b3Bvc2FsIGdldHMgYWNjZXB0ZWQsIGlzbid0IGl0IHRoYXQgeW91ciBhY2sgaXMgbmVlZGVkCj4+
IGRlc3BpdGUgdGhlIFItYj8gVGhpcyBpcyBhbHNvIHdoeSBlLmcuIGZvciBwYXRjaCAyIEkgZGlk
bid0IHNlZSBhCj4+IHBvaW50IGluIHNlbmRpbmcgYW55IFItYiwgYXMgdGhlIHBhdGNoIHdpbGwg
bmVlZCB5b3VyIGFjayBhbnl3YXksCj4+IGFuZCBpdCdzIHNvIHNpbXBsZSB0aGF0ICJyZXZpZXdl
ZCIgd291bGQgYmUgYW4gb3ZlcnN0YXRlbWVudC4KPiAKPiBJIGRvbid0IHRoaW5rIEknbSBjby1t
YWludGFpbmVyIG9mIHRoaXM7IGFuZCB5b3UncmUgYSBsZXNzLXNwZWNpZmljCj4gbWFpbnRhaW5l
ciB0aGFuIFRhbWFzLCByaWdodD8gIERvIHlvdSBuZWVkIG15IEFjaz8KCldlbGwsIEkgd2FzIHVu
ZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlIG1haW50YWluZXJzaGlwIG5lc3RpbmcKd2FzIGhp
ZXJhcmNoaWNhbCwgaS5lLiB0aGUgbmV4dCBsZXZlbCB1cCB3b3VsZCBiZWNvbWUgdGhlIHJlbGV2
YW50Cm9uZSBpbiBjYXNlcyBsaWtlIHRoaXMgb25lLiBCdXQgSSdtIG9mIGNvdXJzZSBoYXBweSB0
byBjb21taXQgdGhlCnBhcnRzIG9mIHRoaXMgc2VyaWVzIHdoaWNoIGFyZSByZWFkeSwgaWYganVz
dCBhbnkgbGVzcyBzcGVjaWZpYwptYWludGFpbmVyJ3MgYWNrIGlzIHN1ZmZpY2llbnQuIFByb2Jh
Ymx5IHRvbW9ycm93IG1vcm5pbmcgdGhlbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
