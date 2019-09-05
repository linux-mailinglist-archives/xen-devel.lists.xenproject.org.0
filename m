Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB7AA1E5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:44:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q8v-0002OO-Gb; Thu, 05 Sep 2019 11:41:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2sq=XA=bombadil.srs.infradead.org=batv+6d116066f5ba208d77c0+5856+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i5q8t-0002Na-Vk
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:41:36 +0000
X-Inumbo-ID: 11970754-cfd2-11e9-978d-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11970754-cfd2-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKfAd6kn7o0OFMdVf0qLOsCzeZUMPjFVUBcPofF+5Rg=; b=jCyEr776D3nxSkDU85Kvr2nKrg
 apvn3y/CKNNzAYALPDIhVibSrHwWiZptPpAvFHGSmsyoqFLiX4JOxzMmjvsnEdzvmTBhW0K3gvYYy
 faYTytyZvmYvLzHN0CgJoMZklGXamvbnhN1tdDhr8YRwmKKMmH4OUhgB/bOBtwKPERKdaB0Aabgw9
 slt55H8YrhCei0l6wdNevU1pcA9/535gVuWS3mxqV5D1PkQFcq1mjavOgPlTa57Un66VTXCAU2GIe
 xb5r/0Dik7Is4JYGc9OQSTYZuR/syJrQKielTJvaTZr66ooXXiQI/8JOletIyEfbFMTTqq80k4avj
 pCxcwslg==;
Received: from [2001:4bb8:18c:1755:a4b2:9562:6bf1:4bb9] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5q8V-0005BS-QT; Thu, 05 Sep 2019 11:41:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Thu,  5 Sep 2019 13:34:07 +0200
Message-Id: <20190905113408.3104-11-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905113408.3104-1-hch@lst.de>
References: <20190905113408.3104-1-hch@lst.de>
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
bGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDE1ICsr
KystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMv
eGVuL3N3aW90bGIteGVuLmMKaW5kZXggZjgxMDMxZjBjMWM3Li4xMTkwOTM0MDk4ZWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3Rs
Yi14ZW4uYwpAQCAtNDE4LDkgKzQxOCw4IEBAIHN0YXRpYyBkbWFfYWRkcl90IHhlbl9zd2lvdGxi
X21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCiAgKiBBZnRl
ciB0aGlzIGNhbGwsIHJlYWRzIGJ5IHRoZSBjcHUgdG8gdGhlIGJ1ZmZlciBhcmUgZ3VhcmFudGVl
ZCB0byBzZWUKICAqIHdoYXRldmVyIHRoZSBkZXZpY2Ugd3JvdGUgdGhlcmUuCiAgKi8KLXN0YXRp
YyB2b2lkIHhlbl91bm1hcF9zaW5nbGUoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3Qg
ZGV2X2FkZHIsCi0JCQkgICAgIHNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIsCi0JCQkgICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCitzdGF0aWMgdm9pZCB4ZW5fc3dpb3Rs
Yl91bm1hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAor
CQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLCB1bnNpZ25lZCBsb25n
IGF0dHJzKQogewogCXBoeXNfYWRkcl90IHBhZGRyID0geGVuX2J1c190b19waHlzKGRldl9hZGRy
KTsKIApAQCAtNDM0LDEzICs0MzMsNiBAQCBzdGF0aWMgdm9pZCB4ZW5fdW5tYXBfc2luZ2xlKHN0
cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAogCQlzd2lvdGxiX3RibF91
bm1hcF9zaW5nbGUoaHdkZXYsIHBhZGRyLCBzaXplLCBkaXIsIGF0dHJzKTsKIH0KIAotc3RhdGlj
IHZvaWQgeGVuX3N3aW90bGJfdW5tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2Fk
ZHJfdCBkZXZfYWRkciwKLQkJCSAgICBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rp
b24gZGlyLAotCQkJICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCi17Ci0JeGVuX3VubWFwX3Npbmds
ZShod2RldiwgZGV2X2FkZHIsIHNpemUsIGRpciwgYXR0cnMpOwotfQotCiBzdGF0aWMgdm9pZAog
eGVuX3N3aW90bGJfc3luY19zaW5nbGVfZm9yX2NwdShzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9h
ZGRyX3QgZG1hX2FkZHIsCiAJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIpCkBAIC00ODEsNyArNDczLDggQEAgeGVuX3N3aW90bGJfdW5tYXBfc2coc3RydWN0IGRldmlj
ZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLCBpbnQgbmVsZW1zLAogCUJVR19PTihk
aXIgPT0gRE1BX05PTkUpOwogCiAJZm9yX2VhY2hfc2coc2dsLCBzZywgbmVsZW1zLCBpKQotCQl4
ZW5fdW5tYXBfc2luZ2xlKGh3ZGV2LCBzZy0+ZG1hX2FkZHJlc3MsIHNnX2RtYV9sZW4oc2cpLCBk
aXIsIGF0dHJzKTsKKwkJeGVuX3N3aW90bGJfdW5tYXBfcGFnZShod2Rldiwgc2ctPmRtYV9hZGRy
ZXNzLCBzZ19kbWFfbGVuKHNnKSwKKwkJCQlkaXIsIGF0dHJzKTsKIAogfQogCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
