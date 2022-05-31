Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FC0538908
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338924.563785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEm-0003qT-IW; Mon, 30 May 2022 22:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338924.563785; Mon, 30 May 2022 22:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvoEm-0003n3-Ds; Mon, 30 May 2022 22:51:48 +0000
Received: by outflank-mailman (input) for mailman id 338924;
 Mon, 30 May 2022 22:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo5k-000799-VG
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:42:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c77b6256-e069-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 00:42:27 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950520786963.2599323551407;
 Mon, 30 May 2022 15:42:00 -0700 (PDT)
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
X-Inumbo-ID: c77b6256-e069-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653950523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e9pf82uT1+AgRUwvRHljQ3G2Zsg2NnZDD3cxpbCheLfPmFO2qJnrbI/9Sl8sP0QKOzkkMpwoVCkAK9NDwTHQ6zMH/hJ/jRPEnN2Z1Lk1WGJSqXbNib0TY1qVU8OPdxtSizwo7hDQtF5YrpZ2e6KElOHiPqpaQZrOW5RDb/40Ew8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950523; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=iAGucPdV3glHdtZABJs2CPxR/bL8xV7VFYB5AxMoSfc=; 
	b=J32e/CeBeSMVOOAhRY8ND7fWlBjx9I1BwOdOT4zT+inqN+M11Zs0HmF/naaLdCtufv2WV+KgAvYM4lSinFA0JWHG9KSi1Oow6ACwmdue5phWMqkHz6MKHEwdkLtcK10fJ2YK/X3OA1MspuIQlfsa2d62Ho9M4pC9l0ezUkn2Ykw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950523;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=iAGucPdV3glHdtZABJs2CPxR/bL8xV7VFYB5AxMoSfc=;
	b=MKli1T29u3OeXeN0juTd4Hzsdz8wvXUTJUsgdL3YPmH0xIVY95lg5y1Q+9SLbiJK
	MuP/WcU8/xTvVPGKLAii86cvpn39DBYTtSKiVSJ5z3X8kmunxwoftWfTnu9IP0Y08wQ
	DT2uvis3q6cYMtPqU5yIXBGhKTgtfvCl4gW8Vc7U=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	sstabellini@kernel.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 2/4] headers: introduce generalized boot info
Date: Mon, 30 May 2022 22:41:24 -0400
Message-Id: <20220531024127.23669-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531024127.23669-1-dpsmith@apertussolutions.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The x86 and Arm architectures represent in memory the general boot information
and boot modules differently despite having commonality. The x86
representations are bound to the multiboot v1 structures while the Arm
representations are a slightly generalized meta-data container for the boot
material. The multiboot structure does not lend itself well to being expanded
to accommodate additional metadata, both general and boot module specific. The
Arm structures are not bound to an external specification and thus are able to
be expanded for solutions such as dom0less.

This commit introduces a set of structures patterned off the Arm structures to
represent the boot information in a manner that captures common data. The
structures provide an arch field to allow arch specific expansions to the
structures. The intended goal of these new common structures is to enable
commonality between the different architectures.  Specifically to enable
dom0less and hyperlaunch to have a common representation of boot-time
constructed domains.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 45 ++++++++++++++++++++++++
 xen/include/xen/bootinfo.h          | 54 +++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h
 create mode 100644 xen/include/xen/bootinfo.h

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
new file mode 100644
index 0000000000..13e49f2b87
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -0,0 +1,45 @@
+#ifndef __ARCH_X86_BOOTINFO_H__
+#define __ARCH_X86_BOOTINFO_H__
+
+/* unused for x86 */
+struct arch_bootstring { };
+
+struct __packed arch_bootmodule {
+#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
+    uint32_t flags;
+    uint32_t headroom;
+};
+
+struct __packed arch_boot_info {
+    uint32_t flags;
+#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
+#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
+#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
+#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
+#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
+#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
+#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
+#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
+#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
+#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
+#define BOOTINFO_FLAG_X86_APM        	1U << 10
+
+    char *boot_loader_name;
+
+    uint32_t mem_lower;
+    uint32_t mem_upper;
+
+    uint32_t mmap_length;
+    paddr_t mmap_addr;
+};
+
+struct __packed mb_memmap {
+    uint32_t size;
+    uint32_t base_addr_low;
+    uint32_t base_addr_high;
+    uint32_t length_low;
+    uint32_t length_high;
+    uint32_t type;
+};
+
+#endif
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
new file mode 100644
index 0000000000..42b53a3ca6
--- /dev/null
+++ b/xen/include/xen/bootinfo.h
@@ -0,0 +1,54 @@
+#ifndef __XEN_BOOTINFO_H__
+#define __XEN_BOOTINFO_H__
+
+#include <xen/mm.h>
+#include <xen/types.h>
+
+#include <asm/bootinfo.h>
+
+typedef enum {
+    BOOTMOD_UNKNOWN,
+    BOOTMOD_XEN,
+    BOOTMOD_FDT,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_XSM,
+    BOOTMOD_UCODE,
+    BOOTMOD_GUEST_DTB,
+}  bootmodule_kind;
+
+typedef enum {
+    BOOTSTR_EMPTY,
+    BOOTSTR_STRING,
+    BOOTSTR_CMDLINE,
+} bootstring_kind;
+
+#define BOOTMOD_MAX_STRING 1024
+struct __packed boot_string {
+    bootstring_kind kind;
+    struct arch_bootstring *arch;
+
+    char bytes[BOOTMOD_MAX_STRING];
+    size_t len;
+};
+
+struct __packed boot_module {
+    bootmodule_kind kind;
+    paddr_t start;
+    mfn_t mfn;
+    size_t size;
+
+    struct arch_bootmodule *arch;
+    struct boot_string string;
+};
+
+struct __packed boot_info {
+    char *cmdline;
+
+    uint32_t nr_mods;
+    struct boot_module *mods;
+
+    struct arch_boot_info *arch;
+};
+
+#endif
-- 
2.20.1


