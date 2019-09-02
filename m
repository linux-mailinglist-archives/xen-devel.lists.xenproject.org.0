Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C6A573F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:07:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4m0Q-0003eo-Jf; Mon, 02 Sep 2019 13:04:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4m0O-0003eB-SR
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:04:24 +0000
X-Inumbo-ID: 2425bcb4-cd82-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2425bcb4-cd82-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zpw5MllFX9fhxx6EO9p2LOeJ5F0J0z3R/HLMi2TPdSQ=; b=EFwPojdcTFtbmMxJO5jtupsmx1
 0tkTmctlO9fhUz5pZDZcKWWaI/hsFfRBeODr7tpq2Gvpi3l2cF8wkkTTOE7SpqXyvwM+/3ZdPSJhk
 V7+1WpI9EgCTq837af7201iLXeuE7wvQNZJ2B66q4aSjrGgsTDB5O29MuMoavMru0ooGjSP/SpGI+
 nnfV7Xv5NVo4xIR0g5R3u9Df9GfGws/LVk4JdSzEi2+ilgFKy0ghvDyMhWndfjsjiJKalerzMcKaD
 8xCOwxM7l0dEzaweHZA5RtKiGT0A/B01FL2NCMwfPiWBdRSTvv1AgDp03eEDbZtQlmitPXIy/pQs7
 UQ2B6nXA==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4m01-0001Ua-Mj; Mon, 02 Sep 2019 13:04:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Mon,  2 Sep 2019 15:03:32 +0200
Message-Id: <20190902130339.23163-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 06/13] xen: remove the exports for xen_{create,
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
ZT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KLS0tCiBhcmNoL2FybS94ZW4vbW0uYyAgICAgfCAyIC0tCiBhcmNoL3g4Ni94ZW4vbW11X3B2
LmMgfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwppbmRleCAxMWQ1YWQyNmZjZmUu
LjlkNzNmYTRhNTk5MSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKKysrIGIvYXJjaC9h
cm0veGVuL21tLmMKQEAgLTE1NCwxMyArMTU0LDExIEBAIGludCB4ZW5fY3JlYXRlX2NvbnRpZ3Vv
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
