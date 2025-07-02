Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19239AF1078
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 11:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030806.1404470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWu5C-0002cv-2G; Wed, 02 Jul 2025 09:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030806.1404470; Wed, 02 Jul 2025 09:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWu5B-0002b8-Ve; Wed, 02 Jul 2025 09:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1030806;
 Wed, 02 Jul 2025 09:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqA0=ZP=bounce.vates.tech=bounce-md_30504962.6865007d.v1-4f318caf156146deab4b37f447424a23@srs-se1.protection.inumbo.net>)
 id 1uWu5B-0002b1-2q
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 09:48:49 +0000
Received: from mail186-10.suw21.mandrillapp.com
 (mail186-10.suw21.mandrillapp.com [198.2.186.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf4844cf-5729-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 11:48:47 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-10.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4bXFTT5lLyz5QkLk0
 for <xen-devel@lists.xenproject.org>; Wed,  2 Jul 2025 09:48:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4f318caf156146deab4b37f447424a23; Wed, 02 Jul 2025 09:48:45 +0000
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
X-Inumbo-ID: bf4844cf-5729-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751449725; x=1751719725;
	bh=FHgL1whZVBmBSD9h9bZZ8bhpnADjwgrqmGTO+bcYsPU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=mD7UEIErgPaC4tBSnzWpkyKnZAVfUm9p6huGgfniCYUjiSOVxZkVJ6LQRGpm6vMhW
	 0SCpcB4Q0GUobBq1U0eYFudeA3jS9A1pu+UB9GesTfBuFaib1IqRj/et05AAAdGxb/
	 TLjniTCqZCLzV3QGcf1IOtTsqcXHmCUD0+Kuq+jFTmYY2Brf6zditB9yCMucHa52AT
	 J5XkJ3JQJg6+kyke7HPYrMKfwpdIu2752dPryN73fNNY6zXwVtW5yD4xqIfbyv0uVm
	 0XGRiD//13Z30eTVt+5yGJHYPN86sqKe7rzOXsV9cLx1cyisZTvZ5n5ZaAn8di3IWv
	 i3RoTfDaPWUsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751449725; x=1751710225; i=teddy.astie@vates.tech;
	bh=FHgL1whZVBmBSD9h9bZZ8bhpnADjwgrqmGTO+bcYsPU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=fRjT5Jm6P9B6emD9OBCCqaItevs+uIlnNJOy+32SmKWioDdgkt2HpoPfr+ID0L2LL
	 z9+cvRCKBqm0Gn2N4+IJ3olugkzX8Ah+GMPLyX+0idP4nnD1+gsZ6NEIw8Xh9uP1Qz
	 RCOJTfT2OnDVE3CIOCTYI6pQqdxPMZ7bb2cOnOxuH0wIt+2NHCWSIiCDVhHXh2RyOA
	 0tD2AFYuOtlO6MSsU+Fl4HlEdMV6Tud7unuC3D0HzTcqJpc0rxTxQnazP55fqt9wJK
	 xIVzhLbXMlpU06CEW7Pw9CWZlCtth9+TLtDjgp9O19w3heIXxmVc0/O0gShQQpILsy
	 F8VlXNua+HFRg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=205.15.y=20v2]=20xen:=20replace=20xen=5Fremap()=20with=20memremap()?=
X-Mailer: git-send-email 2.50.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751449724214
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Sasha Levin" <sashal@kernel.org>, "Jason Andryuk" <jason.andryuk@amd.com>, stable@vger.kernel.org, "kernel test robot" <lkp@intel.com>
Message-Id: <816ab25650e06a5fb51c5a51ec0108aa2238271a.1751449523.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4f318caf156146deab4b37f447424a23?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250702:md
Date: Wed, 02 Jul 2025 09:48:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Juergen Gross <jgross@suse.com>

[ upstream commit 41925b105e345ebc84cedb64f59d20cb14a62613 ]

xen_remap() is used to establish mappings for frames not under direct
control of the kernel: for Xenstore and console ring pages, and for
grant pages of non-PV guests.

Today xen_remap() is defined to use ioremap() on x86 (doing uncached
mappings), and ioremap_cache() on Arm (doing cached mappings).

Uncached mappings for those use cases are bad for performance, so they
should be avoided if possible. As all use cases of xen_remap() don't
require uncached mappings (the mapped area is always physical RAM),
a mapping using the standard WB cache mode is fine.

As sparse is flagging some of the xen_remap() use cases to be not
appropriate for iomem(), as the result is not annotated with the
__iomem modifier, eliminate xen_remap() completely and replace all
use cases with memremap() specifying the MEMREMAP_WB caching mode.

xen_unmap() can be replaced with memunmap().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Link: https://lore.kernel.org/r/20220530082634.6339-1-jgross@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech> [backport to 5.15.y]
---
v2:
- also remove xen_remap/xen_unmap on ARM
---
 arch/x86/include/asm/xen/page.h   | 3 ---
 drivers/xen/grant-table.c         | 6 +++---
 drivers/xen/xenbus/xenbus_probe.c | 3 +--
 include/xen/arm/page.h            | 3 ---
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 1a162e559753..c183b7f9efef 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -355,9 +355,6 @@ unsigned long arbitrary_virt_to_mfn(void *vaddr);
 void make_lowmem_page_readonly(void *vaddr);
 void make_lowmem_page_readwrite(void *vaddr);
 
-#define xen_remap(cookie, size) ioremap((cookie), (size))
-#define xen_unmap(cookie) iounmap((cookie))
-
 static inline bool xen_arch_need_swiotlb(struct device *dev,
 					 phys_addr_t phys,
 					 dma_addr_t dev_addr)
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 0a2d24d6ac6f..a10e0741bec5 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -743,7 +743,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
 	if (xen_auto_xlat_grant_frames.count)
 		return -EINVAL;
 
-	vaddr = xen_remap(addr, XEN_PAGE_SIZE * max_nr_gframes);
+	vaddr = memremap(addr, XEN_PAGE_SIZE * max_nr_gframes, MEMREMAP_WB);
 	if (vaddr == NULL) {
 		pr_warn("Failed to ioremap gnttab share frames (addr=%pa)!\n",
 			&addr);
@@ -751,7 +751,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
 	}
 	pfn = kcalloc(max_nr_gframes, sizeof(pfn[0]), GFP_KERNEL);
 	if (!pfn) {
-		xen_unmap(vaddr);
+		memunmap(vaddr);
 		return -ENOMEM;
 	}
 	for (i = 0; i < max_nr_gframes; i++)
@@ -770,7 +770,7 @@ void gnttab_free_auto_xlat_frames(void)
 	if (!xen_auto_xlat_grant_frames.count)
 		return;
 	kfree(xen_auto_xlat_grant_frames.pfn);
-	xen_unmap(xen_auto_xlat_grant_frames.vaddr);
+	memunmap(xen_auto_xlat_grant_frames.vaddr);
 
 	xen_auto_xlat_grant_frames.pfn = NULL;
 	xen_auto_xlat_grant_frames.count = 0;
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 2068f83556b7..77ca24611293 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -982,8 +982,7 @@ static int __init xenbus_init(void)
 #endif
 		xen_store_gfn = (unsigned long)v;
 		xen_store_interface =
-			xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-				  XEN_PAGE_SIZE);
+			memremap(xen_store_gfn << XEN_PAGE_SHIFT, XEN_PAGE_SIZE, MEMREMAP_WB);
 		break;
 	default:
 		pr_warn("Xenstore state unknown\n");
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index ac1b65470563..f831cfeca000 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -109,9 +109,6 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
 	return __set_phys_to_machine(pfn, mfn);
 }
 
-#define xen_remap(cookie, size) ioremap_cache((cookie), (size))
-#define xen_unmap(cookie) iounmap((cookie))
-
 bool xen_arch_need_swiotlb(struct device *dev,
 			   phys_addr_t phys,
 			   dma_addr_t dev_addr);
-- 
2.50.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


