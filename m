Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A0410A1B9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:08:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdLU-0003I0-3s; Tue, 26 Nov 2019 16:05:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZdLS-0003Ht-Ay
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:05:42 +0000
X-Inumbo-ID: 9749a0a0-1066-11ea-a3a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9749a0a0-1066-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 16:05:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 535D1BA61;
 Tue, 26 Nov 2019 16:05:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
 <93e3dd69-698e-17ee-5eef-a932b1989786@suse.com>
 <fc3aea0d-1fec-7754-8f50-d00bfd2a52e1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <391ef1a5-a01f-4595-dc51-32a580f112a6@suse.com>
Date: Tue, 26 Nov 2019 17:05:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fc3aea0d-1fec-7754-8f50-d00bfd2a52e1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8xMS8yMDE5
IDE1OjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMTEuMjAxOSAxMzowMywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IElDRUJQIGlzbid0IGhhbmRsZWQgd2VsbCBieSBTVk0uCj4+Pgo+
Pj4gVGhlIFZNZXhpdCBzdGF0ZSBmb3IgYSAjREItdmVjdG9yZWQgVEFTS19TV0lUQ0ggaGFzICVy
aXAgcG9pbnRpbmcgdG8gdGhlCj4+PiBhcHByb3ByaWF0ZSBpbnN0cnVjdGlvbiBib3VuZGFyeSAo
ZmF1bHQgb3IgdHJhcCwgYXMgYXBwcm9wcmlhdGUpLCBleGNlcHQgZm9yCj4+PiBhbiBJQ0VCUC1p
bmR1Y2VkICNEQiBUQVNLX1NXSVRDSCwgd2hlcmUgJXJpcCBwb2ludHMgYXQgdGhlIElDRUJQIGlu
c3RydWN0aW9uCj4+PiByYXRoZXIgdGhhbiBhZnRlciBpdC4gIEFzIElDRUJQIGlzbid0IGRpc3Rp
bmd1aXNoZWQgaW4gdGhlIHZlY3RvcmluZyBldmVudAo+Pj4gdHlwZSwgdGhlIHN0YXRlIGlzIGFt
YmlndW91cy4KPj4+Cj4+PiBUbyBhZGQgdG8gdGhlIGNvbmZ1c2lvbiwgYW4gSUNFQlAgd2hpY2gg
b2NjdXJzIGR1ZSB0byBJbnRyb3NwZWN0aW9uCj4+PiBpbnRlcmNlcHRpbmcgdGhlIGluc3RydWN0
aW9uLCBvciBmcm9tIHg4Nl9lbXVsYXRlKCkgd2lsbCBoYXZlICVyaXAgdXBkYXRlZCBhcwo+Pj4g
YSBjb25zZXF1ZW5jZSBvZiBwYXJ0aWFsIGVtdWxhdGlvbiByZXF1aXJlZCB0byBpbmplY3QgYW4g
SUNFQlAgZXZlbnQgaW4gdGhlCj4+PiBmaXJzdCBwbGFjZS4KPj4+Cj4+PiBXZSBjb3VsZCBpbiBw
cmluY2lwbGUgc3BvdCB0aGUgbm9uLWluamVjdGVkIGNhc2UgaW4gdGhlIFRBU0tfU1dJVENIIGhh
bmRsZXIsCj4+PiBidXQgdGhpcyBzdGlsbCByZXN1bHRzIGluIGNvbXBsZXhpdHkgaWYgdGhlIElD
RUJQIGluc3RydWN0aW9uIGFsc28gaGFzIGFuCj4+PiBJbnN0cnVjdGlvbiBCcmVha3BvaW50IGFj
dGl2ZSBvbiBpdCAod2hpY2ggZ2VudWluZWx5IGhhcyBmYXVsdCBzZW1hbnRpY3MpLgo+Pj4KPj4+
IFVuY29uZGl0aW9uYWxseSBpbnRlcmNlcHQgSUNFQlAuICBUaGlzIGRvZXMgaGF2ZSBhIHRyYXAg
c2VtYW50aWNzIGZvciB0aGUKPj4+IGludGVyY2VwdCwgYW5kIGFsbG93cyB1cyB0byBtb3ZlICVy
aXAgZm9yd2FyZHMgYXBwcm9wcmlhdGVseSBiZWZvcmUgdGhlCj4+PiBUQVNLX1NXSVRDSCBpbnRl
cmNlcHQgaXMgaGl0Lgo+PiBCb3RoIGJlY2F1c2Ugb2YgeW91IG1lbnRpb25pbmcgdGhlIG1vdmlu
ZyBmb3J3YXJkcyBvZiAlcmlwIGFuZCB3aXRoIHRoZQo+PiBpcmMgZGlzY3Vzc2lvbiBpbiBtaW5k
IHRoYXQgd2UgaGFkIG5vIGlyYywgZG9uJ3QgeW91IG1lYW4gImZhdWx0Cj4+IHNlbWFudGljcyIg
aGVyZT8KPiAKPiBJQ0VCUCByZWFsbHkgaXMgdG9vIGJyb2tlbiB1bmRlciBTVk0gdG8gaGFuZGxl
IGFyY2hpdGVjdHVyYWxseS4KPiAKPiBUaGUgSUNFQlAgaW50ZXJjZXB0IGhhcyBuUklQIGRlY29k
ZSBzdXBwb3J0LCBiZWNhdXNlIGl0IGlzIGFuCj4gaW5zdHJ1Y3Rpb24gaW50ZXJjZXB0LsKgIFdl
IGVtdWxhdGUgdGhlIGluamVjdGlvbiAoYmVjYXVzZSBpdCBpcyBJQ0VCUCksCj4gd2hpY2ggbWVh
bnMgd2UgcmUtZW50ZXIgdGhlIGd1ZXN0IHdpdGggJXJpcCBtb3ZlZCBmb3J3YXJkLCBhbmQgI0RC
Cj4gKEhXX0VYQ0VQVElPTikgcGVuZGluZyBmb3IgaW5qZWN0aW9uLsKgIFRoaXMgbWVhbnMgdGhh
dC4uLgo+IAo+PiAgSWYgc28KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAKPiAuLi4gdGhlIElDRUJQLSNEQi12ZWN0b3JlZCBUQVNLX1NXSVRDSCB3aWxs
IG5vdyBmaW5kICVyaXAgcG9pbnRpbmcgYWZ0ZXIKPiB0aGUgSUNFQlAgaW5zdHJ1Y3Rpb24sIHJh
dGhlciB0aGFuIGF0IGl0LCBtYWtpbmcgaXQgY29uc2lzdGVudCB3aXRoCj4gZXZlcnkgb3RoZXIg
I0RCLXZlY3RvcmVkIFRBU0tfU1dJVENILgo+IAo+IFRoaXMgZG9lcyBtZWFucyB0aGF0IGFuIGVh
cmx5IHRhc2stc3dpdGNoIGZhdWx0IGZvciBJQ0VCUCB3aWxsIHJlbGlhYmx5Cj4gYmUgZGVsaXZl
cmVkIHdpdGggdGhlIHdyb25nIChpLmUuIHRyYXApIHNlbWFudGljcywgYnV0IHRoaXMgaXMgbGVz
cyBiYWQKPiB0aGFuIG1peGVkIGZhdWx0L3RyYXAgc2VtYW50aWNzIGRlcGVuZGluZyBvbiB3aGV0
aGVyIHRoZSBzb3VyY2Ugb2YgdGhlCj4gSUNFQlAgd2FzIGludHJvc3BlY3Rpb24vZW11bGF0aW9u
IG9yIG5hdGl2ZSBleGVjdXRpb24uCj4gCj4gV2UgY291bGQgcmVzdG9yZSBwcm9wZXIgZmF1bHQg
YmVoYXZpb3VyIGJ5IGV4dGVuZGluZwo+IHN2bV9lbXVsX3N3aW50X2luamVjdGlvbigpIHRvIGZp
Z3VyZSBvdXQgdGhhdCBhIHRhc2sgc3dpdGNoIGlzIG5lZWRlZCwKPiBhbmQgaW52b2tlIGh2bV90
YXNrX3N3aXRjaCgpIGRpcmVjdGx5LCBidXQgSSBkb24ndCBoYXZlIGVub3VnaCBUVUlUUwo+IHJp
Z2h0IG5vdy4KPiAKPj4gT3RoZXJ3aXNlIEkgZ3Vlc3MgSSdtIHN0aWxsIG1pc3Npbmcgc29tZXRo
aW5nLgo+IAo+IEkgaG9wZSB0aGlzIGNsZWFycyBpdCB1cC4KCldlbGwsIGl0IGhlbHBzLCBidXQg
eW91IGRvbid0IHJlYWxseSBhbnN3ZXIgdGhlIHF1ZXN0aW9uOiBJcyAidHJhcCIKaW4gdGhhdCBz
ZW50ZW5jZSBvZiB0aGUgZGVzY3JpcHRpb24gcmVhbGx5IGNvcnJlY3Q/IEkuZS4gZG9uJ3QgeW91
Cmluc3RlYWQgbWVhbiAiZmF1bHQiIHRoZXJlPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
