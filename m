Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484A14301E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:42:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ita4v-0007Vn-A6; Mon, 20 Jan 2020 16:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ita4t-0007Vd-Ob
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:39:03 +0000
X-Inumbo-ID: 58d96b1a-3ba3-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58d96b1a-3ba3-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 16:38:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE0DBAD43;
 Mon, 20 Jan 2020 16:38:53 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <ce3871c8e9ee01523d2032990ff8acaaaf69a350.1578503483.git.tamas.lengyel@intel.com>
 <03edb7c7-967a-19f4-76bd-9aa9c9af1bd3@suse.com>
 <CABfawh=mNt8nX_oMZV2zg_S9oDey4=KWNHJuk32hxLnpjgRnBQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c60fb19-8bd9-bded-40e4-f900e8ca6bde@suse.com>
Date: Mon, 20 Jan 2020 17:38:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=mNt8nX_oMZV2zg_S9oDey4=KWNHJuk32hxLnpjgRnBQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 13/18] x86/mem_sharing: Skip xen heap
 pages in memshr nominate
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxNzozMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgSmFu
IDIwLCAyMDIwIGF0IDk6MjMgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
VHJ5aW5nIHRvIHNoYXJlIHRoZXNlIHdvdWxkIGZhaWwgYW55d2F5LCBiZXR0ZXIgdG8gc2tpcCB0
aGVtIGVhcmx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMu
bGVuZ3llbEBpbnRlbC5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+IGFsYmVpdCBJIHdvbmRlciBpZiB0aGlzIGNvdWxkbid0IGJlIGZ1cnRo
ZXIgZ2VuZXJhbGl6ZWQgYnkgLi4uCj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3No
YXJpbmcuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPj4+IEBAIC04
NTIsNiArODUyLDExIEBAIHN0YXRpYyBpbnQgbm9taW5hdGVfcGFnZShzdHJ1Y3QgZG9tYWluICpk
LCBnZm5fdCBnZm4sCj4+PiAgICAgIGlmICggIXAybV9pc19zaGFyYWJsZShwMm10KSApCj4+PiAg
ICAgICAgICBnb3RvIG91dDsKPj4+Cj4+PiArICAgIC8qIFNraXAgeGVuIGhlYXAgcGFnZXMgKi8K
Pj4+ICsgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7Cj4+PiArICAgIGlmICggIXBhZ2UgfHwg
aXNfeGVuX2hlYXBfcGFnZShwYWdlKSApCj4+PiArICAgICAgICBnb3RvIG91dDsKPj4KPj4gLi4u
IGNoZWNraW5nIGZvciBhIHplcm8gdHlwZSByZWYgY291bnQgKHRoZSBvbmx5IG1lYW5zIHRvIHBl
cm1pdAo+PiBhIHR5cGUgY2hhbmdlKSBoZXJlLCBhbmQgbWF5YmUgYWxzbyAtPmNvdW50X2luZm8g
dG8gZml0IHdoYXQKPj4gcGFnZV9tYWtlX3NoYXJhYmxlKCkgZXhwZWN0cy4KPiAKPiBOb3Qgc3Vy
ZSBJIGZvbGxvdyB5b3UsIHR5cGUgY291bnQgaXMgY2hlY2tlZCBieSBwYWdlX21ha2Vfc2hhcmFi
bGUgYnV0Cj4gaXQgaGFzIHRvIGJlIGV4YWN0bHkgMToKPiAKPiAgICAgLyogQ2hlY2sgaWYgcGFn
ZSBpcyBhbHJlYWR5IHR5cGVkIGFuZCBiYWlsIGVhcmx5IGlmIGl0IGlzICovCj4gICAgIGlmICgg
KHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spICE9IDEgKQo+ICAgICB7
Cj4gICAgICAgICBzcGluX3VubG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKPiAgICAgICAgIHJl
dHVybiAtRUVYSVNUOwo+ICAgICB9CgpXaGljaCBpcyBhZnRlciBhIHN1Y2Nlc3NmdWwgZ2V0X3Bh
Z2VfYW5kX3R5cGUoKS4gUHJpb3IgdG8gdGhhdCwKdGhlcmVmb3JlLCB0aGUgY291bnQgb3VnaHQg
dG8gYmUgemVyby4gQnV0IG1heWJlIEknbSB2ZXJ5IGNvbmZ1c2VkCi0gc2VlIGFsc28gbXkgY29t
bWVudHMgb24gcGF0Y2ggMTQsIHdoZXJlIEkgc3BvdHRlZCB0aGlzIHZlcnkgc2FtZQphbm9tYWx5
LgoKPiBJIHNwZWNpZmljYWxseSB3YW50IHRvIGF2b2lkIGNhbGxpbmcgcGFnZV9tYWtlX3NoYXJh
YmxlIG9uIHhlbiBoZWFwCj4gcGFnZXMgYmVjYXVzZSB0aGV5IGVuZCB1cCBwcmludGluZyBhbiBl
cnJvciB0byB0aGUgY29uc29sZSB3aGljaCBpcwo+IHZlcnkgYW5ub3lpbmcuCgpUaGF0J3MgZmlu
ZS4gSSdtIG5vdCBhc2tpbmcgdG8gZHJvcCB3aGF0IHlvdSdyZSBkb2luZy4gSW5zdGVhZCBJJ20K
YXNraW5nIHdoZXRoZXIgeW91IGNvdWxkbid0IGJhaWwgZWFybHkgaW4gZXZlbiBtb3JlIGNhc2Vz
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
