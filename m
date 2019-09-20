Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F96B8E6D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 12:23:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBG1J-0000CQ-Ej; Fri, 20 Sep 2019 10:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBG1H-00009R-Nk
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 10:20:07 +0000
X-Inumbo-ID: 3747ae26-db90-11e9-9688-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3747ae26-db90-11e9-9688-12813bfff9fa;
 Fri, 20 Sep 2019 10:20:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72ADBAFB6;
 Fri, 20 Sep 2019 10:20:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b080fa0f-08d2-34d0-3f54-549e1303eeb4@suse.com>
 <77f8b74c-c9a9-efc4-07b1-d20dbd5545c5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89ed0fa4-b126-1939-d728-5ff2d477465a@suse.com>
Date: Fri, 20 Sep 2019 12:20:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <77f8b74c-c9a9-efc4-07b1-d20dbd5545c5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] libxc/x86: avoid overflow in CPUID APIC ID
 adjustments
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

T24gMjAuMDkuMjAxOSAxMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wOS8yMDE5
IDEyOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gUmVjZW50IEFNRCBwcm9jZXNzb3JzIG1heSBy
ZXBvcnQgdXAgdG8gMTI4IGxvZ2ljYWwgcHJvY2Vzc29ycyBpbiBDUFVJRAo+PiBsZWFmIDEuIERv
dWJsaW5nIHRoaXMgdmFsdWUgcHJvZHVjZXMgMCAod2hpY2ggT1NlcyBzaW5jZXJlbHkgZGlzbGlr
ZSksCj4+IGFzIHRoZSByZXNwZWN0aXZlIGZpZWxkIGlzIG9ubHkgOCBiaXRzIHdpZGUuIFN1cHBy
ZXNzIGRvdWJsaW5nIHRoZSB2YWx1ZQo+PiAoYW5kIGl0cyBsZWFmIDB4ODAwMDAwMDggY291bnRl
cnBhcnQpIGluIHN1Y2ggYSBjYXNlLgo+Pgo+PiBBZGRpdGlvbmFsbHkgZG9uJ3QgZXZlbiBkbyBh
bnkgYWRqdXN0bWVudCB3aGVuIHRoZSBob3N0IHRvcG9sb2d5IGFscmVhZHkKPj4gaW5jbHVkZXMg
cm9vbSBmb3IgbXVsdGlwbGUgdGhyZWFkcyBwZXIgY29yZS4KPj4KPj4gRnVydGhlcm1vcmUgZG9u
J3QgZG91YmxlIHRoZSBNYXhpbXVtIENvcmVzIFBlciBQYWNrYWdlIGF0IGFsbCAtIGJ5IHVzCj4+
IGludHJvZHVjaW5nIGEgZmFrZSBIVFQgZWZmZWN0LCB0aGUgY29yZSBjb3VudCBkb2Vzbid0IG5l
ZWQgdG8gY2hhbmdlLgo+PiBJbnN0ZWFkIGFkanVzdCB0aGUgTWF4aW11bSBMb2dpY2FsIFByb2Nl
c3NvcnMgU2hhcmluZyBDYWNoZSBmaWVsZCwgd2hpY2gKPj4gc28gZmFyIHdhcyB6YXBwZWQgYWx0
b2dldGhlci4KPj4KPj4gQWxzbyB6YXAgbGVhZiA0IChhbmQgYXQgdGhlIHNhbWUgdGltZSBsZWFm
IDIpIEVEWCBvdXRwdXQgZm9yIEFNRC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gVEJEOiBVc2luZyB4Y19waHlzaW5mbygpIG91
dHB1dCBoZXJlIG5lZWRzIGEgYmV0dGVyIHNvbHV0aW9uLiBUaGUKPj4gICAgICB0aHJlYWRzX3Bl
cl9jb3JlIHZhbHVlIHJldHVybmVkIGlzIHRoZSBjb3VudCBvZiBhY3RpdmUgc2libGluZ3Mgb2YK
Pj4gICAgICBDUFUgMCwgcmF0aGVyIHRoYW4gYSBzeXN0ZW0gd2lkZSBhcHBsaWNhYmxlIHZhbHVl
IChhbmQgY29uc3RhbnQKPj4gICAgICBvdmVyIHRoZSBlbnRpcmUgc2Vzc2lvbikuIFVzaW5nIENQ
VUlEIG91dHB1dCAobGVhdmVzIDQgYW5kCj4+ICAgICAgODAwMDAwMWUpIGRvZXNuJ3QgbG9vayB2
aWFibGUgZWl0aGVyLCBkdWUgdG8gdGhpcyBub3QgcmVhbGx5IGJlaW5nCj4+ICAgICAgdGhlIGhv
c3QgdmFsdWVzIG9uIFBWSC4gSnVkZ2luZyBmcm9tIHRoZSBob3N0IGZlYXR1cmUgc2V0J3MgSFRU
Cj4+ICAgICAgZmxhZyBhbHNvIHdvdWxkbid0IHRlbGwgdXMgd2hldGhlciB0aGVyZSBhY3R1YWxs
eSBhcmUgbXVsdGlwbGUKPj4gICAgICB0aHJlYWRzIHBlciBjb3JlLgo+IAo+IFRoZSBrZXkgdGhp
bmcgaXMgdGhhdCBodHQgIT0gIm1vcmUgdGhhbiBvbmUgdGhyZWFkIHBlciBjb3JlIi7CoCBIVFQg
aXMKPiBzdHJpY3RseSBhIGJpdCBpbmRpY2F0aW5nIHRoYXQgdG9wb2xvZ3kgaW5mb3JtYXRpb24g
aXMgYXZhaWxhYmxlIGluIGEKPiBuZXcgZm9ybSBpbiB0aGUgQ1BVSUQgbGVhdmVzIChvciBpbiBB
TURzIGNhc2UsIHRoZSBzYW1lIGluZm9ybWF0aW9uCj4gc2hvdWxkIGJlIGludGVycHJldGVkIGlu
IGEgbmV3IHdheSkuwqAgSnVzdCBiZWNhdXNlIEhUVCBpcyBzZXQgKGFuZCBpdAo+IGRvZXMgZ2V0
IHNldCBpbiBub24tSFQgY2FwYWJsZSBzeXN0ZW1zKSwgZG9lc24ndCBtZWFuIHRoZXJlIGlzIHNw
YWNlIGZvcgo+IG1vcmUgdGhhbiB0aHJlYWQgcGVyIGNvcmUgaW4gdG9wb2xvZ3kgaW5mb3JtYXRp
b24uCj4gCj4gRm9yIFBWIGd1ZXN0cywgbXkgYWRqdXN0bWVudCBpbiB0aGUgQ1BVSUQgc2VyaWVz
IHNob3dzICh3aGF0IEkgYmVsaWV2ZQo+IHRvIGJlKSB0aGUgb25seSBjb3JyZWN0IHdheSBvZiBw
cm9wYWdhdGluZyB0aGUgaG9zdCBIVFQvQ01QX0xFR0FDWQo+IHNldHRpbmdzIHRocm91Z2guCj4g
Cj4gRm9yIEhWTSBndWVzdHMsIGl0IHJlYWxseSBzaG91bGRuJ3QgcmVhbGx5IGhhdmUgYW55dGhp
bmcgdG8gZG8gd2l0aCB0aGUKPiBob3N0IHNldHRpbmcuwqAgV2Ugc2hvdWxkIGJlIGNob29zaW5n
IGhvdyBtYW55IHRocmVhZHMvY29yZSB0byBnaXZlIHRvCj4gdGhlIGd1ZXN0LCB0aGVuIGNvbnN0
cnVjdGluZyB0aGUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gZnJvbSBmaXJzdCBwcmluY2lwbGVzLgo+
IAo+IElnbm9yZSB0aGUgUFZIIGNhc2UuwqAgSXQgaXMgdG90YWxseSBicm9rZW4gZm9yIHNldmVy
YWwgb3RoZXIgcmVhc29ucyBhcwo+IHdlbGwsIGFuZCBQVkggRG9tMCBpc24ndCBhIHByb2R1Y3Rp
b24tcmVhZHkgdGhpbmcgeWV0Lgo+IAo+IFRoaXMgZ2V0cyB1cyBiYWNrIHRvIHRoZSBQViBjYXNl
IHdoZXJlIHRoZSBob3N0IGluZm9ybWF0aW9uIGlzIGFjdHVhbGx5Cj4gaW4gdmlldywgYW5kIChm
b3IgYmFja3BvcnQgcHVycG9zZXMpIGNhbiBiZSB0cnVzdGVkLgoKT2theSwgdGhpcyBtZWFucyBJ
J2xsIHJldml2ZSBhbmQgZmluaXNoIHRoZSBoYWxmIGNwdWlkKCkgYmFzZWQgYXR0ZW1wdApJIGhh
ZCBtYWRlIGluaXRpYWxseS4gQSBmdW5kYW1lbnRhbCBxdWVzdGlvbiByZW1haW5zIG9wZW4gdGhv
dWdoIGZyb20KeW91ciByZXBseTogRG8geW91IGFncmVlIHdpdGggdGhlIGlkZWEgb2YgYXZvaWRp
bmcgdGhlIG11bHRpcGxpY2F0aW9uCmJ5IDIgaWYgdGhlIGhvc3QgdG9wb2xvZ3kgYWxyZWFkeSBw
cm92aWRlcyBhdCBsZWFzdCBvbmUgYml0IG9mIHRocmVhZApJRCB3aXRoaW4gdGhlIEFQSUMgSUQ/
IFJlbGF0ZWQgdG8gd2hpY2ggdGhlbiB0aGUgcXVlc3Rpb24gd2hldGhlciB5b3UKYWxzbyBhZ3Jl
ZSB3aXRoIG15IGFwcHJvYWNoIG9mIGRpdGNoaW5nIHRoZSBhZGp1c3RtZW50IHRvIE1heGltdW0g
Q29yZXMKUGVyIFBhY2thZ2U/IChJJ20gYXNraW5nIGJlY2F1c2UgSSdkIGxpa2UgdG8gYXZvaWQg
c2V2ZXJhbCBtb3JlIHJvdW5kCnRyaXBzIG9mIHRoZSBwYXRjaCBpdHNlbGYuKQoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
