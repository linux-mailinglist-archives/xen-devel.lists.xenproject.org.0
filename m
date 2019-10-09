Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEF3D0A4D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:53:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI7f0-0000WD-N2; Wed, 09 Oct 2019 08:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI7ez-0000W7-6z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:49:29 +0000
X-Inumbo-ID: b3b759ee-ea71-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3b759ee-ea71-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 08:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5872B219;
 Wed,  9 Oct 2019 08:49:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e73d1d1-468b-15b6-0951-25b266011499@suse.com>
Date: Wed, 9 Oct 2019 10:49:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxODozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8xMC8yMDE5
IDE3OjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPj4KPj4gTm93IHRoYXQgeGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8g
ZXhwbGljaXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3MgZm9yIGEKPj4gZG9tYWluLCBtaWdyYXRp
b24gbWF5IGJlIG5lZWRsZXNzbHkgdmV0b2VkIGR1ZSB0byB0aGUgY2hlY2sgb2YKPj4gaXNfaW9t
bXVfZW5hYmxlZCgpIGluIHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCkuCj4+IFRoZXJlIGlzIGFj
dHVhbGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dkaXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5s
ZXNzCj4+IGRldmljZXMgYXJlIGFzc2lnbmVkIHRvIGEgZG9tYWluLgo+Pgo+PiBOT1RFOiBXaGls
ZSBpbiB0aGUgbmVpZ2hib3VyaG9vZCwgdGhlIGJvb2xfdCBwYXJhbWV0ZXIgdHlwZSBpbgo+PiAg
ICAgICBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZSgpIGlzIHJlcGxhY2VkIHdpdGggYSBib29sIGFu
ZCB0aGUgZm9ybWF0Cj4+ICAgICAgIG9mIHRoZSBjb21tZW50IGluIGFzc2lnbl9kZXZpY2UoKSBp
cyBmaXhlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+PiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gCj4gU2VyaW91c2x5IEZGUy7CoCBXaHkgYW0gSSBoYXZpbmcgdG8gcmVwZWF0IG15c2VsZj/C
oCBXaGF0IGlmIGFueSB3YXkKPiB1bmNsZWFyIG9uIHRoZSBwcmV2aW91cyB0aHJlYWRzPwo+IAo+
IE5BQ0sgTkFDSyBOQUNLLsKgIFhlbiBpcywgYW5kIGhhcyBhbHdheXMgYmVlbiwgdGhlIHdyb25n
IHBsYWNlIHRvIGhhdmUKPiBhbnkgbG9naWMsIGJlY2F1c2UgSVQgRE9FU04nVCBIQVZFIEVOT1VH
SCBJTkZPUk1BVElPTiBUTyBNQUtFIFRIRQo+IERFQ0lTSU9OIENPUlJFQ1RMWS4KPiAKPiBUaGUg
dG9vbHN0YWNrIGRvZXMuCj4gCj4gVGhlcmVmb3JlLCB0aGUgdG9vbHN0YWNrIGlzIHRoZSBvbmx5
IGxldmVsIGNhcGFibGUgZGVjaWRlIHdoZXRoZXIgaXQgaXMKPiBzYWZlIHRvIG1pZ3JhdGlvbi9z
dXNwZW5kL3Jlc3VtZS9jaGVja3BvaW50IHRoZSBWTS4KPiAKPiBJZiBJIGhhdmUgdG8gd3JpdGUg
dGhlIHBhdGNoZXMgbXlzZWxmLCBJIHdpbGwsIGJ1dCB0aGlzIHBhdGNoIGluIHRoaXMKPiBmb3Jt
IGlzIGZyYW5rbHkgdW5hY2NlcHRhYmxlLgoKWW91J3JlIGtpZGRpbmcsIGFyZW4ndCB5b3U/IEJ5
IHRha2luZyBvbmx5IHBhcnQgb2YgUGF1bCdzIG9yaWdpbmFsCnBhdGNoLCB3ZSBzaG91bGQgYmUg
YWJsZSB0byBnZXQgcmlkIG9mIHR3byBvZiB0aGUgY3VycmVudCBvc3N0ZXN0CnJlcG9ydGVkIHJl
Z3Jlc3Npb25zLiBBdCB0aGUgc2FtZSB0aW1lIHRoaXMgX2RvZXMgbm90XyBleGNsdWRlIGFuCmlu
Y3JlbWVudGFsIHN1YnNlcXVlbnQgcGF0Y2ggdG8gYWxzbyBhZGQgdGhlIG90aGVyIGhhbGYgKHNl
ZSBteQpyZXBseSB0byBoaW0geWVzdGVyZGF5IHN1Z2dlc3RpbmcgdGhpcyBzcGxpdCkuIFRoZSB0
d28gc3RlcHMKc2hvdWxkbid0IGhhdmUgYmVlbiBtZXJnZWQgaW50byBhIHNpbmdsZSBwYXRjaCBh
bnl3YXkgaW1vOiBUaGUKcGFydCBoZXJlIGZpeGVzIGEgcmVncmVzc2lvbiwgd2hpbGUgdGhlIG90
aGVyIHBhcnQgY2hhbmdlcyBvcmlnaW5hbApiZWhhdmlvciwgYW5kIGNvbnRpbnVlcyB0byBiZSAo
aXJyZXNwZWN0aXZlIG9mIHlvdXIgd29yZGluZywgd2hpY2gKb25jZSBhZ2FpbiBzdWdnZXN0cyB0
aGF0IGluIGNlcnRhaW4gY2FzZXMgeW91IGFyZW4ndCB3aWxsaW5nIHRvCnRvbGVyYXRlIHRoaW5r
aW5nIHRoYXQncyBkaWZmZXJlbnQgZnJvbSB5b3VycykgY29udHJvdmVyc2lhbC4KCklmIGl0IGhl
bHBzLCBJIGNhbiBjaGFuZ2UgdGhlIHRpdGxlIChhbmQgcGVyaGFwcyBkZXNjcmlwdGlvbikgdG8K
bWFrZSBpdCBsb29rIGxlc3MgbGlrZSB0aGUgb3JpZ2luYWwgcGF0Y2gsIGFuZCB0byBwdXQgZm9j
dXMgb24gdGhlCnJlZ3Jlc3Npb24uIEkganVzdCBkaWRuJ3Qgd2FudCB0byBtYXNzYWdlIGl0IG1v
cmUgdGhhbiBhYnNvbHV0ZWx5Cm5lZWRlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
