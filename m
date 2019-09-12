Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD54B0B8D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 11:38:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8LUv-000891-Ee; Thu, 12 Sep 2019 09:34:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8LUu-00088w-7f
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 09:34:40 +0000
X-Inumbo-ID: 89e335de-d540-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89e335de-d540-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 09:34:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5FC1AEA5;
 Thu, 12 Sep 2019 09:34:36 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
Date: Thu, 12 Sep 2019 11:34:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 21/48] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTY6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEVzcGVjaWFsbHkgaW4gdGhlIGRvX3NjaGVkdWxl
KCkgZnVuY3Rpb25zIG9mIHRoZSBkaWZmZXJlbnQgc2NoZWR1bGVycwo+PiB1c2luZyBzbXBfcHJv
Y2Vzc29yX2lkKCkgZm9yIHRoZSBsb2NhbCBjcHUgbnVtYmVyIGlzIGNvcnJlY3Qgb25seSBpZgo+
PiB0aGUgc2NoZWRfdW5pdCBpcyBhIHNpbmdsZSB2Y3B1LiBBcyBzb29uIGFzIGxhcmdlciBzY2hl
ZF91bml0cyBhcmUKPj4gdXNlZCBtb3N0IHVzZXMgc2hvdWxkIGJlIHJlcGxhY2VkIGJ5IHRoZSBj
cHUgbnVtYmVyIG9mIHRoZSBsb2NhbAo+PiBzY2hlZF9yZXNvdXJjZSBpbnN0ZWFkLgo+IAo+IEkg
aGF2ZSB0byBhZG1pdCB0aGF0IEkgZG9uJ3QgZm9sbG93IHRoaXMgYXJndW1lbnQsIG5vdCB0aGUg
bGVhc3QgYmVjYXVzZQo+IChhcyBJIHRoaW5rIEkgaGFkIGluZGljYXRlZCBiZWZvcmUpIGl0IGlz
IHVuY2xlYXIgdG8gbWUgd2hhdCBfdGhlXyAoaS5lLgo+IHNpbmdsZSkgQ1BVIGZvciBhIHNjaGVk
IHVuaXQgaXMuIEkndmUgZ29uZSBiYWNrIHRvIHBhdGNoZXMgNCBhbmQgNwo+IHdpdGhvdXQgZmlu
ZGluZyB3aGF0IHRoZSBjb25jZXB0dWFsIG1vZGVsIGJlaGluZCB0aGlzIGlzIGludGVuZGVkIHRv
IGJlLgo+IEJlc2lkZXMgYW4gZXhwbGFuYXRpb24gSSB0aGluayBvbmUgb3IgYm90aCBvZiB0aG9z
ZSB0d28gcGF0Y2hlcyBhbHNvCj4gd2FudCB0byBiZSByZXZpc2l0ZWQgd3J0IHRoZSB1c2Ugb2Yg
dGhlIG5hbWUgInByb2Nlc3NvciIgZm9yIHRoZQo+IHJlc3BlY3RpdmUgZmllbGQuCgpGYWlyIHBv
aW50LiBOYW1pbmcgaXQgIm1hc3Rlcl9jcHUiIGluIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSBhbmQg
d2hlbgpyZWZlcmVuY2luZyBpdCBzZWVtcyB0byBiZSBhIGdvb2QgaWRlYS4KCj4gCj4+IC0tLSBh
L3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVk
aXQuYwo+PiBAQCAtMTY4NCw3ICsxNjg0LDcgQEAgY3NjaGVkX2xvYWRfYmFsYW5jZShzdHJ1Y3Qg
Y3NjaGVkX3ByaXZhdGUgKnBydiwgaW50IGNwdSwKPj4gICAgICAgaW50IHBlZXJfY3B1LCBmaXJz
dF9jcHUsIHBlZXJfbm9kZSwgYnN0ZXA7Cj4+ICAgICAgIGludCBub2RlID0gY3B1X3RvX25vZGUo
Y3B1KTsKPj4gICAKPj4gLSAgICBCVUdfT04oIGNwdSAhPSBzY2hlZF91bml0X2NwdShzbmV4dC0+
dW5pdCkgKTsKPj4gKyAgICBCVUdfT04oIHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoY3B1KSAhPSBz
Y2hlZF91bml0X2NwdShzbmV4dC0+dW5pdCkgKTsKPiAKPiBJbiBjYXNlcyBsaWtlIHRoaXMgb25l
LCB3b3VsZCB5b3UgbWluZCBkcm9wcGluZyB0aGUgc3RyYXkgYmxhbmtzCj4gaW1tZWRpYXRlbHkg
aW5zaWRlIHRoZSBwYXJlbnRoZXNlcz8KCldpbGwgZG8uCgo+IAo+PiBAQCAtMTgyNSw4ICsxODI1
LDkgQEAgc3RhdGljIHN0cnVjdCB0YXNrX3NsaWNlCj4+ICAgY3NjaGVkX3NjaGVkdWxlKAo+PiAg
ICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHNfdGltZV90IG5vdywgYm9vbF90IHRh
c2tsZXRfd29ya19zY2hlZHVsZWQpCj4+ICAgewo+PiAtICAgIGNvbnN0IGludCBjcHUgPSBzbXBf
cHJvY2Vzc29yX2lkKCk7Cj4+IC0gICAgc3RydWN0IGxpc3RfaGVhZCAqIGNvbnN0IHJ1bnEgPSBS
VU5RKGNwdSk7Cj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3Jf
aWQoKTsKPj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgc2NoZWRfY3B1ID0gc2NoZWRfZ2V0X3Jl
c291cmNlX2NwdShjcHUpOwo+PiArICAgIHN0cnVjdCBsaXN0X2hlYWQgKiBjb25zdCBydW5xID0g
UlVOUShzY2hlZF9jcHUpOwo+IAo+IEJ5IHJldGFpbmluZyBhIGxvY2FsIHZhcmlhYmxlIG5hbWVk
ICJjcHUiIHlvdSBtYWtlIGl0IGNsb3NlIHRvCj4gaW1wb3NzaWJsZSB0byBub3RpY2UsIGR1cmlu
ZyBhIHJlLWJhc2UsIGFuIGFkZGl0aW9uIHRvIHRoZQo+IGZ1bmN0aW9uIHN0aWxsIHJlZmVyZW5j
aW5nIGEgdmFyaWFibGUgb2YgdGhpcyBuYW1lLiBTaW1pbGFybHkKPiByZXZpZXcgaXMgYmVpbmcg
bWFkZSBoYXJkZXIgYmVjYXVzZSBvbmUgbmVlZHMgdG8gZ28gaHVudCBhbGwKPiB0aGUgcmVtYWlu
aW5nIHVzZXMgb2YgImNwdSIuIEZvciBleGFtcGxlIHRoZXJlIGEgdHJhY2UgZW50cnkKPiBiZWlu
ZyBnZW5lcmF0ZWQsIGFuZCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHdoZXRoZXIgdGhpcyB3b3Vs
ZG4ndAo+IGJldHRlciBhbHNvIHVzZWQgc2NoZWRfY3B1LgoKT2theXksIEknbGwgcmVuYW1lICJj
cHUiIHRvICJteV9jcHUiLgoKSSB1c2VkIGNwdSBpbiB0aGUgdHJhY2UgZW50cnkgb24gcHVycG9z
ZSwgYXMgaXQgbWlnaHQgYmUgaW50ZXJlc3Rpbmcgb24Kd2hpY2ggY3B1IHRoZSBlbnRyeSBoYXMg
YmVlbiBwcm9kdWNlZC4KCj4gCj4+IEBAIC0xOTY3LDcgKzE5NjgsNyBAQCBjc2NoZWRfc2NoZWR1
bGUoCj4+ICAgICAgIGlmICggc25leHQtPnByaSA+IENTQ0hFRF9QUklfVFNfT1ZFUiApCj4+ICAg
ICAgICAgICBfX3J1bnFfcmVtb3ZlKHNuZXh0KTsKPj4gICAgICAgZWxzZQo+PiAtICAgICAgICBz
bmV4dCA9IGNzY2hlZF9sb2FkX2JhbGFuY2UocHJ2LCBjcHUsIHNuZXh0LCAmcmV0Lm1pZ3JhdGVk
KTsKPj4gKyAgICAgICAgc25leHQgPSBjc2NoZWRfbG9hZF9iYWxhbmNlKHBydiwgc2NoZWRfY3B1
LCBzbmV4dCwgJnJldC5taWdyYXRlZCk7Cj4gCj4gQW5kIGluIGEgY2FzZSBsaWtlIHRoaXMgb25l
IEkgd29uZGVyIHdoZXRoZXIgcGFzc2luZyBhICJzb3J0IG9mCj4gQ1BVIiBpc24ndCBzdWZmaWNp
ZW50bHkgY29uZnVzaW5nLCBjb21wYXJlZCB0byBlLmcuIHNpbXBseQo+IHBhc3NpbmcgdGhlIGNv
cnJlc3BvbmRpbmcgdW5pdC4KCkkgZ3Vlc3MgeW91IG1lYW4gc2NoZWRfcmVzb3VyY2UuCgpJIGRv
bid0IHRoaW5rIGNoYW5naW5nIHRoZSBwYXJhbWV0ZXIgdHlwZSBpcyBhIGdvb2QgaWRlYS4gV2Ug
bmVlZCBib3RoCihyZXNvdXJjZSBhbmQgY3B1IG51bWJlcikgb24gY2FsbGVyIGFuZCBjYWxsZWUg
c2lkZSwgYnV0IHRoZSBtYWluCm9iamVjdCBjc2NoZWRfbG9hZF9iYWxhbmNlKCkgaXMgd29ya2lu
ZyBvbiBpcyB0aGUgY3B1IG51bWJlci4KCj4gCj4+IEBAIC0xOTc1LDEyICsxOTc2LDEyIEBAIGNz
Y2hlZF9zY2hlZHVsZSgKPj4gICAgICAgICovCj4+ICAgICAgIGlmICggIXRhc2tsZXRfd29ya19z
Y2hlZHVsZWQgJiYgc25leHQtPnByaSA9PSBDU0NIRURfUFJJX0lETEUgKQo+PiAgICAgICB7Cj4+
IC0gICAgICAgIGlmICggIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCBwcnYtPmlkbGVycykgKQo+PiAt
ICAgICAgICAgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgcHJ2LT5pZGxlcnMpOwo+PiArICAgICAg
ICBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KHNjaGVkX2NwdSwgcHJ2LT5pZGxlcnMpICkKPj4gKyAg
ICAgICAgICAgIGNwdW1hc2tfc2V0X2NwdShzY2hlZF9jcHUsIHBydi0+aWRsZXJzKTsKPj4gICAg
ICAgfQo+PiAtICAgIGVsc2UgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgcHJ2LT5pZGxlcnMp
ICkKPj4gKyAgICBlbHNlIGlmICggY3B1bWFza190ZXN0X2NwdShzY2hlZF9jcHUsIHBydi0+aWRs
ZXJzKSApCj4+ICAgICAgIHsKPj4gLSAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCBwcnYt
PmlkbGVycyk7Cj4+ICsgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KHNjaGVkX2NwdSwgcHJ2LT5p
ZGxlcnMpOwo+PiAgICAgICB9Cj4gCj4gQW5kIHRoaXMgbG9va3MgdG8gYmUgYSBwcmV0dHkgZ3Jv
c3MgYWJ1c2Ugb2YgQ1BVIG1hc2tzIHRoZW4uCj4gKE5ldmVydGhlbGVzcyBJIGNhbiBzZWUgdGhh
dCB1c2luZyBhIENQVSBhcyBhIHZlaGljbGUgaGVyZSBpcwo+IGhlbHBmdWwgdG8gbGltaXQgdGhl
IHNjb3BlIG9mIHRoZSBhbHJlYWR5IGxvbmcgc2VyaWVzLCBidXQgSQo+IHRoaW5rIGl0IG5lZWRz
IHRvIGJlIG1hZGUgbXVjaCBtb3JlIGFwcGFyZW50IHdoYXQgaXMgbWVhbnQuKQoKSSBkb24ndCB0
aGluayBpdCBpcyBhbiBhYnVzZS4gVGhpbmsgb2YgaXQgYXMgYSBjcHVtYXNrIHdoZXJlIG9ubHkK
dGhlIGJpdHMgcmVsYXRlZCB0byB0aGUgcmVzb3VyY2UncyBtYXN0ZXJfY3B1cyBjYW4gYmUgc2V0
LgoKPiAKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwo+PiBAQCAtMTEyLDcgKzExMiw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGlj
ZSBzY2hlZF9pZGxlX3NjaGVkdWxlKAo+PiAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3B1ID0g
c21wX3Byb2Nlc3Nvcl9pZCgpOwo+PiAgICAgICBzdHJ1Y3QgdGFza19zbGljZSByZXQgPSB7IC50
aW1lID0gLTEgfTsKPj4gICAKPj4gLSAgICByZXQudGFzayA9IHNjaGVkX2lkbGVfdW5pdChjcHUp
Owo+PiArICAgIHJldC50YXNrID0gc2NoZWRfaWRsZV91bml0KHNjaGVkX2dldF9yZXNvdXJjZV9j
cHUoY3B1KSk7Cj4gCj4gU2hvdWxkbid0IHNjaGVkX2lkbGVfdW5pdChjcHUpID09IHNjaGVkX2lk
bGVfdW5pdChzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSkpCj4gaGVyZT8KClllcy4KCgpKdWVy
Z2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
