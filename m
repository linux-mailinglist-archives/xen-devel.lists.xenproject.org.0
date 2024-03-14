Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD487C511
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693510.1081673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMt-0008QQ-EX; Thu, 14 Mar 2024 22:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693510.1081673; Thu, 14 Mar 2024 22:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMt-0008JI-98; Thu, 14 Mar 2024 22:16:07 +0000
Received: by outflank-mailman (input) for mailman id 693510;
 Thu, 14 Mar 2024 22:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMr-0008HV-Pk
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a72db8-e250-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 23:16:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7F2158286790;
 Thu, 14 Mar 2024 17:16:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lUNMd4vATcAF; Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7D6408286C9A;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3BlC2zDAPcW5; Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 2772A8286CAF;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
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
X-Inumbo-ID: 70a72db8-e250-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7D6408286C9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454559; bh=LiAKCYohOpMozP7U6Dsl0j+g+b4qIs2c8DEzGA/uNbQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=BXJv/7q3k8aoRXt8CcNdxAo60Mdn4rgHGOGC/TZnxhnwptCitLxly2ReHBqfRbxzM
	 A0oZP7nHS47sPMomAD4+TPUVeEhIBokOCw7yihj9AykjBkZ7w/8RwSnyoDhU5VnCZG
	 KJ4rV4UQWNbfQSPuGAe7ceFijdvP/BEpvL7TwvJ8=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 4/9] xen/ppc: Update setup.h with required definitions for bootfdt
Date: Thu, 14 Mar 2024 17:15:42 -0500
Message-Id: <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add the definitions used by ARM's bootfdt.c, which will be moved into
xen/common in a later patch, to PPC's setup.h.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/setup.h | 112 +++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b6..1b2d29c5b6 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -3,4 +3,116 @@
 
 #define max_init_domid (0)
 
+#include <public/version.h>
+#include <asm/p2m.h>
+#include <xen/device_tree.h>
+
+#define MIN_FDT_ALIGN 8
+#define MAX_FDT_SIZE SZ_2M
+
+#define NR_MEM_BANKS 256
+
+#define MAX_MODULES 32 /* Current maximum useful modules */
+
+typedef enum {
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_XSM,
+    BOOTMOD_GUEST_DTB,
+    BOOTMOD_UNKNOWN
+}  bootmodule_kind;
+
+enum membank_type {
+    /*
+     * The MEMBANK_DEFAULT type refers to either reserved memory for the
+     * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
+     * the bank is in 'mem').
+     */
+    MEMBANK_DEFAULT,
+    /*
+     * The MEMBANK_STATIC_DOMAIN type is used to indicate whether the memory
+     * bank is bound to a static Xen domain. It is only valid when the bank
+     * is in reserved_mem.
+     */
+    MEMBANK_STATIC_DOMAIN,
+    /*
+     * The MEMBANK_STATIC_HEAP type is used to indicate whether the memory
+     * bank is reserved as static heap. It is only valid when the bank is
+     * in reserved_mem.
+     */
+    MEMBANK_STATIC_HEAP,
+};
+
+/* Indicates the maximum number of characters(\0 included) for shm_id */
+#define MAX_SHM_ID_LENGTH 16
+
+struct membank {
+    paddr_t start;
+    paddr_t size;
+    enum membank_type type;
+};
+
+struct meminfo {
+    unsigned int nr_banks;
+    struct membank bank[NR_MEM_BANKS];
+};
+
+/*
+ * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
+ * The purpose of the domU flag is to avoid getting confused in
+ * kernel_probe, where we try to guess which is the dom0 kernel and
+ * initrd to be compatible with all versions of the multiboot spec.
+ */
+#define BOOTMOD_MAX_CMDLINE 1024
+struct bootmodule {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    paddr_t size;
+};
+
+/* DT_MAX_NAME is the node name max length according the DT spec */
+#define DT_MAX_NAME 41
+struct bootcmdline {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    char dt_name[DT_MAX_NAME];
+    char cmdline[BOOTMOD_MAX_CMDLINE];
+};
+
+struct bootmodules {
+    int nr_mods;
+    struct bootmodule module[MAX_MODULES];
+};
+
+struct bootcmdlines {
+    unsigned int nr_mods;
+    struct bootcmdline cmdline[MAX_MODULES];
+};
+
+struct bootinfo {
+    struct meminfo mem;
+    struct meminfo reserved_mem;
+    struct bootmodules modules;
+    struct bootcmdlines cmdlines;
+    bool static_heap;
+};
+
+extern struct bootinfo bootinfo;
+
+/*
+ * bootinfo.c
+ */
+bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
+struct bootmodule *add_boot_module(bootmodule_kind kind,
+                                   paddr_t start, paddr_t size, bool domU);
+void add_boot_cmdline(const char *name, const char *cmdline,
+                      bootmodule_kind kind, paddr_t start, bool domU);
+const char *boot_module_kind_as_string(bootmodule_kind kind);
+struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
+void populate_boot_allocator(void);
+
 #endif /* __ASM_PPC_SETUP_H__ */
-- 
2.30.2


