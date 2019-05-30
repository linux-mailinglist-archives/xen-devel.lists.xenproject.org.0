Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF062F8FB
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 11:08:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWGz1-00048Y-6L; Thu, 30 May 2019 09:04:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TeU2=T6=bombadil.srs.infradead.org=batv+882e7947623448fb4484+5758+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hWGyz-00048T-Af
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 09:04:21 +0000
X-Inumbo-ID: e9097f18-82b9-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9097f18-82b9-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=49xeno4V9mLcXP70a+Sa/AkFzuIPrG2MU15kIdS1nJ8=; b=oThcn6rn+teoSzUhrD1ivlyEm
 NLcVzG/BInSURdKJwXjMVmB0tKRq2g286EMQ0Vbdus1/jzEsGjN6XnhdBK3nYR5GYNC7wN7ReinQB
 3n5NIOsvffPiVfhvRiW3EvTICSdbwKBv/i/9afRwg2p5SAX5l8O3lVdxogQFdTLhCSjgbqIyBovaq
 HdvlU7le3E69hkHYFKiywpDmUF0xxF4nsGjN26NKcvet2nTpoHnlbHuqKRHq64tnGNicYRZx5ZOtn
 IZa8k14vODzW8d1RWcI83yW8p6ez+NLE4lGppYOGQriUa8uMMd6jfDcUHc7s0wdXA34vb0HOKm+He
 0LenWjfaw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hWGyn-000806-HQ; Thu, 30 May 2019 09:04:09 +0000
Date: Thu, 30 May 2019 02:04:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190530090409.GB30428@infradead.org>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529090407.1225-4-jgross@suse.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxlYXNlIGRvbid0IGFkZCB5b3VyIHByaXZhdGUgZmxhZyB0byBwYWdlLWZsYWdzLmguICBUaGUg
d2hvbGUgcG9pbnQgb2YKdGhlIHByaXZhdGUgZmxhZyBpcyB0aGF0IHlvdSBjYW4gdXNlIGl0IGlu
IGFueSB3YXkgeW91IHdhbnQgd2l0aG91CnRvdWNoaW5nIHRoZSBjb21tb24gY29kZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
