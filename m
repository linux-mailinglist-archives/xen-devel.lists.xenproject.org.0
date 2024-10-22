Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824739AA24E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 14:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824153.1238231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ECR-00039G-3x; Tue, 22 Oct 2024 12:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824153.1238231; Tue, 22 Oct 2024 12:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ECR-00036d-1P; Tue, 22 Oct 2024 12:41:23 +0000
Received: by outflank-mailman (input) for mailman id 824153;
 Tue, 22 Oct 2024 12:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ECP-00036X-9Y
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 12:41:21 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efc51183-9072-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 14:41:19 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso823498966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 05:41:19 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9159a32esm334147266b.214.2024.10.22.05.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 05:41:17 -0700 (PDT)
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
X-Inumbo-ID: efc51183-9072-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729600878; x=1730205678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCY/tvSeKu0JrSPKb1ZpoawrJHGWY+r+mQ7PZh73VRI=;
        b=fmxt+UIhtzNs/CGmH0t/V0YxWihx+Aq/xLUKm0kQLDx+uZZD5fK53WPuD3unf/OY/q
         FFmxrLbG7rEg/j+kKTADbWXPp4hmYRtrz7LrlpyA4Qy+h4NaVHpCW6B0IdkeSHRqLBrR
         J9HogfIWsXBgVANFxFKZiAYWKNzBV72LsOGxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729600878; x=1730205678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCY/tvSeKu0JrSPKb1ZpoawrJHGWY+r+mQ7PZh73VRI=;
        b=r6cChlZd7mt0kkz7HFmaBF3PbRpJvRVwnKlpPQxThGs3YEoRmGtogJ3EJzf+2le5SZ
         yL3iQexJ2SWidUqqMQVFGh69tJYxGjV8Z4PZ0kszKiUwxjvxO/T0JzaCug2jLPdoVBLl
         KIjtSwRKUtKlhV4rkplY60IYhHTalz+pvpcdH5pjxGuXYoxxJlYvtQfkps59h5O/3LJ/
         rIkQvVNsODqe4ZqmysnqZZ6FXBCB9Ps19XPpwsHY3aOCi4ajGlplN//V29yGQnjrus04
         1q0AiNhVB1kvNGdHk/8/QO9tmUN1r7QJjUMkzv3UOfwPK+mc/mSG59ZopfxtRJI/kaHI
         OyBw==
X-Gm-Message-State: AOJu0Yzbyz9QILO9Odz870Hgi/h+o17UUD683jM5Jcsp9x7QrBgC9Z+Z
	6XxeWlQB8yPt+4V4KHh2p8eAu5vFAjzJJHJLFP75wTIYllswJQitJjCWmVhgTvj9BkA/fuls7qm
	y
X-Google-Smtp-Source: AGHT+IE6XkZ0MZ72BN3ZdYOLHRe+hvRyaILz9bLgWMzcnXOZSqVqOt8GjI+ZVvDGcHxPDTYlXn8Srw==
X-Received: by 2002:a17:906:c113:b0:a9a:1092:b10d with SMTP id a640c23a62f3a-a9a69b7af5dmr1473603566b.33.1729600877953;
        Tue, 22 Oct 2024 05:41:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] x86/boot: Fix PVH boot during boot_info transition period
Date: Tue, 22 Oct 2024 13:41:14 +0100
Message-Id: <20241022124114.84498-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

multiboot_fill_boot_info() taking the physical address of the multiboot_info
structure leads to a subtle use-after-free on the PVH path, with rather less
subtle fallout.

The pointers used by __start_xen(), mbi and mod, are either:

 - MB:  Directmap pointers into the trampoline, or
 - PVH: Xen pointers into .initdata, or
 - EFI: Directmap pointers into Xen.

Critically, these either remain valid across move_xen() (MB, PVH), or rely on
move_xen() being inhibited (EFI).

The conversion to multiboot_fill_boot_info(), taking only mbi_p, makes the PVH
path use directmap pointers into Xen, as well as move_xen() which invalidates
said pointers.

Switch multiboot_fill_boot_info() to consume the same virtual addresses that
__start_xen() currently uses.  This keeps all the pointers valid for the
duration of __start_xen(), for all boot protocols.

It can be safely untangled once multiboot_fill_boot_info() takes a full copy
the multiboot info data, and __start_xen() has been moved over to using the
new boot_info consistently.

Right now, bi->{loader,cmdline,mods} are problematic.  Nothing uses
bi->mods[], and nothing uses bi->cmdline after move_xen().

bi->loader is used after move_xen(), although only for cmdline_cook() of
dom0's cmdline, where it happens to be benign because PVH boot skips the
inspection of the bootloader name.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

This is more proof that Xen only boots by accident.  It certainly isn't by any
kind of design.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1506947472
including the pending work to add a PVShim test

This is the least-invasive fix given the rest of the Hyperlaunch series.

A different option would to introduce EFI and PVH forms of
multiboot_fill_boot_info(), but that would involve juggling even more moving
parts during the transition period.
---
 xen/arch/x86/setup.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index db670258d650..e43b56d4e80f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -283,11 +283,10 @@ struct boot_info __initdata xen_boot_info = {
     .cmdline = "",
 };
 
-static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
+static struct boot_info *__init multiboot_fill_boot_info(
+    multiboot_info_t *mbi, module_t *mods)
 {
     struct boot_info *bi = &xen_boot_info;
-    const multiboot_info_t *mbi = __va(mbi_p);
-    module_t *mods = __va(mbi->mods_addr);
     unsigned int i;
 
     if ( mbi->flags & MBI_MODULES )
@@ -1065,15 +1064,31 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         ASSERT(mbi_p == 0);
         pvh_init(&mbi, &mod);
-        mbi_p = __pa(mbi);
+        /*
+         * mbi and mod are regular pointers to .initdata.  These remain valid
+         * across move_xen().
+         */
     }
     else
     {
         mbi = __va(mbi_p);
         mod = __va(mbi->mods_addr);
+
+        /*
+         * For MB1/2, mbi and mod are directmap pointers into the trampoline.
+         * These remain valid across move_xen().
+         *
+         * For EFI, these are directmap pointers into the Xen image.  They do
+         * not remain valid across move_xen().  EFI boot only functions
+         * because a non-zero xen_phys_start inhibits move_xen().
+         *
+         * Don't be fooled by efi_arch_post_exit_boot() passing "D" (&mbi).
+         * This is a EFI physical-mode (i.e. identity map) pointer.
+         */
+        ASSERT(mbi_p < MB(1) || xen_phys_start);
     }
 
-    bi = multiboot_fill_boot_info(mbi_p);
+    bi = multiboot_fill_boot_info(mbi, mod);
 
     /* Parse the command-line options. */
     if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )

base-commit: 49a068471d77820af5dac5ad062cde7129e3faae
prerequisite-patch-id: 4ada23fb7ca505d30d9c41e23583d5db5ed95bec
prerequisite-patch-id: 2427c5681fce868938a85f8d70de7adb31f731a7
prerequisite-patch-id: 99b7107cd0d8a7675ebd30cf788e550fda4e9cfb
prerequisite-patch-id: 795f6e9425cc6a953166b530ae68df466a7a3c2b
-- 
2.39.5


