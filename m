Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A30A5746
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4lzw-0003Vl-Pc; Mon, 02 Sep 2019 13:03:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4lzu-0003Vf-Up
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:03:55 +0000
X-Inumbo-ID: 1ac68efa-cd82-11e9-b95f-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac68efa-cd82-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jw8Fv6wzy49CF5verrxJIhR/l1Jc+1IWvfjOczPJBbw=; b=PL+e1Zdr2JEzZT9ECWOEgUXIj
 PfofQ/VUSphe5QCeOTp7hVitRbcBwO5EdK72d/pVGE9Al05kGGKjA898+8hdtXjKoTctl7h0PdacC
 P898B+D6oQf8leL3R7qFDVwMz+UTwtptX7bm10xVhrcwZFPzA+WwvblcZokJJ9MWLL1CHVEC403k3
 yZR22p/2zlSZ1dNzHE7/iT4XKcaRwmRLAmZsdsnwPPxjAOymEaUy3HVEN2o0LkkOho7mSpD7DrDA1
 euVeuEZhe/LdLZ399jjWMaBG0TjH+3bM748sWpek8QJ+H81MukrKwHHfkFd0rETi4hEgJqJJIkx8x
 QMq+VUvQQ==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4lzi-00018q-Rg; Mon, 02 Sep 2019 13:03:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Mon,  2 Sep 2019 15:03:26 +0200
Message-Id: <20190902130339.23163-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] swiotlb-xen cleanups v3
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
YWwgd2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgoKQm9yaXMgYW5kIEp1ZXJnZW4sIGNhbiB5b3Ug
dGFrZSBhIGxvb2sgYXQgcGF0Y2ggOCwgd2hpY2ggdG91Y2hlcyB4ODYKYSBhcyB3ZWxsPwoKQ2hh
bmdlcyBzaW5jZSB2MjoKIC0gZnVydGhlciBkbWFfY2FjaGVfbWFpbnQgaW1wcm92ZW1lbnRzCiAt
IHNwbGl0IHRoZSBwcmV2aW91cyBwYXRjaCAxIGludG8gMyBwYXRjaGVzCgpDaGFuZ2VzIHNpbmNl
IHYxOgogLSByZXdyaXRlIGRtYV9jYWNoZV9tYWludCB0byBiZSBtdWNoIHNpbXBsZXIKIC0gaW1w
cm92ZSB2YXJpb3VzIGNvbW1lbnRzIGFuZCBjb21taXQgbG9ncwogLSByZW1vdmUgcGFnZS1jb2hl
cmVudC5oIGVudGlyZWx5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
