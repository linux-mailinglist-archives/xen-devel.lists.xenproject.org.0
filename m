Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4715434B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:41:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfUO-0001G9-0a; Thu, 06 Feb 2020 11:38:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izfUM-0001G3-Db
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:38:30 +0000
X-Inumbo-ID: 320684f2-48d5-11ea-af41-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 320684f2-48d5-11ea-af41-12813bfff9fa;
 Thu, 06 Feb 2020 11:38:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED913AE3D;
 Thu,  6 Feb 2020 11:38:28 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200204165535.17214-1-liuwe@microsoft.com>
 <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
 <20200204171959.pejeoqfg4n37gno6@debian>
 <c31b8129-2c6a-17c5-b30b-c3a2ff577768@suse.com>
 <20200205114539.c4kduolb3va3vrdf@debian>
 <20200206113403.7watd75fiaciekvu@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f6efcf0-5bed-880c-8cc4-726c8b2d73ae@suse.com>
Date: Thu, 6 Feb 2020 12:38:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206113403.7watd75fiaciekvu@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: fix off-by-one error when printing
 memory ranges
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxMjozNCwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEZlYiAwNSwgMjAy
MCBhdCAxMTo0NTozOUFNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBXZWQsIEZlYiAwNSwg
MjAyMCBhdCAwOToxMjo1MEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA0LjAy
LjIwMjAgMTg6MTksIFdlaSBMaXUgd3JvdGU6Cj4+Pj4gT24gVHVlLCBGZWIgMDQsIDIwMjAgYXQg
MDY6MDc6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA0LjAyLjIwMjAg
MTc6NTUsIFdlaSBMaXUgd3JvdGU6Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3
ZUBtaWNyb3NvZnQuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgeGVuL2FyY2gveDg2L2U4MjAuYyB8
IDIgKy0KPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9h
cmNoL3g4Ni9lODIwLmMKPj4+Pj4+IGluZGV4IGI5ZjU4OWNhYzMuLmQ2NzM4N2YxMzcgMTAwNjQ0
Cj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4+Pj4+PiArKysgYi94ZW4vYXJjaC94
ODYvZTgyMC5jCj4+Pj4+PiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJp
bnRfZTgyMF9tZW1vcnlfbWFwKHN0cnVjdCBlODIwZW50cnkgKm1hcCwgdW5zaWduZWQgaW50IGVu
dAo+Pj4+Pj4gICAgICBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKSB7Cj4+Pj4+PiAgICAg
ICAgICBwcmludGsoIiAlMDE2THggLSAlMDE2THggIiwKPj4+Pj4+ICAgICAgICAgICAgICAgICAo
dW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciksCj4+Pj4+PiAtICAgICAgICAgICAgICAg
KHVuc2lnbmVkIGxvbmcgbG9uZykobWFwW2ldLmFkZHIgKyBtYXBbaV0uc2l6ZSkpOwo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ld
LnNpemUpIC0gMSk7Cj4+Pj4+Cj4+Pj4+IFdoeSB3YXMgdGhpcyBhbiBlcnJvcj8gSWYgd2UgdXNl
ZCBbLF0gbGlrZSBMaW51eCBkb2VzIC0gc3VyZS4KPj4+Pj4gQnV0IHdlIGRvbid0LiBUaGUgcHJl
c2VudGF0aW9uLCB3aXRob3V0IGxvb2tpbmcgYXQgdGhlIHNvdXJjZSwKPj4+Pj4gc2ltcGx5IGxl
YXZlcyBvcGVuIHdoZXRoZXIgdGhpcyB3YXMgbWVhbnQgdG8gYmUgWyxdIG9yIFssKS4KPj4+Pj4g
QW5kIGl0IGNvbnRpbnVlcyB0byBiZSBsZWZ0IG9wZW4gd2l0aCB0aGUgYWRqdXN0bWVudCBtYWRl
Lgo+Pj4+Pgo+Pj4+Cj4+Pj4gV2VsbCwgTGludXgncyByZXByZXNlbnRhdGlvbiBpcyBub3Qgd2hh
dCBpcyBub3JtYWxseSBkb25lIGluIG1hdGgKPj4+PiBlaXRoZXIuCj4+Pj4KPj4+PiBJdCBpcyBs
aWtlCj4+Pj4KPj4+PiAgIFhlbjogW21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDAw
MDllZmZmXSB1c2FibGUKPj4+Pgo+Pj4+IE5vdGUgaXQgaXMgdXNpbmcgJy0nLCBub3QgJywnLiBB
bmQgdGhlcmUgaXMgIm1lbSIgYXQgdGhlIGJlZ2lubmluZy4KPj4+Pgo+Pj4+IEkgaGF2ZSBhbHdh
eXMgaW50ZXJwcmV0ZWQgdGhlIFtdIHBhaXIgYXMgc29tZXRoaW5nIHRvIGVuY2xvc2UgdGhlIHJh
bmdlLAo+Pj4+IG5vdCBvZiBtYXRoZW1hdGljYWxseSBtZWFuaW5nLgo+Pj4+Cj4+Pj4gSWYgeW91
IHdhbnQsIEkgY2FuIGNoYW5nZSBYZW4ncyBmb3JtYXQgc3RyaW5nIHRvICJbJTAxNkx4LCAlMDE2
THhdIi4KPj4+Cj4+PiBJIHRoaW5rIHRoaXMgd291bGQgbWFrZSB0aGluZ3MgbGVzcyBhbWJpZ3Vv
dXMsIHllcy4gQnV0IG15IHByaW1hcnkKPj4+IHJlcXVlc3QgaGVyZSBpcyB0byBoYXZlIG5laXRo
ZXIgImZpeCIgbm9yICJlcnJvciIgbm9yIGFueXRoaW5nCj4+PiBhbGlrZSBpbiB0aGUgdGl0bGUg
b3IgZGVzY3JpcHRpb24uCj4+Cj4+IE9LLiBJIGNhbiBjZXJ0YWlubHkgY2hhbmdlIHRoZSBzdWJq
ZWN0IGxpbmUgdG8KPj4KPj4gICB4ODY6IHN1YnRyYWN0IDEgd2hlbiBwcmludGluZyBlODIwIHJh
bmdlcwo+IAo+IElmIEkgaGVhciBubyBmdXJ0aGVyIG9iamVjdGlvbnMgSSB3aWxsIGNvbW1pdCB0
aGlzIHBhdGNoIHdpdGggdGhlIGFib3ZlCj4gc3ViamVjdCBsaW5lIHRvZGF5LgoKQW5kIHdpdGgg
dGhlIHByZXNlbnRhdGlvbiBjaGFuZ2VkIHRvIFssXT8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
