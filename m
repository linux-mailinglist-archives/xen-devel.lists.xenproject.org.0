Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DAF1680E6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:55:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59fJ-0004aw-HH; Fri, 21 Feb 2020 14:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59fH-0004ao-Kb
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:52:27 +0000
X-Inumbo-ID: c690acd4-54b9-11ea-868f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c690acd4-54b9-11ea-868f-12813bfff9fa;
 Fri, 21 Feb 2020 14:52:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36EEDAEF5;
 Fri, 21 Feb 2020 14:52:26 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e0dd272-5303-08c6-7aae-23cc796ce563@suse.com>
Date: Fri, 21 Feb 2020 15:52:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221144924.GC4679@Air-de-Roger>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyMSwgMjAyMCBhdCAwMzo0MTo1OVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjEuMDIuMjAyMCAxNToyNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRmVi
IDIxLCAyMDIwIGF0IDAyOjM2OjUyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDIxLjAyLjIwMjAgMTA6MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFRodSwg
RmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+
Pj4+IEhpLAo+Pj4+Pj4KPj4+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4g
d3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPj4+Pj4+PiByZWFkIG1vZGUuIFRoZXJlJ3Mg
bm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgdGhhdCdzCj4+Pj4+Pj4g
YWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxv
d2luZyBzdWNoCj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3QgZm9yIHRoZSBD
UFUgbWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVz
ZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBvcnQKPj4+Pj4+PiB1
cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3JpdGUgbG9jayBtYXNrIHRvIDIgYml0
czogb25lIHRvCj4+Pj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRlcnMgd2FpdGlu
ZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4+Pj4+Pj4gc2lnbmFsIHRoZSBsb2NrIGlz
IG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQgZGF0YQo+Pj4+Pj4+
IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xl
YXIgaXQgKGFuZAo+Pj4+Pj4+IHRodXMgcmVsZWFzZSB0aGUgbG9jaykgdXNpbmcgYSAxNmJpdCBh
dG9taWMgd3JpdGUuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVt
YmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRvCj4+Pj4+Pj4gNjU1MzYs
IEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZp
ZWxkCj4+Pj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNo
aXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRl
Z2Vycy4KPj4+Pj4+Cj4+Pj4+PiBGV0lXLCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWlj
IG9wZXJhdGlvbnMgb24gNjQtYml0IGludGVnZXJzLgo+Pj4+Pj4KPj4+Pj4+PiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+Pj4+Pj4+ICAgewo+Pj4+
Pj4+IC0gICAgLyoKPj4+Pj4+PiAtICAgICAqIElmIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWlj
LCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4KPj4+Pj4+PiAtICAgICAqIE90aGVyd2lzZSwg
YW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+PiAt
ICAgICAqLwo+Pj4+Pj4+IC0gICAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9jay0+Y250cyk7
Cj4+Pj4+Pj4gKyAgICAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2Fu
IGJlIGNsZWFyZWQgZGlyZWN0bHkuICovCj4+Pj4+Pj4gKyAgICBBU1NFUlQoX2lzX3dyaXRlX2xv
Y2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+Pj4+PiArICAgIEJVSUxE
X0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+Pj4+Pj4+ICsgICAgd3JpdGVfYXRvbWljKCh1aW50
MTZfdCAqKSZsb2NrLT5jbnRzLCAwKTsKPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIHRoaXMgaXMgYW4g
YWJ1c2UgdG8gY2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5IGludG8gYSB1aW50MTZfdC4gWW91
Cj4+Pj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5jb3VudGVyIGhl
cmUuCj4+Pj4+Cj4+Pj4+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlzIG15c2VsZi4K
Pj4+Pj4KPj4+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3VyZSB3aGV0aGVy
IHRoaXMgY2FuIGJlIGZpeGVkIHVwb24KPj4+Pj4gY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhl
ciBpc3N1ZXMuCj4+Pj4KPj4+PiBJdCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBhbm90aGVyIGZp
ZWxkIHNwZWNpZmllciBoZXJlLiBBIGNhc3QgbGlrZQo+Pj4+IHRoaXMgb25lIGlzIGVuZGlhbm5l
c3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+Pj4gZW5kaWFu
IHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2hvdWxk
IGNhdXNlCj4+Pj4gYSBidWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVtcywgZXZlbiBi
ZXR0ZXIgd291bGQgYmUgaWYgaXQgd2FzCj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+Pj4KPj4+IFdo
eSBkb24ndCB3ZSBsZWF2ZSB0aGUgYXRvbWljX2RlYyB0aGVuPwo+Pgo+PiBCZWNhdXNlIHlvdSBu
ZWVkIHRvIGludm9rZSBzbXBfcHJvY2Vzc29yX2lkKCkgdG8gY2FsY3VsYXRlIHRoZSB2YWx1ZQo+
PiB0byB1c2UgaW4gdGhlIHN1YnRyYWN0aW9uLiBJJ20gbm90IG1lYW5pbmcgdG8gc2F5IEknbSBl
bnRpcmVseQo+PiBvcHBvc2VkIChzZWVpbmcgaG93IG11Y2ggb2YgYSBkaXNjdXNzaW9uIHdlJ3Jl
IGhhdmluZyksIGJ1dCB0aGUKPj4gInNpbXBsZSB3cml0ZSBvZiB6ZXJvIiBhcHByb2FjaCBpcyBj
ZXJ0YWlubHkgYXBwZWFsaW5nLgo+IAo+IFdlbGwsIHdlIGNvdWxkIGF2b2lkIHRoZSBzbXBfcHJv
Y2Vzc29yX2lkKCkgY2FsbCBhbmQgaW5zdGVhZCB1c2U6Cj4gCj4gYXRvbWljX3N1YihhdG9taWNf
cmVhZCgmbG9jay0+Y250cykgJiAweGZmZmYsICZsb2NrLT5jbnRzKTsKCldoaWNoIHdvdWxkIG1h
a2UgbWUgc3VnZ2VzdCBhdG9taWNfYW5kKCkgYWdhaW4uCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
