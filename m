Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62974AA1EF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q8g-0002Ev-SG; Thu, 05 Sep 2019 11:41:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2sq=XA=bombadil.srs.infradead.org=batv+6d116066f5ba208d77c0+5856+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i5q8e-0002Dz-Um
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:41:20 +0000
X-Inumbo-ID: 0d7a546e-cfd2-11e9-b299-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d7a546e-cfd2-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yblpSkBc51Fw0zd+3yeEyEvbp0oik6LLS+KZTp2OIZk=; b=ad7SlQ2tSsNYLM9s8LE2/Foz0u
 v/LFGD+KRjalx7Y10MuiNQ988TzQOl3hIx4XozEBrzxjYmvn/F2VbzhM3pMDVWI6TbTLxBo36xgT7
 QEHzW60Hk0eK7KYKG1zhYsIhaCex0AlwVHL7NDSYaA2BRUkowHDht8uHFUPfrLjuAxu1cplNoPY38
 2M9mFCfZeyMPZk6VCcFc5ICowlHls+EzxWBEBikvr3iAhl68RDZcdCoIdCatcmLB7H6znzhB/p5Qh
 a4iTYH298CEir9Fr+77qzrLexGmqWIe7WZwHL85VCrcxg6y3jAzLzuTeEWPnlPDgEpcuIfUf55H+a
 4Nf9b9Kg==;
Received: from [2001:4bb8:18c:1755:a4b2:9562:6bf1:4bb9] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5q8P-00054e-6G; Thu, 05 Sep 2019 11:41:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Thu,  5 Sep 2019 13:34:05 +0200
Message-Id: <20190905113408.3104-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905113408.3104-1-hch@lst.de>
References: <20190905113408.3104-1-hch@lst.de>
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
ZWNrIGZvciBmb3JlaWduCnBhZ2VzIHRoYW4gdGhlIG90aGVyIHRocmVlIGNhY2hlIG1haW50YWlu
YW5jZSBoZWxwZXJzLiAgU3dpdGNoIGl0IHRvIHRoZQpzaW1wbGVyIHBmbl92YWxpZCBtZXRob2Qg
YSB3ZWxsLCBhbmQgZG9jdW1lbnQgdGhlIHNjaGVtZSB3aXRoIGEgc2luZ2xlCmltcHJvdmVkIGNv
bW1lbnQgaW4geGVuX2RtYV9tYXBfcGFnZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgotLS0KIGluY2x1ZGUveGVuL2FybS9wYWdlLWNvaGVyZW50LmggfCAz
MSArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9hcm0v
cGFnZS1jb2hlcmVudC5oIGIvaW5jbHVkZS94ZW4vYXJtL3BhZ2UtY29oZXJlbnQuaAppbmRleCBh
ODQwZDY5NDlhODcuLmE4ZDljMDY3OGMyNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vYXJtL3Bh
Z2UtY29oZXJlbnQuaAorKysgYi9pbmNsdWRlL3hlbi9hcm0vcGFnZS1jb2hlcmVudC5oCkBAIC01
MywyMyArNTMsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkIHhlbl9kbWFfbWFwX3BhZ2Uoc3RydWN0
IGRldmljZSAqaHdkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAogCSAgICAgZG1hX2FkZHJfdCBkZXZf
YWRkciwgdW5zaWduZWQgbG9uZyBvZmZzZXQsIHNpemVfdCBzaXplLAogCSAgICAgZW51bSBkbWFf
ZGF0YV9kaXJlY3Rpb24gZGlyLCB1bnNpZ25lZCBsb25nIGF0dHJzKQogewotCXVuc2lnbmVkIGxv
bmcgcGFnZV9wZm4gPSBwYWdlX3RvX3hlbl9wZm4ocGFnZSk7Ci0JdW5zaWduZWQgbG9uZyBkZXZf
cGZuID0gWEVOX1BGTl9ET1dOKGRldl9hZGRyKTsKLQl1bnNpZ25lZCBsb25nIGNvbXBvdW5kX3Bh
Z2VzID0KLQkJKDE8PGNvbXBvdW5kX29yZGVyKHBhZ2UpKSAqIFhFTl9QRk5fUEVSX1BBR0U7Ci0J
Ym9vbCBsb2NhbCA9IChwYWdlX3BmbiA8PSBkZXZfcGZuKSAmJgotCQkoZGV2X3BmbiAtIHBhZ2Vf
cGZuIDwgY29tcG91bmRfcGFnZXMpOworCXVuc2lnbmVkIGxvbmcgcGZuID0gUEZOX0RPV04oZGV2
X2FkZHIpOwogCiAJLyoKLQkgKiBEb20wIGlzIG1hcHBlZCAxOjEsIHdoaWxlIHRoZSBMaW51eCBw
YWdlIGNhbiBzcGFuIGFjcm9zcwotCSAqIG11bHRpcGxlIFhlbiBwYWdlcywgaXQncyBub3QgcG9z
c2libGUgZm9yIGl0IHRvIGNvbnRhaW4gYQotCSAqIG1peCBvZiBsb2NhbCBhbmQgZm9yZWlnbiBY
ZW4gcGFnZXMuIFNvIGlmIHRoZSBmaXJzdCB4ZW5fcGZuCi0JICogPT0gbWZuIHRoZSBwYWdlIGlz
IGxvY2FsIG90aGVyd2lzZSBpdCdzIGEgZm9yZWlnbiBwYWdlCi0JICogZ3JhbnQtbWFwcGVkIGlu
IGRvbTAuIElmIHRoZSBwYWdlIGlzIGxvY2FsIHdlIGNhbiBzYWZlbHkKLQkgKiBjYWxsIHRoZSBu
YXRpdmUgZG1hX29wcyBmdW5jdGlvbiwgb3RoZXJ3aXNlIHdlIGNhbGwgdGhlIHhlbgotCSAqIHNw
ZWNpZmljIGZ1bmN0aW9uLgorCSAqIERvbTAgaXMgbWFwcGVkIDE6MSwgYW5kIHdoaWxlIHRoZSBM
aW51eCBwYWdlIGNhbiBzcGFuIGFjcm9zcyBtdWx0aXBsZQorCSAqIFhlbiBwYWdlcywgaXQgaXMg
bm90IHBvc3NpYmxlIGZvciBpdCB0byBjb250YWluIGEgbWl4IG9mIGxvY2FsIGFuZAorCSAqIGZv
cmVpZ24gWGVuIHBhZ2VzLiAgQ2FsbGluZyBwZm5fdmFsaWQgb24gYSBmb3JlaWduIG1mbiB3aWxs
IGFsd2F5cworCSAqIHJldHVybiBmYWxzZSwgc28gaWYgcGZuX3ZhbGlkIHJldHVybnMgdHJ1ZSB0
aGUgcGFnZXMgaXMgbG9jYWwgYW5kIHdlCisJICogY2FuIHVzZSB0aGUgbmF0aXZlIGRtYS1kaXJl
Y3QgZnVuY3Rpb25zLCBvdGhlcndpc2Ugd2UgY2FsbCB0aGUgWGVuCisJICogc3BlY2lmaWMgdmVy
c2lvbi4KIAkgKi8KLQlpZiAobG9jYWwpCisJaWYgKHBmbl92YWxpZChwZm4pKQogCQlkbWFfZGly
ZWN0X21hcF9wYWdlKGh3ZGV2LCBwYWdlLCBvZmZzZXQsIHNpemUsIGRpciwgYXR0cnMpOwogCWVs
c2UKIAkJX194ZW5fZG1hX21hcF9wYWdlKGh3ZGV2LCBwYWdlLCBkZXZfYWRkciwgb2Zmc2V0LCBz
aXplLCBkaXIsIGF0dHJzKTsKQEAgLTc5LDE0ICs3Myw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4
ZW5fZG1hX3VubWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgaGFuZGxl
LAogCQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLCB1bnNpZ25lZCBs
b25nIGF0dHJzKQogewogCXVuc2lnbmVkIGxvbmcgcGZuID0gUEZOX0RPV04oaGFuZGxlKTsKLQkv
KgotCSAqIERvbTAgaXMgbWFwcGVkIDE6MSwgd2hpbGUgdGhlIExpbnV4IHBhZ2UgY2FuIGJlIHNw
YW5uZWQgYWNjcm9zcwotCSAqIG11bHRpcGxlIFhlbiBwYWdlLCBpdCdzIG5vdCBwb3NzaWJsZSB0
byBoYXZlIGEgbWl4IG9mIGxvY2FsIGFuZAotCSAqIGZvcmVpZ24gWGVuIHBhZ2UuIERvbTAgaXMg
bWFwcGVkIDE6MSwgc28gY2FsbGluZyBwZm5fdmFsaWQgb24gYQotCSAqIGZvcmVpZ24gbWZuIHdp
bGwgYWx3YXlzIHJldHVybiBmYWxzZS4gSWYgdGhlIHBhZ2UgaXMgbG9jYWwgd2UgY2FuCi0JICog
c2FmZWx5IGNhbGwgdGhlIG5hdGl2ZSBkbWFfb3BzIGZ1bmN0aW9uLCBvdGhlcndpc2Ugd2UgY2Fs
bCB0aGUgeGVuCi0JICogc3BlY2lmaWMgZnVuY3Rpb24uCi0JICovCisKIAlpZiAocGZuX3ZhbGlk
KHBmbikpCiAJCWRtYV9kaXJlY3RfdW5tYXBfcGFnZShod2RldiwgaGFuZGxlLCBzaXplLCBkaXIs
IGF0dHJzKTsKIAllbHNlCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
