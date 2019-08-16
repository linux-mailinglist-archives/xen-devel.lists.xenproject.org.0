Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35E90265
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:03:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqb-00072b-AH; Fri, 16 Aug 2019 13:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqa-00071q-58
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:48 +0000
X-Inumbo-ID: dd5e4666-c025-11e9-a661-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd5e4666-c025-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qdUo+R1PETYlMUD0i0ibfvvgSmVBaVigbP1YF9EqgXQ=; b=Z/9TBaBzEphkMy0u5IW3Mp2gIl
 WT8XK8s8t01nk5t2ByHHAKYRplxbXPvZ5Ds5XxHAMIbjjdrT7kRsSJbX5faxv+Vz8REsFtf9nq0NB
 WyghCeAN/dIJIxb3Y5CrmZ0p/b14ryeVjNdo9MsxDLX0DlEiKQrdWy7n3NL50LY33Vj+oyhrp7oXm
 2Xe9MaCjOECVJB1f0Gp+4+1/V+nj/KNV3CZrSlgSJJstohHJJbd5ZkSej9juTVKfE4ffIFnzfPOwg
 4wvRaSC9KA2M1k2wrOhbR8WL5rk6h3l/MgAAr2APWpbC8SVhDL09RyRUn2peGJ483E8/ufYaa0Yj2
 3mOpETKw==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqX-0006Zz-2a; Fri, 16 Aug 2019 13:00:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:10 +0200
Message-Id: <20190816130013.31154-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 08/11] swiotlb-xen: use the same foreign page
 check everywhere
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

eGVuX2RtYV9tYXBfcGFnZSB1c2VzIGEgZGlmZmVyZW50IGFuZCBtb3JlIGNvbXBsaWNhdGVkIGNo
ZWNrIGZvcgpmb3JlaWduIHBhZ2VzIHRoYW4gdGhlIG90aGVyIHRocmVlIGNhY2hlIG1haW50YWlu
YW5jZSBoZWxwZXJzLgpTd2l0Y2ggaXQgdG8gdGhlIHNpbXBsZXIgcGZuX3ZhbGkgbWV0aG9kIGEg
d2VsbC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0K
IGluY2x1ZGUveGVuL3BhZ2UtY29oZXJlbnQuaCB8IDkgKystLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
eGVuL3BhZ2UtY29oZXJlbnQuaCBiL2luY2x1ZGUveGVuL3BhZ2UtY29oZXJlbnQuaAppbmRleCA3
YzMyOTQ0ZGUwNTEuLjBmNGQ0NjhlN2E4OSAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vcGFnZS1j
b2hlcmVudC5oCisrKyBiL2luY2x1ZGUveGVuL3BhZ2UtY29oZXJlbnQuaApAQCAtNDMsMTQgKzQz
LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHhlbl9kbWFfbWFwX3BhZ2Uoc3RydWN0IGRldmljZSAq
aHdkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAogCSAgICAgZG1hX2FkZHJfdCBkZXZfYWRkciwgdW5z
aWduZWQgbG9uZyBvZmZzZXQsIHNpemVfdCBzaXplLAogCSAgICAgZW51bSBkbWFfZGF0YV9kaXJl
Y3Rpb24gZGlyLCB1bnNpZ25lZCBsb25nIGF0dHJzKQogewotCXVuc2lnbmVkIGxvbmcgcGFnZV9w
Zm4gPSBwYWdlX3RvX3hlbl9wZm4ocGFnZSk7Ci0JdW5zaWduZWQgbG9uZyBkZXZfcGZuID0gWEVO
X1BGTl9ET1dOKGRldl9hZGRyKTsKLQl1bnNpZ25lZCBsb25nIGNvbXBvdW5kX3BhZ2VzID0KLQkJ
KDE8PGNvbXBvdW5kX29yZGVyKHBhZ2UpKSAqIFhFTl9QRk5fUEVSX1BBR0U7Ci0JYm9vbCBsb2Nh
bCA9IChwYWdlX3BmbiA8PSBkZXZfcGZuKSAmJgotCQkoZGV2X3BmbiAtIHBhZ2VfcGZuIDwgY29t
cG91bmRfcGFnZXMpOworCXVuc2lnbmVkIGxvbmcgcGZuID0gUEZOX0RPV04oZGV2X2FkZHIpOwog
Ci0JaWYgKGxvY2FsKQorCWlmIChwZm5fdmFsaWQocGZuKSkKIAkJZG1hX2RpcmVjdF9tYXBfcGFn
ZShod2RldiwgcGFnZSwgb2Zmc2V0LCBzaXplLCBkaXIsIGF0dHJzKTsKIAllbHNlCiAJCV9feGVu
X2RtYV9tYXBfcGFnZShod2RldiwgcGFnZSwgZGV2X2FkZHIsIG9mZnNldCwgc2l6ZSwgZGlyLCBh
dHRycyk7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
