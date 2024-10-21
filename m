Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55CF9A585E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823030.1237095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjY-0008QF-TX; Mon, 21 Oct 2024 00:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823030.1237095; Mon, 21 Oct 2024 00:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjY-0008Ka-OY; Mon, 21 Oct 2024 00:57:20 +0000
Received: by outflank-mailman (input) for mailman id 823030;
 Mon, 21 Oct 2024 00:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZs-000738-RL
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:20 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 060d6c93-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:47:19 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471591822568.8599150587428;
 Sun, 20 Oct 2024 17:46:31 -0700 (PDT)
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
X-Inumbo-ID: 060d6c93-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D6oyLCDD5DJpBPsrlA/M7BmHu9FXfhAZnT8g4rcfuK85qAjfgfl0Iv/dvtjK9L5aQqG/bNuf9kdoVLKr3Tu8nEBvkZv25i9EpTwCUEy06w5v4NHzZi/kcHdWsECJUCCzfvzuuCqAYMcTC6Rz+A1RK2+mBY49KSd0qw3PIU3oikk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471593; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vt87AgI0m9lK6tCp4TANNpG9kFhWx6vDUngb9zKNYKY=; 
	b=FqSpP7+5QHeyC4Y6qtlVlUjNmculkc7LL+uFS/yubXnpSYHcuNaGUd+L6vvzLDTGvZw+v57KViPnlJdAW/6utgw1SE3Ugod6l5xn7GTFpnUZufHPl/iFYa1Tw5Df7oYR+0GvYj1Fn/5i+eVMA/1cYiKtpiD8vb6/P3NeMIoZsGo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471593;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Vt87AgI0m9lK6tCp4TANNpG9kFhWx6vDUngb9zKNYKY=;
	b=KYpeI6fo1rWP+ZYhGVQP6arHGsxz9sKtVBFWwJUQi29+UH4ISJ9cHtWN76g0FS42
	ViNDWGkaY9Zk4NYxWhadBX4NeRW9KC9TYY3ZE0Lax6OzAGTInRYMAsSPPVeEvrLCvhP
	v7TuncPjDhlwlCzm3Vka9RUumOpd5lJ1eol887ls=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 07/38] x86/boot: add start and size fields to struct boot_module
Date: Sun, 20 Oct 2024 20:45:42 -0400
Message-Id: <20241021004613.18793-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces the start and size fields to struct boot_module and
assigns their value during boot_info construction.

The EFI entry point is a special case, as the EFI file loading boot service may
load a file beyond the 4G barrier. As a result, to make the address fit in the
32bit integer used by the MB1 module_t structure, the frame number is stored in
mod_start and size in mod_end. Until the EFI entry point is enlightened to work
with boot_info and boot_module, multiboot_fill_boot_info will handle the
alternate values in mod_start and mod_end when EFI is detected.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- put the efi conversion for mod_start and mod_end back along with check
- dropped unnecessary cast
- updated the population of start and size fields to take into account efi

Changes since v5:
- switched EFI population of mod_start/mod_end to addresses
---
 xen/arch/x86/include/asm/bootinfo.h |  3 +++
 xen/arch/x86/setup.c                | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e8fba66eedc5..dbd22db3d063 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -46,6 +46,9 @@ struct boot_module {
      *   relocated: indicates module has been relocated in memory.
      */
     bool relocated:1;
+
+    paddr_t start;
+    size_t size;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 17f74384b5c1..2e87aa314389 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -315,10 +315,25 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
      * reserved for Xen.
      */
     for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
+    {
         bi->mods[i].mod = &mods[i];
 
+        if ( !efi_enabled(EFI_LOADER) )
+        {
+            bi->mods[i].start = mods[i].mod_start;
+            bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
+        }
+        else
+        {
+            bi->mods[i].start = pfn_to_paddr(mods[i].mod_start);
+            bi->mods[i].size = mods[i].mod_end;
+        }
+    }
+
     /* Variable 'i' should be one entry past the last module. */
     bi->mods[i].mod = &mods[bi->nr_modules];
+    bi->mods[i].start = mods[i].mod_start;
+    bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
     bi->mods[i].type = BOOTMOD_XEN;
 
     return bi;
-- 
2.30.2


