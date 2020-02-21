Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF45168017
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:22:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j599e-0007nl-Ml; Fri, 21 Feb 2020 14:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j599e-0007ng-0s
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:19:46 +0000
X-Inumbo-ID: 354a55bc-54b5-11ea-867b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 354a55bc-54b5-11ea-867b-12813bfff9fa;
 Fri, 21 Feb 2020 14:19:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83EA5ABD1;
 Fri, 21 Feb 2020 14:19:44 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <4f37297b-117e-72a8-838f-e27adc495bf3@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <740b900e-dc38-1b49-ab34-f67043768a43@suse.com>
Date: Fri, 21 Feb 2020 15:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4f37297b-117e-72a8-838f-e27adc495bf3@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAgMTU6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAyLjIwMjAgMTU6
MDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIxLjAyLjIwIDE0OjQ5LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIxLzAyLzIwMjAgMTM6NDYsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4+Pj4gT24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+Pj4gT24gVGh1
LCBGZWIgMjAsIDIwMjAgYXQgMDc6MjA6MDZQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4+Pj4+IEhpLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMjAvMDIvMjAyMCAxNzozMSwgUm9nZXIgUGF1
IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcgdGhlIGxv
Y2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPj4+Pj4+Pj4gcmVhZCBtb2RlLiBU
aGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+
Pj4+Pj4+PiBhbHJlYWR5IG93bmVkIGJ5IHRoZSBjYWxsZXIgKGllOiBDUFUpIGluIHdyaXRlIG1v
ZGUuIEFsbG93aW5nIHN1Y2gKPj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3Qg
Zm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSW4gb3JkZXIgdG8g
ZG8gdGhpcyByZXNlcnZlIDE0Yml0cyBvZiB0aGUgbG9jaywgdGhpcyBhbGxvd3MgdG8KPj4+Pj4+
Pj4gc3VwcG9ydAo+Pj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3Jp
dGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4+Pj4+Pj4+IHNpZ25hbCB0aGVyZSBhcmUg
cGVuZGluZyB3cml0ZXJzIHdhaXRpbmcgb24gdGhlIGxvY2sgYW5kIHRoZSBvdGhlciB0bwo+Pj4+
Pj4+PiBzaWduYWwgdGhlIGxvY2sgaXMgb3duZWQgaW4gd3JpdGUgbW9kZS4gTm90ZSB0aGUgd3Jp
dGUgcmVsYXRlZCBkYXRhCj4+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGlu
IG9yZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+Pj4+Pj4+PiB0aHVzIHJlbGVhc2Ug
dGhlIGxvY2spIHVzaW5nIGEgMTZiaXQgYXRvbWljIHdyaXRlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBU
aGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9t
Cj4+Pj4+Pj4+IDE2Nzc3MjE2IHRvCj4+Pj4+Pj4+IDY1NTM2LCBJIHRoaW5rIHRoaXMgc2hvdWxk
IHN0aWxsIGJlIGVub3VnaCwgb3IgZWxzZSB0aGUgbG9jayBmaWVsZAo+Pj4+Pj4+PiBjYW4gYmUg
ZXhwYW5kZWQgZnJvbSAzMiB0byA2NGJpdHMgaWYgYWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBh
dG9taWMKPj4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pgo+Pj4+
Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBhdG9taWMgb3BlcmF0aW9ucyBvbiA2
NC1iaXQgaW50ZWdlcnMuCj4+Pj4+Pj4KPj4+Pj4+Pj4gIMKgwqAgc3RhdGljIGlubGluZSB2b2lk
IF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+Pj4+ICDCoMKgIHsKPj4+Pj4+Pj4g
LcKgwqDCoCAvKgo+Pj4+Pj4+PiAtwqDCoMKgwqAgKiBJZiB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0
b21pYywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuCj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIE90
aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4K
Pj4+Pj4+Pj4gLcKgwqDCoMKgICovCj4+Pj4+Pj4+IC3CoMKgwqAgYXRvbWljX3N1YihfUVdfTE9D
S0VELCAmbG9jay0+Y250cyk7Cj4+Pj4+Pj4+ICvCoMKgwqAgLyogU2luY2UgdGhlIHdyaXRlciBm
aWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkCj4+Pj4+Pj4+IGRpcmVjdGx5LiAqLwo+
Pj4+Pj4+PiArwqDCoMKgIEFTU0VSVChfaXNfd3JpdGVfbG9ja2VkX2J5X21lKGF0b21pY19yZWFk
KCZsb2NrLT5jbnRzKSkpOwo+Pj4+Pj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQg
IT0gMTYpOwo+Pj4+Pj4+PiArwqDCoMKgIHdyaXRlX2F0b21pYygodWludDE2X3QgKikmbG9jay0+
Y250cywgMCk7Cj4+Pj4+Pj4KPj4+Pj4+PiBJIHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8gY2Fz
dCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5IGludG8gYQo+Pj4+Pj4+IHVpbnQxNl90LiBZb3UKPj4+
Pj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5jb3VudGVyIGhlcmUu
Cj4+Pj4+Pgo+Pj4+Pj4gU3VyZSwgSSB3YXMgd29uZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+
Pj4+Pj4KPj4+Pj4+IFdpbGwgd2FpdCBmb3IgbW9yZSBjb21tZW50cywgbm90IHN1cmUgd2hldGhl
ciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCj4+Pj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90
aGVyIGlzc3Vlcy4KPj4+Pj4KPj4+Pj4gSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhl
ciBmaWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxpa2UKPj4+Pj4gdGhpcyBvbmUgaXMgZW5k
aWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKPj4+Pj4g
ZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMg
c2hvdWxkIGNhdXNlCj4+Pj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMs
IGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIGl0IHdhcwo+Pj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4+
Pj4KPj4+PiBXb3VsZG4ndCBhIHVuaW9uIGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+Pj4KPj4+IFlv
dSB3b3VsZCBub3QgYmUgYWJsZSB0byB1c2UgYXRvbWljX3QgaW4gdGhhdCBjYXNlIGFzIHlvdSBj
YW4ndCBhc3N1bWUKPj4+IHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4KPj4KPj4gdW5pb24g
cndsb2Nrd29yZCB7Cj4+ICAgICAgIGF0b21pY190IGNudHM7Cj4+ICAgICAgIHVpbnQzMl90IHZh
bDsKPj4gICAgICAgc3RydWN0IHsKPj4gICAgICAgICAgIHVpbnQxNl90IHdyaXRlOwo+PiAgICAg
ICAgICAgdWludDE2X3QgcmVhZGVyczsKPj4gICAgICAgfTsKPj4gfTsKPj4KPj4gc3RhdGljIGlu
bGluZSBjb25zdCB1aW50MzJfdCBfcXJfYmlhcygKPj4gICAgICAgY29uc3QgdW5pb24gcndsb2Nr
d29yZCB7Cj4+ICAgICAgICAgICAud3JpdGUgPSAwLAo+PiAgICAgICAgICAgLnJlYWRlcnMgPSAx
Cj4+ICAgICAgIH0geDsKPj4KPj4gICAgICAgcmV0dXJuIHgudmFsOwo+PiB9Cj4+Cj4+IC4uLgo+
PiAgICAgICBjbnRzID0gYXRvbWljX2FkZF9yZXR1cm4oX3FyX2JpYXMoKSwgJmxvY2stPmNudHMp
Owo+PiAuLi4KPj4KPj4gSSBndWVzcyB0aGlzIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwo+IAo+
IEknbSBhZnJhaWQgaXQgd29uJ3QsIGFuZCBub3QganVzdCBiZWNhdXNlIG9mIHRoZSBzaXplb2Yo
KSBhc3BlY3QKPiBhbHJlYWR5IHBvaW50ZWQgb3V0LiBZb3VyIHggdmFyaWFibGUgd291bGQgZW5k
IHVwIGxpa2UgdGhpcyBpbgo+IG1lbW9yeToKPiAKPiBsaXR0bGU6CTAwIDAwIDAxIDAwCj4gYmln
OgkwMCAwMCAwMCAwMSA9PiAwMDAwMDAwMQo+IAo+IHdoaWNoLCByZWFkIGFzIDMyLWJpdCB2YWx1
ZSwgdGhlbiBlbmRzIHVwIGJlaW5nCj4gCj4gbGl0dGxlOgkwMDAxMDAwMAo+IGJpZzoJMDAwMDAw
MDEKPiAKPiBUaGUgYWRkIHRoZXJlZm9yZSB3b3VsZCBiZSBhYmxlIHRvIHNwaWxsIGludG8gdGhl
IGhpZ2ggMTYgYml0cy4KCkFuZCB3aHkgZXhhY3RseSBpcyB0aGlzIHdvcnNlIHRoYW4ganVzdCBk
cm9wcGluZyBzcGlsbGVkIGJpdHM/CkJvdGggY2FzZXMgd2lsbCBleHBsb2RlIHJhdGhlciBzb29u
LiBCb3RoIGNhc2VzIGNhbiBiZSBhdm9pZGVkIGJ5CmludHJvZHVjdGlvbiBvZiBlLmcuIEFTU0VS
VGluZyB0aGF0IHJlYWRlciBpc24ndCB+MCBiZWZvcmUKaW5jcmVtZW50aW5nIGl0IChvciB0byBi
ZSB6ZXJvIGFmdGVyd2FyZHMpLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
