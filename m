Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78F167FF0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:18:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5962-0007Mi-4Z; Fri, 21 Feb 2020 14:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5960-0007Md-Vn
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:16:01 +0000
X-Inumbo-ID: aef95576-54b4-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aef95576-54b4-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 14:16:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E448AAD1E;
 Fri, 21 Feb 2020 14:15:58 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f37297b-117e-72a8-838f-e27adc495bf3@suse.com>
Date: Fri, 21 Feb 2020 15:16:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
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

T24gMjEuMDIuMjAyMCAxNTowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NDo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBK
w7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4gT24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+IE9uIDIxLjAyLjIwMjAgMTA6MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+
Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFs
bCB3cm90ZToKPj4+Pj4+IEhpLAo+Pj4+Pj4KPj4+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJv
Z2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcg
dGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPj4+Pj4+PiByZWFkIG1v
ZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgdGhh
dCdzCj4+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0
ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVh
c3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIG9yZGVyIHRv
IGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIAo+Pj4+
Pj4+IHN1cHBvcnQKPj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3Jp
dGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4+Pj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBw
ZW5kaW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4+Pj4+
Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRl
IHJlbGF0ZWQgZGF0YQo+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9y
ZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+Pj4+Pj4+IHRodXMgcmVsZWFzZSB0aGUg
bG9jaykgdXNpbmcgYSAxNmJpdCBhdG9taWMgd3JpdGUuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIHJl
ZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIAo+Pj4+
Pj4+IDE2Nzc3MjE2IHRvCj4+Pj4+Pj4gNjU1MzYsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwg
YmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4+Pj4+Pj4gY2FuIGJlIGV4cGFuZGVk
IGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4+
Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Cj4+Pj4+PiBGV0lXLCBh
cm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGludGVn
ZXJzLgo+Pj4+Pj4KPj4+Pj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2Nr
KHJ3bG9ja190ICpsb2NrKQo+Pj4+Pj4+IMKgwqAgewo+Pj4+Pj4+IC3CoMKgwqAgLyoKPj4+Pj4+
PiAtwqDCoMKgwqAgKiBJZiB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNs
ZWFyZWQgZGlyZWN0bHkuCj4+Pj4+Pj4gLcKgwqDCoMKgICogT3RoZXJ3aXNlLCBhbiBhdG9taWMg
c3VidHJhY3Rpb24gd2lsbCBiZSB1c2VkIHRvIGNsZWFyIGl0Lgo+Pj4+Pj4+IC3CoMKgwqDCoCAq
Lwo+Pj4+Pj4+IC3CoMKgwqAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9jay0+Y250cyk7Cj4+
Pj4+Pj4gK8KgwqDCoCAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2Fu
IGJlIGNsZWFyZWQgCj4+Pj4+Pj4gZGlyZWN0bHkuICovCj4+Pj4+Pj4gK8KgwqDCoCBBU1NFUlQo
X2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+Pj4+
PiArwqDCoMKgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+Pj4+Pj4+ICvCoMKgwqAg
d3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZsb2NrLT5jbnRzLCAwKTsKPj4+Pj4+Cj4+Pj4+PiBJ
IHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8gY2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5IGlu
dG8gYSAKPj4+Pj4+IHVpbnQxNl90LiBZb3UKPj4+Pj4+IHdvdWxkIGF0IGxlYXN0IHdhbnQgdG8g
dXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4+Pj4KPj4+Pj4gU3VyZSwgSSB3YXMgd29u
ZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+Pj4+Pgo+Pj4+PiBXaWxsIHdhaXQgZm9yIG1vcmUg
Y29tbWVudHMsIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjYW4gYmUgZml4ZWQgdXBvbgo+Pj4+PiBj
b21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPj4+Pgo+Pj4+IEl0J3MgbW9yZSB0
aGFuIGp1c3QgYWRkaW5nIGFub3RoZXIgZmllbGQgc3BlY2lmaWVyIGhlcmUuIEEgY2FzdCBsaWtl
Cj4+Pj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2Fp
dGluZyBmb3IgYSBiaWcKPj4+PiBlbmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4gQXQg
dGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgY2F1c2UKPj4+PiBhIGJ1aWxkIGZhaWx1cmUgb24g
YmlnIGVuZGlhbiBzeXN0ZW1zLCBldmVuIGJldHRlciB3b3VsZCBiZSBpZiBpdCB3YXMKPj4+PiBl
bmRpYW5uZXNzLXNhZmUuCj4+Pgo+Pj4gV291bGRuJ3QgYSB1bmlvbiBiZSB0aGUgYmV0dGVyIGNo
b2ljZT8KPj4KPj4gWW91IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHVzZSBhdG9taWNfdCBpbiB0aGF0
IGNhc2UgYXMgeW91IGNhbid0IGFzc3VtZSAKPj4gdGhlIGxheW91dCBvZiB0aGUgc3RydWN0dXJl
Lgo+IAo+IHVuaW9uIHJ3bG9ja3dvcmQgewo+ICAgICAgYXRvbWljX3QgY250czsKPiAgICAgIHVp
bnQzMl90IHZhbDsKPiAgICAgIHN0cnVjdCB7Cj4gICAgICAgICAgdWludDE2X3Qgd3JpdGU7Cj4g
ICAgICAgICAgdWludDE2X3QgcmVhZGVyczsKPiAgICAgIH07Cj4gfTsKPiAKPiBzdGF0aWMgaW5s
aW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFzKAo+ICAgICAgY29uc3QgdW5pb24gcndsb2Nrd29y
ZCB7Cj4gICAgICAgICAgLndyaXRlID0gMCwKPiAgICAgICAgICAucmVhZGVycyA9IDEKPiAgICAg
IH0geDsKPiAKPiAgICAgIHJldHVybiB4LnZhbDsKPiB9Cj4gCj4gLi4uCj4gICAgICBjbnRzID0g
YXRvbWljX2FkZF9yZXR1cm4oX3FyX2JpYXMoKSwgJmxvY2stPmNudHMpOwo+IC4uLgo+IAo+IEkg
Z3Vlc3MgdGhpcyBzaG91bGQgZG8gdGhlIHRyaWNrLCBubz8KCkknbSBhZnJhaWQgaXQgd29uJ3Qs
IGFuZCBub3QganVzdCBiZWNhdXNlIG9mIHRoZSBzaXplb2YoKSBhc3BlY3QKYWxyZWFkeSBwb2lu
dGVkIG91dC4gWW91ciB4IHZhcmlhYmxlIHdvdWxkIGVuZCB1cCBsaWtlIHRoaXMgaW4KbWVtb3J5
OgoKbGl0dGxlOgkwMCAwMCAwMSAwMApiaWc6CTAwIDAwIDAwIDAxID0+IDAwMDAwMDAxCgp3aGlj
aCwgcmVhZCBhcyAzMi1iaXQgdmFsdWUsIHRoZW4gZW5kcyB1cCBiZWluZwoKbGl0dGxlOgkwMDAx
MDAwMApiaWc6CTAwMDAwMDAxCgpUaGUgYWRkIHRoZXJlZm9yZSB3b3VsZCBiZSBhYmxlIHRvIHNw
aWxsIGludG8gdGhlIGhpZ2ggMTYgYml0cy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
