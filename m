Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9590257
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqI-0006qc-AP; Fri, 16 Aug 2019 13:00:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqH-0006qR-Bu
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:29 +0000
X-Inumbo-ID: ccb5faca-c025-11e9-a661-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccb5faca-c025-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/X/Y59hfbuhTR8R0c4UgnC40L7hK5mDNJVq0+XW9gto=; b=G725rYDoFuoO8BgzUWXYW7cYc
 vauQ7kYdyqJ03f6IcxS9qhkhtTmZSRgMnnYxZeryutg+Or3A6urZMN2jJluDdlxdncHZWpUIggkNp
 FIGRFbfJPkz+UpCMvy9Aq6BmUgXZPvKWgcUX1aiSoG8VSBe/izzbR8P9ybUABxNcXUpKkrQzY2dtN
 +n7NobpBi0tHSNiaZMPAvLsENRC7iX8PH3sPVxhS8QjeNKVXzwsaHPpodXNCAoCLr9rdPPl+1o/nE
 kb+dhjHMpvC7kQbARBJEcA5Dpjxzpt+DODNBBTry1vcpyNgTzkcaIl0bYjVSln4kbmyHwy4059iKB
 xurXgSUwQ==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybq4-0006GQ-61; Fri, 16 Aug 2019 13:00:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:02 +0200
Message-Id: <20190816130013.31154-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] swiotlb-xen cleanups
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
YWwgd2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
