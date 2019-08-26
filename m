Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5E9CF9D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 14:22:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Dym-0006R3-6J; Mon, 26 Aug 2019 12:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mawP=WW=bombadil.srs.infradead.org=batv+64c9f4a429f346f2dac5+5846+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i2Dyk-0006PY-9z
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 12:20:10 +0000
X-Inumbo-ID: d036473a-c7fb-11e9-951b-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d036473a-c7fb-11e9-951b-bc764e2007e4;
 Mon, 26 Aug 2019 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AQ3Nhdaheed5ujrFwCPWTqAbT1dxRCd+WcE0+WEhj5E=; b=TgTlUD4YAkGQnFk4yVDTirLQpM
 dQuHs1JFKBMPdoH4184keQr28AS9M+E7kxFvPQG6NxnJ7Xvh+uhBq9wsBjFIeM/CUoLgbyrDdDJjt
 8a24XtfyY0jdTOhQdezkq/cJoW/s7VSfayp+Ebz90fdwVJ75iUrGkyDRc6mIsRqoAitAvw08tW68u
 aY3BXsPIP+gxfdzaGL3o1mJY/9V3G6p0YqEYc8sIWKA35mKIdnx1Xu69c0XdU1KhHUL4Ethv5G52n
 dyir+8A6vmyQpGRp/IkfAwAbV0HtG1UQS21menjk8pgSN+XgTEdUd05eGOeICQ4Tvn5ZiWl8WVPQl
 oZ3uyMYg==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DyU-0002Kc-A5; Mon, 26 Aug 2019 12:19:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Mon, 26 Aug 2019 14:19:36 +0200
Message-Id: <20190826121944.515-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826121944.515-1-hch@lst.de>
References: <20190826121944.515-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 03/11] xen/arm: simplify dma_cache_maint
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

Q2FsY3VsYXRlIHRoZSByZXF1aXJlZCBvcGVyYXRpb24gaW4gdGhlIGNhbGxlciwgYW5kIHBhc3Mg
aXQgZGlyZWN0bHkKaW5zdGVhZCBvZiByZWNhbGN1bGF0aW5nIGl0IGZvciBlYWNoIHBhZ2UsIGFu
ZCB1c2Ugc2ltcGxlIGFyaXRobWV0aWNzCnRvIGdldCBmcm9tIHRoZSBwaHlzaWNhbCBhZGRyZXNz
IHRvIFhlbiBwYWdlIHNpemUgYWxpZ25lZCBjaHVua3MuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL2FybS94ZW4vbW0uYyB8IDYyICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwppbmRleCA5MDU3NGQ4OWQwZDQuLjE0MjEw
ZWJkZWExYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKKysrIGIvYXJjaC9hcm0veGVu
L21tLmMKQEAgLTM1LDY0ICszNSw0NiBAQCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9m
cmVlX3BhZ2VzKHVuc2lnbmVkIGludCBvcmRlcikKIAlyZXR1cm4gX19nZXRfZnJlZV9wYWdlcyhm
bGFncywgb3JkZXIpOwogfQogCi1lbnVtIGRtYV9jYWNoZV9vcCB7Ci0gICAgICAgRE1BX1VOTUFQ
LAotICAgICAgIERNQV9NQVAsCi19Owogc3RhdGljIGJvb2wgaHlwZXJjYWxsX2NmbHVzaCA9IGZh
bHNlOwogCi0vKiBmdW5jdGlvbnMgY2FsbGVkIGJ5IFNXSU9UTEIgKi8KLQotc3RhdGljIHZvaWQg
ZG1hX2NhY2hlX21haW50KGRtYV9hZGRyX3QgaGFuZGxlLCB1bnNpZ25lZCBsb25nIG9mZnNldCwK
LQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLCBlbnVtIGRtYV9jYWNo
ZV9vcCBvcCkKKy8qIGJ1ZmZlcnMgaW4gaGlnaG1lbSBvciBmb3JlaWduIHBhZ2VzIGNhbm5vdCBj
cm9zcyBwYWdlIGJvdW5kYXJpZXMgKi8KK3N0YXRpYyB2b2lkIGRtYV9jYWNoZV9tYWludChkbWFf
YWRkcl90IGhhbmRsZSwgc2l6ZV90IHNpemUsIHUzMiBvcCkKIHsKIAlzdHJ1Y3QgZ250dGFiX2Nh
Y2hlX2ZsdXNoIGNmbHVzaDsKLQl1bnNpZ25lZCBsb25nIHhlbl9wZm47Ci0Jc2l6ZV90IGxlZnQg
PSBzaXplOwogCi0JeGVuX3BmbiA9IChoYW5kbGUgPj4gWEVOX1BBR0VfU0hJRlQpICsgb2Zmc2V0
IC8gWEVOX1BBR0VfU0laRTsKLQlvZmZzZXQgJT0gWEVOX1BBR0VfU0laRTsKKwljZmx1c2guYS5k
ZXZfYnVzX2FkZHIgPSBoYW5kbGUgJiBYRU5fUEFHRV9NQVNLOworCWNmbHVzaC5vZmZzZXQgPSB4
ZW5fb2Zmc2V0X2luX3BhZ2UoaGFuZGxlKTsKKwljZmx1c2gub3AgPSBvcDsKIAogCWRvIHsKLQkJ
c2l6ZV90IGxlbiA9IGxlZnQ7Ci0JCi0JCS8qIGJ1ZmZlcnMgaW4gaGlnaG1lbSBvciBmb3JlaWdu
IHBhZ2VzIGNhbm5vdCBjcm9zcyBwYWdlCi0JCSAqIGJvdW5kYXJpZXMgKi8KLQkJaWYgKGxlbiAr
IG9mZnNldCA+IFhFTl9QQUdFX1NJWkUpCi0JCQlsZW4gPSBYRU5fUEFHRV9TSVpFIC0gb2Zmc2V0
OwotCi0JCWNmbHVzaC5vcCA9IDA7Ci0JCWNmbHVzaC5hLmRldl9idXNfYWRkciA9IHhlbl9wZm4g
PDwgWEVOX1BBR0VfU0hJRlQ7Ci0JCWNmbHVzaC5vZmZzZXQgPSBvZmZzZXQ7Ci0JCWNmbHVzaC5s
ZW5ndGggPSBsZW47Ci0KLQkJaWYgKG9wID09IERNQV9VTk1BUCAmJiBkaXIgIT0gRE1BX1RPX0RF
VklDRSkKLQkJCWNmbHVzaC5vcCA9IEdOVFRBQl9DQUNIRV9JTlZBTDsKLQkJaWYgKG9wID09IERN
QV9NQVApIHsKLQkJCWlmIChkaXIgPT0gRE1BX0ZST01fREVWSUNFKQotCQkJCWNmbHVzaC5vcCA9
IEdOVFRBQl9DQUNIRV9JTlZBTDsKLQkJCWVsc2UKLQkJCQljZmx1c2gub3AgPSBHTlRUQUJfQ0FD
SEVfQ0xFQU47Ci0JCX0KLQkJaWYgKGNmbHVzaC5vcCkKLQkJCUhZUEVSVklTT1JfZ3JhbnRfdGFi
bGVfb3AoR05UVEFCT1BfY2FjaGVfZmx1c2gsICZjZmx1c2gsIDEpOworCQlpZiAoc2l6ZSArIGNm
bHVzaC5vZmZzZXQgPiBYRU5fUEFHRV9TSVpFKQorCQkJY2ZsdXNoLmxlbmd0aCA9IFhFTl9QQUdF
X1NJWkUgLSBjZmx1c2gub2Zmc2V0OworCQllbHNlCisJCQljZmx1c2gubGVuZ3RoID0gc2l6ZTsK
KworCQlIWVBFUlZJU09SX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX2NhY2hlX2ZsdXNoLCAmY2Zs
dXNoLCAxKTsKKworCQloYW5kbGUgKz0gY2ZsdXNoLmxlbmd0aDsKKwkJc2l6ZSAtPSBjZmx1c2gu
bGVuZ3RoOwogCi0JCW9mZnNldCA9IDA7Ci0JCXhlbl9wZm4rKzsKLQkJbGVmdCAtPSBsZW47Ci0J
fSB3aGlsZSAobGVmdCk7CisJCWNmbHVzaC5vZmZzZXQgPSAwOworCX0gd2hpbGUgKHNpemUpOwog
fQogCiBzdGF0aWMgdm9pZCBfX3hlbl9kbWFfcGFnZV9kZXZfdG9fY3B1KHN0cnVjdCBkZXZpY2Ug
Kmh3ZGV2LCBkbWFfYWRkcl90IGhhbmRsZSwKIAkJc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpcikKIHsKLQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlICYgUEFHRV9NQVNLLCBo
YW5kbGUgJiB+UEFHRV9NQVNLLCBzaXplLCBkaXIsIERNQV9VTk1BUCk7CisJaWYgKGRpciAhPSBE
TUFfVE9fREVWSUNFKQorCQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlLCBzaXplLCBHTlRUQUJfQ0FD
SEVfSU5WQUwpOwogfQogCiBzdGF0aWMgdm9pZCBfX3hlbl9kbWFfcGFnZV9jcHVfdG9fZGV2KHN0
cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGhhbmRsZSwKIAkJc2l6ZV90IHNpemUsIGVu
dW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKIHsKLQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlICYg
UEFHRV9NQVNLLCBoYW5kbGUgJiB+UEFHRV9NQVNLLCBzaXplLCBkaXIsIERNQV9NQVApOworCWlm
IChkaXIgPT0gRE1BX0ZST01fREVWSUNFKQorCQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlLCBzaXpl
LCBHTlRUQUJfQ0FDSEVfSU5WQUwpOworCWVsc2UKKwkJZG1hX2NhY2hlX21haW50KGhhbmRsZSwg
c2l6ZSwgR05UVEFCX0NBQ0hFX0NMRUFOKTsKIH0KIAogdm9pZCBfX3hlbl9kbWFfbWFwX3BhZ2Uo
c3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
