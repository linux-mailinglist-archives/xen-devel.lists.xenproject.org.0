Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF4152A2A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:47:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izJ7p-0005QP-9U; Wed, 05 Feb 2020 11:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izJ7n-0005QK-VJ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:45:43 +0000
X-Inumbo-ID: 0a4ffa1a-480d-11ea-90da-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a4ffa1a-480d-11ea-90da-12813bfff9fa;
 Wed, 05 Feb 2020 11:45:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJ7m-0003tP-D8; Wed, 05 Feb 2020 11:45:42 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJ7m-0004vG-4i; Wed, 05 Feb 2020 11:45:42 +0000
Date: Wed, 5 Feb 2020 11:45:39 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200205114539.c4kduolb3va3vrdf@debian>
References: <20200204165535.17214-1-liuwe@microsoft.com>
 <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
 <20200204171959.pejeoqfg4n37gno6@debian>
 <c31b8129-2c6a-17c5-b30b-c3a2ff577768@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c31b8129-2c6a-17c5-b30b-c3a2ff577768@suse.com>
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6MTI6NTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMDIuMjAyMCAxODoxOSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgRmVi
IDA0LCAyMDIwIGF0IDA2OjA3OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDA0LjAyLjIwMjAgMTc6NTUsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgeGVuL2FyY2gveDg2
L2U4MjAuYyB8IDIgKy0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBi
L3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+Pj4gaW5kZXggYjlmNTg5Y2FjMy4uZDY3Mzg3ZjEzNyAx
MDA2NDQKPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2U4MjAuYwo+ID4+PiArKysgYi94ZW4vYXJj
aC94ODYvZTgyMC5jCj4gPj4+IEBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBw
cmludF9lODIwX21lbW9yeV9tYXAoc3RydWN0IGU4MjBlbnRyeSAqbWFwLCB1bnNpZ25lZCBpbnQg
ZW50Cj4gPj4+ICAgICAgZm9yIChpID0gMDsgaSA8IGVudHJpZXM7IGkrKykgewo+ID4+PiAgICAg
ICAgICBwcmludGsoIiAlMDE2THggLSAlMDE2THggIiwKPiA+Pj4gICAgICAgICAgICAgICAgICh1
bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyKSwKPiA+Pj4gLSAgICAgICAgICAgICAgICh1
bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ldLnNpemUpKTsKPiA+Pj4gKyAg
ICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ldLnNp
emUpIC0gMSk7Cj4gPj4KPiA+PiBXaHkgd2FzIHRoaXMgYW4gZXJyb3I/IElmIHdlIHVzZWQgWyxd
IGxpa2UgTGludXggZG9lcyAtIHN1cmUuCj4gPj4gQnV0IHdlIGRvbid0LiBUaGUgcHJlc2VudGF0
aW9uLCB3aXRob3V0IGxvb2tpbmcgYXQgdGhlIHNvdXJjZSwKPiA+PiBzaW1wbHkgbGVhdmVzIG9w
ZW4gd2hldGhlciB0aGlzIHdhcyBtZWFudCB0byBiZSBbLF0gb3IgWywpLgo+ID4+IEFuZCBpdCBj
b250aW51ZXMgdG8gYmUgbGVmdCBvcGVuIHdpdGggdGhlIGFkanVzdG1lbnQgbWFkZS4KPiA+Pgo+
ID4gCj4gPiBXZWxsLCBMaW51eCdzIHJlcHJlc2VudGF0aW9uIGlzIG5vdCB3aGF0IGlzIG5vcm1h
bGx5IGRvbmUgaW4gbWF0aAo+ID4gZWl0aGVyLgo+ID4gCj4gPiBJdCBpcyBsaWtlCj4gPiAKPiA+
ICAgWGVuOiBbbWVtIDB4MDAwMDAwMDAwMDAwMDAwMC0weDAwMDAwMDAwMDAwOWVmZmZdIHVzYWJs
ZQo+ID4gCj4gPiBOb3RlIGl0IGlzIHVzaW5nICctJywgbm90ICcsJy4gQW5kIHRoZXJlIGlzICJt
ZW0iIGF0IHRoZSBiZWdpbm5pbmcuCj4gPiAKPiA+IEkgaGF2ZSBhbHdheXMgaW50ZXJwcmV0ZWQg
dGhlIFtdIHBhaXIgYXMgc29tZXRoaW5nIHRvIGVuY2xvc2UgdGhlIHJhbmdlLAo+ID4gbm90IG9m
IG1hdGhlbWF0aWNhbGx5IG1lYW5pbmcuCj4gPiAKPiA+IElmIHlvdSB3YW50LCBJIGNhbiBjaGFu
Z2UgWGVuJ3MgZm9ybWF0IHN0cmluZyB0byAiWyUwMTZMeCwgJTAxNkx4XSIuCj4gCj4gSSB0aGlu
ayB0aGlzIHdvdWxkIG1ha2UgdGhpbmdzIGxlc3MgYW1iaWd1b3VzLCB5ZXMuIEJ1dCBteSBwcmlt
YXJ5Cj4gcmVxdWVzdCBoZXJlIGlzIHRvIGhhdmUgbmVpdGhlciAiZml4IiBub3IgImVycm9yIiBu
b3IgYW55dGhpbmcKPiBhbGlrZSBpbiB0aGUgdGl0bGUgb3IgZGVzY3JpcHRpb24uCgpPSy4gSSBj
YW4gY2VydGFpbmx5IGNoYW5nZSB0aGUgc3ViamVjdCBsaW5lIHRvCgogIHg4Njogc3VidHJhY3Qg
MSB3aGVuIHByaW50aW5nIGU4MjAgcmFuZ2VzCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
