Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C616E154336
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:35:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfQA-000109-Te; Thu, 06 Feb 2020 11:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I8Ts=32=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izfQ8-000102-KU
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:34:08 +0000
X-Inumbo-ID: 965a1d2a-48d4-11ea-8080-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 965a1d2a-48d4-11ea-8080-bc764e2007e4;
 Thu, 06 Feb 2020 11:34:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izfQ6-0001GV-7K; Thu, 06 Feb 2020 11:34:06 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izfQ5-0001BA-Ts; Thu, 06 Feb 2020 11:34:06 +0000
Date: Thu, 6 Feb 2020 11:34:03 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200206113403.7watd75fiaciekvu@debian>
References: <20200204165535.17214-1-liuwe@microsoft.com>
 <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
 <20200204171959.pejeoqfg4n37gno6@debian>
 <c31b8129-2c6a-17c5-b30b-c3a2ff577768@suse.com>
 <20200205114539.c4kduolb3va3vrdf@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205114539.c4kduolb3va3vrdf@debian>
User-Agent: NeoMutt/20180716
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6NDU6MzlBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEZlYiAwNSwgMjAyMCBhdCAwOToxMjo1MEFNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+IE9uIDA0LjAyLjIwMjAgMTg6MTksIFdlaSBMaXUgd3JvdGU6Cj4gPiA+IE9uIFR1
ZSwgRmViIDA0LCAyMDIwIGF0IDA2OjA3OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPj4gT24gMDQuMDIuMjAyMCAxNzo1NSwgV2VpIExpdSB3cm90ZToKPiA+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4gPj4+IC0tLQo+ID4gPj4+
ICB4ZW4vYXJjaC94ODYvZTgyMC5jIHwgMiArLQo+ID4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4+Pgo+ID4gPj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+ID4gPj4+IGluZGV4IGI5
ZjU4OWNhYzMuLmQ2NzM4N2YxMzcgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2U4
MjAuYwo+ID4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+ID4+PiBAQCAtOTQsNyAr
OTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfZTgyMF9tZW1vcnlfbWFwKHN0cnVjdCBl
ODIwZW50cnkgKm1hcCwgdW5zaWduZWQgaW50IGVudAo+ID4gPj4+ICAgICAgZm9yIChpID0gMDsg
aSA8IGVudHJpZXM7IGkrKykgewo+ID4gPj4+ICAgICAgICAgIHByaW50aygiICUwMTZMeCAtICUw
MTZMeCAiLAo+ID4gPj4+ICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBb
aV0uYWRkciksCj4gPiA+Pj4gLSAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpKG1h
cFtpXS5hZGRyICsgbWFwW2ldLnNpemUpKTsKPiA+ID4+PiArICAgICAgICAgICAgICAgKHVuc2ln
bmVkIGxvbmcgbG9uZykobWFwW2ldLmFkZHIgKyBtYXBbaV0uc2l6ZSkgLSAxKTsKPiA+ID4+Cj4g
PiA+PiBXaHkgd2FzIHRoaXMgYW4gZXJyb3I/IElmIHdlIHVzZWQgWyxdIGxpa2UgTGludXggZG9l
cyAtIHN1cmUuCj4gPiA+PiBCdXQgd2UgZG9uJ3QuIFRoZSBwcmVzZW50YXRpb24sIHdpdGhvdXQg
bG9va2luZyBhdCB0aGUgc291cmNlLAo+ID4gPj4gc2ltcGx5IGxlYXZlcyBvcGVuIHdoZXRoZXIg
dGhpcyB3YXMgbWVhbnQgdG8gYmUgWyxdIG9yIFssKS4KPiA+ID4+IEFuZCBpdCBjb250aW51ZXMg
dG8gYmUgbGVmdCBvcGVuIHdpdGggdGhlIGFkanVzdG1lbnQgbWFkZS4KPiA+ID4+Cj4gPiA+IAo+
ID4gPiBXZWxsLCBMaW51eCdzIHJlcHJlc2VudGF0aW9uIGlzIG5vdCB3aGF0IGlzIG5vcm1hbGx5
IGRvbmUgaW4gbWF0aAo+ID4gPiBlaXRoZXIuCj4gPiA+IAo+ID4gPiBJdCBpcyBsaWtlCj4gPiA+
IAo+ID4gPiAgIFhlbjogW21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDAwMDllZmZm
XSB1c2FibGUKPiA+ID4gCj4gPiA+IE5vdGUgaXQgaXMgdXNpbmcgJy0nLCBub3QgJywnLiBBbmQg
dGhlcmUgaXMgIm1lbSIgYXQgdGhlIGJlZ2lubmluZy4KPiA+ID4gCj4gPiA+IEkgaGF2ZSBhbHdh
eXMgaW50ZXJwcmV0ZWQgdGhlIFtdIHBhaXIgYXMgc29tZXRoaW5nIHRvIGVuY2xvc2UgdGhlIHJh
bmdlLAo+ID4gPiBub3Qgb2YgbWF0aGVtYXRpY2FsbHkgbWVhbmluZy4KPiA+ID4gCj4gPiA+IElm
IHlvdSB3YW50LCBJIGNhbiBjaGFuZ2UgWGVuJ3MgZm9ybWF0IHN0cmluZyB0byAiWyUwMTZMeCwg
JTAxNkx4XSIuCj4gPiAKPiA+IEkgdGhpbmsgdGhpcyB3b3VsZCBtYWtlIHRoaW5ncyBsZXNzIGFt
YmlndW91cywgeWVzLiBCdXQgbXkgcHJpbWFyeQo+ID4gcmVxdWVzdCBoZXJlIGlzIHRvIGhhdmUg
bmVpdGhlciAiZml4IiBub3IgImVycm9yIiBub3IgYW55dGhpbmcKPiA+IGFsaWtlIGluIHRoZSB0
aXRsZSBvciBkZXNjcmlwdGlvbi4KPiAKPiBPSy4gSSBjYW4gY2VydGFpbmx5IGNoYW5nZSB0aGUg
c3ViamVjdCBsaW5lIHRvCj4gCj4gICB4ODY6IHN1YnRyYWN0IDEgd2hlbiBwcmludGluZyBlODIw
IHJhbmdlcwoKSWYgSSBoZWFyIG5vIGZ1cnRoZXIgb2JqZWN0aW9ucyBJIHdpbGwgY29tbWl0IHRo
aXMgcGF0Y2ggd2l0aCB0aGUgYWJvdmUKc3ViamVjdCBsaW5lIHRvZGF5LgoKV2VpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
