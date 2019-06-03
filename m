Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB1533972
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 22:01:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXt5j-00089r-NM; Mon, 03 Jun 2019 19:57:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXt5i-00089m-8H
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 19:57:58 +0000
X-Inumbo-ID: e185374e-8639-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e185374e-8639-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 19:57:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559591876; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=4VRPwTwsSXkJGloqbBQm72fYfe4+Z6knAVPn8ERDoT4=;
 b=sdDX/0mi3XDa4ncKJpSlwGPRgNDJj5gUx0nz8jiC4V6Cf5+wj5n9HEK1HMmW+53KL4vyj9wh
 JvcHogNlFbHyIW4vIF+/j3xJ2CndlmOJsDywCbOzg0oAhbD6KXShffPTcrMJCqLYyPAzCSqo
 hPiixORpxn0Np7OQOMh7DEvcolc=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5cf57bc3.7f4d899343b0-smtp-out-n02;
 Mon, 03 Jun 2019 19:57:55 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id m3so13416553wrv.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 12:57:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXTKwOMIpsBapRh4QkzbvWjrGbTLv9xoq7qwTScwZVdPbK1ItMb
 eQtn2vWZO9l7Kgk0n92z9bQSvic7UGd15bBWkv8=
X-Google-Smtp-Source: APXvYqy8QeEbgy3b4rjb9A3YLiuPZen/alUsLCuaBDLU6jUoTjMi/ym40rD3t+v0yyPiSyQmMnrRYVhhLGamHT59PKU=
X-Received: by 2002:adf:ed44:: with SMTP id u4mr4004624wro.242.1559591874419; 
 Mon, 03 Jun 2019 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
 <5CF4D98F02000078002346D9@prv1-mh.provo.novell.com>
In-Reply-To: <5CF4D98F02000078002346D9@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 3 Jun 2019 13:57:18 -0600
X-Gmail-Original-Message-ID: <CABfawhk2BEuUq+c_n1ssw0viEzdwf+tC=JTYZ6Tt4i7kyrjPVw@mail.gmail.com>
Message-ID: <CABfawhk2BEuUq+c_n1ssw0viEzdwf+tC=JTYZ6Tt4i7kyrjPVw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAyOjI1IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDIuMDYuMTkgYXQgMDI6NDAsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDMxLCAyMDE5IGF0IDM6MzUgQU0gSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEEgY291cGxlIG9mIGFk
anVzdG1lbnRzIGFyZSBuZWVkZWQgdG8gY29kZSBjaGVja2luZyBmb3IgZG9tX2NvdywgYnV0Cj4g
Pj4gc2luY2UgdGhlcmUgYXJlIHByZXR0eSBmZXcgaXQgaXMgcHJvYmFibHkgYmV0dGVyIHRvIGFk
anVzdCB0aG9zZSB0aGFuCj4gPj4gdG8gc2V0IHVwIGFuZCBrZWVwIGFyb3VuZCBhIG5ldmVyIHVz
ZWQgZG9tYWluLgo+ID4+Cj4gPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIHRpZ2h0ZW4gYSBC
VUdfT04oKSBpbiBlbXVsLXByaXYtb3AuYzpyZWFkX2NyKCkuCj4gPj4gKEFyZ3VhYmx5IHRoaXMg
cGVyaGFwcyBzaG91bGRuJ3QgYmUgYSBCVUdfT04oKSBpbiB0aGUgZmlyc3QgcGxhY2UuKQo+ID4+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+
IC0tLQo+ID4+IFdoaWxlIGZvciBub3cgdGhpcyBhdm9pZHMgY3JlYXRpbmcgdGhlIGRvbWFpbiBv
biBBcm0gb25seSwgVGFtYXMnZXMKPiA+PiBwYXRjaCBzd2l0Y2hpbmcgdG8gQ09ORklHX01FTV9T
SEFSSU5HIHdpbGwgbWFrZSB4ODYgbGV2ZXJhZ2UgdGhpcyB0b28uCj4gPgo+ID4gcGVyaGFwcyBp
dCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGlzIHBhdGNoIGJlIGFwcGxpZWQgYWZ0ZXIgbXkK
PiA+IHBhdGNoPyBZb3UgYWxyZWFkeSBhY2tlZCB0aGF0IG9uZSBhbmQgaXQgY291bGQgYmUgYXBw
bGllZCBzZXBhcmF0ZWx5Cj4gPiBmcm9tIHRoZSBzZXJpZXMgdGhhdCBJJ3ZlIHNlbnQgaXQgYXMg
cGFydCBvZi4KPgo+IE9oLCBJIGRpZG4ndCByZWFsaXplIGl0IGlzIGVudGlyZWx5IGluZGVwZW5k
ZW50IG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMuCj4gSXQgd291bGQgaGVscCB0byBwb2ludCBzdWNo
IG91dCBpbiB0aGUgY292ZXIgbGV0dGVyLCByZXF1aXJpbmcgdGhlcmUKPiB0byBiZSBvbmUgaW4g
dGhlIGZpcnN0IHBsYWNlLgoKUmlnaHQsIEkgc2hvdWxkIGhhdmUgYWRkZWQgYSBjb3ZlciBsZXR0
ZXIuIFRoYXQgInNlcmllcyIgaXMgbW9yZSBsaWtlCmFuIGFzc29ydGVkIGNvbGxlY3Rpb24gb2Yg
Zml4ZXMgcmF0aGVyIHRoZW4gYSBzZXJpZXMgaW4gYSBzdHJpY3QKc2Vuc2UuCgpUYW1hcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
