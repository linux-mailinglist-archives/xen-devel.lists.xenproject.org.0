Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56021168076
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:39:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Qn-00025m-0G; Fri, 21 Feb 2020 14:37:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59Qk-00025a-Sw
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:37:26 +0000
X-Inumbo-ID: ad5230f0-54b7-11ea-868e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad5230f0-54b7-11ea-868e-12813bfff9fa;
 Fri, 21 Feb 2020 14:37:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1C73AFBC;
 Fri, 21 Feb 2020 14:37:24 +0000 (UTC)
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
 <3a7a760f-2212-01f8-3e2c-8383e7f74177@suse.com>
 <fe649f4a-3e0c-4beb-8030-67cabf81cca7@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <361deeb8-8080-a4af-da63-5e81902c9827@suse.com>
Date: Fri, 21 Feb 2020 15:37:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fe649f4a-3e0c-4beb-8030-67cabf81cca7@suse.com>
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

T24gMjEuMDIuMjAyMCAxNToyNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAgMTU6MTYsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMCAxNToxMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4+IEhpIEp1ZXJnZW4sCj4+Pj4KPj4+PiBPbiAyMS8wMi8yMDIwIDE0OjA2LCBKw7xyZ2VuIEdy
b8OfIHdyb3RlOgo+Pj4+PiBPbiAyMS4wMi4yMCAxNDo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBKw7xyZ2VuIEdyb8OfIHdy
b3RlOgo+Pj4+Pj4+IE9uIDIxLjAyLjIwIDE0OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+
Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+Pj4+
IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+Pj4+Pj4+PiBIaSwKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9uIDIwLzAyLzIwMjAg
MTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+Pj4+Pj4gQWxsb3cgYSBDUFUgYWxy
ZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxzbyBsb2NrCj4+Pj4+Pj4+
Pj4+IGl0IGluCj4+Pj4+Pj4+Pj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFsbG93
aW5nIHJlYWQgbG9ja2luZyBhIHJ3bG9jayB0aGF0J3MKPj4+Pj4+Pj4+Pj4gYWxyZWFkeSBvd25l
ZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+
Pj4+Pj4+Pj4+IGFjY2Vzc2VzIGlzIHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMg
dXNlLWNhc2UuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVz
ZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvCj4+Pj4+Pj4+Pj4+IHN1cHBv
cnQKPj4+Pj4+Pj4+Pj4gdXAgdG8gMTYzODQgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxv
Y2sgbWFzayB0byAyIGJpdHM6IG9uZSB0bwo+Pj4+Pj4+Pj4+PiBzaWduYWwgdGhlcmUgYXJlIHBl
bmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUKPj4+Pj4+Pj4+Pj4gb3Ro
ZXIgdG8KPj4+Pj4+Pj4+Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUu
IE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQgZGF0YQo+Pj4+Pj4+Pj4+PiBpcyB1c2luZyAxNmJpdHMs
IHRoaXMgaXMgZG9uZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIGNsZWFyIGl0IChhbmQKPj4+Pj4+
Pj4+Pj4gdGh1cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4K
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJlciBv
ZiBjb25jdXJyZW50IHJlYWRlcnMgZnJvbQo+Pj4+Pj4+Pj4+PiAxNjc3NzIxNiB0bwo+Pj4+Pj4+
Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2Ug
dGhlIGxvY2sgZmllbGQKPj4+Pj4+Pj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRi
aXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQKPj4+Pj4+Pj4+Pj4gYXRvbWljCj4+Pj4+
Pj4+Pj4+IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdlcnMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiBGV0lXLCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQt
Yml0IGludGVnZXJzLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+ICDCoMKgIHN0YXRpYyBpbmxpbmUg
dm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+Pj4+Pj4+Pj4+PiAgwqDCoCB7Cj4+
Pj4+Pj4+Pj4+IC3CoMKgwqAgLyoKPj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgICogSWYgdGhlIHdyaXRl
ciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4+Pj4+Pj4+
PiAtwqDCoMKgwqAgKiBPdGhlcndpc2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVz
ZWQgdG8gY2xlYXIgaXQuCj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoCAqLwo+Pj4+Pj4+Pj4+PiAtwqDC
oMKgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxvY2stPmNudHMpOwo+Pj4+Pj4+Pj4+PiArwqDC
oMKgIC8qIFNpbmNlIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJl
ZAo+Pj4+Pj4+Pj4+PiBkaXJlY3RseS4gKi8KPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBBU1NFUlQoX2lz
X3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+Pj4+Pj4+
Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oX1FSX1NISUZUICE9IDE2KTsKPj4+Pj4+Pj4+Pj4gK8Kg
wqDCoCB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMsIDApOwo+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4gSSB0aGluayB0aGlzIGlzIGFuIGFidXNlIHRvIGNhc3QgYW4gYXRvbWljX3Qo
KSBkaXJlY3RseSBpbnRvIGEKPj4+Pj4+Pj4+PiB1aW50MTZfdC4gWW91Cj4+Pj4+Pj4+Pj4gd291
bGQgYXQgbGVhc3Qgd2FudCB0byB1c2UgJmxvY2stPmNudHMuY291bnRlciBoZXJlLgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlzIG15c2VsZi4KPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiBXaWxsIHdhaXQgZm9yIG1vcmUgY29tbWVudHMsIG5vdCBzdXJlIHdo
ZXRoZXIgdGhpcyBjYW4gYmUgZml4ZWQgdXBvbgo+Pj4+Pj4+Pj4gY29tbWl0IGlmIHRoZXJlIGFy
ZSBubyBvdGhlciBpc3N1ZXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEl0J3MgbW9yZSB0aGFuIGp1c3Qg
YWRkaW5nIGFub3RoZXIgZmllbGQgc3BlY2lmaWVyIGhlcmUuIEEgY2FzdCBsaWtlCj4+Pj4+Pj4+
IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcg
Zm9yIGEgYmlnCj4+Pj4+Pj4+IGVuZGlhbiBwb3J0IGF0dGVtcHQgdG8gZmFsbCBpbnRvLiBBdCB0
aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCBjYXVzZQo+Pj4+Pj4+PiBhIGJ1aWxkIGZhaWx1cmUg
b24gYmlnIGVuZGlhbiBzeXN0ZW1zLCBldmVuIGJldHRlciB3b3VsZCBiZSBpZiBpdCB3YXMKPj4+
Pj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV291bGRuJ3QgYSB1bmlvbiBi
ZSB0aGUgYmV0dGVyIGNob2ljZT8KPj4+Pj4+Cj4+Pj4+PiBZb3Ugd291bGQgbm90IGJlIGFibGUg
dG8gdXNlIGF0b21pY190IGluIHRoYXQgY2FzZSBhcyB5b3UgY2FuJ3QKPj4+Pj4+IGFzc3VtZSB0
aGUgbGF5b3V0IG9mIHRoZSBzdHJ1Y3R1cmUuCj4+Pj4+Cj4+Pj4+IHVuaW9uIHJ3bG9ja3dvcmQg
ewo+Pj4+PiAgwqDCoMKgwqAgYXRvbWljX3QgY250czsKPj4+Pj4gIMKgwqDCoMKgIHVpbnQzMl90
IHZhbDsKPj4+Pj4gIMKgwqDCoMKgIHN0cnVjdCB7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIHVp
bnQxNl90IHdyaXRlOwo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCByZWFkZXJzOwo+
Pj4+PiAgwqDCoMKgwqAgfTsKPj4+Pj4gfTsKPj4+Pj4KPj4+Pj4gc3RhdGljIGlubGluZSBjb25z
dCB1aW50MzJfdCBfcXJfYmlhcygKPj4+Pj4gIMKgwqDCoMKgIGNvbnN0IHVuaW9uIHJ3bG9ja3dv
cmQgewo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCAud3JpdGUgPSAwLAo+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoCAucmVhZGVycyA9IDEKPj4+Pj4gIMKgwqDCoMKgIH0geDsKPj4+Pj4KPj4+Pj4gIMKg
wqDCoMKgIHJldHVybiB4LnZhbDsKPj4+Pj4gfQo+Pj4+Pgo+Pj4+PiAuLi4KPj4+Pj4gIMKgwqDC
oMKgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfcXJfYmlhcygpLCAmbG9jay0+Y250cyk7Cj4+
Pj4+IC4uLgo+Pj4+Pgo+Pj4+PiBJIGd1ZXNzIHRoaXMgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/
Cj4+Pj4KPj4+PiBZb3UgYXJlIGFzc3VtaW5nIHRoZSBhdG9taWNfdCBsYXlvdXQgd2hpY2ggSSB3
b3VsZCByYXRoZXIgbm8gd2FudCB0bwo+Pj4+IGhhcHBlbi4KPj4+Cj4+PiBUaGF0IGFscmVhZHkg
aGFwcGVuZWQuIHJ3bG9jay5oIGFscmVhZHkgYXNzdW1lcyBhdG9taWNfdCB0byBiZSAzMiBiaXRz
Cj4+PiB3aWRlLgo+Pgo+PiBFeGFjdGx5IDMyIGJpdHMsIG9yIGF0IGxlYXN0IGFzIG1hbnk/Cj4g
Cj4gVmFsdWUgaXMgcmVhZCBpbnRvIGEgdTMyIHZhcmlhYmxlIGFuZCB0aGVuIGFuIHVwZGF0ZSB2
aWEgY21weGNoZygpIGlzCj4gZG9uZSB1c2luZyB0aGF0IHZhbHVlIGZvciBjb21wYXJpc29uLiBT
byBhbnkgYWRkaXRpb25hbCBiaXRzIHdpbGwgYmUKPiBsb3N0IGFuZCB1cGRhdGUgd2lsbCBuZXZl
ciBzdWNjZWVkIChzZWUgcXVldWVfd3JpdGVfbG9ja19zbG93cGF0aCgpKS4KCldlbGwsIHRoZSBs
b2NhbCB2YXJpYWJsZXMgc2hvdWxkIGJlIG9mIHR5cGUgaW50IChvciBwb3NzaWJseSB1bnNpZ25l
ZAppbnQpLCBidXQgdGhlIGxvZ2ljIHRoZXJlIGlzbid0IHRpZWQgdG8gYW55dGhpbmcgZWxzZSBi
ZWluZyBleGFjdGx5CjMyIGJpdHMgd2lkZS4gVGhlc2UgbG9jYWwgdmFyaWFibGUgYXJlIG1lcmVs
eSBhbiBleGFtcGxlIG9mIG1pc2d1aWRlZAp1c2Ugb2YgZml4ZWQgd2lkdGggdHlwZXMuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
