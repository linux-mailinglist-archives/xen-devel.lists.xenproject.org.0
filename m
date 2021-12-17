Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4BB4794DF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248853.429279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIz5-00028a-SX; Fri, 17 Dec 2021 19:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248853.429279; Fri, 17 Dec 2021 19:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIz5-00026C-P1; Fri, 17 Dec 2021 19:33:39 +0000
Received: by outflank-mailman (input) for mailman id 248853;
 Fri, 17 Dec 2021 19:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIz4-0008Bq-Fr
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:33:38 +0000
Received: from sender3-of-o52.zoho.com (sender3-of-o52.zoho.com
 [136.143.184.52]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39de5f15-5f70-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 20:33:37 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769532601760.2898655813524;
 Fri, 17 Dec 2021 11:32:12 -0800 (PST)
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
X-Inumbo-ID: 39de5f15-5f70-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; t=1639769534; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WRGpN1segHzywaEb9+PBaysX05z/rI3teEUy1Kv24Ijdp2khAt0UzmaJiy+mD70gE2HqZs2I/sqmCFfKG+iQ0CSgOqHdYpjDVWQNlNzwYRXwpxA4qQ4ALLdls31u3BLPd/SS1eithyjL/G5nTpOGGeMkDoMZ1qM678nY8KTDdDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769534; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=em6dzW9XaL2Yw7Hp9YltudsddXj7DesXGxfaC/g+vO8=; 
	b=IzrMpgK7REYjo70CQH9CLdKSaYFKtU9j2yk97O8eKiBr72j3Nu+oFleaHiKLYJtmky8yHYyPMISHgqEVDr3ddNxLKFNsNGmqnCoVwdWXdNQ0jw9uaC4lrBobLrW5HUSfQG//vI5isga6JMyfTH33szAxN7yQ/5ZYLO223AKNJyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769534;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=em6dzW9XaL2Yw7Hp9YltudsddXj7DesXGxfaC/g+vO8=;
	b=VDHAS+pXWoOfkL4eBwAyLMMY4vFpQWDhabubQrg1pKDe3EYe6aABzeAhlF1bqHer
	CJDrV+KdjGlVq8y7mhuhB+tQf/X8LIB4e5M35X0IiWQ9m2PnWKWpuaPz7AGHnlrJcva
	xxgOwyGA3DhkYxwEO5z3d0HpMXti25xvauWgzE1I=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 06/10] hyperlaunch: add structures to hold parsed dtb
Date: Fri, 17 Dec 2021 18:34:32 -0500
Message-Id: <20211217233437.13791-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hyperlaunch builds from dom0less' `struct bootmodule` as the representation of
a boot module provided by a bootloader. From there it expands to cover the
representations proposed in the hyperlaunch design documentation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/include/xen/setup.h | 81 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/xen/include/xen/setup.h b/xen/include/xen/setup.h
index 6fbe87860e..69ea042716 100644
--- a/xen/include/xen/setup.h
+++ b/xen/include/xen/setup.h
@@ -5,6 +5,87 @@
 
 #include <asm/setup.h>
 
+/* Reusing Dom0less definitions */
+typedef enum {
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_MICROCODE,
+    BOOTMOD_XSM,
+    BOOTMOD_GUEST_DTB,
+    BOOTMOD_GUEST_CONF,
+    BOOTMOD_UNKNOWN
+}  bootmodule_kind;
+
+struct bootmodule {
+    bootmodule_kind kind;
+    bool domU;
+    paddr_t start;
+    paddr_t size;
+};
+
+/* End reuse */
+
+struct memrange {
+    paddr_t start;
+    paddr_t size;
+};
+
+/* Currently only two config modules supported, microcode and xsm policy */
+#define HL_MAX_CONFIG_MODULES 2
+struct bootconfig {
+    uint16_t nr_mods;
+    struct bootmodule mods[HL_MAX_CONFIG_MODULES];
+};
+
+struct bootdomain {
+#define HL_PERMISSION_NONE          (0)
+#define HL_PERMISSION_CONTROL       (1 << 0)
+#define HL_PERMISSION_HARDWARE      (1 << 1)
+    uint32_t permissions;
+
+#define HL_FUNCTION_NONE            (0)
+#define HL_FUNCTION_BOOT            (1 << 0)
+#define HL_FUNCTION_CRASH           (1 << 1)
+#define HL_FUNCTION_CONSOLE         (1 << 2)
+#define HL_FUNCTION_XENSTORE        (1 << 30)
+#define HL_FUNCTION_LEGACY_DOM0     (1 << 31)
+    uint32_t functions;
+
+#define HL_MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
+#define HL_MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
+#define HL_MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
+    uint32_t mode;
+
+    domid_t domid;
+    uint8_t uuid[16];
+
+    uint32_t ncpus;
+    bool maxmem_set;
+    struct memrange memrange[2]; /* 0: min; 1: max */
+
+#define HL_MAX_SECID_LEN 64
+    unsigned char secid[HL_MAX_SECID_LEN];
+
+#define HL_MAX_DOMAIN_MODULES 3
+    uint16_t nr_mods;
+    struct bootmodule modules[HL_MAX_DOMAIN_MODULES];
+#define HL_MAX_CMDLINE_LEN 1024
+    unsigned char cmdline[HL_MAX_CMDLINE_LEN];
+};
+
+struct hyperlaunch_config {
+    const void *fdt;
+#ifdef CONFIG_MULTIBOOT
+    module_t *mods;
+#endif
+    struct bootconfig config;
+#define HL_MAX_BOOT_DOMAINS 64
+    uint16_t nr_doms;
+    struct bootdomain domains[HL_MAX_BOOT_DOMAINS];
+};
+
 #ifdef CONFIG_HYPERLAUNCH
 extern bool hyperlaunch_enabled;
 #else
-- 
2.20.1


