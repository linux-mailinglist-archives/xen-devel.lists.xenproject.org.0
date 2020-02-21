Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775316813D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:15:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59za-0007kr-28; Fri, 21 Feb 2020 15:13:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j59zY-0007kL-Qu
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:13:24 +0000
X-Inumbo-ID: b3bd681a-54bc-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3bd681a-54bc-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 15:13:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2ACDB2CB;
 Fri, 21 Feb 2020 15:13:22 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
 <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
 <5005d791-7d8f-ca03-4c16-7dc9d19bc8e6@xen.org>
 <92fa042e-a880-8b56-4255-c8d19654908b@suse.com>
 <6163a60b-5a7f-90c0-1ba3-e9a96f8e88f2@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <db345ddc-f60a-8567-dcce-4119ef6c1611@suse.com>
Date: Fri, 21 Feb 2020 16:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6163a60b-5a7f-90c0-1ba3-e9a96f8e88f2@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAgMTU6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAyMS8wMi8y
MDIwIDE0OjM1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMS4wMi4yMCAxNTozMiwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMS8wMi8yMDIwIDE0OjE2LCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4+IE9uIDIxLjAyLjIwIDE1OjExLCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4+IEhpIEp1ZXJnZW4sCj4+Pj4+Cj4+Pj4+IE9uIDIxLzAyLzIwMjAgMTQ6MDYsIErDvHJn
ZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+PiBPbiAyMS4wMi4yMCAxNDo0OSwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyMS4wMi4yMCAxNDozNiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+Pj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+Pj4+Pj4+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4+Pj4gSGksCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+Pj4+Pj4+
IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIHRvIGFs
c28gCj4+Pj4+Pj4+Pj4+PiBsb2NrIGl0IGluCj4+Pj4+Pj4+Pj4+PiByZWFkIG1vZGUuIFRoZXJl
J3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgCj4+Pj4+Pj4+Pj4+
PiB0aGF0J3MKPj4+Pj4+Pj4+Pj4+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxlciAoaWU6IENQ
VSkgaW4gd3JpdGUgbW9kZS4gCj4+Pj4+Pj4+Pj4+PiBBbGxvd2luZyBzdWNoCj4+Pj4+Pj4+Pj4+
PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNl
Lgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAx
NGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIAo+Pj4+Pj4+Pj4+Pj4gdG8gc3VwcG9ydAo+
Pj4+Pj4+Pj4+Pj4gdXAgdG8gMTYzODQgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sg
bWFzayB0byAyIGJpdHM6IAo+Pj4+Pj4+Pj4+Pj4gb25lIHRvCj4+Pj4+Pj4+Pj4+PiBzaWduYWwg
dGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgCj4+
Pj4+Pj4+Pj4+PiBvdGhlciB0bwo+Pj4+Pj4+Pj4+Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVk
IGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIAo+Pj4+Pj4+Pj4+Pj4gcmVsYXRlZCBkYXRh
Cj4+Pj4+Pj4+Pj4+PiBpcyB1c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9uZSBpbiBvcmRlciB0byBi
ZSBhYmxlIHRvIGNsZWFyIAo+Pj4+Pj4+Pj4+Pj4gaXQgKGFuZAo+Pj4+Pj4+Pj4+Pj4gdGh1cyBy
ZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJl
bnQgcmVhZGVycyBmcm9tIAo+Pj4+Pj4+Pj4+Pj4gMTY3NzcyMTYgdG8KPj4+Pj4+Pj4+Pj4+IDY1
NTM2LCBJIHRoaW5rIHRoaXMgc2hvdWxkIHN0aWxsIGJlIGVub3VnaCwgb3IgZWxzZSB0aGUgbG9j
ayAKPj4+Pj4+Pj4+Pj4+IGZpZWxkCj4+Pj4+Pj4+Pj4+PiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAz
MiB0byA2NGJpdHMgaWYgYWxsIGFyY2hpdGVjdHVyZXMgCj4+Pj4+Pj4+Pj4+PiBzdXBwb3J0IGF0
b21pYwo+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4gRldJVywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVy
YXRpb25zIG9uIDY0LWJpdCAKPj4+Pj4+Pj4+Pj4gaW50ZWdlcnMuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICps
b2NrKQo+Pj4+Pj4+Pj4+Pj4gwqDCoCB7Cj4+Pj4+Pj4+Pj4+PiAtwqDCoMKgIC8qCj4+Pj4+Pj4+
Pj4+PiAtwqDCoMKgwqAgKiBJZiB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJl
IGNsZWFyZWQgCj4+Pj4+Pj4+Pj4+PiBkaXJlY3RseS4KPj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAq
IE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byAKPj4+Pj4+
Pj4+Pj4+IGNsZWFyIGl0Lgo+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgICovCj4+Pj4+Pj4+Pj4+PiAt
wqDCoMKgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxvY2stPmNudHMpOwo+Pj4+Pj4+Pj4+Pj4g
K8KgwqDCoCAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNs
ZWFyZWQgCj4+Pj4+Pj4+Pj4+PiBkaXJlY3RseS4gKi8KPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgQVNT
RVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4+
Pj4+Pj4+Pj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoCB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMsIDApOwo+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8gY2FzdCBh
biBhdG9taWNfdCgpIGRpcmVjdGx5IGludG8gCj4+Pj4+Pj4+Pj4+IGEgdWludDE2X3QuIFlvdQo+
Pj4+Pj4+Pj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5jb3VudGVy
IGhlcmUuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBTdXJlLCBJIHdhcyB3b25kZXJpbmcgYWJvdXQg
dGhpcyBteXNlbGYuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBXaWxsIHdhaXQgZm9yIG1vcmUgY29t
bWVudHMsIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjYW4gYmUgCj4+Pj4+Pj4+Pj4gZml4ZWQgdXBv
bgo+Pj4+Pj4+Pj4+IGNvbW1pdCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNzdWVzLgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IEl0J3MgbW9yZSB0aGFuIGp1c3QgYWRkaW5nIGFub3RoZXIgZmllbGQgc3Bl
Y2lmaWVyIGhlcmUuIEEgY2FzdCAKPj4+Pj4+Pj4+IGxpa2UKPj4+Pj4+Pj4+IHRoaXMgb25lIGlz
IGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+
Pj4+Pj4+PiBlbmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4gQXQgdGhlIHZlcnkgbGVh
c3QgdGhpcyBzaG91bGQgCj4+Pj4+Pj4+PiBjYXVzZQo+Pj4+Pj4+Pj4gYSBidWlsZCBmYWlsdXJl
IG9uIGJpZyBlbmRpYW4gc3lzdGVtcywgZXZlbiBiZXR0ZXIgd291bGQgYmUgaWYgCj4+Pj4+Pj4+
PiBpdCB3YXMKPj4+Pj4+Pj4+IGVuZGlhbm5lc3Mtc2FmZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV291
bGRuJ3QgYSB1bmlvbiBiZSB0aGUgYmV0dGVyIGNob2ljZT8KPj4+Pj4+Pgo+Pj4+Pj4+IFlvdSB3
b3VsZCBub3QgYmUgYWJsZSB0byB1c2UgYXRvbWljX3QgaW4gdGhhdCBjYXNlIGFzIHlvdSBjYW4n
dCAKPj4+Pj4+PiBhc3N1bWUgdGhlIGxheW91dCBvZiB0aGUgc3RydWN0dXJlLgo+Pj4+Pj4KPj4+
Pj4+IHVuaW9uIHJ3bG9ja3dvcmQgewo+Pj4+Pj4gwqDCoMKgwqAgYXRvbWljX3QgY250czsKPj4+
Pj4+IMKgwqDCoMKgIHVpbnQzMl90IHZhbDsKPj4+Pj4+IMKgwqDCoMKgIHN0cnVjdCB7Cj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHdyaXRlOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCB1aW50MTZfdCByZWFkZXJzOwo+Pj4+Pj4gwqDCoMKgwqAgfTsKPj4+Pj4+IH07Cj4+Pj4+Pgo+
Pj4+Pj4gc3RhdGljIGlubGluZSBjb25zdCB1aW50MzJfdCBfcXJfYmlhcygKPj4+Pj4+IMKgwqDC
oMKgIGNvbnN0IHVuaW9uIHJ3bG9ja3dvcmQgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAud3Jp
dGUgPSAwLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAucmVhZGVycyA9IDEKPj4+Pj4+IMKgwqDC
oMKgIH0geDsKPj4+Pj4+Cj4+Pj4+PiDCoMKgwqDCoCByZXR1cm4geC52YWw7Cj4+Pj4+PiB9Cj4+
Pj4+Pgo+Pj4+Pj4gLi4uCj4+Pj4+PiDCoMKgwqDCoCBjbnRzID0gYXRvbWljX2FkZF9yZXR1cm4o
X3FyX2JpYXMoKSwgJmxvY2stPmNudHMpOwo+Pj4+Pj4gLi4uCj4+Pj4+Pgo+Pj4+Pj4gSSBndWVz
cyB0aGlzIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwo+Pj4+Pgo+Pj4+PiBZb3UgYXJlIGFzc3Vt
aW5nIHRoZSBhdG9taWNfdCBsYXlvdXQgd2hpY2ggSSB3b3VsZCByYXRoZXIgbm8gd2FudCAKPj4+
Pj4gdG8gaGFwcGVuLgo+Pj4+Cj4+Pj4gVGhhdCBhbHJlYWR5IGhhcHBlbmVkLiByd2xvY2suaCBh
bHJlYWR5IGFzc3VtZXMgYXRvbWljX3QgdG8gYmUgMzIgYml0cwo+Pj4+IHdpZGUuIEkgYWdyZWUg
aXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgYW4gYXRvbWljMzJfdCB0eXBlIGZvciB0aGlzCj4+
Pj4gdXNlIGNhc2UuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayB5b3UgdW5kZXJzdG9vZCBteSBwb2lu
dCBoZXJlLiBBbiBhdG9taWMzMl90IHdpbGwgbm90IGJlIAo+Pj4gYmV0dGVyIGFzIHlvdSBzdGls
bCBhc3N1bWUgdGhlIGxheW91dCBvZiB0aGUgc3RydWN0dXJlLiBJLmUgdGhlIAo+Pj4gc3RydWN0
dXJlIGhhcyBvbmx5IG9uZSBmaWVsZC4KPj4KPj4gSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcmVh
c29uaW5nIGhlcmUsIHNvcnJ5Lgo+Pgo+PiBBcmUgeW91IHNheWluZyB0aGF0IGEgc3RydWN0dXJl
IG9mIHR3byB1aW50MTZfdCBpc24ndCBrbm93biB0byBiZSAzMgo+PiBiaXRzIGxvbmc/Cj4gCj4g
WW91IGFyZSBhc3N1bWluZyB0aGF0IGF0b21pY190IHdpbGwgYWx3YXlzIGJlOgo+IAo+IHN0cnVj
dAo+IHsKPiAgwqAgaW50IGNvdW50ZXI7Cj4gfQo+IAo+IFdoYXQgaWYgd2UgZGVjaWRlIHRvIHR1
cm4gaW50bwo+IAo+IHN0cnVjdAo+IHsKPiAgwqAgYm9vbCBhOwo+ICDCoCBpbnQgY291bnRlcjsK
PiB9CgpBcyBzYWlkIGJlZm9yZTogdGhlbiBxdWV1ZV93cml0ZV9sb2NrX3Nsb3dwYXRoKCkgaXMg
YWxyZWFkeSBicm9rZW4uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
