Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330EF79378B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596375.930275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMD-0000h3-OW; Wed, 06 Sep 2023 08:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596375.930275; Wed, 06 Sep 2023 08:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMD-0000Vy-Hv; Wed, 06 Sep 2023 08:57:53 +0000
Received: by outflank-mailman (input) for mailman id 596375;
 Wed, 06 Sep 2023 08:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kCQ=EW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qdoMC-0008TQ-Bd
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:57:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74a2f0b9-4c93-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:57:49 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-6-207-235.retail.telecomitalia.it [87.6.207.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 357964EE073E;
 Wed,  6 Sep 2023 10:57:49 +0200 (CEST)
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
X-Inumbo-ID: 74a2f0b9-4c93-11ee-8783-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/4] xen/vpci: address a violation of MISRA C:2012 Rule 8.3
Date: Wed,  6 Sep 2023 10:57:41 +0200
Message-Id: <f5de24818596d88da1c27075c674a823670ee44c.1693990010.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693990010.git.federico.serafini@bugseng.com>
References: <cover.1693990010.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations and definitions consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/hap.h | 2 +-
 xen/include/xen/vpci.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 9d12327b12..05e124ad57 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -30,7 +30,7 @@ void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
                            unsigned long begin_pfn,
                            unsigned int nr_frames,
-                           XEN_GUEST_HANDLE(void) dirty_bitmap);
+                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c74..d743d96a10 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -26,7 +26,7 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
                __used_section(".data.vpci." p) = x
 
 /* Add vPCI handlers to device. */
-int __must_check vpci_add_handlers(struct pci_dev *dev);
+int __must_check vpci_add_handlers(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
-- 
2.34.1


