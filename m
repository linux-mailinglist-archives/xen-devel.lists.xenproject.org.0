Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0DA2945BC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9803.25939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YU-00008b-06; Wed, 21 Oct 2020 00:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9803.25939; Wed, 21 Oct 2020 00:00:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YT-00007F-PZ; Wed, 21 Oct 2020 00:00:37 +0000
Received: by outflank-mailman (input) for mailman id 9803;
 Wed, 21 Oct 2020 00:00:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1YR-0007xs-4O
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62713062-16e8-4abe-8186-a32cb459fbc1;
 Wed, 21 Oct 2020 00:00:21 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A53AE22460;
 Wed, 21 Oct 2020 00:00:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1YR-0007xs-4O
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:35 +0000
X-Inumbo-ID: 62713062-16e8-4abe-8186-a32cb459fbc1
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 62713062-16e8-4abe-8186-a32cb459fbc1;
	Wed, 21 Oct 2020 00:00:21 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A53AE22460;
	Wed, 21 Oct 2020 00:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238421;
	bh=bil3zAxsGICVbiRPDFmg+ayhtYh9RfCEVPeAMVzrx8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xgRCeKVDWkdw2RJzOkHoOiYzXysCK/qN0WUW+w6BH/XZUptpE6CEdklalskokdaJ7
	 Z85gjqjeKCBr4A+0W1IJ9aNLMZSebReoZnLVqMoyy2IaU5Iw40+BQBxrdPCr/aqRmn
	 H7KyAi5GIhWCKWMe3BjvlcZDP/4BcHJrZRQ+xHqE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	ian.jackson@eu.citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 13/14] kernel-doc: public/elfnote.h
Date: Tue, 20 Oct 2020 17:00:10 -0700
Message-Id: <20201021000011.15351-13-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/elfnote.h | 109 ++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 28 deletions(-)

diff --git a/xen/include/public/elfnote.h b/xen/include/public/elfnote.h
index 181cbc4ec7..1dd567a6f1 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -27,8 +27,8 @@
 #ifndef __XEN_PUBLIC_ELFNOTE_H__
 #define __XEN_PUBLIC_ELFNOTE_H__
 
-/*
- * `incontents 200 elfnotes ELF notes
+/**
+ * DOC: ELF notes
  *
  * The notes should live in a PT_NOTE segment and have "Xen" in the
  * name field.
@@ -43,26 +43,35 @@
  * as ASCIZ type.
  */
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_INFO
  * NAME=VALUE pair (string).
  */
 #define XEN_ELFNOTE_INFO           0
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_ENTRY
+ *
  * The virtual address of the entry point (numeric).
  *
  * LEGACY: VIRT_ENTRY
  */
 #define XEN_ELFNOTE_ENTRY          1
 
-/* The virtual address of the hypercall transfer page (numeric).
+/**
+ * DOC: XEN_ELFNOTE_HYPERCALL_PAGE
+ *
+ * The virtual address of the hypercall transfer page (numeric).
  *
  * LEGACY: HYPERCALL_PAGE. (n.b. legacy value is a physical page
  * number not a virtual address)
  */
 #define XEN_ELFNOTE_HYPERCALL_PAGE 2
 
-/* The virtual address where the kernel image should be mapped (numeric).
+/**
+ * DOC: XEN_ELFNOTE_VIRT_BASE
+ *
+ * The virtual address where the kernel image should be mapped (numeric).
  *
  * Defaults to 0.
  *
@@ -70,7 +79,9 @@
  */
 #define XEN_ELFNOTE_VIRT_BASE      3
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_PADDR_OFFSET
+ *
  * The offset of the ELF paddr field from the actual required
  * pseudo-physical address (numeric).
  *
@@ -82,35 +93,45 @@
  */
 #define XEN_ELFNOTE_PADDR_OFFSET   4
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_XEN_VERSION
+ *
  * The version of Xen that we work with (string).
  *
  * LEGACY: XEN_VER
  */
 #define XEN_ELFNOTE_XEN_VERSION    5
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_GUEST_OS
+ *
  * The name of the guest operating system (string).
  *
  * LEGACY: GUEST_OS
  */
 #define XEN_ELFNOTE_GUEST_OS       6
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_GUEST_VERSION
+ *
  * The version of the guest operating system (string).
  *
  * LEGACY: GUEST_VER
  */
 #define XEN_ELFNOTE_GUEST_VERSION  7
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_LOADER
+ *
  * The loader type (string).
  *
  * LEGACY: LOADER
  */
 #define XEN_ELFNOTE_LOADER         8
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_PAE_MODE
+ *
  * The kernel supports PAE (x86/32 only, string = "yes", "no" or
  * "bimodal").
  *
@@ -126,7 +147,9 @@
  */
 #define XEN_ELFNOTE_PAE_MODE       9
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_FEATURES
+ *
  * The features supported/required by this kernel (string).
  *
  * The string must consist of a list of feature names (as given in
@@ -138,7 +161,9 @@
  */
 #define XEN_ELFNOTE_FEATURES      10
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_BSD_SYMTAB
+ *
  * The kernel requires the symbol table to be loaded (string = "yes" or "no")
  * LEGACY: BSD_SYMTAB (n.b. The legacy treated the presence or absence
  * of this string as a boolean flag rather than requiring "yes" or
@@ -146,7 +171,9 @@
  */
 #define XEN_ELFNOTE_BSD_SYMTAB    11
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_HV_START_LOW
+ *
  * The lowest address the hypervisor hole can begin at (numeric).
  *
  * This must not be set higher than HYPERVISOR_VIRT_START. Its presence
@@ -155,13 +182,17 @@
  */
 #define XEN_ELFNOTE_HV_START_LOW  12
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_L1_MFN_VALID
+ *
  * List of maddr_t-sized mask/value pairs describing how to recognize
  * (non-present) L1 page table entries carrying valid MFNs (numeric).
  */
 #define XEN_ELFNOTE_L1_MFN_VALID  13
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_SUSPEND_CANCEL
+ *
  * Whether or not the guest supports cooperative suspend cancellation.
  * This is a numeric value.
  *
@@ -169,7 +200,9 @@
  */
 #define XEN_ELFNOTE_SUSPEND_CANCEL 14
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_INIT_P2M
+ *
  * The (non-default) location the initial phys-to-machine map should be
  * placed at by the hypervisor (Dom0) or the tools (DomU).
  * The kernel must be prepared for this mapping to be established using
@@ -182,13 +215,17 @@
  */
 #define XEN_ELFNOTE_INIT_P2M      15
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_MOD_START_PFN
+ *
  * Whether or not the guest can deal with being passed an initrd not
  * mapped through its initial page tables.
  */
 #define XEN_ELFNOTE_MOD_START_PFN 16
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_SUPPORTED_FEATURES
+ *
  * The features supported by this kernel (numeric).
  *
  * Other than XEN_ELFNOTE_FEATURES on pre-4.2 Xen, this note allows a
@@ -201,7 +238,9 @@
  */
 #define XEN_ELFNOTE_SUPPORTED_FEATURES 17
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_PHYS32_ENTRY
+ *
  * Physical entry point into the kernel.
  *
  * 32bit entry point into the kernel. When requested to launch the
@@ -211,12 +250,16 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_MAX
+ *
  * The number of the highest elfnote defined.
  */
 #define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_ENTRY
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_CRASH_INFO
+ *
  * System information exported through crash notes.
  *
  * The kexec / kdump code will create one XEN_ELFNOTE_CRASH_INFO
@@ -225,7 +268,9 @@
  */
 #define XEN_ELFNOTE_CRASH_INFO 0x1000001
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_CRASH_REGS
+ *
  * System registers exported through crash notes.
  *
  * The kexec / kdump code will create one XEN_ELFNOTE_CRASH_REGS
@@ -236,7 +281,9 @@
 #define XEN_ELFNOTE_CRASH_REGS 0x1000002
 
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_DUMPCORE_NONE
+ *
  * xen dump-core none note.
  * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_NONE
  * in its dump file to indicate that the file is xen dump-core
@@ -245,7 +292,9 @@
  */
 #define XEN_ELFNOTE_DUMPCORE_NONE               0x2000000
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_DUMPCORE_HEADER
+ *
  * xen dump-core header note.
  * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_HEADER
  * in its dump file.
@@ -253,7 +302,9 @@
  */
 #define XEN_ELFNOTE_DUMPCORE_HEADER             0x2000001
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_DUMPCORE_XEN_VERSION
+ *
  * xen dump-core xen version note.
  * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_XEN_VERSION
  * in its dump file. It contains the xen version obtained via the
@@ -262,7 +313,9 @@
  */
 #define XEN_ELFNOTE_DUMPCORE_XEN_VERSION        0x2000002
 
-/*
+/**
+ * DOC: XEN_ELFNOTE_DUMPCORE_FORMAT_VERSION
+ *
  * xen dump-core format version note.
  * xm dump-core code will create one XEN_ELFNOTE_DUMPCORE_FORMAT_VERSION
  * in its dump file. It contains a format version identifier.
-- 
2.17.1


