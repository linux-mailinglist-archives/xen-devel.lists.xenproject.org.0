Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E79CDD02
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837075.1253024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtug-0001ms-O8; Fri, 15 Nov 2024 10:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837075.1253024; Fri, 15 Nov 2024 10:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtug-0001hz-KJ; Fri, 15 Nov 2024 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 837075;
 Fri, 15 Nov 2024 10:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBtuf-0000jy-6x
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:50:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7a876618-a33f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 11:50:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F34E1A2D;
 Fri, 15 Nov 2024 02:51:20 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E8143F6A8;
 Fri, 15 Nov 2024 02:50:49 -0800 (PST)
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
X-Inumbo-ID: 7a876618-a33f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjdhODc2NjE4LWEzM2YtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY3ODUxLjE4MTYzNiwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 4/5] xen/arm: Use vmap_contig instead of __vmap where it's possible
Date: Fri, 15 Nov 2024 10:50:35 +0000
Message-Id: <20241115105036.218418-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115105036.218418-1-luca.fancellu@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the arm code uses __vmap function in few parts to map
physically contiguous pages, vmap_contig was introduced recently
and does the same because it's a wrapper for __vmap, so use the
latter instead of the direct __vmap function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/alternative.c | 3 +--
 xen/arch/arm/cpuerrata.c   | 5 ++---
 xen/arch/arm/kernel.c      | 2 +-
 xen/arch/arm/livepatch.c   | 3 +--
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index d99b5070937d..fec7dbd2cde9 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -209,8 +209,7 @@ void __init apply_alternatives_all(void)
      * The text and inittext section are read-only. So re-map Xen to
      * be able to patch the code.
      */
-    xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
-                    VMAP_DEFAULT);
+    xenmap = vmap_contig(xen_mfn, 1U << xen_order);
     /* Re-mapping Xen is not expected to fail during boot. */
     BUG_ON(!xenmap);
 
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index eef9c0ea0e21..17cf134f1b0d 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -61,9 +61,8 @@ static bool copy_hyp_vect_bpi(unsigned int slot, const char *hyp_vec_start,
      * Vectors are part of the text that are mapped read-only. So re-map
      * the vector table to be able to update vectors.
      */
-    dst_remapped = __vmap(&dst_mfn,
-                          1UL << get_order_from_bytes(VECTOR_TABLE_SIZE),
-                          1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+    dst_remapped = vmap_contig(dst_mfn,
+                               1UL << get_order_from_bytes(VECTOR_TABLE_SIZE));
     if ( !dst_remapped )
         return false;
 
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 669d143cee1b..293d7efaed9c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -211,7 +211,7 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
         return -ENOMEM;
     }
     mfn = page_to_mfn(pages);
-    output = __vmap(&mfn, 1 << kernel_order_out, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+    output = vmap_contig(mfn, 1 << kernel_order_out);
 
     rc = perform_gunzip(output, input, size);
     clean_dcache_va_range(output, output_size);
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 037746d9528d..3805b2974663 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -39,8 +39,7 @@ int arch_livepatch_quiesce(void)
      * The text section is read-only. So re-map Xen to be able to patch
      * the code.
      */
-    vmap_of_xen_text = __vmap(&text_mfn, 1U << text_order, 1, 1, PAGE_HYPERVISOR,
-                              VMAP_DEFAULT);
+    vmap_of_xen_text = vmap_contig(text_mfn, 1U << text_order);
 
     if ( !vmap_of_xen_text )
     {
-- 
2.34.1


