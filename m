Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2127244B5B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 20:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbUoq-0004Hd-FJ; Thu, 13 Jun 2019 18:51:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbUoo-0004HY-5f
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 18:51:26 +0000
X-Inumbo-ID: 3debd6e8-8e0c-11e9-9a40-fbb5e55e78c4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3debd6e8-8e0c-11e9-9a40-fbb5e55e78c4;
 Thu, 13 Jun 2019 18:51:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 938C82147A;
 Thu, 13 Jun 2019 18:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560451883;
 bh=M6EjTBI2wAKaJKRTVeSn7OTp9GBpf8PSkL7ROUTCd4g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tKjCcGkTr2BjsJLrALSR3HB0kMaS99kN8RVzJFg+rCk34jm+RotuwG7/Qgv85asDN
 16iQd2BCuOzdwBWZvmjWPjtb+AaSZbdytZ974XTBkHFdg6t1YffYMZj5cKDC9hf0uN
 WmqRB5PvSYVkOEBQUkXvew2t5VDairOnneT/gTsY=
Date: Thu, 13 Jun 2019 11:51:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <a7874b6c-08b4-28a0-cb5f-ea7f7b23e2e7@arm.com>
Message-ID: <alpine.DEB.2.21.1906131140290.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-12-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121528260.13737@sstabellini-ThinkPad-T480s>
 <a7874b6c-08b4-28a0-cb5f-ea7f7b23e2e7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 11/12] xen/arm: mm: Don't
 open-code Xen PT update in {set, clear}_fixmap()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8xMi8xOSAxMTozMyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiB7c2V0LCBjbGVhcn1f
Zml4bWFwKCkgYXJlIGN1cnJlbnRseSBvcGVuLWNvZGluZyB1cGRhdGUgdG8gdGhlIFhlbgo+ID4g
PiBwYWdlLXRhYmxlcy4gVGhpcyBjYW4gYmUgYXZvaWRlZCBieSB1c2luZyB0aGUgZ2VuZXJpYyBo
ZWxwZXJzCj4gPiA+IG1hcF9wYWdlc190b194ZW4oKSBhbmQgZGVzdHJveV94ZW5fbWFwcGluZ3Mo
KS4KPiA+ID4gCj4gPiA+IEJvdGggZnVuY3Rpb24gYXJlIG5vdCBtZWFudCB0byBmYWlsIGZvciBm
aXhtYXAsIGhlbmNlIHRoZSBCVUdfT04oKQo+ID4gPiBjaGVja2luZyB0aGUgcmV0dXJuLgo+ID4g
Cj4gPiBCVUdfT04gY3Jhc2hlcyB0aGUgaHlwZXJ2aXNvciBldmVuIGluIG5vbi1ERUJVRyBidWls
ZHMuIFdvdWxkIGFuIEFTU0VSVAo+ID4gYmUgYSBiZXR0ZXIgY2hvaWNlPwo+IFRoZSBBU1NFUlQo
KSB3b3VsZCBkaXNhcHBlYXIgaW4gbm9uLWRlYnVnIHBvdGVudGlhbGx5IGxlYWRpbmcgdG8gdW5r
bm93bgo+IGNvbnNlcXVlbmNlLgo+IAo+IElmIHdlIGltYWdpbmUgdGhhdCBtYXBfcGFnZXNfdG9f
eGVuKCkgZmFpbHMsIHRoZW4gaXQgbGlrZWx5IG1lYW5zIHRoYXQgbWFwcGluZwo+IGhhcyBub3Qg
YmVlbiBkb25lL3JlbW92ZWQuCj4gCj4gQXMgc2V0X2ZpeG1hcCgpIGRvZXMgbm90IHJldHVybiBh
biBlcnJvciwgdGhpcyBtZWFucyB0aGF0IHRoZSB1c2VyIG1heSB0cnkgdG8KPiBhY2Nlc3MgYW4g
aW52YWxpZCBtYXBwaW5nIGFuZCB0aGVyZWZvcmUgY3Jhc2ggdGhlIGh5cGVydmlzb3IuCj4gCj4g
QXMgY2xlYXJfZml4bWFwKCkgZG9lcyBub3QgcmV0dXJuIGFuIGVycm9yLCB0aGlzIG1lYW5zIHRo
YXQgc3Vic2VxdWVudAo+IHNldF9maXhtYXAoKSBtYXkgZmFpbCBiZWNhdXNlIG1hcF9wYWdlc190
b194ZW4oKSBkb2VzIG5vdCBhbGxvdyB0byByZXBsYWNlCj4gdmFsaWQgbWFwcGluZy4KPgo+IElk
ZWFsbHkgd2Ugd291bGQgd2FudCB0byBwcm9wYWdhdGUgdGhlIGVycm9yLCBob3dldmVyIGFsbCB0
aGUgY2FsbCB0byB0aGUKPiBmdW5jdGlvbnMgaGFwcGVuIGR1cmluZyBib290LiBTbyBtb3N0IGxp
a2VseSB0aGUgdXNlciB3aWxsIHBhbmljL0JVR19PTiBhcyB5b3UKPiB0aGlzIGhpbnQgc29tZXRo
aW5nIGhhcyBnb25lIHJlYWxseSB3cm9uZyBhbmQgd2UgZG9uJ3Qgd2FudCB0byBjb250aW51ZQo+
IGZ1cnRoZXIuCgpJIHRoaW5rIHRoZSBiYXNpYyBwcmluY2lwbGUgaXMgdGhhdCB3aXRoIEJVR19P
TiBpcyAiZWFzeSIgZm9yIGEgZ3Vlc3QgdG8KYmUgYWJsZSB0byB0cmlnZ2VyIGl0LCBwb3RlbnRp
YWxseSBjYXVzaW5nIGEgRE9TLiBXaXRob3V0IHRoZSBCVUdfT04sCnRoZSBndWVzdCBpcyB1bmxp
a2VseSB0byBiZSBhYmxlIHRvIHRyaWdnZXIgYSBjcmFzaC4gSG93ZXZlciwgaWYgYWxsIHRoZQpj
YWxscyBoYXBwZW4gZHVyaW5nIGJvb3QgaW4gcmVnYXJkcyB0byBvcGVyYXRpb25zIHRoYXQgaGF2
ZSBub3RoaW5nIHRvCmRvIHdpdGggZ3Vlc3RzIGJlaGF2aW9yLCB0aGVuIGl0IGlzIGZpbmUuCgpJ
IGNoZWNrZWQgYWxsIHRoZSBjYWxsIHNpdGVzIGFuZCBJIGFncmVlIHRoYXQgaW4gdGhpcyBjYXNl
IHRoZXkgYXJlIGFsbApkb25lIGR1cmluZyBib290IG9ubHkuIFNvIGluIHRoaXMgY2FzZSBpdCBp
cyBPSyB0byBoYXZlIHRoZQpwYW5pYy9CVUdfT04uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
