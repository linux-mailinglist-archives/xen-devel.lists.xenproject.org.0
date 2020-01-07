Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A921321E6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 10:08:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iokoa-0004ej-8J; Tue, 07 Jan 2020 09:06:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iokoY-0004ec-Mj
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 09:06:14 +0000
X-Inumbo-ID: e8f7986a-312c-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8f7986a-312c-11ea-88e7-bc764e2007e4;
 Tue, 07 Jan 2020 09:05:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3FCB4AC8F;
 Tue,  7 Jan 2020 09:05:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200103200742.23917-1-andrew.cooper3@citrix.com>
 <a6781391-e3f0-7ff1-ccdf-bdb6f41e9408@suse.com>
 <787ed96f-c700-ba89-b91d-99e210847422@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <692a87e5-ef69-672b-b642-6fff8fc12dfa@suse.com>
Date: Tue, 7 Jan 2020 10:05:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <787ed96f-c700-ba89-b91d-99e210847422@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shim: Short circuit control/hardware
 checks in PV_SHIM_EXCLUSIVE builds
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxODoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDEwOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDEuMjAyMCAyMTowNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+Pj4gQEAgLTk2MywxMCArOTYzLDIyIEBAIHZvaWQg
d2F0Y2hkb2dfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7Cj4+PiAgICogICAgKHRo
YXQgaXMsIHRoaXMgd291bGQgbm90IGJlIHN1aXRhYmxlIGZvciBhIGRyaXZlciBkb21haW4pCj4+
PiAgICogIC0gVGhlcmUgaXMgbmV2ZXIgYSByZWFzb24gdG8gZGVueSB0aGUgaGFyZHdhcmUgZG9t
YWluIGFjY2VzcyB0byB0aGlzCj4+PiAgICovCj4+PiAtI2RlZmluZSBpc19oYXJkd2FyZV9kb21h
aW4oX2QpIGV2YWx1YXRlX25vc3BlYygoX2QpID09IGhhcmR3YXJlX2RvbWFpbikKPj4+ICtzdGF0
aWMgYWx3YXlzX2lubGluZSBib29sIGlzX2hhcmR3YXJlX2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQo+Pj4gK3sKPj4+ICsgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19QVl9TSElNX0VY
Q0xVU0lWRSkgKQo+Pj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4gKwo+Pj4gKyAgICByZXR1
cm4gZXZhbHVhdGVfbm9zcGVjKGQgPT0gaGFyZHdhcmVfZG9tYWluKTsKPj4+ICt9Cj4+PiAgCj4+
PiAgLyogVGhpcyBjaGVjayBpcyBmb3IgZnVuY3Rpb25hbGl0eSBzcGVjaWZpYyB0byBhIGNvbnRy
b2wgZG9tYWluICovCj4+PiAtI2RlZmluZSBpc19jb250cm9sX2RvbWFpbihfZCkgZXZhbHVhdGVf
bm9zcGVjKChfZCktPmlzX3ByaXZpbGVnZWQpCj4+PiArc3RhdGljIGFsd2F5c19pbmxpbmUgYm9v
bCBpc19jb250cm9sX2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+Pj4gK3sKPj4+ICsg
ICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRSkgKQo+Pj4gKyAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gZXZhbHVhdGVfbm9zcGVjKGQt
PmlzX3ByaXZpbGVnZWQpOwo+Pj4gK30KPj4gQmVzaWRlcyBpdHMgaW50ZW5kZWQgcHVycG9zZSB0
aGlzIGFsc28gZml4ZXMgKGJ1dCBvbmx5IGZvciB0aGUKPj4gc2hpbS1leGNsdXNpdmUgY2FzZSkg
YW4gaW50ZXJhY3Rpb24gaXNzdWUgd2l0aCBMQVRFX0hXRE9NOiBJZiBpbgo+PiBzaGltIG1vZGUg
dGhlICJoYXJkd2FyZV9kb209MSIgY29tbWFuZCBsaW5lIG9wdGlvbiB3YXMgdXNlZCwKPj4gbWlz
YmVoYXZpb3Igd291bGQgcmVzdWx0IGFmYWljdC4KPiAKPiBQZXJoYXBzLCBidXQgdGhlcmUgYXJl
IHBsZW50eSBvZiBvdGhlciB3YXlzIHRvIGJyZWFrIHRoaW5ncyB1c2luZyB0aGUKPiBzaGltcyBj
b21tYW5kIGxpbmUuCj4gCj4gUmVtZW1iZXIgdGhhdCB0aGUgc2hpbSBjb21tYW5kIGxpbmUgaXMg
bm90IHVuZGVyIHVzZXIgY29udHJvbCBhdCBhbGwuCj4gCj4+IFRoZXJlZm9yZSBJIHRoaW5rIHRo
aXMgd2FudHMKPj4gYW1lbmRpbmcgd2l0aCBhZGp1c3RtZW50cyB0byBhbHNvIG1ha2UgdGhlICFQ
Vl9TSElNX0VYQ0xVU0lWRQo+PiBjYXNlIHdvcmsgY29ycmVjdGx5IChyZWFkOiBpZ25vcmUgdGhh
dCBjb21tYW5kIGxpbmUgb3B0aW9uKS4gSQo+PiBndWVzcyBhZGRpdGlvbmFsbHkgTEFURV9IV0RP
TSBzaG91bGQgYWxzbyBkZXBlbmQgb24KPj4gIVBWX1NISU1fRVhDTFVTSVZFIChhbmQvb3Igdmlj
ZSB2ZXJzYSkuCj4gCj4gTm8gLSBzdWNoIGEgYnVnZml4IHNob3VsZCBiZSBhIHNlcGFyYXRlIGNo
YW5nZSwgYmVjYXVzZSBpdCBpcyBub3QKPiByZWxhdGVkIHRvIHRoaXMgcGF0Y2guCj4gCj4gRml4
aW5nIGl0IHdvdWxkIHJlcXVpcmUgZXh0cmEgeDg2ICNpZmRlZi1hcnkgaW4gY29tbW9uIGNvZGUu
wqAgV2hpbGUgdGhpcwo+IGlzIGRvYWJsZSwgdGhlcmUgaXMgYWxzbyB3b3JrIGluIHByb2dyZXNz
IGZyb20gdGhlIE9wZW5YVCBmb2xrIHRvCj4gY29tcGxldGVseSBvdmVyaGF1bCBob3cgdGhhdCBt
ZWNoYW5pc20gd29ya3MgKHdoaWNoIHdpbGwgaW4gcHJhY3RpY2UKPiByZW1vdmUgdGhlIGNvbW1h
bmQgbGluZSBwYXJhbWV0ZXIpLgo+IAo+IEdpdmVuIGJvdGggb2YgdGhlc2UgYXNwZWN0cywgSSdt
IHRlbXB0ZWQgdG8gbGVhdmUgaXQgYXMtaXMgZm9yIG5vdy4KCk9rYXksIHlldCBtYXkgSSBhc2sg
dGhhdCB5b3UgbWVudGlvbiB0aGUgcGFydGlhbCBidWcgZml4IGluIHRoZQpkZXNjcmlwdGlvbj8K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
