Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3371600E
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 11:02:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNvx9-0004eX-DL; Tue, 07 May 2019 08:59:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNvx8-0004eL-Fx
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 08:59:58 +0000
X-Inumbo-ID: 7c839cfc-70a6-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7c839cfc-70a6-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 08:59:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C99C374;
 Tue,  7 May 2019 01:59:56 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAFAD3F238;
 Tue,  7 May 2019 01:59:54 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
 <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
 <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f9deae17-e925-9a4f-1eb1-443b428e0525@arm.com>
Date: Tue, 7 May 2019 09:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNS83LzE5IDg6NDAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2
LjA1LjE5IGF0IDE3OjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiA1LzYv
MTkgMTA6MDYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDMuMDUuMTkgYXQgMjI6
NTAsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vc2V0dXAuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+Pj4gQEAgLTQ4MSwx
MCArNDgxLDE1IEBAIHN0YXRpYyBwYWRkcl90IF9faW5pdCBuZXh0X21vZHVsZShwYWRkcl90IHMs
IHBhZGRyX3QgKmVuZCkKPj4+PiAgICBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9wZHgodm9pZCkK
Pj4+PiAgICB7Cj4+Pj4gICAgICAgIHBhZGRyX3QgYmFua19zdGFydCwgYmFua19zaXplLCBiYW5r
X2VuZDsKPj4+PiAtCj4+Pj4gLSAgICB1NjQgbWFzayA9IHBkeF9pbml0X21hc2soYm9vdGluZm8u
bWVtLmJhbmtbMF0uc3RhcnQpOwo+Pj4+ICsgICAgdTY0IG1hc2s7Cj4+Pj4gICAgICAgIGludCBi
YW5rOwo+Pj4+ICAgIAo+Pj4+ICsgICAgLyoKPj4+PiArICAgICAqIFdlIGFsd2F5cyBtYXAgdGhl
IGZpcnN0IDE8PE1BWF9PUkRFUiBvZiBSQU0sIGhlbmNlLCB0aGV5IGFyZSBsZWZ0Cj4+Pgo+Pj4g
Ii4uLiBwYWdlcyBvZiBSQU0uIiA/Cj4+Pgo+Pj4+ICsgICAgICogdW5jb21wcmVzc2VkLgo+Pj4+
ICsgICAgICovCj4+Pj4gKyAgICBtYXNrID0gcGR4X2luaXRfbWFzaygxVUxMIDw8IChNQVhfT1JE
RVIgKyBQQUdFX1NISUZUKSk7Cj4+Pgo+Pj4gUEFHRV9TSVpFIDw8IE1BWF9PUkRFUj8KPj4KPj4g
SG1tbSwgSSBhbSBub3QgZW50aXJlbHkgY29udmluY2UgdGhpcyB3aWxsIGdpdmUgdGhlIGNvcnJl
Y3QgdmFsdWUKPj4gYmVjYXVzZSBQQUdFX1NJWkUgaXMgZGVmaW5lZCBhcyAoX0FDKDEsIEwpIDw8
IFBBR0VfU0hJRlQuCj4gCj4gT2gsIGluZGVlZCwgZm9yIGFuIGFic3RyYWN0IDMyLWJpdCBhcmNo
IHRoaXMgd291bGQgZGUtZ2VuZXJhdGUsIGR1ZQo+IHRvIE1BWF9PUkRFUiBiZWluZyAyMC4gTmV2
ZXJ0aGVsZXNzIEkgdGhpbmsgdGhlIGV4cHJlc3Npb24gdXNlZAo+IGludml0ZXMgZm9yICJjbGVh
bmluZyB1cCIgKG1ha2luZyB0aGUgc2FtZSBtaXN0YWtlIEkndmUgbWFkZSksIGFuZAo+IHNpbmNl
IHRoaXMgaXMgaW4gQXJtLXNwZWNpZmljIGNvZGUgKHdoZXJlIE1BWF9PUkRFUiBpcyAxOCkgSSB0
aGluayBpdAo+IHdvdWxkIHN0aWxsIGJlIGJldHRlciB0byB1c2UgdGhlIHN1Z2dlc3RlZCBhbHRl
cm5hdGl2ZS4KClRoZSBjb21tZW50IG9uIHRvcCBvZiBQQUdFX1NJWkUgaW4gYXNtLXg4Ni9wYWdl
LmggbGVhZHMgdG8gdGhpbmsgdGhhdCAKUEFHRV9TSVpFIHNob3VsZCB1c2Ugc2lnbmVkIHF1YW50
aXRpZXMuIFNvIEkgYW0gbm90IHN1cmUgd2hldGhlciBpdCBpcyAKc2FmZSB0byBzd2l0Y2ggdG8g
VUwgaGVyZS4KCklmIHdlIGtlZXAgUEFHRV9TSVpFIGFzIHNpZ25lZCBxdWFudGl0aWVzLCB0aGVu
IEkgd291bGQgcmF0aGVyIG5vdCB1c2VkIAp5b3VyIHN1Z2dlc3Rpb24gYmVjYXVzZSB0aGlzIG1h
eSBpbnRyb2R1Y2UgYnVnZ3kgY29kZSBpZiBNQVhfT1JERVIgaXMgCmV2ZXIgdXBkYXRlZCBvbiBB
cm0uCgo+IAo+Pj4gSSB3b25kZXIgd2hldGhlciBwZHhfaW5pdF9tYXNrKCkgaXRzZWxmIHdvdWxk
bid0IGJldHRlciBhcHBseSB0aGlzCj4+PiAobG93ZXIpIGNhcAo+Pgo+PiBEbyB5b3UgbWVhbiBh
bHdheXMgcmV0dXJuaW5nIChQQUdFX1NJWkUgPDwgTUFYX09SREVSKSBvciBjYXBwaW5nIHRoZQo+
PiBpbml0IG1hc2s/Cj4+Cj4+IE5vdGUgdGhhdCB0aGUgbGF0ZXIgd2lsbCBub3QgcHJvZHVjZSB0
aGUgc2FtZSBiZWhhdmlvciBhcyB0aGlzIHBhdGNoLgo+IAo+IFNpbmNlIEknbSBub3Qgc3VyZSBJ
IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiB3aXRoICJjYXBwaW5nIHRoZQo+IGluaXQgbWFzayIs
IEknbSBhbHNvIHVuY2VydGFpbiB3aGF0IGFsdGVybmF0aXZlIGJlaGF2aW9yIHlvdSdyZQo+IHRo
aW5raW5nIG9mLiBXaGF0IEknbSBzdWdnZXN0aW5nIGlzCj4gCj4gdTY0IF9faW5pdCBwZHhfaW5p
dF9tYXNrKHU2NCBiYXNlX2FkZHIpCj4gewo+ICAgICAgcmV0dXJuIGZpbGxfbWFzayhtYXgoYmFz
ZV9hZGRyLCAodWludDY0X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUikgLSAxKTsKPiB9CgpBcyBJ
IHBvaW50ZWQgb3V0IGluIHRoZSBvcmlnaW5hbCB0aHJlYWQsIHRoZXJlIGFyZSBhIGNvdXBsZSBv
ZiBpc3N1ZXMgCndpdGggdGhpcyBzdWdnZXN0aW9uOgoJMSkgYmFua3MgYXJlIG5vdCBvcmRlcmVk
IG9uIEFybSwgc28gdGhlIHBkeCBtYXNrIG1heSBnZXQgaW5pdGlhbGl6ZWQgCndpdGggYSBoaWdo
ZXIgYmFuayBhZGRyZXNzIHByZXZlbnRpbmcgdGhlIFBEWCBjb21wcmVzc2lvbiB0byB3b3JrCgky
KSB0aGUgUERYIHdpbGwgbm90IGJlIGFibGUgdG8gY29tcHJlc3MgYW55IGJpdHMgYmV0d2VlbiAw
IGFuZCB0aGUgTVNCIAoxJyBpbiB0aGUgYmFzZV9hZGRyLiBJbiBvdGhlciB3b3JkLCBmb3IgYSBi
YXNlIGFkZHJlc3MgMHgyMDAwMDAwMDAgCig4R0IpLCB0aGUgaW5pdGlhbCBtYXNrIHdpbGwgYmUg
IDB4MWZmZmZmZmZmLiBJIGFtIGF3YXJlIG9mIHNvbWUgCnBsYXRmb3JtcyB3aXRoIHNvbWUgaW50
ZXJlc3RpbmcgZmlyc3QgYmFuayBiYXNlIGFkZHJlc3MgKGkuZSBhYm92ZSA0R0IpLgoKMikgaXMg
bm90IG92ZXJseSBjcml0aWNhbCwgYnV0IEkgdGhpbmsgMSkgc2hvdWxkIGJlIGFkZHJlc3NlZC4K
CkF0IGxlYXN0IG9uIEFybSwgSSBkb24ndCBzZWUgYW55IHJlYWwgdmFsdWUgdG8gaW5pdGlhbGl6
ZSB0aGUgUERYIG1hc2sgCndpdGggYSBiYXNlIGFkZHJlc3MuIEkgd291bGQgYmUgbW9yZSBrZWVu
IHRvIGltcGxlbWVudCBwZHhfaW5pdF9tYXNrKCkgYXM6CgpyZXR1cm4gZmlsbF9tYXNrKCgodWlu
dDY0X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUiAtIDEpOwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
