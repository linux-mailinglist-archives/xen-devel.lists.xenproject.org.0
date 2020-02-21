Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D4168178
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:25:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5A9C-0000dH-1K; Fri, 21 Feb 2020 15:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5A9B-0000dC-Cu
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:23:21 +0000
X-Inumbo-ID: 16c8c08f-54be-11ea-869d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16c8c08f-54be-11ea-869d-12813bfff9fa;
 Fri, 21 Feb 2020 15:23:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7287BB436;
 Fri, 21 Feb 2020 15:23:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
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
 <0b7ea2b3-bb41-c85b-c75d-0fc2ff833c76@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2049bdec-56a7-16bc-295c-d8cc967f4295@suse.com>
Date: Fri, 21 Feb 2020 16:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0b7ea2b3-bb41-c85b-c75d-0fc2ff833c76@suse.com>
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

T24gMjEuMDIuMjAgMTY6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAyLjIwMjAgMTY6
MTMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIxLjAyLjIwIDE1OjUxLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIxLzAyLzIwMjAgMTQ6MzUsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4+Pj4gT24gMjEuMDIuMjAgMTU6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4K
Pj4+Pj4KPj4+Pj4gT24gMjEvMDIvMjAyMCAxNDoxNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+
Pj4+IE9uIDIxLjAyLjIwIDE1OjExLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4gSGkgSnVl
cmdlbiwKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIDIxLzAyLzIwMjAgMTQ6MDYsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4+Pj4+Pj4+IE9uIDIxLjAyLjIwIDE0OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9uIDIxLzAyLzIwMjAgMTM6NDYsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+Pj4+Pj4+Pj4gT24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4+Pj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Pj4+Pj4+Pj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6MjA6MDZQTSArMDAw
MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+Pj4gT24gMjAvMDIvMjAyMCAxNzozMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
Pj4+Pj4+Pj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3Jp
dGUgbW9kZSB0byBhbHNvCj4+Pj4+Pj4+Pj4+Pj4+IGxvY2sgaXQgaW4KPj4+Pj4+Pj4+Pj4+Pj4g
cmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVhZCBsb2NraW5nIGEgcnds
b2NrCj4+Pj4+Pj4+Pj4+Pj4+IHRoYXQncwo+Pj4+Pj4+Pj4+Pj4+PiBhbHJlYWR5IG93bmVkIGJ5
IHRoZSBjYWxsZXIgKGllOiBDUFUpIGluIHdyaXRlIG1vZGUuCj4+Pj4+Pj4+Pj4+Pj4+IEFsbG93
aW5nIHN1Y2gKPj4+Pj4+Pj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3QgZm9y
IHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gSW4g
b3JkZXIgdG8gZG8gdGhpcyByZXNlcnZlIDE0Yml0cyBvZiB0aGUgbG9jaywgdGhpcyBhbGxvd3MK
Pj4+Pj4+Pj4+Pj4+Pj4gdG8gc3VwcG9ydAo+Pj4+Pj4+Pj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVz
LiBBbHNvIHJlZHVjZSB0aGUgd3JpdGUgbG9jayBtYXNrIHRvIDIgYml0czoKPj4+Pj4+Pj4+Pj4+
Pj4gb25lIHRvCj4+Pj4+Pj4+Pj4+Pj4+IHNpZ25hbCB0aGVyZSBhcmUgcGVuZGluZyB3cml0ZXJz
IHdhaXRpbmcgb24gdGhlIGxvY2sgYW5kIHRoZQo+Pj4+Pj4+Pj4+Pj4+PiBvdGhlciB0bwo+Pj4+
Pj4+Pj4+Pj4+PiBzaWduYWwgdGhlIGxvY2sgaXMgb3duZWQgaW4gd3JpdGUgbW9kZS4gTm90ZSB0
aGUgd3JpdGUKPj4+Pj4+Pj4+Pj4+Pj4gcmVsYXRlZCBkYXRhCj4+Pj4+Pj4+Pj4+Pj4+IGlzIHVz
aW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIKPj4+
Pj4+Pj4+Pj4+Pj4gaXQgKGFuZAo+Pj4+Pj4+Pj4+Pj4+PiB0aHVzIHJlbGVhc2UgdGhlIGxvY2sp
IHVzaW5nIGEgMTZiaXQgYXRvbWljIHdyaXRlLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBm
cm9tCj4+Pj4+Pj4+Pj4+Pj4+IDE2Nzc3MjE2IHRvCj4+Pj4+Pj4+Pj4+Pj4+IDY1NTM2LCBJIHRo
aW5rIHRoaXMgc2hvdWxkIHN0aWxsIGJlIGVub3VnaCwgb3IgZWxzZSB0aGUgbG9jawo+Pj4+Pj4+
Pj4+Pj4+PiBmaWVsZAo+Pj4+Pj4+Pj4+Pj4+PiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAzMiB0byA2
NGJpdHMgaWYgYWxsIGFyY2hpdGVjdHVyZXMKPj4+Pj4+Pj4+Pj4+Pj4gc3VwcG9ydCBhdG9taWMK
Pj4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBhdG9taWMgb3Bl
cmF0aW9ucyBvbiA2NC1iaXQKPj4+Pj4+Pj4+Pj4+PiBpbnRlZ2Vycy4KPj4+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+Pj4+PiAgwqDCoCBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xv
Y2tfdCAqbG9jaykKPj4+Pj4+Pj4+Pj4+Pj4gIMKgwqAgewo+Pj4+Pj4+Pj4+Pj4+PiAtwqDCoMKg
IC8qCj4+Pj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIElmIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRv
bWljLCBpdCBjYW4gYmUgY2xlYXJlZAo+Pj4+Pj4+Pj4+Pj4+PiBkaXJlY3RseS4KPj4+Pj4+Pj4+
Pj4+Pj4gLcKgwqDCoMKgICogT3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rpb24gd2lsbCBi
ZSB1c2VkIHRvCj4+Pj4+Pj4+Pj4+Pj4+IGNsZWFyIGl0Lgo+Pj4+Pj4+Pj4+Pj4+PiAtwqDCoMKg
wqAgKi8KPj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoCBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2Nr
LT5jbnRzKTsKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxk
IGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQKPj4+Pj4+Pj4+Pj4+Pj4gZGlyZWN0bHkuICov
Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRv
bWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgQlVJTERfQlVH
X09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgd3JpdGVfYXRvbWlj
KCh1aW50MTZfdCAqKSZsb2NrLT5jbnRzLCAwKTsKPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkg
aW50bwo+Pj4+Pj4+Pj4+Pj4+IGEgdWludDE2X3QuIFlvdQo+Pj4+Pj4+Pj4+Pj4+IHdvdWxkIGF0
IGxlYXN0IHdhbnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+PiBTdXJlLCBJIHdhcyB3b25kZXJpbmcgYWJvdXQgdGhpcyBteXNlbGYuCj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qg
c3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlCj4+Pj4+Pj4+Pj4+PiBmaXhlZCB1cG9uCj4+Pj4+Pj4+
Pj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4gSXQncyBtb3JlIHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZp
ZXIgaGVyZS4gQSBjYXN0Cj4+Pj4+Pj4+Pj4+IGxpa2UKPj4+Pj4+Pj4+Pj4gdGhpcyBvbmUgaXMg
ZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKPj4+
Pj4+Pj4+Pj4gZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxl
YXN0IHRoaXMgc2hvdWxkCj4+Pj4+Pj4+Pj4+IGNhdXNlCj4+Pj4+Pj4+Pj4+IGEgYnVpbGQgZmFp
bHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmCj4+Pj4+
Pj4+Pj4+IGl0IHdhcwo+Pj4+Pj4+Pj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBXb3VsZG4ndCBhIHVuaW9uIGJlIHRoZSBiZXR0ZXIgY2hvaWNlPwo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IFlvdSB3b3VsZCBub3QgYmUgYWJsZSB0byB1c2UgYXRvbWljX3QgaW4gdGhhdCBj
YXNlIGFzIHlvdSBjYW4ndAo+Pj4+Pj4+Pj4gYXNzdW1lIHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVj
dHVyZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gdW5pb24gcndsb2Nrd29yZCB7Cj4+Pj4+Pj4+ICDCoMKg
wqDCoCBhdG9taWNfdCBjbnRzOwo+Pj4+Pj4+PiAgwqDCoMKgwqAgdWludDMyX3QgdmFsOwo+Pj4+
Pj4+PiAgwqDCoMKgwqAgc3RydWN0IHsKPj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgdWludDE2
X3Qgd3JpdGU7Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHJlYWRlcnM7Cj4+
Pj4+Pj4+ICDCoMKgwqDCoCB9Owo+Pj4+Pj4+PiB9Owo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBzdGF0aWMg
aW5saW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFzKAo+Pj4+Pj4+PiAgwqDCoMKgwqAgY29uc3Qg
dW5pb24gcndsb2Nrd29yZCB7Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC53cml0ZSA9IDAs
Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC5yZWFkZXJzID0gMQo+Pj4+Pj4+PiAgwqDCoMKg
wqAgfSB4Owo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgwqDCoMKgwqAgcmV0dXJuIHgudmFsOwo+Pj4+Pj4+
PiB9Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+PiAgwqDCoMKgwqAgY250cyA9IGF0b21p
Y19hZGRfcmV0dXJuKF9xcl9iaWFzKCksICZsb2NrLT5jbnRzKTsKPj4+Pj4+Pj4gLi4uCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IEkgZ3Vlc3MgdGhpcyBzaG91bGQgZG8gdGhlIHRyaWNrLCBubz8KPj4+Pj4+
Pgo+Pj4+Pj4+IFlvdSBhcmUgYXNzdW1pbmcgdGhlIGF0b21pY190IGxheW91dCB3aGljaCBJIHdv
dWxkIHJhdGhlciBubyB3YW50Cj4+Pj4+Pj4gdG8gaGFwcGVuLgo+Pj4+Pj4KPj4+Pj4+IFRoYXQg
YWxyZWFkeSBoYXBwZW5lZC4gcndsb2NrLmggYWxyZWFkeSBhc3N1bWVzIGF0b21pY190IHRvIGJl
IDMyIGJpdHMKPj4+Pj4+IHdpZGUuIEkgYWdyZWUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUg
YW4gYXRvbWljMzJfdCB0eXBlIGZvciB0aGlzCj4+Pj4+PiB1c2UgY2FzZS4KPj4+Pj4KPj4+Pj4g
SSBkb24ndCB0aGluayB5b3UgdW5kZXJzdG9vZCBteSBwb2ludCBoZXJlLiBBbiBhdG9taWMzMl90
IHdpbGwgbm90IGJlCj4+Pj4+IGJldHRlciBhcyB5b3Ugc3RpbGwgYXNzdW1lIHRoZSBsYXlvdXQg
b2YgdGhlIHN0cnVjdHVyZS4gSS5lIHRoZQo+Pj4+PiBzdHJ1Y3R1cmUgaGFzIG9ubHkgb25lIGZp
ZWxkLgo+Pj4+Cj4+Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcmVhc29uaW5nIGhlcmUsIHNv
cnJ5Lgo+Pj4+Cj4+Pj4gQXJlIHlvdSBzYXlpbmcgdGhhdCBhIHN0cnVjdHVyZSBvZiB0d28gdWlu
dDE2X3QgaXNuJ3Qga25vd24gdG8gYmUgMzIKPj4+PiBiaXRzIGxvbmc/Cj4+Pgo+Pj4gWW91IGFy
ZSBhc3N1bWluZyB0aGF0IGF0b21pY190IHdpbGwgYWx3YXlzIGJlOgo+Pj4KPj4+IHN0cnVjdAo+
Pj4gewo+Pj4gICDCoCBpbnQgY291bnRlcjsKPj4+IH0KPj4+Cj4+PiBXaGF0IGlmIHdlIGRlY2lk
ZSB0byB0dXJuIGludG8KPj4+Cj4+PiBzdHJ1Y3QKPj4+IHsKPj4+ICAgwqAgYm9vbCBhOwo+Pj4g
ICDCoCBpbnQgY291bnRlcjsKPj4+IH0KPj4KPj4gQXMgc2FpZCBiZWZvcmU6IHRoZW4gcXVldWVf
d3JpdGVfbG9ja19zbG93cGF0aCgpIGlzIGFscmVhZHkgYnJva2VuLgo+IAo+IFdoeT8gVGhlIGF0
b21pY18qKCkgdXNlZCB3b3VsZCBzdGlsbCBvbmx5IGFjdCBvbiB0aGUgY291bnRlciBmaWVsZAo+
IChmb3IgdGhlaXIgYWN0dWFsIG9wZXJhdGlvbiwgaS5lLiB3aGF0IG1hdHRlcnMgdG8gY2FsbGVy
czsgdGhlCj4gb3RoZXIgZmllbGQocykgY291bGQgYmUgc3RhdGlzdGljcyBvciB3aGF0ZXZlciku
CgpObzoKCnUzMiBjbnRzOwouLi4KaWYgKCAhKGNudHMgJiBfUVdfV01BU0spICYmCiAgICAgIChh
dG9taWNfY21weGNoZygmbG9jay0+Y250cywgY250cywKICAgICAgICAgICAgICAgICAgICAgIGNu
dHMgfCBfUVdfV0FJVElORykgPT0gY250cykgKQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
