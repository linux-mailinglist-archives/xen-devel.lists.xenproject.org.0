Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D49132B23
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:32:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorki-0006h5-I6; Tue, 07 Jan 2020 16:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iorkh-0006h0-Lm
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:30:43 +0000
X-Inumbo-ID: 0c42e5ca-316b-11ea-ac58-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c42e5ca-316b-11ea-ac58-12813bfff9fa;
 Tue, 07 Jan 2020 16:30:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29F30AD09;
 Tue,  7 Jan 2020 16:30:42 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
Message-ID: <e52491a3-da1e-5c86-8038-f008d181c3a8@suse.com>
Date: Tue, 7 Jan 2020 17:30:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
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

T24gMDcuMDEuMjAyMCAxNzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMDEuMjAyMCAx
Njo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmkt
Ym9vdC5oCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaAo+PiBAQCAtNTg0LDIx
ICs1ODQsMjQgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lk
KQo+PiAgICAgIGlmICggIWVmaV9lbmFibGVkKEVGSV9MT0FERVIpICkKPj4gICAgICAgICAgcmV0
dXJuOwo+PiAgCj4+IC0gICAgLyogSW5pdGlhbGlzZSBMMiBpZGVudGl0eS1tYXAgYW5kIGJvb3Qt
bWFwIHBhZ2UgdGFibGUgZW50cmllcyAoMTZNQikuICovCj4+ICsgICAgLyoKPj4gKyAgICAgKiBN
YXAgWGVuIGludG8gdGhlIGRpcmVjdG1hcCAoTlgsIG5lZWRlZCBmb3IgZWFybHktYm9vdCBwYWdl
dGFibGUKPj4gKyAgICAgKiBoYW5kbGluZy93YWxraW5nKSwgYW5kIGlkZW50aXR5IG1hcCBYZW4g
aW50byBib290bWFwIChYLCBuZWVkZWQgZm9yIHRoZQo+PiArICAgICAqIHRyYW5zaXRpb24gZnJv
bSB0aGUgRUZJIHBhZ2V0YWJsZXMgdG8gWGVuKSwgdXNpbmcgMk0gc3VwZXJwYWdlcy4KPj4gKyAg
ICAgKi8KPiAKPiBIb3cgZG9lcyBOWCB2cyBYIG1hdHRlciBmb3IgdGhlIGNvZGUgYmVsb3cgaGVy
ZT8gUEFHRV9IWVBFUlZJU09SIGFuZAo+IF9fUEFHRV9IWVBFUlZJU09SLCBhcyB1c2VkIGJlbG93
LCBkaWZmZXIgYnkganVzdCBfUEFHRV9HTE9CQUwuIERpZAo+IHlvdSBtZWFuIHRvIG1ha2UgZnVy
dGhlciBjaGFuZ2VzPwo+IAo+PiAgICAgIGZvciAoIGkgPSAwOyBpIDwgODsgKytpICkKPj4gICAg
ICB7Cj4+ICAgICAgICAgIHVuc2lnbmVkIGludCBzbG90ID0gKHhlbl9waHlzX3N0YXJ0ID4+IEwy
X1BBR0VUQUJMRV9TSElGVCkgKyBpOwo+PiAgICAgICAgICBwYWRkcl90IGFkZHIgPSBzbG90IDw8
IEwyX1BBR0VUQUJMRV9TSElGVDsKPj4gIAo+PiAgICAgICAgICBsMl9pZGVudG1hcFtzbG90XSA9
IGwyZV9mcm9tX3BhZGRyKGFkZHIsIFBBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpOwo+PiAtICAg
ICAgICBzbG90ICY9IEwyX1BBR0VUQUJMRV9FTlRSSUVTIC0gMTsKPj4gICAgICAgICAgbDJfYm9v
dG1hcFtzbG90XSA9IGwyZV9mcm9tX3BhZGRyKGFkZHIsIF9fUEFHRV9IWVBFUlZJU09SfF9QQUdF
X1BTRSk7Cj4+ICAgICAgfQo+PiAtICAgIC8qIEluaXRpYWxpc2UgTDMgYm9vdC1tYXAgcGFnZSBk
aXJlY3RvcnkgZW50cmllcy4gKi8KPj4gLSAgICBsM19ib290bWFwW2wzX3RhYmxlX29mZnNldCh4
ZW5fcGh5c19zdGFydCldID0KPj4gLSAgICAgICAgbDNlX2Zyb21fcGFkZHIoKFVJTlROKWwyX2Jv
b3RtYXAsIF9fUEFHRV9IWVBFUlZJU09SKTsKPj4gLSAgICBsM19ib290bWFwW2wzX3RhYmxlX29m
ZnNldCh4ZW5fcGh5c19zdGFydCArICg4IDw8IEwyX1BBR0VUQUJMRV9TSElGVCkgLSAxKV0gPQo+
PiAtICAgICAgICBsM2VfZnJvbV9wYWRkcigoVUlOVE4pbDJfYm9vdG1hcCwgX19QQUdFX0hZUEVS
VklTT1IpOwo+PiArCj4+ICsgICAgLyogSW5pdGlhbGl6ZSBMMyBib290LW1hcCBwYWdlIGRpcmVj
dG9yeSBlbnRyaWVzLiAqLwo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgKytpICkKPj4gKyAg
ICAgICAgbDNfYm9vdG1hcFtpXSA9IGwzZV9mcm9tX3BhZGRyKChVSU5UTilsMl9ib290bWFwICsg
aSAqIFBBR0VfU0laRSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fUEFHRV9IWVBFUlZJU09SKTsKPiAKPiBUaGUgaWRlYSBiZWhpbmQgdGhlIG9yaWdpbmFsIGNv
ZGUgd2FzIHRvIGJlIGltbXVuZSB0byB0aGUgbnVtYmVyCj4gb2YgcGFnZXMgbDJfYm9vdG1hcFtd
IGNvdmVycywgYXMgbG9uZyBhcyBpdCdzIGF0IGxlYXN0IG9uZSAod2hpY2gKPiBpdCdsbCBhbHdh
eXMgYmUsIEkgd291bGQgc2F5KS4gVGhlIG1pbmltdW0gcmVxdWlyZW1lbnQgdG8gYW55Cj4gY2hh
bmdlIHRvIHRoaXMgSSBoYXZlIGlzIHRoYXQgdGhlIGJ1aWxkIG11c3QgYnJlYWsgaWYgdGhlIHNp
emUKPiBhc3N1bXB0aW9uIGhlcmUgaXMgdmlvbGF0ZWQuIEkuZS4gdGhlcmUgbWF5IG5vdCBiZSBh
IGxpdGVyYWwgNCBhcwo+IHRoZSB1cHBlciBsb29wIGJvdW5kIGhlcmUsIG9yIHRoZXJlIHdvdWxk
IG5lZWQgdG8gYmUgYQo+IEJVSUxEX0JVR19PTigpIHJpZ2h0IG5leHQgdG8gaXQuIEJ1dCBJJ2Qg
cmVhbGx5IHByZWZlciBpZiB0aGUKPiBjb2RlIHdhcyBsZWZ0IGFzIGlzIChwZXJoYXBzIHdpdGgg
YSBjb21tZW50IGFkZGVkKSwgdW5sZXNzIHlvdQo+IGNhbiBwb2ludCBvdXQgYWN0dWFsIGlzc3Vl
cyB3aXRoIGl0ICh3aGljaCBJIGNhbid0IHNlZSBpbiB0aGUKPiBkZXNjcmlwdGlvbiksIG9yIHlv
dSBjYW4gb3RoZXJ3aXNlIGp1c3RpZnkgdGhlIGNoYW5nZSB3aXRoIGJldHRlcgo+IHRoYW4gInRo
ZSBFRkkgc2lkZSBpcyBmdXJ0aGVyIGNvbXBsaWNhdGVkIGJ5IHNwcmF5aW5nIG5vbi1pZGVudGl0
eQo+IGFsaWFzZXMgaW50byB0aGUgbWl4LiIKCkFuZCBpZiB0aGlzIGNoYW5nZSBpcyB0byBiZSBt
YWRlLCB3b24ndCBpdCBtZWFuIHRoZSBjb2RlIGluIHNldHVwLmMKY29tbWVudGVkIHdpdGggIk1h
a2UgYm9vdCBwYWdlIHRhYmxlcyBtYXRjaCBub24tRUZJIGJvb3QiIGNhbiB0aGVuCmdvIGF3YXkg
YXQgdGhlIHNhbWUgdGltZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
