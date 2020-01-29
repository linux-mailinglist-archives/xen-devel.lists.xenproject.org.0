Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5698F14CCBA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:48:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoZx-000791-ND; Wed, 29 Jan 2020 14:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwoZw-00078u-6N
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:44:28 +0000
X-Inumbo-ID: d91655dc-42a5-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d91655dc-42a5-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:44:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53FF6B33F;
 Wed, 29 Jan 2020 14:44:26 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
 <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
 <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8143473f-c87d-a0d1-e211-c94b1dc7f5c8@suse.com>
Date: Wed, 29 Jan 2020 15:44:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxNTowNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgSmFu
IDI5LCAyMDIwIGF0IDY6MjcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjguMDEuMjAyMCAxODowMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTo1NiBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOgo+Pj4+PiBXaGVuIHBsdWdnaW5nIGEgaG9sZSBpbiB0aGUgdGFyZ2V0IHBoeXNt
YXAgZG9uJ3QgdXNlIHRoZSBhY2Nlc3MgcGVybWlzc2lvbgo+Pj4+PiByZXR1cm5lZCBieSBfX2dl
dF9nZm5fdHlwZV9hY2Nlc3MgYXMgaXQgY2FuIGJlIG5vbi1zZW5zaWNhbCwgbGVhZGluZyB0bwo+
Pj4+PiBzcHVyaW91cyB2bV9ldmVudHMgYmVpbmcgc2VudCBvdXQgZm9yIGFjY2VzcyB2aW9sYXRp
b25zIGF0IHVuZXhwZWN0ZWQKPj4+Pj4gbG9jYXRpb25zLiBNYWtlIHVzZSBvZiBwMm0tPmRlZmF1
bHRfYWNjZXNzIGluc3RlYWQuCj4+Pj4KPj4+PiBBcyBiZWZvcmUsIHRvIG1lICJjYW4gYmUgbm9u
LXNlbnNpY2FsIiBpcyBpbnN1ZmZpY2llbnQgYXMgYSByZWFzb24KPj4+PiBoZXJlLiBJZiBpdCBj
YW4gYWxzbyBiZSBhICJnb29kIiB2YWx1ZSwgaXQgc3RpbGwgcmVtYWlucyB1bmNsZWFyCj4+Pj4g
d2h5IGluIHRoYXQgY2FzZSBwMm0tPmRlZmF1bHRfYWNjZXNzIGlzIG5ldmVydGhlbGVzcyB0aGUg
cmlnaHQKPj4+PiB2YWx1ZSB0byB1c2UuCj4+Pgo+Pj4gSSBoYXZlIGFscmVhZHkgZXhwbGFpbmVk
IGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3aHkgSQo+Pj4gc2FpZCAiY2Fu
IGJlIi4gRm9yZ290IHRvIGNoYW5nZSB0aGUgY29tbWl0IG1lc3NhZ2UgZnJvbSAiY2FuIGJlIiB0
bwo+Pj4gImlzIi4KPj4KPj4gQ2hhbmdpbmcganVzdCB0aGUgY29tbWl0IG1lc3NhZ2Ugd291bGQg
YmUgZWFzeSB3aGlsZSBjb21taXR0aW5nLgo+PiBCdXQgZXZlbiB3aXRoIHRoZSBjaGFuZ2UgSSB3
b3VsZCBhc2sgd2h5IHRoaXMgaXMuIExvb2tpbmcgYXQKPj4gZXB0X2dldF9lbnRyeSgpIChhbmQg
YXNzdW1pbmcgcDJtX3B0X2dldF9lbnRyeSgpIHdpbGwgd29yawo+PiBzaW1pbGFybHksIG1pbnVz
IHRoZSBwMm1fYWNjZXNzX3Qgd2hpY2ggY2FuJ3QgY29tZSBvdXQgb2YgdGhlCj4+IFBURSBqdXN0
IHlldCksIEkgc2VlCj4+Cj4+ICAgICBpZiAoIGlzX2VwdGVfdmFsaWQoZXB0X2VudHJ5KSApCj4+
ICAgICB7Cj4+ICAgICAgICAgKnQgPSBwMm1fcmVjYWxjX3R5cGUocmVjYWxjIHx8IGVwdF9lbnRy
eS0+cmVjYWxjLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVwdF9lbnRyeS0+c2Ff
cDJtdCwgcDJtLCBnZm4pOwo+PiAgICAgICAgICphID0gZXB0X2VudHJ5LT5hY2Nlc3M7Cj4+Cj4+
IG5lYXIgaXRzIGVuZC4gV2hpY2ggbWVhbnMgZXZlbiBhIGhvbGUgY2FuIGhhdmUgaXRzIGFjY2Vz
cyBmaWVsZAo+PiBzZXQuIFNvIGl0J3Mgc3RpbGwgbm90IGNsZWFyIHRvIG1lIGZyb20gdGhlIGRl
c2NyaXB0aW9uIHdoeQo+PiBwMm0tPmRlZmF1bHRfYWNjZXNzIGlzIHVuaWZvcm1seSB0aGUgdmFs
dWUgdG8gdXNlLiBXb3VsZG4ndCB5b3UKPj4gcmF0aGVyIHdhbnQgdG8gb3ZlcnJpZGUgdGhlIG9y
aWdpbmFsIHZhbHVlIG9ubHkgaWYgaXQncwo+PiBwMm1fYWNjZXNzX24gdG9nZXRoZXIgd2l0aCBw
Mm1faW52YWxpZCBvciBwMm1fbW1pb19kbSAoYnV0IG5vdAo+PiBwYWdlZC1vdXQgcGFnZXMpPwo+
IAo+IEF0IHRoaXMgcG9pbnQgSSB3b3VsZCBqdXN0IHJhdGhlciBzdGF0ZSB0aGF0IGFkZF90b19w
aHlzbWFwIG9ubHkgd29ya3MKPiBvbiBhY3R1YWwgaG9sZXMsIG5vdCB3aXRoIHBhZ2VkLW91dCBw
YWdlcy4gSW4gZmFjdCwgSSB3b3VsZCBsaWtlIHRvCj4gc2VlIG1lbV9wYWdpbmcgYmVpbmcgZHJv
cHBlZCBmcm9tIHRoZSBjb2RlYmFzZSBlbnRpcmVseSBzaW5jZSBpdCdzCj4gYmVlbiBhYmFuZG9u
ZWQgZm9yIHllYXJzIGFuZCBub29uZSBleHByZXNzaW5nIGFueSBpbnRlcmVzdCBpbiBrZWVwaW5n
Cj4gaXQuIEluIHRoZSBpbnRlcmltIEkgd291bGQgcmF0aGVyIG5vdCBzcGVuZCB1bm5lY2Vzc2Fy
eSBjeWNsZXMgb24KPiBzcGVjdWxhdGluZyBhYm91dCBwb3RlbnRpYWwgY29ybmVyLWNhc2VzIG9m
IG1lbV9wYWdpbmcgd2hlbiBub29uZQo+IGFjdHVhbGx5IHVzZXMgaXQuCj4gCj4+IE9mIGNvdXJz
ZSB0aGVuIHRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoZXJlCj4+IHdvdWxkbid0IGJlIGFuIGFt
YmlndWl0eSB3aXRoIHAybV9hY2Nlc3NfbiBoYXZpbmcgZ290IHNldAo+PiBleHBsaWNpdGx5IG9u
IHRoZSBwYWdlLiBCdXQgbWF5YmUgdGhpcyBpcyBpbXBvc3NpYmxlIGZvcgo+PiBwMm1faW52YWxp
ZCAvIHAybV9tbWlvX2RtPwo+IAo+IEFzIGZhciBhcyBtZW1fYWNjZXNzIHBlcm1pc3Npb25zIGdv
LCBJIGRvbid0IGtub3cgb2YgYW55IHVzZWNhc2UgdGhhdAo+IHdvdWxkIHNldCBtZW1fYWNjZXNz
IHBlcm1pc3Npb24gb24gYSBob2xlIGV2ZW4gaWYgYnkgbG9va3Mgb2YgaXQgaXQgaXMKPiB0ZWNo
bmljYWxseSBwb3NzaWJsZS4gQXQgdGhpcyBwb2ludCBJIHdvdWxkIHJhdGhlciBqdXN0IHB1dCB0
aGlzCj4gY29ybmVyLWNhc2UncyBkZXNjcmlwdGlvbiBpbiBhIGNvbW1lbnQuCgpJIHRoaW5rIEkg
d291bGQgYWNrIGEgcmV2aXNlZCBwYXRjaCBoYXZpbmcgdGhpcyBwcm9wZXJseSBleHBsYWluZWQu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
