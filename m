Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1B80C423
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651526.1017200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcN4-0001iK-7a; Mon, 11 Dec 2023 09:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651526.1017200; Mon, 11 Dec 2023 09:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcN4-0001eB-3s; Mon, 11 Dec 2023 09:14:38 +0000
Received: by outflank-mailman (input) for mailman id 651526;
 Mon, 11 Dec 2023 09:14:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCcN2-0001ce-It
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:14:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b39f2a11-9805-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:14:35 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 5143E4EE0741;
 Mon, 11 Dec 2023 10:14:34 +0100 (CET)
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
X-Inumbo-ID: b39f2a11-9805-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 1/3] xen/x86: add missing instances of asmlinkage attributes
Date: Mon, 11 Dec 2023 10:14:27 +0100
Message-Id: <2282f4b7ff0143f513f9677e0cca2d68c0f2a08c.1702285639.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702285639.git.nicola.vetrini@bugseng.com>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/efi/efi-boot.h | 5 +++--
 xen/arch/x86/smpboot.c      | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 86467da301e5..8ea64e31cdc2 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -808,8 +808,9 @@ static const char *__init get_option(const char *cmd, const char *opt)
     return o;
 }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
-                           const char *cmdline)
+void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                                      EFI_SYSTEM_TABLE *SystemTable,
+                                      const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 4c54ecbc91d7..8aa621533f3d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -310,7 +310,7 @@ static void set_cpu_sibling_map(unsigned int cpu)
     }
 }
 
-void start_secondary(void *unused)
+void asmlinkage start_secondary(void *unused)
 {
     struct cpu_info *info = get_cpu_info();
 
-- 
2.34.1


