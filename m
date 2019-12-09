Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE0116F16
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:38:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieK93-0000tD-QN; Mon, 09 Dec 2019 14:36:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieK91-0000t8-UW
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:36:15 +0000
X-Inumbo-ID: 40c9d862-1a91-11ea-87e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40c9d862-1a91-11ea-87e6-12813bfff9fa;
 Mon, 09 Dec 2019 14:36:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5ED21AAD0;
 Mon,  9 Dec 2019 14:36:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-5-roger.pau@citrix.com>
 <d6db8dfa-0b47-6f19-fb1a-e7a3bf7ee3df@suse.com>
 <20191209105610.GQ980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5fe68a27-35a9-4d32-3e17-a4164150719a@suse.com>
Date: Mon, 9 Dec 2019 15:36:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209105610.GQ980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/4] x86/apic: allow enabling x2APIC mode
 regardless of interrupt remapping
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIERl
YyAwNSwgMjAxOSBhdCAxMDo0NTo1OUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gKyAgICAgICAgc3dp
dGNoICggaW9tbXVfZW5hYmxlX3gyYXBpYygpICkKPj4+ICAgICAgICAgIHsKPj4+ICsgICAgICAg
IGNhc2UgMDoKPj4+ICsgICAgICAgICAgICBpb21tdV94MmFwaWNfZW5hYmxlZCA9IHRydWU7Cj4+
PiArICAgICAgICAgICAgYnJlYWs7Cj4+PiArCj4+PiArICAgICAgICBjYXNlIC1FTlhJTzogLyog
QUNQSV9ETUFSX1gyQVBJQ19PUFRfT1VUIHNldCAqLwo+Pj4gKyAgICAgICAgICAgIGlmICggeDJh
cGljX2VuYWJsZWQgKQo+Pj4gKyAgICAgICAgICAgICAgICBwYW5pYygiSU9NTVUgcmVxdWVzdHMg
eEFQSUMgbW9kZSwgYnV0IHgyQVBJQyBhbHJlYWR5IGVuYWJsZWQgYnkgZmlybXdhcmVcbiIpOwo+
Pj4gKwo+Pj4gICAgICAgICAgICAgIHByaW50aygiTm90IGVuYWJsaW5nIHgyQVBJQyAodXBvbiBm
aXJtd2FyZSByZXF1ZXN0KVxuIik7Cj4+PiAtICAgICAgICAgICAgaW50cmVtYXBfZW5hYmxlZCA9
IGZhbHNlOwo+Pj4gKyAgICAgICAgICAgIGlvbW11X3gyYXBpY19lbmFibGVkID0gZmFsc2U7Cj4+
PiAgICAgICAgICAgICAgZ290byByZXN0b3JlX291dDsKPj4+ICsKPj4+ICsgICAgICAgIGRlZmF1
bHQ6Cj4+PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkZhaWxlZCB0byBlbmFibGUg
SW50ZXJydXB0IFJlbWFwcGluZ1xuIik7Cj4+PiArICAgICAgICAgICAgaW9tbXVfeDJhcGljX2Vu
YWJsZWQgPSBmYWxzZTsKPj4+ICsgICAgICAgICAgICBicmVhazsKPj4KPj4gSSBndWVzcyB5b3Ug
c3RpbGwgbmVlZCB0byBwYW5pYygpIGluIHRoZSBmYWlsdXJlIGNhc2VzIGlmIHgyYXBpY19waHlz
Cj4+IGlzIGZhbHNlLiBVbmxlc3MgeW91IGNhbiBzdGlsbCBwcm9wZXJseSBzd2l0Y2ggZnJvbSBj
bHVzdGVyIHRvCj4+IHBoeXNpY2FsIG1vZGUgYXQgdGhpcyBwb2ludCBpbiB0aW1lLiAoSWYgeW91
IGdvIHRoZSBwYW5pYygpIHJvdXRlLAo+PiBJJ2QgYXBwcmVjaWF0ZSBpZiB5b3UgY291bGQgYXZv
aWQgbWFraW5nIHgyYXBpY19waHlzIG5vbi1zdGF0aWMuKQo+IAo+IEkgZG9uJ3QgdGhpbmsgWGVu
IG5lZWRzIHRvIGNoZWNrIHgyYXBpY19waHlzIG9yIHBhbmljIGhlcmUsIHRoZSB4MmFwaWMKPiBw
cm9iZSB0aGF0IHNlbGVjdHMgcGh5cyBvciBjbHVzdGVyIG1vZGUgaXMgZG9uZSBhZnRlcndhcmRz
IGluCj4gYXBpY194MmFwaWNfcHJvYmUsIHdoaWNoIGlzIGNhbGxlZCBhZnRlciB0aGUgYXR0ZW1w
dCB0byBlbmFibGUKPiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGFuZCBoZW5jZSB3aWxsIHRha2UgdGhp
cyByZXN1bHQgaW50byBhY2NvdW50LgoKT2ggaW5kZWVkLCB5b3UncmUgcmlnaHQuCgo+Pj4gQEAg
LTkzOCwxMyArOTMxLDE2IEBAIHZvaWQgX19pbml0IHgyYXBpY19ic3Bfc2V0dXAodm9pZCkKPj4+
ICAgICAgICAgIHByaW50aygiU3dpdGNoZWQgdG8gQVBJQyBkcml2ZXIgJXNcbiIsIGdlbmFwaWMu
bmFtZSk7Cj4+PiAgCj4+PiAgcmVzdG9yZV9vdXQ6Cj4+PiAtICAgIC8qCj4+PiAtICAgICAqIE5C
OiBkbyBub3QgdXNlIHJhdyBtb2RlIHdoZW4gcmVzdG9yaW5nIGVudHJpZXMgaWYgdGhlIGlvbW11
IGhhcyBiZWVuCj4+PiAtICAgICAqIGVuYWJsZWQgZHVyaW5nIHRoZSBwcm9jZXNzLCBiZWNhdXNl
IHRoZSBlbnRyaWVzIG5lZWQgdG8gYmUgdHJhbnNsYXRlZAo+Pj4gLSAgICAgKiBhbmQgYWRkZWQg
dG8gdGhlIHJlbWFwcGluZyB0YWJsZSBpbiB0aGF0IGNhc2UuCj4+PiAtICAgICAqLwo+Pj4gLSAg
ICByZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGljX2VudHJpZXMsICFpbnRyZW1hcF9lbmFibGVk
KTsKPj4+IC0gICAgdW5tYXNrXzgyNTlBKCk7Cj4+PiArICAgIGlmICggaW9tbXVfc3VwcG9ydHNf
eDJhcGljKCkgKQo+Pgo+PiBIbW0sIEkgZmlyc3Qgd2FudGVkIHRvIHN1Z2dlc3QgdG8gdXNlIGlv
bW11X3gyYXBpY19lbmFibGVkIGhlcmUsIGJ1dAo+PiBJIHJlYWxpemUgdGhlIGVycm9yIGNhc2Vz
IGFib3ZlIHdvdWxkIHRoZW4gYmUgd3JvbmcuIFBlcmhhcHMgYmV0dGVyCj4+IHRvIGxlYXZlIGEg
YnJpZWYgY29tbWVudCB0byB0aGlzIGVmZmVjdD8KPiAKPiBBY2ssIHdvdWxkIHlvdSBiZSBmaW5l
IHdpdGg6Cj4gCj4gIk5vdGUgdGhhdCBpb21tdV94MmFwaWNfZW5hYmxlZCBjYW5ub3QgYmUgdXNl
ZCBoZXJlIGJlY2F1c2UgaWYgdGhlCj4gSU9NTVUgc3VwcG9ydHMgeDJBUElDIGJ1dCBlbmFibGlu
ZyBmYWlsZWQgWGVuIHdvdWxkbid0IHJlc3RvcmUgdGhlCj4gSU8tQVBJQyBhbmQgdGhlIDgyNTlB
IHN0YXRlIGNvcnJlY3RseS4iCgpUaGlzIG9yIGV2ZW4gbW9yZSBicmllZmx5ICJpb21tdV94MmFw
aWNfZW5hYmxlZCBjYW5ub3QgYmUgdXNlZCBoZXJlCmluIHRoZSBlcnJvciBjYXNlIi4gV2l0aCB0
aGlzICh3aGljaCBvbmNlIGFnYWluIGNvdWxkIGJlIGRvbmUgd2hpbGUKY29tbWl0dGluZykKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
