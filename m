Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7EA9CF8F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 14:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2DyX-0005n8-5z; Mon, 26 Aug 2019 12:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mawP=WW=bombadil.srs.infradead.org=batv+64c9f4a429f346f2dac5+5846+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i2DyV-0005m3-EV
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 12:19:55 +0000
X-Inumbo-ID: cb839800-c7fb-11e9-951b-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb839800-c7fb-11e9-951b-bc764e2007e4;
 Mon, 26 Aug 2019 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/IYpdkvOndVBhg+7Z4eP7M352N3B3xE+qKewRDjhnY=; b=WZFSh4/ccZ/7Xv7N0LpYyfSfY
 QoXBa+wW+AMqanItAKUh/Q/Hwr8DHSEDpcm0/88LLZ8eJYdRrVW7/6ekZUafJMv3NrF4M8R3kcGxY
 BZ3Ktpt2GIggAcExF5FyBHBwaCaBKdDThv1TJ0ztKOx0pqAduaU9fTcdsbmUhWl/M1+WWrfB22Xgb
 7N7AHYPt5gLgpmenrk40yeGSYjTTtcLI7jfL+0QAGqZYTK0ZMVX3Mrtj/0AQM3fKODIN8M7t9vLw/
 fxv8CeO+a/bFiXkCVlCIz4wzwozEkr6zu4outVpdXQCDiEHJTXa9FifdrhEVyqSPiHzyhxiLf4LOD
 ZNJ2fImxQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DyM-0002Ej-9R; Mon, 26 Aug 2019 12:19:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Mon, 26 Aug 2019 14:19:33 +0200
Message-Id: <20190826121944.515-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] swiotlb-xen cleanups v2
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgWGVuIG1haW50YWluZXJzIGFuZCBmcmllbmRzLAoKcGxlYXNlIHRha2UgYSBsb29rIGF0IHRo
aXMgc2VyaWVzIHRoYXQgY2xlYW5zIHVwIHRoZSBwYXJ0cyBvZiBzd2lvdGxiLXhlbgp0aGF0IGRl
YWwgd2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gcmV3cml0
ZSBkbWFfY2FjaGVfbWFpbnQgdG8gYmUgbXVjaCBzaW1wbGVyCiAtIGltcHJvdmUgdmFyaW91cyBj
b21tZW50cyBhbmQgY29tbWl0IGxvZ3MKIC0gcmVtb3ZlIHBhZ2UtY29oZXJlbnQuaCBlbnRpcmVs
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
