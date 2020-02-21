Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F105A168153
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:19:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5A1l-0007sq-Go; Fri, 21 Feb 2020 15:15:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5A1j-0007sk-Ul
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:15:39 +0000
X-Inumbo-ID: 045015ac-54bd-11ea-869a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 045015ac-54bd-11ea-869a-12813bfff9fa;
 Fri, 21 Feb 2020 15:15:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6E83B33F;
 Fri, 21 Feb 2020 15:15:37 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
 <0e0dd272-5303-08c6-7aae-23cc796ce563@suse.com>
 <20200221145807.GD4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75084582-2c96-8b76-43b8-1e1330bbcd22@suse.com>
Date: Fri, 21 Feb 2020 16:15:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221145807.GD4679@Air-de-Roger>
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

T24gMjEuMDIuMjAyMCAxNTo1OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyMSwgMjAyMCBhdCAwMzo1MjoyOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjEuMDIuMjAyMCAxNTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRmVi
IDIxLCAyMDIwIGF0IDAzOjQxOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDIxLjAyLjIwMjAgMTU6MjYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwg
RmViIDIxLCAyMDIwIGF0IDAyOjM2OjUyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+PiBP
biBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMC8wMi8yMDIwIDE3OjMxLCBS
b2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRp
bmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPj4+Pj4+Pj4+IHJl
YWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFsbG93aW5nIHJlYWQgbG9ja2luZyBhIHJ3bG9j
ayB0aGF0J3MKPj4+Pj4+Pj4+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxlciAoaWU6IENQVSkg
aW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+Pj4+Pj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWly
ZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+
PiBJbiBvcmRlciB0byBkbyB0aGlzIHJlc2VydmUgMTRiaXRzIG9mIHRoZSBsb2NrLCB0aGlzIGFs
bG93cyB0byBzdXBwb3J0Cj4+Pj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0
aGUgd3JpdGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4+Pj4+Pj4+PiBzaWduYWwgdGhl
cmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3RoZXIg
dG8KPj4+Pj4+Pj4+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3Rl
IHRoZSB3cml0ZSByZWxhdGVkIGRhdGEKPj4+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBp
cyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+Pj4+Pj4+Pj4gdGh1
cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQg
cmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRvCj4+Pj4+Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNo
b3VsZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPj4+Pj4+Pj4+IGNh
biBiZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0Yml0cyBpZiBhbGwgYXJjaGl0ZWN0dXJlcyBzdXBw
b3J0IGF0b21pYwo+Pj4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gRldJVywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVyYXRp
b25zIG9uIDY0LWJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+ICAgc3RhdGljIGlubGlu
ZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+Pj4+PiAgIHsKPj4+Pj4+
Pj4+IC0gICAgLyoKPj4+Pj4+Pj4+IC0gICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9t
aWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4+Pj4+Pj4gLSAgICAgKiBPdGhlcndp
c2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2xlYXIgaXQuCj4+Pj4+
Pj4+PiAtICAgICAqLwo+Pj4+Pj4+Pj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2Nr
LT5jbnRzKTsKPj4+Pj4+Pj4+ICsgICAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9t
aWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5LiAqLwo+Pj4+Pj4+Pj4gKyAgICBBU1NFUlQo
X2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPj4+Pj4+
Pj4+ICsgICAgQlVJTERfQlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4+Pj4+Pj4+PiArICAgIHdy
aXRlX2F0b21pYygodWludDE2X3QgKikmbG9jay0+Y250cywgMCk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkg
aW50byBhIHVpbnQxNl90LiBZb3UKPj4+Pj4+Pj4gd291bGQgYXQgbGVhc3Qgd2FudCB0byB1c2Ug
JmxvY2stPmNudHMuY291bnRlciBoZXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU3VyZSwgSSB3YXMgd29u
ZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2lsbCB3YWl0IGZvciBt
b3JlIGNvbW1lbnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVkIHVwb24KPj4+
Pj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPj4+Pj4+Cj4+Pj4+PiBJ
dCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBhbm90aGVyIGZpZWxkIHNwZWNpZmllciBoZXJlLiBB
IGNhc3QgbGlrZQo+Pj4+Pj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5j
ZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKPj4+Pj4+IGVuZGlhbiBwb3J0IGF0dGVtcHQgdG8g
ZmFsbCBpbnRvLiBBdCB0aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCBjYXVzZQo+Pj4+Pj4gYSBi
dWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVtcywgZXZlbiBiZXR0ZXIgd291bGQgYmUg
aWYgaXQgd2FzCj4+Pj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4+Pj4+Cj4+Pj4+IFdoeSBkb24ndCB3
ZSBsZWF2ZSB0aGUgYXRvbWljX2RlYyB0aGVuPwo+Pj4+Cj4+Pj4gQmVjYXVzZSB5b3UgbmVlZCB0
byBpbnZva2Ugc21wX3Byb2Nlc3Nvcl9pZCgpIHRvIGNhbGN1bGF0ZSB0aGUgdmFsdWUKPj4+PiB0
byB1c2UgaW4gdGhlIHN1YnRyYWN0aW9uLiBJJ20gbm90IG1lYW5pbmcgdG8gc2F5IEknbSBlbnRp
cmVseQo+Pj4+IG9wcG9zZWQgKHNlZWluZyBob3cgbXVjaCBvZiBhIGRpc2N1c3Npb24gd2UncmUg
aGF2aW5nKSwgYnV0IHRoZQo+Pj4+ICJzaW1wbGUgd3JpdGUgb2YgemVybyIgYXBwcm9hY2ggaXMg
Y2VydGFpbmx5IGFwcGVhbGluZy4KPj4+Cj4+PiBXZWxsLCB3ZSBjb3VsZCBhdm9pZCB0aGUgc21w
X3Byb2Nlc3Nvcl9pZCgpIGNhbGwgYW5kIGluc3RlYWQgdXNlOgo+Pj4KPj4+IGF0b21pY19zdWIo
YXRvbWljX3JlYWQoJmxvY2stPmNudHMpICYgMHhmZmZmLCAmbG9jay0+Y250cyk7Cj4+Cj4+IFdo
aWNoIHdvdWxkIG1ha2UgbWUgc3VnZ2VzdCBhdG9taWNfYW5kKCkgYWdhaW4uCj4gCj4gSSdtIGNl
cnRhaW5seSBub3Qgb3Bwb3NlZCB0byB0aGF0LCBidXQgaW4gb3JkZXIgdG8gZ2V0IHRoaXMgcmVn
cmVzc2lvbgo+IGZpeGVkIEkgd291bGQgYXJndWUgdGhhdCBzdWNoIGF0b21pY19zdWIgaXMgbm8g
d29yc2UgdGhhbiB3aGF0J3MKPiBjdXJyZW50bHkgZG9uZS4KCkl0J3Mgb25lIG1vcmUgcmVhZCBv
ZiBhIHBvdGVudGlhbGx5IGhlYXZpbHkgY29udGVuZGVkIG1lbW9yeSBsb2NhdGlvbi4KCj4gSSBj
YW4gbG9vayBpbnRvIGFkZGluZyBhbiBhdG9taWNfYW5kIG9wZXJhdGlvbiB0byBhbGwgYXJjaGVz
LCBidXQgdGhpcwo+IGlzIGxpa2VseSB0byB0YWtlIHRpbWUgYW5kIEkgd291bGQgbGlrZSB0byBn
ZXQgdGhpcyBzb3J0ZWQgc29vbmVyCj4gcmF0aGVyIHRoYW4gbGF0ZXIuCgpCZWNhdXNlIG9mIGl0
IHByZXN1bWFibHkgdGFraW5nIHRpbWUgaXQgd2FzIHRoYXQgSSBhbHNvIGJyb3VnaHQgdXAgdG8K
Y29uc2lkZXIgcmV2ZXJ0aW5nLiBUaGVuIGFnYWluLCB0aGUgQXJtIGF0b21pY19hbmQoKSBjYW4s
IGFmYWljdCwgYmUKdHJpdmlhbGx5IGNsb25lZCBmcm9tIHRoZWlyICJhZGQiIGNvdW50ZXJwYXJ0
cywgYnkgcmVwbGFjaW5nIHRoZQptaWRkbGUgJ2QnIGJvdGggaW4gdGhlIGZ1bmN0aW9uIG5hbWVz
IGFuZCBpbiB0aGUgaW5zbiBtbmVtb25pY3MuIEl0J3MKanVzdCB0aGF0IHRoZXJlIHNob3VsZG4n
dCBiZSBhdG9taWNfYW5kX3JldHVybigpIChmb3Igbm90IGJlaW5nCnVzZWZ1bCwgYXMgaXQgZG9l
c24ndCBhbGxvdyByZWNvbnN0cnVjdGluZyB0aGUgb3JpZ2luYWwgdmFsdWUpLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
