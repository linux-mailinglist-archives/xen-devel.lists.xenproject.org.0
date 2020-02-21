Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F6167EFA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:48:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58d5-0003GK-DX; Fri, 21 Feb 2020 13:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j58d3-0003GC-MZ
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:46:05 +0000
X-Inumbo-ID: 811ad836-54b0-11ea-8664-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811ad836-54b0-11ea-8664-12813bfff9fa;
 Fri, 21 Feb 2020 13:46:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 04409AF83;
 Fri, 21 Feb 2020 13:46:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
Date: Fri, 21 Feb 2020 14:46:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAgMTQ6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAyLjIwMjAgMTA6
MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3
OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDIw
LzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+PiBBbGxvdyBhIENQVSBh
bHJlYWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4K
Pj4+PiByZWFkIG1vZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcg
YSByd2xvY2sgdGhhdCdzCj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BV
KSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQg
YXQgbGVhc3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPj4+Pgo+Pj4+IEluIG9yZGVyIHRv
IGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBv
cnQKPj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3JpdGUgbG9jayBtYXNr
IHRvIDIgYml0czogb25lIHRvCj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRlcnMg
d2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4+Pj4gc2lnbmFsIHRoZSBsb2Nr
IGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQgZGF0YQo+Pj4+
IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xl
YXIgaXQgKGFuZAo+Pj4+IHRodXMgcmVsZWFzZSB0aGUgbG9jaykgdXNpbmcgYSAxNmJpdCBhdG9t
aWMgd3JpdGUuCj4+Pj4KPj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNv
bmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRvCj4+Pj4gNjU1MzYsIEkgdGhpbmsgdGhp
cyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4+Pj4gY2Fu
IGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBv
cnQgYXRvbWljCj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Cj4+PiBGV0lX
LCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGlu
dGVnZXJzLgo+Pj4KPj4+PiAgICBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xv
Y2tfdCAqbG9jaykKPj4+PiAgICB7Cj4+Pj4gLSAgICAvKgo+Pj4+IC0gICAgICogSWYgdGhlIHdy
aXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4+IC0g
ICAgICogT3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rpb24gd2lsbCBiZSB1c2VkIHRvIGNs
ZWFyIGl0Lgo+Pj4+IC0gICAgICovCj4+Pj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZs
b2NrLT5jbnRzKTsKPj4+PiArICAgIC8qIFNpbmNlIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWlj
LCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4gKi8KPj4+PiArICAgIEFTU0VSVChfaXNfd3Jp
dGVfbG9ja2VkX2J5X21lKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+Pj4+ICsgICAgQlVJ
TERfQlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4gKyAgICB3cml0ZV9hdG9taWMoKHVpbnQx
Nl90ICopJmxvY2stPmNudHMsIDApOwo+Pj4KPj4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0
byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkgaW50byBhIHVpbnQxNl90LiBZb3UKPj4+IHdv
dWxkIGF0IGxlYXN0IHdhbnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KPj4KPj4g
U3VyZSwgSSB3YXMgd29uZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+Pgo+PiBXaWxsIHdhaXQg
Zm9yIG1vcmUgY29tbWVudHMsIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjYW4gYmUgZml4ZWQgdXBv
bgo+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPiAKPiBJdCdzIG1vcmUg
dGhhbiBqdXN0IGFkZGluZyBhbm90aGVyIGZpZWxkIHNwZWNpZmllciBoZXJlLiBBIGNhc3QgbGlr
ZQo+IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRp
bmcgZm9yIGEgYmlnCj4gZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2
ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGNhdXNlCj4gYSBidWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRp
YW4gc3lzdGVtcywgZXZlbiBiZXR0ZXIgd291bGQgYmUgaWYgaXQgd2FzCj4gZW5kaWFubmVzcy1z
YWZlLgoKV291bGRuJ3QgYSB1bmlvbiBiZSB0aGUgYmV0dGVyIGNob2ljZT8KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
