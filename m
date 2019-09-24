Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6FFBC2C1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 09:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCfKT-0002Pg-1A; Tue, 24 Sep 2019 07:33:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCfKR-0002Pb-ER
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 07:33:43 +0000
X-Inumbo-ID: a1524f82-de9d-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1524f82-de9d-11e9-b299-bc764e2007e4;
 Tue, 24 Sep 2019 07:33:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D95BAFBD;
 Tue, 24 Sep 2019 07:33:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
 <6b9ca7a2-e2c4-5662-7f56-b1cceac75c67@suse.com>
 <159c23f4-aa7f-7aa0-e054-2a6cd0ebe82f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d80ec229-2780-614c-ceca-1c8c7f5e2240@suse.com>
Date: Tue, 24 Sep 2019 09:33:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <159c23f4-aa7f-7aa0-e054-2a6cd0ebe82f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] libxc/x86: avoid overflow in CPUID APIC
 ID adjustments
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxOTozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMy8wOS8yMDE5
IDA5OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjAuMDkuMjAxOSAxNTo1NCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBSZWNlbnQgQU1EIHByb2Nlc3NvcnMgbWF5IHJlcG9ydCB1cCB0byAx
MjggbG9naWNhbCBwcm9jZXNzb3JzIGluIENQVUlECj4+PiBsZWFmIDEuIERvdWJsaW5nIHRoaXMg
dmFsdWUgcHJvZHVjZXMgMCAod2hpY2ggT1NlcyBzaW5jZXJlbHkgZGlzbGlrZSksCj4+PiBhcyB0
aGUgcmVzcGVjdGl2ZSBmaWVsZCBpcyBvbmx5IDggYml0cyB3aWRlLiBTdXBwcmVzcyBkb3VibGlu
ZyB0aGUgdmFsdWUKPj4+IChhbmQgaXRzIGxlYWYgMHg4MDAwMDAwOCBjb3VudGVycGFydCkgaW4g
c3VjaCBhIGNhc2UuCj4+Pgo+Pj4gTm90ZSB0aGF0IHdoaWxlIHRoZXJlJ3MgYSBzaW1pbGFyIG92
ZXJmbG93IGluIGludGVsX3hjX2NwdWlkX3BvbGljeSgpLAo+Pj4gdGhhdCBvbmUgaXMgYmVpbmcg
bGVmdCBhbG9uZSBmb3Igbm93Lgo+Pj4KPj4+IE5vdGUgZnVydGhlciB0aGF0IHdoaWxlIGl0IHdh
cyBjb25zaWRlcmVkIHRvIHN1cHByZXNzIHRoZSBtdWx0aXBsaWNhdGlvbgo+Pj4gYnkgMiBhbHRv
Z2V0aGVyIGlmIHRoZSBob3N0IHRvcG9sb2d5IGFscmVhZHkgcHJvdmlkZXMgYXQgbGVhc3Qgb25l
IGJpdAo+Pj4gb2YgdGhyZWFkIElEIHdpdGhpbiBBUElDIElEcywgaXQgd2FzIGRlY2lkZWQgdG8g
YXZvaWQgbW9yZSBjaGFuZ2UgaGVyZQo+Pj4gdGhhbiByZWFsbHkgbmVlZGVkIGF0IHRoaXMgcG9p
bnQuCj4+Pgo+Pj4gQWxzbyB6YXAgbGVhZiA0IChhbmQgYXQgdGhlIHNhbWUgdGltZSBsZWFmIDIp
IEVEWCBvdXRwdXQgZm9yIEFNRCwgYXMgaXQKPj4+IHNob3VsZCBoYXZlIGJlZW4gZnJvbSB0aGUg
YmVnaW5uaW5nLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4+IC0tLQo+Pj4gdjI6IERyb3AgdXNlIG9mIHBoeXNpbmZvLiBEcm9wIEludGVs
LW9ubHkgbGVhZiA0IGNoYW5nZS4gSW5jcmVtZW50Cj4+PiAgICAgQXBpY0lkQ29yZVNpemUgb25s
eSB3aGVuIGRvdWJsaW5nIE51bWJlck9mQ29yZXMuCj4+IFRoaW5raW5nIGFib3V0IGl0IHNvbWUg
bW9yZSwgZHJvcHBpbmcgdGhlIGxlYWYgNCBjaGFuZ2Ugc2VlbXMgYXQgbGVhc3QKPj4gc29tZXdo
YXQgcmlza3kgdG8gbWUuIFRoaXMgYmVpbmcganVzdCBhIDYtYml0IGZpZWxkIChhbmQgZWZmZWN0
aXZlbHkKPj4gYWxyZWFkeSBzYXR1cmF0aW5nIGluIGEgd2F5LCBhdCBsZWFzdCB3aGVuIHBvd2Vy
LW9mLXR3byBtYXhpbXVtIGNvcmUKPj4gY291bnRzIGFyZSBpbnZvbHZlZCksIGFuZCBoZW5jZSB0
aGVyZSBiZWluZyAyIGJpdHMgb2YgInBsYXlpbmcgcm9vbSIKPj4gYmV0d2VlbiB0aGlzIGFuZCB0
aGUgaW52b2x2ZWQgbGVhZiAxIGZpZWxkLCB0aGUgY2FsY3VsYXRpb24gdGhlcmUgbm90Cj4+IGdl
dHRpbmcgYWRqdXN0ZWQgaXMgc3RpbGwgYSBsYXRlbnQgcmlzayBpbW8gd2l0aCBndWVzdCBzaWRl
IGNhbGN1bGF0aW9ucwo+PiBsaWtlIHRoaXMgb25lCj4+Cj4+IAlzbXBfbnVtX3NpYmxpbmdzID0g
c21wX251bV9zaWJsaW5ncyAvIGMtPng4Nl9tYXhfY29yZXM7Cj4+Cj4+IGZvdW5kIGluIGJhc2lj
YWxseSBhbGwgdmVyc2lvbnMgb2YgTGludXggKHdoZXJlIGNlcnRhaW4gZnVuY3Rpb25zLAo+PiBl
LmcuIGFwaWNfaWRfaXNfcHJpbWFyeV90aHJlYWQoKSwgd29uJ3QgY29wZSB3aXRoIHNtcF9udW1f
c2libGluZ3MKPj4gZW5kaW5nIHVwIGFzIHplcm8sIHdoaWxlIG90aGVycywgZS5nLiB0b3BvbG9n
eV9zbXRfc3VwcG9ydGVkKCksIGRvKS4KPiAKPiBOb25lIG9mIHRoZXNlIGFkanVzdG1lbnRzIGFy
ZSBjb3JyZWN0LsKgIFRoZSB0b3BvbG9neSBzaG91bGQgYmUKPiBjb25zdHJ1Y3RlZCBmcm9tIGZp
cnN0IHByaW5jaXBsZXMuCgpGdWxseSBhZ3JlZS4KCj4gV2hhdCBtYXR0ZXJzIGlzIGhhdmluZyBh
cyBmZXcgYWx0ZXJhdGlvbnMgdG8gdGhlIGFsZ29yaXRobSBhcyBuZWNlc3NhcnksCj4gdW50aWwg
d2UgY2FuIGZpeCB0aGUgbWFueSB0b29sc3RhY2sgc2lkZSBpc3N1ZXMuCgpCdXQgaWYgYW4gYWx0
ZXJhdGlvbiBpcyBuZWVkZWQsIHdlIHNob3VsZCBhbHNvIHRyeSB0byBsaW1pdCB0aGUKcmlzayBv
ZiBpdCBpbnRyb2R1Y2luZyByZWdyZXNzaW9ucyBlbHNld2hlcmUuIEkgd3JvdGUgdGhlIGFib3Zl
IHJlcGx5CnNpbXBseSBiZWNhdXNlIEknbSB1bmNlcnRhaW4gd2hldGhlciB0aGUgbGFyZ2VyIHJp
c2sgaXMgdG8gbGVhdmUKbGVhZiA0IGhhbmRsaW5nIHVuY2hhbmdlZCwgb3IgdG8gY2hhbmdlIGl0
IGFsb25nIHRoZSBsaW5lcyBvZiB0aGUKb3RoZXIgdHdvIGFkanVzdG1lbnRzIGRvbmUgaGVyZS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
