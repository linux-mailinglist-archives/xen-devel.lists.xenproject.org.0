Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B4167FF4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:19:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j597f-0007Zn-9O; Fri, 21 Feb 2020 14:17:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j597c-0007ZP-Vu
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:17:41 +0000
X-Inumbo-ID: ea410002-54b4-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea410002-54b4-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 14:17:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FBD0ABD1;
 Fri, 21 Feb 2020 14:17:38 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a7a760f-2212-01f8-3e2c-8383e7f74177@suse.com>
Date: Fri, 21 Feb 2020 15:17:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
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

T24gMjEuMDIuMjAyMCAxNToxNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NToxMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBKdWVyZ2VuLAo+Pgo+PiBPbiAyMS8wMi8y
MDIwIDE0OjA2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4gT24gMjEuMDIuMjAgMTQ6NDksIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjEvMDIvMjAyMCAxMzo0NiwgSsO8
cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4+Pj4+PiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICswMDAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMC8wMi8yMDIw
IDE3OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJl
YWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgCj4+Pj4+Pj4+
PiBpdCBpbgo+Pj4+Pj4+Pj4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcg
cmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+Pj4+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0
aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+Pj4+
PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNl
Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMg
b2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIAo+Pj4+Pj4+Pj4gc3VwcG9ydAo+Pj4+Pj4+Pj4g
dXAgdG8gMTYzODQgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFzayB0byAyIGJp
dHM6IG9uZSB0bwo+Pj4+Pj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRlcnMgd2Fp
dGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIAo+Pj4+Pj4+Pj4gb3RoZXIgdG8KPj4+Pj4+Pj4+IHNp
Z25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3RlIHRoZSB3cml0ZSByZWxh
dGVkIGRhdGEKPj4+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVy
IHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+Pj4+Pj4+Pj4gdGh1cyByZWxlYXNlIHRoZSBs
b2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGlz
IHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIAo+
Pj4+Pj4+Pj4gMTY3NzcyMTYgdG8KPj4+Pj4+Pj4+IDY1NTM2LCBJIHRoaW5rIHRoaXMgc2hvdWxk
IHN0aWxsIGJlIGVub3VnaCwgb3IgZWxzZSB0aGUgbG9jayBmaWVsZAo+Pj4+Pj4+Pj4gY2FuIGJl
IGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQg
Cj4+Pj4+Pj4+PiBhdG9taWMKPj4+Pj4+Pj4+IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdlcnMu
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBhdG9taWMg
b3BlcmF0aW9ucyBvbiA2NC1iaXQgaW50ZWdlcnMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgIHN0
YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+Pj4+Pj4+Pj4g
wqDCoCB7Cj4+Pj4+Pj4+PiAtwqDCoMKgIC8qCj4+Pj4+Pj4+PiAtwqDCoMKgwqAgKiBJZiB0aGUg
d3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuCj4+Pj4+
Pj4+PiAtwqDCoMKgwqAgKiBPdGhlcndpc2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJl
IHVzZWQgdG8gY2xlYXIgaXQuCj4+Pj4+Pj4+PiAtwqDCoMKgwqAgKi8KPj4+Pj4+Pj4+IC3CoMKg
wqAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9jay0+Y250cyk7Cj4+Pj4+Pj4+PiArwqDCoMKg
IC8qIFNpbmNlIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCAK
Pj4+Pj4+Pj4+IGRpcmVjdGx5LiAqLwo+Pj4+Pj4+Pj4gK8KgwqDCoCBBU1NFUlQoX2lzX3dyaXRl
X2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+Pj4+Pj4+ICvCoMKg
wqAgQlVJTERfQlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4+Pj4+PiArwqDCoMKgIHdyaXRl
X2F0b21pYygodWludDE2X3QgKikmbG9jay0+Y250cywgMCk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkg
dGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkgaW50
byBhIAo+Pj4+Pj4+PiB1aW50MTZfdC4gWW91Cj4+Pj4+Pj4+IHdvdWxkIGF0IGxlYXN0IHdhbnQg
dG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFN1cmUsIEkg
d2FzIHdvbmRlcmluZyBhYm91dCB0aGlzIG15c2VsZi4KPj4+Pj4+Pgo+Pj4+Pj4+IFdpbGwgd2Fp
dCBmb3IgbW9yZSBjb21tZW50cywgbm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1
cG9uCj4+Pj4+Pj4gY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBpc3N1ZXMuCj4+Pj4+Pgo+
Pj4+Pj4gSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIg
aGVyZS4gQSBjYXN0IGxpa2UKPj4+Pj4+IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZlLCBh
bmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+Pj4+PiBlbmRpYW4gcG9ydCBhdHRl
bXB0IHRvIGZhbGwgaW50by4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgY2F1c2UKPj4+
Pj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdv
dWxkIGJlIGlmIGl0IHdhcwo+Pj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+Pj4+Pgo+Pj4+PiBXb3Vs
ZG4ndCBhIHVuaW9uIGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+Pj4+Cj4+Pj4gWW91IHdvdWxkIG5v
dCBiZSBhYmxlIHRvIHVzZSBhdG9taWNfdCBpbiB0aGF0IGNhc2UgYXMgeW91IGNhbid0IAo+Pj4+
IGFzc3VtZSB0aGUgbGF5b3V0IG9mIHRoZSBzdHJ1Y3R1cmUuCj4+Pgo+Pj4gdW5pb24gcndsb2Nr
d29yZCB7Cj4+PiDCoMKgwqDCoCBhdG9taWNfdCBjbnRzOwo+Pj4gwqDCoMKgwqAgdWludDMyX3Qg
dmFsOwo+Pj4gwqDCoMKgwqAgc3RydWN0IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3Qg
d3JpdGU7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHJlYWRlcnM7Cj4+PiDCoMKgwqDC
oCB9Owo+Pj4gfTsKPj4+Cj4+PiBzdGF0aWMgaW5saW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFz
KAo+Pj4gwqDCoMKgwqAgY29uc3QgdW5pb24gcndsb2Nrd29yZCB7Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgIC53cml0ZSA9IDAsCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5yZWFkZXJzID0gMQo+Pj4gwqDC
oMKgwqAgfSB4Owo+Pj4KPj4+IMKgwqDCoMKgIHJldHVybiB4LnZhbDsKPj4+IH0KPj4+Cj4+PiAu
Li4KPj4+IMKgwqDCoMKgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfcXJfYmlhcygpLCAmbG9j
ay0+Y250cyk7Cj4+PiAuLi4KPj4+Cj4+PiBJIGd1ZXNzIHRoaXMgc2hvdWxkIGRvIHRoZSB0cmlj
aywgbm8/Cj4+Cj4+IFlvdSBhcmUgYXNzdW1pbmcgdGhlIGF0b21pY190IGxheW91dCB3aGljaCBJ
IHdvdWxkIHJhdGhlciBubyB3YW50IHRvIAo+PiBoYXBwZW4uCj4gCj4gVGhhdCBhbHJlYWR5IGhh
cHBlbmVkLiByd2xvY2suaCBhbHJlYWR5IGFzc3VtZXMgYXRvbWljX3QgdG8gYmUgMzIgYml0cwo+
IHdpZGUuCgpFeGFjdGx5IDMyIGJpdHMsIG9yIGF0IGxlYXN0IGFzIG1hbnk/CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
