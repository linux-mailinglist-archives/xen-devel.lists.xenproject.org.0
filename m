Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1A1886F5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:11:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jECtt-000392-St; Tue, 17 Mar 2020 14:08:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jECts-00038x-J2
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:08:56 +0000
X-Inumbo-ID: d665e9aa-6858-11ea-b949-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d665e9aa-6858-11ea-b949-12813bfff9fa;
 Tue, 17 Mar 2020 14:08:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F301AACA;
 Tue, 17 Mar 2020 14:08:54 +0000 (UTC)
To: Jason Andryuk <jandryuk@gmail.com>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
 <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
 <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
 <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea7f9b4c-10e4-67d1-6e55-6c317166e265@suse.com>
Date: Tue, 17 Mar 2020 15:08:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNDo0OCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBXZWQsIE1hciA0
LCAyMDIwIGF0IDExOjA2IEFNIEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDM6MjUgQU0gSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAxOC4wMi4yMDIwIDIyOjQ1LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IE9uIDE4LzAyLzIwMjAgMTg6NDMsIEphc29uIEFuZHJ5dWsg
d3JvdGU6Cj4+Pj4+IE9uIE1vbiwgRmViIDE3LCAyMDIwLCA4OjIyIFBNIEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gMTcvMDIvMjAyMCAy
MDo0MSwgSmFzb24gQW5kcnl1ayB3cm90ZToKPj4+Pj4+PiBPbiBNb24sIEZlYiAxNywgMjAyMCBh
dCAyOjQ2IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3Rl
Ogo+Pj4+Pj4+PiBXZSBoYXZlIG11bHRpcGxlIGJ1Z3MuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEZpcnN0
IGFuZCBmb3JlbW9zdCwgWGVuIHNlZW1zIHRvdGFsbHkgYnJva2VuIHdoZW4gcnVubmluZyBpbiBF
eHRJTlQKPj4+Pj4+Pj4gbW9kZS4gIFRoaXMgbmVlZHMgYWRkcmVzc2luZywgYW5kIG91Z2h0IHRv
IGJlIHN1ZmZpY2llbnQgdG8gbGV0IFhlbgo+Pj4+Pj4+PiBib290LCBhdCB3aGljaCBwb2ludCB3
ZSBjYW4gdHJ5IHRvIGZpZ3VyZSBvdXQgd2h5IGl0IGlzIHRyeWluZyB0byBmYWxsCj4+Pj4+Pj4+
IGJhY2sgaW50byA0ODYoaXNoKSBjb21wYXRpYmlsaXR5IG1vZGUuCj4+Pj4+IFhlbiBoYXMgImVu
YWJsZWQgRXh0SU5UIG9uIENQVSMwIiB3aGlsZSBsaW51eCBoYXMgIm1hc2tlZCBFeHRJTlQgb24K
Pj4+Pj4gQ1BVIzAiIHNvIGxpbnV4IGlzbid0IHVzaW5nIEV4dElOVD8KPj4+Pgo+Pj4+IEl0IHdv
dWxkIGFwcGVhciBub3QuICBFdmVuIG1vcmUgY29uY2VybmluZ2x5LCBvbiBteSBLYWJ5bGFrZSBi
b3gsCj4+Pj4KPj4+PiAjIHhsIGRtZXNnIHwgZ3JlcCBFeHRJTlQKPj4+PiAoWEVOKSBlbmFibGVk
IEV4dElOVCBvbiBDUFUjMAo+Pj4+IChYRU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzEKPj4+PiAo
WEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSMyCj4+Pj4gKFhFTikgbWFza2VkIEV4dElOVCBvbiBD
UFUjMwo+Pj4+IChYRU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzQKPj4+PiAoWEVOKSBtYXNrZWQg
RXh0SU5UIG9uIENQVSM1Cj4+Pj4gKFhFTikgbWFza2VkIEV4dElOVCBvbiBDUFUjNgo+Pj4+IChY
RU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzcKPj4+Pgo+Pj4+IHdoaWNoIGF0IGZpcnN0IGdsYW5j
ZSBzdWdnZXN0cyB0aGF0IHdlIGhhdmUgc29tZXRoaW5nIGFzeW1tZXRyaWMgYmVpbmcKPj4+PiBz
ZXQgdXAuCj4+Pgo+Pj4gVGhhdCdzIHBlcmZlY3RseSBub3JtYWwgLSBFeHRJTlQgbWF5IGJlIGVu
YWJsZWQgb24ganVzdCBvbmUgQ1BVLAo+Pj4gYW5kIHRoYXQncyBDUFUwIGluIG91ciBjYXNlICh1
bnRpbCBzdWNoIHRpbWUgdGhhdCB3ZSB3b3VsZCB3YW50Cj4+PiB0byBiZSBhYmxlIHRvIG9mZmxp
bmUgQ1BVMCkuCj4+Cj4+IFRoYW5rcywgSmFuLiAgTGludXggcHJpbnRzIG1hc2tlZCBFeHRJTlQg
Zm9yIGFsbCA4IENQVSB0aHJlYWRzLgo+Pgo+PiBJIGluc2VydGVkIF9fcHJpbnRfSU9fQVBJQygp
IGJlZm9yZSB0aGUgIklPLUFQSUMgKyB0aW1lciBkb2Vzbid0IHdvcmsiIHBhbmljLgo+Pgo+PiBV
c2luZyB2ZWN0b3ItYmFzZWQgaW5kZXhpbmcKPj4gSVJRIHRvIHBpbmcgbWFwcGluZ3M6Cj4+IElS
UTI0MCAtPiAwOjIKPj4KPj4gd2hlcmUgTGludXggcHJpbnRzCj4+IElSUTAgLT4gMDoyCj4+Cj4+
IFRoYXQgbWF5IGp1c3QgYmUgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBYZW4gcHJpbnRpbmcgdGhl
IFZlY3RvciB2cy4KPj4gTGludXggcHJpbnRpbmcgdGhlIElSUSBudW1iZXIuCj4+Cj4+IEFueSBw
b2ludGVycyB0byB3aGF0IEkgc2hvdWxkIGludmVzdGlnYXRlPwo+IAo+IEkgZ290IGl0IHRvIGJv
b3QgcGFzdCAiSU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29yayIuICBJIHByb2dyYW1tZWQKPiB0
aGUgSFBFVCB0byBwcm92aWRlIGEgcGVyaW9kaWMgdGltZXIgaW4gaHBldF9yZXN1bWUoKSBvbiBU
MC4gIFdoZW4gSQo+IGFjdHVhbGx5IGdvdCBpdCBwcm9ncmFtbWVkIHByb3Blcmx5LCBpdCB3b3Jr
ZWQgdG8gaW5jcmVtZW50Cj4gcGl0MF90aWNrcy4gIEkgYWxzbyBtYWRlIHRpbWVyX2ludGVycnVw
dCgpIHVuY29uZGl0aW9uYWxseQo+IHBpdDBfdGlja3MrKyB0aG91Z2ggdGhhdCBtYXkgbm90IG1h
dHRlci4KCkhtbSwgYXQgdGhlIGZpcnN0IGdsYW5jZSBJIHdvdWxkIGltcGx5IHRoZSBzeXN0ZW0g
Z2V0cyBoYW5kZWQgdG8gWGVuCndpdGggYSBIUEVUIHN0YXRlIHRoYXQgd2UgZG9uJ3QgKGFuZCBw
cm9iYWJseSBhbHNvIHNob3VsZG4ndCkgZXhwZWN0LgpDb3VsZCB5b3UgcHJvdmlkZSBIUEVUX0NG
RyBhcyB3ZWxsIGFzIGFsbCBIUEVUX1RuX0NGRyBhbmQKSFBFVF9Ubl9ST1VURSB2YWx1ZXMgYXMg
aHBldF9yZXN1bWUoKSBmaW5kcyB0aGVtIGJlZm9yZSBkb2luZyBhbnkKYWRqdXN0bWVudHMgdG8g
dGhlbT8gV2hhdCBhcmUgdGhlIGNvbXBvbmVudHMgLyBwYXJ0aWVzIGludm9sdmVkIGluCmdldHRp
bmcgWGVuIGxvYWRlZCBhbmQgc3RhcnRlZD8KCj4gTm93IGl0IHBhbmljcyBpbiBwdl9kZXN0cm95
X2dkdCgpIHdoZW4gaXQgZmFpbHMgIkFTU0VSVCh2ID09IGN1cnJlbnQKPiB8fCAhdmNwdV9jcHVf
ZGlydHkodikpOyIgd2hlbiBidWlsZGluZyBkb20wLiAgSSBoYXZlbid0IGludmVzdGlnYXRlZAo+
IHRoYXQgeWV0LgoKVGhpcyB3b3VsZCBzZWVtIGVudGlyZWx5IHVucmVsYXRlZCB0byBtZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
