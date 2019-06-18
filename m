Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1F49E55
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 12:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBR5-0004bm-M5; Tue, 18 Jun 2019 10:33:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdBR4-0004bh-Qn
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 10:33:54 +0000
X-Inumbo-ID: 912e7808-91b4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 912e7808-91b4-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 10:33:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 04:33:52 -0600
Message-Id: <5D08BE0B0200007800239323@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 04:33:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560800999-11592-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560800999-11592-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/clear_page: Update clear_page_sse2()
 after dropping 32bit Xen
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
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDIxOjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBjb2RlIHdhcyBuZXZlciB1cGRhdGVkIHdoZW4gdGhlIDMyYml0IGJ1aWxkIG9m
IFhlbiB3YXMgZHJvcHBlZC4KPiAKPiAgKiBFeHBhbmQgdGhlIG5vdy1yZWR1bmRhbnQgcHRyX3Jl
ZyBtYWNyby4KPiAgKiBUaGUgbnVtYmVyIG9mIGl0ZXJhdGlvbnMgaW4gdGhlIGxvb3AgY2FuIGJl
IGhhbGZlZCBieSB1c2luZyA2NGJpdCB3cml0ZXMsCj4gICAgd2l0aG91dCBjb25zdW1pbmcgYW55
IGV4dHJhIGV4ZWN1dGlvbiByZXNvdXJjZSBpbiB0aGUgcGlwZWxpbmUuICBBZGp1c3QgYWxsCj4g
ICAgbnVtYmVycy9vZmZzZXRzIGFwcHJvcHJpYXRlbHkuCj4gICogUmVwbGFjZSBkZWMgd2l0aCBz
dWIgdG8gYXZvaWQgYSBlZmxhZ3Mgc3RhbGwsIGFuZCBwb3NpdGlvbiBpdCB0byBiZQo+ICAgIG1h
Y3JvLWZ1c2VkIHdpdGggdGhlIHJlbGF0ZWQgam1wLgo+ICAqIFdpdGggbm8gbmVlZCB0byBwcmVz
ZXJ2ZSBlZmxhZ3MgYWNyb3NzIHRoZSBib2R5IG9mIHRoZSBsb29wLCByZXBsYWNlIGxlYQo+ICAg
IHdpdGggYWRkIHdoaWNoIGhhcyAxLzMncmQgdGhlIGxhdGVuY3kgb24gYmFzaWNhbGx5IGFsbCA2
NGJpdCBoYXJkd2FyZS4KPiAKPiBBIHF1aWNrIHVzZXJzcGFjZSBwZXJmIHRlc3Qgb24gbXkgSGFz
d2VsbCBkZXYgYm94IGluZGljYXRlcyB0aGF0IHRoZSBvbGQKPiB2ZXJzaW9uIHRha2VzIH4xMzg1
IGN5Y2xlcyBvbiBhdmVyYWdlIChpZ25vcmluZyBvdXRsaWVycyksIGFuZCB0aGUgbmV3IHZlcnNp
b24KPiB0YWtlcyB+MTA2MCBjeWxlcywgb3IgYWJvdXQgNzclIG9mIHRoZSB0aW1lLgo+IAo+IFJl
cG9ydGVkLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBc3N1
bWluZyB5b3Ugd2FudCB0aGlzIHRvIGdvIGluIGRlc3BpdGUgeW91ciBSRVAgU1RPU1EgcmVtYXJr
CmxhdGVyIG9uLApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3
aXRoIG9uZSByZW1hcms6Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jbGVhcl9wYWdlLlMKPiArKysg
Yi94ZW4vYXJjaC94ODYvY2xlYXJfcGFnZS5TCj4gQEAgLTIsMTggKzIsMTYgQEAKPiAgCj4gICNp
bmNsdWRlIDxhc20vcGFnZS5oPgo+ICAKPiAtI2RlZmluZSBwdHJfcmVnICVyZGkKPiAtCj4gIEVO
VFJZKGNsZWFyX3BhZ2Vfc3NlMikKPiAtICAgICAgICBtb3YgICAgICRQQUdFX1NJWkUvMTYsICVl
Y3gKPiArICAgICAgICBtb3YgICAgICRQQUdFX1NJWkUvMzIsICVlY3gKPiAgICAgICAgICB4b3Ig
ICAgICVlYXgsJWVheAo+ICAKPiAtMDogICAgICBkZWMgICAgICVlY3gKPiAtICAgICAgICBtb3Zu
dGkgICVlYXgsIChwdHJfcmVnKQo+IC0gICAgICAgIG1vdm50aSAgJWVheCwgNChwdHJfcmVnKQo+
IC0gICAgICAgIG1vdm50aSAgJWVheCwgOChwdHJfcmVnKQo+IC0gICAgICAgIG1vdm50aSAgJWVh
eCwgMTIocHRyX3JlZykKPiAtICAgICAgICBsZWEgICAgIDE2KHB0cl9yZWcpLCBwdHJfcmVnCj4g
KzA6ICAgICAgbW92bnRpICAlcmF4LCAgMCglcmRpKQoKQ291bGQgSSB0YWxrIHlvdSBpbnRvIGxl
YXZpbmcgb3V0IHRoaXMgMD8gUmF0aGVyIG9sZCBnYXMgYWN0dWFsbHkgZW1pdHMKYW4gOC1iaXQg
ZGlzcGxhY2VtZW50IHdoZW4gaXQncyBzcGVsbGVkIGxpa2UgdGhpcy4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
