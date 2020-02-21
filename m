Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39A16806D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:37:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Ol-0001ub-AC; Fri, 21 Feb 2020 14:35:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j59Ok-0001uW-Cx
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:35:22 +0000
X-Inumbo-ID: 63639128-54b7-11ea-868e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63639128-54b7-11ea-868e-12813bfff9fa;
 Fri, 21 Feb 2020 14:35:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8856EADD7;
 Fri, 21 Feb 2020 14:35:20 +0000 (UTC)
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <92fa042e-a880-8b56-4255-c8d19654908b@suse.com>
Date: Fri, 21 Feb 2020 15:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5005d791-7d8f-ca03-4c16-7dc9d19bc8e6@xen.org>
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

T24gMjEuMDIuMjAgMTU6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAyMS8wMi8y
MDIwIDE0OjE2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMS4wMi4yMCAxNToxMSwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGkgSnVlcmdlbiwKPj4+Cj4+PiBPbiAyMS8wMi8yMDIwIDE0
OjA2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9uIDIxLjAyLjIwIDE0OjQ5LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDIxLzAyLzIwMjAgMTM6NDYsIErDvHJn
ZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+PiBPbiAyMS4wMi4yMCAxNDozNiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4+Pj4+Pj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6MjA6MDZQTSArMDAwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+Pj4+Pj4+Pj4gSGksCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gT24gMjAvMDIv
MjAyMCAxNzozMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+Pj4+IEFsbG93IGEgQ1BV
IGFscmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIHRvIGFsc28gCj4+Pj4+Pj4+
Pj4gbG9jayBpdCBpbgo+Pj4+Pj4+Pj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFs
bG93aW5nIHJlYWQgbG9ja2luZyBhIHJ3bG9jayAKPj4+Pj4+Pj4+PiB0aGF0J3MKPj4+Pj4+Pj4+
PiBhbHJlYWR5IG93bmVkIGJ5IHRoZSBjYWxsZXIgKGllOiBDUFUpIGluIHdyaXRlIG1vZGUuIEFs
bG93aW5nIAo+Pj4+Pj4+Pj4+IHN1Y2gKPj4+Pj4+Pj4+PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBh
dCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4g
SW4gb3JkZXIgdG8gZG8gdGhpcyByZXNlcnZlIDE0Yml0cyBvZiB0aGUgbG9jaywgdGhpcyBhbGxv
d3MgdG8gCj4+Pj4+Pj4+Pj4gc3VwcG9ydAo+Pj4+Pj4+Pj4+IHVwIHRvIDE2Mzg0IENQVXMuIEFs
c28gcmVkdWNlIHRoZSB3cml0ZSBsb2NrIG1hc2sgdG8gMiBiaXRzOiAKPj4+Pj4+Pj4+PiBvbmUg
dG8KPj4+Pj4+Pj4+PiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9u
IHRoZSBsb2NrIGFuZCB0aGUgCj4+Pj4+Pj4+Pj4gb3RoZXIgdG8KPj4+Pj4+Pj4+PiBzaWduYWwg
dGhlIGxvY2sgaXMgb3duZWQgaW4gd3JpdGUgbW9kZS4gTm90ZSB0aGUgd3JpdGUgcmVsYXRlZCAK
Pj4+Pj4+Pj4+PiBkYXRhCj4+Pj4+Pj4+Pj4gaXMgdXNpbmcgMTZiaXRzLCB0aGlzIGlzIGRvbmUg
aW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjbGVhciBpdCAKPj4+Pj4+Pj4+PiAoYW5kCj4+Pj4+Pj4+
Pj4gdGh1cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoaXMgcmVkdWNlcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgY29u
Y3VycmVudCByZWFkZXJzIGZyb20gCj4+Pj4+Pj4+Pj4gMTY3NzcyMTYgdG8KPj4+Pj4+Pj4+PiA2
NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxv
Y2sgCj4+Pj4+Pj4+Pj4gZmllbGQKPj4+Pj4+Pj4+PiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAzMiB0
byA2NGJpdHMgaWYgYWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCAKPj4+Pj4+Pj4+PiBhdG9taWMK
Pj4+Pj4+Pj4+PiBvcGVyYXRpb25zIG9uIDY0Yml0IGludGVnZXJzLgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBhdG9taWMgb3BlcmF0aW9ucyBvbiA2
NC1iaXQgCj4+Pj4+Pj4+PiBpbnRlZ2Vycy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gwqDCoCBzdGF0
aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xvY2tfdCAqbG9jaykKPj4+Pj4+Pj4+PiDC
oMKgIHsKPj4+Pj4+Pj4+PiAtwqDCoMKgIC8qCj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgICogSWYgdGhl
IHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIAo+Pj4+Pj4+Pj4+IGRp
cmVjdGx5Lgo+Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRy
YWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciAKPj4+Pj4+Pj4+PiBpdC4KPj4+Pj4+Pj4+PiAt
wqDCoMKgwqAgKi8KPj4+Pj4+Pj4+PiAtwqDCoMKgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxv
Y2stPmNudHMpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBp
cyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIAo+Pj4+Pj4+Pj4+IGRpcmVjdGx5LiAqLwo+Pj4+
Pj4+Pj4+ICvCoMKgwqAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3JlYWQo
JmxvY2stPmNudHMpKSk7Cj4+Pj4+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oX1FSX1NISUZU
ICE9IDE2KTsKPj4+Pj4+Pj4+PiArwqDCoMKgIHdyaXRlX2F0b21pYygodWludDE2X3QgKikmbG9j
ay0+Y250cywgMCk7Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSB0aGluayB0aGlzIGlzIGFuIGFidXNl
IHRvIGNhc3QgYW4gYXRvbWljX3QoKSBkaXJlY3RseSBpbnRvIGEgCj4+Pj4+Pj4+PiB1aW50MTZf
dC4gWW91Cj4+Pj4+Pj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5j
b3VudGVyIGhlcmUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91
dCB0aGlzIG15c2VsZi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1l
bnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVkIAo+Pj4+Pj4+PiB1cG9uCj4+
Pj4+Pj4+IGNvbW1pdCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNzdWVzLgo+Pj4+Pj4+Cj4+Pj4+
Pj4gSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIgaGVy
ZS4gQSBjYXN0IGxpa2UKPj4+Pj4+PiB0aGlzIG9uZSBpcyBlbmRpYW5uZXNzLXVuc2FmZSwgYW5k
IGhlbmNlIGEgdHJhcCB3YWl0aW5nIGZvciBhIGJpZwo+Pj4+Pj4+IGVuZGlhbiBwb3J0IGF0dGVt
cHQgdG8gZmFsbCBpbnRvLiBBdCB0aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCAKPj4+Pj4+PiBj
YXVzZQo+Pj4+Pj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4g
YmV0dGVyIHdvdWxkIGJlIGlmIGl0IAo+Pj4+Pj4+IHdhcwo+Pj4+Pj4+IGVuZGlhbm5lc3Mtc2Fm
ZS4KPj4+Pj4+Cj4+Pj4+PiBXb3VsZG4ndCBhIHVuaW9uIGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+
Pj4+Pgo+Pj4+PiBZb3Ugd291bGQgbm90IGJlIGFibGUgdG8gdXNlIGF0b21pY190IGluIHRoYXQg
Y2FzZSBhcyB5b3UgY2FuJ3QgCj4+Pj4+IGFzc3VtZSB0aGUgbGF5b3V0IG9mIHRoZSBzdHJ1Y3R1
cmUuCj4+Pj4KPj4+PiB1bmlvbiByd2xvY2t3b3JkIHsKPj4+PiDCoMKgwqDCoCBhdG9taWNfdCBj
bnRzOwo+Pj4+IMKgwqDCoMKgIHVpbnQzMl90IHZhbDsKPj4+PiDCoMKgwqDCoCBzdHJ1Y3Qgewo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDE2X3Qgd3JpdGU7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCB1aW50MTZfdCByZWFkZXJzOwo+Pj4+IMKgwqDCoMKgIH07Cj4+Pj4gfTsKPj4+Pgo+Pj4+IHN0
YXRpYyBpbmxpbmUgY29uc3QgdWludDMyX3QgX3FyX2JpYXMoCj4+Pj4gwqDCoMKgwqAgY29uc3Qg
dW5pb24gcndsb2Nrd29yZCB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAud3JpdGUgPSAwLAo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqAgLnJlYWRlcnMgPSAxCj4+Pj4gwqDCoMKgwqAgfSB4Owo+Pj4+Cj4+
Pj4gwqDCoMKgwqAgcmV0dXJuIHgudmFsOwo+Pj4+IH0KPj4+Pgo+Pj4+IC4uLgo+Pj4+IMKgwqDC
oMKgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfcXJfYmlhcygpLCAmbG9jay0+Y250cyk7Cj4+
Pj4gLi4uCj4+Pj4KPj4+PiBJIGd1ZXNzIHRoaXMgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/Cj4+
Pgo+Pj4gWW91IGFyZSBhc3N1bWluZyB0aGUgYXRvbWljX3QgbGF5b3V0IHdoaWNoIEkgd291bGQg
cmF0aGVyIG5vIHdhbnQgdG8gCj4+PiBoYXBwZW4uCj4+Cj4+IFRoYXQgYWxyZWFkeSBoYXBwZW5l
ZC4gcndsb2NrLmggYWxyZWFkeSBhc3N1bWVzIGF0b21pY190IHRvIGJlIDMyIGJpdHMKPj4gd2lk
ZS4gSSBhZ3JlZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBhbiBhdG9taWMzMl90IHR5cGUg
Zm9yIHRoaXMKPj4gdXNlIGNhc2UuCj4gCj4gSSBkb24ndCB0aGluayB5b3UgdW5kZXJzdG9vZCBt
eSBwb2ludCBoZXJlLiBBbiBhdG9taWMzMl90IHdpbGwgbm90IGJlIAo+IGJldHRlciBhcyB5b3Ug
c3RpbGwgYXNzdW1lIHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4gSS5lIHRoZSAKPiBzdHJ1
Y3R1cmUgaGFzIG9ubHkgb25lIGZpZWxkLgoKSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcmVhc29u
aW5nIGhlcmUsIHNvcnJ5LgoKQXJlIHlvdSBzYXlpbmcgdGhhdCBhIHN0cnVjdHVyZSBvZiB0d28g
dWludDE2X3QgaXNuJ3Qga25vd24gdG8gYmUgMzIKYml0cyBsb25nPwoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
