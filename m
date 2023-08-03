Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78776E5A3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576202.902100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVXv-0008TE-F4; Thu, 03 Aug 2023 10:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576202.902100; Thu, 03 Aug 2023 10:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVXv-0008Qs-C4; Thu, 03 Aug 2023 10:27:07 +0000
Received: by outflank-mailman (input) for mailman id 576202;
 Thu, 03 Aug 2023 10:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVXt-0008Qm-Rq
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a719cfb-31e8-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:27:04 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 4440D4EE0737;
 Thu,  3 Aug 2023 12:27:04 +0200 (CEST)
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
X-Inumbo-ID: 4a719cfb-31e8-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 07/13] xen/vpci: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:22 +0200
Message-Id: <4b97aa8203935ba6e202926add0baf8901af5ee9.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/drivers/vpci/header.c |  2 +-
 xen/drivers/vpci/msi.c    |  2 +-
 xen/drivers/vpci/msix.c   | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 60f7049e34..767c1ba718 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -447,7 +447,7 @@ static void cf_check bar_write(
      * Update the cached address, so that when memory decoding is enabled
      * Xen can map the BAR into the guest p2m.
      */
-    bar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
+    bar->addr &= ~(0xffffffffULL << (hi ? 32 : 0));
     bar->addr |= (uint64_t)val << (hi ? 32 : 0);
 
     /* Make sure Xen writes back the same value for the BAR RO bits. */
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 8f2b59e61a..9090d97c9a 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -103,7 +103,7 @@ static void cf_check address_write(
     struct vpci_msi *msi = data;
 
     /* Clear low part. */
-    msi->address &= ~0xffffffffull;
+    msi->address &= ~0xffffffffULL;
     msi->address |= val;
 
     update_msi(pdev, msi);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 25bde77586..bc77d4825d 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -273,7 +273,7 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
     struct vpci *vpci = msix->pdev->vpci;
     unsigned int slot;
 
-    *data = ~0ul;
+    *data = ~0UL;
 
     if ( !adjacent_handle(msix, addr + len - 1) )
         return X86EMUL_OKAY;
@@ -305,13 +305,13 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
          */
         for ( i = 0; i < len; i++ )
         {
-            unsigned long partial = ~0ul;
+            unsigned long partial = ~0UL;
             int rc = adjacent_read(d, msix, addr + i, 1, &partial);
 
             if ( rc != X86EMUL_OKAY )
                 return rc;
 
-            *data &= ~(0xfful << (i * 8));
+            *data &= ~(0xffUL << (i * 8));
             *data |= (partial & 0xff) << (i * 8);
         }
 
@@ -363,7 +363,7 @@ static int cf_check msix_read(
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
-    *data = ~0ul;
+    *data = ~0UL;
 
     if ( !msix )
         return X86EMUL_RETRY;
@@ -525,7 +525,7 @@ static int cf_check msix_write(
             entry->addr = data;
             break;
         }
-        entry->addr &= ~0xffffffffull;
+        entry->addr &= ~0xffffffffULL;
         entry->addr |= data;
         break;
 
-- 
2.34.1


