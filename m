Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334894AB98
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 22:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdKZi-00070Z-Jp; Tue, 18 Jun 2019 20:19:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdKZh-00070U-6S
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 20:19:25 +0000
X-Inumbo-ID: 5ca33c4a-9206-11e9-9a74-3bd5057b3538
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ca33c4a-9206-11e9-9a74-3bd5057b3538;
 Tue, 18 Jun 2019 20:19:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2F0520B1F;
 Tue, 18 Jun 2019 20:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560889158;
 bh=w8A3smXp+SBjaIm767wgftgEZQfjxx1q82eyHBcfFcM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ow9mYIgTMLXzQ8L//m+O5NN3+axrflDY+E7MFcR4sPQ2mnK4F00iaVM+lBizLN6e4
 xXHtQ43Z2HFBV3K5+Y3rK2Z3TZr5WQ6W4xMm+PVC/j7pAJI2uLgPZNUdS2+7IRgtF8
 C4Lsi9PV/dAKa3NiJgSyr69AfLCtu8wfdPVHrOGo=
Date: Tue, 18 Jun 2019 13:19:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <e1d8a184-284d-1af3-1732-25022ea6b348@arm.com>
Message-ID: <alpine.DEB.2.21.1906181317550.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
 <c2e2e752-ae93-f378-2f84-2f9833b13c32@arm.com>
 <alpine.DEB.2.21.1906171423230.2072@sstabellini-ThinkPad-T480s>
 <e1d8a184-284d-1af3-1732-25022ea6b348@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
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
 andrew.cooper3@citrix.com, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTcvMDYvMjAxOSAyMjoyNCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
V2VkLCAxIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+
ID4gT24gMzAvMDQvMjAxOSAyMjowMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+
IE5vdyB0aGF0IG1hcF9tbWlvX3JlZ2lvbnMgdGFrZXMgYSBwMm10IHBhcmFtZXRlciwgdGhlcmUg
aXMgbm8gbmVlZCB0bwo+ID4gPiA+IGtlZXAgIm1taW8iIGluIHRoZSBuYW1lLiBUaGUgcDJtdCBw
YXJhbWV0ZXIgZG9lcyBhIGJldHRlciBqb2IgYXQKPiA+ID4gPiBleHByZXNzaW5nIHdoYXQgdGhl
IG1hcHBpbmcgaXMgYWJvdXQuIExldCdzIHNhdmUgdGhlIGVudmlyb25tZW50IDUKPiA+ID4gPiBj
aGFyYWN0ZXJzIGF0IGEgdGltZS4KPiA+ID4gCj4gPiA+IEF0IGxlYXN0IG9uIEFybSwgd2hhdCdz
IHRoZSBkaWZmZXJlbmNlIHdpdGggZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkgYW5kCj4gPiA+IHRo
aXMKPiA+ID4gZnVuY3Rpb24gbm93PyBPbiB4ODYsIGhvdyBkb2VzIHRoZSB1c2VyIG5vdyB3aGlj
aCBmdW5jdGlvbiB0byB1c2U/Cj4gPiA+IAo+ID4gPiBXaGF0IGFjdHVhbGx5IHRlbGwgdGhlIHVz
ZXJzIGl0IHNob3VsZCBub3QgdXNlIHRoaXMgZnVuY3Rpb24gZm9yIFJBTT8KPiA+IAo+ID4gQWxz
byB0YWtpbmcgaW50byBhY2NvdW50IEphbidzIGNvbW1lbnRzLCBJJ2xsIGRyb3AgdGhpcyBwYXRj
aCBpbiB0aGUKPiA+IG5leHQgdmVyc2lvbiwga2VlcGluZyB0aGUgb3JpZ2luYWwgbmFtZSBtYXBf
bW1pb19yZWdpb25zLiBJZiB5b3UgaGF2ZSBhbgo+ID4gYWx0ZXJuYXRpdmUgc3VnZ2VzdGlvbiBs
ZXQgbWUga25vdyBhbmQgSSdsbCB0cnkgdG8gZm9sbG93IGl0Lgo+IAo+IEFzIGxvbmcgYXMgb25s
eSBwMm1fbW1pb18qIHR5cGVzIGNhbiBiZSB1c2VkIGhlcmUsIHRoZW4gSSBhbSBmaW5lIHdpdGgg
aXQuCgpPbmx5IHRoZSBwMm1fbW1pb18qIHR5cGVzIGFyZSB1c2VkLCBidXQgdGhlcmUgYXJlIG5v
IGNoZWNrcy4gSSdsbCBhZGQgYW4KQVNTRVJULgoKCj4gQ29tcGFyZSB0byB4ODYsIHRoZSBQMk0g
aW50ZXJmYWNlIG9uIEFybSBpcyBwcmV0dHkgbXVjaCBhIHdpbGQgd2VzdCBzbyBmYXIuIEkKPiBo
YXZlIGEgVE9ETyB0byByZXRoaW5rIGFuZCBhZGQgbW9yZSBjaGVjayBpbiB0aGVtIG9uIEFybS4K
ClllcywgdGhhbmsgeW91CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
