Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E0B11BDD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 12:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057635.1425455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufFPY-0005uJ-7G; Fri, 25 Jul 2025 10:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057635.1425455; Fri, 25 Jul 2025 10:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufFPY-0005s9-4c; Fri, 25 Jul 2025 10:12:20 +0000
Received: by outflank-mailman (input) for mailman id 1057635;
 Fri, 25 Jul 2025 10:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7lb=2G=bounce.vates.tech=bounce-md_30504962.6883587f.v1-6929b614269b4fa6bc51c0ec40e8bdcf@srs-se1.protection.inumbo.net>)
 id 1ufFPW-0005s3-Tc
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 10:12:18 +0000
Received: from mail145-22.atl61.mandrillapp.com
 (mail145-22.atl61.mandrillapp.com [198.2.145.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d74b5da4-693f-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 12:12:17 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-22.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bpNvz4YwyzFCWhB4
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 10:12:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6929b614269b4fa6bc51c0ec40e8bdcf; Fri, 25 Jul 2025 10:12:15 +0000
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
X-Inumbo-ID: d74b5da4-693f-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753438335; x=1753708335;
	bh=Z1ZCnsGTR1Ea2435ekGtOF0CiJZ1KkP59g7PY4QteBc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Xnu375MuOO8E3psAfGaNhpirpxFGG2LXuYlFj4SBReAXdW+kBDLAKxzeIVpPhmlwX
	 0Aj2SrFSbPiigLsQvvwOHX/uZg1LB3arUdYD6lhuNVuTYM88a/XiAR/i+F3AMiU0VK
	 OLfJk8/0CvmWjCPeqIS66Xyz83/6L3PQ9ESzJjE+/dx9Urrc/0h+z/Rm9JL0KKbFSp
	 TJgN4qeXfW66eJXcVig2+0XsOfe+IKSi8XZbWF/3giSPbdRyGq8m/+8kpvVadDddwA
	 yvB6WNUcpgdFcQ7+wYDTLvLz+5yOmy+g38srfL6IrrOOlpCAu26QGSbV+D9xi/mi11
	 2op9Zv8kih62A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753438335; x=1753698835; i=teddy.astie@vates.tech;
	bh=Z1ZCnsGTR1Ea2435ekGtOF0CiJZ1KkP59g7PY4QteBc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=hxOTVRUmrzGUPYb4RdDkaZhDzDJTGhnZCHwpCerI/8tYGBDJeW/pY16dt21yl91aJ
	 PO5fFNlqQsxeAztSuv/A/k7+Np5EqWeWr1sLcyNXkzD0NdTh/6pidDJrlfME0sApkr
	 /TkB5UIhO4ta9DZXKFbPYGkDmBWxyDrmx31nPqyWpPS/qIj5A/PLFtKLJHYSzTWNkC
	 rTn2M88uFfmw6tn/IOakdKHiNMgTyeq8cFWvv8eotBkuqofrRrcyBzajafK0asTizc
	 E1VIf5wPFNoy6ZPO0qBSeCHBPDa4LtTCILRNW3lThgLOMZMLNUPZ+9zx0OSfF4L0gJ
	 VlhAm3fy7lK8Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20xen:=20Rename=20xenmem=5Freservation=5Fincrease=20to=20xenmem=5Fpopulate=5Fphysmap?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753438334492
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <d3bdb968d720db655314fd7d7c7c4bc181395cee.1753438001.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6929b614269b4fa6bc51c0ec40e8bdcf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250725:md
Date: Fri, 25 Jul 2025 10:12:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

xenmem_reservation_increase currently calls XENMEM_populate_physmap.
Rename the function to avoid confusion with XENMEM_increase_reservation.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 drivers/xen/balloon.c         | 2 +-
 drivers/xen/grant-table.c     | 2 +-
 drivers/xen/mem-reservation.c | 4 ++--
 include/xen/mem-reservation.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 2de37dcd7556..ac52dfd03be4 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -407,7 +407,7 @@ static enum bp_state increase_reservation(unsigned long nr_pages)
 		page = balloon_next_page(page);
 	}
 
-	rc = xenmem_reservation_increase(nr_pages, frame_list);
+	rc = xenmem_populate_physmap(nr_pages, frame_list);
 	if (rc <= 0)
 		return BP_EAGAIN;
 
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 04a6b470b15d..e1a5041b4b8a 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1125,7 +1125,7 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 	for (i = 0; i < args->nr_pages; i++)
 		args->frames[i] = page_to_xen_pfn(args->pages[i]);
 
-	ret = xenmem_reservation_increase(args->nr_pages, args->frames);
+	ret = xenmem_populate_physmap(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to increase reservation for DMA buffer\n");
 		ret = -EFAULT;
diff --git a/drivers/xen/mem-reservation.c b/drivers/xen/mem-reservation.c
index 24648836e0d4..332eab71e977 100644
--- a/drivers/xen/mem-reservation.c
+++ b/drivers/xen/mem-reservation.c
@@ -83,7 +83,7 @@ EXPORT_SYMBOL_GPL(__xenmem_reservation_va_mapping_reset);
 #endif /* CONFIG_XEN_HAVE_PVMMU */
 
 /* @frames is an array of PFNs */
-int xenmem_reservation_increase(int count, xen_pfn_t *frames)
+int xenmem_populate_physmap(int count, xen_pfn_t *frames)
 {
 	struct xen_memory_reservation reservation = {
 		.address_bits = 0,
@@ -96,7 +96,7 @@ int xenmem_reservation_increase(int count, xen_pfn_t *frames)
 	reservation.nr_extents = count;
 	return HYPERVISOR_memory_op(XENMEM_populate_physmap, &reservation);
 }
-EXPORT_SYMBOL_GPL(xenmem_reservation_increase);
+EXPORT_SYMBOL_GPL(xenmem_populate_physmap);
 
 /* @frames is an array of GFNs */
 int xenmem_reservation_decrease(int count, xen_pfn_t *frames)
diff --git a/include/xen/mem-reservation.h b/include/xen/mem-reservation.h
index a2ab516fcd2c..e2b78a517cd1 100644
--- a/include/xen/mem-reservation.h
+++ b/include/xen/mem-reservation.h
@@ -53,7 +53,7 @@ static inline void xenmem_reservation_va_mapping_reset(unsigned long count,
 #endif
 }
 
-int xenmem_reservation_increase(int count, xen_pfn_t *frames);
+int xenmem_populate_physmap(int count, xen_pfn_t *frames);
 
 int xenmem_reservation_decrease(int count, xen_pfn_t *frames);
 
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


