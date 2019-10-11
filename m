Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFBD3D2D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 12:19:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrwn-0007fQ-D6; Fri, 11 Oct 2019 10:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIrwl-0007fK-74
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 10:14:55 +0000
X-Inumbo-ID: f4c9eb01-ec0f-11e9-9330-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f4c9eb01-ec0f-11e9-9330-12813bfff9fa;
 Fri, 11 Oct 2019 10:14:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB5721597;
 Fri, 11 Oct 2019 03:14:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10BF13F703;
 Fri, 11 Oct 2019 03:14:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
 <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
 <c9b7bd90-344c-77a1-0191-c215f1b201c1@arm.com>
 <alpine.DEB.2.21.1910081422040.13684@sstabellini-ThinkPad-T480s>
 <69bdb4a8-a50f-61cf-f685-867f67436555@arm.com>
 <alpine.DEB.2.21.1910101729000.9081@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ef551ef4-f4a2-4829-1405-2bcf541f17c3@arm.com>
Date: Fri, 11 Oct 2019 11:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910101729000.9081@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8xMC8yMDE5IDAxOjMyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VGh1LCAxMCBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAwOC8xMC8yMDE5IDIz
OjI0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBUdWUsIDggT2N0IDIwMTksIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+PiBPbiAxMC84LzE5IDE6MTggQU0sIFN0ZWZhbm8gU3RhYmVs
bGluaSB3cm90ZToKPj4+Pj4gT24gTW9uLCA3IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4+PiBIaSwKPj4+Pj4+Cj4+Pj4+PiBPbiAwMy8xMC8yMDE5IDAyOjAyLCBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+Pj4gT24gRnJpLCAyMCBTZXAgMjAxOSwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+Pj4+Pj4+PiBUaGF0J3Mgbm90IGNvcnJlY3QuIGFsbG9jX2Jvb3RfcGFnZXMoKSBp
cyBhY3R1YWxseSBoZXJlIHRvIGFsbG93Cj4+Pj4+Pj4+IGR5bmFtaWMKPj4+Pj4+Pj4gYWxsb2Nh
dGlvbiBiZWZvcmUgdGhlIG1lbW9yeSBzdWJzeXN0ZW0gKGFuZCB0aGVyZWZvcmUgdGhlIHJ1bnRp
bWUKPj4+Pj4+Pj4gYWxsb2NhdG9yKQo+Pj4+Pj4+PiBpcyBpbml0aWFsaXplZC4KPj4+Pj4+Pgo+
Pj4+Pj4+IExldCBtZSBjaGFuZ2UgdGhlIHF1ZXN0aW9uIHRoZW46IGlzIHRoZSBzeXN0ZW1fc3Rh
dGUgPT0KPj4+Pj4+PiBTWVNfU1RBVEVfZWFybHlfYm9vdCBjaGVjayBzdHJpY3RseSBuZWNlc3Nh
cnk/IEl0IGxvb2tzIGxpa2UgaXQgaXMKPj4+Pj4+PiBub3Q6Cj4+Pj4+Pj4gdGhlIHBhdGNoIHdv
dWxkIHdvcmsgZXZlbiBpZiBpdCB3YXMganVzdDoKPj4+Pj4+Cj4+Pj4+PiBJIGhhZCBhIGZldyB0
aG91Z2h0cyBhYm91dCBpdC4gT24gQXJtMzIsIHRoaXMgb25seSByZWFsbHkgd29ya3MgZm9yCj4+
Pj4+PiAzMi1iaXRzIG1hY2hpbmUgYWRkcmVzcyAoaXQgY2FuIGdvIHVwIHRvIDQwLWJpdHMpLiBJ
IGhhdmVuJ3QgcmVhbGx5Cj4+Pj4+PiBmdWxseSBpbnZlc3RpZ2F0ZWQgd2hhdCBjb3VsZCBnbyB3
cm9uZywgYnV0IGl0IHdvdWxkIGJlIGJlc3QgdG8ga2VlcAo+Pj4+Pj4gaXQKPj4+Pj4+IG9ubHkg
Zm9yIGVhcmx5IGJvb3QuCj4+Pj4+Pgo+Pj4+Pj4gQWxzbywgSSBkb24ndCByZWFsbHkgd2FudCB0
byByZWx5IG9uIHRoaXMgIndvcmthcm91bmQiIGFmdGVyIGJvb3QuCj4+Pj4+PiBNYXliZQo+Pj4+
Pj4gd2Ugd291bGQgd2FudCB0byBrZWVwIHRoZW0gdW5tYXBwZWQgaW4gdGhlIGZ1dHVyZS4KPj4+
Pj4KPj4+Pj4gWWVzLCBubyBwcm9ibGVtcywgd2UgYWdyZWUgb24gdGhhdC4gSSBhbSBub3QgYXNr
aW5nIGluIHJlZ2FyZHMgdG8gdGhlCj4+Pj4+IGNoZWNrIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RB
VEVfZWFybHlfYm9vdCB3aXRoIHRoZSBnb2FsIG9mIGFza2luZyB5b3UKPj4+Pj4gdG8gZ2V0IHJp
ZCBvZiBpdC4gSSBhbSBmaW5lIHdpdGgga2VlcGluZyB0aGUgY2hlY2suIChNYXliZSB3ZSB3YW50
IHRvCj4+Pj4+IGFkZAo+Pj4+PiBhbiBgdW5saWtlbHkoKScgYXJvdW5kIHRoZSBjaGVjay4pCj4+
Pj4+Cj4+Pj4+IEkgYW0gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hldGhlciB0aGUgY29kZSBhY3R1
YWxseSByZWxpZXMgb24KPj4+Pj4gc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290
LCBhbmQsIGlmIHNvLCB3aHkuIFRoZSBnb2FsIGlzIHRvCj4+Pj4+IG1ha2Ugc3VyZSB0aGF0IGlm
IHRoZXJlIGFyZSBzb21lIGxpbWl0YXRpb25zIHRoYXQgdGhleSBhcmUgZG9jdW1lbnRlZCwKPj4+
Pj4gb3IganVzdCB0byBkb3VibGUtY2hlY2sgdGhhdCB0aGVyZSBhcmUgbm8gbGltaXRhdGlvbnMu
Cj4+Pj4KPj4+PiBUaGUgY2hlY2sgaXMgbm90IHN0cmljdGx5IG5lY2Vzc2FyeS4KPj4+Pgo+Pj4+
Pgo+Pj4+PiBJbiByZWdhcmRzIHRvIHlvdXIgY29tbWVudCBhYm91dCBvbmx5IHdvcmtpbmcgZm9y
IDMyLWJpdCBhZGRyZXNzZXMgb24KPj4+Pj4gQXJtMzIsIHlvdSBoYXZlIGEgcG9pbnQuIEF0IGxl
YXN0IHdlIHNob3VsZCBiZSBjYXJlZnVsIHdpdGggdGhlIG1mbiB0bwo+Pj4+PiB2YWRkciBjb252
ZXJzaW9uIGJlY2F1c2UgbWZuX3RvX21hZGRyIHJldHVybnMgYSBwYWRkcl90IHdoaWNoIGlzIDY0
LWJpdAo+Pj4+PiBhbmQgdmFkZHJfdCBpcyAzMi1iaXQuIEkgaW1hZ2luZSB0aGF0IHRoZW9yZXRp
Y2FsbHksIGV2ZW4gd2l0aAo+Pj4+PiBzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2Vhcmx5X2Jv
b3QsIGl0IGNvdWxkIGdldCB0cnVuY2F0ZWQgd2l0aCB0aGUKPj4+Pj4gd3JvbmcgY29tYmluYXRp
b24gb2YgbWZuIGFuZCBwaHlzX29mZnNldC4KPj4+Pj4KPj4+Pj4gSWYgbm90aGluZyBlbHNlLCBt
YXliZSB3ZSBzaG91bGQgYWRkIGEgdHJ1bmNhdGlvbiBjaGVjayBmb3Igc2FmZXR5Pwo+Pj4+Cj4+
Pj4gRXhjZXB0IHRoYXQgcGh5c19vZmZzZXQgaXMgbm90IGRlZmluZWQgY29ycmVjdGx5LCBzbyB5
b3VyIGNoZWNrIGJlbG93IHdpbGwKPj4+PiBicmVhayBzb21lIHNldHVwIDooLiBMZXQncyB0YWtl
IHRoZSBmb2xsb3dpbmcgZXhhbXBsZToKPj4+Pgo+Pj4+ICAgICAgWGVuIGlzIGxvYWRlZCBhdCBQ
QSAweDEwMDAwMAo+Pj4+Cj4+Pj4gVGhlIGJvb3Qgb2Zmc2V0IGlzIGNvbXB1dGVkIHVzaW5nIDMy
LWJpdCBhZGRyZXNzIChzZWUgaGVhZC5TKToKPj4+PiAgICAgICBQQSAtIFZBID0gMHgxMDAwMDAg
LSAweDIwMDAwMAo+Pj4+ICAgICAgICAgICAgICAgPSAweGZmZjAwMDAwCj4+Pj4KPj4+PiBUaGlz
IHZhbHVlIHdpbGwgYmUgcGFzc2VkIHRvIEMgY29kZSBhcyBhbiB1bnNpZ25lZCBsb25nLiBCdXQg
dGhlbiB3ZSB3aWxsCj4+Pj4gc3RvcmUgaXQgaW4gYSB1aW50NjRfdC9wYWRkcl90IChzZWUgcGh5
c19vZmZzZXQgd2hpY2ggaXMgc2V0IGluCj4+Pj4gc2V0dXBfcGFnZV90YWJsZXMpLiBCZWNhdXNl
IHRoaXMgaXMgYSBjb252ZXJzaW9uIGZyb20gdW5zaWduZWQgdG8KPj4+PiB1bnNpZ25lZCwKPj4+
PiB0aGUgInNpZ24gYml0IiB3aWxsIG5vdCBiZSBwcm9wYWdhdGVkLgo+Pj4+Cj4+Pj4gVGhpcyBt
ZWFucyB0aGF0IHBoeXNfb2Zmc2V0IHdpbGwgYmUgZXF1YWwgdG8gMHhmZmYwMDAwMCBhbmQgbm90
Cj4+Pj4gMHhmZmZmZmZmZmZmZjAwMDAwIQo+Pj4+Cj4+Pj4gVGhlcmVmb3JlIGlmIHdlIHRyeSB0
byBjb252ZXJ0IDB4MTAwMDAwICh3aGVyZSBYZW4gaGFzIGJlZW4gbG9hZGVkKSBiYWNrCj4+Pj4g
dG8KPj4+PiBpdHMgVkEsIHRoZSByZXN1bHRpbmcgdmFsdWUgd2lsbCBiZSAweGZmZmZmZmZmMDAy
MDAxMDAuCj4+Pj4KPj4+PiBMb29raW5nIGF0IHRoZSBjb2RlLCBJIHRoaW5rIHB0ZV9vZl94ZW5h
ZGRyKCkgaGFzIGFsc28gdGhlIGV4YWN0IHByb2JsZW0uCj4+Pj4gOigKPj4+Cj4+PiBPbmUgd2F5
IHRvIGZpeCBpdCB3b3VsZCBiZSB0byBjaGFuZ2UgcGh5c19vZmZzZXQgdG8gcmVnaXN0ZXJfdCAo
b3IganVzdAo+Pj4gZGVjbGFyZSBpdCBhcyB1bnNpZ25lZCBsb25nIG9uIGFybTMyIGFuZCB1bnNp
Z25lZCBsb25nIGxvbmcgb24gYXJtNjQpOgo+Pgo+PiBzaXplb2YgKHVuc2lnbmVkIGxvbmcpID0g
MzIgKHJlc3AuIDY0KSBvbiBBcm0zMiAocmVzcC4gYXJtNjQpLiBUaGlzIGlzIHdoYXQgd2UKPj4g
YWxyZWFkeSByZWx5IG9uIGZvciBib290X3BoeXNfb2Zmc2V0IChzZWUgc2V0dXBfcGFnZXRhYmxl
cykuIFNvIEkgYW0gbm90IHN1cmUKPj4gd2h5IHBoeXNfb2Zmc2V0IG5lZWRzIHRvIGJlIGRlZmlu
ZWQgZGlmZmVyZW50bHkuCj4+Cj4+IEFuIGFsdGVybmF0aXZlIGlzIHRvIHVzZSB2YWRkcl90Lgo+
IAo+IFllcywgSSBtZWFudCBsaWtlIHZhZGRyX3Qgb3IganVzdCAidW5zaWduZWQgbG9uZyIgbGlr
ZSBib290X3BoeXNfb2Zmc2V0Lgo+IEV2ZW4gd2l0aCB5b3VyIGxhdGVzdCBwYXRjaAo+IChodHRw
czovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNTcwNzMwMDQ4MzA4OTQpIHdoaWNoIEkgbGlr
ZSBhcyBhIHdheQo+IHRvIHNvbHZlIHRoZSBvcmlnaW5hbCBHUlVCIGJvb3RpbmcgaXNzdWUsIGl0
IGxvb2tzIGxpa2Ugd2UgYWxzbyBuZWVkIHRvCj4gY2hhbmdlIHBoeXNfYWRkciB0byB1bnNpZ25l
ZCBsb25nIHRvIGZpeCBvdGhlciBhcm0zMiBwcm9ibGVtcy4KPiAKPiBBcmUgeW91IGdvaW5nIHRv
IHNlbmQgdGhlIHBhdGNoIGZvciB0aGF0IHRvbz8KCkkgYW0gbG9va2luZyBhdCBkcm9wcGluZyBw
aHlzX29mZnNldCBjb21wbGV0ZWx5LgoKUmVnYXJkaW5nIFhlbiA0LjEzLCB0aGUgaXNzdWUgd291
bGQgb25seSBoYXBwZW4gaWYgeW91IHBsYWNlIFhlbiBiZWxvdyAyTUIgb24gCkFybTMyLiBZZXQs
IEkgYmVsaWV2ZSB0aGlzIHdvcmtzIGZpbmUgYmVjYXVzZSBvZiBzaWRlIGVmZmVjdCAoTUZOIGNh
biBvbmx5IGJlIAozMi1iaXQpLgoKVGhpcyBpcyBub3QgcHJldHR5LCBidXQgSSBkb24ndCB2aWV3
IHRoaXMgYXMgY3JpdGljYWwgdG8gZml4IGZvciBYZW4gNC4xMy4gU28gSSAKYW0gdGhpbmtpbmcg
dG8gZGVmZXIgdGhpcyBwb3N0IDQuMTMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
