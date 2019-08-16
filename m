Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25989025E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqK-0006rQ-J9; Fri, 16 Aug 2019 13:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqI-0006qr-KS
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:30 +0000
X-Inumbo-ID: d2d62484-c025-11e9-aee9-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2d62484-c025-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7UWrSy9tZvy7g4jhRp+syX7wiGwkvXkNPrPT2LJB6A=; b=eiYUK7Ni6okBQZbHkMxxv5OveK
 lTRwJVeQNsHZGWEuYhgs3yiyj8Hr/gEYEnkJ3z7GUbAfBKWPvag87nQiuslng3V+RlcoGIkJdZzU+
 6TjosTLd8kJUSsYyV8JnfK6fgzXPv7cHYujLAeSGzWDlceyYIm6+3GeNiE/4/J1ye5AUp+Ic3iiXB
 H3GP8ZYc1vPE7bnz84Kg95W63+wzya/1hsufHoqvxS5sluyqkz+AL+Hp1V797Wxj91CLRSovXunpG
 JrDs4pFb7pLpZEahrp3Nn3qmrdjdn5MsdPi3/GAddSe7uTXsnQs6cSmj0wr8i8oqceUppIcaJVODB
 8GaXwY0A==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqE-0006Nn-OA; Fri, 16 Aug 2019 13:00:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:05 +0200
Message-Id: <20190816130013.31154-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 03/11] xen/arm: pass one less argument to
 dma_cache_maint
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

SW5zdGVhZCBvZiB0YWtpbmcgYXBhcnQgdGhlIGRtYSBhZGRyZXNzIGluIGJvdGggY2FsbGVycyBk
byBpdCBpbnNpZGUKZG1hX2NhY2hlX21haW50IGl0c2VsZi4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJtL3hlbi9tbS5jIHwgMTAgKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jCmluZGV4
IDkwNTc0ZDg5ZDBkNC4uZDlkYTI0ZmRhMmY3IDEwMDY0NAotLS0gYS9hcmNoL2FybS94ZW4vbW0u
YworKysgYi9hcmNoL2FybS94ZW4vbW0uYwpAQCAtNDMsMTMgKzQzLDE1IEBAIHN0YXRpYyBib29s
IGh5cGVyY2FsbF9jZmx1c2ggPSBmYWxzZTsKIAogLyogZnVuY3Rpb25zIGNhbGxlZCBieSBTV0lP
VExCICovCiAKLXN0YXRpYyB2b2lkIGRtYV9jYWNoZV9tYWludChkbWFfYWRkcl90IGhhbmRsZSwg
dW5zaWduZWQgbG9uZyBvZmZzZXQsCi0Jc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGlyZWN0
aW9uIGRpciwgZW51bSBkbWFfY2FjaGVfb3Agb3ApCitzdGF0aWMgdm9pZCBkbWFfY2FjaGVfbWFp
bnQoZG1hX2FkZHJfdCBoYW5kbGUsIHNpemVfdCBzaXplLAorCQllbnVtIGRtYV9kYXRhX2RpcmVj
dGlvbiBkaXIsIGVudW0gZG1hX2NhY2hlX29wIG9wKQogewogCXN0cnVjdCBnbnR0YWJfY2FjaGVf
Zmx1c2ggY2ZsdXNoOwogCXVuc2lnbmVkIGxvbmcgeGVuX3BmbjsKKwl1bnNpZ25lZCBsb25nIG9m
ZnNldCA9IGhhbmRsZSAmIH5QQUdFX01BU0s7CiAJc2l6ZV90IGxlZnQgPSBzaXplOwogCisJb2Zm
c2V0ICY9IFBBR0VfTUFTSzsKIAl4ZW5fcGZuID0gKGhhbmRsZSA+PiBYRU5fUEFHRV9TSElGVCkg
KyBvZmZzZXQgLyBYRU5fUEFHRV9TSVpFOwogCW9mZnNldCAlPSBYRU5fUEFHRV9TSVpFOwogCkBA
IC04NiwxMyArODgsMTMgQEAgc3RhdGljIHZvaWQgZG1hX2NhY2hlX21haW50KGRtYV9hZGRyX3Qg
aGFuZGxlLCB1bnNpZ25lZCBsb25nIG9mZnNldCwKIHN0YXRpYyB2b2lkIF9feGVuX2RtYV9wYWdl
X2Rldl90b19jcHUoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgaGFuZGxlLAogCQlz
aXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQogewotCWRtYV9jYWNoZV9t
YWludChoYW5kbGUgJiBQQUdFX01BU0ssIGhhbmRsZSAmIH5QQUdFX01BU0ssIHNpemUsIGRpciwg
RE1BX1VOTUFQKTsKKwlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlLCBzaXplLCBkaXIsIERNQV9VTk1B
UCk7CiB9CiAKIHN0YXRpYyB2b2lkIF9feGVuX2RtYV9wYWdlX2NwdV90b19kZXYoc3RydWN0IGRl
dmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgaGFuZGxlLAogCQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFf
ZGF0YV9kaXJlY3Rpb24gZGlyKQogewotCWRtYV9jYWNoZV9tYWludChoYW5kbGUgJiBQQUdFX01B
U0ssIGhhbmRsZSAmIH5QQUdFX01BU0ssIHNpemUsIGRpciwgRE1BX01BUCk7CisJZG1hX2NhY2hl
X21haW50KGhhbmRsZSwgc2l6ZSwgZGlyLCBETUFfTUFQKTsKIH0KIAogdm9pZCBfX3hlbl9kbWFf
bWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
