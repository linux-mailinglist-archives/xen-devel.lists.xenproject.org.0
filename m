Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FB16C291
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:41:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aQd-00013Z-HK; Tue, 25 Feb 2020 13:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6aQb-00013O-W0
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:39:14 +0000
X-Inumbo-ID: 3551cafa-57d4-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3551cafa-57d4-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 13:39:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A98BFAC66;
 Tue, 25 Feb 2020 13:39:11 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2c48b3c-4bbb-698f-2783-4bc2359cd985@suse.com>
Date: Tue, 25 Feb 2020 14:39:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 4/5] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxNjozNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgRmVi
IDI0LCAyMDIwIGF0IDg6MTMgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyb3RlOgo+PiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAxMDo0OToyMkFNIC0wODAwLCBU
YW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPj4+IEBAIC0xNjM2
LDYgKzE2MzYsNTkgQEAgc3RhdGljIGludCBtZW1fc2hhcmluZ19mb3JrKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBkb21haW4gKmNkKQo+Pj4gICAgICByZXR1cm4gcmM7Cj4+PiAgfQo+Pj4KPj4+
ICsvKgo+Pj4gKyAqIFRoZSBmb3JrIHJlc2V0IG9wZXJhdGlvbiBpcyBpbnRlbmRlZCB0byBiZSB1
c2VkIG9uIHNob3J0LWxpdmVkIGZvcmtzIG9ubHkuCj4+PiArICogVGhlcmUgaXMgbm8gaHlwZXJj
YWxsIGNvbnRpbnVhdGlvbiBvcGVyYXRpb24gaW1wbGVtZW50ZWQgZm9yIHRoaXMgcmVhc29uLgo+
Pj4gKyAqIEZvciBmb3JrcyB0aGF0IG9idGFpbiBhIGxhcmdlciBtZW1vcnkgZm9vdHByaW50IGl0
IGlzIGxpa2VseSBnb2luZyB0byBiZQo+Pj4gKyAqIG1vcmUgcGVyZm9ybWFudCB0byBjcmVhdGUg
YSBuZXcgZm9yayBpbnN0ZWFkIG9mIHJlc2V0dGluZyBhbiBleGlzdGluZyBvbmUuCj4+PiArICoK
Pj4+ICsgKiBUT0RPOiBJbiBjYXNlIHRoaXMgaHlwZXJjYWxsIHdvdWxkIGJlY29tZSB1c2VmdWwg
b24gZm9ya3Mgd2l0aCBsYXJnZXIgbWVtb3J5Cj4+PiArICogZm9vdHByaW50cyB0aGUgaHlwZXJj
YWxsIGNvbnRpbnVhdGlvbiBzaG91bGQgYmUgaW1wbGVtZW50ZWQuCj4+Cj4+IEknbSBhZnJhaWQg
dGhpcyBpcyBub3Qgc2FmZSwgYXMgdXNlcnMgZG9uJ3QgaGF2ZSBhbiBlYXN5IHdheSB0byBrbm93
Cj4+IHdoZXRoZXIgYSBmb3JrIHdpbGwgaGF2ZSBhIGxhcmdlIG1lbW9yeSBmb290cHJpbnQgb3Ig
bm90Lgo+IAo+IFRoZXkgZG8sIGdldGRvbWFpbmluZm8gdGVsbHMgYSB1c2VyIGV4YWN0bHkgaG93
IG11Y2ggbWVtb3J5IGhhcyBiZWVuCj4gYWxsb2NhdGVkIGZvciBhIGRvbWFpbi4KClRoaXMgdGVs
bHMgdGhlIHRvb2wgc3RhY2sgaG93IG11Y2ggbWVtb3J5IGEgZ3Vlc3QgaGFzIGluIGFic29sdXRl
Cm51bWJlcnMsIGJ1dCBpdCBkb2Vzbid0IHRlbGwgaXQgd2hldGhlciBYZW4gd291bGQgY29uc2lk
ZXIgdGhpcwoibGFyZ2UiLgoKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgcDJtX3R5cGVfdCBwMm10
Owo+Pj4gKyAgICAgICAgcDJtX2FjY2Vzc190IHAybWE7Cj4+PiArICAgICAgICBnZm5fdCBnZm47
Cj4+PiArICAgICAgICBtZm5fdCBtZm4gPSBwYWdlX3RvX21mbihwYWdlKTsKPj4+ICsKPj4+ICsg
ICAgICAgIGlmICggIW1mbl92YWxpZChtZm4pICkKPj4+ICsgICAgICAgICAgICBjb250aW51ZTsK
Pj4+ICsKPj4+ICsgICAgICAgIGdmbiA9IG1mbl90b19nZm4oY2QsIG1mbik7Cj4+PiArICAgICAg
ICBtZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCAmcDJtdCwgJnAy
bWEsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgTlVMTCwgZmFs
c2UpOwo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCAhcDJtX2lzX3JhbShwMm10KSB8fCBwMm1faXNf
c2hhcmVkKHAybXQpICkKPj4+ICsgICAgICAgICAgICBjb250aW51ZTsKPj4+ICsKPj4+ICsgICAg
ICAgIC8qIHRha2UgYW4gZXh0cmEgcmVmZXJlbmNlICovCj4+PiArICAgICAgICBpZiAoICFnZXRf
cGFnZShwYWdlLCBjZCkgKQo+Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4gKwo+Pj4gKyAg
ICAgICAgcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIGdmbiwgSU5WQUxJRF9NRk4sIFBBR0VfT1JE
RVJfNEssCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9pbnZhbGlkLCBwMm1f
YWNjZXNzX3J3eCwgLTEpOwo+Pj4gKyAgICAgICAgQVNTRVJUKCFyYyk7Cj4+Cj4+IENhbiB5b3Ug
aGFuZGxlIHRoaXMgZ3JhY2VmdWxseT8KPiAKPiBOb3BlLiBUaGlzIHNob3VsZCBuZXZlciBoYXBw
ZW4sIHNvIGlmIGl0IGRvZXMsIHNvbWV0aGluZyBpcyB2ZXJ5IHdyb25nCj4gaW4gc29tZSBvdGhl
ciBwYXJ0IG9mIFhlbi4KCgpJbiBzdWNoIGEgY2FzZSwgcGxlYXNlIHB1dCBpbiBhIGNvbW1lbnQg
ZXhwbGFpbmluZyB3aHkgZmFpbHVyZSBpcwppbXBvc3NpYmxlLiBJbiB0aGUgZ2VuZXJhbCBjYXNl
IGUuZy4gYSAyTWIgcGFnZSBtYXkgbmVlZCBzcGxpdHRpbmcsCndoaWNoIG1heSB5aWVsZCAtRU5P
TUVNLiBTdWNoIGEgY29tbWVudCB3aWxsIHRoZW4gYWxzbyBiZSB1c2VmdWwgaW4KY2FzZSBhIG5l
dyBmYWlsdXJlIG1vZGUgZ2V0cyBhZGRlZCB0byAtPnNldF9lbnRyeSgpLCB3aGVyZSBpdCB0aGVu
CndpbGwgbmVlZCBqdWRnaW5nIHdoZXRoZXIgdGhlIGFzc3VtcHRpb24gaGVyZSBzdGlsbCBob2xk
cy4gKFRoaXMgaXMKYWxzbyB3aHkgaW4gZ2VuZXJhbCBpdCdkIGJlIGJldHRlciB0byBoYW5kbGUg
dGhlIGVycm9yLiBJdCdsbCBzdGlsbApiZSBiZXR0ZXIgdG8gY3Jhc2ggdGhlIGd1ZXN0IHRoYW4g
dGhlIGhvc3QgaW4gY2FzZSB5b3UgY2FuJ3QuIFNlZQp0aGUgYm90dG9tIG9mIC4vQ09ESU5HX1NU
WUxFLikKCkphbmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
