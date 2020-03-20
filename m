Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0F18D233
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:59:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJ4n-00035Q-7X; Fri, 20 Mar 2020 14:56:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFJ4m-00035L-1X
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:56:44 +0000
X-Inumbo-ID: 02e3b908-6abb-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02e3b908-6abb-11ea-a6c1-bc764e2007e4;
 Fri, 20 Mar 2020 14:56:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 483C2ABEF;
 Fri, 20 Mar 2020 14:56:42 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <54040784-84b2-e888-68f1-af0fa41835f7@suse.com>
 <ec3253db-3345-c384-b766-63962e563ed8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27ebbec3-42db-3112-f295-8475bb2c2f1b@suse.com>
Date: Fri, 20 Mar 2020 15:56:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ec3253db-3345-c384-b766-63962e563ed8@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxNToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDIw
LzAzLzIwMjAgMTM6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyMC4wMy4yMDIwIDEwOjEy
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAyMC8wMy8yMDIwIDA5OjAxLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+Pj4+IE9uIEZyaSwgTWFyIDIwLCAyMDIwIGF0IDA4OjIxOjE5QU0gKzAx
MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOS4wMy4yMDIwIDIwOjA3LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+Pj4+PiBPbiAxOS8wMy8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pj4+Pj4+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+Pj4+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA0OjIx
OjIzUE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4+IMKgwqDCoCA+PiBXaHkg
Y2FuJ3QgeW91IGtlZXAgZmx1c2hfdGxiX21hc2soKSBoZXJlPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IEJlY2F1c2UgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlz
bWFwLCBhbmQKPj4+Pj4+Pj4+IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJlIGFuIEFTSUQg
Zmx1c2ggb24gQU1EIGhhcmR3YXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGFtIGFmcmFpZCB0aGlz
IGRvZXMgbm90IHlldCBleHBsYWluIG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxkIG5vdCBi
ZQo+Pj4+Pj4+PiB1cGRhdGVkIHNvIGl0IGZsdXNoIHRoZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4K
Pj4+Pj4+Pgo+Pj4+Pj4+IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBp
cyB0byBmbHVzaCB0aGUgQVNJRHMgb24KPj4+Pj4+PiBldmVyeSBUTEIgZmx1c2guCj4+Pj4+Pj4K
Pj4+Pj4+PiBmbHVzaF90bGJfbWFzayBpcyB0b28gd2lkZWx5IHVzZWQgb24geDg2IGluIHBsYWNl
cyB3aGVyZSB0aGVyZSdzIG5vCj4+Pj4+Pj4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMg
cHJldmVudHMgdXNpbmcgYXNzaXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4+Pj4+Pj4gd2hlbiBydW5u
aW5nIG5lc3RlZCwgc2luY2UgdGhvc2UgYXNzaXN0ZWQgZmx1c2hlcyBwZXJmb3JtZWQgYnkgTDAK
Pj4+Pj4+PiBkb24ndCBmbHVzaCB0aGUgTDIgZ3Vlc3RzIFRMQnMuCj4+Pj4+Pj4KPj4+Pj4+PiBJ
IGNvdWxkIGtlZXAgY3VycmVudCBiZWhhdmlvciBhbmQgbGVhdmUgZmx1c2hfdGxiX21hc2sgYWxz
byBmbHVzaGluZyB0aGUKPj4+Pj4+PiBBU0lEcywgYnV0IHRoYXQgc2VlbXMgd3JvbmcgYXMgdGhl
IGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBpbgo+Pj4+Pj4+IGl0J3MgbmFtZSB0aGF0
IHN1Z2dlc3RzIGl0IGFsc28gZmx1c2hlcyB0aGUgaW4tZ3Vlc3QgVExCcyBmb3IgSFZNLgo+Pj4+
Pj4KPj4+Pj4+IEkgYWdyZWUgdGhlIG5hbWUgaXMgY29uZnVzaW5nLCBJIGhhZCB0byBsb29rIGF0
IHRoZSBpbXBsZW1lbnRhdGlvbiB0byB1bmRlcnN0YW5kIHdoYXQgaXQgZG9lcy4KPj4+Pj4+Cj4+
Pj4+PiBIb3cgYWJvdXQgcmVuYW1pbmcgKG9yIGludHJvZHVjaW5nKSB0aGUgZnVuY3Rpb24gdG8g
Zmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFzaygpIG9yIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX2NwdW1h
c2soKSkgPwo+Pj4+Pgo+Pj4+PiBBbmQgdGhpcyB3b3VsZCB0aGVuIGZsdXNoIF9vbmx5XyBndWVz
dCBUTEJzPwo+Pj4+Cj4+Pj4gTm8sIEkgdGhpbmsgZnJvbSBKdWxpZW4ncyBwcm9wb3NhbCAoaWYg
SSB1bmRlcnN0b29kIGl0IGNvcnJlY3RseSkKPj4+PiBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNr
IHdvdWxkIGRvIHdoYXQgZmx1c2hfdGxiX21hc2sgY3VycmVudGx5IGRvZXMKPj4+PiBwcmV2aW91
cyB0byB0aGlzIHBhdGNoIChmbHVzaCBYZW4ncyBUTEJzICsgSFZNIEFTSURzKS4KPj4+Cj4+PiBJ
dCBsb29rcyBsaWtlIHRoZXJlIG1pZ2h0IGJlIGNvbmZ1c2lvbiBvbiB3aGF0ICJndWVzdCBUTEJz
IiBtZWFucy4gSW4gbXkgdmlldyB0aGlzIG1lYW5zIGFueSBUTEJzIGFzc29jaWF0ZWQgZGlyZWN0
bHkgb3IgaW5kaXJlY3RseSB3aXRoIHRoZSBndWVzdC4gT24gQXJtLCB0aGlzIHdvdWxkIGJlIG51
a2U6Cj4+PiDCoMKgwqAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgLT4gZ3Vlc3QgcGh5c2ljYWwg
YWRkcmVzcyBUTEIgZW50cnkKPj4+IMKgwqDCoCAtIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgLT4g
aG9zdCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQo+Pj4gwqDCoMKgIC0gZ3Vlc3QgdmlydHVh
bCBhZGRyZXNzIC0+IGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBUTEIgZW50cnkKPj4+Cj4+PiBJIHdv
dWxkIGFzc3VtZSB5b3Ugd2FudCBzb21ldGhpbmcgc2ltaWxhciBvbiB4ODYsIHJpZ2h0Pwo+Pgo+
PiBJIGRvbid0IHRoaW5rIHdlJ2Qgd2FudCB0aGUgbWlkZGxlIG9mIHRoZSB0aHJlZSBpdGVtcyB5
b3UgbGlzdCwKPj4gYnV0IEkgYWxzbyBkb24ndCBzZWUgaG93IHRoaXMgd291bGQgYmUgcmVsZXZh
bnQgaGVyZSAtIGZsdXNoaW5nCj4+IHRoYXQgaXMgYSBwMm0gb3BlcmF0aW9uLCBub3Qgb25lIGFm
ZmVjdGluZyBpbi1ndWVzdCB0cmFuc2xhdGlvbnMuCj4gCj4gQXBvbG9naWVzIGlmIHRoaXMgc2Vl
bXMgb2J2aW91cyB0byB5b3UsIGJ1dCB3aHkgd291bGQgeW91IHdhbnQgdG8gb25seSBmbHVzaCBp
bi1ndWVzdCB0cmFuc2xhdGlvbnMgaW4gY29tbW9uIGNvZGU/IFdoYXQgYXJlIHlvdSB0cnlpbmcg
dG8gcHJvdGVjdCBhZ2FpbnN0PwoKSSd2ZSBub3QgbG9va2VkIGF0IHRoZSBwYXJ0aWN1bGFyIHVz
ZSBpbiBjb21tb24gY29kZSwgbXkgY29tbWVudAp3YXMgb25seSBhYm91dCB3aGF0J3Mgc3RpbGwg
aW4gY29udGV4dCBhYm92ZS4KCj4gQXQgbGVhc3Qgb24gQXJtLCB5b3UgZG9uJ3Qga25vdyB3aGV0
aGVyIHRoZSBUTEJzIGNvbnRhaW5zIHNwbGl0IG9yIGNvbWJpbmVkIHN0YWdlLTIgKFAyTSkgLSBz
dGFnZS0xIChndWVzdCBQVCkgZW50cmllcy4gU28geW91IGhhdmUgdG8gbnVrZSBldmVyeXRoaW5n
LgoKRmx1c2hpbmcgZ3Vlc3QgbWFwcGluZ3MgKG9yIGdpdmluZyB0aGUgYXBwZWFyYW5jZSB0byBk
byBzbywgYnkKc3dpdGNoaW5nIEFTSUQvUENJRCkgaXMgc3VwcG9zZWQgdG8gYWxzbyBmbHVzaCBj
b21iaW5lZAptYXBwaW5ncyBvZiBjb3Vyc2UuIEl0IGlzIG5vdCBzdXBwb3NlZCB0byBmbHVzaCBw
Mm0gbWFwcGluZ3MsCmJlY2F1c2UgdGhhdCdzIGEgZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2UuIEl0
IG1heSB3ZWxsIGJlIHRoYXQKaW4gdGhlIHBsYWNlIHRoZSBmdW5jdGlvbiBnZXRzIHVzZWQgZmx1
c2hpbmcgb2YgZXZlcnl0aGluZyBpcwpuZWVkZWQsIGJ1dCB0aGVuIC0gYXMgSSB0aGluayBSb2dl
ciBoYXMgYWxyZWFkeSBzYWlkIC0gdGhlCnAybSBwYXJ0IG9mIHRoZSBmbHVzaGluZyBzaW1wbHkg
aGFwcGVucyBlbHNld2hlcmUgb24geDg2LiAoSXQKbWF5IHdlbGwgYmUgdGhhdCBpdCBjb3VsZCBk
byB3aXRoIGF2b2lkaW5nIHRoZXJlIGFuZCBnZXR0aW5nCmRvbmUgY2VudHJhbGx5IGZyb20gdGhl
IGNvbW1vbiBjb2RlIGludm9jYXRpb24uKQoKPiBCdXQgdGhpcyBpcyBhbHJlYWR5IGRvbmUgYXMg
cGFydCBvZiB0aGUgUDJNIGZsdXNoLiBJIGJlbGlldmUgdGhpcyBzaG91bGQgYmUgdGhlIHNhbWUg
b24geDg2LgoKQSBwMm0gZmx1c2ggd291bGQgZGVhbCB3aXRoIHAybSBhbmQgY29tYmluZWQgbWFw
cGluZ3M7IGl0CnN0aWxsIHdvdWxkbid0IGZsdXNoIGd1ZXN0IGxpbmVhciAtPiBndWVzdCBwaHlz
IG9uZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
