Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B0D9CF9E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 14:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Dyw-0006WY-QI; Mon, 26 Aug 2019 12:20:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mawP=WW=bombadil.srs.infradead.org=batv+64c9f4a429f346f2dac5+5846+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i2Dyu-0006Vc-B5
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 12:20:20 +0000
X-Inumbo-ID: d4484b3e-c7fb-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4484b3e-c7fb-11e9-8980-bc764e2007e4;
 Mon, 26 Aug 2019 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LlnOOn5rHCYaI36ipZxq8/heoietui0cNmQwibcWJ+A=; b=kAfgXtgqlZUnlGrheXiktRe/RD
 0DMcU/zPhlcA/zodaPIHB0N11VTZLJSyOirnkIOK0HJeV9yJNhfkdxif6uhGzerWiAL39+wmQvFr3
 Z0YmAGZ3uxevwlK6po9hFrJX0Ltvhfd3hLNwqJEy4kyc2ngAMBrm6pRlPVBL5XClzWA29TRIo8M5m
 VEq6qTjTUdQEnB+QiECocdSqoqqiNAVv8enJvBhiOEfTKDeYy4POqxxcrrFJeL0JAw3J2IcALHa6U
 0C+Z5UriwsbsDt25hGtNMZHFibKRgmQmscdC6AJDUWuB9qdSJKNrdTHcHPdUKJnHx6oZE35kPBMcU
 0qBgO9Gw==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DyZ-0002SO-Kd; Mon, 26 Aug 2019 12:20:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Mon, 26 Aug 2019 14:19:38 +0200
Message-Id: <20190826121944.515-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826121944.515-1-hch@lst.de>
References: <20190826121944.515-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 05/11] xen: remove the exports for xen_{create,
 destroy}_contiguous_region
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

VGhlc2Ugcm91dGluZXMgYXJlIG9ubHkgdXNlZCBieSBzd2lvdGxiLXhlbiwgd2hpY2ggY2Fubm90
IGJlIG1vZHVsYXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBhcmNoL2FybS94ZW4vbW0uYyAgICAgfCAyIC0tCiBhcmNoL3g4Ni94ZW4vbW11X3B2
LmMgfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwppbmRleCA5YjNhNmMwY2E2ODEu
LmI3ZDUzNDE1NTMyYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKKysrIGIvYXJjaC9h
cm0veGVuL21tLmMKQEAgLTE1NSwxMyArMTU1LDExIEBAIGludCB4ZW5fY3JlYXRlX2NvbnRpZ3Vv
dXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAogCSpkbWFf
aGFuZGxlID0gcHN0YXJ0OwogCXJldHVybiAwOwogfQotRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2Ny
ZWF0ZV9jb250aWd1b3VzX3JlZ2lvbik7CiAKIHZvaWQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19y
ZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIpCiB7CiAJcmV0dXJu
OwogfQotRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24pOwog
CiBpbnQgX19pbml0IHhlbl9tbV9pbml0KHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94
ZW4vbW11X3B2LmMgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKaW5kZXggMjZlOGIzMjY5NjZkLi5j
OGRiZWU2MmVjMmEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYworKysgYi9hcmNo
L3g4Ni94ZW4vbW11X3B2LmMKQEAgLTI2MjUsNyArMjYyNSw2IEBAIGludCB4ZW5fY3JlYXRlX2Nv
bnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAog
CSpkbWFfaGFuZGxlID0gdmlydF90b19tYWNoaW5lKHZzdGFydCkubWFkZHI7CiAJcmV0dXJuIHN1
Y2Nlc3MgPyAwIDogLUVOT01FTTsKIH0KLUVYUE9SVF9TWU1CT0xfR1BMKHhlbl9jcmVhdGVfY29u
dGlndW91c19yZWdpb24pOwogCiB2b2lkIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBo
eXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyKQogewpAQCAtMjY2MCw3ICsyNjU5
LDYgQEAgdm9pZCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3Rh
cnQsIHVuc2lnbmVkIGludCBvcmRlcikKIAogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnhlbl9y
ZXNlcnZhdGlvbl9sb2NrLCBmbGFncyk7CiB9Ci1FWFBPUlRfU1lNQk9MX0dQTCh4ZW5fZGVzdHJv
eV9jb250aWd1b3VzX3JlZ2lvbik7CiAKIHN0YXRpYyBub2lubGluZSB2b2lkIHhlbl9mbHVzaF90
bGJfYWxsKHZvaWQpCiB7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
