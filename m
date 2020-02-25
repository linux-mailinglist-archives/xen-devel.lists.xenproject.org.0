Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1F16C39E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:16:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6axf-0004ic-UO; Tue, 25 Feb 2020 14:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6axe-0004iX-Ph
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:13:22 +0000
X-Inumbo-ID: fa62adce-57d8-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa62adce-57d8-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 14:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5305DB004;
 Tue, 25 Feb 2020 14:13:20 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
 <c2c48b3c-4bbb-698f-2783-4bc2359cd985@suse.com>
 <CABfawhk1yZ66_xU0uOjpF1CyEh1V8HGCE4=-msCyqb_nxwrg9g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <971a3211-68b5-f07e-f869-060cd63abad6@suse.com>
Date: Tue, 25 Feb 2020 15:13:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CABfawhk1yZ66_xU0uOjpF1CyEh1V8HGCE4=-msCyqb_nxwrg9g@mail.gmail.com>
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

T24gMjUuMDIuMjAyMCAxNDo0NSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgRmVi
IDI1LCAyMDIwIGF0IDY6MzkgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjQuMDIuMjAyMCAxNjozNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgODoxMyBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDk6
MjJBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYwo+Pj4+PiBAQCAtMTYzNiw2ICsxNjM2LDU5IEBAIHN0YXRpYyBpbnQgbWVtX3NoYXJpbmdf
Zm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPj4+Pj4gICAgICByZXR1
cm4gcmM7Cj4+Pj4+ICB9Cj4+Pj4+Cj4+Pj4+ICsvKgo+Pj4+PiArICogVGhlIGZvcmsgcmVzZXQg
b3BlcmF0aW9uIGlzIGludGVuZGVkIHRvIGJlIHVzZWQgb24gc2hvcnQtbGl2ZWQgZm9ya3Mgb25s
eS4KPj4+Pj4gKyAqIFRoZXJlIGlzIG5vIGh5cGVyY2FsbCBjb250aW51YXRpb24gb3BlcmF0aW9u
IGltcGxlbWVudGVkIGZvciB0aGlzIHJlYXNvbi4KPj4+Pj4gKyAqIEZvciBmb3JrcyB0aGF0IG9i
dGFpbiBhIGxhcmdlciBtZW1vcnkgZm9vdHByaW50IGl0IGlzIGxpa2VseSBnb2luZyB0byBiZQo+
Pj4+PiArICogbW9yZSBwZXJmb3JtYW50IHRvIGNyZWF0ZSBhIG5ldyBmb3JrIGluc3RlYWQgb2Yg
cmVzZXR0aW5nIGFuIGV4aXN0aW5nIG9uZS4KPj4+Pj4gKyAqCj4+Pj4+ICsgKiBUT0RPOiBJbiBj
YXNlIHRoaXMgaHlwZXJjYWxsIHdvdWxkIGJlY29tZSB1c2VmdWwgb24gZm9ya3Mgd2l0aCBsYXJn
ZXIgbWVtb3J5Cj4+Pj4+ICsgKiBmb290cHJpbnRzIHRoZSBoeXBlcmNhbGwgY29udGludWF0aW9u
IHNob3VsZCBiZSBpbXBsZW1lbnRlZC4KPj4+Pgo+Pj4+IEknbSBhZnJhaWQgdGhpcyBpcyBub3Qg
c2FmZSwgYXMgdXNlcnMgZG9uJ3QgaGF2ZSBhbiBlYXN5IHdheSB0byBrbm93Cj4+Pj4gd2hldGhl
ciBhIGZvcmsgd2lsbCBoYXZlIGEgbGFyZ2UgbWVtb3J5IGZvb3RwcmludCBvciBub3QuCj4+Pgo+
Pj4gVGhleSBkbywgZ2V0ZG9tYWluaW5mbyB0ZWxscyBhIHVzZXIgZXhhY3RseSBob3cgbXVjaCBt
ZW1vcnkgaGFzIGJlZW4KPj4+IGFsbG9jYXRlZCBmb3IgYSBkb21haW4uCj4+Cj4+IFRoaXMgdGVs
bHMgdGhlIHRvb2wgc3RhY2sgaG93IG11Y2ggbWVtb3J5IGEgZ3Vlc3QgaGFzIGluIGFic29sdXRl
Cj4+IG51bWJlcnMsIGJ1dCBpdCBkb2Vzbid0IHRlbGwgaXQgd2hldGhlciBYZW4gd291bGQgY29u
c2lkZXIgdGhpcwo+PiAibGFyZ2UiLgo+Pgo+Pj4+PiArICAgIHsKPj4+Pj4gKyAgICAgICAgcDJt
X3R5cGVfdCBwMm10Owo+Pj4+PiArICAgICAgICBwMm1fYWNjZXNzX3QgcDJtYTsKPj4+Pj4gKyAg
ICAgICAgZ2ZuX3QgZ2ZuOwo+Pj4+PiArICAgICAgICBtZm5fdCBtZm4gPSBwYWdlX3RvX21mbihw
YWdlKTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCj4+Pj4+
ICsgICAgICAgICAgICBjb250aW51ZTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICBnZm4gPSBtZm5f
dG9fZ2ZuKGNkLCBtZm4pOwo+Pj4+PiArICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nl
c3MocDJtLCBnZm5feChnZm4pLCAmcDJtdCwgJnAybWEsCj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAwLCBOVUxMLCBmYWxzZSk7Cj4+Pj4+ICsKPj4+Pj4gKyAgICAg
ICAgaWYgKCAhcDJtX2lzX3JhbShwMm10KSB8fCBwMm1faXNfc2hhcmVkKHAybXQpICkKPj4+Pj4g
KyAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgIC8qIHRha2UgYW4g
ZXh0cmEgcmVmZXJlbmNlICovCj4+Pj4+ICsgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGNk
KSApCj4+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICBy
YyA9IHAybS0+c2V0X2VudHJ5KHAybSwgZ2ZuLCBJTlZBTElEX01GTiwgUEFHRV9PUkRFUl80SywK
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1faW52YWxpZCwgcDJtX2FjY2Vz
c19yd3gsIC0xKTsKPj4+Pj4gKyAgICAgICAgQVNTRVJUKCFyYyk7Cj4+Pj4KPj4+PiBDYW4geW91
IGhhbmRsZSB0aGlzIGdyYWNlZnVsbHk/Cj4+Pgo+Pj4gTm9wZS4gVGhpcyBzaG91bGQgbmV2ZXIg
aGFwcGVuLCBzbyBpZiBpdCBkb2VzLCBzb21ldGhpbmcgaXMgdmVyeSB3cm9uZwo+Pj4gaW4gc29t
ZSBvdGhlciBwYXJ0IG9mIFhlbi4KPj4KPj4KPj4gSW4gc3VjaCBhIGNhc2UsIHBsZWFzZSBwdXQg
aW4gYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IGZhaWx1cmUgaXMKPj4gaW1wb3NzaWJsZS4gSW4g
dGhlIGdlbmVyYWwgY2FzZSBlLmcuIGEgMk1iIHBhZ2UgbWF5IG5lZWQgc3BsaXR0aW5nLAo+PiB3
aGljaCBtYXkgeWllbGQgLUVOT01FTS4gU3VjaCBhIGNvbW1lbnQgd2lsbCB0aGVuIGFsc28gYmUg
dXNlZnVsIGluCj4+IGNhc2UgYSBuZXcgZmFpbHVyZSBtb2RlIGdldHMgYWRkZWQgdG8gLT5zZXRf
ZW50cnkoKSwgd2hlcmUgaXQgdGhlbgo+PiB3aWxsIG5lZWQganVkZ2luZyB3aGV0aGVyIHRoZSBh
c3N1bXB0aW9uIGhlcmUgc3RpbGwgaG9sZHMuIChUaGlzIGlzCj4+IGFsc28gd2h5IGluIGdlbmVy
YWwgaXQnZCBiZSBiZXR0ZXIgdG8gaGFuZGxlIHRoZSBlcnJvci4gSXQnbGwgc3RpbGwKPj4gYmUg
YmV0dGVyIHRvIGNyYXNoIHRoZSBndWVzdCB0aGFuIHRoZSBob3N0IGluIGNhc2UgeW91IGNhbid0
LiBTZWUKPj4gdGhlIGJvdHRvbSBvZiAuL0NPRElOR19TVFlMRS4pCj4gCj4gVGhlIG1lbV9zaGFy
aW5nIGNvZGViYXNlIHVzZXMgQVNTRVJUKCFyYykgb24gcDJtLT5zZXRfZW50cnkgYWxyZWFkeQo+
IHdoZW4gcmVtb3ZpbmcgcGFnZXMgbGlrZSB3ZSBkbyBoZXJlIChzZWUgcmVsaW5xdWlzaF9zaGFy
ZWRfcGFnZXMpLgo+IFRoaXMgb25seSBnZXRzIGNhbGxlZCBvbiBzaGFyZWQgcGFnZXMgdGhhdCB3
ZSBrbm93IGZvciBzdXJlIGFyZQo+IHByZXNlbnQuIFNpbmNlIHRoZXNlIGFyZSBzaGFyZWQgcGFn
ZXMgd2Uga25vdyB0aGF0IHRoZWlyIHNpemUgaXMgNGsKPiB0aHVzIHRoZXJlIGlzIG5vIHNwbGl0
dGluZy4gSSBjYW4gY2VydGFpbmx5IGFkZCBhIGNvbW1lbnQgdG8gdGhpcwo+IGVmZmVjdCB0byBz
cGVsbCBpdCBvdXQgd2h5IHRoZSBBU1NFUlQgaXMgYXBwcm9wcmlhdGUuCgpXZWxsLCBpZiB0aGlz
IGlzIGEgcHJlLWV4aXN0aW5nIHBhdHRlcm4gaW4gdGhlIGZpbGUsIHRoZW4gLSB5b3UKYmVpbmcg
dGhlIG1haW50YWluZXIgLSBzbyBiZSBpdC4gSSBjb25zaWRlciB0aGlzIGJhZCBwcmFjdGljZSB0
aG91Z2gsCmFuZCBJIHdvdWxkIHN1Z2dlc3QgdGhhdCBldmVyeSBzdWNoIHNpdGUgbmVlZHMgYSBj
b21tZW50IChwb3NzaWJseQphbGwgYnV0IG9uZSBzaW1wbHkgcmVmZXJyaW5nIHRvIHRoZSBvbmUg
d2hlcmUgdGhpbmdzIGdldCBhY3R1YWxseQpleHBsYWluZWQpLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
