Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE7AA1AA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:40:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q45-0000lV-7t; Thu, 05 Sep 2019 11:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2sq=XA=bombadil.srs.infradead.org=batv+6d116066f5ba208d77c0+5856+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i5q42-0000lE-U5
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:36:35 +0000
X-Inumbo-ID: 63b248f6-cfd1-11e9-b299-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63b248f6-cfd1-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcPa5IlnDPH8tm4OAmhfwwgRlNISzvs+UWn9umBpAfg=; b=oHktuR8r49WzS31A+UiLvH2Z1
 NOyMpC+gF++rhCh0op7LqLwwAWVUNUm2SQ9KmfLw9Pn/jUxylg5DwsGYh3+9dzQi14KQdNMBbj9oc
 doMl3phBErpwrkl1GIePI1UGZRc2kIdHNs44uBX4QikSp831ZWfdwCW4SV0WZ2Dnd43ncD/uZM+J2
 /Rw7f9H5PeR8pjZMTjToV/ZWxAE/xpX2xJSe5VGnQdi5AWvDDfwFt8fHgPIJMw1JPMcO2WHpzvs14
 eaEIYtaQygNOOsdigW27oG6DgRt17ieKZVa5HK7Ouw9qXpBM1CF3SwzHnSMOjBiYRp+Lhz2szCjNB
 xKIvE8g0w==;
Received: from 213-225-38-191.nat.highway.a1.net ([213.225.38.191]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5q3o-0001wn-Rm; Thu, 05 Sep 2019 11:36:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Thu,  5 Sep 2019 13:33:57 +0200
Message-Id: <20190905113408.3104-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] swiotlb-xen cleanups v4
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
YWwgd2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgoKCkNoYW5nZXMgc2luY2UgdjM6CiAtIGRvbid0
IHVzZSBkbWFfZGlyZWN0X2FsbG9jIG9uIHg4NgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gZnVydGhl
ciBkbWFfY2FjaGVfbWFpbnQgaW1wcm92ZW1lbnRzCiAtIHNwbGl0IHRoZSBwcmV2aW91cyBwYXRj
aCAxIGludG8gMyBwYXRjaGVzCgpDaGFuZ2VzIHNpbmNlIHYxOgogLSByZXdyaXRlIGRtYV9jYWNo
ZV9tYWludCB0byBiZSBtdWNoIHNpbXBsZXIKIC0gaW1wcm92ZSB2YXJpb3VzIGNvbW1lbnRzIGFu
ZCBjb21taXQgbG9ncwogLSByZW1vdmUgcGFnZS1jb2hlcmVudC5oIGVudGlyZWx5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
