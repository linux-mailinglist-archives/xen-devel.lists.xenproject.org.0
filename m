Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4833714D8DB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:22:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6vG-0001yQ-Fe; Thu, 30 Jan 2020 10:19:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix6vE-0001yI-DV
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:19:40 +0000
X-Inumbo-ID: 04e14e7a-434a-11ea-8a29-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04e14e7a-434a-11ea-8a29-12813bfff9fa;
 Thu, 30 Jan 2020 10:19:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E98B6B15A;
 Thu, 30 Jan 2020 10:19:36 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200129171030.1341-1-pdurrant@amazon.com>
 <20200129171030.1341-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9728f80-8f68-a31f-993d-12b61c044e55@suse.com>
Date: Thu, 30 Jan 2020 11:19:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129171030.1341-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 2/3] mm: make pages allocated with
 MEMF_no_refcount safe to assign
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxODoxMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE5PVEU6IHN0ZWFsX3Bh
Z2UoKSBpcyBhbHNvIG1vZGlmaWVkIHRvIGRlY3JlbWVudCBleHRyYV9wYWdlcyBpbiB0aGUgY2Fz
ZSBvZgo+ICAgICAgIGEgUEdDX2V4dHJhIHBhZ2UgYmVpbmcgc3RvbGVuIGZyb20gYSBkb21haW4u
CgpJIGRvbid0IHRoaW5rIHN0ZWFsaW5nIG9mIHN1Y2ggcGFnZXMgc2hvdWxkIGJlIGFsbG93ZWQu
IElmIGFueXRoaW5nLAp0aGUgcmVwbGFjZW1lbnQgcGFnZSB0aGVuIGFnYWluIHNob3VsZCBiZSBh
biAiZXh0cmEiIG9uZSwgd2hpY2ggSQpndWVzcyB3b3VsZCBiZSBxdWl0ZSB1Z2x5IHRvIGFycmFu
Z2UgZm9yLiBCdXQgc3VjaCAiZXh0cmEiIHBhZ2VzCmFyZW4ndCBzdXBwb3NlZCB0byBiZSBwcm9w
ZXJseSBleHBvc2VkIChhbmQgaGVuY2UgcGxheWVkIHdpdGgpIHRvCnRoZSBkb21haW4gaW4gdGhl
IGZpcnN0IHBsYWNlLgoKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL3hl
bi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTIyNTYsNiArMjI1Niw3IEBAIGludCBhc3NpZ25f
cGFnZXMoCj4gIHsKPiAgICAgIGludCByYyA9IDA7Cj4gICAgICB1bnNpZ25lZCBsb25nIGk7Cj4g
KyAgICB1bnNpZ25lZCBpbnQgZXh0cmFfcGFnZXMgPSAwOwo+ICAKPiAgICAgIHNwaW5fbG9jaygm
ZC0+cGFnZV9hbGxvY19sb2NrKTsKPiAgCj4gQEAgLTIyNjcsMTMgKzIyNjgsMTkgQEAgaW50IGFz
c2lnbl9wYWdlcygKPiAgICAgICAgICBnb3RvIG91dDsKPiAgICAgIH0KPiAgCj4gKyAgICBmb3Ig
KCBpID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsgaSsrICkKPiArICAgICAgICBpZiAoIHBnW2ldLmNv
dW50X2luZm8gJiBQR0NfZXh0cmEgKQo+ICsgICAgICAgICAgICBleHRyYV9wYWdlcysrOwoKUGVy
aGFwcyBhc3N1bWUgKGFuZCBtYXliZSBBU1NFUlQoKSkgdGhhdCBhbGwgcGFnZXMgaW4gdGhlIGJh
dGNoCmFyZSB0aGUgc2FtZSBpbiB0aGlzIHJlZ2FyZD8gVGhlbiB5b3UgY291bGQgLi4uCgo+ICAg
ICAgaWYgKCAhKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkgKQo+ICAgICAgewo+IC0gICAg
ICAgIGlmICggdW5saWtlbHkoKGQtPnRvdF9wYWdlcyArICgxIDw8IG9yZGVyKSkgPiBkLT5tYXhf
cGFnZXMpICkKPiArICAgICAgICB1bnNpZ25lZCBpbnQgbWF4X3BhZ2VzID0gZC0+bWF4X3BhZ2Vz
IC0gZC0+ZXh0cmFfcGFnZXMgLSBleHRyYV9wYWdlczsKPiArCj4gKyAgICAgICAgaWYgKCB1bmxp
a2VseSgoZC0+dG90X3BhZ2VzICsgKDEgPDwgb3JkZXIpKSA+IG1heF9wYWdlcykgKQo+ICAgICAg
ICAgIHsKPiAgICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfSU5GTywgIk92ZXItYWxsb2NhdGlv
biBmb3IgZG9tYWluICV1OiAiCj4gICAgICAgICAgICAgICAgICAgICAgIiV1ID4gJXVcbiIsIGQt
PmRvbWFpbl9pZCwKPiAtICAgICAgICAgICAgICAgICAgICBkLT50b3RfcGFnZXMgKyAoMSA8PCBv
cmRlciksIGQtPm1heF9wYWdlcyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgZC0+dG90X3BhZ2Vz
ICsgKDEgPDwgb3JkZXIpLCBtYXhfcGFnZXMpOwo+ICAgICAgICAgICAgICByYyA9IC1FMkJJRzsK
PiAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICAgfQo+IEBAIC0yMjgyLDEzICsyMjg5
LDE3IEBAIGludCBhc3NpZ25fcGFnZXMoCj4gICAgICAgICAgICAgIGdldF9rbm93bmFsaXZlX2Rv
bWFpbihkKTsKPiAgICAgIH0KPiAgCj4gKyAgICBkLT5leHRyYV9wYWdlcyArPSBleHRyYV9wYWdl
czsKCi4uLiBhcnJhbmdlIHRoaW5ncyBsaWtlIHRoaXMsIEkgdGhpbms6CgogICAgaWYgKCBwZ1tp
XS5jb3VudF9pbmZvICYgUEdDX2V4dHJhICkKICAgICAgICBkLT5leHRyYV9wYWdlcyArPSAxVSA8
PCBvcmRlcjsKICAgIGVsc2UgaWYgKCAhKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkgKQog
ICAgewogICAgICAgIHVuc2lnbmVkIGludCBtYXhfcGFnZXMgPSBkLT5tYXhfcGFnZXMgLSBkLT5l
eHRyYV9wYWdlczsKICAgICAgICAuLi4KClRoaXMgd291bGQsIGFmYWljdCwgdGhlbiBhbHNvIGVs
aW1pbmF0ZSB0aGUgbmVlZCB0byBtYXNrIG9mZgpNRU1GX25vX3JlZmNvdW50IGluIGFsbG9jX2Rv
bWhlYXBfcGFnZXMoKSwgLi4uCgoKPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDEgPDwgb3JkZXIp
OyBpKysgKQo+ICAgICAgewo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgY291bnRfaW5mbyA9IHBn
W2ldLmNvdW50X2luZm87Cj4gKwo+ICAgICAgICAgIEFTU0VSVChwYWdlX2dldF9vd25lcigmcGdb
aV0pID09IE5VTEwpOwo+IC0gICAgICAgIEFTU0VSVCghcGdbaV0uY291bnRfaW5mbyk7Cj4gKyAg
ICAgICAgQVNTRVJUKCEoY291bnRfaW5mbyAmIH5QR0NfZXh0cmEpKTsKCi4uLiByZXN1bHRpbmcg
aW4gbXkgcHJpb3IgY29tbWVudCBvbiB0aGlzIG9uZSBzdGlsbCBhcHBseWluZy4KCkJlc2lkZXMg
dGhlIGNoYW5nZXMgeW91J3ZlIG1hZGUsIHdoYXQgYWJvdXQgdGhlIGNvZGUgaGFuZGxpbmcKWEVO
TUVNX3NldF9wb2RfdGFyZ2V0PyBXaGF0IGFib3V0IHAybS1wb2QuYz8gQW5kCnB2X3NoaW1fc2V0
dXBfZG9tKCk/IEknbSBhbHNvIG5vdCBmdWxseSBzdXJlIHdoZXRoZXIKZ2V0ZG9tYWluaW5mbygp
IHNob3VsZG4ndCBzdWJ0cmFjdCBleHRyYV9wYWdlcywgYnV0IEkgdGhpbmsKdGhpcyBpcyB0aGUg
b25seSB3YXkgdG8gYXZvaWQgaGF2aW5nIGFuIGV4dGVybmFsbHkgdmlzaWJsZQplZmZlY3QuIFRo
ZXJlIG1heSBiZSBtb3JlLiBQZXJoYXBzIGl0J3MgYmVzdCB0byBpbnRyb2R1Y2UgYQpkb21haW5f
dG90X3BhZ2VzKCkgaW5saW5lIGZ1bmN0aW9uIHJldHVybmluZyB0aGUgZGlmZmVyZW5jZSwKYW5k
IHVzIGl0IGFsbW9zdCBldmVyeXdoZXJlIHdoZXJlIC0+dG90X3BhZ2VzIGlzIHVzZWQgcmlnaHQK
bm93LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
