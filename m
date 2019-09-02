Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4878A573B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4m0H-0003aM-1q; Mon, 02 Sep 2019 13:04:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4m0E-0003Zr-Rf
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:04:14 +0000
X-Inumbo-ID: 21089aa6-cd82-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21089aa6-cd82-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1EUMcSIJcoIdNfawPXZnVgY52ahSnbBC8m8PhYzXTXA=; b=k5utAYi5JMaI+tNLk+JqU3cYPq
 ES/RPpYKu/0+MJJyhyUWB8MZooMiKKk7ttAzi/Bx8+FnN5xNr6WrHUuxyHTm+PHnNHJBDdrRdn2LE
 Xuc8LfBBext3QGCwpodJeI/BenP/OttPTQcXH0v6PvYtkqOYHYYCvC87VA+LpVmhcIFrkalVBwmmB
 FprUemrYreEomdPDXYHH6hMFLyHHcQtLIlhhx40meDQrChenDBupbuM5wDzJiUVFrXGplxHpPWrtM
 ABldLkOsAWpYncGCV6qvjoFHERsKH/LWhZZi8FCs/Gf4qwlgBdn/CccHrVd5E/PGeoLKbZplwUU2e
 xQwZS2RA==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4lzv-0001NV-As; Mon, 02 Sep 2019 13:03:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Mon,  2 Sep 2019 15:03:30 +0200
Message-Id: <20190902130339.23163-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 04/13] xen/arm: simplify dma_cache_maint
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
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FybS94ZW4vbW0uYyB8IDYxICsrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwppbmRleCA5MDU3NGQ4OWQwZDQuLjJmZGUx
NjE3MzNiMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKKysrIGIvYXJjaC9hcm0veGVu
L21tLmMKQEAgLTM1LDY0ICszNSw0NSBAQCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9m
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
dXNoLCAxKTsKIAotCQlvZmZzZXQgPSAwOwotCQl4ZW5fcGZuKys7Ci0JCWxlZnQgLT0gbGVuOwot
CX0gd2hpbGUgKGxlZnQpOworCQljZmx1c2gub2Zmc2V0ID0gMDsKKwkJY2ZsdXNoLmEuZGV2X2J1
c19hZGRyICs9IGNmbHVzaC5sZW5ndGg7CisJCXNpemUgLT0gY2ZsdXNoLmxlbmd0aDsKKwl9IHdo
aWxlIChzaXplKTsKIH0KIAogc3RhdGljIHZvaWQgX194ZW5fZG1hX3BhZ2VfZGV2X3RvX2NwdShz
dHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2FkZHJfdCBoYW5kbGUsCiAJCXNpemVfdCBzaXplLCBl
bnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCiB7Ci0JZG1hX2NhY2hlX21haW50KGhhbmRsZSAm
IFBBR0VfTUFTSywgaGFuZGxlICYgflBBR0VfTUFTSywgc2l6ZSwgZGlyLCBETUFfVU5NQVApOwor
CWlmIChkaXIgIT0gRE1BX1RPX0RFVklDRSkKKwkJZG1hX2NhY2hlX21haW50KGhhbmRsZSwgc2l6
ZSwgR05UVEFCX0NBQ0hFX0lOVkFMKTsKIH0KIAogc3RhdGljIHZvaWQgX194ZW5fZG1hX3BhZ2Vf
Y3B1X3RvX2RldihzdHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2FkZHJfdCBoYW5kbGUsCiAJCXNp
emVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCiB7Ci0JZG1hX2NhY2hlX21h
aW50KGhhbmRsZSAmIFBBR0VfTUFTSywgaGFuZGxlICYgflBBR0VfTUFTSywgc2l6ZSwgZGlyLCBE
TUFfTUFQKTsKKwlpZiAoZGlyID09IERNQV9GUk9NX0RFVklDRSkKKwkJZG1hX2NhY2hlX21haW50
KGhhbmRsZSwgc2l6ZSwgR05UVEFCX0NBQ0hFX0lOVkFMKTsKKwllbHNlCisJCWRtYV9jYWNoZV9t
YWludChoYW5kbGUsIHNpemUsIEdOVFRBQl9DQUNIRV9DTEVBTik7CiB9CiAKIHZvaWQgX194ZW5f
ZG1hX21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
