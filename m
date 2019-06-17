Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76547C41
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 10:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcmtA-0004Rc-4m; Mon, 17 Jun 2019 08:21:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AVwO=UQ=bombadil.srs.infradead.org=batv+a9ecd0bfb5b639be820a+5776+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hcmt7-0004RU-SC
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 08:21:14 +0000
X-Inumbo-ID: ddc6117e-90d8-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ddc6117e-90d8-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qNShfOERLRCMbduMMoeCbjKOncW0ucUhY3cgqRy+LfY=; b=ikUTShSN8Y5CCqUUrx2CLyJKH
 SjbiR20Ealxfuz3XL6UqPJT3/XYJjo2wqKXtoQu4Em/ITonqi3E5nt4ZxnnzVulBUhKnZX35+MZBe
 7nd0IuAItqws4Gyko4jn1kLSb9tT7qaQKF0cC0fNMGcYaC492TMy+39FaL9TV8EeQyWjX4fRXVtbl
 zt5ZqKeTMonhm3HmV3KK5/1npg89PJdDtoCLTCEc0BE0uD2maBn6l/VMWtAg5V8VJLF5XP9Vp4fEo
 0tk6VWal4pgo1ct+3q8YPsy56oMLV09xRJ8W8z2QWV5lYfOgjbNfYtP45JXoNzNRPkLj7imVGI387
 ZwTSiv68w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hcmt2-0004OW-C5; Mon, 17 Jun 2019 08:21:08 +0000
Date: Mon, 17 Jun 2019 01:21:08 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <20190617082108.GB11274@infradead.org>
References: <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
 <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
 <20190605141354.GA16635@char.us.oracle.com>
 <9d5a5e02-842f-fd2e-1b85-dd8a68600704@suse.com>
 <20190613142345.GC456@char.us.oracle.com>
 <e03d1101-3909-3109-c96c-77ab1bb047b9@suse.com>
 <20190613210057.GE11920@char.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613210057.GE11920@char.us.oracle.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Julien.Grall@arm.com,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6MDA6NTdQTSAtMDQwMCwgS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIHdyb3RlOgo+ID4gQXMgQ2hyaXN0b3BoIGRpZG4ndCByZWFjdCB3aGVuIEkgcG9zdGVk
IHBvc3NpYmxlIHNvbHV0aW9ucyBJIHRoaW5rIEknbGwKPiA+IGp1c3QgbW9kaWZ5IHBhdGNoIDMg
YWNjb3JkaW5nIHRvIEphbidzIGNvbW1lbnQgYW5kIHBvc3QgVjMuCj4gCj4gT0ssIHdpbGwgYXdh
aXQgdGhhdCBwYXRjaHNldC4gVGhhbmsgeW91IQo+IAo+IEJUVywgeW91ciBwYXRjaCAjMSBzaG91
bGQgYmUgdXBzdHJlYW0gbm93LgoKU3RpbGwgbm90IGEgYmlnIGZhbiBvZiB0aGUgcGFnZSBmbGFn
cyBpbiB0aGUgY29tbW9uIGhlYWRlciwgYnV0IHBsZWFzZQpnbyBhaGVhZCBmb3Igbm93IGlmIHRo
ZSBtbSBmb2xrcyBhcmUgZmluZSB3aXRoIGl0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
