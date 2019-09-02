Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A91A5736
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4m0B-0003YK-KU; Mon, 02 Sep 2019 13:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4m09-0003Y1-R4
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:04:09 +0000
X-Inumbo-ID: 1e95d7fc-cd82-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e95d7fc-cd82-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ToLkGG7hwcxGGmygjG5jqhrOLfqqyuWhx32hjXfzR00=; b=nRpECok3/eweOrrPhNk5NDe553
 cmXyS7OPMtXE3dpV783E5aW6fg39Z311AMoOLuCk8KNamSQ+iiW86P52uMp24wfS+6YDKV3iCwDW/
 kaj2zbspGG1rvpP2UHGMPRyO7BsI6n+X01H+Vq8x4SY3Vf2CR9vMeCFLpe20RGfnyKiJC2yJadUQQ
 yF9vUzqv3FXC59Che4IQ7/SrgSJXdwmFuYDGGG7RNhdWb22NN/4I7WyrH2EHLyhzsC7Sj4h3Y/dtx
 28ZvFiUclJHtKvwTi6zIi/AcugVUrvmaEaxSn4pL+Gn2C3Xr1olvbk7eGS6nFY4hZTYrB9qzqLP8m
 J1tqK+6A==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4lzs-0001K3-5C; Mon, 02 Sep 2019 13:03:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Mon,  2 Sep 2019 15:03:29 +0200
Message-Id: <20190902130339.23163-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 03/13] xen/arm: use dev_is_dma_coherent
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

VXNlIHRoZSBkbWEtbm9uY29oZXJlbnQgZGV2X2lzX2RtYV9jb2hlcmVudCBoZWxwZXIgaW5zdGVh
ZCBvZiB0aGUgaG9tZQpncm93biB2YXJpYW50LiAgTm90ZSB0aGF0IGJvdGggYXJlIGFsd2F5cyBp
bml0aWFsaXplZCB0byB0aGUgc2FtZQp2YWx1ZSBpbiBhcmNoX3NldHVwX2RtYV9vcHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcm0vaW5jbHVkZS9h
c20vZG1hLW1hcHBpbmcuaCAgIHwgIDYgLS0tLS0tCiBhcmNoL2FybS94ZW4vbW0uYyAgICAgICAg
ICAgICAgICAgICAgfCAxMiArKysrKystLS0tLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vZG1h
LW1hcHBpbmcuaCB8ICA5IC0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Rt
YS1tYXBwaW5nLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oCmluZGV4IGRi
YTkzNTVlMjQ4NC4uYmRkODBkZGJjYTM0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9kbWEtbWFwcGluZy5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmgK
QEAgLTkxLDEyICs5MSw2IEBAIHN0YXRpYyBpbmxpbmUgZG1hX2FkZHJfdCB2aXJ0X3RvX2RtYShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmFkZHIpCiB9CiAjZW5kaWYKIAotLyogZG8gbm90IHVz
ZSB0aGlzIGZ1bmN0aW9uIGluIGEgZHJpdmVyICovCi1zdGF0aWMgaW5saW5lIGJvb2wgaXNfZGV2
aWNlX2RtYV9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0JcmV0dXJuIGRldi0+YXJj
aGRhdGEuZG1hX2NvaGVyZW50OwotfQotCiAvKioKICAqIGFybV9kbWFfYWxsb2MgLSBhbGxvY2F0
ZSBjb25zaXN0ZW50IG1lbW9yeSBmb3IgRE1BCiAgKiBAZGV2OiB2YWxpZCBzdHJ1Y3QgZGV2aWNl
IHBvaW50ZXIsIG9yIE5VTEwgZm9yIElTQSBhbmQgRUlTQS1saWtlIGRldmljZXMKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9hcm0veGVuL21tLmMKaW5kZXggZDMzYjc3ZTlh
ZGQzLi45MDU3NGQ4OWQwZDQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCisrKyBiL2Fy
Y2gvYXJtL3hlbi9tbS5jCkBAIC0xLDYgKzEsNiBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgotI2luY2x1ZGUgPGxpbnV4
L2RtYS1tYXBwaW5nLmg+CisjaW5jbHVkZSA8bGludXgvZG1hLW5vbmNvaGVyZW50Lmg+CiAjaW5j
bHVkZSA8bGludXgvZ2ZwLmg+CiAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgogI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPgpAQCAtOTksNyArOTksNyBAQCB2b2lkIF9feGVuX2RtYV9tYXBfcGFn
ZShzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCiAJICAgICBkbWFfYWRk
cl90IGRldl9hZGRyLCB1bnNpZ25lZCBsb25nIG9mZnNldCwgc2l6ZV90IHNpemUsCiAJICAgICBl
bnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCiB7Ci0JaWYg
KGlzX2RldmljZV9kbWFfY29oZXJlbnQoaHdkZXYpKQorCWlmIChkZXZfaXNfZG1hX2NvaGVyZW50
KGh3ZGV2KSkKIAkJcmV0dXJuOwogCWlmIChhdHRycyAmIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMp
CiAJCXJldHVybjsKQEAgLTExMiw3ICsxMTIsNyBAQCB2b2lkIF9feGVuX2RtYV91bm1hcF9wYWdl
KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGhhbmRsZSwKIAkJdW5zaWduZWQgbG9u
ZyBhdHRycykKIAogewotCWlmIChpc19kZXZpY2VfZG1hX2NvaGVyZW50KGh3ZGV2KSkKKwlpZiAo
ZGV2X2lzX2RtYV9jb2hlcmVudChod2RldikpCiAJCXJldHVybjsKIAlpZiAoYXR0cnMgJiBETUFf
QVRUUl9TS0lQX0NQVV9TWU5DKQogCQlyZXR1cm47CkBAIC0xMjMsNyArMTIzLDcgQEAgdm9pZCBf
X3hlbl9kbWFfdW5tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2RldiwgZG1hX2FkZHJfdCBoYW5k
bGUsCiB2b2lkIF9feGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfY3B1KHN0cnVjdCBkZXZpY2UgKmh3
ZGV2LAogCQlkbWFfYWRkcl90IGhhbmRsZSwgc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGly
ZWN0aW9uIGRpcikKIHsKLQlpZiAoaXNfZGV2aWNlX2RtYV9jb2hlcmVudChod2RldikpCisJaWYg
KGRldl9pc19kbWFfY29oZXJlbnQoaHdkZXYpKQogCQlyZXR1cm47CiAJX194ZW5fZG1hX3BhZ2Vf
ZGV2X3RvX2NwdShod2RldiwgaGFuZGxlLCBzaXplLCBkaXIpOwogfQpAQCAtMTMxLDcgKzEzMSw3
IEBAIHZvaWQgX194ZW5fZG1hX3N5bmNfc2luZ2xlX2Zvcl9jcHUoc3RydWN0IGRldmljZSAqaHdk
ZXYsCiB2b2lkIF9feGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKHN0cnVjdCBkZXZpY2Ug
Kmh3ZGV2LAogCQlkbWFfYWRkcl90IGhhbmRsZSwgc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpcikKIHsKLQlpZiAoaXNfZGV2aWNlX2RtYV9jb2hlcmVudChod2RldikpCisJ
aWYgKGRldl9pc19kbWFfY29oZXJlbnQoaHdkZXYpKQogCQlyZXR1cm47CiAJX194ZW5fZG1hX3Bh
Z2VfY3B1X3RvX2Rldihod2RldiwgaGFuZGxlLCBzaXplLCBkaXIpOwogfQpAQCAtMTU5LDcgKzE1
OSw3IEBAIGJvb2wgeGVuX2FyY2hfbmVlZF9zd2lvdGxiKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkg
KiBtZW1vcnkgYW5kIHdlIGFyZSBub3QgYWJsZSB0byBmbHVzaCB0aGUgY2FjaGUuCiAJICovCiAJ
cmV0dXJuICghaHlwZXJjYWxsX2NmbHVzaCAmJiAoeGVuX3BmbiAhPSBiZm4pICYmCi0JCSFpc19k
ZXZpY2VfZG1hX2NvaGVyZW50KGRldikpOworCQkhZGV2X2lzX2RtYV9jb2hlcmVudChkZXYpKTsK
IH0KIAogaW50IHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0
LCB1bnNpZ25lZCBpbnQgb3JkZXIsCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2RtYS1tYXBwaW5nLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmgKaW5k
ZXggYmRjYjA5MjJhNDBjLi42NzI0MzI1NWE4NTggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vZG1hLW1hcHBpbmcuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2RtYS1t
YXBwaW5nLmgKQEAgLTE4LDE0ICsxOCw1IEBAIHN0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGRt
YV9tYXBfb3BzICpnZXRfYXJjaF9kbWFfb3BzKHN0cnVjdCBidXNfdHlwZSAqYnVzKQogCXJldHVy
biBOVUxMOwogfQogCi0vKgotICogRG8gbm90IHVzZSB0aGlzIGZ1bmN0aW9uIGluIGEgZHJpdmVy
LCBpdCBpcyBvbmx5IHByb3ZpZGVkIGZvcgotICogYXJjaC9hcm0vbW0veGVuLmMsIHdoaWNoIGlz
IHVzZWQgYnkgYXJtNjQgYXMgd2VsbC4KLSAqLwotc3RhdGljIGlubGluZSBib29sIGlzX2Rldmlj
ZV9kbWFfY29oZXJlbnQoc3RydWN0IGRldmljZSAqZGV2KQotewotCXJldHVybiBkZXYtPmRtYV9j
b2hlcmVudDsKLX0KLQogI2VuZGlmCS8qIF9fS0VSTkVMX18gKi8KICNlbmRpZgkvKiBfX0FTTV9E
TUFfTUFQUElOR19IICovCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
