Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A89A2A44
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820889.1234592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tyd-0005vD-Gx; Thu, 17 Oct 2024 17:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820889.1234592; Thu, 17 Oct 2024 17:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tyd-0005tC-DQ; Thu, 17 Oct 2024 17:07:55 +0000
Received: by outflank-mailman (input) for mailman id 820889;
 Thu, 17 Oct 2024 17:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tv4-0006TN-7w
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:04:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d412f094-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:04:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184619793164.3023967873388;
 Thu, 17 Oct 2024 10:03:39 -0700 (PDT)
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
X-Inumbo-ID: d412f094-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cQk1zZ7TwRBci2G9oF6og8rdWMqi3KtNbdnlRxViRtcKnaW9xnnpQ/QW2lVfu8AwXmcFWi74fDK7H0oMV48tBLgP7v8IBm34qYjbivmNZEe6PCTqpNHR63Y5MvMRKyItrPtP2iKenrS+X9wU19nWur/IVZ0u4bP+IB8qenIU2Bo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184622; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3fsfruenGzMW022TyDqthGbN65HLKdpAAZMOHPTj6cg=; 
	b=Zay2ybEtCrHNIWi/jHt36aQFMMY3HOPjUeNSYbYWMGpZ0bne9jjuinavfDPcoPaxFsVSnfBhSGJh9Ocicflwz2MXMF5NNth755MzJxJNYKDK3rNgCXe0XWycjc9ZbBuxviryB9RJdVbJQWyycCccELdOqBe5kRcWYfqTw1gvWQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184622;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3fsfruenGzMW022TyDqthGbN65HLKdpAAZMOHPTj6cg=;
	b=p1dnh5wu2HChCm67ww/Dz9smgUzf0jbdB+ZDPt61AWymLWVp7LS1BZa1mdg74Sc1
	b0LPdA8UMQRKksuGZ29LmKYpTl0kZ7Gc2TMObaLpDcpqTrIiBpkStXNzaIY/YQmAXNX
	kyHQ5nMZJhwIoPYk4G6Vf8EACMWJlkxDXUeajnhE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 04/44] x86/boot: move mmap info to boot info
Date: Thu, 17 Oct 2024 13:02:44 -0400
Message-Id: <20241017170325.3842-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition the memory map info to be held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- reorder of struct boot_module fields
- changed to memmap_length check for memmap detection
---
 xen/arch/x86/include/asm/bootinfo.h |  5 +++++
 xen/arch/x86/setup.c                | 12 +++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index efbbd30cc514..f75a7e72a700 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,6 +8,8 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
+#include <xen/types.h>
+
 /*
  * Xen internal representation of information provided by the
  * bootloader/environment, or derived from the information.
@@ -16,6 +18,9 @@ struct boot_info {
     const char *loader;
     const char *cmdline;
 
+    paddr_t memmap_addr;
+    size_t memmap_length;
+
     unsigned int nr_modules;
 };
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 037cdd17386c..f7ea482920ef 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -296,6 +296,12 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     else
         bi->cmdline = "";
 
+    if ( mbi->flags & MBI_MEMMAP )
+    {
+        bi->memmap_addr = mbi->mmap_addr;
+        bi->memmap_length = mbi->mmap_length;
+    }
+
     return bi;
 }
 
@@ -1185,13 +1191,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         memmap_type = "Xen-e820";
     }
-    else if ( mbi->flags & MBI_MEMMAP )
+    else if ( bi->memmap_length )
     {
         memmap_type = "Multiboot-e820";
-        while ( bytes < mbi->mmap_length &&
+        while ( bytes < bi->memmap_length &&
                 e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )
         {
-            memory_map_t *map = __va(mbi->mmap_addr + bytes);
+            memory_map_t *map = __va(bi->memmap_addr + bytes);
 
             /*
              * This is a gross workaround for a BIOS bug. Some bootloaders do
-- 
2.30.2


