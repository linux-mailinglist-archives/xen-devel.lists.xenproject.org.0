Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD14A168155
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:19:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5A41-00081P-41; Fri, 21 Feb 2020 15:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5A3z-00081G-C5
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:17:59 +0000
X-Inumbo-ID: 5769067c-54bd-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5769067c-54bd-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 15:17:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B65D1B433;
 Fri, 21 Feb 2020 15:17:57 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
 <db345ddc-f60a-8567-dcce-4119ef6c1611@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b7ea2b3-bb41-c85b-c75d-0fc2ff833c76@suse.com>
Date: Fri, 21 Feb 2020 16:17:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <db345ddc-f60a-8567-dcce-4119ef6c1611@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNjoxMywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NTo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMS8wMi8yMDIwIDE0OjM1LCBK
w7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4gT24gMjEuMDIuMjAgMTU6MzIsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjEvMDIvMjAyMCAxNDoxNiwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPj4+Pj4gT24gMjEuMDIuMjAgMTU6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+
IEhpIEp1ZXJnZW4sCj4+Pj4+Pgo+Pj4+Pj4gT24gMjEvMDIvMjAyMCAxNDowNiwgSsO8cmdlbiBH
cm/DnyB3cm90ZToKPj4+Pj4+PiBPbiAyMS4wMi4yMCAxNDo0OSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4+Pj4+IE9uIDIxLjAyLjIwMjAgMTA6MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4+Pj4+Pj4+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+
Pj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9k
ZSB0byBhbHNvIAo+Pj4+Pj4+Pj4+Pj4+IGxvY2sgaXQgaW4KPj4+Pj4+Pj4+Pj4+PiByZWFkIG1v
ZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgCj4+
Pj4+Pj4+Pj4+Pj4gdGhhdCdzCj4+Pj4+Pj4+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2Fs
bGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiAKPj4+Pj4+Pj4+Pj4+PiBBbGxvd2luZyBzdWNo
Cj4+Pj4+Pj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUg
bWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRv
IHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIAo+Pj4+Pj4+Pj4+
Pj4+IHRvIHN1cHBvcnQKPj4+Pj4+Pj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVj
ZSB0aGUgd3JpdGUgbG9jayBtYXNrIHRvIDIgYml0czogCj4+Pj4+Pj4+Pj4+Pj4gb25lIHRvCj4+
Pj4+Pj4+Pj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0
aGUgbG9jayBhbmQgdGhlIAo+Pj4+Pj4+Pj4+Pj4+IG90aGVyIHRvCj4+Pj4+Pj4+Pj4+Pj4gc2ln
bmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIAo+Pj4+
Pj4+Pj4+Pj4+IHJlbGF0ZWQgZGF0YQo+Pj4+Pj4+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhp
cyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgCj4+Pj4+Pj4+Pj4+Pj4gaXQg
KGFuZAo+Pj4+Pj4+Pj4+Pj4+IHRodXMgcmVsZWFzZSB0aGUgbG9jaykgdXNpbmcgYSAxNmJpdCBh
dG9taWMgd3JpdGUuCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhl
IG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIAo+Pj4+Pj4+Pj4+Pj4+
IDE2Nzc3MjE2IHRvCj4+Pj4+Pj4+Pj4+Pj4gNjU1MzYsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3Rp
bGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIAo+Pj4+Pj4+Pj4+Pj4+IGZpZWxkCj4+Pj4+
Pj4+Pj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRl
Y3R1cmVzIAo+Pj4+Pj4+Pj4+Pj4+IHN1cHBvcnQgYXRvbWljCj4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0
aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBGV0lXLCBh
cm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IAo+Pj4+
Pj4+Pj4+Pj4gaW50ZWdlcnMuCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IMKgwqAgc3RhdGlj
IGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+Pj4+Pj4+Pj4g
wqDCoCB7Cj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoCAvKgo+Pj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAq
IElmIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCAKPj4+Pj4+
Pj4+Pj4+PiBkaXJlY3RseS4KPj4+Pj4+Pj4+Pj4+PiAtwqDCoMKgwqAgKiBPdGhlcndpc2UsIGFu
IGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gCj4+Pj4+Pj4+Pj4+Pj4gY2xlYXIg
aXQuCj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgICovCj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoCBhdG9t
aWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIC8q
IFNpbmNlIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCAKPj4+
Pj4+Pj4+Pj4+PiBkaXJlY3RseS4gKi8KPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIEFTU0VSVChfaXNf
d3JpdGVfbG9ja2VkX2J5X21lKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+Pj4+Pj4+Pj4+
Pj4+ICvCoMKgwqAgQlVJTERfQlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4+Pj4+Pj4+Pj4g
K8KgwqDCoCB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMsIDApOwo+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0
b21pY190KCkgZGlyZWN0bHkgaW50byAKPj4+Pj4+Pj4+Pj4+IGEgdWludDE2X3QuIFlvdQo+Pj4+
Pj4+Pj4+Pj4gd291bGQgYXQgbGVhc3Qgd2FudCB0byB1c2UgJmxvY2stPmNudHMuY291bnRlciBo
ZXJlLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBTdXJlLCBJIHdhcyB3b25kZXJpbmcgYWJvdXQg
dGhpcyBteXNlbGYuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFdpbGwgd2FpdCBmb3IgbW9yZSBj
b21tZW50cywgbm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSAKPj4+Pj4+Pj4+Pj4gZml4ZWQg
dXBvbgo+Pj4+Pj4+Pj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEl0J3MgbW9yZSB0aGFuIGp1c3QgYWRkaW5nIGFub3RoZXIgZmll
bGQgc3BlY2lmaWVyIGhlcmUuIEEgY2FzdCAKPj4+Pj4+Pj4+PiBsaWtlCj4+Pj4+Pj4+Pj4gdGhp
cyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3Ig
YSBiaWcKPj4+Pj4+Pj4+PiBlbmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4gQXQgdGhl
IHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgCj4+Pj4+Pj4+Pj4gY2F1c2UKPj4+Pj4+Pj4+PiBhIGJ1
aWxkIGZhaWx1cmUgb24gYmlnIGVuZGlhbiBzeXN0ZW1zLCBldmVuIGJldHRlciB3b3VsZCBiZSBp
ZiAKPj4+Pj4+Pj4+PiBpdCB3YXMKPj4+Pj4+Pj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4gV291bGRuJ3QgYSB1bmlvbiBiZSB0aGUgYmV0dGVyIGNob2ljZT8KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gWW91IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHVzZSBhdG9taWNfdCBpbiB0aGF0
IGNhc2UgYXMgeW91IGNhbid0IAo+Pj4+Pj4+PiBhc3N1bWUgdGhlIGxheW91dCBvZiB0aGUgc3Ry
dWN0dXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gdW5pb24gcndsb2Nrd29yZCB7Cj4+Pj4+Pj4gwqDCoMKg
wqAgYXRvbWljX3QgY250czsKPj4+Pj4+PiDCoMKgwqDCoCB1aW50MzJfdCB2YWw7Cj4+Pj4+Pj4g
wqDCoMKgwqAgc3RydWN0IHsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHdyaXRl
Owo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3QgcmVhZGVyczsKPj4+Pj4+PiDCoMKg
wqDCoCB9Owo+Pj4+Pj4+IH07Cj4+Pj4+Pj4KPj4+Pj4+PiBzdGF0aWMgaW5saW5lIGNvbnN0IHVp
bnQzMl90IF9xcl9iaWFzKAo+Pj4+Pj4+IMKgwqDCoMKgIGNvbnN0IHVuaW9uIHJ3bG9ja3dvcmQg
ewo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLndyaXRlID0gMCwKPj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgIC5yZWFkZXJzID0gMQo+Pj4+Pj4+IMKgwqDCoMKgIH0geDsKPj4+Pj4+Pgo+Pj4+Pj4+
IMKgwqDCoMKgIHJldHVybiB4LnZhbDsKPj4+Pj4+PiB9Cj4+Pj4+Pj4KPj4+Pj4+PiAuLi4KPj4+
Pj4+PiDCoMKgwqDCoCBjbnRzID0gYXRvbWljX2FkZF9yZXR1cm4oX3FyX2JpYXMoKSwgJmxvY2st
PmNudHMpOwo+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBndWVzcyB0aGlzIHNob3VsZCBk
byB0aGUgdHJpY2ssIG5vPwo+Pj4+Pj4KPj4+Pj4+IFlvdSBhcmUgYXNzdW1pbmcgdGhlIGF0b21p
Y190IGxheW91dCB3aGljaCBJIHdvdWxkIHJhdGhlciBubyB3YW50IAo+Pj4+Pj4gdG8gaGFwcGVu
Lgo+Pj4+Pgo+Pj4+PiBUaGF0IGFscmVhZHkgaGFwcGVuZWQuIHJ3bG9jay5oIGFscmVhZHkgYXNz
dW1lcyBhdG9taWNfdCB0byBiZSAzMiBiaXRzCj4+Pj4+IHdpZGUuIEkgYWdyZWUgaXQgd291bGQg
YmUgYmV0dGVyIHRvIGhhdmUgYW4gYXRvbWljMzJfdCB0eXBlIGZvciB0aGlzCj4+Pj4+IHVzZSBj
YXNlLgo+Pj4+Cj4+Pj4gSSBkb24ndCB0aGluayB5b3UgdW5kZXJzdG9vZCBteSBwb2ludCBoZXJl
LiBBbiBhdG9taWMzMl90IHdpbGwgbm90IGJlIAo+Pj4+IGJldHRlciBhcyB5b3Ugc3RpbGwgYXNz
dW1lIHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4gSS5lIHRoZSAKPj4+PiBzdHJ1Y3R1cmUg
aGFzIG9ubHkgb25lIGZpZWxkLgo+Pj4KPj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIHJlYXNv
bmluZyBoZXJlLCBzb3JyeS4KPj4+Cj4+PiBBcmUgeW91IHNheWluZyB0aGF0IGEgc3RydWN0dXJl
IG9mIHR3byB1aW50MTZfdCBpc24ndCBrbm93biB0byBiZSAzMgo+Pj4gYml0cyBsb25nPwo+Pgo+
PiBZb3UgYXJlIGFzc3VtaW5nIHRoYXQgYXRvbWljX3Qgd2lsbCBhbHdheXMgYmU6Cj4+Cj4+IHN0
cnVjdAo+PiB7Cj4+ICDCoCBpbnQgY291bnRlcjsKPj4gfQo+Pgo+PiBXaGF0IGlmIHdlIGRlY2lk
ZSB0byB0dXJuIGludG8KPj4KPj4gc3RydWN0Cj4+IHsKPj4gIMKgIGJvb2wgYTsKPj4gIMKgIGlu
dCBjb3VudGVyOwo+PiB9Cj4gCj4gQXMgc2FpZCBiZWZvcmU6IHRoZW4gcXVldWVfd3JpdGVfbG9j
a19zbG93cGF0aCgpIGlzIGFscmVhZHkgYnJva2VuLgoKV2h5PyBUaGUgYXRvbWljXyooKSB1c2Vk
IHdvdWxkIHN0aWxsIG9ubHkgYWN0IG9uIHRoZSBjb3VudGVyIGZpZWxkCihmb3IgdGhlaXIgYWN0
dWFsIG9wZXJhdGlvbiwgaS5lLiB3aGF0IG1hdHRlcnMgdG8gY2FsbGVyczsgdGhlCm90aGVyIGZp
ZWxkKHMpIGNvdWxkIGJlIHN0YXRpc3RpY3Mgb3Igd2hhdGV2ZXIpLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
