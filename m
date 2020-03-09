Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0317DB2C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 09:38:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBDrK-00044o-QZ; Mon, 09 Mar 2020 08:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBDrI-00044j-NU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 08:33:56 +0000
X-Inumbo-ID: b69f19da-61e0-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b69f19da-61e0-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 08:33:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B10B5ADAB;
 Mon,  9 Mar 2020 08:33:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200303182447.15469-1-andrew.cooper3@citrix.com>
 <b2dc100f-b28e-c977-fe87-968e0d26c7cb@suse.com>
 <f72e3e9b-92f4-49b4-5c53-1d3e988e9456@citrix.com>
 <24aea937-8078-03d3-d688-a1aabfd8bbd7@suse.com>
 <3524ed41-3e11-d83e-e23f-637c2f24f790@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41863f3c-0d6c-bf50-81bb-85df1f3eaa6e@suse.com>
Date: Mon, 9 Mar 2020 09:33:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3524ed41-3e11-d83e-e23f-637c2f24f790@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Untangle Invariant TSC handling
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxODo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wMy8yMDIw
IDA4OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDQuMDMuMjAyMCAxOTo0MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA0LzAzLzIwMjAgMTA6MjUsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEFjdHVhbGx5IGxvb2tpbmcKPj4+PiBhdCB0aGUgY2hhbmdlIHRvIGxpYnhsX19jcHVp
ZF9sZWdhY3koKSBJIHdvbmRlciB3aGV0aGVyIHlvdSBkb24ndCBpbnN0ZWFkCj4+Pj4gbWVhbiAi
cmVxdWVzdHMgdlRTQyIgaGVyZS4KPj4+IEkgZG9uJ3Qgc2VlIGhvdyB5b3UgY29tZSB0byB0aGF0
IGNvbmNsdXNpb24uwqAgSXQgaXMgdHdvIHNlcGFyYXRlIGNhc2VzCj4+PiB3aGVyZSB0aGUgdG9v
bHN0YWNrIGNhbiByZWFzb25hYmx5IGV4cGVjdCB0aGUgZ3Vlc3Qtb2JzZXJ2ZWQgZnJlcXVlbmN5
Cj4+PiBub3QgdG8gZGlmZmVyLgo+PiBMb29raW5nIGF0IHRoaXMgaHVuawo+IAo+IE9rLsKgIFRo
ZXJlIGFyZSAuLi4KPiAKPj4KPj4gQEAgLTQzMiw3ICs0MzMsMjIgQEAgdm9pZCBsaWJ4bF9fY3B1
aWRfbGVnYWN5KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKPj4gICAgICBpZiAoaW5m
by0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0pCj4+ICAgICAgICAgIHBhZSA9IGxpYnhs
X2RlZmJvb2xfdmFsKGluZm8tPnUuaHZtLnBhZSk7Cj4+ICAKPj4gLSAgICB4Y19jcHVpZF9hcHBs
eV9wb2xpY3koY3R4LT54Y2gsIGRvbWlkLCBOVUxMLCAwLCBwYWUpOwo+PiArICAgIC8qCj4+ICsg
ICAgICogQWR2ZXJ0aXNpbmcgSW52YXJpYW50IFRTQyB0byBhIGd1ZXN0IG1lYW5zIHRoYXQgdGhl
IFRTQyBmcmVxdWVuY3kgd29uJ3QKPj4gKyAgICAgKiBjaGFuZ2UgYXQgYW55IHBvaW50IGluIHRo
ZSBmdXR1cmUuCj4+ICsgICAgICoKPj4gKyAgICAgKiBXZSBkbyBub3QgaGF2ZSBlbm91Z2ggaW5m
b3JtYXRpb24gYWJvdXQgcG90ZW50aWFsIG1pZ3JhdGlvbgo+PiArICAgICAqIGRlc3RpbmF0aW9u
cyB0byBrbm93IHdoZXRoZXIgYWR2ZXJ0aXNpbmcgSVRTQyBpcyBzYWZlLCBidXQgaWYgdGhlIGd1
ZXN0Cj4+ICsgICAgICogaXNuJ3QgZ29pbmcgdG8gbWlncmF0ZSwgdGhlbiB0aGUgY3VycmVudCBo
YXJkd2FyZSBpcyBhbGwgdGhhdCBtYXR0ZXJzLgo+IAo+IC4uLiAxLCBvciAuLi4KPiAKPj4gKyAg
ICAgKgo+PiArICAgICAqIEFsdGVybmF0aXZlbHksIGFuIGludGVybmFsIHByb3BlcnR5IG9mIHZU
U0MgaXMgdGhhdCB0aGUgdmFsdWVzIHJlYWQgYXJlCj4+ICsgICAgICogaW52YXJpYW50LiAgQWR2
ZXJ0aXNlIElUU0Mgd2hlbiB3ZSBrbm93IHRoZSBkb21haW4gd2lsbCBoYXZlIGVtdWFsdGVkCj4+
ICsgICAgICogVFNDIGV2ZXJ5d2hlcmUgaXQgZ29lcy4KPiAKPiAuLi4gMiBvcnRob2dvbmFsIGNh
c2VzIGRlc2NyaWJlZCwgd2hlcmUgeGwvbGlieGwgaW4gaXRzIGN1cnJlbnQgZm9ybSBjYW4KPiBk
ZXRlcm1pbmUgdGhhdCBJVFNDIGlzIHNhZmUgdG8gYWR2ZXJ0aXNlLgo+IAo+PiArICAgICAqLwo+
PiArICAgIGl0c2MgPSAobGlieGxfZGVmYm9vbF92YWwoaW5mby0+ZGlzYWJsZV9taWdyYXRlKSB8
fAo+PiArICAgICAgICAgICAgaW5mby0+dHNjX21vZGUgPT0gTElCWExfVFNDX01PREVfQUxXQVlT
X0VNVUxBVEUpOwo+PiArCj4+ICsgICAgeGNfY3B1aWRfYXBwbHlfcG9saWN5KGN0eC0+eGNoLCBk
b21pZCwgTlVMTCwgMCwgcGFlLCBpdHNjKTsKPj4KPj4gSSBzZWUgdGhlIGNoZWNrIG9mIC0+dHNj
X21vZGUsIHdoaWNoIGFpdWkgaXMgYSByZXF1ZXN0IHRvIGVuYWJsZQo+PiB2VFNDIHVuY29uZGl0
aW9uYWxseS4KPiAKPiB2VFNDIGluIFhlbiBpcyBub3QgISF0c2NfbW9kZS4KPiAKPiBJbiBwYXJ0
aWN1bGFyLCBsaWJ4bCBjYW5ub3QgKGN1cnJlbnRseSkgZGV0ZXJtaW5lIHdoZXRoZXIKPiBUU0Nf
TU9ERV9OQVRJVkUgd2lsbCByZXN1bHQgaW4gc3VpdGFibGUgaW52YXJpYW50IHByb3BlcnRpZXMg
aW5zaWRlIHRoZQo+IGd1ZXN0LCBiZWNhdXNlIGFtb25nc3Qgb3RoZXIgdGhpbmdzLCBpdCBkZXBl
bmRzIG9uIHdoZXJlIHRoZSBWTSBtaWdodAo+IG1pZ3JhdGUgdG8gaW4gdGhlIGZ1dHVyZS4KCkFu
ZCBJIGRpZG4ndCBzYXkgYW55dGhpbmcgbGlrZSB0aGlzLiBXaGF0IEkgZGlkIHNheSBpcyB0aGF0
ClRTQ19NT0RFX0FMV0FZU19FTVVMQVRFIGlzIGEgcmVxdWVzdCB0byBlbmFibGUgdlRTQy4gSSBk
aWRuJ3QKZXhjbHVkZSB0aGVyZSBiZWluZyBvdGhlciBjYXNlcyB3aGVyZSB2VFNDIHdvdWxkIGdl
dCBlbmFibGVkCmV2ZW4gaWYgdGhlIHRvb2wgc3RhY2sgZGlkbid0IGV4cGxpY2l0bHkgYXMgZm9y
IGl0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
