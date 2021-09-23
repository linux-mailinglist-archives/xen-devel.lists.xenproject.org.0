Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB231415951
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 09:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193447.344576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJOh-0005Dx-W0; Thu, 23 Sep 2021 07:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193447.344576; Thu, 23 Sep 2021 07:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJOh-0005A7-RD; Thu, 23 Sep 2021 07:43:59 +0000
Received: by outflank-mailman (input) for mailman id 193447;
 Thu, 23 Sep 2021 07:43:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=64r8=ON=kernel.org=rppt@srs-us1.protection.inumbo.net>)
 id 1mTJOg-000583-1r
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 07:43:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0216b996-1c42-11ec-ba1a-12813bfff9fa;
 Thu, 23 Sep 2021 07:43:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9933660EC0;
 Thu, 23 Sep 2021 07:43:51 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0216b996-1c42-11ec-ba1a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632383036;
	bh=iWKfUnKlQ9cPEYiRCmYD11oUFDahtkWK+8zPXcxbHfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1kaX42zyV3QIA+qDp4knzrt9WyS+qws3w1e8o4EW+yTnl/4fM57n5Dphy5IjQHJ1
	 6E+ppDgbmXTDPAKAQlraJB76u0SOF1v5mXkUUakV90s32cAhMAYyDsPNx4Sc1n4wvi
	 W2oWhofnItmWkCPORqhQx9dfBnxoDuP3YwVe/8TymJVaQJp3MdfdmJm4lZw7qje1Mr
	 1e4A83pakvGWhdUmI+pTan/SrNA9KzDSPNoli0MAkH0aR0LyfCR5iZGE12ruwS9Z1D
	 HQ9EitT9EFvxvF9zxe+XZQX3fVc+GHOu2xA+uaYHGpyeNsZPbdbM0oQVVJVjEdP4Km
	 NSNLeM6nYHuFw==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 2/3] xen/x86: free_p2m_page: use memblock_free_ptr() to free a virtual pointer
Date: Thu, 23 Sep 2021 10:43:34 +0300
Message-Id: <20210923074335.12583-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210923074335.12583-1-rppt@kernel.org>
References: <20210923074335.12583-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Rapoport <rppt@linux.ibm.com>

free_p2m_page() wrongly passes a virtual pointer to memblock_free() that
treats it as a physical address.

Call memblock_free_ptr() instead that gets a virtual address to free the
memory.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/xen/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 5e6e236977c7..141bb9dbd2fb 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -197,7 +197,7 @@ static void * __ref alloc_p2m_page(void)
 static void __ref free_p2m_page(void *p)
 {
 	if (unlikely(!slab_is_available())) {
-		memblock_free((unsigned long)p, PAGE_SIZE);
+		memblock_free_ptr(p, PAGE_SIZE);
 		return;
 	}
 
-- 
2.28.0


