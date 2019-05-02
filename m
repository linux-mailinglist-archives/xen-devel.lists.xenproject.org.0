Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD1A1223A
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 20:57:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMGrY-0004xp-0q; Thu, 02 May 2019 18:55:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6X+8=TC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMGrW-0004xj-Jj
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 18:55:18 +0000
X-Inumbo-ID: cdfee76a-6d0b-11e9-ace4-4fcea9c08e05
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdfee76a-6d0b-11e9-ace4-4fcea9c08e05;
 Thu, 02 May 2019 18:55:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 620F420645;
 Thu,  2 May 2019 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556823307;
 bh=4DSsV7GO7JE+vH8R3ghm58viQxjP+7vJxtDbaRkPXwQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vdOjEuVyXATOmxgw7iluTinRTI8bD0f4n3rBRnTbycLx0vvB78QgeN9IOFb+spEfX
 VrdV3nHDX79R4IUZEhkvF+5Kz09PuXjue9/EwX9nK9PRX4VcmjVdnciVjVW4UEENZQ
 Gs8mzGwB8Db2XkBXJU+4HSw+WTbf4XNOV03xKpWE=
Date: Thu, 2 May 2019 11:55:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CCB06C9020000780022B577@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1905021150580.1347@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
 <5CCB06C9020000780022B577@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMzAuMDQuMTkg
YXQgMjM6MDIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE5vdyB0aGF0IG1h
cF9tbWlvX3JlZ2lvbnMgdGFrZXMgYSBwMm10IHBhcmFtZXRlciwgdGhlcmUgaXMgbm8gbmVlZCB0
bwo+ID4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFtZXRlciBkb2VzIGEg
YmV0dGVyIGpvYiBhdAo+ID4gZXhwcmVzc2luZyB3aGF0IHRoZSBtYXBwaW5nIGlzIGFib3V0LiBM
ZXQncyBzYXZlIHRoZSBlbnZpcm9ubWVudCA1Cj4gPiBjaGFyYWN0ZXJzIGF0IGEgdGltZS4KPiAK
PiBCdXQgYXMgcGVyIHRoZSBjb3ZlciBsZXR0ZXIgdGhlIHB1cnBvc2UgaXMgdG8gYWxsb3cgbWFw
cGluZwo+IGlvbWVtICh3aGljaCBJIHRha2UgaXMganVzdCBhbiBhbHRlcm5hdGl2ZSB0ZXJtIGZv
ciBNTUlPKS4KPiBFdmVuIGlmIHRoYXQncyBtaXNsZWFkaW5nLCB7LHVufW1hcF9yZWdpb25zKCkg
aXMgYSBsaXR0bGUgdG9vCj4gdW5zcGVjaWZpYyBmb3IgbXkgdGFzdGUuIEF0IHdoaWNoIHBvaW50
IGF0IGxlYXN0IHRoZQo+IGVudmlyb25tZW50IHNhdmluZyBhcmd1bWVudCBnb2VzIGF3YXkgOy0p
CgpIb25lc3RseSwgSSBhbSBub3Qgb25lIHRvIGNhcmUgZm9yIGZ1bmN0aW9ucyBuYW1lcy4gQXMg
bG9uZyBhcyB0aGUgb3RoZXIKbWFpbnRhaW5lcnMgYWdyZWUgd2l0aCBlYWNoIG90aGVycywgSSBh
bSBoYXBweSB0byBtYWtlIHRoZSByZXF1aXJlZApjaGFuZ2VzLgoKCj4gQXMgdG8gdGhlIHNlcmll
cyBhcyBhIHdob2xlLCBJIGd1ZXNzIHlvdSBmaXJzdCB3YW50IHRvIGNvbWUKPiB0byBhbiBhZ3Jl
ZW1lbnQgd2l0aCBKdWxpZW4uIE9ubHkgdGhlbiBpdCdsbCBtYWtlIHNlbnNlIHRvCj4gYWN0dWFs
bHkgcmV2aWV3IHRoZSBjaGFuZ2VzLCBJIHRoaW5rLgoKRmFpciBlbm91Z2gsIGJ1dCBJIGRvbid0
IHRoaW5rIEp1bGllbiBhbmQgSSBoYXZlIHN1Y2ggYSBiaWcgZGlzYWdyZWVtZW50Cm9uIHRoZSBz
aGFwZSBvZiB0aGUgc2VyaWVzLiAoSGUgc3RpbGwgbmVlZHMgdG8gY29tcGxldGUgaGlzIHJldmll
dyBvZiB2Mgp0aG91Z2guKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
