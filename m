Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE8AA1F0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q8z-0002Rh-W4; Thu, 05 Sep 2019 11:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2sq=XA=bombadil.srs.infradead.org=batv+6d116066f5ba208d77c0+5856+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i5q8z-0002RE-0O
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:41:41 +0000
X-Inumbo-ID: 12f086de-cfd2-11e9-978d-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12f086de-cfd2-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NmR+a6Uj1v91V4iU31zXRZrXbA98s0lz9xVim531aU8=; b=hzZJnh4svokLvarfNgvrhm8m1S
 WTXuW7q5KyN2lrjLmjWBEY9ABREivG0K065Agk49VKYTTP+FyoW6woNAUq0QnYak+JJw3qi8LhcY/
 sp1rlzPnkjJ45RfFncTFf4vYND87XigrvGEspmrfheZCmxIKZUL2p2ZPW9j5IqifRDgBQ0IcjJ68p
 ZzEviqStmAYe9RKezZ3rHPP2Ko2kL53FUH0hYABafGrqBV8OoHzueepSS2Wb58WPYWrhgKKsgVSbI
 VcGwGnfNjnSVMvGhZZNVwGfhQ8qzxMLowb8hvIbVBQB4xWL3rKpzmRWIxsdrqALzA2RgJmdGEbbKe
 EKvyOIwA==;
Received: from [2001:4bb8:18c:1755:a4b2:9562:6bf1:4bb9] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5q8Y-0005Ds-Pr; Thu, 05 Sep 2019 11:41:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Thu,  5 Sep 2019 13:34:08 +0200
Message-Id: <20190905113408.3104-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905113408.3104-1-hch@lst.de>
References: <20190905113408.3104-1-hch@lst.de>
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm93IHRoYXQgdGhlIFhlbiBzcGVjaWFsIGNhc2VzIGFyZSBnb25lIG5vdGhpbmcgd29ydGggbWVu
dGlvbmluZyBpcwpsZWZ0IGluIHRoZSBhcm02NCA8YXNtL2RtYS1tYXBwaW5nLmg+IGZpbGUsIHNv
IHN3aXRjaCB0byB1c2UgdGhlCmFzbS1nZW5lcmljIHZlcnNpb24gaW5zdGVhZC4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpBY2tlZC1ieTogV2lsbCBEZWFj
b24gPHdpbGxAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL0tidWlsZCAg
ICAgICAgfCAgMSArCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmggfCAyMiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMgICAgICAg
ICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25z
KC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGlu
Zy5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9LYnVpbGQgYi9hcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL0tidWlsZAppbmRleCBjNTJlMTUxYWZhYjAuLjk4YTU0MDVjODU1OCAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9LYnVpbGQKKysrIGIvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9LYnVpbGQKQEAgLTQsNiArNCw3IEBAIGdlbmVyaWMteSArPSBkZWxheS5o
CiBnZW5lcmljLXkgKz0gZGl2NjQuaAogZ2VuZXJpYy15ICs9IGRtYS5oCiBnZW5lcmljLXkgKz0g
ZG1hLWNvbnRpZ3VvdXMuaAorZ2VuZXJpYy15ICs9IGRtYS1tYXBwaW5nLmgKIGdlbmVyaWMteSAr
PSBlYXJseV9pb3JlbWFwLmgKIGdlbmVyaWMteSArPSBlbWVyZ2VuY3ktcmVzdGFydC5oCiBnZW5l
cmljLXkgKz0gaHdfaXJxLmgKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZG1h
LW1hcHBpbmcuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZG1hLW1hcHBpbmcuaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNjcyNDMyNTVhODU4Li4wMDAwMDAwMDAwMDAKLS0tIGEv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oCisrKyAvZGV2L251bGwKQEAgLTEs
MjIgKzAsMCBAQAotLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwot
LyoKLSAqIENvcHlyaWdodCAoQykgMjAxMiBBUk0gTHRkLgotICovCi0jaWZuZGVmIF9fQVNNX0RN
QV9NQVBQSU5HX0gKLSNkZWZpbmUgX19BU01fRE1BX01BUFBJTkdfSAotCi0jaWZkZWYgX19LRVJO
RUxfXwotCi0jaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KLSNpbmNsdWRlIDxsaW51eC92bWFsbG9j
Lmg+Ci0KLSNpbmNsdWRlIDx4ZW4veGVuLmg+Ci0jaW5jbHVkZSA8YXNtL3hlbi9oeXBlcnZpc29y
Lmg+Ci0KLXN0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzICpnZXRfYXJjaF9k
bWFfb3BzKHN0cnVjdCBidXNfdHlwZSAqYnVzKQotewotCXJldHVybiBOVUxMOwotfQotCi0jZW5k
aWYJLyogX19LRVJORUxfXyAqLwotI2VuZGlmCS8qIF9fQVNNX0RNQV9NQVBQSU5HX0ggKi8KZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcuYyBiL2FyY2gvYXJtNjQvbW0vZG1h
LW1hcHBpbmcuYwppbmRleCA0YjI0NGEwMzczNDkuLjY1NzhhYmNmYmJjNyAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCisrKyBiL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBp
bmcuYwpAQCAtOCw2ICs4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9jYWNoZS5oPgogI2luY2x1ZGUg
PGxpbnV4L2RtYS1ub25jb2hlcmVudC5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1pb21tdS5oPgor
I2luY2x1ZGUgPHhlbi94ZW4uaD4KICNpbmNsdWRlIDx4ZW4vc3dpb3RsYi14ZW4uaD4KIAogI2lu
Y2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
