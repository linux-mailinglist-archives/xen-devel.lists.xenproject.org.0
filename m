Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38702132AF7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:19:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorXO-0004jW-Sj; Tue, 07 Jan 2020 16:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iorXN-0004jR-M3
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:16:57 +0000
X-Inumbo-ID: 1abb5e18-3169-11ea-b836-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1abb5e18-3169-11ea-b836-bc764e2007e4;
 Tue, 07 Jan 2020 16:16:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B333ACD5;
 Tue,  7 Jan 2020 16:16:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
Date: Tue, 7 Jan 2020 17:16:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106155423.9508-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbmVlZCBmb3Ig
WGVuIHRvIGJlIGlkZW50aXR5IG1hcHBlZCBpbnRvIHRoZSBib290bWFwIGlzIG5vdCBvYnZpb3Vz
LCBhbmQKPiBkaWZmZXJzIGJldHdlZW4gdGhlIE1CIGFuZCBFRkkgYm9vdCBwYXRocy4gIEZ1cnRo
ZXJtb3JlLCB0aGUgRUZJIHNpZGUgaXMKPiBmdXJ0aGVyIGNvbXBsaWNhdGVkIGJ5IHNwcmF5aW5n
IG5vbi1pZGVudGl0eSBhbGlhc2VzIGludG8gdGhlIG1peC4KCldoYXQgKGludGVudGlvbmFsKSBh
bGlhc2VzIGFyZSB5b3UgdGFsa2luZyBhYm91dD8gVGhlIGNoYW5nZXMgZG9uZSBoZXJlCmRvbid0
IHJlbW92ZSBhbnkuIE9yIGRvIHlvdSBtZWFuIHRoZSBvbmVzIG9jY3VycmluZyBhcyBhIHNpZGUg
ZWZmZWN0IG9mCnBvc3NpYmx5IHVzaW5nIHRoZSBzYW1lIEwyIGluIHR3byBMMyBzbG90cz8KCj4g
U2ltcGxpZnkgdGhlIEVGSSBib290bWFwIGNvbnN0cnVjdGlvbiBjb2RlIHRvIG1ha2UgZXhhY3Rs
eSBvbmUgaWRlbnRpdHktbWFwIG9mCj4gWGVuLCB3aGljaCBub3cgbWF0Y2hlcyB0aGUgTUIgcGF0
aC4gIENvbW1lbnQgYm90aCBwaWVjZXMgb2YgbG9naWMsIGV4cGxhaW5pbmcKPiB3aGF0IHRoZSBt
YXBwaW5ncyBhcmUgbmVlZGVkIGZvci4KCklzIGJvdGggYm9vdCBtYXAgdmFyaWFudHMgZnVsbHkg
bWF0Y2hpbmcgYWN0dWFsbHkgbmVlZGVkIGZvciBhbnl0aGluZz8KCj4gLS0tIGEveGVuL2FyY2gv
eDg2L2VmaS9lZmktYm9vdC5oCj4gKysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCj4g
QEAgLTU4NCwyMSArNTg0LDI0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9tZW1vcnlf
c2V0dXAodm9pZCkKPiAgICAgIGlmICggIWVmaV9lbmFibGVkKEVGSV9MT0FERVIpICkKPiAgICAg
ICAgICByZXR1cm47Cj4gIAo+IC0gICAgLyogSW5pdGlhbGlzZSBMMiBpZGVudGl0eS1tYXAgYW5k
IGJvb3QtbWFwIHBhZ2UgdGFibGUgZW50cmllcyAoMTZNQikuICovCj4gKyAgICAvKgo+ICsgICAg
ICogTWFwIFhlbiBpbnRvIHRoZSBkaXJlY3RtYXAgKE5YLCBuZWVkZWQgZm9yIGVhcmx5LWJvb3Qg
cGFnZXRhYmxlCj4gKyAgICAgKiBoYW5kbGluZy93YWxraW5nKSwgYW5kIGlkZW50aXR5IG1hcCBY
ZW4gaW50byBib290bWFwIChYLCBuZWVkZWQgZm9yIHRoZQo+ICsgICAgICogdHJhbnNpdGlvbiBm
cm9tIHRoZSBFRkkgcGFnZXRhYmxlcyB0byBYZW4pLCB1c2luZyAyTSBzdXBlcnBhZ2VzLgo+ICsg
ICAgICovCgpIb3cgZG9lcyBOWCB2cyBYIG1hdHRlciBmb3IgdGhlIGNvZGUgYmVsb3cgaGVyZT8g
UEFHRV9IWVBFUlZJU09SIGFuZApfX1BBR0VfSFlQRVJWSVNPUiwgYXMgdXNlZCBiZWxvdywgZGlm
ZmVyIGJ5IGp1c3QgX1BBR0VfR0xPQkFMLiBEaWQKeW91IG1lYW4gdG8gbWFrZSBmdXJ0aGVyIGNo
YW5nZXM/Cgo+ICAgICAgZm9yICggaSA9IDA7IGkgPCA4OyArK2kgKQo+ICAgICAgewo+ICAgICAg
ICAgIHVuc2lnbmVkIGludCBzbG90ID0gKHhlbl9waHlzX3N0YXJ0ID4+IEwyX1BBR0VUQUJMRV9T
SElGVCkgKyBpOwo+ICAgICAgICAgIHBhZGRyX3QgYWRkciA9IHNsb3QgPDwgTDJfUEFHRVRBQkxF
X1NISUZUOwo+ICAKPiAgICAgICAgICBsMl9pZGVudG1hcFtzbG90XSA9IGwyZV9mcm9tX3BhZGRy
KGFkZHIsIFBBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpOwo+IC0gICAgICAgIHNsb3QgJj0gTDJf
UEFHRVRBQkxFX0VOVFJJRVMgLSAxOwo+ICAgICAgICAgIGwyX2Jvb3RtYXBbc2xvdF0gPSBsMmVf
ZnJvbV9wYWRkcihhZGRyLCBfX1BBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpOwo+ICAgICAgfQo+
IC0gICAgLyogSW5pdGlhbGlzZSBMMyBib290LW1hcCBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzLiAq
Lwo+IC0gICAgbDNfYm9vdG1hcFtsM190YWJsZV9vZmZzZXQoeGVuX3BoeXNfc3RhcnQpXSA9Cj4g
LSAgICAgICAgbDNlX2Zyb21fcGFkZHIoKFVJTlROKWwyX2Jvb3RtYXAsIF9fUEFHRV9IWVBFUlZJ
U09SKTsKPiAtICAgIGwzX2Jvb3RtYXBbbDNfdGFibGVfb2Zmc2V0KHhlbl9waHlzX3N0YXJ0ICsg
KDggPDwgTDJfUEFHRVRBQkxFX1NISUZUKSAtIDEpXSA9Cj4gLSAgICAgICAgbDNlX2Zyb21fcGFk
ZHIoKFVJTlROKWwyX2Jvb3RtYXAsIF9fUEFHRV9IWVBFUlZJU09SKTsKPiArCj4gKyAgICAvKiBJ
bml0aWFsaXplIEwzIGJvb3QtbWFwIHBhZ2UgZGlyZWN0b3J5IGVudHJpZXMuICovCj4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IDQ7ICsraSApCj4gKyAgICAgICAgbDNfYm9vdG1hcFtpXSA9IGwzZV9m
cm9tX3BhZGRyKChVSU5UTilsMl9ib290bWFwICsgaSAqIFBBR0VfU0laRSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1IpOwoKVGhlIGlk
ZWEgYmVoaW5kIHRoZSBvcmlnaW5hbCBjb2RlIHdhcyB0byBiZSBpbW11bmUgdG8gdGhlIG51bWJl
cgpvZiBwYWdlcyBsMl9ib290bWFwW10gY292ZXJzLCBhcyBsb25nIGFzIGl0J3MgYXQgbGVhc3Qg
b25lICh3aGljaAppdCdsbCBhbHdheXMgYmUsIEkgd291bGQgc2F5KS4gVGhlIG1pbmltdW0gcmVx
dWlyZW1lbnQgdG8gYW55CmNoYW5nZSB0byB0aGlzIEkgaGF2ZSBpcyB0aGF0IHRoZSBidWlsZCBt
dXN0IGJyZWFrIGlmIHRoZSBzaXplCmFzc3VtcHRpb24gaGVyZSBpcyB2aW9sYXRlZC4gSS5lLiB0
aGVyZSBtYXkgbm90IGJlIGEgbGl0ZXJhbCA0IGFzCnRoZSB1cHBlciBsb29wIGJvdW5kIGhlcmUs
IG9yIHRoZXJlIHdvdWxkIG5lZWQgdG8gYmUgYQpCVUlMRF9CVUdfT04oKSByaWdodCBuZXh0IHRv
IGl0LiBCdXQgSSdkIHJlYWxseSBwcmVmZXIgaWYgdGhlCmNvZGUgd2FzIGxlZnQgYXMgaXMgKHBl
cmhhcHMgd2l0aCBhIGNvbW1lbnQgYWRkZWQpLCB1bmxlc3MgeW91CmNhbiBwb2ludCBvdXQgYWN0
dWFsIGlzc3VlcyB3aXRoIGl0ICh3aGljaCBJIGNhbid0IHNlZSBpbiB0aGUKZGVzY3JpcHRpb24p
LCBvciB5b3UgY2FuIG90aGVyd2lzZSBqdXN0aWZ5IHRoZSBjaGFuZ2Ugd2l0aCBiZXR0ZXIKdGhh
biAidGhlIEVGSSBzaWRlIGlzIGZ1cnRoZXIgY29tcGxpY2F0ZWQgYnkgc3ByYXlpbmcgbm9uLWlk
ZW50aXR5CmFsaWFzZXMgaW50byB0aGUgbWl4LiIKCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
