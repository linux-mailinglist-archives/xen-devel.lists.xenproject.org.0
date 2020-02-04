Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684C151F57
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1rq-0004FE-9v; Tue, 04 Feb 2020 17:20:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2C6S=3Y=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iz1ro-00045I-QI
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:20:04 +0000
X-Inumbo-ID: 94dde39a-4772-11ea-8fd1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94dde39a-4772-11ea-8fd1-12813bfff9fa;
 Tue, 04 Feb 2020 17:20:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iz1rm-00052k-KT; Tue, 04 Feb 2020 17:20:02 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iz1rm-0003Ks-Ao; Tue, 04 Feb 2020 17:20:02 +0000
Date: Tue, 4 Feb 2020 17:19:59 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200204171959.pejeoqfg4n37gno6@debian>
References: <20200204165535.17214-1-liuwe@microsoft.com>
 <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
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

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDY6MDc6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMDIuMjAyMCAxNzo1NSwgV2VpIExpdSB3cm90ZToKPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94
ODYvZTgyMC5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hl
bi9hcmNoL3g4Ni9lODIwLmMKPiA+IGluZGV4IGI5ZjU4OWNhYzMuLmQ2NzM4N2YxMzcgMTAwNjQ0
Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZTgy
MC5jCj4gPiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfZTgyMF9t
ZW1vcnlfbWFwKHN0cnVjdCBlODIwZW50cnkgKm1hcCwgdW5zaWduZWQgaW50IGVudAo+ID4gICAg
ICBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKSB7Cj4gPiAgICAgICAgICBwcmludGsoIiAl
MDE2THggLSAlMDE2THggIiwKPiA+ICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25n
KShtYXBbaV0uYWRkciksCj4gPiAtICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZyko
bWFwW2ldLmFkZHIgKyBtYXBbaV0uc2l6ZSkpOwo+ID4gKyAgICAgICAgICAgICAgICh1bnNpZ25l
ZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyICsgbWFwW2ldLnNpemUpIC0gMSk7Cj4gCj4gV2h5IHdh
cyB0aGlzIGFuIGVycm9yPyBJZiB3ZSB1c2VkIFssXSBsaWtlIExpbnV4IGRvZXMgLSBzdXJlLgo+
IEJ1dCB3ZSBkb24ndC4gVGhlIHByZXNlbnRhdGlvbiwgd2l0aG91dCBsb29raW5nIGF0IHRoZSBz
b3VyY2UsCj4gc2ltcGx5IGxlYXZlcyBvcGVuIHdoZXRoZXIgdGhpcyB3YXMgbWVhbnQgdG8gYmUg
WyxdIG9yIFssKS4KPiBBbmQgaXQgY29udGludWVzIHRvIGJlIGxlZnQgb3BlbiB3aXRoIHRoZSBh
ZGp1c3RtZW50IG1hZGUuCj4gCgpXZWxsLCBMaW51eCdzIHJlcHJlc2VudGF0aW9uIGlzIG5vdCB3
aGF0IGlzIG5vcm1hbGx5IGRvbmUgaW4gbWF0aAplaXRoZXIuCgpJdCBpcyBsaWtlCgogIFhlbjog
W21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDAwMDllZmZmXSB1c2FibGUKCk5vdGUg
aXQgaXMgdXNpbmcgJy0nLCBub3QgJywnLiBBbmQgdGhlcmUgaXMgIm1lbSIgYXQgdGhlIGJlZ2lu
bmluZy4KCkkgaGF2ZSBhbHdheXMgaW50ZXJwcmV0ZWQgdGhlIFtdIHBhaXIgYXMgc29tZXRoaW5n
IHRvIGVuY2xvc2UgdGhlIHJhbmdlLApub3Qgb2YgbWF0aGVtYXRpY2FsbHkgbWVhbmluZy4KCklm
IHlvdSB3YW50LCBJIGNhbiBjaGFuZ2UgWGVuJ3MgZm9ybWF0IHN0cmluZyB0byAiWyUwMTZMeCwg
JTAxNkx4XSIuCgpXZWkuCgoKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
