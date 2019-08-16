Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE709025A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqi-00078O-2K; Fri, 16 Aug 2019 13:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqg-000773-Fy
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:54 +0000
X-Inumbo-ID: e1180bd4-c025-11e9-a661-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1180bd4-c025-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/coRcFOuhTVgeucGRP02jq6MPxmc29UfStBFaWddotw=; b=o2033zZnJGFQrl5WvJgIHegkA7
 3I8n/CVjA3frYwlzEaTN8N4/bi31dNBaR0mCktfGizSU4vwmKh2HFBD+pemx6yUB+tZ7w3Qc2cWFj
 R3zTFxhuZeE1gYcD7/6IKlwRULF78XqZuhVmrqG0IYhlE8LBMY/B5yfvltt7PFCBcGNaR2F5m5NVG
 6rT2CXC8bY7530Tl1XjQjWeQsWHpC7v31U5IAdxi61BUu3eS9lyvg9NdBLKO4t9iV5Tooqi2oiA7z
 6lUFp9/0XvzuPm5Whx5CCubIlxlB82q12yXI1P9woMpaTt6SB3NH2D8Jae7biN5e1Ku5MyxbYwA0g
 t5VwhH8g==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqd-0006fj-7E; Fri, 16 Aug 2019 13:00:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:12 +0200
Message-Id: <20190816130013.31154-11-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 10/11] swiotlb-xen: merge xen_unmap_single into
 xen_swiotlb_unmap_page
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

Tm8gbmVlZCBmb3IgYSBuby1vcCB3cmFwcGVyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDE1ICsr
KystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMv
eGVuL3N3aW90bGIteGVuLmMKaW5kZXggYzNjMzgzMDMzYWU0Li5iNmI5YzRjMWIzOTcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3Rs
Yi14ZW4uYwpAQCAtNDE0LDkgKzQxNCw4IEBAIHN0YXRpYyBkbWFfYWRkcl90IHhlbl9zd2lvdGxi
X21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCiAgKiBBZnRl
ciB0aGlzIGNhbGwsIHJlYWRzIGJ5IHRoZSBjcHUgdG8gdGhlIGJ1ZmZlciBhcmUgZ3VhcmFudGVl
ZCB0byBzZWUKICAqIHdoYXRldmVyIHRoZSBkZXZpY2Ugd3JvdGUgdGhlcmUuCiAgKi8KLXN0YXRp
YyB2b2lkIHhlbl91bm1hcF9zaW5nbGUoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3Qg
ZGV2X2FkZHIsCi0JCQkgICAgIHNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIsCi0JCQkgICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCitzdGF0aWMgdm9pZCB4ZW5fc3dpb3Rs
Yl91bm1hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAor
CQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLCB1bnNpZ25lZCBsb25n
IGF0dHJzKQogewogCXBoeXNfYWRkcl90IHBhZGRyID0geGVuX2J1c190b19waHlzKGRldl9hZGRy
KTsKIApAQCAtNDMwLDEzICs0MjksNiBAQCBzdGF0aWMgdm9pZCB4ZW5fdW5tYXBfc2luZ2xlKHN0
cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAogCQlzd2lvdGxiX3RibF91
bm1hcF9zaW5nbGUoaHdkZXYsIHBhZGRyLCBzaXplLCBkaXIsIGF0dHJzKTsKIH0KIAotc3RhdGlj
IHZvaWQgeGVuX3N3aW90bGJfdW5tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2Fk
ZHJfdCBkZXZfYWRkciwKLQkJCSAgICBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rp
b24gZGlyLAotCQkJICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCi17Ci0JeGVuX3VubWFwX3Npbmds
ZShod2RldiwgZGV2X2FkZHIsIHNpemUsIGRpciwgYXR0cnMpOwotfQotCiBzdGF0aWMgdm9pZAog
eGVuX3N3aW90bGJfc3luY19zaW5nbGVfZm9yX2NwdShzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9h
ZGRyX3QgZG1hX2FkZHIsCiAJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIpCkBAIC00NzcsNyArNDY5LDggQEAgeGVuX3N3aW90bGJfdW5tYXBfc2coc3RydWN0IGRldmlj
ZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLCBpbnQgbmVsZW1zLAogCUJVR19PTihk
aXIgPT0gRE1BX05PTkUpOwogCiAJZm9yX2VhY2hfc2coc2dsLCBzZywgbmVsZW1zLCBpKQotCQl4
ZW5fdW5tYXBfc2luZ2xlKGh3ZGV2LCBzZy0+ZG1hX2FkZHJlc3MsIHNnX2RtYV9sZW4oc2cpLCBk
aXIsIGF0dHJzKTsKKwkJeGVuX3N3aW90bGJfdW5tYXBfcGFnZShod2Rldiwgc2ctPmRtYV9hZGRy
ZXNzLCBzZ19kbWFfbGVuKHNnKSwKKwkJCQlkaXIsIGF0dHJzKTsKIAogfQogCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
