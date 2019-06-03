Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D8337D0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 20:27:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXrds-000893-Oh; Mon, 03 Jun 2019 18:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXrdr-00088y-A5
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 18:25:07 +0000
X-Inumbo-ID: e97caa56-862c-11e9-89dd-031170d87b69
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e97caa56-862c-11e9-89dd-031170d87b69;
 Mon, 03 Jun 2019 18:25:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87E4E273F3;
 Mon,  3 Jun 2019 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559586305;
 bh=5Bz4V5XVBhspmywqz6Kl+L3C7Y/Wwt2Y+R8qvkiIhpQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=khvRy1Ie00likSuQEoETqYCDcTt18Q2EiNR/HotzwC0EPM62PpSEWGBpM+hlGyTFB
 iSk15BM0SaeraVwKnNat8mLu4aG0+EA0V5pJEgQfsOmbZ2docELlgXsGsJz5hOH6ec
 LnknxYyHyxjMF1QRB6aR9E3ERTJMzph4oRYvK59U=
Date: Mon, 3 Jun 2019 11:25:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
Message-ID: <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Julien.Grall@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyOCBNYXkgMjAxOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDUvMjgvMTkg
Njo0OCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gRnJvbTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4KPiA+IE9uIGFybTY0IHN3aW90bGIgaXMg
b2Z0ZW4gKG5vdCBhbHdheXMpIGFscmVhZHkgaW5pdGlhbGl6ZWQgYnkgbWVtX2luaXQuCj4gPiBX
ZSBkb24ndCB3YW50IHRvIGluaXRpYWxpemUgaXQgdHdpY2UsIHdoaWNoIHdvdWxkIHRyaWdnZXIg
YSBzZWNvbmQKPiA+IG1lbW9yeSBhbGxvY2F0aW9uLiBNb3Jlb3ZlciwgdGhlIHNlY29uZCBtZW1v
cnkgcG9vbCBpcyB0eXBpY2FsbHkgbWFkZSBvZgo+ID4gaGlnaCBwYWdlcyBhbmQgZW5kcyB1cCBy
ZXBsYWNpbmcgdGhlIG9yaWdpbmFsIG1lbW9yeSBwb29sIG9mIGxvdyBwYWdlcy4KPiA+IEFzIGEg
c2lkZSBlZmZlY3Qgb2YgdGhpcyBjaGFuZ2UsIGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgbG93IHBh
Z2VzIGluCj4gPiBzd2lvdGxiLXhlbiBvbiBhcm02NC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gCj4gSGFzIHRoaXMgYmVl
biB0ZXN0ZWQgb24geDg2PwoKWWVzLCBJIG1hbmFnZWQgdG8gdGVzdCBpdCB1c2luZyBRRU1VLiBU
aGVyZSBhcmUgbm8gZWZmZWN0cyBvbiB4ODYsIGFzCnRoZSBjaGVjayBpb190bGJfc3RhcnQgIT0g
MCByZXR1cm5zIGZhbHNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
