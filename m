Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D7A5735
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4m0L-0003cM-B5; Mon, 02 Sep 2019 13:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4m0J-0003bp-Rp
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:04:19 +0000
X-Inumbo-ID: 226ef85e-cd82-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 226ef85e-cd82-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0S0r89/KU1c+xgF18IBbeKljG6PelXNtFabs09ex5Y=; b=TJorY4Y/35W+DIu+pX3EnCCx6g
 oIJF/ZU79+gImEf/XFmUnVpG1HAqT0f1SJqLhFWGRkQhVqhSPhMs4qiI2/BoFJ5T/4cKSONrT47gb
 Vl5t5qR7yAmFVh9rRVYZ7YrdLjLXTZWslCgG3J88Nd6GWoQxSB4SJgnAN+3qi5rvJ+k9JVCEvSwte
 POHdRFFTW4aqZ3Yc6jc5W4kiny6i0/tNndwuYLlNFfNHwyf9wHuo7x4tQ/JdcHJQnbcSI8jSnQQF5
 DzQ+Ka6Lpb6mRShDakSiyaOBKO4En8u8A9CAduTF1uewWkoZoMqC+zmrgPUntE9ex612eJxGJrequ
 m2NqJW+Q==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4lzy-0001Qp-Gm; Mon, 02 Sep 2019 13:03:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Mon,  2 Sep 2019 15:03:31 +0200
Message-Id: <20190902130339.23163-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 05/13] xen/arm: remove xen_dma_ops
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
Cc: x86@kernel.org, Julien Grall <julien.grall@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YXJtIGFuZCBhcm02NCBjYW4ganVzdCB1c2UgeGVuX3N3aW90bGJfZG1hX29wcyBkaXJlY3RseSBs
aWtlIHg4Niwgbm8KbmVlZCBmb3IgYSBwb2ludGVyIGluZGlyZWN0aW9uLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMg
ICAgfCAzICsrLQogYXJjaC9hcm0veGVuL21tLmMgICAgICAgICAgICB8IDQgLS0tLQogYXJjaC9h
cm02NC9tbS9kbWEtbWFwcGluZy5jICB8IDMgKystCiBpbmNsdWRlL3hlbi9hcm0vaHlwZXJ2aXNv
ci5oIHwgMiAtLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYyBiL2FyY2gvYXJtL21t
L2RtYS1tYXBwaW5nLmMKaW5kZXggNzM4MDk3Mzk2NDQ1Li4yNjYxY2FkMzYzNTkgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMKKysrIGIvYXJjaC9hcm0vbW0vZG1hLW1hcHBp
bmcuYwpAQCAtMzUsNiArMzUsNyBAQAogI2luY2x1ZGUgPGFzbS9tYWNoL21hcC5oPgogI2luY2x1
ZGUgPGFzbS9zeXN0ZW1faW5mby5oPgogI2luY2x1ZGUgPGFzbS9kbWEtY29udGlndW91cy5oPgor
I2luY2x1ZGUgPHhlbi9zd2lvdGxiLXhlbi5oPgogCiAjaW5jbHVkZSAiZG1hLmgiCiAjaW5jbHVk
ZSAibW0uaCIKQEAgLTIzNjAsNyArMjM2MSw3IEBAIHZvaWQgYXJjaF9zZXR1cF9kbWFfb3BzKHN0
cnVjdCBkZXZpY2UgKmRldiwgdTY0IGRtYV9iYXNlLCB1NjQgc2l6ZSwKIAogI2lmZGVmIENPTkZJ
R19YRU4KIAlpZiAoeGVuX2luaXRpYWxfZG9tYWluKCkpCi0JCWRldi0+ZG1hX29wcyA9IHhlbl9k
bWFfb3BzOworCQlkZXYtPmRtYV9vcHMgPSAmeGVuX3N3aW90bGJfZG1hX29wczsKICNlbmRpZgog
CWRldi0+YXJjaGRhdGEuZG1hX29wc19zZXR1cCA9IHRydWU7CiB9CmRpZmYgLS1naXQgYS9hcmNo
L2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jCmluZGV4IDJmZGUxNjE3MzNiMC4uMTFk
NWFkMjZmY2ZlIDEwMDY0NAotLS0gYS9hcmNoL2FybS94ZW4vbW0uYworKysgYi9hcmNoL2FybS94
ZW4vbW0uYwpAQCAtMTYyLDE2ICsxNjIsMTIgQEAgdm9pZCB4ZW5fZGVzdHJveV9jb250aWd1b3Vz
X3JlZ2lvbihwaHlzX2FkZHJfdCBwc3RhcnQsIHVuc2lnbmVkIGludCBvcmRlcikKIH0KIEVYUE9S
VF9TWU1CT0xfR1BMKHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKTsKIAotY29uc3Qgc3Ry
dWN0IGRtYV9tYXBfb3BzICp4ZW5fZG1hX29wczsKLUVYUE9SVF9TWU1CT0woeGVuX2RtYV9vcHMp
OwotCiBpbnQgX19pbml0IHhlbl9tbV9pbml0KHZvaWQpCiB7CiAJc3RydWN0IGdudHRhYl9jYWNo
ZV9mbHVzaCBjZmx1c2g7CiAJaWYgKCF4ZW5faW5pdGlhbF9kb21haW4oKSkKIAkJcmV0dXJuIDA7
CiAJeGVuX3N3aW90bGJfaW5pdCgxLCBmYWxzZSk7Ci0JeGVuX2RtYV9vcHMgPSAmeGVuX3N3aW90
bGJfZG1hX29wczsKIAogCWNmbHVzaC5vcCA9IDA7CiAJY2ZsdXNoLmEuZGV2X2J1c19hZGRyID0g
MDsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcuYyBiL2FyY2gvYXJtNjQv
bW0vZG1hLW1hcHBpbmcuYwppbmRleCBiZDJiMDM5ZjQzYTYuLjRiMjQ0YTAzNzM0OSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCisrKyBiL2FyY2gvYXJtNjQvbW0vZG1h
LW1hcHBpbmcuYwpAQCAtOCw2ICs4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9jYWNoZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2RtYS1ub25jb2hlcmVudC5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1pb21t
dS5oPgorI2luY2x1ZGUgPHhlbi9zd2lvdGxiLXhlbi5oPgogCiAjaW5jbHVkZSA8YXNtL2NhY2hl
Zmx1c2guaD4KIApAQCAtNjQsNiArNjUsNiBAQCB2b2lkIGFyY2hfc2V0dXBfZG1hX29wcyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHU2NCBkbWFfYmFzZSwgdTY0IHNpemUsCiAKICNpZmRlZiBDT05GSUdf
WEVOCiAJaWYgKHhlbl9pbml0aWFsX2RvbWFpbigpKQotCQlkZXYtPmRtYV9vcHMgPSB4ZW5fZG1h
X29wczsKKwkJZGV2LT5kbWFfb3BzID0gJnhlbl9zd2lvdGxiX2RtYV9vcHM7CiAjZW5kaWYKIH0K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL2FybS9oeXBlcnZpc29yLmggYi9pbmNsdWRlL3hlbi9h
cm0vaHlwZXJ2aXNvci5oCmluZGV4IDI5ODI1NzFmN2NjMS4uNDNlZjI0ZGQwMzBlIDEwMDY0NAot
LS0gYS9pbmNsdWRlL3hlbi9hcm0vaHlwZXJ2aXNvci5oCisrKyBiL2luY2x1ZGUveGVuL2FybS9o
eXBlcnZpc29yLmgKQEAgLTE5LDggKzE5LDYgQEAgc3RhdGljIGlubGluZSBlbnVtIHBhcmF2aXJ0
X2xhenlfbW9kZSBwYXJhdmlydF9nZXRfbGF6eV9tb2RlKHZvaWQpCiAJcmV0dXJuIFBBUkFWSVJU
X0xBWllfTk9ORTsKIH0KIAotZXh0ZXJuIGNvbnN0IHN0cnVjdCBkbWFfbWFwX29wcyAqeGVuX2Rt
YV9vcHM7Ci0KICNpZmRlZiBDT05GSUdfWEVOCiB2b2lkIF9faW5pdCB4ZW5fZWFybHlfaW5pdCh2
b2lkKTsKICNlbHNlCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
