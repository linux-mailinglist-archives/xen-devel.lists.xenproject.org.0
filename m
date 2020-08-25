Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2227251569
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 11:32:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAVJA-00070a-Vh; Tue, 25 Aug 2020 09:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xb/y=CD=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1kAVJ9-00070Q-Ni
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 09:31:59 +0000
X-Inumbo-ID: 002316ee-8f26-41a9-ab70-30413fece7cf
Received: from mx2.mailbox.org (unknown [80.241.60.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 002316ee-8f26-41a9-ab70-30413fece7cf;
 Tue, 25 Aug 2020 09:31:58 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id C69FFA14E6;
 Tue, 25 Aug 2020 11:31:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id YjnUXXsYmRnC; Tue, 25 Aug 2020 11:31:55 +0200 (CEST)
From: Simon Leiner <simon@leiner.me>
To: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	jgross@suse.com
Cc: julien@xen.org
Subject: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
Date: Tue, 25 Aug 2020 11:31:53 +0200
Message-Id: <20200825093153.35500-2-simon@leiner.me>
In-Reply-To: <20200825093153.35500-1-simon@leiner.me>
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 1.16 / 15.00 / 15.00
X-Rspamd-Queue-Id: 6B9815FE
X-Rspamd-UID: 23347b
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As virt_to_gfn uses virt_to_phys, it will return invalid addresses when
used with vmalloc'd addresses. This patch introduces a warning, when
virt_to_gfn is used in this way.

Signed-off-by: Simon Leiner <simon@leiner.me>
---
 include/xen/arm/page.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index d7f6af50e200..b0d303b633d0 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
 #define bfn_to_local_pfn(bfn)	bfn_to_pfn(bfn)
 
 /* VIRT <-> GUEST conversion */
-#define virt_to_gfn(v)		(pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT))
+#define virt_to_gfn(v)                                                         \
+	({                                                                     \
+		WARN_ON_ONCE(is_vmalloc_addr(v));                              \
+		pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);                 \
+	})
 #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
 
 /* Only used in PV code. But ARM guests are always HVM. */
-- 
2.24.3 (Apple Git-128)


