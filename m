Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B09A2A9D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820975.1234725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9L-000777-H5; Thu, 17 Oct 2024 17:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820975.1234725; Thu, 17 Oct 2024 17:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9L-00073x-Dv; Thu, 17 Oct 2024 17:18:59 +0000
Received: by outflank-mailman (input) for mailman id 820975;
 Thu, 17 Oct 2024 17:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TyO-00014B-9e
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:07:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f0770c6-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:07:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184650633546.6576643682486;
 Thu, 17 Oct 2024 10:04:10 -0700 (PDT)
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
X-Inumbo-ID: 4f0770c6-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dfCM84MZcmAEPtFX2MhQRtWyFJmLgrRmDcsXJW7/voj/A8DRPp9Jr7bH5fJI1n2JFiKvk7SABUVFF5nPpQ/ud7Gus5mQvzU5Eplt2TI8FAhcEphOHWb8wGTAx0Vtw8JpWXLrugCxcPjgatw5yv+f0dJUWS4VSCHiWv8EA8i3uzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184653; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5pWxQAdhYkQ5A/U/o5fJjyYZh8d6vSIlQX+nrYdkAwQ=; 
	b=BCGY6vLiLdLQldxTLDRyFmUUkcwXutAgzSsstAlv7rguLd4UAv/99whuY8LtUxiUcZFCOh65vKYNnKkYFXp0KgW+0+w5SPw868pec30nmedDuRxi39awWVK7yYxrVU5gZ8p9Izz5kESnH94Y+hoRTF1vaQdKtCPXGwub6HtyYTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184653;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=5pWxQAdhYkQ5A/U/o5fJjyYZh8d6vSIlQX+nrYdkAwQ=;
	b=JgKwDM9SC3x8mlCYgwlqEfMC5cbLdkCtwVyGT20FtHidBVMkHTc1Fowme5/FIsIk
	6lTWhRRaeMMM9SpgkuLVdSBxfVrokP+x6+2O6g19HHrHjWqEtUQIfRfEk/0L6KP9bAi
	Hye9m7NzKfzdndWb/N3UqjjgzqhVKeNblTsAZQN8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 28/44] x86/boot: add cmdline to struct boot_module
Date: Thu, 17 Oct 2024 13:03:08 -0400
Message-Id: <20241017170325.3842-29-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a char pointer field, cmdline, to struct boot_module to hold the address
pointed to by the string field of struct mod. This removes the need to use the
early_mod field to get to the dom0 kernel command line.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- changed boot_module element cmdline to paddr_t
---
 xen/arch/x86/include/asm/bootinfo.h | 2 ++
 xen/arch/x86/setup.c                | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 8dcda42b3400..24c2f37c7b11 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -46,6 +46,8 @@ struct boot_module {
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
 #define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
 
+    paddr_t cmdline;
+
     paddr_t start;
     size_t size;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2574d2f1fdb4..e6f1208d5807 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -312,6 +312,8 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     {
         bi->mods[i].mod = &mods[i];
 
+        bi->mods[i].cmdline = (paddr_t)mods[i].string;
+
         bi->mods[i].start = (paddr_t)mods[i].mod_start;
         bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
     }
@@ -999,10 +1001,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->mod->string || bi->kextra )
+    if ( image->cmdline || bi->kextra )
     {
-        if ( image->mod->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
+        if ( image->cmdline )
+            safe_strcpy(cmdline,
+                        cmdline_cook(__va(image->cmdline),
                         bi->loader));
 
         if ( bi->kextra )
-- 
2.30.2


