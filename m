Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9AE5A03
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 13:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOKP8-0007YI-Jh; Sat, 26 Oct 2019 11:38:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+e1I=YT=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iOKP7-0007YD-36
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 11:38:45 +0000
X-Inumbo-ID: 26e264f6-f7e5-11e9-94d3-12813bfff9fa
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e264f6-f7e5-11e9-94d3-12813bfff9fa;
 Sat, 26 Oct 2019 11:38:40 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 199CD2001B5;
 Sat, 26 Oct 2019 22:38:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1572089917; bh=9fGJ7Q7Ddmky5uRKHoFjST44ST/wRRpku+2BDTGq5Ek=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=rXujEA+K4kGK/86gjr3nrtE8KloVGwHSzHlK7WzBa/SarTgdvTfG00Yw/pkrpYMyb
 aaJjlT0QmiXa4lpEcygxY2/vNP47togO4f5KhQSyj1SIb8KJu1w23/LeCeFEV0GW4K
 IDhT5k2ih+WjNSPbFyJhHbVwawnNYLxI1ynSIR/U=
Date: Sat, 26 Oct 2019 22:38:36 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Message-Id: <1572089916.2390.0@crc.id.au>
In-Reply-To: <cover.1572038720.git.m.a.young@durham.ac.uk>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH 0/3] read grubenv and set default from it
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBmb3IgdGhlIHJlY29yZCwgdGhlIGdydWIgcGFja2FnZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
aW4gRmVkb3JhIDMxIAp0byBhdXRvbWF0aWNhbGx5IGRpc2FibGUgQkxTIHdoZW4gaW5zdGFsbGlu
ZyAvIHJlbW92aW5nIGEga2VybmVsIG9uIFhlbiAKRG9tMCAvIERvbVUgaW5zdGFsbGF0aW9ucy4K
CkFzIHN1Y2gsIHdlIHNob3VsZCBuZXZlciBjb21lIGFjcm9zcyBhIEZlZG9yYSAzMSBpbnN0YWxs
IHdpdGggQkxTIAplbmFibGVkIGZyb20gdGhpcyBwb2ludCBmb3J3YXJkcy4KClRoZXJlIGlzIGN1
cnJlbnRseSBvbmdvaW5nIHdvcmsgdG8gZGlzYWJsZSBCTFMgZHVyaW5nIHRoZSBpbnN0YWxsYXRp
b24gCnZpYSBhbmFjb25kYSAtIGJ1dCB0aGlzIGhhc24ndCBoaXQgeWV0IC0gYW5kIEkgYmVsaWV2
ZSBpdCdzIGFscmVhZHkgYSAKZnJlZXplIGV4Y2VwdGlvbi4KCklmIC8gd2hlbiBweWdydWIgaXMg
YWJsZSB0byBwcm9wZXJseSByZWFkIGFuZCBib290IGZyb20gQkxTIGJhc2VkIApjb25maWd1cmF0
aW9ucyAoSSdtIG5vdCBzdXJlIGlmIHRoaXMgcGF0Y2hzZXQgbWFrZXMgcHlncnViIEJMUyAKY29t
cGF0aWJsZSwgb3IganVzdCBmaXhlcyB0aGUgZXhpc3RpbmcgaXNzdWVzKSAtIGJ1dCB3ZSBjYW4g
bG9vayBhdCAKcmV2aXNpdGluZyByZW1vdmluZyB0aGVzZSB3b3JrYXJvdW5kcyBmcm9tIGFuYWNv
bmRhIC8gZ3J1YjIgcGFja2FnZXMgaW4gCkYzMCAvIEYzMSAvIFJhd2hpZGUuCgpTdGV2ZW4gSGFp
Z2gKCvCfk6cgbmV0d2l6QGNyYy5pZC5hdSAgICAg8J+SuyBodHRwczovL3d3dy5jcmMuaWQuYXUK
8J+TniArNjEzIDkwMDEgNjA5MCAgICAgICDwn5OxICs2MTQgMTI5MyA1ODk3CgoKT24gRnJpLCBP
Y3QgMjUsIDIwMTkgYXQgMjI6NTIsICJZT1VORywgTUlDSEFFTCBBLiIgCjxtLmEueW91bmdAZHVy
aGFtLmFjLnVrPiB3cm90ZToKPiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGlzIHRvIGltcHJvdmUg
dGhlIHBhcnNpbmcgYnkgcHlncnViIG9mIGdydWIKPiBjb25maWd1cmF0aW9uIG9uIEZlZG9yYS4g
VGhlIGN1cnJlbnQgcmVzdWx0IG9mIHBhcnNpbmcgaXMgZ2VuZXJhbGx5Cj4gdGhhdCB0aGUgc2Vj
b25kIGtlcm5lbCBsaXN0ZWQgaXMgc2V0IGFzIHRoZSBkZWZhdWx0IGR1ZSB0byBhCj4gc2V0IGRl
ZmF1bHQ9MSBsaW5lIGluIGdydWIuY2ZnIHdoaWNoIGlzIG9ubHkgaW50ZW5kZWQgdG8gYmUKPiBy
ZWFjaGVkIGFmdGVyIHJlcGVhdGVkIGJvb3QgZmFpbHVyZXMuCj4gCj4gVGhlIHBhdGNoZXMgcmVh
ZCB0aGUgZ3J1YmVudiBmaWxlICh3aGljaCBjb25zaXN0cyBvZiBrZXk9dmFsdWUgbGluZXMKPiBw
YWRkZWQgdG8gMTAyNCBjaGFyYWN0ZXJzIGJ5ICMgY2hhcmFjdGVycykgdG8gZ2V0IHRoZSB2YWx1
ZXMgb2YKPiBuZXh0X2VudHJ5IGFuZCBzYXZlZF9lbnRyeSwgd2hpY2ggY2FuIGJlIGEga2VybmVs
IHN0cmluZyBvciBhbgo+IG9yZGVyIG51bWJlci4gVW5mb3J0dW5hdGVseSwgZm9yIEZlZG9yYSAz
MSBhdCBsZWFzdCwgdGhpcyBpcwo+IG9mdGVuIGEgQkxTLXN0eWxlIHN0cmluZyBzbyBpdCBpc24n
dCBuZWNlc3NhcmlseSB1c2VmdWwuIFRoZSBwYXRjaGVzCj4gdXNlIHRoZSB2YWx1ZSBvZiBuZXh0
X2VudHJ5IG9yIG9mIHNhdmVkX2VudHJ5IHRvIHNldCB0aGUgZGVmYXVsdAo+IGtlcm5lbCBvciBz
ZXRzIGl0IHRvIHRoZSBmaXJzdCBrZXJuZWwgbGlzdGVkIGlmIHRob3NlIHZhbHVlcyBhcmUgc2V0
Cj4gYnV0IG5vdCB1c2VkLgo+IAo+IAo+IE1pY2hhZWwgWW91bmcgKDMpOgo+ICAgc2V0IGRlZmF1
bHQga2VybmVsIGZyb20gZ3J1YmVudiBuZXh0X2VudHJ5IG9yIHNhdmVkX2VudHJ5Cj4gICByZWFk
IGEgZ3J1YmVudiBmaWxlIGlmIGl0IGlzIG5leHQgdG8gdGhlIGdydWIuY2ZnIGZpbGUKPiAgIEV4
YW1wbGUgRmVkb3JhIDMxIGdydWIuY2ZnIGFuZCBncnViZW52IGZpbGVzCj4gCj4gIHRvb2xzL3B5
Z3J1Yi9leGFtcGxlcy9mZWRvcmEtMzEuZ3J1Yi5jZmcgfCAyMDAgCj4gKysrKysrKysrKysrKysr
KysrKysrKysKPiAgdG9vbHMvcHlncnViL2V4YW1wbGVzL2ZlZG9yYS0zMS5ncnViZW52ICB8ICAg
NSArCj4gIHRvb2xzL3B5Z3J1Yi9zcmMvR3J1YkNvbmYucHkgICAgICAgICAgICAgfCAgMzEgKysr
LQo+ICB0b29scy9weWdydWIvc3JjL3B5Z3J1YiAgICAgICAgICAgICAgICAgIHwgIDIxICsrLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDI1MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcHlncnViL2V4YW1wbGVzL2ZlZG9yYS0zMS5ncnViLmNm
Zwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcHlncnViL2V4YW1wbGVzL2ZlZG9yYS0zMS5n
cnViZW52Cj4gCj4gLS0KPiAyLjIxLjAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
