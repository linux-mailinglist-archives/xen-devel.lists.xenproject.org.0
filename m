Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497A167FF2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:18:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5966-0007O8-JR; Fri, 21 Feb 2020 14:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5965-0007Nn-4E
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:16:05 +0000
X-Inumbo-ID: b1758d38-54b4-11ea-867b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1758d38-54b4-11ea-867b-12813bfff9fa;
 Fri, 21 Feb 2020 14:16:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5882AAC8F;
 Fri, 21 Feb 2020 14:16:03 +0000 (UTC)
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
Date: Fri, 21 Feb 2020 15:16:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
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

T24gMjEuMDIuMjAgMTU6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDIxLzAyLzIwMjAgMTQ6MDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIxLjAyLjIw
IDE0OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIxLzAyLzIwMjAgMTM6
NDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Pj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6MjA6MDZQTSArMDAwMCwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMjAvMDIvMjAy
MCAxNzozMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJl
YWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgCj4+Pj4+Pj4+
IGl0IGluCj4+Pj4+Pj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFsbG93aW5nIHJl
YWQgbG9ja2luZyBhIHJ3bG9jayB0aGF0J3MKPj4+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUg
Y2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+Pj4+IGFj
Y2Vzc2VzIGlzIHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2UuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhl
IGxvY2ssIHRoaXMgYWxsb3dzIHRvIAo+Pj4+Pj4+PiBzdXBwb3J0Cj4+Pj4+Pj4+IHVwIHRvIDE2
Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0ZSBsb2NrIG1hc2sgdG8gMiBiaXRzOiBvbmUg
dG8KPj4+Pj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0
aGUgbG9jayBhbmQgdGhlIAo+Pj4+Pj4+PiBvdGhlciB0bwo+Pj4+Pj4+PiBzaWduYWwgdGhlIGxv
Y2sgaXMgb3duZWQgaW4gd3JpdGUgbW9kZS4gTm90ZSB0aGUgd3JpdGUgcmVsYXRlZCBkYXRhCj4+
Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUg
dG8gY2xlYXIgaXQgKGFuZAo+Pj4+Pj4+PiB0aHVzIHJlbGVhc2UgdGhlIGxvY2spIHVzaW5nIGEg
MTZiaXQgYXRvbWljIHdyaXRlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1h
eGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIAo+Pj4+Pj4+PiAxNjc3NzIx
NiB0bwo+Pj4+Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gs
IG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPj4+Pj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIg
dG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgCj4+Pj4+Pj4+IGF0b21pYwo+
Pj4+Pj4+PiBvcGVyYXRpb25zIG9uIDY0Yml0IGludGVnZXJzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gRldJ
VywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9uIDY0LWJpdCBp
bnRlZ2Vycy4KPj4+Pj4+Pgo+Pj4+Pj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVf
dW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+Pj4+Pj4+PiDCoMKgIHsKPj4+Pj4+Pj4gLcKgwqDCoCAv
Kgo+Pj4+Pj4+PiAtwqDCoMKgwqAgKiBJZiB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQg
Y2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuCj4+Pj4+Pj4+IC3CoMKgwqDCoCAqIE90aGVyd2lzZSwg
YW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+Pj4g
LcKgwqDCoMKgICovCj4+Pj4+Pj4+IC3CoMKgwqAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9j
ay0+Y250cyk7Cj4+Pj4+Pj4+ICvCoMKgwqAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBh
dG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIAo+Pj4+Pj4+PiBkaXJlY3RseS4gKi8KPj4+Pj4+Pj4g
K8KgwqDCoCBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+
Y250cykpKTsKPj4+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oX1FSX1NISUZUICE9IDE2KTsK
Pj4+Pj4+Pj4gK8KgwqDCoCB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMsIDAp
Owo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayB0aGlzIGlzIGFuIGFidXNlIHRvIGNhc3QgYW4gYXRv
bWljX3QoKSBkaXJlY3RseSBpbnRvIGEgCj4+Pj4+Pj4gdWludDE2X3QuIFlvdQo+Pj4+Pj4+IHdv
dWxkIGF0IGxlYXN0IHdhbnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4+Pj4+
Cj4+Pj4+PiBTdXJlLCBJIHdhcyB3b25kZXJpbmcgYWJvdXQgdGhpcyBteXNlbGYuCj4+Pj4+Pgo+
Pj4+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMg
Y2FuIGJlIGZpeGVkIHVwb24KPj4+Pj4+IGNvbW1pdCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNz
dWVzLgo+Pj4+Pgo+Pj4+PiBJdCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBhbm90aGVyIGZpZWxk
IHNwZWNpZmllciBoZXJlLiBBIGNhc3QgbGlrZQo+Pj4+PiB0aGlzIG9uZSBpcyBlbmRpYW5uZXNz
LXVuc2FmZSwgYW5kIGhlbmNlIGEgdHJhcCB3YWl0aW5nIGZvciBhIGJpZwo+Pj4+PiBlbmRpYW4g
cG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQg
Y2F1c2UKPj4+Pj4gYSBidWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVtcywgZXZlbiBi
ZXR0ZXIgd291bGQgYmUgaWYgaXQgd2FzCj4+Pj4+IGVuZGlhbm5lc3Mtc2FmZS4KPj4+Pgo+Pj4+
IFdvdWxkbid0IGEgdW5pb24gYmUgdGhlIGJldHRlciBjaG9pY2U/Cj4+Pgo+Pj4gWW91IHdvdWxk
IG5vdCBiZSBhYmxlIHRvIHVzZSBhdG9taWNfdCBpbiB0aGF0IGNhc2UgYXMgeW91IGNhbid0IAo+
Pj4gYXNzdW1lIHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4KPj4KPj4gdW5pb24gcndsb2Nr
d29yZCB7Cj4+IMKgwqDCoMKgIGF0b21pY190IGNudHM7Cj4+IMKgwqDCoMKgIHVpbnQzMl90IHZh
bDsKPj4gwqDCoMKgwqAgc3RydWN0IHsKPj4gwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCB3cml0
ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCByZWFkZXJzOwo+PiDCoMKgwqDCoCB9Owo+
PiB9Owo+Pgo+PiBzdGF0aWMgaW5saW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFzKAo+PiDCoMKg
wqDCoCBjb25zdCB1bmlvbiByd2xvY2t3b3JkIHsKPj4gwqDCoMKgwqDCoMKgwqDCoCAud3JpdGUg
PSAwLAo+PiDCoMKgwqDCoMKgwqDCoMKgIC5yZWFkZXJzID0gMQo+PiDCoMKgwqDCoCB9IHg7Cj4+
Cj4+IMKgwqDCoMKgIHJldHVybiB4LnZhbDsKPj4gfQo+Pgo+PiAuLi4KPj4gwqDCoMKgwqAgY250
cyA9IGF0b21pY19hZGRfcmV0dXJuKF9xcl9iaWFzKCksICZsb2NrLT5jbnRzKTsKPj4gLi4uCj4+
Cj4+IEkgZ3Vlc3MgdGhpcyBzaG91bGQgZG8gdGhlIHRyaWNrLCBubz8KPiAKPiBZb3UgYXJlIGFz
c3VtaW5nIHRoZSBhdG9taWNfdCBsYXlvdXQgd2hpY2ggSSB3b3VsZCByYXRoZXIgbm8gd2FudCB0
byAKPiBoYXBwZW4uCgpUaGF0IGFscmVhZHkgaGFwcGVuZWQuIHJ3bG9jay5oIGFscmVhZHkgYXNz
dW1lcyBhdG9taWNfdCB0byBiZSAzMiBiaXRzCndpZGUuIEkgYWdyZWUgaXQgd291bGQgYmUgYmV0
dGVyIHRvIGhhdmUgYW4gYXRvbWljMzJfdCB0eXBlIGZvciB0aGlzCnVzZSBjYXNlLgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
