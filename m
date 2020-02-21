Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259C1680D9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:53:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59dg-0004PA-Rz; Fri, 21 Feb 2020 14:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59df-0004P1-TT
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:50:47 +0000
X-Inumbo-ID: 8a1cc671-54b9-11ea-868f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a1cc671-54b9-11ea-868f-12813bfff9fa;
 Fri, 21 Feb 2020 14:50:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D51D8AEF5;
 Fri, 21 Feb 2020 14:50:45 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <4f37297b-117e-72a8-838f-e27adc495bf3@suse.com>
 <740b900e-dc38-1b49-ab34-f67043768a43@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a296d0b-084a-b7a9-ece1-664882f43f2d@suse.com>
Date: Fri, 21 Feb 2020 15:50:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <740b900e-dc38-1b49-ab34-f67043768a43@suse.com>
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

T24gMjEuMDIuMjAyMCAxNToxOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NToxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAgMTU6MDYsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMCAxNDo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4+Cj4+Pj4KPj4+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+
Pj4+PiBPbiAyMS4wMi4yMCAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyMS4w
Mi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+Pj4+IE9uIFRodSwgRmVi
IDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+
Pj4gSGksCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBN
b25uZSB3cm90ZToKPj4+Pj4+Pj4+IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9sZGluZyB0aGUgbG9j
ayBpbiB3cml0ZSBtb2RlIHRvIGFsc28gbG9jayBpdCBpbgo+Pj4+Pj4+Pj4gcmVhZCBtb2RlLiBU
aGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+
Pj4+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBt
b2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+Pj4+PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBhdCBsZWFz
dCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEluIG9yZGVy
IHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvCj4+
Pj4+Pj4+PiBzdXBwb3J0Cj4+Pj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0
aGUgd3JpdGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4+Pj4+Pj4+PiBzaWduYWwgdGhl
cmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3RoZXIg
dG8KPj4+Pj4+Pj4+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3Rl
IHRoZSB3cml0ZSByZWxhdGVkIGRhdGEKPj4+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBp
cyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+Pj4+Pj4+Pj4gdGh1
cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQg
cmVhZGVycyBmcm9tCj4+Pj4+Pj4+PiAxNjc3NzIxNiB0bwo+Pj4+Pj4+Pj4gNjU1MzYsIEkgdGhp
bmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4+
Pj4+Pj4+PiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAzMiB0byA2NGJpdHMgaWYgYWxsIGFyY2hpdGVj
dHVyZXMgc3VwcG9ydCBhdG9taWMKPj4+Pj4+Pj4+IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdl
cnMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBhdG9t
aWMgb3BlcmF0aW9ucyBvbiA2NC1iaXQgaW50ZWdlcnMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAgwqDC
oCBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xvY2tfdCAqbG9jaykKPj4+Pj4+
Pj4+ICDCoMKgIHsKPj4+Pj4+Pj4+IC3CoMKgwqAgLyoKPj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIElm
IHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4K
Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdp
bGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+Pj4+IC3CoMKgwqDCoCAqLwo+Pj4+Pj4+Pj4g
LcKgwqDCoCBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+Pj4+Pj4+ICvC
oMKgwqAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVh
cmVkCj4+Pj4+Pj4+PiBkaXJlY3RseS4gKi8KPj4+Pj4+Pj4+ICvCoMKgwqAgQVNTRVJUKF9pc193
cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4+Pj4+Pj4+PiAr
wqDCoMKgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+Pj4+Pj4+Pj4gK8KgwqDCoCB3
cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMsIDApOwo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBJIHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8gY2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5
IGludG8gYQo+Pj4+Pj4+PiB1aW50MTZfdC4gWW91Cj4+Pj4+Pj4+IHdvdWxkIGF0IGxlYXN0IHdh
bnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFN1cmUs
IEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlzIG15c2VsZi4KPj4+Pj4+Pgo+Pj4+Pj4+IFdpbGwg
d2FpdCBmb3IgbW9yZSBjb21tZW50cywgbm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhl
ZCB1cG9uCj4+Pj4+Pj4gY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBpc3N1ZXMuCj4+Pj4+
Pgo+Pj4+Pj4gSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZp
ZXIgaGVyZS4gQSBjYXN0IGxpa2UKPj4+Pj4+IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZl
LCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+Pj4+PiBlbmRpYW4gcG9ydCBh
dHRlbXB0IHRvIGZhbGwgaW50by4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgY2F1c2UK
Pj4+Pj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVy
IHdvdWxkIGJlIGlmIGl0IHdhcwo+Pj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+Pj4+Pgo+Pj4+PiBX
b3VsZG4ndCBhIHVuaW9uIGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+Pj4+Cj4+Pj4gWW91IHdvdWxk
IG5vdCBiZSBhYmxlIHRvIHVzZSBhdG9taWNfdCBpbiB0aGF0IGNhc2UgYXMgeW91IGNhbid0IGFz
c3VtZQo+Pj4+IHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4KPj4+Cj4+PiB1bmlvbiByd2xv
Y2t3b3JkIHsKPj4+ICAgICAgIGF0b21pY190IGNudHM7Cj4+PiAgICAgICB1aW50MzJfdCB2YWw7
Cj4+PiAgICAgICBzdHJ1Y3Qgewo+Pj4gICAgICAgICAgIHVpbnQxNl90IHdyaXRlOwo+Pj4gICAg
ICAgICAgIHVpbnQxNl90IHJlYWRlcnM7Cj4+PiAgICAgICB9Owo+Pj4gfTsKPj4+Cj4+PiBzdGF0
aWMgaW5saW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFzKAo+Pj4gICAgICAgY29uc3QgdW5pb24g
cndsb2Nrd29yZCB7Cj4+PiAgICAgICAgICAgLndyaXRlID0gMCwKPj4+ICAgICAgICAgICAucmVh
ZGVycyA9IDEKPj4+ICAgICAgIH0geDsKPj4+Cj4+PiAgICAgICByZXR1cm4geC52YWw7Cj4+PiB9
Cj4+Pgo+Pj4gLi4uCj4+PiAgICAgICBjbnRzID0gYXRvbWljX2FkZF9yZXR1cm4oX3FyX2JpYXMo
KSwgJmxvY2stPmNudHMpOwo+Pj4gLi4uCj4+Pgo+Pj4gSSBndWVzcyB0aGlzIHNob3VsZCBkbyB0
aGUgdHJpY2ssIG5vPwo+Pgo+PiBJJ20gYWZyYWlkIGl0IHdvbid0LCBhbmQgbm90IGp1c3QgYmVj
YXVzZSBvZiB0aGUgc2l6ZW9mKCkgYXNwZWN0Cj4+IGFscmVhZHkgcG9pbnRlZCBvdXQuIFlvdXIg
eCB2YXJpYWJsZSB3b3VsZCBlbmQgdXAgbGlrZSB0aGlzIGluCj4+IG1lbW9yeToKPj4KPj4gbGl0
dGxlOgkwMCAwMCAwMSAwMAo+PiBiaWc6CTAwIDAwIDAwIDAxID0+IDAwMDAwMDAxCj4+Cj4+IHdo
aWNoLCByZWFkIGFzIDMyLWJpdCB2YWx1ZSwgdGhlbiBlbmRzIHVwIGJlaW5nCj4+Cj4+IGxpdHRs
ZToJMDAwMTAwMDAKPj4gYmlnOgkwMDAwMDAwMQo+Pgo+PiBUaGUgYWRkIHRoZXJlZm9yZSB3b3Vs
ZCBiZSBhYmxlIHRvIHNwaWxsIGludG8gdGhlIGhpZ2ggMTYgYml0cy4KPiAKPiBBbmQgd2h5IGV4
YWN0bHkgaXMgdGhpcyB3b3JzZSB0aGFuIGp1c3QgZHJvcHBpbmcgc3BpbGxlZCBiaXRzPwo+IEJv
dGggY2FzZXMgd2lsbCBleHBsb2RlIHJhdGhlciBzb29uLiBCb3RoIGNhc2VzIGNhbiBiZSBhdm9p
ZGVkIGJ5Cj4gaW50cm9kdWN0aW9uIG9mIGUuZy4gQVNTRVJUaW5nIHRoYXQgcmVhZGVyIGlzbid0
IH4wIGJlZm9yZQo+IGluY3JlbWVudGluZyBpdCAob3IgdG8gYmUgemVybyBhZnRlcndhcmRzKS4K
CkhtbSwgeWVzLiBJIGNhbid0IHJlY29uc3RydWN0IHRoZSB0aG91Z2h0cyBvZiB0aGUgcGVvcGxl
IGhhdmluZwpsYWlkIG91dCB0aGUgYml0IGFzc2lnbm1lbnRzIHRoZSB3YXkgdGhleSBhcmUgcmln
aHQgbm93LiBJIGNhbgpvbmx5IGFzc3VtZSB0aGVyZSB3YXMgYSByZWFzb24gdG8gcHV0IHRoZSBy
ZWFkZXIgY291bnQgaW4gdGhlCmhpZ2ggYml0cy4gQnV0IGl0IGxvb2tzIGxpa2UgbXkgcHJldmlv
dXMgcmVtYXJrIHdhc24ndCBldmVuCnBvaW50aW5nIGF0IHRoZSB3b3JzdCBlZmZlY3QuIFRoZSBy
ZXN1bHRpbmcgYmlnIGVuZGlhbiAzMi1iaXQKbGF5b3V0IGFsc28gaXMgbm90IGluIGxpbmUgd2l0
aCB0aGUgX1FXXyogY29uc3RhbnRzLCBkdWUgdG8KbWlzLW9yZGVyaW5nIG9mIHRoZSB0d28gaGFs
dmVzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
