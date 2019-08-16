Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384890263
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqk-0007Ad-F5; Fri, 16 Aug 2019 13:00:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqj-00079z-BO
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:57 +0000
X-Inumbo-ID: e2cb92a2-c025-11e9-b90c-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2cb92a2-c025-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o81E6N21kZpYRvlw8IF+a9xn425bqQPWRFVr7mRzKo0=; b=A715qd05e/Gmx9uDJm2TaiW1RP
 1b5IR38JurFTo400njBTZgNznuEBdsKebuLXbFn0p7E1tDhoGfKFwJeMQgCiSZ1cjDx82nJHf4Qtu
 Lkjuh+pVf9gfB31ulpS34adxXouSFgpvdKso0bJpVqI2m84DW3djEg22pk9dk1/SiCDzrTuq+tv0u
 1Rpp3dN2oFs1liGxJyERP4WuM1Q4zZDXkY3lJWg3GYeq0XUjCQ/x3Ut4JclIJaoe2StzC36moRO+R
 9MfINkcPMI0pTRLfgTB3g81MVhh1qtcWkkeVphSZh6bQneZFJs/qJYjMjpBF3IZpzTFYK7Y+A5jSr
 yTwZcjkA==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqg-0006it-CQ; Fri, 16 Aug 2019 13:00:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:13 +0200
Message-Id: <20190816130013.31154-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 11/11] arm64: use asm-generic/dma-mapping.h
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

Tm93IHRoYXQgdGhlIFhlbiBzcGVjaWFsIGNhc2VzIGFyZSBnb25lIG5vdGhpbmcgd29ydGggbWVu
dGlvbmluZyBpcwpsZWZ0IGluIHRoZSBhcm02NCA8YXNtL2RtYS1tYXBwaW5nLmg+IGZpbGUsIHNv
IHN3aXRjaCB0byB1c2UgdGhlCmFzbS1nZW5lcmljIHZlcnNpb24gaW5zdGVhZC4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20vS2J1aWxkICAgICAgICB8ICAxICsKIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vZG1h
LW1hcHBpbmcuaCB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtNjQvbW0vZG1h
LW1hcHBpbmcuYyAgICAgICAgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL2RtYS1tYXBwaW5nLmgKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L0tidWlsZCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vS2J1aWxkCmluZGV4IGM1MmUxNTFhZmFi
MC4uOThhNTQwNWM4NTU4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL0tidWls
ZAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL0tidWlsZApAQCAtNCw2ICs0LDcgQEAgZ2Vu
ZXJpYy15ICs9IGRlbGF5LmgKIGdlbmVyaWMteSArPSBkaXY2NC5oCiBnZW5lcmljLXkgKz0gZG1h
LmgKIGdlbmVyaWMteSArPSBkbWEtY29udGlndW91cy5oCitnZW5lcmljLXkgKz0gZG1hLW1hcHBp
bmcuaAogZ2VuZXJpYy15ICs9IGVhcmx5X2lvcmVtYXAuaAogZ2VuZXJpYy15ICs9IGVtZXJnZW5j
eS1yZXN0YXJ0LmgKIGdlbmVyaWMteSArPSBod19pcnEuaApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEt
bWFwcGluZy5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2NzI0MzI1NWE4NTguLjAw
MDAwMDAwMDAwMAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmgKKysr
IC9kZXYvbnVsbApAQCAtMSwyMiArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5ICovCi0vKgotICogQ29weXJpZ2h0IChDKSAyMDEyIEFSTSBMdGQuCi0gKi8K
LSNpZm5kZWYgX19BU01fRE1BX01BUFBJTkdfSAotI2RlZmluZSBfX0FTTV9ETUFfTUFQUElOR19I
Ci0KLSNpZmRlZiBfX0tFUk5FTF9fCi0KLSNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgotI2luY2x1
ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KLQotI2luY2x1ZGUgPHhlbi94ZW4uaD4KLSNpbmNsdWRlIDxh
c20veGVuL2h5cGVydmlzb3IuaD4KLQotc3RhdGljIGlubGluZSBjb25zdCBzdHJ1Y3QgZG1hX21h
cF9vcHMgKmdldF9hcmNoX2RtYV9vcHMoc3RydWN0IGJ1c190eXBlICpidXMpCi17Ci0JcmV0dXJu
IE5VTEw7Ci19Ci0KLSNlbmRpZgkvKiBfX0tFUk5FTF9fICovCi0jZW5kaWYJLyogX19BU01fRE1B
X01BUFBJTkdfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5jIGIv
YXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCmluZGV4IDRiMjQ0YTAzNzM0OS4uNjU3OGFiY2Zi
YmM3IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMKKysrIGIvYXJjaC9h
cm02NC9tbS9kbWEtbWFwcGluZy5jCkBAIC04LDYgKzgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Nh
Y2hlLmg+CiAjaW5jbHVkZSA8bGludXgvZG1hLW5vbmNvaGVyZW50Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvZG1hLWlvbW11Lmg+CisjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1ZGUgPHhlbi9zd2lv
dGxiLXhlbi5oPgogCiAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
