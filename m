Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B9163F01
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 09:28:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Kfy-0001ZX-Bv; Wed, 19 Feb 2020 08:25:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Kfw-0001ZS-I8
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 08:25:44 +0000
X-Inumbo-ID: 6b8913e0-52f1-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b8913e0-52f1-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 08:25:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6402AAF1;
 Wed, 19 Feb 2020 08:25:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
Date: Wed, 19 Feb 2020 09:25:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Aaron Janse <aaron@ajanse.me>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAyMCAyMjo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMi8yMDIw
IDE4OjQzLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+PiBPbiBNb24sIEZlYiAxNywgMjAyMCwgODoy
MiBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+
IE9uIDE3LzAyLzIwMjAgMjA6NDEsIEphc29uIEFuZHJ5dWsgd3JvdGU6Cj4+Pj4gT24gTW9uLCBG
ZWIgMTcsIDIwMjAgYXQgMjo0NiBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPiB3cm90ZToKPj4+Pj4gT24gMTcvMDIvMjAyMCAxOToxOSwgSmFzb24gQW5kcnl1ayB3
cm90ZToKPj4+Pj4+IGVuYWJsaW5nIHZlY09uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDU6NDMgQU0g
QWFyb24gSmFuc2UgPGFhcm9uQGFqYW5zZS5tZT4gd3JvdGU6Cj4+Pj4+Pj4gT24gVHVlLCBEZWMg
MzEsIDIwMTksIGF0IDEyOjI3IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4+PiBJcyB0
aGVyZSBhbnkgZnVsbCBib290IGxvZyBpbiB0aGUgYmFkIGNhc2U/ICBEZWJ1Z2dpbmcgdmlhIGRp
dmluYXRpb24KPj4+Pj4+Pj4gaXNuJ3QgYW4gZWZmZWN0aXZlIHdheSB0byBnZXQgdGhpbmdzIGRv
bmUuCj4+Pj4+Pj4gQWdyZWVkLiBJIGluY2x1ZGVkIHNvbWUgbW9yZSB2ZXJib3NlIGxvZ3MgdG93
YXJkcyB0aGUgZW5kIG9mIHRoZSBlbWFpbCAodHlwZWQgdXAgYnkgaGFuZCkuCj4+Pj4+Pj4KPj4+
Pj4+PiBBdHRhY2hlZCBhcmUgcGljdHVyZXMgZnJvbSBhIHNsb3ctbW90aW9uIHZpZGVvIG9mIG15
IGxhcHRvcCBib290aW5nLiBOb3RlIHRoYXQgSSBhbHNvIGluY2x1ZGVkIGEgcGljdHVyZSBvZiBh
IHN0YWNrIHRyYWNlIHRoYXQgaGFwcGVucyBpbW1lZGlhdGVseSBiZWZvcmUgcmVib290LiBJdCBk
b2Vzbid0IGxvb2sgcmVsYXRlZCwgYnV0IEkgd2FudGVkIHRvIGluY2x1ZGUgaXQgYW55d2F5Lgo+
Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayB0aGUgb3JpZ2luYWwgZW1haWwgc2hvdWxkIGhhdmUgc2Fp
ZCAiNC44LjUiIGluc3RlYWQgb2YgIjQuMC41LiIgUmVnYXJkbGVzcywgZXZlcnlvbmUgb24gdGhp
cyBtYWlsaW5nIGxpc3QgY2FuIG5vdyBzZWUgYWxsIHRoZSBib290IGxvZ3MgdGhhdCBJJ3ZlIHNl
ZW4uCj4+Pj4+Pj4KPj4+Pj4+PiBBdHRhY2hpbmcgYSBzZXJpYWwgY29uc29sZSBzZWVtcyBsaWtl
IGl0IHdvdWxkIGJlIGRpZmZpY3VsdCB0byBkbyBvbiB0aGlzIGxhcHRvcCwgb3RoZXJ3aXNlIEkg
d291bGQgaGF2ZSBzZW50IHRoZSBsb2dzIGFzIGEgdHh0IGZpbGUuCj4+Pj4+PiBJJ20gc2VlaW5n
IFhlbiBwYW5pYzogIklPLUFQSUMgKyB0aW1lciBkb2Vzbid0IHdvcmsiIG9uIGEgRGVsbAo+Pj4+
Pj4gTGF0aXR1ZGUgNzIwMCAyLWluLTEuICBGZWRvcmEgMzEgTGl2ZSBVU0IgaW1hZ2UgYm9vdHMg
c3VjY2Vzc2Z1bGx5Lgo+Pj4+Pj4gTm8gd2F5IHRvIGdldCBzZXJpYWwgb3V0cHV0LiAgSSBtYW51
YWxseSByZWNyZWF0ZWQgdGhlIG91dHB1dCBiZWZvcmUKPj4+Pj4+IGZyb20gdGhlIHZnYSBkaXNw
bGF5Lgo+Pj4+PiBXZSBoYXZlIG11bHRpcGxlIGJ1Z3MuCj4+Pj4+Cj4+Pj4+IEZpcnN0IGFuZCBm
b3JlbW9zdCwgWGVuIHNlZW1zIHRvdGFsbHkgYnJva2VuIHdoZW4gcnVubmluZyBpbiBFeHRJTlQK
Pj4+Pj4gbW9kZS4gIFRoaXMgbmVlZHMgYWRkcmVzc2luZywgYW5kIG91Z2h0IHRvIGJlIHN1ZmZp
Y2llbnQgdG8gbGV0IFhlbgo+Pj4+PiBib290LCBhdCB3aGljaCBwb2ludCB3ZSBjYW4gdHJ5IHRv
IGZpZ3VyZSBvdXQgd2h5IGl0IGlzIHRyeWluZyB0byBmYWxsCj4+Pj4+IGJhY2sgaW50byA0ODYo
aXNoKSBjb21wYXRpYmlsaXR5IG1vZGUuCj4+IFhlbiBoYXMgImVuYWJsZWQgRXh0SU5UIG9uIENQ
VSMwIiB3aGlsZSBsaW51eCBoYXMgIm1hc2tlZCBFeHRJTlQgb24KPj4gQ1BVIzAiIHNvIGxpbnV4
IGlzbid0IHVzaW5nIEV4dElOVD8KPiAKPiBJdCB3b3VsZCBhcHBlYXIgbm90LsKgIEV2ZW4gbW9y
ZSBjb25jZXJuaW5nbHksIG9uIG15IEthYnlsYWtlIGJveCwKPiAKPiAjIHhsIGRtZXNnIHwgZ3Jl
cCBFeHRJTlQKPiAoWEVOKSBlbmFibGVkIEV4dElOVCBvbiBDUFUjMAo+IChYRU4pIG1hc2tlZCBF
eHRJTlQgb24gQ1BVIzEKPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSMyCj4gKFhFTikgbWFz
a2VkIEV4dElOVCBvbiBDUFUjMwo+IChYRU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzQKPiAoWEVO
KSBtYXNrZWQgRXh0SU5UIG9uIENQVSM1Cj4gKFhFTikgbWFza2VkIEV4dElOVCBvbiBDUFUjNgo+
IChYRU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzcKPiAKPiB3aGljaCBhdCBmaXJzdCBnbGFuY2Ug
c3VnZ2VzdHMgdGhhdCB3ZSBoYXZlIHNvbWV0aGluZyBhc3ltbWV0cmljIGJlaW5nCj4gc2V0IHVw
LgoKVGhhdCdzIHBlcmZlY3RseSBub3JtYWwgLSBFeHRJTlQgbWF5IGJlIGVuYWJsZWQgb24ganVz
dCBvbmUgQ1BVLAphbmQgdGhhdCdzIENQVTAgaW4gb3VyIGNhc2UgKHVudGlsIHN1Y2ggdGltZSB0
aGF0IHdlIHdvdWxkIHdhbnQKdG8gYmUgYWJsZSB0byBvZmZsaW5lIENQVTApLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
