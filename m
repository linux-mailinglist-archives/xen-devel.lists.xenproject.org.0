Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148879378D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596374.930265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMD-0000NW-57; Wed, 06 Sep 2023 08:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596374.930265; Wed, 06 Sep 2023 08:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMC-0000GG-Nz; Wed, 06 Sep 2023 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 596374;
 Wed, 06 Sep 2023 08:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kCQ=EW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qdoMB-0008TQ-Bb
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:57:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7468798e-4c93-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:57:49 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-6-207-235.retail.telecomitalia.it [87.6.207.235])
 by support.bugseng.com (Postfix) with ESMTPSA id CA65D4EE073D;
 Wed,  6 Sep 2023 10:57:48 +0200 (CEST)
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
X-Inumbo-ID: 7468798e-4c93-11ee-8783-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/4] x86/io_apic: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed,  6 Sep 2023 10:57:40 +0200
Message-Id: <56bfeae4c6a5c7f65a3f329003583aed6de13b19.1693990010.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693990010.git.federico.serafini@bugseng.com>
References: <cover.1693990010.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and make function declarations and
definitions consistent.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/io_apic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 9165da2281..a7e4c9e146 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -199,7 +199,7 @@ extern struct IO_APIC_route_entry __ioapic_read_entry(
     unsigned int apic, unsigned int pin, bool raw);
 void __ioapic_write_entry(
     unsigned int apic, unsigned int pin, bool raw,
-    struct IO_APIC_route_entry);
+    struct IO_APIC_route_entry e);
 
 extern struct IO_APIC_route_entry **alloc_ioapic_entries(void);
 extern void free_ioapic_entries(struct IO_APIC_route_entry **ioapic_entries);
@@ -211,6 +211,6 @@ extern int restore_IO_APIC_setup(struct IO_APIC_route_entry **ioapic_entries,
 unsigned highest_gsi(void);
 
 int ioapic_guest_read( unsigned long physbase, unsigned int reg, u32 *pval);
-int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 pval);
+int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val);
 
 #endif
-- 
2.34.1


