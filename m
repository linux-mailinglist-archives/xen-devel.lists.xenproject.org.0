Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E914BD44
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:51:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwT73-0002dt-QE; Tue, 28 Jan 2020 15:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwT72-0002dl-GB
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:49:12 +0000
X-Inumbo-ID: b999e2f2-41e5-11ea-871b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b999e2f2-41e5-11ea-871b-12813bfff9fa;
 Tue, 28 Jan 2020 15:49:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A19CB132;
 Tue, 28 Jan 2020 15:49:10 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <20200128145422.GP57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <682a8462-ded7-3f73-d8fe-ffa42738a61e@suse.com>
Date: Tue, 28 Jan 2020 16:49:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128145422.GP57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNTo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAyOCwgMjAyMCBhdCAwMjoxNjo1M1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRG9t
YWluIGNyZWF0aW9uIGZhaWx1cmUgcGF0aHMgZG9uJ3QgY2FsbCBkb21haW5fcmVsaW5xdWlzaF9y
ZXNvdXJjZXMoKSwKPj4geWV0IGFsbG9jYXRpb25zIGFuZCBhbGlrZSBkb25lIGZyb20gaHZtX2Rv
bWFpbl9pbml0aWFsaXplKCkgbmVlZCB0byBiZQo+PiB1bmRvbmUgbmV2ZXJ0aGVsZXNzLiBDYWxs
IHRoZSBmdW5jdGlvbiBhbHNvIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCksCj4+IGFmdGVyIG1h
a2luZyBzdXJlIGFsbCBkZXNjZW5kYW50cyBhcmUgaWRlbXBvdGVudC4KPj4KPj4gTm90ZSB0aGF0
IHdoaWxlIHZpcmlkaWFuX3tkb21haW4sdmNwdX1fZGVpbml0KCkgd2VyZSBhbHJlYWR5IHVzZWQg
aW4KPj4gd2F5cyBzdWdnZXN0aW5nIHRoZXkncmUgaWRlbXBvdGVudCwgdmlyaWRpYW5fdGltZV92
Y3B1X2RlaW5pdCgpIGFjdHVhbGx5Cj4+IHdhc24ndDogT25lIGNhbid0IGtpbGwgYSB0aW1lciB0
aGF0IHdhcyBuZXZlciBpbml0aWFsaXplZC4KPj4KPj4gRm9yIGh2bV9kZXN0cm95X2FsbF9pb3Jl
cV9zZXJ2ZXJzKCkncyBwdXJwb3NlcyBtYWtlCj4+IHJlbG9jYXRlX3BvcnRpb19oYW5kbGVyKCkg
cmV0dXJuIHdoZXRoZXIgdGhlIHRvIGJlIHJlbG9jYXRlZCBwb3J0IHJhbmdlCj4+IHdhcyBhY3R1
YWxseSBmb3VuZC4gVGhpcyBzZWVtcyBjaGVhcGVyIHRoYW4gaW50cm9kdWNpbmcgYSBmbGFnIGlu
dG8KPj4gc3RydWN0IGh2bV9kb21haW4ncyBpb3JlcV9zZXJ2ZXIgc3ViLXN0cnVjdHVyZS4KPj4K
Pj4gSW4gaHZtX2RvbWFpbl9pbml0aWFsaXNlKCkgYWRkaXRpb25hbGx5Cj4+IC0gdXNlIFhGUkVF
KCkgYWxzbyB0byByZXBsYWNlIGFkamFjZW50IHhmcmVlKCksCj4+IC0gdXNlIGh2bV9kb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhcyBiZWluZyBpZGVtcG90ZW50IG5vdy4KPj4KPj4gRml4
ZXM6IGU3YTliNWU3MmYyNiAoInZpcmlkaWFuOiBzZXBhcmF0ZWx5IGFsbG9jYXRlIGRvbWFpbiBh
bmQgdmNwdSBzdHJ1Y3R1cmVzIikKPj4gRml4ZXM6IDI2ZmJhM2M4NTU3MSAoInZpcmlkaWFuOiBh
ZGQgaW1wbGVtZW50YXRpb24gb2Ygc3ludGhldGljIHRpbWVycyIpCj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9ocGV0LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9ocGV0LmMKPj4gQEAgLTc1MSw3
ICs3NTEsNyBAQCB2b2lkIGhwZXRfZGVpbml0KHN0cnVjdCBkb21haW4gKmQpCj4+ICAgICAgaW50
IGk7Cj4+ICAgICAgSFBFVFN0YXRlICpoID0gZG9tYWluX3ZocGV0KGQpOwo+PiAgCj4+IC0gICAg
aWYgKCAhaGFzX3ZocGV0KGQpICkKPj4gKyAgICBpZiAoICFoYXNfdmhwZXQoZCkgfHwgIWQtPmFy
Y2guaHZtLnBsX3RpbWUgfHwgIWgtPnN0aW1lX2ZyZXEgKQo+PiAgICAgICAgICByZXR1cm47Cj4+
ICAKPj4gICAgICB3cml0ZV9sb2NrKCZoLT5sb2NrKTsKPj4gQEAgLTc2Myw2ICs3NjMsOCBAQCB2
b2lkIGhwZXRfZGVpbml0KHN0cnVjdCBkb21haW4gKmQpCj4+ICAgICAgICAgIGZvciAoIGkgPSAw
OyBpIDwgSFBFVF9USU1FUl9OVU07IGkrKyApCj4+ICAgICAgICAgICAgICBpZiAoIHRpbWVyX2Vu
YWJsZWQoaCwgaSkgKQo+PiAgICAgICAgICAgICAgICAgIGhwZXRfc3RvcF90aW1lcihoLCBpLCBn
dWVzdF90aW1lKTsKPj4gKwo+PiArICAgICAgICBoLT5ocGV0LmNvbmZpZyA9IDA7Cj4+ICAgICAg
fQo+PiAgCj4+ICAgICAgd3JpdGVfdW5sb2NrKCZoLT5sb2NrKTsKPj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9odm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+IEBAIC02OTYs
MjQgKzY5NiwyNCBAQCBpbnQgaHZtX2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4KPj4g
ICAgICByZXR1cm4gMDsKPj4gIAo+PiAgIGZhaWwyOgo+PiAtICAgIHJ0Y19kZWluaXQoZCk7Cj4+
ICAgICAgc3RkdmdhX2RlaW5pdChkKTsKPj4gICAgICB2aW9hcGljX2RlaW5pdChkKTsKPj4gICBm
YWlsMToKPj4gICAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApCj4+ICAgICAgICAgIHhm
cmVlKGQtPmFyY2guaHZtLmlvX2JpdG1hcCk7Cj4+IC0gICAgeGZyZWUoZC0+YXJjaC5odm0uaW9f
aGFuZGxlcik7Cj4+IC0gICAgeGZyZWUoZC0+YXJjaC5odm0ucGFyYW1zKTsKPj4gLSAgICB4ZnJl
ZShkLT5hcmNoLmh2bS5wbF90aW1lKTsKPj4gLSAgICB4ZnJlZShkLT5hcmNoLmh2bS5pcnEpOwo+
PiArICAgIFhGUkVFKGQtPmFyY2guaHZtLmlvX2hhbmRsZXIpOwo+PiArICAgIFhGUkVFKGQtPmFy
Y2guaHZtLnBhcmFtcyk7Cj4+ICsgICAgWEZSRUUoZC0+YXJjaC5odm0ucGxfdGltZSk7Cj4+ICsg
ICAgWEZSRUUoZC0+YXJjaC5odm0uaXJxKTsKPj4gICBmYWlsMDoKPj4gICAgICBodm1fZGVzdHJv
eV9jYWNoZWF0dHJfcmVnaW9uX2xpc3QoZCk7Cj4+ICAgICAgZGVzdHJveV9wZXJkb21haW5fbWFw
cGluZyhkLCBQRVJET01BSU5fVklSVF9TVEFSVCwgMCk7Cj4+ICAgZmFpbDoKPj4gLSAgICB2aXJp
ZGlhbl9kb21haW5fZGVpbml0KGQpOwo+PiArICAgIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNv
dXJjZXMoZCk7Cj4gCj4gV291bGQgYmUgbmljZSB0byB1bmlmeSBhbGwgdGhvc2UgbGFiZWxzIGlu
dG8gYSBzaW5nbGUgZmFpbCBsYWJlbCwgYnV0Cj4gSSdtIG5vdCBzdXJlIGlmIGFsbCBmdW5jdGlv
bnMgYXJlIHByZXBhcmVkIHRvIGhhbmRsZSB0aGlzLgoKVGhhdCdzIHRoZSBtaWQtIHRvIGxvbmct
dGVybSBwbGFuLCB5ZXMuIEJ1dCBpdCBoYXMgdGFrZW4gbWUgcXVpdGUgYQpiaXQgbW9yZSB0aW1l
IHRoYW4gaW50ZW5kZWQgdG8gYXQgbGVhc3Qgc29ydCBvdXQgdGhpcyBwYXJ0LiBJIHJlYWxseQpk
b24ndCB3YW50IHRvIGV4dGVuZCB0aGlzIHJpZ2h0IG5vdyAoYW5kIGV2ZW4gbGVzcyBzbyBpbiB0
aGlzIHBhdGNoKS4KCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+PiArKysgYi94
ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPj4gQEAgLTEyMjgsNiArMTIyOCw5IEBAIHZvaWQgaHZt
X2Rlc3Ryb3lfYWxsX2lvcmVxX3NlcnZlcnMoc3RydWMKPj4gICAgICBzdHJ1Y3QgaHZtX2lvcmVx
X3NlcnZlciAqczsKPj4gICAgICB1bnNpZ25lZCBpbnQgaWQ7Cj4+ICAKPj4gKyAgICBpZiAoICFy
ZWxvY2F0ZV9wb3J0aW9faGFuZGxlcihkLCAweGNmOCwgMHhjZjgsIDQpICkKPj4gKyAgICAgICAg
cmV0dXJuOwo+IAo+IENvdWxkIHlvdSBhZGQgYSBub3RlIGhlcmUgdGhhdCB0aGUgJ3JlbG9jYXRp
b24nIGlzIGp1c3QgdXNlZCBhcyBhIG1lYW4KPiB0byBmaWd1cmUgb3V0IGlmIGlvb3JlcSBzZXJ2
ZXJzIGhhdmUgYmVlbiBzZXR1cCAoaWU6IHRoZSBsb2NrIGhhcyBiZWVuCj4gaW5pdGlhbGl6ZWQp
PwoKSG1tLCBJJ20gZXhwbGFpbmluZyB0aGlzIGluIHRoZSBkZXNjcmlwdGlvbiwgYW5kIHR3aWNl
IHRoZSBzYW1lCm51bWJlciBJIHRob3VnaHQgd291bGQgbWFrZSB0aGUgcHVycG9zZSBzdWZmaWNp
ZW50bHkgY2xlYXIKKGFueW9uZSB3aG8gc3RpbGwgd29uZGVycyBjb3VsZCBzdGlsbCBnbyBiYWNr
IHRvIHRoZSBjb21taXQpLgoKPiBJIGZpbmQgdGhpcyBraW5kIG9mIGRpcnR5LCBhbmQgd291bGQg
bmVlZCByZXdvcmsgaWYgb3RoZXIgYXJjaGVzIGdhaW4KPiBpb3JlcSBzdXBwb3J0LgoKVGhpcyBp
cyB4ODYgY29kZSAtIGhvdyBhcmUgb3RoZXIgYXJjaGVzIGdvaW5nIHRvIGJlIGFmZmVjdGVkPwpF
dmVuIGlmIHRoZXkgZ2FpbiBpb3JlcSBzZXJ2ZXIgc3VwcG9ydCwgdGhlIG5vdGlvbiBvZiBwb3J0
IEkvTwppbiBnZW5lcmFsIHdpbGwgcmVtYWluIGFuIHg4NiBzcGVjaWZpYy4KCkkgYWdyZWUgaXQn
cyBhIGxpdHRsZSBkaXJ0eSwgYnV0IEkgY29uc2lkZXIgaXQgYmV0dGVyIHRoYW4KcHV0dGluZyBp
biBhbm90aGVyIGJvb2wgKGFuZCBwcm9iYWJseSA3IGJ5dGVzIG9mIHBhZGRpbmcpIGludG8Kc3Ry
dWN0IGh2bV9kb21haW4uCgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3J0Yy5jCj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vcnRjLmMKPj4gQEAgLTg0NCw3ICs4NDQsOCBAQCB2b2lkIHJ0Y19k
ZWluaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gIHsKPj4gICAgICBSVENTdGF0ZSAqcyA9IGRvbWFp
bl92cnRjKGQpOwo+PiAgCj4+IC0gICAgaWYgKCAhaGFzX3ZydGMoZCkgKQo+PiArICAgIGlmICgg
IWhhc192cnRjKGQpIHx8ICFkLT5hcmNoLmh2bS5wbF90aW1lIHx8Cj4+ICsgICAgICAgICBzLT51
cGRhdGVfdGltZXIuc3RhdHVzID09IFRJTUVSX1NUQVRVU19pbnZhbGlkICkKPiAKPiBZb3UgY291
bGQgYWxzbyBjaGVjayBmb3IgdGhlIHBvcnQgcmVnaXN0cmF0aW9uIEFGQUlDVCwgd2hpY2ggaXMg
bWF5YmUKPiBtb3JlIG9idmlvdXM/CgpZb3UgY2FsbGVkIHRoYXQgYXBwcm9hY2ggZGlydHkgYWJv
dmUgLSBJJ2QgbGlrZSB0byByZXN0cmljdCBpdAp0byBqdXN0IHdoZXJlIG5vIGJldHRlciBhbHRl
cm5hdGl2ZSBleGlzdHMuCgo+IEkgYWxzbyB3b25kZXIgd2hldGhlciBhbGwgdGhvc2UgdGltZS1y
ZWxhdGVkIGVtdWxhdGlvbnMgY291bGQgYmUKPiBncm91cGVkIGludG8gYSBzaW5nbGUgaGVscGVy
LCB0aGF0IGNvdWxkIGhhdmUgYSBkLT5hcmNoLmh2bS5wbF90aW1lCj4gaW5zdGVhZCBvZiBoYXZp
bmcgdG8gc3ByaW5rbGUgc3VjaCBjaGVja3MgZm9yIGVhY2ggZGV2aWNlPwoKUXVpdGUgcG9zc2li
bGUsIGJ1dCBub3QgaGVyZSBhbmQgbm90IG5vdy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
